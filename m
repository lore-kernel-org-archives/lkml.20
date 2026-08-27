Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFA029D27D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862818; cv=none; b=LqMkAe0ASHk3HcmmVN4Ex69rxtQbvkvNElFNKPttq7q/SnpBO6TTiwMG5MSg9XnpLW81JRf5Z6NIIrWWvX2T28prfWs7QlOBBvfLkX8vzclv3oGGZvotaxcMLGLi5qAhdKdqlhIoIOVwJIgA9uYHeAsvjAIVrX4pJwu+JEYJPkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862818; c=relaxed/simple;
	bh=huEt1lMN433bAjsn6Lg3/b+Uv2boty/Am2Kn/arZixE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uFzCtqQpMVwvL0kZHsJ8Iq/6v7jB5BpEgdpiuiZI5wx6NcPgYZbfHsKRCo/V5vyiNQpnghL9IkmT6r41FeUUs86d80r7s9Nxhf/REMFs0HpPdwWWJ8RVfa8GiRDMIeARcfR59DD8DSsYsgh0kDIbv9ssc/E7VXoAK2OAJXEEtEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghoQbs1r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghoQbs1r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54D31F00A3E;
	Thu, 27 Aug 2026 20:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787862806;
	bh=S09KMKeejzD64bM7Mo69fZD6EyqOgGCSj8/rAtNwTt8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ghoQbs1rBX4gZHHxLvGMeDqxgTlWT2vHzff0iBVNoRcycqoL75Np82wQYoH+JRLAU
	 OGjsyzodrEjIv4HgUNhPHcii8Vota2epXwmRD7ZCneKzcMO5YBNAtI1ZeFOanMqhfo
	 HD/3rhRTiCnD22wYn5LxpzCt2HeZUrDE2LsW4nXUXfnA4joERkfGxs3X/aIpKuRDxw
	 G0BrhMLvpKq3MunURfO7uYc7WhNDLcucVrkeQ+WsxAvlCWFUZdEKkI8o33Yidv/Zs2
	 BKIaTMSkDybaOfVfushMnM9iV0sQ58hdVwYY+H6OUg720dphSLQfY8qxdqG7MWbKBu
	 sxSCEBqGF7VeQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 27 Aug 2026 15:33:10 -0500
Subject: [PATCH 11/11] accel: ethosu: Validate OFM transpose
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-ethosu-fixes-v1-11-346f9ea8791c@kernel.org>
References: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
In-Reply-To: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

U85 OFM dimensions are specified before transposition, while
tile bases and strides address the transposed feature map. Permute
the output endpoint before validating its tile and stride accesses.

Allow the defined U85 transpose encodings and reject the two
reserved encodings.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/accel/ethosu/ethosu_device.h |  1 +
 drivers/accel/ethosu/ethosu_gem.c    | 58 ++++++++++++++++++++++++++++++++++--
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index c330048dbcca..1731c43aa045 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -87,6 +87,7 @@ struct gen_pool;
 #define PMU_EV_TYPE_IDLE	0x20
 
 #define NPU_DMA_REGION_INDEX_MODE	BIT(11)
+#define NPU_OFM_TRANSPOSE_MASK		GENMASK(13, 11)
 
 enum ethosu_cmds {
 	NPU_OP_STOP = 0x0,
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index a042e650f626..ad36fb8b3b30 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -199,6 +199,52 @@ static bool feat_matrix_chained(struct ethosu_device *edev, struct feat_matrix *
 	return !ethosu_is_u65(edev) && storage == 2;
 }
 
+static int feat_matrix_permute(struct ethosu_device *edev,
+			       struct feat_matrix *fm, u32 *x, u32 *y,
+			       u32 *c, bool ofm)
+{
+	u32 width = *x;
+	u32 height = *y;
+	u32 depth = *c;
+	u32 transpose;
+
+	if (ethosu_is_u65(edev) || !ofm)
+		return 0;
+
+	transpose = FIELD_GET(NPU_OFM_TRANSPOSE_MASK, fm->precision);
+
+	switch (transpose) {
+	case 0: /* HWC */
+		break;
+	case 1: /* WHC */
+		*x = height;
+		*y = width;
+		break;
+	case 2: /* HCW */
+		*x = depth;
+		*c = width;
+		break;
+	case 3: /* WCH */
+		*x = depth;
+		*y = width;
+		*c = height;
+		break;
+	case 6: /* CHW */
+		*x = height;
+		*y = depth;
+		*c = width;
+		break;
+	case 7: /* CWH */
+		*y = depth;
+		*c = height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static u64 feat_matrix_length(struct ethosu_device *edev,
 			      struct ethosu_validated_cmdstream_info *info,
 			      struct feat_matrix *fm,
@@ -283,6 +329,9 @@ static int feat_matrix_size(struct ethosu_device *edev,
 	int ret;
 
 	*max_len = 0;
+	ret = feat_matrix_permute(edev, fm, &x, &y, &c, ofm);
+	if (ret)
+		return ret;
 
 	if (ethosu_is_u65(edev) || storage == 0) {
 		for (int xi = 0; xi < 2; xi++) {
@@ -641,8 +690,13 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 		case NPU_SET_OFM_PRECISION:
 			if (((param >> 6) & 0x3) > 1)
 				return -EINVAL;
-			if (!ethosu_is_u65(edev) && (param & GENMASK(13, 11)))
-				return -EINVAL;
+			if (!ethosu_is_u65(edev)) {
+				switch (FIELD_GET(NPU_OFM_TRANSPOSE_MASK, param)) {
+				case 4:
+				case 5:
+					return -EINVAL;
+				}
+			}
 			st.ofm.precision = param;
 			break;
 		case NPU_SET_OFM_REGION:

-- 
2.53.0

