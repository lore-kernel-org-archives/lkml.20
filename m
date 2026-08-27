Received: from mta1.migadu.com (out-190.mta1.migadu.com [95.215.58.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59161257845
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787791622; cv=none; b=HZZMYADCJuc5njOa3pdp1Wvmev+u5zQccIpDLv6dDa7okS7RhLPrUScAJix9RsXsOi3DNVPDZTChLo7pe7nw5DWgoZnMSSXi6hi+TyX3iYXAg+ElWqbpidPLpUmAwNAXkuNK8Vqy+V0KBgLVqqVUssudEffFijZjVEmPY02ieUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787791622; c=relaxed/simple;
	bh=4zf7+mPWPGCfOdkH9jTVWkCuXpWtEtW+l62A+47KE0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Olk32kc21KLVR9uIwHpLratWMMGB4BTU1198dna8qqHEyVmdXrpQcWVizFoj9lcLTNg5KZKOVbDy4JXPP2LOD/pvqZcE2HdI+PrAv3WHvSBn8UjfUOBy1ZAlOkUpAAfoIdzrz8KIywp8aHQ06p3FuamklhP9jcFf2hGcn/5QBBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=snXqPfTT; arc=none smtp.client-ip=95.215.58.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="snXqPfTT"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4zf7+mPWPGCfOdkH9jTVWkCuXpWtEtW+l62A+47KE0E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787791617; v=1; x=1788396417;
 b=snXqPfTT3SM1I7GqDRONgh/UewOVrSxqrMDm5ipWKZwnN5EWj41sAe0dIIfzXjsManuAv8Ik
 ilIHBLcwWpnT+fAyHCZfbadOMBqCDzqBEBjKXhclQuwIrx4vKrNsiGlUuV+vh5GcYJIMgZ3tTJQ
 SB6Ndde7SocTSTCGRlzdF3so=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from localhost (3.112.29.171)
	by mta11.migadu.com with ESMTPS id 49c01e81593a4588;
	Thu, 27 Aug 2026 00:46:46 +0000
X-Mizu-Trace-ID: 49c01e81593a4588
X-Migadu-Flow: FLOW_OUT
Date: Thu, 27 Aug 2026 08:46:42 +0800
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
Message-ID: <ao-I8rYv_G5j4wz4@MiWiFi-R3L-srv>
References: <20260821102538.22642-1-baohua@kernel.org>
 <20260821102538.22642-4-baohua@kernel.org>
 <ao6qTTtk2xkkeKob@fedora>
 <CAGsJ_4ywk7mA1xfk=emtqby1UAwFsaH9PChmk2TuZoDKrMzuXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4ywk7mA1xfk=emtqby1UAwFsaH9PChmk2TuZoDKrMzuXw@mail.gmail.com>

On 08/27/26 at 05:43am, Barry Song wrote:
> On Wed, Aug 26, 2026 at 4:56 PM Baoquan He <baoquan.he@linux.dev> wrote:
> >
> > On 08/21/26 at 06:25pm, Barry Song (Xiaomi) wrote:
> > > During aging, a folio's generation may already have been updated by
> > > folio_update_gen(), even though it has not yet been moved to the
> > > corresponding generation list. Such folios are hotter than those
> > > already in that generation.
> > >
> > > It makes sense for inc_min_seq() to increment the generation of
> > > folios that were never promoted during aging and move them to the
> > > tail of the new oldest generation. However, folios that were already
> > > promoted should instead be moved to the head of their updated
> > > generation, just as sort_folio() does in scan_folios().
> >
> > While sort_folio() move protected folio to the head of next gen too.
> > It only moves ineligible folios to the tail of next gen.
> >
> 
> Hi Baoquan,
> 
> Thanks for the review! I’m not quite sure I understand what you mean :-)
> Could you please clarify what you’re suggesting?

Sorry for the confusion, Barry. I meant this is a good one, and
sort_folio() has the similar issue in which the protected folios are
moved to the head, wondering if that need be adjusted too. One consistent
rule for both is better.

> 
> I can explain the design in more detail.
> 
> Yes. For both promoted and protected folios, `sort_folio()` moves them
> to the head of the corresponding generation.
> 
> Here, `inc_min_seq()` is a bit different. We are overlapping `max_seq`
> and `min_seq`, so the `min_seq` generation should be moved to the
> second-oldest generation. Therefore, I think non-promoted folios should
> be placed at the tail.
> They are genuinely not promoted, so they shouldn't be at the head.
> 
> For example, suppose we have the following folios:
> 
> Second-oldest gen: f1, f2, f3, f4
> 
> Oldest gen:        f5 (promoted), f6 (not promoted),
> f7 (promoted), f8 (not promoted)
> 
> Without my patchset, the result is:
> 
> Second-oldest:
> 
> f1, f2, f3, f4, f8 (promoted), f7 (not promoted),
> f6 (not promoted), f5 (promoted)
> 
> So you can see that both promoted and non-promoted folios are at the tail
> of the second-oldest generation?
> 
> With my patchset, the result is:
> 
> Second-oldest:
> 
> f5 (promoted), f8 (promoted), f1, f2, f3, f4,
> f7 (not promoted), f6 (not promoted)
> 
> Best Regards
> Barry
