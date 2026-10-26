Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793042239;
	b=sLPuiWKXaK34WZPzx4NS0g6GFMxql1T7HpsE8e4WwUBF5CrNlsJIx6qst3vtDd00mjFV
	 eT3om6qK0sau/smxO/wsr6rF//fZ06tQBY1JcqfT0hrWWeZwObilNDUxGGKXcGAvHDDj5
	 rLZmrbxkzrmv94PRw0FSkrPnTLBd+ClHJEDN+DPxiuGwUKbUUPj62p0MPsBlZWGFVFQAJ
	 MawLuzsSf28m7HR7x4woimRhcI/lO9nlMPmyhM8tK587FKG0+BwkPVs7CeZcrB04rItVT
	 WiXan6Ymfu0CCzHJhj1VnDWivFvpJ/OBFkk9qnIaOE2vDCjCiPouatXbyGClpO4LxMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042239;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=14rfyzm65lxIesVgmpqsb3ClQ/W4rPHSeHF6M+MbKeI=;
	b=bdh5ErFow7vvpf+tEekjC6cjUa4gDCsktxrgjrmkeCOnhDMH3z3BrBnwFd/6aqN97m1C
	 bD3kx3gIREe0jv0jf3rbdguCjCv9fOv5MxBjTcmZzuH9gpSS9V77osAW0Tor4MIdHPrD9
	 DVfC3UNfnQ1jALOf6x/W/tRuhINNParKz1V7tLNbL9223emzW75mT8pl8ji+peyIzoOIh
	 tKFieEHL63Atic1qGj21SB4KhcPmA3fgAyxThkOyL7hhvPwjBTB7FPsVKEA7FUS2KoFkP
	 NvfAmXpgxdlLRRL/Upz9ClM4TrrYnL3NtAtPnf9TIBIwnIW4RjIodYYBCG/pquPnrUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VLSPxDOH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924A060A2601;
	Mon, 26 Oct 2026 19:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VLSPxDOH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793042238;
	b=kx+V4n8SbADSUpw550YT/jlvFREIffVPDdHBQfBfPGJy6yGzRQw6WicLqc9lfg9z6089
	 5ENz+2gjOFtlhWmjUxILWEf2QVEmQOhdQ6MdDD1497hmfEax/01NrkllOYrLIr3u4ZaUs
	 GZ19dHesIcwK2iDh+YeLtsEx+G6G0xDSbNE3vH4M/4zm8YV4c0KWFp19qiOajoeNWOSxB
	 8MzB2h4kdmp5jQdQVZx4LOfTHOQ4qCpTqOBdLny2bqJHDzI2xkyALzEhHccTfmujz9jg4
	 m17tw+AdP52ZbgkCeCopoNN0wDEO3HxK7XwMauQ+iKPjOFenvKJNMJ3TgEbcqaWmrZQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793042238;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=14rfyzm65lxIesVgmpqsb3ClQ/W4rPHSeHF6M+MbKeI=;
	b=G0TpD8uw6xnin59lKuZzimJasVqiL9hF8ThL4uOVmU9E+KEOGvklod4l4Ls4fdELff5H
	 msrPTS74sNRM74Lmr0QzNI7JcOITZFWEpBflvfzmM/ZZtc6DvzXbOE1zQRoeX1LTCBbmd
	 CguRPv9xeE12XBbsXffyJ16VrI9uJnuTxFuwQDrTHykXid8bhmbp0gAuvQ/UkUca6Ftfr
	 Cbp37cnFapd0ojV0LbMMWybRR9UXS3MX7ZW6XVn1gg/w510Ow9xrpbuOjbCHkhWVcbOXp
	 12NI2U/JP14imtbLUI1AiiQC86fKAeNX7JK4aYx70jSmn/r2NWSiGh9BvBvA2Gs9qkQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4138F1F031E4;
	Mon, 26 Oct 2026 19:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793042238;
	bh=14rfyzm65lxIesVgmpqsb3ClQ/W4rPHSeHF6M+MbKeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VLSPxDOHrN8ex+rMYXNdJmZ3u7Djxyabua6sGerQCnHIY+PaTtGLCnmxcgO+BLtM5
	 9KHogUujLcvF6navi3pwPGjiIHEBBwsAoIlP8oCoPUi7Fu3ejWcK1rkdhATk+YLHjy
	 lpi6hgwNkW5WWvqee1iexr8GB3G9A+5gPDoKzocSys3/kBJ7flocq4KsTKrbxTWEew
	 lx2dTqcsUb93azTeMqcYFIO9NYJHXJ4mKEM0csVJaoAvP31TcizwBSFZkLIhsYY3y4
	 GttNpQL49gYvKToYYP7RrqnAcQYuRH2cAnWpqGRajqORiz9cWN79i0MZfPUeS5WYDA
	 iLGKKrdCvZXZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BAE1344E4C;
	Mon, 26 Oct 2026 19:17:16 +0000 (UTC)
From: Xi Zhang via B4 Relay <devnull+xz.ca.cn.gmail.com@kernel.org>
Date: Mon, 26 Oct 2026 16:16:51 -0300
Subject: [PATCH 3/8] drm/msm/dpu: use common helper cleanup function in cmd
 mode disable
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
Message-Id: <20261026-msm-dpu-res-clean-v1-3-f46130a8a717@gmail.com>
References: <20261026-msm-dpu-res-clean-v1-0-f46130a8a717@gmail.com>
In-Reply-To: <20261026-msm-dpu-res-clean-v1-0-f46130a8a717@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Xi Zhang <xz.ca.cn@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793042236; l=2525;
 i=xz.ca.cn@gmail.com; s=20261026; h=from:subject:message-id;
 bh=gZ1zC6u8j/CKI/qwlb5BfuiGxnpobk+GG3KE6oTYs3E=;
 b=djxSX4RkzGCjSlbrGlDEDQTemoOHmmwWVv3U6EqgJqc3gjSxfRZHYmyKyI7l0tIR3a4tgvWE1
 KaOqgDsEm/lCj2DQejbY1fYbGErlUkz9xTZzHmPKFYvGiYzrUtBbytL
X-Developer-Key: i=xz.ca.cn@gmail.com; a=ed25519;
 pk=aRUll5L3eJbwG8Y4BO9uySKGzm+Uy+Ccei9prnRVZRs=
X-Endpoint-Received: by B4 Relay for xz.ca.cn@gmail.com/20261026 with
 auth_id=1328
X-Original-From: Xi Zhang <xz.ca.cn@gmail.com>
Reply-To: xz.ca.cn@gmail.com
Content-Transfer-Encoding: 7bit

From: Xi Zhang <xz.ca.cn@gmail.com>

cmd mode encoder previously did not clean up dsc, or LMs during
disable.

Change to use the common dpu_encoder_helper_phys_cleanup function
for cmd mode disable.

Also do not set intf_cfg.mode_3d during disable:
dpu_encoder_helper_get_3d_blend_mode accesses drm_encoder->crtc->state
directly so intf_cfg.mode_3d weren't set to expected value for disable.
intf_cfg.mode_3d is also ignored by ctl->ops.reset_intf_cfg.

Signed-off-by: Xi Zhang <xz.ca.cn@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 10 +---------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 09afc0681248..0ab151369c99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2332,8 +2332,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 		dpu_enc->dsc = NULL;
 	}
 
-	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
-	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
+	intf_cfg.stream_sel = 0; /* Ignored by reset_intf_cfg */
+	intf_cfg.mode_3d = 0; /* Ignored by reset_intf_cfg */
 	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
 	intf_cfg.cwb = dpu_enc->cwb_mask;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 45079ee59cf6..111f9dd5e053 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -538,7 +538,6 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_encoder_phys_cmd *cmd_enc =
 		to_dpu_encoder_phys_cmd(phys_enc);
-	struct dpu_hw_ctl *ctl;
 
 	if (phys_enc->enable_state == DPU_ENC_DISABLED) {
 		DPU_ERROR_CMDENC(cmd_enc, "already disabled\n");
@@ -566,14 +565,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 			phys_enc->hw_pp->ops.disable_tearcheck(phys_enc->hw_pp);
 	}
 
-	if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
-		phys_enc->hw_intf->ops.bind_pingpong_blk(
-				phys_enc->hw_intf,
-				PINGPONG_NONE);
-
-		ctl = phys_enc->hw_ctl;
-		ctl->ops.update_pending_flush_intf(ctl, phys_enc->hw_intf->idx);
-	}
+	dpu_encoder_helper_phys_cleanup(phys_enc);
 
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 }

-- 
2.55.0


