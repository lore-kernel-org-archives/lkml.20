Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203449;
	b=yeLvAehEZ7JG0lWlQgVWsq7BIz14z8651mRhDlxSVHuBb7+C52duIiTvO75Jr8WDM7d8
	 lS5NxecINUJucE8SoxInlvuz+jpQ50sTal4QSeBY78BYmdk43uwXPg1ILLuJNHtZi4GVE
	 NGxHhWqUwPXjkbELlbhGKh7yk265BD9u7xq/gEdLKu8hyaNY+ZWrnAdDvCmMXPWKY+EfN
	 UZ/tSAhIWNhei1hUhmqtCR/MUWSu03zhCvUYE/UVPmqn5P5/xdni9sRQS8P6kIf3ve7Ef
	 kLQ7bNbTLcmKWhNaxVWiU6JVDjmUzNq1CpKKV95HFPOxvCumBsGswz4g7hPy7MMBJjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wW+/Xd8Krv/fKYtWcQLYyD+KltWSe3OXoRZLQJCTD0I=;
	b=FMSnbyLYTA3W+WKtMxg3dPbirVuf8ptvsQg0GlA9Dr4hlBO3CndRSGd9JFxpv5ehE7nR
	 dIlz/3ru9GCC93otUGH3QVFWP1TMvv/HVKSybwAQFuyeEO3czKZYIg7qnbCvh8Ae+EoiE
	 Ux5rUt5iRKxEiM9h8Dj/UtVFx7PYh5GLcE3o+YM92cZvQq5wIbc9GXEHrPCr0tvHaW+mA
	 V70BcYHFvQLetmUZiMYp+k4uonJZHl/xbnIfkQ3gjgzx589XaLiPla/jkd0EUSkulWD4L
	 NpROweGpjXz+uLnRePDD5e9Zj/z2CMVfGTywUlC3NPkK2xlQwrtJ2UvUdVztZZwq+1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h7w/6mjk";
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3386606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3386606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7w/6mjk
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so2150212e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793203448; x=1793808248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wW+/Xd8Krv/fKYtWcQLYyD+KltWSe3OXoRZLQJCTD0I=;
        b=h7w/6mjk6+6kpdKforROPrJX+UDA63yf6nVts44aIrSXJJDyONSXYHDrGBuI1KOZ3h
         0GakPDtGQJ9AX5Yms9cJyOljn/cP6nLUH/BmSGtMjmj9Hnu7FJ6nSdn6V59f5/OuWqYs
         TGq/8hmQ0Hoqoo+pLKrhtcng01yYB+b7azWGX4l7IoRFQFewVB6GQBDGGOarGsrR1qQb
         DlcV7TFre0T6I6/A0qDwyCVc89uhVesfZjRVenTMQfNAufO6WUEdgQWnfborHpREF/SL
         znFx4+xOEhqvA5Qmz9AuntimIS0MGiMsgWK5uZJWFUNTWwMfS81dSK+TBz8jLyrfPwa3
         obMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203448; x=1793808248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wW+/Xd8Krv/fKYtWcQLYyD+KltWSe3OXoRZLQJCTD0I=;
        b=WIBAsfp2nZQH4Hs64ictg8sunAcSpp7od/Gk7HGVBbvstq0Fu8TYF91IB74zT0hEAK
         UoBoOJeBA50iFz5ikMm9wQXb7NIMj7fbQCy2rikpnE/W4Czdwhe3nGWXmOzCW0zOscrU
         +i9s6aaihYEXRUUgLI9e4etOwP0asG6/4HYBYKpuAWKIfL3GZ8Xa3Awb38FqLgAL0MIx
         gnH8QGaqUMhfMn8YdsXxkJUcTPwNE4A+8dwfsPXrNkqhyK10fEqfung8uJI77Mk+5fP5
         LQ1py0o1LDlV2xHe+EvrzjBG6Kw5LUN91eCXpfCrPmTMv8twgHVm8Rdx5xzCOz8TdEmw
         tCMw==
X-Forwarded-Encrypted: i=1; AKwUvBxcF5oB/v184EFPmUM1d2roX13WnXxb0280MBvdoQGLCpULgOzuur1rjOju1pp+k4xwRCF10khbVgPZmQk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhOibEUmBJfNhON52/wrW1HkJqMOzBPyWhv8Y03vQxW3OyA9lq
	FkMFpkaF+vMqwrz2/Id5zGUx4BHKTETbWs4lE+duh88X/EJ6FKQRbSMu
X-Gm-Gg: AYBFou3oRUzDXWyoRJ4iwhW4Ws1YRcEaczUROHhL+dbM6SsqlHTzJq6caI4y0r/rhyP
	qJJQcHJXQ/XDJo59M3fVO/RYOqZpR+xxwN+zhHFcyQXCeY+1oNrPPr5C3dzhuvbfabJDFk1wSLr
	DAX3XKbK0XcMBMPGRojwgveG3ubgnnfcJFR2wHixIjIWYt5gqr1uE/9cRDq2HAdie3MzfUoHJ+9
	fC30BWPezYiBdgTkiV85bbNCdDpAbO283ugXITB8QWIJRbpJZpUq8cOiRHvDnrXd6ZuKK4IgqGZ
	xuc5F8THnra/ib6G3WubLEZniwn/nYCXY8qherlhSFxqBmskRmGmuHfrwR2XCH0KxZUQKd2Zq9S
	yGS5wnwO64eTiKva+6jKwCeTyvhfgdgRGKsL+gPaMXKZvJVigs4KSRhxWZ44Nyf7fSu+uNn0uU5
	wVZQ9rP0ibEtMjpHjJuat60ck214aH2sZzX7SHUhxOhuy2UFYZjEiG/Gk+ambWo0+LRoM3urpRS
	z1LTDsj2zHunxO7Bjk70UEBHqNt6GWrDgjqG2LaYtwSv685g+9pGZLxDZfSqbx1dHzVngsv3b2e
	2tQsB7DTAB42y88XsoWK1dSO9EKj23333XlziwDOMkzcB2sn+bFxMjRL3RwSGwBgKSVRdF82LAS
	cEQ==
X-Received: by 2002:ac5:cd4f:0:b0:5cd:4fdc:4c30 with SMTP id 71dfb90a1353d-5ec3ea67966mr1617819e0c.8.1793203447486;
        Wed, 28 Oct 2026 09:04:07 -0700 (PDT)
Received: from localhost.localdomain ([190.177.146.128])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-991259db2d3sm6354565241.6.2026.10.28.09.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:04:06 -0700 (PDT)
From: Cristian Papa <pcristian292@gmail.com>
To: cjd@cjdns.fr
Cc: netdev@vger.kernel.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	linux@armlinux.org.uk,
	arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	naseefkm@gmail.com,
	b.larsson@gmx.com
Subject: Re: [PATCH v3 0/7] net: dsa: mt7530: support EcoNet EN751221
Date: Wed, 28 Oct 2026 13:03:53 -0300
Message-ID: <20261028160353.4239-1-pcristian292@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028011317.1557238-1-cjd@cjdns.fr>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
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

Hi Caleb,

I tested v3 on a TP-Link Archer XR500v v1 (EN7526G: on-die switch plus the
MCM gigabit switch).

Setup: OpenWrt with kernel 6.18.44. I took the four mt7530 files from
econet_eth at 3a8bcd2e6398 (they contain every line added by 1/7, 3/7,
4/7, 5/7 and 7/7 of v3) and booted from RAM over TFTP, nothing written to
flash.

With the DT from en751221g.dtsi in openwrt#25330 (MCM "econet,en751221",
no "mediatek,mcm", dsa,member <0 1> on the on-die switch and <0 0> on the
MCM):

- 18/18 boots: all 10 TRGMII lanes found a window, no "calibration
  failed", "TRGMII inter-switch link initialized", DSA tree set up, ping
  over lan4.
- The chosen taps were stable across boots (+/-1): SoC->MCM 15-22,
  MCM->SoC 27-29. In the SoC->MCM direction the window always starts at
  tap 0.
- 6 of those boots ran iperf3 for 6 s each way through lan4: 0 RX CRC
  errors on on-die port 5 (~1.05M frames) and on MCM port 6 (~1.29M
  frames). In 4 of 10 boots MCM port 6 already had 1 CRC error before any
  traffic, probably from the calibration; it did not grow.

Following the binding in 6/7, the MCM does not come up on this board:

- "econet,en751221-gswitch": mt7530-mdio.c in 7/7 still matches
  "econet,en751221", so nothing probes the MCM and there are no LAN
  ports.
- "mediatek,mcm", which the binding requires for -gswitch: the probe
  fails with "Couldn't get our reset line", since nothing provides an
  "mcm" reset yet (the TODO in en751221g.dtsi).

So I think 7/7 should match the new compatible, and the binding should not
require "mediatek,mcm" while there is no "mcm" reset for the EN751221.

Not covered yet: cold boots, and the other LAN ports beyond link-up on
lan3/lan4. I'm happy to give a Tested-by once the compatible strings line
up, and to rerun anything you'd like; the full boot logs are available.

Thanks,
Cristian
