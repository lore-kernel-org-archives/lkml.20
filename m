Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797621;
	b=jbc04T+ivq4tLpScIuh9iEFt30a3e7pEmdu2W6//UxzHF3el2JdtelkeReGfxjEKheHx
	 zQ8YB4VvikTKA9DZxLLEpzIGnv08PtYNe/yVXp7qcl6aDu1Z+w/et7zPCwa2vV5Lreymz
	 Izo7GVwCp0e7w/S71GnE+Gx4DaX0xtAv+rr99vCGlL6Gr56wXVN1chK0DiKt12ej8NpiM
	 2eeE+wrKFxGzo7D92rWVzR8xPcEhiKuwO6i34MP5qlPF3Umvyfk2io5Cmv8lz3unfWyKn
	 g1eFCBVH3WL19dWJoRdWgVlRQ973zrsAsarKE1APyV5lAjXuDvkrgwpMNtWh8xVdJOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797621;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bouo2TwdZYWtrlod8zFDy+axmmNowG1vvoPhame7Qco=;
	b=k6D+6Uyu9VzipnckXM4+XNMREJJbbQ29IY2NcO9F6yG+mJSAPcnurFoHBvXqhuQoD7mo
	 Gh39WklyuK3RPLtYRVnEkNkdJXTSkh1FlVQ0TDb81Z/yChNeVm2K0XvJ+CE2VwEMV6K/a
	 nuyIQRsxMyE84aY08o24ze828jSHRveV60EArbBygJ0cYc+cP1nVlwSNkL/nzPUbCk18m
	 YJdIUJyd12/cXqrS4OaNoSEZj+RVQT/3BKPbNvwgz7c+Z/rayniuWlVDPWRakKb2ptm2e
	 rV9xfDm17wEzne2KnuwT1F2OHNixLDHW40CqQ7OKgPO7iMns+1vZw/DDrgNOjgWz/pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AGA4Rqmi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Je9xtqnr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4779E606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4779E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AGA4Rqmi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Je9xtqnr
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLwAkg2965145
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bouo2TwdZYWtrlod8zFDy+axmmNowG1vvoPhame7Qco=; b=AGA4RqmiTNsm1iS4
	bsxrJ+GgMuy6yLb8KIVQwB72T6w3B1VfSJwYcoQ/MWbK2QS61JJ9fj8MMHONSnyU
	AZJhZEHXKQ/Rpgx5g77z7degkURdy5thgW6BeXqnpeghltDlO8pMP9E2oUcrUhHW
	Rj/FuZ1m6exY9mJ6/j1nMXcAg9afdtRM3myTw3CY4hR0/Jrg2PzCoQGtZU3IRjpv
	YuBbXF/5PeDTkLgVzDm1F0eoWDcgTaBO8kZyi4jDeLe7X7Y6z7B1ZVY/r0KmYLHc
	3L29uht+TFJLng0cNcqWO05+njoK8nc71YmiQePEzma7XXyK4VOT3HqCCrr2CoPK
	GD3YZw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc9c5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91961d4b31bso34761356d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797620; x=1793402420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bouo2TwdZYWtrlod8zFDy+axmmNowG1vvoPhame7Qco=;
        b=Je9xtqnr40Xjy06Fbz7fjrYlkMCC73aISjuhvDWOG6nMOBP1Q89yoEcTPad5qCPjav
         TDxKzOd1jJOruF/sLD+b5/s/4oEQbvtkZFltdkd543YGIZwvr/TznyoTBZ73pnNGM2C0
         H292IafTytmGOLjecfjZZl8tXl3UFfrG/mY0PGFHjZINA9/1OYgU7Os2geG91D7rFZrB
         epfyo1mPTja6RTN/1n4LHRuerqceVOulc4xSpPcM/QkOttmM3p5F7JaqZpLAF3UAWpGa
         F+fh/1OotU03NRwMNzUtjQH501K2+AhpRZtgfebnoqhPNN/e1FTNlapGiy092bWdVTT1
         7kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797620; x=1793402420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bouo2TwdZYWtrlod8zFDy+axmmNowG1vvoPhame7Qco=;
        b=vs8+qyJlHiGkQFwDcVLfT+94E6v0l2YuVo0QWWoLduIHzSRmHRbAxGIaENQcshkmWt
         i1hJj6KAY0IbM8BFJUyQntflx5scnk/MRk53qBnAg9EAQrx3mI5J2tfOMu3R7x6HBJMC
         J0N9+H0YLzjuPKEzBa9ufr21Vu+NiZP6Sa5U4XNLjpYm55l301DpGPLdTB3+3eGUx0Ot
         fibbXRWugq8fEnE6Clm/ls84biCCbwGMLLG4puXcbp7LDBaMB7nMCh54/PeJQlYdssxG
         4K715J57GX04zIWtrzoHXoFMGANVRSJ8fMS/q8bVQkkYdP5ReX74sicXbAfN9tuIjxBq
         qOCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsmzDjFKy0Uwq9McZYneyffux67VsABXlSCivDT7Ec0BweUPtEgCuzI5LxzNQxPmhRdvE1q6JtWKJwhMU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvg2wInLxC73d84Y+JFhpM2MPv8/JJxhH9tJb8DyDerYgMdPfm
	2HPxDfd9C23ScuCh+N1EEXTT0EJyb38ya8TtwhJqHjBZkpQ23ka6zrWfgkz7OTHO5+zS2L/eDFW
	bV9gB8Q/4x1JuBIxX/kgw3Om79+SqkfYNiXL6wmY66macotaLf+ddXYoHKNi6xg/W8Zc=
X-Gm-Gg: AYBFou2Va2bahiiJx4bICVHxkq8WbiFhH+NTSs5BzJQfGQw4jFWf2utQAvjcPnBrT1l
	ozhmCWGFfgBkeuY0B6TgsdcN7MI0PE13ccMKSQ1AsAMsi7GIV2T183STpSaAokB252BwTFMOXb4
	tDqv8Tcur4Ldz9ZjIu7vvB+c6KT87jTJdFDa98jq/k4VzdXnifTCmlFgEtuZkjameqY5PZMbOBE
	QZi+dyP8kahXIu4lWAPmjA04HVknzdDUrSZauf26aaYC6DTPcyzV/sl8qpMCE4wx9KlvtC0XN5V
	iQZ5uS+77vOlw/ZIn2lEhxzlHtqxGBfYpAs0cjcIUUy0AKd7JYt5N6LlnWFR/vWYs/8D9epF9Wv
	iVShsF5j1A4ZcFFPBw8GFPWy1ffXWgDe37oDvDQWf8QmM8wyvGVL6LHXE0XSFEcunVk7vmNMEuo
	+CFO41LJTVQNRI
X-Received: by 2002:a05:620a:4628:b0:93f:2ec5:7e1e with SMTP id af79cd13be357-940ef9322d4mr94120585a.65.1792797619547;
        Fri, 23 Oct 2026 16:20:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4628:b0:93f:2ec5:7e1e with SMTP id af79cd13be357-940ef9322d4mr94117785a.65.1792797619096;
        Fri, 23 Oct 2026 16:20:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:40 +0300
Subject: [PATCH v3 07/14] drm/msm/mdp5: unwind a failed mdp5_kms_init()
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-7-66a30120a5ea@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4313;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=opQ+Hay17WlVMklcY1kZq3cMOOsRo3ASKSUfJonVxsQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uTAxaJ9ToYBaS3tBcK/CiOnSJBkEzedlgXm
 N29faEu1XuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrkwAKCRCLPIo+Aiko
 1VmSB/sH0k/jc18bOj8XnRvDZZ0ai/kVj6c9174VdVZi5yuymIMM5HCmTC8/DTNTMRLpGUwDuuu
 mcyoz/fwICXQzneuwi+CGuImyhBg5o4GHzZfKwlrjSR+TUytDZIS8z4NdJ40C/AbWfkelOy/B87
 kQ/Cw1q0FpV6IyrltqyQWZszCwdB4CKV/dvBMVYmKX+pvUdo4Ss56B4kks7LDpQ0czTxhsc+iko
 zERHcFMVntKR/2WEaQiHYpiQjZk2GYYasjmX5Pqq5He0GEL+/sIgr+/CliW7wwMMODn4hmYT0QO
 lG3x2eHBXrmi4/w4PryG873n904ivV9zxT0fiLLga+/fuki3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX9msGjyj3XdOW
 7LAb8VGs4oZ+MvaIHkpvrq/fjf51NIHCko9l1G5bKaOZh15v8ikLW7n73Z+wVOoNzYn8rsWS71+
 zTgThJ3xtGbi0h5dYjrb/knOAb7FDlz1o8/QX2wI13p9mLhlYnOS47BSzjgNYyZMNsHq1n4uMIQ
 0QKyFnRWBry52h0vWQiZdjpTdjgoX3Ti2eWkH9Ze/gEih0cGGSJvs53uY3SP1gh3D2CgakE5smu
 rVC01uE9KlwgESkHz7k+ZGyvPhpyp0IPTd6NlflG2+OQWYBxQo4dqmG9IhWFhKjixX29VxItqd6
 6TY/JfHGG5E5SxRAsePgr0nnNATF1gM2ny8lMbbE81XgIMFy0FIyge2R/5YTfNZ1hJ8LELAFhp7
 mATb4Y0AiFr5v2tTcsF+YePUNOSLKu69eEMuPtG/EDX2vS462KfLMvecfgxHPV/dQdsYZTzQtZd
 LIMuGno3GJKm9LUkGAA==
X-Proofpoint-GUID: c9Yl3nmGrQJpcu97rSXILDX1RdifCn3w
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adbebb4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=MU5U8ZpPrSxGNErEH5sA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: c9Yl3nmGrQJpcu97rSXILDX1RdifCn3w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXyxq01j2y4t3l
 gbhpa/0c+QV4yhfpxjONV2UKcqlCo/GlET99+IUCWjs+/KukvQRvPF+d0wXjxCaSe5E1tRSGHDk
 pMT5sb/8j+jYmqBt22FCLosTy9701f0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230092

mdp5_kms_init() returns straight away when one of its later steps fails,
leaving behind the kms, the runtime PM reference taken around the address
space setup and the address space itself, and lets the ->destroy()
callback, which the caller runs afterwards, clean up. When mdp5_init()
fails, however, it has already run mdp5_destroy() itself, and ->destroy()
runs it a second time: the global state object is finalised twice.

Undo the steps which have completed, in the reverse order, drop the
runtime PM reference on the error path as well, and tell the caller not
to run ->destroy() after a failed init. Fold the hardware setup, which
can't fail, into mdp5_kms_init().

Fixes: 8d58ef346f30 ("drm/msm/mdp5: Add global state as a private atomic object")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 45 ++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 085c23820f46..30af8ef51e4c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -19,9 +19,8 @@
 #include "msm_mmu.h"
 #include "mdp5_kms.h"
 
-static int mdp5_hw_init(struct msm_kms *kms)
+static void mdp5_hw_init(struct mdp5_kms *mdp5_kms)
 {
-	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 	struct device *dev = &mdp5_kms->pdev->dev;
 	unsigned long flags;
 
@@ -58,8 +57,6 @@ static int mdp5_hw_init(struct msm_kms *kms)
 	mdp5_ctlm_hw_reset(mdp5_kms->ctlm);
 
 	pm_runtime_put_sync(dev);
-
-	return 0;
 }
 
 /* Global/shared object state funcs */
@@ -198,24 +195,26 @@ static void mdp5_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
 
-static void mdp5_kms_destroy(struct msm_kms *kms)
+static void mdp5_kms_destroy_vm(struct msm_kms *kms)
 {
-	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+	struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
 
-	if (kms->vm) {
-		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
+	mmu->funcs->detach(mmu);
+	drm_gpuvm_put(kms->vm);
+	kms->vm = NULL;
+}
 
-		mmu->funcs->detach(mmu);
-		drm_gpuvm_put(kms->vm);
-	}
+static void mdp5_kms_destroy(struct msm_kms *kms)
+{
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 
+	mdp5_kms_destroy_vm(kms);
 	mdp_kms_destroy(&mdp5_kms->base);
 	mdp5_destroy(mdp5_kms);
 }
 
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
-		.hw_init         = mdp5_hw_init,
 		.irq_preinstall  = mdp5_irq_preinstall,
 		.irq_postinstall = mdp5_irq_postinstall,
 		.irq_uninstall   = mdp5_irq_uninstall,
@@ -506,6 +505,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct drm_gpuvm *vm;
 	int i, ret;
 
+	kms->init_unwinds = true;
+
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 	if (ret)
 		return ret;
@@ -517,7 +518,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	ret = mdp_kms_init(&mdp5_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to init kms\n");
-		return ret;
+		goto err_mdp5_destroy;
 	}
 
 	config = mdp5_cfg_get_config(mdp5_kms->cfg);
@@ -538,19 +539,18 @@ static int mdp5_kms_init(struct drm_device *dev)
 	mdelay(16);
 
 	vm = msm_kms_init_vm(mdp5_kms->dev, pdev->dev.parent);
+	pm_runtime_put_sync(&pdev->dev);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
-		return ret;
+		goto err_kms_destroy;
 	}
 
 	kms->vm = vm;
 
-	pm_runtime_put_sync(&pdev->dev);
-
 	ret = modeset_init(mdp5_kms);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "modeset_init failed: %d\n", ret);
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -561,7 +561,18 @@ static int mdp5_kms_init(struct drm_device *dev)
 	dev->max_vblank_count = 0; /* max_vblank_count is set on each CRTC */
 	dev->vblank_disable_immediate = true;
 
+	mdp5_hw_init(mdp5_kms);
+
 	return 0;
+
+err_destroy_vm:
+	mdp5_kms_destroy_vm(kms);
+err_kms_destroy:
+	mdp_kms_destroy(&mdp5_kms->base);
+err_mdp5_destroy:
+	mdp5_destroy(mdp5_kms);
+
+	return ret;
 }
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms)

-- 
2.47.3

