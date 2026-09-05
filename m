Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E035346E7D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569046; cv=none; b=VPen3bRqi3FRpX8XM7qY51RKUBXKXjudSIeWkTWda163RfiglK57wVi4fAC6lOWdbri7PRT24nkFZGxGaIi/lxDtF9hy+W7hX5ckhdPrUEY0iy7y005ok9y1K+btZtzkPSbXD0PFm7loxT7oT0RH4/L1EG22xypz3jPOaSQ59gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569046; c=relaxed/simple;
	bh=LeatAYDUtWP8EvUf0chp6YUHa7+7uwCncDxxgCseTUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/BAWl5xcZvNZ/UYtGaDaKY/ee2RHaGnUGBkvN/hUMPHlUGkDG/Dk8saHcf6yoX6ctlb0/rvNcT2yyQ+q46XMbYdNVQfyZ/KaWShVvbgQhQQShlERgOKpmyVguEWM1RWBCFvIPm2pxcZcmy0jOTeNkV9fj9hYJLUrGdYmWdOYBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oo9dt2Mz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oo9dt2Mz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F6F1F00A3D;
	Sat,  5 Sep 2026 00:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788569045;
	bh=Abb/qsORp6PxsrW1QG8TXfIjYHfZPcn8pVpMjsyREHc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oo9dt2MzEwkMRfVnymr7GW1Vm6d5h43plGtBMRkdM5E5Fqo/sozyAQfOViKZ3FgnE
	 HJbEho6wPoE/J3codzMTUcb2LyWX2tKH9HngCch5HXnS25Jov3FGW2OPij90EdJrmX
	 X2FzbdIr1r9apRgphgyAi/iwi/7ta+OLvVI5Len99u8954HZuu8mI/dNGfDvk7piGG
	 fz6/gaJjz3o3emkqcFm1rLgG4yq2T9jwp/Wv+J4bV6/rDM20m8YaMPgHGejGhLbMUW
	 /uzW/JP6ENHruE3DI4j+wja7BZDoldqlbiYRvEn9AoL7gl1YGiQZLszgLbwOKaEonY
	 zJEFCQ1o+df5A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 04 Sep 2026 19:43:36 -0500
Subject: [PATCH v2 17/19] accel: ethosu: Split U65 and U85 DMA length
 validation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-ethosu-fixes-v2-17-3767738756a4@kernel.org>
References: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
In-Reply-To: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

Ethos-U65 and Ethos-U85 have slightly different DMA programming models.
The U65 has skip values added on to the size whereas U85 has signed
stride values. The U65 shares the skip values for source and destination
whereas the U85 has independent settings for source and destination.

The current validation only correctly handles U65 constraints. Split the
shared DMA length calculation into U65 and U85 specific versions.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 110 ++++++++++++++++++++++++++++++--------
 1 file changed, 87 insertions(+), 23 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index c3dad3f80c34..559fbf55f12d 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -225,40 +225,92 @@ static bool dma_params_valid(struct ethosu_device *edev, struct cmd_state *st,
 	return true;
 }
 
-static u64 dma_length(struct ethosu_device *edev,
-		      struct ethosu_validated_cmdstream_info *info,
-		      struct cmd_state *st, struct dma_state *dma_st,
-		      struct dma *dma, u16 region_cmd, u16 addr_cmd)
+static u64 dma_length_finish(struct ethosu_validated_cmdstream_info *info,
+			     const struct dma *dma, u64 len)
+{
+	if (dma->region >= 0) {
+		u64 end;
+
+		if (check_add_overflow(len, dma->offset, &end))
+			return U64_MAX;
+		info->region_size[dma->region] =
+			max(info->region_size[dma->region], end);
+	}
+
+	return len;
+}
+
+static u64 dma_length_u65(struct ethosu_validated_cmdstream_info *info,
+			  struct dma_state *dma_st,
+			  struct dma *dma)
 {
 	s8 mode = dma->mode;
 	u64 len = dma->len;
 
-	if (!dma_params_valid(edev, st, dma_st, dma, region_cmd, addr_cmd))
-		return U64_MAX;
+	if (mode >= 1) {
+		if (check_add_overflow(len, (u64)dma->stride[0], &len) ||
+		    check_mul_overflow(len, (u64)dma_st->size0, &len))
+			return U64_MAX;
+	}
+	if (mode == 2) {
+		if (check_add_overflow(len, (u64)dma->stride[1], &len) ||
+		    check_mul_overflow(len, (u64)dma_st->size1, &len))
+			return U64_MAX;
+	}
+
+	return dma_length_finish(info, dma, len);
+}
+
+static u64 dma_length_u85(struct ethosu_validated_cmdstream_info *info,
+			  struct dma_state *dma_st,
+			  struct dma *dma)
+{
+	s8 mode = dma->mode;
+	s64 min = 0;
+	u64 max = dma->len;
+	s64 stride;
 
 	if (mode >= 1) {
-		if (dma->stride[0] < 0 && (u64)(-dma->stride[0]) > len)
+		if (check_mul_overflow(dma->stride[0],
+				       (s64)dma_st->size0, &stride))
 			return U64_MAX;
-		len += dma->stride[0];
-		if (check_mul_overflow(len, (u64)dma_st->size0, &len))
+		if (stride < 0) {
+			if (check_add_overflow(min, stride, &min))
+				return U64_MAX;
+		} else if (check_add_overflow(max, (u64)stride, &max)) {
 			return U64_MAX;
+		}
 	}
 	if (mode == 2) {
-		if (dma->stride[1] < 0 && (u64)(-dma->stride[1]) > len)
+		if (check_mul_overflow(dma->stride[1],
+				       (s64)dma_st->size1, &stride))
 			return U64_MAX;
-		len += dma->stride[1];
-		if (check_mul_overflow(len, (u64)dma_st->size1, &len))
+		if (stride < 0) {
+			if (check_add_overflow(min, stride, &min))
+				return U64_MAX;
+		} else if (check_add_overflow(max, (u64)stride, &max)) {
 			return U64_MAX;
+		}
 	}
-	if (dma->region >= 0) {
-		u64 end;
 
-		if (check_add_overflow(len, dma->offset, &end))
-			return U64_MAX;
-		info->region_size[dma->region] = max(info->region_size[dma->region], end);
-	}
+	if (min < 0 && -(u64)min > dma->offset)
+		return U64_MAX;
 
-	return len;
+	return dma_length_finish(info, dma, max);
+}
+
+static u64 dma_length(struct ethosu_device *edev,
+		      struct ethosu_validated_cmdstream_info *info,
+		      struct cmd_state *st, struct dma_state *dma_st,
+		      struct dma *dma, u16 region_cmd, u16 addr_cmd)
+{
+	if (!dma_params_valid(edev, st, dma_st, dma, region_cmd, addr_cmd))
+		return U64_MAX;
+
+	if (ethosu_is_u65(edev))
+		return dma_length_u65(info, dma_st, dma);
+
+	return dma_length_u85(info, dma_st, dma);
 }
 
 static bool feat_matrix_chained(struct ethosu_device *edev, struct feat_matrix *fm)
@@ -1047,16 +1099,28 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 			st.dma.size1 = param;
 			break;
 		case NPU_SET_DMA0_SRC_STRIDE0:
-			st.dma.src.stride[0] = ((s64)addr << 24) >> 24;
+			if (ethosu_is_u65(edev))
+				st.dma.dst.stride[0] = addr;
+			else
+				st.dma.src.stride[0] = sign_extend64(addr, 39);
 			break;
 		case NPU_SET_DMA0_SRC_STRIDE1:
-			st.dma.src.stride[1] = ((s64)addr << 24) >> 24;
+			if (ethosu_is_u65(edev))
+				st.dma.dst.stride[1] = addr;
+			else
+				st.dma.src.stride[1] = sign_extend64(addr, 39);
 			break;
 		case NPU_SET_DMA0_DST_STRIDE0:
-			st.dma.dst.stride[0] = ((s64)addr << 24) >> 24;
+			if (!ethosu_is_u65(edev))
+				st.dma.dst.stride[0] = sign_extend64(addr, 39);
+			else
+				return -EINVAL;
 			break;
 		case NPU_SET_DMA0_DST_STRIDE1:
-			st.dma.dst.stride[1] = ((s64)addr << 24) >> 24;
+			if (!ethosu_is_u65(edev))
+				st.dma.dst.stride[1] = sign_extend64(addr, 39);
+			else
+				return -EINVAL;
 			break;
 		case NPU_SET_DMA0_SRC:
 			st.dma.src.offset = addr;

-- 
2.53.0

