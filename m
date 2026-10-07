Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE11494819
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363812; cv=none; b=Y28au2fEnf2mkG6nUtsFyercDaZWO4je9KPV/Hts+juryZNcjyyPyNUFCw3YXbN8qtKYfiYkh8zP751jv91nIPAlBJsRXhIJQaRxUCQxYCypBkopCkpEMUcOaVU5kqMjQvoZlpw+wY+dvg7A/wABx9T+ii7LvRBkEK89f8XPdjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363812; c=relaxed/simple;
	bh=RYibGEzxtihko5PwDqOj5fA9WIiMP/2MvesgUwHHFM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o+XpmbtWUkQtgr2hrhyjsDHK34mwwk8q8T6iaFEHM7H9mhGgUP5Sy1Fg6I46vESrLtn99ZgPKlgYNyljaguFMgsGXhuvD5bpzbuRQcC2Wtt1O5zoNj3A2pvoeP0NfK9V7Xr6Zy5ns0qNtqzczBvG5Gy/bvJgCJf4ia2uyDER7Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hLskxHyG reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLskxHyG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jrqH2312929
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AcQv+ESudV3
	lx6NUJHsnUC9DLitCg5UjxSMMc7AIUxU=; b=hLskxHyGbXu29vaFUujbvarQ0cs
	7pCvhkXHQVgyy/gLkAtZ+TLaukSPIb3594s9U6TnYrimfz30Wf15AchnFPpG1q7N
	x4aFJaALBpbu+ySndW1UquSgJii0sv4HmLjHloQy6sXAX1JLFe7cQXbjfS8pS1dL
	NrXnWUpEyb+Ri3IMC6roJftDgMF2Vee6lBWDh1kKzsEdNFplSCJWt6eMJYohhHZ/
	RdOojGKF+5S8GWixXqnHoeMWFhhy+rUjwC2xDEPQZnTI1wooJ+yXoy/MlJJSiGa0
	DXZDYRDF9GsZHz5yN2nCTLp1ZDpVgC0nxchCrpoW+qlBWMANg5/o2eKw5Vg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53asknn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:03:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso739077385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363781; x=1791968581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AcQv+ESudV3lx6NUJHsnUC9DLitCg5UjxSMMc7AIUxU=;
        b=WHANEeqF5nl+qbfuI+JXvJeriOcJA71qrFpvTMASpqc1g6C8QJpeKgbI/aoitO90Jy
         D4O1TqOQPeFMZ+1NZDqDrb+7JSJ8BHUQB5RnbW8riSGYOPHtJoCGFboobCQsbGFaBtTT
         C7h/xCyuNcEWF/oGgKiIeAnIaq0Oc9DS0dSK+hT1b2sVwquaiMOmPZA39DHthzaHNG93
         /Ds+0C7XpTYDCKPCArOiHJyijXE1e04SItbxJYnGcpxqVFu4ztgoeUpiD3votDvYKyfX
         1uH22+D27h2x4bIfLwS+AQiu9xmgNsfOyAHSUb3f7PBvlrdEgzaPsEE/5/JyhN2ubCX1
         rXDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrJ1K6J0kzUH9KRX0z2D/+odOY5Y5hG0yvDHODAWOXuKoXRp+JWvpZdykKUIMb52Z+1zMuWCmHNrvpa9Q=@vger.kernel.org
X-Gm-Message-State: AFuF++meA9OQIQN8Sl62LY8soZ0uo4L6KzVm5Z2li2XrgrPpcirymV/l
	cr1EUFT8XCaKYLRZOS1LfsyVeldKASXPKSQH7YwbPXAOoNgYlUaTEly1nHC4+Ak5dq9ZXiraFNI
	XUE4N3xCYCBHlWT8UBHEC7SLkL6ne4P64MZsuLLDoZzIH5+0IuOkI/RNp/r9+YqeR5NI=
X-Gm-Gg: AYBFou0othsiRHwvBKnDQeSCH/QxQlc137dM++RyJYG+FpyloteFYYS35gobEipX4kO
	3s6bS4Y4VD59Lu3HdKMRQIRnhLiZ6RJYbreJO1foNXinsqOUywMne6hDoT4k+qNXNnDo/nTWPmr
	tTJF8BQhjeH81l5wmYxrikzlUIODMY5bviyKL8uMigjnzUs3oB1SaQf/akdTvWVhoSgdw3WzYjc
	FQaKqsBI/GsAudy94pWvCHjQCXoIsNrdP0eJU29nGsva+Mr4PMRHPDiMXpoOGbotCocSPKEbbdZ
	wqVliQkrrTE0h6XSUZbRC0Fh2B5dXOuLXbg3vz9RZ/T0D2J2NBT8orVLEZ8=
X-Received: by 2002:a05:620a:1a13:b0:93e:6e6a:b686 with SMTP id af79cd13be357-93e860c61b5mr1021849585a.29.1791363780416;
        Wed, 07 Oct 2026 02:03:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1a13:b0:93e:6e6a:b686 with SMTP id af79cd13be357-93e860c61b5mr1021841985a.29.1791363779756;
        Wed, 07 Oct 2026 02:02:59 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:59 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 39/45] media: qcom: camss: sa8775p: add white balance parameters
Date: Wed,  7 Oct 2026 12:00:35 +0300
Message-Id: <20261007090041.3732717-40-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WrfIC9RrPDclwP-qBen6VxFELAKe6y-P
X-Proofpoint-GUID: WrfIC9RrPDclwP-qBen6VxFELAKe6y-P
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac60ac5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=rrQ0n_boRlREehwvzwcA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXzRanShWMo40s
 25rElbBOpcUjK2MaHb+TXqaW/sxlthJ3SMUzKBXbHgCLXyLSD78AbqjIW84e98r/EPvNsR0Mnim
 VU6lB2H8A3dvlnaJ+SagzOVFskBKwvc1KlVMQM+U5WOcpJk3bFkGl/yEdQ7yfjiqO79CiJOb0cJ
 67/NNz6skXlzSoT2pVl56bwa1N/N1ICqP/lGSgZEnd/kY4PeoAabpNBLWA6Xb839wN3FnOOk1yl
 NQM3q1fn62ZYG47wimq1v2hXXrE4S1qshFkTGPdST0QIc3blsFCfRI+/qMX4QJVENOlM136IM75
 aDE2pSsVcrcxlxhBOrH9p+w8wsxSe90/D0o6mrhRyb9zg9J1E9KoUxP9CBrbZn0MvPYKa6xN8G2
 j/RZMOE1TOPVnvkHljcG3sxi+zdxWxTm95vgomGtzrTBLRSarfQgEeKfjScL2Y28+XrKZ95aY4s
 GhVXUAVEiUBmYNA9AmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXwIQB2Lszew9a
 qqU2BedFIjRTqPT1D16snlD5ulQWY8uVNuoj6yZCOhahFmSEtB0WDGQUK1s0AMeK4VeEVeJmHw7
 AWvyzzQUaLZ1tJ0kLh2TWCmWSyR5Q1w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Program the red, green, and blue white balance gains from IFE parameter
buffers. Enable or disable the gain block as requested.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index 77d33c05cc6e..3c53f585133c 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -179,6 +179,36 @@ static void mod_v41x_wb_gain_config(struct ife_pp_ctx *ctx)
 	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_CFG_2);
 }
 
+static void mod_v41x_wb_gain_set(struct ife_pp_ctx *ctx,
+				 const struct camss_ife_params_wb_gain *cfg)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
+
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_WB_GAIN_VALUE, cfg->g),
+		       base + IFE_MOD_V41X_WB_GAIN_CFG_0);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_WB_GAIN_VALUE, cfg->b),
+		       base + IFE_MOD_V41X_WB_GAIN_CFG_1);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_WB_GAIN_VALUE, cfg->r),
+		       base + IFE_MOD_V41X_WB_GAIN_CFG_2);
+}
+
+static void mod_v41x_wb_gain_apply(struct ife_pp_ctx *ctx,
+				   const struct camss_ife_params_wb_gain *cfg,
+				   bool enable)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_WB_GAIN_MODULE_CFG);
+	if (enable) {
+		mod_v41x_wb_gain_set(ctx, cfg);
+		value |= IFE_MOD_V41X_WB_GAIN_CFG_EN;
+	} else {
+		value &= ~IFE_MOD_V41X_WB_GAIN_CFG_EN;
+	}
+	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_MODULE_CFG);
+}
+
 static void mod_v41x_demosaic_config(struct ife_pp_ctx *ctx)
 {
 	void __iomem *base = ctx->base + IFE_MOD_V41X_DEMOSAIC_OFFSET;
@@ -632,6 +662,14 @@ static void mod_v41x_params_apply_lsc(void *priv, const union camss_ife_params_b
 	mod_v41x_lsc_apply(ctx, &block->lsc, enable);
 }
 
+static void mod_v41x_params_apply_wb(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	mod_v41x_wb_gain_apply(ctx, &block->wb_gain, enable);
+}
+
 static void mod_v41x_params_apply_gamma(void *priv, const union camss_ife_params_block *block)
 {
 	struct ife_pp_ctx *ctx = priv;
@@ -650,12 +688,16 @@ static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[]
 	[CAMSS_IFE_PARAMS_GAMMA_256] = {
 		.size = sizeof(struct camss_ife_params_gamma_256),
 	},
+	[CAMSS_IFE_PARAMS_WB_GAIN] = {
+		.size = sizeof(struct camss_ife_params_wb_gain),
+	},
 };
 
 static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = mod_v41x_params_apply_ccm,
 	[CAMSS_IFE_PARAMS_LSC] = mod_v41x_params_apply_lsc,
 	[CAMSS_IFE_PARAMS_GAMMA_256] = mod_v41x_params_apply_gamma,
+	[CAMSS_IFE_PARAMS_WB_GAIN] = mod_v41x_params_apply_wb,
 };
 
 static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
-- 
2.34.1

