Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777986;
	b=0IW5M1e/+RIXYVaodYV6Q/2MJ1p8UzMJN4JB/s4s9is+Ev3CNJ/JWr4CUkLsP/EENr1W
	 oYYvB04t71ppi8eqjF4KuQ79qnjcXSaVDNTJxs/I0OVqmVPW15lsxJGxSns6oBXLZs9ak
	 cRIaGmnFxaMafW8t4KWeT8ez3ISKsEExAEs2j2nDy4LUPsc9wohlv8V3Uw2nhwqvkqDpX
	 bvvOfBN7gLBcqpllGL4nfuMMIac35vIq0vKnWWIZujoLxx+c3Z/egKfW1zFoJioc273JO
	 9ajCiaHsM3r+2/BYIymheacCg5NyDXZRkPrmNXKmp00mUflBWKDdXvMhvCcLKifwSRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YQS+tCL9sVo9f7fH8XlWP/aawkwSF9CY9qYv7xaHfik=;
	b=xzPLDiEVe0KADL4Kxy+nh9hxSJig3UvjGuemYG0GqGPXjvacmnsfbX18Lz3vJNaJDttS
	 6zlwVQUEO0c4g1ZGCKtFZtbYJiAHPEBFqY3UwqOI33yuu84l9dH7BnsvuK4DdKFoQ3OuP
	 lmUJ2BQqHyZzfMBr+TcGLv72Ah2FO0k/eUgIlRjOg6bDRUDiSYK7Q6tfZLlGgoqrWgIKg
	 udyf0/naSa+ZKHmRRgMNpI3RckM09D8r5k5r5aeGqGVvFrWfMrACs7LSqOmA+jnhzqKQ3
	 HLcpqaD9UpicCA/759FL+rkVCRQLWSFzZ/fAehoJwKOq0pm4vGiaHQ+x/2ItDWyiRJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C2Up8foU;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9BE606A331
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E9BE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C2Up8foU
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-487049569b6so688803f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792777985; x=1793382785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQS+tCL9sVo9f7fH8XlWP/aawkwSF9CY9qYv7xaHfik=;
        b=C2Up8foUIFI3L+OewOv3xFtrcYwpDGTVenQDRJSx1OhEgx2xC7KUtYzRqaqyPu0o79
         xvKiL2Em4ScCMnyESqmKuV+r3yyFmhcUY9D/E782tV+HhM78lubUWkOUeEqD1xunwT27
         rvfppYP4LbmWl0ptc3Uvi2Nw6bbsThSwMaPwqzgUhvMc+HkIPmCahDl9MTc3+cyNIN9I
         21nqOYFYHk/wgzDCqiUw/opev0aXcFjp8Fq+w9EAtT2LperNHiNREwlVQIKfT6YvqrkT
         yjlAuuqHwLr0YyukOGOQ5p9DpCyZWCkX2mRgQN8uYzxGekeI5c47JkFNgZtWUPTzmrHE
         rTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777985; x=1793382785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQS+tCL9sVo9f7fH8XlWP/aawkwSF9CY9qYv7xaHfik=;
        b=JtQLrWBJsGSHSqhU+ip/3VJqJUof7o2hsJ5zFP6sAyUjoi88DrOqaDy0tzJsvQQTra
         Af8IVOAwiIuUwXSx4ffRMHRcOAJXXK4G2B/bbMKRYmXYmRTJg56sHvDJmsaMJLhHz7WP
         gy1KLOHLE0j9zRieXxO0Pyiw8Ets0i1ZfbG4ESDh8vF2XZ3REcNEJvwwk6F2EPtJa17C
         TxYEXQdc385pSo8tJcagHxRgKF1DBWRBtANH8LWYaGqBxfhhnytxCqJtBqPvPs813NfI
         H9rmI0M5hHPqFRxYWpWL0M/qMG5597CClRn4puMNtzM2RwqWdGS/m/UBqZcyQ4v/TxJs
         MKsA==
X-Forwarded-Encrypted: i=1; AKwUvByCFGQay5d3XnnHzI/qYm6zjZDxMpaLluxF/G/EVCC4w0ihakuOwoZOmrIUmnhCJHOa0rsMGreEUnn7sHo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJH6eXkeNCdUqjx744N1YdFvZRGWRzaMAPWcKYmT85SIL/zFJJk
	3ickw2hhKoc7WggGAKEHJWunp7kir6LkVqDnbl3+2KqRk++VAPL2HtQe
X-Gm-Gg: AYBFou3Tjx25y0EC8yJzROYBZABCZSDPnsnXjZ54Ctim9LEhiyFl+7bg428lDqySy7c
	YYYa7bQo7BaQ4kzbYU/mDYtaoAMcezK+BE1YyXY8JdL8IYKC7DVLqBy6RTGdawXey+2qOh+Cxpm
	lyhJaU6ROK0RaoiEjX/LDVLR2rCMrWXjulQIrVIBDd+QIY4IlbBNZEzRmADRLEv6UR2jv0sWIZW
	FRPUwLSx0E90YSzjCfP68ab8NqG9rwyTKKKoBaiYz2w6ykQGxpIU2fKXUYdfGI3t67Vb+aWdBly
	aEiDp5Ep7bscvNtN9Ss3GyQYQSKm5z+Se4RcEab6/PprwYIGqKiTCblOgnuZdLVwO5W6tf+BDHn
	VqAqwgZMgGTGL06thZqkZ0q1qW+3gk1NVu2bJ9kIOzXqKJyE7JQCkVoVo8sb5g2EUUYRbxdKEVI
	Up61Glhg6N27up08XdjyVcjHkT9vre4vL6YktpttFZOM2fcF09UC/eprm9e7c3V97SxbOmhMg0M
	kNcISijJT/OmIk6vtx5y61DZy9FT81Bnqa78SjimcNKg6xdQSngpnGbWEpujj2jXyeH
X-Received: by 2002:a05:6000:184e:b0:48d:f855:d1e0 with SMTP id ffacd0b85a97d-48e385bf552mr4544912f8f.57.1792777984621;
        Fri, 23 Oct 2026 10:53:04 -0700 (PDT)
Received: from mikytux.basilicata.nnxx ([195.32.70.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d3ee6bdsm1135313f8f.15.2026.10.23.10.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:53:04 -0700 (PDT)
From: Michele Salerno <mikysal78@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michele Salerno <mikysal78@gmail.com>
Subject: [PATCH] ARM: dts: marvell: armada-385-linksys-rango: fix wifi card resets described as LEDs
Date: Fri, 23 Oct 2026 19:53:02 +0200
Message-ID: <20261023175302.2102555-1-mikysal78@gmail.com>
X-Mailer: git-send-email 2.47.3
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

On the WRT3200ACM, mpp45 (gpio1 13) and mpp46 (gpio1 14) are described as
the "wlan_2g" and "wlan_5g" LEDs, but they are the PERST# lines of the
2.4GHz and 5GHz 88W8964 cards: driving them low holds the card in reset.
With a LED trigger on them (e.g. netdev on the wifi interface, or
phyXradio) the card disappears from the bus, its config space reads
0xffffffff, and mwlwifi logs "adapter does not exist", "buffer is NULL for
tx done ring" and "can't get hw specs" until the next reboot.

Drop the two LEDs and describe the lines as the reset GPIOs of the PCIe
ports they belong to (pcie1: 5GHz card, pcie2: 2.4GHz card).

Link: https://github.com/openwrt/openwrt/issues/9517
Fixes: 41c865209626 ("ARM: dts: mvebu: add support for Linksys WRT3200ACM (Rango)")
Signed-off-by: Michele Salerno <mikysal78@gmail.com>
---
 .../dts/marvell/armada-385-linksys-rango.dts  | 31 +++++++++++++------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
index 4ab45f2..5209e06 100644
--- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
@@ -63,20 +63,33 @@
 		gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
 		label = "rango:white:sata";
 	};
+};
 
-	led-wlan_2g {
-		gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
-		label = "rango:white:wlan_2g";
-	};
+&gpio_leds_pins {
+	marvell,pins = "mpp21", "mpp56";
+};
 
-	led-wlan_5g {
-		gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
-		label = "rango:white:wlan_5g";
+&pinctrl {
+	pcie_reset_pins: pcie-reset-pins {
+		/* mpp45: 2.4GHz card reset, mpp46: 5GHz card reset */
+		marvell,pins = "mpp45", "mpp46";
+		marvell,function = "gpio";
 	};
 };
 
-&gpio_leds_pins {
-	marvell,pins = "mpp21", "mpp45", "mpp46", "mpp56";
+&pciec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_reset_pins>;
+};
+
+&pcie1 {
+	/* 5GHz card */
+	reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	/* 2.4GHz card */
+	reset-gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
 };
 
 &nand {
-- 
2.47.3

