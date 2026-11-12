Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472249;
	b=M8OUuYwpQnziRoAGoETrIRC5NE34MOxwW24Jsf3xPPAI1Fyxa5udBNzPfIxtHNQoouO+
	 XLLnfNNXuUyQ1ibgKYJ+5Kx9WNiLhJcwl04OvY6nQsqfIyv5rGm0j3pF+ZTAUGPIMSqUH
	 yf3u7Nacw/AlgxngrMG5BBEzm0KbuhM8Csf31iWSqo1PQWGvKJEeCtlEmnmDYbgOF5Fu1
	 b3umW4vRGWcI2XE5GaO7Y68ZXC5bOPukZUFpl9J/94Uifo/FWhL1L9DhswCTPCECS/EAI
	 g1AMVo1nCS8/lZ0Z9327TieBphZZCMiuz1jpcGsJmQ72geGUgL9gzEbKKhQJyQCMeOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472249;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CRzHgqSJ6wnWT7aGMz6+06OqkwIsCJsoPRU6TVLW0Ic=;
	b=wIWGsx3iPW8SfkZHbftW+yz+63knmOBtS4cwTodI0MMit9MJ4yPvdoMZKfe4hyjO74dq
	 4I+V6QBZsxjjbIZ+AwgE00hSLPDqaUoxZvCi8S8uLn8mtfcTx/pRs3DVCfNLoNlIQYmVs
	 lCKS9fKAfz0Aor5xXku4SdCpD0JhBCd29hIBJsMawLntAvbD/WCMptrEztndJZ3KBDnwM
	 xKgvNiKK9jyjGZBUhR6ToTuUy6HW7mehuvMEkY2uQXjShrngveqbXkmVpqlmKuwT4fh0C
	 WWG1GjAkfvq5kmIfoeb05Koll5Ww5L6SB3dgWylt325HpxKwswEDUbNKNXzfpF6XfKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ozyO5n0n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93CB606A31C;
	Thu, 12 Nov 2026 08:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ozyO5n0n
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472249;
	b=cMQhTKFHZx7emVp2zxeMvXJwGeCUwdjW7fgO+y7ettZCwgHmc0opVImyYkkBjz+dB1Ut
	 Maq8ng77/ROgPdcF2sIl168RJOmCeVm9SQMVgwS0cZHusMt4NZymX0ofV31GCA9Mkmgs0
	 KTPaiLGnWNAknipCuGD/QWDXC8GFIfCrTnJ0PNTXPk7oJicFujDICY+LNrVbkLkYBJCO8
	 qpSr4AjYnO2NgoyogC0AA7T7K11SsdguqbIUuHAXiqD7KAWume7bbDnUDy09JCIcDr1GN
	 XWta6mENeGtGco9HlTMhFfc7ZzkFeuvUVXDrIZFvJuGdkQSLmnlTn8zaycVwdnKwcxg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472249;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CRzHgqSJ6wnWT7aGMz6+06OqkwIsCJsoPRU6TVLW0Ic=;
	b=Pfb50rmG3sKHOgVg9qkB5u7YlRImhf6Rh/z3OL6BuNCVNqfSJ3HYvAuguCI3cyREs97F
	 QirShG6mnWlirriu6YixVF/eubbq1N0W61EcjKuhZ96sNKrDlUS97tTpajgF/GWf5MsWB
	 Y4EGTC/5kNcQZp5Jiq7oUT3E/+xPRCJ1Ue+HHTtX/kYO63mgGpiBnZbMHYQ4aEZ3KsUAM
	 VRAM0yytMRmWvJJfNVB9TqHKViQ823uPpK3dBtMMUjs/T0GCdaK7mNhgUrpdij5Tcdzik
	 PIe3lfs7lKmDNIm18m5ZiAl3YXztq6KO6TopZJSJ88KxRVAHtY2ipcpIs+FTEpY8Bmw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 855EB1F00A07;
	Thu, 12 Nov 2026 08:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472249;
	bh=CRzHgqSJ6wnWT7aGMz6+06OqkwIsCJsoPRU6TVLW0Ic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ozyO5n0nGEOwxaiVaUvnBqn8QEJ8z43xOB9rjcNRiQN3HmPYVcgqNGWGOuUHsRmHy
	 NsAteX759gwljceZ+z/ittsKGIL3YFRRTxwTKllWnaLJKVOaAhUcTaxu12E4u2xrmq
	 984UTvIfE3EqRpQz3J+yMYVZ8V29Ne+r7iu5v4135o2hGzKYJZS322dpA7LYq5kiDV
	 uEYRNtzADdSrYOnPlXadwa6hw/OzxzqTlyJOjJKo+xX8Qpnp8ytXXHAxRjCRS1vso+
	 ZZO7YVu2g8Cae/E75fH9R1KypwD9fcldg1fkK+LCg53aVs08R5HohDaQzJMWStK3fA
	 t7GG56LDoU2Fg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ECC4E49378;
	Thu, 12 Nov 2026 08:30:47 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:30:47 +0000
Subject: [PATCH v2 1/6] dt-bindings: media: rockchip,rk3568-vepu: Add the
 reset lines
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
Message-Id: <20261112-hantro-robust-v2-1-18561fd48838@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472247; l=1139;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ugbiMmzavaBp42/wsrF8NeFbBYCV92Ge5prcqLnmtpY=;
 b=AqK100SNGkdVVsspnozjL+VIRw8W0Iu0XIueO/Y+6dVg1eQFb0Gt/pUZv4gLQ2vp3S5+j0IyO
 cdM4ItpfYoWDgyyEPLBdbkw5S6fiVQW2hYTpRKIw0R6PnvEPMCF5N9q
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The VEPU121 encoder cores of the RK3588 each have their own AXI and AHB
reset lines in the CRU (SRST_A_JPEG_ENCODERx and SRST_H_JPEG_ENCODERx).
They are needed to recover a core that is stuck on the bus, which its
registers can't stop.

Describe them as optional, so that existing device trees stay valid.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../devicetree/bindings/media/rockchip,rk3568-vepu.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
index d246f5d38427..e9fda4373f0f 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
@@ -32,6 +32,16 @@ properties:
       - const: aclk
       - const: hclk
 
+  resets:
+    items:
+      - description: AXI reset line
+      - description: AHB reset line
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+
   power-domains:
     maxItems: 1
 

-- 
2.55.0


