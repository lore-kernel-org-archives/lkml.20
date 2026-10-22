Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658957;
	b=1Efi5JsenPvJZS84E3H2Y3JtdENddhRdUWAvnqr0CjSExQLT473TloFtonXYDOAVKg5Y
	 IFVjLd1JBEIeXTNvwZ5sCPD1NUBO7GTg79v+ve9e4hgspUKVPtoPRwzGfZ54rSPrGrFRq
	 UrwNp/F+IITeMSHT8RJzdpHqCpB2WBR9+ccxBvdP/Tf3/N81Pm2+XWQEGzhHzm7Bfjm0Y
	 2Jghg8fMOVpLaz8RwnGdlilz35VP21xJUxPYki47hyJyS19jiakaTYW1i0B+/4qdvNMbS
	 PP2leybqlpk/EP8pEDeqjZpS7qCctokiixRqyXZ/ZoUWhNnBTReyAkVvlt8mfN6IUfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658957;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+7S227f8gWHbiIqoS7NBrqLEaJEM3lqiWRRqdw3VbHY=;
	b=vi09XXpSf7FWig9bd+cXTczKP0hDf9XlB8rPVVMEHT0W7BSf5WhmH+9TLayFKnN4Jb3X
	 hp08GmIvs6xRqaq4fW9f5T6OUU1P/mxvSHkAB0dn86y7RV0JmlB/6g1cBFMmDD/sqyOGz
	 ybxyi472UBovTKk4uHCWu02TNf9oPBzc5MqCjgPmpRer9h6/yIZlU5SpnuLRmfOu7/Fgi
	 yga9bzYxzfKGvFeD4ydQtOCV6evGZLcW8c80ZKG/bpeE0kMZkruIZJwK9YhJuI8jDOEwQ
	 JWCh549zCMDQEGlRGCItEFTYne9QZUkkoN6bvXN2hOW9HM3mnrrE2/7Z58ICbJGC2gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=NdUdGps2;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1029F606A325
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1029F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=NdUdGps2
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792658943; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=+7S227f8gWHbiIqoS7NBrqLEaJEM3lqiWRRqdw3VbHY=;
	b=NdUdGps2dfeX7PyE93RaI1Paud88qEvNVNWSY31jWRsUJekBgpqvPdXcsrPk5b1eHzCVMwCJXOwPvHiu60/vDeKyP6JChhx+el+ClFPiziTQf6etY2aofSb9J/p5y+lyuPvSSBTWEDPeDYkrG67ANwMA1MQe0ucPF3OUV2kOGCI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R701e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XDImod8_1792658941;
Received: from 30.74.144.160(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XDImod8_1792658941 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 22 Oct 2026 16:49:02 +0800
Message-ID: <0cbd219d-f69d-4f72-aec5-43e1f2d978de@linux.alibaba.com>
Date: Thu, 22 Oct 2026 16:49:01 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] mm: vmscan: avoid anon scanning for GFP_NOIO with
 low swapcache in MGLRU
To: Barry Song <baohua@kernel.org>
Cc: Xiang Liu <liuxiang.277@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Kairui Song <kasong@tencent.com>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Bo Zhang <zhangbo56@xiaomi.com>
References: <179248830836.1744016.8424217811286616919.noio-mglru-rfc-v2@bytedance.com>
 <7f4daafd-a3c5-4ccc-80bd-05a7ac09e4ab@linux.alibaba.com>
 <CAGsJ_4wV8A5snz-XE+5ht931=07SvCs_k4xvUCE1yphKyQd8tw@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4wV8A5snz-XE+5ht931=07SvCs_k4xvUCE1yphKyQd8tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/22/26 5:55 AM, Barry Song wrote:
> On Wed, Oct 21, 2026 at 3:28 PM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
> [...]
> 
>>>    static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *sc)
>>>    {
>>>        unsigned long total;
>>>        int swappiness = get_swappiness(lruvec, sc);
>>>        struct mem_cgroup *memcg = lruvec_memcg(lruvec);
>>>
>>> +     swappiness = get_scan_swappiness(lruvec, sc, swappiness);
>>> +
>>>        total = lruvec_evictable_size(lruvec, swappiness);
>>>
>>>        /* whether the size is big enough to be helpful */
>>> @@ -5249,9 +5265,10 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
>>>        bool need_rotate = false, should_age = false;
>>>        long nr_batch, nr_to_scan;
>>>        int swappiness = get_swappiness(lruvec, sc);
>>> +     int scan_swappiness = get_scan_swappiness(lruvec, sc, swappiness);
>>
>> IMO, 'swappiness' and 'scan_swappiness' are really confusing. Why move
>> this logic into get_swappiness()? In get_swappiness(), we already have
>> some similar logic to adjust swappiness when there is no available swap
>> space.
>>
> 
> Yes. It is very confusing. we can't do that in get_swappiness() as otherwise,
> we will get cold/hot inversion due to GFP_NOIO. for a real swappiness=0,
> we allow cold/hot inversion for anon, but for GFP_NOIO, this is not the
> case.

But can_reclaim_anon_pages() doesn't only handle the GFP_NOIO case, it 
also covers the swap space limitation scenario. The latter is what 
concerns me more.

If we're only talking about the GFP_NOIO case, I'd agree with your 
concern. However, we could introduce a helper to force anon aging and 
add comments explaining why we need this. That would look more 
maintainable than 2 confusing swappiness variables, no?

Just my 2 cents.

Something like below (untested):

diff --git a/mm/vmscan.c b/mm/vmscan.c
index daa7e37c2236..7c1d26e6b9d7 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2890,7 +2890,7 @@ static int get_swappiness(struct lruvec *lruvec, 
struct scan_control *sc)
         if (swappiness == SWAPPINESS_ANON_ONLY)
                 return swappiness;

-       if (!sc->may_swap)
+       if (!sc->may_swap || !(sc->gfp_mask & __GFP_IO))
                 return 0;

         if (!can_demote(pgdat->node_id, sc, memcg) &&
@@ -4049,7 +4049,7 @@ static inline void flush_lru_batch(struct 
list_head *head, struct list_head **ba
         *batch_end = NULL;
  }

-static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
+static bool inc_min_seq(struct lruvec *lruvec, int type, int 
swappiness, bool force_anon_aging)
  {
         int zone;
         int remaining = MAX_LRU_BATCH;
@@ -4063,7 +4063,7 @@ static bool inc_min_seq(struct lruvec *lruvec, int 
type, int swappiness)
                 goto done;

         /* For anon type, skip the check if swappiness is zero (file 
only) */
-       if (!type && !swappiness)
+       if (!type && !swappiness && !force_anon_aging)
                 goto done;

         VM_WARN_ON_ONCE(get_nr_gens(lruvec, type) != MAX_NR_GENS);
@@ -4183,7 +4183,20 @@ static void try_to_inc_min_seq(struct lruvec 
*lruvec, int swappiness)
         }
  }

-static bool inc_max_seq(struct lruvec *lruvec, unsigned long seq, int 
swappiness)
+static bool is_force_anon_aging(struct scan_control *sc, struct lruvec 
*lruvec,
+               int swappiness)
+{
+       if (swappiness || (sc->gfp_mask & __GFP_IO))
+               return false;
+
+       /*
+        * Explain why we neeed to force increase anon min seq.
+        * xxxxxx
+        */
+       return swappiness != sc_swappiness(sc, lruvec_memcg(lruvec));
+}
+
+static bool inc_max_seq(struct lruvec *lruvec, unsigned long seq, int 
swappiness, bool force_anon_aging)
  {
         bool success;
         int prev, next;
@@ -4205,7 +4218,7 @@ static bool inc_max_seq(struct lruvec *lruvec, 
unsigned long seq, int swappiness
                 if (get_nr_gens(lruvec, type) != MAX_NR_GENS)
                         continue;

-               if (inc_min_seq(lruvec, type, swappiness))
+               if (inc_min_seq(lruvec, type, swappiness, force_anon_aging))
                         continue;

                 lruvec_unlock_irq(lruvec);
@@ -4249,7 +4262,7 @@ static bool inc_max_seq(struct lruvec *lruvec, 
unsigned long seq, int swappiness
  }

  static bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long seq,
-                              int swappiness, bool force_scan)
+                              int swappiness, bool force_scan, bool 
force_anon_aging)
  {
         bool success;
         struct lru_gen_mm_walk *walk;
@@ -4260,7 +4273,7 @@ static bool try_to_inc_max_seq(struct lruvec 
*lruvec, unsigned long seq,
         VM_WARN_ON_ONCE(seq > READ_ONCE(lrugen->max_seq));

         if (!mm_state)
-               return inc_max_seq(lruvec, seq, swappiness);
+               return inc_max_seq(lruvec, seq, swappiness, 
force_anon_aging);

         /* see the comment in iterate_mm_list() */
         if (seq <= READ_ONCE(mm_state->seq))
@@ -4295,7 +4308,7 @@ static bool try_to_inc_max_seq(struct lruvec 
*lruvec, unsigned long seq,
         } while (mm);
  done:
         if (success) {
-               success = inc_max_seq(lruvec, seq, swappiness);
+               success = inc_max_seq(lruvec, seq, swappiness, 
force_anon_aging);
                 WARN_ON_ONCE(!success);
         }

@@ -5262,7 +5275,9 @@ static bool try_to_shrink_lruvec(struct lruvec 
*lruvec, struct scan_control *sc)
                 }

                 if (should_run_aging(lruvec, max_seq, sc, swappiness)) {
-                       if (try_to_inc_max_seq(lruvec, max_seq, 
swappiness, false))
+                       bool force_anon_aging = is_force_anon_aging(sc, 
lruvec, swappiness);
+
+                       if (try_to_inc_max_seq(lruvec, max_seq, 
swappiness, false, force_anon_aging))
                                 need_rotate = true;
                         should_age = true;
                 }
