Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313D744F54D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125482; cv=none; b=Og0U59IezVPUiC4TehK67OmXN6HyFR/6xBGKlEcGohV6Wx6751vl+gfS/XhySyaBa8T/KPclhKvOKxVsXwNyLF1NAsmdkbGgkjzZNIhmizFCU3HzNr1iE3XNANNb1kN/+ncuIKRitKAozblxnG+W7jSqFUKBi7XjT/oRPBx4wt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125482; c=relaxed/simple;
	bh=BP803oURR/lN8mCs4lhT55YLQxArhtFJ/cLKl3zfk0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lUwDuLdAeQnIHaPGSdP2ra2nEdrOow4Uh3RvpiDdXKdAh+PiXUEB0ErOv22FsmMcyBr94zFwKJ0f7ej+jyrhas6Ne8FumvT67Bvvsj82rdvPxNiy2BNFf8+ZATPdkvf79sZEcX1nPntNsY0gKQJiwsmXmFCAIqEzYXd5bg8s1Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgxYvuu9; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgxYvuu9"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso1361017a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125465; x=1789730265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EGymmArXv4evJmXGsdnDdmakRi+qhuX+cQlFqwWpb8A=;
        b=MgxYvuu9WAINZLrlXY8oj0LQQuraqCWwcCOdzY9kBKp0x05pNms4Y4IzU60eQWEIZP
         GDQmVmp6vJv6OAbTwzu+0q4lOtskFY+TnUz0VVOHMGgm4zhNAz/vfyKicym3949kPmSz
         z8teXUI8Y1Qk31epJ9SGu0Q1tjZV5VF8hc5u+djkhw6nyLt/5BW6pR9UmIne3P+bZEMp
         ggM3GrDIsyhLlkkaECUSP9mMQmNa3ejndFyBDv0WhFtq+5cadX21ZEfr811Q8FViyDm/
         nga6/H1pwgyxpYdlB2RugXzXMSdCgOy6dM0K6fdFU0g2IndkT/T2t5r8JXRumEftn8md
         JCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125465; x=1789730265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EGymmArXv4evJmXGsdnDdmakRi+qhuX+cQlFqwWpb8A=;
        b=hGhgoRL2RNtLrslCHR14IbmC/jeHUIR2AkQ8+bNGIARx882i35LMkPuFp/luxupSJp
         yJCJ/EDREJS/YD3V+BkpBKnb2hf/DQUSIXpYO3sXEJ2nhW7zNZNNRjEx8ghYA7PfWck+
         dlaFIuXbKAW5jo2dsPTjPUXbHNzECTZ4cDyF4JzhNsY6T9O4hm51FC8b3rDxvYo96OJP
         02A/qQXeJEUf+ZqdWwCTFaUQOAWmUfZdoOE65wd8Lr7lC5twBcLbULya6gsyZAkZ7KM7
         gtgXKOkiVDcjRNhkHogPjRShGHdZFpHnKy/EBx2c2hmoJPLH6Rx4cbeqFxQyJzsgEL4v
         8D5A==
X-Forwarded-Encrypted: i=1; AKwUvBxfhWpiV+F5fEct8OgJOQNDtHCDeTkCrKrX4qiJtGprDHu5UC16VARmteE4uYftrcSs1pKxOupZpsJqo8E=@vger.kernel.org
X-Gm-Message-State: AFuF++kAnTyEZ+hnkZPeePGp5ZovRRj8MwHEJRDNfYnAy510wfmiQwhh
	D4MXM1KcK040UtuIyH/ZGTXHiD/V0tkBnxfhUdMXV2bOwEtnb3e7cfl6
X-Gm-Gg: AYBFou0dy75zYiXdULnNwslRXwGSwLCe18InvJn9F7Q98v4hRrZeVKiEdQw88fxZnse
	9mWj8cvSe9QVGC/iC5WNDrP/hsuf0f1SsZ4E+xvziFEhAmOs0c+ol6s2lhUSMcSt0g6f2SnnqHZ
	FYk7VxLinYxAei3HEi8Qll0uZAtnGijDj5dsFKi4UFZdriWLEUnQcGPCTaNKNc/655jgdZPNypm
	Yg38vHRDQ+8wDIZ4gXvTGBr8Bl6sGhaxeDyYIhti2DxEwXEXSrk79BOquuw6ue4Ld7+xPT0yjyI
	jHfMbzQwVznqPEUdrNrNmYu8fa3D+wcCpyRsP6XHlldirNRr9SJ3ROYyZzxQCqKYVLbyLV4hKtN
	E40JkK6v3WPmPOWeTd/dHsC+PbMBIFEW3KjQiGuQklUx3MZepVB31MddPJIz4B3lZlSgvKK2T7F
	Lyc6qUIgNAl//r4a392H86fKOg+PevgL8eMaYOZN1LxAO9qs91d4r2qcBnv+mSQa4n53yDhtCEG
	twbjkWkwwMknPoxU0fyEEa/NEUZkKwzyGuhepiDFt5xenAqUgXYI+Zii+/Nii0+LWlamtbxBSV5
	kaQNBt9zpBgVyk24C0E=
X-Received: by 2002:a05:6402:1587:b0:6a6:584:d9e7 with SMTP id 4fb4d7f45d1cf-6a9b5626b12mr1656298a12.15.1789125463808;
        Fri, 11 Sep 2026 04:17:43 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/8] Add syscon support for Renesas WDT driver
Date: Fri, 11 Sep 2026 12:17:23 +0100
Message-ID: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Merge startegy, as the WDT driver and DTSI changes are interdependent
maybe the driver patches can go via renesas-soc.

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
  watchdog: rzv2h: Drop enabling clocks in the restart handler
  watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
  watchdog: rzv2h: Propagate WDTDCR access errors
  watchdog: rzv2h: Use pm_runtime_put_sync()
  watchdog: rzv2h: Convert WDTDCR handling to regmap
  watchdog: rzv2h: Add syscon support for WDTDCR
  arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
  arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi |  24 ++--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi |  24 ++--
 drivers/watchdog/Kconfig                   |   1 +
 drivers/watchdog/rzv2h_wdt.c               | 134 +++++++++++++++------
 4 files changed, 122 insertions(+), 61 deletions(-)

-- 
2.55.0

