Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793046367;
	b=Nwr8xrZJfnlYR2wnUdn0jz2yZkDC5XLFXXpo0RNPSMiArvEY5Y7dzLN7dTx5yE7ObODt
	 VBD52NhPm9Ro5Ox765xQxkmWFMQ8BYcbHLUv4jD8DKgn+eYcfSj+2s8WXuclvl+wy+tyu
	 S+YNrX2K9uA9+FBiFrOl8hwUG2mwgBK0L+nsYjO67y+UMO+Ajs2f6ke5bKn4co67Slkga
	 vuQjs1SBFllOOBHla1jDX8mZEcgIo8C2AYKzMVmgOtf/uyp8LeNA1MVJ3XUJA22g6mG6U
	 65hhH1DZ1cOD5sEG2Hug0lBIo2KznJdrs7+gRvUuDyjOV85LbTownEzGlRxaDVcOiog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046367;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jKjNavX4bHbKF/qvrtUQ5ioa60gUilED0q32oHaX4e8=;
	b=G/X+ZWb6KMVUAYiSHLuW9yydLINHckaiqWFmwaFxr7t/dWYf9kJBWcnSrOTcAR4BxnUF
	 8UHGwqRfqSys1MLm+8wZttyRNWDWvuBBLFfRwwA9PGuc24F4Wcv2ecrNCs1UhsvHEAn1I
	 VZJUyo/C/wnW2kxyZVIZgu7m36sx5dOKeSE675Bkp1756iMJY9TIxYVbQzqnZHe7RpLFW
	 gkpiyehzTfGTw0pCyGfw3yF4euV8Ox8qDu7794d++ndPKGayGUA25SaW+cq/5PAVrHHvW
	 tqUgXRezQHZs+XMnR6MN7fM1WwGvAIpUYn15J6Y0mLZvBNHPBvigq/7owcIRAtNta2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bNdiq+nx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C955D606A321;
	Mon, 26 Oct 2026 20:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bNdiq+nx
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793046366;
	b=BJ0BdYdOJlbQPFqzTOOZOHiaL0N6YrQNGIvHixiA4JeGcReOtDiE2k+0Wv+xMt0LzQX9
	 G0xZfg7CX9D8ydTaqjDKZHAP45c1rfKq1dUVyzLGpaytAynffPsCJn5tsgSgr0P4b8Mhv
	 UxqfqqTWhl2RDbS5XMG/OVL9iUf7OHqP0ENwA5rUN5+iWLTo/reXkFoFe+JkRdVoetupe
	 /AUezrQs1sW4r+j+giMkaQ+rFcPH28LJR2AYw+gvrtAFgrVWYk1kf1JE0FLCfjgChw0iy
	 9Ix1F/0ApxxKdR9baZ5CfGHk3JCnep+MEr4zlqFy5lHhrSb7ElGjdsOTOEN9QMWSzgw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793046366;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jKjNavX4bHbKF/qvrtUQ5ioa60gUilED0q32oHaX4e8=;
	b=FFL0npR5pSd3FSM7UxJ0d/ktL/e19W5ogQitLbfQDqk0Ncd2M78MqQnjThnnKwkIIxRP
	 a4WI3uFI+a3T1o9SO+JDaRPQ8PpF0dcWIj/g8UytcW6EjM29TNY/TygFbf+38zdNHQC/7
	 U3BzpYeiruf5S3Hup//PfP+duoNsK1v6UCDSRRnjX4kwAxN9cEAvVnXiQfju3TR/U67jg
	 T4IScMrtkZjHbvoiZX0Z8/1WZ9R/2Lm7FXMNDbmWmcr8H6IMtKDPjKyKQPvbsxuWRh9tu
	 YgwuF3vVzsAHMro3HvK6x7cZMvx8OGp+SBswZqq3Z2YpZPvGL1kSlERF90qQQYkDBJQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BF261F01829;
	Mon, 26 Oct 2026 20:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793046366;
	bh=jKjNavX4bHbKF/qvrtUQ5ioa60gUilED0q32oHaX4e8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bNdiq+nxwg9MGEvO6RZqH0HmaLbmx+lKuzLsB07AL5ZSRjfqLVPKkLev3M0OJg41C
	 JMTXfK9XzREeijz3DE3IXmEMB0WyOd7yjYaFqkA7vSYJeAzBd4TNSvm33XTn+pQDHV
	 15Vha97pwhfgxk1tTvGvmFKsfEzmrloxHidWJa1jFl5Z+NnvjJkulrVAtrBorbSPvK
	 BNdNSBB3Q1/0sLJeMtXkqn5IZ6jMxIA7i2Ax11xyXNYeKQRzmn/XP9mtAZt3pjFdky
	 6kN+7WkJYzaPvo7ptrQDL9nTY5h6Z0foUXiuist0YsVydBasUW4n6RN6CynX9FRhvl
	 OvKi3j8ItjI9Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DF49444E95;
	Mon, 26 Oct 2026 20:26:04 +0000 (UTC)
From: Xi Zhang via B4 Relay <devnull+xz.ca.cn.gmail.com@kernel.org>
Date: Mon, 26 Oct 2026 17:25:44 -0300
Subject: [PATCH v2 3/6] drm/msm/dpu: use common helper cleanup function in
 cmd mode disable
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
Message-Id: <20261026-msm-dpu-res-clean-v2-3-3d864435186e@gmail.com>
References: <20261026-msm-dpu-res-clean-v2-0-3d864435186e@gmail.com>
In-Reply-To: <20261026-msm-dpu-res-clean-v2-0-3d864435186e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793046364; l=2525;
 i=xz.ca.cn@gmail.com; s=20261026; h=from:subject:message-id;
 bh=XhOd7j42hxYmVLxXb4nr7ytDGGzBgeEYP3Gif2p9Ajo=;
 b=e+J51x5c64ypvjwE1MQ2QKGu9yAPbPv6lxkaLyn/zLFZ2cMCcFtUkEjW3LpXgDrk6V+km22HW
 7L/JXrcXEOfDemtZjChGE7ywZEmTGjMt1OawtJ6VfQ0RmIQo/sVya8b
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
index 81b983ecffbb..d967deb34c77 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2335,8 +2335,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
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


