Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794651796;
	b=bbI8wHAXWIOJk/vChpK1c2ELVCb2JMwdGbd/ooeURe0TrvfZJkqsVcZzKndiED5hvB02
	 //exqRsa2/NPp0H2tQdQK6cJ4JtYdLvQvxDiSI7A6z0FjzMtAa98l0yLk6efdpW8s+GYK
	 SqXi4It6nDKtec3e8p9Qu9hp5ZSNnpx8b6J899KstmeTNEOe3xgn2egLHg+0GJ70hbpQK
	 XJmMfujg9DhgirPmhGMCv4yTC2ggcK+xXA59IYQIgcIRXCZeurGRKNmQTgT+1h2OE7ZSJ
	 To0tE6urwAwlRdS0h4oRN4n009KreVp04oQiX3DTdC/KdUFXkeMQMQJFNdDOB42lfKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794651796;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jrBobRkGyr/IcjYrx7kD98jCz8paoRMgebEiflmNI3I=;
	b=OYy0KQMmTFMqEMuEYB4OS9EOv9L4D0Tgb1MjVoCWI4olT7wrJs7vlJiYauJTSp9/f0hr
	 oG6VNAUErA2hQVffb4gJCBXwadaDVwYBnW12bvWeajS9pHUvIQyramAi04+dUejNyYcRq
	 qoU7xricBA5sHLO5cgz5UyTIXx0xUrp54LgmFm5PIC8DdTZfcaXEQZB+zt30tRxwxhi36
	 3KNFCGmnU+AYsxOno62hjZ/LkJzWq0Kg0ZELcr67Wzeznl6oWTsOW5o0cLx9MBzU/vjf1
	 K+MF6SyjM06onTD+tYuiYpFCjckHQXNuN0MzG7isduRnTziKWxL4gopYTJcK4dWgWYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BE8606A898;
	Sat, 14 Nov 2026 10:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44BE8606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSAub-000000003bk-25J2;
	Sat, 14 Nov 2026 10:23:09 +0000
Date: Sat, 14 Nov 2026 10:23:06 +0000
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
Subject: [PATCH 5/7] media: rkvdec: vdpu381: refuse HEVC jobs without RPS sets
Message-ID: <b7a2619578693a708dbd187e2f659dc0886ae23a.1794645268.git.daniel@makrotopia.org>
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

When the SPS uses short-term or long-term reference picture sets and
the matching EXT_SPS_ST_RPS or EXT_SPS_LT_RPS control was never set or
holds fewer sets than the SPS counts, rkvdec_hevc_run() logs a warning
and starts the decoder with an RPS table that does not belong to the
stream, which at best gives wrong pictures. On the VDPU346 of the
RK3568, which uses this back end, such decodes also raise error
interrupts and time out, the IOMMU force reset fails, and the system
stops responding until the hardware watchdog resets it.

Refuse the job as the VDPU383 back end does: log an error and return
-EINVAL before any table is assembled, so that rkvdec_device_run()
returns the buffers with VB2_BUF_STATE_ERROR and the hardware is not
started. The request's controls are completed first, as
rkvdec_vp9_run() does, so that the request is signalled as complete.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index fea7ff48c0dce..db836536e601b 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -596,21 +596,18 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 
 	rkvdec_hevc_run_preamble(ctx, &run);
 
-	rkvdec_hevc_assemble_hw_scaling_list(ctx, &run, &tbl->scaling_list,
-					     &hevc_ctx->scaling_matrix_cache);
-	assemble_hw_pps(ctx, &run);
-
-	/*
-	 * On vdpu381, not setting the long and short term ref sets will just output wrong frames.
-	 * Let's just warn about it and let the decoder run anyway.
-	 */
 	if ((!run.ext_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
 	    (!run.ext_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
-		dev_warn_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
-	} else {
-		rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
+		dev_err_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
+		rkvdec_run_postamble(ctx, &run.base);
+		return -EINVAL;
 	}
 
+	rkvdec_hevc_assemble_hw_scaling_list(ctx, &run, &tbl->scaling_list,
+					     &hevc_ctx->scaling_matrix_cache);
+	assemble_hw_pps(ctx, &run);
+	rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
+
 	config_registers(ctx, &run);
 
 	rkvdec_run_postamble(ctx, &run.base);
-- 
2.56.0
