Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9777036E478
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862813; cv=none; b=BXCRDdztRKWiE8FeqalpPtReG42aT4LIv3VSZO8M4VESm0QPsVlIK3UX1zmT7CieqKrlVelX9jTr+6TmBZeIPmqyMOaytL5aaN/ld4S2iivFwWqXdEL2PsAsgpKqH0rCY85OYxScYJOKwsdf8Otw+68O3ueJibsazOxsECUcZtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862813; c=relaxed/simple;
	bh=7FumC1pNsTLUEptHxQcCA1J8qTAqILNyAAyQPeNrjik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MTSLkxIm0G1t7huvi3rmHC4fVLS57rp2FF6EElEhc/fymNSBhu7gOCTaEZPhfYjlGhxpL1jG64Bas7DHM8EsCAVwBrVvB/Kju9JhMoYU8jAq0KRvBFDU48uwBG60Ac/W3slUeYyGsDq5PLgQxAlcAnbLb+QJkkgsZmPwByxKWVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UiBXzmLq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UiBXzmLq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92C41F00A3D;
	Thu, 27 Aug 2026 20:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787862805;
	bh=nK2vnT+Di1V2VnSDnpyvtfiTC5KnQ3JoJi/nSooDR/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UiBXzmLqdRSOoJ/ny3yk6fKgGMVMCuS30pEzkK+K72iGhCXquojzd4ihd64JzxpoR
	 RZOa64N9QHG3sPPur/9/qLtPXyv0/tWWVCGmxAjWspzIQlqspbAthEayvmsR4DXXkg
	 JBx8OnvvFd5HObiCxCfylaSP9nrJSeNgE6qFw/RUg3aHQpoFzQlhgqv9xkXYhTkSTB
	 NQ78vpppPhTeyfRILknxULagvahDeZ5QTL1G7xFmdhoItsf3d8rPMPV1KBoS2eiQ5u
	 5f0cobeJzChbBYBdwNp0zwP+S9PovF7x9MrEF1mp4iVvJxf4xm3II22jEqvSg/YjZu
	 Ka+eckfz+xe3w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 27 Aug 2026 15:33:08 -0500
Subject: [PATCH 09/11] accel: ethosu: Reject unsupported commands
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-ethosu-fixes-v1-9-346f9ea8791c@kernel.org>
References: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
In-Reply-To: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The command-stream validator does not model U85 branches, indexed DMA,
or OFM transposes. A branch can bypass the linear validation state,
indexed DMA accesses an unchecked index buffer, and a transpose changes
the feature-map address calculation.

Reject those commands and configurations, as well as the reserved DMA
stride mode and feature-map formats. Reject command-stream IRQs because
they can signal job completion before later commands finish.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/accel/ethosu/ethosu_device.h |  4 ++++
 drivers/accel/ethosu/ethosu_gem.c    | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index 1eca8590e68d..c330048dbcca 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -86,14 +86,18 @@ struct gen_pool;
 #define PMU_EV_TYPE_CYCLES	0x11
 #define PMU_EV_TYPE_IDLE	0x20
 
+#define NPU_DMA_REGION_INDEX_MODE	BIT(11)
+
 enum ethosu_cmds {
 	NPU_OP_STOP = 0x0,
+	NPU_OP_IRQ = 0x1,
 	NPU_OP_CONV = 0x2,
 	NPU_OP_DEPTHWISE = 0x3,
 	NPU_OP_POOL = 0x5,
 	NPU_OP_ELEMENTWISE = 0x6,
 	NPU_OP_RESIZE = 0x7,	// U85 only
 	NPU_OP_DMA_START = 0x10,
+	NPU_OP_BRANCH = 0x4100,	// U85 only
 	NPU_SET_IFM_PAD_TOP = 0x100,
 	NPU_SET_IFM_PAD_LEFT = 0x101,
 	NPU_SET_IFM_PAD_RIGHT = 0x102,
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 3d1f4121db4f..2aafbfe95a8c 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -450,6 +450,9 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 		}
 
 		switch (cmd) {
+		case NPU_OP_BRANCH:
+		case NPU_OP_IRQ:
+			return -EINVAL;
 		case NPU_OP_STOP:
 			if (i != size / 4 - 1)
 				return -EINVAL;
@@ -522,6 +525,8 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 			st.ifm.depth = param;
 			break;
 		case NPU_SET_IFM_PRECISION:
+			if (((param >> 6) & 0x3) > 1)
+				return -EINVAL;
 			st.ifm.precision = param;
 			break;
 		case NPU_SET_IFM_BROADCAST:
@@ -565,6 +570,10 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 			st.ofm.depth = param;
 			break;
 		case NPU_SET_OFM_PRECISION:
+			if (((param >> 6) & 0x3) > 1)
+				return -EINVAL;
+			if (!ethosu_is_u65(edev) && (param & GENMASK(13, 11)))
+				return -EINVAL;
 			st.ofm.precision = param;
 			break;
 		case NPU_SET_OFM_REGION:
@@ -599,6 +608,8 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 			st.ifm2.broadcast = param;
 			break;
 		case NPU_SET_IFM2_PRECISION:
+			if (((param >> 6) & 0x3) > 1)
+				return -EINVAL;
 			st.ifm2.precision = param;
 			break;
 		case NPU_SET_IFM2_REGION:
@@ -673,13 +684,19 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 			break;
 
 		case NPU_SET_DMA0_SRC_REGION:
+			if (param & NPU_DMA_REGION_INDEX_MODE)
+				return -EINVAL;
 			if (param & 0x100)
 				st.dma.src.region = -1;
 			else
 				st.dma.src.region = param & 0x7;
 			st.dma.mode = (param >> 9) & 0x3;
+			if (st.dma.mode == 3)
+				return -EINVAL;
 			break;
 		case NPU_SET_DMA0_DST_REGION:
+			if (param & NPU_DMA_REGION_INDEX_MODE)
+				return -EINVAL;
 			if (param & 0x100)
 				st.dma.dst.region = -1;
 			else

-- 
2.53.0

