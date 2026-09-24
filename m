Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D681947DD4B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251652; cv=none; b=QdTGL9uSuU8cMkdPx1XdrVf9ao0kPG56ii3YUFUSIyBz+/ZHH1z1RGwBeh3GEVXjCroyriVpA17mTZm4FwX53U0f9htIohvcFOLSaZfuZarZmGJ4jZqMpr94gTH4x5KUfwpiBihQFIou5Za43Hcux5jD/zwqfzbb4Khv3/vgLYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251652; c=relaxed/simple;
	bh=oN1TEWUlkxXbOjoSBCVEilHRn5/gUdwPPWOMmwDlcl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UqXSIVRha3TkxUJr7pdf9Gxi5LruwAnPel60x2dzTdKhzC21fpefrbMvYdVosMH08zbipt+3vyrGHeawn+4WkM6P+lK5DN3iI3SbotH/Rd+j4eKiBXGnOsqJ/7Gbmp+TIvhTHYEIj+f4drAZV11J/d4lbdorSZWiH+jRIoooP3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q95vRvOC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qj/AHjar; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q95vRvOC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qj/AHjar"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4pPl2134221
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nfOwQAIiaWlN1G+RcHnEmmVPXDYSSGIGeQG3AtWObVU=; b=Q95vRvOC4xxtHncx
	9+ikRBz3NOY4SFwrQrgLm6iMKv7peQz4e49n8IbbKtw+hB8jGh8IvQXqf/cpvUcr
	jaxtsEPmGudFJ9GFGb3ChhSXBGL/+/Bdo2N5n/yGLErLeWApk8K6Gib0S5j7VsmN
	6I8ZM6hASBSMIBQuJH1jiVpGixb5G+/NHWTYOt8mixj/bTKJR3avbSxC1LwBlbnK
	W5n//ToU5V8fvgJ+vNW6GuRfe2uyQs1mDji8aQHC6wn69iWViDi6kjkKS0e++bbR
	TAYMrmdeixp2DQaFVl4d4GAqwQmfTLcaOa6W8PfwMxeumWedsO63UxX47IB/Ao9p
	hYqBWA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb4bt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:25 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78a6d5cc851so549469137.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251645; x=1790856445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfOwQAIiaWlN1G+RcHnEmmVPXDYSSGIGeQG3AtWObVU=;
        b=Qj/AHjar0anwV7qr1PggtFG1dTN6obX7lEzMgfvlTief2ifdHnCizwUcfrUHG8i/mt
         PHK9tRxPQpCUBAJojyzMh3ci6SQ8U8wpZqxMBluZGxqXIfurmCo2I90zkn/66BjBFabb
         4KSE32PfNkjX7xGsJfJa3bOtQvqyIc7z1hQJXRaU69MfDdvU9N84HqQbZWxt4VzEuQhd
         mrEF2CuykLy0lGveC7ggNOmGHaX6Rn24xQtKZkSdEGhAaKMOoKzsg2SLNaQT6Zf3jCqd
         a3B63a1YevUHRAjJmjF1y0Tbzn2W7JZobiqCvkhGvbzhJwSArnbv6VXEFLjHpnn1F9LQ
         t8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251645; x=1790856445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfOwQAIiaWlN1G+RcHnEmmVPXDYSSGIGeQG3AtWObVU=;
        b=RGex7K/i/oadxMXxyPCqiKi91hbE9pDocAQf29MgXQb5Px+Ge8uXrMd0SrGcQTOFmV
         FfxnnOkZFj1xltdBR9+HwqUJAIkULf4SvBfR5jj9tNayagamzlZZ4k8WIK1MD0K1AGYV
         /402LuDkS8SffA2nle847SpL0TLFGb5d642/a9RhDX4xuJ+7RfELR9yatcDXN4xKns4s
         lAO1C3OBsH0gy73q7g35qKwX0Zcu3NFAH1AAai7dDRrjAYUfR47hMApkdN1NbnrByq2n
         nMT2s6QIg0e+p8Rl9w8WVIZSrr3M26JcFh4VeXfXaZQNCHN1nWP/IqmIt8E9MLu5a4oL
         d9Yw==
X-Forwarded-Encrypted: i=1; AKwUvBxAovlGwlKTmNZijWjhG17YSfnxYjKtptJUiNobUDFLpcgY//nqsMOHpk+FNASY0xatdXp8G6nIIClC5ZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++knXV1kCYgW1x2EXhMG9QY8wZzkFP7LW4tHuC95PqU3uLaKTvM8
	lAGfo0dSwtLf1m8AEgxlpAVVaC047d8hxZRRi7hWunomv18GnRQjUNHir11iCwRAjGngZCfYucw
	QD337PRX2EWADEpROiweku1b3DCgf5izkp/aJfr2HNWHrwT7LXYlan7xdIvUjSeP9+3U=
X-Gm-Gg: AYBFou212aEtDzb4a0G2xZTTSncARGfkrLc1upUCSJxw5FQ0On4G0SW9FWiARXYgLmN
	MnZ+n1lYQXYfYaDOXAINojyiT25h+CUtjCuA3Fp8a6pWXa61nGTLYZvaIjkUvnRhnKvnGs2swqX
	ue0mR55nvmlh0asmDB4lzbSWJcU2GF2xMJYISVXvxqRyMlKlNKUQGn1RBeu34dGeLpyP2D5FpVR
	6QamelIpC/R6cI7NkP9wIYTL0913agkD2aXKVyXAKuF7urLWQyQyZZ00GFyVllUAw6Wkm/y23l2
	MMIGrV7G8s7pYR0VWLD88PkaQtwvm3DLogsNsqczphryEyI0bNH8D63GIGguXH3lC+Ux9KeSk6M
	0EndWfrPP
X-Received: by 2002:a05:6102:6d5:b0:7a7:195a:1b23 with SMTP id ada2fe7eead31-7af1f0ffd2emr976965137.29.1790251644989;
        Thu, 24 Sep 2026 05:07:24 -0700 (PDT)
X-Received: by 2002:a05:6102:6d5:b0:7a7:195a:1b23 with SMTP id ada2fe7eead31-7af1f0ffd2emr976945137.29.1790251644339;
        Thu, 24 Sep 2026 05:07:24 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:17 +0300
Subject: [PATCH v2 05/48] clk: qcom: dispcc-sc7280: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-5-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=oN1TEWUlkxXbOjoSBCVEilHRn5/gUdwPPWOMmwDlcl0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJGhL+xS/pRxBYZZHc0SVqIwdlQYuym6C6D5
 YAo3yyLyqyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSRgAKCRAbX0TJAJUV
 Vv7ZD/wOpN64SgwPm/cFM5R19DAMIfTAUSCLjQULHdtjH/pdCVAtutpFxRd5AbXIbnk0TMCxRtE
 Wm78a5Je1SJY+2mn5+REMpeK/si66vSHYtDBrN3xtFmiPmFU6BehEAspFVQtyhBAmrc2Stw60d1
 agn5SNiBM3vAgQ49YovQJ7eBcdaf5SLZPkda9iU0vnefKlVhnvHJ4GivZnTFGHjTCEj/XyvncCd
 BSq4YPnaqKGemA+681gXMsm6TvLOL0aRFSH/WZgzpsVg2tpz+JLNxCiIqCDbLIBUIIORCDZgS1n
 vpDMmcysn8eDCqTJBrCHF+B17NPV91LvmFtl6CILXE8RrV8YPKHA+ay9wdaAYlF66e/yoi6mgxf
 feqjPB6R4RBerllW7Pae7Q/s71Hv/VzXWB/vHs556mdzk8kSRxMxMafftCWMVQqyMRe21H8kNwt
 +o3m/3rrSMlmySJ36C60Gg/um8w44tg3xB3vpvj1l+WSZV1frp6BQ5RbmMQ7CLPWGzKIrTodXmC
 yMdJjNDBwmjYRCFsKUfy38sBjoxGi4PYVIzquIITBWK3i55F/4hCBdxax4/XM8RgJzFjENJ9mt3
 +5+gObi9uoNDLZMt6hTA2IqVA9XfeHolDPG5MPR78h+1awEPyWa7whhdbps9c4TRjsTE0vt8eV7
 +Y6jRQrwX9iHEtw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: apGKWSaB1njaPdnialDy2qBsurngKFz6
X-Proofpoint-ORIG-GUID: apGKWSaB1njaPdnialDy2qBsurngKFz6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX/wXaFbhOxhjo
 6M1G8oPaV6nc8mWZI3vhSFBftSVYkZZD9FcG+P+YITtQK4o2y9RlfBNSqIB0bsDONua9BzuYQ+S
 DpUqHzq6TAaW8yLpb8q9aE6i8waiIMXQl6VOv83I94nfQcRpPs4PIlaGU+QhdDzpSUBle6Nzz/Q
 Z4ugDMht89V1f+OmLGetOdzb9TULnC0sadoRAqzfeUV6LnZvtONp3sDQjG1QP+DHh936l1KtneD
 Yn7wQ0/U7gywgvuNMPrxt7if1oTg1CDFQQHtFigxF85aLofl3H4s+Ebyp6uktRVYyYjSsHPVam9
 kWN/0HIsmqRoe7R/vOFXJJ4Kz4h12TABodX/rhMU6/E2MdM+5rPbDMN1LL2QgxBkRT2bqSjPkDg
 XnKU0VxGu6kr832MNxV7Ys/gw8TCXN1/xwBeLVjSIZ/CUeMqe7bT6xQ9e9W6R6QMQzLPfuBRFSZ
 tiqudgtnc0Ku3K2r8Tw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX9NLo052O59hy
 y/g5pj2Jc67+7aQUOKwR1cZ9U4SJDuVkh9DI3CxnoQbvB2ozHc4dU77AfcRo9boqGG60oMkWLfF
 dwUSH733xb/oeWs/gk4zuEpz6FDvTQU=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab5127d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_TElPO2WjJGltpybzhUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sc7280.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc7280.c b/drivers/clk/qcom/dispcc-sc7280.c
index d11265debaf9..24a65cbb1ecf 100644
--- a/drivers/clk/qcom/dispcc-sc7280.c
+++ b/drivers/clk/qcom/dispcc-sc7280.c
@@ -860,7 +860,17 @@ static const struct regmap_config disp_cc_sc7280_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sc7280_critical_cbcrs[] = {
+	0x5008, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sc7280_driver_data = {
+	.clk_cbcrs = disp_cc_sc7280_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sc7280_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sc7280_desc = {
+	.driver_data = &disp_cc_sc7280_driver_data,
 	.config = &disp_cc_sc7280_regmap_config,
 	.clks = disp_cc_sc7280_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sc7280_clocks),
@@ -886,9 +896,6 @@ static int disp_cc_sc7280_probe(struct platform_device *pdev)
 
 	clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x5008); /* DISP_CC_XO_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &disp_cc_sc7280_desc, regmap);
 }
 

-- 
2.54.0

