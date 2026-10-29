Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281019;
	b=RGXlcNAVKEit5ty/Q34Czx5lRuydxIQKbNsWnpNuWbwZVJgSM3khnwLNHr3kR92cBvjW
	 PldunXVZZsUBecdVItHRkVOGenLy0KGv1YQK9IIrfPTskR64LL88od2GYO1/wB+rUaqIP
	 cMQD2ftIFtubb3tu3Lyvg825dodE99q/uUZw+7S6qB9Az1jt027QSN9+4Q1/3qs8O7YH8
	 v4N5okckCyUZPvODbpfoHGGaa59kcjk29D916ZhjlknYZrUpVW80tU2HGI04nLtoUjQ2d
	 ddOefwiF8ycOyKfJ12wcKSsHVK3kssohEG3yk2lZzT2MyVVoQ/TBs9ZVJKRRNIjNZ/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281019;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=7xahu3ursgj9R2ICIpMtCs8ahKKm2hhp7bMQGfdtbbg=;
	b=0BmNknYUlYnZyJj8t5lxjZPpVPqXchN7L1xYwzCm908iQZvAXgy5bz3v1rIpXFVwgeC0
	 ELnjMjjsij8o7JpsW3NBZVyoW3tFFbQjzVOQYkOE8BNPOgfrAuM/k8n2YmE8pudJGjh2k
	 iQDfYE+GpA51JjDWYvfZ5aBNVBTgig6U8/uJzznlIsnY6b3kCR7cgLGflL19D8Mqte9bI
	 KhP+K4v4ZjlW8XzmnRig//2mYGuoSN1p7BJA4mGpA7E3kyvyCdO2ZRDPhXBixvVMji5W7
	 X7xlcINArQniMMNqW9AOBPCPz4aN4Y2SCtiikXGAO8xP3cx2GCO/1EHKAfCxD939cJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kLzeX1wm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8C7606C32A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kLzeX1wm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE16C1F01825;
	Thu, 29 Oct 2026 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793281019;
	bh=7xahu3ursgj9R2ICIpMtCs8ahKKm2hhp7bMQGfdtbbg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kLzeX1wmYXXN2kpJRJkm9te6HMBit/xSlz7FhTv4k5tG7hwgt5Fm3VKZD7EEacIy5
	 wJWVsxX98bD0tO/4HFcM/Vx+Ce1lU7wD54U5DzdixEEMoF1l3M8WpLGcy3rKth+lP5
	 TGA/mX9DUw2kvMbYuOroHR6TcOMqAm8lsYMjpGWb+cVuduawjj6QYLFqmRiGm5E06j
	 T6JMkczfPHEVIqEBM1UoyexjuVdQb2sQRMEIVGEg49CFyUggNSyQOTOuGfmRMAv5Kq
	 Av5ISa/TMBSU6zlLoGzdgQ3GlKE2bBR18Uw1HxyiQTTTOsDGbrR4ei9qlvvTOsxOtS
	 2FInWOZ3QNyxA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:36:15 -0500
Subject: [PATCH v4 28/31] accel: ethosu: Validate resize operations
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
Message-Id: <20261029-ethosu-fixes-v4-28-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

Resize input coordinates are controlled by the scale, offset, and step
registers. Require those values to be explicitly programmed, validate
the scale and step relationships, and use a conservative coordinate
bound when validating the input feature map.

This prevents retained or malformed resize state from accessing beyond
the validated input feature-map buffer.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - Fix width and height calculations to account for kernel size reported
   by sashiko

v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_device.h |   8 ++
 drivers/accel/ethosu/ethosu_gem.c    | 161 ++++++++++++++++++++++++++++++++++-
 2 files changed, 168 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index c3789474fa7b..135c33f57045 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -121,6 +121,8 @@ enum ethosu_cmds {
 	NPU_SET_OFM_HEIGHT_M1 = 0x112,
 	NPU_SET_OFM_DEPTH_M1 = 0x113,
 	NPU_SET_OFM_PRECISION = 0x114,
+	NPU_SET_OFM_BLK_WIDTH_M1 = 0x115,
+	NPU_SET_OFM_BLK_HEIGHT_M1 = 0x116,
 	NPU_SET_OFM_WIDTH0_M1 = 0x11a,
 	NPU_SET_OFM_HEIGHT0_M1 = 0x11b,
 	NPU_SET_OFM_HEIGHT1_M1 = 0x11c,
@@ -131,6 +133,10 @@ enum ethosu_cmds {
 	NPU_SET_ACC_FORMAT = 0x124,
 	NPU_SET_WEIGHT_REGION = 0x128,
 	NPU_SET_SCALE_REGION = 0x129,
+	NPU_SET_RESIZE_X_SCALE_N_M1 = 0x12a,
+	NPU_SET_RESIZE_Y_SCALE_N_M1 = 0x12b,
+	NPU_SET_RESIZE_X_OFFSET = 0x12c,
+	NPU_SET_RESIZE_Y_OFFSET = 0x12d,
 	NPU_SET_DMA0_SRC_REGION = 0x130,
 	NPU_SET_DMA0_DST_REGION = 0x131,
 	NPU_SET_DMA0_SIZE0 = 0x132,
@@ -181,6 +187,8 @@ enum ethosu_cmds {
 	NPU_SET_WEIGHT2_LENGTH = 0x4093,
 	NPU_SET_WEIGHT3_BASE = 0x4094,
 	NPU_SET_WEIGHT3_LENGTH = 0x4095,
+	NPU_SET_RESIZE_X = 0x4096,
+	NPU_SET_RESIZE_Y = 0x4097,
 };
 
 #define NPU_ACC_FORMAT_INPUT_MASK	GENMASK(5, 4)
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index fe6bf1a2f8cb..0b227664afc7 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -149,6 +149,15 @@ struct feat_matrix {
 	u8 pad_right;
 };
 
+struct resize_axis {
+	u16 scale_n;
+	s16 offset;
+	u16 one_step_int;
+	u16 one_step_mod;
+	u16 blk_step_int;
+	u16 blk_step_mod;
+};
+
 #define NPU_CMD0_REGS	0x200
 #define NPU_CMD1_REGS	0x100
 
@@ -162,6 +171,9 @@ struct cmd_state {
 	struct feat_matrix ofm;
 	struct feat_matrix ifm;
 	struct feat_matrix ifm2;
+	u16 ofm_blk_width;
+	u16 ofm_blk_height;
+	struct resize_axis resize[2];
 };
 
 static void cmd_state_init(struct cmd_state *st)
@@ -663,6 +675,98 @@ calc_acc_input_size(struct drm_device *ddev,
 	return ret;
 }
 
+static int resize_axis_size(struct cmd_state *st, int axis, u16 ofm_size,
+			    u16 ofm_blk_size, u32 *size)
+{
+	struct resize_axis *resize = &st->resize[axis];
+	u64 one_step, blk_step, coord;
+
+	if (resize->offset < -(s16)resize->scale_n ||
+	    resize->offset >= resize->scale_n ||
+	    resize->one_step_mod >= resize->scale_n ||
+	    resize->blk_step_mod >= resize->scale_n)
+		return -EINVAL;
+
+	one_step = resize->one_step_int * resize->scale_n +
+		resize->one_step_mod;
+	blk_step = resize->blk_step_int * resize->scale_n +
+		resize->blk_step_mod;
+	if (check_mul_overflow((u64)ofm_blk_size, one_step, &coord) ||
+	    blk_step != coord)
+		return -EINVAL;
+
+	if (check_mul_overflow((u64)ofm_size, one_step, &coord) ||
+	    check_add_overflow(coord, (u64)resize->scale_n - 1, &coord))
+		return -EINVAL;
+
+	coord = div_u64(coord, resize->scale_n);
+	if (coord >= U32_MAX)
+		return -EINVAL;
+
+	*size = coord + 1;
+	return 0;
+}
+
+
+static int calc_sizes_resize(struct drm_device *ddev,
+			     struct ethosu_validated_cmdstream_info *info,
+			     struct cmd_state *st)
+{
+	struct ethosu_device *edev = to_ethosu_device(ddev);
+	u32 ifm_width, ifm_height;
+	u64 len;
+	int ret;
+
+	if (!cmd_state_reg_is_set(st, NPU_SET_KERNEL_WIDTH_M1) ||
+	    !cmd_state_reg_is_set(st, NPU_SET_KERNEL_HEIGHT_M1) ||
+	    !cmd_state_reg_is_set(st, NPU_SET_OFM_BLK_WIDTH_M1) ||
+	    !cmd_state_reg_is_set(st, NPU_SET_OFM_BLK_HEIGHT_M1) ||
+	    !cmd_state_reg_is_set(st, NPU_SET_RESIZE_X_SCALE_N_M1) ||
+	    !cmd_state_reg_is_set(st, NPU_SET_RESIZE_Y_SCALE_N_M1) ||
+	    !cmd_state_reg_is_set(st, NPU_SET_RESIZE_X_OFFSET) ||
+	    !cmd_state_reg_is_set(st, NPU_SET_RESIZE_Y_OFFSET) ||
+	    !cmd_state_reg_is_set(st, NPU_SET_RESIZE_X) ||
+	    !cmd_state_reg_is_set(st, NPU_SET_RESIZE_Y))
+		return -EINVAL;
+
+	ret = resize_axis_size(st, 0, st->ofm.width, st->ofm_blk_width,
+			       &ifm_width);
+	if (ret)
+		return ret;
+	ret = resize_axis_size(st, 1, st->ofm.height[2], st->ofm_blk_height,
+			       &ifm_height);
+	if (ret)
+		return ret;
+
+	if (check_add_overflow(ifm_width, (u32)st->ifm.width, &ifm_width) ||
+	    check_add_overflow(ifm_height, (u32)st->ifm.height[2], &ifm_height))
+		return -EINVAL;
+
+	ret = feat_matrix_size(edev, info, st, &st->ifm, FEAT_MATRIX_IFM,
+			       ifm_width, ifm_height, st->ifm.depth, false, &len);
+	dev_dbg(ddev->dev, "op %d: IFM:%d:0x%llx-0x%llx\n", NPU_OP_RESIZE,
+		st->ifm.region, st->ifm.base[0], len);
+	if (ret)
+		return ret;
+
+	ret = feat_matrix_size(edev, info, st, &st->ofm, FEAT_MATRIX_OFM,
+			       st->ofm.width, st->ofm.height[2], st->ofm.depth,
+			       true, &len);
+	dev_dbg(ddev->dev, "op %d: OFM:%d:0x%llx-0x%llx\n", NPU_OP_RESIZE,
+		st->ofm.region, st->ofm.base[0], len);
+	if (ret)
+		return ret;
+
+	ret = calc_acc_input_size(ddev, info, st);
+	if (ret)
+		return ret;
+
+	if (!feat_matrix_chained(edev, &st->ofm))
+		info->output_region[st->ofm.region] = true;
+
+	return 0;
+}
+
 static int buffer_size(struct ethosu_validated_cmdstream_info *info,
 		       struct cmd_state *st, struct buffer *buf, s8 region,
 		       u16 region_cmd, u16 base_cmd, u16 length_cmd, bool optional)
@@ -972,7 +1076,12 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 				return ret;
 			break;
 		case NPU_OP_RESIZE: // U85 only
-			return -EINVAL;
+			if (ethosu_is_u65(edev) || param > 2)
+				return -EINVAL;
+			ret = calc_sizes_resize(ddev, info, &st);
+			if (ret)
+				return ret;
+			break;
 		case NPU_SET_KERNEL_WIDTH_M1:
 			st.ifm.width = param;
 			break;
@@ -1069,6 +1178,12 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 			}
 			st.ofm.precision = param;
 			break;
+		case NPU_SET_OFM_BLK_WIDTH_M1:
+			st.ofm_blk_width = param & 0x7f;
+			break;
+		case NPU_SET_OFM_BLK_HEIGHT_M1:
+			st.ofm_blk_height = param & 0x7f;
+			break;
 		case NPU_SET_OFM_REGION:
 			st.ofm.region = param & 0x7;
 			break;
@@ -1139,6 +1254,34 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 		case NPU_SET_SCALE_REGION:
 			st.scale[0].region = param & 0x7;
 			break;
+		case NPU_SET_RESIZE_X_SCALE_N_M1:
+			if (ethosu_is_u65(edev))
+				break;
+			if (param & GENMASK(15, 11))
+				return -EINVAL;
+			st.resize[0].scale_n = param + 1;
+			break;
+		case NPU_SET_RESIZE_Y_SCALE_N_M1:
+			if (ethosu_is_u65(edev))
+				break;
+			if (param & GENMASK(15, 11))
+				return -EINVAL;
+			st.resize[1].scale_n = param + 1;
+			break;
+		case NPU_SET_RESIZE_X_OFFSET:
+			if (ethosu_is_u65(edev))
+				break;
+			if (param & GENMASK(15, 12))
+				return -EINVAL;
+			st.resize[0].offset = sign_extend32(param, 11);
+			break;
+		case NPU_SET_RESIZE_Y_OFFSET:
+			if (ethosu_is_u65(edev))
+				break;
+			if (param & GENMASK(15, 12))
+				return -EINVAL;
+			st.resize[1].offset = sign_extend32(param, 11);
+			break;
 		case NPU_SET_WEIGHT_BASE:
 			st.weight[0].base = addr;
 			break;
@@ -1175,6 +1318,22 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 		case NPU_SET_WEIGHT3_LENGTH:
 			st.weight[3].length = cmds[1];
 			break;
+		case NPU_SET_RESIZE_X:
+		case NPU_SET_RESIZE_Y:
+			if (ethosu_is_u65(edev))
+				break;
+			if ((cmds[0] & BIT(31)) ||
+			    (cmds[1] & (GENMASK(31, 27) | GENMASK(15, 11))))
+				return -EINVAL;
+			st.resize[cmd - NPU_SET_RESIZE_X].one_step_int =
+				FIELD_GET(GENMASK(19, 16), cmds[0]);
+			st.resize[cmd - NPU_SET_RESIZE_X].blk_step_int =
+				FIELD_GET(GENMASK(30, 20), cmds[0]);
+			st.resize[cmd - NPU_SET_RESIZE_X].one_step_mod =
+				FIELD_GET(GENMASK(10, 0), cmds[1]);
+			st.resize[cmd - NPU_SET_RESIZE_X].blk_step_mod =
+				FIELD_GET(GENMASK(26, 16), cmds[1]);
+			break;
 
 		case NPU_SET_DMA0_SRC_REGION:
 			if (param & NPU_DMA_REGION_INDEX_MODE)

-- 
2.53.0

