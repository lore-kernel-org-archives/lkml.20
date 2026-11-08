Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172364;
	b=vkAX+x47OLxrZBlKo+oHkG70TEWcU8olqU5dlHnMkQr0+fq63aFgPb0mx2DpCkcozsuw
	 e71tRUkeVJzSFovXXV5TQ8OdpE2HWXtDdr7C4fRuKiFNua0X58azJ/ibla5p6HoRiYj2C
	 iPVk0hZ4V3evxzm6Cw4B3aXqfRW2NwAZwLgwSkk5+2PknL4bWe13ZVOEPWOvkOzAUH7DL
	 g9Vy/JK1UBMOguuJ7gP1X36B1iahmXxK9cq0eNeZ1QT4k47LSCTMn0JiBq0dx6XDtDLki
	 GXfmtYemjV7PVd6kl+BO/Soi6jmGvDvh5qK9RETOYoNrpR57b+0I2J1PZpzghn2SqDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=qlC9xsQzooMGZMAFZeEoUmEZJVGfQC5/v/wrYEO4uww=;
	b=f9qDap/8RpLdUQ1752KCmhLb91ZcpafBn5+qxZjaTPekGFHwAcKrN6MFQMiEwjVxkAyj
	 EGahfZZVeE+e50t1GCGqEzAkiGpqbeN6zBP/oC6tKMi1oV9PTDl3fdv+y9WMmZKHAJybN
	 td02OyaS/a/jmk7j+Hb92xC7x3EPSwtZDkYVva4jMn0P3GRPflcGzu3nE8nd5UIPSpU41
	 BReJCBQhpIqRt/akSwMJYOhVHgQFZXWhb7dwJK1mUhoQl36Iv/vyPQoG8VaNT6DpBvghg
	 4FY39PLewiNiNI1r8buCjfscEBDZHjQITokX6izZzQ1s/dYRV1w+Xmq4PsvN5XX2YZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvHBd2Wn;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C5C606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01C5C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvHBd2Wn
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-5326cdde017so59974b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172363; x=1794777163; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qlC9xsQzooMGZMAFZeEoUmEZJVGfQC5/v/wrYEO4uww=;
        b=zvHBd2WnZWXeDe9JkWAzywSWt7dKpPAcjChasIheOUl5zCg5ZT5G3xq4yAswh4TVaF
         mqyrpctY6l7Ezhi/rOn9jXmN2vNwjzZolobNFUkwcffXZWPI48vfD2fBz45bCfHi53fR
         bxQ41vDSAoQKvHyoTrQ3Bo8y6EwOvEwXKhzjgb8kTMC8/iU7GZqAHwcMfDTowrdbmY/V
         BKdXwzhtG9zgIYEw+IzFVmr0m+b9juTpSudTdxzfZftKyoUAj5VKrtqmsZWH+1Iu3JAz
         O/uePUGJhFPSzKMgzjfNoReZMKy3eMlbRprb5UJOqSvNzjOqL5zZtz47iX0BNs/x2Bn4
         l1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172363; x=1794777163;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qlC9xsQzooMGZMAFZeEoUmEZJVGfQC5/v/wrYEO4uww=;
        b=gguNfh3JHpW80h9vA7SMm7IgfcN1xPGjN5YbAiCIg4vxpaGG5SB2x5/2xDDxiPtxkK
         T0YXPydVysgcvFPqdP+j/dQFP6VeFojTr/qjpWkt7KWLJ4DsZrfIBg05G9KN9bWbMbZe
         SaeNztczqrkSxRgwmq+9AWkv7hNkTtsY1MAdJXa3ie2vMi8eMYQHqFzbXgnNRrljWFih
         ob491LRQxd6LujVOdBct08lU1+pX/BGqvuS5J5UBGZopNnJsur1rPSHMMvn4VHADZO2Z
         BvbYVf8kwsMoQ+UAQTKnTXy4ZlV85fREcJRh+K8McybOiRCQm0xQNAn0jQOTjjU6WmZW
         ipMQ==
X-Forwarded-Encrypted: i=1; AL+hErG89v3B0zEoJ8J9ZvPbLXTJ9ynt+1ON1AUZJ9fp9vJaxmUA8BBYMZ8zpdc5xe6qUR70C2BxriiNiOtd8+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6WHokWxKgKwxJEQDul+K6PKbIHSZeFax765WvZN0OVBiw4mcL
	mBiuh2TBW9XvFL+mv+DprfKPPi5qj+dCIHTgTwQ+kxx92ewLmuI/kf2c
X-Gm-Gg: AYBFou1LJ9WKDtqAwEJUeTufh8gFgHgeKX/mJ7E7TlggXkY0EbfSyMhCKgX9tgxP9Pr
	Ruh3QZf4lyHY8q457FmUUc6YWTEys2qBPsZh6c8sZy0b0h+FjzT0onEywaWnYjOYTi24nrRM5H+
	Qx3FnFg8RBkKIByiK6DHFLXLHhI56tVrgoeZNhMOr9F2jp4zyzIT8G1XTytbRK/f6Pk4vt62sV9
	YS4eLSclVtP3fzjwqbtMAbPERIYdK/8MyodN5YFW0DOduJUZtb3prZEHj9JLJ47VnadlcW4a1S8
	KXleY8cvaEXU7If9rFmBeBmOrb3D2hWXPxTIQnX+YmNsQOebq3kITLnHCAaov4H58PLArrFcklq
	PkwYAeGRUnYEEAAL1gI5BElK13Dy8RoeVc8hwOKDtP8MLPAn9zR+Rctme4NG38QHSdqErNlOIyB
	Zl3tBwAWWN0Qkz3Xgb/PoKJwZF1B7if/wkPUVaKAtDs/siP0ecSsa4+IIicaCAHA0+PrHm4DnM2
	xHWzMa64u4pVlTsOfO036xWVD3W0c+CWodFD2tScG1VlS6tFmrQprf2e3UHE5nex/V5zSfPk0/5
	IupnBR/xxequZ8mmKWh8AovWpCNkANey87+NcBmh9aXIrRaby4QGY5tcOYWT3HGSPVBku2ZDqa2
	wMHziRbedZBDB0sq1GbgROUq5DTWBY6aMYdj84e3+2XstHzosi5kzCMsHWotYySHwOP6HF19HYc
	NEZGst/HC4iQ/znLdpy9gsael9qs4iza3QM5iJ7a2+WQJFDPiHZ40=
X-Received: by 2002:a05:6808:2211:b0:551:eea6:9397 with SMTP id 5614622812f47-5681463f7b5mr1400461b6e.59.1794172362919;
        Sun, 08 Nov 2026 13:12:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac62d0sm2795191b6e.2.2026.11.08.13.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:12:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:12:39 -0700
Subject: [PATCH] mtd: take a reference when opening an unpartitioned master
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
Message-Id: <20261108-submit-mtd-master-open-reference-v1-v1-1-871aac8c6e05@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNSw7CMAxEr1JljUVTQYu4Cuoin4EaKWkVhwqp6
 t1J6MKLN/Y8b0qQGKLuzaYSVhaeYwF9apSbTHyB2BdWXdv1Wrc3ko8NnClkT8FIRqJ5QaSEJxK
 iA62ajLbDtffO4zKoYlrKlr//L4/x4KJ5w+WqrhfWCMgmE91Uo2I/1zla+/4Dh3SPI6cAAAA=
X-Change-ID: 20261108-submit-mtd-master-open-reference-v1-a1b756dcde47
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

CONFIG_MTD_PARTITIONED_MASTER controls whether a master is registered
alongside its partitions. Without that option, an unpartitioned device
is still registered as a master and can be opened directly.

__get_mtd_device() skips the master while walking the parent chain and
only takes its reference when CONFIG_MTD_PARTITIONED_MASTER is enabled.
A direct open therefore leaves the registration reference as the sole
reference. Unregistering the device releases its device-model and NVMEM
state while the handle remains open.

Take and release the master reference for direct opens as well. Retain
the existing behavior for partition handles whose master is not
registered. Decide from the original handle before walking the parent
chain so get and put use the same condition.

Fixes: 264725e35fbc ("mtd: Clean refcounting with MTD_PARTITIONED_MASTER")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..444615804236 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1330,6 +1330,7 @@ EXPORT_SYMBOL_GPL(get_mtd_device);
 int __get_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
+	bool master_ref = mtd == master || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER);
 	int err;
 
 	if (master->_get_device) {
@@ -1350,7 +1351,7 @@ int __get_mtd_device(struct mtd_info *mtd)
 		mtd = mtd->parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	if (master_ref)
 		kref_get(&master->refcnt);
 
 	return 0;
@@ -1435,6 +1436,7 @@ EXPORT_SYMBOL_GPL(put_mtd_device);
 void __put_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
+	bool master_ref = mtd == master || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER);
 
 	while (mtd) {
 		/* kref_put() can relese mtd, so keep a reference mtd->parent */
@@ -1445,7 +1447,7 @@ void __put_mtd_device(struct mtd_info *mtd)
 		mtd = parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	if (master_ref)
 		kref_put(&master->refcnt, mtd_device_release);
 
 	module_put(master->owner);

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261108-submit-mtd-master-open-reference-v1-a1b756dcde47

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

