Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978196;
	b=sparQSOvPd5Q3TeD7f7rff1DUSnZ//AdA8PUaeazcUAXroZhqTHerCGXaVex8j1HitfF
	 k78LY2WnDN9rQ2dzfBbEavpSDHcuiPL1tesf9anZvb9sA+/VK0YLqNGzBuJIj6i/vn64r
	 dhZ6YOPJRkmaioCWfD5N2ZJQ+/GrsBCzHpDqcdiCmzd5tRpZG4wSgZhuXNqaRUVASYnV9
	 QTbQYNHnPe2i0zkX+Ck8IXqqKdQ8Mx0Ym5FFZfSuxqIXk8z4QbS3VY9fvgM0Qe7XAktgc
	 C0EikPdJtqUlei14mzw6tni7aoWp19/1pEWsS6Pjdfiqrr6ixDtoxVCY7gH3MEcMIPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p0+vg0aeGV4J5pNv27qoTyKZdEzm1Xuk0hKJMzjj9w4=;
	b=rAQBsS0o23goDmMdZbSmrAlvZXq8MFuUu0jd4HwPEGG5JmDd8/Gj1AKNvojsW/waB1KK
	 dhbkMsLW7njHWxBmUIKevUjj9uDn5pW2x9tm+anrmJh+AjSyL3pQLAg3wEJIQ5Qttz0Yb
	 0wughbOqjp8Lg7hkSI4MlVVbbxQXSHcT9HIvvDoC7Uv1w35TmcG9HqwxJiw3EzmOL0VG8
	 MIe+auQuqiVDTBlSDy11VEDftgOXfwHJbU558ePbCXYetHj4t2lh/F6xM/mHWs1JieFh0
	 ZDh83YfFRqGDJLBSLi2pEQ8e0i5X+zOy41/H1Nzl8OxPV3iC+85RW7eu6nC01FJe0Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFbDAQl5;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A86606D813
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A86606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFbDAQl5
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36f6295304dso749203eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978186; x=1794582986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0+vg0aeGV4J5pNv27qoTyKZdEzm1Xuk0hKJMzjj9w4=;
        b=CFbDAQl5Px6jJ4XZlFMEDPoI4ZftJaNbBTXENQXD397d5G0rLRfHNpO/GPvDacJHl4
         ejdGEOzZBustPJ+tgfBCzCFWs0gesOcaefjBsRHSbrJsGlPAzsw3qxEqMQmcZamoM26b
         ddDvxGSHByu02tUfR1WiQJrF/CGlz+Hyq5eZv9rvm+Dzh9r3PkzluFOq7M1XgKcG3smy
         rGQ8Scb2cqvB/t4IxkX5SSueomHoKFOc9Pn8wa6h0AUTetKtfmXkoNjTQFUnM+7R+X0+
         +eUvvp4EatjHX9EOyANLc7X05RI6D+VJ/jTz1UeTey4kv3ld5Ch8o1ewgqwyuLuz0AVa
         77ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978186; x=1794582986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0+vg0aeGV4J5pNv27qoTyKZdEzm1Xuk0hKJMzjj9w4=;
        b=GZmOh6iDGykBhnA50pJ07qUU6mtGC+eDEbczS8E9IoBxz4l32BCHc+fmHqP6Q9lbrS
         fxNT8Mn7d5eqSPnHUIG17w05s/Vf8jhEEg5iw2yelLl6sEurUwaZVhLuBJ235ypzvax8
         EzfzfochIBGgk9ocV3cu5/fnrsba87nVxNxG4cjsW4Jt5AE5f4/fLQxTFCG2gGB63V2F
         DjgNv9qFoUUDs8lSBHhI+5Qsll1sxfHnPOAXNXKJ9SnDYIY8JQUOc4wKcK+f8yEIO+BU
         hTrwOGafi92cyXRUx8VyIhxKXsVbondREF/ydrSY2LLg2L7CBtmZZ46UBgIL3iXqOfoD
         qT+A==
X-Forwarded-Encrypted: i=1; AL+hErEitkDLf3zoKmxlh9SDvl05ro1ZoCrRbcMCk/TQHQJbKhkwHAhCxbpqeb7jI2VyexDO2iwRNqLPbfd5gQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SP579BhX6dmZXYD2iJ4Ckb/NxgeVPKye5JsZe8C/NzC9elmoU
	zZI1J3ecUihXkzhj7Q7iTzcfv27mKgjC05wHiQ0+5+G52ER5f5cL8MDC
X-Gm-Gg: AYBFou2IWdw/vHCCOYaJhFwZKSYokhxCG6Thx+/oucrRTEFLdcGxKJ7buwlzBJ342zs
	97vt6h9lZNU2DmtGX/ycanvrBXAfBy104qjxTpT9YxJtNfVO7mNNbHKDEAi6Ms79lVZnxn3Qi3s
	v2ib8DMOc8O+d4bcTFFNDGFpPaJt7wxd+ZgxShWdM/C7I0ph07caTiwbUpssjoPBAOC9nSeqTLa
	Gy1h6nZigW6Lzr8yE71o0X9yPW3AF1KngYdUgQ01qV1954yWTKglIAGIkzRBtSCgh1PN/XAMTYC
	UM8JIHrWyHZdOELPXBvpCmXsR9/I0arvOyCFyV97hCcZRIba+Gr26avEvzviAWBaY1/nmg7tUlx
	MK7l5J9vBcNHZuFL6lROYQxwV+aWYLPAiKZt2SIMHk6w5WNMkSOc1Iw5b2ZL/OtEL/pkDvZ8NfV
	R91MRmiQka4UATUxPb5GhfK1xAcQ+WdNqvj7PqIgGfRMRscyhQraE+8u6pGqfCabSMmow4LAshV
	30FQlFu9l1BWmPMfxvGoD2HUcSIJwjR1ciTL9jfQEJcWqQSCFweJrjjTRa6kjd9xTxL2y/ss4fS
	f9IrM4qGkk8gyG9iIRRJu81/sl+FcCgDCk0ITsaz/84NslJigFNnzDuxqTM563XlFWcyG3dquXj
	eQCGQ9nFj9ls7jw1VHK6t7gPUKctM
X-Received: by 2002:a05:7300:b0aa:b0:36f:4d62:2884 with SMTP id 5a478bee46e88-36f7691a412mr3600161eec.30.1793978185868;
        Fri, 06 Nov 2026 07:16:25 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:16:24 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:38 +0000
Subject: [PATCH v14 3/8] thermal/qcom/lmh: Switch to match data for SoC
 CPU-to-node mappings
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-sm7250-v14-3-7d167e993f9c@gmail.com>
References: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
In-Reply-To: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Sreeshankar K <sreeshankar0910@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=4409;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=nwH0k71RDFHMH21LAx9GvawuLoxMvflAeMTqII5xMG4=;
 b=9GEg6sCjo+Fw5z+URS3OWyPStxL54iUQB9zxVL+ED7z7plk4poxuPjsJg0fe2SUj1WrtGGXPB
 evpAQlKueAoDYKBDSbEHFGkU8bbJI8v1oalpbyXhlQL0bxSilhSdRJS
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

lmh_probe() hardcodes the mapping of logical CPU IDs to LMh
hardware cluster node IDs: CPU 0 maps to LMH_CLUSTER0_NODE_ID, and CPU 4
maps to LMH_CLUSTER1_NODE_ID.

This assumption only holds true for 4+4 big.LITTLE architectures like
SDM845 and SM8150. On platforms with asymmetric cluster layouts, such as
the 6+2 topology on SM7250 where the big cluster starts at logical CPU 6,
lmh_probe() fails with -EINVAL. Consequently, the second LMh node does
not register its interrupt domain, which in turn causes dependent drivers
like qcom-cpufreq-hw to fail or indefinitely defer probing via fw_devlink.

Address this by introducing a SoC descriptor structure (struct qcom_lmh_soc_data)
and an explicit mapping table (struct qcom_lmh_node_map) associated with of_device_id
match data. This encapsulates both the algorithm enable flags and the CPU-to-node
mappings per compatible string.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/thermal/qcom/lmh.c | 73 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 20 deletions(-)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index 99396b93e..e160ac477 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -94,19 +94,61 @@ static const struct irq_domain_ops lmh_irq_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
+struct lmh_soc_map {
+	int cpu_id;
+	u32 node_id;
+};
+
+struct lmh_soc_data {
+	uintptr_t flags;
+	const struct lmh_soc_map *map;
+	size_t num_nodes;
+};
+
+static const struct lmh_soc_map sdm845_map[] = {
+	{ .cpu_id = 0, .node_id = LMH_CLUSTER0_NODE_ID },
+	{ .cpu_id = 4, .node_id = LMH_CLUSTER1_NODE_ID },
+};
+
+static const struct lmh_soc_data sdm845_data = {
+	.map = sdm845_map,
+	.num_nodes = ARRAY_SIZE(sdm845_map),
+	.flags = LMH_ENABLE_ALGOS,
+};
+
+static const struct lmh_soc_data sm8150_data = {
+	.map = sdm845_map,
+	.num_nodes = ARRAY_SIZE(sdm845_map),
+};
+
+static const struct of_device_id lmh_table[] = {
+	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_data },
+	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_data },
+	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lmh_table);
+
 static int lmh_probe(struct platform_device *pdev)
 {
+	const struct lmh_soc_data *soc_data;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *cpu_node;
 	struct lmh_hw_data *lmh_data;
 	int temp_low, temp_high, temp_arm, cpu_id, ret;
 	unsigned int enable_alg;
+	bool found = false;
 	u32 node_id;
+	int i;
 
 	if (!qcom_scm_is_available())
 		return -EPROBE_DEFER;
 
+	soc_data = of_device_get_match_data(dev);
+	if (!soc_data)
+		return -EINVAL;
+
 	lmh_data = devm_kzalloc(dev, sizeof(*lmh_data), GFP_KERNEL);
 	if (!lmh_data)
 		return -ENOMEM;
@@ -139,24 +181,23 @@ static int lmh_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/*
-	 * Only sdm845 has lmh hardware currently enabled from hlos. If this is needed
-	 * for other platforms, revisit this to check if the <cpu-id, node-id> should be part
-	 * of a dt match table.
-	 */
-	if (cpu_id == 0) {
-		node_id = LMH_CLUSTER0_NODE_ID;
-	} else if (cpu_id == 4) {
-		node_id = LMH_CLUSTER1_NODE_ID;
-	} else {
-		dev_err(dev, "Wrong CPU id associated with LMh node\n");
+	for (i = 0; i < soc_data->num_nodes; i++) {
+		if (cpu_id == soc_data->map[i].cpu_id) {
+			node_id = soc_data->map[i].node_id;
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		dev_err(dev, "Wrong CPU id %d associated with LMh node\n", cpu_id);
 		return -EINVAL;
 	}
 
 	if (!qcom_scm_lmh_dcvsh_available())
 		return -EINVAL;
 
-	enable_alg = (uintptr_t)of_device_get_match_data(dev);
+	enable_alg = soc_data->flags;
 
 	if (enable_alg) {
 		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_CRNT, LMH_ALGO_MODE_ENABLE, 1,
@@ -230,14 +271,6 @@ static int lmh_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id lmh_table[] = {
-	{ .compatible = "qcom,sc8180x-lmh", },
-	{ .compatible = "qcom,sdm845-lmh", .data = (void *)LMH_ENABLE_ALGOS},
-	{ .compatible = "qcom,sm8150-lmh", },
-	{}
-};
-MODULE_DEVICE_TABLE(of, lmh_table);
-
 static struct platform_driver lmh_driver = {
 	.probe = lmh_probe,
 	.driver = {

-- 
2.43.0

