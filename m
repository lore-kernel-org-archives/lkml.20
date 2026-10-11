Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419F128B517
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791680555; cv=none; b=UWxlwCMtK7posO6VAyyKG18ps23nQFd0akh3ndYnGWCXi/xEvNPZLYVU+h0rYdLyDpzo7VAEH3DE4o76cvTwEulRyPt4J/tZ8WpxaEpkvTj/pnj9ElfM3poU1sG2XBF777/GzDkvCyQ6q1b6VwZKiWlzGjjaqJZvt0b1XAOd0fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791680555; c=relaxed/simple;
	bh=ULD97qusdFlornonTOyy3OhQaL5JaHBfPuOaK9jqyd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKp4cf8/k/JAVdMQ2dVHX1HOd0OR/wUZoz9bDyLPy0ZxMROUe6I6fV5hPMs7cJE68qmaPB1UK1kI7yoQvGHce1+83gmK0X4OZZcfphQFYF44ZUcophhi3Eb5nUaGlEHPdt6ffDh+d0zbLM80mD8DfR1WCAxU/FTOwERF0hufDPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhz/WgWX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhz/WgWX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so28345e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791680552; x=1792285352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60J2VG6f80i0xtDeR4IknW0h4MKxDdpuTKlVp7+7Fow=;
        b=nhz/WgWXg3aK6Q/YGAT/jwDFNI4wc/9C+OtgNM+3nwwem0ELEXh8r2Nu/kVx4PsZaB
         XSiEEChFL2QX96ju09YzaNLaUFIqg/DCcu90B/ZtZm9A4znA6nu6qPdzqarQhKxTHanM
         Z65n1OnubsZO5+R1RzYGb6PERb9a4oQQHu2lPfNz2zBXjYZaY3rtcGXkwjdFaxll4EU3
         laef2iX42UzATB2KZtAxLGtVPezQDYMdxiN7y9+nOyXKB6Ws0bksreQ325/caDJ1qgJh
         oPOqNgnpVUshpCfjhCDsGtOH5VyscE04/tGH4vNr05zGTUZz3bTTZzl9KsA0WqPbFTXd
         sKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791680552; x=1792285352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=60J2VG6f80i0xtDeR4IknW0h4MKxDdpuTKlVp7+7Fow=;
        b=mOpZ51SreBgnWESa7PGyzbi3HstO+wpvh1nNVpEjqQBQEoW+quHJxl2URsFfCIFwps
         ULucTSGQhNx27tKV5rxyw42B6tiCz4G8jNmZOGnC6FXh+8BxY3z/lde76Mo7gwJabgje
         706Kez4S3XVUQOSt/TpxGLpVVKPX5wnMFzlgcc4DM5NAm8c1nrobcEL8k5ZgUMa93PD0
         omS7o4Ne0GCsy8T6WWjziD2bXNBk+kSUOnlyjTUUzan31gtfZEwCnG1znbTsNPsTrXDq
         9/M8RMcTpKNvDUFDpdn1q3M3U2eGhP4wEgidgsZmHJRabbPfDDgdH55nTnikjDpj5qmy
         QvNw==
X-Forwarded-Encrypted: i=1; AKwUvBxrggaMpO6+e7FKKyfc0oi12TOzT6QE+b1SIIGhSYfDa56kxuCVezxsOAK+vZ+4yL1dVZeg2C6PEZGTZaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK23DU2+HsRDYtdq1HX996wzjLFx2sgP9PrHfSF5OZ67e9ZTvZR
	Wc68KYs7AHuZCnNKabSQEsxzQLg+BrMOE7xl93Qb/kWdcfVaUSe2gTx8
X-Gm-Gg: AYBFou3hqx778Qwaj9QUCQdtyq8Ozh9qwsxvhfWlbue3hT72z2Nvpfo1VaNMF1cevYT
	ITXmABTpeDVsQr9WwLDrmWqsyrkfa66NDCdNgotwvvcmg8kFrMmtu+GML48xiTVKA7Lz5wjirsw
	qffeyQJJU309QsTXhgKjHaZX/ZQQZsvQB+c1KtgRSSdwVwxm8TzIu70OTzlzZw1okMiBb1GyoMz
	aDMhnd2IqaoWuLWbusNBviz57l0GjdvV2yiWlKjv8lLcWlrHRAMF0bDuFIars37yorRGvp3x4w+
	/JdZvhCCUPsA2caJBJceVCN4+XZ+JqLjU1Yhizt33pdtPgqI4qRAUbMZNFxtV3Nf2aUAOaRC6DG
	bmsmE6apRPlAHoIcxI5Fd0bkR2+u34/XVU0FvJvRU/eloEdp3h5MqJHNBZ1fDD+BQ15eJiA562W
	78FC0jatpZzPwkoLwg9dFnWo/yC7PII2q/5LWeg1Lzdtci4w3eNEeqowk949yXV5B8uCE4EFkiT
	bwenruMK55c7JVXcZ6RxU3On6M3u+z7U/QoerXyNHpontBvD1G+QcZB2uouyGOKoPZNyaDXcmlX
	/VpnWImbI/vSR5ygtYOT8ste/kx3VwWUTZuSiEs6SV/ULmXm54wePpV2++ycbg==
X-Received: by 2002:a05:600c:8184:b0:49f:ffd0:4039 with SMTP id 5b1f17b1804b1-4a18e4f2221mr83201325e9.32.1791680552214;
        Sat, 10 Oct 2026 18:02:32 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6b3cbsm139970805e9.0.2026.10.10.18.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 18:02:31 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stefandoesinger@gmail.com,
	linux@armlinux.org.uk,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 02/24] ARM: l2c: Serialize device reads with cache maintenance when requested
Date: Sun, 11 Oct 2026 02:02:23 +0100
Message-ID: <20261011010223.2379347-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <5e78f63b-9479-49d9-8474-fa408135f325@app.fastmail.com>
References: <5e78f63b-9479-49d9-8474-fa408135f325@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd,

Thank you again for the suggestion to test arm,outer-sync-disable. I have now completed extensive hardware tests on the physical ZTE ZXHN H3600 across multiple bring-up orders and load scenarios, and unfortunately disabling outer-sync alone is not sufficient to prevent the interconnect deadlock.

Here is what I tested:
1. Added arm,outer-sync-disable to the l2cc node in the device tree (zx279128s.dtsi).
2. Rebuilt the kernel with CONFIG_CACHE_L2X0_IO_LOCK disabled and completely removed my custom read lock from both cache-l2x0 and mt76.
3. Netbooted the initramfs uImage over TFTP into RAM via U-Boot (zero flash modification).

The kernel booted cleanly and confirmed the configuration:
[    0.000000] L2C: disabling outer sync
[    0.000000] L2C-310 cache controller enabled, 16 ways, 256 kB

Both MT7915 cards enumerated over PCIe and initialized firmware. Here are the observed results across the different test scenarios:

1. Sequential Bring-Up with Long Delays:
When bringing up one radio and waiting several seconds until it was completely idle before bringing up the second radio, the system survived temporarily. Because idle beaconing generates very few register reads, the collision window was small enough that it avoided a collision purely by timing chance.

2. Simultaneous Bring-Up ('wifi up'):
When enabling both radios simultaneously in UCI and triggering 'wifi up' to bring up both 2.4 GHz and 5 GHz interfaces together, the interconnect froze solid immediately. The serial console went completely silent, Ethernet ping dropped to 100% loss with zero panic or oops output from the CPU, and the router required a physical power-cycle to recover.

3. Concurrent Wi-Fi Scans and Traffic:
Even when the radios were brought up sequentially, the moment concurrent operations were triggered across both PCIe endpoints (such as spectrum scan triggers via 'iw dev scan trigger' or active data traffic while DMA cache maintenance was running), the SoC interconnect locked up dead every time.

Looking into arch/arm/mm/cache-l2x0.c, arm,outer-sync-disable only suppresses standalone outer_sync() calls by setting fns.sync to NULL. It does not touch the line-by-line cache maintenance inside l2c210_clean_range(), l2c210_inv_range(), or l2c210_flush_range(). During active dual-band Wi-Fi operation, network DMA continuously invokes these range operations, which collide with the high frequency of PCIe MMIO register reads across the internal Sanechips AXI crossbar.

By contrast, my serialization lock approach (which serializes PCIe register reads with L2C maintenance operations) successfully passed 240+ continuous stress reload cycles and boots under heavy Wi-Fi traffic without a single freeze. Interestingly, examining ZTE's original stock kernel (Linux 4.1.25) reveals that ZTE's own chip engineers used this exact same solution, implementing a global spinlock around PCIe reads (fixed_pci_read_u32()) and L2C maintenance to work around this hardware erratum.

Given that this is a silicon crossbar flaw that requires software serialization, what would you recommend as the cleanest, most acceptable way to structure this for upstream? Would you prefer keeping the serialization lock as an SoC-specific quirk in cache-l2x0, or is there an alternative architectural mechanism you would suggest?

Best regards,
Navid
