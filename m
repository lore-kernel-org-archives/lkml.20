Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395243;
	b=wLQF394KgaJnuaKEO5sFigPaV1hl7d3nzd2jBTAb81jSUbwtNRIU/KCqcZ3RksBE+dOu
	 kbVwl+Jy9rNOPE7qKg5rOJL90s8AE0WF/x8dAgXZbHiCoDfvJgMWLDud6AnAu5jQv+gpl
	 rThYtf427hHbbq4ielHbiimH6LdaWtwEhsx9pvZ5w3uPMlrfBeq6ssU1Jv9jTECrwQf9Y
	 3L3B8c4O2sM5qhoPLb0OxtDO+baQwDD/3IVcEmTrv0BlwI6+s+B7fvn1ek7f/97TJTHBv
	 38i2UIvE7DKvE6kcunZ8U6uhkaW36t412IP6zt6FcoevgvXka+fBnJ8fS2K9Q50sw9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8Q2NFx7nPmxyH6HT1mTdHW9zn6FjnTMuVSCUO/8QAwg=;
	b=UcSPvvbrZMe0AtpOjDWEFtBUWd61TF/sbUJNAYX58/kUb88YxvW2vMh7aOmZSsYrRFBc
	 LoaoLWKhq2XMNU9cW1EChhTjD6tqlFG7V31BiPmb3euJNBxD3fYzBR8QF3ca7eGJcYl6h
	 5bYw94CiqlFQG8W6Eo05atFxZvAPpsOCbCzkKiXOeJbJ91VtuN2QU2CGc4Zis7kXjejvV
	 JzEGjcE9ckFVL58LWskE+sKBZYAaXabtZjTXvgWQxdiqrJt5lBEEniWWY/PlUJdqNZruT
	 AYze3LuLPG9VYHP5kWu5/ar41dG/Nb8WyjOBiK5yKvqKoF8lkwFLJMr7FZXQU+ojq5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="en/3dGrF";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F17606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F17606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=en/3dGrF
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a215e64962so34329375e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395241; x=1795000041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Q2NFx7nPmxyH6HT1mTdHW9zn6FjnTMuVSCUO/8QAwg=;
        b=en/3dGrFdvJrBqQhikOW+PJ42oaQqIk3OzHx9RLAfQDkUDn1aTsV7YsOZ0bPdfl4bQ
         pGNdLFmbTpKjWEAow8OWp0470oYPNjsmPTKJO5OttZRd5Hgmpfs+N1lRF21K7PdlkRQe
         xjFDWY2cvDZIIadt6edcvzW42VU4opvLx2F6Lf75Zexq6WKtFVrdD8O2g5SWjQg5f7b7
         rMgTdL09UL8EWI4FsvF9Jg45Wy3hHi0vdp8QKobs4CXFQp0EUyIURJXlBSTMQuEcW2Re
         BiyOeIuI9QRrChoN+zNRxRIDgPX1CpvkfePHqsIxEaQU8W428VzcuqWOVtk61X7cWXH5
         v1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395241; x=1795000041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Q2NFx7nPmxyH6HT1mTdHW9zn6FjnTMuVSCUO/8QAwg=;
        b=bfBRf2+AZUKStE7RI7Jdb6gdJTK/BpiK5zDm/GAH+YCFN9+WFvYqA7N1DK9RcAZeiJ
         sOh8psnZdMjmUsvkEkQLEFj4QerkKkPwK3jkc0qdYrdgzBU9W3MDJa/pgRmFy/y3hDj8
         oLemglklFOLDFmK8KrayMQ+AOrmEOQObfnvXNN/1c4Mn3S2ldyG79BusDEgJ+wwhYWWq
         YgUJYvKKGLnFujbkwZibUQwFvuHwU49lfLfMythYze1LVSYF8zrAh0joF/b2/1rpqtBe
         jZZttAB6K1p6gf2A/+ALunnvphDLl8B+vYaZMCiPAxFjINlezzScgdWHKbGTru8SGzwU
         474Q==
X-Forwarded-Encrypted: i=1; AL+hErGUT0hKEkuNW4VdYLHK0LeFR5dqVl5bXc/GA90FAvzMm+HSrpxy4cLOkk8gij3F8hcdS/+e9li78wyszUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LM9PtRuU0S8RSmWGPMZf4lxgL3hLyKOACELj6eQr7MSfqRZrf
	sTuc9HKxFP56SU+OqfngiKa2WwnPacMYe/bZrFtDMHAL4Frz0kRC8YMY
X-Gm-Gg: AYBFou22wZUM4MYuWEj/emBe04Ds7h0w49oNPaOwdsH20XyiwrKILzq9WjCa18F5zwK
	WWDxppafQns2NOKXwEtZwsFaikERyKXU99CCkCc7CGRClCZ50CDXGgjW3gi0esTPH0SJXT2lHGq
	3maEfbS8i4ODdKI08nND+OO771xW2NUjPl2/t/XHQQeA2rqT3ULDvDezXAnJz0njRCt+J+lyPev
	KFvP9yYdptRl4MMF2JKwWP8WrK44N5L3Q/DSg2gMQv++24Ht4sKpuGX+FlZox9qTrIDrG7ze5FC
	YqwwoSiJRsxogWvHfTy0myMUshg1Xl1yqKCA6EPehWJ6Bhq+gM8J/BXHD9fa+ZEF4Av4oraU3AR
	2E0CH67UIvqEFtO2D85ItnpfB/ZZ1GsnGiQO50eBCjINl8/2oTPLd1I9We4cdH6YJUxjIex4cce
	8b+LTPlylR5y1bIPcspP0UOy2AHYF5tYFzLVvJ6cJN4E+NZUFHuPntEIQk9WE3OU8kRzOV/H8Kk
	uqgGcRVM64tJ+XRLhrPqpOss/iU8/i2lu4X6DQigJ+JjhJ9Qd/faFJ768c6bsZXOlIhXJeoxlO9
	89QhmMSFDlcENXNQphR/ST+LTjRFaWJ9KH4qoxcmOGIfC3lDmAT1MXv9ce0vL7y/KrV5KwNqagB
	i8zn5A2/72hsHGR8V0r0LDlfPCa2Ai3M2mcYElvnYL/WXNhxKhIfEq1HzGoH7+Wt5f7spoa8tn1
	m0F9KOef2H
X-Received: by 2002:a05:600c:5247:b0:4a5:5fb9:5d35 with SMTP id 5b1f17b1804b1-4ba0937f143mr36040755e9.21.1794395240926;
        Wed, 11 Nov 2026 03:07:20 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm146727295e9.5.2026.11.11.03.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:07:19 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 0/4] watchdog: rzv2h_wdt: Access WDTDCR through CPG/MSSR syscon
Date: Wed, 11 Nov 2026 11:06:56 +0000
Message-ID: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

On RZ/T2H and RZ/N2H, the watchdog debug control registers (WDTDCR) are
located in the CPG/MSSR SYS block rather than the watchdog register space.
This series exposes those registers through the CPG/MSSR syscon and updates
the watchdog driver and device trees to use that interface.

Normal start and stop operations use the syscon regmap. Since the watchdog
restart handler runs in atomic context, the series also adds a lockless CPG
helper for restarting the counter. Existing device trees using the separate
WDTDCR register region remain supported.

The device trees for R9A09G077 and R9A09G087 are updated to identify each
watchdog's WDTDCR through a `renesas,sysc` phandle.

v8->v9:
- Rebased on -next due to devm_kzalloc_obj change
- Added RB tag from Guenter for patch #2
- Dropped WDT driver patches as they are now queued in WDT branch

v7->v8:
- Dropped patch "watchdog: rzv2h: Drop enabling clocks in the
  restart handler" addressing Sashiko's comments

v6->v7:
- Added a new patch to introduce rzt2h_cpg_wdtdcr_count_start() function
- Added new patch to drop pm_runtime_resume_and_get() &
  pm_runtime_put_sync() calls while accessing the WDTDCR register.
- Dropped propagating WDTDCR access errors.
- Dropped converting WDTDCR handling to regmap as this would require
  resource address comparison to get WDT index to call
  rzt2h_cpg_wdtdcr_count_start().
- Made use of rzt2h_cpg_wdtdcr_count_start() in restart handler
- Added if regmap is available, use it for WDTDCR access
- Updated commit message

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

Lad Prabhakar (4):
  clk: renesas: r9a09g077: Add helper to start WDTDCR counter
  watchdog: rzv2h_wdt: Add syscon based WDTDCR access
  arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
  arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++----
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++----
 drivers/clk/renesas/r9a09g077-cpg.c        | 35 ++++++++--
 drivers/watchdog/rzv2h_wdt.c               | 77 ++++++++++++++++++++--
 include/linux/clk/renesas.h                |  6 ++
 5 files changed, 130 insertions(+), 36 deletions(-)

-- 
2.56.1

