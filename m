Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467643D4105
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792210481; cv=none; b=ZL7LyXU8b6RxwZEvOWH4EFUjqrAGhj+Lem8mKpMCIJ/i+nqDM9IGnxNpmqt0m4/oiW34vZMHSK8QQVzOOAhP2YitWFqfDQ6jRTFDqnPXWylImsMDIlU6WKVA9Gy2ZF7IuC8NYbtXPo1PXOu4aL/0PmMlOyVP/YMsjKnFuQ8nsHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792210481; c=relaxed/simple;
	bh=NqySz2E/JSZOr5SjYr43G9CD36sDZm2WAVtIjCeYOsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AF/kpoevRTAgWW/1udb8X0MwtoHIEf0qKcDPho1ab1r0TMluLfN0PX/ap0fCfF9TpFuXCHzQERq7J6KqmMZVYjtFJZtR6J0F4/x98OrWs+8bSoVH8S9xFwB1MqtuLjNtQEbvs5JBP70S81hYa78EyyUEzDGRm9vbtQqNO+VEvH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=bLq57M+F; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="bLq57M+F"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so392488a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1792210480; x=1792815280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpOuznd4WHUcHDSy+mj+fYIUFYiq9dGMf1wtGAT9+I4=;
        b=bLq57M+F0+ewhS6C2yWyBS+p6M12IleOPIOJzegIC/ig3XtfLaOBO6JqOEX15ySD6G
         hBmg/A/WiQQdl6WnJPEsGMRe7zzt+UrQpeDo4ZVNDrRHOwla2mHQD5h6rp/D/Fm0pTex
         9f7eObfh2+nLJ43PE1w2hhSnL0rJicbzPzJgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792210480; x=1792815280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MpOuznd4WHUcHDSy+mj+fYIUFYiq9dGMf1wtGAT9+I4=;
        b=zg7cc0oge/7rcUdIy285Idvu9B5gHZKNHpzYGOg23skXOybE6WyLl0YBV0Apk2U295
         n7kI3MZOpEoR+zdaueCWzx6zwYs002o9ixps4EKRd46PZp3Wu4RKRo6Q//j7fwCcvRhE
         Blzky7btQIMbZ9XGgCFfw0ba30tw9e7I0seV7D5t8gAMmnXru4dd6XZDEVT7rxPwpWkV
         mu1s4d/IHlk/erskWJC2IkS8GL7qRKuRjFfx46/7PGw9wClXsmZIBG/9nufQm6lb9Vm2
         BeIj3xwDh3a2/P95/wFCjq4lX+/uCPE9NGUDWLNC36qidb6rQtrL2QI5rEW2yXCc3xtq
         RWbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCTbxeMvOp4t4ze5Czk4Twz/kgApGnOAZYIkOtbVhyvPPlReiM+pWUfK37PDN/aPZYqzA2oEOmncSlTR0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhGjp+1aPALQ7PHcVsceJK5p7+4cjLdy6iSvgnpzuQrwXFygOT
	yYlqn566z3TPrGc0MK+mMgqjKakl+16p+AZbA7RhquKmRebObMgxDUgzdI7k/iXCG24=
X-Gm-Gg: AYBFou07kTmupXdeIbTDsP/R+yG8HlFwyKGYJOr0ehI7qTTO3W7oy16ObkYGbZ++DpH
	o+2oEMjeAC2sg2JhCfVCSupuBCCrNQK3cjLgtNFPv7Buzf6YGTShzM7Na/1QE/wmkPfb87A1gyX
	PEvJazZ1xuDSesjvDDwIbkHgCZFzWZbbU4PTVn+DyXlI3CLIr+56LM76yxnfP9ynN5yhT9pDx0S
	uo34nuvvtcCEVTlIAJdO0oh/ppRdm8p7VchofHE3j/KsIIYbmG+x7jFFml/e+tC+W3vkSGXep5b
	T9jWthUrAytJyJzpiK0Q93Nq6MHAm3DUw124lXM6EWYqjmthlPKwLJnFhbsqi97weT5P3o0cBqf
	03H6D4sfZON/GHk5mOot1zVBMqe5u+x6tJSfsj47DAauDkjHH4ZMD5aZEOuPPw2IgPFDqXZZH/3
	coZDfHmfW1SgWrn5gRUD9pu/1IMOBe45GaItUpHIlVmOTKuPgBd80zWxWWRrkhuIp4mORIgwGlK
	RxsjjwS+OAfPQxfOWq6IxXGkL1L/4AyLd+ObidLE+QeANal5sQ=
X-Received: by 2002:a17:90b:574b:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3acef1455e2mr1103745a91.21.1792210479754;
        Fri, 16 Oct 2026 21:14:39 -0700 (PDT)
Received: from shiro (p1722188-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.166.142.188])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ac945e72c6sm11609714a91.5.2026.10.16.21.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:14:39 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	dlemoal@kernel.org,
	cassel@kernel.org,
	linux-sh@vger.kernel.org,
	linux-ide@vger.kernel.org
Cc: geert@linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/2] ata: pata_artop: read the ATP865 mode register through pci_iomap
Date: Sat, 17 Oct 2026 13:14:18 +0900
Message-ID: <20261017041419.311921-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017041419.311921-1-daniel@0x0f.com>
References: <20261017041419.311921-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/ata/pata_artop.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/pata_artop.c b/drivers/ata/pata_artop.c
index 9f8d41639a62..351ff4c8e48e 100644
--- a/drivers/ata/pata_artop.c
+++ b/drivers/ata/pata_artop.c
@@ -405,13 +405,21 @@ static int artop_init_one (struct pci_dev *pdev, const struct pci_device_id *id)
 	case 1:		/* 6260 */
 		ppi[0] = &info_626x;
 		break;
-	case 2:		/* 6280 or 6280 + fast */
-		if (inb(pci_resource_start(pdev, 4)) & 0x10)
+	case 2: {	/* 6280 or 6280 + fast */
+		void __iomem *bmdma = pci_iomap(pdev, 4, 1);
+		u8 cfg;
+
+		if (!bmdma)
+			return -ENOMEM;
+		cfg = ioread8(bmdma);
+		pci_iounmap(pdev, bmdma);
+		if (cfg & 0x10)
 			ppi[0] = &info_628x_fast;
 		else
 			ppi[0] = &info_628x;
 		break;
 	}
+	}
 
 	BUG_ON(ppi[0] == NULL);
 
-- 
2.55.0

