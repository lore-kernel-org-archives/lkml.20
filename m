Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9390F5237B7;
	Mon,  5 Oct 2026 17:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220738; cv=none; b=IuC8Bj3MqG8jI36n7F6jGaYz0+szzYNTxNweLcvE/nEe1mlXLKjQ+U8Bozb4U6zRpyDfNtbJrDCtuhJuIJ75Ou0iw+ghGqeQT0CbiiUfUy7SI4uuSmTs4jk8xh5ll0SYSy1N5CV+qrW0vhB41OIi39nJcrFp1LnH9H3jgcFW5t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220738; c=relaxed/simple;
	bh=uS1t744te2Ot8L6A3g+MVPoUquMklX9ig/QH3wLfwdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kjwp0LvBE+8lUcjniNnu0o7QtFSJRk1sKFEhz/waCZUVa3mGmc+6gvhvlF9R2QsGYQj4fKh2Scjt6gbTQRP6bTsmqCDN5Ic+nKICKBg45nVxLtLzW0seeK/PkP9+to5JKsVJ3hY1fI4fpB04ZD0ZyplN1mbP+YMIGfqjWwGnuBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxMDQkpn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxMDQkpn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6999C1F000FF;
	Mon,  5 Oct 2026 17:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220737;
	bh=ul5KgzhIsSZ142uwpg0FUSjAqikjYuMg4NIBYsV47os=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BxMDQkpnrUSrmfrcgdjDLAzIptmY3Fz7hLWuP3q0EG/wDDI78/6IbdBocHphRLfI0
	 Fy7wT7lCd2JNn1spfBzQufFOt21Cb7Y+1SPZ8sDNZ1bF2L4cAp0m54KjXH9U0DuZ6W
	 9VCwAGhYvV4wkGDlSL5fYbfKJQCfAc/Dh8MVGtYapCrd6tuPXg4hhQb9rSOyHbJGgR
	 yzbQRpZzGzlD225UzId4j4ECBFim8TIcG7qu2eC4zIpXzrYbCXS7aijHhFFPwV2eq7
	 SKBaLFpoJRk2dDeIosOMvqRoZbx2nTvojTYRq/ZYdc4ZBN12NedvHFEFIOq41wn3H6
	 Al3M8Vak0kB4Q==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:25 +0200
Subject: [PATCH 55/74] media: qcom: camss: vfe: Make is_pix the only test
 for the pixel path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-55-ed985aefd611@kernel.org>
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, 
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, 
 Robert Foss <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5984; i=bod@kernel.org;
 h=from:subject:message-id; bh=pZe6CqqAWER9w0OquUWWY8u4q4MN90MdGfjacYiUGng=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9soW1L8yQ024nPGTw1OAOocXnDqEmdPNQkf9
 B7cHMmllY2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbKAAKCRAicTuzoY3I
 OnqkEACJUZNGxsw4sh1HfFpu4oMfw8f10T4btYIsHh2O7SfGjgCt6y9HtwTkm/IDFfuvHb89yRL
 iLbRrG1bh64G4ErKc2lW7OWRlCg2cR7QD471WC5mtusR6R+wxVjl0ZOki19U/Cn10Rl8+sIljuE
 IPXMWm56/ztmhWAfHnp/KrC4wX+oR+WGbGf6qKguOu9JPWnJEHNCx5q5KbCcswxVjNdCUzg70tG
 FvXiPXcMhaekRhw6bLC9BYYMMOhVmTnvEiYUwkF5yeCuFIPcJf3FK7XR+iffBVpn7hIkGTrgS9r
 nSvNxegw0kZksFbEixM+81GbHcNf6Uro17EtTscmYA9w6F8RkW+90IuG7d81M33jYiRQ6vc7cT4
 atCFMC3ijPAMjSf2PnW72qhGQcXDYO2sECJBe+SKtI2UHoVG13Vtn0X9KHkDXyT5/Vy0BJ/INz+
 4WcOXSfq2ze3/lzK0ZwJ+6Q4kanZxOXaznEItR5YSHJWjyd04q7U7Ou81jihXz2I0+SMgprlED0
 uOmBFmJoEhBg5TcXktlQ6g/dKuciUru+zl2lI7VV7bps/3Tlv6Bg244hPqjKCPajeLtjHBX3I14
 r7/urYufoyPGYvwbC10N7aA7ciuvIVAgIZqajyF+xD6JzttjZc3OIcPOnUlhpgLJAKfpBk/Mfe5
 +FPsU2reDzBBy7A==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

camss-vfe.c decides whether a line is the pixel path by its index in
most places, comparing against VFE_LINE_PIX. On a VFE lite index 3 is
RDI3, so the lite's fourth RDI picks up the pixel path's selection API,
crop clamp, PIX formats, PIX bytes-per-line alignment, line-based mode
and clock computation.

Make line->is_pix the single test:

- a backend declares its pixel line by setting is_pix; a lite never does
- formats are chosen after the backend's subdev_init(), once is_pix is
  known
- every VFE_LINE_PIX comparison in camss-vfe.c becomes an is_pix test
- add VFE_LINE_RDI3 as the name of index 3 on a lite

vfe-780 already declares its pixel line. vfe-340 declares it here; it is
the only other backend whose tables still give a full VFE four lines.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-340.c |  1 +
 drivers/media/platform/qcom/camss/camss-vfe.c     | 36 +++++++++++++----------
 drivers/media/platform/qcom/camss/camss-vfe.h     |  3 +-
 3 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index e5a0a70eed1e6..708dad42186f9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -356,6 +356,7 @@ static const struct camss_video_ops vfe_video_ops_520 = {
 static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 {
 	vfe->video_ops = vfe_video_ops_520;
+	vfe->line[VFE_LINE_PIX].is_pix = true;
 }
 
 static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 82a23be7cae9c..0c7be87d7bd57 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1059,7 +1059,8 @@ void vfe_isr_comp_done(struct vfe_device *vfe, u8 comp)
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(vfe->wm_output_map); i++)
-		if (vfe->wm_output_map[i] == VFE_LINE_PIX) {
+		if (vfe->wm_output_map[i] != VFE_LINE_NONE &&
+		    vfe->line[vfe->wm_output_map[i]].is_pix) {
 			vfe->isr_ops.wm_done(vfe, i);
 			break;
 		}
@@ -1167,7 +1168,7 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 				u32 tmp;
 				u8 bpp;
 
-				if (j == VFE_LINE_PIX) {
+				if (vfe->line[j].is_pix) {
 					tmp = pixel_clock[j];
 				} else {
 					struct vfe_line *l = &vfe->line[j];
@@ -1248,7 +1249,7 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 				u32 tmp;
 				u8 bpp;
 
-				if (j == VFE_LINE_PIX) {
+				if (vfe->line[j].is_pix) {
 					tmp = pixel_clock[j];
 				} else {
 					struct vfe_line *l = &vfe->line[j];
@@ -1566,7 +1567,7 @@ static void vfe_try_format(struct vfe_line *line,
 
 		fmt->code = vfe_src_pad_code(line, fmt->code, 0, code);
 
-		if (line->id == VFE_LINE_PIX) {
+		if (line->is_pix) {
 			struct v4l2_rect *rect;
 
 			rect = __vfe_get_crop(line, sd_state, which);
@@ -1844,7 +1845,7 @@ static int vfe_set_format(struct v4l2_subdev *sd,
 		vfe_try_format(line, sd_state, MSM_VFE_PAD_SRC, format,
 			       fmt->which);
 
-		if (line->id != VFE_LINE_PIX)
+		if (!line->is_pix)
 			return 0;
 
 		/* Reset sink pad compose selection */
@@ -1878,7 +1879,7 @@ static int vfe_get_selection(struct v4l2_subdev *sd,
 	struct v4l2_rect *rect;
 	int ret;
 
-	if (line->id != VFE_LINE_PIX)
+	if (!line->is_pix)
 		return -EINVAL;
 
 	if (sel->pad == MSM_VFE_PAD_SINK)
@@ -1949,7 +1950,7 @@ static int vfe_set_selection(struct v4l2_subdev *sd,
 	struct v4l2_rect *rect;
 	int ret;
 
-	if (line->id != VFE_LINE_PIX)
+	if (!line->is_pix)
 		return -EINVAL;
 
 	if (sel->target == V4L2_SEL_TGT_COMPOSE &&
@@ -2173,18 +2174,21 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		init_completion(&l->output[0].sof);
 		init_completion(&l->output[0].reg_update);
 
-		if (i == VFE_LINE_PIX) {
-			l->nformats = res->vfe.formats_pix->nformats;
-			l->formats = res->vfe.formats_pix->formats;
-		} else {
-			l->nformats = res->vfe.formats_rdi->nformats;
-			l->formats = res->vfe.formats_rdi->formats;
-		}
 
 	}
 
 	vfe->res->hw_ops->subdev_init(dev, vfe);
 
+	/* Only now does a line know whether it is the pixel path */
+	for (i = 0; i < vfe->res->line_num; i++) {
+		struct vfe_line *l = &vfe->line[i];
+		const struct camss_formats *f = l->is_pix ? res->vfe.formats_pix :
+							    res->vfe.formats_rdi;
+
+		l->nformats = f->nformats;
+		l->formats = f->formats;
+	}
+
 	init_completion(&vfe->reset_complete);
 	init_completion(&vfe->halt_complete);
 
@@ -2331,7 +2335,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		v4l2_subdev_init(sd, &vfe_v4l2_ops);
 		sd->internal_ops = &vfe_v4l2_internal_ops;
 		sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-		if (i == VFE_LINE_PIX && vfe->res->is_lite == false)
+		if (vfe->line[i].is_pix)
 			snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d_%s",
 				 MSM_VFE_NAME, vfe->id, "pix");
 		else
@@ -2371,7 +2375,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		}
 
 		video_out->ops = &vfe->video_ops;
-		if (i == VFE_LINE_PIX) {
+		if (vfe->line[i].is_pix) {
 			video_out->bpl_alignment = vfe_bpl_align_pix(vfe);
 			video_out->line_based = 1;
 		} else {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 318b025702007..2b354d6bcc1f5 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -59,7 +59,8 @@ enum vfe_line_id {
 	VFE_LINE_RDI0 = 0,
 	VFE_LINE_RDI1 = 1,
 	VFE_LINE_RDI2 = 2,
-	VFE_LINE_PIX = 3,
+	VFE_LINE_RDI3 = 3,	/* IFE lite */
+	VFE_LINE_PIX = 3,	/* full IFE, when line->is_pix */
 	VFE_LINE_NUM_MAX = 4
 };
 

-- 
2.55.0

