Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951954B66D1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493529; cv=none; b=JRpMzzunk24Ff1o2ZXvAs7h0U0QJPvl3IAGQ996nOTnsaQSjnlIwUXHQA0bi1Yw9i3XkYdRuMXqtFJW5pBbPX0PNl/UM2r2LZWkA8HIWauK8zv6GN5oL7hCOT5nMySZlL8+UNgcjMkFq4OhyDEjZFmTPA7/Q5AyUlyS2EyMpshY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493529; c=relaxed/simple;
	bh=lywlvxyNF5ZYqpbb5YtEFG35Q3vRqvrSIjvw4XwxHtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cXzC7Yyxa4nEWmXMW/G70sDq8EajNSYmmMzsNylg/xShYxrPrUCsAlAzNssS0gA2wVuKyz+ZAf2SpHQoLcipU+DVmNZU+Bygs0uVMJ+Cs0TbGEPhh7glZSVDrhxy0clQQoTwp6lJpkgcFdZVyEu94obhUyG0XA+RHcYTlx6b1Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMSQ3Yse; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMSQ3Yse"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d249c4so3430942b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789493527; x=1790098327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TllSv8C91B6/5oyiPgB3bIf4ptvSZ4N3RPUetFlm1DM=;
        b=GMSQ3YseyO3ssrgNLENHYQyCxYXWFenrCK5YT1QUl86Hje4Qur/vhErzLNzlRch7fE
         J2SFNhfc+D+z1CjZOggzqatuJcG1HCLxmGTciMWzZop+7x29/uKfEij8/L+i80ujkT6K
         ZLHQRivU6CrE+mWFTZK2aojjTjW94IaDof87/ohoUJ0IIeoPKxNayjnEvcfVoD1Yvtxp
         EyuOANU4P/KdtOKXTwzFybiEdk0GP9xsTJRhQZ++Pr0gZmGVpzOuBBJnO6DCI+IU18Na
         PFXz7MrF58Mvc12R7KJAp7aIxbYtt5UxNlF1NwgbNujoc1WqOUSZdchrVNtkdaV8g//D
         Gl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789493527; x=1790098327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TllSv8C91B6/5oyiPgB3bIf4ptvSZ4N3RPUetFlm1DM=;
        b=ySpCO5V4aX5rgWTALavkCQhDcppXZiRULEMeXo7/6Y9wd2uttVjm3g7N29uY8VEbgm
         +k5U0ZbvKfaB8fkb2HEZVcTW1xHUXHkaJX9VNTN1KVexyIKEFMm83v9Cos1y7d6Ye7gN
         q7YOnvFF/cClz7kWf+t+vq030fBXVwO2EE6tRpwFbRUGrPfDQ1psZvft3l/p4Vz8uSyp
         u4x+TPaPXnUEN0NUGE3RujlvwDrr97JpBmEzeAJck+TiK++v0x81Ant1be5+3R7Pdcvh
         MeAqdjqv8et313Su2lCCzZRzZGL/rGGfcrJTXn6+9OyHGqBzUcOVWI7O3OHc49EO4+wZ
         W5BA==
X-Forwarded-Encrypted: i=1; AKwUvByJag/vmIOcRioBcfBPuye+8Og+E4O8U8FMioYhsXVj9huq5EDMSDW5Yo3gM+rtJfZj7lRWQG7dO6hw4A4=@vger.kernel.org
X-Gm-Message-State: AFuF++lBqINgdx+NR7kN3Y14e431gSU870XR9H5byR4kLfOwONAJBgbc
	Ug3uGpgO+JX8jZDaPHlRj8fay44FKNE7IpybFFXXqPGn9kp0pucwb4Uy
X-Gm-Gg: AYBFou09xQELJVW3v0CySmwquXVtnZbEI8S/WkiTUf4/JbRYCKqFfM1x0j/FVnKw448
	1cl9IAjWwZWRx+c+JjffsOoU9QbOIix0Jc1NFmc7roY7E7eVdCs26Ii+hF3S3I9kMBJ3aSN/l3U
	qeMMcnTp0mQUH3TE0VBPji9Ee0k5/JM6VEYplDysypFL4pm1mPR86oBJ9EfV7ONuqDt2Q5vwGEH
	ufyUMwnmYtPNVxZQbb3u85Ig4yrYGbaad+p44o9K3rFUze4EyRtAYVOBYYdCEhqYc7H/dmPcZzD
	/qDsw/qVz43SFlncld2vMkXF6FSgPUVsVBSFK+5PMs3u/bkXjqnGXJ2x3VFhXXi1pQ2Kg4/MxDE
	41Gv3qtmRcUIl0P0Tl+kuFfWm+Cyy3YUQw0c2O3iwrOsnNZ5Mv7w6JQ7O3Ge5axx1US8hxvaQNi
	e2CkhEKAodEyQNxqdoIClYiNfaWU/Uo710F23zezSl9jNCjPGeC01FvQ==
X-Received: by 2002:a05:6a00:4fcc:b0:871:9e1b:8a75 with SMTP id d2e1a72fcca58-8719e1b8ef7mr2506620b3a.20.1789493526504;
        Tue, 15 Sep 2026 10:32:06 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29bbdca0sm6609486b3a.45.2026.09.15.10.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:32:06 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	=?UTF-8?q?St=C3=A9phane=20Grosjean?= <s.grosjean@peak-system.fr>,
	Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] can: peak_pci: fix PCIeC cleanup on probe failure
Date: Wed, 16 Sep 2026 01:31:57 +0800
Message-ID: <20260915173157.2510375-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

peak_pci_probe() initializes the PCIeC resources before registering the
SJA1000 network device.

On the probe error path, the registered channels are freed with
free_sja1000dev() before peak_pciec_remove() is called. Since chan is
part of the netdev private data, accessing chan->pciec_card after
free_sja1000dev() results in a use-after-free.

There is also a similar cleanup issue when peak_pciec_probe() succeeds
for the first channel but register_sja1000dev() subsequently fails. In
that case, the netdev is freed without releasing the PCIeC resources.

Clean up the PCIeC resources before freeing the first channel, matching
the ordering used by peak_pci_remove(), and also release them when
registration of the first channel fails.

This issue was found by manual code inspection.

Fixes: e6d9c80b7ca1 ("can: peak_pci: add support of some new PEAK-System PCI cards")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/can/sja1000/peak_pci.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/can/sja1000/peak_pci.c b/drivers/net/can/sja1000/peak_pci.c
index 69c61ccf621d..28b94e642170 100644
--- a/drivers/net/can/sja1000/peak_pci.c
+++ b/drivers/net/can/sja1000/peak_pci.c
@@ -697,6 +697,8 @@ static int peak_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	return 0;
 
 failure_free_dev:
+if (!chan->prev_dev && chan->pciec_card)
+	peak_pciec_remove(chan->pciec_card);
 	pci_set_drvdata(pdev, chan->prev_dev);
 	free_sja1000dev(dev);
 
@@ -704,20 +706,18 @@ static int peak_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	/* Disable interrupts */
 	writew(0x0, cfg_base + PITA_ICR + 2);
 
-	chan = NULL;
 	for (dev = pci_get_drvdata(pdev); dev; dev = prev_dev) {
 		priv = netdev_priv(dev);
 		chan = priv->priv;
 		prev_dev = chan->prev_dev;
 
+		/* do that only for first channel */
+		if (!prev_dev && chan->pciec_card)
+			peak_pciec_remove(chan->pciec_card);
 		unregister_sja1000dev(dev);
 		free_sja1000dev(dev);
 	}
 
-	/* free any PCIeC resources too */
-	if (chan && chan->pciec_card)
-		peak_pciec_remove(chan->pciec_card);
-
 	pci_iounmap(pdev, reg_base);
 
 failure_unmap_cfg_base:
-- 
2.43.0

