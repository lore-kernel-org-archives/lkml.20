Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792430639;
	b=D1BTam5oe31M5Oq59MTIm9w6hcnNsPvnDTLtaZPptzx6U5+m3egBc8qfF/LNgmU3YuS1
	 SxfEOVn2m5pnJaRt/7jA+PsogvinPGHWjyy0fudLcAeDCFliXhCjVfAAB0rRY8E69Gavz
	 2PdC3TB1h0mvkO+/HYG9eOD7HYPx1gI17qb9pTFFE3LoW92sl8fhJWkKg0+8ImohcoQTj
	 st7mdyZ8/h3WNLSkA7yYo6jFFPLZ/kTd9DJJRVb6abWesKsNbkPvipJA5vhmrtEehsaLe
	 7SDgf6GZYJSvQnmW3YjVezkMyhHoQXsvQaUuO4Tf4KNbJtm0ogZkHhJfmU48+C+778Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cayAcl4iw+jItAg5iPx/bsdxEdOf5W6Rz7FTZGlHvQ4=;
	b=14cO/94rlaR8yD3v1QVHU8MugOEwUAceOqGN42TuyECBM6KvUI+qUtYWYwojH85EyO6p
	 cfsrtMPcbsJdr9GEIcCKXS9pX9YZEw9khM3ITJCMJVfnNyNEEqPb4rbPLQ2b5mnDsCM+1
	 1sYjOHFr9nZ3X+dAUQ0nWz50OhaSAUnZf9M1tfMRUiMMPh6SDZ3M/Cqnkz6vNYLza7LZQ
	 c5mwakbRC73L5ogW6U8JU67cSIk6FsQnukbwPlhxe9avhcmZEJT3gwBmiGysg9fAlasId
	 iZ42j1Adz8YvIeC1cN5vhXvGurZKK5TEKliSCLPSDBQG48IMaU8G78OdiwmRX77Snwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EKPwfQd9;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8F660A261F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A8F660A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EKPwfQd9
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5366463571cso14369841cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792430638; x=1793035438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cayAcl4iw+jItAg5iPx/bsdxEdOf5W6Rz7FTZGlHvQ4=;
        b=EKPwfQd9pAhY7OObaKd/t/kqhBeCzJPYyo5VhltFiKZEWE1qwvj3Syny3KlfLejZpy
         MQtvBVKKv44Xj4qlYKXUUo6BJB8fR2XnzurPWj2VA5i3j2Y/lKopFNoVESi+bmVNGbR6
         zoctzZSSXKrn2GOFCfWPyyXAFGMT5IBAhutYVUGwRwqc7+q2Lz2e/FvqXzMIc0sRFYQ9
         hHbtmBA7Z/sM8C23LsRN4D+ScsbW/rUEG8gTqvtJv0tk15sSnis5b4rFlpAH4yu9BAmi
         mRPWrmIw4iG9o4UDwt6HpIEOMjs368mjoJzW9aK6n/2v7m8bNqlJdy4Qjjwdk6sr9iYd
         51Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430638; x=1793035438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cayAcl4iw+jItAg5iPx/bsdxEdOf5W6Rz7FTZGlHvQ4=;
        b=HJBffageYuTqvvzeoJ4S4RMx4gA/p1qNb1WhOciM2IZHsk9+0DCRdgTH54CBh0Dpfm
         RUNtzOrTB1j+LIogSB37BxVsCgMxwY3I611o81kXJZncO0mhFXWP1IT8EZO0RxIiWHVJ
         K6YiDQL4gVaXKlOYiffb1+GSGPTLJdwLBVbMc39ATpwRfopwi+SPMjoiBBwrTY6swGhw
         oscHIHomAZUyCrobvwGdNI2UQKHyY2nvl3Id4tWhPjfr+tLa1gRINcbawxiw9ynftOUL
         47B56XJcyNaykZgRZrXDQpt9oNEXMqVbPXJWKYQ+kuGk1g1cYYi5fO34ITY8njdXZ8Or
         LysA==
X-Gm-Message-State: AFq9FYJ3PhsvDCaxmD5WEAz8zKbFWS0eZzn5MnYPAk6xbLqkYT6ii0ZD
	vPGZ+vkW0AqKhObmxnvQL0+gOEfCLUU660t7Dp7Y+yZxu/N8uYzxRizzrzY3wNutfOo=
X-Gm-Gg: AYBFou0rmvPCXkSfp3ICQ/5KcPMLdyPUsl306Ym1/TiQt/si+FCy55BkTTSyAYD7Q06
	y2QzsVYfqvy7YqS05wC3ZU9B/CJ8QvS8zBFdFkU7pmGLz8fut717dyeKyL/WJkgEC7lknxe5ijF
	HfsuL+YnqMPyI2bRueVEch3DH56C2Cw0g9fM25yGXBGPURdzBJn+AwmD/vnudO2YwkzP/nvyVtZ
	Vqzuqud+RAJ8hUDXntHih6GyeGFvFFi00SvAdsQPeKWwQ1y4yzXjq9lDaazc7FF+RNot6HqgML9
	q4W+CuWE9AlHQPJdWl14vxWv0hG16CckWeflO6ACofPDmQ8//zMPschZvXSUJQhuzmiKrI7G4FU
	4tjsxZnwUkQFtVjIbL5RgXOS6XwfEr6r6Ggg+Ot+cdghd56c/IIKnltW0BgSEC9ogwOOq0/f6Zz
	gmpIJLEh66THsKMRWz2ZF7U/BQ3P4jjwYP89gSBdxCGVgpybpf8Etfyb6gw4DwqqlsqoHL2vRe2
	mPTHHBlvgN3TEIy7GAxIYqK4izP5U58w5V5OxeVIuen1S3zoSgp4JRD4/lv
X-Received: by 2002:a05:620a:3710:b0:93f:43a4:a479 with SMTP id af79cd13be357-93f43a4a615mr343361385a.66.1792430638159;
        Mon, 19 Oct 2026 10:23:58 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4adb28c2sm14615385a.0.2026.10.19.10.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:23:57 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	mgorman@techsingularity.net,
	jiang.liu@huawei.com,
	Bessel.Wang@huawei.com,
	stable@vger.kernel.org
Subject: [PATCH v2 5/5] mm/mmzone: read each zoneref slot once when filtering by nodemask
Date: Mon, 19 Oct 2026 13:23:45 -0400
Message-ID: <20261019172346.3344005-6-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019172346.3344005-1-gourry@gourry.net>
References: <20261019172346.3344005-1-gourry@gourry.net>
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

__next_zones_zonelist() tests a slot's zone for NULL, then reads the slot
again to look up the zone's node. Offlining a zone's last block rebuilds
the zonelists in place, so the second read can return the terminator:

  CPU 0                             CPU 1
  __next_zones_zonelist(nodemask)
    zonelist_zone(slot 1) = NORMAL
                                    offline_pages()
                                      build_all_zonelists()
                                        [MOVABLE, NORMAL, NULL]
                                        -> [NORMAL, NULL]
    zref_in_nodemask(slot 1)
      zone_to_nid(NULL)

Current GCC and clang merge the two reads, but nothing requires it. With
mm/mmzone.o built with -fno-inline -fno-ipa-sra, holding a nodemask
allocation between the reads while the node's last movable block goes
offline oopses every time:

  BUG: kernel NULL pointer dereference, address: 0000000000000060
  RIP: 0010:zone_to_nid+0x0/0x10
  Call Trace:
   zref_in_nodemask+0x9/0x20
   __next_zones_zonelist+0x23/0x70
   prepare_alloc_pages.constprop.0+0x16c/0x190
   __alloc_frozen_pages_noprof+0xaf/0x330

Read the slot once and test that zone. A NULL zone still ends the walk.

Fixes: 11cd8638c37f6 ("mm, page_alloc: remove stop_machine from build_all_zonelists")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mmzone.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/mm/mmzone.c b/mm/mmzone.c
index 9cc9ef588580d..009f1dd75dde8 100644
--- a/mm/mmzone.c
+++ b/mm/mmzone.c
@@ -43,13 +43,14 @@ struct zone *next_zone(struct zone *zone)
 	return zone;
 }
 
-static inline int zref_in_nodemask(struct zoneref *zref,
-				   const nodemask_t *nodes)
+/* A NULL zone terminates the zonelist, so it ends the search. */
+static inline bool zone_in_nodemask(const struct zone *zone,
+				    const nodemask_t *nodes)
 {
 #ifdef CONFIG_NUMA
-	return node_isset(zonelist_node_idx(zref), *nodes);
+	return !zone || node_isset(zone_to_nid(zone), *nodes);
 #else
-	return 1;
+	return true;
 #endif /* CONFIG_NUMA */
 }
 
@@ -67,7 +68,7 @@ struct zoneref *__next_zones_zonelist(struct zoneref *z,
 			z++;
 	else
 		while (zonelist_zone_idx(z) > highest_zoneidx ||
-				(zonelist_zone(z) && !zref_in_nodemask(z, nodes)))
+		       !zone_in_nodemask(READ_ONCE(z->zone), nodes))
 			z++;
 
 	return z;
-- 
2.53.0-Meta

