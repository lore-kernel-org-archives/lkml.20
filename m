Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559757;
	b=PHHhIKJv+gOPjntiOEDJs+r1b7CpvmmugpYjJmJYjFdtW7yeFHA++HflwZaOlbo0+q+l
	 qTKu67gyazvxkJUFrRvztY/zTwmR3k0jB/fkr7xVGEbElIT9CuPxnAR9hwOcg+2swRq3z
	 VkvFJYlnHTbNdmKvdB+w7SzcpCi6YhcfKiAd/vzGagasxyvcRSS3HDQy/NmskDjtr2LSk
	 4eAcJpOa3SQ/Whqru2mJH7aA/5+DsWeAVo/YSzq6e23uKEliqcbXtrKWz0uAUZ2lIBHRQ
	 a9laHQgXSQuJNLK9bWFTdLjx9gnt6C6QlkPvgWDbeGhw7T+2XPtoYW0ZT6iQg4EFIwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=QXnJ3F0cJh2FPK/O6i6bjfEGXgvxbjb5q9E73TUH7NY=;
	b=rn4FaSHbawMyDam30clrZJA2uHDfA27nLVrS7a4yO3BwZrGPXhXih06u3vL5JjRSixj8
	 XuMxlKjV2eE9j4xICcAWVME3hsUlAEcKqz0nccn0v78mlFd59X8RRKbgz1iPlMhNPxex7
	 B4hnLWICXvApz3/YoU/9lbyOTpx8PvKLtp7CZqF+Lp0msvIDFP8VrSLvY5JbIIScZ8Gcn
	 0W8kI926sq/3+RWAadD1OL5ISRNfHEHxKOqJq2yjUHIWYKEk7VqObcpuQ84mrl0HIey4n
	 WvysK36G3r/JcYwy2pe/du+p4Cwj9hg/QgrjnMMOrcsAp/F7f+EBpb4YItgASrglObA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qJSwRDwn;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BF5606A8BE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9BF5606A8BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qJSwRDwn
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-823e4047037so956701a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559756; x=1795164556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXnJ3F0cJh2FPK/O6i6bjfEGXgvxbjb5q9E73TUH7NY=;
        b=qJSwRDwnJozevxznlezum5QEPEjGaMnHQbJxXVdNkauF0Izd0zdZHMh1BEeCcU3INC
         e7Paz6N1dNiaqFe/SnYxEKJZliXk0S+DjvQxo/DsjSVhnM0gmo27hxROU4rSS9XiWBFN
         8ZwI+O+oVzH1sF5h4nUU+GP/60DHWYN+V3d9Ir0RgmylkqNSNHuw8AkZEv8sDZPCjkw7
         JA/RrppBY2w7VrLzS+QZMssgulA6XmrIJ4LTU7aldXeCtiH5Kjgr23WKLcAT6R/GyPr9
         K4IwUdFZdf4HaOydgFpllA1wL+rxivXE25DsOlLOpaTGbGcygeBFEqtKbyk1h/3j+qmO
         IvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559756; x=1795164556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXnJ3F0cJh2FPK/O6i6bjfEGXgvxbjb5q9E73TUH7NY=;
        b=rhQDxD3N+Sxo8ZsE+4XxfeCek/qO6xK374XZmGqtxabytLaDAHv4w4VPt1QqYDESaz
         CiY0Ny4SiaR2Bq6Bjp4/crHrEbn9cEwSQ9FL/pDkVRoXtuioF/zbjcNt0uojAKhtuq5Z
         2B3SJb7z9wZYOOYMp2DmdMeKsN7efWZOwxQDmEyF4dCJCu0hgjo4nIsTyXm+bJBaJ2PG
         RXIx/MJRGd0hbbpuxjx+Y2GMC4Iut0jddcqWIriZ7e9x99ZLtVlzm/qnI7c/LKw4SYSi
         lflp1WrL/n19DnCK+xW+dpxlTJvWx/QLjlgQ5NUb5EnDNphNs5x5VOd1n0vsp9JAemjS
         rFGw==
X-Forwarded-Encrypted: i=1; AL+hErG2hw+DtGNe5X4n53jwh6w6XwgyylyHk09N17GUjK/sbA2w6Z+SLnSMVM8p2opQkKFWVsND1E0WiQd+fZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MFsqRnYGdgo9yfQQNZqv0uqR8wn8KZtNqQT2RLAeh967WladA
	8AqB7fN8KEcPDpwiNpVT2Rv609w8atktbi7z4tiS8/qznLjOd1q4HJQS
X-Gm-Gg: AYBFou3BzMHP7Rlm94fzY6MH+18ZmvTqoEmO/tuVlinq7w5S0niS8tV+5XiGjWdEiDO
	JKHcKbprX5/h5+T2Sl+RRZh5jGMymo3Zoi5DC3++KxooxrPCZ8X3ckVllk1VS3t54b45npJTtqv
	nGS1/LCFWKp/Uf6SiPMOKuAuMlImVszIPDxRZbidUpsXsDUSpNR5Joz1AHrcewU6DQI2Z3Fr9Pq
	BY9iaa8fx55LavSRnpKXpGA/B72XeNmdWc4MUJaM4i0ionjSLE1UQ7YfzCTATXkPInr1asI/elY
	unThuXgTyvElnyK84rQY4dASTZnfkkVI6uwUDQDnmzX8HfdD6nsawFxvwaEJbCqfczm731M3hKH
	VryE4sVa4vO/GKBBO2huKl6NMYiBuJGrMe1lZW4sSaVdvcrb6Rgsl1ui675Keg30xx4MbRgYCoK
	ZiVq2GeQ62/FScjC+cjaQHPxUMkX0LZaroEV4nlUOSWDGp7nc7KYDtUZChbdMbgXcR52bYDxLQo
	faLbcj9+hCI67F/gEQTbyg8tmrif/nMj1tPRIyXjTb93X1L1tGn7VVtCkSd0NX4kWrg8O+RqwZc
	N6uR7NEUCdSnrRJN6RBeQWbFC5jf3D8002jrFaYdl1axi9Tlrd2skV7r3Tbw+ftOv7xaxgSB6Sq
	ZX9WRUaON9T+iHv6p+upIkBMJqNulAaAfqg6xGmoNVwhCKsJfOCctRynrbSqCNFNytXWeaYZuLc
	cn7skmHkAAOIzDNwxkwG/oWuTgSqQf6d3sOh2W6Cf/BXpCnP/f4v8=
X-Received: by 2002:a05:6830:915:b0:843:56a6:c881 with SMTP id 46e09a7af769-862898287c0mr2085688a34.8.1794559755689;
        Fri, 13 Nov 2026 00:49:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm2034202a34.22.2026.11.13.00.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:49:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 01:48:41 -0700
Subject: [PATCH net 2/4] net: phy: propagate MII register write errors
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
Message-Id: <20261113-submit-phy-mii-reset-v1-v1-2-02a55f352a91@gmail.com>
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

phy_mii_ioctl() ignores MDIO write failures and can report success after a
failed write. It also updates the cached link settings and may restart
auto-negotiation or reinitialize the PHY even though the requested write
failed.

Check the write result before updating the cached settings or invoking
those follow-up operations, and return the MDIO error to the caller.

Fixes: 00db8189d984 ("This patch adds a PHY Abstraction Layer to the Linux Kernel, enabling ethernet drivers to remain as ignorant as is reasonable of the connected PHY's design and operation details.")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phy.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index fce9bc7be330..4ac72a1b4f42 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -350,6 +350,15 @@ int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
 			prtad = mii_data->phy_id;
 			devad = mii_data->reg_num;
 		}
+
+		if (mdio_phy_id_is_c45(mii_data->phy_id))
+			ret = mdiobus_c45_write(phydev->mdio.bus, prtad, devad,
+						mii_data->reg_num, val);
+		else
+			ret = mdiobus_write(phydev->mdio.bus, prtad, devad, val);
+		if (ret < 0)
+			return ret;
+
 		if (prtad == phydev->mdio.addr) {
 			switch (devad) {
 			case MII_BMCR:
@@ -388,12 +397,6 @@ int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
 			}
 		}
 
-		if (mdio_phy_id_is_c45(mii_data->phy_id))
-			mdiobus_c45_write(phydev->mdio.bus, prtad, devad,
-					  mii_data->reg_num, val);
-		else
-			mdiobus_write(phydev->mdio.bus, prtad, devad, val);
-
 		if (prtad == phydev->mdio.addr &&
 		    devad == MII_BMCR &&
 		    val & BMCR_RESET)

-- 
2.53.0

