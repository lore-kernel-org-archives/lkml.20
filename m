Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341308;
	b=GYZKcqk+XmhhMiMTXCeNNaKtZQf6nS5g90KxkTByw2RivCkrW+CZqR24YFT7kxv0QLz2
	 UvCJ1LhA5AbO4IukYkBJuIf9KqsheHWpJMLqIQ+ZL8ME55EeqGloeIm2oqO3iaRq9R3Pm
	 75p11WuGC7AsAnjulmeygQTAVd+IJ1fMn4pCIF7wd2Pd51FHojw8yroLSnIz23Yy/uDxY
	 J4S7yzhND956o/mAnuShTiIj0SviodsCSmd1nxNbTnbXu9LLPZbZFxPeeDnjJm9OuuFSb
	 fXs9VjRty1zOZc4kPKaCnUL5YbIsOQnkCQ6b9p4URr6XUglvmeClo/sLCZ1gFVbDR1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ixcBoe3mK4tgsAsIGtJ1+xC1HHMtbJXTczrr0LfU9Aw=;
	b=f0NrHWxy9QWKOW7wKX4Zim//D4bSCNp2gL4pN3w9u8eO3VB5avbejYKqGHNsqwYwdurG
	 qQG+fzOW6YsiuXmfKL26OoOU7hqjenWjeu3C9+n2j7Xz9Z2EkZ9czgGmaMoJP4oYTbaY2
	 01faAx3HYvXH9r7MDZWjsYDbQ/b82nuU5rJnoPS/c1fWcK0s8+CpR+jW2/eWyNRukWZNe
	 qrW3xkPoUiZnEA+aJ79C4njpRRXkSkSOmXyAjGkb1Y4sKqFcLIljxPlaxoV1XD8YHATIu
	 iN+AdEHukG14/FzAIk87FR37k4xEfO9aYsLzp7+QHYbLsQM51ENgJDBNdSQ9QT7zSnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W2NoFq08;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ib+kh/pF";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D09606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6D09606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W2NoFq08;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ib+kh/pF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F4VU2286934
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ixcBoe3mK4tgsAsIGtJ1+xC1HHMtbJXTczrr0LfU9Aw=; b=W2NoFq08rtxUAvsN
	5I70HKm/x8rBFeUgUoO6R5JtceBmk3TfRYbXgXlL7SNHqrUPfWEyBA+ObvtTBXTI
	mqOYae3KVpPmxd7UpWts/qlpC4ptQIsiRf6AdOwKGXmewnu+cyOFWacu1alLPcTe
	VDLKbUopda99U3hoLHpY7kRMkHxXPhtwlgCdW9+MaKg9BjaKbY6cl/jscf4lX82z
	yvc4DfjTkhh0lqHVj5B6f2nT+C9FvOTGfp/8C+D/nDHzwfz0Q/tFEbRcYr0yiA3E
	M1wrBiy685yF1Z1IfTdrCkqmnicEmFlFzhV5pEKo7l9tRNoLTkycNWGQFYtskitJ
	Hp4cKw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhh8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05b68f851so1465624b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341306; x=1793946106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ixcBoe3mK4tgsAsIGtJ1+xC1HHMtbJXTczrr0LfU9Aw=;
        b=ib+kh/pF1YiniP/tueCLj0C3+ZKPmbmiQvv1R7dbTFrvGea9EZgwwuXS+3h7NJZKbC
         YM6S5Q2S5iQWJwL9a8RKyzxrT/CMTjC5L/zY/xrj1Ki7DkEACEMu8Okznxlk6CGenNyh
         Jk7HVNJ87iSlTk2QICllzgIsHqWhqD77eh6Geh0VYDFzEaSbbr9Cxxb/fyj+pOwoTzJt
         H5JUXwYTHRvAkXvWaamAhsZQCrEkGIMk9NuqlFCa6xIPJWbrX3fbOpxSveeztUd1wRbj
         sAtZy0RQtxDELMv0ym1s777prT2kj9stG7yVzDoG+y1L2dnL/M2T6piVdVVnJq9SAfON
         gvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341306; x=1793946106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixcBoe3mK4tgsAsIGtJ1+xC1HHMtbJXTczrr0LfU9Aw=;
        b=iMSLqiy1IeqfL1Jpjwz/nlS4KEfatCgxU3PIlbFPbEFwUCjCtFtpYCCImITxGJNt64
         hSlOg0jIOahbnA5kbkz1fdXqCm09izoM0ZpFGw1+tqUIxberLfSWxRvEnEU7thOmkD+K
         5RaOBRA/g3MpXN4TVooGqVmRwfLWfPWSngTmo4pV6rTWrcig2Indmxc6gjQ3FGmhd1At
         CZxe2+8vtujUNSUFz6GAOTrwoNyoyGgqec5QYQuA68BzcWFMKciduoUKQJIEekVUHweS
         4nphX+AsIMmLky4j/16KoCWaeEfa9Uy8sgpNqwz1Ty/KIItgZ0bhPNz0iSGym49hpzpy
         zIdA==
X-Forwarded-Encrypted: i=1; AKwUvBzRwPRMiokBXqBNU7VP6dvn0+KL4dTblagtFUE5IHjAklnYHxUVk87GgTfBYLd5m/JH4tIAavuXEjiwghg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSrHJvyCZQLLnQq6CpHFhqs5rqq9QxmHSn1AOEhBxYayp0dEm/
	8l0jhd2owKhtC1AHIE7t4qRtA2hIxPR5p5E1whYY00sQOO4ybtEilQQPxjeWpEH31ugGw+mzYHr
	DdMxPdHnwn8iMtBRJ0dM8AXMPApE6+iBddEf/XwyNE+0wDhEBM1EMtj2BJbC9CgZfFqM=
X-Gm-Gg: AYBFou3QHmWV/bjD8zIJR0tgw/ZjSGPHvaE5gl8IOabLbNVRHOAKGajxG8qcZpOMZqJ
	3sf9JGWu8siBjdN9U9r8jV0JQCfvzT1mZMBxsVH6ue4Ci50n6tJxMohLbzPwwUk2NLqEM5QH9fT
	WtWGG8gaL6hEfizmoIdCxbhKQR/fAfsCFApsIrNS9wolI+XuQEh+BvZdM1gFniizun5YBqR8Esp
	vOl1MkdqTpLhqmizGvmi/WfYPbCYzhXtMGS2qMCQAA7SxA5ATNDDXwHLz74YfQ1VHx71Ouqaxmn
	pgkJz9CktbA6HkW4ztDiIXikvAmVZrAGyQ22p/3ZQh+B+ryMOI5Ai9Zi5pqUvio392o2nLzn7V7
	zE+e/UTKShQO8HrzFg4mjWn4Hou6LK0VfJ/7tlK0xajR8EudvLrVUAIKq1b0ZyGp+vKs=
X-Received: by 2002:a05:6a00:3393:b0:8a0:6ff0:d29d with SMTP id d2e1a72fcca58-8a832a94a9fmr3120789b3a.36.1793341306247;
        Thu, 29 Oct 2026 23:21:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:3393:b0:8a0:6ff0:d29d with SMTP id d2e1a72fcca58-8a832a94a9fmr3120778b3a.36.1793341305803;
        Thu, 29 Oct 2026 23:21:45 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:45 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:55 +0530
Subject: [PATCH v3 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
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
Message-Id: <20261030-pm8010_i2c_support-v3-7-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=4324;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=iOss1N4oaDpxnlCURLVb53pk4cSN1jSfF2112q90j4o=;
 b=4J8fIBakoKfjwuQ2kZOD5bffzCS2igeg2i4LUGF+Zk6GGL/8N26O+9Sz42Pvw/X4WRD2osDuE
 BQj4oNauGlUAIaNTGOxcMf2bbwxBrFnO5GUxOgwNYJyy49OOwh0JwB7
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: SEKAwUZ6uJRmtaGUwR7musDK7s4Ln3CN
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae4377a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=lbcZtXRpr0qBkvjFNboA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX5H3a/RJu9VqT
 JvGenDf8kImJpmspaScunZUGsUTJInqffeOJLhq2CCWEpSvkRGD0nkellanu6XpZgyZvwQFkPYG
 TraVAcaiaS20v58UR56/dTxZrDpwBbOKRB+Yzli7mIYAcNG3zgBAHzi5eK9UJMyrEi4c4h0bVrJ
 MZIkKvm+vswIkad1YiuV+VDg/pPLZ3krXNUUJhvB0Ujs6PMGeyP/OwPDKPGdXk38B9WD8rMszeX
 k+YOzRWFE5Qjx5h0ymqIfY82BdqS9K6uRCiIQWP7hWO4rUwbnVlltc0mz2H8LXU74wgKJ5WAtIY
 TCv81ICBml2CmYfRlla5EHP5bI0cgg8j/JZnZw3eXfHN9BxdfnU3khbXMqGfgTKgZzVMaMDicWB
 usqMIl7DGzXtbTdwGI5+6qEtccqX51wyoLVL+r7TTh7wJD5amT4ewgBp9GKlrf2HFJJE5xP60rq
 J7fRK4fa3SJ/xNjF78Q==
X-Proofpoint-ORIG-GUID: SEKAwUZ6uJRmtaGUwR7musDK7s4Ln3CN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfXwkUNFr1rDvoF
 vfuvcKBeObLeMdn8vGdSuLtHAQQCpdak3YF1CbWsO0oELWCk0QrXMUQlYkOcOnqb2ZcexCPv9zp
 GtlCXuZHgOAjVBpIbb7O/3vQ7tSrIO8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is often wired up with the interrupt pin tied to ground. Only
register the IRQ infrastructure if we have a parent irq.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD
Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 82 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 22 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 39fae8d48e46..9ebbecb90b0f 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -208,6 +208,14 @@ static const struct mfd_cell pm8010_cells[] = {
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
 };
 
+static const struct mfd_cell pm8008_no_irq_cells[] = {
+	MFD_CELL_NAME("pm8008-regulator"),
+};
+
+static const struct mfd_cell pm8010_no_irq_cells[] = {
+	MFD_CELL_NAME("pm8010-regulator"),
+};
+
 static void devm_irq_domain_fwnode_release(void *data)
 {
 	struct fwnode_handle *fwnode = data;
@@ -215,20 +223,51 @@ static void devm_irq_domain_fwnode_release(void *data)
 	irq_domain_free_fwnode(fwnode);
 }
 
+static int pm8008_irq_config(struct device *dev, int irq, struct regmap *regmap,
+			     const struct regmap_irq_chip *irq_chip_desc,
+			     struct regmap_irq_chip_data **irq_data)
+{
+	struct fwnode_handle *fwnode;
+	char *name;
+	int ret;
+
+	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
+	if (!name)
+		return -ENOMEM;
+
+	name = strreplace(name, '/', ':');
+
+	fwnode = irq_domain_alloc_named_fwnode(name);
+	if (!fwnode)
+		return -ENOMEM;
+
+	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
+	if (ret)
+		return ret;
+
+	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, irq,
+					      IRQF_SHARED, 0, irq_chip_desc,
+					      irq_data);
+	if (ret) {
+		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int pm8008_probe(struct i2c_client *client)
 {
-	struct regmap_irq_chip_data *irq_data;
+	struct regmap_irq_chip_data *irq_data = NULL;
 	const struct regmap_irq_chip *irq_chip_desc;
 	struct device *dev = &client->dev;
 	const struct mfd_cell *mfd_cells;
 	struct regmap *regmap, *regmap2;
-	struct fwnode_handle *fwnode;
 	struct i2c_client *dummy;
 	struct gpio_desc *reset;
 	unsigned long pmic_type;
 	const void *match_data;
 	int num_mfd_cells;
-	char *name;
 	int ret;
 
 	match_data = of_device_get_match_data(dev);
@@ -255,6 +294,19 @@ static int pm8008_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	if (!client->irq) {
+		switch (pmic_type) {
+		case TYPE_PM8008:
+			mfd_cells = pm8008_no_irq_cells;
+			num_mfd_cells = ARRAY_SIZE(pm8008_no_irq_cells);
+			break;
+		case TYPE_PM8010:
+			mfd_cells = pm8010_no_irq_cells;
+			num_mfd_cells = ARRAY_SIZE(pm8010_no_irq_cells);
+			break;
+		}
+	}
+
 	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
 	if (IS_ERR(dummy)) {
 		ret = PTR_ERR(dummy);
@@ -285,25 +337,11 @@ static int pm8008_probe(struct i2c_client *client)
 	 */
 	usleep_range(1000, 2000);
 
-	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
-	if (!name)
-		return -ENOMEM;
-
-	name = strreplace(name, '/', ':');
-
-	fwnode = irq_domain_alloc_named_fwnode(name);
-	if (!fwnode)
-		return -ENOMEM;
-
-	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
-	if (ret)
-		return ret;
-
-	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
-	if (ret) {
-		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
-		return ret;
+	if (client->irq) {
+		ret = pm8008_irq_config(dev, client->irq, regmap, irq_chip_desc,
+					&irq_data);
+		if (ret)
+			return ret;
 	}
 
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,

-- 
2.43.0

