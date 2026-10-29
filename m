Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281023;
	b=qVtk2x7AcJeGnEEhXQYfnJTf7hu9ae5RX3uon7CWiYvF0N3evJe4D3jHuLjmk8ZJ3hkL
	 g3moEijYGvhlMQ7vXbiLxQv5A+wFt9JxBNemVTCWq3U16d18Ec5I3pemqRAf2sWgAu4Zq
	 20ZdVr4CipEcqVGLpFHJkqP3+nuP8cY6BZKYy0ZPquFx6qJdN6iQrQILNM8FPvN/4PqFV
	 Hq9y/aNXMYgljtKHAWF/DMqYfiiKVFih+jLQlV2/Zzmt/Rn2BJ4RrGVKs2SiCtc5RmpXV
	 ts6F2vrFPWVjwE/E5E4KBFhVCs/vEQDx6g/8nyQVRIM4KC8ATTPOSIufPt/JDjL5ypQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281023;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=+BQMj/oKhcMC8TgSMsshaViV+aijzIdXAPY1rNUymVs=;
	b=nlyJ/wnggp5c+M0eSmj8USGNMvQJWBAaH26EihPgFWzmZmzjFj2OPOiUu73FZWgeiCe1
	 1iYprvr5+OUl32p3aDMXLKTGYaVBLwbVSjCH73rxqT6nqkx7ns3vM5GP8ii2RMDJqaJFE
	 a/YF6z4wq7mYAPTzBPl2MzaV56AAWqyIiAp/4tOJXgrCLzgY6ue5JEEp9LMBvUrg8baKD
	 I/MxABagJlysZm25dTcfttTs5opp87yYG32nL7jnfcEpTMgqgdBbwe69pe1a5wAn0ryWd
	 FDFN07SKmnc30SzKQdr41OlG08eGoPPjEBLwEbFg9WQnjzKjJ5BycpniVE+TJDx761A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEQpulTX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F302606A6D8
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEQpulTX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE711F031E1;
	Thu, 29 Oct 2026 13:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793281022;
	bh=+BQMj/oKhcMC8TgSMsshaViV+aijzIdXAPY1rNUymVs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nEQpulTXhvVYpRM8/4rrSnKIpnehGMYP0j+xmnQGn2djs3A7++X4ro/noDSKZG50m
	 gsGwT59782LL0erQVJeq5j11AOhptSGOkpFLy4eg7T9hUECsIcpWr5w2xv2agO2djP
	 0RFohx3dDaM1s3Qqq1HSGEI+A3OUDigFaj+mYlNLwsAyudIlkN+IftazS1uf99wPLV
	 IHLHiIJscMe5lfWac2vWuxJ0FTZvZ/LbjBAGZTZreHFGoBIGswJcR3e8MnEhaefqSp
	 o0G0hzzlSN5a3a9lgjKAhKxzRWO/m4syXHDeqDm46q8OUXweQTx9n03meNIz8HGSr/
	 qR/8DdYoTRG0A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:36:18 -0500
Subject: [PATCH v4 31/31] accel: ethosu: Support U85 IFM upscaling
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
Message-Id: <20261029-ethosu-fixes-v4-31-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

Track the U85 IFM upscaling mode while validating command streams and
adjust feature-map bounds for its 2x resampling modes.

Resize operations require no IFM upscaling, so reject a non-default
mode there.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
 - New patch
---
 drivers/accel/ethosu/ethosu_device.h |  7 +++++++
 drivers/accel/ethosu/ethosu_gem.c    | 30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index f41a8e0e1e1b..1fec33d9917c 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -97,6 +97,12 @@ struct gen_pool;
 
 #define NPU_CMD_CTRL_CMD1		BIT(14)
 
+enum ethosu_ifm_upscale_mode {
+	NPU_IFM_UPSCALE_NONE,
+	NPU_IFM_UPSCALE_NEAREST,
+	NPU_IFM_UPSCALE_TRANSPOSE,
+};
+
 enum ethosu_cmds {
 	NPU_OP_STOP = 0x0,
 	NPU_OP_CONV = 0x2,
@@ -113,6 +119,7 @@ enum ethosu_cmds {
 	NPU_SET_IFM_PAD_BOTTOM = 0x103,
 	NPU_SET_IFM_DEPTH_M1 = 0x104,
 	NPU_SET_IFM_PRECISION = 0x105,
+	NPU_SET_IFM_UPSCALE = 0x107, // U85 only
 	NPU_SET_IFM_BROADCAST = 0x108,
 	NPU_SET_IFM_WIDTH0_M1 = 0x10a,
 	NPU_SET_IFM_HEIGHT0_M1 = 0x10b,
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 21458aacfcad..d82c9540e82a 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -165,6 +165,7 @@ struct cmd_state {
 	DECLARE_BITMAP(cmd0, NPU_CMD0_REGS);
 	DECLARE_BITMAP(cmd1, NPU_CMD1_REGS);
 	bool acc_input_ifm2;
+	u8 ifm_upscale;
 	u8 parallel_mode;
 	struct dma_state dma;
 	struct buffer scale[2];
@@ -718,6 +719,11 @@ static int calc_sizes_resize(struct drm_device *ddev,
 	u64 len;
 	int ret;
 
+	if (st->ifm_upscale != NPU_IFM_UPSCALE_NONE ||
+	    feat_matrix_chained(edev, &st->ofm) ||
+	    FIELD_GET(NPU_OFM_TRANSPOSE_MASK, st->ofm.precision))
+		return -EINVAL;
+
 	if (!cmd_state_reg_is_set(st, NPU_SET_KERNEL_WIDTH_M1) ||
 	    !cmd_state_reg_is_set(st, NPU_SET_KERNEL_HEIGHT_M1) ||
 	    !cmd_state_reg_is_set(st, NPU_SET_OFM_BLK_WIDTH_M1) ||
@@ -790,6 +796,20 @@ static int weight_streams(struct ethosu_device *edev, struct cmd_state *st,
 	return 0;
 }
 
+static u32 ifm_upscale_coord(u32 coord, u8 mode)
+{
+	switch (mode) {
+	case NPU_IFM_UPSCALE_NONE:
+		return coord;
+	case NPU_IFM_UPSCALE_NEAREST:
+		return coord / 2;
+	case NPU_IFM_UPSCALE_TRANSPOSE:
+		return coord / 2;
+	}
+
+	return 0;
+}
+
 static int buffer_size(struct ethosu_validated_cmdstream_info *info,
 		       struct cmd_state *st, struct buffer *buf, s8 region,
 		       u16 region_cmd, u16 base_cmd, u16 length_cmd, bool can_omit)
@@ -856,6 +876,8 @@ static int calc_sizes(struct drm_device *ddev,
 
 		if (ifm_height < 0 || ifm_width < 0)
 			return -EINVAL;
+		ifm_height = ifm_upscale_coord(ifm_height, st->ifm_upscale);
+		ifm_width = ifm_upscale_coord(ifm_width, st->ifm_upscale);
 
 		ret = feat_matrix_size(edev, info, st, &st->ifm, FEAT_MATRIX_IFM,
 				       ifm_width, ifm_height, st->ifm.depth, false,
@@ -952,6 +974,8 @@ static int calc_sizes_elemwise(struct drm_device *ddev,
 		height = st->ifm.broadcast & 0x1 ? 0 : st->ofm.height[2];
 		width = st->ifm.broadcast & 0x2 ? 0 : st->ofm.width;
 		depth = st->ifm.broadcast & 0x4 ? 0 : st->ofm.depth;
+		height = ifm_upscale_coord(height, st->ifm_upscale);
+		width = ifm_upscale_coord(width, st->ifm_upscale);
 
 		ret = feat_matrix_size(edev, info, st, &st->ifm, FEAT_MATRIX_IFM,
 				       width, height, depth, false, &len);
@@ -1168,6 +1192,12 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 				return -EINVAL;
 			st.ifm.precision = param;
 			break;
+		case NPU_SET_IFM_UPSCALE:
+			if (ethosu_is_u65(edev) ||
+			    param > NPU_IFM_UPSCALE_TRANSPOSE)
+				return -EINVAL;
+			st.ifm_upscale = param;
+			break;
 		case NPU_SET_IFM_BROADCAST:
 			st.ifm.broadcast = param;
 			break;

-- 
2.53.0

