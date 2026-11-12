Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459197;
	b=DqHE2mWKXi/0IhT83oToEa4GQ1ziZAcWAPwPLVeZUX69KxbDnRL+n4ltAfQgOwulyw7S
	 KdLjr4hkaAbTIFhvtCwUq8HtV9eJnRgtwKkXmh3pLSwRxp3u2TqJPECgO744Zt+o479Y9
	 0396EK8bZoZjwabBZbn/EcsgbCXCtO5N65d7R8UF4Z5j4dYUalSPlNBORFog24YUjT6FL
	 FA/WS+JcIfssBloeIIWLxQrCo7BkXoEsUM2LYXkir6W0bDHFXPUmnBD1UYPkBycXA0KAw
	 VdWcj8UO5rr1KjBzs0ywBmycYWxqaqL8uXpSE+IxtHICVX5r+aw+zNT53AqD2eXt30A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=okVYeTchHlDUEjmkDX7ZVgbGf0M4gnLDhPB3TlMpvoc=;
	b=0XkcLudGoZC5czSKNrD4yaKdcrqtDRKXxC/NyFj8GBysTumIzNbwKX6X++lg7mqKteCg
	 im81woPgGot6uVu97gcxwEqNlQC0L5mBcw6b117FJjlYNDpQ9u/xOQx69IrBHeTS4bdbJ
	 cBHWhtzjNKvPZkvj5mmSrL38wWc9XiJP8eA/YTLzAOjMNosc8KDw6A15GH67PdNiJwLjL
	 kOlCYG3Yqt/QSPMhKfH7B4pI611++jys+YaNIFfe0TOdxjVfkYQ8j2qD29LqIS1UyB44t
	 +Q1CD8faqPoPvKwB7YL6/9L/y8wUlBRdTX3UreO3vSXuiIyvhVblWxXdfknYz9Mt+VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SVtxpz89;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE5A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CE5A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SVtxpz89
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3720addb068so6928770eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459195; x=1795063995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okVYeTchHlDUEjmkDX7ZVgbGf0M4gnLDhPB3TlMpvoc=;
        b=SVtxpz89LpCz0Tgds0uaXOB3UJsHC+opDCR1WU5CKGLUSqG/R+coHloRScN84FEcLb
         TTPo92+QufxonZ70vN7wfefkyasmRUa/OtzzFwcOZ4azOWHCdIXfYeJZEr7LbXQ8+vGS
         WqzqFm+n77qI6PmNcic9xu8XTPFdX2xV/o0aI2zn3BSv/n4OMJUQhGGxOPkZQLtTuoFf
         M/MZtcvCwqr1ji2MBvBFEq6S1K17WNR7YXIBMxizwQG53avfW9LTLatdiARXjgwWKXMp
         v8TpOdqGH7fzLRHTCpoQg++NPK9TTmVH2iFsqqpxBdtE3et71pQEIeKr8aEg4fUUCqB+
         NTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459195; x=1795063995;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=okVYeTchHlDUEjmkDX7ZVgbGf0M4gnLDhPB3TlMpvoc=;
        b=YA30ZjV+jKKzcwvdXCwNbV4hqEXLV6HQsMhQaS8WdVVfb+tQrjVHqsR+SBCeVntnfx
         8KWzFMakSHMO7n+iexItO5IbK6PFmvQRsNJPj3XNJ7feKIXazfnaqk/2vb18QEONBJaD
         h3Js+9ITFk+YZGY2oxkVwv6tr08CRsjlSIQEfSv5ZWCGw9QZ/jqSOqHIqF122PLzjU/0
         J5Ny/d5Vq7gH1KsM08S3yxGOEIB5HNtohXxqAAfpWqIX9lCHSX9sltl4Jl9K6rfLiCDI
         DYRRB+b4RPuecyP0f45rnw7a0eoLce3BwtKG41I44HbYwZ0pGD8nbcFCf4uh3HhuJXPC
         TUZw==
X-Forwarded-Encrypted: i=1; AL+hErHqQ+mRcIhiFLOfTZY1Bf92INK1yBlIStcvAfP+CPl2VwOYupgrzB7KdsmFaCesgxsihj9Q9jlnvD3+cQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dko6AnoMv0OWpQZKv914avCteUHKrpiNnq9sN2WFBQ5nOut4y
	5OeD0NsYwRow8RWzAFl1lHyVQiTip4eeN9UYgXx4g/iFPHJuDQt2YJ46
X-Gm-Gg: AYBFou3h9FQps+KeEbrprMoBVRTYF7bj2J1RHSO38y733AX0FiyZJV8PlR0p0ru1yHe
	Hf9JQf5H8IKc0LZJFKjxbGrKi5RsP6DNkL6rPG9OB30YXuQv2xZishIgcmsuqE31ulVV9n0rZBM
	oD5cFFMax/B4nRWkPSPRgJhg6Z3RBkUVIYi6Owp+sGUrcIwUzylVRNVmmleJxvo/Dxpa7WzeTui
	ZZGeMo6tF6dmjUCfitWTzlIkeRiZwnN+4hd6JP0VYT4kcK8xBZ+OfnnUHsRJ/EhrHoehYxSZgOu
	Tlr6mQIR90lOPmTiCvCXk+DkMdl9EYXP6vOviVphP5IjXmINEoX1bcEj3I8tSsX3ej+Y1BeeKCt
	0lb+zsUYY0t18vPJkITk2kOCgNjov3XSrreVVe8OYEVKzz4QheR91SyQjLI7wRoQRE+k/28MC+f
	DEz0ZmfC8jIFujDSoxeQEXzvUuEMEArx6Cj4yby3aNSY0GB2u6cu950JYCZ53CVt8FLaJ2/SF+5
	KiV/iVp8IGneKQYZH/UnieyGG9M6mOhwpHAuN2vIERiOsf3p2Kk4lhx7woOFK+XPMqABub/xZvC
	rcZAEl4N
X-Received: by 2002:a05:693c:40c7:b0:36a:15ee:c20e with SMTP id 5a478bee46e88-37686755924mr5584133eec.33.1794459195125;
        Wed, 11 Nov 2026 20:53:15 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm23921585eec.17.2026.11.11.20.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:53:13 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Jeff Garzik <jeff@garzik.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v2 00/12] net: au1000: Bug fixes
Date: Wed, 11 Nov 2026 20:52:42 -0800
Message-ID: <20261112045301.3669532-1-f.fainelli@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series contains bug fixes that were found during code
inspection and also during fixing the open/close/open issue that was met
on the MTX-1 platform.

These patches were tested on a Meshcube MTX-1 board using targeted tests
to ensure the multicast and open/close/open bugs were fixed.

 Changes since v1:
• Rebased onto current net and added the Alchemy PROM Ethernet-address
  lifetime fix needed to boot MTX-1.
• Reset the MAC after PHY/MDIO teardown, since final MDIO accesses can
  re-enable it. Avoid accessing MAC control registers when its clock is
  already disabled.
• Use sleepable polling for MDIO write completion instead of millisecond
  busy-waits.
• Correct TX reclaim ordering by advancing tx_tail when submission
  reclaims a completed descriptor. Consume transmitted skbs outside the
  lock using an IRQ-safe helper.
• Restore receive filtering before enabling RX, holding the address-list
  and device locks to keep the programmed filter consistent.
• Rework startup ordering to resume the PHY synchronously, initialize
  the MAC, then start the PHY state machine. Clear cached link state on
  open and use acknowledged link/duplex state under the device lock.
• Move the LAN83C183 recovery-delay patch before the MAC/PHY sequencing
  change.
• Add a TX length check to prevent oversized packets from overflowing
  the DMA bounce buffer.

Rebuilt the kernel and root filesystem and regression-tested on MTX-1.
All 11 boot-smoke checks passed, including 15 down/up cycles across
normal, promiscuous and all-multicast modes, opened/closed and
never-opened removal/rebind, and connectivity recovery. No kernel
warnings or errors were detected.

Florian Fainelli (12):
  net: au1000: recycle RX descriptors on allocation failure
  net: au1000: clear all-multicast mode when restoring hash filtering
  net: au1000: disconnect the PHY before freeing the MDIO bus
  net: au1000: report MDIO transaction timeouts
  net: au1000: serialize TX completion with packet submission
  net: au1000: assign a valid MAC address without platform data
  net: au1000: fix buffer descriptor free list insertion
  net: au1000: restore receive filtering before enabling RX
  net: au1000: restore RX buffer addresses when restarting the MAC
  net: phy: smsc: wait for LAN83C183 power-down recovery
  net: au1000: keep the MAC stopped until the PHY link is ready
  net: au1000: reject frames larger than the TX bounce buffer

 drivers/net/ethernet/amd/au1000_eth.c | 140 ++++++++++++++++++++------
 drivers/net/phy/Kconfig               |   2 +-
 drivers/net/phy/smsc.c                |  26 +++++
 3 files changed, 134 insertions(+), 34 deletions(-)

-- 
2.53.0

