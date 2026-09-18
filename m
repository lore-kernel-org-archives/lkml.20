Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B036545198C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716556; cv=none; b=SeSXrbnZgtrZRzTY3oKQSTRtgIgo8k2GCpjDgBms0KK2yJObCJwCXlfqnO03Nx/CqMAslAnkXeNV7zbKnCkNCiERDFlCUQh/e5hVDWEvEEpWSRrndyUb4iNdKECbPpekunumarFA+9sd99TNCv63Sw2VZD41Jbvr5P189NYSs7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716556; c=relaxed/simple;
	bh=CrfB5Rz0RrvGaZsIayezXrztszc5vqvtS3GZl43Wk9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KcvixI/aShpvNcZibJ+GdOYCFWuu7t8iJx1ilF7XnRQ6JTepqbJ+homh0Mx9lzo9eCRzSUl0WhLIqV15gwJwWRnFts2FWc4YIxLhQFGznESOX3hxMAOQwd69TLhfuoXXiz4M8Cv1+po7k+uqTpubdEiF78/QeTwrmtYsFi4mDV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MYxEEq2F; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MYxEEq2F"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso2835195e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789716546; x=1790321346; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vR5Hf5/Fo4mKQwK6kNI3oaShZRKQk0ZPQPkNgIO7ehQ=;
        b=MYxEEq2FXBwujNIcVknT6GwPJwpD7/dsir0fEmS03YiyVeRr4n1bllnboY3Tc15/me
         lCPKnXK1O/rVflsbFuXekjSe9geavGpV+FCbNryr9zYI/gd87VsEsctJquWDVDzylcv5
         TjHPAGXJ5ypVrCCxXl6tCImMwdWZgFY8zOmszuiH+DgE6lo540ChEFnCDT8LnSxdePMa
         0l0Cy1TBma583PAApDTHfUaZncNVe1Q5V5oNoasEmo4Tv2E8SLzNU40FZ4mvpgQ5LAWe
         ZV67KXOlnCdNWfbD17mD32axEIYPOrc6grqV5FrCrPFD7uwi6E6iZ43k1PZaWA9cQg5d
         Gcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716546; x=1790321346;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vR5Hf5/Fo4mKQwK6kNI3oaShZRKQk0ZPQPkNgIO7ehQ=;
        b=iaPiYkziKqC47KfLMrqsC+jTQ3KbBF9RRQlwgzZS2f0O/nk9hvi0tA8fsCTy8j3+JN
         l5in3xy1XRECDt0ksreGyFqDGGcUD+jWKzwjrsxviMeTcppFRQgH8C4pJz9lkFD6Mfy2
         RzToIU80QLfhyqJylLgQcQunR3WCYY1uEhoAb6vhu1p68jZ+SiC29R9jL4BhUBy3qpS1
         6sXEw/YTsg5c83xyBbN12YMMZbDeo7YEiq9/guSdOAJnRF2/ITCk+H9NrRIwmO7NEx5C
         zcl+ejekRmAx+tv4bRVI4i9XCmjsRVrx3Uk/LVIKzjKAZTWCZB9TMDy1Qm9a8kOYaiUb
         Dl2A==
X-Forwarded-Encrypted: i=1; AKwUvBwGuP3BUZM24B9JQHoWptXWi7/1XKd9SYFWxX5XIPbEdjKvAI4HTmYZCH8cmBwYgZOaLOJxKH50tu8YNxQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mvvahhBUq8btKM2BdvpcnMQ36SiDb+tWkDqdjrGWzfyTyAQQJH
	dxxaEgSaYVRPoXMHQelQw59TJSsIQlyXO4bPVSMKIlxgr2g5iFTHRRc2eUHXowJEXlQ=
X-Gm-Gg: AYBFou0qzpey7Ol5EtSh5E5lao13oXN7UQwpGwXX/rMPQhSZhwphaXsgxpexQpOSJcc
	XGJjWQREPFHWZQrJPsV4LZfT5feqK44w+NuxM5dO8b05UZHkpu8lePxu8GlVH+0FfLwZLOW9n5J
	cc+2Yppp4lFaQcTsvfZoCdj1WVhaM3Q7mpE9yjwkLqZiGokB8i3ie8SRc79IBlaRrkGothI0TQ0
	iuCC7xR4tCege7f/dZ75tFG8ABClMbHlEaN29YDXUL+i4DvksRtWkN/KiN2p5sEJLd7IyZ3VXEX
	6uyj0Oc2pgWlapXjLLFJqT3MfmwzaQgVtbNayztKdif24FuFHaL92yJGlrFLMD9vI53C+kth4+k
	4aTVb/c//nzek1bzVttrldVQw/JaveR6PdxlNlWf0VgXPE/KohsDUb1T/DTj5ecNwNW7+aFwJWX
	HQQYtro/k0CcDoobR0EOEWggLFDiv8k/rIXhOmtumdqEGyVsSEDLL75IPXwpbeCIZ4xoBwWA==
X-Received: by 2002:a05:600c:a085:b0:49f:bd3c:bc23 with SMTP id 5b1f17b1804b1-49fc5747887mr16339405e9.30.1789716545734;
        Fri, 18 Sep 2026 00:29:05 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcab7e333sm8390505e9.7.2026.09.18.00.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:29:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 18 Sep 2026 09:29:04 +0200
Subject: [PATCH v2] soc: qcom: geni-se: provide PROG_RAM_DEPTH for I2S HUB
 Serial Engines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-sm8x50-i2c-hub-fw-ram-v2-1-30e960966802@linaro.org>
X-B4-Tracking: v=1; b=H4sIAD/orGoC/42NSw6CMBQAr0K69pm2fCyuvIdhQcsDnlFKXgExh
 LsLeAGXk0xmFhGQCYO4RotgnCiQ7zbQp0i4tuwaBKo2FlrqTObqAoPvyUF4mTmVQNpBO1qo38D
 lC9LEpTK2mMnYiK3QM9Y0H/V78eMw2ge6YU/uRkth8Pw59pPavf9OkwIFdZJrk1XGmcrentSV7
 M+eG1Gs6/oFL3dp7tkAAAA=
X-Change-ID: 20260917-topic-sm8x50-i2c-hub-fw-ram-54c503be6038
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3638;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=CrfB5Rz0RrvGaZsIayezXrztszc5vqvtS3GZl43Wk9M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqrOhA/Onzy+tSI55tdZlZKmFochJqBLEWXzBpLSnq
 gO6t9guJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaqzoQAAKCRB33NvayMhJ0SYiD/
 0XXgwC1XShHhiYscX4bnV3Ya0b6UwdrvxsKczU2SWnSjFKPOJNfOC10+rOAIFK8oOow+Eqn5fY92ke
 tqAu0eHeiqX3xNS82DDMceAHeNJvmHFeX54cJDY63e7G7NWlw5nLpLHBwqcs/lenwcqgJK7ojaNln1
 aOOLpPTPk0YsAiNUx9mpsNK483+fHHtDUrM5sLoczEfs1B3qTkFziCDQ3r5l0RLBpFMew1aFJkRHqy
 OiOpsrj9yibeCuTk+g9vI5aW2f2vnx1/gRds1o/FenHG1fIbNCIhO15k9zDrBzqPgNGuyoHdC//DZa
 ArYNM1cKr2qcVr8XIvzLIdFQzPte+1DKJmPvTui9SHDqDC1tcSNjsKWSNKMyD2AXOjxPv3+OPhysWq
 D8ws0ijfZqXS1E508Zbg6vWgUvmcqTLgiJ1pi3T5Us8aH5D8mjiJM2D5tX9hLnhxwYsHTBmJwVT4zI
 6ZsDzYjSHTpkOB9Vh82RckCUI4WLhU6y8pQFOJvHoXrwjxwvRzkqpi3Z1H0wEyaBJzMxMsiy0/JIfS
 Rmkz3NCj9aZ38NdHexJmmzjlyhegmAT7uHuHNWtmn8FdLKIK6lhaLmtC1IRba1dwhmIsIczRpmndPJ
 EuNYo47odSYipK2LiGnPVPYv35/aJlzwKFRcS/PYrfICpa5o98iKa2jj9aVA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The I2C Hub serial elements lacks DMA, so the SE_HW_PARAM_2 register which
is in the DMA register space doesn't exist for those instances.

Provide the ram depth in the compatible data to be used instead
of the reading the missing SE_HW_PARAM_2 register.

Fixes: 522bfb4f33c0 ("soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate firmware size")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
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

