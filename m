Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281004;
	b=Fs0Gm9+ZAlbMLzfztlLgcju4ZiGgyT/q7l7+jK3/dgHtTPDJ8+HN3RP2lx1l84qpGere
	 fIBcvIFBTIMG8qq/EUd4bmDJdnBbngA4WvshvIVLiVOeuSRAPLaMkzNo2tSygivnJxqpO
	 ipOYMbE9iyHn3S3bCFayYgTJVrfBQXvVusX1v8zzancDY8mtLsh2xx9LUCKyL4TOgU6tK
	 fcoGY++ycZyx/i+xREmHPEUCQ+qe69j8/J2WoEQigVF5AOvLDpyBcGs06wrrxA/kpubbf
	 9fzria+Pss3mirk+O2+8Ez0pMJeJ3k9g7JUQPpibkW9X/GucKL5mP7TggU1D8fDPyyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281004;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=rdb5sBDXeh9AfCd9wmWOf86ib01yXhPjddrnCAI4hG4=;
	b=lJ4AF6xSaxnLN2R2ajhqHUjaCjBjX294SSCSZnmcjhWCAXlmA1xFqi6JHzQIGrtv/Uct
	 AMgGpP8oYqtgQLFQju1JEpPqqeEVLP+U6q9d6QFmkcObk72UX/L7LoaYM3idJmFnIlcC+
	 4BytmN2aJxKy40svrCRoROFU00aWmwwqpqZ0tll/gPnYox5U/Hl5fVxE415EB9jhmXxDq
	 mB+HRI3D+ITBpM1i49vRWjyCZd6zqCZGnW0Bgt//CWEMePFIYKQS/94vjWZ1TDcYSNO4/
	 9yWgpf37CBJyaWg2zuM5leCj0viEmgNbq0IatVFUjFicBuYAmstrHKWnQ4VoUxj0s4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BZkFncyJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF87C606AAC3
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BZkFncyJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3AE1F01828;
	Thu, 29 Oct 2026 13:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793281003;
	bh=rdb5sBDXeh9AfCd9wmWOf86ib01yXhPjddrnCAI4hG4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BZkFncyJDOjsP4QyJB1OZ9TNAoQiVkANXAs0uUTzEdl4zGyCkQM6QiJu0/2y75Jza
	 i5ABaidmfVhQaso41CuDDAos79yJ+RJwhm9Gw/Sy5rK1Qwa34kmGr+cu6ojnf5nP6b
	 iBBCZOFkVntRfjkm+zMQ8iAzU+0w1T4cFJwx8CO8GBh0saCfGnTqCi6DzaeDBoNaK0
	 BzguYgyJGw1KBSPuHpTfPfFM0CWFJK52xCxGMNgdIWuHJ0BlAH2tKm6Vu0nI9N8G7A
	 hyLwgj4XC8v7u0ofEsykDCoJ6Tt6lETEPl1rHLBP3aYsvDr6WcCvuwz6ROBLa/WqIr
	 csAQ8Ib7/wwNw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:36:06 -0500
Subject: [PATCH v4 19/31] accel: ethosu: Reject unsupported commands and
 params
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
Message-Id: <20261029-ethosu-fixes-v4-19-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The command-stream validator does not model U85 branches, indexed DMA,
or OFM transposes. A branch can bypass the linear validation state,
indexed DMA accesses an unchecked index buffer, and a transpose changes
the feature-map address calculation.

Reject any unhandled operation commands or out of range registers, as
well as the reserved DMA stride mode and feature-map formats. Reject
command-stream IRQs because they can signal job completion before later
commands finish.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
 - Combine "accel: ethosu: Reject unsupported commands" and "accel:
   ethosu: Reject reserved command encodings"
 - Move NPU_CMD_CTRL_CMD1 to "accel: ethosu: Track command stream register setup"
 - Rework checks for unknown op cmds and reserved bits

v2:
 - no changes
---
 drivers/accel/ethosu/ethosu_device.h |  4 ++++
 drivers/accel/ethosu/ethosu_gem.c    | 33 ++++++++++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index 8405e69acb0c..86412c152f4e 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -88,6 +88,8 @@ struct gen_pool;
 #define PMU_EV_TYPE_CYCLES	0x11
 #define PMU_EV_TYPE_IDLE	0x20
 
+#define NPU_DMA_REGION_INDEX_MODE	BIT(11)
+
 #define NPU_CMD_CTRL_CMD1		BIT(14)
 
 enum ethosu_cmds {
@@ -98,6 +100,8 @@ enum ethosu_cmds {
 	NPU_OP_ELEMENTWISE = 0x6,
 	NPU_OP_RESIZE = 0x7,	// U85 only
 	NPU_OP_DMA_START = 0x10,
+	NPU_OP_DMA_WAIT = 0x11,
+	NPU_OP_KERNEL_WAIT = 0x12,
 	NPU_SET_IFM_PAD_TOP = 0x100,
 	NPU_SET_IFM_PAD_LEFT = 0x101,
 	NPU_SET_IFM_PAD_RIGHT = 0x102,
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index af8a0c45039b..74ef86848a2d 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -190,6 +190,16 @@ static bool cmd_state_reg_is_set(struct cmd_state *st, u16 cmd)
 	return reg < NPU_CMD0_REGS && test_bit(reg, st->cmd0);
 }
 
+static bool cmd_is_register(u16 cmd)
+{
+	u16 reg = cmd & ~NPU_CMD_CTRL_CMD1;
+
+	if (cmd & NPU_CMD_CTRL_CMD1)
+		return reg < NPU_CMD1_REGS;
+
+	return cmd >= 0x100 && cmd < NPU_CMD0_REGS;
+}
+
 static u64 cmd_to_addr(u32 *cmd)
 {
 	return (((u64)cmd[0] & 0xff0000) << 16) | cmd[1];
@@ -652,6 +662,9 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 		cmd_state_set_reg(&st, cmd);
 
 		switch (cmd) {
+		case NPU_OP_DMA_WAIT:
+		case NPU_OP_KERNEL_WAIT:
+			break;
 		case NPU_OP_STOP:
 			if (i != size / 4 - 1)
 				return -EINVAL;
@@ -745,6 +758,8 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 			st.ifm.depth = param;
 			break;
 		case NPU_SET_IFM_PRECISION:
+			if (((param >> 6) & 0x3) > 1)
+				return -EINVAL;
 			st.ifm.precision = param;
 			break;
 		case NPU_SET_IFM_BROADCAST:
@@ -788,6 +803,10 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
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
@@ -822,6 +841,8 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 			st.ifm2.broadcast = param;
 			break;
 		case NPU_SET_IFM2_PRECISION:
+			if (((param >> 6) & 0x3) > 1)
+				return -EINVAL;
 			st.ifm2.precision = param;
 			break;
 		case NPU_SET_IFM2_REGION:
@@ -896,18 +917,26 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
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
@@ -937,7 +966,9 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 			st.dma.src.len = st.dma.dst.len = addr;
 			break;
 		default:
-			break;
+			if (cmd_is_register(cmd))
+				break;
+			return -EINVAL;
 		}
 	}
 

-- 
2.53.0

