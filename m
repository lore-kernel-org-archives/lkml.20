Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794104418;
	b=FPdpWFLONAiLiQfvbl5xQBTr6+We96cXYHKdD0dZQLqmitGCmAkzUro0zJEEYEuL2RXm
	 WiTt+upp4b1BZok2QjwQBd35J9ugbZUjKTNJtr11UJrKwK+VtfjSM4hS5M/0psWX+/vGq
	 bAZFvjIYMnn2xlvCbxXX2TjvwmwFtr0g82AqtDzlJLvGEY9Zj+/ZFjCvvuKUOkaBo/X1R
	 BY3DjnKS2JZRs37NomEx+md7dMmvYkKQhkEKl9vK29aqFrafwA2G74GA9Ej8zAZfdRXLK
	 2+6/gI1oG+bDYKKJ1o5wqC+qGR1UhbKt4u9fMw20BOGfMGbEppsyRbEuDB80Xsv+B+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794104418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qOV57dKgZ6M1Pug8TSXqnl7cmjzsOLs4V2weSI1QSbo=;
	b=mT3948cB77BMCaE5gsZQeeD0NVm5JmrOasvf9yHjKIMJfPcT20D88J5SiZG3joATy7Vl
	 kk6WSH6Ij3EdyWJ5M6g/0I65eZrH2gG0g/m2JwBQ5d34oG0tK6MQtv64QGNaXSsPNPYH0
	 HQUX3jwZMtS5xxmxCQzrWGR4vG2eg+Ao6r2CrMFoU5RSKv0rJlZllp9CvnGd8VD84xelf
	 wQuU91TNDgJSmZPlnT5JWsvsKKMCGHk7b6vqDZuVSYzb1GSgQti9d41KRXe0LM/HzzSQI
	 hbz46o3G5AvFVVCiJ6pLRl2FM/PX3QKxPATz5YJNkSxWv9QYUbzj3h7qXH8AOmGC4oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b="fQbUDeX/";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1C7606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B1C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=fQbUDeX/
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b2513decc3so98399c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1794104417; x=1794709217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qOV57dKgZ6M1Pug8TSXqnl7cmjzsOLs4V2weSI1QSbo=;
        b=fQbUDeX/JuDye0jmaIkRNGPXXZTibA47MzP419dOjYHSaPpsakocteM2fJXrFjXJWS
         lwL9RntFbY+ZAzU2gt7RJAhZo14IJEniKVVNuH1qad7BbMpTLbDtc/YolP1DP6ZwhbyE
         9xyXSyXRPLvxEFCfIu5yvYLfgR3CXoWm2dcduMgxNfuL6qilt3XwhfR6XCUhutOQM5MG
         6OzVrnSFt5qBGavr7NcYCMhjMC21AhJfe2vHepxmprq4ptvsnRu/JvsILBgfX+pH83nh
         Z7D5xzQak1TLsxvnMfU30MD98GLEnBfYzvxpSwA5HpUkuai6QJFxu1K0HMqthKRM5xPq
         9nRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794104417; x=1794709217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOV57dKgZ6M1Pug8TSXqnl7cmjzsOLs4V2weSI1QSbo=;
        b=pEMK9385ZLPXFYXuIAja+wqjMsnpYug2DZbz+GhKLP6yXrS/NanPJ4g92ihqHPMRot
         pceBPSKDfCocP3YEdPjbcSHyWzxLSYLQ6E2d0YikjpLq9FPZcdrtH5NbUk50G532LVrJ
         Rp0YaOKpHTylInxjo5b7Pd6k1vO8W9Le8CqQbhQKVc5FxHtIYAxq29taTxjlSaZmvPL7
         ehgUT59wTumebh0Y6uj+hEmlzgbg8teN2ZTR4YfFDedIBPj/nOY/AYpqGbatFfwrtKxO
         u2eGXUliC33+XKTja+VraZy8FRXjdgy8DtAdyKf2Swz8hLqbOOBn04Pw2uMptgkJ1P8R
         bSww==
X-Forwarded-Encrypted: i=1; AKwUvBzyFZGGzxluXiQgM+ieWrUq/nQtACCQa2g6iTxiGdrXbZtwVukVmGw9+oolF7qiFdT4pbqj5EuwE828wsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QohB0PCNKatRnPSC5heHLgF6vutDGO6CUFc/9NevWcbPttTjr
	pgHz4UVQritPDRT0GKHbtoSnO6sM3W7ZRrhD4wCygXLwJkq6B2YusF0iHHxikYQkpA==
X-Gm-Gg: AYBFou0RtprlvOLbN6f9nz1epPEzzUHVPLsxYkn2S1XJa7xDQKxVFZaYg4NB8ZAVpFL
	jxq6q26tgoWzcIOyDT2SXRkZPyOSGRQEBpZqcp3oUzXgKzi9N3UetBDrdrS1ObR2sJ0t/HKomZA
	Wv19u+xmb/pvBKuK/TObl3/qFDMPPBhslxef4iMd7qfpD5Je0wPnZnlROVDJnA11ZeOKPp0LMsA
	PXsRjkDvcFKbDHS3upAxgv+zz+5DhP3lE4MlEmNW/exJV/kvw++PSFxnIzc55d7u99u55kbN6zz
	D2nWDDS9UpM6CDJfImvCifS0sLlqOJZxB1c2DuUdAtSKUFMm9PuajAIC7zsdMO5ME33DXHB2r1j
	qvYkw0y1CXqUmlSUkiUDwMvj3C3VIoLMedkttA7fwGkYRUDn+V1lSIxIXAAuWPxU+Ck8MAI7CFc
	7mhsxTQeOk9yVvlynbhQ5yxyXsx1wmOUns9cHiAgIh7rbHcG+IV9V5PVIWE3XHeEfEGUE4X4VMz
	feRjOr6uqEYxM+LeW6XbuSrm0Ep/P1WsQwNCHCIdTdEaJHTy53c5pf/CPE2ywBSr+XhS08Q2x1q
	m5aN9Q8BYLC7gfnFJK8TDHwD9g5whuRUtErt/CU/uhc4g/BmPHHFdU+vsiJHGkKG
X-Received: by 2002:a05:7022:2606:b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1b39fe301edmr686258c88.2.1794104416954;
        Sat, 07 Nov 2026 18:20:16 -0800 (PST)
Received: from mparker-home-xcrbr.sjc.aristanetworks.com ([74.123.28.17])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm2585693c88.6.2026.11.07.18.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:20:16 -0800 (PST)
From: Matthew Parker <mparker@arista.com>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Matthew Parker <mparker@arista.com>,
	Adam Calabrigo <adamc@arista.com>
Subject: [PATCH] mtd: spi-nor: gigadevice: Add support for GigaDevice GD25B512
Date: Sun,  8 Nov 2026 02:20:11 +0000
Message-ID: <20261108022011.898185-1-mparker@arista.com>
X-Mailer: git-send-email 2.51.0
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

Add support for the GigaDevice GD25B512 512Mbit (64 MiB) SPI NOR flash.

The chip exposes valid JESD216B SFDP tables including 4-byte address
instruction tables, from which geometry and opcodes are discovered.
Stateless 4-byte opcodes and status register locking are enabled. Read,
write, and erase functionality across the full memory array have been
tested on hardware.

Cc: stable@vger.kernel.org # v6.1+
Co-developed-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Matthew Parker <mparker@arista.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 6a2e6ebda148..de96cefde516 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -64,6 +64,10 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.id = SNOR_ID(0xc8, 0x40, 0x19),
 		.name = "gd25q256",
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
+	}, {
+		.id = SNOR_ID(0xc8, 0x47, 0x1a),
+		.flags = SPI_NOR_HAS_LOCK,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0xc8, 0x60, 0x16),
 		.name = "gd25lq32",
-- 
2.51.0

