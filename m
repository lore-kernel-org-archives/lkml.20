Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268971;
	b=bs+X0WhQijqBQ6MQdu5xEHN3VT3x/bSegRfFe1oAvafMOt0O9+vbFvuA6PEXYTij0+/D
	 g4y/ygTHuOg4u1SE+whnN4Q9jV+nuQ084wG0+3rao8l+qbWCtHFtH4eonfluyAAviRPSx
	 022Un84NhWDhpQxKB79DXPK1dRO2Nl9vFcH/l/tSNX4GdkzUVfENuzWGVNi1TO2rQPJ4+
	 CiKsY+9+vZIkXm07pJhCCJkRp/LL2CFvZJx8ez4zZ/PXqFUC1f2CArzfLRZ2PJtETtMM7
	 8WEl+7pHWPZKyk6wHPkx8inQrkbpGJLCaWzPQl8I3YbGPPGYLKaA93Fgxir5zKqQscA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268971;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=FEXJR2cFvMoPYSyvAdd0ZT9BkGkfe5w1c1yh6i8rz+o=;
	b=3ZCEzxEo+areTb427cisCwH4YuyGWEWpncDmoZA7oyywpyxrH1m/aFdORdKL03t7VtAr
	 gR7sCm7yr+HpbV+YO5k6c6x+rjLCYHVMVNrLQGvqPywLnDMa/nmKiD02EX7wrthyRm+w7
	 e0EvvteBz7+yXLg2qpc4nzhgviY6a/mgJIVVxNDjoQxiQv4wyvOoMYdijJdTuXvF0Y1fz
	 ZAMGG1eMFSAYrhiyz6/dlX5BBxrJKus3WeiB1Ed/ezYOem7SzZgJFDxQAz1yI3G3tGWn2
	 //mhePpwF9ngGNMtAAwo4uoda73szenppGzOjrtafEx885YKMPcX2PxWo1QCxSFieUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WuC4kPho;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDFC606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DDFC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WuC4kPho
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794268968;
	bh=K8NTwOd2VMhqShdXjAXjDbndtPFnEs+PaHrTnRAXxNo=;
	h=From:Subject:Date:To:Cc:From;
	b=WuC4kPhobmZ2j/o0+Oj5sS5KbwLns0xJi0oyxbhPmIAGXjtGxFZft63JwP9yfF6Uy
	 QC+NlY5VOz23ukiIsLfYMWi9GlShZhvcQYxGwz4NTMQJaMlc1YX5LmYGQSTN6zgBiv
	 M+xLEQWLW8PTue/dhB25DZB4DOs+pQ+5StsWx8KEiT2qEhw9HzNLuhW/gQjRibhIJA
	 PVVmbCOe80o47/2oRMc6g8SI2ws+72MqRYxL7l0DlXxQ6h/MNIJt3EFMaZSjwctR8C
	 YmrVQ8O6Yzzs5lb18b+Wd8V7/LH/rrG8942uxYOopmJQSHmchoI22pG7IV7JXlwbQV
	 l4lbFmFtX94uQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 66E9417E07E5;
	Tue, 10 Nov 2026 01:02:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 210D148002C; Tue, 10 Nov 2026 01:02:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v4 0/5] phy: rockchip: inno-usb2: ensure PHY is running
 when clock is requested
Date: Tue, 10 Nov 2026 01:02:45 +0100
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-0-51acc071634f@collabora.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOwW7CMAwG4FdBOc/ISZuScNp7TBwa16VhpakSq
 ECo707KpE2aOMDxt+zv900kjp6T2K5uIvLkkw9DDuXHSlBXD3sG3+QsFKoKLRoYuyvEQN/U+RH
 8MAQ4J6eA+jyD1l+Am6bSTm9aY0qRmTFyHj8qvnY/OZ3dgem0uMtG59MpxOvjh0kue2/UTRIkt
 JtGWyqkyyefFPq+diHWawpHsVRO6heViPIFVAECo3StRltoy8/Q4g+VqF9Ai4w6hRUaQuNs+R+
 d5/kOlObW5JABAAA=
X-Change-ID: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 William Wu <william.wu@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3652;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=K8NTwOd2VMhqShdXjAXjDbndtPFnEs+PaHrTnRAXxNo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGryXydV8ts/JAA6l2huXHuKDiEh/q8l+hYQ9
 kpF7WMQxjdW04kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq8l8nAAoJENju1/PI
 O/qarsUQAKVaPYfSwtKgIMe22dnuXp9/584PSYhTE4IMswI8LQlFxI6sREkq7n9DDNd0jkqCLFl
 KkTiCbuDOULfuuemQrlw2G3dKdkeMds0Mgf9Z0rhVTXK38sQ/LgRW39y+wdja3+vXhfFWJkNCqb
 Neljhx+ybAfDiygkvKdpfGWLT36GkVIoV3ScB/JAybUCSFJN+azzw/ZD6Amcu90HWwGQgw4oPaW
 rIMKoIHZkenLONJUOfzP9+cuzVwBP8Vjjtai8zF9XPNpUHbVcHWQriy8xSLmWRDRGCoNZMuKISY
 iAR5rTPOaCUm0e4haFZHrknDpK2RCAzli8pxfkek9l/8cJTTe4FTmdo68aA7RexUVDzDyLo82Kv
 yPpLPmInBaaPF989+EcrJl53tpr9aD+HfrNhtgpCt8JSXRsRXdmrIoUMYM2OBKx0OymfWQ1y/3B
 NnAz0BP/bNmxS30sOTfAeSzTnh8Uxv41gvSXDflhuKC1uirI3fUSFKOWLlwRiegiD7XRO9oJUsn
 WvR/b7pf293VmbWPi9t3gxChuMvemcUlcvGKFmDsScO+YgNYSemdMu9GHGyfsq9NdfZ29HKMiTc
 AQPketku9jEoslesY0pNBmAJr3XX4JSdJXp3OZk5oqiUWPVZGytDiIvFOeTh0S38xsuEc6Q1SWh
 lRex9Rxx6twST4KHqB+owcA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

This was noticed on RK3588 EVB1 when resuming from system suspend. This
is technically a fix, but its unclear when the bug was introduced and
system suspend is broken on RK3588 for quite a while and not just due
to this problem. So I think this fix can be merged the normal way via
linux-next.

Changes in v4:
- Link to v3: https://patch.msgid.link/20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com
- Drop patch avoiding rport->suspended in rockchip_usb2phy_sm_work; it
  was meant as a simple cleanup and Sashiko suggested it is more tricky
- Add new patch removing error handling for regmap_write and
  regmap_write_bits
- Add new patch removing error handling for reset controller
  assert/deassert
- Simplify final two patches due to the dropped error handling
- In the final patch move the 480M clock registration after the
  port_cfg population to properly fix the race condition instead
  of relying on -EAGAIN and the NULL check
- In the final patch create a new helper function deciding between
  handling the PHY suspend in the clock (un)prepare functions; we
  keep the NULL check for port_cfg as this properly handles the
  case of the port sub-node being disabled in DT. From functional
  point of view this setup doesn't make sense (no need to enable
  the PHY if all ports are disabled), but one extra NULL check is
  cheap, so it's better to handle this gracefully.

Changes in v3:
- Link to v2: https://patch.msgid.link/20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com
- Fix do_suspend negation resulting in SError on RK3576 (Sashiko, CI testing)
- Ensure PHY ports array is initialized in clock enable path (Sashiko)
- Cleanup properly in clock enable error path (Sashiko)

Changes in v2:
- Link to v1: https://patch.msgid.link/20260908-phy-rockchip-inno-usb2-clock-fix-v1-1-f7d59c31b908@collabora.com
- Move suspend exit code from rockchip_usb2phy_power_on into a
  separate patch and reuse it in the clock prepare function;
  move is done in a separate patch
- Updated commit messages with proper rationale
- Added one more patch dropping useless assignment
  of rport->suspended directly after calling
  rockchip_usb2phy_power_on/off
- Add one more patch unifying and simplifying the debug
  messages for phy init/power_on/power_off/exit

---
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: William Wu <william.wu@rock-chips.com>
Cc: linux-phy@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Igor Paunovic <royalnet026@gmail.com>
Cc: kernel@collabora.com
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

---
Sebastian Reichel (5):
      phy: rockchip: inno-usb2: simplify and unify PHY op debug messages
      phy: rockchip: inno-usb2: ignore regmap_write return codes
      phy: rockchip: inno-usb2: ignore reset_control return codes
      phy: rockchip: inno-usb2: move suspend handling into new function
      phy: rockchip: inno-usb2: move suspend handling into clock prepare/unprepare for RK3588/RK3576

 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 257 ++++++++++----------------
 1 file changed, 96 insertions(+), 161 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>

