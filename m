Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794651773;
	b=ak4V3vC2LFYHkNsbQd0MCEQYVgV19B4TnMPKKRjLyRHD/1GUGRyJbdPFtxTwkgmYumBF
	 nT0E8jm+ZKKEqdrPCBWWB/o3rlJWAjp3EyO7Oq4mBWuwp1m1NCmtGTGLDT9DAzSQfhJrM
	 mfn3CAhJPwDZUiuvMtyF+2DmvQ2Vf0xCJGpchJIlcI9BwRPBbT3Qq2lzZCEHElCHFIjP+
	 p5B9KwITnrUSU7fM3bTxRfBCnKtiosh6ZjQelISoyypkDEER8nzVNQdu1vcQtncz1V00E
	 ymiS/E5LQwyZKYUQiHXXyL5dUqIogsmfDzWe3LnWreEeUaYG1nAMu1KHXK2azlwA7xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794651773;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ECmqalV3vVXhuW7AJJvBBOVkwd6W+mrSEV8Bq0CD+AY=;
	b=dmf38lPpnF2LiZKbsP1wAsy3wkJ2RaiOurowvRZDC01BaKUMzETbXzO0b3liEYC+qBr2
	 TE2KlGXuN7gmvSKmc+YGDItEvLfM+R0AeFcJhY7Oi53Up/25WNAwktWSJN1lHE7NhPdSr
	 RJ/sqVeV4Zu2qKwO/0IQRyJuCe5nY8SMcDYE+aNTEBtdgth0nyW3pTPCMnqy1ZZEIz91u
	 96WG9VEtmjI9aedLPECy44Qlg0atxk6nlnaIHPZqe6OeDpzhZT2Y3kYBsMsRss3XCkX40
	 STqSMgBnlMl72NYCxa5Oajn2jLasmh4Cb0rycwLOZ47PNx+rs2Dkk85k1COn+0Dyycw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E980606A330;
	Sat, 14 Nov 2026 10:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E980606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSAuD-000000003aW-1gHM;
	Sat, 14 Nov 2026 10:22:45 +0000
Date: Sat, 14 Nov 2026 10:22:42 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Alex Bee <knaerzche@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] media: rkvdec: hevc: apply request controls first
Message-ID: <0050fba7666592bb95c784eda4013a6054016d84.1794645268.git.daniel@makrotopia.org>
References: <cover.1794645268.git.daniel@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794645268.git.daniel@makrotopia.org>

rkvdec_hevc_run_preamble() takes the control pointers and the slice
count before rkvdec_run_preamble() applies the request. When a request
carries more elements of a dynamic array control than the control has
held so far, v4l2_ctrl_request_setup() reallocates the array and frees
the old one, which leaves run->slices_params, run->ext_sps_st_rps or
run->ext_sps_lt_rps pointing to freed memory, and run->num_slices holds
the element count of the previous request. The EXT SPS RPS controls are
also looked up depending on has_sps_st_rps and has_sps_lt_rps before
the request's own controls could set them.

A userspace V4L2 client that can open the RKVDEC m2m decoder can submit
a request that grows one of these dynamic array controls and reach the
freed array through the stale pointer.

Apply the request first, as rkvdec_vp9_run_preamble() does.

Fixes: 3595375c2301 ("media: rkvdec: Add HEVC backend")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 2b8e04dd15727..c249e3f16f42c 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -429,6 +429,8 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
 {
 	struct v4l2_ctrl *ctrl;
 
+	rkvdec_run_preamble(ctx, &run->base);
+
 	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
 			      V4L2_CID_STATELESS_HEVC_DECODE_PARAMS);
 	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
@@ -460,6 +462,4 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
 	} else {
 		run->ext_sps_lt_rps = NULL;
 	}
-
-	rkvdec_run_preamble(ctx, &run->base);
 }
-- 
2.56.0
