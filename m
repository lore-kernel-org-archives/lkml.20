Received: from mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFC73B6352
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894879; cv=none; b=oH30fEljmODnTK95c9Qb946hmJzaoN13NveVndP7bzn3jFBSTrhb+ZsSyiNXuqsTC0ObTQ3rGyWsjmJBUuZ6ySkRX6sO0kEFlsxdXPTs6XXU5WyL2p1tjfhkqCk9STv/2A/lnhL5JeNrsayYJ51zpT/0wb3gDEBZqsfZ6m/970c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894879; c=relaxed/simple;
	bh=FdxCCuwCfd5vXEUA0pRD/fI4XxAtR3tWCoY7QnXONYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J204/dDbW9Z6f0k/qtSGKEHEibmI9JcUIUrP/FX9p0yLdJrzwzN1inM9Mw0aMOtYpkhxI3CopGNaMzVpNkUcYUU0Y+UFA8YLYSLN3fCpe+Omh1bY3jso7Wq2SqDLwCrYItgM7Rck/GlcvrsLdIx/cR8gBHYKBkA8HzQzFIpJgEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rNezcEDw; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rNezcEDw"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FdxCCuwCfd5vXEUA0pRD/fI4XxAtR3tWCoY7QnXONYE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787894874; v=1; x=1788499674;
 b=rNezcEDwMejRQuIEh3SqVtAYGyqI6sF3XxkgQHbB9oc6+zCnnVXHNCmXmW6+8TkQQ/EzFUf1
 q0nCM/4ybx9QIxYIRVjTLsdL7TF+tpG/8Dc8yyBqKOcFAm3iZ9z6eKmd+pLHRAKDIY4mpPTjf9G
 EMoTHJ4gQ3JOHbsBEnGi/BAI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 1ed8bbe29e3740d6;
	Fri, 28 Aug 2026 05:27:44 +0000
X-Mizu-Trace-ID: 1ed8bbe29e3740d6
X-Migadu-Flow: FLOW_OUT
Date: Fri, 28 Aug 2026 13:27:38 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com, chenridong@xiaomi.com,
	david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com,
	lianux.mm@gmail.com, linux-kernel@vger.kernel.org, ljs@kernel.org,
	lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, stevensd@chromium.org,
	wangzicheng@honor.com, weixugc@google.com, yuanchu@google.com
Subject: Re: [PATCH 1/3] mm/mglru: improve readability of isolate_folios()
Message-ID: <apEcSl6dNJ6wsOWs@MiWiFi-R3L-srv>
References: <20260820045603.68809-1-baohua@kernel.org>
 <20260820045603.68809-2-baohua@kernel.org>
 <apD9QqyFGRoGxyZA@fedora>
 <CAGsJ_4w_c2mf6X7PXHc7W4+jQ57un+eewfh9K1dXha29Hw12rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4w_c2mf6X7PXHc7W4+jQ57un+eewfh9K1dXha29Hw12rg@mail.gmail.com>

On 08/28/26 at 11:22am, Barry Song wrote:
> On Fri, Aug 28, 2026 at 11:15 AM Baoquan He <baoquan.he@linux.dev> wrote:
> >
> > On 08/20/26 at 12:56pm, Barry Song (Xiaomi) wrote:
> > > From: Ridong Chen <chenridong@xiaomi.com>
> > >
> > > The for_each_evictable_type() loop in isolate_folios()
> > > is misleading: it does not actually iterate over each
> > > evictable type. Instead, get_type_to_scan() selects the
> > > type to scan, while the iterator `i` merely bounds the
> > > number of attempts.
> > >
> > > Make the fallback behavior explicit in the code and remove the
> > > opaque for_each_evictable_type(i, swappiness).
> > >
> > > Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> > > Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > > ---
> > >  mm/vmscan.c | 46 ++++++++++++++++++++++++++--------------------
> > >  1 file changed, 26 insertions(+), 20 deletions(-)
> >
> > The subject doens't reflect the truth. This patch changes the behaviour,
> > but not improve readability of isolate_folios() only.
> >
> > I also noticed the confusion of isolate_folios() implementation, and made
> > a patch to only change the local variable and added code comment to
> > explain it in my local branch. Surely refactorying is also good.
> >
> > +        * Scan at most one type per evictable type (anon/file), starting with
> > +        * the type get_type_to_scan() picked as statistically colder.
> > +        *
> > +        * After a scan:
> > +        *  - isolated > 0:  got folios, record the type and return.
> > +        *  - scanned == 0:  the type is empty; fall back to the other type.
> > +        *  - otherwise:     the type has folios but all were hot (or lost an
> > +        *                   isolate race); retry the same type rather than
> > +        *                   switch, so positive_ctrl_err()'s refault
> > +        *                   statistics stay unbiased.
> > +        */
> >
> > While in Ridong's patch, the 3rd case disappeared. It doesn't rescan with
> > the original type as the old code is doing, but return directly.
> >
> 
> right, the 3rd case comes back in patch 3/3:
> https://lore.kernel.org/linux-mm/20260820045603.68809-4-baohua@kernel.org/
> 
> so i guess we can rename patch 1/3?

Both is fine as long as thing is correct and clear, thanks.

