Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CCA423A79
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790553464; cv=none; b=Akf3NtUTHADgOqmEapiF8KQyGCQJ2EB9iXcl0XT70LfoPmCxg5RWhRm/O9E76hEDsdbInvSnGWRCNLa71SQbbuJv261ghn50kobWzydgWqX2xdJb9nL+/naEhWOR+6mC9v8rFeU1Fmf6wNKHmTKHyXvxrRD5nHUs5VMJlUYXcqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790553464; c=relaxed/simple;
	bh=mEHiS5SvMXbrnxlzmCfYyk9kbhmV1UyR7+SzycBCwLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=STih8yHSEndrxr3K8jMTf50S1iwTmY9DyxcehSNiAEls8A0YwIWTuMXJskdvDaZZ23grpJDMH4i6vN6uMd0NPDombH8MKWrjCJAI3dxPGeuZsOccN7JezRnkeSw14R/NOgHHL7NLCDE2/9PkmgfK6lMofkwGYptY0M64q6pWetg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=MPVY45qv; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="MPVY45qv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so4550455e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790553459; x=1791158259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TlHPB1uz/oxBV+2XbguSNvsGzmXWhY1StfXAGE9Vfsg=;
        b=MPVY45qvzufiDLmW5msUC77ZTRTCXjMOIUtArXrTjNLUDIp4LfaUjP8pw+LMw0YM6h
         sM9q4shNpnVa2wXo3d0BEKMQDL7X0t4hJn+I69UgtuqYrWC6Cg8drS0Y1Tdr+aBNRaYu
         fY73VngtIc9/MowLpbGbq4iUR8IMiqNjVqPKWPQ2X9icE4bx3MMI9MfYV/bc5GDDa8O5
         c4S5GkGcX+D4J2Es7xObZGJYeaGAubAEh0SCFHKQQjMvrkfzyh27zKn2KjkqQQRd5Xhw
         ennEajIYm8oacA1hY/RVRerejBj1IO9PHBc4X0jPZHsf2GyAtYKv5yW+nxZ03NJJg01+
         WLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553459; x=1791158259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TlHPB1uz/oxBV+2XbguSNvsGzmXWhY1StfXAGE9Vfsg=;
        b=ClZiZZEAvr8NvA2uMTjyGA2i0KUD+86zMLi3H6A3/Ie1YU9X3Ey2/tqUG/R170lwW5
         fd4rD40qQHVl9JgzAWJKC8eDLpeXLjJzbukF1wxAPOcB5Iho2Rl5lpSrdAJynxPM21aq
         81yGMou0CR6gELdd/S5lJD2haxl22TZWEnMYuWtJK2GdAT9zSXuiQrllXenutujAH9vb
         ugjqO8yDxnN+Kr282NEXwy0C+V9RerqiBlLgynNX2SXmG1STHg3E5sJndvxuL1n8uRqS
         u6kXjj8xZzxQ4N0YQbKMGnx2c9riv3US8O4HMQqAJGyEKOFRNwxclcyzBeBmy5rNUmv1
         fE1Q==
X-Forwarded-Encrypted: i=1; AKwUvBywgcZACtw2CV2kpxCRB8sF18ZtXwQbv3t55U+ENcysPVebok8aUzhm7xf7F1FFoPTDgS7wTE/hzjwchC8=@vger.kernel.org
X-Gm-Message-State: AFuF++mAWnhH9HniV9lWsuwQKpzzicU4K69Z7srRAl4wVIYZLbM5edrL
	ugmIWk7DhMEEre9GD6wB36GIgGgUWe5StkqLdpcWAKPSXwkYEY46EcWj52HvGJ8o5tw=
X-Gm-Gg: AYBFou0Qz0ibbyV0ZtZQdJ4CO3NONopq6QRWvqy/POKegRjWmusTEXNY+htyc+/WjOb
	vXgupGuITdhSINKx7DIW1kCcJ6M1oy53rMjv9M5VGMd3izm/h30o+GHOwZUxcS3C3mQ/OXSNPdT
	ExfrXbpAvgKDRh6p5anrCh6jub2u8wpq0Sp3sy1Ung/7RrWqbo5qbFfmkM37p8jeov8xB/wYZf7
	jAf0R21FYjhmw4eMOCONNuR4xM+U9bRDv9+NLqkF/nI9+fdwsgaWRDXawq7nguiXhnGI3uapVno
	CoBM/g6TiGVJm2jJ0yi7XCSQedLVycN37qSQCbH983n+CUORYOSfL8RcL2ORucZer9lpNFAby+e
	c1iWYgHza8R35M9+sFq3MV5AMsL2So7272HvydzfSzeCbJ3tohXgwz6kLpET9QpDfLWWWafz4tm
	pMA4QWOeRAwtrpHo70dLgZS44phXl8wEVV3u7Bb1Kr0mEDQXip4jQ=
X-Received: by 2002:a05:600c:4705:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49fe66d03b6mr203820505e9.5.1790553459532;
        Sun, 27 Sep 2026 16:57:39 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017998dbsm137971495e9.14.2026.09.27.16.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 16:57:39 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	olteanv@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	steve.glendinning@shawell.net,
	f.fainelli@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v12 0/4] net: phy: keep a PHY interrupt across a generic bind cycle
Date: Mon, 28 Sep 2026 02:57:29 +0300
Message-ID: <20260927235733.2619081-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a Keenetic KN-1012 the EN8811H PHY behind lan4 has its driver as a
module on the root filesystem, so it binds to the generic driver first.
phy_probe() replaces its interrupt with PHY_POLL, and nothing puts it
back when the real driver takes over, so the PHY is polled for the rest
of the uptime.

Patches 1 and 2 put the lan78xx and smsc95xx PHY interrupts into the
MDIO bus table, so there is a number to restore for them too. Patch 3
restores the interrupt from that table in phy_detach(). Patch 4
restores it when the generic bind fails inside phy_attach_direct().

Not covered: a driver without interrupt support that is bound or
unbound through sysfs still leaves PHY_POLL behind. Removing the
substitution from phy_probe() would fix that too, and belongs in
net-next.

Patches 1 and 2 are compile-tested only; a Tested-by from someone with
a LAN78xx or LAN95xx device would help. Patch 4 touches lines that
patch 2 of the attach guard series [2] also changes, so whichever lands
second needs a trivial rebase.

Other drivers that write phydev->irq outside the bus table, checked
against net/main:
 - ixp4xx_eth, ax88796c and emac-mac force PHY_POLL themselves, and
   none of them attaches again after a detach without forcing it again.
 - stmmac and mlxbf_gige already write mdiobus->irq[] as well.
 - bcmasp and genet (for an internal PHY) and tsnep set
   PHY_MAC_INTERRUPT again after each connect, so a restore that
   overwrote it does not last. icplus sets it on every status read.
 - ucc_geth only reads the field.

The full changelog up to v11 is in the v11 cover [1].

Changes since v11 [1]:
 - Shorter commit messages for patches 3 and 4, and a shorter cover.
   No code change.
 - Reviewed-by from Andrew on patches 1 and 2.

[1] https://lore.kernel.org/r/20260926235024.705646-1-f@lex.la/
[2] https://lore.kernel.org/r/20260924215951.2127682-1-f@lex.la/

Aleksei Sviridkin (4):
  net: usb: lan78xx: register the PHY interrupt with the MDIO bus
  net: usb: smsc95xx: register the PHY interrupt with the MDIO bus
  net: phy: take the interrupt back from the bus on detach
  net: phy: restore the interrupt when the generic bind cycle fails

 drivers/net/phy/phy_device.c |  4 ++++
 drivers/net/usb/lan78xx.c    | 12 +++++-------
 drivers/net/usb/smsc95xx.c   |  6 ++++--
 3 files changed, 13 insertions(+), 9 deletions(-)


base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.53.0

