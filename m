Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172255;
	b=RXMx9hcXq6le7zdsRykem+KTgGRvVuIrGCcPks5u2wKZqktLtvnKUjWBqA2xflUcdoYu
	 KGu8hpMHNxgFD2Y4vsEozV3Ci7Dr7Wjem8N5/SO8aVBzYXPJdSc7d6v4P6YE4349mJFWB
	 8sh38YXgW5hEeKqRc28cAMCyg+usX9VK0ZmT/D7Uv6Wrri5DYhF2pvqGUzzEUbhbCDKV0
	 kPH9e4B0kkV5EtV60ZApfGkDzKl3bTOxdmOF0h3I8RS0q6bAXzROVSx4tbN+gF4dQF97U
	 71o9jCJehsftrez0HFzRgqHzucBPIFPXItJNj0aEwzlyjbBnVNUzWUodYQdp/06nZHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=OXxfToL8LXg6Oh0k9HdrHfUTYtCfhx6snQVUGjyIGDI=;
	b=2L8+M2dwg4zhS5QlQOQvpn4CrFf9foieX+CHyrZHJXEmVy2hZJVhZU2hZglQyuypjbMq
	 D58HQ/lTsymXQOef8JglL/YgBEFSnTXkDRRyczp0/C+C9JsT4gWP8uPp9b6UUPgSOS790
	 +7r3H6ySpwFSdcgMUWrJeo7KtucLabAXfujkROaek6rR67tiOgKNQvCHRqDteMf6LoVOt
	 yAoVXwbeEq5mwVYLS3P3G8K1uHcdrT8K+dY1PW9oX+gTAHMlG+t9y/ScwclsPUASs9sY2
	 Ag9NCo8Pn6EFbDDJHqKk5rIVfzqII2PB4Ad+fJYSHFe1yhYqodFhpFZSBW7/eNZAlmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dk3SsZOI;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19AA606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B19AA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dk3SsZOI
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4c5d8c7f326so87862b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172253; x=1794777053; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OXxfToL8LXg6Oh0k9HdrHfUTYtCfhx6snQVUGjyIGDI=;
        b=Dk3SsZOIKs85kg7d95K5QD4UU43ip88qGA899d0e76NpFoeDCB/mHslKC7uKiWFoYZ
         BtHy91XJboCO9PQ+umLx0xOK38sxxf9fYH9Q7DdoGENv5rHPea31zoeSvZkFUMDwVJts
         eqwM6PJjojTRFNv6ZcKKusqUvAjeJdhzWrNylmWOXaL9iZIXbix0lWDzjx/EEZ0EYMH1
         8DoRgZxVa5sxEYpZ32/zmRD0h1ELN7Zrtksi46R8qxiFAYQmEjV2KQb9iSmYINfoW3V8
         E+JWEvKB1RxKVCdxvLLJbAUtR9PEYWKBz2EMedle6M3PWUtm1J+7fNKLh+obsBBO6m3G
         Ag/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172253; x=1794777053;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OXxfToL8LXg6Oh0k9HdrHfUTYtCfhx6snQVUGjyIGDI=;
        b=NAbjl20aHHyAKVCoB22jeakb8Hku0AJecr2Yec7X696Z7aafbkLm0GQUEKh43gMZDz
         mbwSayCyaZ/BprA+NpRqDM6HtnCfyiW/UNwsdGSH995BM10jp2n6i/UCC0WGWBI6g3pL
         iXAFNX2wj095oRBAhEQ5893Vl8a05Nu5ca0XzXhnpyEiPjykvB+BVYoGeQGOD1MD6zdS
         8IiGDsZ832QQFu1t+o2PqWZyHQ3GEwehp5xGseFd/VUKA8w2IvmnUcXF8Wpyceh4Xuhj
         5yXz/eNr6L/vL7sszX9U8AhPdk4PQnUioVsnZt/6tjlsTbMJzTQ7hfY80DxHtAMRaWx8
         x2oQ==
X-Forwarded-Encrypted: i=1; AL+hErHh/VWORSpuayZMwgCufHT43H5Hl+6wI9d73iga+I6tbR/co6iSHoqaKSyNQnespW0sdnovX9bx2ZVh6KA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pfMEi/A+GzpzsOMzmW6FcvgVqKRTJ7/IchjojMdablL3+WsCh
	9bvsMceUoL08bQ+mIW+QlF8UcNSI5xpmK6w17p7FyWtc8tB8G70cWCQ1
X-Gm-Gg: AYBFou18Az744hgKNLxsF2LRiAdokwriQooM3wVT7NRrYZKz4Vbq8KOSKOTnR/dL6vu
	rj0s7cfgcUUr5gomj0l55dISRMRHid4WuqA02YWCkDA6Z4cugYKNDWZZQTPueFu8h7p4TTCKmRb
	fqsN746fgoFdrlIHw61OkyjW7ptB8LfN/cnxLcze6MBd99jPCDpcPoIJP794HhdBDpVYUq2UHT6
	W3iHBXHh5L/0QwisjOSWhCL/TtEdFzAeWTfvKSk8FZtR/a+7WkJ3TfSDLM93xfQ/V2eRoO2zN2L
	tbbUjmvTwsEoFxQa6J73/4d1Boaw5HZzuRGm7YQik+UAjCsM+lyrCLgnado9F8R54veiFNmG8Qj
	bTi6PL1Tqd4mhRjx9cCYtgKkgFDG9BGO4DbyZEYXRGoGTsHvwcdlGBgwB+gOGdXTxSBI5kdSLg8
	LMpGgJRixxpKfDxiWoB6J1hNIecjZxQ5oAC0RLkn3V+xDhbzqBOhBaHn0CQLveDtMHM/gd5yilB
	JD108oGmZ+kL3s9C7LcULD12o5gVcQT9Sws6jGDkQp2G4VdPEaqFCxEDVdYTxX3zb4EF1n2eP+l
	UoeuniUJ0jZ2Ww7VxaV7qK7gkrkXKCmcv5b+9T3nIAjoXifnRKs6pU5NZUbcnOaUAdZYOw4ILlP
	LmyktrZUrKy34jLVcLhKIUJddMzPySvp52LtuomeHSeAcp1esaZ52y3DcXedrQ1SHVCia0ctug5
	pubg9KHI9Rv0TEsBGBPV3H4eGyYAcnOfdfH+Pc/1QDekYfNSUqhUZZKzY3A//m92hJgcg1RYm0
X-Received: by 2002:a05:6808:f13:b0:567:cbf5:bb96 with SMTP id 5614622812f47-568147067d9mr1423302b6e.44.1794172253510;
        Sun, 08 Nov 2026 13:10:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813db1b41sm2618100b6e.8.2026.11.08.13.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:10:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:10:40 -0700
Subject: [PATCH] mtd: retain the partition node reference across device
 registration
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
Message-Id: <20261108-submit-mtd-partition-node-reference-v1-v1-1-ad30359569d4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNSw6DMAxEr4KyrlVCf6JXqbpIwlBciYCcFFVC3
 L1OWXjxbM+b1SQII5l7tRrBwomnqGAPlQmDiy8Qd8qmqZurtfWN0sePnGnMHc1OMmcNUJw6kKC
 HIAbQYqltEfqAsz9drFHZrFf+/osez53V9EbIxV4+vEsgLy6Goay04FhmT23bD0+Pr+eqAAAA
X-Change-ID: 20261107-submit-mtd-partition-node-reference-v1-99ecfce4b351
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

mtd_check_of_node() obtains a child node reference while looking up a
partition, stores the node in the MTD device, and drops the reference.
add_mtd_device() only takes its own reference after the helper returns.
A concurrent dynamic DT removal can release the node in that gap.

Return a referenced node from the lookup helper and transfer that reference
to the MTD device. For an already supplied node, acquire the reference in
the same helper. The existing registration unwind and device release paths
remain responsible for putting it.

Fixes: ad9b10d1eaad ("mtd: core: introduce of support for dynamic partitions")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..f7fa895ede35 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -636,7 +636,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	return 0;
 }
 
-static void mtd_check_of_node(struct mtd_info *mtd)
+static struct device_node *mtd_find_of_node(struct mtd_info *mtd)
 {
 	struct device_node *partitions, *parent_dn, *mtd_dn = NULL;
 	const char *pname, *prefix = "partition-";
@@ -644,14 +644,14 @@ static void mtd_check_of_node(struct mtd_info *mtd)
 
 	/* Check if MTD already has a device node */
 	if (mtd_get_of_node(mtd))
-		return;
+		return of_node_get(mtd_get_of_node(mtd));
 
 	if (!mtd_is_partition(mtd))
-		return;
+		return NULL;
 
 	parent_dn = of_node_get(mtd_get_of_node(mtd->parent));
 	if (!parent_dn)
-		return;
+		return NULL;
 
 	if (mtd_is_partition(mtd->parent))
 		partitions = of_node_get(parent_dn);
@@ -679,16 +679,14 @@ static void mtd_check_of_node(struct mtd_info *mtd)
 
 		plen = strlen(pname) - offset;
 		if (plen == mtd_name_len &&
-		    !strncmp(mtd->name, pname + offset, plen)) {
-			mtd_set_of_node(mtd, mtd_dn);
-			of_node_put(mtd_dn);
+		    !strncmp(mtd->name, pname + offset, plen))
 			break;
-		}
 	}
 
 	of_node_put(partitions);
 exit_parent:
 	of_node_put(parent_dn);
+	return mtd_dn;
 }
 
 /**
@@ -805,8 +803,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	if (error)
 		goto fail_devname;
 	dev_set_drvdata(&mtd->dev, mtd);
-	mtd_check_of_node(mtd);
-	of_node_get(mtd_get_of_node(mtd));
+	mtd_set_of_node(mtd, mtd_find_of_node(mtd));
 	error = device_register(&mtd->dev);
 	if (error)
 		goto fail_added;

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261107-submit-mtd-partition-node-reference-v1-99ecfce4b351

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

