Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0DD5AEC48
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905119; cv=none; b=e4JzkdeAreVe/Uw/sDVcgKD/RP76qfMQC5A/X3BwBRS6j0Z+GmyVK9qGcOPDZbwolwL9zWhNEhWvhbib2/PWue9kZladSO11QSGZgSxSADMhtV65Raz9GWcFfG9kWlNDUCIzrTUebemyZOeD2U2Wz8RAgbZQ9vSpmhJTbCdlcVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905119; c=relaxed/simple;
	bh=HJh1R7SejY4Q2lRhBd07mQH/N6j1dCRwvRwv2GLT96U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EUoMWgoFfHXKogqDM/JMWZqlkOejgCDxicvyQsz7kEiuJlnyFx5xWlN7eWktAZXQ+6GO2bRqGexiPCtoFpqTNsFybiP+QMcEI511ljcE1QznRAf/zBZC4bClvgM747HaWW+tWa+VjCGpc6JiuP0X8aPUyETJ4n6qKzSLddDVXPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bN9Gi6dD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bN9Gi6dD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78AC1F00A3D;
	Tue,  8 Sep 2026 22:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905118;
	bh=/PMxlOlJmhWneaMxKb4QJrl9dOPgJlMhSq6rhV9wd4E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bN9Gi6dDg6wzRuzOyi1Hck23I23JShNFF8gQZftbgeutcPZpa63W/2ccRUGWhhK1K
	 7Yi7XQ9UsKq+vP2wBbo3PcoVSi/25BBKMhRCoqdfx8dusWuAlTAV5PLEhLvaWU4ktt
	 /OATmlpW6dk+LTXxpCruCEhWW8P418e+olEHYHpnFdQhJwcTeQ6nU+FhuhmDc2cbuM
	 mWLfG5by595RYvp0KdLnFGMC/uqELmgpIV/1R8aiZLKpFBF1TL4xs9ZifA1tZBuNlu
	 t+uNN67hD1yntQQFVvSk6D9RUjsZXxzJ7BvS5a6e2G5lnf9dD4pfRmMjQkpvMnn+Wz
	 WWbWwaQqEgaig==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:57 -0500
Subject: [PATCH v3 20/22] accel: ethosu: Split U65 and U85 DMA length
 validation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-20-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

Ethos-U65 and Ethos-U85 have slightly different DMA programming models.
The U65 has skip values added on to the size whereas U85 has signed
stride values. The U65 shares the skip values for source and destination
whereas the U85 has independent settings for source and destination.

The current validation only correctly handles U65 constraints and only
for source 2D/3D mode. Split the shared DMA length calculation into U65
and U85 specific versions adding U65 destination 2D/3D mode and U85
constraints.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - Fix U65 destination stride/skip handling

v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 114 ++++++++++++++++++++++++++++++--------
 1 file changed, 91 insertions(+), 23 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index df26ccd50a96..82699050a670 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -235,40 +235,92 @@ static bool dma_params_valid(struct ethosu_device *edev, struct cmd_state *st,
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
@@ -1078,16 +1130,32 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 			st.dma.size1 = param;
 			break;
 		case NPU_SET_DMA0_SRC_STRIDE0:
-			st.dma.src.stride[0] = ((s64)addr << 24) >> 24;
+			if (ethosu_is_u65(edev)) {
+				st.dma.src.stride[0] = addr;
+				st.dma.dst.stride[0] = addr;
+			} else {
+				st.dma.src.stride[0] = sign_extend64(addr, 39);
+			}
 			break;
 		case NPU_SET_DMA0_SRC_STRIDE1:
-			st.dma.src.stride[1] = ((s64)addr << 24) >> 24;
+			if (ethosu_is_u65(edev)) {
+				st.dma.src.stride[1] = addr;
+				st.dma.dst.stride[1] = addr;
+			} else {
+				st.dma.src.stride[1] = sign_extend64(addr, 39);
+			}
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

