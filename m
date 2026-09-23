Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838DB44AB76
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153517; cv=none; b=BRzq4d/Qf/Rq7IPVm5zJPgyxbsHyVbNpvBqMGV/dL301MUfE0kz18m9pidEDlruHz6G1uXGxvYsybgFWymFDt/q1yY/8S2VhssaQpRecohdVd2oM2DXnxAPgMHS/Hq5C751/k63RBPZtdjTd9QmtgW/UonchvvLs9QvGI17I4XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153517; c=relaxed/simple;
	bh=7X2SEvaRh8YiK1DyfBEFhbuslblr/85JQxwjqwExppM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bb4DoOdAfMzQ8FeV6fDcQ0Xqd321VNU4osCx74gXM+hpkEBOLjIwScQWexMrB3VfMXLttRKmQOunJIDYwsKyr/UHyyMKIEPhcnrvdFDhCEkVOhCEgj9r4pSTsIdI3qXa8zx3zwiDg+71xugExvLCi6WKs8q4EXxxZiQ4Dyl5dRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SI/ZuPtb; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SI/ZuPtb"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d8239so4668615e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790153513; x=1790758313; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pxOFOlF2eklUdsg41k05kgv0f8qS2KZyFbdjdZR8vR4=;
        b=SI/ZuPtbqra6WTU/CpmSc4WgJuxlHNjysmvIk00biqgflt5oTYoCjB4GfYEFPT0zEh
         7zvOlZ+ZO2K5Xo3sebWEIBjsUE3mbl4vUgjNOREYU4NfylE3G3TOdw7Rx8k1artrEjhK
         05lf8S/sGVqySnNOKkGCMbCc/EQIAK/keBdNYr64eQ7YWEz8WkNCuSVhGJLYuk6guW4c
         cxULF5UL6kNJ8W40JzrCyNbpiym+HBVCh1hZCjTfR/MYH9pTyh4tLzvQFcMytENUFlJx
         /B1xgQHkGdhHjic4dr75z7nURJvKlcLYCIE5UMW0tq9VFjUz3JJ+LdD6c+GKSgxXhg2N
         +EiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153513; x=1790758313;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pxOFOlF2eklUdsg41k05kgv0f8qS2KZyFbdjdZR8vR4=;
        b=f8b6zvEEJq4jnvIwyWJ/LKIFoDiT1m5XZwOyMQTdiJiuRHXY3RQj92b8zKydB9lW+X
         VQPNbHilE9xWr8v96Y8GUbwM0wHVrGmvV8aHCPD9VhZEhjq5d/ML6tQEYeXhKN7aYmK3
         TRG/5e/sYmt5+G2cYsdBMj+YEPJA9PEEBctXb522/a0Zqu6CW73zGPnrawTlnZmCiPMs
         wZ3RVv3wqJjkySb9hrwy4Yvp3+Zm2aRNAjPFDJY1n1872QFdpGB8VX+liaTmh/KhXe58
         7cxAXPtRpT7i8Q3VaaLGfsqtk4p2j8fQGIrUQpuYOw4eopjkNPNtuS7fIQ1/xv9v2rk+
         +TNg==
X-Forwarded-Encrypted: i=1; AKwUvBxbayyDU9h25s0oVc9fvrro0aElOeufC1XmBJstJ6UEBKZsTsIt5m+d6VzXIQRRuWrXDhRFphyp0+xjTmE=@vger.kernel.org
X-Gm-Message-State: AFuF++kblE7O83KdMdo+wnrPL9vh6hoggJYOn/Tr5DiTXC/4DqYPdOOQ
	eTg6Kshy3wd5T1v3li2bRSm1AsjHgEJ5LRgo1a4PJlXlYzE//zdJOSPoD/bEECQnMlE=
X-Gm-Gg: AYBFou1D8AtgBxw1mXFIq/Tl0qBovGlNSiMcRLomjpB/pNQ5Cyb0Z63CmuAQx41SAtu
	jsNrfGj1eKHLRlxDeMylJqMbQbFMq2bE9DrFzH1fDFnnx3RRod9E7UfftYPEzVa3drQJuduhiSh
	88Tj65Pa/F4FHtH7/RPWuXb2F/bL2A/cW7qmTT4mk9CFu9+5Ly7Jeyq4ujF20zNezs4DetQYSxp
	vhnDmC2beoF7m6yvUNy7Ilowya3PEvuwT04brHEF3XvoYlWNsCNhiPxDO6MikvXsfunGUnkbDVm
	+S1qh3mrgj7F+KT+V7vwICgzSqS9yUJRJOxFGP03H7DCOtTy/OnQTvs9I9QUjCRLI4X6+8tJOKM
	ARlIOFvTSX86XbiAfdVrW14JW1fSnCD0GRATQ8A/xB9sFMGoLRf26vcYQuE1qW9bO36JgyPRrqI
	GpO5AG7Z1w7p7aB6Gh7Se50CppfCe6EPJWcE821DMuECvIlzAp00Ydf0p4bdXS0+fvPp6bhQngu
	D8Yn6ik8Tjpx07A32U=
X-Received: by 2002:a05:600c:1c1a:b0:49d:99:1d98 with SMTP id 5b1f17b1804b1-49fdf0f954amr28480735e9.9.1790153513519;
        Wed, 23 Sep 2026 01:51:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde13096csm68372245e9.0.2026.09.23.01.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:51:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 23 Sep 2026 10:51:45 +0200
Subject: [PATCH v3] soc: qcom: geni-se: provide PROG_RAM_DEPTH for I2C HUB
 Serial Engines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-topic-sm8x50-i2c-hub-fw-ram-v3-1-44287b4e814b@linaro.org>
X-B4-Tracking: v=1; b=H4sIACCTs2oC/43NSw6CMBSF4a2Qjr2mD6jFkfswDqAUuUYoaQExh
 L3b4kQnxuFJ/nxnId44NJ4ck4U4M6FH24UhdgnRTdFdDWAVNuGUS5qzAwy2Rw2+VXNGAbmGZiy
 hfoArWshSnVFRGkmFIkHonalx3vTz5b39WN6MHiIZiwb9YN1zu59Y7P57mhgwqNOcK1kpraryd
 MeucHZv3ZXEq4l/Yuo3xgMmqMlDKqWi/Atb1/UFnTR03CYBAAA=
X-Change-ID: 20260917-topic-sm8x50-i2c-hub-fw-ram-54c503be6038
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3925;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7X2SEvaRh8YiK1DyfBEFhbuslblr/85JQxwjqwExppM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqs5MoqJ+8LhhvBz8LIYwneetWevjKy+uNlnDYhRY+
 /a7/796JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarOTKAAKCRB33NvayMhJ0VW0D/
 9EwXzl/2ku08UCocAmBTCf4pX+JKlwe2Czytpasbl2tHC+FYP0wqoHFKSjxNBI0a2OrDgVqT5ZpPT6
 YwT4cb3Wl38lHbfm4B5FpzyxGH3U1XsOZ0SNWiuCPhFP2I//ZjSnABBGVdmrOjzDCjhM4gjX/h6Ctr
 JqSIoiiuCSsb0kEWwM8Wi0WAUijOex28IGb93lwOXePQK66YygjLhARweP64Fv/i4uBxozEloXUp/L
 6k06j/6JjPr11tTF10z/oux4fgX48vb3hjTTPlPfzVzHrMmvgt/zPtKVLuSxA69ES0C0n3jbyjENKE
 uWToYuPcGUkk0UXy/xHboqxrCaDQ3Zf1Mpf3apgW0sLS3HyHKrhmnlSTINdB43xVYCpt+cIDA6/K5r
 vN0l86IfGOeqd24CvbXaI9Stt6tg1CtJ4f7TD9YW9AZc5l9lubxy0Y5y9RbPgQR7uhMHusgRJzZHk/
 PT8PY3uiIDXD2TWlZSKC7BRFNdciNWjhErgc/qkw7iCbhBB8WPDu5iAc/UqYttyvCS0zwi7VN04onT
 WVgeqENbPLMLzGTHh/nbZtDzHJOFNayPj55Bb07ZZ5PWURw1nJJpJPRgKqhW4N7S0XNB9ZC6JazoPM
 NF+nyRgQ60u9hdqMgl5bRgNWLw084ypS8wG1WYqQfYAhmEkuSpJqPZEgzzww==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The I2C Hub serial elements lacks DMA, so the SE_HW_PARAM_2 register which
is in the DMA register space doesn't exist for those instances.

Provide the ram depth in the compatible data to be used instead
of the reading the missing SE_HW_PARAM_2 register.

Fixes: 522bfb4f33c0 ("soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate firmware size")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Fix subject typo s/I2S/I2C/
- Collect review
- Link to v2: https://patch.msgid.link/20260918-topic-sm8x50-i2c-hub-fw-ram-v2-1-30e960966802@linaro.org

Changes in v2:
- Instead of ignoring the depth, use 1020 as the default HUB serial element depth
- Link to v1: https://patch.msgid.link/20260917-topic-sm8x50-i2c-hub-fw-ram-v1-1-f49286d8c8db@linaro.org
---
 drivers/soc/qcom/qcom-geni-se.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 873bfbd6b2b7..893a917be527 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -101,22 +101,26 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(geni_se_regs);
  * @base:		Base address of this instance of QUP wrapper core
  * @clks:		Handle to the primary & optional secondary AHB clocks
  * @num_clks:		Count of clocks
+ * @prog_ram_depth:	Available CFG RAM depth for instance without SE_HW_PARAM_2
  */
 struct geni_wrapper {
 	struct device *dev;
 	void __iomem *base;
 	struct clk_bulk_data clks[MAX_CLKS];
 	unsigned int num_clks;
+	unsigned int prog_ram_depth;
 };
 
 /**
  * struct geni_se_desc - Data structure to represent the QUP Wrapper resources
  * @clks:		Name of the primary & optional secondary AHB clocks
  * @num_clks:		Count of clock names
+ * @prog_ram_depth:	Available CFG RAM depth for instance without SE_HW_PARAM_2
  */
 struct geni_se_desc {
 	unsigned int num_clks;
 	const char * const *clks;
+	unsigned int prog_ram_depth;
 };
 
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
@@ -1241,6 +1245,7 @@ EXPORT_SYMBOL_GPL(geni_se_resources_init);
 static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct firmware *fw,
 					       enum geni_se_protocol_type protocol)
 {
+	struct geni_wrapper *wrapper = se->wrapper;
 	struct device *dev = se->dev;
 	const struct elf32_hdr *ehdr;
 	const struct elf32_phdr *phdrs;
@@ -1306,8 +1311,11 @@ static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct
 			sefw->fw_size_in_items = cpu_to_le16(fw_size);
 		}
 
-		prog_ram_depth = FIELD_GET(PROG_RAM_DEPTH_MSK,
-					   readl_relaxed(se->base + SE_HW_PARAM_2));
+		if (wrapper->prog_ram_depth)
+			prog_ram_depth = wrapper->prog_ram_depth;
+		else
+			prog_ram_depth = FIELD_GET(PROG_RAM_DEPTH_MSK,
+					readl_relaxed(se->base + SE_HW_PARAM_2));
 		if (fw_size >= prog_ram_depth) {
 			dev_err(dev, "Firmware size (%u) exceeds RAM size (%u)\n",
 				fw_size, prog_ram_depth);
@@ -1617,6 +1625,7 @@ static int geni_se_probe(struct platform_device *pdev)
 		return PTR_ERR(wrapper->base);
 
 	desc = device_get_match_data(&pdev->dev);
+	wrapper->prog_ram_depth = desc->prog_ram_depth;
 
 	if (!has_acpi_companion(&pdev->dev) && desc->num_clks) {
 		int i;
@@ -1669,6 +1678,7 @@ static const char * const i2c_master_hub_clks[] = {
 static const struct geni_se_desc i2c_master_hub_desc = {
 	.clks = i2c_master_hub_clks,
 	.num_clks = ARRAY_SIZE(i2c_master_hub_clks),
+	.prog_ram_depth = 1020,
 };
 
 static const struct of_device_id geni_se_dt_match[] = {

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260917-topic-sm8x50-i2c-hub-fw-ram-54c503be6038

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

