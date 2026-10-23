Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797961;
	b=KNzHzoipmMj4j7GlusubIeDAPrGCv2jEp6LjZXmG+DLTpfshzPqJGFnyUlYM0bYMukD5
	 pNlMCeMP554hqF11iIF2UMuXlONY7P31NXN0E2HaZPKYa8c4727Q/dyIeIA06nJ13lZWb
	 m2qChf2cSEyCOnERthFb7FNM5MqzXu5tzsLliBJGG8KG8sMjKUziiJC9EIETcnnyhmcsL
	 1Vtzc+LATZikcQy9GD1xAwZ2CT3NvMFlOmOlHsih3oxn2de4qpbuxMf0OAJq+tusB8JvN
	 2npqNENe8nS85PgFllb5Y7XGHR0lgJiAhXNY7w3Ktqc8QtqeyHqFRMdoJde3fSHRSvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797961;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Vr9bnjvssuxLuebxRpgYzgVNkR8qsjc3gztXQ+KxGZk=;
	b=Txv1CVXB/aVM8wWxLoboFOSdeYDq2Ajigf5lKXxJYoxcb+PwXJoByGo1D9ikhX+IIAzX
	 xWy+kGJlouvywbmmGx1ZZVWFx66KLvd+0vnYTDfbrlvGe1I/0YJiIwDJOakaGKRIHrSzi
	 GqHm9ZRw3qS8WYMfU8HgwJoPacVANZ5HmRn+yULYOdqu1a+vFNGbzXgc/SLksVZSWZ0gU
	 sHjDIfcvJFPlv9nw9kBxeWIJ4SqiDHrZLcfjhK9y0m52s640kHjYkoJtQrJI2FPHJcrIa
	 RxyBEMUaOhWqnF90oU/KOpLWpYDMSdnrYFtEdC6kvb84CjwVBpLlOoAjFwn+nH6wvaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UwSeRmgt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R9gfBBDv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A18660A2625
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A18660A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UwSeRmgt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R9gfBBDv
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvHe4372118
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vr9bnjvssuxLuebxRpgYzgVNkR8qsjc3gztXQ+KxGZk=; b=UwSeRmgtwNOqjfVO
	GiR+S6sh4hZp+84uwuxNbQYyvZzqMT4kAdKt0mHjRSgUkrGImKNRujhBnVf9vXwR
	Y2usPVwMYa3iuFraoIz7IO9oqwfszcLRfRuLnUDbKOFjQs92FhtyXxH3t0vg883g
	8L3y6QHoAMsfvpBNTcwS7X9EhDwf5raG+9yppbLZTfTdecd0izOaTLf5up6T3yci
	q6OpNUaX14UkTAtogijoBrH6NwMeM0q+G6Jhh3XRAmqPYkiVXW9C7FsQVzC4d3Hc
	XJDu+66j06XcbQ03z5sHmMxEO/umMT1SxQTq0ZnsoDTMICuaMppfWRscWH0QxXtv
	5klpNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas89c3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca9b53afaso423799485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797959; x=1793402759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vr9bnjvssuxLuebxRpgYzgVNkR8qsjc3gztXQ+KxGZk=;
        b=R9gfBBDvbG9zwUOoJc/qxMnAz62k0kVBgI3beq4j4LWGSz34nJGygVwxkHIxtiN4Oy
         buFrZPM0ctke6dT2JWIAPf0tDaWs2DCsyv6dyF9yCrmHHoActpgJwUiK0Vzyn7QddmT0
         KaQ/sfnhCQfLhtXQLXQwx/CnpLEmauK8BijpLOjTw6kql/eJD7WblvmQQmzVvubhu66D
         T91axnkPrN900Y5qfc4CeWXLnOHDHcDJeQ1ljtH+XLcrYb89XQEk7y1U6D4hZ5Lt7e5a
         UvzVx9SfReNtByoSu+wy/oA3AHhTFvhXqd/KUkI3xOw05fj30/ol3EZrKjFafduqPgkm
         glcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797959; x=1793402759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vr9bnjvssuxLuebxRpgYzgVNkR8qsjc3gztXQ+KxGZk=;
        b=Q7lsXpJ/84/IkzzYGizOpJmNEthAHrp8vpmfNmrk+sxkprWZNUBUYhnzv35iHQFoZl
         Ky3CLz6HzSUuvj9lauNIpvwdvxlbLWo+vK7zfmCznZ0Cq5cw25722ZJWj5Jed/h4Ppf1
         gtDmlMNlzfu2R6dhGMHr3AjXdfMkYYIrFazGARXJQ2I3e8we8VGjtKbpRwlFAgWb2N4X
         NkqkfkqiJr5DFMQ+jZC85QpPr9t6DsxYjn09qZtXB6tVOqhUyOca1bQFFJRRaMdKpdqW
         5oKykhxVvurPH/GC4oGUDPL8ZBOI53/OT1jsNuiXzbHvf1mIDqa/L0jfCcRQR1czqoXC
         T++g==
X-Forwarded-Encrypted: i=1; AKwUvByKkeAPTyvmsJMwPqFG0wH1OhNx7FxO/M7Rnt5V4ecfiCb7VV3jFa5iHH7GoYy6UQ4P0BOwLX9Pu3biBJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1HkM8ImqdE9VrRgWcvg5sdZn1YpfXiR2kfInm4rCQS6xVDC7i
	HMg2c05S/RuNBK/UHRniX4saOppiMX0orBAg3tQx0h1snePdD7dIuixidiYpGhlx/6PqiF+ORS4
	nxzo3DJrX20LdW+aOzrBwe6YNPlYkBp9Q7i/9qpRlBKfvjmgzeKxSmvacuAKXK1VEHzA=
X-Gm-Gg: AYBFou3s67WdrUT7R13YBCu41K4px33IZkixCEOtPs4Mj4COclvgxlxOPkuoU2qt6+H
	ibmmkhBs7THrzswflZMyqrMEB5K+vJQHFyrDasZZqJa/h93ZKgnoeXsLLaAFW6C+N15/74W+fZ3
	mHbIlav81YGaDA3tSGVzcs27yrumMyPKZ4DI/lRI/EC+KRGFrp4SdN6GI7hLUGTidKuyXywUZKO
	IP+PZkxDvERW/z/MijMMA2nPsY1BQwBJO32llsTS8JNG8zaxp54KBHtUGYz8cAVVqqONGfCNcVK
	+PM5mz7SkRiAPoksv7FCU6GT81fh3kGUJj1yQjHJ1OOoNnbYeLFz5CrO7meCmawKQBYQDU780OD
	ZsKNqn0iTUbRBV95eCGG+bpmvfVhg+1A0Ha+GqwAcHxln7EZ4BcQCYrC79L5SddN5T+M+uwYieV
	Ru428c0cP0r/UV
X-Received: by 2002:a05:620a:1a05:b0:93f:654e:ddb9 with SMTP id af79cd13be357-940ef8c8221mr79126185a.33.1792797959072;
        Fri, 23 Oct 2026 16:25:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1a05:b0:93f:654e:ddb9 with SMTP id af79cd13be357-940ef8c8221mr79123785a.33.1792797958612;
        Fri, 23 Oct 2026 16:25:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:30 +0300
Subject: [PATCH v5 09/10] drm/msm/dpu: only reassign resources when the
 encoder is reprogrammed
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
Message-Id: <20261024-fd-kms-fix-smmu-v5-9-a5b0b284aead@oss.qualcomm.com>
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4525;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qmmDSBsrWozVVAMrvE0HZ4zhksCA/ZTlUzPFojWOt4M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zs7aVMXMNMacRC3La7G4bkZNjPurn4a0QHh
 Q2bqXB584WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs7AAKCRCLPIo+Aiko
 1QhLB/47Zr7O4aS6TGk/MYk7J9s9T6XTg7p9uMYvN0PlI+TPqwO3Y3R8qgn8tT9S0MnhKBgt5e2
 6QGTcsa+Wce/jlM7XXbW9gwHRrBlPJjm/OcTEtsaJHErJrKEG46c/vSa6SrK6noN8AJYvTBJ0+L
 YWHW864NrVy6qtMrZ/0Hr/XBni3jJLIVUxOc/axT3fpUSX35oor0L3ySoh+aHOrRLxEuoRcura1
 F90iDK2swsRdeGinoDFJ7//QUSIJDldBK/COucy+pCKKfJ4zf2+5P1GIGAExaehjJm/06cFPhCQ
 8juZQG7ZFTZpcfB4N8i70xvxuF1P7kClhXrx3jIlKvnzxv+J
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX1a1LGWy7U9OD
 5CSXtmXv/ueeTc7zGZZ8uEkZjyb/xFk0zpIgDJ4Sjik909ijoyh1S4//zdWu8Cm3pNfuF2XYZgt
 NMfiZMfnuZ0Z+4BC713ye+ZwkiXLdsw=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adbed07 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=A1gMwnIAOo8MrSanVxoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX5sTS8P/kQ6vh
 tjJH5Lfy0dlZOgYUiW/aQqsNWKMuuA8D/GOD31ODXtsmsuyRG70MCUrD7eDJzn2uHeldPH7r2hF
 hjWLAm/jygxZgjVkOyT+qiCW7Ln3ydrbSO4PosUxTz4fy22a5JN3hB+FResZHLyHwMvmqsjB6tP
 wIPyF8WZbynqypRy14wM++cB8DbroLD6D26ecLjLkpHIUyS8hOBGuVH8NjxSDUmyIoVPiD0oitb
 bhJ9/ajnSvA0WWNh7dKFmdENMxF7uRF8eO3J/5zXgggKW/xq2o1DG8L+aPmDuA4tmmI5Wyx9sUN
 XFLzSZWuO2ufa5LySNKTSvsJslF/XBmzo1g5+6UXUUnSp0P5QdXcDB9SvIgeLN83SrZxOjj7W2A
 kWCX0QyWP1BL5nkySgCnpHDZkOOvFUDJhTEC2bn3RXBlSpyNSqhNsAnhN7mtEGcLPCN+IKcwgua
 ZRdGJ5H28DmSVlgiDaA==
X-Proofpoint-GUID: FCZy4PLBLj03dR63PjlAimXEyqEbuQ18
X-Proofpoint-ORIG-GUID: FCZy4PLBLj03dR63PjlAimXEyqEbuQ18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

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
index 2ff0dab33710..048800227ad3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1489,6 +1489,26 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
 	return 0;
 }
 
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
 /**
  * dpu_crtc_check_mode_changed: check if full modeset is required
  * @old_crtc_state:	Previous CRTC state
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
index c26b0c7acdfa..db583cee7f98 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -186,22 +186,7 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state)
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

