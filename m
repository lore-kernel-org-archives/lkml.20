Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792899871;
	b=qHcNxXx5aefgXKxysnTgcu5FvgaN6jBWr8lROSELUpc9U6vgasvJB2BnguQhp1WBW6k7
	 +XLYgPWGSSr58jv0btZW4KBc/+YkXm0KY9OEZ4EkLebT/MJsJfahLA6vbPrHVFg/kdEzc
	 fU6aunYpuUI9B4vNMWvZODdOyWNPr9/g/p/9NkdKwV2EOVYeAS1ZZeqDZV9OSQtribkDq
	 LpNtgj8b5t9cLbs4BDwmRkSY78GBhk1z/6k1v4Ol8PptrCaSmR9L4aL0lnkcE+zVYqeBv
	 02ya95XOcOZyxkVEIhfnq3X6JcGvMRvEkjUXySkRMUF0e3H9nqAajsHeV9TikELVLHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792899871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nLhrdlfGEEQVpNXjJ/3dwvsD2HKNQITBUrA8qv3QdZs=;
	b=I50AcM0EI+IvGdCbn/xOKkSHdij/cVF6vNdMe9fVaIZgELhhrVY2vJY+DK9eW3cTig73
	 8i+ZRLE8CjTQIDiNXhxEmnffpiNUmr0cVtVzjzNIF0WNpvdyTzSFqCdPw+SSerxhS687q
	 OB5294eJk577F0IoTO6EH4Ca2D9LiGdrbWGxfc/7Qy2owECLqHU6rEDTfbblhBuw0ulUq
	 HE6M3gD15klWC0xzQsduzI6UWJjYpTzTd/MPaGoLFNyUe8fQyqumsv+YKfKikvGru/7eJ
	 WDjWPqvJtc46KVEGqZt2c4ofIdoJQcTC3S2iFW8PUwWLn7QMETPs5p4gdnmWSQqHfmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=CL7gqfoP;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C84C606A325
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C84C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=CL7gqfoP
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so896706a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1792899870; x=1793504670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLhrdlfGEEQVpNXjJ/3dwvsD2HKNQITBUrA8qv3QdZs=;
        b=CL7gqfoPzAf0tKBE0R1WzWUpkrnFaZ2UOXiQwKa0WMzt8aEPjF91xBjWat5xV5T+UV
         3xAT+B3LVuDLTuK1PC9dQfBryj+1VYqYqEu2VXv+RpbVcYOuoi038JF+BNpeqi2qNWoZ
         bDdKNZFypMWBgcZPIYeEMVdbIDuoBLmlEtobY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792899870; x=1793504670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nLhrdlfGEEQVpNXjJ/3dwvsD2HKNQITBUrA8qv3QdZs=;
        b=jT9U6RQuQFZH1TE+cUyqWZp7LwRPalFHIlI73aFqOdp36Zw0yh/pHR5qT0VeNQx1CA
         de6yddU+ITkcvLhhb9V+xZnO6XGxqdwIGTazYvc45TIAmEUaSSoEaY4kWMgcCqtGWDLh
         LXFIQFrJeO0mHQqRq1kIzOmnqQCtJEzsKHKGmKIVo6ve7kAecb1YKD+dJhV4Kyu+e0mC
         0TE/19AFmH4udrYX77xujUFbuMGudmVwF2Ywf6d3DtEsQHlDg65WPhFTAT8jATccO2Cm
         BH0Xc+aoNz0K8uaYy3Hf64ksCNEnHmRcz/O7DzJ9YMU8tLfHyGkjNZ9ASQXtB35lFwuv
         Aw5g==
X-Gm-Message-State: AFq9FYLdLEsl5qYBxgtp+S50qOc8J59HkW2ZLG+jnZu7y4hXjg2fY/l6
	gwK6Hff6kulQeAWgXbDjG/23huw9/mGityp1gAQCoIchYebNtqf994+82avwqkzc/yM=
X-Gm-Gg: AYBFou10rfJP1fENDdRICbjYkt29f0unGamE1H/w0v8unwoO/8nf0qEspYzYe0WJ774
	krewZqY9B5t4Mqn0pu4eB+2tf7NpQAinSs5ZU8lQ8TRxklU4uUCf+HHEvQPxjHksuGTAkDtpoX7
	H7v7McGhSI8hjGwfoeHoQHx6RORPpKkGWFqFn70tJzMMhVSl/Q/fS9c/tId/jyfZH7OoQ3XdNuN
	flCOeUzFvzz4Sb7Q445AkdcLnnY001uTBNiyfn+O5+FRqBWGawyixinEhqCP/unqkiMdfxp8DrV
	e5ogWNpRijw04Ld06p0WzxbF8tQEIOT68EpB11GKoYUJO1VziSRmO2x9FppmdySgjUC69BVSvvS
	aZmycjVhezTCHLiVUyeflZOhoOv5PMZrYryjbRp3CpNSxAD/bUGsCKiBcfNpXklc6x4bW1wWrcr
	v2dVL9fpst6NWU+3s08E6MMHx4UQRGz3vXxjtLZAyV6qd0c+Lh/yY5V9KuNx3/5ZLe1hDHEGTqV
	9suCb9BVXwW8lHI9xdG+mh3rXL5Tb7io3lp1/ptWsfUsCcHTPAleG6jLarbPyJwjB4JutPrEf6P
	RVmP8M2zJndphj6iRi8=
X-Received: by 2002:a17:90b:274a:b0:3ac:7874:639e with SMTP id 98e67ed59e1d1-3adeb0fbb29mr2728664a91.46.1792899870088;
        Sat, 24 Oct 2026 20:44:30 -0700 (PDT)
Received: from shiro (p1469046-ipxg00b01sizuokaden.shizuoka.ocn.ne.jp. [153.223.97.46])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm4181927a91.8.2026.10.24.20.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:44:29 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	dlemoal@kernel.org,
	cassel@kernel.org,
	linux-sh@vger.kernel.org,
	linux-ide@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>,
	Florian Fuchs <fuchsfl@gmail.com>
Subject: [PATCH v2 1/2] ata: pata_artop: read the ATP865 mode register through pci_iomap
Date: Sun, 25 Oct 2026 12:44:09 +0900
Message-ID: <20261025034410.808796-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025034410.808796-1-daniel@0x0f.com>
References: <20261025034410.808796-1-daniel@0x0f.com>
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

artop_init_one() probes the 6280's "fast" bit with inb() on the raw
start address of BAR 4.  That address is a PCI I/O address, which is
only a usable port number on platforms whose I/O port base maps PCI I/O
space one to one.  On an SH7751 LANDISK (identity io_port_base, PCI I/O
window at 0xfe240000) the resource starts at 0x1400 and inb(0x1400)
dereferences that address:

  BUG: unable to handle kernel paging request at 00001400
  PC is at artop_init_one+0x10e/0x170

Map the BAR with pci_iomap() and use ioread8(), as libata-sff does for
the BMDMA registers later on.

Tested-by: Florian Fuchs <fuchsfl@gmail.com> # on PX-EH40L (LANDISK HDL-U, ATP865 1191:0009 rev 10)
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/ata/pata_artop.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/ata/pata_artop.c b/drivers/ata/pata_artop.c
index 9f8d41639a62..7c5e778d19cc 100644
--- a/drivers/ata/pata_artop.c
+++ b/drivers/ata/pata_artop.c
@@ -390,6 +390,8 @@ static int artop_init_one (struct pci_dev *pdev, const struct pci_device_id *id)
 		.port_ops	= &artop6260_ops,
 	};
 	const struct ata_port_info *ppi[] = { NULL, NULL };
+	void __iomem *bmdma;
+	u8 cfg;
 	int rc;
 
 	ata_print_version_once(&pdev->dev, DRV_VERSION);
@@ -406,10 +408,17 @@ static int artop_init_one (struct pci_dev *pdev, const struct pci_device_id *id)
 		ppi[0] = &info_626x;
 		break;
 	case 2:		/* 6280 or 6280 + fast */
-		if (inb(pci_resource_start(pdev, 4)) & 0x10)
+		bmdma = pci_iomap(pdev, 4, 1);
+		if (!bmdma)
+			return -ENOMEM;
+
+		cfg = ioread8(bmdma);
+		if (cfg & 0x10)
 			ppi[0] = &info_628x_fast;
 		else
 			ppi[0] = &info_628x;
+
+		pci_iounmap(pdev, bmdma);
 		break;
 	}
 
-- 
2.55.0

