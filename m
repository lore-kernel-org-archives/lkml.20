Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF3536B05E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788153682; cv=none; b=fUZdRqK4g1GLih6U3CsoRAjfN+IuDguRRXvfktw3FxLgdupQO16fJg8p0m8/qjEbgJ9nj4C/xO+qvIAW4/t95xoRtPxY7Un8wPQcgJuv+Yb/Xowa8rnhP69BeY00EQVs8lfTSTQ36HDcQ/kjHtuywg0lT46mK9maqcahfGjWlQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788153682; c=relaxed/simple;
	bh=D/OAPtmWMg/a24pmYC9Ob5VtMdBNPfjduUlqAtvXTS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b0a72facbik6nwChKXBqy1XDRBXPlnwK0Vj6jt+0ThwDiGr0yCUODj24BwLp29Dz0jVeteOIEB0DYjOBpYjkQ9vqygxtumGnkJAU21rrZNJG8muT6M7u5DX37OLQ5oox4i3AQRB+h7Ffe0uFLNrDixZ53Xw8GFeLGLfblKG3tHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4a7MX6b; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4a7MX6b"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d91ded8174so5517235ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788153680; x=1788758480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a7w1HCUHNpjVoop/odhxR+2e8lKBAC9Tc7w090GqBj4=;
        b=U4a7MX6bEZTs/VvDrfZw6JnrwBpKfH3kA0gXnZA/uiHr9fC8zqNtw86OerV2R7MQib
         d8jNm8uEZRtk1wNaWJxf5pOIVR03mXgXgkz6Zy3CkQ+GghtBR2Z6+NsAh1+7Gvge15I2
         acdqvZo6eDSNcZ/2qw5M0sGuWM7U3lJ4QXEbD7OxQdoDUaGg4hlBQ3ajqa6X8lTxCm2l
         ycg6PxPYyKvRzUiFVbHYd+JDC0Sjgx1oshaBhTPM0mFHh9sdVMX7tmI0ec8MEjPW9+ku
         PgP078zxf8cjP+/FAtuJHZ7LKhfS6T7Kwm5k403509OF1YWf2BKDpCBwN0ntfbrV8CsH
         /5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788153680; x=1788758480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a7w1HCUHNpjVoop/odhxR+2e8lKBAC9Tc7w090GqBj4=;
        b=l3yApp7tnJ9csl6vd+bFx6/yYwh+GCiy9KzbyRVuvDfloc9T55ttIjbc04yddEX9LQ
         tRGnbH2weQ9JjffKwlL2s1ERgzj9sqp7ADW84QeKkUIEDVf9rnqcZFU3RCF0+uuH2Hz4
         hrTrlQRQ0SZzh3NnfnVIGllU1bd1VqFvpfAECswasVK+6WmYBeVcFNPCU1N0TNp1yVsF
         gqcmNiSpiIXOtmUUBnvXKhTmdWFAi1gqsepVAlNC1XWpl+qgKG0WE7NGlhD6UYyu37Qf
         cHGS7eJ6TggVY+1ppTEA+EtUPtbinCla1lhCOW0qXuenBAGM2uzQsH63b0aZpn7ZoJtp
         Wwtg==
X-Forwarded-Encrypted: i=1; AKwUvBwNM9aKSHKqDvDvZvCcK4bfM+AzD9uHhudWTc2Kaf8rL7YovbHUs5X7Z6/wtjoSPLIfEVZX//w9Ocj9VNg=@vger.kernel.org
X-Gm-Message-State: AFuF++krpdtkRgZBLWuiDTQ43aeyGdRnXAi9ztNk+d7nnhLNJEQN8Zvq
	38d43qhJ8/f0kEHqOIBhCsi8fMcg0iHuKVh/UVxHTBRxTKZVsaZRmhCA
X-Gm-Gg: AYBFou08gC/RTLk8DYj5jhMXU5CNbmp4WRiRhZ1lj7DLHg/sjazt5AN5pl0A0pRDDDH
	Pyxowf8/uOSdl61yc2RGxOVtWoxkUjRkXSHc7nsEPnDeFE8NAjWNJp6RCnYltqr0m9m9eZIZVCl
	gYBwJZ7afvnZ44NsgeiNHFOL9fexZ2bDf9WjyE0fik8ppfgN3sV4EK4T1y7rgpSJOyck46Glprz
	3JYjwUGyR0bWVSBEMqKamJmoPmPSJ6gxVO9uRNqBHMdnllbb9F6qv6GCun7cDsu6/5U/PnsKu37
	tkgM1+LbDsO+xFiUtczX/HCTlhzuy7yQ1W8ieSqF+vzdig2ZidQHPzdvxQvigXCpIIsDllXbO4w
	8gvB9Nsp/XMplrE6GIlwBeDVgUjKHxW1IxvO5sWp6NDk+C810j6xryycaWCW6Z/fWM+7/aWIuB1
	+xQ0l1cY26juxK7ym0r/Pp2VeuqOlRdkt3A1TSjTOSIhITTf4yhTFd9Jc=
X-Received: by 2002:a17:90b:3c8c:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-396d0e7255bmr36972808a91.8.1788153680048;
        Sun, 30 Aug 2026 22:21:20 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm19612656a91.2.2026.08.30.22.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:21:19 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Long Li <longli@microsoft.com>,
	Konstantin Taranov <kotaranov@microsoft.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: [PATCH rdma-next] RDMA/mana_ib: Remove redundant NULL check before netdev_put()
Date: Mon, 31 Aug 2026 14:21:07 +0900
Message-ID: <20260831052108.903019-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

netdev_put() does nothing if dev is NULL, so the check before the call
is redundant.

So remove it. No functional change.

This is the result of running the Coccinelle script from
scripts/coccinelle/free/ifnulldev_put.cocci after commit f83b8a58695c
("coccinelle: ifnulldev_put: update outdated helper names").

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/infiniband/hw/mana/device.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/mana/device.c b/drivers/infiniband/hw/mana/device.c
index a8d19586a78a..62c7803ca6c6 100644
--- a/drivers/infiniband/hw/mana/device.c
+++ b/drivers/infiniband/hw/mana/device.c
@@ -103,8 +103,7 @@ static int mana_ib_netdev_event(struct notifier_block *this,
 				ib_device_set_netdev(&dev->ib_dev, ndev, i + 1);
 
 				/* mana_get_primary_netdev() returns ndev with refcount held */
-				if (ndev)
-					netdev_put(ndev, &dev->dev_tracker);
+				netdev_put(ndev, &dev->dev_tracker);
 
 				return NOTIFY_OK;
 			default:
-- 
2.43.0

