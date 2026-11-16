Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842872;
	b=ReV47K7A+EqqOLTx1B3Xln93caulnhFyuATMEtrz00I91l4dXP1CSB+Wk8UUZNe4pIOu
	 Vo06KAllu4r12tNdlXJCPO+P/UnIsk2VpA+fGX1O9i1at78DMC49e24TJqF86rz98KoFI
	 debg03a9TpsxZwZUn3frB2V62Of98bKpGy2R1IBN+WX6m6UpR4AcM8XgU8Vuqfum5dJDq
	 gtrPmck1bOAgC1Aq4WD1C14uaoqLuXDNZUaVfge8UXKEp53kxdes5KlZk15Jj/NBN+5Ho
	 w+NwPJ1RkrDwfVlivHMk9iuTTATe7pr5KYnPHGssaZLsmK9OMZiYEPq7gL4BIlkVkWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842872;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Last-TLS-Session-Version;
	bh=Tl1tvo+aD/+N0bJ0XttVLLERYj+6FR16jlZoMJtWmzY=;
	b=BTnFGxuv9bBdFJfFC6VevBL4WXbiUvFFpl/gK7rpxyOf+YQyYGLPoLF2uy7SYqqvDIFd
	 2KG/erelJLF7wPV9VyHL5oVI6fiwvZVy1OlFrF930BonTNd/R51D++oyEzxPGFqChRNo4
	 HAV5bhRZ+tENls01YiTs76vqZUyfaOKnKWTTUdvMI+up9Hph/QDotz6AnyS1roXWbR5se
	 JD/muS9uALGtgsrFDczqUs+gkEECnmmiDCSVR1N0TRwur2vTAUD3SpRvQpakYGU3qbyvd
	 JKxez/gtB2nL/YC8AUSJfUZM6jloeRvfp0UibQTVTcxyLEOM/pJ1KW8Q0OfwPOHB9Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NuaDisqv;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C7C606A329;
	Mon, 16 Nov 2026 15:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1C7C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NuaDisqv
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4758D4E41604;
	Mon, 16 Nov 2026 15:27:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 125476023F;
	Mon, 16 Nov 2026 15:27:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F07211BC0D9C;
	Mon, 16 Nov 2026 16:27:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794842869; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Tl1tvo+aD/+N0bJ0XttVLLERYj+6FR16jlZoMJtWmzY=;
	b=NuaDisqvYFXOInyBNUQ5AGNEstWQopDbwrnF7aaCCBTTGsLktWEtTrH6wd/kmiHofHdrE8
	Z69L4166ORacPvgMzMYDrhW0eT2yXcdLEuGJK7xxURJ8L7XrRAoNf0z6SMiMmWHabJ1HVy
	ldcyuiuFm/r+jp0xJaDTsOEFcBT5O0LSwEEaahJ4L/VXPd+Dv7Uw/0V6vLQlAcS0rfv4Sh
	qdH10tHM6kB1SPXgRfpQ2pDEYa9BJz0RboBaRDgsf8ztQ+drUqefW4m874x/4PZM2CX0av
	sDV4wDBGpN4ZOMLLb2dqLvJuhhG9Ei3K4ZghZmFyieXQofAS8o14WySUbplZug==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH net-next v2 0/4] net: phy: marvell: add RGMII-to-Copper
 mode configuration
Date: Mon, 16 Nov 2026 16:27:00 +0100
Message-Id: <20261116-marvell-phy-rgmii-v2-0-e04dca67e89a@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQ6CMBBEf8Xs2TVtVQRP/ofhALiFNdCStjYQw
 r9b8O7xZWbeLODJMXm4HxZwFNmzNQnU8QBNV5mWkF+JQQmVSSkKHCoXqe9x7GZ07cCMmajyWme
 yuOYK0m50pHnanU8wFNDQFKD8Jf5Tv6kJm3LrduyDdfN+H+W++PMUJQpMcXErSF+0PD9qa0PP5
 tTYAcp1Xb+CLvui0AAAAA==
X-Change-ID: 20261109-marvell-phy-rgmii-60a8bf619582
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842859; l=1441;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=OgWuZLIByAgyQTfWFiYfm6rUQx6C5Kh+XvPSfviYgvA=;
 b=qWlj1MhjKc+F4IhpjI1NnhjGPHQNBCAxtbMcgxURG+I5WuSnqvfZjSEwHoI45A89stCOc6LFY
 Zq6g+odzWPKA+aWUgguvGjyJwz+HW9u1b63JqIBN/CGPa9RyS0/esEm
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Hi,

This series add the configuration of the RGMII-to-Copper MAC interface
for Marvell 88E1510/88E1518/88E1512/88E1514 PHYs.

Patch #1, #2, #3 are cleanup commits.

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
Changes in v2:
- Reword patches to be more accurate.
- Added a patch to deduplicate the mode setting code in
  m88e1510_config_init(), as suggested by Marek.
- When setting RGMII system interface, avoid erasing existing mode that
  uses RGMII but a different media interface. This issue was raised by
  Sashiko.
- Added a patch to rework the EEE errata code by using
  phy_select_page() and phy_restore_page(), avoiding useless bus lock.
- Link to v1: https://patch.msgid.link/20261109-marvell-phy-rgmii-v1-0-026979ef4f13@bootlin.com

---
Paul Louvel (4):
      net: phy: marvell: move mode configuration into standalone function
      net: phy: marvell: de-duplicate mode initialization code
      net: phy: marvell: factor out EEE errata initialization
      net: phy: marvell: add RGMII-to-Copper mode configuration

 drivers/net/phy/marvell.c | 127 ++++++++++++++++++++++++++--------------------
 1 file changed, 71 insertions(+), 56 deletions(-)
---
base-commit: 7b6ab4dbc156e2f96419715130b3d5738a306c93
change-id: 20261109-marvell-phy-rgmii-60a8bf619582

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

