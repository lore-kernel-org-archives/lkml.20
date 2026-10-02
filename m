Received: from va-2-113.ptr.blmpb.com (va-2-113.ptr.blmpb.com [209.127.231.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3033803F1
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925997; cv=none; b=pj8qErO7ZsxbbGB5x7g1/GaLI0QekfVPavttN5B1H41YATd3nVtdZpN5oC9tcZfJVzL3IiAD8C1o9ACB+y5PJi3/1nYJNFIRSe99VIWT0Ro46Vf2JdvM8pr8ZEEB0zSpLfiLkyfi7QSO30DDK03Dio8EbB0jtd+FiFp6tSAFLCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925997; c=relaxed/simple;
	bh=mSIV37ULCWuX5sejNFGsoWbiBPpjYupTX2D/uvYO8x4=;
	h=Subject:To:Cc:Content-Type:In-Reply-To:From:Message-Id:
	 Mime-Version:References:Date; b=Th93okV9T5DP8aHVQ8QclnJ5KrUJn9H+HtR+ow4COscjNb1dZfJRL3fzpqdwchhOklamIEK1b86fNxWUQaAOXmB6cCJvtODnlgbHnRIGL2wC+GQVzrrlkawOMkI90RjHXPtg3KVF1207Qtuz6PAz1wk+Pon1tKQX5Q+d0Z4KXto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=m6VM6w7m; arc=none smtp.client-ip=209.127.231.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="m6VM6w7m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790925979; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=P0IgipywrUbAu38a6mE+/+11vCB9AwvCN/MVBbWhCew=;
 b=m6VM6w7mFZhABMGalawLn62qLOVR31W/nCEZZzb1k7wNDes6arNkt/jVZ0QswVmb9TWCD9
 BLQzsMjhPLdd2aDw4dinlvPL08kTHMzzvP1dHfoqxFK+IgvEQOr7mRoTLpnYucXSMaJqHb
 8JfSstE5qKQvJvUUyF8TH+LgNZ816vmGsD2FRM4VbPXuyQJcOHdoACmHDUUiRRVD+i5MZ6
 3FVL7jiGfyjVatuWCPpziF6bOg51bFGbQdQ7DVutpW4EY0IOTXNWoLh8JH6dOOYk4SPvdK
 gWEBX4XghtyVc3jbdFV9AyNHkxUFgI4575PwLZsdiVRoz03lDLrG2hZI/C97nQ==
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference with MPOL_WEIGHTED_INTERLEAVE policy
X-Lms-Return-Path: <lba+26abf5c9a+772aaa+vger.kernel.org+lizhe.67@bytedance.com>
To: "Gregory Price" <gourry@gourry.net>
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>, 
	<liam@infradead.org>, <rppt@kernel.org>, <mhocko@suse.com>, 
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <ziy@nvidia.com>, 
	<joshua.hahnjy@gmail.com>, <ying.huang@linux.alibaba.com>, 
	<apopple@nvidia.com>, <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <arz-iKWj1gRO3ALw@gourry-fedora-PF4VCD3F>
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <93721275-3b50-49a5-9c4a-37bc181a098d@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930072617.64665-1-lizhe.67@bytedance.com> <arzLw18RiTN6Hmey@fedora> <7df34f77-2c52-47a3-a495-d782009ab543@bytedance.com> <arzR_QtoMPtM5kUB@gourry-fedora-PF4VCD3F> <e195b784-8a78-4bbb-97ed-168dd86b3d89@bytedance.com> <arz-iKWj1gRO3ALw@gourry-fedora-PF4VCD3F>
User-Agent: Mozilla Thunderbird
Date: Fri, 2 Oct 2026 15:25:54 +0800

On 9/30/26 8:25 PM, Gregory Price wrote:
> On Wed, Sep 30, 2026 at 07:22:10PM +0800, Li Zhe wrote:
>> Yes, that makes sense to me.
>>
>> I do not see a reason to keep the MPOL_F_MORON handling limited to
>> specific policy cases. The flag already means that migrate-on-fault
>> placement should target the accessing CPU's node, and the nodemask check
>> is the common constraint we want for all policies that opt in to this
>> behavior.
>>
>> I will rework v2 to handle MPOL_F_MORON before the policy-specific
>> switch. Then the switch can remain responsible for the non-MPOL_F_MORON
>> misplaced logic, while MPOL_BIND, MPOL_PREFERRED_MANY, MPOL_INTERLEAVE
>> and MPOL_WEIGHTED_INTERLEAVE can share the same migrate-on-fault path.
>>
> I do think it's worth breaking this up a bit, we can decide whether we
> want to apply it to interleave separate of the larger change.
>
> there is also slightly different behavior for task-mempolicy and
> vma-mempolicy, because vma-mempolicy applies interleave via index while
> task mempolicy does it based on a rolling counter, so you'll want to
> think about what happens on repeated faults
>
> i.e.
>
> 1) fault in a VMA interleaved based on idx
> 2) a bunch of tiering and pageout/swap happens
> 3) we fault a page back in based on idx - that means this page is
>     forever-faulted onto that location rather than taking that as an
>     indication that maybe it should be local
>
> Maybe we're ok with that, but we should probably think about it a bit.
>
> We may also want to limit this based on NUMA balancing being in tiering
> mode vs normal mode.  This only makes sense in tiering mode, in my
> opinion.  In normal mode i'm not sure it makes as much sense - and
> that's probably where this all came from.
>
> tl;dr: If we want to change this behavior for interleave, we should
> probably give more thought for how it should apply more generally
> instead of just hacking on support to one or two modes.
Agreed. I think this is the right direction.

The repeated-fault case for VMA interleave is a good example of why
simply enabling one or two modes could bake in odd semantics. I do not
have a good generic answer for that yet. Although we might be OK with
that behavior, it deserves more thought before being folded into the
interface.

I also agree that the current motivation fits memory tiering better than
normal NUMA balancing. For the next step, I will take a step back and
think more carefully about how migrate-on-fault should apply more
generally, especially around the boundary between memory tiering and
normal NUMA balancing.

Thanks,
Zhe

>
> ~Gregory
