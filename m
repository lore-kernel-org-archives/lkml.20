Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794063285;
	b=sSEOvW4gm/pokNJAtfMLXsLsp5HnKCPgBbmjFqDDlwZ/HOM47GPUgSmyl4EEmlZU9YD7
	 PbGrhHuUMa3dOqhVKPjjTBr6uI/2MHjtUyeauAA6MU5XGFntEyZrf7NJvwBEEo+46XNX7
	 TTJRDNzrf6i2xyKiXLyxd0rwGdybsKMEMHA9q7zKvt/mLuLorNEpDalIabzIjY9aWgN56
	 +rd551TZl8ToRe+JyzFr6MKJiHCxkFZQHYITHzQOOjkqiBOENqc4s6sRBu5dFX/UYOPOI
	 TjVtIapdvauOP56Qv8Iv4AfvjQiJMkC9NLmmdtqFBtZ8lY69q7PqJCzmGH/OOAQBHSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063285;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=lKZkqYIjbjxgUWyU5OSTgWGODonNaqtq35Hba1H7riQ=;
	b=gpjXhyyXL8JzNxOsI7wR2QdroitRq8FL2GO48bBuqQ4YsQV7ahnVCxcYqBYPUhaEN8bT
	 dPjC4x5GK6EzYNIduiQpUhwuIKRySY7uMLYv/v+CIOmjYvoCtP3XiOzC7f73m387K0w93
	 JKxIXehgPDpN/iWlftyhc3FacRsje6W14Zx1zSMxVKLaJc8Us5hr1ShSobZILyDH4y4E7
	 uiPWmh4wsIfNYy0Gf4f8aJJ6cyDyj9r85DaQjb6TiHsJH9rsVT/eQsoO6f8YFCQl3CHG4
	 tvpd7e/JCy/R7hSsR5yhwNS9l08szd5nEmeiZSqZQ/ExAkq5I4SchdmqyH4h75SuJ8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJDTrNTL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B505606A326;
	Sat,  7 Nov 2026 14:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJDTrNTL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794063284;
	b=VON0VH3fmkwdbKly+uvyZEXVPgFYIR16KgaNqIlkUsJ6T/nTcbu9P/FZfyv+0CXZ7iru
	 nOiVmbPS1mKtHJGQ2XjxR8BhpBJsP8dVPQcJfIAWAIooy2iINN6xePISajdCkGWpfJNVJ
	 cXTLiN1E3cC+fW3CrJwgxcKWXVU9h9UU3hAiILW+9mBc/zwPNLq+InLbixb0fibd6LO3M
	 xI72/gnBsA0NCAy1jaX+uMkcl5lnczCLSoXFo3qZjoDXsv8hoo5nzQUFWBUx2jHQhJBGl
	 46sREqcaSRiqQCkiQ876pcncQSDLnnlWiCoipSwiZRhUBxpyvHxta2lfLb5M395W9cA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794063284;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=lKZkqYIjbjxgUWyU5OSTgWGODonNaqtq35Hba1H7riQ=;
	b=uKjvxR/83T+X+oRSrOpipnPFqvayigUWF+pvSpgraOiGHg6UuzNE0TAF6CqeEowH91SM
	 zZeUMP2n7yKLwnidtT1B29R6+PSjvF8deZQy+vyD07bPEHtsBujhQAsUFh8mwp/JwLblK
	 x1nLX5nWa/JNhEIzkGMgcbJ0emUrSf6OjURYiPTEy9RqDJZjc9LNdpIkK0cbVfaB6vGQi
	 FoqA516s2WaMHQ5FuPpVSnPTxsyRiSmJVaVGdTUWj0BuzXebhz1kfs3n1TeFTZK7z5cxz
	 ZYt7RnVu6F3MZFbkBYyyhLX7PR6PCXUyFB9HbqTW4B2uC8cN41SUU7vnn/UjCHPl5ew==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59BC91F008A1;
	Sat,  7 Nov 2026 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794063284;
	bh=lKZkqYIjbjxgUWyU5OSTgWGODonNaqtq35Hba1H7riQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=bJDTrNTLISGG7Kj8QnK5MsFnhmFl2kqsF/3aTkAvB+txVqx/oPfnIJPXSbsdvznun
	 UzwnnDq4JVK8Vb6TZ+jEvNCDNfIxUhy/25WrQHxR5MRSiLMBdJ926nAS9tMdw6T5n+
	 ouTUb5e4Dob5gH7q5URbcEeeooeWspeNNrqScU2055hcgmSydA9II7N5EqmXYvZuux
	 eP3XNTu5GDNrCGzRMkMATf0JSv1aWUapftzf7gpl/aNPnKMv8jbG6C8JgIDbNR9ajJ
	 m8XWtIJwTDrFW1MljeIDsoHRhRcaIngF5ucInQDnGd33LDL0d+MY2zwrYtDr9dfPML
	 in/YbrEhof1/A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DA13247C43;
	Sat,  7 Nov 2026 14:54:43 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v3 0/3] usb: mtu3: add mt6595 support
Date: Sat, 07 Nov 2026 16:54:41 +0200
Message-Id: <20261107-6595-mtu3-v3-0-f36bc569cb47@protonmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WOQQ6CMBBFr0K6tqadQgFX3sO4KDBKjVDSlkZDu
 LstxoTE5U/eezMLcWg1OnLKFmIxaKfNGIc4ZKTt1XhHqru4CTCQrOY5lUVd0MHPglbQCJZXmHN
 UJPKTxZt+ba3L9bvd3Dyw9SmQiF47b+x7OxZ44n7dctcNnDKqoFFlC4J1sjpP1ngzDko/j60ZS
 IoH2OkAex2iXnJgQgkZX5R/+rquH5EGntv4AAAA
X-Change-ID: 20260914-6595-mtu3-82b3048e41ea
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794063282; l=1956;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=2Sh8YO03rPQWohGdbHMukgtcPFDJ9M5hUrRVkx1RGnA=;
 b=Qk9pSav8KEL83b7n34Cn7Yb6sSrZhCOT0mD42L5dFoOLGDcDOn28R/KJBzqcf8MoOsQ2bkDNH
 VsGg++rTWMYAKcnwDCI4pdau81yyM3IO2evOYn3wEBvSu1ulsOfrfyr
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

This patch series adds mt6595 SoC support to the mtu3 driver.

Unlike the mt8173 and newer controllers, the 6595 uses older IP revision
that can handle only one FIFO slot. Without this series, the current
driver implementation results in 2 to 4 lost bytes on USB transfers.

In mediatek sources, mt6595 is sometimes called 6795. Most of their
clocks/pins are also compatible. It's not clear if 6795 has the same
issue or simply lacks T-PHY patch. Other (rare) mobile SoCs with mtu3,
like mt6757 or 6771, don't need this series.

Another thing worth mentioning, this series is not enough for the USB on
6595. The other T-PHY patch is required to get the link up. This issue
has been observed on some 65xx and most 67xx SoCs. Though this is a
subject for the separate discussion.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v3:
- Pick up tags, resend
- Link to v2: https://patch.msgid.link/20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com

Changes in v2:
- Reword patch 2 commit title
- single_slot -> fifo_single_slot naming
- Drop redundant platform data check
- Link to v1: https://patch.msgid.link/20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com

---
Roman Vivchar (3):
      dt-bindings: usb: mtu3: add mt6595
      usb: mtu3: add SoC platform data for FIFO quirk handling
      usb: mtu3: add mt6595 support

 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml |  1 +
 drivers/usb/mtu3/mtu3.h                                  |  9 +++++++++
 drivers/usb/mtu3/mtu3_core.c                             |  3 +++
 drivers/usb/mtu3/mtu3_gadget.c                           |  8 ++++++--
 drivers/usb/mtu3/mtu3_plat.c                             | 13 +++++++++++--
 5 files changed, 30 insertions(+), 4 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260914-6595-mtu3-82b3048e41ea

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>


