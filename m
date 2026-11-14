Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794651804;
	b=iWz4/NBF7/Te1EiRv1oaOmoOGUc5ogjbRvB3yUu/5qK5REu8Jmkqvigw794tnDNsqf8q
	 Rsx1B9IUCo9v+HxQ/VU2KSwHH6bGtYpBtLBNDm5bhOR1i08MISpULIMSRNng+EhwPkayE
	 a84RBTsZ4z1mTlC4crM76Z0IBAjhszrRRypi6+srM9yqC16oZgT4LiK0U8jN7c898Q0AB
	 PYEMN7LsV80wGBnY4zE1xW0Z2CGiqsYE5jGgOiitowj6BRXkZ7MVaVjKh8uzGTB3WMqUg
	 Wxzj1rbisF5lOOPAYWIIT/opdu97CQ2BSn4WLpZdUA7+e0IIVfRgkI0GrofE0MWCtXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794651804;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=v4iYho5VZvmEyDSaOjiZizZqmyPF7Vw4WNsQWZBxg9c=;
	b=cBWIu8GUKnjVFWvYAMdr9i1PCgr8p+d4rYMMzFEOPPjQFv0AQKaheRdm2BeQ152Vw5b6
	 Fc3RdYMMFzVQVz7DFtV0F6ko4wi4TISa6DLzbgvapwZIjj6kDeZZnK8hMhkRerfS1SWuS
	 FQtZRKVytBQPn0W9GVFetoF0znOtBATEMS4lbEeW/y2rjd8WIMMJytHb4s/0hDfA0ZA8J
	 RAUi1kd8gkFX4rQpk2W11Mn5qvhWMBs9wqk6+C9xnDqGO0BjBu0xy8FhxRo10sAqnK8HF
	 0S+EvwQ6jQ1AsCFtRDFjLiqZnJf8uwXhQIDru8/9tWx2txWtSjD6RQ4sUo1DysXloSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA89606A337;
	Sat, 14 Nov 2026 10:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA89606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSAui-000000003bx-1lCf;
	Sat, 14 Nov 2026 10:23:16 +0000
Date: Sat, 14 Nov 2026 10:23:13 +0000
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
Subject: [PATCH 6/7] media: rkvdec: hevc: cache every short-term RPS set
Message-ID: <bc2872729866f947057117ea6635cd44f4b4e749.1794645268.git.daniel@makrotopia.org>
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

rkvdec_hevc_prepare_hw_st_rps() skips building the short-term RPS
table when the first element of the EXT_SPS_ST_RPS control equals its
cache, which holds a single element and starts zeroed. When the first
element is all zero, e.g. for an empty first set, the table entries of
the remaining sets are never built, and an SPS that differs from the
previous one only after its first set, or only in
num_short_term_ref_pic_sets, keeps the previous table. Inter pictures
are then decoded with wrong references: JCT-VC DELTAQP_A_BRCM_4 decodes
its intra pictures correctly and its inter pictures wrongly on an
RK3568, whose VDPU346 uses the VDPU381 back end.

Cache all sets the SPS uses together with their number, for both the
VDPU381 and the VDPU383 back end. The SPS control validation bounds
num_short_term_ref_pic_sets to 64, the size of the cache.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c    | 12 ++++++++----
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.h    |  9 ++++++++-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c   |  2 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c   |  2 +-
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 3b281c16a75ed..e3449ab0d415b 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -330,14 +330,17 @@ static void st_ref_pic_set_calculate(struct rkvdec_hevc_run *run, int idx,
 }
 
 static void rkvdec_hevc_prepare_hw_st_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
-					  struct v4l2_ctrl_hevc_ext_sps_st_rps *cache)
+					  struct rkvdec_hevc_st_rps_cache *cache)
 {
+	u8 num_sets = run->sps->num_short_term_ref_pic_sets;
+	size_t size;
 	int idx;
 
 	if (!run->ext_sps_st_rps)
 		return;
 
-	if (!memcmp(cache, run->ext_sps_st_rps, sizeof(struct v4l2_ctrl_hevc_ext_sps_st_rps)))
+	size = num_sets * sizeof(*cache->sets);
+	if (cache->num_sets == num_sets && !memcmp(cache->sets, run->ext_sps_st_rps, size))
 		return;
 
 	struct calculated_rps_st_set *calculated_rps_st_sets =
@@ -357,11 +360,12 @@ static void rkvdec_hevc_prepare_hw_st_rps(struct rkvdec_hevc_run *run, struct rk
 
 	kfree(calculated_rps_st_sets);
 
-	memcpy(cache, run->ext_sps_st_rps, sizeof(struct v4l2_ctrl_hevc_ext_sps_st_rps));
+	memcpy(cache->sets, run->ext_sps_st_rps, size);
+	cache->num_sets = num_sets;
 }
 
 void rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
-				 struct v4l2_ctrl_hevc_ext_sps_st_rps *st_cache)
+				 struct rkvdec_hevc_st_rps_cache *st_cache)
 {
 	rkvdec_hevc_prepare_hw_st_rps(run, rps, st_cache);
 	rkvdec_hevc_assemble_hw_lt_rps(run, rps);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
index 2a9b7719ab2d5..f6a3dec6ff4ad 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
@@ -35,10 +35,17 @@
 
 #define RKVDEC_RPS_HEVC_SIZE		ALIGN(1032 + 64 * 384, 128)
 
+#define RKVDEC_HEVC_MAX_SHORT_TERM_REF_PIC_SETS	64
+
 struct rkvdec_rps {
 	u32 info[RKVDEC_RPS_HEVC_SIZE / 8 / 4];
 } __packed;
 
+struct rkvdec_hevc_st_rps_cache {
+	struct v4l2_ctrl_hevc_ext_sps_st_rps sets[RKVDEC_HEVC_MAX_SHORT_TERM_REF_PIC_SETS];
+	u8 num_sets;
+};
+
 struct rkvdec_hevc_run {
 	struct rkvdec_run base;
 	const struct v4l2_ctrl_hevc_slice_params *slices_params;
@@ -65,7 +72,7 @@ void compute_tiles_non_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size
 			       u16 width, u16 height, s32 pic_in_cts_width,
 			       s32 pic_in_cts_height, u16 *column_width, u16 *row_height);
 void rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
-				 struct v4l2_ctrl_hevc_ext_sps_st_rps *st_cache);
+				 struct rkvdec_hevc_st_rps_cache *st_cache);
 void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_ctx *ctx,
 					  struct rkvdec_hevc_run *run,
 					  struct scaling_factor *scaling_factor,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index db836536e601b..8388421a68a48 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -117,7 +117,7 @@ struct rkvdec_hevc_priv_tbl {
 struct rkvdec_hevc_ctx {
 	struct rkvdec_aux_buf			priv_tbl;
 	struct v4l2_ctrl_hevc_scaling_matrix	scaling_matrix_cache;
-	struct v4l2_ctrl_hevc_ext_sps_st_rps	st_cache;
+	struct rkvdec_hevc_st_rps_cache		st_cache;
 	struct rkvdec_vdpu381_regs_hevc		regs;
 };
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index c409d21c08598..47f236295f1e5 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -124,7 +124,7 @@ struct rkvdec_hevc_priv_tbl {
 struct rkvdec_hevc_ctx {
 	struct rkvdec_aux_buf			priv_tbl;
 	struct v4l2_ctrl_hevc_scaling_matrix	scaling_matrix_cache;
-	struct v4l2_ctrl_hevc_ext_sps_st_rps	st_cache;
+	struct rkvdec_hevc_st_rps_cache		st_cache;
 	struct vdpu383_regs_h26x		regs;
 };
 
-- 
2.56.0
