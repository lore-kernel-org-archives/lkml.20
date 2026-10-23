Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797950;
	b=TW2pVwvWehWwCFQsxG+BIcF3iOtBjVMaUGK9w0gquD/F9FjXGfML7OPoVwuxqbevXeIV
	 Strx6S7JIDote9DQP5YpkvI1ih18fMp0RWWlCpV+tdSpztaCW/bO4FAoZzF4YBK+mtqTF
	 8294t56+9P0HjboLHINAXOH47UI8aFY70/vDe11gPceTNYTkpkkuuQGMfiiO6aVUI6Qwa
	 tBUmuKVEFwqp9HUFf5X4+VNXfwLTsBXsk3MvyIQgKp6fO8PDrR7AcJMWHwnngK5n5oeIY
	 5DfmmmoVPKl3r5waPxSUCZGlavKQvAzDYig+pfdJiwdHsftToU6io8rYgmIBo18MRmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/LAeqwoWtFqbSPLKUF9sSDQ0qIlLUHbHNTMbGdBh9Qk=;
	b=S20bG5QzkZvZnoNOgiEs+VnBrSD2awXFCsnMoSmExapvt2aWWf4Z8nXcC2eNRdXMicJ3
	 4rCabAKwMlqIbZoE2yEOWBNXdti9CTABv1PeC6Iu0arUjL5J3Mn7EJp9TNJD/c6O7GD1S
	 7GeqEPGYnjafLHbwo0PtA/7QQJ4pgxWBSo1pXMVGmEGZ5DgYYW0cB8s/sQa70g5t2UTDB
	 yUMhMcGXcmLjyi99nzO9SzFyWz17MMpUt9zGCASYMDXRzhe8ZcdHcztPru5+wL6FamLLF
	 ++7QfLH031BwboE9ZlHwQfTBd1gUIWMSGJJX1Ww9v0W/vtepsMGacuoxm1ghzc3wDZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V04Pfiox;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QmMziVDt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F9D606A339
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98F9D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V04Pfiox;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QmMziVDt
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvBqr297018
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/LAeqwoWtFqbSPLKUF9sSDQ0qIlLUHbHNTMbGdBh9Qk=; b=V04Pfioxj8k1fKUp
	3sRi1STuH2LOJKE0oJTK0b48wW4ANxZZPIeIUYRte8SJF8OgqhQjQUG1H15O2o1D
	aLw7fdZCC8zSU16YInqe+hvs0SUW6MDR48XFimzHJxKJHrn45Ts65XdWJWHIm5IV
	uatWLTqBmw1B4bNOyfZv4ZwLFHA1XAlfhk9xnypAzIkyloHa8aPx7RR/0gAh0xdB
	A8wsnzTX+dSAo4oy4ZEfoKsXR4DUzzl7dH+vY97kwLiz6qN3fYorfcIuC5B9fNTt
	Qd+0RercA9t2lmgSj7nzueYSjuToeQIulmzoCU3gd4tWGO+jOzRg0UL+luHQ8iZ0
	X+CDAA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgaruhchy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3969a2a7so240752585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797948; x=1793402748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LAeqwoWtFqbSPLKUF9sSDQ0qIlLUHbHNTMbGdBh9Qk=;
        b=QmMziVDt+UG1wBVIHgeDdX9yq5bzgCFlownClZdjxYsWi+LKn12rpkvOpFk72kXVt4
         Djb6WAmMz/7hpA41V5VsAaS7lV7Ono8ORBS4j+n13aBegzwDUfNmbCkGloyMTchIu0o/
         0dQrD6fhlYi/kq7QfvIp9A4KdjgX6K1zCjzmJ5I/J2xJAH6S26B4ixvnOjjmsHokDIfQ
         1NfJN3JfF4amUjTvGgzrTuQz5HLBYINPdV2g8V4trvthZST2QdmmOrcddeFFG09zMR64
         /bs2bljwk88sLQOsI9JDsTNQBvSeB5q+nXqAD3KwpEZIkh7MwfJ3wOXxaMCF7KxNqXuz
         TiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797948; x=1793402748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LAeqwoWtFqbSPLKUF9sSDQ0qIlLUHbHNTMbGdBh9Qk=;
        b=G6o0Z/gj9gi0qjpgRw9tk9BVP9ZaIIRHkcq5OmhrBv/76NARoCjxzT+Fea+EVuWazr
         aP93n32VvRs74/KlY4Tk9glMKroxj6c4EGGdoS/f7J00YPnXaDwVKFVV5Zr/RJFTftdB
         5ZparU0YYEdISODade6cW4XwnYdIs2nbNRe5DUudD4cacsnKx+sgfxhDsp4Knb6PTuXR
         i7YIJhhilohBqP0SJ3OzXfl1fnLqSTm9uF2gBTuivAMkk9MxGRliDmTQ46EBbH+nQLxd
         F6AyGrST/SqVOeMH2kEFHgMFVyXfOGg0tDhAGZEG6+9K3Nqm9bv6ZGv3cW/xw0Tmo4nu
         J6fg==
X-Forwarded-Encrypted: i=1; AKwUvBzHlJZI2qDgobmGUxAk4rQsyfsALOWR06mXnQq4A3fEMWjabDRxE5aZtpRNW5hv05yJJaZYTe4doURn5/M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfy9Bf4sAXIBHabRQqhQpawmdt4PDjse2bHCw5HgxgqYicErHm
	ZPbCReYz2MdYoNEEgQNLEGk5RiuZ20VRpjMEt6B1GRz8rGM1NzHJpXjM2xOl0gEufxUXdOyh0VO
	14N5OzRqdIU7vO7yRb3fi4Y4DT6qUhsZk4oDFEX4FF3HoIwD3SDM62d5KNslmIWm8CA4=
X-Gm-Gg: AYBFou1CPoC2wm7IEXLQ0CMwtPcetf4tG54T0+hGmY+UaidvG7kOolPbaKUd0UXBVCA
	2VAB8n82sEacgDiTkPiJnARqtt6wpzkMUIDvNCLQgumc7jqb9jvmBs8sfMP96kzVoTaYVPWfbvK
	g15ie/rcvIihN8fzK7aWVjfnVoJ1R2d4tY9c/SyFkgpPmr4HX3poVrMBekK6SkTa1r9jGQRKGpz
	oYE91W/NKiECsFATUEK7K+58CUzVLUEA/IfNWo9aRvBKf/qOZiDXEPDzSECVY2a9UYkS26kJZga
	RNODdTT4Is8GCnthFt20BxQrtFYy2wL0iFnyWmAnD6wbFrO05bGeUfno8wnGfI9CLLeIG2hTg87
	L0DhFaN1kDzrbQc1g1cWxPy7cnBoO0oivhdMym/RmU1OD4jBqF0FOd5dDJ2Iz3kLgr6/ivzemAK
	pI0rybGhuS0m9s
X-Received: by 2002:a05:620a:8399:b0:93f:2ab9:729e with SMTP id af79cd13be357-940ef9151f3mr89904285a.21.1792797947831;
        Fri, 23 Oct 2026 16:25:47 -0700 (PDT)
X-Received: by 2002:a05:620a:8399:b0:93f:2ab9:729e with SMTP id af79cd13be357-940ef9151f3mr89900785a.21.1792797947330;
        Fri, 23 Oct 2026 16:25:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:25 +0300
Subject: [PATCH v5 04/10] drm/msm/mdp5: flush the interface before starting
 the timing engine
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
Message-Id: <20261024-fd-kms-fix-smmu-v5-4-a5b0b284aead@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GGiCoTigCncSjQExhHlehqh6DW7zeUi0eG81bX9nqSY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zoUiRvfbDYHpV9LE67/Lgl87snKY7KSX6Cp
 ajd5M075uSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs6AAKCRCLPIo+Aiko
 1a+JB/kBim54MBDcPnKmvY81X/osZL4jlanUdIktJbxgIkba2Vk3PY9z3SSU3Hd18WdYdQwd8VY
 9OQFLrAax4lr1myST8pKoBiO6huDgp32IrYfp5qKvntvPUfWVQt7nYlzI71CNKQWP//90NVh7Eb
 0Fb4lVIo0JifNZvYqT3plCdK4FQSEVU2Gav1NIktwUQho59AjB2ggqO6eC6lMg9eqF2kYSmyVUR
 8SCq+f4h7ObU4XDM1oKmND+40wHZQ3P6EpVLCgLhqERQ9q985vMjWL+sHPZWQgya0x2iBRLHtF5
 0QEoZFIjBviXpozUHh/6xtL8+StpIjL+fXEsOBfc/6p8ckMp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX/fM9F+O2tayb
 GxuVDQY7CmgwqryxSf7faXpfru90PU/pn16L5J4UOCr7LsWImdIZBVBsCxbR/RptvLxswpppJuR
 8oMt0wKOssvVy/YDS+VpJAqmiyjRc8o=
X-Proofpoint-GUID: LbSIphFPPQOgGxKL24120644oIdTqvHJ
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adbecfc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=H8EOZ7U-Vh7qnyOv3DwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: LbSIphFPPQOgGxKL24120644oIdTqvHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXzZDBDA7TxNQC
 VNG6/d0/wFLNqm+q8MEbv5vaqfm0hf4BT9dOZz01UHS+raQCX2DT3T/OfWbWMgoDIriIW+d4zfz
 yOUO0Mfr54MFZd2YiNNn+SjWJNH9CRlfynV+c8L9qYG0WE7jIXidigX24DqD5IVVdeRtl6HghY7
 M1NUaMrvJZgitWUDMr5Nf4pTo2NdYLnL6LQi4c3CjQNLUmfDisyLVs3N8CuQQBh0rAz2SqrT3aR
 dWVRMkDy67VIQOVudK9uHeDHffzg9ffPJbGEIITI0cg+ELLIccD/lL2U2jVw8CNlNmjnJqgJ4i4
 s4onwecjgDetm6HE8ZYJ9i8QI+SgDicLkdoePoK+nBUJk8HWRP8OxJzOPM1qkC02W+l+JYXxD7T
 4JYF8SOTZBQzdPtoJ7zpZp4Ulh+X+S1D4cIaAHKFXWmTNyRKUvT9XOlTcGvgwlKrPAMjZ75j+jr
 t7B6Wk52l2Y/zDB1bDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

Disabling a CRTC and then enabling it again can produce an SMMU fault on
MSM8996 as soon as the timing engine restarts, e.g. when fbcon takes over
after kms_atomic:

  arm-smmu d00000.iommu: Unhandled context fault: fsr=0x402, iova=0x01fa6e00

The faulting address is inside the framebuffer that was scanned out
before the disable, which has been released since. The pipes keep that
address latched (CURRENT_SRC0_ADDR still points to the released buffer)
because the plane removal flushed after the timing engine stopped never
takes effect. On the next enable the pipes are programmed and flushed
before the encoder is enabled, but that flush doesn't include the
interface: the encoder enables the timing engine first and only then
flushes the INTF. The first frame is fetched with the latched pipe
configuration, from the released buffer.

Flush the interface before enabling the timing engine, the order used by
both the DPU driver and the downstream mdss driver. With the INTF flush
pending, the whole pending flush takes effect when the timing engine
starts and the first frame is fetched with the new configuration.

Fixes: 06c0dd96bfbb ("drm/msm: add mdp5/apq8x74")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
index eaba3b2d73b5..e9eb1db92775 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
@@ -164,10 +164,11 @@ static void mdp5_vid_encoder_enable(struct drm_encoder *encoder)
 	if (WARN_ON(mdp5_encoder->enabled))
 		return;
 
+	/* the pipes fetch the first frame with stale addresses otherwise */
+	mdp5_ctl_commit(ctl, pipeline, mdp_ctl_flush_mask_encoder(intf), true);
 	spin_lock_irqsave(&mdp5_encoder->intf_lock, flags);
 	mdp5_write(mdp5_kms, REG_MDP5_INTF_TIMING_ENGINE_EN(intfn), 1);
 	spin_unlock_irqrestore(&mdp5_encoder->intf_lock, flags);
-	mdp5_ctl_commit(ctl, pipeline, mdp_ctl_flush_mask_encoder(intf), true);
 
 	mdp5_ctl_set_encoder_state(ctl, pipeline, true);
 

-- 
2.47.3

