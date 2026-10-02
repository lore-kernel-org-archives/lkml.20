Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855512FFDEA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928985; cv=none; b=nA/inGT0qY4PZ9HAWkZHciyDVzqB+w2zc6PjehII2QgvKOP6I0gYzNemUYNaPiaqN81aMz6EKxpzYufSRg6nqfajIztd9dbriUgWjo+P2pFl4H7zjpGglDS5ji8bTB6GTVwToALea1GNBy7xmTYOjlTsEZVMCZK1y+/3u9cTM4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928985; c=relaxed/simple;
	bh=Uap9mjpiN11wxRfxEzbIWrRb3EGL8MmrFbOcb9PkmWI=;
	h=Content-Type:References:Cc:Subject:Mime-Version:In-Reply-To:To:
	 Message-Id:Date:From; b=kVWBwf/s7i/sGgKE4jtRDKhfhN9eHv18A9NQbT4Bpm79R6UtaonfwUW/WKH6WS8G/D8/xRK63r7rSeZBdnY0twpcyoHiSg/aELpMQ89rZWOvsOWzF5eGy04jJwoNBtVBBarVx3RJD+dfFFVfLavGORICgPrMYZ4sbchMUUFMZG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Gnkv5q6o; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Gnkv5q6o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790928972; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=erijjSKK0F16UjGTpa1TwWvZ6Kt00yN1jhH4DWA5qn8=;
 b=Gnkv5q6oaIA7vzSUYJ/bCO3LDfFmUZrZ5DI3Yg+LJSThnLIP2A69xJkstQfmc5ucpmuFac
 S5CSD+6enTLkEyPtyWswxmklEeEvLYIT2Vw537SYcCKZursDeBVqsaas9ZavFCao7x/XsB
 DB6dj6u+8gOferZJ2HvTGgMgLRQ6FkJ+dFFLjY7k1qGxsEFw3zSc4KS3ilIRqYyXZ0CAvc
 lgJm/7nyKuVHshm/L/oUaqxo+J0ttmVGp/CrJzR7hQEUqVTtqetVCniSH1IbB0MWKbMykQ
 FkYuXpEhCXl2VHrfImAGr/zOa+9oXQMMzHaj4zUaGGk5fo2qwqcia0ZyvuwgFQ==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
References: <20260930121154.687586-1-joshua.hahnjy@gmail.com> <2e3f12b7-0dac-428c-b70b-07e1f63de028@bytedance.com> <ar0fURbLDPrphYMY@gourry-fedora-PF4VCD3F> <A005B05D-A85C-4153-A65D-0BDF9D8500DF@nvidia.com> <280965b2-c6eb-4f01-a0ac-c4fb7e518f97@kernel.org> <ar5eC22VfSFlMw3W@gourry-fedora-PF4VCD3F> <44d15437-6aae-4d7c-bfd4-296276583826@kernel.org>
Cc: "Zi Yan" <ziy@nvidia.com>, "Joshua Hahn" <joshua.hahnjy@gmail.com>, 
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <liam@infradead.org>, 
	<rppt@kernel.org>, <mhocko@suse.com>, <corbet@lwn.net>, 
	<skhan@linuxfoundation.org>, <ying.huang@linux.alibaba.com>, 
	<apopple@nvidia.com>, <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference with MPOL_WEIGHTED_INTERLEAVE policy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
In-Reply-To: <44d15437-6aae-4d7c-bfd4-296276583826@kernel.org>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Gregory Price" <gourry@gourry.net>
X-Lms-Return-Path: <lba+26abf684a+8e553f+vger.kernel.org+lizhe.67@bytedance.com>
Message-Id: <cac17315-7157-4f97-8ad4-98ef268f1b8a@bytedance.com>
Date: Fri, 2 Oct 2026 16:15:45 +0800
From: "Li Zhe" <lizhe.67@bytedance.com>

On 10/2/26 3:56 PM, David Hildenbrand (Arm) wrote:
> On 10/1/26 15:26, Gregory Price wrote:
>> On Thu, Oct 01, 2026 at 12:54:22PM +0200, David Hildenbrand (Arm) wrote:
>>>> If this is a initial-fill problem, can userspace set weighted interleave
>>>> initially? The program or harness can observe memory usage of the program
>>>> or related NUMA nodes and switch the policy to numa balancing via
>>>> set_mempolicy() or mbind() without MPOL_MF_MOVE after certain threshold
>>>> is met?
>>> You mean: use the weighted policy initially and then switch to a NUMA-balancing
>>> one which doesn't involve the weights anymore?
>>>
>>> That makes more sense to me. Although I struggle to see why an effectively
>>> "let's put random memory on slow and others at hot" is a good starting point to
>>> later let if be fixed up by actual balancing/tiering.
>>>
>>> It all sounds a bit hackish. :)
>>>
>> It is a bit of a non-combo (Nonbo).  You're using weighted interleave
>> with the intent of spreading out the bandwidth utilization (and maybe to
>> offset some reclaim behavior? *shrug*) but then undo all the placement
>> with tiering.
> I can understand the "random initial placement will help if you cross your
> fingers" argument from Zi.
>
> But then the question really is whether the app should then change the policy
> after the initial placement was done and the weighted stuff no longer makes a
> lot of sense.
Yes, that model makes sense if the application or runtime can
cooperate with the policy switch.

One limitation is that this is not fully transparent for existing
workloads. set_mempolicy() updates the calling task's policy, and
mbind() updates VMAs in the calling mm. move_pages() and
migrate_pages() can move pages of another process, but they do not
change that process's future allocation policy.

So I agree this staged approach is worth considering, but it also has
some deployment cost for workloads that cannot participate in the
policy switch.

Thanks,
Zhe

>
>> But, in defense of the hackery - I have seen strategies like this work
>> to optimize startup times and then let tiering optimize runtime.  Phased
>> execution gets funky like that.
> No doubt about that.
