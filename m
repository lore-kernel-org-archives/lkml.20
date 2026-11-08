Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153494;
	b=ceYRSNz7ObPiLShz02LAPiQQGC25kgd6vKHEbBR1xEHQdCmI719b+W8UA010TUYCObz1
	 gB40XjmGjlXnb5YQb+HhPnFPZ7/np7MJ0vQCzEXxDq0JSvutnjet7s9nTknHQ3dKpGVWR
	 74XFtjSVSHVlWi7FPePsrRxCghCi26QnJ99UIvZcK2LKhuqrrvHwKHD66caiNBBoxi1w7
	 KsuZxZFm5c2X6NUMzdBOPR0rOsRq+Wc3tGAATsUL4bQS1cDSxZLCAwhijdiKuS/Ji6NBR
	 i85S3i2dSxrc5nfr1zjvZr2A+qUFwEMzVxUkvomOcsiWQvIkPu33DYCqQpRgUdfPvvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z65ViVZ7QDcN9aUeeQCDhAMdMHiR8hItUu4lI1V7+r4=;
	b=oCc5D9gVu465pditygvzabewkWSwuongr5aXrcGPdxJ1OM/6qOpJn3fQ1QOwFpI+sytf
	 t2Ud/magyaZTbYf4ln8s9bs1ZQK+SMgfvu5u8bgTDvHTlXnR8XBibS8PFalFXGruTn/+9
	 5IlodXvROlQ/MVWl2M8d/gEIdsBXaMJ1pTKN7XyueUTbh6yXhhMS3S0xI1WutnbF2bjhE
	 YmXhhyD+UcUa2i9DQiHZCQ3BRJfU+DKH0vX3U04NpNo9jtyPN/awKW/UHrTCc72Q/QtYS
	 UFBD8fx9+jz9SWhP3EoXWhy+le2na5X+X/LbJPGwKAnoOX0cCJEHY3+xtFmbmSYVvVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0zi2/68F";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CE2606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61CE2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0zi2/68F
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491971ac844so127679f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794153493; x=1794758293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z65ViVZ7QDcN9aUeeQCDhAMdMHiR8hItUu4lI1V7+r4=;
        b=0zi2/68FnBZlkcVJrAG/c0gRwTiWBeRxILx9yNyrlpojMDY8igrViAUxTddq9gI+7Y
         8KqNcmYbo8kc/oI+DwBimU5x7R/vhFIqGCOAdxv4UTMEQMyYoPpewVCqifrFbeOMU5cf
         9olBo2JTQivIBw4n9UFIFIujhySNkPywO8c9ojjzwyoMq+Tn6RVbKvuy3SqK/GPKsclS
         iMjBvEW/uOr21oZqJpGSkYKQmWAOkBbc1FwyfRLM9k+50xFjrBHwy4xpIX/cG63Yluw2
         nY5WSN1lr7UW3LqOz8RhTYobJB3yFiEafiWmR1B4Kdahp42l7Yi0H8NW38EQlfil57Dw
         Q+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794153493; x=1794758293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z65ViVZ7QDcN9aUeeQCDhAMdMHiR8hItUu4lI1V7+r4=;
        b=CG2J4MIFGopWhIgNC0iYH1AOBHRHEz6vlYNF7HwLqXTAAqTEs6viXiB/cmUsme92jJ
         69X7cRfzvs0iLJNcfPbs/vTbn9h7A8/sul+ZKN7rGqMWkkDalYjSSwpgtnx+nzMPXa8M
         b+qkIK7wEHiXqJVCSA7L/z5z8kcdZJIAbNXRsg1MW9peFJ2/G/9MhMvkJ31+X9wsZySS
         Q39cBpksZPGP5otAM5zruHwRr3NNdUOAyAUnlA7qljX37wQnC94TrmRBiexc7Pr9cFGC
         XqoCu9Cjy/Y0guF6Ea1/k/aalFcuFyGjy1CtIojGX30ZPAhIqhSbdSjfPPAGXvE8deKo
         e0uw==
X-Forwarded-Encrypted: i=1; AL+hErFBDMPJvSUXBZHDMBm7Vcq5libAX7BmJ+jJZH+03NqOfv8RWfPCVsaa4qSYclDmBR4RPVb5FJEk+Y/drig=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W0fcUdFJI5hwHcLRoYl8UhL8QZAeAw8nA7Qv2CGumclnGZ0GC
	3kR2Zxo6ogo7jYFu6ExGb/xCfteXzuAyE7XbBTa/D00IbAoUde855MKQ
X-Gm-Gg: AYBFou32Ht+l+5dlwjQN0ggbjl2Q3/qRn6VjNNsBpXcndehGCunjyXDrd7NsKpCnMvn
	DnBsgcEqPXlCm68eVXsyjnlD716ghCf2Su9FTDW3PIkTyMB+5HgfHehF1CHit0qk8qqZ1T7oxLD
	McPM0l077AyNVARbMeF5S/gLyjedhXOKIjmVG4J3dQmVNcUUZ2r5HEoJHntPtmcD6VZpiXJceHZ
	mxpYxgtxi1PS8aXv+JYoS53BAwbctvedxYGh3nGUgLXsXTR4+3y7oGjO3cygIgnDyKhrVdOc2a3
	D3kRpNAUmBeIlG9JXHyjUO6KNRPg49WJOTe7zM2plsGjP5CmA72mf9wK78J/thqi9nbjQRojlEk
	p2VbqvHJGEEt+5FrJKPY1sPuE/pVUTT7kLoU/s0CWNIqD95+c/NtuZ9/WrkNGfTQrguB/XQDVUz
	Q+812RaagX0bsjJQXDM2K99dDI/Pq79rHjT+6tdtzZLoeHdDGTjudfDMnjXwLTBqshpt8xIOiP1
	RE2xN3W0rN/RCPRyzs3wk5ZUFKl9Ud0HKNG4vrZ+Njp4NSkngNuaTs29p1/tYjkz9FisM7SuqMZ
	CgvIYy9P3hnjFMhxusxQMAfJLPIUK5TYBAwOffxtRBBGzl1D5jo+WqhOf61Gx7xQwwJrnxN79/D
	JxIQLUeYWHg==
X-Received: by 2002:a05:6000:2303:b0:491:ef0a:1f5d with SMTP id ffacd0b85a97d-4958530ca7amr4049074f8f.39.1794153492539;
        Sun, 08 Nov 2026 07:58:12 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f316esm4753282f8f.17.2026.11.08.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:58:12 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] clk: sunxi-ng: describe CCUs as tables, add the Allwinner B288
Date: Sun,  8 Nov 2026 15:56:58 +0000
Message-ID: <20261108155702.361022-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

sunxi-ng drivers describe each clock as a static structure, list it
twice (ccu_clks and hw_clks) and keep a separate reset table. This adds
a table front end: a SoC lists its clocks once, indexed by their binding
clock ID, and the core builds the usual ccu_* clocks from that table.
Bus resets come from the gate entries, and clocks that a SoC generation
shares come from templates. Existing drivers and bindings are not
affected.

The first user is the B288. Its driver is 212 lines here, against 749
in the current style.

This replaces patches 01 and 02 of the B288 series v4:
https://lore.kernel.org/r/20261012100816.331033-1-pmazzini@gmail.com

Pablo Mazzini (3):
  dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
  clk: sunxi-ng: add a table front end
  clk: sunxi-ng: add Allwinner B288 CCU driver

 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 212 ++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  11 +
 drivers/clk/sunxi-ng/ccu_table.c              | 510 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_table.h              | 233 ++++++++
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 +++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
 9 files changed, 1101 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_table.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_table.h
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.0

