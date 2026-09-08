Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19C25632AF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882631; cv=none; b=g1wkjI9g2H0uMTsWpQW7YJMgB67NAMgWqPXaP/Dznv25MW9kYv1x7KYcXl+Bh+QEgvKOPYYcBhtK2LvnYW1tAcxUk4cuo9Ic7BqL3bjs4uNzXvI82VuOGPBeUAEz0xoWUimFYQyXEvOqzM1Ar8/sS0FTTU+Yl8/KKNHe7Fwk4Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882631; c=relaxed/simple;
	bh=sOYHLTiChIhrVkwNVC1/9IjJLRP8fORJ/3H3PHWwqrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jvr1jeZ2YuQbpRdMz+XOrmG1vLMaG98VUo9lXkgVRpvBisUNAvZF9rVuKVOlf5oDWMtpgU6kn8LwuOzQqSy14VeilB0Zb8FCmIR4kdLfpx1B+Zdx+2S8AkNsKSkgH55nTVtxPJnnKAXwD2QOKYSIKMaRYFfmoIPnB6QmozaY3Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=lT5nbR7L; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="lT5nbR7L"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso39489395e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788882628; x=1789487428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ocf33sKaJ9kuq7ndSPCdhJoezpQyYrKkiYm5HN0yF7Y=;
        b=lT5nbR7L4d8StSVo70d4+f0hjznpTI9tU7sQuNVl3qjFHLNymWKR2j7/AFBvwcXjaN
         foBYzjW8UFMQMuoyfu9X61Hnv6AsSeKPJPn1bp7IIgrf659ZbOzy6SwEQ33mpE6XfDjd
         3rLftBMDrY4qMPXk+XNLA1O45sv/qNCVhCWTbu9MqHrvICOR83S+BxxoHKNXql4guS7o
         F8oTjnsaCLDNi0pSxzMiO2eGOddZD+jR7+9ovwmDG8eRjg+GXvbCrpySCBQfuepWp32D
         i/gBFpvbnMNCMq0et+p2liJG0idqqHBQWI9oJjQc/QC/RXYFFW0kuGUYuRlIo6v609wO
         dOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882628; x=1789487428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ocf33sKaJ9kuq7ndSPCdhJoezpQyYrKkiYm5HN0yF7Y=;
        b=mK2+vQjSY6KIaM0SNoa1rPhnRmlm/ujKUGEF8MytzeCxzM7kNZUIj/W6WwA3jKYLQi
         eWBeVtZ4C//TCBjYK5CJNyhKNfS33zs+UzSik20D34qU2aX8wMlD8P6V1/KRK3Aicrj5
         OGGQAr3EyLwUWjwQBSoJJ0elcpNezP9aWdiJmIMUxbeT7fx95cL1OxWxU+3L7kHATjwH
         0/mZJqELyp6rmIRalz/vjDC0grkpDrpF7Cjz+9jh5e+P6Yktg9SICuuXcxp46QRsGvw1
         TZ/3eLWMmrFXNh5WvRMstvmpYwuDMXKQ8ZYPpSzedM9Q1q79ADjEVlkGln3XauQjZA+m
         sO9A==
X-Forwarded-Encrypted: i=1; AKwUvBzTD9Fe3Lm4NWy9xh3R+HM1xwv7RGF/3VzSW1nJn2fO1niTRQ//gNJljo35ToUKVqifHnrCN76HAC1bOW8=@vger.kernel.org
X-Gm-Message-State: AFuF++lwAXeBybKBZa/ZMG8twsUOTJuELicacgRM81S4uIEH0d/hMnPH
	tphbU5o38tb3KaqVJdyDa27ItsHQWCGVLkhvBzpZbkINshnLpxaGFF0TQ9WI1+Hh5u8=
X-Gm-Gg: AYBFou23PLNja3a8gsjYHDgvOPTwH9uyf7o9SE88LIqtyeK4+PLHSJ0icEJe9yMJyTw
	rrEw38nXY1H1kZxz4Ey8MuKe+OXWRrdQBmr4Xsk172joz7VPv6YthA2Lrv9sf5Ij5hTm8Uq2OGf
	Fh5/el4iE6uopaxzqjm7o48Q4AXUn6Uw5CPbq3hpnCyWGrvRzPe+2fXFAhCbq8npWk7d1sNjPWg
	zI8kZKB7FqxCb8FQ8ivrnYJ4C4vP/wkZVvlOoEwVFB234GqlMAXRgIMWO8bMy9C4pfTX3n+yMKb
	mj0FychVwwgjnrCyjc9UgwZJ04Z7IgfL4YPzTJGz8mPRRoN6AGRvrCX1/M6jHCGv36xIAgmU9r/
	ViBWTpCj5xs5oNtjCqaSfUWXbIr8DRuqRswJTIT6OSySmql/nBZRJAM35Ag33/mBmW0l0KZCqYD
	42fDOz03KOTneD7sOuYPzYxPgOO+rg5fwnGreneNFEKEezU4PSPg==
X-Received: by 2002:a05:600c:8b29:b0:49c:ee22:364c with SMTP id 5b1f17b1804b1-49cf824743cmr303896025e9.9.1788882627905;
        Tue, 08 Sep 2026 08:50:27 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bf3f0sm40869652f8f.33.2026.09.08.08.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:50:27 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v6 0/2] net: fix a stale phylink PHY pointer and a lost PHY interrupt
Date: Tue,  8 Sep 2026 15:50:23 +0000
Message-ID: <20260908155025.4155289-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes on the same path: a PHY whose driver is a module on a rootfs
that is not mounted when the MAC probes.

Patch 1 clears a stale pl->phydev when bringup fails after recording it,
so a later disconnect cannot detach the same PHY twice. Unchanged since
v3, where it got a Reviewed-by.

Patch 2 gives back the interrupt phy_probe() replaced with PHY_POLL. v5
kept the number in a new struct phy_device field. Andrew asked for
mdiobus->irq[] to be the source of truth instead, so v6 reads it from
there and the field is gone; the patch is now four lines of logic and no
new state.

That leaves buses whose driver writes only phydev->irq and never the
table. On those the table holds PHY_POLL and there is nothing to give
back, so the fix does not reach them. Three are in that position:
lan78xx and smsc95xx, which Andrew named, and sxgbe_mdio, which writes
its own irqlist and the phydev but not the bus. Converting them is their
maintainers' call and I have left them alone here rather than send a
series across four subsystems; say the word and they follow.

Measured on an MT7981B board, an MT7531 switch port with an Airoha
EN8811H whose driver is a module. The generic driver binds first, and
the number is read out either side of the detach that releases it:

  with patch 2:     bound: irq -1   after detach: irq 15
  without patch 2:  bound: irq -1   after detach: irq -1

-1 is PHY_POLL, 15 is what the device tree gives that PHY. The cycle
repeats once a second and every pass on both builds reads the same.
Reaching that state needs a kernel that lets the generic driver bind
where this board would normally refuse it, so both numbers come from a
modified poller; the patch under test is the only difference between the
two builds.

Previous posting:
https://lore.kernel.org/netdev/20260906174643.4107607-1-f@lex.la/

Aleksei Sviridkin (2):
  net: phylink: unwind the PHY binding when bringup fails late
  net: phy: restore the interrupt the bus gave a PHY

 drivers/net/phy/phy_device.c | 18 ++++++++++++++++++
 drivers/net/phy/phylink.c    | 29 ++++++++++++++++++++---------
 2 files changed, 38 insertions(+), 9 deletions(-)


base-commit: 38b6be101006d3e7af972999f45d4f1e8250587a
-- 
2.53.0

