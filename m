Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797628;
	b=BAKVCNr4FM5x9v9K/44Cw14yGai6xpgVSC9Yee982oIhJcSZA3NcjHAypg9lLXDpeosi
	 ZSfkDO7dTVoGLLwFikkt0OfwxjU/uw7FWZ/dXYrzGs5k1OSBoQ+q7XPvZbN8+5Pev6PSI
	 Fdp5Lw7Zo0aniucZqX2AwgH2LTuJc0e1s+o8s/qCKHB44zSpCaRRQkuXlSb7fWUZPOp5v
	 MxhUvCAU7AO0uLeECvKp4rzpxqjXjV55/kyZTZZ7Y1YdK2hghNqgz8wdqCvG+PBYsHsVQ
	 pqO7Kqdkt/2Jsaiggw0wo56x3tVIiVkbmssSiSJJ05vRLPB+YInBWyng9a6tLPp+JPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797628;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FaqajoRcBElyuICZhCmUKXN7s8u9DKYWFfzft5nFEDw=;
	b=cCh2n3hWXQN3eLZ9v3gYBNoFD3PAyoTrsgR7aItoT5YdFnGsPm6TX6g7hpF2Pb4oAruX
	 ja+2WhnSoTIR0TpUKtwosF/ksIM6hnkZlnGHpxbxv0fpmPNhU8wa+eR33P3XYwC+qSSzE
	 U9b1hDBF/5OWNRU12Mxybfs8Uo+D3Coozvcm7hhQruj6rBgkr8rWc73fj7XhdwsqgYAQU
	 PkFBLNjB/WUyPT69NkN+/uiH5df8G0Y4lcSQvtN5FUqIGig9dMI2LTAh3EYMAQej23v9f
	 7RMM70FtYy/X+ycxZSf3IVXCyn8YBc10ldqURIEB745iMYIN8vFtKGZr8PhidGOMijA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OENizIr0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="acKG+E/3";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F83606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F83606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OENizIr0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=acKG+E/3
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvMpe3983641
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FaqajoRcBElyuICZhCmUKXN7s8u9DKYWFfzft5nFEDw=; b=OENizIr0fGMDYU/b
	TkxjhlcpNOaEk2pBaYqQzzUy/5xFQNzmmXS1rlV9RbeyXSke3rm6KiGakJAppvlj
	ioeFR7Fv4SqusEuXP22lM2ERIgMr9YIRkgrlBGwtyrih9Br6V8bLdRhPhQBfa8/1
	/WudqBlWKw5n6XSdgNpxgUYpZ4/agKzjbt4SC+fdFsZHyFMLQIU70c4YhfMk75Ok
	ykaCVn/zQdhY77kC2DCh7cczl/Rgjd5GQd/SDe+gYY80pq2BCtyghOaCCI0HPnSU
	vF7cHz1mxhHDpSC04XRBKKzZAsxDeg2w/bGl0KesoJm/mV6+m+s0n8Goxvj5fEqy
	OY7zOg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgart1cye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf6c528aso219001085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797626; x=1793402426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaqajoRcBElyuICZhCmUKXN7s8u9DKYWFfzft5nFEDw=;
        b=acKG+E/3zuAzBfGWUqxqwj/yzAjZGDTZQhCk9HwjlenSNaixxruU3hhZ/EmCGwixdt
         1dHdbyKTfSpnj33vwmG2Uwx3RAdR/6yrR2khYRtdrexbKV3xjP5FFmYwZsV3RKfhf3wh
         rSvT4ap2HKsrevUDIxo0TZu0skFhAmKcmaN/h7CY6m3p930Q3TiBXK0P4+deL0WDpnpl
         tanug8/kbp/sDiAiG64OLmUIJi7tgq/5YOWCRM94LeSLRlj6293aT3QHnT0uRQqlhBvC
         q4KdZ0OCQ1xkLPrTEXrXwhxifVEbSP8tMluzBr4/l97k5R6232QqL4xlo62zpgPRZU+s
         Lyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797626; x=1793402426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FaqajoRcBElyuICZhCmUKXN7s8u9DKYWFfzft5nFEDw=;
        b=AEiXYEFUs5x7hiEmIRTPUo8mnBdox6lInPc9OS1HJ0aNe0TuYVb1/Z5AwAnfb1ueEP
         NjYM26TeiitUftv4C+HwVxR37G1XvSesdkrIShJzTekLUKCH4bgz+dDZDLNWvDj7ks81
         NvGOr3a4KxUFO/1c7HIfVvFNDVvWdJKodfEup7ehHl/G5DgOC4okZ7De8U7peBOATWu8
         yvYXWhX0MK8P9RTKbCnwnNfmBvYycgWPu/EubScyg16KirwOzdO6WB4yDKjj/m0sslEC
         iV6pA57yG/thwzVNWXBiYMvKVBR65G5AyryuFJhNZzK8mCAYK3CCbzNbEI7XWIGQZpZb
         A3CA==
X-Forwarded-Encrypted: i=1; AKwUvBzcEdC9aKd6VhfDMhsDLCDeqDiudG4gnjK7J7AjWWG/Jg9gEEE+xQiiOeq1o8ocoUI7wvILxhacAv/Fa2Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtmenB9DhT0XN2wSxXnIRYMsM+sL4l8uZGJLjt7iERLTJK5qpb
	RyYjsvH6+UpBtdcz9yHhjfYafIMcHoiMGzWJQ4QetkVhpjzVnC8d9XClkhLzr1T4gjzrSwU0sJr
	KRcWhNnF9sdd9AQbMDNExjkySlk5RBA+u9m5O6k8O2YNEKmCFgGqw8D9VOXWfxgdjcsQ=
X-Gm-Gg: AYBFou22R8v4Z83lWlcArrDbWKMbhdLbIT8ElBVqE7Q9asPyOdM97ortw//GsaP00xp
	2RSShOHYb4XbhqLH1vBPq38YbsuRa56NLS91s3bR7PefpUdvYF7yDVKE+d+lQPDK71tF2WlGRsm
	aWP8xRWSvhDrNJLjNjIe/E/KCCn2sI6wR40IsV0w7pxNoV2jq7FwDX2M3+YmXKEBX2Wc2E5eHeS
	tZ53Je8hVD269Kpeqvht75NtX1Yl6hfM3jFaZcUO4xjYZibkrGYJQsiGGiW2o/c29VQ6Tp/y7mB
	YDcDkZZMfQhoI95s6yIe/XAHcgIGqrJxXntKRZ6rtdpUq87nrEhOOBLjdygSE4shfq0ckfhOKIK
	0oxOdkO8DJHqzPbZeveY2vPNxKH287ZpR5aUvrV2qA1SHyrLmpy1p5rxsgyYEiP5hjacvx20+Gw
	68xcvH2Hdd4BEB
X-Received: by 2002:a05:620a:1a13:b0:93f:3d2e:6bdc with SMTP id af79cd13be357-940ef914dbemr88636285a.16.1792797625897;
        Fri, 23 Oct 2026 16:20:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1a13:b0:93f:3d2e:6bdc with SMTP id af79cd13be357-940ef914dbemr88633985a.16.1792797625436;
        Fri, 23 Oct 2026 16:20:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:42 +0300
Subject: [PATCH v3 09/14] drm/msm/dpu: don't tear down a failed hw_init
 twice
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-9-66a30120a5ea@oss.qualcomm.com>
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2919;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2tPDXcEAQdfx+uOZ+i3gT4JR+STW+/Lz2xQF5BcD1Wc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uUHPTIKtGo7CKHpbbn4VefkDvy0Hl+yHV5g
 i0gJoZcksKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrlAAKCRCLPIo+Aiko
 1RbCB/sGIy2KMeo5ebduC/X3dqd8P6TXBzKZ0mL6umDRUbH7TyjjlQp+MJHi2u8iz7b54bxHr8E
 z+V2WGXyBPMWpVgRnhjvmuXhjJWlx0MoJQm3Fy0S0ehpGa7/rZ/CxLI65BfrHoLLyX5LX1PsLg+
 ybY4df1UD1m0BMQbMOR9OykLmeG193LzRuzJ6sPoqgyTcS53Hwg2gX1DeATKG14Chs9Vp8MmfyJ
 GrZeNTus0EoIfFa4QuiAHYFsILIlQk3+qC3N8BP2KNneNUol2YwmSJgHRPE1si1JZSJFMMMMbv1
 xTxXa0qOXtScKTRNt8/kY0LAPDgR6vWrLTXI9t7gQJy+6a3V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXwgzeML2kU+Bh
 fJiA9FsKsPpTszyLf/yrouvNWoC98cLnx2UxPgS+I9NoJgLpey3ylsBld9hM8FYROq3vbEuS95t
 52E1tKsVeBMg/GCG4Ng3u8QPdmoR8cMTn5gwc6hCY2nv95xdIYs34Ds2zl3LWMgvxHjpnxNld0S
 vUhBQyzeY18EvOYWhwBaxkz+SmfdsvmfBnIQlkFzYldI/g9EXW9erI9wHixFrIs7HaO6HIPBG9K
 yXtdCXwQMRtSof6gkIEz/EUO/6MqNX0hthwe4lDuwVQODFw6sLfS4+ZapznE9e98EbHRzayeyK+
 1sRbOHbEEZhvtAKqWGUY6pZbRPvRHzYDACe49HjyDpfPvlCZMhIRuBBSq3A55wy1yPiNY7XuljR
 c7DxPGgIletUl/UOJN9kV0S5ZH7XMMtNl8LTnrHCAkyDCoJ9HGhY82U9m6z+YSjss4EbPdzI5Y8
 qiZGo44JuAs/CXxqQ3g==
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6adbebba cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VuwbfrIzBJgoMi6EY_8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX87RblxyJGsm0
 a/F9OntdJhdK9FgV95SxrzNNqRR4nRnwc8VUhNpZK49NuGg+ccMwZzMjvLT5w6Q/SVE0OB7xKdC
 Xj2RF743Voqj1q5TSe6SayR7YDRgRxo=
X-Proofpoint-ORIG-GUID: _WyMzK1tQPsLDn4fbs-MY_GjcufHzvcK
X-Proofpoint-GUID: _WyMzK1tQPsLDn4fbs-MY_GjcufHzvcK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

When dpu_kms_hw_init() fails it calls _dpu_kms_hw_destroy() itself, and
the caller then runs the ->destroy() callback, which calls
_dpu_kms_hw_destroy() a second time. Since the global state object is
finalised there, the second call deletes its list entry again and frees
its state twice.

Fold the hardware setup into dpu_kms_init(), undo the steps of
dpu_kms_init() when it fails, and tell the caller not to run ->destroy()
after a failed init.

Fixes: 49e27d3c9cd6 ("drm/msm/dpu: finalise global state object")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..255beb83fc94 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -55,7 +55,6 @@
 bool dpu_use_virtual_planes = true;
 module_param(dpu_use_virtual_planes, bool, 0);
 
-static int dpu_kms_hw_init(struct msm_kms *kms);
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
 
 #ifdef CONFIG_DEBUG_FS
@@ -1067,7 +1066,6 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 }
 
 static const struct msm_kms_funcs kms_funcs = {
-	.hw_init         = dpu_kms_hw_init,
 	.irq_preinstall  = dpu_core_irq_preinstall,
 	.irq_postinstall = dpu_irq_postinstall,
 	.irq_uninstall   = dpu_core_irq_uninstall,
@@ -1135,21 +1133,12 @@ unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
 
 #define	DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE	412500000
 
-static int dpu_kms_hw_init(struct msm_kms *kms)
+static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 {
-	struct dpu_kms *dpu_kms;
-	struct drm_device *dev;
-	int rc = -EINVAL;
+	struct drm_device *dev = dpu_kms->dev;
 	unsigned long max_core_clk_rate;
 	u32 core_rev;
-
-	if (!kms) {
-		DPU_ERROR("invalid kms\n");
-		return rc;
-	}
-
-	dpu_kms = to_dpu_kms(kms);
-	dev = dpu_kms->dev;
+	int rc;
 
 	dev->mode_config.cursor_width = 512;
 	dev->mode_config.cursor_height = 512;
@@ -1301,6 +1290,8 @@ static int dpu_kms_init(struct drm_device *ddev)
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
 
+	dpu_kms->base.init_unwinds = true;
+
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
@@ -1317,7 +1308,17 @@ static int dpu_kms_init(struct drm_device *ddev)
 	pm_runtime_enable(&pdev->dev);
 	dpu_kms->rpm_enabled = true;
 
+	ret = dpu_kms_hw_init(dpu_kms);
+	if (ret)
+		goto err_disable_rpm;
+
 	return 0;
+
+err_disable_rpm:
+	pm_runtime_disable(&pdev->dev);
+	msm_kms_destroy(&dpu_kms->base);
+
+	return ret;
 }
 
 static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)

-- 
2.47.3

