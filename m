Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550390;
	b=tWZwuGjnv+quhPd7EyZt+Ye8/yezimsWexogsy5Uw5YP/+JBCjKBzMZJJpsEFJwicPVg
	 Wijn6rJ4uiX8Rlwc028YriYUADcYYmQ9l45Wxf85ZbETdx9jScYJ18oc2IfoSddUDmC9t
	 OxcyAYZi0JtaAgid9n2uTCP8ErKwnCzLPPJrH7JvcckKIDAUKMlyVPugenWP9ehrM6ibh
	 uRl6eTOrfg+7LGJKOqbDwXybOXsXQStgK3Ap+k9APQilhtfONgmZu4spqVBTLcqMtvbg4
	 tBOTWXAMSA4xXlKbjC5R7lxQVWWw6/x18pD95/Za1rQ6z8nHurpaUF3oFlM4YPzvbBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UZtXCeX4FNS8qck5gj1e2IPK+BPL6kr+hoWf2wAHxQg=;
	b=S9heRH4iDMlLlzCs1FTNpVsIl5hzYfG7eI0wGPkrz75ES4a6Bnt6NdzUL0pVN6Z7S236
	 LwX96FMUTiOD2oWNnEyCV0ZpNWNAbfVXeq+RsnQC2xLHGIEGJu7g9CHJkN9jDFUO7LwKk
	 kRMDb9u/ffXvJg6esWIR7G3Ywaf2J4Lx+jaiUZMelT1IRNaoyuoP4XVaOf2oCe6xjLznb
	 Bbt3Dm7QDowYPj5ud+gYcvqjcCYrGqyB3D2eVq3rTgdj2sPfBc//uIkJlRNwYn9qd2cc4
	 xA90Qt6zBoUBzsespmSh7XF+hsHTILnnnVw4wNQTchXRv8vbLquuqkqKltIISJyZXXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Z+c8Pivy;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D714606A333
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D714606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Z+c8Pivy
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91b8306b9f8so4263146d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792550389; x=1793155189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZtXCeX4FNS8qck5gj1e2IPK+BPL6kr+hoWf2wAHxQg=;
        b=Z+c8PivyqpvgjCDG61uG+b1oJUFl8jlRLYRiKNl5r0nL1M+EAf2m26idpzWnMkf7Z0
         LYjgekDDzbnghMWUDHOQPVMG8s/Kk0QIxOo1DzydpFF5utcE+M6fipAQWfUKFhB9vac2
         Oo4VQdXYZ4xwqXJ+urW8ZwDFwNheUeugO5s3IDWYeTA4poneNSuxVW7e0SssT2/CjiWd
         Gu5y+k8Mdcutzf0gyb4Ejfpq9K7t/w7egvokp3BuZkO3QfjKDtoPpjDrafZtd1XDdJJ0
         308LLW2SAq8NolRT7LVC6rUL6axanuXjBLWPlMRqo23yP08dexNMCMwuDImrKpu/9WGy
         wlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550389; x=1793155189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UZtXCeX4FNS8qck5gj1e2IPK+BPL6kr+hoWf2wAHxQg=;
        b=Z8HfOP0LJ8JL5fD7hz9ujMYVGroBZvMwEgjsVyXl878719xYB/6reUiit9eJMtZy2q
         SP1iSE5BrN646kE3yjmMDuJhP0U6bDCgvMH8LQgQ7P2KRfgE0iO/O2JsSnS6+AH2RhAk
         uQrLKQkXBbAxT8G6fHsUBxs/Tn5T0sXOwCV8PPAhvk6j5bfU8QepCxKDHVhxroUN1Sb7
         wvHuP3sHIpq7F5thZkU+c4FldqQCIbXORziOjQl+w1EO6bWL2H0sjlNXAu43AsF3DwQM
         R54zAC06oUXxwvcci1guu88wbBNo9XyOm3LFwqlTN+hTi12oW8Rm1wsR6Tr7dax8ixn7
         i5Ww==
X-Gm-Message-State: AFq9FYJ/qdjUhaqRLIOV597zHc4S55h7VaHf9Sx5/A3WDX4QvcGl2OSL
	QfMl96w7960tTzLhHxhrFTKlsfO0HnC2Sz1sI478pOyu9DELtODdsJ1XiM4zqqOmFrE=
X-Gm-Gg: AYBFou3d5b/0WGZM2tAbTNj2o0nswd1HhSowQsIf/JzJMPRFJ5T/dguCo2NMWhvycGr
	k5+B1lzd1RuLdQGblL/69wNF/CFp3iIfI/gvjUn3qXwGXaDpz52qtks4KNw3SBYdV52owqVh0Id
	wszRRpg0n+YRK+owy2agIGqh8ziC0RaQnft1YmFY1O0SAKzEbjYb027i1rKzK32KVTTRHdX/v7K
	m8XIdlk220wNTiCTRDRyFihJBh+mjzR91x12YaocBBFh0I67V7a9XxnGNa8ctUeE4OyV2bCHRbN
	c9wt//FOIHHf5Q5JG8s0CFduv4WXq3wS6gw6O55LNnXlUvDqBci6Cfiy8EICEDS3hoP9fU8GawQ
	D468mVAebhgPEyDAuI/Za3rbv+7QzHBojSFoRiLQKljn67hUBHmw4QywyMmaS0PrryRdknuj2Fa
	Mwz/Gt9jXKNr+P1DcjmD5zv2a3O9QT9L7AHtOSnPRSgZxV/5+2WmSztJXiBg4K/OSIf5TWe9ZM+
	g4YYs/blKqI3clFOjsLatntNG2ZbSnctYBNSa0fna2k8qUGgRfVk1FC6Fhd+10pKiuTE4r76eOb
	O3+AC6qOhhSq3XlCxxdBLYxYTCgVIAvbqKnHAEB8jQ==
X-Received: by 2002:a05:620a:3913:b0:93e:66e6:fa4 with SMTP id af79cd13be357-93f57f05079mr224040885a.16.1792550389393;
        Tue, 20 Oct 2026 19:39:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10a45336sm13819426d6.3.2026.10.20.19.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:39:48 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	mhocko@suse.com,
	rientjes@google.com,
	shakeel.butt@linux.dev,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com,
	Bessel.Wang@huawei.com,
	jiang.liu@huawei.com,
	stable@vger.kernel.org
Subject: [PATCH v3 3/8] mm/mmzone: read each zoneref slot once when filtering by nodemask
Date: Tue, 20 Oct 2026 22:39:35 -0400
Message-ID: <20261021023940.1940971-4-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021023940.1940971-1-gourry@gourry.net>
References: <20261021023940.1940971-1-gourry@gourry.net>
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

__next_zones_zonelist() tests a slot's zone for NULL, then reads the
slot again to look up the zone's node. Offlining a zone's last block
rebuilds the zonelists in place, so the second read can return the
terminator:

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

Fixes: 11cd8638c37f ("mm, page_alloc: remove stop_machine from build_all_zonelists")
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

