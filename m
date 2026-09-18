Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556FF3C819C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696249; cv=none; b=TQginVtsbEDO8pVhWkNlTBiYjybPaBA1YouaA9QBjwTP6bxh17FK33tAYzNluXeaoS/4gwXgiFL7SfBOpjmqiKMRxcvvRMeWMxRnl4NtSrLWu7ocBW40mDGcmb3emSvt+ATL1lQiLPThL3DZhNwyhoNFKfy+HKangBituFotp+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696249; c=relaxed/simple;
	bh=RVGN8hzTYET+YVR10seErUDioE6Go3OGl3hghfGt/to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYiz6Tp5gu9fRX+nZ8dJoJZL9WYG5dE8pE7m9zZTDVgc4L6BU5yvmXh0ZYqpusTOu2ZlCRYr3wvlyfYJ56u34yONdK33nrqtzhRcGCjrjPWsq6qscHuN3iEerJkv7krxyeKfYD+X6EVUCl3SKQK6O5zUbWLdAr98gudWiex2CB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Ap2oGuPE; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Ap2oGuPE"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso2349055e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789696236; x=1790301036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q158t0WkzY9BaWR+kDYunaW5YNuuwcBnK9ppmpGR5hY=;
        b=Ap2oGuPEDn85SG9pzCZymxuQCjqZWsy2efRxuW5htb0U5TlG4rgLi7u0l8NfybLjHw
         g/fqXmsvk4vOaX8joaiFk1xPIQUV4gaF1kOCDZudfotfufIzehZnhKJdb3TmkykjUCU7
         M9s/AiI84wc+t9iE3ARVYnKwKHpHhv0IFCCkB/7uREG86IwKp3Yl9Z+u2viRYs2PKjsO
         jut3CcWGeRERCceKuEBd+gJ2G/nk1xZuiSrCEehqkl28TdgjzGJQF7AmoG1xhliggaCL
         GZt4x3y+njiF2JCy79lbNCrNSC4VeQtmvFEC44rdS3MsO1MPRF7Lu+vkPr5gy9PwV208
         qbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789696236; x=1790301036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q158t0WkzY9BaWR+kDYunaW5YNuuwcBnK9ppmpGR5hY=;
        b=N74gPROd3JJsg81L9SxjrYWOOgw1gFR1LloZ5gcowQDg9eCZdoQHeTWTabWKknxrZ3
         bGqPyAfbtkQ0ZfEJwIiAiQUQN/CY6I2WQaOxdh42gxfkLFyZ/ESq72NDJjMWOn9skDiV
         VkCjy48P6H+gdh+VSMnR2sV3Z2W7h81j6XWNiNik3YWPHzl130JjLETJULuYOpxuLxw1
         4YjL+W1E3htiQW3tCowE4CPHsJUt3dUhdywGcrcvM6IJAjN1RPogu5OQglxml2ujzON1
         Kuxl0Bfj8zCNZFWCiJ3HxA/Ahn2f6+OraM7WHqSlC8iYASX3sQVAbkQWKXmv/s4ih1rA
         zfgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcIsOCS8ZIuYoMVpQ7zMEgzRaaDkXhqxVexzVGDvzFidUPrgN4gktY74FBgMfEAwG+QsK6sTbflt/0Xlc=@vger.kernel.org
X-Gm-Message-State: AFuF++nbg6He6WkGXT88u8aW1uAeM0LhO9XS2LWe0PFQp4OuVL21mE30
	rneDUQmX3nMlHQ53GOTtOXvfUyhTNmaO1imAWDry8sBPZURq3MQiAB6qn8VC/fCMOGM=
X-Gm-Gg: AYBFou1jgwbj+QH9effU02qtwW6eutXT3u+QXezWdUQRq+CdIUsuJCk8gyfzo/sZzja
	09Le6sbA3fhU2S8k2Tl99EDG+k9HnMnNr0HA3c08fSvTtxFmo4MoPxfE8+yUFjKvQjFsslznWUU
	S+VLRsiupd1ynPXuQA3ev/J7xB0ObY5stZE7jrXgmu9QOi+DrVdMEhTBp6dFUSmEqAENLH8EKdu
	zINrGxkoqcgQ2Js+0vrDrnpryWxh38KjhWPMld6lYgzV+RVqgUVA7lzFIYOARIg+lXJgdb6EwGT
	ABGPFSfYOcStCB45RL3Ep0dgsMJo2BAY4jdTP37bn1u6YR1Hz/z+W1xJXma8/ro0pdzXSKTrv2/
	eEF79t/zgPl31m6ZSjIL4xWJ6RSza2nXMDtd2u27LptuGtmeJB194ZHjYJkxwjSNrQKK7RDBKtt
	R1AdhC0A7g4XR+Ah1cUSaykRFf6WbxFs1SMpJZ3wcQwBJaqTSavQ==
X-Received: by 2002:a05:600c:1c05:b0:49c:edfa:15a with SMTP id 5b1f17b1804b1-49fc56af038mr9801335e9.13.1789696236071;
        Thu, 17 Sep 2026 18:50:36 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200745b5sm64224f8f.26.2026.09.17.18.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:50:35 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	olteanv@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	steve.glendinning@shawell.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v8 3/4] net: phy: take the interrupt back from the bus on detach
Date: Fri, 18 Sep 2026 04:50:28 +0300
Message-ID: <20260918015029.2518425-4-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918015029.2518425-1-f@lex.la>
References: <20260918015029.2518425-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PHY whose own driver is a module on a filesystem that is not mounted
when the MAC probes gets the generic driver first. phy_probe() replaces
phydev->irq with PHY_POLL because that driver has no interrupt support,
nothing puts it back, and the PHY polls for the rest of the uptime once
its real driver takes over.

Take the number back in phy_detach(), from mdiobus->irq[], which is
where phy_device_create() seeded phydev->irq from and where the bus that
described the interrupt still holds it.

Do it before device_release_driver() rather than after. That call
returns with the mdio device bindable and the device lock dropped, so
from then on a phy_probe() on another CPU is the other writer of this
field. Ahead of it the generic driver is still bound, and a driver
registering meanwhile is turned away with -EBUSY before it can reach
phy_probe().

Fixes: 00db8189d984 ("This patch adds a PHY Abstraction Layer to the Linux Kernel, enabling ethernet drivers to remain as ignorant as is reasonable of the connected PHY's design and operation details.")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    Found and measured on an MT7981B board with an MT7531 switch and an Airoha
    EN8811H behind lan4, whose interrupt the devicetree describes and whose
    driver is a module.
    
    The one condition arranged for the run is that the PHY driver module loads
    after the root filesystem rather than from the early boot list this
    distribution normally puts it in. The distribution's own late-PHY handling
    was also removed, that being the one patch which could have changed the
    outcome; upstream has nothing like it. The kernel is still a distribution
    one and its remaining patches to phylink and phy_device do run on these
    paths - none of them writes phydev->irq.
    
    DSA then sets the port up at 1.87 s, the generic driver is bound by hand,
    phy_probe() replaces the interrupt with PHY_POLL, and phylink rejects
    2500base-x against it:
    
      lan4 (uninitialized): validation of 2500base-x ... failed: -EINVAL
      lan4 (uninitialized): failed to connect to PHY: -EINVAL
    
    The real driver arrives between 13.4 and 13.6 s depending on the boot, and
    binds. phydev->irq then reads -1 without this patch and 15 with it, 15
    being what the devicetree gave that PHY. The three switch ports alongside
    read 79, 80 and 81 in both runs, so the reading distinguishes rather than
    printing one answer. The field has no sysfs attribute of its own, so it was
    read with a debug-only module parameter that walks the MDIO bus and prints
    it.

 drivers/net/phy/phy_device.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 94b2e85e00a3..8e6b399f95d6 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1959,6 +1959,9 @@ void phy_detach(struct phy_device *phydev)
 	if (phydev->mdio.dev.driver)
 		module_put(phydev->mdio.dev.driver->owner);
 
+	/* The release below can hand this field to a probe on another CPU. */
+	phydev->irq = phydev->mdio.bus->irq[phydev->mdio.addr];
+
 	/* If the device had no specific driver before (i.e. - it
 	 * was using the generic driver), we unbind the device
 	 * from the generic driver so that there's a chance a
-- 
2.53.0

