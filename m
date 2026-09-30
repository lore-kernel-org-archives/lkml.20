Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3524BF947
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767363; cv=none; b=CkHgiPaQGd+M5BOSwykoAM1UrrjmKU/AtnVS7djw0EOE2o3UmsLjX7rlhc+/8mV5MPuLeWGKvlSuqF5KNuzGfIB5PjL28a7v1Q1T3CBdufYSpLQs72AeOp2wb3hD0cdTERCCQlhE7TJ++0VgN6Fgu0xweJCjMfxboqLuV3nMWEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767363; c=relaxed/simple;
	bh=XN3wQlJauJDLEikCs33ocxfxn7Vb58M8N9vPatzIA3g=;
	h=Date:In-Reply-To:Content-Type:Cc:Subject:Mime-Version:Message-Id:
	 To:From:References; b=nAwLNhx1WoDHXzh3awODuNL5oPPdHV2wKNCptWPOqC1Z8JaoAuepqXrUXej7f+o5IqEnFuKo+0B3OE2uEqxUuVjgO09pldEdtv0GTCvk+Q6nqldM09/z9iDufzOZ4dJ953EXnSKg0OKCKyj+1bHYeXKg07Qn1N49K4NjNuOZX38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=h/re0Uxu; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="h/re0Uxu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790767356; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=NU0OQAMOUoLo7I1A1g/IyX/TQMOjf6Pp2QYWnGCx/48=;
 b=h/re0Uxugwa2OhK6hXIoeL2/y2BAP4NFKM9YSsuKuE8HRSFjzsTzgKJcd4cw3wL8mPcw5U
 rv+HYfJAiubLCJv/kTynWkLUcIJ2T1TRmbDCDYZdqpu3fB2ZteCEvZm1+cMOgHUYhE/Okh
 smYvWYUYCgn11yd7FFPKZtz/NKvPvHsFckpn7luZYLSOd5dix6qIZZd3xQklBMZ1+IwQoL
 WY/5sPfQ4mn89cqushvLRYUoh1W0BBXCkkA6QXO+eGtYY+NWnC2v7dIlatcagPWuFffzbP
 Did6g7h/0Hu2syF8+WD4JC+pZl+2jsjtynj43ilFTbIKeUhBSE2DPFsUxo7tnA==
Date: Wed, 30 Sep 2026 19:22:10 +0800
X-Lms-Return-Path: <lba+26abcf0fa+310b0a+vger.kernel.org+lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <arzR_QtoMPtM5kUB@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>, 
	<liam@infradead.org>, <rppt@kernel.org>, <mhocko@suse.com>, 
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <ziy@nvidia.com>, 
	<joshua.hahnjy@gmail.com>, <ying.huang@linux.alibaba.com>, 
	<apopple@nvidia.com>, <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference with MPOL_WEIGHTED_INTERLEAVE policy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-Id: <e195b784-8a78-4bbb-97ed-168dd86b3d89@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
To: "Gregory Price" <gourry@gourry.net>
From: "Li Zhe" <lizhe.67@bytedance.com>
References: <20260930072617.64665-1-lizhe.67@bytedance.com> <arzLw18RiTN6Hmey@fedora> <7df34f77-2c52-47a3-a495-d782009ab543@bytedance.com> <arzR_QtoMPtM5kUB@gourry-fedora-PF4VCD3F>

On 9/30/26 5:11 PM, Gregory Price wrote:
> On Wed, Sep 30, 2026 at 04:59:50PM +0800, Li Zhe wrote:
>> On 9/30/26 4:43 PM, Gregory Price wrote:
>>> On Wed, Sep 30, 2026 at 03:26:17PM +0800, Li Zhe wrote:
>>>> Allow MPOL_F_NUMA_BALANCING for MPOL_WEIGHTED_INTERLEAVE.  As with
>>>> MPOL_BIND and MPOL_PREFERRED_MANY, keep migration constrained by the
>>>> policy nodemask: if the CPU's node is outside the nodemask, do not
>>>> migrate the folio there.
>>>>
>>> Why for WEIGHTED_INTERLEAVE and not INTERLEAVE as well?
>>
>> Thanks for pointing this out.
>>
>> I focused on MPOL_WEIGHTED_INTERLEAVE in v1 because the motivating use
>> case is to seed memory across tiers with a configurable ratio at
>> allocation time, and then let NUMA balancing/memory tiering adjust the
>> placement based on access patterns. With equal weights,
>> MPOL_WEIGHTED_INTERLEAVE can also cover the regular interleave
>> allocation pattern.
>>
>> That said, I agree that MPOL_INTERLEAVE can be handled consistently as
>> well. Since this is still an explicit opt-in via MPOL_F_NUMA_BALANCING,
>> unless others see a reason to keep MPOL_INTERLEAVE out, I will extend
>> this in v2 to cover both MPOL_INTERLEAVE and MPOL_WEIGHTED_INTERLEAVE
>> with the same nodemask constraint.
>>
> Looking at it, is there an actual reason to limit F_MORON at all? Or
> should we just lift
>
>                  if (pol->flags & MPOL_F_MORON) {
>                          /*
>                           * Optimize placement among multiple nodes
>                           * via NUMA balancing
>                           */
>                          if (node_isset(thisnid, pol->nodes))
>                                  break;
>                          goto out;
>                  }
>
> Out ahead of everything?
Yes, that makes sense to me.

I do not see a reason to keep the MPOL_F_MORON handling limited to
specific policy cases. The flag already means that migrate-on-fault
placement should target the accessing CPU's node, and the nodemask check
is the common constraint we want for all policies that opt in to this
behavior.

I will rework v2 to handle MPOL_F_MORON before the policy-specific
switch. Then the switch can remain responsible for the non-MPOL_F_MORON
misplaced logic, while MPOL_BIND, MPOL_PREFERRED_MANY, MPOL_INTERLEAVE
and MPOL_WEIGHTED_INTERLEAVE can share the same migrate-on-fault path.

Thanks,
Zhe

>
> ~Gregory
