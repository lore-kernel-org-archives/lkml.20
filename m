Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D0344E67D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137623; cv=none; b=VeOdYLEflbBN9Jmu9/t07Uff6TGPJGD5N+u81cUhlb33gNFH4wG1Tm9iAfxOUw7l72raB4xGv65QHcS1OAuSVQfjO9xXYsZTC8J2Ml7PfWE7D+OXaEBvpY/jj4BhMg2jm+fFMY51kf8oS536yU2hjeZq0rgNq085ouKZ8lwMqrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137623; c=relaxed/simple;
	bh=JHMRgb/tsqfA2d4k3ixuxCWNkrTgOGRpGeXlD1jle00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jRwS/D9UY5nE9N1Et1+a5+ULa+4+YDdCJtHM5y6oeg2bMHGbP8gy0krUHTwHgRdqDrjW5LMLx9GoOdpwD70ycsDemnwgbKN1T5W2K5TFe2nooHjrhB+LJqkeYtLbY8qKRXBHN5B0orDjrVeHwy3O6YHzOGJ/07ci1NT3JmSXxUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i3zkCdLa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFJ1/8R0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i3zkCdLa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFJ1/8R0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G6ror43493212
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hsCa6xfL5zw39sMwap5EaPIJ2vJbQGrHr+jUTR7bviM=; b=i3zkCdLaBK6ssTgr
	vBTY+xslqkyBXh4UuTIeiPwrhtutkbZ7a/VyN3GRRZfJtBqFm40AFwyC91zjXctr
	Cz1JsCfTmCspXxYWcxq+tF7mYGQD321L7ne65bq6uqlSVI4F9EV9vJfzw4CetvcK
	Y82MyJeqL4HQlfVuUmDtxABuBPAbae2GRwZuAkqbm+Zu9A+hTt/Wz/PMNYliV7LG
	fhoGfcJJZr33QzQn6mw7TypLCDRI4g0tTA+FkIam4LZsLTG9xqQdxWW6pz26OAe6
	w6eUM6guaXGdC85QY1pfqrHLq4Dwh8Gk8/Cj00BQVYa6OzBzKn6WV/K9X/Ks9C/+
	cqxHlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wu7rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8067974so1443837985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792137618; x=1792742418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hsCa6xfL5zw39sMwap5EaPIJ2vJbQGrHr+jUTR7bviM=;
        b=RFJ1/8R0bKEW79JUsqVqjnIY9DmpZweXBtbctCbSKDgtYc7n7N8Wz+HprFdlvu2B9o
         I9AnWmXyzrazcCwnLeoaROWSsCOzIrwnVAhfmrRLSB2LEBw5tgr6gsc9EsD+Z4f9oA8a
         oKvPYrmw8Nhz6OnzkTJEd7Ts5MzSV37W6TvgwylCDx/hcl/ZQqBj5xb16tVMCbG+H0+u
         z0zLKZxQ9KxnnhuJCo5KVr17+sUrrS6WDcLK6NSONweXbkBViNSBEvo48iGdx4AZZuVm
         aOzq1+irZYyz4YuQ8cMGq0vfsuYknonkk04BAqmTF4XzCCp0wH1sKAXlAQuCO36qYXfs
         8shQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137618; x=1792742418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsCa6xfL5zw39sMwap5EaPIJ2vJbQGrHr+jUTR7bviM=;
        b=Ti8HgLT3LDj2U+jxfyusy7k21VJKcgxeUR/uG8yT1lT9ATMOve4QS70j4raQEWeW+R
         6S6Oc4gAuTWs3Syfijvqi/SxfBEULJxu3oO7PrHXSj7yKg5fhL/Rznv/p0L4bVV7ZI2T
         mc2BOw2rp1K88NHFUDsriSalVULBWoLd8dVVHj1Ujl49WsGrcDPHYezS+9xY+hkl6WLm
         1jKpWCA308gQ/dnY+/GLjkTMFzkj5wj02LGRjCqDFpYct2RCgkQTuItQef7+8/D6BhZ5
         0e8rqZCMH9Wj1W34QY0Abv2LMo8rNnwSWWRpqAD7Nz1tPuEOtTMDWTU16mLIywUOJ2/u
         xd4g==
X-Forwarded-Encrypted: i=1; AKwUvByePR2AYEDemNR//OG6F5R0o8TK5iMpW206TNq/M7t3Hm59CCp0rV2rfZDRxaRJt4GC/t0BtYbMu6dSZR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwdFJbXvYpDFI6qsi01tAFQJQpNi1phGu55KzZ+vD2s2wIURTw
	7Qukj9bynGemriXs61XQKgPyq5aA0Ub6W0aiRhplh9Mmg86aw9eB/f/N4q4nLI54H5ItKYlkI77
	PI0M6VJyjIwkzA39Mh7YT3CLUFEW6Q1q5C1JeWgODLOdaJR2RwQ+fiYJy4KkTbl2Zk3k=
X-Gm-Gg: AYBFou2NfZx0zf/13jO+1NP8MuU4CZJwzk4hBprFtdzEE+DtKenykHw/DIuMaqzS6bE
	tr2zSD4MBlqZMMVu0mY0Z5A+ya0mBbWbQTNKy4YqFTTbLpfUJbgjhUQ4R21Mw1Z2S92GSOuGVMN
	IJioyhMMGElm/3gXhBBidJ1/qTcc7PegSgp3DPnf+8aGikW5+yrk3CYHQ1q9Mbe63yxSgaY4y4x
	VU2x6hw/POhVtBiVjeV5uFeu6WUNehzaHyeJh19L3aXAxGEtgRYkw1ya2NPkybtWELFOOWoy6GE
	5RCTaivfdHrckzS56hobW3ezx9Y/lO73H4XIyP5BCMaPR4F16x+MDBNOYKTAjbhW+WiCtcdEvbi
	pARyXS8yz4Y3Ji85LhvD9DmvHBzQLJ0jhwHOzvzeNbkBh/KaZOHp/gzW23A9PQPdInJKwnZTfij
	kd0tjIFmY/OMAoHgfqGdJJrwZ8rcoC+of6PDJed7h07T7bFb2QoCA=
X-Received: by 2002:a05:620a:178a:b0:93e:5cf8:e5aa with SMTP id af79cd13be357-93ebd2ab60emr3748649985a.61.1792137617315;
        Fri, 16 Oct 2026 01:00:17 -0700 (PDT)
X-Received: by 2002:a05:620a:178a:b0:93e:5cf8:e5aa with SMTP id af79cd13be357-93ebd2ab60emr3748641685a.61.1792137616595;
        Fri, 16 Oct 2026 01:00:16 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm5471446f8f.16.2026.10.16.01.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:00:15 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:00:11 +0200
Subject: [PATCH v3 3/7] i2c: qcom-cci: Detect capabilities from
 CCI_HW_VERSION at runtime
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-cci-imp-v3-3-5ee7ec1ea1a1@oss.qualcomm.com>
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: iffELZBU-cPoZh1vCS9TuxLkr1serymh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX+AUOSz2UITu7
 13Fwd55HAHAmhXgBp9TQ4Xr/r1N9ZAnSrylPRM8Fp9J5SFlr2hCPEiZMXIHf7nwA2Zfsl6Optrk
 TkRO6kWvrFpXqv8ITU5w4mrinz9GxdLU8uR4/twOK29LE1nosFHvRiGWScSt8U2ZEPT9lJ0Sq2d
 axak/k12LGjz2z6WdtHfwOF+Nob69ZqR12lLZC8a8dzeLampWcJot6e+o+QpxT/qd1KpO8ZYaec
 g5uLvPhKAiUhGw4XF/l3OhwBTv6YmRqujbFysT/0e54QA6HMqzLMLKoZJvMG+7WuE0ueLHPJ6cx
 tdiDXLM9fjKYTTpIT5JQmBslOoMEKQUCKFsOR+dmV15uRTmAVZH//8e9gnCDW6A1w4fmU2hFfds
 BJ9mN8VW0YN9nrjuAEn89D3PhUEPdhtVxKs6qX6kPHCER/2CitiIDWnzfxldKYSeyKaf3lJLJLP
 QYiWwNWgi87TE1mOvUQ==
X-Proofpoint-GUID: iffELZBU-cPoZh1vCS9TuxLkr1serymh
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad1d992 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=8R-5LDRAFMUVkZqLBecA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfXwrvAmACNm66M
 yR3CaWsJ/gWcGFj3c/wyGwm7XPALN7nByHFGM3hXzONza531dD4RHm3Hu6AbWGtx3n3bCFmHQcJ
 kL7VE17FPep7nTYqhkQsr07nMZOOBos=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160031

In theory, every SoC integrating a CCI revision that differs from
an existing one should introduce a dedicated compatible string.
In practice, most CCI instances still fall back to the msm8996
compat (v1.4.0), one of the oldest supported versions. In order
to take advantage of capabilities introduced in later versions,
such as larger queues (v1.6.0) or threshold IRQ support (v1.7.0),
we need to properly distinguish the different variants.

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
 drivers/i2c/busses/i2c-qcom-cci.c | 162 +++++++++++++++++++++++++-------------
 1 file changed, 106 insertions(+), 56 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 897502f55e42ddd6ea591ec756606ac07044dc0e..7d2e214ac62c652ada122791c69306724425d0f6 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
 // Copyright (c) 2017-2022 Linaro Limited.
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/i2c.h>
@@ -14,6 +15,10 @@
 #include <linux/pm_opp.h>
 
 #define CCI_HW_VERSION				0x0
+#define CCI_HW_VERSION_MAJOR_MASK		GENMASK(31, 28)
+#define CCI_HW_VERSION_MINOR_MASK		GENMASK(27, 16)
+#define CCI_HW_VERSION_STEP_MASK		GENMASK(15, 0)
+#define QCOM_CCI_VERSION(major, minor)		.hw_major = (major), .hw_minor = (minor)
 #define CCI_RESET_CMD				0x004
 #define CCI_RESET_CMD_MASK			0x0f73f3f7
 #define CCI_RESET_CMD_M0_MASK			0x000003f1
@@ -133,7 +138,8 @@ struct cci_master {
 };
 
 struct cci_data {
-	unsigned int num_masters;
+	u16 hw_major;
+	u16 hw_minor;
 	struct i2c_adapter_quirks quirks;
 	u16 queue_size[NUM_QUEUES];
 	/* Highest I2C mode supported by this variant. */
@@ -144,6 +150,7 @@ struct cci {
 	struct device *dev;
 	void __iomem *base;
 	unsigned int irq;
+	unsigned int num_masters;
 	const struct cci_data *data;
 	struct clk_bulk_data *clocks;
 	int nclocks;
@@ -245,7 +252,7 @@ static int cci_halt(struct cci *cci, u8 master_num)
 	struct cci_master *master;
 	u32 val;
 
-	if (master_num >= cci->data->num_masters) {
+	if (master_num >= cci->num_masters) {
 		dev_err(cci->dev, "Unsupported master idx (%u)\n", master_num);
 		return -EINVAL;
 	}
@@ -371,7 +378,7 @@ static int cci_init(struct cci *cci)
 
 	writel(val, cci->base + CCI_IRQ_MASK_0);
 
-	for (i = 0; i < cci->data->num_masters; i++) {
+	for (i = 0; i < cci->num_masters; i++) {
 		int mode = cci->master[i].mode;
 		const struct hw_params *hw;
 
@@ -618,7 +625,7 @@ static int cci_get_required_rate(struct cci *cci, unsigned long *rate)
 	for (int ri = 0; ri < NUM_CCI_CLK_RATES; ri++) {
 		bool supported = true;
 
-		for (int i = 0; i < cci->data->num_masters; i++) {
+		for (int i = 0; i < cci->num_masters; i++) {
 			int mode = cci->master[i].mode;
 
 			if (!cci->master[i].cci)
@@ -693,6 +700,81 @@ static const struct dev_pm_ops qcom_cci_pm = {
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
+	u8 major = FIELD_GET(CCI_HW_VERSION_MAJOR_MASK, hw_version);
+	u16 minor = FIELD_GET(CCI_HW_VERSION_MINOR_MASK, hw_version);
+	u16 step = FIELD_GET(CCI_HW_VERSION_STEP_MASK, hw_version);
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
+	for (i = 0; i < cci->num_masters; i++) {
+		if (cci->master[i].cci)
+			cci->master[i].adap.quirks = &cci->data->quirks;
+	}
+}
+
 static int cci_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -708,9 +790,6 @@ static int cci_probe(struct platform_device *pdev)
 
 	cci->dev = dev;
 	platform_set_drvdata(pdev, cci);
-	cci->data = device_get_match_data(dev);
-	if (!cci->data)
-		return -ENOENT;
 
 	for_each_available_child_of_node(dev->of_node, child) {
 		struct cci_master *master;
@@ -722,14 +801,16 @@ static int cci_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		if (idx >= cci->data->num_masters) {
+		if (idx >= NUM_MASTERS) {
 			dev_err(dev, "%pOF invalid 'reg' value: %u (max is %u)",
-				child, idx, cci->data->num_masters - 1);
+				child, idx, NUM_MASTERS - 1);
 			continue;
 		}
 
+		if (idx >= cci->num_masters)
+			cci->num_masters = idx + 1;
+
 		master = &cci->master[idx];
-		master->adap.quirks = &cci->data->quirks;
 		master->adap.algo = &cci_algo;
 		master->adap.dev.parent = dev;
 		master->adap.dev.of_node = of_node_get(child);
@@ -780,10 +861,6 @@ static int cci_probe(struct platform_device *pdev)
 	if (ret && ret != -ENODEV)
 		return dev_err_probe(dev, ret, "failed to add OPP table\n");
 
-	ret = cci_set_core_rate(cci);
-	if (ret)
-		return ret;
-
 	ret = cci_enable_clocks(cci);
 	if (ret < 0)
 		return ret;
@@ -802,7 +879,11 @@ static int cci_probe(struct platform_device *pdev)
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
@@ -813,7 +894,7 @@ static int cci_probe(struct platform_device *pdev)
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	for (i = 0; i < cci->data->num_masters; i++) {
+	for (i = 0; i < cci->num_masters; i++) {
 		if (!cci->master[i].cci)
 			continue;
 
@@ -847,7 +928,7 @@ static void cci_remove(struct platform_device *pdev)
 	struct cci *cci = platform_get_drvdata(pdev);
 	int i;
 
-	for (i = 0; i < cci->data->num_masters; i++) {
+	for (i = 0; i < cci->num_masters; i++) {
 		if (cci->master[i].cci) {
 			i2c_del_adapter(&cci->master[i].adap);
 			of_node_put(cci->master[i].adap.dev.of_node);
@@ -859,51 +940,20 @@ static void cci_remove(struct platform_device *pdev)
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
-
+	{ .compatible = "qcom,msm8226-cci" },
+	{ .compatible = "qcom,msm8953-cci" },
+	{ .compatible = "qcom,msm8974-cci" },
+	{ .compatible = "qcom,msm8996-cci" },
 
 	/*
 	 * Legacy compatibles kept for backwards compatibility.
 	 * Do not add any new ones unless they introduce a new config
 	 */
-	{ .compatible = "qcom,msm8916-cci", .data = &cci_v1_data},
-	{ .compatible = "qcom,sdm845-cci", .data = &cci_v2_data},
-	{ .compatible = "qcom,sm8250-cci", .data = &cci_v2_data},
-	{ .compatible = "qcom,sm8450-cci", .data = &cci_v2_data},
+	{ .compatible = "qcom,msm8916-cci" },
+	{ .compatible = "qcom,sdm845-cci" },
+	{ .compatible = "qcom,sm8250-cci" },
+	{ .compatible = "qcom,sm8450-cci" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, cci_dt_match);

-- 
2.34.1

