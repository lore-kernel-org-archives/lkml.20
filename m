Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A823F4DCA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859764; cv=none; b=XGenSqpsJlu8mn0PHaSN5Zxu64pTp2jjhPNnFiiQkDDcP1bhzzHluY0HKmFJsS7mk648cc3eE5VtA3X65wXn8tpQGpCIYndFr9jUg90XhAJxaE7mmkQv7hNBlJ5CuOH1KXfP57N07uYxXCdVGdGGCnGAbVaufaMPc1lrrWnFqCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859764; c=relaxed/simple;
	bh=Cr9aXmGdHGi0d2CGE9ICTnF+nGv1yxcvXdUcAGzJ/sI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R4at23V0Uu5nqeYhCxykL6groredl6rvVl6eRkDZybMGrpOlSBGOXReZNeV5otWTr9Phq7e3Wb4/cWqw2vhChhEjMb9zLkmjAIyBDFB6t33Bb9TQeeAJ4brzyPvxszPv3MMpVyoAIG2KydsBdVvefojaHfDVDiqKTXdtrux7ygA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Egl1gmIz; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Egl1gmIz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso43224805e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859761; x=1791464561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4+v4CXxxuyPIvb+OG8OnbrIijN6oNxBYClvJhgYPdL0=;
        b=Egl1gmIzMJC/NIqtoY2l6MGC2k73x64xcwlj2Xe6O5Q4JzJ2x4ZfL2hPDRpVybIIaq
         8cJ5PwowGK1yzKYg2L0CNT0HvzGykeG2Li5fBD6Kgah0lTYT2A3S0D5wbz1GVtoUL5pc
         8Kj+YD5s3VplaqiwUXljG5m460yffQqAkWrMC9LffkmkUHZONIKnNZmV9qm02jOX5cq4
         18lfPMKwLh+y1ltN2Gv8YcapPUSnKznTAIXuiTy+8f9S7tDrYIo0qtOrxeasAlUlQC61
         HIznAAYWrWwuFwpNn6cLDxIrLAuUTVJf920mhtkEuGLcbAbWMUIQa3XM6Sb8UF8u44gu
         52mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859761; x=1791464561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4+v4CXxxuyPIvb+OG8OnbrIijN6oNxBYClvJhgYPdL0=;
        b=y017dbTvWnNNf1BEk48ifCtM5hkZHX7qxW+7lbFjWTyQ3/FNjIIyL0yT6nRLGOCfck
         yev/Ir+wam3BZZjIwJgRMbC0v5R6lzi5Q46nYUQbNPcsg3yE7p/kvrUI77/hQ6ba9Fg/
         cUr70Lem9pqE54lUk6mAhNr1Ude0Hr2M5Cof2NCX0sK3P3tn5xyVkjd+Acp8bsw7TBoK
         kgJls4V3+hLPawru6KlYL6/zZmGXB4siixvZ1Lv2r3MORdQt062scufgF4bM4E+c4tcm
         ypXuPApfX8uZQ473CEUyj8phAJ15nqljjIW25M1qLzXtX5Y96CMg7FNK6TjxMfm5nM8K
         c3Bw==
X-Forwarded-Encrypted: i=1; AKwUvBxWuRjWwsS0YNHbgGIAE6rhPJzBGrNe5FH+6zGVD8TzaNyoAUU/AjpHL54B4Kt1EO/yasF+bOlfFiN+DjE=@vger.kernel.org
X-Gm-Message-State: AFuF++m11HgAHMV7L4sGkF2RXzpZe7aCqeHVnOLlM2St/6Fam3lz1sqy
	r5UAOEgPyD+ySdH9BLIl+/1ZgZkssIYlqGj5YUOczBeHbdMYBTFu1R0t7+0a48C7gDc=
X-Gm-Gg: AYBFou2vl6QUyIRDkCZf73MRHjuS93UeHyPiRnFnfUS4iriI1sOfltIBAaMaZgUfVNM
	bVgIcraPJ+PgQuu+3/RfePOdkAhAU0eVFWTvscie/dlBz9CY+SQpY5zcYZTS56PbIyG0uihPTk0
	HWkwh2mjkHbm/jSLkk7zFa8u7L/81CUx7Wh9COhP5tHGYJMsfWNyi+euF5qJ+ciEHimntSBj+gs
	Gz1Zo9ST2vB5muucuN4EySR408YlPcA3s80H0fDPNJL7z9zN+xsa1G/JYPhG5u+ZZ4e6zHZGNkB
	NyzeXjHorrxBT8R6GLMX8Qszkr5wter6QnhIGuJBPZN8zEQE2q8gebJ1BYBRtDaAgCxlFeGZQbt
	s6DK5ZxxtRwAIlZAf7ong23VlGsCvlLnWQyvIlk68EhxzRd6XjWu8EhMjzJhUYieDU/OgAT7RrE
	uIcnkWC6X1ReTfkjbj0h9ZRyqe3z3tqq7/MwzHNQkwrJdPXDgPfKw=
X-Received: by 2002:a05:600c:4f8e:b0:49f:bd3c:bc18 with SMTP id 5b1f17b1804b1-4a01b00541bmr75269605e9.19.1790859760763;
        Thu, 01 Oct 2026 06:02:40 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f913ecesm48051775e9.2.2026.10.01.06.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:02:40 -0700 (PDT)
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
Subject: [PATCH net v13 0/4] net: phy: keep a PHY interrupt across a generic bind cycle
Date: Thu,  1 Oct 2026 16:02:32 +0300
Message-ID: <20261001130236.106059-1-f@lex.la>
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
MDIO bus table entry of the PHY each driver uses, so there is a number
to restore for them too. Patch 3 restores the interrupt from that table
in phy_detach(). Patch 4 restores it when the generic bind fails inside
phy_attach_direct().

Not covered: a driver without interrupt support that is bound or
unbound through sysfs still leaves PHY_POLL behind. Removing the
substitution from phy_probe() would fix that too, and belongs in
net-next.

Patches 1 and 2 are compile-tested only; a Tested-by from someone with
a LAN78xx or LAN95xx device would help. Patch 4 touches lines that
patch 2 of the attach guard series [3] also changes, so whichever lands
second needs a trivial rebase.

Other drivers that write phydev->irq outside the bus table, checked
against net/main:
 - ixp4xx_eth, ax88796c and emac-mac force PHY_POLL themselves, and
   none of them attaches again after a detach without forcing it again.
 - stmmac and mlxbf_gige already write mdiobus->irq[] as well.
 - bcmasp for an internal PHY, genet for an internal PHY before v5,
   and tsnep set PHY_MAC_INTERRUPT again after each connect, so a
   restore does not last. icplus sets it on every status read of a
   switch port.
 - sxgbe does it only from probed_phy_irq, which nothing in tree sets.
 - ucc_geth only reads the field.

Changes in v13 (since v12) [1]:
 - Patches 1 and 2 write only the table entry of the PHY the driver
   uses. v12 filled every entry, which gave the one interrupt to every
   PHY on a LAN7801 bus. Andrew's Reviewed-by is dropped from both.
 - Patches 3 and 4 touch only the PHY being detached or attached, and
   keep their code. Patch 4 stays separate: its Fixes: tag differs, and
   with patch 3 alone the failed bind behaves as it did before the
   series.

Older changelogs are in the v12 cover [1] and the v11 cover [2].

[1] https://lore.kernel.org/r/20260927235733.2619081-1-f@lex.la/
[2] https://lore.kernel.org/r/20260926235024.705646-1-f@lex.la/
[3] https://lore.kernel.org/r/20260924215951.2127682-1-f@lex.la/

Aleksei Sviridkin (4):
  net: usb: lan78xx: register the PHY interrupt with the MDIO bus
  net: usb: smsc95xx: register the PHY interrupt with the MDIO bus
  net: phy: take the interrupt back from the bus on detach
  net: phy: restore the interrupt when the generic bind cycle fails

 drivers/net/phy/phy_device.c | 4 ++++
 drivers/net/usb/lan78xx.c    | 1 +
 drivers/net/usb/smsc95xx.c   | 1 +
 3 files changed, 6 insertions(+)


base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.53.0

