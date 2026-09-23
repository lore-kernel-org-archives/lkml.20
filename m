Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5100149F12E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160078; cv=none; b=lG06GS/Nd1k73uPMceaPWi/UpLNIOe/xhRVF8wcr3piJ8z6fOexFtm72kHEZrmVBdTHMDz0bAKqUFm34npdKIAWdeNs/wvQv+Xd4TVE8xhe5E0SQZE5Xi/1L9/gLuFHdfGvqQEZbVeL1VrwvmZxvCp6LSV41GBkvVqdSH9Pf54U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160078; c=relaxed/simple;
	bh=5PxAU3paz52Mtr8Jp7nt7QVnPTjaM1KWEmISoLCTxR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dDsT0nPBqg6sO0xmNxnKpooiDRBtHwGzXPsw70Z/H5UnuSBOUCgN7vkUwfNUdkVNJ6WvzbhJ4JYMQ3eBNAWSurNDXaKmU9OVzcOUGqweDxKqNhkMFJUIKRzKY2KTd3AN4X9Wyp0GQI9rDqZkQyswJDeApeMwDiFerCqXGoo2k9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gT5252TO; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gT5252TO"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so6371355e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160059; x=1790764859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AXUSqDqmWGsUiKj+kk0gzwU59ohBd+/qcFHp0F2IbXo=;
        b=gT5252TO7b3cbPpVLNSSByHVIfFTHAPa/Hor83BOJw3cjUetXBPDN/KYrgMekO2aGy
         KSHwV0avJ+L7reBPXQqwpVtCcopslvTYpIvhwMh7oGbYBDrqAX0DhP3A4CHEmXpMjxmb
         0j1BVXjjrSISF/iXaVFsXPUv9RwY1X30q0MVKXS763ZwSKWR0Pp0THge2HOr0LdsY67a
         IEdGsqfRRKocB3Y+cx0CKW75aPuXviPPh+O7Kmz1CMgyhbe/V/aiW1LW6VCTm8VgJqK/
         wSIP1xU/5ZkV7joikgLVH9VtAgilA+6O0HHPoSjMrczO1hVVWPiPdFTIRLeBOVHMhPbt
         +xKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160059; x=1790764859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AXUSqDqmWGsUiKj+kk0gzwU59ohBd+/qcFHp0F2IbXo=;
        b=Eo5N0qkEDZ7l5OM/gcGDf78ST5tVxWIseylqD4h+iHpiUHPzuYGhgeexSJydl6Wdf3
         mdyD7NBdhGvqt9YvOFXZyuK27HP6xik+PPWlilqsz/0afRtcH3hOikYTDvPWFUZmI54H
         4FlQCPrwGOtwzAxjuHZxPg7XT6NoLKYkdUzRO3vs2JWK3CE2tvc42OzgL+V+QI/9UKwV
         aVjNNiY6g7wPSJM4anQnkZxxaC9Zd3lEATJzpcINccDXjBEEPNzsThooU/xd67cBMlSL
         3z444De5nNeVFd8lqkUdgYMJXMA70Gu5f1uJ87iuj6ZcEmIkialxnBgH8UX1nS05A5gj
         1Y5A==
X-Forwarded-Encrypted: i=1; AKwUvBxiGgxEzUqO6UUu1jXTvKaM62kVFkY1GbF6LHgnCrvHOzeLlartZ2otWb2g8Y0eYdgwOVmRO9DzyBMgZss=@vger.kernel.org
X-Gm-Message-State: AFuF++na+qUjPy3Lg3nRED7H0duDQRXw6n1bV7YsKNWgA9UJxCIAc5o3
	ai9MibeQKN020nB3NBj8zDU9AkYToQQ/IFCtDKb+aVzyZ7S6jx93UplgVEUTRQQw
X-Gm-Gg: AYBFou3jJIGxF5acApSZCNklmqMASs0i2toULMBjHr5Oo37XFeEetvBeh9KuqToUF4N
	ev7VLKfd5W9f3nLyxW2D6eEYgnzzAhZwGZRDcL2rxx0B4uqg9yI1RYTDQLQIN3k5v/qV3y1M7jv
	UpsYSoD0yU1cA+volVLylIcZYyVHEgt262F+2i/OXn0Bp8rtlvBDyf0U3vJHFdFcTw4GOJWdmPj
	Jeo6onIqhucBuc/tYyWsR/GO94ACz00767f6kHX8+fvoWLLFdIVTvTiNfh2lbVtplINBLb+Ks2I
	5K1BjKEELTLkWALPxKDRsiBuczhSoXH/k75cHQMH0YkZDbazUD9bDfvcZ90UvpjuRCGk4Uslx9R
	VKoEZLYyAo8tGu1Kvy1L3IL/hFCEpPlWa8CayZ4ujxvMXWYk60v2hdgfKvDRbwN/+SQb/S5G3AG
	DZBrDoiUC6GvtnfbrGGAtAkn86cNbtIuR0pgk/8DIMqB1NGPz9p81aOKD/wcTkOwsMFBhkAka+L
	T6zyd5RaIA9HAiXyc4z7OoChDilTnNPc6RikiG9L/QJnp8ehFzhGPMMbKt/r7r88KKX2B0+M9JQ
	OpcCTJ8Ncfu+sa8+OME=
X-Received: by 2002:a05:600c:8b64:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49fdee0a0ebmr25441525e9.4.1790160059161;
        Wed, 23 Sep 2026 03:40:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:885e:6ade:cc5e:a35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1acb91sm65170415e9.15.2026.09.23.03.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:40:58 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 0/8] Add syscon support for Renesas WDT driver
Date: Wed, 23 Sep 2026 11:40:46 +0100
Message-ID: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs in
the WDT driver. The WDTDCR register is part of the CPG/MSSR block for
which the CPG driver registers SYSC regmap. WDT driver now uses this
syscon to access the WDTDCR register.

These patches were part of two seprate series [0] and [1], out of which
certain patches have been queued separately, so I have included rest of
the patches into this single series.

Merge strategy, as the WDT driver and DTSI changes are interdependent
the driver patches can go via renesas-soc.

v5->v6:
- Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.
- rebased on top of next-20260922

v4->v5:
- patch #1 is new addressing Sashiko's comments to avoid potential deadlock
- patch #4 is new addressing Sashiko's comments
- Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
  restart path.
- Handled the regmap locking in the driver and introduced nolock
  version to be used in the restart path.
- Added review-by tag.

[0] https://lore.kernel.org/all/20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (8):
  watchdog: rzv2h: Use pm_runtime_put_sync()
  watchdog: rzv2h: Drop enabling clocks in the restart handler
  watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
  watchdog: rzv2h: Propagate WDTDCR access errors
  watchdog: rzv2h: Convert WDTDCR handling to regmap
  watchdog: rzv2h: Add syscon support for WDTDCR
  arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
  arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi |  24 ++--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi |  24 ++--
 drivers/watchdog/Kconfig                   |   1 +
 drivers/watchdog/rzv2h_wdt.c               | 136 +++++++++++++++------
 4 files changed, 123 insertions(+), 62 deletions(-)

-- 
2.55.0

