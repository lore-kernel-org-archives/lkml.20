Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B1639658D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854018; cv=none; b=X3HK1AT6ldBdEQfXmKQsDx+cy2XGF3+FCKArKOZPzXsmT1PoXPJHvRUs22Qf09DbLajwQ6tk5eDFqvLKsvWTEgeqDG72+wZ+5eckNYJ+FxA6cR+kfT3NYOVc5KTeW1lZZ1O6uNTjIo7kRMsFfiklJMpDF38jxIvpetZLwv/THOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854018; c=relaxed/simple;
	bh=PkPwGX13b8caTho2L/mj/eyuJv/Wn7rCHF4/MaU9rkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxKh8NRPvINFJ2bc76xj6b/4cRlwwxkOvIVXKh3ZXwSre6GfCl7W5od7cPoW7x2J9/xRzc1XZxjk1WczoCa2BGDB0Swkviqwnu2sUgDrnUiUoED2V7ADXj5jpQJ4ByD/0eSULA4khcF/kx09e3VNLMDOnq2QVIrtEkD5EcAm990=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=trM5oV9j; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="trM5oV9j"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788854013; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=/m0UGCD1rNVi71mlkVc+SVKZMBJRDxUcU5AjaBUwxy8=;
	b=trM5oV9jwWhBV8bFjMKGmIq/SQqkBpujf2rF0UEfcy5mggYn4ryIDP0QrOT9Nc0t81AbAeqArjE5M5Ohx1IQLpV+zfolfsqF2Qyof2T864AmdOGh71MYUwcsUF9f9dtJ7yB3uHv2uZ7AMMM/qzrmR4ehJ9WBtZztW/bOdkEuF38=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R851e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XAamhBZ_1788854011;
Received: from 30.74.144.127(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAamhBZ_1788854011 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 08 Sep 2026 15:53:32 +0800
Message-ID: <ccb8e121-bf5b-4bb4-a9de-fb5290998ddd@linux.alibaba.com>
Date: Tue, 8 Sep 2026 15:53:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: mglru: clear the reference counter for rejected
 folios
To: Baoquan He <baoquan.he@linux.dev>
Cc: Barry Song <baohua@kernel.org>, akpm@linux-foundation.org,
 kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev,
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
 hannes@cmpxchg.org, david@kernel.org, mhocko@kernel.org, ljs@kernel.org,
 ridong.chen@linux.dev, hebaoquan@kylinos.cn, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <8e4db9a298c5ea6ccb192e274caed5b96f0cf022.1788751143.git.baolin.wang@linux.alibaba.com>
 <ap9zPPughaSlfXM2@fedora>
 <CAGsJ_4wn5ArqhG9w7gJY7X4G+Lg6=1teCb70dzPdN0k+5H8MbQ@mail.gmail.com>
 <67d9bbcf-2991-4867-8afb-14bad1cebf8d@linux.alibaba.com>
 <31494361-406e-4874-8a2c-2c6f5cee5321@linux.alibaba.com>
 <ap-yQOH0pni-mfdf@fedora>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <ap-yQOH0pni-mfdf@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/8/26 2:59 PM, Baoquan He wrote:
> On 09/08/26 at 12:01pm, Baolin Wang wrote:
>>
>>
>> On 9/8/26 11:03 AM, Baolin Wang wrote:
>>>
>>>
>>> On 9/8/26 10:34 AM, Barry Song wrote:
>>>> On Tue, Sep 8, 2026 at 10:30 AM Baoquan He <baoquan.he@linux.dev> wrote:
>>>>>
>>>>> Hi Baolin,
>>>>>
>>>>> On 09/07/26 at 11:25am, Baolin Wang wrote:
>>>>> ......snip...
>>>>>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>>>>>> index 40d3f1b48a74..42c0a09938ab 100644
>>>>>> --- a/mm/vmscan.c
>>>>>> +++ b/mm/vmscan.c
>>>>>
>>>>> Well, this seems to be based on Andrew's mm-new branch. I usually track
>>>>> mm-unstable branch. Maybe the subject should be marked as below?
>>>>> [PATCH mm-new] mm: mglru: clear the reference counter for rejected
>>>
>>> ACK.
>>>
>>>>>
>>>>>> @@ -5021,10 +5021,11 @@ static int evict_folios(unsigned
>>>>>> long nr_to_scan, struct lruvec *lruvec,
>>>>>>                 }
>>>>>>
>>>>>>                 /* don't add rejected folios to the oldest generation */
>>>>>> -             if (lru_gen_folio_seq(lruvec, folio, false) ==
>>>>>> min_seq[type]) {
>>>>>> -                     folio_set_lru_refs(folio, 0);
>>>>>> +             if (lru_gen_folio_seq(lruvec, folio, false) ==
>>>>>> min_seq[type])
>>>>>>                         folio_set_active(folio);
>>>>>> -             }
>>>>>> +
>>>>>> +             /* See the comments on LRU_REFS_FLAGS */
>>>>>> +             folio_set_lru_refs(folio, 0);
>>>>>
>>>>> This looks like a great catch, while the code change could bring issue.
>>>>>
>>>>> Because move_folios_to_lru() relies on folios' flags to decide their new
>>>>> generation. You just cleared it before move_folios_to_lru(). This is no
>>>>> problem for rejected folios that are determined to be put into the
>>>>> oldest generation. But for those rejected folios that are determined to
>>>>> be promoted, this could be wrong. E.g currently gen window is 4, and a
>>>>> folio is referenced, lru_gen_folio_seq() decides its new gen as 1, which
>>>>> is the 2nd oldest generation. While folio_set_lru_refs(folio, 0) clear
>>>>> referenced bit, this causes it being put into the oldest generation in
>>>>> move_folios_to_lru(), this is not expected.
>>>
>>> Yes. As I discussed with Barry earlier, lru_gen_folio_seq() also needs
>>> to be reconsidered regarding whether it should rely on PG_referenced
>>> [1].
>>>
>>> For commit 6cbdd9726fb5, we didn't discuss the impact on rejected folios
>>> either. Before commit 6cbdd9726fb5, if rejected folios did not have
>>> PG_active set by shrink_folio_list(), evict_folios() would set PG_active
>>> on these rejected folios.
>>>
>>> [1] https://lore.kernel.org/linux-mm/20260901220430.79810-1-
>>> baohua@kernel.org/
>>>
>>>> The original code looks quite weird. It even prioritizes folios
>>>> that won't be promoted by `PG_active`. Do we need to change all
>>>> the cases just to call `PG_active`?
> 
> I would agree if we can. While I have one concern. A rejected folio that
> should have gone into the oldest generation is now being promoted to the
> 2nd newest generation. In the original code, referenced folio is only
> being promoted to the next gen. I even think this is not a bug, but Yu

That's not quite true. Before commit 6cbdd9726fb5, a rejected referenced 
folio was also put back to the 2nd youngest gen.

> Zhao intentionally did it: the coldest folio is moved to 2nd newest gen,
> referenced folio (hot folio) is moved to new gen but carries the referenced
> bit. Both of them seems to be treated somewhat equally.
> 
> To me, I would rather move both of them to the next gen, while keep their
> refs untouched.

IMHO, I strongly recommend not doing this, and that's exactly the 
motivation behind my patch. Because this is also being treated as a 
promotion, it should behave like folio_inc_gen() or folio_update_gen() 
and clear the refs after promotion. I think this is a fundamental 
principle of promotion. Otherwise, ref-based promotion is already 
completely broken.

Next, I also plan to clean up refs in lru_gen_set_refs() as discussed 
with Barry.

>>> Yes. Regarding this concern, I plan to change back to the original
>>> behavior:
>>>
>>>       /* See the comments on LRU_REFS_FLAGS */
>>>       folio_set_lru_refs(folio, 0);
>>>
>>>       /* don't add rejected folios to the oldest generation */
>>>       if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type])
>>>           folio_set_active(folio);
>>>
>>> What do you think?
>>
>> Just FYI, after above changes, the performance improvement on zram is no
>> longer obvious either. I think this also answers Kairui's earlier question
>> about why I saw a performance improvement (which seems related to commit
>> 6cbdd9726fb5). Also, there is no obvious performance regression either.
> 
> Hi Baolin,
> 
> Not sure if it's convenient to do a little more testing in your side.
> E.g rejected folios are moved to next gen, but not clearing their flags.

I'm not sure what you mean by "next gen" here. If you mean the 2nd 
oldest gen, I actually tested that too, that is, clearing refs after 
move_folios_to_lru(), and there wasn't any noticeable performance impact 
either (but the code was a bit hacky, so I didn't go with this approach).

> Then we can at least know which one is more efficient on yout testing
> platform.
> 
> coldest folio      referenced folio
> ---------------------------------------------
> max_gen -1         next gen + referenced kept
> max_gen -1         max_gen -1
> next_gen           next gen + referenced kept
> 
> Thanks
> Baoquan

