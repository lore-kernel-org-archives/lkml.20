Received: from mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007A7369985
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787797205; cv=none; b=go/PNrHlNZP1mAZkGe0xNCzvBgnFnwGNTNPf9ww8p0JaldI45e7KW0pE/HULSR+FSJ0L5XrXtAYHyMf9Vwa7I/fKnKKMRulS5C+iX5CC8HCQqqwlVizs004Shdxffu8JgyMCI5tL1t/2e40wWkObjQYK+gGQB3W3IxqyS8Zbv/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787797205; c=relaxed/simple;
	bh=/TpMjyqOvhWTUqglHXSxKj5Hxf2i55OsSPKaTfq8kvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQeRUJOEsIgwU2c+FmuLnEUos+Hp8a9gEJM2pAs/f2YwSCPXFLmUp1C6qDiJGOhXzcBHNeBPSOtxgm1WF2n93kH+M0cLKNBlyZhDsM6CeUgVbv4lp3GvWaKjZEugqKhxqYXIT7Dm+AvaELtx7priL9ozbbD0DJrX5Rdp7Q76Y/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fQlFDKff; arc=none smtp.client-ip=91.218.175.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fQlFDKff"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/TpMjyqOvhWTUqglHXSxKj5Hxf2i55OsSPKaTfq8kvA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787797200; v=1; x=1788402000;
 b=fQlFDKffFBrIo/FYQSpPhrFF7VNlj7tUNVnHMzfBT6RasPD59cnrjMvXL3Wy/seJ0uXt2EE9
 6h6mUspDhd/wJPlWRcRq3VHGv/JZK3s3nSrsYS77OEreUh+2irxrXztQrbfdRl4g1PBHvMwluyA
 co3OjbRm15mm5fbuapjjc5kk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from localhost (223.70.160.239)
	by mta11.migadu.com with ESMTPS id a789069183687cf0;
	Thu, 27 Aug 2026 02:20:00 +0000
X-Mizu-Trace-ID: a789069183687cf0
X-Migadu-Flow: FLOW_OUT
Date: Thu, 27 Aug 2026 10:19:54 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com, chenridong@xiaomi.com,
	david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com,
	lianux.mm@gmail.com, linux-kernel@vger.kernel.org, ljs@kernel.org,
	lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, stevensd@chromium.org,
	wangzicheng@honor.com, weixugc@google.com, yuanchu@google.com,
	zhangbo56@xiaomi.com
Subject: Re: [PATCH 3/6] mm/mglru: enhance cold/hot inversion handling in
 inc_min_seq()
Message-ID: <ao-eyroFfnKzQU8a@MiWiFi-R3L-srv>
References: <20260821102538.22642-1-baohua@kernel.org>
 <20260821102538.22642-4-baohua@kernel.org>
 <ao6qTTtk2xkkeKob@fedora>
 <CAGsJ_4ywk7mA1xfk=emtqby1UAwFsaH9PChmk2TuZoDKrMzuXw@mail.gmail.com>
 <ao-I8rYv_G5j4wz4@MiWiFi-R3L-srv>
 <CAGsJ_4zoXvyXG6-qAH+=nv6V92w_U_tk78YAPKMihRniqvTe8A@mail.gmail.com>
 <ao-dewgE9XAfP0rU@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ao-dewgE9XAfP0rU@MiWiFi-R3L-srv>

On 08/27/26 at 10:14am, Baoquan He wrote:
> On 08/27/26 at 09:24am, Barry Song wrote:
> > On Thu, Aug 27, 2026 at 8:46 AM Baoquan He <baoquan.he@linux.dev> wrote:
> > >
> > > On 08/27/26 at 05:43am, Barry Song wrote:
> > > > On Wed, Aug 26, 2026 at 4:56 PM Baoquan He <baoquan.he@linux.dev> wrote:
> > > > >
> > > > > On 08/21/26 at 06:25pm, Barry Song (Xiaomi) wrote:
> > > > > > During aging, a folio's generation may already have been updated by
> > > > > > folio_update_gen(), even though it has not yet been moved to the
> > > > > > corresponding generation list. Such folios are hotter than those
> > > > > > already in that generation.
> > > > > >
> > > > > > It makes sense for inc_min_seq() to increment the generation of
> > > > > > folios that were never promoted during aging and move them to the
> > > > > > tail of the new oldest generation. However, folios that were already
> > > > > > promoted should instead be moved to the head of their updated
> > > > > > generation, just as sort_folio() does in scan_folios().
> > > > >
> > > > > While sort_folio() move protected folio to the head of next gen too.
> > > > > It only moves ineligible folios to the tail of next gen.
> > > > >
> > > >
> > > > Hi Baoquan,
> > > >
> > > > Thanks for the review! I’m not quite sure I understand what you mean :-)
> > > > Could you please clarify what you’re suggesting?
> > >
> > > Sorry for the confusion, Barry. I meant this is a good one, and
> > > sort_folio() has the similar issue in which the protected folios are
> > > moved to the head, wondering if that need be adjusted too. One consistent
> > > rule for both is better.
> > 
> > I think it might be fine for sort_folio() to move protected folios to the
> > head, since those folios have either been accessed multiple times or have
> > reached a tier higher than tier_idx. They are sort of hot in theory, right?
> > 
> > if (tier > tier_idx || refs + workingset == BIT(LRU_REFS_WIDTH) + 1)
> > 
> > But for inc_min_seq(), it is just catching up to make sure the newest
> > generation doesn't overlap with the oldest generation. Those non-promoted
> > folios themselves aren't hot , so I feel these are actually different?
> 
> I got your point, sort_folio() considers the hottness, inc_min_seq()
> doesn't. I agree with you now. Thanks for the explanation.
> 
> BUT no matter what it is, protected folios, lazily promoted folios,
> and no matter where it is, put in head of next gen or tail of next gen,
> their refs are cleared by folio_inc_gen(). Then in sort_folio(), they
> are all tier 0 of the oldest gen and must be reclaimed.

Or mm walking will take a long time, it doesn't matter much about the
refs in next gen in inc_min_seq() because there are a lot of chances
refs are updated when it comes to sort_folio()?

> 
> So here, I think differentiating them and moving them into head or tail
> doesn't make sense, the thing is whether if we need do something to
> retain refs of folios when gen_increased. At least, for lazily promoted
> folios, it should not be put in the tail of next gen and refs cleared.
> What do you think?
> 
> Thanks
> Baoquan
