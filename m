Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559759;
	b=c0QImL7Z35Uwdyd+FedGeGlcCLpJRdOwCdxNsrvuYhgykM63uoNr3fWLjAupkwNmTTgI
	 /5NHw5bXzIpEGng9bjFFeHLCwcfF7okz/ckybNAa0lvWmwVbgDjsQQ3NY7KUjsSr1mcyg
	 Rj7H9rzpmAzIv2OqCAVaYryeNnB1jRJTAbVvpRR0tJ9O/uyOgFXZBtkoWdiudaLz8S+T1
	 xQfgFYwKN8jLGCdXnqqsjFRvJlbu0+GnAI3v23ezanrdMMCq01Lljgz/T+hIhTV3Ug99K
	 gkceDEWq8rzVIEN+0kofb8omNa6lOV/XpitqYPtejP/mUBMrY09PuGuXb4pdwLoOiLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=cFbMSFFnfKBUiAHD1MzzGaz+GKQc6wEXvQbNeHmYNps=;
	b=uYrUDJXUNoVwkIDRVP0Bfyfsvh2bqPWhb8VPA3HyV4NlEKyOY4ELEapVK82nE/J2O1Ys
	 ydPqqWWurg58MDyMF5RUgrePC5U768Jequ/xP9lwjKg11u114h/01iW46IXSBAxuQJHFT
	 BcLzrP24ZwvtEYKHt/5XTRY1ANcYSsjDQSTqMmAz31ocKKb9cJEHWPJ1NAx/MPltc9GLB
	 OCME/UgfJ1I41fl0FSpkubqEvs+3RwwZcQ3IjtqkBwZiHOYQ5bQ7CxtSqn2yVJRm1Xbkf
	 m+eQix7EkLLtvkLZkTWSHmFP2gq9JsUA2PHIhf6/bs1PtiicKQBN7q8ECEh30nvzu6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ac6sZwOc;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD6860A3808
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FD6860A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ac6sZwOc
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-499f20c7054so717421fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559758; x=1795164558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFbMSFFnfKBUiAHD1MzzGaz+GKQc6wEXvQbNeHmYNps=;
        b=ac6sZwOcrVoj5nwpklwQUYFFCVrRGiuRbsBHvbD/MSZ2oqacujlkOyLOsvpJo5qBYF
         8E+MGZTUSu2ReaD2UkVvWQ8vy7DRS0UmX1NYDlRjXopVXdWVv5WTjOUTIycos4W9w43A
         NzHgGWjyVIt5yZy81xdeF/pUVo9JVKvgUv2WmNHD6OIzMLKWh1I0uRdE9CsEnIpXbuus
         G94Fw1Fp+btDuhbm2KVhWMp/LbeXnMFqn1+U6plp/um34GWDPB81diG6mT9Yiwj4Z9fz
         tOqxUQeJClpsuyI5EyYcgtuVls5wTSI6Z28FoMlhEQ8V00eKCkpMYmlX6NUOO5n/yV2p
         boYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559758; x=1795164558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFbMSFFnfKBUiAHD1MzzGaz+GKQc6wEXvQbNeHmYNps=;
        b=d2Jj6uN2aAV+K0B8uLfY6I2pvXhi3kXJTrMkDqr2efF8WNU+mnOy8yq86HqpjtHIoS
         5jRIiXTbcM+nxe/tEsKfJPrUzT/RTrnuw9JdqbK7OAZrDc3AFZFdl/FoMUsVVoir7PZr
         lspZI3+ZoYU+bBMGMQE5rWsn3R+ufgUj4nF/aOALMZOkl0p5r8ujeYNL5i+spg8O6xD2
         7BYnvTi6elQQrocTm0p7F0fluCtPbZivz01W9r2CWWRkdtZAq7+ZWFFxQhIyrqRqSG5t
         r1yfE3+jindIcFYE6GnWe6eXMblYlWZBDxVaSH1j+5sHxX7EXlSGP/tlZzv28sc935fW
         g49Q==
X-Forwarded-Encrypted: i=1; AL+hErHrXTYQ5OapKWGmKepqPowhQSplfuJjeYaXtQ3VIfkrXrxJbF7iVQUI+KI4uemQyE43iOgE4Ikw1xdZXTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YxHsmWcH9ckjuH9pRCIMyUvy5cwEhkmgsi7i6rPZzHH0E38T3
	vj3/AEUQojJhMReEns8Jv2JuCIqLgK6Qh6gTJE4+eoZLe1RRMZFjDjW/
X-Gm-Gg: AYBFou2XilZ0HX392UFhuFhEZE6+YKs4PZjBny0wcNW+nehfsAvIkV0j8sveAiFVPAJ
	fE/rqWf4baACuUJcJu8aabDsekAf+jnYDMRiQLVAyxVi7i/7AHqoa4sX39wYQukabW2M/90YiFP
	m0tN3PqRRS54XKittVvxSskOMKcTXwyalqPlvKkvqMBZe/qXAYz8o/TZf6/nhqgCOxeHwTDHejb
	KCIUZYFF9nIg7VD3RrI0VtRHtKPAEtxELeEz9Kh6qzZGTSlwgHLYW2PnWZDlhjFUBYeeLsemUBR
	W20SZXA+eBxKfbVa1uE7C30ZaIzlWT2ji2f6Hp5b9oPk9kFfcwDkfzhMln1DzQ1nFZmw5/gXAjL
	3pFi0uo3pI8Gbf8RIZWNodd7pBV2aHi/tcJJ8L2RJs95WzijIsH+A77LTlkdtCIlvhejA6YtU5R
	4GeNc6zPiISyXpnJnntITRXjEvtiZbzqcGc4VkD7Sm9JN+ypF/LwrgTnyQd0lJBboSp3CBfy0Pm
	EMoRR5hz+DJ26qUxK6lKTqGRvUWkuUTjkMSjhOrSw0hOAcCSezSDLEpJg36ruJVYvTTwbM3yS7S
	IQ9KtfbP/68DI95Vm22MkWvm9GXA9pdYv4Zni8yDB202vpMWTL6rAg0tDpEDXjo2htCmxC4+PHN
	6J3h+QIagGYqFj2JXXxbS7uFkO1w8vNBBKHHpTL5X2PkZGC0mfLysIp38UQpn6zbEnVoYnVBCkV
	FKKfQEogzDRnNjvl4MphlbJCDhivOIQ33DnUM7r7/1V0qJoB8HFcRy
X-Received: by 2002:a05:6870:8102:b0:494:75ba:c6d2 with SMTP id 586e51a60fabf-4afdf287529mr2110921fac.13.1794559758352;
        Fri, 13 Nov 2026 00:49:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm2034202a34.22.2026.11.13.00.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:49:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 01:48:43 -0700
Subject: [PATCH net 4/4] net: phylink: reinitialize the PHY after an MII
 reset
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
Message-Id: <20261113-submit-phy-mii-reset-v1-v1-4-02a55f352a91@gmail.com>
References: <20261113-submit-phy-mii-reset-v1-v1-0-02a55f352a91@gmail.com>
In-Reply-To: <20261113-submit-phy-mii-reset-v1-v1-0-02a55f352a91@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Chan <michael.chan@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
 Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

phylink handles SIOCSMIIREG with a raw MDIO write, bypassing the reset
handling in phy_mii_ioctl(). A BMCR reset of the attached Clause 22 PHY
therefore clears hardware state without running the driver initialization
callbacks. The PHY worker continues using the old software state.

Delegate BMCR reset writes for the attached Clause 22 PHY to
phy_mii_ioctl(), which quiesces the PHY worker across reset completion and
driver initialization. Select this path in the register-write helper after
the Clause 45 cases, retaining raw access for the other register writes.

Fixes: 9525ae83959b ("phylink: add phylink infrastructure")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phylink.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e885da1c2831..2f0e3a30615c 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -3570,10 +3570,13 @@ static int phylink_phy_read(struct phylink *pl, unsigned int phy_id,
 	return mdiobus_read(pl->phydev->mdio.bus, phy_id, reg);
 }
 
-static int phylink_phy_write(struct phylink *pl, unsigned int phy_id,
-			     unsigned int reg, unsigned int val)
+static int phylink_phy_write(struct phylink *pl, struct ifreq *ifr)
 {
+	struct mii_ioctl_data *mii = if_mii(ifr);
 	struct phy_device *phydev = pl->phydev;
+	u16 phy_id = mii->phy_id;
+	u16 reg = mii->reg_num;
+	u16 val = mii->val_in;
 	int prtad, devad;
 
 	if (mdio_phy_id_is_c45(phy_id)) {
@@ -3608,6 +3611,10 @@ static int phylink_phy_write(struct phylink *pl, unsigned int phy_id,
 					 reg, val);
 	}
 
+	if (phy_id == phydev->mdio.addr && reg == MII_BMCR &&
+	    (val & BMCR_RESET))
+		return phy_mii_ioctl(phydev, ifr, SIOCSMIIREG);
+
 	return mdiobus_write(phydev->mdio.bus, phy_id, reg, val);
 }
 
@@ -3697,8 +3704,7 @@ int phylink_mii_ioctl(struct phylink *pl, struct ifreq *ifr, int cmd)
 			break;
 
 		case SIOCSMIIREG:
-			ret = phylink_phy_write(pl, mii->phy_id, mii->reg_num,
-						mii->val_in);
+			ret = phylink_phy_write(pl, ifr);
 			break;
 
 		default:

-- 
2.53.0

