<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Execution Report</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .testcase-card { margin-bottom: 15px; }
    .step-card { margin-bottom: 10px; }
    .action-pass { color: green; font-weight: bold; }
    .action-fail { color: red; font-weight: bold; }
    .screenshot { max-width: 200px; border: 1px solid #ccc; margin-top: 5px; }
  </style>
</head>
<body class="container mt-4">
  <h2>Execution Report</h2>

  <div class="accordion" id="testCaseAccordion">
    <#list testCases as testCase>
      <div class="accordion-item testcase-card">
        <h2 class="accordion-header" id="heading-${testCase?index}">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-${testCase?index}">
            ${testCase.name}
          </button>
        </h2>
        <div id="collapse-${testCase?index}" class="accordion-collapse collapse" data-bs-parent="#testCaseAccordion">
          <div class="accordion-body">
            <div class="accordion" id="stepsAccordion-${testCase?index}">
              <#list testCase.steps as step>
                <div class="accordion-item step-card">
                  <h2 class="accordion-header" id="heading-step-${step?index}">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-step-${testCase?index}-${step?index}">
                      ${step.name}
                    </button>
                  </h2>
                  <div id="collapse-step-${testCase?index}-${step?index}" class="accordion-collapse collapse" data-bs-parent="#stepsAccordion-${testCase?index}">
                    <div class="accordion-body">
                      <#list step.actions as action>
                        <div>
                          <span class="${action.result == "PASS"?then("action-pass","action-fail")}">
                            ${action.result}
                          </span> - ${action.name}
                          <#if action.screenshot??>
                            <br><img src="${action.screenshot}" class="screenshot"/>
                          </#if>
                        </div>
                        <hr/>
                      </#list>
                    </div>
                  </div>
                </div>
              </#list>
            </div>
          </div>
        </div>
      </div>
    </#list>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
