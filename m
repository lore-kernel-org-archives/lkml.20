Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E03E40EB9D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374283; cv=none; b=JKiN81DI59iAtTeRmwcddIERg2EGT5f7aM/gHlg72GbSuyEgpYQBDxftZKXpgxO0p++7cpn9XaMa5P7JG+C8b+2x5j0bHuKKvmSzpGWZm05DwhVjBZJRjOqKbRXWsJkEJpTdv3zPaYpu4mPzJcdg1Ea3wmsPRIyAQpLjIoDHAo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374283; c=relaxed/simple;
	bh=xDMNmggFQxgwKGrgUdYLCIWAzo50scYyeCKFk/Av5YY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZUBPfwcLf96+YP/FVn8Ao5DSvM4nZy9EKs+OoxdmY5UyAUjUZc1w0Qrs8nxlYP4BQwnD95z0EoZrUm8QmZf4tlQH6u3AUKr/hb9mSlMQkPcAJRLyGvf7Hm1GWV1Eyiuz/2uzwvzgFr/sx5vcSCLARDAQ0i7dAjr5RWrH8sVbGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=R+rFIGd7; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="R+rFIGd7"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789374272; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=RGqO+hBo0WhYu93b9+VGZ0mjT1O3ougoY7v9LOHt4m4=;
	b=R+rFIGd76Pba9DW/JlQcS9rBUrsqY6JzYrEBnKNJSU/mKVrPp++L9fDv43ZTF17IwK76JQHuJzzB6HoFkBIhTyYscQKkbf7F+9AOZXNBLlJ2OWI+DQtMIMg9MP4jq8uTaJHdy2IyQJTqxAOVM4xTU16rWEwlzmmLRyiiIIApXPE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XAtcNCT_1789374271;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAtcNCT_1789374271 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 14 Sep 2026 16:24:31 +0800
Message-ID: <b5263014-23b7-4e8c-9bd9-18198409d0f1@linux.alibaba.com>
Date: Mon, 14 Sep 2026 16:24:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-new v2] mm: mglru: clear the reference counter for
 rejected folios
To: Kairui Song <ryncsn@gmail.com>
Cc: akpm@linux-foundation.org, qi.zheng@linux.dev, shakeel.butt@linux.dev,
 baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com,
 weixugc@google.com, hannes@cmpxchg.org, david@kernel.org, mhocko@kernel.org,
 ljs@kernel.org, ridong.chen@linux.dev, baoquan.he@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <9214e36bf738fcfba86acc8cea85dff4010f66b0.1788918714.git.baolin.wang@linux.alibaba.com>
 <CAMgjq7DdF_fi_MserE_P_AbKR23mrqPLZ-VD71eXH6iv1ncdzQ@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAMgjq7DdF_fi_MserE_P_AbKR23mrqPLZ-VD71eXH6iv1ncdzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/14/26 4:09 PM, Kairui Song wrote:
> On Wed, Sep 9, 2026 at 9:57 AM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>> As per the comment on LRU_REFS_FLAGS, when accessed folios are promoted to
>> a new generation, LRU_REFS_FLAGS should be cleared so that the reference
>> counter can start over.
>>
>> For folios rejected by shrink_folio_list(), we clear LRU_REFS_FLAGS and
>> set the PG_active flag when lru_gen_folio_seq() would place them in the
>> oldest generation. That's fine.
>>
>> But for rejected folios where lru_gen_folio_seq() returns a generation
>> other than the oldest one (which can be treated as a promotion), we do
>> not clear LRU_REFS_FLAGS. This can violate the promotion mechanism. And
>> this means the rejected folio enters the new generation with stale, inflated
>> tier bits, which can inflate reference counts and distort eviction
>> statistics for these rejected folios.
>>
>> Fix this by clearing LRU_REFS_FLAGS for rejected folios. Of course, I need
>> to evaluate the impact of the changes, which mainly falls into 3 cases:
>> 1. When lru_gen_folio_seq() returns the oldest generation for rejected folios,
>> there are no logic changes, and they will be put back into the 2nd youngest
>> generation.
>> 2. For rejected folios with PG_active set by shrink_folio_list(), we only
>> clear the LRU_REFS_FLAGS and do not change the generation.
>> 3. For rejected folios with PG_referenced set, the original code would put
>> them back into the 2nd oldest generation. After this patch, we will put them
>> back into the 2nd youngest generation.
>>
>> I think case 3 is also reasonable, before commmit 6cbdd9726fb5 ("mm/mglru:
>> use folio_mark_accessed to replace folio_set_active"), a rejected referenced
>> folio was also put back to the 2nd youngest gen. Meanwhile, I didn't see
>> any noticeable performance impact on my 32-core Arm machine when running
>> 'make -j32' to build the kernel inside a 3G-limited memcg with either zram
>> or NVMe swap.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>> Changes from v1:
>>   - Update the commit message.
>>   - Clear LRU_REFS_FLAGS earlier.
>> ---
>>   mm/vmscan.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index 40d3f1b48a74..1557679aadb1 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -5020,11 +5020,12 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>>                          continue;
>>                  }
>>
>> +               /* See the comments on LRU_REFS_FLAGS */
>> +               folio_set_lru_refs(folio, 0);
>> +
> 
> Will it be better to mention that we never add the folio to the oldest
> gen (since `folio_set_active` below prevents that) so this is
> effectively promotes the folio by at least one generation? Maybe can
> be combined with the comment below.

OK. How about the following comments?

diff --git a/mm/vmscan.c b/mm/vmscan.c
index c2eb8fa9d5e5..a1ead7c61054 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5071,10 +5071,13 @@ static int evict_folios(unsigned long 
nr_to_scan, struct lruvec *lruvec,
                         continue;
                 }

-               /* See the comments on LRU_REFS_FLAGS */
+               /*
+                * See the comments on LRU_REFS_FLAGS.
+                *
+                * The rejected folios are never added to the oldest 
generation,
+                * so this effectively promotes them by at least one 
generation.
+                */
                 folio_set_lru_refs(folio, 0);
-
-               /* don't add rejected folios to the oldest generation */
                 if (lru_gen_folio_seq(lruvec, folio, false) == 
min_seq[type])
                         folio_set_active(folio);
         }

> 
>>                  /* don't add rejected folios to the oldest generation */
>> -               if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type]) {
>> -                       folio_set_lru_refs(folio, 0);
>> +               if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type])
>>                          folio_set_active(folio);
>> -               }
>>          }
>>
>>          move_folios_to_lru(&list);
>> --
>> 2.47.3
> 
> I tested this, and also tested with MGLRU-FG on top (the posted
> version is on top of this):
> https://lore.kernel.org/linux-mm/20260911-mglru-fg-v2-4-f26e5cb26da7@tencent.com/
> 
> Both cases looked good with no performance regression observed from
> this patch with a few quick tests. It also has no conflict with
> further changes. Nothing surprising was observed, so:

Great. Thanks for testing.

> Reviewed-by: Kairui Song <kasong@tencent.com>
