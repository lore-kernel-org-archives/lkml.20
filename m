Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F9943E067
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768884; cv=none; b=G6P/XgRJWL3ljbumPCyv8RGGW4G1C4T37DD7/+f1oRdOEJ03lrUuuupz/BOcMFkpgngHDHmwyFNkAdNk4Iq5KSIxRA9Sr6Iqu/t2OlWfri6Y2LXcFZUraILNfwp0Es2SlQjm1sRF8Zipjlh6DVwQOnwdyTfAw4Cc6IJFZa0Px7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768884; c=relaxed/simple;
	bh=TgC/RkbhJ7vKUyUL9N0dsXA90G09kSlE8ntHvVa5CC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPd6WyENLLUeB/uMlehCf8f29BUNyQtbo6rZK402O27IvJ2/lvItQk21qNaaiTFSKg6P7xwS6UvShG0uOHStrZm+YbFCHm9UScJnTnkkZv1TeuqduShVwuASZlSCY92ekSBrg+UCySX1XTITjKYxfQH51Tk3eWJqQu6nUK/X2Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2gUVCD8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McHf76uv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2gUVCD8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McHf76uv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777dIq3903329
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6n4aVS99yYRnFm88ofoKkQ5lAy+OyD29BpZxJOtYUs0=; b=S2gUVCD8btN9U+Tc
	h3EXNpuzRHINosHnW62tGU2xaXMO5MW92qqAnkrEXwGI6iU8fE8ykbI3WNrnyI/g
	w975sFt/13Kxy0bifDNb+2qrB+nrnCMUP9joEIXA0GPwKYLdit+IdWrMB5WdJ+AS
	i6/lBfReGg9ARXxaZ+ZWH0fhpFKXKmWDQzSwVkNxgSU9Zh70dvwvtcmQkJ57TfOR
	39XGrEHoMVApOQtCGmMDk9+KhrIX7F1nrZZLy7V8DFeK8M+4OIZMWKDBx07QHRw2
	m7Ta0xResrQlIWw1X1PIZde+fBG4jKbY7ObKl3jfQgyZHT2ikpq4eespgWyA2Flq
	pGX0UA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany5ubc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:14:41 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1b8b593a4so3351283eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768881; x=1789373681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6n4aVS99yYRnFm88ofoKkQ5lAy+OyD29BpZxJOtYUs0=;
        b=McHf76uv0RHyV2VQeLQ3/1zjdXiNcpzlwvAz/qpPJ/N8lOnQwLw0JK/NEhfY45KmK2
         i7G62qjH11dHyuoQkoFM312T0aug9luJk5Y1eyHcKbf9LHX04GS6SALO5dkno7n0u2qq
         iGatRIRfm1Z0y9MrN1tB2d3XigBcv4XVz57I8/MTxMid86Bx1rH1k1aKJBibbLIV9EHL
         GPQYOV5Q0o5zZu35mzQkMq1eYdIFWkJgVwhsdV1owXRRBwvjM47SKkK9TC6pitOoNGr4
         wMB7aFgRm5peyQIQJUVrD0wpOMgJhDdx5qbWj+B8Xkf6sxot5+J7yFajOVRSPCa+BaP9
         YWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768881; x=1789373681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6n4aVS99yYRnFm88ofoKkQ5lAy+OyD29BpZxJOtYUs0=;
        b=dNxglhM/aYSs+GGdlUk+5QDFoT8RfExTDo53u8WbqmQkPj0hclnC3AGjUvRAmj8RmG
         6JhrMWK5CzwoM3R5RxoKYw9Y86oKGWFj9gs9oasCsmqiOgoAh4A1wgkYx3kwZOZrfmUB
         1vzEs8f929Dg+tvqCid6Pz1Ax6mqCXgGRm5TGXbz+d1V3a7xWTMWxAJOuaXN+otJHAdd
         opubARVzlMvehcfrvaFpH1oe8LEX/rTZfwwjLVFEYMcEAeplTmOnOlukaVFcGSMopdj4
         3eBhQ1LT/Dzm3HKsxYPOJmwkWzdc4Z6xz5cSdDRNwhgo0go9r7bxmTJurlmXX8OsKbXF
         ry9g==
X-Forwarded-Encrypted: i=1; AKwUvByhWdWmJBni/eB5JBgSRSn+1462tOZDnxFvA3bjcKdTaUaQ61is5C80HVPy8P+L5RjLLYz6Lq6QVCMLMvM=@vger.kernel.org
X-Gm-Message-State: AFuF++nvBDm0o6OnK3+jnjq19oW46v8ZeaN5yJasQ++CGTbtjezwTd6j
	coEcEOK9F/3pE8iysaeus/XLsMq72DaE+UUctP6LInZYUKMgOTAc5M4WTt+FtTfU2Wzd8Wq0mAt
	BI+e+o5wBb9WCkb86SoR1jiePBrS87Mb/D5RaBDIF4f9/jkQ2w8xsPpEQuvCRNT1QoxQ=
X-Gm-Gg: AYBFou1/tQ5f3QRX2NA1w0kBkli0qMnShl7o/V36+wjPHesOl2IQ2GTmmVpifeGBiyM
	OuU7cDjXqFDqqGC3+AKGQVtLmcfKVYB/vnWnNL1c8XribJordZ2YLUtmRckrJMlFQJYlqsR+SLm
	BELkO2CHHiuKyQC0vrEHT3qMkqXyjeSWDSpVhb2d+eDdgFbEXpz/vXlK61UUdK1QIn33OEEXwk/
	I45KCBQ8ihn9NOAEF2x3HgI4H7ZGp+BjybokV0JCMdbyS671a/Au9YPimdArgQsBI+dUDYDp2cO
	1V5XBc0lYxDgzDGVug7nJ/PNR6MyTnSxbcvushdQgCNpEvq39lkWxkOkQzY3G1hM5d/gp0/8dIU
	UHTW4bYf4cIv4LmS8hqwo8VAgSx/7Edc=
X-Received: by 2002:a05:6820:4c16:b0:6b7:83d6:2933 with SMTP id 006d021491bc7-6b783d62fb5mr9684818eaf.54.1788768880891;
        Mon, 07 Sep 2026 01:14:40 -0700 (PDT)
X-Received: by 2002:a05:6820:4c16:b0:6b7:83d6:2933 with SMTP id 006d021491bc7-6b783d62fb5mr9684786eaf.54.1788768880464;
        Mon, 07 Sep 2026 01:14:40 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm21724220c88.6.2026.09.07.01.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:14:40 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:43:42 +0530
Subject: [PATCH v2 6/6] regulator: qcom-pm8008-regulator: Add support for
 PM8010 PMIC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss-v2-6-75f7982dc983@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788768826; l=10721;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yixS+paItpbPG3dnBLS1VUcjAcCmN8R25JH8onqgK0M=;
 b=AshxnNJuhZqt/olXhrP/gDHUkv4390f/hueQU2nS0RTBb+OYBxulCEwtpLNI/q7lr/RKkziFm
 vQDe1xFl4/lBXtix2UFTzuaMZtkbCKguXrjMj36aKBp4GG65X++6dtG
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9e7271 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AkqyrZD3AtcrQouKZzQA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: tQDeoRJe2ZUUd30HkA82gghjfJE-JZoA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX1CQGZZ+Q7Umy
 uZwRMOLd+FVf5aAcffPFGPxjS/oX6sHEAj760g+/BTaxq8OLV0ORDRaEhNBiN0QZrFPKJBJf7vT
 e0X7wzQPmrplm1BDGhUl4iNKJzJTSsmQrxriptH47NBhXpCFGi3jGWbxD0vIyg4xHsoNaPfqCHa
 LVXpNNkP2Me4bc09XVVc7T2W6CUaL64qqTpF26WZp1O4y7rJZc/RW+pAPHgS0u0DKL0eqpdTESC
 lrVq45glBcoPcGSWaIPyXrSV+xrlUtck9s4FvQzew8wWD/RWAvMvcraH7zOqKBiLEpP/Ysl/cze
 4Mfo3Zum8fy6+ZUIeflDRCTABi9u49q8uhp3jr8Ytl3Ao6QZPGjvq8XuWb1RASmi3Z0CRMpLZKY
 37tLLJUjd+mp6VumjKN01VsF23QqggD0qwdhdvMpSw4UZ6PUT5tbQUqBW4MQh8WEgclKm0T1A6o
 1kzCm8RKChzUIuUFC9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX+ELL2yLIr/Rl
 gUUBsg5ZGMfNQEgZGLM2lqFy+fgxKA7IA0QvGpGtz0wXtmP/GJnHnYnKlB4t1QnUqh/9rJjCdC2
 AQDwICik+Y6bJES4xOigL/ESYEU6Chc=
X-Proofpoint-GUID: tQDeoRJe2ZUUd30HkA82gghjfJE-JZoA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070088

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

The PM8010 is a variant of the PM8008 PMIC with additional LDO
regulators, a wider voltage range on some LDOs, and LPM/NPM mode
support. Add PM8010 regulator data tables and voltage ranges, and
implement set_mode()/get_mode() for switching between LPM and NPM.

Detect PM8010 via the parent I2C client's compatible string and
select the matching regulator_ops and register data accordingly.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/regulator/qcom-pm8008-regulator.c | 184 ++++++++++++++++++++++++++----
 1 file changed, 159 insertions(+), 25 deletions(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index 9c9b8be2e15a499fa61a05cc9650338d0bbcd122..87807d5d9e8fdbbe422202156bcbf1d0e3fbc155 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -8,6 +8,7 @@
 #include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/device.h>
+#include <linux/i2c.h>
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -24,9 +25,19 @@
 
 #define LDO_VSET_LB_REG			0x40
 
+#define LDO_MODE_CTL1_REG		0x45
+#define MODE_PRIMARY_MASK		GENMASK(2, 0)
+#define LDO_MODE_NPM			7
+#define LDO_MODE_LPM			4
+
 #define LDO_ENABLE_REG			0x46
 #define ENABLE_BIT			BIT(7)
 
+#define LDO_STATUS1_REG		0x08
+#define MODE_STATE_MASK		GENMASK(1, 0)
+#define MODE_STATE_NPM			3
+#define MODE_STATE_LPM			2
+
 struct pm8008_regulator {
 	struct regmap		*regmap;
 	struct regulator_desc	desc;
@@ -39,24 +50,59 @@ struct pm8008_regulator_data {
 	unsigned int			base;
 	int				min_dropout_uV;
 	const struct linear_range	*voltage_range;
+	int				n_linear_ranges;
+};
+
+struct pm8008_match_data {
+	const bool has_stepper_ctl_reg;
+	const struct pm8008_regulator_data *regulator_data;
+	const int num_regulators;
 };
 
-static const struct linear_range nldo_ranges[] = {
+static const struct linear_range pm8008_nldo_ranges[] = {
 	REGULATOR_LINEAR_RANGE(528000, 0, 122, 8000),
 };
 
-static const struct linear_range pldo_ranges[] = {
+static const struct linear_range pm8008_pldo_ranges[] = {
 	REGULATOR_LINEAR_RANGE(1504000, 0, 237, 8000),
 };
 
+static const struct linear_range pm8010_nldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(528000, 0, 127, 8000),
+};
+
+static const struct linear_range pm8010_pldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
+};
+
+static const struct linear_range pm8010_pldo_lv_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
+	REGULATOR_LINEAR_RANGE(2608000, 3,  28, 16000),
+	REGULATOR_LINEAR_RANGE(3104000, 29, 30, 96000),
+	REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
+};
+
+#define PM8008_REGULATOR(_name, _supply, _base, _dropout, _range)	\
+	{ _name, _supply, _base, _dropout, _range, ARRAY_SIZE(_range) }
+
 static const struct pm8008_regulator_data pm8008_reg_data[] = {
-	{ "ldo1", "vdd-l1-l2", 0x4000, 225000, nldo_ranges, },
-	{ "ldo2", "vdd-l1-l2", 0x4100, 225000, nldo_ranges, },
-	{ "ldo3", "vdd-l3-l4", 0x4200, 300000, pldo_ranges, },
-	{ "ldo4", "vdd-l3-l4", 0x4300, 300000, pldo_ranges, },
-	{ "ldo5", "vdd-l5",    0x4400, 200000, pldo_ranges, },
-	{ "ldo6", "vdd-l6",    0x4500, 200000, pldo_ranges, },
-	{ "ldo7", "vdd-l7",    0x4600, 200000, pldo_ranges, },
+	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 225000, pm8008_nldo_ranges),
+	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 225000, pm8008_nldo_ranges),
+	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 300000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 300000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 200000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo6", "vdd-l6",    0x4500, 200000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 200000, pm8008_pldo_ranges),
+};
+
+static const struct pm8008_regulator_data pm8010_reg_data[] = {
+	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges),
+	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges),
+	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 296000, pm8010_pldo_ranges),
+	PM8008_REGULATOR("ldo6", "vdd-l6",    0x4500, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 296000, pm8010_pldo_ranges),
 };
 
 static int pm8008_regulator_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
@@ -99,8 +145,53 @@ static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
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
+	ret = regmap_read(preg->regmap, preg->base + LDO_STATUS1_REG, &val);
+	if (ret < 0)
+		return REGULATOR_MODE_INVALID;
+
+	return (val & MODE_STATE_MASK) == MODE_STATE_NPM ?
+		REGULATOR_MODE_NORMAL : REGULATOR_MODE_IDLE;
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
-	.list_voltage		= regulator_list_voltage_linear,
+	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
 	.get_voltage_sel	= pm8008_regulator_get_voltage_sel,
 	.enable			= regulator_enable_regmap,
@@ -108,8 +199,20 @@ static const struct regulator_ops pm8008_regulator_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 };
 
+static const struct regulator_ops pm8010_regulator_ops = {
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
+	.get_voltage_sel	= pm8008_regulator_get_voltage_sel,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_mode		= pm8010_regulator_set_mode,
+	.get_mode		= pm8010_regulator_get_mode,
+};
+
 static int pm8008_regulator_probe(struct platform_device *pdev)
 {
+	const struct pm8008_match_data *match_data;
 	const struct pm8008_regulator_data *data;
 	struct regulator_config config = {};
 	struct device *dev = &pdev->dev;
@@ -117,15 +220,28 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	struct regulator_desc *desc;
 	struct regulator_dev *rdev;
 	struct regmap *regmap;
+	const struct platform_device_id *id;
 	unsigned int val;
+	bool is_pm8010;
 	int ret, i;
 
+	id = platform_get_device_id(pdev);
+	if (!id)
+		return dev_err_probe(dev, -ENODEV, "Missing platform device id\n");
+
+	match_data = (const struct pm8008_match_data *)id->driver_data;
+	if (!match_data)
+		return dev_err_probe(dev, -ENODATA, "Missing driver match data\n");
+
 	regmap = dev_get_regmap(dev->parent, "secondary");
 	if (!regmap)
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(pm8008_reg_data); i++) {
-		data = &pm8008_reg_data[i];
+	is_pm8010 = of_device_is_compatible(to_i2c_client(dev->parent)->dev.of_node,
+					    "qcom,pm8010-i2c");
+
+	for (i = 0; i < match_data->num_regulators; i++) {
+		data = &match_data->regulator_data[i];
 
 		preg = devm_kzalloc(dev, sizeof(*preg), GFP_KERNEL);
 		if (!preg)
@@ -140,23 +256,28 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 		desc->supply_name = data->supply_name;
 		desc->of_match = data->name;
 		desc->regulators_node = of_match_ptr("regulators");
-		desc->ops = &pm8008_regulator_ops;
+		desc->ops = is_pm8010 ? &pm8010_regulator_ops : &pm8008_regulator_ops;
+		if (is_pm8010)
+			desc->of_map_mode = pm8010_regulator_of_map_mode;
 		desc->type = REGULATOR_VOLTAGE;
 		desc->owner = THIS_MODULE;
 
 		desc->linear_ranges = data->voltage_range;
-		desc->n_linear_ranges = 1;
-		desc->uV_step = desc->linear_ranges[0].step;
-		desc->min_uV = desc->linear_ranges[0].min;
-		desc->n_voltages = linear_range_values_in_range(&desc->linear_ranges[0]);
-
-		ret = regmap_read(regmap, preg->base + LDO_STEPPER_CTL_REG, &val);
-		if (ret < 0) {
-			dev_err(dev, "failed to read step rate: %d\n", ret);
-			return ret;
+		desc->n_linear_ranges = data->n_linear_ranges;
+		desc->n_voltages = linear_range_values_in_range_array(desc->linear_ranges,
+						      desc->n_linear_ranges);
+
+		if (match_data->has_stepper_ctl_reg) {
+			ret = regmap_read(regmap, preg->base + LDO_STEPPER_CTL_REG, &val);
+			if (ret < 0) {
+				dev_err(dev, "failed to read step rate: %d\n", ret);
+				return ret;
+			}
+			val &= STEP_RATE_MASK;
+			desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
+		} else {
+			desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE;
 		}
-		val &= STEP_RATE_MASK;
-		desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
 
 		desc->min_dropout_uV = data->min_dropout_uV;
 
@@ -179,8 +300,21 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct pm8008_match_data pm8008_data = {
+	.has_stepper_ctl_reg = true,
+	.regulator_data = pm8008_reg_data,
+	.num_regulators = ARRAY_SIZE(pm8008_reg_data),
+};
+
+static const struct pm8008_match_data pm8010_data = {
+	.has_stepper_ctl_reg = false,
+	.regulator_data = pm8010_reg_data,
+	.num_regulators = ARRAY_SIZE(pm8010_reg_data),
+};
+
 static const struct platform_device_id pm8008_regulator_id_table[] = {
-	{ .name = "pm8008-regulator" },
+	{ .name = "pm8008-regulator", .driver_data = (kernel_ulong_t)&pm8008_data },
+	{ .name = "pm8010-regulator", .driver_data = (kernel_ulong_t)&pm8010_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, pm8008_regulator_id_table);

-- 
2.34.1

