Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810837;
	b=mToUUteMjRhno/ewXygg32PTmFRxxMnMGis6zQcq7NPeG4NohBn/ge6yRnzXWYMQnedc
	 HROUkeXTw09cbFuWwI5BxLOTK7qftX2l5p2kWe2RfFgEEfjr6ioLbh5zv7vaEuBLF3awe
	 gn+pI0GSlinJC3oVyCLDYLo1geb2g1YUP60kCwKQqgGjZyWf1+1xmQs7VT7Rnbg08Nk2Q
	 vd6UxzOCQjQfY4zzvLkvgWtfHZGchMbF6yukbP9n2mFyF0umQ5ggMcjgD3PH7lBkMfsPJ
	 NUB3KpnckB5P8ktQqJZQ9u3Wq+z9pnYrfCeZ6RFRvOlqrSVtTmKkLY+/Qw4b3piRm3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Iw/zhL1hpsbYxjNVLjsEh7Qtn2rPLU0cDn1FG/OJ5Sc=;
	b=V0AANRJU+MGz4laOxxnoe5bnXq+l858J31QKWyfBlQL/wVBxsqN0KAr9A/3cOfkvCwF/
	 L2rgOg4+EhkgWYn2dIQDTLGOI6fGxyG3qqxp4LbSGTHl7kbMcnyu6u8UTMWlhNjdKu/Zv
	 YEyf+byWO4MYyljWBkg/eVfdiIShU7qkCwu1NPvEOtGRErq6Jpa+fg4r1LqbiAHIK3CAn
	 Kj1jXtwaJUUjwpCkuquxyLVsksUh8bJfEnsxDafN+EVMIZyuYyyNTqp7RZxu7SQNg5FHt
	 74dPR5G6sroi8BY9NT3Jl4xcDmZEbw7zFRd0fttuWRxVAFG+kA+gQ+/mjsNh/AMJWtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ii+JEp8N;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045E9606EE85
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 045E9606EE85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ii+JEp8N
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1adbf62dd31so1290660c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810836; x=1794415636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iw/zhL1hpsbYxjNVLjsEh7Qtn2rPLU0cDn1FG/OJ5Sc=;
        b=Ii+JEp8NcqQOExZCbNy1Q72rEE2d82j/6uqSwHBPOZM5MI/gsmkc8VVqk1azPShaNG
         cuXcwE/gD7VDumYMltfWPvWHst7fCWcVmipbhzGgDXh2GVypSyrp2k4O4b60Q9NV0k4A
         V4nlC/+2OnNcoSoToNxDcBGgJO/yheVFxBcJffRm8mbY+w40ZrnsyPrlRkDIPQbrd8IB
         I1BPtTsMlJ2HCIfeVSTs6wIyZewYdjeB4c6A7RaJesYBkyD4WCMbvuLbnaCBfI6DsK3J
         JnOvcFw6haiXJnCW/3so2voL5cDhoekP/pgDJsqYqnmMcc/aSL8qtr+xd3hq5dPW19uo
         6UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810836; x=1794415636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iw/zhL1hpsbYxjNVLjsEh7Qtn2rPLU0cDn1FG/OJ5Sc=;
        b=LqvrGVaxbEkC4rEGMg/qixC94I/yyl+HPD+5RD0m+cy2ED3IN/i5eh//Lt7F32lNHd
         fkrVk9KMvh20QosOmM9cepACs1nudc53QqNRVxdlU4m2Zcd6x4OMLH42WYnPHtz7Prfp
         ya3jt9RllHgyvaR9cdTaHdU9+JRQxRaCZv+wsKIptDbTJj0lx42eTonB/rSCCn+oQwjb
         fs6SENBjZK/0xcJuTLxsQa4fafFqUXYHO9zOma2csiZOKDC1JtaR10Y1bFNm+saL1JQe
         mmLgwJ6+yb+oML023OeU5UNkgJJ0jFOI7ZLodMGdy/7o9OZBBfoPY7w4CjaXK0cvcIMv
         hd0g==
X-Forwarded-Encrypted: i=1; AKwUvBxiLs7u3yDcUvDq8w634TojHXg/+XtE51RxY+KXfh2uMrYg6Osq5tCfbEuh/0QaUBhXu2Zqp9G9UUK4rc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xE12WL8iz7RFrUtJHG3hnA+WS2dNe1aOjyfjVORVTm6kzePU5
	RbZWSMX5wChg1WIV9Tb2U94Kza+6oORWQdBrFQKfeLMWqhtK9v9Oosjg
X-Gm-Gg: AYBFou2zxHWoCwq0agiZwHouSBUfbACWN/gaqFwks2MqTBicVmhcalrr5jzil+MxDS2
	2PZgl+wehTIIyrwM8Hfu8baS1v1swt8XTTigYp51wkoOWNj23bgP8pq62hTATI9AO7dwSh7A7sq
	GiAF0CNHeKvJs6hrT14de5BAlVsx01WsayDP0jyKX0Iog/b9gINjLBHqarY837FxZTukSzh7WwX
	RlIZSWBke8nBh3pBsHhxqSQMISW/JVDOJNyF2dHviYhaf7xmcE6j/njZYZ9o8rOvRKMNfFrBl1p
	o6ybCEJqRJ5VVAW0dHx0M5D776oX+xKVIFqIij3xIp2X4O2PbKfN7SpBRW9Zk9rX40Z8Q+4Jpiz
	HOalmNA+5jsNlJmgI50aPmbecQQVih4O2Jt288DxlJHYD3ctwmLvnwez3XDlFvDPxP+g906FR+p
	ArXu9KDSd6d8pUwdWOpb3g487nME771up16/ivqaqmbBc808zz6FlRU+xWPy0BLUENHp9vfNJV8
	tHsbZyuVEl7X0WGS8037sT+2bgEwZEHGjaX5qjTPkYqG39/xZttCNpkz2wcb/ai8sxtiDAQCudf
	3yx66aNCsorZq0Mja6ifYXYFhvRpfbazrktdj9bH9KUtY+XgPJGIQZ24AUcLhYEMVyhM/mKyZci
	IHAMztV4=
X-Received: by 2002:a05:7022:3f04:b0:19f:527d:96da with SMTP id a92af1059eb24-1ac5da7b145mr23701286c88.33.1793810835903;
        Wed, 04 Nov 2026 08:47:15 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:47:15 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 16:46:35 +0000
Subject: [PATCH v13 3/8] thermal/drivers/qcom/lmh: Switch to match data for
 SoC CPU-to-node mappings
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
Message-Id: <20261104-master-v13-3-355b65c6f764@gmail.com>
References: <20261104-master-v13-0-355b65c6f764@gmail.com>
In-Reply-To: <20261104-master-v13-0-355b65c6f764@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=4488;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=VU3SQSKgFReF5BiO2cKpUAobqELNHDdICbyBD7TlHBc=;
 b=zEQCRQG3leyhQotPeA5MCZh/7vfckyMF2IzU+0IxPHpx8ud6vbLpA0+Et2DgDiTWDZbxXhkrL
 j/JgrQU0zoCDYa1IoTh9tAQDpIItm9Dg7NXu4XbjUYF5XSuUW4NhvDj
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
index 99396b93e..ef49ed1c6 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -94,19 +94,61 @@ static const struct irq_domain_ops lmh_irq_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
+struct qcom_lmh_node_map {
+	int cpu_id;
+	u32 node_id;
+};
+
+struct qcom_lmh_soc_data {
+	uintptr_t flags;
+	const struct qcom_lmh_node_map *map;
+	size_t num_nodes;
+};
+
+static const struct qcom_lmh_node_map sdm845_lmh_map[] = {
+	{ .cpu_id = 0, .node_id = LMH_CLUSTER0_NODE_ID },
+	{ .cpu_id = 4, .node_id = LMH_CLUSTER1_NODE_ID },
+};
+
+static const struct qcom_lmh_soc_data sdm845_lmh_data = {
+	.map = sdm845_lmh_map,
+	.num_nodes = ARRAY_SIZE(sdm845_lmh_map),
+	.flags = LMH_ENABLE_ALGOS,
+};
+
+static const struct qcom_lmh_soc_data sm8150_lmh_data = {
+	.map = sdm845_lmh_map,
+	.num_nodes = ARRAY_SIZE(sdm845_lmh_map),
+};
+
+static const struct of_device_id lmh_table[] = {
+	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_lmh_data },
+	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_lmh_data },
+	{ .compatible = "qcom,sm8150-lmh",  .data = &sm8150_lmh_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lmh_table);
+
 static int lmh_probe(struct platform_device *pdev)
 {
+	const struct qcom_lmh_soc_data *soc_data;
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

