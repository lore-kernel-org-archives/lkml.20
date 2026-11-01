Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793514223;
	b=gpd4r4hr77HIuIpBhr71zHUKifqDKiUyKRXbDKos2wbyurzylnpIkux1fV1U9YWTHLo6
	 AcrmgEpG9n71jDM1Iu9nysfB+XbfgrXqhcPGZzHzhrSK18pHKlYGdfYg5mlhmlSvaU4FB
	 Z+nz4dz/i974aJ7w3glLS9NjrSHD+ElYGZOvr8KsLq+vDmV4v4QbQeeQzQQiDaVu4O78z
	 8WCOBRASSHbptC35GIe4vH6wc3LWFXgxOzkaTiREaRoSKcaKjdk+1LM+zWv4zn+8+gxCG
	 LF36B4csUeOiYatcWzG1sC5DUidyi8SXolvc9psUq0H0kYJsPJ3D6iJMc4nP2WUE3pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793514223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V3iVcUnWr9KVu5ckBKFl1JMHxwLvLh7qZfi7p+79FtM=;
	b=cbX/rgRNI4WmH2RUqp6QUHZIQaBwDrDmmBeZIvKIdyc+Lj0p0ZoeYMk38qcxfHh6UfT5
	 0SXJrSzxVAe5KGELb6HXAQrTiA0dJ/YFIiJObT7jQrYgCra/osgpFrV/iE5nl0ENkhJz1
	 +8+o/N2u68ioWvnlIqJZCiVWTM/CVqzfFc9mdHdFbWL7pkoMIHXVKXu2gdB4PpszOTY9z
	 E6FwXIF9MrjQDxtEoymsUTARZntCUOyKd2neZMUyxC3S3SfgtLPVwQjz2ve8QZXmKUGpS
	 uS9iY1II/i6ty16Eo08FqsDww5VrRyfntdL9gc6OI3A2iVpUIf1pVR6Z/jZYlQAL4BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J/a3fqOS";
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4424B606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4424B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J/a3fqOS
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so1338883b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793514222; x=1794119022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V3iVcUnWr9KVu5ckBKFl1JMHxwLvLh7qZfi7p+79FtM=;
        b=J/a3fqOSUlU27X0iUhIvxL6HMOzpQpOemLZ7bZZX3WllfYRs5Sdkz1t74ROJMTzMw7
         tKDOR3s2xLJ3OcNj9iooWxJm5vE6V6SAYZJbP/zkaXsd7piaOO6Py6gZgg4sxt4dudsl
         Jo0bdB9Cg6jLjDqkfbQs0RR4IxopYnj7VEbVLf9x2h3azDT41Dcaf882qdargx0vItIu
         xN0Gey/+65JJ2UJe5M6tYGvb0/8LrCIyGbDcHM8d0nPiP9f/j5seVKoXiKrLDoMBnO+d
         E8LGyExj6OmqobfZ+xOyuMQ41AWPfb3HIYbgmZKYGsZh3wVQJyo34rxdyxOwddc97N4p
         ZwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793514222; x=1794119022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V3iVcUnWr9KVu5ckBKFl1JMHxwLvLh7qZfi7p+79FtM=;
        b=npzhuNOAxKTuYV68Uf1hPit3FEi445+v/NGxH4ms19jro5OwUPEne9WKtx95fASuDw
         G+MSnSsN95Na5gAdTk5RoaUbSgl03oEzFIU7EtVb7wo1YVuLspS0bCWQvtSOGo1RwfdQ
         o+ztLGSXrkujTFQOrYD2QeP4VxoyXXVtg0bhVr2D5NRJ0tHEZy6MXu+qyDGu3rCI7ILm
         0vlRdLO4t+eVVV758DxiBzz7SYxP4AMdITo+CTpYzUWX6FnQxw3oQ1ajx03Wya66/fMH
         SikL8etQ4mtK3eWXWoQDpGKyGoCFKiWmTM8lxc/Xo15kvR9g0z/OnNDeSwCvEEgPA+Dm
         nJ7g==
X-Forwarded-Encrypted: i=1; AKwUvBxuDMpXoPY+G+7UdV3h8ajXJBeh1+18MywA/TGl5Vj7OlkRyHXx+EL5O2XjkcTLB0HTeVCyAUX93R30GY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQwKfcN0R08KCEiRY6MGhWqQV0CGhmMplC+RPnMT44OkCu0mgQ
	yRhTYCCyQLCC73rs8Ufdd6KoEmoPBC5Wplkv/ynO85+1QNiFuxARqhK0ZN0aBfjv
X-Gm-Gg: AYBFou32JxlRnWPshFoqMdfW2O2Y9nVXDDB4MfTn0b/XRy0ruHWlfC8ewU5L55yNvfF
	QRhyIl0TUJPD02gUSZcWJyxHo+s1HMhpu+eVWAohGUY5iThB1wyQ1QXHKjv4C8j70NKO24KMSGb
	RC33nGRpDz8QyP8qH0CCLRIz9zj1bFI+NeXrAAaQQNIju+0WHBJZOQUuV7iOgGfH6uJjfyEga2L
	27gl8uLax8T51LfsGlDUfZlE1uy8NjIf1S0Zs276tSwKUDaNAJFJ5TOnESkWxSd4XIbzrKzcaJG
	xsQYxAQ/QIgxCaLZvl+S7HPwAyu6cl/Qvq/pNnkhHFjtYRlqXxHj7fntdWkSPE3Mpnp8qxGXYOO
	krw39UxDPgXEVTDwpMwnSN98lzNKC6ktiKv4K4X6D/mhjJmjMtt5hnDi5dUvTvpp9U3y10herxv
	hudxqjdnOtPnMAog5sVV3qofYYXgqL5Jh/RvIVnCk3H23WBsKQUcgD3EALrcq2sVvFGnDO0LW4r
	80qhhSjt1v92Oc4thKOvxjDd7w+nrp2SLmIMBADu8HU/MqrToYlluXQ3/aKw5oD8gc7Ny3CGsoI
	clVCB5MGx3wLiSVr8UPyDqxylUW0nWK0XuTOfulyNA8l69jcsIVKby+Siq9O2ZWz0FTkbsA23xd
	1LHe6ZwMsZqR1gf97/BNNYN6pNrp02ZhLPFXKAQ/OhMV9eDGaxr5esDGMeJ3Sebhxihii9coZI4
	lvOBODtR2dsLFKROnTGokI
X-Received: by 2002:a05:6a00:21cf:b0:882:905d:aa05 with SMTP id d2e1a72fcca58-8a9bfde689amr5497443b3a.50.1793514222525;
        Sat, 31 Oct 2026 23:23:42 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.191])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aadac9c505sm1026348b3a.53.2026.10.31.23.23.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 23:23:41 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] stm class: drop the source link after the source device is gone
Date: Sun,  1 Nov 2026 16:23:17 +1000
Message-ID: <20261101062317.16608-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

stm_source_unregister_device() drops the link of the source and only
then unregisters its device. The stm_source_link sysfs attribute is
still reachable in between, so a concurrent write to it re-links the
source: it ends up on the stm device's link list with src->link set and
the source's link() callback armed, after which device_unregister()
frees it and the source module is unloaded. The next unlink walk in
stm_unregister_device() then touches the freed source, the stm device
keeps a reference that is never dropped, and a source like
stm_heartbeat has its hrtimer fire in freed module memory.

Delete the device first, which drains the sysfs attribute, then drop
the link and release the device.

Fixes: 7bd1d4093c2f ("stm class: Introduce an abstraction for System Trace Module devices")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/hwtracing/stm/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 5fbea4e..64a9eb1 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -1287,9 +1287,9 @@ void stm_source_unregister_device(struct stm_source_data *data)
 {
 	struct stm_source_device *src = data->src;
 
+	device_del(&src->dev);
 	stm_source_link_drop(src);
-
-	device_unregister(&src->dev);
+	put_device(&src->dev);
 }
 EXPORT_SYMBOL_GPL(stm_source_unregister_device);
 
-- 
2.43.0

