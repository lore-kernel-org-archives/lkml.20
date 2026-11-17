Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920416;
	b=S9F+UQWTzGdUe72lp+WYF6NzHAryRy02elV3QzpnPqtG+yVYQd4ctJPWOHClGMWXp+CZ
	 XcNFqRsO61ALfzBCeQ85pQ5iVFQBKjERQwH6TBw00DG1QdRbJdwxbmWWrkKDgQZMxotsE
	 UXHXZS3eve3jzhUPkbaBfAxs9DcuaIUf4lL3cfWwZQ08GK3EqZU21/8ZPnlvcick1c0NX
	 qQ1yd0U83toQ//LFC2/yVkRMWkh4DD177FnC49f7QisdDXmsLrIrhuyM3OhzPJB/n1YNo
	 xqYzu71keXYz2Oz4b1Pt0Zj31Q5ozRA53LIHjdiwclL6XSt1/YMF9Rubn7ZSBXH1T4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920416;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=K/YZFKZXcpaNnpqNllDmkoheY5uZsTxU1ZYFN9+w0A4=;
	b=nLi8gIZrlV0SlJB0JAcawHG+VP2UnIy1i4m1o8vOjaz6ontt1YfP6ZISpWxP+RvVul+L
	 dys3Ur5E5UxNghtVnalIoB/cNL6Ohz3+VxGR7Q1vKrdusM7BBiKMjM09d++P6c6XqonB/
	 6KVPpn6fLt1a24g3cPl9kKldEaOEPK86vFohCZp3SXT9/1CZB2UiZEz0596yjixSOHPQr
	 yy/yUxPCBk7u0WIdHpACvABM+zt1219IUkHhjUHZO6qABWm3w8DBOkDIpq3kiuuzrC0Nd
	 LZgk0pjq2o3llcvS0TBiS1gTLUfPjJjiBsHCzKeUIUtEpNiM+LrMfkKlOLb1WOYEpaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EgkixKOl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A8E606A88F;
	Tue, 17 Nov 2026 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EgkixKOl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794920416;
	b=DcvRBZ7DXgK5+XtlhnulbuT3UxaSQEfJPbV2cuwzH1D0ziuW0CIHmTa/rR/A46Wf7HFP
	 Oeeal3Ulxp7isG9smhKm8uGdfOqZo8Daz07RD9hkCiU+kCLjS+SFja4asLn7kBjsTyaJx
	 9koo2VGkD8N0/QXz+3lVh6kiYaiwvbmSmjDZGf7GuPiUGkUWxZ0NNUR2Nrf80JMObSXAc
	 95UBY35QbZHozPSfQ0rHOW2lkfd5p4kr7uK2UOxf01+DOQ6N6DSihQrwxrqnBVq3V00aV
	 4BZICSrj/8l8OVjEFaXixDmdiwmrwFEkPWirJOBU+UtaFmW3sfUiCoG7DqADHcm9dTA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794920416;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=K/YZFKZXcpaNnpqNllDmkoheY5uZsTxU1ZYFN9+w0A4=;
	b=QvkvH7dqcFX4dOoz8j34W+WkXkYZ8sCVpdnYeuqBYJYqEOo7dNlbaZegCA8e9rIXaGIL
	 5uE2+59MjUkSDf02Wtk/X7RPM42u3/CFZVSvJ+EXp/jJeyjzP7XrXjtdTEpVSej6Tef78
	 dI0ZQbtM4b5JJ6YAdBmFB9cFGtzBJyjWZyL/T3HYzRR44pUVH6lmnqb0cupM8H+ki2DXg
	 DTg5N87rG1d/Kr0/DmQJSa7iB6zW/bdAkvBy5QpDuQrlOm946Kmz3skKaibHChJLMrcxv
	 BGGcaA6b8qNtDBYZkjyqrk3ehPDyGcH3D7RJPEi3yNWtOJy4s9CFCUpEyMpEXVvEJHQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0324C1F000C5;
	Tue, 17 Nov 2026 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920416;
	bh=K/YZFKZXcpaNnpqNllDmkoheY5uZsTxU1ZYFN9+w0A4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EgkixKOlx1TgvABDjypyAlbT/1XAI3QGQ1De02ltfxoFvF1TaeJ1dE/smM8y50seE
	 oqRgitU+CRLsiW3modmp1Jpku8UcIVwOnvkNI5GZHevVsOTSEj3ML+0DGUuP2N28hZ
	 Qg6CxDvKyDgeT+0qaFKkrg+aQZw9sI48jGNHhPOpE/MAC2BS6xjwyMZFH/KSScpCJs
	 26n0RPwevo4kQuiU3wlI3RNXjjaO3QXfHo1wqllTQhLdHbqvdoJIrNJjp7PdtBy7xP
	 0NBCu3yy+lLAkEFMW0J+Y6PU8bJk2BZf6rXbDgnj9ME+Td+2LiBjRnttwWtVputGeB
	 Mvn2eAhuQncIw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7EA224A955;
	Tue, 17 Nov 2026 13:00:15 +0000 (UTC)
From: Roadbobek via B4 Relay <devnull+admin.roadbobek.com@kernel.org>
Date: Tue, 17 Nov 2026 13:00:42 +0000
Subject: [PATCH 1/2] usb: musb: sunxi: Assert reset before deasserting on
 init
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
Message-Id: <20261117-usb-sunxi-reset-fix-v1-1-c2b76e0e84e1@roadbobek.com>
References: <20261117-usb-sunxi-reset-fix-v1-0-c2b76e0e84e1@roadbobek.com>
In-Reply-To: <20261117-usb-sunxi-reset-fix-v1-0-c2b76e0e84e1@roadbobek.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Roadbobek <admin@roadbobek.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794920443; l=1415;
 i=admin@roadbobek.com; s=20261117; h=from:subject:message-id;
 bh=Bzs+Bok/1pte1PfClsczqYfF32Y1BbstMmHy95Q44ZE=;
 b=GOV2+10kg10zXZLyEVlNPyFWyN0C0AkEP8WNKSt6LllGHLiceFrMahB5XGAYKIGjzf9fDi7Hb
 wKyzVEx/4L3ADlOwuALD5iDSg9VA/RdFlZP7/1m9wFIqj+LdxSDSac6
X-Developer-Key: i=admin@roadbobek.com; a=ed25519;
 pk=TcWSTwITMylwCZLYbw80sv2LQx1zButqiT90TFVvhas=
X-Endpoint-Received: by B4 Relay for admin@roadbobek.com/20261117 with
 auth_id=1548
X-Original-From: Roadbobek <admin@roadbobek.com>
Reply-To: admin@roadbobek.com
Content-Transfer-Encoding: 7bit

From: Roadbobek <admin@roadbobek.com>

When a bootloader such as U-Boot (for example with
CONFIG_USB_MUSB_HOST=y) initializes MUSB and boots Linux
without stopping USB first, the controller reset line is
already deasserted at probe time.

In that case reset_control_deassert() in sunxi_musb_init()
is a no-op and stale MUSB register state persists across boot.
On Allwinner A33, MUSB stays wedged in a_wait_bcon with
DevCtl=0x99, Power=0xf0, and a frozen Frame counter even
across hot-unplug and replug.

Assert glue->rst briefly before deasserting it when
SUNXI_MUSB_FL_HAS_RESET is set so MUSB starts cleanly.
Tested on an Allwinner A33 Q8 tablet (Laser MID-786).

Signed-off-by: Roadbobek <admin@roadbobek.com>
---
 drivers/usb/musb/sunxi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index a17b1c150626..3d16049e53b5 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/extcon.h>
 #include <linux/io.h>
@@ -239,6 +240,8 @@ static int sunxi_musb_init(struct musb *musb)
 		goto error_sram_release;
 
 	if (test_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags)) {
+		reset_control_assert(glue->rst);
+		usleep_range(10, 20);
 		ret = reset_control_deassert(glue->rst);
 		if (ret)
 			goto error_clk_disable;

-- 
2.53.0


