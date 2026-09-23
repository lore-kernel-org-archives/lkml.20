Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29703C1D75
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151032; cv=none; b=NW2ZFGSxdQDfTRDdu3mvx2j3wnbgf7fnrLpjqrP82p+WZWCreepG5KWQ8A09GXQKjBCG4kW/4jKbQAAGSnBUNPZq886UircmCTgTJmWiuGVxkZKI71WJRpZhaccURVLMSPSeg1xg5PBgwBwfehsmUzwZPrHf2tPf3fTjWklalrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151032; c=relaxed/simple;
	bh=OJ4lfeqD9im+Foc6CNC2HRl00ysGMYvZl2GuC3Av6WU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ph4hOJpry9nkPJ1SpUxuniKh3fE2W9PlkBXxgufDhjvcSbwCLrMF7P+4pi/SC8aNgj/j62uiZxzK32XkTJ/rExpYYFIEHq8tDH8blk5Eu1kOLJTbgLe4UHPvluRRiMfVNnPbvwAzqBAcU+IzMyQu0GPyC0te2ZYuBzGajsoEdWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bo6n5SZa; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bo6n5SZa"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso563651a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790151030; x=1790755830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhNFDOl09aEMZ8kpRAqjjIB77iovlB54t187rXigIoI=;
        b=Bo6n5SZaUklZRIKcMvOTUw4hT8isT66s0BTCkdS0ylCoRUyrosi1FITaHqLm33Hgmv
         CTcXO73s8Oi88tKmrSNZLIXQR1uFQEWKjdynhmYq6LPMx0HgnuHOHXHzrvVqMJvN16dv
         OukLISIpBlzqyhkRag6+4fvFttcZt1YyO2pG/4ZeWamLAC8tkWINGKgE9m+ImDBUPC1I
         Y90iyxRP/h18NfnYkfAwu7LRe5h/3CCHrpMEg77T0CY5DRM40Anjap1cMQcBPlav8GGf
         u4Mi4OAf91mZrTZKcxWf8RvVMdasgIDx+oxGBtAYQ5gCkL656C1TpWWZfDOvc7DoQzUR
         qY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151030; x=1790755830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhNFDOl09aEMZ8kpRAqjjIB77iovlB54t187rXigIoI=;
        b=VJ3AkM2hKuI2ZtPjTyc8QFTaQWEbAqNJg7oze2LCepNrDJQX6F8a2dVDDu8MEPkK8o
         hjtAa3mzWrhKNkDE5RNl7Rhv6Bb3c9HgkiMdqATvq0ctklbe5g/fu3Q4NYtjpUOQ4nLW
         LBggRvMiTSQuBKzXDQynrpmB9+KG3wGFf8HZhcjxzX0RI4z59UO6ZezNn5IxjLsS34M3
         RhEkg//vxbYg8etqHqJDlN6E67jaSvt4ghR9d589Li/LOfEZ3ZwfDs9pIMicy4bUGLHB
         0+fgRR0N1nO9C4kQhSuk9JtQJJGQP3UDOh0C2Ki2jemHkn7gM3ITq+Xy7RHi0tbtI4ni
         8U9w==
X-Forwarded-Encrypted: i=1; AKwUvByvDR3Jola6tdJHJpjtIOD+RMiBhra9QeR3+SNZgP6W03arYjwGQhFsStMI1urBLUeG3FG42mKlAynLHZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++ndT7scvaw6vKqHhxiN7IdzUFH5qy/lGRSMNYnv1zKKPULuXqdn
	FcjPQW7yca0Y6I9ApqoV4HXLpWc/WFgRGjeyf17AbP5+hdjo9GcYoc0nML+M7ZiFG70=
X-Gm-Gg: AYBFou2XJ97IsT9r9FISfYa8Psv/vr9UVyYMQBKgk2OV7gyKPMmAfEYIlc2c5pPHzrI
	P7OMxDTAKaKs0rn9Y7dq/ajbGH72HgIXIu/74oxulwnKFW36ZZSoobmcJSum9y1fzjnaWCgnu0n
	loZh0smm7GObnHnPmSvJR0JZCq4fEY48OedTk0XS5ih5dEx1oxjUBFilTlC6nqIFnR4wdjMId0p
	9PH1FbKflyJtBrCgwFGl71c0p1eNVf17izLREFKWb5VuJttPdXHNY34UFLBidgWoHkC4cT11u04
	d2P/FQv86b5uQmWvKHRkCL9i87kVbZ87uYylGL/OD9Ro9bnvdThnYyBcBKZN+Oi8BDz12myPcID
	dGieWtPMvxvcUFcZs4DF+PuUDsdRJ6kwo+DuAHOvzWWclCY9MMZGDqvYsmckWmXP5a5ePqgIith
	uApvWP+y4ayHAZZ4ZpN2A/0fN5COPebAjELpp9uuKIQsQXmjG4riRYqKIa96R/YNQm4OHtsgit8
	0fqya5MNLOty3bah99th63WOw==
X-Received: by 2002:a17:90b:4c8e:b0:3a0:3700:fe9 with SMTP id 98e67ed59e1d1-3a07e6410b0mr1649244a91.36.1790151030164;
        Wed, 23 Sep 2026 01:10:30 -0700 (PDT)
Received: from flow.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07de20ecbsm3726373a91.13.2026.09.23.01.10.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 01:10:29 -0700 (PDT)
From: By <xiaobai050@gmail.com>
To: agk@redhat.com
Cc: snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+bdff1ecf726d2af66afd@syzkaller.appspotmail.com,
	By <xiaobai050@gmail.com>,
	syzbot+665bae0a102933788e1a@syzkaller.appspotmail.com
Subject: [PATCH] usb: dwc3: pci: reject matches without software-node data
Date: Wed, 23 Sep 2026 16:10:21 +0800
Message-ID: <20260923081021.89508-1-xiaobai050@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PCI driver_override bind can reach dwc3_pci_probe() with the dummy ID
from pci_match_device(). Its driver_data is zero, so dwc3_pci_quirks()
passes NULL to device_add_software_node(), which crashes in
software_node_register().

Reject the match before enabling the device or allocating resources.
All static DWC3 PCI IDs provide software-node data.

Build-tested with ARCH=arm64 defconfig and dwc3-pci.o. The runtime
reproducer could not be run in this environment.

Fixes: e492ce9bcaa1 ("usb: dwc3: pci: Register a software node for the dwc3 platform device")
Reported-by: syzbot+665bae0a102933788e1a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=665bae0a102933788e1a
Assisted-by: LLM
Signed-off-by: By <xiaobai050@gmail.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 6c1cbb722..d7fdf6ca6 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -335,6 +335,9 @@ static int dwc3_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	int			ret;
 	struct device		*dev = &pci->dev;
 
+	if (!id->driver_data)
+		return -ENODEV;
+
 	ret = pcim_enable_device(pci);
 	if (ret) {
 		dev_err(dev, "failed to enable pci device\n");
-- 
2.55.0

