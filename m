Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.70.206.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792745585;
	b=SVpU1MmYCAeCr7lpV9p0XXj14cAinBjKCtrY7I9cl2vhyFeIKxWnAG+fD1XxmxaT8JcE
	 Rep3FW186svLzT4/Q+WE+B9DrAQ8bWzYWu3TUGHSSIBkiZSm33Z2ZmA4jO1FVObGlSDt/
	 N2ZLf1HC/f161Xo36vO68znxoc1sSUU6wASfOVB3GIKB8IjB58HEG5YqM+sNwJ8twOvRd
	 NumzZBe0Liv6Jdgi3NPwROuNgGrKhPSSnzc7YdDFYUT0xhWqRl7pM6tMp+dysRzb3kssC
	 CFkWASH/1U1PC4m24uuyEG+daBXkMMcfSDdvcjM0+3f7Gdo3w916QdMGR/Yw4UTHNAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792745585;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Originating-IP:X-ClientProxiedBy;
	bh=r5PwMVw7smUN62UD1e5YSyFTBD/on9Hsq1pWaywHq+Y=;
	b=ffK+NN0/AVipx4ZNQSvxWJP2x9ZsMjp8ED5WWpal5lTv+k70LkUQwP71weAV4ruoCWe5
	 s6ZgyMHg6o9KOUHoNCy1mEcpExwl8Gxjnq5xSn4iCtLBYq1jTcH3EnPHSqtCKUil124i0
	 THkPg3nmd2IGbPsnND25bR0G+Cn4DNAP+WE5uuEKYKg/8kTczK6DIiLCULUeiN/4s22Jd
	 RtuBG2pI2onqwi4yUEPKRBtg4Ww0AUC5DBP2COMTrrxr4k3hperj0motV7PdIaQg+2hRh
	 Pm/+81qdJRzUTz7de5swq4vgHs4qnrDHe0lkqJ0oHT0kMfTNjIuo781pS1fPl1PU0hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=honor.com;
	spf=pass smtp.mailfrom=honor.com;
	dkim=pass header.d=honor.com header.i=@honor.com header.a=rsa-sha256 header.s=dkim header.b=SYFjnLmD;
	arc=none smtp.remote-ip=81.70.206.69
Received: from mta20.hihonor.com (mta20.hihonor.com [81.70.206.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6717F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6717F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=honor.com header.i=@honor.com header.a=rsa-sha256 header.s=dkim header.b=SYFjnLmD
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=To:From;
	bh=r5PwMVw7smUN62UD1e5YSyFTBD/on9Hsq1pWaywHq+Y=;
	b=SYFjnLmDeVAK5lRBdrtreL9fj+ZmnVGlGj0rojwK7gQO0zfIUJ6P2csHZDeBvTlvsthgkkZiS
	1Ha7BXdcDv70SyaGNwiHaCk0aiDa6KXOWNmC1g87Fgderf0hRaZRCuW8hW015d7KthCCA/XW/1b
	2KoNBQTDmz/MQb7D1tx7OJU=
Received: from TW003.hihonor.com (unknown [10.77.199.161])
	by mta20.hihonor.com (SkyGuard) with ESMTPS id 4j9xcP13KTzYl21J;
	Fri, 23 Oct 2026 16:52:53 +0800 (CST)
Received: from TA012-1.hihonor.com (10.77.199.132) by TW003.hihonor.com
 (10.77.199.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 16:52:48 +0800
Received: from [10.144.5.36] (10.144.5.36) by TA012-1.hihonor.com
 (10.77.199.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 16:52:37 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH mm-new] mm/mglru: clarify the generation placement in
 lru_gen_folio_seq()
From: <wangzicheng@honor.com>
To: Ridong Chen <ridong.chen@linux.dev>
CC: <wangzicheng@honor.com>, Andrew Morton <akpm@linux-foundation.org>, "David
 Hildenbrand" <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, "Mike
 Rapoport" <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, "Michal
 Hocko" <mhocko@suse.com>, Kairui Song <kasong@tencent.com>, Qi Zheng
	<qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Barry Song
	<baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie
	<yuanchu@google.com>, Wei Xu <weixugc@google.com>, Baoquan He
	<baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Ridong Chen
	<chenridong@xiaomi.com>
In-Reply-To: <813b3f19-1cfc-4d07-a9b8-ea20f8fb0bee@linux.dev>
References: <20261020023548.3242028-1-ridong.chen@linux.dev>
 <179257189711.741142.157439930403322311.b4-reply@b4>
 <813b3f19-1cfc-4d07-a9b8-ea20f8fb0bee@linux.dev>
Date: Fri, 23 Oct 2026 16:52:52 +0800
Message-ID: <179274557215.1623101.1816617712512017779.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792745572; l=9658;
 i=wangzicheng@honor.com; h=from:subject:message-id;
 bh=Z8APWKK9r7zgMro38a2UtSMaA8pp0CPBrFMeqPt5BUE=;
 b=Dr8o0DtlGGEa+LvjL88HVOYru+iwRhKjhCtHBaHrrSlSCGoUrPiwRCx9WCMGxKPqRW/cTeIoX
 deWyHRvQ+pyAvouMmZ/b9PqXYcydxtS2wjDp6YlQIayetTfByQUiJev
X-Developer-Key: i=wangzicheng@honor.com; a=ed25519;
 pk=g+Qn/iierc6RbauMzxguVPAh7jEJCJf1WMdMV9Kk2sc=
X-ClientProxiedBy: TW001.hihonor.com (10.77.229.151) To TA012-1.hihonor.com
 (10.77.199.132)

On 2026-10-22 14:41 +0800, Ridong Chen wrote:
> 
> 
> On 10/21/2026 4:38 PM, wangzicheng@honor.com wrote:
> > On 2026-10-20 10:35 +0800, Ridong Chen wrote:
> >> From: Ridong Chen <chenridong@xiaomi.com>
> >>
> >> lru_gen_folio_seq() computes how many generations below max_seq a
> >> folio should be added to, but stores it in a variable named "gen".
> >> Elsewhere in MGLRU "gen" means an index into lrugen->folios[], i.e.
> >> seq % MAX_NR_GENS, so reusing the name for a relative offset is
> >> confusing.
> >>
> >> The comment table above the code also no longer matches it. It only
> >> covers the PG_active and the final branch, leaving out the reclaiming
> >> and "can't evict yet" cases, and it lists LRU_REFS_FLAGS as an input
> >> although lru_gen_folio_seq() never looks at it.
> >>
> >> Rename the local variable to "age", redraw the table so that each
> >> branch maps to the age and seq it produces, and note that the result
> >> is clamped to min_seq[type].
> >>
> >> No functional change.
> >>
> >> Assisted-by: LLM
> >> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> >> ---
> >>   include/linux/mm_inline.h | 48 ++++++++++++++++++++++++++-------------
> >>   1 file changed, 32 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> >> index ab69b9930893..a933d8c14558 100644
> >> --- a/include/linux/mm_inline.h
> >> +++ b/include/linux/mm_inline.h
> >> @@ -302,34 +302,50 @@ static inline unsigned long lru_gen_folio_seq(const struct lruvec *lruvec,
> >>   					      const struct folio *folio,
> >>   					      bool reclaiming)
> >>   {
> >> -	int gen;
> >> +	int age;
> >>   	int type = folio_is_file_lru(folio);
> >>   	const struct lru_gen_folio *lrugen = &lruvec->lrugen;
> >>   
> >>   	/*
> >> -	 * +-----------------------------------+-----------------------------------+
> >> -	 * | Accessed through page tables and  | Accessed through file descriptors |
> >> -	 * | promoted by folio_update_gen()    | and protected by folio_inc_gen()  |
> >> -	 * +-----------------------------------+-----------------------------------+
> >> -	 * | PG_active (set while isolated)    |                                   |
> >> -	 * +-----------------+-----------------+-----------------+-----------------+
> >> -	 * |  PG_workingset  |  PG_referenced  |  PG_workingset  |  LRU_REFS_FLAGS |
> >> -	 * +-----------------------------------+-----------------------------------+
> >> -	 * |<---------- MIN_NR_GENS ---------->|                                   |
> >> -	 * |<---------------------------- MAX_NR_GENS ---------------------------->|
> >> +	 *            +-----------------+-----------------+-----------------+-----------------+
> >> +	 * age        |        1        |        2        |        3        |        4        |
> > Hi Ridong,
> >    
> > Agreed, I also found this part confusing.
> > 
> > One problem with the new name: in MGLRU a larger seq/gen means a
> > younger generation, but a larger age means an older one, so every
> > read needs a flip (max_seq - age + 1). Assigning the seq directly in
> > each branch might read more naturally.
> > 
> 
> Hi Zicheng,
> 
> Thank you for your reply. We both agree that this part of the code is confusing. 
> 'age' is not perfect, but it is much better. The bigger the age, the elder it 
> is, just like human age. And it is a local variable, not used elsewhere, so it 
> is fine for me.
> 
Hi Ridong,
   
Thanks for the explanation. To be clear, I have no problem with the
name itself: it is a local variable and there is no functional
impact either way.

> > Also, both tables run past 80 columns (~95 for the art in mglru-fg
> > 4/17, ~96 for the redrawn one here, tab as 8). Would you consider
> > something vertical and shorter? I had prepared a comment for
> > mglru-fg, and since this is being discussed here too, here it is
> > (conditions are per mglru-fg, where the flags became the refs
> > count):
> > 
> >      /*
> >          * The seq is clamped to min_seq[type]:
> >          *
> >          *   destination     | folio state
> >          *   ----------------+--------------------------------------------
> >          *   youngest        | PG_active, refs >= LRU_REFS_WORKINGSET
> >          *   (max_seq)       |
> >          *
> >          *   2nd youngest    | PG_active, refs < LRU_REFS_WORKINGSET
> >          *   (max_seq - 1)   | anon folio not yet in swapcache
> >          *                   | PG_reclaim folio, dirty or under writeback
> >          *
> >          *   2nd oldest      | refs >= LRU_REFS_WORKINGSET
> >          *   (max_seq - 2)   |
> >          *
> >          *   oldest          | reclaiming
> >          *   (min_seq[type]) | otherwise: refs < LRU_REFS_WORKINGSET
> >          */
> > 
> > With a comment like this, developers can see the generation
> > placement directly, instead of working it out from the code.
> > 
> 
> Thanks for the table,
> 
> As Kairui replied, he did not want more code details in the comment, which may 
> change a lot. And Kairui will pick this patch with his FG series. Although I 
> wanted to add the table, Kairui felt there shouldn't be too much detail.
> 
> What is more, I think the following is needed—it is what this function initially 
> implemented.
> 
> +-----------------------------------+-----------------------------------+
> | Accessed through page tables and  | Accessed through file descriptors |
> | promoted by folio_update_gen()    | and protected by folio_inc_gen()  |
> +-----------------+-----------------+-----------------+-----------------+
> 
> > Best,
> > Zicheng
> > 
> > 
> >> +	 *            +-----------------+-----------------+-----------------+-----------------+
> >> +	 * seq        |     max_seq     |    max_seq-1    |    max_seq-2    |    max_seq-3    |
> >> +	 *            +-----------------------------------+-----------------------------------+
> >> +	 *            |<---------- MIN_NR_GENS ---------->|                                   |
> >> +	 *            |<---------------------------- MAX_NR_GENS ---------------------------->|
> >> +	 *            +-----------------------------------+-----------------------------------+
> >> +	 *            | Accessed through page tables and  | Accessed through file descriptors |
> >> +	 *            | promoted by folio_update_gen()    | and protected by folio_inc_gen()  |
> >> +	 *            +-----------------+-----------------+-----------------+-----------------+
> >> +	 * PG_active  |  PG_workingset  | !PG_workingset  |                 |                 |
> >> +	 *            +-----------------+-----------------+-----------------+-----------------+
> >> +	 * reclaiming |                 |                 |                 |     always      |
> >> +	 *            +-----------------+-----------------+-----------------+-----------------+
> >> +	 * can't      |                 |  anon && not in |                 |                 |
> >> +	 * evict yet  |                 |  swapcache, or  |                 |                 |
> >> +	 *            |                 |  PG_reclaim &&  |                 |                 |
> >> +	 *            |                 | dirty/writeback |                 |                 |
> >> +	 *            +-----------------+-----------------+-----------------+-----------------+
> >> +	 * else       |                 |                 |  PG_workingset  | !PG_workingset  |
> >> +	 *            |                 |                 |       or        |       &&        |
> >> +	 *            |                 |                 |  PG_referenced  | !PG_referenced  |
> >> +	 *            +-----------------+-----------------+-----------------+-----------------+
> >> +	 *
> >> +	 * The resulting seq is clamped to min_seq[type].
> >>   	 */
> >>   	if (folio_test_active(folio))
> >> -		gen = MIN_NR_GENS - folio_test_workingset(folio);
> >> +		age = MIN_NR_GENS - folio_test_workingset(folio);
> >>   	else if (reclaiming)
> >> -		gen = MAX_NR_GENS;
> >> +		age = MAX_NR_GENS;
> >>   	else if ((!folio_is_file_lru(folio) && !folio_test_swapcache(folio)) ||
> >>   		 (folio_test_reclaim(folio) &&
> >>   		  (folio_test_dirty(folio) || folio_test_writeback(folio))))
> >> -		gen = MIN_NR_GENS;
> >> +		age = MIN_NR_GENS;
> >>   	else
> >> -		gen = MAX_NR_GENS - (folio_test_workingset(folio) || folio_test_referenced(folio));
> >> +		age = MAX_NR_GENS - (folio_test_workingset(folio) || folio_test_referenced(folio));
> >>   
> >> -	return max(READ_ONCE(lrugen->max_seq) - gen + 1, READ_ONCE(lrugen->min_seq[type]));
> >> +	return max(READ_ONCE(lrugen->max_seq) - age + 1, READ_ONCE(lrugen->min_seq[type]));
> >>   }

My real point was about the form of the computation: whatever the
variable is called, the return still does max_seq - X + 1 and then
clamps to min_seq[type], so a reader has to juggle a plus, a minus
and a clamp at the same time. When I first read it I had to go back
and forth. By comparison, the 6.6-era code assigned the placement 
directly in each branch (roughly `seq = max_seq or
seq = min_seq + 1` style), which is a bit more verbose but much more
direct.

Anyway, these are minor points with no functional impact. I don't
feel strongly about this, so I will defer to you and Kairui.

Thanks,
Zicheng

> >>   
> >>   static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio *folio, bool reclaiming)
> >> -- 
> >> 2.34.1
> >>
> >>
> > 
> 
> -- 
> Best regards
> Ridong
> 
> 


