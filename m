Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203796;
	b=fjAqbZl2iBNsVcfv505O3a+Iyl/tbvDxsPVKKvj/fAUQhKU5eZeKi/hYP43CGd6kUZ1i
	 q92o7LkROCRnPBt3EhPpD3Jt5oAJIxABhkaHAP1dGW9o4yluP2NmyQzf3J2cvDflc+G7L
	 7RVCtHzL20QBj9a1HGUlLPCsdcyj7M12pdEwJYO31dJHS+7mEV1G8Gog68Ru9U9S9YT/d
	 OaigwvRrvWyP/X8ND5NWEJsoGd0C0pzddOmV7s37YR4uxPSprSf/fj2ziAHQI5oj5IxPO
	 YHN8+7U0kCu6l6a2ODytzb4yZ9RM8G9ZTPtl2LWSFxZWTRtKKderwfHYP1A0+SjB96Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203796;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=2Ad8L18vWEsLzi69aph4uH3QAUHZEIhwmqVh/GCy+bM=;
	b=yJ3/5MtFLTxa3aswaDepY2cTaHyQuD2lKd2wcIzRpWc5XIDO3v45MyIJjTX1K5i2ashv
	 9ylzXLqF3V2uP3C/cu1hZ9oA3h4p27CKWg3SAEkei8QAi+5BGnWmHxujg1DEalBzs2AFr
	 o/o8FpMxEX6mKbt5PuUYjxrX+tpmiJG5dCqkXyHELzVe6HIRuQnTKVFLCcqvxqWS/O9eM
	 vt8o/PF+CC3LAOJYUOvkDCY4vM7rO69tMuxe8xesWAm3GnY/Z581pL/bjhXkcKZfYQPyH
	 7xag4OCVbk9GRmFsLbbQbIWj/A5TdPUe93LdbY22bkWW4eLebBeqUZejW9rTCjBYXzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UJNttNzB;
	arc=none smtp.remote-ip=95.215.58.203
Received: from mta1.migadu.com (out-203.mta1.migadu.com [95.215.58.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81010606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81010606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UJNttNzB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YluyIRWOfpynnfHtIz5HbTs01U9U2R3DpTwEgzyIP2Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203793; v=1; x=1794808593;
 b=UJNttNzBMya9WCTZIdczS6jnUamZ5nEont5ISbrHHZ0FaFbQ5EQn6BNg+iyGJU/m/1eY9CN6
 3A0ZVrtVpFrUPF6gofZTYMF7WKmwrZxh7N1hSYgrHrVky1EkOvZWu9RslXzTAYas8mezBUZmBNL
 iZuPM+eVMF0COYyFgnh54N1U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id ebe2b124efa8aa48;
	Mon, 09 Nov 2026 05:56:33 +0000
X-Mizu-Trace-ID: ebe2b124efa8aa48
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <baoquan.he@linux.dev>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	corbet@lwn.net,
	hannes@cmpxchg.org,
	chengming.zhou@linux.dev,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v5 08/19] mm, swap: require zswap for xswap devices
Date: Mon,  9 Nov 2026 13:54:44 +0800
Message-ID: <20261109055455.536925-9-baoquan.he@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109055455.536925-1-baoquan.he@linux.dev>
References: <20261109055455.536925-1-baoquan.he@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Baoquan He <hebaoquan@kylinos.cn>

xswap pages live only in zswap.  Without zswap, swapout cannot
free the page, but still takes a swap entry.  So the device consumes
swap entries without freeing memory.  Fail to create a device when
zswap is unavailable.

Acked-by: Chris Li <chrisl@kernel.org>
Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 3f2b863f7dd7..35c8aac1e25d 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -4268,6 +4268,10 @@ static int xswap_create(int prio)
 	    (prio < 0 || prio > SWAP_FLAG_PRIO_MASK))
 		return -EINVAL;
 
+	/* xswap has no backing store, it relies on zswap. */
+	if (!zswap_is_enabled())
+		return -EOPNOTSUPP;
+
 	si = alloc_swap_info();
 	if (IS_ERR(si))
 		return PTR_ERR(si);
-- 
2.54.0

