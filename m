Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289758;
	b=KZ4EdQPnO1CY7QuDJ2Ij6L3rM3vR/s21UYVyUn+gYfTYA/c9+kpqYxkIDO9Dx1iFmwbO
	 1Y2gYj8wLntjMBpTcVbzzG/WdW1HoXMnhDQzOzhY3phH3IdcE3fCTQxIT412oKV114Znn
	 SLrPYQdWBMJc0HKm0mCX4vSOO3UM7I2b/dL00FF1CcCfgClqk0CjKZECvYG9pq0A/wnwi
	 WnQCsA5hBf5q13GZ0S5+dI2421cpgCzKU3IO4oukz/XXBtDX3HynJDdmw6F51YQPQdzUQ
	 0jffTVXdHNvhiyo+EFohHpa329op7GNu6PTvNqRdHF1u+DzXgu3ljs6XtJAc4VhEF9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lrmi2+lOFJxXdkix+UX3wdRa3hyeMQKr15+9Sj7OH3M=;
	b=miDDwFko0LMe70nHm3wrr07i35oSJMZVQIMomPRKk5sVvJPVnp2oJlY4bJbl2tysVknD
	 IR4WiKPXfVb3NTOrITMOyB0oKj3iM0eOovJ4j5htp0VTBG+SikGs0HElY6rSVaY1othPv
	 XplW+qEINQg+mU/1H9NFlZusnqxO6uvAUDVLbQMxm/0uDWEmwcrE6mLXjZe6FzkNW7g4B
	 UMiSz3Jt1XTxXO0iIb3V2aHKyT0aRfi0YhbxCsuYiW2PzCdsy5qqSa6KPSJ9+N2R3MzQ/
	 BkyVPOABkY/ujQMLkt7zDucicxF+Naan1ewtAAn/9CU35mRpNQnvmdbAohod07k9nqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Bqgg+k0f;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BBB606A336
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25BBB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Bqgg+k0f
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed1f1a7695so6133065ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289757; x=1794894557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lrmi2+lOFJxXdkix+UX3wdRa3hyeMQKr15+9Sj7OH3M=;
        b=Bqgg+k0fTTa+pKyiYCST8SEKagAEW+44pMFRbd4swH8xMqrb9rwqpBMFvtyyvpTSPQ
         JE863d2xzK182cvcqLpp/6ub1kQ1Zhn33Iy45nFeJ5Aa6lTffP8D0DxLgHCumOmm4Skr
         j201polbUzLzWnbelffldwAjBud6vhJnOXSVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289757; x=1794894557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lrmi2+lOFJxXdkix+UX3wdRa3hyeMQKr15+9Sj7OH3M=;
        b=sKauebAHzBJdm2NOmuJp0NPy5423Or2cLhQ+0wktHG9WlkXZGamDhZUGeYOVcSKYQ0
         rjdLL5thhzGu/aAAgOlm2IWBL5x29WIjpuoLPtFNbcZjMqmBYQS4EW/EvU5MBETPQXcw
         9UtFkcoOltYol9Ka/gDDvWZc3axamPithj6I9w2f8mUIQzl1u48vuG1UqPOAzqSwz2bF
         51mKNGsqFzaHU5bXpXaa84VA3kMDJlhBnxY3L1uFHJeZEgouUrc1YzsOLcrUYQLlFERV
         OrgaDLBTaIA5Wu54HZk8LQ7HCUDV8UeAh/meKZqVYmXh6XsgdNKMEpp4idGKX8YSCoRw
         GFpQ==
X-Forwarded-Encrypted: i=1; AL+hErHjbn05bv4ewNMJzDQR8gjb94A6F3qGpTv5LFfXOocxPhxZO6TuViyMEnpRAETb1VEeYac3AsnhdolF2Yc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8819Wtambl1RyVLY1/PzmjPRaEB7fThqiw9BRoM+y+VAPFMj2k
	N210Cie/uHRXWcDEIj3lAjOG41GHsEJ4MglkDBlBKj4U2b6clBOqHkcKz79mafdGGw==
X-Gm-Gg: AYBFou1kKVsU8qxSxZA1Be9OI2nT/cT87J1i7oWpNhAMGV3ZkNva6LC+zsGD0eEYbSY
	mkYdVu2DvC+SNN9mys1Uv1XWmHyM3oZcAlaOaF5gSLXkqgh1XS7O6JEOKqSulCEQ2AoPuDvCht0
	Ao39wtFEGfXT6TCS5UdjxkYXrnJZi97Wb0+5dc7XxS6Pao9BqQkjjS5HVNPBvK2sPdHv+e6fBt6
	u5NN46oIjKGG9ZySLrSpWrvAdbmS81zbLIt717IyrfveOxBe2rgRtb71uN8+bKr754rC7Jei6LE
	+xL5pxpYdZRDBARAoRsSPjZ7A6b1rBh2ovguzFDjHJD3GGs5hon/MMO2VgSVQlXGxz2BI3x0psl
	bbV1l6xolExV70KN3jhS19Ks44p3w0JeoiLN4acgq3SoVq73rxFYfxmChYOs5Rhv7SQz5U8AffV
	5hvnT6sN2R5Z/m0+bKoQVyQbNG+DxxNSK/4bIAmykq1gnmlg+D1MAWyCd/N5vCOa8JlYdvBdP4J
	ZQAUvEHnQp3F4Kx+Ha/9zagyXTMsCaLHmnlZLRnzEsyc83cMbrv0oP9PX5HdDTLKD72XlaB7APp
	p3KvrQAdth9DAosj3gXYrEPW4cuquXe9JbC1D8nXQ8vex6pj//ipOkrKstWnROWiOwwoRkbXThx
	CfPmV+hY0MThTfBOtuA==
X-Received: by 2002:a17:902:ccc4:b0:2dd:c0ff:e72c with SMTP id d9443c01a7336-2edb93179ffmr13147715ad.62.1794289757474;
        Mon, 09 Nov 2026 21:49:17 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d67e53asm444634a12.5.2026.11.09.21.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:49:16 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Yosry Ahmed <yosry@kernel.org>
Subject: [PATCH v2 11/11] zsmalloc: populate new zspage outside class->lock in zs_store()
Date: Tue, 10 Nov 2026 14:48:16 +0900
Message-ID: <20261110054836.1515030-12-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <20261110054836.1515030-1-senozhatsky@chromium.org>
References: <20261110054836.1515030-1-senozhatsky@chromium.org>
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

A new zspage is not on class fullness lists and is not movable until
zs_store() calls insert_zspage() and SetZsPageMovable(), so neither
other zs_store() callers nor compaction and page migration can see it.
Nobody else has the handle yet either.

So for a new zspage allocate the object and copy the data before we
take class->lock, and don't take zspage read lock.  This makes
class->lock critical section shorter and saves a zspage lock/unlock.

Suggested-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 mm/zsmalloc.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 09ce8c294c5e..2f4adbae82a5 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1319,8 +1319,12 @@ int zs_store(struct zs_pool *pool, struct zs_handle *handle, const void *src,
 		/* Now move the zspage to another fullness group, if required */
 		fix_fullness_group(class, zspage);
 		class_stat_add(class, ZS_OBJS_INUSE, 1);
+		zspage_read_lock(zspage);
+		spin_unlock(&class->lock);
 
-		goto out;
+		obj_write(class, zspage, obj, src, size);
+		zspage_read_unlock(zspage);
+		return 0;
 	}
 
 	spin_unlock(&class->lock);
@@ -1329,8 +1333,15 @@ int zs_store(struct zs_pool *pool, struct zs_handle *handle, const void *src,
 	if (!zspage)
 		return -ENOMEM;
 
-	spin_lock(&class->lock);
+	/*
+	 * New zspage is not in class->fullness_list or movable yet, so we
+	 * can allocate the object and copy data before taking class->lock
+	 * and without zspage_read_lock().
+	 */
 	obj = obj_malloc(pool, zspage, handle);
+	obj_write(class, zspage, obj, src, size);
+
+	spin_lock(&class->lock);
 	newfg = get_fullness_group(class, zspage);
 	insert_zspage(class, zspage, newfg);
 	atomic_long_add(class->pages_per_zspage, &pool->pages_allocated);
@@ -1339,13 +1350,8 @@ int zs_store(struct zs_pool *pool, struct zs_handle *handle, const void *src,
 
 	/* We completely set up zspage so mark them as movable */
 	SetZsPageMovable(pool, zspage);
-out:
-	zspage_read_lock(zspage);
 	spin_unlock(&class->lock);
 
-	obj_write(class, zspage, obj, src, size);
-	zspage_read_unlock(zspage);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(zs_store);
-- 
2.56.0.506.g506a7eabc5-goog

