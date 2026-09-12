Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090D047F2CA
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217321; cv=none; b=mc5AoterRrrvdnJcrBzNX/1ethyfr1y2pt9vn82n/oPsnO4BoOY6UeuePYKIadnV3kIxymhClUWQIIoqQGbwhfDJqbJ2IH7E46bNYaPMIemQcx+G9h4GnhTq5l1x8DrOfxfnqGmE/xt5ShUdHrNwJdJ8kct6IKllquhRGuKeiUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217321; c=relaxed/simple;
	bh=mqhM4B8gnWC0chv2JmS2nzeA441LZsa3HAirQn66G6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ij3M9/NYFLobHsi8iBwn59ld7JjHjiWBwKRkWJ2+iqUrs5N6yr32DdIhef9IvXfNeWonbAOPsHnmRyTYSWfR/mgF3AKUN0UbJymi25JU2WLIacq9FFhdTpiE3Xrz/tym/mpGA/Iq3ZsefmoOHRCRpK1CINbwWKGagdBbFWkSLWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MbI3N4na; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grU0CkLQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MbI3N4na";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grU0CkLQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBdR3Z3101635
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8Le9HTbvX+Njx4HmZDZ+JWS3P6BGRgoiPUFcnspqrw=; b=MbI3N4naxVD7krbv
	Ii4/SAgQPW/AXaLtTqnOBDU83JbY7HA2eWQTjhVmqC7Gi5cHkF3va87Rt4b6fuEy
	FcGy351S8KkFJF+ZmGxuetXyru1AIgdj83q+2SgBLab6F1AJl8MNigCZrjliQRnS
	QuVvZoR2dTutzGBP7m/6ViTuiVtQL33WEpdvKgID+J3L4QFCmqlgKpNfm/1RZ47r
	UDbtzxrlAhFAy1MBPDcefJi9bDTGGM6SvaGedCgYk7Gz+W+fAfkln9anEL9VmvZU
	cpXbAkl9eWfn6f6jT8wyq9oGX8gOYbaAiQNFe7/XrbOM7zHUBzO0jFonoifOYZJv
	KlhKgA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c8y6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:38 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97ca6578487so1608559241.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789217318; x=1789822118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U8Le9HTbvX+Njx4HmZDZ+JWS3P6BGRgoiPUFcnspqrw=;
        b=grU0CkLQHhqWA3L3uNiLeduYxMu0IJCuw7wR39Qoy/ZDw+axKJ2+oWBVYhPxSu/fpe
         +PnbOPYSYRuwwmdYu5L/Dfp+2L9M6aLepu9ZUUhdR1Q6XVjrTkN0+ESFHmzngrl2Zp4D
         rSRW5LSe99idzj4/2DpIsYcIEBVpyNcCQUdmXH9xJfbdBGVueunxHyleeGCu7UU4piq8
         S3RwskoAqD72pWm7Snx2PEOpjwsysMLFSoLCmuDwxut5EBOD4sLVOxARaUSRjUZM+KJF
         fXyxP3h7ebrATvpexlsl8vbCWdWDnRLfyADmmjNE2PtkYCMOh/IOsYxqJ8ylBz2J+529
         CK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217318; x=1789822118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8Le9HTbvX+Njx4HmZDZ+JWS3P6BGRgoiPUFcnspqrw=;
        b=mB1a7AIzTk6eOUh7C4Hs4FgqgP+b8NBe66ARuerk+V0YOQlpsMmp7fg8aa7fKb1jy7
         slgTNUm0CDycecaF0yfX1+24RCwLHH5V5jUx15QvIddsa2pYzmf6Our5MPQChTNZ6bLK
         zK6tp2Ux6N9rHfNtmte2IPdvUxuPrSVKoEQNaVa6EyRS8udvzcRmArASycMcYiQWTfga
         tgYOe1c1kELbdsQT+8TdsKuODQan+m52uGVRX0xYZRA2onNwb0UvCtCmfosKU/6g2iZb
         A+/oVhkeCbum/P2y2I/57DHno1+rYEw8zYI4/KWy8HRP4p+R9bNrkPE6zyRB8I9i8tBZ
         YU9Q==
X-Forwarded-Encrypted: i=1; AKwUvBw4Psi+T7v3iMjWYl+5KH8eo8MCBVWu1re8urgSBfNnQre7cvZQWObWn51LQOKnse0Yl8L7CjoKvNZ2F64=@vger.kernel.org
X-Gm-Message-State: AFuF++kaX+JSj9xjc5w8SLoElUlZczRK+1tacK8qjmWbixV9Wffu8UF2
	zqJy3la4JTmG6RHEdoa5YgIjdXF8TWfaV3KJJBIW+Hs8GqEukjELlEK0aID7cfW14iLZ4R53qwt
	auu1gyYPHIEGfoprV8l4JTfSe44ZCgCWIXkJjW31Fq0zzsRxWx4832bLkBqIySzETzdk=
X-Gm-Gg: AYBFou1mRXu0ncRZQ8zKFBHhzWvo5utn8n4zulDpima0XI7eYIDqPA3wkdNxDTV7QXJ
	mEd3NZeKi0sJENJv7dpSjzkGJOjo1IqiAEeY+tTPfJhHdTwef4WhfjwtPt5C04Ih0BsqXy1fXhq
	RI+XNTSPHnab7WfuOjNBMIsQ9Cu0EgtlClne1c9zlrQoqSFHZOg8XxRcvDRQBj7Yb8+82Bgd+Ms
	+MRde5CEtLSMH/R7AgtMpQbfEGlMxNjXV1uUCNb3mkYZWihOtU+ho+0LToKz0WrOsqgEB7WGihi
	1cEekyQBlaTkYeHmBStrfE5mua/zqCNCEZHyrz54+pCyfl9nhDrnDw3LPy0pwaQa8iHt1gtL7FV
	HDCesvOGsTrXt2hO1mAFs7QaJUDHGARDASLXWxcCX2YcK8aYystoiuKhEXAcpxrfVFP/acFItP7
	QKCtJdBKSRd+gd
X-Received: by 2002:a05:6102:3e85:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-792aced9446mr9612182137.12.1789217318091;
        Sat, 12 Sep 2026 05:48:38 -0700 (PDT)
X-Received: by 2002:a05:6102:3e85:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-792aced9446mr9612168137.12.1789217317647;
        Sat, 12 Sep 2026 05:48:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5af37a4eesm8825701fa.34.2026.09.12.05.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:48:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 15:48:27 +0300
Subject: [PATCH v3 7/8] drm/msm/dpu: only reassign resources when the
 encoder is reprogrammed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-fd-kms-fix-smmu-v3-7-a7ddc6fe2032@oss.qualcomm.com>
References: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
In-Reply-To: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4595;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mqhM4B8gnWC0chv2JmS2nzeA441LZsa3HAirQn66G6Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqpUoXjZHbyY1qpDjCgFI1oVlXrQOqcqHE9Tt9j
 TcW/w3KWyGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqVKFwAKCRCLPIo+Aiko
 1QxLCACE0Pz82vSK6bzDBX0Vx+h6hP5HznaervgNVP0xo1/I1gS3Iv+z5qhjdqLysLV9HOOzwLA
 8qT7EafIyEjxOo2B3l7aPBy7opitSEtx5ABhKXaVpWM6koXklGEsk35VmVz6oHHVsYnqvYIZiw/
 g8PXmOB2VKc5DN8wN5i0xh2dpKTgfT3Ac17sIjrA7wUTlHmfanLWpdtlcMdXWBDX3ienGxQFGdo
 b3rYdEBJ1uwcGNbsKo62ckVbh4V15GwKVAaI/2UDVXc5TyGLUc7ThdUPACr5Ie578A4LX9hnqjv
 U1Tp744kT+E8BA+VCHm4ylzfJrhOmHS7Q/SBH03kylU4Bhi9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=e+mT2qp/ c=1 sm=1 tr=0 ts=6aa54a26 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lVXjEyyklXRvgn5FDE4A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfXzUN+Q8GkKk2v
 xIgsB9wCW9jXxZjqguE+l61kO6ki9K6MRHh1XosA2J6sBk0MY/B6g8XwjZ/lI0/pR75oS1gsU9I
 N6hoqyN06SSqCd+Jn3Fqs1/p3fjVRQU=
X-Proofpoint-ORIG-GUID: mxqSZuJLngoyx5Qh-yqOe1CGFSua_WVu
X-Proofpoint-GUID: mxqSZuJLngoyx5Qh-yqOe1CGFSua_WVu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfX1+NBzxhmnlbC
 I99BXdRJzJBEkqeixBPLQnqTUQtiBYXSAluNxK52FxqlaVanTcXKqsHMX08g1zBJjqQERCbMWJS
 PwQX6MULgKeDiJ4PluWHUjbSYo036n3ke2vsEi0avvLK79mr0Z6V7irkEEgoFoP6DvMqkzGq93K
 V+ftkg8C8m64x/pTV7TLbDcdWH4EfDRFcUKFyyZKGvnmf/mf5BKU7E2t+T0av6h8HCbvUTg9vGo
 h9KO4FjpmlCVajWgI+WKDUU5d76F6Il1gQAvQTvv4KCnIRFKQR7exvgogTISaoFVD7IcrrGGDtb
 yexMIYaNvrblhBg3veflsEb9a3AjYPJeUb8GE95O6RRuLeAKzkjBnZgYKZsoNqvFUzY0j51+PXi
 n6IMHApAZ4Tit2FgbmHgJhNnGfa70Tkmw6UnHtQnYAxhkZOx+y431bbBB60XkG1oU+atzBNbQ67
 PNFTuVgmByR4A8lxE5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120184

Running kms_plane@pixel-format-source-clamping causes SMMU faults
(fsr=0x402, iova=0x0001fb00): it sets a CTM, after which the display stops
updating, so the test times out waiting for a CRC and the pipe is still
fetching the framebuffers released when the runner kills it.

dpu_crtc_atomic_check() reassigns resources whenever color_mgmt_changed is
set, but crtc_set_mode() only calls ->atomic_mode_set() for mode_changed or
connectors_changed.  A colour management update therefore re-reserves and can
get a different CTL: cstate->mixers[].lm_ctl points at the new one while
phys->hw_ctl still points at the old, so the flush mask is accumulated on one
and triggered on the other.  CTL_FLUSH is written with zero, so the pipe is
not reprogrammed again until the next modeset.

Reassign only when the encoder is reprogrammed too.  Enabling colour
management still needs a modeset, as that is when DSPPs join the topology, so
ask for one in dpu_crtc_check_mode_changed() and only there.  Drop the
msm_atomic_check() hack, which forced a modeset both ways, ignored GAMMA_LUT
and overrode allow_modeset behind userspace's back.

Fixes: 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 28 ++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_atomic.c         | 17 +----------------
 2 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 5dc0c9aeaa5d..a3b1d2d7669a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1496,6 +1496,26 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
  *
  * Check if the changes in the object properties demand full mode set.
  */
+static bool dpu_crtc_needs_dspp(const struct drm_crtc_state *crtc_state)
+{
+	return crtc_state->ctm || crtc_state->gamma_lut;
+}
+
+static bool dpu_crtc_has_dspp(const struct drm_crtc_state *crtc_state)
+{
+	const struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
+	unsigned int i;
+
+	if (!cstate->num_mixers)
+		return false;
+
+	for (i = 0; i < cstate->num_mixers; i++)
+		if (!cstate->mixers[i].hw_dspp)
+			return false;
+
+	return true;
+}
+
 int dpu_crtc_check_mode_changed(struct drm_crtc_state *old_crtc_state,
 				struct drm_crtc_state *new_crtc_state)
 {
@@ -1506,6 +1526,11 @@ int dpu_crtc_check_mode_changed(struct drm_crtc_state *old_crtc_state,
 
 	DRM_DEBUG_ATOMIC("%d\n", crtc->base.id);
 
+	/* DSPPs are only reserved during a modeset */
+	if (dpu_crtc_needs_dspp(new_crtc_state) &&
+	    !dpu_crtc_has_dspp(old_crtc_state))
+		new_crtc_state->mode_changed = true;
+
 	/* there might be cases where encoder needs a modeset too */
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, new_crtc_state->encoder_mask) {
 		if (dpu_encoder_needs_modeset(drm_enc, new_crtc_state->state))
@@ -1535,8 +1560,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
 	/* don't reallocate resources if only ACTIVE has beeen changed */
-	if (crtc_state->mode_changed || crtc_state->connectors_changed ||
-	    crtc_state->color_mgmt_changed) {
+	if (crtc_state->mode_changed || crtc_state->connectors_changed) {
 		rc = dpu_crtc_assign_resources(crtc, crtc_state);
 		if (rc < 0)
 			return rc;
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index a8babf1dbe0d..7b480981becc 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -185,22 +185,7 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
-	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
-	struct drm_crtc *crtc;
-	int i, ret = 0;
-
-	/*
-	 * FIXME: stop setting allow_modeset and move this check to the DPU
-	 * driver.
-	 */
-	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
-				      new_crtc_state, i) {
-		if ((old_crtc_state->ctm && !new_crtc_state->ctm) ||
-		    (!old_crtc_state->ctm && new_crtc_state->ctm)) {
-			new_crtc_state->mode_changed = true;
-			state->allow_modeset = true;
-		}
-	}
+	int ret = 0;
 
 	if (kms && kms->funcs && kms->funcs->check_mode_changed)
 		ret = kms->funcs->check_mode_changed(kms, state);

-- 
2.47.3

