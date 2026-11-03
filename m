Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689462;
	b=nbBmuhcx79GrP3J3VijNjJ7HtqBeiXumY6IuXi/S35b8cvCScB9ZgA7dKxUVl364B/vL
	 QM6giSdAgw/ymAQDoYU5rRWPjdS4Yc6605/eKvCx29RyruQWu5I3rhUcwaFCNro0zY+oW
	 EthVMU8nixal6kJzux19emldgZebB2Eu8kr9wEDnDRiwcqxmXLaE6aVm1HzR+N2yIcjXh
	 doaYKlBI7e8HPg8ZSzNXzEmJ4np8wt3CRoqNf0hEOY2RN3OTYOre7AqRqBv39DDZYlkMb
	 mHm7/3+z48taRVchGTtx6N094HlrSLH1lhkcOvWVtR0I7BsbXFVrVx5hcx2zpyfo2gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=v3HVGrDn19qzJKOsOUSd0NNPtRrAAsxOMD2NnhVPCgo=;
	b=F/g4ecpGpxxbehVS10DO46gOPARPa0MDov2jdxNaIjwgckqEP3prhl4AAaUOSXKTmwUw
	 9dV7JPMYnrH640GePej2u+1Eef79FB/C3bT1sKq5/wekv0taD2XSUhIpe1y+7E9Ppxqd9
	 XOFRwo9gK6S61lTJLCgBDZ1f2ff39FNq3qtV03QJrkVr8c8qIS6FqYAgZVUMgdiY+UtQp
	 7+6NRnrzGJitJlzsx7sMbGiO0MLczzuf3CHfVOeL54LhgREl0qqtBEVkrBR7xj3BZXCDk
	 ZQkZGklEHIPN7XLkckhAseSthx+P7UU8SM+qFNphaP61jSunJBh6eSUvjIanmMJw70A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--robertpang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P3IPTl+R;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03E0606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C03E0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--robertpang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P3IPTl+R
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1aa0fb7f157so6032720c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793689461; x=1794294261; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v3HVGrDn19qzJKOsOUSd0NNPtRrAAsxOMD2NnhVPCgo=;
        b=P3IPTl+RbNzVLTOKrXaQQZns1M7Zkhfj2OCkUUY9k5uIssjSECmBKFO11x14bYMJXW
         +6tpc8ksOZ7B2A41b0/UUh80ncD04oS0nTEEwmLlvoZAKsn5FLQy732N+X7TVQjXM7Cx
         gGgZuEC6HRpeEQb2AvwEsh0v3peWfOFRIUvwoNGgk0/V8EjDS4QgZ2G+13vy7Uu+FNYL
         tOipZ5c3pFoaOoeQuYSF/DeoFJdy5VIF5XO4tPFkmoHFYpM5SNsdWVW79BjZEUryo1TT
         jd7Uz2TKEJXbudVZE71wqbqjJBWi8lITCawdu5ToY/oCIA9pJVHIJ5mMxe2sMAi+l8Ub
         KGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793689461; x=1794294261;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v3HVGrDn19qzJKOsOUSd0NNPtRrAAsxOMD2NnhVPCgo=;
        b=jyXaFbV3bJDRLJmwCiLoh/wepfHcjA5qyqwV1LXApUGcachrfuKku4RckRUhlRmGr2
         XoBtWVDrkpNZyqVYDH478gAn3EsNn2MX9e9qhPlccj0BTGLjjFrR0fGBjhEAWYzooSIv
         z7oaUcwgtqiyjzpBDFg+LcAMcPEoSH++xXUEhDRx67u0bGKJIwuC9MqE4mcz1GJ5OCaH
         KdyCFGmsl9R81C036n3Q0sfH9/7upRvMDowLDuSbea+kbJrtdV/ha8TJPs6KyedOu8mV
         uZyh1He77pfag6yfJSh5Dl7+i1JxveRFsv9e4RTxPZwOevKNauWQQDPqG7qqJ02jdJRk
         lz3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxQTzw/TzIMT7BzbTbTVBloFDP7fEc9aIKdvnlZC3lgc1wyzvqgln5hwSEcjwWgqHb2QlGUrQx747x0jMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nEap4tZcPP3lQBGxkhQKAbkrZqJwm9hNW5jhe43+MmusVmFqm
	M0f+aGBw9sk22/c7kKOneR+pmzS2EJG5BjgZeUXPtOalodp4/S6Mu6bg5HiEOwLwWbWZi6YlUm6
	PbVdUyW3dV0RjXVfl+EH+3g==
X-Received: from dldyr25-n2.prod.google.com ([2002:a05:701b:4519:20b0:195:cde8:ab41])
 (user=robertpang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:1089:b0:14d:3c0c:79e9 with SMTP id a92af1059eb24-1ac5b027fccmr17755954c88.11.1793689460359;
 Mon, 02 Nov 2026 23:04:20 -0800 (PST)
Date: Mon,  2 Nov 2026 23:04:06 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261103070407.1211071-1-robertpang@google.com>
Subject: [PATCH] bcache: fix available bucket accounting in bucket allocation
From: Robert Pang <robertpang@google.com>
To: colyli@fygo.io, kent.overstreet@linux.dev
Cc: linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robertpang@google.com
Content-Type: text/plain; charset="UTF-8"

In bch_bucket_alloc(), a cache set's avail_nbuckets is decremented whenever a
bucket is allocated, assuming that the bucket becomes unavailable once
allocated. However, when a bucket is allocated but the GC mark is unset or
reclaimable, it is available still. This false counter decrement leads to an
inflated in-use measurement, which triggers cache bypasses once CUTOFF_CACHE_ADD
is reached, persisting until the next garbage collection cycle.

Fix this by ensuring avail_nbuckets is only decremented when the allocated
bucket is already marked and not in the GC_MARK_RECLAIMABLE state.

Signed-off-by: Robert Pang <robertpang@google.com>
---
 drivers/md/bcache/alloc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/bcache/alloc.c b/drivers/md/bcache/alloc.c
index 3ec240ec685d..2d0cb9b414ac 100644
--- a/drivers/md/bcache/alloc.c
+++ b/drivers/md/bcache/alloc.c
@@ -446,7 +446,8 @@ long bch_bucket_alloc(struct cache *ca, unsigned int reserve, bool wait)
 		b->prio = INITIAL_PRIO;
 	}
 
-	if (ca->set->avail_nbuckets > 0) {
+	if (ca->set->avail_nbuckets > 0 &&
+	    GC_MARK(b) && GC_MARK(b) != GC_MARK_RECLAIMABLE) {
 		ca->set->avail_nbuckets--;
 		bch_update_bucket_in_use(ca->set, &ca->set->gc_stats);
 	}
-- 
2.56.0.398.g882cbad275-goog

