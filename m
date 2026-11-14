Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794651787;
	b=dgKk+Zxu8lnfPdKClsFmWcVQgLYBReGfqbzSRszwugZdihL7MAdFJiRO917+Yv+a/Y54
	 es2lLZKhU2qBZdGagOyaebvBGdZcO2W5wS+g4XLMN9/7/ZYCFUKZPqfWf2F7VZiddZpRc
	 f07GwM9DMHzayVQQjxDv++2VXpIbRsoHVwZFOGq5+cUtDiuT7mD+tAquRAxQPdiTO8T+l
	 XZKK/Kn+ZtoUcQbp1Z9ICu0AqCllFBIhvx2rXjPQ+QcFe1xeFl8cdTrc5iiJ7u8/glgq+
	 3Xsi+CURSeaxxR5H+gOQKioJeDbKJ3KndzzNa42sbWa/ngKcOmw7WjUUnkGV4lCCQVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794651787;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hQdAK6nXJHg9IiRiM6Gy5G99h7yBYkgKonnA+V+wGAU=;
	b=jns7wSz5PwfhS6ooabG5X/qLw4LKF+yLcyJNUT5kU6lu8WwfZy3Z+gnmPbVfkCqeCT5L
	 KeFVnkwKCvRyHF5Ro/lh8uXNc6Nw5XCa0eZGN1Bv6ij7/9uhKAgRXayYN4eiMK/MqIvX/
	 3qu9JNCTVkIiVtVWAaOzlu0T6dl50XX8Kk9b1xQ18CnG5DdA3OkQbpgJC+pk+lFjQQAig
	 bkV4vIdB1ciscpGh4wc+VUalOzZndAT6sjtz6BXIki6666EJtBqPJruYIUokCQvR7VZan
	 MrPaCTRw/6lU5B9T0+1gD+SWxBJXamGDhU1XbpaT/dmfYSrfpollrJ0aSbMJXmhxkUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D92606A33B;
	Sat, 14 Nov 2026 10:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D92606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSAuS-000000003bG-0Ffl;
	Sat, 14 Nov 2026 10:23:00 +0000
Date: Sat, 14 Nov 2026 10:22:57 +0000
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
Subject: [PATCH 3/7] media: rkvdec: hevc: bound the RPS reads by the control
 size
Message-ID: <bb9c44d0f56221874b105394169e5c377ef21b42.1794645268.git.daniel@makrotopia.org>
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

The RPS helpers read num_short_term_ref_pic_sets elements of the
EXT_SPS_ST_RPS control and num_long_term_ref_pics_sps elements of the
EXT_SPS_LT_RPS control, however many elements userspace passed. Beyond
the passed elements they read stale entries of the control's array,
and past its allocation once the SPS counts more sets than the control
has ever held, as the control framework sizes a dynamic array for the
largest element count it has seen. The short-term sets read from there
are unchecked, and a num_negative_pics or num_positive_pics above 16
overflows the calculated sets, the stack arrays of
st_ref_pic_set_prediction() and the hardware RPS table.

A userspace V4L2 client that can open the RKVDEC m2m decoder can set an
SPS whose counts exceed the number of elements it passed in these
controls, so the reads run past the allocation.

Use the controls only when they hold at least as many elements as the
SPS counts, and treat them as not set otherwise in both back ends.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c    | 12 ++++++------
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c   |  4 ++--
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c   |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index c249e3f16f42c..797a16517ed59 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -448,18 +448,18 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
 			      V4L2_CID_STATELESS_HEVC_SCALING_MATRIX);
 	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
 
+	run->ext_sps_st_rps = NULL;
 	if (ctx->has_sps_st_rps) {
 		ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
 				      V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS);
-		run->ext_sps_st_rps = ctrl ? ctrl->p_cur.p : NULL;
-	} else {
-		run->ext_sps_st_rps = NULL;
+		if (ctrl && ctrl->elems >= run->sps->num_short_term_ref_pic_sets)
+			run->ext_sps_st_rps = ctrl->p_cur.p;
 	}
+	run->ext_sps_lt_rps = NULL;
 	if (ctx->has_sps_lt_rps) {
 		ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
 				      V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS);
-		run->ext_sps_lt_rps = ctrl ? ctrl->p_cur.p : NULL;
-	} else {
-		run->ext_sps_lt_rps = NULL;
+		if (ctrl && ctrl->elems >= run->sps->num_long_term_ref_pics_sps)
+			run->ext_sps_lt_rps = ctrl->p_cur.p;
 	}
 }
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index e1936e87f45be..fea7ff48c0dce 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -604,8 +604,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	 * On vdpu381, not setting the long and short term ref sets will just output wrong frames.
 	 * Let's just warn about it and let the decoder run anyway.
 	 */
-	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
-	    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
+	if ((!run.ext_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
+	    (!run.ext_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
 		dev_warn_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
 	} else {
 		rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index e9d8b590f0d58..c409d21c08598 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -550,8 +550,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	 * To be on the safe side for this new v4l2 control, write an error in the log and mark
 	 * the buffer as failed by returning an error here.
 	 */
-	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
-	    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
+	if ((!run.ext_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
+	    (!run.ext_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
 		dev_err_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
 		rkvdec_run_postamble(ctx, &run.base);
 		return -EINVAL;
-- 
2.56.0
