Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253AA3D669C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791395353; cv=none; b=JkJFb0NcmT5gocXNGvoHjsvhvohb1VNkS5SHhBTC+8B4bw5kbstdjots1yJ2W//IswXQ/6kvIIdvjTf4U76NHBbcKliX8YqHwyottsGu4ShfqK7S+TLMZKMW8R2ctPEnlAtfPjRKEsuL7s0ciHsFoAJNwAdb+GzYmalrnbQPhs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791395353; c=relaxed/simple;
	bh=Ot+JttkXEMn9ntfD8PPddagGEyHdcXxGuWIo2KvS43c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LrFwuY0W6ggGHuYVl+p1POdlS0L8vf5S690693fnuqtKuYgrhCb2KZNBasCqBKGa/1vfuHhW61cEJSNJ1gJWd3H/M4pgKlh2XPn83/mku89sw6TXZZzOZJByimOdKm/wh1QZW5Ua5qCNZCeTk7XZ7+Av6wGKRD2vIxibPT0qGeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=LNqt9BLP; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="LNqt9BLP"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a865731ee4so1909198a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1791395350; x=1792000150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QBM/xTPgPNVkXMLpWmbcVvy7h5tjvt2S2rOkYcHy1i8=;
        b=LNqt9BLPRTFOYpoLtUjCBQpSIyZ0mEX4rACP/vArx908M2VJOcJnGHmIPfNkKTI9e7
         N/XrRQGXtiy//rutDX+P1+XjviKIpGiDG7G9bAooVzneGCt5n6or5wqGhC2qQBMBb4hF
         2QhsKkKfAWIPNooJgBW81lNbDkuNIDgvO8l28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791395350; x=1792000150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBM/xTPgPNVkXMLpWmbcVvy7h5tjvt2S2rOkYcHy1i8=;
        b=TcpIkG1L7quVetJAQ3VttDXQ0SXV543J+6TLXyzUgi3w2sQlun2sDX2wjzK6SmrMQP
         AxZGnFQG8CP7V0baYGAB003TxWY19oluWW74ScDSLDzuTnWosq6WxCEh2i62ag+NkTPS
         iwme3QmJgdErSLzbCkXnvIrkFg2/gxqzeLh6GCLDg4UzFZB4vnSfUgF4u6LFaZIhLpCj
         Mjc6zVE4rY4o3bINA/xVaRcEmRJgK89YQuggGdF1smFBeSRJbwAdWzQF/XVFlT+3paAP
         tvtR2KooNQKzchtqk2tpvYa/sZ+5Rp2jfpWANLZQkje6S0a0sLOJ1dvCYLXOKVHQAeYD
         dDyA==
X-Gm-Message-State: AFq9FYLNk7ufdKDsNucsxgb7U8kpxsRgjUdzFEblZOF3vbPHBpJ1w/Vq
	0vBZb4ayazjQSKEjZ64GS3qmO8OP49yR2ejc6195IQHYl6YPQui1fP4WkzHjPAZkK3o=
X-Gm-Gg: AYBFou2UmVt1DOB/jarDzTEO1H9kT+q+LOgS1fxZlZSDUUWxdXpcU2RfECIDpsKmPgv
	ra/WjfabH6Z2Fb7Ms5e/6T0McdWV8VSiG++jJR9PjoOgbfAOi2KNnCQF+M3PrSE4KqEk286XsAO
	IFKubLfsw69TUUN3N8CSqNEfVkA+gL0eqIRw2rl/JTBPAcJ+XDoWKRGqdfsYtergfCIi9AnldHW
	VbGFjrzwMmClBmtWPF1wkaheVZv1i3chHMZg9Cw1WTGfyetMmsPtOe4zW7A2iTIVs4i2D4Y+TJ4
	/DKomVKP5t7Lg5kIktB0ETsIaKQl7qrNSfzuezEAWWwTLdVNWZfTDqccPT30KjOT+U3fEaR4NI4
	7X2f8QkAB+WE6oaAX5koOxHNp7jAd/WmwndY3dfkh/qmPptmYyJ8eum3QQJX7w8tVHqDnmOerpU
	j3J6+gxe2iTiHlZr2R/ndRLucawtvRuYiRzIbJmJPNugWhi1bLyrIJVbHi0M/Zj7BA4/flY4eDy
	Uyiz71yjspoYu+jyE0=
X-Received: by 2002:a17:90b:3d4b:b0:3a8:4b7:e8c9 with SMTP id 98e67ed59e1d1-3a8a1bd6d70mr2578183a91.59.1791395350211;
        Wed, 07 Oct 2026 10:49:10 -0700 (PDT)
Received: from kinako (softbank126208129055.bbtec.net. [126.208.129.55])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm430296a91.15.2026.10.07.10.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:49:08 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	thehajime@gmail.com,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH] proc: nommu: Reduce useless includes
Date: Thu,  8 Oct 2026 02:48:45 +0900
Message-ID: <20261007174845.1320996-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This file seems to have undergone refactoring without cleaning up
the unneeded includes so now includes a number of headers that
are no longer needed.

Clean up the includes to cover just what is needed.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
Spotted this while trying to work out something else.
Build + boot tested on m68k (68000) nommu.


 fs/proc/nommu.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/fs/proc/nommu.c b/fs/proc/nommu.c
index c6e7ebc63756..b173c8e3887d 100644
--- a/fs/proc/nommu.c
+++ b/fs/proc/nommu.c
@@ -6,24 +6,10 @@
  */
 
 #include <linux/init.h>
-#include <linux/module.h>
-#include <linux/errno.h>
-#include <linux/time.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
-#include <linux/mman.h>
-#include <linux/proc_fs.h>
 #include <linux/mm.h>
-#include <linux/mmzone.h>
-#include <linux/pagemap.h>
-#include <linux/swap.h>
-#include <linux/smp.h>
+#include <linux/proc_fs.h>
+#include <linux/rbtree.h>
 #include <linux/seq_file.h>
-#include <linux/hugetlb.h>
-#include <linux/vmalloc.h>
-#include <asm/tlb.h>
-#include <asm/div64.h>
-#include "internal.h"
 
 /*
  * display a single region to a sequenced file
-- 
2.53.0

