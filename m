Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4346D09B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537191; cv=none; b=tKiFRI6adjnj+IwcU6TNgo1s99rhpBgXCNjc2H2VLK7/O94LVNbXlmf+1aqX1RZdsjjkxaOToHGK9pOXb7KXcWnUKtQYqwGAoKc7cBTRfluC23XyRQkZa75tOYXPGtY9RcQ+SvMjMJfEzTUfCjwSe+UlbyjMLy05+nwODQ7RbWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537191; c=relaxed/simple;
	bh=ce8IFznMENWgDfvskcJyGjHIaRDeyquxTRFJpdXtgAQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LVZYmbCqiJ3krsVDqL0V2gBVWzAy+/1KbnRNG2lzdIH4KdCcbZ32O3UXbcQi38ftnYARDo+PI6JttS8THlP7WVDeeFhb6AzliHTbDZaanaQNPKj4xm1FY+QVU9osRklZis7VLfinkMS3t/vPM51mdnNKQKx+pqgwg9ULU72t+Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xm6IWLTt; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xm6IWLTt"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1354019a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788537189; x=1789141989; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SGiSc34z3NAjOFx7jNSchlmLnMlO9ZnccSX8lcYMPKM=;
        b=Xm6IWLTt544iDs4i60ST27W301cCvdOvyAP9U2kfEX9K6jZTQ+BJ/KsOYco4qdCAr0
         /IG9HKs6Yt423KqGFJWyQ6XZ+1Y7LkAmk0JM/KlfbnErkylw1h4XuRR3lerBeWdH04VU
         mGy2btdwCDKfhs5TmGGQTzvEewqL21ou+KnbMZ5WEkQ77cBHHkMC8KOIrQi4wTOoyC3f
         16H84hn3kWdfNrY33ML++jmZdhZr2Dy2ySSPFbdApGWyywyWGmaSutGydkU9C8chlffm
         lQ/gyFTxijYWlEpFNu/VNQtNQ6N7varH+7tWc0w4O+Q+yyVkl/Mfuw5w/RnePJVN8ZHX
         4cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788537189; x=1789141989;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGiSc34z3NAjOFx7jNSchlmLnMlO9ZnccSX8lcYMPKM=;
        b=jxKv9x3wsfnydmjjXpPA8By3vWi3BUGSkYzkS3qzRZl5tMBB4UuE6GFg0SVNr/lQ/N
         YIzqnTZXNbYBERTU01h5HSF4wcbrIXn/0LxDOPPicyMGYdQuTGVdcAAROTaTn2QKQ249
         rAariw5Ts9pvP/DJ8UidTtc5IdOlCt7s/vv3IXyHlg4OB49FnOVoQ6RXbktLznO2PrEQ
         H7eAw4T0l1jOWohRp1D/c46qN/VAyeL8C4Dn8a61oh84V4QwwljN6wYItBR4WnIKbL4t
         I46sxzd+sS6u8WRw9SyDbKH/bD48V5RzVmkLnSvdQw9rJYjKIkFxZ5dkrXp8Xwl7MuIK
         DvvA==
X-Forwarded-Encrypted: i=1; AKwUvBylzBEpUtoMbLKMWYZcIUJ1AuzSyfzG0AgcQbD4WF75iJOZ4wNGDAxafWDKaiYZK/F3SuWKi+d3JiPalhk=@vger.kernel.org
X-Gm-Message-State: AFuF++mbC6IO1CZM3mLC9/8Ec7HP54WNjjsfXTGvNuoPJOOw4pMu6Rt6
	aPIGOQ1Z47pBFdzLVJgMgFJ9eo1hn4KFlI6PuTcDSrIP1oXlgfZ5ISwNx7GzTlca7xijU3mjNM6
	5HcxyIkF6IYlbRZuYqEYBnQ==
X-Received: from pjbdt19.prod.google.com ([2002:a17:90a:fa53:b0:38f:c902:4ae8])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4c03:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39b26130698mr9199108a91.11.1788537188969;
 Fri, 04 Sep 2026 08:53:08 -0700 (PDT)
Date: Fri,  4 Sep 2026 23:53:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904155307.150443-1-stanleyjhu@google.com>
Subject: [PATCH v2 0/3] Fix RPMB cross-subsystem UAF and UFS OP-TEE RPMB lifecycle
From: Stanley Jhu <stanleyjhu@google.com>
To: Jens Wiklander <jens.wiklander@linaro.org>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>, Brian Kao <brian.kao@mediatek.com>, 
	Brian Kao <powenkao@google.com>, Avri Altman <avri.altman@wdc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

This series addresses a critical cross-subsystem Use-After-Free (UAF)
vulnerability in the RPMB subsystem core, along with lifecycle and bus
registration fixes in the UFS OP-TEE RPMB driver.

Problem Overview:
During concurrent accesses to an RPMB partition while the UFS host
controller unbinds or shuts down, a critical Use-After-Free (UAF) occurs:
1. When the driver calls rpmb_dev_unregister(), device_del() drops the
   driver core's reference to the parent device taken during device_add().
2. Because rpmb_dev_register() never explicitly pinned the parent device
   via get_device(), the parent device's refcount drops prematurely while
   the child struct rpmb_dev remains alive via external references.
3. The parent driver teardown frees the parent device structure.
4. Subsequent calls to rpmb_route_frames() dereference rdev->dev.parent,
   resulting in a crash or arbitrary memory corruption on freed memory.
5. In addition, in the UFS RPMB driver, struct ufs_rpmb_dev was allocated
   using devm_kzalloc(), which gets freed prematurely by devres on host
   unbind, and its bus_type was never registered with the driver core.

Patch Breakdown:

Patch 1: rpmb: core: Pin parent device and guard requests with rwsem
- Pins the parent device for the lifetime of the RPMB device, and
  guards in-flight requests against teardown with an rw_semaphore
  barrier.

Patch 2: scsi: ufs: rpmb: Decouple device lifecycle from devres
- Decouples ufs_rpmb from devres, managing its lifetime strictly through
  the embedded struct device reference count, and pins the underlying
  SCSI device.

Patch 3: scsi: ufs: rpmb: Register and unregister ufs_rpmb_bus_type
- Registers ufs_rpmb_bus_type in ufshcd_core_init() and unregisters it
  in ufshcd_core_exit(), preventing device_register() rejection with
  -EINVAL.

Changes in v2:
- Added Patch 1 to pin parent device in RPMB core and guard in-flight
  requests with an rw_semaphore teardown barrier (sashiko-bot).

Verification:
- Tested on QEMU ARM64 with concurrent RPMB accesses under driver unbind.

Stanley Jhu (3):
  rpmb: core: Pin parent device and guard requests with rwsem
  scsi: ufs: rpmb: Decouple device lifecycle from devres to avoid UAF
  scsi: ufs: rpmb: Register and unregister ufs_rpmb_bus_type

 drivers/misc/rpmb-core.c       | 24 ++++++++++----
 drivers/ufs/core/ufs-rpmb.c    | 96 +++++++++++++++++++++-------------
 drivers/ufs/core/ufshcd-priv.h | 13 ++++-
 drivers/ufs/core/ufshcd.c      | 16 +++++-
 include/linux/rpmb.h           |  5 ++
 5 files changed, 111 insertions(+), 43 deletions(-)

-- 
2.48.1
