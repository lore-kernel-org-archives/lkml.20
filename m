Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697521;
	b=TZwVt1R01nLaIUDKHg7tbnZumsj6EBagBjar9bpthIMDtdiFfhPV08kO7Cnw8196efwG
	 bF6HxGVU1jHZHUZx+TYiKcXmVe2edWR8CWrNi5RuDuDsXiU3KcY1PT16STGUBrOZ24vko
	 fK1UtNuJ++KRh9sF3s4JnO/wMQD7Ur6WHM4OickcHanWH3dTnPoKyEo5eP7qgBVBhetPg
	 L10w9qyBD9LKI3VGR3MHDW9iDprqde1OJdLhCMYDPejeFelKWUhIMaXM81os5W8J1kFQ6
	 vWQLjXk4E5EKrsDjrovClSuqeF2BUgDDvdy95uOI2La01FxfsQ57SQe9hfxpXZ7YZwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697521;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=S46q/LjhLxz3jQNKHHZJU1vYSA3tdBlF7Q3Qj9AChf8=;
	b=raO4v8PBcQjeIq6Pvc9Bf5G+VdDE1UC189BC2OE16VDZzWbrDbaRlOy10el20qWqANV4
	 1gaqJhy7PrKUDKOJKwD04DKcutAnfDCi8+otFCUZljukZq0Fz7SSkgIZlo0ZKvTF+2rTq
	 vIapuPz9vtl/uSQgAEmUVupmHNtLne0U+9TNyG6tfV9AuuIkaMRV08wcNFmUyrMyQ6RoG
	 XNiSIETvi65MxyiIBH4Xm+6jbjlzIZndNU5aBMouZO/jMraJVbhcYf2mGinnWUYH+D7gu
	 7xWzmf8wjJBETskhsEByAoRCRwJ4R+7T5RRg2pAuu6dUjgP2L91M6Yp9Q1Gcdm70dlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C184C606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C184C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-54dbbf252cdso5789502b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:18:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793697519; x=1794302319;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S46q/LjhLxz3jQNKHHZJU1vYSA3tdBlF7Q3Qj9AChf8=;
        b=T6wk9wYxI1Jk4ahRI7QmfjXcpa+Hvmbyi3ALG5VQBTG0c3wmupDxjVKB3VQBRHQTxg
         nA5LP9vB7/yBeM5PMulw4xSAqbzcl4CWjc78fS/AzmVY8BZvhWFfldtcxciP2KlwsWsG
         8yVXjV9IIN+6Hd4i/KnhxNak2HOIQBPTZUd2YXZiIvgcew7/pqelrCKWxbjdEl/C/M8g
         +a9Z0hyOjkPNQeKjeqRzxTMw+Kl5gxOx302HgnBSCrguai+b0eVIHIn5q5MhRWUwELGl
         62p6sMGIX2LF0Msi+nhTq+kW0jN8d7X7C1bju3/Nfmx4uFgByrLVjEeRYf4GJiIZ6xAR
         +myQ==
X-Gm-Message-State: APuU4Z+l/ruyvTnRy/xEv7Cm+2T5g3ypHQVP7ijoZmNdEcNmLxsx1H1M
	3ws6e6Q95J0Zg1ur7fLC8uF+QOveBuLCdiu49XdZKQI4Oqzs9utf8gaPv79u/5crJ9TEAfbVrhL
	lZGj8tPxVDWLyZs2HVY4k4eJw4ycvG50jBuqPWh4hSZwm9uJgNKGeh3Bzlqw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c40a:b0:53b:87e5:8c95 with SMTP id
 5614622812f47-5640ddbe9e1mr7431353b6e.37.1793697519779; Tue, 03 Nov 2026
 01:18:39 -0800 (PST)
Date: Tue, 03 Nov 2026 01:18:39 -0800
In-Reply-To: <6ae402bb.0c1d3ab6.e3d48.006d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae9a6ef.0c24fc0a.13a0ab.0037.GAE@google.com>
Subject: Forwarded: [PATCH] iommu: Fix dev_iommu leak on mock fwspec
 initialization failure
From: syzbot <syzbot+fe84fc6a684e0beb86e2@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] iommu: Fix dev_iommu leak on mock fwspec initialization failure
Author: diasyzhangqing@gmail.com

If iommu_fwspec_init() fails to allocate the fwspec after allocating
dev->iommu, iommu_mock_device_add() returns without freeing dev->iommu.
The mock device was never registered, so the normal IOMMU cleanup path
does not run, and releasing the mock device leaves dev_iommu leaked.

Clean up in iommu_mock_device_add() while holding iommu_probe_device_lock.
Only free dev->iommu if this call allocated it, preserving any pre-existing
object. Check for NULL since initialization can fail before allocation.

Fixes: 2a918911ed3d ("iommufd: Register iommufd mock devices with fwspec")
Reported-by: syzbot+fe84fc6a684e0beb86e2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fe84fc6a684e0beb86e2
Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Qing Zhang <diasyzhang@tencent.com>
---
I reproduced the same leak from the syzbot report. This fixes the mock
device path as Robin requested in response to Tal's patch [1].

[1] https://lore.kernel.org/all/7e209fb2-4bda-4207-9109-c67c8df41e05@arm.com/

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index b486b8bbd1fc..207241a553b9 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -379,10 +379,14 @@ EXPORT_SYMBOL_GPL(iommu_device_register_bus);
 
 int iommu_mock_device_add(struct device *dev, struct iommu_device *iommu)
 {
+	bool dev_iommu_present;
 	int rc;
 
 	mutex_lock(&iommu_probe_device_lock);
+	dev_iommu_present = dev->iommu;
 	rc = iommu_fwspec_init(dev, iommu->fwnode);
+	if (rc && !dev_iommu_present && dev->iommu)
+		dev_iommu_free(dev);
 	mutex_unlock(&iommu_probe_device_lock);
 
 	if (rc)
-- 
2.43.7

