Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8391423394B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987457; cv=none; b=PFlOiSiijPb53xh5RW3G4npRIlb6PzodyOwYPU47ZustQkgKo/qmQEQvFZiJGs92uRbYrkqlYl/80zByqcR/s1qIdTVzhapsye3FKlZRB4ZirfEL/PWBvBWS0WtZpHNYWwCfuFxidoykWS+Bp0MdQmoi4pDp9OJweEEq1TNL4r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987457; c=relaxed/simple;
	bh=9SDSxKOaGPLQHPgJJ/MJ9sA9C1jx4gbbbbOh77Pqu4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nWax/mymCHU17gOWHz7wX69h2wyBIQRzoA8by+sh57yMH07bg4iWA1TMl/UxMKTQSgyXFW5rYL7kSrzZDCg5tSOiyjd/7tmPp1sg030UGqSYZOTDfGQHvJSGQmKF3tSS6tkdm6PNY3f926II3ZtgjPo5S2e2slnauAND3YnLxzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QNJGTYJq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqWZ2U56; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QNJGTYJq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqWZ2U56"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeJot2309789
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TKSzVpF9Y5u9f1YmazNZW9NP4SNsefNUw/+8xaOI3ao=; b=QNJGTYJqYbva8TwF
	BeM3Umn0WIG+tM6NsEM14V0TP8J9qt0lfoFkNpcHD/rN1qMQT9jFWEdBEwf6Ji1+
	gdHc/I2Uf7MCT/AxVT83+UE+X4zbzDMi9ehVGqLg7i0jwhPillfFi9UAMMr7EDM3
	miuJzD/eflCilqXQjmbgpb26JRKGYL5Vgyd1qeT8Wp3dYsLp+omeyvTHrW+DzbeS
	dXjQ6sBvv8c21YSlekTYWmWc8Z7CyyZFZFgiWQyEBniBIJx2gy+PoZHOfoJGwyxa
	8A5pO6KAyuOMwlpQwRihd2gAnUcUIP2+TYi5ZnD5P4xevlzfJthaYfnOEThozHD9
	GVcvvQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2f3da2nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:30:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so20569685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987452; x=1791592252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TKSzVpF9Y5u9f1YmazNZW9NP4SNsefNUw/+8xaOI3ao=;
        b=UqWZ2U56UKJMWi/BKlWo9JbQmtxn8kv6AdDs69zi9c0tBoECYK9FhuQLrpeVk00i2H
         CsqqfOAjp227qAFLSjuTd0c8fiBsxQtJcrhirHNJIJpSJSEXqwXTP3fsYlYLPcOIA+/S
         pqCk/TTdyEmLWBANWzzJlW0hmPosqHgP/z59kYifDiKMplHjBMKzGidkvKkdbADGzQ+M
         a1hlDyzGgCjUyqb6Jl6n7c0LOishaaySXjdjQtIQ6fV8Uk+xA4A4MBtOlYS84C7WT/oT
         WZheLVdW5rQDO8p6kdi4WWQ0kJM2zFP5GdrNdu7tJ+I69Z/GlFy/QzvAd7qKK/py68u+
         XRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987452; x=1791592252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKSzVpF9Y5u9f1YmazNZW9NP4SNsefNUw/+8xaOI3ao=;
        b=eyj5WyGncKeLApgQziW0CdCvUQYjX1b1Qur+X6fASnw/X1yOCUHSEKZAK4XnJ+jxgB
         sNDZAvqG+NFKxjZf6gBI9bgdOGC/vhcWhPGXmTrANe/Y0IF9OJx74Zd0bjMGMfr4h8I6
         Dyu7MTQ8iD/2tESTFsZ99MPdN7PP1vl2BR5ij+4riuQddcOsk1CiWD/A5t90IYDYolZF
         CaNSgEs87jRu5nSPF98589rf7ZIu4pgICd4JteKKaSxJb7ccYmDKyCknWzhjAMOD9KGR
         +lGMYmEwGwkIhq717FB52d2Lbch87m+PUMukp/bbNm2fvLGe5JZKq+0oG0AjUUiFg2z9
         peyg==
X-Forwarded-Encrypted: i=1; AKwUvBwYezS8EwbK+5ag9R5UbgM/HspEk+COyB1nMJjBHF7ZcJRjkV6eG3MCCFN8C1rqb5QKN6S5fYqmy7xYeog=@vger.kernel.org
X-Gm-Message-State: AFuF++n9/2nSiHVIL9avvFzVhgdptv364JtFY6vIM7QQLmRuQ+/iLp5X
	IziixDPhf7SXxs6DamjanN2mKztRJY5IufVrKyiFm7LNwofVKdXATk+WeD9KcAQqyH1Z0ahHFfk
	CJat/uziNLZfuT+YfyrpdQN17xiDVTNGaJX/z2KRzLgMU6aCwO8vC9KpBzgOPCgJ18NA=
X-Gm-Gg: AYBFou0TG+E93mk3yc+n2fQkAoprdsM3/37eK/CuLiO5jt5RUo+Z/B45s93H3S5ViYg
	ssbroLS/9tOSxxyQ/htaXpkoqQO0iQ5TTMBfgnl8sNGi/CY0VzlMp/VcXa4R4LVQoVI6frtjJde
	8frtbA7CMKqTLNQhd3cfCkJVaUkrzk+lMoFqZeiX4MlFcRmXmc77AoE5F9ThGm/7dJLbOaPbXBo
	qF0wEncFB0hd3YwS3nRe9gHG8X/9n/qxOUISsSbT75YUPuSKW+geVKOb4IJ8xubAp1jFRA/9PGc
	bZb/i/8LNxMB4FtWTy4r8BeEdRt8/YdyMbvfYeiQS9azN+6RExBGwVtoiPlFiB4zyfvLxIstEcA
	9CxI7AIfluaKQ4PldoOXZZWXapVKdOtaMdCQKwpKN5M61Brh72H/+WQ4LS2QRG2MPGVfOCg8IIe
	q0Fz0LdN0R6Kkp
X-Received: by 2002:a05:620a:a2cb:20b0:93c:9edd:7e6b with SMTP id af79cd13be357-93cf170bfbamr599120185a.29.1790987452195;
        Fri, 02 Oct 2026 17:30:52 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cb:20b0:93c:9edd:7e6b with SMTP id af79cd13be357-93cf170bfbamr599116685a.29.1790987451614;
        Fri, 02 Oct 2026 17:30:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957d0sm1133979e87.31.2026.10.02.17.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:30:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:30:24 +0300
Subject: [PATCH v4 09/10] drm/msm/dpu: only reassign resources when the
 encoder is reprogrammed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-fd-kms-fix-smmu-v4-9-2a44d4d8ac77@oss.qualcomm.com>
References: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
In-Reply-To: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
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
 bh=9SDSxKOaGPLQHPgJJ/MJ9sA9C1jx4gbbbbOh77Pqu4g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEyed8IZzZGwq30zWZitw+ph3kFy0hD5iced0
 HynY3ZqVieJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBMngAKCRCLPIo+Aiko
 1VklCACNn7rkJtTd/eFXEXonWfW2YKR7qyLoPYl6sZPBfDd1NWWakc7215rba5CUGoGIuvVLhJ4
 atIHIm5wUuK/xGLzKdzARtyWbqBXAFbPafHGGEMdg8qv0xZATS8iOe8Ir4plnULmOxM1ZBvfKg1
 JbG9E7qIRP/KbjFp2eLEjHwsb2R0nNr+frfn3fNbW5AW+ATyhfQYdyeoij1oqCoY1z90Yw6IEae
 2K3+kMc3/0evFg6DuWGYLQw5pIQmDKOMVpeDcKcexT/eaDMzCR987ictRMLtEgG1t4qrZqzz5Gv
 Tu05Efwh020EvGg5jTmHx6Ejj9dVzbBrOflPo2i5JhaBTUJE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: OVkjRK79bRBoLwWD4gNVQv_6hwf6ORVV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX+3P3NBoZMtu0
 Fe2iJDRX17EkrxnGvHA5MR8lHFaHjvY9RTQH8wa6uqTcwcVknXp1hyJmeYJE3NJPRadguF5x/zf
 PEMtjuhoel3NAROqwEy3NeF8Sf6CrpI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX0eK8hg2bveAJ
 +cpj3hMayLq2YO/JxQIs572CNd1nQHVTpL1t6d1+uX9EokIa2P8zxNSU5BciQTFNRNtUbjuFEvK
 TWUy3RH66EPpu7E7wHa2dYqDpEwLvpdbrj0idLj6/Uol7XndsFoWHGGB6Vz82iRodFcpF6DE80q
 gNGMutEmZpwb3nePfqQohliVm73P1bxIx5O2RLvnoly+3/RLraitLxUy0+Tw6I18Ns15/pVfnQU
 pf4OE9I55fWEPYYSW6TcmO5JeeVilPzCGuPKKSTJ0vcxJ2YQJth9hnSWs/L8RYgztHtiayuxDuA
 EUs7cyPTlU77gonEn7o8S73OL/cpIy4bTLxA2qknkLWUG+1EFFfNWPWafhQ4Jg4yj6XZo1ABz9j
 s2gQ97ozAd/1ijDNZ+e47k/2adY/EEo0d1H7bvPsUkqffGbt2s0wV4jmaIuxq1tmlO616AIfDJ8
 FzkApObh7S45bt+Gk0A==
X-Authority-Analysis: v=2.4 cv=L9SI0OT8 c=1 sm=1 tr=0 ts=6ac04cbd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=A1gMwnIAOo8MrSanVxoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: OVkjRK79bRBoLwWD4gNVQv_6hwf6ORVV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

Running kms_plane@pixel-format-source-clamping causes SMMU faults
(fsr=0x402, iova=0x0001fb00): it sets a CTM, after which the display stops
updating, so the test times out waiting for a CRC and the pipe is still
fetching the framebuffers released when the runner kills it.

dpu_crtc_atomic_check() reassigns resources whenever color_mgmt_changed is
set, but crtc_set_mode() only calls ->atomic_mode_set() for mode_changed or
connectors_changed.  A colour management update therefore re-reserves and
can get a different CTL: cstate->mixers[].lm_ctl points at the new one
while phys->hw_ctl still points at the old, so the flush mask is
accumulated on one and triggered on the other.  CTL_FLUSH is written with
zero, so the pipe is not reprogrammed again until the next modeset.

Reassign only when the encoder is reprogrammed too.  Enabling colour
management still needs a modeset, as that is when DSPPs join the topology,
so ask for one in dpu_crtc_check_mode_changed() and only there.  Drop the
msm_atomic_check() hack, which forced a modeset both ways, ignored
GAMMA_LUT and overrode allow_modeset behind userspace's back.

Fixes: 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 28 ++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_atomic.c         | 17 +----------------
 2 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2ff0dab33710..b1aea5769777 100644
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

