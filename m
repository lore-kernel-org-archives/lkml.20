Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323657;
	b=wnleFmj9FU5fwR1H96lZCIEh8t4ZY//phpMf3XgMyOsVPwswzFy3OH6sDsnoXn8X3Iv7
	 48j056l1fxTSAvmQDmGAXWVG2tCBjzGND8PNz0fw68JKpcUvZbOOw5ylRskEDgH9OFTIm
	 TFr2O8f6l8iWrhun1DV1s7fzvUyzjPlBp+lDGW9j5IWXtXiZeUGE979cZiUEZbe3Ban8X
	 VG5ZTaCpKNTYGM3aMJUqMp+gmLexa2VwZOfh3F2Ag9vbLTQ9N+ZYCAmGbQEIRHc/I7pvc
	 R1MJPqaN786lq+pj1ixwfth/VojXHMg2WJyhvOnBqyn1o7zHpjN4t95kKSmHrOfJy/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C7mcOM+n5OQpUfop9CP8BUGmScJoc5ssQWRuOnotN9Q=;
	b=wcK9xFUMQ/J5XEKSY1IZf4LX0UoWy9UByA39jYM4N3uhdfhW4YDRxfP3I0S6TS3ygDUC
	 zHdWzEC2580sY3qZvMWbrl6G3qlDWsS5E0FukWvRfl2ydw8yMnTiNLzeL5+9ir8fwLULC
	 NRO15JHIM1bpt/wvqEr83DMkwME3uEw7OX3VljFKHtpnJ1i3jxH16CWwX7RRsassuV3kR
	 UM0aMXYiSKieN6CXYrBuBFZ8ssSie1qFo1BblyE3TXhgpREty0iaYYBOZTfcAmSsopX0k
	 KMQ6UUKY+nWetvwTSA4qCdT5Fko/qbaxeiDyrwe+lRrVOHLiDrrOPFm5MakbLVF+26g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQtkm1d4;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C153606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C153606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQtkm1d4
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0d63f60bcso28432077b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323655; x=1794928455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7mcOM+n5OQpUfop9CP8BUGmScJoc5ssQWRuOnotN9Q=;
        b=UQtkm1d4FoNvK0Zsa+dWzOF7EgInHiEfjTI/iU0wl6bhOF/jOcC3kECFeX4k8ehaSR
         I4QMLoLGWLnSzxIc54xVCD+sjucplQTn+z0Z+QqdWk+7nCYJwHdy7zfRwbiFmizJyz3x
         B3JiyNzzP66sOfP5xAMJcOS3Nz5KsCJfWwkU9yvFlE/6swtd7Jr56QOhRmkIkAi6nl3k
         MqFwcriSpMNGKcJ8Bd7OKKjf6Gi+pKX+bnb7rA9uftEC2fWY/UZoC0GkxMcRftdKY7Eh
         NeT/GOJTWS4TAVsJNAU25m9MbbJOB/m+iSXmL4vD+9aFeAEg6OBWvWhjQyXPKbp+Bmb4
         q/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323655; x=1794928455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7mcOM+n5OQpUfop9CP8BUGmScJoc5ssQWRuOnotN9Q=;
        b=vhZ0lNApvxaJKvrYk+po4vhhfq3bd1MeJaIfNpfMEG+fuYtUBDNv3HpgcqTUgzNh1T
         uRgCCYJXSRgqHvjBiPTvwBAeRKE9oL7FYaWmOJ4gtvGyR+n9YosjOaYJqD5Fr7FIwCiV
         BgsTyfUe3kdKALvzNibo2GoGgpPRfULHrdjXhHAlOhPo3ezxoR4JjzKEoO1SJpGNFZGn
         jDGliBZLKfZtgka6EG7W6d36Pv5PvEdtwW4J04SCbfVm3VGy+BF6l+DOrx6iBvDNTecX
         d8lVzub9xuUJMkFmVaXro2XESYIfCjoiTK/TMZmEjF7EVQy3yV/RQmyRd20kK6yais56
         5BrQ==
X-Forwarded-Encrypted: i=1; AL+hErHS0ozX09vQ4k6lerbWmSjf9MSeWQdzYEn3q8+w+ytQR3TIp0aEtMpXhlArL2dbqVY9b+0t5DNWNCssebQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z2rBIbaLQm/AxuALp3qD0d5WQaz29SeX5RAkYRt5SX7nOAnAF
	0rUNhLQWn/wTjq0HVGY6UB3dGXZ/L/AQISYiFMuJ5tlHp/5m3Eg+BMMP
X-Gm-Gg: AYBFou2s3CXZlUfvtClcsmj7GFcCgucxavrVbad/3yiQHFSxKQCHTeUbmmbTGSNrF4u
	/qUBzxnlEgFm5aUz+v5gP+VsPhDvjxqLJLC471aP+DSJiX5PiRoXKe1ZKdK0cmvmZPLJEw4FSrH
	qFgCwgGDzTwaT8AW1cXageVZt292OScxpDNVGRDsWheWKznbM5bBwB/dPfNSUEuzV1DhTl9Yqrm
	R2xYwTeyzfjy28eA2F7VDiJDZvEZzHKKsFNCM1OtYHbW44OJkqz6UwyydSUeifP55WbrCidTOB1
	sBvaHphKtRTroEVacx3EJ7Dt7O9m/mbUmxX65iZaf2zmIbUeYBZ8DUegnxBnvq65IqKQDiqaXdR
	xh+fhRwvreXmFR3XFVKLcxhDob2/BUCtgfkn8X23qRDkb74PuawCvNcflG1aX3XpJXZx7m5+mKF
	1kWxaale9hdGtdbllkVeCbWC8aoy1fnRLFAQOzsLwzEO7o3hejUiBZaqsLa4/wrPmtEee+Wj4JE
	7W/BocbucYIe22amsCLe0VQdGY19fmoI3aKf+rvJ7lJ9du32gu7zSj0BBUlJsbNZmhdNBCm4+mh
	NDW16nmxvAF5bZOwsnQCo+MMTke8/7MXMTnB2jB1vkj9J+aazXLnyTLNibYS5lFnde++PxSvrpx
	C9PQZKOX717+NCUsl98N94cpgOHDmhc0vbSXO
X-Received: by 2002:a05:690e:480f:b0:679:b86d:6977 with SMTP id 956f58d0204a3-67c568b644emr1317770d50.73.1794323655270;
        Tue, 10 Nov 2026 07:14:15 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:a::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c58a1f11esm2086933d50.20.2026.11.10.07.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:14:14 -0800 (PST)
From: Nhat Pham <nphamcs@gmail.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	david@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	ljs@kernel.org,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	willy@infradead.org,
	brauner@kernel.org,
	linux-kernel@vger.kernel.org,
	chrisl@kernel.org,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	youngjun.park@lge.com,
	ryncsn@gmail.com,
	sashiko-bot@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 3/3] mm/swap: skip relocation of tableless clusters
Date: Tue, 10 Nov 2026 07:14:07 -0800
Message-ID: <20261110151407.789960-4-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110151407.789960-1-nphamcs@gmail.com>
References: <20261110151407.789960-1-nphamcs@gmail.com>
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

A stale reclaimer can reach relocate_cluster() after another allocator
re-isolates an emptied cluster and drops its locks to populate the table.
The cluster has zero count, CLUSTER_FLAG_NONE and no table, so relocation
can free it again and dereference NULL in the DEBUG_VM empty check.

    CPU0                                    CPU1
    Reclaimer                               Allocator
    alloc_swap_scan_cluster()
      cluster_reclaim_range()
        spin_unlock(&ci->lock)
        __try_to_reclaim_swap()
          swap_cache_del_folio()
            __swap_cache_del_folio()
              __swap_cache_do_del_folio()
                __swap_cluster_free_entries()
                  free_cluster()
                    __free_cluster()
                      swap_cluster_free_table()
            swap_cluster_unlock(ci)
                                            isolate_lock_cluster()
                                              swap_cluster_populate()
                                                drop ci and outer locks
                                                swap_cluster_alloc_table()
        spin_lock(&ci->lock)
      relocate_cluster()
        free_cluster()
          __free_cluster()
            swap_cluster_assert_empty()
              __swap_table_get()  /* NULL table */

Leave tableless clusters to the allocator under ci->lock. This also stops
a stale reclaimer from returning a cluster to the free list while table
population is pending, avoiding the resulting FREE-to-NONE state cycle.
The existing cluster lock serializes the table check and relocation with
population.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/sashiko-outbox-203018@kernel.org/
Fixes: 07adc4cf1ecd ("mm, swap: implement dynamic allocation of swap table")
Cc: stable@vger.kernel.org
Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/swapfile.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 32639f65f13c..9fd62e4ca7a0 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -815,6 +815,13 @@ static void relocate_cluster(struct swap_info_struct *si,
 	if (cluster_is_discard(ci))
 		return;
 
+	/*
+	 * An allocator may still be preparing the table.
+	 * Leave the cluster to it.
+	 */
+	if (!cluster_table_is_alloced(ci))
+		return;
+
 	if (!ci->count) {
 		if (ci->flags != CLUSTER_FLAG_FREE)
 			free_cluster(si, ci);
-- 
2.53.0-Meta

