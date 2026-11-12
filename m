Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472252;
	b=eeTuihP6xSm8QC1Nq5w2M1nqSKy9RlhYAuD9MWH5MpHnjRY8U69JL/Eof24eTbk/2s1I
	 LO66eR7cAH640jWDjDvh65/zIURGIK6FYZWnMbM+pxmT9B0kYmnqsFgv9nQY/WzOZ6PZs
	 lWb0fGF3rEE8kMvR3dXmqd/PG4XMABTNtoctYpiMzwZJah4+11daGOdI+Xr7gl8YSA4h3
	 bSnBFlIyJbo8pnJbF7pRMu9Vbqb6U5GpfUsJ9kiS9pja0T/hwGvMubQNEs8mpBfFX+UBx
	 Af6SEml45uN79dVw7eYsA09js0wMFUYrP/iQNpBGAcsQLdUOhg+bgD3FKIX0PPWGJAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472252;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/0/KMUceZYkpX3iI5TTZHsnLt8eSuwicqZLxVh4MxS4=;
	b=TMlhVcQYK+ujugp1RF0Wbui8stBsr+dYipIGappcz7TnysoIBCZpuIKm+1qpWtypNFNc
	 b4qv2QN6QvKLQmP8rCslepHYzx4WXfNRZBEf100bbnJVM9Q4OquOo+Q7NQ5jbDsEURUH3
	 riQ19Q2ENkmDrPMYDA/+LHB9Bq5JwdC7F4pSJaBwUeXz64RgfvErRUnphxVpR0aj5/1lm
	 dFH3B8z45e2FAlwcMuxG3Ind09IgiAh++WJfMp4xhXQziaJaRje5QZXfJ7XDpGZ4rvmAl
	 HQ/mobTb9fd/MZ6RImYOQZ2dfWfiN4CIyFG0ajDLBbUHvzDCxzdpbLrRTkDk+I6S6Tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOQw7D6L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607DF606A8BB;
	Thu, 12 Nov 2026 08:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOQw7D6L
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472252;
	b=sh1ldbMQ7c2XWkkZ8nNVcnfQSbJ7nKAKmjx6j8yvIUTt6EfTIE9yaUo8+3VC/6bWrKcT
	 vZJ9R3ZsWXObY6r/o0szw+Nvx5nJ7wS4Ng1FFGIxF96Gwaip+/DnbHW8HsPlNNyUJbiyD
	 Y9C1B/YzuzzFBkBT6E75AeWuWFcWKfbokavUJfGZfxa0T+FVQnG9460SYEgrC3zwL2q/K
	 5I1g6/+M9q8F4YPk2YytCUhCTMut+pBSFn2nK+ghS3c7FG/WxHuCESGfX9SOrtoRHdmAd
	 G1CxyCIuluYGn6tPLlut3F5JL8oWh1/Bhj+VaBpHFrAbSVIRyPwrhHZREQj+td8grlw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472252;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/0/KMUceZYkpX3iI5TTZHsnLt8eSuwicqZLxVh4MxS4=;
	b=PHABhSqGpvnVTGpF2tN4G7WQrX/uI4jGZzJ5F4xERyJ2L3zETR9Z+WLI3ZCTH+U5ALbR
	 8oBnA5jSb/cvvYON3lUxHi9XiccQUPSm4ufYnKg9PxlXoYU4Zdh4DxH/Ru3fl+9HEG6+b
	 n0UGj26HuFto2nekhEdDNv1KA2RuHc366HoT7YIuEZCrO+nMbWkq7bLyrNriZbhd/etLF
	 KAnYEI4iEJEx6uE+Oaz7xQmvUv8kTP+L2KL7VBaxyZ/hu0ZyiUD8kUydr5x072/zDguim
	 LXD9Xs8KdAZg8r9BzFh2z82e4qoy+VJ35sLDcUEMRg/qtm43DI1qoS+FVqd/5cwmkTQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACD5C1F00A0A;
	Thu, 12 Nov 2026 08:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472252;
	bh=/0/KMUceZYkpX3iI5TTZHsnLt8eSuwicqZLxVh4MxS4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NOQw7D6LgmVQJIROcuj5se+45+BEG1g8d0du3oyNT0DTTYvAnciEdTUx0JqL5dF41
	 /C9HhjihaodxidivlEELhbqVfiio1jNBq/mdDOXiDMi1hwxeEuFagqSpPiV+rwXw87
	 jHy/4AOjJWy76EiuzU1sBP1GofdCDHgvZACGphZ8yohqyeU90BCcTSM0n2RZdHc6nH
	 H6wOEYnwlADcrWAeefpRg3Zlqt6xPLJ6JX9W1HeBEMg4sXFQWM92bH9wua/5Bul2EQ
	 tNTHETTsJslFL2k4sy1vmanMuRVXqtc4129Bki877H/T2J/BjeXREJqKrIYiOSeLut
	 w+nEfaCNgWNsg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3571D49385;
	Thu, 12 Nov 2026 08:30:48 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:30:50 +0000
Subject: [PATCH v2 4/6] media: verisilicon: Reset the Rockchip encoder
 cores on timeout
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
Message-Id: <20261112-hantro-robust-v2-4-18561fd48838@gmail.com>
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
In-Reply-To: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>, 
 Tharit Tangkijwanichakul <tharitt97@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472247; l=3574;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=sjPXc3bh+wQfDnjkY+OSXFCX37DqawhQ7n2w7c2kMeI=;
 b=X9JO4sS2hnPO5AlElG30bo+AuIkk+YdlWqzzR6TgWIaYh3W4kX3RfhK1An5Hn7XdWa+zhO63t
 DNeTs8qlFkoDgel6eN+fQZkrni2wMDv5a+axTloX71BHl9cCItMiz//
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

On a job timeout, the Rockchip VEPU1 and VEPU2 reset operations mask the
interrupt and clear the encode enable and AXI control registers. That
only stops a core that is still responsive. On RK3588, when a VEPU121
core reads an IOVA that isn't mapped, the IOMMU reports a page fault and
the core never becomes idle again: its AXI transactions stay
outstanding, the IOMMU can't be stalled anymore ("Enable stall request
timed out", then "Disable paging request timed out" on runtime
suspend), every later job times out as well, and unbinding the driver
can lock up the system.

The driver already gets the optional reset lines of the device and
deasserts them at probe. Pulse them in the encoder reset operations,
after stopping the core through its registers, to return it to a clean
idle state. The clocks are still enabled at that point, as the job that
timed out holds them. This is a no-op on device trees that don't
describe the resets, which is the case for all of them so far.

The Rockchip BSP MPP driver resets these cores the same way, through
their AXI and AHB reset lines.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../media/platform/verisilicon/rockchip_vpu_hw.c   | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 5d4e46bd9cd6..114010d6a5c9 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 
 #include "hantro.h"
 #include "hantro_jpeg.h"
@@ -468,6 +469,33 @@ static void rk3066_vpu_dec_reset(struct hantro_ctx *ctx)
 	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
 }
 
+/*
+ * Stopping the encoder through its registers isn't enough when it is stuck
+ * on the bus, for instance after a translation fault in its IOMMU: it keeps
+ * AXI transactions outstanding and never becomes idle, which also prevents
+ * the IOMMU from stalling. Pulse the reset lines of the core, if the device
+ * tree describes them, to return it to its idle state.
+ */
+static void rockchip_vpu_enc_hw_reset(struct hantro_dev *vpu)
+{
+	int ret;
+
+	if (!vpu->resets)
+		return;
+
+	ret = reset_control_assert(vpu->resets);
+	if (ret) {
+		dev_warn(vpu->dev, "Failed to assert resets: %d\n", ret);
+		return;
+	}
+
+	udelay(5);
+
+	ret = reset_control_deassert(vpu->resets);
+	if (ret)
+		dev_err(vpu->dev, "Failed to deassert resets: %d\n", ret);
+}
+
 static void rockchip_vpu1_enc_reset(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
@@ -475,6 +503,7 @@ static void rockchip_vpu1_enc_reset(struct hantro_ctx *ctx)
 	vepu_write(vpu, H1_REG_INTERRUPT_DIS_BIT, H1_REG_INTERRUPT);
 	vepu_write(vpu, 0, H1_REG_ENC_CTRL);
 	vepu_write(vpu, 0, H1_REG_AXI_CTRL);
+	rockchip_vpu_enc_hw_reset(vpu);
 	/*
 	 * The encoder runs don't write the interrupt register, only the
 	 * interrupt handler clears it after each frame. Clear it here too,
@@ -499,6 +528,7 @@ static void rockchip_vpu2_enc_reset(struct hantro_ctx *ctx)
 	vepu_write(vpu, VEPU_REG_INTERRUPT_DIS_BIT, VEPU_REG_INTERRUPT);
 	vepu_write(vpu, 0, VEPU_REG_ENCODE_START);
 	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
+	rockchip_vpu_enc_hw_reset(vpu);
 	/*
 	 * The encoder runs don't write the interrupt register, only the
 	 * interrupt handler clears it after each frame. Clear it here too,

-- 
2.55.0


