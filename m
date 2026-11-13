Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587975;
	b=H4ea7ytxtLDN15ubmfXJ3gv8U9uD/QY72+XjqDhlecy8Af2tBrsF2MThRmzTfUFcmSmi
	 mRV8rrI/bKU5qX3dfiO2BguIOVTWAQz2zbp0RcxXdfrB/LyAN0+OnpgVaJQtm/abxQGG/
	 GVJ+tM2FGcn20pwLa1nkZEQ0C0nqTv4frRzQY+6fyhNfcMxjUP1PkN+pfNtdPlTTGWkN4
	 W1a/mW+9ZLvBsLB7KKajBFzZZnqEd4hOvc2uq+dxcFfvieYUkOl19A4O8Ttjc/nrZG5ev
	 768oyxSLYar1XDCuwTkwapbOCS5sX3UwPWULFirqg2pzb5wZHa9qDfEFGgeQLa3eDJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587975;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=L+8j5OUsBR0easBe4yHHmV7NvUfkY0wWsAfLUlp+Yi0=;
	b=yg6Tlu09iofg4Yb3VOp3TESxJfWHCUiJihTiFJnOSiDh2e0/pD4j0u/D++zsha0bfkJL
	 28NhdjSiU438+u7UqGWnbxpNqlUjFS8uLejGsDoFE1wN6WVV7N1obD1qmHBKmoH5sRGjz
	 I9KKYG4713xeiAizBx4e1z+FGtTGl1oLJBiRHf2JnwHz2VJOjyv7VbzsJnB2Zi99Ui7zF
	 K+rlzcC3V5KITM2Wjn5TAnklIJG8n0vm83KV3tgqMeDUJIbsZJXfGFAR8bkM3fGbiSONJ
	 Se4JMIsuNRw/Q78XdXKLP/U0ghgNdGRzqVCmy1xy+2j43XaXWEL5nKN9v01NLvR/RLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QQfLAZ2u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F236A60A2628;
	Fri, 13 Nov 2026 16:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QQfLAZ2u
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794587974;
	b=LuW5+z01YOe5yzfBQo5jW57/Kp0sfr+uZVvzfhwUbcD/i5Og1J5eQvlwm+fKZ6b/oaad
	 0MOlKWxRzrWvF4zzZO+k4uzazSuXpj+/cONP3kQVx1GBKbH+nE/WormEu8EWXXJoKYYYK
	 Lc++16/aQzivk3DA3OJ1ue8Pr+Z5ZXey52Lxe2wm7jJQZ1sPkON93hOBrEiwLx8Do6ocH
	 DtxFjLdN/8q68kxXqSoW5zjUpdafNjJSzeuW45tM/FJpLFNiUv6KBtHn6MY95OZcHBnC+
	 Da1chVpKVFgswnvkQmVEtn52QsJk/EP/iFE+rkKSNaBb2bHm6SYlVNUhhh9CHm7496w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794587974;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=L+8j5OUsBR0easBe4yHHmV7NvUfkY0wWsAfLUlp+Yi0=;
	b=tyoPTddvnO+WgjXwOX5dvvJh6v9YE7lYfBR1BLjNV6Ewx/lYKuyoQ1kz5m4P8xa1+0DA
	 aPN8wIFNYwTz+HFIGEDqPJEovBYCX2mlg5QuHu9plJf7ZXLRSTyikyEILd8JvnfE+AC8u
	 xlBC1tXJ1JPRtXRTVbTxA9dhvTWr2dCO6NFJbGwmE9ZGzFhPGWkYpYWyn2tCjzECRQZak
	 tlpNuRpLojsocjs+aOTsnOmu2eJTeHOmdDtoFs8sti+O3o09mnK8y2WGTKvbzhl0VB82a
	 kK9bnDn59OE+aPHEbHbHLmM3/vNi9N0ciY++kq6HaF0PujoqKc2uObK3Qv+PUixaEOA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3BF681F000C9;
	Fri, 13 Nov 2026 16:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587974;
	bh=L+8j5OUsBR0easBe4yHHmV7NvUfkY0wWsAfLUlp+Yi0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=QQfLAZ2u2lqa1W7gimpv02MRC4ZuZpWavtu5KopDbCasFJWtS8jGQYOFTReRGY6lk
	 zZX7X48aHXLQD6CC5pNt5R94jl7hP3G3djPXZ9EohEPY2tmxZoYrPowq6a+wKMzgqF
	 k2QAlLvpl6Z098t0dEgcwWaTP0YP0dJlAhdYVo9K6uTJXLnOcB/IBg/lz0pb9vV8pB
	 O9dFkixN5C06IJ/y7NqakILNFlbFh6+n3Xv+OqtrR2o52ZhZZm9YRxHBtemncdm98I
	 LJOwkY25jh0X1e7gCYIkv+s95rfHlSXe7WcVzCIyq70iMXCKZlBkSrKLtWCPUaXXpV
	 AuPJrVEgANknA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C0C1749996;
	Fri, 13 Nov 2026 16:39:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] usb: core: Pair ports of different host controllers
 through their connector
Date: Fri, 13 Nov 2026 16:39:33 +0000
Message-Id: <20261113-usb-port-pairing-v3-0-d6c6edb4341c@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auQrq1pB8HgynsYFwWmMEZo00KjI
 dzdFjcsjMs/efPNwjw6Qs8u2cIcBvJkxhj5IWNNr8YOObWxGQgopZSCz77m1riJW0WOxo4rLXR
 ZaqFqQBbPrENNr4283b/t5/qBzZSctOjJT8a9t59Bpt0fPkgueJWLM0LVArZw7QZFz2NjBpb4A
 HsAfgAQgVOhCyUVVFrqPbCu6wd/qm1JAwEAAA==
X-Change-ID: 20261110-usb-port-pairing-af0f66f0ab2e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mathias Nyman <mathias.nyman@intel.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794587973; l=3327;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=94ljvUhZfOwcriwlLh+HVppbDrBWPBP8YRlEjtdMTao=;
 b=yRzdjuLIBZz2A126kliJbvh1YvnIeRw1y5fu8QBIot7q1f80EXqrlI3kteaqoUIwqlR6DpKnj
 YWHvVDy0DBoDPdejeeLbJ/9Vsn/H8xiduWQgZ39crdMjL0XcLOWBwq1
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

Chen-Yu Tsai pointed out that root hub graph ports use the raw xHCI
port number, as in DT and ACPI; v3 does that.

On the RK3588, USB 3.0 host 2 is a SuperSpeed-only xHCI and the USB 2.0
lines of its connector go to a separate EHCI. The USB core pairs the
SuperSpeed port with the dead USB 2.0 port of the same xHCI. On the
Orange Pi 5, whose USB 3 Type-A port has VBUS always on, a USB 3 device
present at boot connects at 480 Mb/s to the EHCI before the xHCI is up
and stays there.

Patch 1 pairs the two ports through a usb-connector whose halves lead
to different hubs or host controllers. Patch 2 resets such a device
once when the SuperSpeed root hub starts, so that it retries
SuperSpeed. A device that ignores the reset (SanDisk Ultra Fit) stays
at high speed.

The Orange Pi 5/5B DT goes to the Rockchip tree separately; its EHCI
"ports" node needs Chen-Yu's usb-hcd binding [1].
usb_of_get_connect_type() still looks up root hub ports by root hub
port number; Chen-Yu has fixes for those lookups. His M.2 series [2]
finds a hub port's graph port with fwnode_graph_get_port_by_id(); this
series does not depend on it.

Tested on an Orange Pi 5 (RK3588S) with a v7.3 based kernel: a USB 3
device present at boot came up at 5 Gb/s on host 2 in 4/4 boots and
stayed there across 8 s2idle cycles, xHCI rebinds and unbind races.
Type-C port pairing is unchanged. Not tested with an external USB 3 hub.

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed every change.

[1] https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org/
[2] https://lore.kernel.org/all/20260916075745.3549953-1-wenst@chromium.org/

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
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

 drivers/usb/core/hub.c  | 109 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/hub.h  |   3 ++
 drivers/usb/core/of.c   |  98 +++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/port.c |  67 +++++++++++++++++++++++++++--
 include/linux/usb/of.h  |   8 ++++
 5 files changed, 281 insertions(+), 4 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-usb-port-pairing-af0f66f0ab2e

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


