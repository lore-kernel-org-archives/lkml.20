Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712372;
	b=0oceHFzMh1avwxrrfEUWOSbilfVT0Xu2IpuWBQCVWIJS8srxFPHdgtlNbjUq23cju68i
	 YFHG4Y/99uBTOveFypzNCvfcmylQuw4wYfzJ8lts20bwCTHUAIqL5PRg7v0JM8kR5AAY5
	 2CTDn5PJo5gT9G5hV8gMlX/vssScuED6MFwz3RrY8ADjmMEX+5o1bGE/nyL8NGnYma0tf
	 f9OXhj0uSYGZTST8KoxgHCPxKYUmnvsF4sek8CJxzsO3ZuVnpQAON22FVOh1oPUP0vVZO
	 wHK24DUZGM5z3eILTgZQQ3eXrnFQNtrnAcNBqz7PipSHPE+CywebmwlJfUqp6i2vKEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iWdiIAND/WpEXE+eLFgWWAJDbOb9pLiOPCfwl+Ga1Lg=;
	b=C9W1QTkaybhTwEJ3tcbKVabp1oUdSxbRyu17Gs+MdyvvxnkzfF6ZSFgX3Lrtz1YfNWCz
	 cfU1CNXs7licDyqIinu1fjXYJYQ42dzq1G2udVK5ZhUvQjZ99zklBwD8I2I0XCGlU0UJK
	 wwEvspU/tyBHEJOmGgHkTZy4zEy+/RyZHF2bxC0PTY+KOwp5TyAO/OfrqwXeeuviAj+Ag
	 cxo53Mdm6wcg7HpGkMu59svBv1zuSMN5gxUxiZ51YD9RNDjOPZAWbCGTTG4LoIL2/S4lW
	 2nWIQ/8rn0yDIRDhkOqGIks4Xpd11Kx0ZkYMBWXvWRy8hRUFU9xb017Iz8AHBuNSc8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ppfNWBg;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8407606D817
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8407606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ppfNWBg
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso33261435e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712365; x=1794317165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWdiIAND/WpEXE+eLFgWWAJDbOb9pLiOPCfwl+Ga1Lg=;
        b=0ppfNWBgtVoZKQtiorYg6NHu32WEIfRaz0+evkZdspVB25CLb70MHVYJ+MKxZub6j7
         8hTQrl1mE9zk56VAIQ6bJH7T1Lhrf07zPopW1mBuOrgg5cMf8Ba9YkauMCHj5EKYuAzg
         JUScLBeYdcHBRHgSHiCaDRR9FL33m0swJJoEiFtuxcvGBuZ+oz9Wdzymv1Zp4PUbgO7I
         8QqiWE5jCWga24OqFBmpLrah0YyyrUR+GAJZHwtpwkun7vp/PjQcjrePtlytLjkyhi/5
         Z+WjCMjc7cAsTmIW5HPFFiH7MpvkELElJ2yJlNDrSzx5Km1rLBNhiJIx8Jw8t+5EVjYy
         HNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712365; x=1794317165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWdiIAND/WpEXE+eLFgWWAJDbOb9pLiOPCfwl+Ga1Lg=;
        b=mycsqwPdNAX1sirVrbjStLrwvsHMVK6EOg9kNO/1y1Mq7QvcwapqUzmhXHNsyQR3FL
         5IeKcRdWUQbyvXsDUkh5a+E2mhbdopzi2oqY3foOxXeLB+ssDyCg7vz0Xw8U5i6fcDR2
         +teW61j4/DFRncFpNPyYbp0eTCEcSVSgT4dNMeVv1K57RiFB+Uzg+bSBhxHSkl9OZwbM
         XudLZUf4St6VxBxupwBzqv1dxbYueyYyvCOFKkGHIThML4nSjiWba6IWwWL0P6spz6BU
         aQ9blNL6GyZpnqot3vTqx+5gDY65MkF626ELv9LQ9QStZwudOiwK74mtQRypOyTDcVTt
         QoiA==
X-Forwarded-Encrypted: i=1; AKwUvBzRLE/tCoBNUZ/OXFYApUhjop1MOvqxtFnMa7P2fgxCHne82hJyS83FNh4LC1ezlx2Ss2cF2FD7wkGMe+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3iMBkWHmcUswlVCVPPkQDPOX4IdkEvBcfkpvfAkAyMEuGoeYy
	h3mb5uYqL4S8STKDuw6qkHdBvK4IZYctZWDL6kofUF2OwtZFHqnmdH0i
X-Gm-Gg: AYBFou3k56ZXgQiXCZtfqhU9Pdzzwf5C68AwoRPJjhS6/pZjnfQT1ztfOygiR6u2yky
	+tBcrHP6qBvnI7dU21nQPfCKJFtFs3xVBs8IGtFMDb0phCoCZdp6im0m5LdQoe9oRXYduT3Bt5q
	rQS+/BLFprg4GsqrAE5qwnwCfj3cqhm5ybZKvznvvhLBsLHAogcfBD5jA0xoFjFmPa7l2frCCuK
	rwFSfv8cFGsqjepFu7O4MUVtKDwuNFGyVX9Jb7iEUegTvr1SQfojZlQIMLyz1bkzhArwPMDwHYl
	heCxC+Z4UePADPJ1tW9o86gPD1T4Tq+bp65qcREmsAg3jatKV+K/6pLYJDo6gYf6tLm8CXaXh/C
	C+pe7JFDdAHsPFOr+eMmXq/OCTSfQlxt8+QnFGbba3AMPcCf3Qo6WuXcGmJCNiLgyvURO+IvEcf
	56sejhfMFcRzBh+fFaUm+1NmewXiVib9LnLlq6+fzTKF505LfGzyDke5OhimsvGt4qCTXRFFGFF
	JH9y/FJfnlwQszzyESern42HpfZP1EnY3hAv1IKCMvlJCyJ3T8yn1KrieJU34yObCLluX0mCAB4
	9mnKSWLLxv1sXeweDLOgyo7kYmleehpKiPgwu2970dZVB0w5Pi3iOsSpX+dig8CXNRwhAVz3Zbm
	heHx58Pz2u1X7vdcZQry1N5o=
X-Received: by 2002:a05:600d:82f2:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4afc2105bf0mr200645385e9.24.1793712365149;
        Tue, 03 Nov 2026 05:26:05 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:26:04 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 4/5] ASoC: rockchip_sai: select REGMAP_MMIO
Date: Tue,  3 Nov 2026 14:25:36 +0100
Message-ID: <20261103132537.3717496-5-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
References: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
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

rockchip_sai calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  rockchip_sai.c:1424:(.text+0x153060): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_ROCKCHIP_SAI unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_ROCKCHIP_SAI=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: cc78d1eaabad ("ASoC: rockchip: add Serial Audio Interface (SAI) driver")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index e0ded1fa4da5..aba9a518d3b2 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -35,6 +35,7 @@ config SND_SOC_ROCKCHIP_PDM
 
 config SND_SOC_ROCKCHIP_SAI
 	tristate "Rockchip SAI Controller Driver"
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for the Rockchip Serial Audio
-- 
2.43.0

