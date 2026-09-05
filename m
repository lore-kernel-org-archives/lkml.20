Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA632F12A1
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788570607; cv=none; b=s7sJntoW59K26DGzhO0r1XF6ZYWl+gXu04BnT5VbUsf8CpjT9mm5GL2aUTJNQaaOVfkUkAKjc7QZ80YTf1S72lAMM6MZten34ly7KP1Th40QUu/gjOJMWDB/txggO7H8V6cTDmCg8eHuSSo1oJdjdISckRZA1vIxdMKs/UjMQJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788570607; c=relaxed/simple;
	bh=SNNxI2a3/gcWYIHDCxAJDmhPayrpr0/IkhzNYGEv84w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZXvw80rw5A61fU9pZ/xmcrca1rjZwYLANdg8jmntEJ+ynOIxpqk9cN5OQ6dEkl4bRkVqDaZEKMi94NbCxj17/YgM+w8hOGEGGldUo0K+zppxjFAqoJCzPOlFclDPxS/QIa/xjO5ZUS4EkQzeLrsj+V79Ks2kq0wxGB5BTg4/RBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHi7xL9y; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHi7xL9y"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b8687630fso14881275e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788570604; x=1789175404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L6ZpKRzVLfUZkzvwp43ybMZ5F1LoVc1YWYaQlbCksdU=;
        b=rHi7xL9y49TaVbJBDnVbmylRopdqxP14MZPDOdORUp5nGACfLkplzpxXli/Pyclm0P
         pAS06otR0/0JOCaIeYFZXTA4kzGwuY47NeVco7qufKEo8Lh/DrDlvIuRHbGGmj/mOkPr
         iydU/LyqOxbq7wHT5n5NrDYaWM2V+X/heXEl4RCRLErnsTDcwgSlHsJf8bcy6cGDDPoZ
         V3ZaH4IBc/0s3kWRZbs+utUjb8w133K/XyfFUXQpp/Hoq36IYCGSQi2MHOkC3V92AOPT
         jwpCzkgmdCRu0Ue1JrOujMLikjS4lCMVVXdFjlHKhYTl2MaONxjMfJ6trxIqiw8LPpN2
         FtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788570604; x=1789175404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6ZpKRzVLfUZkzvwp43ybMZ5F1LoVc1YWYaQlbCksdU=;
        b=Lew4mH8XhR/E6XeDl97vm2mmaN2n1EJ8z+MRT3hHxe60TX8BC3USeYjg+HPAicViVY
         j1FciymzKVtv4VNEoquk9twsrcz4YogEKCnWY9TDHa5bE+WW0W8EoiIeyO3WLxPCksne
         /+/UDk9ZYi3BUIZo+x8y4eSDfS2vmVH2cmogl7I8gUBKTAT1hVepybCxyfm7rSm9QDIx
         iQcM9cm6Mz+b7zAZwGG5ia0/ZyZ40ysHWLqDdYzsmOGU7nxxnF5WcfPVVm8VDF0wFafr
         e2PaUYWIq2MoEKvKwoPIt++qYlwvMtUDEih9eTIH/VYzGUJSwmFwuo5eXibZblmlRntG
         cxOg==
X-Forwarded-Encrypted: i=1; AKwUvBxBxqKi3OWswszB324vTvBT5Zo38GmgsXMZGsT9zzlVEjI1/ASwFcx1LtzrTN625jKevKNjt/gouUtwO/c=@vger.kernel.org
X-Gm-Message-State: AFuF++lPXbEOKPnb1lzXs8aJ9rVRJBD5yZg7jPT1qaDLiLxyR+PGe8Tf
	QPV8Z6JZl5odwNHXxYgUJFVv0DSWTdvJ+etRctikjto9U+Ip4B1XOeTn
X-Gm-Gg: AYBFou2XpY286gxzWIrTxTIwwE30WJ7MOkuALix6CggBSVwz3/l3UUs8Izv2+INvhOx
	reHJb84m5S3/lq5bBMUqFCXYvnejhgrzvrgXOoTB6QbnNSxcmqYoFpEWDHAh34zcLXJ9aIfIwQP
	d2tsJtoDSy+3EkEr/ScirsHiul6/Quf7kDOjMLF8tA1yfW+WK2WZ64yiF7Lkp++uC5rblhHGOeC
	nFle35NeFlf97nsOYN2HvBMR2yA1EP7vNWm6ft6tHyVogA6yBdiQhPj3pMhokkxjkq9Qy1txgEj
	Ff4k0sji4ebGjC7eV94xGIk5E9sH7qSofvI0CoWfiRAumBC54Sk/HJbU8D9xcxgXfor6gzOCSRx
	DuEGQ1XdgEkaYVRw6kg3/OvGapFwQAPHd/eHyDn5m8zUl2YWyYxCTOPQjStTztVHo++DW1YGmhT
	nrvZadYB7Y9TtGM80PMndTUwonQYr88dH8sjibbiyO+hWEnPlIcNE8LU+BUi/rLmozl0ZdR0dgl
	oX0HAG2UQxYPnX9FTEFWzGShNoPFEZvV/g0axlTzbLmmLa562wiRgcdSlqGurOTVKETdppfGCwz
	C5M5d4Y4XGZq9mZduMb7i3aLugYo3KeIkrzZx8FqKAusCz7wqjMkxF4qm0nQICLhFEA=
X-Received: by 2002:a05:600c:8b05:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49cf82787camr96628895e9.15.1788570603897;
        Fri, 04 Sep 2026 18:10:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4f2-6901-14a0-23ad-a35e-aa8c.310.pool.telefonica.de. [2a02:3100:a4f2:6901:14a0:23ad:a35e:aa8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm183156455e9.1.2026.09.04.18.10.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 18:10:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Yang Erkun <yangerkun@huawei.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: sysctl: Remove obsolete sg-big-buff entry
Date: Sat,  5 Sep 2026 03:09:52 +0200
Message-Id: <20260905010952.57451-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sg-big-buff sysctl no longer exists. The documented SG_BIG_BUFF
macro is only a compatibility alias and changing it does not alter the
driver default.

Fixes: 50209dec14f8 ("scsi: sg: Remove deprecated sg-big-buff")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index b6328cd0f43e9..d9e9b12136eb2 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1334,19 +1334,6 @@ seccomp
 See Documentation/userspace-api/seccomp_filter.rst.
 
 
-sg-big-buff
-===========
-
-This file shows the size of the generic SCSI (sg) buffer.
-You can't tune it just yet, but you could change it on
-compile time by editing ``include/scsi/sg.h`` and changing
-the value of ``SG_BIG_BUFF``.
-
-There shouldn't be any reason to change this value. If
-you can come up with one, you probably know what you
-are doing anyway :)
-
-
 shmall
 ======
 
-- 
2.53.0

