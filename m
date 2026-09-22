Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4994078C2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065983; cv=pass; b=GpyvSJcSQNxjzvlZe0SBmdp2BxTfyLFAvh3IGE+zq/L2wVI5fal3GCuXCHckXmhMFTf7/R7tVbxxHxVfuDJyvDkWWSnLqZv1vOfgrnGccJd7aW8MhkR1niNMChbTQ8VbZ8d25jXriLSLCVuR5cFvwPcQT28CGr+gqWPs++JKDbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065983; c=relaxed/simple;
	bh=7xjtaQuqAXxf+hAdJkdWgk2gcGRE6qs4ZDWc+xjsR0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJ4QK0Q+AMWwt02J2sNPi9c0/Xq5XpIDgzinyLnyDwQVFNYQeCZfDgIdeor9Af1dCsWLZPD1lCE/C0ba9r7ArceK3dRCwZi3vU2ZTQqd8btWTc5DGJMxO8RWOfTSU+Ux/F+YJ8VQA2dcrLD49U3IRdufZE9x5bhWkLt5/2K+OVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGOjPwTV; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGOjPwTV"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-86382f10801so14769297b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790065980; cv=none;
        d=google.com; s=arc-20260327;
        b=QEbmHZF9I+5fjKoGFdMUqwOo+BR+BffcE7H9pT98oNKkCIi+ocNE9Pzi/34H8myTb8
         evp0U6HJlHVAUlzsRVDHKof4tlla+Zvd+mCkMA7g5t8ld4nyM+0ZXleSr+M4CwX+CEzN
         cjTCTuHqwr0vGfZch6Ohu6c6ajYDGdcfZzMehAsFkOOTCT6+Is3PwaIImYdtETvXchCe
         lgSMqKcM6DkWxCqXFkkDiH2SxApbokDEaycRsLyx6hP7P/6r7QEDvvLW50Eok8HGv/f4
         9boa+ca8Hgx493jYE85MlnnF+9EYMEurEzkOO3qkeYOvd9ULIFi7Fvq+tkRl45n3MozY
         9nTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uc6MKy91deNZKs3T7MFlI/Iho7lcnSF5IHtT7sXWVmE=;
        fh=Y5LHr7TgovrBvfpMKG3YXOYzL/vRdLbUxtYXW4owB0c=;
        b=XPrDEmw7Om5w+dVbigyVX17nxLh+KzkRHgxvAK1KHsTQICk50lY2NBK5u8KdHTLhC9
         NX3lIG/oYj95CHWfNcenLwHB35oz8OeJIHNqmQTP0+pOiCI77zF3bnmhpGvImw6Trw7Y
         2drAjRWMZy6TCcMABY7H1c/YX6jSu1CLg46m0KvruJmKqyr3AYO/k2ymYfkvuUYCuCTz
         zo+eXqVzlcI97AnWKPfxtyt9y5TimrBN2Ip79dztJ/K91E8mDPbOOo5fY3ClhyqVFgjx
         D9SOhzFRrPfNAFKADWFZ9QveDEzJElIE/7WSIRP1YVYGwVxwuQh0dzRev6YUruqWqg/B
         aP/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790065980; x=1790670780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uc6MKy91deNZKs3T7MFlI/Iho7lcnSF5IHtT7sXWVmE=;
        b=KGOjPwTVx9uwWZVTYYrKd+053u9ED/7zfEeeRBvqK/E65oa3GFc5x/RVIIUQbtCAL2
         iI1Dorg0KJTiWzkiPppka4E+GdBYigJQJFS8twwG2bDrCUdx0pQxilvTBtPaN3LWLOUG
         zLjhF1RCQmqG5AG5LstIOGesX876z4MxG1YYkU4tvL1bzDAJOogUQlFrwqCnjaw+KErn
         V/7m6TAJz0DprPa5nFwp6Q10x312p3uhjk26e3Uu8DoMhW/PNImirYmAKeiHesc1RmcO
         CYfJwMMXTBQ9quhoANbjGcjscb9jZ1HBBut8i8QGDt7yozVlVo86YVueukRjHzSHgeV4
         RbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065980; x=1790670780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uc6MKy91deNZKs3T7MFlI/Iho7lcnSF5IHtT7sXWVmE=;
        b=XBejBv0hA4E14A6Y6UyQiPqGyiyQXUVKnNyueba2XMFOJi0wUZZYjag7ZPEUSRbIIk
         uMAIhFCV+NfCi9J8qafdjgrjR1n05RHZrErjcLmDiDW8ta6U68vnIhOLqM5wvZ8zm+XA
         zZziriBzdbdYd7qiMA5ncUm89SVJBgAGzrxUdP7PAs71BqaRVbNqRiBrHUuso4rhJcnq
         zkpiAuW/c55Kw7m9TZRJxzOCjnQ+S2NzVvTaHpzf0+WeQVFCADt5xpiRmijkx5HUSt0j
         2nTYxtfzaFuKZKhruewD08eHGKw7NZc9UI+kFmUcRGl7FXFnV7EvytRQHVEZlDccmHSE
         VVsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZ5/8ua9Ws01oF0ZOsWI+aNleMEqd7lCK5OIDiWin39E+6E4bRWu9ne6NTas+J3+Gl8rpiJEH5orgr3lc=@vger.kernel.org
X-Gm-Message-State: AFuF++ky+XUxyOX4kNEpuM4J+edDxaXWqIuZ7mdHTwU7yh6HJuFaKRHB
	CofN/DUtvXvzSKtgTDeeTMWVZWPdb7micmOL0d3KsERZsE1wfE3r6oVJdb4izBLrTPOJXLUWBIR
	VdPVy1VMy2zy0E0qi1bnLrUx4mjQpa0Y=
X-Gm-Gg: AYBFou0G3m/QUvNR32pb3kwitto6kasZXB8M//+bVhh4u/4NKRZ6DuVCqsZu29b4pKm
	mMisWA6JQkdpjrXkvftUstutKP65vrgNh49eF5dZMVCiWdxz8Py2BMUtGe6BJQ+FPfyQuPz3qA/
	Mt2JRCGdaRqZgYzG7N256OUiCRCGCUQMSdcHFSFPoztbRSrwmyUhpbEubgW7Oz0BzGuLhXsFTTF
	uxeN9IbblShJVQhvJ7WVJw1vzODdpTssuUavgZax+qQZsTp7SLbK5EX4N+ybpehUZnrCAJSwCrG
	YjGEvwuhJ8ktJXzHHf0DeegUCzDyCFmC7MBgItDAifj8Lu2uzU52WewAqf5xNk+ntPMHENoEK3D
	DNRVQ6LhFQj2u
X-Received: by 2002:a05:690c:e3e8:b0:890:f416:7a27 with SMTP id
 00721157ae682-8a1f72e0763mr10172907b3.19.1790065980502; Tue, 22 Sep 2026
 01:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403194526.477775-3-hannes@cmpxchg.org> <20260918022222.22955-1-laoar.shao@gmail.com>
 <arGNfQQAVRZpEoPl@cmpxchg.org>
In-Reply-To: <arGNfQQAVRZpEoPl@cmpxchg.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 22 Sep 2026 16:32:23 +0800
X-Gm-Features: AclHuK_94ufGY4ZEJ8CT7PtJGb648vSJVIoVUbgHFXl0QAzoGNj5hW9JaUB8nVE
Message-ID: <CALOAHbAQm-Ev25DvL=SUM24mjUQojq20mqpFC_hBwepaurCz1A@mail.gmail.com>
Subject: Re: [RFC 2/2] mm: page_alloc: per-cpu pageblock buddy allocator
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Liam.Howlett@oracle.com, david@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ljs@kernel.org, riel@surriel.com, vbabka@suse.cz, 
	ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 4:03=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> Hello Yafang,
>
> On Fri, Sep 18, 2026 at 10:22:22AM +0800, Yafang Shao wrote:

[...]

> >
> > Hello Johannes,
> >
> > Thank you for the great work on this series -- I hope it is still being
> > actively worked on.
>
> Thanks for the kind words.
>
> I am still actively working on it. Since the last iteration I have
> addressed a few things:
>
> 1. The locking bug you are seeing. Rik had also run into this during
> stress testing. The fallback to the zone buddy on PCP contention
> brought back some of the original zone->lock contention.

Right, I noticed that the zone::lock contention increased slightly
after I applied the livepatch above.

> So instead
> I'm using the zone llist introduced for lockless allocations.

That is good news!

>
> 2. The PFN search for block recovery that Vlastimil pointed out. I've
> tried various solutions (counters, bitmaps) but the thing that worked
> best was having the zone buddy itself maintain free pages of owned
> blocks on a per-block loaner list (in addition to the regular zone
> freelists). This eliminates the sparse search altogether. Recovery is
> then: pcp->owned_blocks -> pbd->buddy_loans -> page. Every page
> visited gets recovered. For the loaner list_head, I'm reusing
> mapping/index space that's unused in a freed page.
>
> 3. Removed the unowned buddy splitting on the PCP. Vlastimil had
> actually asked to try that separately, as an incremental step, since
> it's self contained. I tried this but realized that part was actually
> bad altogether. It violates the rmqueue_smallest policy and causes
> runaway fragmentation - just like the new block claiming did before I
> added the block recovery step beforehand.
>
> So now refilling is just block recovery -> new blocks -> unowned
> singles of the requested order.
>
> Incidentally, this also eliminated the CMA problem that Frank pointed
> out, since the other refill paths respect ALLOC_CMA.
>
> 4. I realized I'm also violating the smallest-first policy in how I
> was mixing owned and unowned chunks on the same freelists. For
> example, an order-3 refill from singles sits next to order-3 fragments
> from owned blocks. Only owned fragments, which route back to and
> reassemble on that PCP, must be split. Unowned singles must be
> consumed at their native order to preserve smallest-first policy.
>
> pcp_rmqueue_smallest() could check the PagePCPBuddy() flag to tell
> which ones can be split, but that introduces another sparse search
> problem, where we might walk higher order lists in the hope to find a
> splittable owned buddy.
>
> To avoid this, I retained the legacy/unowned pcp freelists (up to
> costly order and THP), and added a second set of buddy freelists up to
> pageblock order to the PCP. This way the rule can be maintained with
> O(1) list checks instead of O(pcp size) scans.
>
> 5. The on-demand merging at drain time proved problematic. Draining
> isn't exhaustive, so it can attempt to merge the same unmergeable
> fragments repeatedly. I moved merging into the pcp free path instead,
> so every page is tried for merging exactly once, which seems to
> perform a lot better in performance testing.
>
> Overall, it's gotten a bit bigger than I had hoped for. But it also
> looks much more robust. And the additions described above seem well
> offset by performance improvements in tests so far, even on smaller
> machines.

It will take me some time to fully understand your work, but thank you
so much for your great effort in resolving this long-standing
zone::lock contention issue.

>
> I'm still testing and polishing right now, and hoping to send a new
> version soon.

Great

>
> > We are suffering from heavy zone->lock contention on our production
> > servers as well, so I backported this series to our internal 6.18.y
> > kernel. However, since deploying it to a few dozen production servers
> > running workloads with heavy memory and I/O pressure, we have been
> > hitting hard lockups at a rate of roughly one every day or two. The
> > hard lockups look as follows:
>
> [...]
>
> > With these changes applied, the affected servers have been running
> > lockup-free for more than two weeks so far.
>
> I'm assuming you saw an improvement of zone->lock contention. Would
> you be able to share some numbers or observations?

The result is great.  Below are the observations from our real
production workloads.

On our Kubernetes servers, many different applications (Pods) are
deployed on a single host, and redis is very latency-sensitive.
Whenever other Pods exit simultaneously, or any Pod allocates or frees
a large amount of memory, redis easily hits latency spikes, and its
P99 can quickly reach a level the application can't tolerate.

This issue is clearly reflected by the TCPTimeouts metric in
/proc/net/netstat, since the network receive path also needs to hold
the zone::lock. Before your improvement, Redis's TCPTimeouts could
reach tens or even hundreds whenever other Pods exited simultaneously
or allocated/freed large amounts of memory. With your improvement
applied, TCPTimeouts has stayed below 10 and Redis's P99 has remained
acceptable. After I deployed the hotfix to work around the hard lockup
issue, TCPTimeouts rose slightly, but it is still far lower than
before your improvement.

--=20
Regards
Yafang
