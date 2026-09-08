Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1D15650EC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905109; cv=none; b=UkKCsc0BMsKBeEARb3ZY7mQ4izlFgrBkm1U44gR5BHD+e0/Jlw5lYDHKM+hYhROpVTEnC96vMpwci94YL5N+IUM1RGsRC7KS+RvQ08iaGAGd9xdf8X0WX0sysUnuDPW1uX7CxNsgzm+DoWlJ2cOQGyNNPa617HPMYS04ytVtLRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905109; c=relaxed/simple;
	bh=D0IVYPx+s/L006LL8Lo4pkh/8doqKmE/VvRQCs5lXCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bi5e+ExiY83IRfhG9OnB7G/ZBoPON0hsKQvOZpwdfa5ep0RFEql7Ajhf2KStj8kFEUe8ZbbLeV6qgUMRGFiS/qoB5xuOHI9PNBIHltEbYAFBtM7fZxzEu7cyPatdTdsAWTCdGN15oMME7whBCDmpSH1L/8KrzukfPJqnC4sF7MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaNvvATV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaNvvATV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBD11F00A3E;
	Tue,  8 Sep 2026 22:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905107;
	bh=PJfjk3HVbDnKacfZNk8oE66LNr679YyAwv2fhXFqBt8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BaNvvATVC+1DJIwFYdKEgZnDGqLXXTyED6xv6Bh/SrgaPn3hxD1bD1HZQILMfpVCC
	 eoADNpRUXd0Jv6PziXrO/jq1LMl3qy76UrE71/YWJUAr9IvLSSWVB7D0zbz8j2AMjX
	 9OELfRGEW3lHhOFo9UXrj0FY3mghcBpP7Y93cuO4ElY0IZgACZ5Jbwm/FAQkxea0q6
	 0M1necsmNgW1ATcP16G/QJ6SibO0Neu+U/1gD2L1O/DGTM6fNMKY6+nn0goKM8m4WS
	 d7mrnrvpckeCiUn8M4iDZVJ8ZoAcA95ZhKWS2qX1e26/hFoq+cglRnyzoMwn2r2ZR7
	 +oNI5lHjAG3CQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:49 -0500
Subject: [PATCH v3 12/22] accel: ethosu: Reject unsupported commands
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-12-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
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
v2:
 - no changes
---
 drivers/accel/ethosu/ethosu_device.h |  4 ++++
 drivers/accel/ethosu/ethosu_gem.c    | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+)

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
index abfb173e1008..5d4e89783139 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -652,6 +652,9 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 		cmd_state_set_reg(&st, cmd);
 
 		switch (cmd) {
+		case NPU_OP_BRANCH:
+		case NPU_OP_IRQ:
+			return -EINVAL;
 		case NPU_OP_STOP:
 			if (i != size / 4 - 1)
 				return -EINVAL;
@@ -745,6 +748,8 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 			st.ifm.depth = param;
 			break;
 		case NPU_SET_IFM_PRECISION:
+			if (((param >> 6) & 0x3) > 1)
+				return -EINVAL;
 			st.ifm.precision = param;
 			break;
 		case NPU_SET_IFM_BROADCAST:
@@ -788,6 +793,10 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
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
@@ -822,6 +831,8 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 			st.ifm2.broadcast = param;
 			break;
 		case NPU_SET_IFM2_PRECISION:
+			if (((param >> 6) & 0x3) > 1)
+				return -EINVAL;
 			st.ifm2.precision = param;
 			break;
 		case NPU_SET_IFM2_REGION:
@@ -896,18 +907,26 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 			break;
 
 		case NPU_SET_DMA0_SRC_REGION:
+			if (param & NPU_DMA_REGION_INDEX_MODE)
+				return -EINVAL;
 			if (param & 0x100)
 				st.dma.src.region = -1;
 			else
 				st.dma.src.region = param & 0x7;
 			st.dma.src.mode = (param >> 9) & 0x3;
+			if (st.dma.src.mode == 3)
+				return -EINVAL;
 			break;
 		case NPU_SET_DMA0_DST_REGION:
+			if (param & NPU_DMA_REGION_INDEX_MODE)
+				return -EINVAL;
 			if (param & 0x100)
 				st.dma.dst.region = -1;
 			else
 				st.dma.dst.region = param & 0x7;
 			st.dma.dst.mode = (param >> 9) & 0x3;
+			if (st.dma.dst.mode == 3)
+				return -EINVAL;
 			break;
 		case NPU_SET_DMA0_SIZE0:
 			st.dma.size0 = param;

-- 
2.53.0

