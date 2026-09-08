Received: from mta0.migadu.com (out-88.mta0.migadu.com [91.218.175.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B7238239F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850763; cv=none; b=UgRngzhJgLhhy6yo6YL9pNJjW010XLLpAGuMGrpr5I8U32FJJFOvDVi4mXFyadwaDg/1xjZEk06vuKQ27Zx/ChEwjx7tEOCO9PVYnmkhXrfLW5INXcI2g6bOY4WzVKOWipj/+FqOgQuvDV65nroBi75GXcA/q9S+sCL/pnLChOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850763; c=relaxed/simple;
	bh=/cMB1daxP3CSTnSwp/1Uz+ebWze90XSmIaF608egzq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ii0TjH3b5oHjkfERx1TL9otJcpV296t6whwPZI4+VKv1CXsR9td5JKZvmASIqhO7+87zJR/S2ptJqnnbmIoXqxH3QSQVTi4C2ACfdilVVdU4941AbVnHv8fcADgnodRoVCH9m5QXsFgpPSbyoPiaZwWfWtoufONEcQ9/3hyDd28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ntZ5KkZo; arc=none smtp.client-ip=91.218.175.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ntZ5KkZo"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/cMB1daxP3CSTnSwp/1Uz+ebWze90XSmIaF608egzq8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788850758; v=1; x=1789455558;
 b=ntZ5KkZoNZa7UGrUHbwDL8jfssBjQ4M7w54aXSu1+oFDFYMUx/7PjxtlhC9GDHEYHIwAhJJH
 ah9pqe4HGA13/I6dMME3GW3ImH2pledE+RXYuAzK3NA1MpLWfMr98hH9+Msu0LgrtYbTbiBZeDY
 /RRNmHmJwu8BxIeJJ6pKGjW8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id cb524ca6967486f1;
	Tue, 08 Sep 2026 06:59:18 +0000
X-Mizu-Trace-ID: cb524ca6967486f1
X-Migadu-Flow: FLOW_OUT
Date: Tue, 8 Sep 2026 14:59:12 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Barry Song <baohua@kernel.org>, akpm@linux-foundation.org,
	kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev,
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
	hannes@cmpxchg.org, david@kernel.org, mhocko@kernel.org,
	ljs@kernel.org, ridong.chen@linux.dev, hebaoquan@kylinos.cn,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: mglru: clear the reference counter for rejected
 folios
Message-ID: <ap-yQOH0pni-mfdf@fedora>
References: <8e4db9a298c5ea6ccb192e274caed5b96f0cf022.1788751143.git.baolin.wang@linux.alibaba.com>
 <ap9zPPughaSlfXM2@fedora>
 <CAGsJ_4wn5ArqhG9w7gJY7X4G+Lg6=1teCb70dzPdN0k+5H8MbQ@mail.gmail.com>
 <67d9bbcf-2991-4867-8afb-14bad1cebf8d@linux.alibaba.com>
 <31494361-406e-4874-8a2c-2c6f5cee5321@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31494361-406e-4874-8a2c-2c6f5cee5321@linux.alibaba.com>

On 09/08/26 at 12:01pm, Baolin Wang wrote:
> 
> 
> On 9/8/26 11:03 AM, Baolin Wang wrote:
> > 
> > 
> > On 9/8/26 10:34 AM, Barry Song wrote:
> > > On Tue, Sep 8, 2026 at 10:30 AM Baoquan He <baoquan.he@linux.dev> wrote:
> > > > 
> > > > Hi Baolin,
> > > > 
> > > > On 09/07/26 at 11:25am, Baolin Wang wrote:
> > > > ......snip...
> > > > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > > > index 40d3f1b48a74..42c0a09938ab 100644
> > > > > --- a/mm/vmscan.c
> > > > > +++ b/mm/vmscan.c
> > > > 
> > > > Well, this seems to be based on Andrew's mm-new branch. I usually track
> > > > mm-unstable branch. Maybe the subject should be marked as below?
> > > > [PATCH mm-new] mm: mglru: clear the reference counter for rejected
> > 
> > ACK.
> > 
> > > > 
> > > > > @@ -5021,10 +5021,11 @@ static int evict_folios(unsigned
> > > > > long nr_to_scan, struct lruvec *lruvec,
> > > > >                }
> > > > > 
> > > > >                /* don't add rejected folios to the oldest generation */
> > > > > -             if (lru_gen_folio_seq(lruvec, folio, false) ==
> > > > > min_seq[type]) {
> > > > > -                     folio_set_lru_refs(folio, 0);
> > > > > +             if (lru_gen_folio_seq(lruvec, folio, false) ==
> > > > > min_seq[type])
> > > > >                        folio_set_active(folio);
> > > > > -             }
> > > > > +
> > > > > +             /* See the comments on LRU_REFS_FLAGS */
> > > > > +             folio_set_lru_refs(folio, 0);
> > > > 
> > > > This looks like a great catch, while the code change could bring issue.
> > > > 
> > > > Because move_folios_to_lru() relies on folios' flags to decide their new
> > > > generation. You just cleared it before move_folios_to_lru(). This is no
> > > > problem for rejected folios that are determined to be put into the
> > > > oldest generation. But for those rejected folios that are determined to
> > > > be promoted, this could be wrong. E.g currently gen window is 4, and a
> > > > folio is referenced, lru_gen_folio_seq() decides its new gen as 1, which
> > > > is the 2nd oldest generation. While folio_set_lru_refs(folio, 0) clear
> > > > referenced bit, this causes it being put into the oldest generation in
> > > > move_folios_to_lru(), this is not expected.
> > 
> > Yes. As I discussed with Barry earlier, lru_gen_folio_seq() also needs
> > to be reconsidered regarding whether it should rely on PG_referenced
> > [1].
> > 
> > For commit 6cbdd9726fb5, we didn't discuss the impact on rejected folios
> > either. Before commit 6cbdd9726fb5, if rejected folios did not have
> > PG_active set by shrink_folio_list(), evict_folios() would set PG_active
> > on these rejected folios.
> > 
> > [1] https://lore.kernel.org/linux-mm/20260901220430.79810-1-
> > baohua@kernel.org/
> > 
> > > The original code looks quite weird. It even prioritizes folios
> > > that won't be promoted by `PG_active`. Do we need to change all
> > > the cases just to call `PG_active`?

I would agree if we can. While I have one concern. A rejected folio that
should have gone into the oldest generation is now being promoted to the
2nd newest generation. In the original code, referenced folio is only
being promoted to the next gen. I even think this is not a bug, but Yu
Zhao intentionally did it: the coldest folio is moved to 2nd newest gen,
referenced folio (hot folio) is moved to new gen but carries the referenced
bit. Both of them seems to be treated somewhat equally.

To me, I would rather move both of them to the next gen, while keep their
refs untouched.

> > 
> > Yes. Regarding this concern, I plan to change back to the original
> > behavior:
> > 
> >      /* See the comments on LRU_REFS_FLAGS */
> >      folio_set_lru_refs(folio, 0);
> > 
> >      /* don't add rejected folios to the oldest generation */
> >      if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type])
> >          folio_set_active(folio);
> > 
> > What do you think?
> 
> Just FYI, after above changes, the performance improvement on zram is no
> longer obvious either. I think this also answers Kairui's earlier question
> about why I saw a performance improvement (which seems related to commit
> 6cbdd9726fb5). Also, there is no obvious performance regression either.

Hi Baolin,

Not sure if it's convenient to do a little more testing in your side.
E.g rejected folios are moved to next gen, but not clearing their flags.
Then we can at least know which one is more efficient on yout testing
platform.

coldest folio      referenced folio
---------------------------------------------
max_gen -1         next gen + referenced kept
max_gen -1         max_gen -1
next_gen           next gen + referenced kept       

Thanks
Baoquan

