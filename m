Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794733039;
	b=T+RrQdLzYIzVVJlKDobROLJRJ0czDIEPTkGUlRfqa5ZzGeCyiLSqeThaW4oMzGK7CRS3
	 j7WqzWnx4PLvOlz/Wc3u0PK6Wo1q2yXQoFX9brLC27tYBSxq0iHXbgDtOXt1D+xYhTr+U
	 jRh3sb3IVO24XAaWgtOzfLDcpU5Mhun5nt56ee0p4IUFHZuEY4jqus35u9xzKr6NkU0Pm
	 OA29FoN5TeZPQAEAx/XaH7YfwXlweR333iItpxam1VLkRJjLtQHgK1Jel6Mkx5LVJE0yf
	 YH58m0v3VXUGSVsNCN8KDSommTLNAuu72L3goausV7dxuYfFFOEKMJIToYb6pkry5nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733039;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=XWrFy/lAnAX+XL4iGSlVrxaUVV3JzJqI+9QLuR76Srw=;
	b=YCKjknALbUDztm9sD+aeCzb9XMyClsLsvGl8nRWwRAuHgBIZYBPepOmWusCOSg7qzOWg
	 RMYOn64hATEejF1XgnnkRvxWUGywDOk9Ndd6aLA7MpMtqyryU+GpbFfACkoNk8bfJW2UE
	 5I+wmrgacf72m6bWYdsUzPl2dVE7FLrnSMdXOJKLb/sdhvJNcQanDgEb+UbfFjl4lxw7i
	 l0UDkQaXlu28t6PEkoRkvoj9fbjAPjTcXawopHxxXrGXpiY3H3FOtR01Jk9jHvT/6IlYZ
	 k4QzGFzFKCBgFLUXbQ5l2u42JwuqMbI1B0BHthm2w1IhHTRrjrhqoYyVzNwJ2Mo4pQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KPTPL021;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA0E606A31F;
	Sun, 15 Nov 2026 08:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KPTPL021
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794733039;
	b=L0FjjWmoKuvCHC7K/uGKUJEuxTQy+VVoElQqqpTxx3fILQiVswtXldBHOWigEivEn7KP
	 +KcN5OK3ZoYZSE2w4OuNHXJCN8aPBATJalDudj+X+LPx0rK+f+IA8w7TpZrxZXArKJBZZ
	 t+0Fk3hMU2SX6Ep6knOI9u0j8s8BWhAzmoKGilqCQpqMgwWm1bORNnF4zqDYLiJyup7rW
	 BbMGwDn6/L+jKKCWHVTWtCTWPnbNDtJbG9N2PUFdAKFHwcgjpfLjXg1IUn+7ozK4ZEwav
	 70MOQn5y7Z3S/QVoKxDBl+z/JbY1riewaQg8Tk5R5WpNHvOk9Axzxeb4thQBDGlf5Aw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794733039;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=XWrFy/lAnAX+XL4iGSlVrxaUVV3JzJqI+9QLuR76Srw=;
	b=MLAhta8aGSKY6TiX802ckxhn9KcWUseFFtpi1w8Mjqhk8/6r39BHQCl1wnoVXroQsdA7
	 gFxL7h+SAG3xl6mhYEfKiHER40we9yuGmTSMAnIEqNwcZAD6z4jxbJ7Cz6VZ6lzvBz5h/
	 hJrZ8I2qkr5mr1DBRzcLbc+36fKBJ2eWC6P1CCE4Vo/tpRJ4OhJEMzdhWkx7C3o8h6mb5
	 asRJuXkdgdIPpS5K7CcLG8681HY3nt+hVHWjwrKEqJTZ2lWlfpwOX9p6BSKiEoavgn6Rn
	 afzxMW1R7ZPXUa+WZulEeUXsAx/kkGkl8PvvDEC0aHtRqf1Hz9eK+mk6jMxkI19e3lg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C14D01F000C4;
	Sun, 15 Nov 2026 08:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794733039;
	bh=XWrFy/lAnAX+XL4iGSlVrxaUVV3JzJqI+9QLuR76Srw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=KPTPL0215pOGrwdh+7YMt6nCf+DNkATIenj8ylXscdcwCzTCLMccGL+6uuvMX3VT5
	 +Nx6MJZ+FNw3F3XqPV2cB5k5KL6Y9D+/QaUlpW63uI2kPvkivMVjx2rXyp4DdMCbrQ
	 J3M4LF8t4F9S/tQFrvixgWPZHJOCLyqEkzLg+39ewq6DjKoosGDlrbgXu52M9UrWeq
	 Nwuvn6Xqw21aKoA/vU9O6mzM/KAZ1RQ28oHdA74MD6n4CVdnmEA93JCjXlu2JzyY8x
	 uXhoqFhFGIQaarlYLdtGJV1Igqr2jc2ZNtMMx05wWN6XYZLokXWufsvVMnPxiemfS6
	 Urtcs898IcfQQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1E8F54A015;
	Sun, 15 Nov 2026 08:57:18 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v4 0/2] usb: core: Pair ports of different host controllers
 through their connector
Date: Sun, 15 Nov 2026 08:57:17 +0000
Message-Id: <20261115-usb-port-pairing-v4-0-25d3c9adcc21@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auYrq1pp1CDK+9hXJR2imMUSAtEQ
 7i7BTfEEJd/8uabkUUMhJGddiMLOFCkpk6R7XfM3kxdISeXmoEALaUUvI8lb5vQ8dZQoLrixgu
 vtRemBGTprA3o6bWQl+u3Y1/e0XazMy9uFLsmvJefg5x3f/hBcsELJY4IhQN0cK6ehh4H2zzZz
 A+wBmADgARkuc+NNFB46X8BtQbUBqAS4LTV6MpMZdKugWmaPpmXcqlEAQAA
X-Change-ID: 20261110-usb-port-pairing-af0f66f0ab2e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mathias Nyman <mathias.nyman@intel.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 Rob Herring <robh@kernel.org>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794733037; l=3267;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=TNyqfCrClCiQ9PSmIf1hoQLCJm8Psl9gD1KGnA7LIco=;
 b=t/vzdDXfhNvY/T1LvtcHpWF8Sfx2XFWLlEhpAbqAtqwyI7jejNlJ+aTHmA4Z5IC7qBD0Gc3iG
 vkG5e/jIER1B9+zFGn+QLiz0sgFDqTTHvP7D2uIHeTBNj4SMrIcPSNk
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

On the RK3588, USB 3.0 host 2 is a SuperSpeed-only xHCI; the USB 2.0
lines of its connector go to a separate EHCI. The USB core pairs the
SuperSpeed port with a dead USB 2.0 port of the same xHCI. On the
Orange Pi 5 (VBUS always on) a USB 3 device present at boot connects
to the EHCI before the xHCI is up and stays at 480 Mb/s.

Patch 1 pairs the two ports through their usb-connector and marks them
hotplug. Patch 2 resets the USB 2.0 port of such a device when the
SuperSpeed root hub starts, so that it retries SuperSpeed.

The Orange Pi 5/5B DT goes to the Rockchip tree separately; its EHCI
"ports" node needs Chen-Yu Tsai's usb-hcd binding [1]. This series
does not depend on his M.2 series [2].

Tested on an Orange Pi 5 (7.3-based kernel): a USB 3 disk present at
boot came up at 5 Gb/s in 3/3 boots and after 8/8 xHCI rebinds; a
high-speed-only disk kept its drivers bound and its data. Not tested
with an external USB 3 hub.

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed every change.

[1] https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org/
[2] https://lore.kernel.org/all/20260916075745.3549953-1-wenst@chromium.org/

---
Changes in v4:
- Patch 1: say that dwc3-numbered graphs keep today's pairing (Sashiko)
- Patch 1: mark a connector-paired port hotplug (Sashiko)
- Patch 2: stop the peer reset work when the hub is quiescing (Sashiko)
- Patch 2: don't leave the EHCI port with its companion: reset once
- Patch 2: resume a runtime-suspended device before the reset
- Fewer, shorter comments; shorter cover
- Link to v3: https://patch.msgid.link/20261113-usb-port-pairing-v3-0-d6c6edb4341c@gmail.com

Changes in v3:
- Patch 1: find root hub ports in the graph by the raw controller port
  number (usb_hcd_find_raw_port_number()) on both sides (Chen-Yu Tsai)
- Patch 1: don't skip a connector peer whose connect_type is "not
  used"
- Shorter commit messages and comments; patch 2 code unchanged
- Link to v2: https://patch.msgid.link/20261112-usb-port-pairing-v2-0-45f5a1a29f1f@gmail.com

Changes in v2:
- Dropped v1 patch 1 (generic-ehci binding) for Chen-Yu Tsai's
  usb-hcd binding (Chen-Yu Tsai, Rob Herring)
- Patch 2: reset only when the SuperSpeed root hub starts, never a hub,
  only on USB 2.0 root hub ports of another controller; cancel in
  hub_quiesce(), runtime PM reference, freezable hub_wq (Sashiko)
- v1 patch 4 (DTS) split out (Krzysztof Kozlowski)
- Link to v1: https://patch.msgid.link/20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com

---
Arun Iyengar (2):
      usb: core: Pair ports of different hubs through their connector
      usb: hub: Retry SuperSpeed for a device stuck on its USB 2.0 peer

 drivers/usb/core/hub.c  | 132 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/hub.h  |   3 ++
 drivers/usb/core/of.c   |  87 +++++++++++++++++++++++++++++++
 drivers/usb/core/port.c |  62 +++++++++++++++++++++--
 include/linux/usb/of.h  |   8 +++
 5 files changed, 288 insertions(+), 4 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-usb-port-pairing-af0f66f0ab2e

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


