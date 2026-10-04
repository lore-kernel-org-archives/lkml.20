Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6153496D4C
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 19:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141007; cv=none; b=q8xX6m964jwh1Yt9A4t0tYj1oRCX8S6AWNs/ery7ITi5/tmIGPhxt99IcBwDQOIacZK2RKWZ+c47H6msvr+FaQOf+I8Faf/tcU58hI93HJPRptqbsSi6uzI1gEI3KW3bnaAU4OPa+Q6Qz+/Ftd9SE0/LReiZA1C0WgEeTPbnOCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141007; c=relaxed/simple;
	bh=2MPVuOKTsu+qiTVVCZWs+5Limvxk1zCeCGybsaPvJec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qcslYm3cI+TMxoPNK1nOz57WU+XThV7+QQ/7Vq2fSqPAhO3EZbQQH4uXpDv6LoRcN2S/GmGPKcTl3zO95EmKSoTLUvKfTfAAjDe66k0oW2qPzjOPE4ChPkm7qTt1FlneU3KfqFbDE57lCDtpHytNVOGahRV86moH1+TNBcsie3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YP4+uC9y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VPenI/8C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YP4+uC9y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VPenI/8C"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694IHUYB3253336
	for <linux-kernel@vger.kernel.org>; Sun, 4 Oct 2026 19:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	59zywkqWAOH+Sf77rQKm1VSFzR6HE8w0Xnvh3qH53is=; b=YP4+uC9ysIMuApyI
	ZO6Sl0t39h6Jl9EoNHdxO0fbSNAHsXjBstHzseE4iix4nVO1iz0pICcRZG16GjO5
	A/vukpOFeanL98WfVw+1rin2FtolAORRHSa8EA3q6oTWZdzfrlj0DGjpCZSEqIQ0
	5uTRe9cgt2kO2oxw9rhCe3SI45eBjMY1bchRd5UvZ5+Q1XWRCP3ibmrN3EngqUho
	ziuewe3fwLyVkDxCMSXqKmeNk+htF8Xdww89cz9+8n0c1gPbPe2x/+oF41N586mH
	jHbt7VPNi0hiDab2nZ5kmkqxT74itGFfqupaj003PyEw2DG2UisHKWg1uatqYGhy
	yjQ1Bg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tfdbhn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 19:10:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb93c874bso185210385a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 12:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791141002; x=1791745802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59zywkqWAOH+Sf77rQKm1VSFzR6HE8w0Xnvh3qH53is=;
        b=VPenI/8Cmbog+6B89SOcaFEe1O++p6GLxZQK8Mlg1dYr/tfpOeKqAQkENHtKdYZ3LE
         wsLpooDMvLZKIG8DwsWWN9JmCrBT//iit1XtR+ww8mJ/MffZCWmm16DXdGnLqe1OTc8i
         dW80/8176cf4PF9to0Mve6XAAhqDo4eEJU+81fKMDiGdty2B73CLF4IAxzYs/OEtrDFF
         wF+mYdMiGJyxH1uT+nJNmUYR5tHqSTL+hwOzUOb9qi6zWJnc6YlYBysckkJXe473TuxJ
         U7Pk1p++/PwSMX9p24kSpBrokKmJFPQh+wc8EG3wahtCjv5INuz1rxozpn6ye0lgaADx
         2hwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791141002; x=1791745802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59zywkqWAOH+Sf77rQKm1VSFzR6HE8w0Xnvh3qH53is=;
        b=xZvjTZoyNjadT5RC0vRqIH7rgd4lswaAPS3ZvS7VCIy4xhmYDy/eySH1wf0ECndrAs
         JORGDQLqaPEELYiyj+VdJCuuvffvzjlhlylkoAfrzNh7+GrHrR9wBw81RWToYhNNJKbW
         UBZ707w+erb7jrrUPhkUtCtnAhk+9Gb29mu/abFvL/xO9G5M0HC7Qf+ylDtWKEDRkXfn
         qVYDbMFCqISAnrgPFxFyVIqFlG5BT8gP4XqVQvUmCpY1sIBttoh4FkwSG8XunehJSpOX
         eWJibQKhK34JvNE93ouh4pDQ1kcfg8KieDodNXD6Fiw2EOEeXHxNNuPyN4B0wDdgVqeY
         wEpg==
X-Forwarded-Encrypted: i=1; AKwUvBzBd2iWPCsrj507P36hsaCasOS0K2Z1JpJcu5iPTxVinpHy7G3vsZ12I42MDgvLlXa/RNHgf1hH0qtyAdc=@vger.kernel.org
X-Gm-Message-State: AFuF++lLJwy0r9nO0D4rc8W5VKcy9P92lF8jc+AhVCVn5sY//Kasl86s
	0yEagp/xMCdsDUnWfwIdY2FjBW0UE7iJiuqVDHfHfBDmTsiDtceNawzMyC+nCV5cdo06bzWpo6o
	m8cLr0EmsS4e4tI+ai+BpsC50jNk80i6MR5KdpvfEHGLnZplcOJTreQYSAnIFL4jClU4=
X-Gm-Gg: AYBFou3yQtKTjdtCzTC2BwdPpCYQegtkve+oLMzpbZ+Saz262OZ7bGLACyrErTlS+h8
	msjDpn7AbdrtN1wE9wnu3d9MNBOfTgiY0BNibK4Oqk34eIHjojgIFkzRnx7UrlYZ/3Ac0bUJLvF
	PmVUSEmdZuZVw/WbfiOHH5BR8EpU+hK72LQCpk2koX56Bl7YOdfS5bZJf3Vfxoma+r5WYKirLIu
	3UQ+RNF75eqsgI+5QkwFDporw1lAZY9NAISq3iiIb4fwNxISItAxwBCXjRp8z8wHc27BnqapgNI
	ee+Chs5ikUjygqJIpjtkOvRzB5Wp+n+Qgkkyjs/8vrF9AsyX2Od3XzCNH2+jiEyT/d50nhKMXSE
	bfSa7LW+r90cFqu6UcDfBPJ52nnGVfz3MiWaq8cJJunuaHGbpP+SZJ6bo6ZQtLGGkqnuajz1zvg
	k5OJ819jOPM6Jrh1iS+veuRhZtleRBhpHfMAhnpw1gGC0ITznVlQ==
X-Received: by 2002:a05:620a:2682:b0:93b:cb64:25a5 with SMTP id af79cd13be357-93cb5a52e38mr2150126285a.12.1791141001572;
        Sun, 04 Oct 2026 12:10:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:93b:cb64:25a5 with SMTP id af79cd13be357-93cb5a52e38mr2150122585a.12.1791141001067;
        Sun, 04 Oct 2026 12:10:01 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([37.169.59.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm176318385e9.1.2026.10.04.12.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 12:10:00 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 04 Oct 2026 21:09:49 +0200
Subject: [PATCH 3/5] i2c: qcom-cci: Detect capabilities from CCI_HW_VERSION
 at runtime
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-cci-imp-v1-3-227d12cb4829@oss.qualcomm.com>
References: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
In-Reply-To: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=LroHWXdc c=1 sm=1 tr=0 ts=6ac2a48a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=1Gfya9YG+27Uq/30OuQ23A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8R-5LDRAFMUVkZqLBecA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: kSiK7cOjcf6OWGYhXrlnWWV38P_tDG0y
X-Proofpoint-ORIG-GUID: kSiK7cOjcf6OWGYhXrlnWWV38P_tDG0y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA3NiBTYWx0ZWRfXyxG/QajSUvb6
 kN9UaHf+dBKsRTUm45szjT7z6X2BVPtKERHtpjifNPQba7AMtqWxrktjTQAIHfFAblMIeAuvwta
 W9WF0Y5T6sh6LIpClkvLmL18dT6nGho=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA3NiBTYWx0ZWRfXykLyydtkx0HL
 isd9+NQxX21n1l8QeeMIuiMp7ZIS0c0OKcR3rSS/c4P/6jbK0HqzKRKnBCBX1x6YSUH2qat1khg
 r8hqaPTEbhy4t0CPU9UfiRnC9U6kFBmuSrM83/mGOCuSsGbhMmGfBgRvQTz7jXsHPSR+wGM5aYe
 ZlYaIFEf5dBB8CRLd0mqcUyEDMGc7gXaEAKZwJ8f87rdCr3o5dvAhwkpTDy1yytl9t/RbU/x3JQ
 9p5BHuI73loZ+41+36pAT70DLfSgmuVZX4NR2gxd702oOOo4xWBJUEeISF1KfNXePXe+/OTga1s
 DCqB0bmV1F9jRGAVs0W3cDrh5Ef6ViKWIBEIsqvcSnddZY2dPIDm0bs1QrMxhku9moDCuUGfCKz
 mxe6PjcrAvb+5Z/KoWyst2Gp8Fzbg2DM9QnGevzCoy0+jNn2juPld+ow26flJ+MKezI64WVJahX
 zMfp0JkoVvtUloTdLNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610040076

In theory, every SoC integrating a CCI revision that differs from
an existing one should introduce a dedicated compatible string.
In practice, most CCI instances still fall back to the msm8996
compat (v1.4.0), one of the oldest supported versions. In order
to take advantage of capabilities introduced in later versions,
such as larger queues (v1.6.0) or threshold IRQ support (v1.7.0),
we need to properly dinstinquish the different variants.

Replace the static per-compatible cci_data definitions with a
version-sorted capability table keyed by (hw_major, hw_minor).
During probe, read CCI hardware revision register and select
the newest capability entry whose version is less than or equal
to the detected hardware revision. This allows revisions to
automatically inherit the closest supported capability set
without requiring additional compatible strings.

Several compatibles that currently fall back to the msm8996
configuration (e.g. sdm845, sm8250 and sm8450) will now resolve
to the corresponding capability tier, gaining access to their
larger queue sizes instead of the conservative msm8996 defaults.

- v1.2.x CCI increase I2C write payload + burst write support
- v1.6.x CCI has increased queue sizes (64,16) -> (128,32)
- v1.7.x CCI introduces threshold IRQs (leveraged later)
- v1.10.x CCI increase queue 0 size (128) -> (1024)

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 158 +++++++++++++++++++++++++-------------
 1 file changed, 104 insertions(+), 54 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 099da0069251681cc52e351fb656bd73e78a96c9..c0b39d419e296454a083d38ce302940875b8ad2b 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -14,6 +14,10 @@
 #include <linux/pm_opp.h>
 
 #define CCI_HW_VERSION				0x0
+#define CCI_HW_VERSION_MAJOR(val)		(((val) >> 28) & 0xf)
+#define CCI_HW_VERSION_MINOR(val)		(((val) >> 16) & 0xfff)
+#define CCI_HW_VERSION_STEP(val)		((val) & 0xffff)
+#define QCOM_CCI_VERSION(major, minor)		.hw_major = (major), .hw_minor = (minor)
 #define CCI_RESET_CMD				0x004
 #define CCI_RESET_CMD_MASK			0x0f73f3f7
 #define CCI_RESET_CMD_M0_MASK			0x000003f1
@@ -133,7 +137,8 @@ struct cci_master {
 };
 
 struct cci_data {
-	unsigned int num_masters;
+	u16 hw_major;
+	u16 hw_minor;
 	struct i2c_adapter_quirks quirks;
 	u16 queue_size[NUM_QUEUES];
 	/* Highest I2C mode supported by this variant. */
@@ -144,6 +149,7 @@ struct cci {
 	struct device *dev;
 	void __iomem *base;
 	unsigned int irq;
+	unsigned int num_masters;
 	const struct cci_data *data;
 	struct clk_bulk_data *clocks;
 	int nclocks;
@@ -245,7 +251,7 @@ static int cci_halt(struct cci *cci, u8 master_num)
 	struct cci_master *master;
 	u32 val;
 
-	if (master_num >= cci->data->num_masters) {
+	if (master_num >= cci->num_masters) {
 		dev_err(cci->dev, "Unsupported master idx (%u)\n", master_num);
 		return -EINVAL;
 	}
@@ -371,7 +377,7 @@ static int cci_init(struct cci *cci)
 
 	writel(val, cci->base + CCI_IRQ_MASK_0);
 
-	for (i = 0; i < cci->data->num_masters; i++) {
+	for (i = 0; i < cci->num_masters; i++) {
 		int mode = cci->master[i].mode;
 		const struct hw_params *hw;
 
@@ -615,7 +621,7 @@ static int cci_get_required_rate(struct cci *cci, unsigned long *rate)
 	for (int ri = 0; ri < NUM_CCI_CLK_RATES; ri++) {
 		bool supported = true;
 
-		for (int i = 0; i < cci->data->num_masters; i++) {
+		for (int i = 0; i < cci->num_masters; i++) {
 			int mode = cci->master[i].mode;
 
 			if (!cci->master[i].cci)
@@ -690,6 +696,81 @@ static const struct dev_pm_ops qcom_cci_pm = {
 	SET_RUNTIME_PM_OPS(cci_suspend_runtime, cci_resume_runtime, NULL)
 };
 
+/* Hardware capabilities, ascending by version major,minor */
+static const struct cci_data cci_hw_catalog[] = {
+	{
+		QCOM_CCI_VERSION(1, 0),
+		.max_mode = I2C_MODE_FAST,
+		.queue_size = { 64, 16 },
+		.quirks = {
+			.max_write_len = 10,
+			.max_read_len = 12,
+		},
+	},
+	{
+		QCOM_CCI_VERSION(1, 2),
+		.max_mode = I2C_MODE_FAST_PLUS,
+		.queue_size = { 64, 16 },
+		.quirks = {
+			.max_write_len = 11,
+			.max_read_len = 12,
+		},
+	},
+	{
+		QCOM_CCI_VERSION(1, 6),
+		.max_mode = I2C_MODE_FAST_PLUS,
+		.queue_size = { 128, 32 },
+		.quirks = {
+			.max_write_len = 11,
+			.max_read_len = 12,
+		},
+	},
+	{
+		QCOM_CCI_VERSION(1, 7),
+		.max_mode = I2C_MODE_FAST_PLUS,
+		.queue_size = { 128, 32 },
+		.quirks = {
+			.max_write_len = 11,
+			.max_read_len = 12,
+		},
+	},
+	{
+		QCOM_CCI_VERSION(1, 10),
+		.max_mode = I2C_MODE_FAST_PLUS,
+		.queue_size = { 1024, 32 },
+		.quirks = {
+			.max_write_len = 11,
+			.max_read_len = 12,
+		},
+	},
+};
+
+static void cci_detect_hw_caps(struct cci *cci, u32 hw_version)
+{
+	u8 major = CCI_HW_VERSION_MAJOR(hw_version);
+	u16 minor = CCI_HW_VERSION_MINOR(hw_version);
+	u16 step = CCI_HW_VERSION_STEP(hw_version);
+	const struct cci_data *data = &cci_hw_catalog[0];
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(cci_hw_catalog); i++) {
+		if (cci_hw_catalog[i].hw_major > major ||
+		    (cci_hw_catalog[i].hw_major == major && cci_hw_catalog[i].hw_minor > minor))
+			break;
+		data = &cci_hw_catalog[i];
+	}
+
+	dev_dbg(cci->dev, "CCI HW version %u.%u.%u, using caps tier %u.%u\n",
+		major, minor, step, data->hw_major, data->hw_minor);
+
+	cci->data = data;
+
+	for (i = 0; i < NUM_MASTERS; i++) {
+		if (cci->master[i].cci)
+			cci->master[i].adap.quirks = &cci->data->quirks;
+	}
+}
+
 static int cci_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -705,8 +786,8 @@ static int cci_probe(struct platform_device *pdev)
 
 	cci->dev = dev;
 	platform_set_drvdata(pdev, cci);
-	cci->data = device_get_match_data(dev);
-	if (!cci->data)
+	cci->num_masters = (uintptr_t)device_get_match_data(dev);
+	if (!cci->num_masters)
 		return -ENOENT;
 
 	for_each_available_child_of_node(dev->of_node, child) {
@@ -719,14 +800,13 @@ static int cci_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		if (idx >= cci->data->num_masters) {
+		if (idx >= cci->num_masters) {
 			dev_err(dev, "%pOF invalid 'reg' value: %u (max is %u)",
-				child, idx, cci->data->num_masters - 1);
+				child, idx, cci->num_masters - 1);
 			continue;
 		}
 
 		master = &cci->master[idx];
-		master->adap.quirks = &cci->data->quirks;
 		master->adap.algo = &cci_algo;
 		master->adap.dev.parent = dev;
 		master->adap.dev.of_node = of_node_get(child);
@@ -777,10 +857,6 @@ static int cci_probe(struct platform_device *pdev)
 	if (ret && ret != -ENODEV)
 		return dev_err_probe(dev, ret, "failed to add OPP table\n");
 
-	ret = cci_set_core_rate(cci);
-	if (ret)
-		return ret;
-
 	ret = cci_enable_clocks(cci);
 	if (ret < 0)
 		return ret;
@@ -799,7 +875,11 @@ static int cci_probe(struct platform_device *pdev)
 	}
 
 	val = readl(cci->base + CCI_HW_VERSION);
-	dev_dbg(dev, "CCI HW version = 0x%08x", val);
+	cci_detect_hw_caps(cci, val);
+
+	ret = cci_set_core_rate(cci);
+	if (ret)
+		goto disable_clocks;
 
 	ret = cci_reset(cci);
 	if (ret < 0)
@@ -810,7 +890,7 @@ static int cci_probe(struct platform_device *pdev)
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	for (i = 0; i < cci->data->num_masters; i++) {
+	for (i = 0; i < cci->num_masters; i++) {
 		if (!cci->master[i].cci)
 			continue;
 
@@ -844,7 +924,7 @@ static void cci_remove(struct platform_device *pdev)
 	struct cci *cci = platform_get_drvdata(pdev);
 	int i;
 
-	for (i = 0; i < cci->data->num_masters; i++) {
+	for (i = 0; i < cci->num_masters; i++) {
 		if (cci->master[i].cci) {
 			i2c_del_adapter(&cci->master[i].adap);
 			of_node_put(cci->master[i].adap.dev.of_node);
@@ -856,51 +936,21 @@ static void cci_remove(struct platform_device *pdev)
 	pm_runtime_set_suspended(&pdev->dev);
 }
 
-static const struct cci_data cci_v1_data = {
-	.num_masters = 1,
-	.queue_size = { 64, 16 },
-	.quirks = {
-		.max_write_len = 10,
-		.max_read_len = 12,
-	},
-	.max_mode = I2C_MODE_FAST,
-};
-
-static const struct cci_data cci_v1_5_data = {
-	.num_masters = 2,
-	.queue_size = { 64, 16 },
-	.quirks = {
-		.max_write_len = 10,
-		.max_read_len = 12,
-	},
-	.max_mode = I2C_MODE_FAST,
-};
-
-static const struct cci_data cci_v2_data = {
-	.num_masters = 2,
-	.queue_size = { 64, 16 },
-	.quirks = {
-		.max_write_len = 11,
-		.max_read_len = 12,
-	},
-	.max_mode = I2C_MODE_FAST_PLUS,
-};
-
 static const struct of_device_id cci_dt_match[] = {
-	{ .compatible = "qcom,msm8226-cci", .data = &cci_v1_data},
-	{ .compatible = "qcom,msm8953-cci", .data = &cci_v2_data},
-	{ .compatible = "qcom,msm8974-cci", .data = &cci_v1_5_data},
-	{ .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},
+	{ .compatible = "qcom,msm8226-cci", .data = (void *)1 },
+	{ .compatible = "qcom,msm8953-cci", .data = (void *)NUM_MASTERS },
+	{ .compatible = "qcom,msm8974-cci", .data = (void *)NUM_MASTERS },
+	{ .compatible = "qcom,msm8996-cci", .data = (void *)NUM_MASTERS },
 
 
 	/*
 	 * Legacy compatibles kept for backwards compatibility.
 	 * Do not add any new ones unless they introduce a new config
 	 */
-	{ .compatible = "qcom,msm8916-cci", .data = &cci_v1_data},
-	{ .compatible = "qcom,sdm845-cci", .data = &cci_v2_data},
-	{ .compatible = "qcom,sm8250-cci", .data = &cci_v2_data},
-	{ .compatible = "qcom,sm8450-cci", .data = &cci_v2_data},
+	{ .compatible = "qcom,msm8916-cci", .data = (void *)1 },
+	{ .compatible = "qcom,sdm845-cci", .data = (void *)NUM_MASTERS },
+	{ .compatible = "qcom,sm8250-cci", .data = (void *)NUM_MASTERS },
+	{ .compatible = "qcom,sm8450-cci", .data = (void *)NUM_MASTERS },
 	{}
 };
 MODULE_DEVICE_TABLE(of, cci_dt_match);

-- 
2.34.1

