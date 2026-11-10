Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794307146;
	b=46p3NwqcPqqsIWe+J1JyA1XIcK1QePXwoig92Tom3BxVpXLA3Z/ZGP0quGZ3rFp0x6sh
	 +fmGN7/K+txm2SO2FI0iAgdQgynLJdisNds34OA7ftr1PwlZoXkpZ1dKuIkj5+rkwRRMW
	 CpZAqzUfNhSPG/JHNqvYgbed0vCwGQ7sKPUgb0yTd130WeF2bjAWXU/VFE+Yax60+sQtv
	 vyLfpBFJqtp9ufGnpN9bqviqhdsmAss2l7E6CMypjgLorNpqG6hp88sgWuBo+vLcBlpBU
	 crJ+oA7Qvr3zEAK7FROTha3mxw/b0lNPBquevrdK/PyckKt2jdY+I8GuOWFxNaq9DFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307146;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=g5RQKUG5bh8bp1Y7KkAg3WudRjo1nNv/KFbkLN7VwaE=;
	b=WpvHzA0NmAyExzKQQzLOYgN7GVd+8nK2RoGLPp6/WSyJQiURBLPLCDtXXk2gSPAdwPzc
	 j8Kk4v0z7lz9NXfYR8H3+u2Mc0wowgGebGPZgCXyQK1Xr596tdcphh51/aUjrNoPxFbBg
	 UBVS4LZbufM+Mi/DYvqeKlhy/8jac8Zkl8f7ZDW5PKTNQBAk/1etmqMwmpR4PidHCaJwn
	 OoX9JgS+XCIkUtAUMCp2Xq4ZC0uPRdc+KgTd8Tlw+L5clfM5bpJVbny5I9Jhfe+WqoL0e
	 Klv2xrrTXnMHOlJRrgTunxMJ534t5EWNVZ0MgYTcM65BJx2M24fOOBUD7lW2zqWKe9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=edt3XDD9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32133606A326;
	Tue, 10 Nov 2026 10:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=edt3XDD9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794307145;
	b=GoIImfyIRoYg7sTzLx6OdruXOmsi5q1bwxY52A79qC7zq7OHrTSom86lC+T+JdmJ4Rh6
	 gAQRmbNRhZLaaoQ3sHARqvP31/LjBpzvLYp13SV/3tC+KMQPceHssjmuLJ55I1nHhVqHc
	 Yk2yqeaSZ2ctYe0YJ5nWO2ovkvZjOIi2TsBpFbhdkLEUahoqUi2oYFg7UXYBH6JZzLuZe
	 iJNMhO+SMLjdoqeljFYxLz+MNpeiNkfvqNUPeZfqB/IGX3BcGdMk2D/Y/1kECmkHz9tBe
	 YSVNp9hhpNtO/bRtQMArerPiCGp32e69SWFf6hKesmKtLe9Nqkt4fTk8pp69O0UD35w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794307145;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=g5RQKUG5bh8bp1Y7KkAg3WudRjo1nNv/KFbkLN7VwaE=;
	b=vDX8HmLCV8D+wMO7U1WzZKfuoVuYo1ARfbx8POfj5BFSoFzaX14Y3Yi6B0B4c+UmJfGp
	 izWyFwW5Y7AzKj4WCR4L7ROgIRgaYhgKvQd0NBSqGcd752RMxNO1YYEK9ZSeAxVh+oZnf
	 58iwH8j1W5Y8OmhQrzcuPXuhIUjrxZ3HOodo6n9i1+UIy3G/v9UQ92Jd7UXW0B+kAIfHZ
	 iNJcYfCD8Inz6h2JfA2UtfzX+26q4AMj9QMiY7+/8JUfYaJP1XFWQm+RlMO3O9WiPbOR3
	 Zkbdatz19yEy3bR8Guk1UM/GTcBBhJIVVgCrTeMO40Jb0qiZvNAWvZAMUYC2wB4U9Fg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D73591F008BC;
	Tue, 10 Nov 2026 10:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794307145;
	bh=g5RQKUG5bh8bp1Y7KkAg3WudRjo1nNv/KFbkLN7VwaE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=edt3XDD9mNaeibOSvdmf4xo+pLavm+3qXiIiXpqa+5Ihm/vdh83E07bml/KApz+Kh
	 LxsevU9KwRLea6mzmJrCU9Eq+Gvs5wka/I527E9/QECgvROZ27cPxODEZlqUQmWzSq
	 EBBWSEbhXE5mLDuAcLbxGK1Bc8egVwkHdKd/pAm0wZWa2OK4c6g7YorfnOEX0b8i0r
	 bnGdZeCeFyY8hDyF8J2G8/3yXmFK19a8HWsjzX3g4eDJUkgTYLGMfCjOH+G56tRmkY
	 KzTeYh/EDDRjjrKW0dUadgjuz8mmH/EEhSS+dpbUNN1Uldbt6GOJelaw3J6KNd3ayD
	 vLDmMb1kaIP/A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 64B6F48AFA;
	Tue, 10 Nov 2026 10:39:04 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:39:06 +0000
Subject: [PATCH 3/3] arm64: dts: rockchip: Mark the Orange Pi 5/5B Type-C
 port self-powered
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
Message-Id: <20261110-tcpm-attach-reboot-v1-3-7657cc1e2dca@gmail.com>
References: <20261110-tcpm-attach-reboot-v1-0-7657cc1e2dca@gmail.com>
In-Reply-To: <20261110-tcpm-attach-reboot-v1-0-7657cc1e2dca@gmail.com>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794307143; l=1209;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=z+vxGhU01KVE5a3ZqBJ+uJfWrWfvjtfbECzmzBJv814=;
 b=xRGXBDxcq1rtQtvPBSmY6c9nPZGec9E/oqmuDrREyarhSKPghY6jUNc9pw5Z7FO5MVhqW8bgx
 x3+AsXJbZyeCCMfqsaVtE742F0t4NQQBol9+ZKjFUGtI6E1xkkfMeMb
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The board is powered from its separate power-only USB-C input. The
FUSB302 port's VBUS comes from vcc5v0_sys through a load switch, so the
board never runs from this port's VBUS.

Without self-powered, tcpm keeps Rp on CC during PORT_RESET (error
recovery), because opening CC on a port-powered device would remove its
own supply. With self-powered, the port opens CC for tErrorRecovery
whenever it resets, including at boot. A partner left in a stale state
by a warm reboot then sees a real detach.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
index 6e081bc06cfe..b621fc8638c7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
@@ -117,6 +117,7 @@ usb_con: connector {
 				<PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
 			source-pdos =
 				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			self-powered;
 			try-power-role = "source";
 
 			ports {

-- 
2.55.0


