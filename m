Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864902;
	b=u0YSYjT1Pl7jyubM9vURSVqLU2jkQpmhXiNNvfyIuiZHpl+SMpE9bk8k6NYGbFyjk8FX
	 1ULkEMISLAX1XnyGgie/y5s5xrfTQyLYrtAa+jz1q0RMYl3vYVGB1Pw3jLfcctmUHtUWX
	 SnGM2bAg3o/WuKEI2TzGmaPhgOvLKq4rRrFnIQt23WouZciTC/y+UgpiD+4iAurUOo+Gm
	 2PuvZPND6mbUNcF2FcqaujIzlz/R4mC/wYyfXSCEP/hpshzP6nXL1o0tw0tIIlQdFvmdj
	 JOKuFa5QYms7BRNBCRJcEKWc+OomLPfyKMKT/c5jsl146BHzd+R0m9K6DKaBgVtJtcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864902;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=NAzwMQmbHMTyDl4Ls5F//Ccx/4nrGacZrVYBWG/Tmx4=;
	b=PXVgaB4Ce29NW/zBYbu7n2h1jSIo9exNobu1WzC/n2Fkv1XOpJrI8Q8XORQ0vZeEIVQg
	 IW/210JNmaapAPmYas5yDFuCGcUeGVresTmdf9zaccPbD4xOJ86PgvD4+aAuFeThICq4Q
	 0YLxG7tNKZS8IsPktNP8IdvPvU9z5BhBwAqCcCFhwH7Xpbpyq/eXwp5rrOXVyJ8pCbmwN
	 0m2EpYou+AcIIJsFGd1u/8BIcIQF3+aFpLUrnExtAbeV/kyrblzmuBSl5hs+xPaAUEkLc
	 HVlIGBqtpCXENAI0xfKR3gMocv+I0U50j7QNXU0ywu9BrCvd1dlfBlyYoKNCHPjL1iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=byyYiqJQ;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B50606A337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B50606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=byyYiqJQ
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so2306418a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:35:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864902; x=1795469702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NAzwMQmbHMTyDl4Ls5F//Ccx/4nrGacZrVYBWG/Tmx4=;
        b=wSb7yQjIbuhY6zpZ1tvuND2c2lPHPQ/5FrzFG1OWpgQ+hgimp5VcJTxXOM8DDZgyWl
         G0U2jFsIcvdZDx54eZOVWP/53sT9h96kB8maxhZ2s21UrMF0pNXlFefQ7VwudG1S2yzV
         +NFWHRSumllsXMn+Il9nvHnmbEFfS+4IKCBT56Nnv2vG025cHntnovCItWJw0us+7573
         5rl9vP0I9FwxzIx6OZckj1RZNyUYiPibUJHY//Jc8uaeuzgBRyNj2OjdV86eX3ol1gUh
         kUgCKGZiX7Wjf3oxrKNAJgRbAN1Xt1OTf5P+J5wJDjDrKiBT34+8dxk18B+i9UEbfDre
         qYOg==
X-Forwarded-Encrypted: i=1; AL+hErHN0iolgkeNibyXhjZU+Cqe8brgH8UVZ5rGjR0XjwxuPC2hBnhVlLaVPy7BNY5ZCu6/MRB0n58Jy/M93RU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ac0JijZf8EmzcKYXi/mV/sztksir96bOcMeBO2gol6/kKHm75
	egRryImDFdAac5vCMpBs48cjDjbhyzI5zrosryfkfszvEN40nLmNjfCC/3KDvBSclELFZ/obaQ6
	zmXN4gMVNeWxR8Wt93WsfTobJaNRHItbfHiamQYFrdgVS66m8gYSPrGiYPHCB7qGf9zoplP3iUI
	PTbJfvrnb5jU0P5FaiBdJ4SuqUxFNShQAZVw/Me3m+cam6um0X4mk6xqFfeWxvau/Uvg8Yql6pT
	zc6SC//r2H0e45JCNlLBgxZ
X-Gm-Gg: AZFdTZf+SFAQFoTYN5rq4WByOVPT16g2hTBXs4YX4XwfiBAarXbkE/qTlo1tkf1cjiP
	9GLxKbq1q6uiPPghfaNgSs2i3x4cbfGJbBJFgJURde2oMArYl1zTh8Fh/RdwRyk0f6av+LkJ7o5
	fSC44QLIMk5Fz4pQczOWxmoxZSLy+FZLj+xQ3FZu9QXFAVF9/d2Ah8p/rEMZ/cCwB6bVXkbpR6M
	26UU2JxRMWJHXsH6y5PvVT/9NJnw1XiYSZyqOQafx9SDGssLNUVp06C3GCOThAKywc65uMZqfkU
	K0G6rEO3KOiCMxju7WC6TSTYuufUyOeVeZEDT/jdw3AqmTQhwZ552xY05VslkkEqVSsKYaEPwOL
	UNGzBhuNcaPXW98kRsvGm6VepgVZmFm/M/g64/rSALI2VEHXUHsfSyIlfj9u6ajwtUBY+71kfoN
	EYIZOx18gHaXjKvTkKtm2Mq7Ybv8Umkdc9OBaAMqgf
X-Received: by 2002:a17:90a:e18c:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3b1b0ba4fe5mr11320557a91.67.1794864901549;
        Mon, 16 Nov 2026 13:35:01 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3fbf607sm5283994a91.4.2026.11.16.13.35.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:35:01 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55bc8181defso65602571cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794864900; x=1795469700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAzwMQmbHMTyDl4Ls5F//Ccx/4nrGacZrVYBWG/Tmx4=;
        b=byyYiqJQT9gMR6fHfTTmo6wOIBZb5xU/hT47SMAFSemEX3F+tSmEIZOx5pIG2MvT93
         ZrrHGNnQkF+pwvYTcTknbBwzkOSlrRjiVGYWaZvfkvea7sz0xGl41drmWCQHO1rAIeaB
         RRl06YiM1Ac2TaSEA4bzHwlFtPRNTAqfTpI9E=
X-Forwarded-Encrypted: i=1; AL+hErGkZGgXc2pawdHfP+DPvA7GqjUUc6/1Z3RRSOluvGD4STkzVhDG+I0aT5nJbfjFQH02vSSeY6flNGB8h0Q=@vger.kernel.org
X-Received: by 2002:a05:622a:1a8c:b0:55d:2d49:b5bf with SMTP id d75a77b69052e-55d2d49ce92mr111171061cf.68.1794864900144;
        Mon, 16 Nov 2026 13:35:00 -0800 (PST)
X-Received: by 2002:a05:622a:1a8c:b0:55d:2d49:b5bf with SMTP id d75a77b69052e-55d2d49ce92mr111170621cf.68.1794864899536;
        Mon, 16 Nov 2026 13:34:59 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d34a139f6sm40744171cf.22.2026.11.16.13.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:34:59 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Mlody12 mlody12 <kudzo51@gmail.com>
Subject: [PATCH net-next v2 1/4] net: phy: Map C45 probe read errors to -ENODEV during bus scan
Date: Mon, 16 Nov 2026 13:34:46 -0800
Message-Id: <20261116213449.1682731-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
References: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

get_phy_c22_id() maps a bus read error of -EIO or -ENODEV to -ENODEV, so
that mdiobus_scan_bus_c22() carries on with the next address when nothing
answers. get_phy_c45_ids() only does so for phy_c45_probe_present(); a
failed read of the devices in package registers is turned into -EIO, which
mdiobus_scan_bus_c45() treats as fatal and which makes the whole
__mdiobus_register() fail.

MDIO controllers that report a read from an empty address as a bus error
(e.g. MDIO_READ_FAIL on the UniMAC MDIO block) and that provide read_c45()
with unmasked addresses therefore cannot be registered: the C45 scan fails
on the first empty address.

Let get_phy_c45_devs_in_pkg() return the bus error and apply the same
mapping as get_phy_c22_id() to the two places that look for a device at an
address: the loop over the MMDs and the MMD 0 fallback. Errors from the
reads of the per-MMD identifiers, which only happen once a device has
answered, are still reported as -EIO.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/phy/phy_device.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b39e945cebd7..4071041e1051 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -780,7 +780,7 @@ static int phy_c45_probe_present(struct mii_bus *bus, int prtad, int devad)
  * Description: reads devices in package registers of a MMD at @dev_addr
  * from PHY at @addr on @bus.
  *
- * Returns: 0 on success, -EIO on failure.
+ * Returns: 0 on success, or the negative error code from the bus read.
  */
 static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
 				   u32 *devices_in_package)
@@ -789,17 +789,30 @@ static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
 
 	phy_reg = mdiobus_c45_read(bus, addr, dev_addr, MDIO_DEVS2);
 	if (phy_reg < 0)
-		return -EIO;
+		return phy_reg;
 	*devices_in_package = phy_reg << 16;
 
 	phy_reg = mdiobus_c45_read(bus, addr, dev_addr, MDIO_DEVS1);
 	if (phy_reg < 0)
-		return -EIO;
+		return phy_reg;
 	*devices_in_package |= phy_reg;
 
 	return 0;
 }
 
+/* get_phy_c45_probe_err - map a bus error seen while looking for a device.
+ * @err: negative error code returned by a bus read
+ *
+ * Like get_phy_c22_id(), report -ENODEV when the bus read failed with -EIO or
+ * -ENODEV, which is how a controller signals that nothing answered at this
+ * address, so that bus scanning carries on with the next address. Anything
+ * else is reported as -EIO.
+ */
+static int get_phy_c45_probe_err(int err)
+{
+	return (err == -EIO || err == -ENODEV) ? -ENODEV : -EIO;
+}
+
 /**
  * get_phy_c45_ids - reads the specified addr for its 802.3-c45 IDs.
  * @bus: the target MII bus
@@ -845,7 +858,8 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 		}
 		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, i, &devs_in_pkg);
 		if (phy_reg < 0)
-			return -EIO;
+			/* returning -ENODEV doesn't stop bus scanning */
+			return get_phy_c45_probe_err(phy_reg);
 	}
 
 	if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff) {
@@ -855,7 +869,7 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 		 */
 		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, 0, &devs_in_pkg);
 		if (phy_reg < 0)
-			return -EIO;
+			return get_phy_c45_probe_err(phy_reg);
 
 		/* no device there, let's get out of here */
 		if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff)
-- 
2.34.1

