Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794032495;
	b=Y5A1L8FkcE166klVkcrKVv7mijfjCodo4Kb5nSfjv1vLlMC/XJmlMWUfsKmtlNDIaXKg
	 uMljjPOJliR8cXiTJnquzAWVxi+Yal7rPPTc6usUnnGIQaQ1FQ968mfLoX7qtORWDw/k+
	 AfgOtTF3DeEnfoy/o1QTlFexkaKF2ynrjcSuLTIRAcSuhX6QYn/vB+aRNWlE4A+T3/SkZ
	 BRGGTVlLcShId2dZEfeVLIINQNxUTKoIy4rnzYolula2pksnKKoJZZb9sbN2S7Z14H9Gh
	 aYiWy0xLn2HLBDKDXpIELjIpFX8f4WIfURYLN7qAxB4as+zk4mbSQbRcx6DXJnxUdDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794032495;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=LZhlu03pArR6TKBfkLLqhyvk1aQ+4bN/PjZYfZEu4ZE=;
	b=m/q4TUZAE0h3msE4GQlUPC80dAIuWIgnC2AJ/KZb9e0KncXeZ2AGRT2HxuJ9X657CzIQ
	 4fYAL04Sjumn2MHOtJOaVuRmnWsIuYqTG4wsb1R8P8xX2x6DQO6YD/QOCagiivkzNeaYL
	 NV4BU/eBy+/g6CyqDc7Q5tEu5VCDWVaZox9TZ977ndVe9OkXwovD9pXTZVgQVKjHGH/Rh
	 wLsbJaGUElojbxUEeh4k60ldA+O8oD1jptzWDJV9o6QJ90YbioJ0V7E82fDe4IE9b1oRS
	 E0xGkm7FOSNIs3G6mbozsw+XctsR2/nZ8vhFRUjfuB9m63UbsC6BZ7oIA1452+9HjAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0EA606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC0EA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-84fe2593525so1865384a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794032494; x=1794637294;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LZhlu03pArR6TKBfkLLqhyvk1aQ+4bN/PjZYfZEu4ZE=;
        b=l5yZc60FKrHIuViaK+athLer3tmCzNhayn5+PEhrj/94GA9efjRBnLSiPYcm6AC6yZ
         Q0M/oyvZWai0+9avlvpNOa9uVEs1A69nOY27lsYOOqNZb22JX9wwwFLAmBTRzUFIUZSk
         3665acfhigeIf8WtlMvG0dsIuSFI48dPzgW25wICRM7o9LL8OQf0rRufrLKX2sIX6E0g
         S/W2doD7AON/M79Ve2oT+NtqdnS7LiMPWgFHS+/6F3saIDkVS9J2tXDzh3qUMxHTcvO9
         9tQxZfPdO1Jry4Lz3UWsM6g/hwMTmmM5xFh1mjL8eC0IVdmSrrDOBB9YPPQgm8PBz5ya
         lrAw==
X-Gm-Message-State: APuU4Z8LPBA71YzGLPVf6AbJFOX6OkKBFIG0h3YkvJ8WfiXBSK+Bk+x1
	gOHh/ztubxf1G7MuNJ9k14FHEjuJZBxh5UBWtq/JV6y6H57fhADbgeoW2GIKvOJmvePngbRPtfI
	9d13p0H5+8OGEij/qQOviNksakLYT1c7Gj1hOORTUT95tjebNzPU4dB825uQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:192a:b0:567:c9d6:b2b2 with SMTP id
 5614622812f47-567e15b4486mr4025250b6e.47.1794032494048; Fri, 06 Nov 2026
 22:21:34 -0800 (PST)
Date: Fri, 06 Nov 2026 22:21:34 -0800
In-Reply-To: <6ae402bb.0c1d3ab6.e3d48.006d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aeec36e.4dd4714a.f8d02.0000.GAE@google.com>
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

From: Qing Zhang <diasyzhangqing@gmail.com>

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
This was previously sent on Nov 3 through syzbot's forwarding to this
thread, after the direct submission to the list bounced. Resending.

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
