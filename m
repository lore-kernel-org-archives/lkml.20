Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281005;
	b=CbSiSkUBcSqTSeRrVUVLzrU4WK4jRZjjIMmeW1Mszy093QRRPPhNff0oHKrqDW4VCU4g
	 gc0asJ+Fz/T9N6UxhVAapdoiyRUFC/l7JcVGwlccWQYhiWsqpWmCZRMUgCSGmBc2kQUGm
	 /3SOUKdidLXIm8kHIHgGm+jG3FWK9W3lmRc4qrm0QjBOGoAqbW8/xe1aquQAek80hdAgr
	 Gz5MtIZrN5v1AzJDTGuC3Wb655Vnnclzcb5I3zw2IuzhzC4L++/KZYxD5J9yzGSTYafZh
	 akYYdbK3avcW7UbQrQKJYX/uV+sArSTpcBWmTZcJoXU8FFuotghauNlWyacw2vgNn2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281005;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=5wVWOZQNW8nwEY7V3T+sbmaw9ER8oS0M+qsQdB7q20I=;
	b=IF7IqMXBsyWkdIml/bDFBTnkClKBsD1dOGsXTcxvDo9022SZAn9ekkecizKPdpja+tI1
	 LU4nZ6UkBKT66gewU2PCY8nim/Ry6GE/qtt2Zw5bx7GzqwER/Qh35TW4vI3orcfu3y2RT
	 uhatiV7WCx4ub21GfDDsy4GYzbVY1y+kHYxGdb3FrRpwp/rzUnQt7DlMy9paW1EwgR0NN
	 g0ELsZSXRNzg9tipnZd2zIosi+5qdjFa+zwBUamV8VOwTEkPZJKu+c+EeRWhrxs/yNGK4
	 MKee0Ga9zw94SgC9En6xMuhfZOSwCVkq5h41brHCVo6YNt0U+cobmml1jcn/amsz+yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e29rzFAd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729A7606AAEE
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e29rzFAd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6051F031E0;
	Thu, 29 Oct 2026 13:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793281005;
	bh=5wVWOZQNW8nwEY7V3T+sbmaw9ER8oS0M+qsQdB7q20I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=e29rzFAdLdKtHkZn3fZ4ucQkxgXi6+1J3Dr/O3AvtdyzEaRj8oPv1UZ0h1eM1bvuX
	 6g7IXkN9dbVn5lZLwglwCCuEuogGxb62PCjrvVuHauhb8MVa7gDgAb3uqscw1m/Wlg
	 wKeRKqs9xKmu1W65S6wALhQKEW1F3inSdrpRPJX8Fi9vNAyg7k615mK38WeO9jyN84
	 QSrR971ufzqdRTGQqcqgoQkTUKcqQcEgEJxhT5ht4LAlsN6M7GpoqlATY0UcSOFUb6
	 KHFb5SuclS02INWojIzeXN/OA1aJqoobMisSYpO/hO+Jq7vc7WJ2X6pjN3TExHraRX
	 mem5cp7rVwacg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:36:07 -0500
Subject: [PATCH v4 20/31] accel: ethosu: Validate all feature map tiles
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
Message-Id: <20261029-ethosu-fixes-v4-20-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
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
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
 - NHCWB16 feature maps may be vertically tiled. Account for tile 0's
   maximum Y coordinate when calculating the feature map bounds.

v3:
 - Fix for storage mode 0 intermediate tile calculations

v2:
 - no changes
---
 drivers/accel/ethosu/ethosu_gem.c | 147 ++++++++++++++++++++++++++++++--------
 1 file changed, 119 insertions(+), 28 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 74ef86848a2d..3333477bf2e5 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -444,6 +444,96 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
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
+	if (storage == 0) {
+		ret = feat_matrix_check_location(edev, info, st, fm, type, 0, 0,
+						 c, ofm, max_len);
+		if (ret)
+			return ret;
+
+		ret = feat_matrix_check_location(edev, info, st, fm, type,
+						 min(x, (u32)fm->width0),
+						 min(y, (u32)fm->height[0]), c, ofm,
+						 max_len);
+		if (ret)
+			return ret;
+
+		if (fm->width0 < x) {
+			ret = feat_matrix_check_location(edev, info, st, fm, type, x,
+							 min(y, (u32)fm->height[1]), c,
+							 ofm, max_len);
+			if (ret)
+				return ret;
+		}
+
+		if (fm->height[0] < y) {
+			ret = feat_matrix_check_location(edev, info, st, fm, type,
+							 min(x, (u32)fm->width0), y, c,
+							 ofm, max_len);
+			if (ret)
+				return ret;
+		}
+
+		if (fm->width0 < x && fm->height[1] < y)
+			return feat_matrix_check_location(edev, info, st, fm, type,
+							  x, y, c, ofm, max_len);
+
+		return 0;
+	}
+
+	if (storage == 1) {
+		ret = feat_matrix_check_location(edev, info, st, fm, type, x,
+						 min3(y, (u32)fm->height[0],
+						      (u32)fm->height[1]), c, ofm,
+						 max_len);
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
+	}
+
+	return feat_matrix_check_location(edev, info, st, fm, type, x, y, c, ofm,
+					  max_len);
+}
+
 static int buffer_size(struct ethosu_validated_cmdstream_info *info,
 		       struct cmd_state *st, struct buffer *buf, s8 region,
 		       u16 region_cmd, u16 base_cmd, u16 length_cmd, bool optional)
@@ -474,6 +564,7 @@ static int calc_sizes(struct drm_device *ddev,
 {
 	struct ethosu_device *edev = to_ethosu_device(ddev);
 	u64 len;
+	int ret;
 
 	if (ifm) {
 		if (!cmd_state_reg_is_set(st, NPU_SET_KERNEL_WIDTH_M1) ||
@@ -496,23 +587,22 @@ static int calc_sizes(struct drm_device *ddev,
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
@@ -554,13 +644,13 @@ static int calc_sizes(struct drm_device *ddev,
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
 
@@ -575,18 +665,19 @@ static int calc_sizes_elemwise(struct drm_device *ddev,
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
@@ -594,21 +685,21 @@ static int calc_sizes_elemwise(struct drm_device *ddev,
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

