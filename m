Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815360;
	b=CPbHFm+5C3h5Rmh2FvBMlD8UuILZHGvKJlqy/zppSfwaXv9K4UWnNY9RHfbJdGA4VYdx
	 nAnRd5Dyv/qgqla98gZkUF8vblnc722yGYL2mINkCycUm+FNl1j8pzZy7dt0pG0rcSKhk
	 IApnj8nV53M51XEX2Cnh0flhGbD30Xr4GkE+xdesZj9yvK7OvVjY7I5w7iIJK8wMITgYw
	 SHM5D+o8oSbVo6H8uZ6gxhbuGAGes+miOSyXkVrDwxbcdGUWKLjaTARJ+lat7eJ9RhGwS
	 MoBhDQ80X2IufSjP94ObwzZ3MFrsyDtFXkAbq991dn1EQRrwCH1KTLvmZQO4y3/I7gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815360;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=qfEwEGdsfpaSsQ0CV8iU4w1B9JOv1XHHo5P0ONr0dGk=;
	b=OAsqL0dDtDsbu/QJljO2WdjUW+2CJG9A6wZqPTgRhyRy0/zXCRObMmLwrnHqDp/3bpXp
	 n7aUEBhomHlaWtXaE+T/uib0I4X4jf6El/FJWYVFetn2sK7uYlIshABEOhwRCmM4z4e/1
	 bVgzbBkzlfrolx/vEgSaasA+F7wA8UxjUA7HvYlePcBnXD2QoWCPxn+SXCOLwgO2O1U+T
	 kx3JuwVufYJrrLBufeHwfGFvmx4c9UJMkA799czW3n1JOgE/4X5jVXrXhvcrJHOJec94s
	 WE+QGAxRABURnbzkK+nC2Rj05P1pVkRn3H/r/A5KTO34sSVYOyn1qOcqeQA5XboE4nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UslJmPZB;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C899F606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C899F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UslJmPZB
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso1118433a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815359; x=1795420159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qfEwEGdsfpaSsQ0CV8iU4w1B9JOv1XHHo5P0ONr0dGk=;
        b=zn0NpKFAfS0r1ikkc0Phr7o/+0+jjlYdDHHWx3NnxxtGUXiTwOuJJ+I1PrEJgH4S3Y
         aneJ3CjNliMt3e2qjQsCKstKiNA4UrMQwojLUTWX66enM59/y8MRkSUrzCT82f74Z7dV
         dHno6gPKQA+vZVMWwg95ZTxnX8vU2nY46GezdiFbBF1kgdK14Uw3tXHIZ/SmSsfzDWUm
         Oks9knNUFhxCd/hIHyXAYkVkfcAzVo9tF8mJjaHwKnXzcZfwGy4V+imXeKCp+rbx3xaC
         WGwwINp0fXPs4viPpaGlBzR4rrPd1a0NVLdH7OxPgYw99IPLeJPqo0NeRMzocQWA3tEh
         Z9+Q==
X-Forwarded-Encrypted: i=1; AL+hErHZWIon4cs6vSTt9OXUJj/p4Sa+uJLD9ANFZSummGjTaamb5ngjsQkjOmbtZrKRR5uQuz2+LNPPoEBcy0Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4dfrZi4NLbmi6UlMaHCI4H/YBfKHDBMoga8PiQF9hk8i5S7sT
	CxXdsjASeqxc9CKQHzRgmF1BaESPPlWJMIUveHFHr1lMGyTRt0tsgVtrxfo/R0h0kHwkN3+8j3h
	aFBgb024rGIoEVvh6RpQMk0APwqXiOuiLSDCztzddXH8r9QZDnkyS1P9oagj67pCQUX38YefkVL
	vDa4foU+Hq2GaNwGAyss/qBHePjCKGVUR8U/bSM6C0ZxdqUR1phtTLPeVpDNjL6esOPet+mk0X4
	6mQUO9JXyIyQqa6pDKnYgOq
X-Gm-Gg: AZFdTZd1Dz9klljlm/TfvKJJPb2g1BlI+W5Z8jYAwIfRqs30mYFmQc73LQA2zTwBcFc
	oKrstelpI+RRxWlJwCfRGI5nKcxkIxYnOk5112ahDhx0HXAUvzJgRrXhH8nShkQM4pbjIrs7upI
	QRGre/ywHGq9Ae+oUTu3eyH0yzTRyeknVQYa1sLgl318dTGDOKG5UPCNJN03hbgmOH5MexgKnTn
	jOXsG8yj7UFDftZU2EbJ2T71A2L62BxbvwhlvLrozYyhJ0a6/DdNb3nkazCw2UHdiD82oxQS3d4
	YqJd2owHPwFTg5nY/uOCNiAELlqKlqQIWhPjGKMlgoK9i/VEaglQq4LaOSKFVn5X94pfvfngJLu
	bbCsMeiy6gciqg4nX8G4VPOW3fPqOreCYf5wlX+vg27LfM9KKQHuxAQQ0tQVjX7T9EafSRJDtZ2
	1mHGSmt9c15DxF7j+GzuqmkXyHbWvEr6TmQRV/6QG2
X-Received: by 2002:a17:90b:4a88:b0:3b0:a7b5:c037 with SMTP id 98e67ed59e1d1-3b1b07fecf9mr9422262a91.1.1794815359091;
        Sun, 15 Nov 2026 23:49:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae9bbffcsm11288596a91.8.2026.11.15.23.49.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:49:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ec6cd898eso67490406d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794815358; x=1795420158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qfEwEGdsfpaSsQ0CV8iU4w1B9JOv1XHHo5P0ONr0dGk=;
        b=UslJmPZBBMWxXiIGaZ+wfVp2KPNXzFws9P0FePRAxwQZGpES3oH8a8jKyUUTE1fnm4
         rbYJ6AAVmTsjKY0F+DYCGYOB13q+Ww1bf1uA8nQ7RJG5DPLZ7LLj5YvrKmWnYkJrses5
         sqOjGIX7dGOPOe0Pf91azz3xovi59t/wuqcFM=
X-Forwarded-Encrypted: i=1; AL+hErFq2ue1jLpw7+GdD/7Bh69I7TXJhc8rn2o6GKpMFFdNlMeAdZMsTclHsDDwSpXPegVhvU2vI0RPMMeiyYQ=@vger.kernel.org
X-Received: by 2002:a05:6214:4b10:b0:91e:f04a:b237 with SMTP id 6a1803df08f44-91f242135efmr158105606d6.39.1794815358071;
        Sun, 15 Nov 2026 23:49:18 -0800 (PST)
X-Received: by 2002:a05:6214:4b10:b0:91e:f04a:b237 with SMTP id 6a1803df08f44-91f242135efmr158105406d6.39.1794815357480;
        Sun, 15 Nov 2026 23:49:17 -0800 (PST)
Received: from bld-ams-bvg-44.ams.broadcom.net ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f8319d44bsm36603646d6.4.2026.11.15.23.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:49:16 -0800 (PST)
From: Stefan Chulski <stefan.chulski@broadcom.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Chulski <stefan.chulski@broadcom.com>,
	Ilya Lifshits <ilya.lifshits@broadcom.com>
Subject: [PATCH RFC v1] ksmbd: add use_unbound_wq module parameter for the ksmbd-io workqueue
Date: Mon, 16 Nov 2026 08:48:49 +0100
Message-ID: <20261116074849.475815-1-stefan.chulski@broadcom.com>
X-Mailer: git-send-email 2.54.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The "ksmbd-io" workqueue has always been per-CPU. Commit 69635d7f4b34
("fs: WQ_PERCPU added to alloc_workqueue users") only made that
default explicit as part of the treewide transition to unbound-by-default;
it was not a ksmbd-specific decision.

Per-CPU work keeps request processing on the CPU that queued it, which
is good for cache locality, but it also runs work on CPUs that were
isolated from workqueue noise (isolcpus=, nohz_full=) and prevents the
scheduler from placing blocked or long-running workers elsewhere.
Which behaviour is better depends on the workload and platform.

Add a boolean use_unbound_wq module parameter. It defaults to false, so
behaviour is unchanged unless it is set; when true, "ksmbd-io" is
allocated with WQ_UNBOUND instead of WQ_PERCPU. The "ksmbd-break"
workqueue is already WQ_UNBOUND and is not affected.

Document the parameter in ksmbd.rst.

Signed-off-by: Stefan Chulski <stefan.chulski@broadcom.com>
---
 Documentation/filesystems/smb/ksmbd.rst | 6 ++++++
 fs/smb/server/ksmbd_work.c              | 9 ++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/smb/ksmbd.rst b/Documentation/filesystems/smb/ksmbd.rst
index 728cfca13205..a045ed6db9b3 100644
--- a/Documentation/filesystems/smb/ksmbd.rst
+++ b/Documentation/filesystems/smb/ksmbd.rst
@@ -158,6 +158,12 @@ How to run
 
 	$ sudo modprobe ksmbd.ko
 
+   - Optional module parameter ``use_unbound_wq`` (default ``0``) makes ksmbd
+     use an unbound workqueue instead of a per-CPU one for request
+     processing, e.g. when CPUs are isolated (``isolcpus=``, ``nohz_full=``).
+
+	$ sudo modprobe ksmbd use_unbound_wq=1
+
 5. Start ksmbd user space daemon
 
 	$ sudo ksmbd.mountd
diff --git a/fs/smb/server/ksmbd_work.c b/fs/smb/server/ksmbd_work.c
index 6e5122e2d6fc..0447b2da84d5 100644
--- a/fs/smb/server/ksmbd_work.c
+++ b/fs/smb/server/ksmbd_work.c
@@ -7,6 +7,7 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
+#include <linux/moduleparam.h>
 
 #include "server.h"
 #include "connection.h"
@@ -18,6 +19,11 @@ static struct kmem_cache *work_cache;
 static struct workqueue_struct *ksmbd_wq;
 static struct workqueue_struct *ksmbd_break_wq;
 
+static bool use_unbound_wq;
+module_param(use_unbound_wq, bool, 0444);
+MODULE_PARM_DESC(use_unbound_wq,
+		 "Use an unbound workqueue for request processing (default: false, per-CPU)");
+
 static int ksmbd_reserve_iov(struct ksmbd_work *work, int need_iov_cnt)
 {
 	struct kvec *new;
@@ -108,7 +114,8 @@ int ksmbd_work_pool_init(void)
 
 int ksmbd_workqueue_init(void)
 {
-	ksmbd_wq = alloc_workqueue("ksmbd-io", WQ_PERCPU, 0);
+	ksmbd_wq = alloc_workqueue("ksmbd-io",
+				   use_unbound_wq ? WQ_UNBOUND : WQ_PERCPU, 0);
 	if (!ksmbd_wq)
 		return -ENOMEM;
 	ksmbd_break_wq = alloc_workqueue("ksmbd-break", WQ_UNBOUND, 0);
-- 
2.54.0

