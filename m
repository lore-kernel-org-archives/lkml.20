Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649221;
	b=whBQKUOiiGUl3EkAucnZDnO1TbUVLSeH0u7Fc+MfZ52QrQz9ZI6MGANkM9XnX5LCsXnK
	 XVphLJWRqC+p5PIfdwyA7qbZQ50xIShHjq84wtr/TJKU2xs/d3c4AFV6hVZqFTgwg4K6/
	 Wdp/XHY9txH1hxK9g7ZdFsqYfbUlNH+q95Ofpba4s8gS/NP3fiKx3FfWi8nelQx3wnNUz
	 befNDZqfh7BzTVWUN4yvTeYCh52wr3wv/cA/Rf5ePb7V4WD51nKZVUOyqIhqbUU85XZcS
	 hIaXcbCK9KIaojGf8Qc/gL9KR5zV/jUzwoGJlEm1rbC40devkqVKOcH7Z0cZ2BVKoKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0fpz/uw2nhdb0euDYGKBTP+bqdC3yE0PUdZgdE1EJC8=;
	b=DDRk1x820Eoj705qlK1AT7Jw9YqQn/fTNRNliR4CoHjmx8sI0H12bdLJkEV4Q2/yisUv
	 Iir8JvkpsSYGOnwmlWoS4BGQLgaZnMkUGBrvklbh8n4d8oKT8QmDPFzlpm0nfEpjJGRex
	 3Tyt9TaxKR/c/dGDwsKzurldIrIyhp1xKIj6PTGR9ltgOFjN1wGeH0nxaf6u3oZzI/FgQ
	 sLHpkEwx7omrGvfyniPWYi/O8RH4Eup9HEAqgQOQR54FdPVK9aR5pVQz/YWMg+pcR7B9i
	 PTmqUeDE0IOSazRvvcQxagpNv6tteXC7Lh0kmuTHuvpD/m0503RdC/vRVejoubhplog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rVr9EIXe;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E936082BD5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84E936082BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rVr9EIXe
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so22208975e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649220; x=1794254020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fpz/uw2nhdb0euDYGKBTP+bqdC3yE0PUdZgdE1EJC8=;
        b=rVr9EIXegK7MvTJ3LW+g+Z/AsJ6mM66GF3AgBUJtVngRLoA4OihLKNRtkB22JnZKFS
         rEz3HZK8Li+Xp1xKgmH2ZjHAwbSaHjqwV/acRWJqunhpadxp7NcRJpOBnxQaGF58WHlt
         RSdU+VGM4JoNgxBbvF59mh4pOQpfPtawON/q6pOPl+HSMHbLXvhReMdB83Yb1LoQzUe7
         3aCWyW7H4e6EroWAJNW/g6SU20rBQM4OkpLkzj6TiEHZTROw1qq/lVznf1fUHj+p77WB
         7onJOlO4ktfhXTOgXVSTPKcJanpE2EmAk7gQZDpY7nImvJJlKotzrYjb0c55/N8EiuGQ
         0FTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649220; x=1794254020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fpz/uw2nhdb0euDYGKBTP+bqdC3yE0PUdZgdE1EJC8=;
        b=qIiKXvQGDcTxie1rWOJ5pT8BlI0zACxVJEC6xI7VE7HPPJznn9T8Y3vhsyDSCnkecM
         cfQ5OVkLuKqA9rcxVVqRj5PxDgqJh97AaVZpbCs+fQD5apfdZIG+Gj2eWre+cYc5vgXY
         K516VdIaguyecgqu/yJVMRgYYbUpEeFRDodWdHKF9/Vv/PKh5rjY1oVkKDeimvo6xpM7
         KosbPO3TZQ/M/WkOxKKfZ3EETkmYjNhOst+eAWgDHg0lPVx7jIq5hCIN1W2xguLJzjce
         0sUwS81uDgxuuUlBtlovE5AlFFtrbjc4LX649f5BGmbr0Tw6oLP83VGdDABFGy+zeCbk
         GeGg==
X-Forwarded-Encrypted: i=1; AKwUvBwLsQelLXPvqB7ZNp7anGrOhH1eyzGSVjD6nq9RInDyZayl2eXRdPPMk5Cc7oQ430LfvP+9qbPi69akaUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdZOCFl7RnxacpKL/ZBDU3b9aqiMpnT9A7RgjBGEPEOIo+R9ni
	xnoALb1egmFWTsZds5OCi3OXOGnNib3wiBZkC6wjttr2bGVZVjNmRtYABQAUeKLDa1w=
X-Gm-Gg: AYBFou1dxLaH/FpwWgY/Yc9NUky+pPgEe+khmR/66RYDe+8QxXy//SeFlkghtUK7y8x
	M4Hc+nkvX/wC99/5x127sisKKtj9P9pVQbGgD9q4PoscEscG9LbOygab2llHWqU3Op9xaMcD6HB
	7rZCRZTCiQj/J93Sgc0h2GKLHIsz54EfS0XW6hJ07xBfXMBjOrePniMErvYmuxbB6nF7Jqj3NCH
	dul5lv5gKLcswzfsnGIS47S/E/iHMFEnVzjR7bttse5SrWxpLtxoZ5xTGFbdloubIIP3THUAnMt
	Qko3j7siquNzWbpDjkeO1kEJrgBePaPj+JgDp4pypIEbLrNTaAt1VMX0giI1sEv68HlIB+kOtA7
	B0sDyju1eo6kunTDQcLboE5O9II8pWySFUQFfsrRHgiEMXspVHaZBfUoahCLkFJuTp3Tm4Ddn/6
	szS2i4v6UN9rGhgQXOkRj6LtcMw07qtJKDzsoYUJsUVF2eMl64lX2mZTqLqjAR2A/AIleS572L4
	4tWB14au11/aiQFPOSoBioNbqrVhTmnCqrN/8nNcAzHqoehorEbtr2wp51bdp5VljMTj/h1MsD6
	ZWqlXBMr5Q7KrTNr3wEPYZ7ZrmVBmwmAXwjD1ELTNmPjy10ALOudsQPiRkmV5hn68ulPMwOD62p
	yVyIamNSJCASIzSjcgfZHPJ2KYQ==
X-Received: by 2002:a05:600c:19c8:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4ac1913ef8fmr260265065e9.27.1793649219912;
        Mon, 02 Nov 2026 11:53:39 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:39 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:55 +0100
Subject: [PATCH v3 9/9] ARM: dts: omap: dm8168-evm: enable MUSB multipoint
 support
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
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-9-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1481;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=GPDgtWDoINKJrraqXEHk7avh0mT0fUwCN99SIrQYwCE=;
 b=rdyCT6dPdNGjEGb0mGj7AcMz0ZkRYEhJcmpAPs44qs2/zbWAbI3Wlil1MRcniIsO6bUaDt8X4
 vYzMD3bLdtQBzai49938vlHle0a73q/YWslU6vw3k9vpk6Jx12fmEy9
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Christopher Obbard <christopher.obbard@linaro.org>

The DM8168 USB controllers are used in host mode and must advertise
multipoint support to the MUSB core. Without this the kernel disables
external hub support and warns:

    musb-hdrc: kernel must disable external hubs, please fix the
	configuration

On the affected board this also prevents devices from enumerating
reliably, with descriptor reads failing with -EPROTO:

    usb 1-1: device descriptor read/all, error -71

Set mentor,multipoint to the default value of 1 for both MUSB instances.
With this enabled, USB devices enumerate successfully on the host ports.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index a6d42766a496..4b4e4d850231 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -198,17 +198,14 @@ &mmc1 {
 	wp-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
 };
 
-/* At least dm8168-evm rev c won't support multipoint, later may */
 &usb0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb0_pins>;
-	mentor,multipoint = <0>;
 };
 
 &usb1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb1_pins>;
-	mentor,multipoint = <0>;
 };
 
 &sata {

-- 
2.56.0

