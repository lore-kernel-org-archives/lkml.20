Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295054;
	b=pDSmoGOEg4ZDVcs0TelrkUrdB1d59cwqBMDaVgrdl8xXKemKz/NJPZn5pnpGez5wCr4j
	 0Q6zACXfLFaz8s53a5jf3IlwJM7fBqYgVt82onAgdArwoM1f2cp4GyfVh/U5chlMB7r5i
	 tmY5sP8mrQxoRka4ZgCXRRmTnLFt8wJvyl1wqmZ0UFEZPjF2djvkyJq8kpD8FC0Zft132
	 E26l/IO6NVmM6ILXER0xkjCapUujBMJarCej1q4SkXgK8+qJxrYbFCm/k4byjxZdHZCCb
	 J19YcKzamJ+p5i6867sNTIXx6qjcMIxbRbE138VkxcXVnXlmKvSp6490MU7ddhFq/nQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295054;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hYdIK99YyoV+qpsVlozpdgDNLiqd/JPtUdtlAafVilU=;
	b=UojGGK6LY9ljFBVGBbwKkoEGJFQYmCFKRq53j5vZua5FUfA6+DRarsUz+m6SYjhzlj/G
	 Au0G1y0hHT8EDomy2MiyWzrraTgUQPToYXXwwXPSguNG+HTOdaLFZYlGBNoEhKFcSUJ8Q
	 ODUDH+F7dsIhPms4mkcDFM7Jb5JzmUIbAY7Q77y0Pcx12PWzMPQ/ubcvsVCKXWJbfkt3K
	 BXpCiOkeALAQebPTXxEtkHkcFKicDkIlQB+EUBD2Vvscj7oq9faD5hc4h4V2BFWdz2c50
	 dslRYCGLBIwV5HmbkXr32wszvi6VTQQoTukzzXFJeato9jg2dn+NwW15Pace04+dDMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TxyCCPPm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B3760A2615;
	Tue, 10 Nov 2026 07:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TxyCCPPm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295053;
	b=FdrSrfsmgZ1lRk3my5h2YckolsOmooNf8jNlgQxhWlcrLBB3lX1cgDZrknEii1ZIKmb1
	 98BBPsUG0Hrs8NYwvxQ0Vz5Lk9TnJ71dtaPGwiTpVtCjRhiVI2+Lk3aZ6I94rT/EyEdj/
	 9P+N5UDktcGjU39P68f7iFunbjXKBL7o+XFkWQilaHj26ZdCzNhsR897857CDskLnKQ9C
	 fOpP1K7Ng92pJANslkCEzNGE0XUcJedFcB3i+9hXPpjkROXAYJtZhb82SgxcSovjBbrxp
	 2GvEiCkPouDO/XUyhrJ4gQTiR71r3aRvJpkKMYlzuMtsoEZ4PPZHYV9u+IeX5ihDXZw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295053;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hYdIK99YyoV+qpsVlozpdgDNLiqd/JPtUdtlAafVilU=;
	b=KKgdiafbSJ78v1hxpPZ+VnMhCdXy4QUaa35DJea8Kn7T5qyUQU3yg+reTLlN6xw+nDff
	 HLjkc4crfoNcA3uXgQE3RHrYA0PDIuEFiWR6FQiOZv5JtRvkTpPBD3COM55nrbpsSohK+
	 OYEoFAUVdptgXtpBhsjkB7ywnvK0TM09YWPA/TKFJqhW8ZsjywBJ9VTguFKIIrERPj6Mx
	 gf0OF6hbp2nYINjpwZnhL/3n5AYsrx3TPdXLPQt+53hKoedohuP80F8HF/zWVQWZdslca
	 wPfxuPIrTZVGI+kE1WY9Eh2uX/bGoJ4lydzKIayuwhjF5gs7k4pnlHbLH+nJ4igSFOQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 113CB1F008A3;
	Tue, 10 Nov 2026 07:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295053;
	bh=hYdIK99YyoV+qpsVlozpdgDNLiqd/JPtUdtlAafVilU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TxyCCPPmDFp/n06Iz8W7h9w0t1+k/6eEeM2sWlfBJCuMEgzmynMB8mWnq6mG+jQxU
	 el032WDjfUCbbT1XIURMR3DqCsObIQ7eSaWgSWzZ8UQrHR93d/LPYOvTXbghJlLKk8
	 FmkxnkHpheSvJpjrpINFEndXczqkVHwQDpe0BdbW3hiVKtwyRga9CZOoeR0JX6HCH6
	 Jsg+CnRqW1LQ3/gCnIT4+tEwXByz/wFgBkcuxKsweyBw/VaV3xs6KYWsWXUZC5FVuU
	 O0GjRO3hmG1CqRIcSIKqEkNBhCEdKSNoPmdb+UADdO5AyM6U1LSQM1B6pYjVlu5qor
	 eAp7lw0vuaFcA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8E9E24897E;
	Tue, 10 Nov 2026 07:17:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:17:33 +0000
Subject: [PATCH 3/5] media: verisilicon: Reset the Rockchip encoder cores
 on timeout
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
Message-Id: <20261110-hantro-robust-v1-3-6b6269c05bfa@gmail.com>
References: <20261110-hantro-robust-v1-0-6b6269c05bfa@gmail.com>
In-Reply-To: <20261110-hantro-robust-v1-0-6b6269c05bfa@gmail.com>
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
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295050; l=3365;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Ii56p0k233FnBuEWff4kj2GpZgLraSVcrE/YwPM2NZ8=;
 b=gvRF3RYSL3I78/jmqutif7iFPrK/2wtDBeN8PTyTuznOd0brf54ppGYrxucEH87bv1WSi/g9j
 8ndax84LyTiAf7w39CtfRb99VJN0uYyVUTR4wlPoqOoY08r2UspBpnn
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
index 02673be9878e..0dced7515833 100644
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
 }
 
 static void rockchip_vpu2_dec_reset(struct hantro_ctx *ctx)
@@ -493,6 +522,7 @@ static void rockchip_vpu2_enc_reset(struct hantro_ctx *ctx)
 	vepu_write(vpu, VEPU_REG_INTERRUPT_DIS_BIT, VEPU_REG_INTERRUPT);
 	vepu_write(vpu, 0, VEPU_REG_ENCODE_START);
 	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
+	rockchip_vpu_enc_hw_reset(vpu);
 }
 
 /*

-- 
2.55.0


