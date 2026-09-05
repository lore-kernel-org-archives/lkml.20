Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF69316199
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569037; cv=none; b=HoNqOE205uL9pryx1U33UqgMMekJlA7/W838OWecEfwasLuzCYgNaxEWdpibz7hVP6615xCeI+mOykyQAEyp6pnfmg2ValC7ShCs3B1MRLME+NpvuX+YV+78eC4TWOD99P6z8ihaeTt8B6l85VfLuE422j4Io5qlHM0clornPbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569037; c=relaxed/simple;
	bh=nX1qucJJfrGat46oqOOUGOgzn7YvJ13jtIc22NGMwzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BmlvkjycKy8vYO/Z8hjsjYxJEKj5IE+ft/+B/ZBvsUbuuAL45zNEdc1hY+EMICfaBKk4tFdh3tv4Kl9ml6BkA6l24+qzNR3T7nv+RpwStrMMN2eotqwlus2KSYDV3owfQDvRkSVq4acbjB65yWLiKiY6HAxv7MpldTNWAyvMUgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWyUkZJI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWyUkZJI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AD61F00A3D;
	Sat,  5 Sep 2026 00:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788569035;
	bh=i579P5jAzhcYzZGpGhMbx5lVBMLlO7rm0XQy+8bmP84=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OWyUkZJIjvIj3IkHwaeOCnM9oN0UKVkqzNnVO6tDjJvlLZiLNS9+EV3WgwTx0cdqC
	 z4kN/grXFhdf6xLxofgM8e0RiMtTTYKCNxvm15ia/KllmuUVHjnlT3vBbj852POTo5
	 BC2WH3YhcEqfXH92dI7xm/YYjCv3hLS7LMY27p2HDhWt4jS55IBO8I3A+DKVl37HkT
	 GzPuR7mjDnOg5If6Jav4pGxnSyiFuSQG0FHqDDOfxJhL/5rAUAbK3FsEBjtw62hcIN
	 go+EbcgoFBioxJqIz2D5qfPrWQ/RTNHe3Wc7AfUaeVYmMcZht4V0eBXh/DUEXAWwpd
	 RV5MW8oybdn1Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 04 Sep 2026 19:43:29 -0500
Subject: [PATCH v2 10/19] accel: ethosu: Validate all feature map tiles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-ethosu-fixes-v2-10-3767738756a4@kernel.org>
References: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
In-Reply-To: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The command-stream validator checked only the final feature-map
coordinate. For tiled tensors, this can leave an earlier tile base
address unchecked even though the operation accesses it.

Check the final coordinate of every tile touched by an operation. Also
treat U65 feature maps as 2x2 tiled: its precision rounding bits are not
the U85 storage encoding.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - no changes
---
 drivers/accel/ethosu/ethosu_gem.c | 125 +++++++++++++++++++++++++++++---------
 1 file changed, 97 insertions(+), 28 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index c913c95e48ae..c54496fa08f4 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -423,6 +423,74 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 	return addr;
 }
 
+static int feat_matrix_check_location(struct ethosu_device *edev,
+				      struct ethosu_validated_cmdstream_info *info,
+				      struct cmd_state *st, struct feat_matrix *fm,
+				      enum feat_matrix_type type, u32 x, u32 y,
+				      u32 c, bool ofm, u64 *max_len)
+{
+	u64 len;
+
+	len = feat_matrix_length(edev, info, st, fm, type, x, y, c, ofm);
+	if (len == U64_MAX)
+		return -EINVAL;
+
+	*max_len = max(*max_len, len);
+	return 0;
+}
+
+static int feat_matrix_size(struct ethosu_device *edev,
+			    struct ethosu_validated_cmdstream_info *info,
+			    struct cmd_state *st, struct feat_matrix *fm,
+			    enum feat_matrix_type type,
+			    u32 x, u32 y, u32 c, bool ofm, u64 *max_len)
+{
+	u32 storage = ethosu_is_u65(edev) ? 0 : fm->precision >> 14;
+	int ret;
+
+	*max_len = 0;
+
+	if (ethosu_is_u65(edev) || storage == 0) {
+		for (int xi = 0; xi < 2; xi++) {
+			for (int yi = 0; yi < 2; yi++) {
+				ret = feat_matrix_check_location(edev, info, st, fm, type,
+								 xi ? x : 0,
+								 yi ? y : 0, c, ofm,
+								 max_len);
+				if (ret)
+					return ret;
+			}
+		}
+		return 0;
+	}
+
+	if (storage == 1) {
+		ret = feat_matrix_check_location(edev, info, st, fm, type, x, 0, c,
+						 ofm, max_len);
+		if (ret)
+			return ret;
+		if (fm->height[0] < fm->height[1] && fm->height[1] <= y) {
+			ret = feat_matrix_check_location(edev, info, st, fm, type, x,
+							 fm->height[1], c, ofm,
+							 max_len);
+			if (ret)
+				return ret;
+		}
+		if (fm->height[1] < y) {
+			ret = feat_matrix_check_location(edev, info, st, fm, type, x,
+							 fm->height[1] + 1, c, ofm,
+							 max_len);
+			if (ret)
+				return ret;
+		}
+		return feat_matrix_check_location(edev, info, st, fm, type, x, y, c,
+						  ofm, max_len);
+	}
+
+	return feat_matrix_check_location(edev, info, st, fm, type, x, y, c, ofm,
+					  max_len);
+}
+
 static int buffer_size(struct ethosu_validated_cmdstream_info *info,
 		       struct cmd_state *st, struct buffer *buf, s8 region,
 		       u16 region_cmd, u16 base_cmd, u16 length_cmd, bool optional)
@@ -453,6 +521,7 @@ static int calc_sizes(struct drm_device *ddev,
 {
 	struct ethosu_device *edev = to_ethosu_device(ddev);
 	u64 len;
+	int ret;
 
 	if (ifm) {
 		if (!cmd_state_reg_is_set(st, NPU_SET_KERNEL_WIDTH_M1) ||
@@ -475,23 +544,22 @@ static int calc_sizes(struct drm_device *ddev,
 		if (ifm_height < 0 || ifm_width < 0)
 			return -EINVAL;
 
-		len = feat_matrix_length(edev, info, st, &st->ifm,
-					 FEAT_MATRIX_IFM, ifm_width, ifm_height,
-					 st->ifm.depth, false);
+		ret = feat_matrix_size(edev, info, st, &st->ifm, FEAT_MATRIX_IFM,
+				       ifm_width, ifm_height, st->ifm.depth, false,
+				       &len);
 		dev_dbg(ddev->dev, "op %d: IFM:%d:0x%llx-0x%llx\n",
 			op, st->ifm.region, st->ifm.base[0], len);
-		if (len == U64_MAX)
-			return -EINVAL;
+		if (ret)
+			return ret;
 	}
 
 	if (ifm2) {
-		len = feat_matrix_length(edev, info, st, &st->ifm2,
-					 FEAT_MATRIX_IFM2, st->ifm.depth, 0,
-					 st->ofm.depth, false);
+		ret = feat_matrix_size(edev, info, st, &st->ifm2, FEAT_MATRIX_IFM2,
+				       st->ifm.depth, 0, st->ofm.depth, false, &len);
 		dev_dbg(ddev->dev, "op %d: IFM2:%d:0x%llx-0x%llx\n",
 			op, st->ifm2.region, st->ifm2.base[0], len);
-		if (len == U64_MAX)
-			return -EINVAL;
+		if (ret)
+			return ret;
 	}
 
 	if (weight) {
@@ -533,13 +601,13 @@ static int calc_sizes(struct drm_device *ddev,
 			return -EINVAL;
 	}
 
-	len = feat_matrix_length(edev, info, st, &st->ofm, FEAT_MATRIX_OFM,
-				 st->ofm.width, st->ofm.height[2], st->ofm.depth,
-				 true);
+	ret = feat_matrix_size(edev, info, st, &st->ofm, FEAT_MATRIX_OFM,
+			       st->ofm.width, st->ofm.height[2], st->ofm.depth,
+			       true, &len);
 	dev_dbg(ddev->dev, "op %d: OFM:%d:0x%llx-0x%llx\n",
 		op, st->ofm.region, st->ofm.base[0], len);
-	if (len == U64_MAX)
-		return -EINVAL;
+	if (ret)
+		return ret;
 	if (!feat_matrix_chained(edev, &st->ofm))
 		info->output_region[st->ofm.region] = true;
 
@@ -554,18 +622,19 @@ static int calc_sizes_elemwise(struct drm_device *ddev,
 	struct ethosu_device *edev = to_ethosu_device(ddev);
 	u32 height, width, depth;
 	u64 len;
+	int ret;
 
 	if (ifm) {
 		height = st->ifm.broadcast & 0x1 ? 0 : st->ofm.height[2];
 		width = st->ifm.broadcast & 0x2 ? 0 : st->ofm.width;
 		depth = st->ifm.broadcast & 0x4 ? 0 : st->ofm.depth;
 
-		len = feat_matrix_length(edev, info, st, &st->ifm,
-					 FEAT_MATRIX_IFM, width, height, depth, false);
+		ret = feat_matrix_size(edev, info, st, &st->ifm, FEAT_MATRIX_IFM,
+				       width, height, depth, false, &len);
 		dev_dbg(ddev->dev, "op %d: IFM:%d:0x%llx-0x%llx\n",
 			op, st->ifm.region, st->ifm.base[0], len);
-		if (len == U64_MAX)
-			return -EINVAL;
+		if (ret)
+			return ret;
 	}
 
 	if (ifm2) {
@@ -573,21 +642,21 @@ static int calc_sizes_elemwise(struct drm_device *ddev,
 		width = st->ifm2.broadcast & 0x2 ? 0 : st->ofm.width;
 		depth = st->ifm2.broadcast & 0x4 ? 0 : st->ofm.depth;
 
-		len = feat_matrix_length(edev, info, st, &st->ifm2,
-					 FEAT_MATRIX_IFM2, width, height, depth, false);
+		ret = feat_matrix_size(edev, info, st, &st->ifm2, FEAT_MATRIX_IFM2,
+				       width, height, depth, false, &len);
 		dev_dbg(ddev->dev, "op %d: IFM2:%d:0x%llx-0x%llx\n",
 			op, st->ifm2.region, st->ifm2.base[0], len);
-		if (len == U64_MAX)
-			return -EINVAL;
+		if (ret)
+			return ret;
 	}
 
-	len = feat_matrix_length(edev, info, st, &st->ofm, FEAT_MATRIX_OFM,
-				 st->ofm.width, st->ofm.height[2], st->ofm.depth,
-				 true);
+	ret = feat_matrix_size(edev, info, st, &st->ofm, FEAT_MATRIX_OFM,
+			       st->ofm.width, st->ofm.height[2], st->ofm.depth,
+			       true, &len);
 	dev_dbg(ddev->dev, "op %d: OFM:%d:0x%llx-0x%llx\n",
 		op, st->ofm.region, st->ofm.base[0], len);
-	if (len == U64_MAX)
-		return -EINVAL;
+	if (ret)
+		return ret;
 	if (!feat_matrix_chained(edev, &st->ofm))
 		info->output_region[st->ofm.region] = true;
 

-- 
2.53.0

