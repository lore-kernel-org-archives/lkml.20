Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A931947CC71
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061725; cv=none; b=F5pllXjy5NM1jsAa8M/Q/ZaZpIux2CuhiSymKKPFO81gyPYPx3jmlLR44h+vbFnVH0FNefJsHilZVE2Jo0Rk8D/gyw3Oihx6RD7htZbP8yWsKXfrwGKl2o4l8WFBhmMRjn5gndla05fYHNVT2Nnql/VIURslpMuvXbcIDvuOUc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061725; c=relaxed/simple;
	bh=MnwjxHsRvv6B7ebV4jOBaeSUOdh4EX9DSXNEM3ODyYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ic5+laSnP2fJpgcO3f57TK5gVC8pu6Dqv4WvGcvFwUv7kpTuLvjDPg9HAN6Xtb/VOjoD0Q1THmL2+h1VyvDtXh99Xbrla3fFTw+npDriVQcRUk/pAJiRSXarAQ6oGXS24/v/mPSooGM7nHK0BrKY0wUlnQOx0iXCq9oOxKQzxQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cX9JLXY9; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cX9JLXY9"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso3124108a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790061723; x=1790666523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YwywWDLrZalzz03FLTpDP9g/tBAvW+/0SJTZpW2eZ4M=;
        b=cX9JLXY9ZzuzueGaBeNkOosGlWrBoNQ51gqgemit1k96eNxTZ7FNlFC9joRbJA+43Y
         jDZ0gf/RN9hg3NZUrjaSQg5KPCRV9bnbNMikkZQShOMz4kh7FOUZmHASy1XqLHSi+/f3
         zBuI+/q8xDZNPoC4gV2UIJWa39H6CIjUYwY4xggHJq+HGi8TQ6h7iYkt+V6s5sMSkKMu
         D9UYMFFZTaotJLC7rVJwfoy+PU/uIx8i3rMqs4xvanTo+Q9BzW9JNtgaj8ztdMu2MMDK
         H4wZnm7LyAhmc7Ys59ohClY9YRU6VHFLyoHHcllU8qjmqVkxj4O4ma+TDPUx/KJBNYnh
         dUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061723; x=1790666523;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwywWDLrZalzz03FLTpDP9g/tBAvW+/0SJTZpW2eZ4M=;
        b=L+dxd8/c1wMZHCE4cfWH2uNcOyrS9mH7rn1znYEWgIdaRICgXHxiqqoRheEo1IrSVr
         ZTWTtHeaWC8OMYrfuExQpZ7orNNmVMCXp3TsIjPpsMjUj1pcVMJ/WxiPiysyv0iqqTgu
         G/oKZcHlpghADpOr9txSvfKCBsUm/876/4N0YuSkGawhSm8vqTz3LWkiKTfLWorxXQBD
         VysMWdCBzL7ImCUWEflNi08IverLGgvxpqv7FApJXkrot9gDAADoikwsdUhtMOtydFqU
         8aEQHFF8Q4Cw1CobczhL7cumEK+IXkbgvCSz0wHysSDo4jrVUt11Y2ioMIzUhNiN6Yd/
         OmpQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0F8tT7YsfxlcFHx+Xo5UQa+kl6yH4hwGzGBpcS9u46BvnLL9OfLCj/DtAbYqBm/uU9c4qH8W9+eGUmGM=@vger.kernel.org
X-Gm-Message-State: AFuF++ndykD4jHd8huuSJJp7v9ejKCpUPM8Gtx7lbhgIXFyfJqcs+sCd
	S+RFEaWJTF1uvSQgzvYtcoA60yyRfyqc/0DNmJxojLCLfy+BKaw8l2Pe
X-Gm-Gg: AYBFou1iONDDJg2gjWQECIL4KhXueilE9VWsApQxtr3G5JUtePBjpKcFqm3PAUa7XPU
	xfb5XJDU2FAUg5IR2/fiAQ32ICOjToR4G76azcbHIU/G8+2yuSzcWGCEEIkZWsIAVW6LN3WL9gQ
	sBnFnSR+01OmBVUUy4kxnfq2qECR968sc4w+Wk9MAL6zh6uTF2CGiWCQXz0gXnBeEkaLUJVElnj
	4LJh134z2SOY1bALIJRN2c1KehEnQmnNS4G8L7MSvkFS3d9dan3ilXK3D4gPjPEskBdI1IK65kl
	kAQZ3UV4Zsz36uKfAZi4TAzksr7BXhnRD+sZ13RXarNZwSQOg/dBGvQMvmah7B6LnGvlsK6crfi
	cx/O80z7g69VAGTvZSEG0QmjXOsoEQ0+fdmTpLXnGeNsEV0qrysBt9KHthNJss+mYu423jyRuT+
	twRrPK1XJkT3KOe8YYaJKW3rRz98YiRcG2z3wto6VdbLpMG7aTdJ73A5uJ3RO5jOZgtODHca0/0
	7ajqYhVoXSRYlLPTw/ISW1OEilhbK//ULuIWoc=
X-Received: by 2002:a05:6a20:734f:b0:3dd:a007:cb35 with SMTP id adf61e73a8af0-3ddec82175emr329149637.49.1790061722924;
        Tue, 22 Sep 2026 00:22:02 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:b94b:d1b8:4cbd:b7e1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756a317ccsm443117a12.14.2026.09.22.00.22.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 00:22:02 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH v2] xen-blkfront: unbind irq before tearing down ring and shadow requests
Date: Tue, 22 Sep 2026 15:21:55 +0800
Message-ID: <20260922072155.34625-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <arD7FHmbqJlLHmyE@macbook.local>
References: <arD7FHmbqJlLHmyE@macbook.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In blkif_free_ring(), the driver tears down the ring's persistent grants,
shadow request arrays, and shared ring structure (xenbus_teardown_ring),
and only calls unbind_from_irqhandler() at the very end.

While blkif_free_ring() is freeing persistent grants and clearing the
shadow array, the event channel interrupt (blkif_interrupt) is still
registered and active.  If an interrupt arrives from the backend during
this teardown window, blkif_interrupt() reads rinfo->ring.sring and,
via blkif_completion(), accesses rinfo->shadow[id].grants_used and
rinfo->shadow[id].sg.  blkif_free_ring() tears these structures down
without holding rinfo->ring_lock, and the handler only checks
info->connected at entry, so this is a real race resulting in a
use-after-free or NULL pointer dereference.

Fix this by moving unbind_from_irqhandler() to the beginning of
blkif_free_ring().  Calling unbind_from_irqhandler() first frees the
IRQ and synchronizes with any in-flight interrupt handlers on other CPUs
before ring memory and shadow request structures are deallocated,
matching the teardown order in drivers/net/xen-netfront.c.

Fixes: 11659569f720 ("xen/blkfront: split per device io_lock")
Cc: stable@vger.kernel.org
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
v2:
 - Update Fixes tag to 11659569f720 ("xen/blkfront: split per device io_lock")
   per Roger Pau Monné.
 - Add comment in blkif_free_ring() noting that interrupt teardown must precede
   freeing queue-related data.

 drivers/block/xen-blkfront.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 8dad7bf5f664..86f5dd3aced1 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -1210,6 +1210,14 @@ static void blkif_free_ring(struct blkfront_ring_info *rinfo)
 	struct blkfront_info *info = rinfo->dev_info;
 	int i, j, segs;
 
+	/*
+	 * Interrupt teardown must be done ahead of freeing queue-related
+	 * data, otherwise the interrupt handler can race with the cleanup.
+	 */
+	if (rinfo->irq)
+		unbind_from_irqhandler(rinfo->irq, rinfo);
+	rinfo->evtchn = rinfo->irq = 0;
+
 	/*
 	 * Remove indirect pages, this only happens when using indirect
 	 * descriptors but not persistent grants
@@ -1292,10 +1300,6 @@ static void blkif_free_ring(struct blkfront_ring_info *rinfo)
 	/* Free resources associated with old device channel. */
 	xenbus_teardown_ring((void **)&rinfo->ring.sring, info->nr_ring_pages,
 			     rinfo->ring_ref);
-
-	if (rinfo->irq)
-		unbind_from_irqhandler(rinfo->irq, rinfo);
-	rinfo->evtchn = rinfo->irq = 0;
 }
 
 static void blkif_free(struct blkfront_info *info, int suspend)
-- 
2.53.0

