Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D8C2BE035
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788568574; cv=none; b=Ar8zTteH9Nfe5jeFeYq3m/6mVTWPMz59nENsoUuo0CTDPIhDmWTQ3pb9dfECA4zcYuszTcDmfuteb+JCmZJ8vWVa4pw45Tai2wwXUlh6KNX37ylheoIkhiy/gK7m+qJqwW+fnJQxq52CxN5AHnaXBJQvx0gbuPAFFZEwTTkHKXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788568574; c=relaxed/simple;
	bh=8HzIcvm2I4PGEsFdux3m3Apu6yc5GgCA35XtCp1TzvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eg864/SQ+HFDmmPvRFr5VLyG5YzAX2eXB0MENooEAdf4I4KDOosK+h2MK2RJBnYCtmOuIy/1ZIPo0jqra15zXBopt0dklHDpXbSF1aRMHruPF+JE9mCRIiZrQPXd/qBKYJk3ftDJSIclw/xGHznClwU4UGELLbLTsbcV4ITV/WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYV0a0Gy; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYV0a0Gy"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39647184c73so2657322a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788568573; x=1789173373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l2i3q/8SP6YXjJaU7ec/Y5TJPcKgIJqQrS0aacfBKX4=;
        b=QYV0a0GyWciguOP+EZ3ZYvLeJQzt4kQ8ETzl3bU1C4JGe6/dtnhNNx5el60HikHdpd
         sZhBxc2JHcLHWaVoyY5ltmgTSI1GR9adC+Lm0cmsCHcIxYBhgyD4eouCEk1aJgq1z1ZS
         7FdT03EcPfJHVB6ssUqoxZ8M7Ej1hMppEW2q62t1yOwXthCj3u2yLxAS6ExzeNxQSbEI
         TeE/dbmGOuYMlqbu8Rf6DNLgXMHmXJ0qWFgoxrilCC5ODAjO2tMZ7O3SJspM6UC1KZlc
         rgedTtgB8oWGy+vtozR3eHCHUJgzfnpK/uE3h5QnZMJB94UNlUR1r+cuY4eIYoypHov1
         EbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788568573; x=1789173373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2i3q/8SP6YXjJaU7ec/Y5TJPcKgIJqQrS0aacfBKX4=;
        b=mjZ/OSrhdhGROiXuwrKv8BwwoG9SypTybI7u1LtuWh8x8UDSP4DNs2fkqkos+j/qJI
         BftOmVB0lyLrr2kLwPDv/DOcB2RK0uKVIAjxUjAmY5xVJORcO7hxW0l+pVbsdJXAm1eD
         i0OHBpbzyQ4zueNYeZcPEUa/UGxU02nbbwxrhr+4PUGZhK1HNtQMYLTfJV4AGew85qva
         t79wb01TLZ16JTHECnAauo7prCMmxJ7cBM9pD5u6Y7y7cJVx+hr6s1WOqdPjRWCVWCEe
         6aUhajs8DSnd9UhLCn657uYd+TTNRidzFUwnP5MW4sa0rM65OLjmnxRIPfrfHfBB54oP
         oYdA==
X-Forwarded-Encrypted: i=1; AKwUvBwVSXnfjpXX46Y5igkYq7bv6WdyAtyzF9RzCvl0Nr2QuYBXj96S96PI4/UPTMBUzEvDTsfz2K8G8U2UVEM=@vger.kernel.org
X-Gm-Message-State: AFuF++kgMJHlM8AHwrlKaMOOFCgNJmkJfRa6uJp+GT+3TSGYLw/rYF+W
	HJo2kIh1OudBcMe4sHYgauFl7tSujpRt/zY0RTnvhJtfkAcPXJaQYCSR
X-Gm-Gg: AYBFou0Ufn4YgxF3E0sBSdNG8+66Qr0k6m9DNahgBfQY9HCzPoFVSBsKUOe43uTl1Ha
	DTa/E7MCyeSMOXkJaUflt4VDd6FNdgKd2Nph1vhvMWpV7LlGilPua/MYwE0H2z97LTL5Ndla8Nb
	irRyrHqpL5WHYW1zwqnwZzderL1RSPguK1SB7AxzQ+eCiChSCpF8zx4XXZ8wf5rfVxX4LPLqfKv
	fF7dIAMsap3f6OvkKl52X1aAq9Ptm6EFMNpLLmhq46zn+JbSsCUz9Ug3/6vdXZkm2Uyp3LWMNbU
	6/ZyT8akt5UVJlkFGqJ+ylEHZ96OkqycHK4My6sTfgBMCfaYOk6GyFmZTSr5PhtuzSb7ViSCINd
	0hZXSHLgr5X5oesO2E7LkTgcrsc1gNYHAsm69G66eKBoD6FHcBKxPFeEUe92lgEY0HYD1Ha2Ifl
	va5g5Vv73BVgta8nTIcZht+/lhvHRb+lOQ1ZmuR7KZrJl7jbcPXAPQsKQBhX7S
X-Received: by 2002:a17:90b:584f:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39b27c8b9e4mr7191704a91.8.1788568572711;
        Fri, 04 Sep 2026 17:36:12 -0700 (PDT)
Received: from tradnomic.. ([2601:646:8300:7570:4132:9566:38a4:e435])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f88475sm6760895a91.1.2026.09.04.17.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:36:12 -0700 (PDT)
From: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rafael Alejandro Diaz Cruz <rafad900@gmail.com>,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH usb-next v2] USB: gadget: Fix UAF on refcount inside gadgetfs_bind()
Date: Fri,  4 Sep 2026 17:36:07 -0700
Message-ID: <20260905003607.1686172-1-rafad900@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When usb_ep_alloc_request() fails, gadgetfs_bind() takes
the following error path:

if (!dev->req)
        goto enomem;
// ...

enomem:
	gadgetfs_unbind (gadget);
	return -ENOMEM;

In normal case, get_dev() will be called to increment
refcounter from gadget->dev->count but in error case,
this increment is skipped and gadgetfs_unbind() will
decrement it via put_dev().

Going down the error path leads to a refcount imbalance
which will cause UAF in close()/umount() operations
due to refcount dropping below 0.

Fix this by moving get_dev() above the error paths so
that refcounter is incremented before the put_dev()
call.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
---
Changes from v1:
    Removed syzkaller reference in description

    Added Reviewed-by: tag. 

 drivers/usb/gadget/legacy/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index 3e2bce7543d4..181b19e7fc2f 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1679,6 +1679,7 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
 	}
 
 	set_gadget_data (gadget, dev);
+	get_dev(dev);
 	dev->gadget = gadget;
 	gadget->ep0->driver_data = dev;
 
@@ -1696,7 +1697,6 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
 	spin_lock_irq(&dev->lock);
 	dev->state = STATE_DEV_UNCONNECTED;
 	spin_unlock_irq(&dev->lock);
-	get_dev (dev);
 	return 0;
 
 enomem:
-- 
2.43.0

