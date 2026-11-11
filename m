Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430901;
	b=XJ/7BOyFgK9BE120YXVq4fl49egP0bQG3ifz8vpXQQ4jBA63Wx1j6vGxjsXshr+xr3ip
	 d0TldBr2dsdLtyd1KSttK5drA52uP/K/Os8YTKhTPxthxrblZz1f/KzSAtQxOSvDDEXkN
	 AusTx/ERnWWOTqdzmEFGI4Na0Pw9eKDGuEfTsKYrE0wU4rFE+9+loy4EzShJHn+bopqAW
	 lpDDwFottdGbm59QG73m7ZNNX1DkQ8it8ghVYFRERtnBAFdc9EL9PdIM+9PuD88ONrDgb
	 W46c/If9zHpHq0OxXSEhlLUV9nssXp74cZwHleU0F9RjVfe8pHoxLxY6lLxigAL39FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430901;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=phA4+CyUoxbHyvL+wVGw21rFfYJHlyNvvy1aIyXcZcQ=;
	b=r86+uqe7tAt1NYnvDHSv6Vnwct22DUowUjy5bUd6FHszB1isdP6vKUKDM30thoSUataU
	 mKeeQPaPaqjiCxvovvgQrpEQHFGLTJjxSI8YT9CsZ/yK9uS8U5NaJ7rNz46dxTpKJrKHt
	 /SwArC8lRGSQUkPjGsEmZIZBRIZDa+LC0m0W/xNQaMGjmn11l5pOSOAlhpNVC6cyvgFgS
	 K3Blazm6biGXQBTN9c0wsD6iLHFQJq/W5TeQ2TYYPesaggaBRfHEey7k0pw9B+J0qMOit
	 2kVjZC+viv7yynw9mewr+h/Jwv0eC2t6W9FWvGWpUQCJ37xG08o/xd9HKCWdTGhDtLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timsurber.de;
	spf=pass smtp.mailfrom=timsurber.de;
	dkim=pass header.d=timsurber.de header.i=@timsurber.de header.a=rsa-sha256 header.s=MBO0001 header.b=Tn968xXV;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7680C606A882;
	Wed, 11 Nov 2026 21:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7680C606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timsurber.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timsurber.de header.i=@timsurber.de header.a=rsa-sha256 header.s=MBO0001 header.b=Tn968xXV
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jPwtS4K9FzMltJ;
	Wed, 11 Nov 2026 22:01:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1794430896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=phA4+CyUoxbHyvL+wVGw21rFfYJHlyNvvy1aIyXcZcQ=;
	b=Tn968xXVlYzLor7lhnO8lOrnrfj6E34WPUDS7qe52XfNv0TO7dyqCsbOhysif9yRlZ8yyp
	XmvTQiDN1ezNsZSJ1kEvkl5WoU5SefjwlG7Hc28xQm6QoI5g8VaXWPON1s0FdTMPO9YXwv
	rPl+prqWhfXG2gSrr60kWnSqTJ5hLdPaGBblqhvx9A5g1YHpN6GjnUrZh+cVn6LOKVM2uU
	rzXZ0YZU8UJP+bczfpjgCweDU0mRYCbBHZ7o/Zat+h1r4Zviw8J8HsySn4P/FPLZdeuxnt
	gnuh7O0XkM19zaKRT8zRIQbEb3KAZVVeCyeDRKz0VCWTG5dqZJAsxJ8vLTyXHg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of me@timsurber.de designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=me@timsurber.de
From: Tim Surber <me@timsurber.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Tim Surber <me@timsurber.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Valentin=20H=C4=83loiu?= <valentin.haloiu@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: rockchip: fix HDMI RX 5V detection pin on CM3588 NAS
Date: Wed, 11 Nov 2026 22:00:27 +0100
Message-ID: <20261111210059.3489502-2-me@timsurber.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111210059.3489502-1-me@timsurber.de>
References: <20261111210059.3489502-1-me@timsurber.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jPwtS4K9FzMltJ

The HDMI receiver node uses GPIO3_D4 both as the receiver's HPD output
(hdmim1_rx_hpdin) and as its 5V detection input (hpd-gpios and the
hdmirx_hpd pin group). Both pin groups are in the same pinctrl state and
the later one wins, so the pin ends up as a GPIO input with pull-up.
The controller can then never drive HPD: the source sees HPD asserted
all the time, and the 5V detection reads back the HPD line instead of
the source's 5V.

The driver relies on HPD being low while it writes the EDID, at probe
and on VIDIOC_S_EDID. With HPD stuck high, a source may read the EDID
while it is being written. A source that does so at boot keeps the
damaged copy, as it never sees the HPD pulse that should make it read
the EDID again. On a CM3588 NAS with HDMI0 looped back into HDMI RX
this happened on 3 of 10 boots: HDMI0 logged "EDID has corrupt header",
found no valid EDID and fell back to 1024x768. Changing the EDID with
VIDIOC_S_EDID was not noticed by the source at all.

FriendlyElec's vendor device tree for the CM3588 uses GPIO1_D5, active
low with pull-up, for the 5V detection. The NanoPC-T6 uses the same pin
upstream. Use that pin and leave GPIO3_D4 to the HPD function.

With this change the pin multiplexing shows GPIO3_D4 in the HPD
function, the source's HPD interrupt fires on every EDID update, and a
changed EDID reaches the source within 0.5 s. In 10 boots (5 power
cycles, 5 reboots) the EDID read by HDMI0 always matched the one
written by the receiver, and HDMI0 came up at its native mode every
time. The receiver still detects the source's 5V and locks to its
signal.

Using the pin in two groups also made pinctrl warn on every unbind of
the receiver ("not freeing pin 124 (gpio3-28) as part of deactivating
group hdmim1-rx-hpdin - it is already used for some other setting"),
and in earlier testing the following bind sometimes failed with
-EINVAL. With this change the warning is gone.

Fixes: f9f45293f0d8 ("arm64: dts: rockchip: Enable HDMI receiver on CM3588")
Signed-off-by: Tim Surber <me@timsurber.de>
---
 .../boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
index f4c34da61..b2df36113 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
@@ -376,7 +376,7 @@ &hdmi_receiver_cma {
 };
 
 &hdmi_receiver {
-	hpd-gpios = <&gpio3 RK_PD4 GPIO_ACTIVE_HIGH>;
+	hpd-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_hpd>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -571,7 +571,7 @@ hdmi1_tx_on_h: hdmi1-tx-on-h {
 
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
-			rockchip,pins = <3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
-- 
2.55.0

