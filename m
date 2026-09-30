Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717C33F54AE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769159; cv=none; b=HCDPZYM6MxOrahoaG/EHBvUdtmNEzsitBtId4D4N0D03lFd7/s2kHOKYvE/C46Gp4ULYphzGJFV2WJ5s5GqCURO3pa4dfnVgUzwMImtFuB7w9IaQ0+gbd/tX7qSO97o/mUXI+vnlaaSsTNrFZvZEEr9QvIxZUJVNQUFeMhJRFnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769159; c=relaxed/simple;
	bh=sGi4duRgSEofU+S8eH9EnDd2GBK+K4sFhazBSXNCJys=;
	h=References:From:In-Reply-To:Cc:Date:Mime-Version:Content-Type:To:
	 Subject:Message-Id; b=P7uTwtve8dR31T5saHOJSrcg232wzXgi7329UJiKbq5L4MZLXJmzIdwygW4lEn4hba9712vZYQi+M8huQZiohIPXQaaayFp9sHdV+8zeXyRJDt5MjZguEVnkG/GzFpPyd0sXljUwGWw3m1dAuX/jNG4UKkx4QjcdUYP6p11GUDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Z+55iLEp; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Z+55iLEp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790769152; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=u2He0n5DmuqJPogb7cosTA7pj5eK80oWxnlE2Q9AaOE=;
 b=Z+55iLEp3mxL2ee/IvLxCxHeLFI8RvH/ysXIPUaGd2Kd9Dcpt9fXa1wRXAyKX68Vq67HfK
 amy5RuT+qeimZTXyMAfrd1G3STZA+U/gU2aIfcp6WZZNmp/obRbU8+7lQoFir0id8J7ada
 8wYh4EQYYFC+ANRGpUMBSQXjlpQdzmU/lqEdCn+RRLIUIBtj8d4jFjjKwIxAQ+LJF7ZeQz
 eEOk17wLG/isei33i7IiXqRRJj6SRnAmkS+/JNOo3G4QcEyNvBagwO2EojZauJqLvebaJ9
 NkInWiNE5cRo3+h4HEKfjAFwIlg0FF+2nems48xs556QjejeL+e99dz9Gtuu3w==
References: <20260930072617.64665-1-lizhe.67@bytedance.com> <cfdcaaa3-a9e7-4352-ab01-4922ebb8e0c9@kernel.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26abcf7fe+314015+vger.kernel.org+lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
In-Reply-To: <cfdcaaa3-a9e7-4352-ab01-4922ebb8e0c9@kernel.org>
Content-Transfer-Encoding: quoted-printable
Cc: <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Date: Wed, 30 Sep 2026 19:52:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Type: text/plain; charset=UTF-8
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <liam@infradead.org>, 
	<rppt@kernel.org>, <mhocko@suse.com>, <corbet@lwn.net>, 
	<skhan@linuxfoundation.org>, <ziy@nvidia.com>, <joshua.hahnjy@gmail.com>, 
	<gourry@gourry.net>, <ying.huang@linux.alibaba.com>, 
	<apopple@nvidia.com>
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference with MPOL_WEIGHTED_INTERLEAVE policy
Message-Id: <808292b4-841c-45bd-aacd-b487be1858ca@bytedance.com>

On 9/30/26 7:26 PM, David Hildenbrand (Arm) wrote:
> On 9/30/26 09:26, Li Zhe wrote:
>> MPOL_WEIGHTED_INTERLEAVE is useful on tiered-memory systems because it
>> can seed a workload's new allocations across fast memory and slower
>> capacity memory according to a configured ratio.
>>
>> That initial placement is useful for workload managers and orchestration
>> systems.  They can take the amount of fast memory and slower capacity
>> memory on a machine into account before starting a workload, and choose =
a
>> weighted policy that seeds the workload across the tiers at allocation
>> time.  This avoids starting from an all-fast or all-slow placement and
>> then relying on promotion or demotion to reshape a large working set.
>>
>> After those pages have been placed, however, the policy cannot currently
>> opt in to migrate-on-fault placement.  set_mempolicy() and mbind()
>> reject MPOL_WEIGHTED_INTERLEAVE when MPOL_F_NUMA_BALANCING is specified,
>> so memory tiering cannot promote hot pages that were initially placed on
>> the slower nodes by the weighted policy.
>>
>> Initial placement is only a starting point.  Pages initially allocated o=
n
>> fast memory are not necessarily the long-term hot pages, and pages
>> initially allocated on slower memory may become hot as the workload's ho=
t
>> set changes.  The policy therefore needs to be able to combine weighted
>> initial placement with memory tiering's NUMA fault based hot-page
>> promotion.
> Ok, so memory allocation will respect the weights but balancing will igno=
re
> them? That really sounds rather odd to me.
>
> And I assume that was the reason why we might have disallowed the combina=
tion:
> it turns a weighted mechanism into an unweighted mechanism.
>
> So are we really sure these semantics that you would essentially set in s=
tone
> here are the semantics we want? (ignoring weights)
Yes, that is a fair concern. It does look odd if the weights are
interpreted as a hard resident placement ratio.

My understanding of the existing MPOL_WEIGHTED_INTERLEAVE ABI is that
the weights are allocation weights, not a long-term resident ratio. The
sysfs ABI documentation says that these weights only affect new
allocations, and that changing them at runtime will not migrate already
allocated pages.=C2=A0 The implementation also has normal allocation fallba=
ck
if the selected weighted target cannot satisfy the allocation.

The use case here follows that interpretation.=C2=A0 The weights are used t=
o
seed the initial placement across memory tiers.=C2=A0 After that, with an
explicit MPOL_F_NUMA_BALANCING opt-in, memory tiering would promote hot
pages based on access patterns, not based on the original allocation
ratio.=C2=A0 Users that want weighted allocation without that behavior woul=
d
keep using MPOL_WEIGHTED_INTERLEAVE without MPOL_F_NUMA_BALANCING.

That said, I agree that allowing this flag combination would set the
semantics for it.=C2=A0 If reusing MPOL_F_NUMA_BALANCING for this is too
ambiguous, do you think we should model this as a separate opt-in ABI
for "weighted initial placement plus access-based balancing" instead?
For example, a separate flag or policy mode would make it clearer that
the weights are not intended to constrain migrate-on-fault placement.

If the allocation-only interpretation of the weights is acceptable, I
can make it explicit in the commit message and documentation in v2.
Otherwise I would appreciate your suggestion on the preferred interface.

Thanks,
Zhe
