Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809643;
	b=aW0zA2t0HlMQS9eUA4u6Qdyr5i9Yl0YIcBHC79ZTWnJ+KGC5F3TtuuVzL9xDz9QiwBXG
	 A615QjoHjb+NVrRi1ANq0/QfIsWHBp3kuYBQX9mtaH7HZGbzuaBj2tOt6T+wd5jpKEFO1
	 Lo+eBW2SVzsGIkgcinEou66YeT8k0W8YszWDOBLRhBJlmbHe+Zx2kaHhKN0KNAmcRMoWJ
	 5yY6F07fUICCBGCO9B3ji2pHJH2l+meqdFLifpGHJtbc1Wd4vgYvDWej1KrD5WF3pmcRk
	 eNNU9OsVwgx0f0vELRTyCAjXImyCqII1mTXexecRmHryfReVLfiUXiJX3a1QJEqFRJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809643;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6w2wZrYLW8QCNl+5T9joDueswIFQX8PDG+kYC3D+80Y=;
	b=DbMicaXbXsjYyR6xpGXLxqdIjA45ZkcU2EsuirFPVQN6ktIjMxo363M0e4Q27OgRdTDL
	 Ao+Qx1/OT4c0MNvDPfE4KRw6ObldVTRlmjtYDYz+PngiqPq9rmI2HjiGG/+TIxO/oxil6
	 YSs0s2fjT5aX3k2gKwzcS61dISOgsxLzpppJasqE/VUcxZzzyFLkVasBiaa36FbVhcj8k
	 I47q2N/svzAb9rTZvLGjc0x2++1jLnZzt3r7kqSdnlytjPox9Rm1AVutd5zrHO+WB3qMa
	 3EeXvpAmR7RtNvnQwK5FyUvBa+i2SvHHx9iStRAbNjPiPXNFSyAAsVcm4cZKB8Kap5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SRngTkA+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kH/mBRSB";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97254606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97254606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SRngTkA+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kH/mBRSB
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LbqM3839121
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6w2wZrYLW8QCNl+5T9joDueswIFQX8PDG+kYC3D+80Y=; b=SRngTkA+eY328LKS
	Lip6yzCPznf1exoTsgT1AF/+3c6SEQeM/1el6fArQ1fvUCCAEoSAynpiRkJrXZyF
	CusnmHfTfPnCps2RZGGw3ZLxo7j4z3Y4ENPlZU9AawQ+jHiH5bpa+pmpUKXLeIUR
	pbBHFg4bLlkbmv2PRIcIWlz0hYZbFdmwOOPDBwCG9D5zQeT668WxajHr8qphtKgV
	JJQYdnHxLJhLF/aM92RXPNO7p8t+4G3KJXCJ2ustkxRkTeS1+Y0ytwojVbCvPRV3
	mTQnCBK+Dj+QZUUkjCrnIYADd7p0/zNX4k/A9rAejqXpX5LmseApZ/2Jf6vqcyvw
	ucZmIw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhn0s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:14:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so3924993a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809641; x=1795414441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6w2wZrYLW8QCNl+5T9joDueswIFQX8PDG+kYC3D+80Y=;
        b=kH/mBRSBlPDdR1ZL4PxDkQ8PJRHYzKLvCNWwkW8M2yP1Fn4SQo2zUqJfLPrlnW71j0
         XxjmcYb9MfdOztZmUA+d4D4lNFAJylH/5tI9lbCUJ/FzQ1u7rjiz55nFoFpCHUSb7qHj
         eTviN7Gh7J9YnWHvOdMU5Ab82qebSRzYb5ZmqMaVutJ9pnsB+AcNiGdVnxl2bX4InZSp
         GqavkKubJDDfT1DrKSFM9bSGrhtykiW/eWhlO91sWs1VEqI0DBbd8yY42y6jbgsezLKr
         iz4RZX4SIxmp7dzn7ElsE/QviTiuy9/1OdEU4Er9Q8aAOv2+TRriJYzZnuIaE/w+XOt/
         KVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809641; x=1795414441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6w2wZrYLW8QCNl+5T9joDueswIFQX8PDG+kYC3D+80Y=;
        b=qM0c9k9o1wgil66MfpzbVnNrTCPB7MTOnyZU9rB6agUi6ggb8QkH2YQxhUXNiwdmrO
         meqqW8x6GL3VmOFx3o91O+4YOEJmc/I++E6CGUuubdTiZcf6yno5MN/qXK2o9UYCa0wV
         mPfS9Mvfru8TXBFvGTR3+1LLzcbsaTtGjEyOW0nf4tmDH3EKwbxIJXH2iEnuzVMcmyd1
         EXlMMz5nSTfDeYhfq/Hq20jXL8TpD1ZbsQFQH3gfznILfwOimGCtRnSg1ZXihPeTiV7H
         aGPQnQLqbaxA68OE3ahUVE6u2Oq8i3+0ELqgIH835eMvpTVFfGt1YQ2HPtKNB3PTTb7T
         CdnQ==
X-Forwarded-Encrypted: i=1; AL+hErGQBddUs992FEPbVeqVXYqLcNrrSHFDIP2YkTdWwmISo4MxWC9bzVg6PJ+tN12jakZ+z4cHKQp2BjGqU+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MNxZm/gG0iPf7DTOSzirw9uFlTwyeVEM5gk0b13eUNkZ0LiZ8
	nabgVx3fTA8uqrXH1WU7mDGjOnZxn/V18j4Z2za1TDY8PMhKnLOMnuLpueHQmCwSSnFjaa2GgbN
	XcMq9GVtyxg0Y0sEPPu3yt8mUYdXJ7ysIRWrRvslOdcaf0k3PyD8wPyQugODqdpqG6xY=
X-Gm-Gg: AZFdTZeuOhIbvqDAzpgwD10+tt4GRVdhoxk57wc0RGBfBJP5JEBlK7blmi6O9e6Du5O
	U/7qtthubPNss8/Z8aFyiHWdFug9BOLc6bt3At8y41BllNjbINNJyC+be7RpKcK8AvI/N/+CwTo
	v3axsZ63pGKwc+MbpfvFPwxZUKNy0Mt42iW6cjk+vP9KrdJ0BH3n4rwl2TP7FhslM/Rlf6qNAkq
	m0sH5XdufJcZcoRHqP9TVveVLsVORkfN+SyjZRyoCw3QUaXZbdbvdBxCx8zU7tFfOCbM83/hh3P
	cMGud77hEJMiqaiFSNVpwthJWBEPDgqyCvHlCW2akZfiUHw/1OJ0JMsd5CNxb9eG8osGLMVyOxU
	OhIjsaLrPAtFVUOHUly31PzHIzD2BaO5WuhxDe4HW7JzO1GdhvZWxgD8SdPeW8qjgrd6A
X-Received: by 2002:a17:90b:4c8f:b0:3ad:7f4d:2839 with SMTP id 98e67ed59e1d1-3b1b0b5c3cfmr6107427a91.14.1794809641042;
        Sun, 15 Nov 2026 22:14:01 -0800 (PST)
X-Received: by 2002:a17:90b:4c8f:b0:3ad:7f4d:2839 with SMTP id 98e67ed59e1d1-3b1b0b5c3cfmr6107411a91.14.1794809640535;
        Sun, 15 Nov 2026 22:14:00 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:14:00 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:21 +0530
Subject: [PATCH v5 3/7] regulator: pm8008: Add mode voting support for
 PM8010
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
Message-Id: <20261116-pm8010_i2c_support-v5-3-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
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
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=6336;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=sLgFxdoZSlOfW2ww3mFNg4KJkHeH9NXGs/EKYxEsFL0=;
 b=vspQyX/ef8iwiXI5HGjCF4QeOaVoNMexIW22U0jr8V+G2ktLEjTIvjNxgdRm5uAWKrh7iq+0+
 I8FQNLJv6n6BB/limXFfBsLGkwPa+LlX8ChSMmrvaIvS7pbm8kk4kFK
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: Yz5VS-V9M9bXQcmfqI37EDQ6BNBjNI5B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX2Ucr4YfbdGLD
 bxzmuWX3JIfU3RjDDxuLHTHS1ewll+rETYCU8V9qClhfKjV73dzpvFLQF3BUEMmgy2XHhS/qUsG
 PHmc8PCR5CPjtEqSAdDIaBoWTXJ9hFA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX6+U8IKNk8cuy
 1z0d4HiftCiIjSu1Vm9SZJ02eVCrVmx/XFDJhrduJN3UkouieaUUI1BNxX7ZzDH2d6OKcgtV6P8
 S/L5HP4CgWtSuijOGsTzLyTgN7QAfdEGytaDB+ZexHWdKH5Xhqv6nNp40h7+X9o8mzxP1nbOQjQ
 dgojCGV01mAlpHV6pVtLC9YXCx1tjYHaTuJrslEoKSXnebc7W3qz6Vdp2sByTg7EI4kfMOekcZI
 ViIu1YM/Y6TyyQOdARnTaE/+yTEO3NmCItNT78Zw73XflQNjd1bcbX9PLtRdTizVrPnxLRcr5Lj
 qopTfLqlw8+raSM8BxmWnwfg2EFDG0ofNfqXTREZNN0GmswC0brMpDr4uIF7Yro9C6eVlRTsaxf
 EKXqciYBXK36qzVEevDoetad3uecHYXO0HDHRFcO4iI7vitezt9f4k2sLBrD2YZ6AVUJklmns/Y
 HDkfobAP3aOlm3asFKw==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afa9f29 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9b6pvoUWzmwS3gtn3D8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Yz5VS-V9M9bXQcmfqI37EDQ6BNBjNI5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Implement set_mode/get_mode/get_optimum_mode support for PM8010 LDOs
using the mode control and status registers to allow clients to vote
for LDO modes. Mode voting is supported for L1 and L2 alone of PM8010
LDOs and not supported for any of the PM8008 LDOs.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-pm8008-regulator.c | 102 ++++++++++++++++++++++++++++--
 1 file changed, 98 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index 0ea4ac016dc2..b7769b3dfc45 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -24,6 +24,13 @@
 
 #define LDO_VSET_LB_REG			0x40
 
+#define LDO_MODE_CTL1_REG		0x45
+#define MODE_PRIMARY_MASK		GENMASK(2, 0)
+#define LDO_MODE_NPM			7
+#define LDO_MODE_LPM			4
+
+#define MODE_CHANGE_UNSUPPORTED		0
+
 #define LDO_ENABLE_REG			0x46
 #define ENABLE_BIT			BIT(7)
 
@@ -31,6 +38,7 @@ struct pm8008_regulator {
 	struct regmap		*regmap;
 	struct regulator_desc	desc;
 	unsigned int		base;
+	int			hpm_min_load_uA;
 };
 
 struct pm8008_regulator_data {
@@ -40,6 +48,7 @@ struct pm8008_regulator_data {
 	int				min_dropout_uV;
 	const struct linear_range	*voltage_range;
 	int				n_linear_ranges;
+	int				hpm_min_load_uA;
 };
 
 struct pm8008_match_data {
@@ -71,8 +80,12 @@ static const struct linear_range pm8010_pldo_lv_ranges[] = {
 	REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
 };
 
-#define PM8008_REGULATOR(_name, _supply, _base, _dropout, _range)	\
-	{ _name, _supply, _base, _dropout, _range, ARRAY_SIZE(_range) }
+#define PM8008_REGULATOR(_name, _supply, _base, _dropout, _range)    \
+	{ _name, _supply, _base, _dropout, _range, ARRAY_SIZE(_range), \
+	  MODE_CHANGE_UNSUPPORTED }
+
+#define PM8010_REGULATOR(_name, _supply, _base, _dropout, _range, _min_load)    \
+	{ _name, _supply, _base, _dropout, _range, ARRAY_SIZE(_range), _min_load }
 
 static const struct pm8008_regulator_data pm8008_reg_data[] = {
 	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 225000, pm8008_nldo_ranges),
@@ -84,9 +97,10 @@ static const struct pm8008_regulator_data pm8008_reg_data[] = {
 	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 200000, pm8008_pldo_ranges),
 };
 
+/* LPM setting is supported for only N-type LDOs of PM8010 (L1 and L2) */
 static const struct pm8008_regulator_data pm8010_reg_data[] = {
-	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges),
-	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges),
+	PM8010_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges, 30000),
+	PM8010_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges, 30000),
 	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 80000, pm8010_pldo_lv_ranges),
 	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 80000, pm8010_pldo_lv_ranges),
 	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 296000, pm8010_pldo_ranges),
@@ -134,6 +148,69 @@ static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
 	return regulator_map_voltage_linear_range(rdev, uV, INT_MAX);
 }
 
+static int pm8010_regulator_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
+	unsigned int val;
+
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
+		val = LDO_MODE_NPM;
+		break;
+	case REGULATOR_MODE_IDLE:
+		val = LDO_MODE_LPM;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(preg->regmap, preg->base + LDO_MODE_CTL1_REG,
+				   MODE_PRIMARY_MASK, val);
+}
+
+static unsigned int pm8010_regulator_get_mode(struct regulator_dev *rdev)
+{
+	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(preg->regmap, preg->base + LDO_MODE_CTL1_REG, &val);
+	if (ret < 0)
+		return REGULATOR_MODE_INVALID;
+
+	switch (val & MODE_PRIMARY_MASK) {
+	case LDO_MODE_NPM:
+		return REGULATOR_MODE_NORMAL;
+	case LDO_MODE_LPM:
+		return REGULATOR_MODE_IDLE;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
+static unsigned int pm8010_regulator_get_optimum_mode(struct regulator_dev *rdev,
+						      int input_uV, int output_uV,
+						      int load_uA)
+{
+	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
+
+	if (load_uA >= preg->hpm_min_load_uA)
+		return REGULATOR_MODE_NORMAL;
+	else
+		return REGULATOR_MODE_IDLE;
+}
+
+static unsigned int pm8010_regulator_of_map_mode(unsigned int mode)
+{
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
+	case REGULATOR_MODE_IDLE:
+		return mode;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
 static const struct regulator_ops pm8008_regulator_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
@@ -143,6 +220,18 @@ static const struct regulator_ops pm8008_regulator_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 };
 
+static const struct regulator_ops pm8010_regulator_mode_set_ops = {
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
+	.get_voltage_sel	= pm8008_regulator_get_voltage_sel,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_mode		= pm8010_regulator_set_mode,
+	.get_mode		= pm8010_regulator_get_mode,
+	.get_optimum_mode	= pm8010_regulator_get_optimum_mode,
+};
+
 static int pm8008_regulator_probe(struct platform_device *pdev)
 {
 	const struct pm8008_match_data *match_data;
@@ -186,6 +275,11 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 		desc->of_match = data->name;
 		desc->regulators_node = of_match_ptr("regulators");
 		desc->ops = &pm8008_regulator_ops;
+		if (data->hpm_min_load_uA) {
+			desc->of_map_mode = pm8010_regulator_of_map_mode;
+			preg->hpm_min_load_uA = data->hpm_min_load_uA;
+			desc->ops = &pm8010_regulator_mode_set_ops;
+		}
 		desc->type = REGULATOR_VOLTAGE;
 		desc->owner = THIS_MODULE;
 

-- 
2.43.0

