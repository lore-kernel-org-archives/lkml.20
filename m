Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEFC17B50A
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985790; cv=none; b=tV3ko0sGb6KXzISu4j6/EerLH/hFA0Ntnl7s9WFSFwsBjfNyBwmVO70hzGmH5rWilfvFPudaSXhN3rChg8PqMfeXGCU8DbTGj+X+57MVyQBuoa0ctSQA6pkBjVlBbgK2IIVJs0rb5pZu10sOPDFa4DZyTK+JI/+JP+KMiPS7Pa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985790; c=relaxed/simple;
	bh=4PIx9upT4F6pj1ce6EleCxtYsao9DCXnF1q1zAJD6Ac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tl7sVGHCDl71Gxa/tK6uSWck81EWAVwuBIWYsg9zUdnybU5bGFakBzP8/+9tbdxapSV0kKKO7/0QSYKK+lg7L+Ayf418OdMC+pHpNRLvW3zyg4WaVVEwT+G8GuXZeUEVSMYHOgDnvNqoN8EspW7heJTFyfEob8tcRoxQPQSu/vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qy0YgqEP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIK/QKDw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qy0YgqEP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIK/QKDw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ne0c52104561
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wczBi2a9P7MYX7mLDGxMDUnPkgfHZyh0xycifYmGbOw=; b=Qy0YgqEPqG35XS2W
	biwvJ3oJ1gfgjSocLTNX56DrXV8GLPxV9SHtVUtdo76neuSpf63GXTfKQS2soqI9
	zPJoA0BNUxWqRdduCY59sFoGHZ9wz9ZW3UsI0plCmYN2t40gLGyzdhobh80TPZNc
	//F2/WNtwxDlYfyE3L8V+GTjcfkRHNwEPC41q8yZhpeXMhtktWTWS1f1rO4xc3N9
	j7ogxyvLG85Aa01ssq81VisgTip4YmmAHifxWfjQ2jSmdOnXbhG9mhQRwY/fhRTf
	KGwRGgffRlV+9Eyk1HJnV18UbUME4LEoiGPFGtNDfYHT1DHn1YtxRxFp+KZVbmtJ
	Tkckdg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2dxdja9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:03:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so10203285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790985786; x=1791590586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wczBi2a9P7MYX7mLDGxMDUnPkgfHZyh0xycifYmGbOw=;
        b=CIK/QKDw1rAaA7zicKDoImUenWgsfvMILzRxI42ulssy+uSV6DyRza8fQwHRthBhBD
         ex4OvF4bAOlMNwDxKs8rfe6so+Zn7j2Izn3YdSuIuN3Q1YQpZOo6JeOloVYv6sYzX9VF
         /4u1zANYe2xm8tXQtnu0jqVIZv2NHgfRYZKVmNI34nfQgQaN4daw3HSrY3d2zmzWlgOn
         vFg7tRQhwdu+kI0gp5fFvuFgQkzPcyd8L0IkcrPC8CJUOCqpouUMwi7cUVE0BawZmDdp
         qpZJKbhsuHJ6l3NmdhsvIjqfB/uroyUEFDRubzKzWYZRIJD1hCzAigUdNRHpsZUwlPMI
         XpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790985786; x=1791590586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wczBi2a9P7MYX7mLDGxMDUnPkgfHZyh0xycifYmGbOw=;
        b=hlRNgJ680j3We1Hifi6SJ7FJGYoczd1Bxt/LkEesSBvt3BjXybgqTKW3I9Dd4QfkHT
         hP5xEXpfh+1KqJPtJcXkNOg7Gya9VopmM1huy7p0s85ez3FxHHQO2Kf5DhTSQvWlI4Uy
         8b1yj/o3ezU/n6PtiNuQp1sOs6LfdLeLBwelHqFZfwz7tBHUl94BuItolmORTwZvXucK
         QxzzxnMZGQ3iggCmTUYvEVnYopU/+USybaQO8aRBtrlnVIcT+sWCkRUxk8hzMFenOLVo
         dqSmietaPYLUYpxJjq07K/jZBOj5+Pw8U1jCSeI1b5RAMMsZQmDjnH2O0W84oo+NH/Eo
         Pe1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwm1uxn0txXm6i7gZU9HIVtPWtBURTSJsU3QPD1+nkOUvxjkt1zyp+pJtrOedI4nnLYj+QwwqqaEYpra28=@vger.kernel.org
X-Gm-Message-State: AFuF++mLStoZLgzj+VYBCCl2IUltiCJ+UqNWxzZkoXIknSvdw0tANjWQ
	G4VAqv7hNGSxXrh9KlvnxQ8E1oQBS+iKYTA/KDVmn6AkCeU0OQNqbw8822VJHBsNkbeyHjfJcm6
	Rc9rGo37aO2O72mgez+URqbBm5z0mXrTTy1RUvrs11gY3XVahSxrYMblg92vWy60Z3bc=
X-Gm-Gg: AYBFou3pYqTAfhOxCd4z/hq2gaHAch6h2P1PrGr8IfnBimz12RltTWJ+0SQjczHcC7U
	PmU2wFJ5YaOFGfwqIakrEEtp8pETUsO3nU++D8e63Y+pShLU5PGCjcgqNPWS3kRvE/5EEQMmVsL
	q/+HKp2p1TR0orW0umiml1RpI8clIZry31NnUuW95O80CUap9dcsfEeqmwq8hZBFZK+mqCZbi5y
	M91GVD6s3eXbKJKJB0mAcF6Z8reuN0ymxc0j2oYEbx1yetKP63u4hc8F8Y/X9oOHc5NlVtGakOa
	RbCFrTnVKzHGe11t1OEoEZ4lIoeFKjEPDdZO3KZmeYKRXzOZEXWFq1EX7Cs2lHAvNiU0TZzaMx4
	O8Bv6fojC3E8yiYDwk00+QvOjoETT3zlsIw4apYEX8oAqSoNltrzSFcabkoGfZWAsKCL3lU+OBl
	RgAx4l3WNrT3SD
X-Received: by 2002:a05:620a:4481:b0:93c:c6d0:195f with SMTP id af79cd13be357-93cf1700bafmr843690485a.27.1790985785843;
        Fri, 02 Oct 2026 17:03:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4481:b0:93c:c6d0:195f with SMTP id af79cd13be357-93cf1700bafmr843683485a.27.1790985785212;
        Fri, 02 Oct 2026 17:03:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f7b4esm14234531fa.14.2026.10.02.17.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:03:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:03:00 +0300
Subject: [PATCH 2/5] drm/msm/dpu: don't count the cloned writeback as an
 interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-dpu-quad-pipe-fixed-v1-2-6a6a00917b71@oss.qualcomm.com>
References: <20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com>
In-Reply-To: <20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jun Nie <jun.nie@linaro.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3442;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4PIx9upT4F6pj1ce6EleCxtYsao9DCXnF1q1zAJD6Ac=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEY0+f0uLreMHCTz8j59t+OQQktW6Nk8dWtvL
 99sEhiLULSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBGNAAKCRCLPIo+Aiko
 1TO2B/9n6KoJ07l+ZoFV5Nma+JosA2OSKUDzxQvdwLH5hUKPnQCq79UaMdgsU6v1g+vfs9U8DHg
 pNVW3S0Tp1UUKoNOsroNtFt6k25136ty32ZQldrQawutiYJ4aji2YvSv+VUKLKQmQ7iUm8LWlno
 vdHx3Q+7/M/YvW+VbXJxmXszXq1VuqbhPx6ibaMWseYLPnCEGj3Gwl9ohD1/SPO/23kiA36Gr1q
 LyXOoQGFUwY10ebJ+izZo76ilaaLAsqaJlPUg9EcLqn8f0ll/m4MFOecOq1yQFzy2CBwq++CIkA
 EqMsNmdVGVC1R7nutCfgxA0prdJc8qubVK8SRs2fPiPtSA3t
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfX9YyTcRUDZDkg
 1PZgL5UNSYLz/SETWxCJ9F/60S5HXA1jYyPwY4DkVc89iVC7Gl7IkJl4iHHxOCtw2gRF7xXBJuc
 v6xRju9JPkPzg4+EzjzqAjGRAqHT6kw=
X-Authority-Analysis: v=2.4 cv=Ko/YSmWN c=1 sm=1 tr=0 ts=6ac0463b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=rwtzSE6-eAm3UGv2b74A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: P4ZQc0M0JqGLnuH1GZqMjAArwGVTKILu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfXyTMgpNWE/ksY
 +A9lLlDazLLBaiP2Ute8If5jqy6L16LM6bas0FswlSoGYxa4rz0W6VEHq1b9NW2+tHPhv6O1QX1
 U2pI6tlHKpV7dMQcMsFOfihYqt5deO5+3AmIUUWZlDf58SOUt2G8xQ/3OwXBYTxUARZ/0CHQADB
 1n1WWBViDHpCsfAGneDRIifbFMBiXXuEcXw2pji3neh7KN2D3+2eQEEZtby7Q4s5HLHU5vGFMtV
 I4hOrq52TIhKdgbrxVUAaafnoiCV3eSwkBO/1pjJ14b32ATYFkvY3CV8SlYViOL161zaUjp6MnH
 T0pdje4NKlOsSkiRNHNBPrNCZhw43o7RD8n/MBuLrdmuILwjskfR9rddz9ImLETFXKENbywPxUj
 bKFRHIp+pkE7NSxVIged7+5QGWNQnFA9PUVzOw+Zk8rh9cnVUy0dXdyeSvEhPL3HSrOBH3ZKlCc
 UHgobbM8t8wpd3fT3Uw==
X-Proofpoint-GUID: P4ZQc0M0JqGLnuH1GZqMjAArwGVTKILu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020095

In the clone mode dpu_encoder_update_topology() is called both for the
real-time and for the writeback encoder, so topology.num_intf also
counts the writeback. However the cloned writeback has no datapath of
its own, it taps the mixers of the real-time encoder. Each user of
num_intf has to compensate for that, and not all of them get it right:

- dpu_crtc_get_topology() skips the "two interfaces use two mixers"
  rule if CWB is enabled, so a dual-DSI display in the clone mode gets
  a single mixer for its two interfaces if the mode is narrow enough;

- _dpu_rm_reserve_dsc() compares num_dsc to num_intf to detect the DSC
  merge, so it doesn't allocate a DSC pair for a single DSI interface
  using two DSC blocks while being cloned.

Count only the real-time interfaces if the CRTC is in the clone mode.
The standalone writeback is still counted as an interface.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 +++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  8 +++-----
 2 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 42d0a529b4d5..828187f46eae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1385,12 +1385,12 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	struct msm_display_topology topology = {0};
 	struct drm_encoder *drm_enc;
 
+	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
+
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
 					    &crtc_state->adjusted_mode);
 
-	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
-
 	/*
 	 * Datapath topology selection
 	 *
@@ -1404,16 +1404,9 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * If DSC is enabled, use 2 LMs for 2:2:1 topology
 	 *
 	 * Add dspps to the reservation requirements if ctm or gamma_lut are requested
-	 *
-	 * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
-	 * enabled. This is because in cases where CWB is enabled, num_intf will
-	 * count both the WB and real-time phys encoders.
-	 *
-	 * For non-DSC CWB usecases, have the num_lm be decided by the
-	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
 	 */
 
-	if (topology.num_intf == 2 && !topology.cwb_enabled)
+	if (topology.num_intf == 2)
 		topology.num_lm = 2;
 	else if (topology.num_dsc == 2)
 		topology.num_lm = 2;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5a06a0fbc7e1..65161efc4294 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -667,11 +667,9 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 	struct drm_framebuffer *fb;
 	struct drm_dsc_config *dsc;
 
-	int i;
-
-	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
-		if (dpu_enc->phys_encs[i])
-			topology->num_intf++;
+	/* a cloned writeback taps the datapath of the real-time encoder */
+	if (!topology->cwb_enabled || disp_info->intf_type != INTF_WB)
+		topology->num_intf += dpu_enc->num_phys_encs;
 
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 

-- 
2.47.3

