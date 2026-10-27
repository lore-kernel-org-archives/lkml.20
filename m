Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140319;
	b=rt0EpXbf2gYema/jvpu99R8GVWN9Knvf3oH/wppxP7Ih+ZFqp8rDrBQfASdwwVJfCW3s
	 QpoD+H3dUsoZZdc4oQOdm0RwU3IFiyldMd1FBDcyguVaCDIsmm2ORsBvcyDR4o1Gg6lPT
	 yWmO5NGInEYILB48lBXfcH45EpRjsGOszREZJLtzOSABCzMmN6kAU7iTLEJTAzumxIFk4
	 6mmDmCiZ0R7SAh1wiQ29nx81t2Yj0CJZvjXVhc0vbAqwkEC61fqlk6/x3KrnzFVFtULgB
	 KmfgZVYlEbgeRxbWWXIczYkxu4G0LN3XoHswb/3aKi+ehuZTxHoHBxCmulONQ43zl+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N+PPpnOQxSZYwtu5QSb9+JP3bYXbtqNziMbHySC33BY=;
	b=qeLqLY0Btc0T32ct9KdmWvJmEiE6sH/fhlTysaxcdIazS1QGg9kNf5CG00cZn2L/C75L
	 k/RXqDJaN1vXEhgOo0M9RiMOsJCwV8sZU6MZe9Wskkyy5mivOs8GlvRysjdzfFjSaQguI
	 scGME0ChwiO50t0i2l9oBnAxUvNe95no3j02XnjoMfxkM5aZPE5oA3RR17weePDN5JJGN
	 DKoe8Q/OxltRcG3NxnzKfSCooMvfq+Ge7emcz5L/UE29MZ6KNnkFEPfNftEGfh6AZsXsr
	 4aDreM8jWkWFDTBdCkMJizWltSx/g/CQrgtA8tQurXH7MKuHE9GxWNddkGuFMCfrVfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tnh5+UAi;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948F6606A339
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 948F6606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tnh5+UAi
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-188406bb948so286286c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140319; x=1793745119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+PPpnOQxSZYwtu5QSb9+JP3bYXbtqNziMbHySC33BY=;
        b=tnh5+UAiqE5hbSR12IUGc/3SZ/hYoTA+p4lXS3Rl2dMCTFRJV5PFKgnl+CMyAYsfm2
         ySDOeOfrolTiyo29GYAz2H8erQEJEO6oyr1IWS2VMDaXsYeHXXpa+CsKj3KuJej7Zz5t
         GtZIJo+y0Ljo5FhtiLHKJxZfggPf7+VsOrX1ma37oiG3F7v8V9eBVcWFvB70CZsIfToZ
         VW+mtoRE/b9ofi9qq6ATgMWSH037xvUdZUlOCUV4VVDBwk91XUCsw7DHZvRBE8JiymvO
         zb4HNi3MyV4MA/o90oPyvXhBXLDF0LW8ucPjulgkwgCYQKrfHEQOgZ9OWxzEmxAn8aLw
         0BdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140319; x=1793745119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N+PPpnOQxSZYwtu5QSb9+JP3bYXbtqNziMbHySC33BY=;
        b=cNgWvXJPbiBsMcFyBYJSSDswzAaY5MmCL8G+XtCG+zpHckb7wrtabist5Pnm2FP9tB
         m8DJ7R0pOn99+i59bjwcH1myrd5+j2dVdLMTBZeHZ/RaTOz2kjWyW/3FEOVCiNTiaRny
         20zJyGpIusBFp3sLKvpujhED0+/D1UlogHQAyHBYtPxJhA2Yv+4sKT8VIPWIBTfqJzBL
         /tda3bvB+7HA9IrlXlvqHvb28DFdBUTIFIpb6/tEWSG9Ig3r07KMndIPdyOzKFmWzJXL
         ooNdiIkK2/8AKZ44pvV4Y0YH135UIs7nz9rN1dUCKs6JjVM7lGBufmZ/xg/MzNB7dg6N
         iuHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUPCKvST/PTBlW4N8eNjlsztBOKbTWcG+prCZYr0yAvWag0vLXZnoTYZNumKJn2DbPPbSOpIfs4fgXvN8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyOighsRXL9yP8NHrxcfuIucMuM/aGo9xCzAc8mIoaWW39wN1a
	B2c0FwKSUPmMwaTCV8HccFkTi4jBvBAmSnUnmCMhyAV2wjlsVuAzDfMF
X-Gm-Gg: AYBFou3PUtD4Bfcm0IXqzVFCKGR16HEnv/TEWxAJP69nr4limzSa+Er++voisIUhSP0
	5AcciNEPO3fCR056GLywX0GdOA+DWkpSZPZ3nC0tOkVa7HoBREh4updbC83dm1iQUji7tTNPZ9i
	XFKeF8Ve7ek6s4pqSCptz0VNMNENsWIKBa0jIAY8mAWLRl6S0LbgpM5NuGXbj/PYfXQap6Z63wZ
	CxVt/sqhO+BOvKVGqazxdO0yKGIi/oQUwNFLxGIgkT3mDEOWLBDkFyKanzYoY86lBPx3kAQ1udJ
	YlYKcv8sVeUyht7ajjioBVdKiR2z58Art9wuno94fO88Fwt4QqB0qruzD/r7/BAQ5GiX+pq4mvx
	8IZH/VcgSI4CGxahj06eo+HSNmMJvDYN4BhCNfWI/nW3sS7oRojE9scJDRTUThD7IUPBzm6iGjp
	cZOIXYGF2XnpJFH4dvEhlpYbAD99muD84UnCtKAPJoAHIVFARaH7YVjPPqZw3CKyeBQxkkRHYOK
	9BzqzW1sAh3k5TRIUejheILz8fbSinllDv8Uir01nWg41PTC34sF1AYtZ4BC9Ei+tT/DS5zNawx
	R73k0A==
X-Received: by 2002:a05:701b:2702:b0:149:1b5b:1f25 with SMTP id a92af1059eb24-1a6cd77f059mr627923c88.15.1793140318317;
        Tue, 27 Oct 2026 15:31:58 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d98c93d7sm1130735c88.13.2026.10.27.15.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:31:57 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Jeff Garzik <jeff@garzik.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net 03/11] net: au1000: disconnect the PHY before freeing the MDIO bus
Date: Tue, 27 Oct 2026 15:31:32 -0700
Message-ID: <20261027223140.3774570-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027223140.3774570-1-f.fainelli@gmail.com>
References: <20261027223140.3774570-1-f.fainelli@gmail.com>
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

Balance phy_connect() on probe failure and removal. Otherwise PHY
interrupts, device references and the attachment to the freed netdev
survive teardown. Disconnect before unregistering the bus while its MDIO
callbacks and MAC registers remain usable.

Fixes: 0638dec01e89 ("[PATCH] net: au1000_eth: PHY framework conversion")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 58bc8e1b539d..70319b432182 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -1287,6 +1287,8 @@ static int au1000_probe(struct platform_device *pdev)
 	return 0;
 
 err_out:
+	if (dev->phydev)
+		phy_disconnect(dev->phydev);
 	if (aup->mii_bus)
 		mdiobus_unregister(aup->mii_bus);
 
@@ -1334,6 +1336,8 @@ static void au1000_remove(struct platform_device *pdev)
 	struct resource *base, *macen;
 
 	unregister_netdev(dev);
+	if (dev->phydev)
+		phy_disconnect(dev->phydev);
 	mdiobus_unregister(aup->mii_bus);
 	mdiobus_free(aup->mii_bus);
 
-- 
2.53.0

