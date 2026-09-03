Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EB84A1DF0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437956; cv=none; b=k32cvi036SSBbGoZiVWN7QcsNlXXugJDX2wd9uSiVkKtgHn2mftFCby8pB8m25SSiR4Ou4QySMarOCMMYSTENQVQEyck4cDVVXkbUA1rH/UhlLg1ZOg4qe8GZauuNwC8uZTe7wfYVmtxZn1N486FqXDxtce/o1yHTXhQP7LJb4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437956; c=relaxed/simple;
	bh=uz7L8jZC+FRa4iH6HND9+Fq9kcOFbjPiksyeJbgXaOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iV6CPVLoRse32Qbk4YJAvYULEZn4U31cU86wP8CPhrkM1br6TuvgMbflLFpOEd4BGZIvxF5gAkYS8V5JUj2rqCmJlqZVpr+2Z+oAi4DST9Obk50Avl6AIZUTq6XzQjn/F93mOJHOAiEw5jIR7Oic6z2aCJ813NZeFK5rhNHKN+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOzbJSpH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EaizgB/b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOzbJSpH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EaizgB/b"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHDoR327114
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 12:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d1v+GC8Hhix4s/ZeQXqidP
	kZI2JR/xI9DRh0/nfz9oc=; b=DOzbJSpH1/bEeTonQSd4JC9BM4dkM5TW7nNiTE
	lVTSHhmnqKwNBKA5sBCV18eBY/7/OPgLYJ3eyBCULVCsbnu0neVf6+oNIKgn4mm2
	v+Rsi0GYCfbnLrh+rXxoShHaFo185qWtjabiJpij0SElcWJiv0SkmjcqZ6sZrg8J
	iDJUwJImDwAJUU5pUOqoyQYZ22/el1lkvPUAD4IrhFnqKoNGDhJNbw63V/CgOOGT
	nPXvIR/h5a1tQsjOkWynuORRx42upgSNJv2+XoaBzEXkaERDK0FQNpKVLXMgJGm+
	XGcvbYoHN9fJts6kcLskW7dKTGCg8L9KVmTlhTdpEcRakQKw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekh5v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:19:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93903622880so173652985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788437953; x=1789042753; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d1v+GC8Hhix4s/ZeQXqidPkZI2JR/xI9DRh0/nfz9oc=;
        b=EaizgB/byGWJUl8jwQafnUP7b4SYJv6+oAaE2AmRukoQE9KQVsfhcZEKFlm2sypnk3
         Av5wANKidykvC3hf7gwTKcMkq9LmZL7Xb+dOA/wAKJCrb++/BKTwyNk4sx0SRJvZG2NS
         iBs1xGsoy0gcwqnTWBF3fBMZQ2Jna16o0hB9KDxWJ4e3jhtScE+c95P0DdvhoJUAwdlz
         0uSzuq3rPAIMXK0AVgrQBAMFlosZovW/hw+EOO9TvsgPvvWffJ6r/c9CMG+f8NowBB7R
         kgdRrnFtUqHI5SGS06zDtZYUrpXLC4BUy/b2gnF5RAcNOwysXc4O0rpe1Aa/q9fI56L0
         v5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437953; x=1789042753;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d1v+GC8Hhix4s/ZeQXqidPkZI2JR/xI9DRh0/nfz9oc=;
        b=nNR+MPYL2hu74FE8HSMKRJKBWpFWbg7zNVjVP7X0wzEGKHrZKs/+TJXKGThcajHisE
         /Ox6NJ7tA+qVR009mYSOKRLIfHbqt1PobCYIe7+VIGoQ/ASyRTuo1jWFwGSLlr71U282
         gsDfNN+LIH+ILcOW49xxwPwQbeaf06GAeBpPPGxMKX5t0LVf1UPs0j82cAF1xgJio3aT
         5tNQpSVpomdd339PdexU22GZfHpEzpOGx/FI2mku8Rpt09NTFZYJu2CsHc+3Fz7z7nuq
         i01MS2obodJ0e0kMR+r/nGBauaAZ1vIVi+tcEymk4aHAWrMu/oIYmsNI6CY+7p8ejF1E
         40uQ==
X-Forwarded-Encrypted: i=1; AKwUvBzq0ZqbQyITTuOB5Ntnj1JxJxkKIU906dhCwKPf6Pf3PT8kBBewDIHRfWyJyAvHUXGxX2yUYfcZlxBek74=@vger.kernel.org
X-Gm-Message-State: AFuF++nhPJSZRvHcpaKzqyL+k+r6hI8WqVQLZmOyq4OsVDLiWeB90wVI
	S7wEYCeP7RzUKT2XVAZSgqiGI3cnCQnqTikJ7+4NiUkmbENLlkDORZ7TecUdYAgkVKo9LPkfiTh
	JEwm1H9iZjoL22dEJ8/VT+i5xSiOdgBVlCQltQKCBgYQ7L46vxz2TX3S70vnT9FJb6LQ=
X-Gm-Gg: AYBFou29/6C8e2m5ddF1jE0/WelB1tjWDnjGVQ0reh4DFdgjRKaD/FLkOYRWqBHH9Tn
	GCXMvZLPJkwryZuZ1kEphR8g8wfLjJrmGd2Nob8gUNdSsZS+sZdtPu3HKffGusoTM1MlqPq65Nh
	G0qGCQJU40ytwMUlrB6UkjTqpvgoRyo1P80m95e7WQ85sg/G/fmIoXlSIGYjOLKiXc9rd+zh39K
	Zn/kjh8yN0liBInASAIxPbrYOlBZza96cez7qDysyj3IF7O3O1w2mJK/ZfEXTASv1aZA349u+86
	llObBjAb34xbTPJUIwaJaJj7jQAdS5DBpvmN/sWAYNb/JTMBArPV0IQgSQvcSJcAwHkZxoPu+Er
	xZjVMipR5XfWQXseFmLuiIeX5NO9UTGjf8IFavoto2/qGyn97VJHpslNUqB0UX1mjFnWXFl+QT9
	GV8fSZ+EmFrDKO
X-Received: by 2002:a05:620a:3704:b0:939:79c:1104 with SMTP id af79cd13be357-9396df22e93mr542211685a.10.1788437952972;
        Thu, 03 Sep 2026 05:19:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:939:79c:1104 with SMTP id af79cd13be357-9396df22e93mr542207585a.10.1788437952445;
        Thu, 03 Sep 2026 05:19:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b0ecdbsm1254298e87.9.2026.09.03.05.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:19:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 15:19:10 +0300
Subject: [PATCH] drm/msm/dsi: round the byte clock rate after reparenting
 to the PHY PLL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-fix-eliza-dsi-v1-1-3474a6c9f2e0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL1lmWoC/yXMQQqEMAyF4atI1gZqBFGvMszCtlEj4gyNiije3
 arLD977D1AOwgp1ckDgVVR+U0SWJuD6ZuoYxUcDGSpMZXJsZUMeZW/Qq2BpHbXsyVFlIX7+geP
 g6X2+r3WxA7v5jsB5XjXjCcRxAAAA
X-Change-ID: 20260903-fix-eliza-dsi-8bc2fed2c29b
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kavan Smith <kavansmith82@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4272;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uz7L8jZC+FRa4iH6HND9+Fq9kcOFbjPiksyeJbgXaOI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqmWW+wJLWxHequ4iwL3l+6YA4eVuefTeu/unAo
 EV3dXdw19uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCapllvgAKCRCLPIo+Aiko
 1bXzB/4k3Sk7t3WsIolAsFnZopkL7GkMimyro3AHD/0eM3i6vM5oCIE1pOgThrWM2sNbJXk7ERb
 67KOCDyUQJrcDtgItRcKLFxnxxbXnVO+mMQxfrZQCJ45gDRnbpUxNbCEDWqxRscKleU7Sp7hbvb
 EnvalAlN3LAWXFVhJd8bESdvaFJjmzXozx8rwFZnBzUzc1k/QrNfJ1/GOb14Iuv8BOuEg3XnMVF
 G4lzqU96wEU9KO9sxqupC02/kbWE8jfbjmPQo/0CupEJYwEq6In25Y/zT6YtSsuy3xbrRTulueH
 +LfGn5/m9Sslh3U3PmERfB8EFT+1g+gk+biY+gNuoAt56x0A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: uGsesU9bzUIF4Xlkcx5VMkWeVxpWY89-
X-Proofpoint-GUID: uGsesU9bzUIF4Xlkcx5VMkWeVxpWY89-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNiBTYWx0ZWRfXygItd6q6lKEF
 gIND5n2l7PmfMrJr6D4uk1xfWcmiTReL1ShhM3HGjYAiu5xP9Nve95j1JgYYM+mGncxasZAKEIy
 i9Ovk7Gl7V0trI2kcl49OrY1BYWmUoO0tODeCHgc8MVLk4wLO9NroIOde3V4g1a0gfDoQj23yG0
 62bER5g/C9Ng0Yk1Y+hA7ufg3htWFMjguBprLUhObaf96iRlATkdRFgaIja+J2DW6dhRIZBRToX
 mwjzIEWYgkKiMDcrXq1Mq0VY4UBEpdbFDs6TYE/0nncTD24KWIxFzM4iXifbV7kanl0xUfqX7Gi
 C5YJwRYqZrXwcWquMHEh9o688yUrQuxgXpg1WqgbPJYBWOSAEby+PywiC6ZMoQvcsZTAwAKTNZn
 eQ06Wo8qCx0c/+N0MfiIzTDTKq2lBa//rd0Cem6LXmqIfi+4S3Zxer9cdB3XC5IBJkQ9h4s9eKs
 bNZ8m48i3IgVGYMf6gA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNiBTYWx0ZWRfX9kV0XKoiQTGi
 u0IAgHtOCUJ2j1npTxa3sLd7ZCOovGpEIj+QHvdVXL4mTTHRQ3Sti3EE7Ct4pjFMSLZ9z8gZXgv
 JVQjRrLZt4dCNvZQGYAAj/G4apfF2MM=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a9965c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=hm1qJ70bMNtfgpIXLUgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030106

DSI 6G v2.9 hosts (SM8650, SM8750, Kaanapali, etc.) reparent the byte and
pixel RCGs to the DSI PHY PLL at runtime from
dsi_link_clk_set_rate_6g_v2_9(), after the PHY has been enabled. However
dsi_calc_clk_rate_6g() runs earlier, in order to compute the bit clock
request for the PHY. At that point the byte RCG still has its reset
parent (XO), so clk_round_rate() returns a bogus rate, which then ends up
in the PHY bit clock request and the PLL gets programmed to a wrong
frequency, breaking the panel.

Move the rounding to dsi_link_clk_set_rate_6g(), which is called after
the RCGs have been reparented to the PLL. Storing the rounded rate at
this point still makes later link_clk_set_rate() calls no-ops in the
CCF. Derive the byte interface clock rate from the rounded byte clock
rate, otherwise it would keep requesting the idealized rate and
retrigger the PLL on every transfer.

Reported-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Fixes: 6cd33b6f4155 ("drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 7e4e3718b536..b292dfd266d1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -129,7 +129,7 @@ struct msm_dsi_host {
 	struct clk *dsi_pll_pixel_clk;
 
 	unsigned long byte_clk_rate;
-	unsigned long byte_intf_clk_rate;
+	bool byte_intf_clk_div_2;
 	unsigned long pixel_clk_rate;
 	unsigned long esc_clk_rate;
 
@@ -382,8 +382,20 @@ int msm_dsi_runtime_resume(struct device *dev)
 
 int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 {
+	unsigned long byte_intf_clk_rate;
+	long rounded_byte_clk_rate;
 	int ret;
 
+	rounded_byte_clk_rate = clk_round_rate(msm_host->byte_clk,
+					       msm_host->byte_clk_rate);
+	if (rounded_byte_clk_rate < 0) {
+		pr_err("%s: failed to round byte clock rate, %ld\n",
+		       __func__, rounded_byte_clk_rate);
+		return rounded_byte_clk_rate;
+	}
+
+	msm_host->byte_clk_rate = rounded_byte_clk_rate;
+
 	DBG("Set clk rates: pclk=%lu, byteclk=%lu",
 	    msm_host->pixel_clk_rate, msm_host->byte_clk_rate);
 
@@ -401,7 +413,11 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 	}
 
 	if (msm_host->byte_intf_clk) {
-		ret = clk_set_rate(msm_host->byte_intf_clk, msm_host->byte_intf_clk_rate);
+		byte_intf_clk_rate = msm_host->byte_clk_rate;
+		if (msm_host->byte_intf_clk_div_2)
+			byte_intf_clk_rate /= 2;
+
+		ret = clk_set_rate(msm_host->byte_intf_clk, byte_intf_clk_rate);
 		if (ret) {
 			pr_err("%s: Failed to set rate byte intf clk, %d\n",
 			       __func__, ret);
@@ -669,24 +685,12 @@ static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
-	long rounded_byte_clk_rate;
-
 	if (!msm_host->mode) {
 		pr_err("%s: mode not set\n", __func__);
 		return -EINVAL;
 	}
 
 	dsi_calc_pclk(msm_host, is_bonded_dsi);
-
-	rounded_byte_clk_rate = clk_round_rate(msm_host->byte_clk,
-					       msm_host->byte_clk_rate);
-	if (rounded_byte_clk_rate < 0) {
-		pr_err("%s: failed to round byte clock rate, %ld\n",
-		       __func__, rounded_byte_clk_rate);
-		return rounded_byte_clk_rate;
-	}
-
-	msm_host->byte_clk_rate = rounded_byte_clk_rate;
 	msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
 	return 0;
 }
@@ -2495,9 +2499,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 		goto unlock_ret;
 	}
 
-	msm_host->byte_intf_clk_rate = msm_host->byte_clk_rate;
-	if (phy_shared_timings->byte_intf_clk_div_2)
-		msm_host->byte_intf_clk_rate /= 2;
+	msm_host->byte_intf_clk_div_2 = phy_shared_timings->byte_intf_clk_div_2;
 
 	msm_dsi_sfpb_config(msm_host, true);
 

---
base-commit: a9117574de38e27355ded76850df9200ce7870e6
change-id: 20260903-fix-eliza-dsi-8bc2fed2c29b

Best regards,
--  
With best wishes
Dmitry

