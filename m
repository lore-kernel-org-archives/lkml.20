Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C65E4A5C23
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859770; cv=none; b=FoCulMmNm7narDOpumzMpYIS8FytskxBBTfEM/+g7vvxIchSPdSIpa1KQLssIdgv1XVIoW6tH4b3cF1Z81GjYq6F6qeOAenAZhVojA7hYThKmJEC2mCwDkb7N8dqT5fGyeUJ6sNbCKxHA13eTwGaQQuRntMwp8EEJh+IYSyB5Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859770; c=relaxed/simple;
	bh=T2hRaWTZtnyeAyT/IqlJFITQYFUON1ACZ2n+rRMz/ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dlsKS8Q6oGZxk//bBnFUT0aAtPtxUFFKlV8T68j834XqCc5JpGf6Mt4StlKt4iGT/ICn8kiaYTpPijKznEKRWm2zhncwpjT+SDAa/ihAZ30mDig/XA0eRcotJRPZ1CEtODzWK0Ad2EkWZktzwY+ODL/L1CvluDXVuSKhJwfaoxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=TzgmVXsz; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="TzgmVXsz"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so40082325e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859767; x=1791464567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVNxhF07KcpW0FWzSzGhZUEHWjUDgCJiVaTXKv5li40=;
        b=TzgmVXsza83/QpXqXyM5TOnzr3AXUJQM5LVB7YJGLzfVOMn4x/iQAHBCCRoeO8nPQz
         oUtJFqPPptrULiGen5aIejS3ov23U1RxD9wh76qjhx5ROGIlamlZMZyHdQQh3HjBSFfB
         Q+R6hwu33wiZnm1RdEemouZT2POrfRBkOIbVQ+Xfy4cULfvg+V8luNv9DR5S4scVbR17
         OERl8239KKkw2GxZwpWmjLcnqaKj9NHWQ6veQRVzCzKBuE0sZPsIAxfbLdEm7xMHeghX
         WJ084i7TpB6R0ZuX+cOrp+IsxCu1VVFWk/03OKdaDY5hz/OT0qy6K52Ry37NMefT62ba
         BlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859767; x=1791464567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PVNxhF07KcpW0FWzSzGhZUEHWjUDgCJiVaTXKv5li40=;
        b=lYOeCtlOaFRKtuFWsalc50QGNf+eIVU4MlrZsBfOUVdFc0z1vFStghDrs9EIRsZPGq
         jxvVppQOOAhwMF+5MpEd6+orYt2aC4mAMixi1eaiF9ZYm22RI6R0ujVLHxWfEZ/rrjS7
         uaxS/W112nOI1V5AXVccZwryxS91OQfIasuZ3Gjl47Xi4zD40I22iIN5NT861NmXWHoz
         Fz2hTIHBTE45QycmzlQTz/hzj8aWH/lZrB2l43WjF/HOTQJM8K8T00D0EjP9pem6w/fR
         PLnM298RvlclEcOV4riDDcnCu/0/bZlxzuoqKOz9Lfl+97pYYlp1SE2Va3ki+p+IfwKR
         nP3A==
X-Forwarded-Encrypted: i=1; AKwUvBxUXfIMYac+BwpUZEA1zceTCnzmezyljqnw/BBrjhZVXf1Y7weuFvHoxfhqZXWPEiRtKiQnz3zUSUDWygw=@vger.kernel.org
X-Gm-Message-State: AFuF++mkJCoQOPPPzaijxwU/YHDCb/iErKQ0sof2seKB+a79/ch2LzvT
	YsoliA3m8ztARz+t8hTMtbxwBsfwzAkuxp1b0yL3i1RCcsrwqUEXN6nNycFOb33ugzlJTM8xcsd
	dR7TPWVAk/Q4cDrI=
X-Gm-Gg: AYBFou3AdI0iBz7ms4FXLN67gwrWUXBooeJbi65WE/C2lhr5Qmct5Ei85n58JaIkLuc
	DIluJvtBGcD1amgXCSk4vSBOF/8EA5q1ZhuS0S1aevvJEe4lbdvN4IKlPK0ntbBzBsnTUKQNpFy
	1NlYZFf3QVut96oJD2xb+/31ciAM8K3dVXRPQel7H3BqpFTfHGn60nZhyex8VWqMjAw7fL7sAqB
	EIPpi0+AeiuGIS/EhCDkwhT47lStS7IUkyB1N7bqdKqt7jCxbRoCZYVDxInVJwiAEWCJ2YoX6M6
	KtCc6Jv/a6vLoRm+dx62l3h9MxfQbcK9fc9lNBRCn0WtV6ShUjra8UtWPYFB4Uls9OPxEgNl4bl
	gmyfu3TlvMsDORwEy0nCFzyJTP0IZICYKu0Kqix59bWrrJ5NYRxXY9KdW0eW/50x3IsZ34b9WZB
	XpjvJdxwOqDNlbrr51DRM/J9UI/YRUHcP19L9E2nGw2maN6n1S/Q==
X-Received: by 2002:a05:600d:8648:20b0:49e:6249:268b with SMTP id 5b1f17b1804b1-4a01b12ec83mr56667755e9.32.1790859765929;
        Thu, 01 Oct 2026 06:02:45 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f913ecesm48051775e9.2.2026.10.01.06.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:02:44 -0700 (PDT)
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
Subject: [PATCH net v13 2/4] net: usb: smsc95xx: register the PHY interrupt with the MDIO bus
Date: Thu,  1 Oct 2026 16:02:34 +0300
Message-ID: <20261001130236.106059-3-f@lex.la>
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

Copy the number into the table entry of the PHY this driver found, and
into no other. With an external PHY phy_mask is 0, so other PHYs on the
bus keep polling. The address is known only after the scan, so the
write to phydev->irq stays.

Found going through the drivers that keep a PHY interrupt outside the
bus table, so that the restore on detach later in this series has a
number to hand back here as well.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    v13: write only the table entry of the PHY found by the scan, instead
    of every entry before registration. Andrew's Reviewed-by is dropped
    since the code changed.
    
    Compile-tested only; I have no LAN95xx device. No Fixes: tag, for the
    same reason as patch 1.

 drivers/net/usb/smsc95xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 42e4048b574b..130a460c1f54 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -1252,6 +1252,7 @@ static int smsc95xx_bind(struct usbnet *dev, struct usb_interface *intf)
 		goto unregister_mdio;
 	}
 
+	pdata->mdiobus->irq[pdata->phydev->mdio.addr] = phy_irq;
 	pdata->phydev->irq = phy_irq;
 	pdata->phydev->is_internal = pdata->is_internal_phy;
 
-- 
2.53.0

