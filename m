Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766152853FD
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862815; cv=none; b=WguhBz4vPSNnOLw49u9gBRH63RcUNI7ODGbRcTvfzbA610YTS1r//ZLTyyIw26TUojavVB/aBEUmGR/20/HyI+jMV+eRXX/7anM0cRabzHVwTi+BvIlXbFEFoVGa2mIirslYXOz2qH0wwZHWfcvGUAT6SAcnFQ2BseceTBcI0QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862815; c=relaxed/simple;
	bh=n2kh5q+H+wEQw72ia/fWfq4TL4RlVO7TpkSK1rNF9NU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1KoPYyNcdS79kd22foAqCGUXCJN90toSpZtxne77BNTE/vzpqeKzyXqqLrjb/FHPUrEdTWreiaeux+coulndFiKuox3Ys1ROx3kYiO6ZLrAqBbzVyJl9fH9y5BPJ+sF2zq6LI6em2BjBcs/Eu1Rwv+YHdlfqahGNheiWiVwm9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUBfTRFB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUBfTRFB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8041F00A3A;
	Thu, 27 Aug 2026 20:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787862806;
	bh=c1XIfes4dLS5aZUdWRq1Bq8zM42TeR/T/LY3819Ic3A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aUBfTRFBgK8zW3Pal0buE743Z7lMPkJMbbshE0kYVIg4jw4OeVcgS/rIDb0JxUk6C
	 nPNbwOZ7VNM9mdj5cVOeJXgfCTWHHpUFi6NaoKqbY8Mriv0FYNFdzrEFkX2nTvIMZt
	 CLWiQ2b1yyI6CRPuwASX8SatLbijD4KysMHARb7oOGoaxnpa4CpRRLgV90XCbtkVqF
	 nv8+uj3h4mFctxoWs/TPTKhJA248ZIGiLKNwQAqmBzaRfIR2DEI4zAE8rub58VlPq5
	 dvpvkfQB2DJxELWNcRAYPups57UHEEtmLKCNoQQwyfDWpKlhB5euJDYnDuHeD4ae8S
	 b4S1o1hLUxm8w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 27 Aug 2026 15:33:09 -0500
Subject: [PATCH 10/11] accel: ethosu: Validate all feature map tiles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-ethosu-fixes-v1-10-346f9ea8791c@kernel.org>
References: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
In-Reply-To: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
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
 drivers/accel/ethosu/ethosu_gem.c | 117 ++++++++++++++++++++++++++++++--------
 1 file changed, 93 insertions(+), 24 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 2aafbfe95a8c..a042e650f626 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -259,6 +259,72 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 	return addr;
 }
 
+static int feat_matrix_check_location(struct ethosu_device *edev,
+				      struct ethosu_validated_cmdstream_info *info,
+				      struct feat_matrix *fm, u32 x, u32 y, u32 c,
+				      bool ofm, u64 *max_len)
+{
+	u64 len;
+
+	len = feat_matrix_length(edev, info, fm, x, y, c, ofm);
+	if (len == U64_MAX)
+		return -EINVAL;
+
+	*max_len = max(*max_len, len);
+	return 0;
+}
+
+static int feat_matrix_size(struct ethosu_device *edev,
+			    struct ethosu_validated_cmdstream_info *info,
+			    struct feat_matrix *fm,
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
+				ret = feat_matrix_check_location(edev, info, fm,
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
+		ret = feat_matrix_check_location(edev, info, fm, x, 0, c,
+						 ofm, max_len);
+		if (ret)
+			return ret;
+		if (fm->height[0] < fm->height[1] && fm->height[1] <= y) {
+			ret = feat_matrix_check_location(edev, info, fm, x,
+							 fm->height[1], c, ofm,
+							 max_len);
+			if (ret)
+				return ret;
+		}
+		if (fm->height[1] < y) {
+			ret = feat_matrix_check_location(edev, info, fm, x,
+							 fm->height[1] + 1, c, ofm,
+							 max_len);
+			if (ret)
+				return ret;
+		}
+		return feat_matrix_check_location(edev, info, fm, x, y, c,
+						  ofm, max_len);
+	}
+
+	return feat_matrix_check_location(edev, info, fm, x, y, c, ofm,
+					  max_len);
+}
+
 static int buffer_size(struct ethosu_validated_cmdstream_info *info,
 		       struct buffer *buf, s8 region)
 {
@@ -282,6 +348,7 @@ static int calc_sizes(struct drm_device *ddev,
 {
 	struct ethosu_device *edev = to_ethosu_device(ddev);
 	u64 len;
+	int ret;
 
 	if (ifm) {
 		if (st->ifm.stride_kernel == U16_MAX)
@@ -298,21 +365,22 @@ static int calc_sizes(struct drm_device *ddev,
 		if (ifm_height < 0 || ifm_width < 0)
 			return -EINVAL;
 
-		len = feat_matrix_length(edev, info, &st->ifm, ifm_width,
-					 ifm_height, st->ifm.depth, false);
+		ret = feat_matrix_size(edev, info, &st->ifm,
+				       ifm_width, ifm_height, st->ifm.depth, false,
+					       &len);
 		dev_dbg(ddev->dev, "op %d: IFM:%d:0x%llx-0x%llx\n",
 			op, st->ifm.region, st->ifm.base[0], len);
-		if (len == U64_MAX)
-			return -EINVAL;
+		if (ret)
+			return ret;
 	}
 
 	if (ifm2) {
-		len = feat_matrix_length(edev, info, &st->ifm2, st->ifm.depth,
-					 0, st->ofm.depth, false);
+		ret = feat_matrix_size(edev, info, &st->ifm2,
+				       st->ifm.depth, 0, st->ofm.depth, false, &len);
 		dev_dbg(ddev->dev, "op %d: IFM2:%d:0x%llx-0x%llx\n",
 			op, st->ifm2.region, st->ifm2.base[0], len);
-		if (len == U64_MAX)
-			return -EINVAL;
+		if (ret)
+			return ret;
 	}
 
 	if (weight) {
@@ -346,12 +414,12 @@ static int calc_sizes(struct drm_device *ddev,
 			return -EINVAL;
 	}
 
-	len = feat_matrix_length(edev, info, &st->ofm, st->ofm.width,
-				 st->ofm.height[2], st->ofm.depth, true);
+	ret = feat_matrix_size(edev, info, &st->ofm, st->ofm.width,
+			       st->ofm.height[2], st->ofm.depth, true, &len);
 	dev_dbg(ddev->dev, "op %d: OFM:%d:0x%llx-0x%llx\n",
 		op, st->ofm.region, st->ofm.base[0], len);
-	if (len == U64_MAX)
-		return -EINVAL;
+	if (ret)
+		return ret;
 	if (!feat_matrix_chained(edev, &st->ofm))
 		info->output_region[st->ofm.region] = true;
 
@@ -366,18 +434,19 @@ static int calc_sizes_elemwise(struct drm_device *ddev,
 	struct ethosu_device *edev = to_ethosu_device(ddev);
 	u32 height, width, depth;
 	u64 len;
+	int ret;
 
 	if (ifm) {
 		height = st->ifm.broadcast & 0x1 ? 0 : st->ofm.height[2];
 		width = st->ifm.broadcast & 0x2 ? 0 : st->ofm.width;
 		depth = st->ifm.broadcast & 0x4 ? 0 : st->ofm.depth;
 
-		len = feat_matrix_length(edev, info, &st->ifm, width,
-					 height, depth, false);
+		ret = feat_matrix_size(edev, info, &st->ifm, width, height,
+				       depth, false, &len);
 		dev_dbg(ddev->dev, "op %d: IFM:%d:0x%llx-0x%llx\n",
 			op, st->ifm.region, st->ifm.base[0], len);
-		if (len == U64_MAX)
-			return -EINVAL;
+		if (ret)
+			return ret;
 	}
 
 	if (ifm2) {
@@ -385,20 +454,20 @@ static int calc_sizes_elemwise(struct drm_device *ddev,
 		width = st->ifm2.broadcast & 0x2 ? 0 : st->ofm.width;
 		depth = st->ifm2.broadcast & 0x4 ? 0 : st->ofm.depth;
 
-		len = feat_matrix_length(edev, info, &st->ifm2, width,
-					 height, depth, false);
+		ret = feat_matrix_size(edev, info, &st->ifm2, width, height,
+				       depth, false, &len);
 		dev_dbg(ddev->dev, "op %d: IFM2:%d:0x%llx-0x%llx\n",
 			op, st->ifm2.region, st->ifm2.base[0], len);
-		if (len == U64_MAX)
-			return -EINVAL;
+		if (ret)
+			return ret;
 	}
 
-	len = feat_matrix_length(edev, info, &st->ofm, st->ofm.width,
-				 st->ofm.height[2], st->ofm.depth, true);
+	ret = feat_matrix_size(edev, info, &st->ofm, st->ofm.width,
+			       st->ofm.height[2], st->ofm.depth, true, &len);
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

