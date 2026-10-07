Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F094E36CC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 19:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791400167; cv=none; b=YgGgiWODgzepW6rtIh+gqKSWlcd5Kwjq5QUxj8sbF2uDx8fD5ZZUAa0o2sK+W8eIMf3JRZkBYc74jeDddhFNjprCIpbVERZq5IajXuLoEu+SToj26WaJS/OHwrx8XW8qbSwOlSJHDgnPVAMrwtSQo0OM4g9RjHLJtv6v6G1IVPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791400167; c=relaxed/simple;
	bh=vVSqOGp2wx/0qJVjAsSbH5oTy4Gpsm8b9+BCotcy5AA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPfod6H9JlXtBKBHHj/jc5QrLurXBGDKNSJ/mz8LItiGRLkKhF8R+e3WcOblcyTXkncaWQrKHAq0x2mZk5kAfC0sSPSAXBCN7pBdS41nvaBbulnQmpYnC5+fJZKyJWxarWB3Bf0/gLMn+IF4Gsu2k93rd8fXA5tReeRNZtFtq1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyKU9oV/; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyKU9oV/"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7ca917f9f52so357711137.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791400165; x=1792004965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XGvHahoLRouhu1JIBcDAOTwzFgHXehCkZsR1IWSJgU=;
        b=UyKU9oV/Skj6omKIj79jVBpXFg+ATjDAhM9sqCUH9n7N5aK52iQU92wyj/ba8d5V4A
         S0zg7dUjAV6GAyUZWdQJaly3O91FpSYaNiL+BIO05/eGEEU1aA0iY18E5QjhonwDRVqC
         2RNfUEvuSB58m5AxmJlT2oIdzZXLYabSU8gb4OAgmFCwJ3cOcQjEnW9xeW5yhGJ6qk0+
         NOkBOn7Yx6d87Vuen2T8VFNR1vRfvw0/OvpuXf8DIiOUgG0cn6v+5sW1logY/xmMAN7V
         10Mza0jE1vixG8/LbiHHKSr3bqIH9aS6Ct27KVNk9TvCcFVJe3Houcp6+C9RQI+BqFKP
         JEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791400165; x=1792004965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3XGvHahoLRouhu1JIBcDAOTwzFgHXehCkZsR1IWSJgU=;
        b=wA57uNqCxbn96tPL13Hk4kX3NId9sGOfGrrNTus6D//FDHsSo1QnM+MFl2ndk9Jjte
         /lgTtEm5xA3iN/fRBlZn64esh25w/myDhIXoOSQK32zBSjhOa1q34VMSilWj0lWSPE55
         dSJ0rfs0HJbhAHEp4k237Hp1pSvSlGxb/72hDS9DzVaX8NNnYQVXk15JA6Ard+YirHsZ
         ENMGf13xMX9YQWr3srLToEEzNWGhe8nkPPk5FLUTlS+oEeJEpqi3e81+jDg/nn827MXv
         Mz+p1f7rkU6OmljaJHll+rDu/FuozwR0mX9CJcU6ehxgGlorQBlbbTTskLuJYC9dX8AB
         +4uA==
X-Forwarded-Encrypted: i=1; AKwUvByRkzQsD4bi3p8vletqHKi8rAsKYPYQm8H8zjB/KrrDEv8q70CEPD+uffcQI9ctAJvhJsbEKVg9NRI2L9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvAj+YIzemqjHbOEmUCkS2kZvf2cLb7xG8Z5ccs3OYYxdpkPXU
	E879Tb0e8xCdPk28XXmccTgzMxGc9AWg11a0BN8yPUNcPOEeOLJVRWk1
X-Gm-Gg: AYBFou2+uDofS2aWAmJ5g6awt+46RjSQ1hk3f2k/FqnsRMs16QuVKhqrJltR7wLadoD
	/zgxl0SkEWzBOEBLg2Pm7wJ258vPW4DlBveSxWNI67J6AqDtWb4GsN0kg1mhZkfChARzcL61Yxb
	TcVBCFppIUEHNrjl7UYH6ptyFLgOS91enymR5+JRz3HQARcpxWYcduhAbEa/b7GcGVgRwvZ6j6d
	d19c79PA/zzXb6MG8wg1hz72TV4uZtxPgYt6LW1FF7pLzRpVVyMsQubZX/F2r1b6d75R+R8Dn7p
	Z+W8bkXn50NGiU+OpTVYqr9qVGJxALcr7+R3vIeX4th+BN1+SQbBrtQtAfRxEBk4hr3DY8DO2ij
	2qjMoJEiEMJSLsDhUGIHy4O79NJIN+WEh1ePNpWojtcVPAY+eiXkEGGNrpHt/pVwFoFiw4/Pg4h
	xQEMGXvMppDcUyCvece+YBPThY+qB16RV4wQdso1Yh4FyulRo/3H7LmwWQn7j5bTFhd3QzFRd1U
	rjuo4mrKAChfL4Gm6g=
X-Received: by 2002:a05:6102:688f:b0:7bc:1de3:39b0 with SMTP id ada2fe7eead31-7ca38f28c27mr1016377137.32.1791400164748;
        Wed, 07 Oct 2026 12:09:24 -0700 (PDT)
Received: from emedev.tailf75c28.ts.net ([74.244.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ca218138c6sm2456787137.12.2026.10.07.12.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 12:09:24 -0700 (PDT)
From: Emerson Busson <emersonbusson@gmail.com>
To: mhklinux@outlook.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 14/14] hv: netvsc: use kvzalloc for device state
Date: Wed,  7 Oct 2026 16:07:52 -0300
Message-ID: <20261007190752.336426-15-emersonbusson@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007190752.336426-1-emersonbusson@gmail.com>
References: <20261007190752.336426-1-emersonbusson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

alloc_net_device() allocates the fixed-channel netvsc_device with
kzalloc_obj(). The runtime fragmentation drill reaches this allocation
from netvsc_device_add(): windows-2025 reports an order-7 allocation
failure with about 99 MiB free, while windows-latest stalls at channel
open until the guest timeout.

This object is guest-private control-plane metadata, not DMA backing.
Use kvzalloc_obj() so the allocation can fall back to vmalloc when a
high-order kmalloc cannot be satisfied. Zero initialization is preserved.
The RCU workqueue cleanup uses kvfree() to release either backing.

Rollback trigger: revert if channel setup fails with vmalloc capacity
available or teardown leaves netvsc_device allocations outstanding.

Signed-off-by: Emerson Busson <emersonbusson@gmail.com>
---
 drivers/net/hyperv/netvsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/hyperv/netvsc.c b/drivers/net/hyperv/netvsc.c
index 0d017f836b9e..8ea7c993baac 100644
--- a/drivers/net/hyperv/netvsc.c
+++ b/drivers/net/hyperv/netvsc.c
@@ -144,7 +144,7 @@ static void __free_netvsc_device(struct netvsc_device *nvdev)
 		vfree(nvdev->chan_table[i].mrc.slots);
 	}
 
-	kfree(nvdev);
+	kvfree(nvdev);
 }
 
 static void free_netvsc_device(struct work_struct *w)
@@ -171,7 +171,7 @@ static struct netvsc_device *alloc_net_device(void)
 {
 	struct netvsc_device *net_device;
 
-	net_device = kzalloc_obj(struct netvsc_device);
+	net_device = kvzalloc_obj(struct netvsc_device);
 	if (!net_device)
 		return NULL;
 
-- 
2.43.0

