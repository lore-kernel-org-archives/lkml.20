Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29DC4A5EC1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859766; cv=none; b=FhXXx/gqG5Ga6zoleaJvlVDAT7tJcXFRHyUm9j9+xdacpaXp/ovIoRO7x68Sa04v4J0h5BEBImVUO+8L7RSyT7qCS+Ow5YPtmnwbYZD0wd5kwaDEnSfZLfHK5LSKmZ2/41ugvKowlkt/gM4Qaplu0zKGukJzuw1lUkEcDJZDRGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859766; c=relaxed/simple;
	bh=hUC+pzcpmQjHzFf/Nom41aK/9H2XHKqy0HP6NNMiTzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IyhrdpOyIRuuw14YUX18DB+SvUbYvjYPpVsZB8S0Np9iU1M9WZygWR5lXBlTqhiS9QjhDPR+Cxq7QnjCOxp3gL/TM19EYuJvVeBXeBkha5F3JZl89YkJ74exjFmzc/RgahvHYhGWNx4cFwL6JGKvNNcKONXw/iXEpJWoZh8Xw9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=lE8mhbuI; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="lE8mhbuI"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso4303135e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859763; x=1791464563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k20Tt364Wd6rx8/375/z8mNMayOYbaxuxBDWEyWrxyc=;
        b=lE8mhbuIoVA2Fb1T1Y8w4mtZhAWr15cMJQqFv0jKZP608J12ImwXnoB+Yq14kVYj/k
         qE/PI6IoZydp3FMqxMKYHTpEu34PiBbLgIOj1bOWdK69jjXVpo064hbAQoc0J6Ncd8fZ
         8/K/tHfRPNbCDIqx+SKfalU6WvZO5KkyzZYgoeaDz6vgCcE0IDMCicV14ye1Z5LvOC25
         FYWO69sICGgQNJCyPtqarha2EZbe9rkgr6DPvZeiIRzY4awuHDyZMfV6DFC6wSoXoK/S
         H4uJxfFshwYPUZ+zYIn7M3vY8m7k8HqIv8WOUwyo03DbCFRVdsR8sDhQkuW9yVM1Xk6i
         NNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859763; x=1791464563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k20Tt364Wd6rx8/375/z8mNMayOYbaxuxBDWEyWrxyc=;
        b=ZtyTBl4HdpGb7ySUb9CI2RMK32mNm7eBwvSVR4IAPH5b8F3BCeY2vOhp8kBRj0R0mb
         LSHSWcQq3MRVU8eFDcm6V3SygPfl/6ovc6cZ/iY5mkUC/sgtKRsXTvDKOM0Atnbr2z9O
         0il59Z6Iwks8Rl1LGkKWgMZBl5OA8OqCLh1xhqQWct1bEU3+Hwm4QaGUEUpw2029b/rW
         W/rAP6Tcgx+GF3mR0/8Lhj3+9V4R+keSUL+s67SlnsppckD7d5XpwaJU1f7k8cCr07r3
         ULDaISOd/3ootuhCpF0rtC5w2AqVtMNG4+jmE8/dPAtAPMbO1lNDWeuhA7g1gx1YU1hy
         6xyw==
X-Forwarded-Encrypted: i=1; AKwUvBxm9Lv1yeUWfueQvaZ40oPwi7uKH5ZsFg/WLZtTDqnHmcQuDqEtzGFFBiHK2ro9ZujhQducXAmmd95Xxdc=@vger.kernel.org
X-Gm-Message-State: AFuF++mTUhYrbAUnE9lthEDC5P3NCY+vdpOy77FM4giRqKqVU5cpM7R/
	yeyPSxf4h2Sh4NfHUQvmkd172f89vM5CKSpf/WA3FoUWF75/+RmTYHMIGHP8N6C8gNM=
X-Gm-Gg: AYBFou39HKW0o7xP5+V7jHAWY1JQ4z6TArsqLghwUr/6B/fsnBTK4e7QgGJTz0VV7+E
	7BJDGezPf6b3Esse/RRNNYHE4Q755ti5yeRBHyyMG2K+cWb8rs+7hHZ6DxgyeXpsW9AfL3Tx9TY
	iSCF3JAmxDfRmGurR/pQNmZ7ip4MtxZ3fGRvnwFLT6vdqQeArRgEIY2eBraP9gmdI46uhzWeH71
	TsdYB/bQZRKlQLKNeWG25K0JccBosSAbsy84rSOZXv30jeI0fDH83a/G3DtrGCNUtK1OT3MEV7Q
	eJoO9kU72HoAT8MvMLNvOW/vmdt3H3pcmFBWovKdoPHW5WQ7A40ZcMkiVhBoJkLUYr7NZr4dzRA
	1ligaf4PWtfZ/l2xeFFDB130ixy7977OCXDIxQ0mpyE9SLza1GdR8n/OMrWofD8+NcQhZg16+jH
	qmj3LmOIGsVqelciSORhj1Jj+rRihIXnDZrRdoMXgL0BJ9UQ==
X-Received: by 2002:a05:600c:c162:b0:4a0:18bc:3b94 with SMTP id 5b1f17b1804b1-4a01affb798mr72771845e9.18.1790859762695;
        Thu, 01 Oct 2026 06:02:42 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f913ecesm48051775e9.2.2026.10.01.06.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:02:42 -0700 (PDT)
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
Subject: [PATCH net v13 1/4] net: usb: lan78xx: register the PHY interrupt with the MDIO bus
Date: Thu,  1 Oct 2026 16:02:33 +0300
Message-ID: <20261001130236.106059-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001130236.106059-1-f@lex.la>
References: <20261001130236.106059-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt this driver maps for its PHY is written only into
phydev->irq, while the bus table mdiobus->irq[] keeps reading PHY_POLL
for the same address. That table is where phylib records what the bus
described - phy_device_create() seeds phydev->irq from it - so the
number lives only as long as nothing else writes that one field.

Copy the number into the table entry of the PHY this driver attaches,
and into no other. The chip has one PHY interrupt, and on 7801
phy_mask is 0, so other PHYs on the bus keep what the bus gave them.
The address is known only after the scan, so the write to phydev->irq
stays.

Found going through the drivers that keep a PHY interrupt outside the
bus table, so that the restore on detach later in this series has a
number to hand back here as well.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    v13: write only the table entry of the attached PHY, after the scan,
    instead of every entry before registration. The driver's number again
    wins over a devicetree PHY interrupt, as it did before this series.
    Andrew's Reviewed-by is dropped since the code changed.
    
    The PHY_POLL branch is not reached: lan78xx_bind() fails earlier when
    the interrupt mapping cannot be created.
    
    Compile-tested only; I have no LAN78xx device. No Fixes: tag, since
    nothing reads the bus table back until patch 3.

 drivers/net/usb/lan78xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 5655941f1478..babd34cda374 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -2897,6 +2897,7 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
 		phydev->irq = dev->domain_data.phyirq;
 	else
 		phydev->irq = PHY_POLL;
+	dev->mdiobus->irq[phydev->mdio.addr] = phydev->irq;
 	netdev_dbg(dev->net, "phydev->irq = %d\n", phydev->irq);
 
 	ret = phylink_connect_phy(dev->phylink, phydev);
-- 
2.53.0

