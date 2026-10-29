Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793301639;
	b=tyO3f0TbmL9V9rWaMqKAGVTXJyTmdsYHTfrY2VHlpGwyYm+w2hjrTrCXZds7kclLn/Dx
	 +niNqfeHMW/ZemFUHkCXp2JNmYtk10ko03WBA6Z3KuWDCAcnu5sNm6TDZ9h20YFNr6CLz
	 XWrHbF3k1a7dWdkOn0ShFcSHj0wJRF4kklIexTZU9uc/sQtLe80RH7zBigW76Vs6S9Hho
	 PL7CNjyx0Cxfhub/qGDVnFNDoDwkYbuJWhMu86emXs+YsKpf9w2agSZba1dv6rbIABvbr
	 nh5vrWBgnYxCPN5/6R6o9qAR/It392Fs8cPwi/Uo6FEQkDJz7Ie5J+1Hw2WffBZmH0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793301639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6VUj5I95g/DnmFhalu50syOf9VCbIVGKu2KqtebqEpM=;
	b=3RquFudy2VeR2PM4SVyVpxPBnbq0fq0mFF3S2i7W1PiPlk13/5DnRJvHuQqFcb2VFUu1
	 OpJbtfHxbC8FlOqtEgM6ZMTh7dyFltDAdNVkUaaxN8H4AijzTHPZBq/DaPRTufFA1T+OY
	 wyYP/B7Ujtg1scbUZ/ZZPVpafs+ePuE3gT7v5QD5+XWOvkhGAXys72LvVy9LbU+vOGKtn
	 Sjx+ysoN8BWDs+iut72arzNKEdwUohhiIfC5iYGTXUg1GGs7eHtEpno5Jaql7H2JDac+C
	 bRq2r2dT+06NAzteCEkWjnw4u2O3DkZA0VUzqOmI7XCMImBgSR2RpTRJcIgYZ6rKROQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yItuUYyR;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800E5606A325
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 800E5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yItuUYyR
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-679334baa1fso3178711d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793301637; x=1793906437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VUj5I95g/DnmFhalu50syOf9VCbIVGKu2KqtebqEpM=;
        b=yItuUYyRL0uSigkf9uWU/pnnQytcz9WrM6TwWB2wZBWfD8R/icWviMFJc0wiZAhV7o
         Dxsy1NSkMtErdjj7kWtdY8L9DT4z0V2LRqNBz0ZynonuwFlFKyc4C/YpV4QdTpHWNsCq
         oxs9r7TpX2STl4aSXv0OCwUAJnQcZgggwSsea6KozBhA8XkvjGQtHWP2Kn9HEhxcG95B
         C7/aagbM/xp16A7iju4s+kbuv58TU14ekFxzF8j1kOinfJ7YAR/wiYxc3JsF0Nem299H
         KDPOxQpgB7GVI4XmDgwDPCNDweqsObXWY6NSbDiqsiRVIyBHgTTD79m1nRDFhC631g30
         v/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793301637; x=1793906437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6VUj5I95g/DnmFhalu50syOf9VCbIVGKu2KqtebqEpM=;
        b=sT/ONTdFzZXd9Bac65hxKiZM3AjRhk8fR2qSNb8GA3i3Tu4P7seeRQsgpTRrlp3eV5
         M1FZJzpij1Lz+eLwRVTqlQlVRexjyzTLzamkOFOaRd6o73/9ER6+i4ZXUC1U3kXcZYOf
         KuHT/Y9M5Cojg3hCqsitR5QrbdjUudlHvhBTXfOyIrfX7qnU9q/dbixBGjBq4oecWeDy
         To/ZIdTzsa90xtpH1LvkRch1cixgBHw16PzjNQUUFw1ruzsYGn6TjQdPdVoppkhM4Tl0
         QCbnxCwfIJpIdNhP+IP11y8tO6f2I2C/2gPLZXDSR8Jo2/9aGt5+O+MWFOwxu0BPLAmh
         2wbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxK+MeyJaPxB5trvP91yUK8jnL/DhTgvogXqrMPy+tPiTnE5UPPLLSGwcxvOebGTDJStxxcn0BQ6Sd6gMU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrx4whsLm9Qi23uk9zgHCnXvOwAv9y7v63Lmb4pGf7F/kWkTev
	SLslaufH7r2yaLM9uuvarEaQc+C9CoQqNW61nKNQyiEG4MiJgvYEkNtZJeizug==
X-Gm-Gg: AYBFou1TxNDUwDuqtZC5nn/02cajxbNcdIFcC8q3/XUEhUnBjIvJQFvQJ12WW5th/sc
	IytFoHY+8ezUrERe9yERbH63xayD84GyVBM9Te2LnDN1Vn32CkUfJrOCyNmTLZxXr1gxMy58OLl
	iZH5KBzGL99JHGYv++bjygTEgshoBjOU2LReay7EO899UyIyZeHLHh8q789r/mIqPTGgl4+0yKn
	2pFd0gppbfdzX0QSJo1pQoPTWU4+kb9FaVlyOwl0Bhr+G/+XwTe9jQQZQK5133eEnFWeBhGOBlk
	mfNQYteMDOWGU8FjcKaytpbrsj+YrZOl8AJ3tWEIKZjcWSV488qzT/br9GYc5z1y0qNqLIYUnOd
	aaolbZpQ5pZxtdDBjGzEql88/e8ndSlJaJSmvcgcWo0eyD0VM+PJb/TVE2QB02e9MC5SBEwOR6+
	W+O3ebajWadSQQJrnM+n1MuoVOQYzH5rqVJlGfnaJ5cRUhtVlAf8Q+wemPQytkkQnfdhRbCDPEI
	cAb9nTstg7y/9OKXPpqLaK2UttKAnedthGf5JU5BNABGXz75JOljKWVhiCRHr2NrBiQoVoJdNFg
	17Lt+bMeQeWU2eCfes1zVBKi1rwd
X-Received: by 2002:a05:690e:205e:b0:67a:56ce:ac2d with SMTP id 956f58d0204a3-67ba4c882f3mr52677d50.3.1793301637481;
        Thu, 29 Oct 2026 12:20:37 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff:4b::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67ba335ad79sm175635d50.0.2026.10.29.12.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:20:37 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kbusch@kernel.org,
	Alex Williamson <alex@shazbot.org>,
	kvm@vger.kernel.org,
	Nikita Vetoshkin <nikita.vetoshkin@gmail.com>
Subject: [PATCH v2 1/5] PCI: Add disconnected device checks to user config reads
Date: Thu, 29 Oct 2026 12:20:25 -0700
Message-ID: <20261029192032.1325629-2-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029192032.1325629-1-thepacketgeek@gmail.com>
References: <20261029192032.1325629-1-thepacketgeek@gmail.com>
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

Since commit 4b1038834739 ("PCI: Don't attempt config access to
disconnected devices") the kernel config read accessors skip devices
marked disconnected, returning PCIBIOS_DEVICE_NOT_FOUND and ~0 data.
The user config read accessors still issue the read, and if the host
bridge completes it with ~0 data and no error, they report success.

Check pci_dev_is_disconnected() in pci_user_read_config_*() as well,
failing with -ENODEV and ~0 data. Do the check after waiting for any
pci_cfg_access_lock() holder so a reader blocked behind a reset also
sees a device that was disconnected while it waited.

This prepares for converting sysfs attributes from the kernel
accessors to the user accessors so they keep skipping disconnected
devices.

On a disconnected device, existing callers of the user read accessors
now behave as follows:

  - The sysfs "config" file and /proc/bus/pci ignore the return value
    and return the same ~0 data as before
  - pciconfig_read() fails with -EIO
  - VPD reads and VFIO config reads fail with -ENODEV instead of
    returning ~0 data
  - VPD writes fail with -ENODEV instead of timing out with a
    "firmware bug" warning
  - VFIO writes to PCI_COMMAND fail with -ENODEV, since VFIO reads the
    current value first

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
Tested-by: Nikita Vetoshkin <nikita.vetoshkin@gmail.com>
---
 drivers/pci/access.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index b123da16b63b..18a206bb2a94 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -237,8 +237,11 @@ int pci_user_read_config_##size						\
 	raw_spin_lock_irq(&pci_lock);					\
 	if (unlikely(dev->block_cfg_access))				\
 		pci_wait_cfg(dev);					\
-	ret = dev->bus->ops->read(dev->bus, dev->devfn,			\
-				  pos, sizeof(type), &data);		\
+	if (pci_dev_is_disconnected(dev))				\
+		ret = PCIBIOS_DEVICE_NOT_FOUND;				\
+	else								\
+		ret = dev->bus->ops->read(dev->bus, dev->devfn,		\
+					  pos, sizeof(type), &data);	\
 	raw_spin_unlock_irq(&pci_lock);					\
 	if (ret)							\
 		PCI_SET_ERROR_RESPONSE(val);				\
-- 
2.53.0-Meta

