Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473699;
	b=HTA1eVqU7ZIxxez4CJLQzh8vrqSMWnOjCMc+OlAKedSgPJ7PLLVl27Xvq2eVqfJ31/rM
	 ZoMvu3rSeGTIMPX5lAqvmvbMV2yflDtL8ka9t6aVKAQ32Pa8CGsbASVn2QUV5A3+lljVy
	 esTEhSG5EcRhBmNCQET0nf1ZMhg4am9+G/D+oYaTsDKqr7Pj7KEwFwHu33t/mEXcHFZQA
	 DJ/Bs8d/F7q+JIWQVM6qBLdLcLCvhYzmxLIHGcaTNoCtTG/3FnOq5/LXfMpvYUmHl13PO
	 tzMin1gu++NnuXTv7M5ZHXxGJDK8d6F5XDs9weW7zmrTo9v3c/mpkTxAivdRSYNTNJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473699;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bUU8aJriCj4L30614In2cmZDuMPUuAtDiWuioRCy4Ew=;
	b=lTBPxdAi8h+cqas7N8Y8SyBKDA9CMSMa3SwcscxlZuSS9Tb/Pm4WroVjS4HzWu1269XL
	 zGZjj6CW5gn7//GWzHStf/xEuekmWp33PgkUrQ4WA7vxrJMEFUSL0vg4IA/G3N9gpcb3A
	 zkFEQmUiPBifluP0oVFdaD9s2x3kb5WFAuueTrShQQCv2FxyScbgGH9+2p8+Rs00NmWjL
	 A/l2ywD7XrzBtFA4QIhrFQkfrW0dB7mB1EIM3UlEYOtC83p11rB7QPS3rHicgnV8tl5U9
	 BNowk3jDg50i5C3opu0DPq75dnwkJXyss3NDimTpdAJq6R+mSG28Nbx+R0sxIgeTGdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GCOsEAnk;
	arc=none smtp.remote-ip=95.215.58.64
Received: from mta1.migadu.com (out-64.mta1.migadu.com [95.215.58.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC19606A891
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AC19606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GCOsEAnk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YsFJ1UStpx7QYNPW/2zE3mPvngieaVFLiicQbyvU7PY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794473696; v=1; x=1795078496;
 b=GCOsEAnkfrVVwc3xDIKSkChL0T2tbcjDklKI3DDvJGU3CIkgZ9A3Jq9G9400Yhoop1pf8WSO
 Ue12sTlUWpkut0nadfeMg6022lvCUmdhqM54Kvcw9WrT4OI2+gIIsiDl8f0yccptEp/83bEMVTN
 WUDQPbaHjr+Ld6/bG2ojuAG0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5255a3e99e026359;
	Thu, 12 Nov 2026 08:54:56 +0000
X-Mizu-Trace-ID: 5255a3e99e026359
X-Migadu-Flow: FLOW_OUT
Message-ID: <c01ec177-da44-49bc-a542-35b64554526f@linux.dev>
Date: Thu, 12 Nov 2026 16:54:47 +0800
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
Subject: Re: [PATCH] mm/mglru: deactivate anon folios into the oldest
 generation
To: Barry Song <baohua@kernel.org>, Kairui Song <ryncsn@gmail.com>
Cc: David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Yu Zhao <yuzhao@google.com>,
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
References: <20261112081928.3014946-1-ridong.chen@linux.dev>
 <avV52J2rD19cjM2J@KASONG-MC4>
 <CAGsJ_4yibOkJmi9niJ8svu2NdEkZ5Qyf98VO6qMrJMa_9wGFgQ@mail.gmail.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <CAGsJ_4yibOkJmi9niJ8svu2NdEkZ5Qyf98VO6qMrJMa_9wGFgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/12/2026 4:41 PM, Barry Song wrote:
> On Thu, Nov 12, 2026 at 4:38 PM Kairui Song <ryncsn@gmail.com> wrote:
> [...]
>>>   mm/folio.c | 11 ++++++++++-
>>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/folio.c b/mm/folio.c
>>> index ea3adb6a89d7..c412d9b398e4 100644
>>> --- a/mm/folio.c
>>> +++ b/mm/folio.c
>>> @@ -583,7 +583,16 @@ static void lru_deactivate(struct lruvec *lruvec, struct folio *folio)
>>>        lruvec_del_folio(lruvec, folio);
>>>        folio_clear_active(folio);
>>>        folio_clear_referenced(folio);
>>> -     lruvec_add_folio(lruvec, folio);
>>> +     /*
>>> +      * For MGLRU, lruvec_add_folio() places anon folios that are not in
>>> +      * the swap cache into the second youngest generation, which is an
>>> +      * active one. Add the folio to the oldest generation instead, like
>>> +      * lru_deactivate_file() does for clean folios.
>>> +      */
>>> +     if (lru_gen_enabled())
>>> +             lruvec_add_folio_tail(lruvec, folio);
>>> +     else
>>> +             lruvec_add_folio(lruvec, folio);
>>
>> Hi Ridong,
>>
>> One question here, why MGLRU/CLRU have to use two different ways to
>> add the folio back?  Will this cause over aggressive reclaim of the
>> folio?
> 
> I guess that is because on mglru, that is lacing a way to add the folio to
> the head of the oldest generation for anon folios while CLRU can do
> that :-)

Hi Kairui, Barry,

Thanks for taking a look.

Barry is right about the reason. With the classic LRU,
lruvec_add_folio() adds the deactivated folio to the head of the
inactive list. With MGLRU, lruvec_add_folio() can't put an anon folio
into the oldest generation at all: lru_gen_folio_seq() places a
swap-backed folio that is not in the swap cache into max_seq - 1,
regardless of its refs. The only way to reach the oldest generation is
the reclaiming path of lruvec_add_folio_tail(), and that path adds the
folio to the tail.

And you are right that this makes it more aggressive than the classic
LRU. With this patch, a deactivated folio is evicted before the folios
already in the oldest generation, while the classic LRU puts it behind
the folios already on the inactive list. It also changes file folios:
before this patch they are added to the head of the oldest generation,
the same as the classic LRU, and now they go to the tail.

So the problem in the current code is that a deactivated anon folio is
promoted into an active generation, and with this patch it goes one
step further than the classic LRU in the other direction.

-- 
Best regards
Ridong

