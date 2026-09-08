Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98133093D8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836609; cv=none; b=CVlvC/ihEKCUsA0s5kNlOyDgCfTGzvV/k6VSGMuWhBtC3iJ1Iy2snl06deXl0yNiZM/cp0CC57QBBYc3AGvwX+J024RsCsYhMGfv5x4TS8Qs++SptSvJCuM789Ga95WsQ8hAZw3vUyfoMKL3EYrABYd9/DQgTtYTDEsgCtRpiFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836609; c=relaxed/simple;
	bh=aYbcdQcp9YsYIT0AdbfT5jYmNiPLzick1KSKSO743oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fRA5VuFyaHW683CBetFDgcZG+2yFAx/MXd3DZWWb5zwKw5CyJ1CokdDr7GmRCSJ47KF0hX7DbgVPgMCpz445CGPgfp/TrZZtihlhJi9p+u/fsTbcat5MFuDEIP4RwYlEYN3f8saPapmpGkuZDl+zR2jlUYOk1iRnq7m/nDeseZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ACUuhMUz; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ACUuhMUz"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788836603; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=5a1YoX0SvL7sfW8pstssuVuZZ1A6GuIK0U/myKASnew=;
	b=ACUuhMUzPiqhWhIdCgsOnOPoU9chMhyECkUb2qaaqOWmPTkYb96tuprexQq8nchvuSIk1pIeDGBbZDYihYu6gwWqjJL80f6Wmc5lXGNRMdbRsGLmg3D/T7NZI0yETrPxwIpe4goeRI72KkZo2jNkZadKVmC3wky4D0tWkLD6C/s=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XAa8j2p_1788836600;
Received: from 30.74.144.127(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAa8j2p_1788836600 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 08 Sep 2026 11:03:21 +0800
Message-ID: <67d9bbcf-2991-4867-8afb-14bad1cebf8d@linux.alibaba.com>
Date: Tue, 8 Sep 2026 11:03:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: mglru: clear the reference counter for rejected
 folios
To: Barry Song <baohua@kernel.org>, Baoquan He <baoquan.he@linux.dev>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com,
 weixugc@google.com, hannes@cmpxchg.org, david@kernel.org, mhocko@kernel.org,
 ljs@kernel.org, ridong.chen@linux.dev, hebaoquan@kylinos.cn,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <8e4db9a298c5ea6ccb192e274caed5b96f0cf022.1788751143.git.baolin.wang@linux.alibaba.com>
 <ap9zPPughaSlfXM2@fedora>
 <CAGsJ_4wn5ArqhG9w7gJY7X4G+Lg6=1teCb70dzPdN0k+5H8MbQ@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4wn5ArqhG9w7gJY7X4G+Lg6=1teCb70dzPdN0k+5H8MbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/8/26 10:34 AM, Barry Song wrote:
> On Tue, Sep 8, 2026 at 10:30 AM Baoquan He <baoquan.he@linux.dev> wrote:
>>
>> Hi Baolin,
>>
>> On 09/07/26 at 11:25am, Baolin Wang wrote:
>> ......snip...
>>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>>> index 40d3f1b48a74..42c0a09938ab 100644
>>> --- a/mm/vmscan.c
>>> +++ b/mm/vmscan.c
>>
>> Well, this seems to be based on Andrew's mm-new branch. I usually track
>> mm-unstable branch. Maybe the subject should be marked as below?
>> [PATCH mm-new] mm: mglru: clear the reference counter for rejected

ACK.

>>
>>> @@ -5021,10 +5021,11 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>>>                }
>>>
>>>                /* don't add rejected folios to the oldest generation */
>>> -             if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type]) {
>>> -                     folio_set_lru_refs(folio, 0);
>>> +             if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type])
>>>                        folio_set_active(folio);
>>> -             }
>>> +
>>> +             /* See the comments on LRU_REFS_FLAGS */
>>> +             folio_set_lru_refs(folio, 0);
>>
>> This looks like a great catch, while the code change could bring issue.
>>
>> Because move_folios_to_lru() relies on folios' flags to decide their new
>> generation. You just cleared it before move_folios_to_lru(). This is no
>> problem for rejected folios that are determined to be put into the
>> oldest generation. But for those rejected folios that are determined to
>> be promoted, this could be wrong. E.g currently gen window is 4, and a
>> folio is referenced, lru_gen_folio_seq() decides its new gen as 1, which
>> is the 2nd oldest generation. While folio_set_lru_refs(folio, 0) clear
>> referenced bit, this causes it being put into the oldest generation in
>> move_folios_to_lru(), this is not expected.

Yes. As I discussed with Barry earlier, lru_gen_folio_seq() also needs 
to be reconsidered regarding whether it should rely on PG_referenced [1].

For commit 6cbdd9726fb5, we didn't discuss the impact on rejected folios 
either. Before commit 6cbdd9726fb5, if rejected folios did not have 
PG_active set by shrink_folio_list(), evict_folios() would set PG_active 
on these rejected folios.

[1] 
https://lore.kernel.org/linux-mm/20260901220430.79810-1-baohua@kernel.org/

> The original code looks quite weird. It even prioritizes folios
> that won't be promoted by `PG_active`. Do we need to change all
> the cases just to call `PG_active`?

Yes. Regarding this concern, I plan to change back to the original behavior:

	/* See the comments on LRU_REFS_FLAGS */
	folio_set_lru_refs(folio, 0);

	/* don't add rejected folios to the oldest generation */
	if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type])
		folio_set_active(folio);

What do you think?
