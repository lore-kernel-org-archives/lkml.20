Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0591E1DF0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 04:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788235274; cv=none; b=Gqyj1gBnLY44rbffpAK7E9r2gztw940V7EcNchNJN9Gla9sWxYcD5fEZArVaFbfzT6uNLYPwAGD9lgUyBVRFhTxfiOvUoNZbOKrZRymBId+M9iEPz1cijiT4bV6j3mIW74N/PN1EiYuYISjToQIdbG5udkfGwvUhSdM1KPG2m3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788235274; c=relaxed/simple;
	bh=rkpn3/VfHMNKYyK1qjx6KKHde0vonE66OqGCKpoqx2Q=;
	h=From:Date:Mime-Version:Content-Type:In-Reply-To:To:Subject:
	 References:Cc:Message-Id; b=m6G0fDrezRjus95pTTw3s1VnXcLY+tv0tCT1RVKfLPXiLXjxO6bhRqgpZXXfgHWUHe4A8B/e9g/dGkLfdAvqLjBQX/eoiKOkbU46Jy2anR+X4ZmkqpcKwdxMr8nIX65xZhh8GxV1COJfJAxyd9Y9/3n9+MmdTLM2JJfVCqtFIj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=FNkAIQfF; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="FNkAIQfF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1788235267; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=t3Yo6irIZLQFuD9pdpnG9SGQ6Tzo88ZDjoh/R1UIafo=;
 b=FNkAIQfFtR5hu70iam909BqgvX/6ZsTP+YI7C3RZzZMxBR6hhv4XfSe1kzGzTxeWG8Pn1v
 a2M3BnE+8gk1rw67Szkt9FrsuWfbD9KVWdXGGkKB+dQUd6xCRurUWQo2Qvv78O6by9HwLW
 NRmktKDcdZA6tYvh2h6n4pu2DopungjkPQEOe0F5biSLI6rd58v+gRBc8l7E/P+SnoSlww
 pnyooYjt+lfNUGaxu8JB9nn2MbJXoM0tXKO7oa9k+RcfVbDz+3TqIW6zHCue5CKxD6Ebhj
 guXUiXaYNDVpQk5xCPB4jC+3h7DDRjyPK80mQPA0813x5jGzYYoZJipF4jq9mA==
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
User-Agent: Mozilla Thunderbird
From: "Li Zhe" <lizhe.67@bytedance.com>
Date: Tue, 1 Sep 2026 12:00:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20260831173220.72ab28190a44a305dacf4d04@linux-foundation.org>
To: "Andrew Morton" <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm/hugetlb: fix overbroad MMU notifiers for unshared PMDs
X-Lms-Return-Path: <lba+26a964e01+bc6d62+vger.kernel.org+lizhe.67@bytedance.com>
References: <20260831091023.66581-1-lizhe.67@bytedance.com> <20260831173220.72ab28190a44a305dacf4d04@linux-foundation.org>
Content-Transfer-Encoding: 7bit
Cc: <muchun.song@linux.dev>, <osalvador@suse.de>, <david@kernel.org>, 
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
	<aiqi.i7@bytedance.com>
Message-Id: <e64e6cd5-e7fd-46ed-9116-28e2e97a48ca@bytedance.com>

On 9/1/26 8:32 AM, Andrew Morton wrote:
> On Mon, 31 Aug 2026 17:10:23 +0800 "Li Zhe" <lizhe.67@bytedance.com> wrote:
>
>> Hugetlb currently expands MMU notifier ranges to PUD boundaries whenever
>> PMD sharing is possible. That is only needed when huge_pmd_unshare()
>> actually detaches a shared PMD page table, because clearing the PUD
>> invalidates the whole PUD-sized virtual address range.
>>
>> For hugetlbfs hole punch and MADV_DONTNEED, a shared mapping can pass
>> the "PMD sharing is possible" range test in function
>> adjust_range_if_pmd_sharing_possible() even when the PMD table covering
>> the target 2M page is not shared. KVM then receives a 1G invalidation for
>> a 2M operation and zaps unrelated secondary mappings, so the guest has to
>> fault them back in.
>>
>> Fix this by using the existing cheap "sharing possible" test only as a
>> gate, then inspect the candidate PMD tables under the locks held by the
>> hugetlb unmap paths. The notifier is expanded only for PUDs whose PMD
>> table is actually shared, while the other callers keep the existing
>> conservative expansion.
> Thanks.
>
>> On a Redis-in-VM workload that punches cold 2M hugetlb pages, this
>> patch improves P99 QPS stability while punching pages, reducing the QPS
>> degradation ratio from 7.09% to 1.45%.
> So a modest performance improvement?

Yes, I would describe the measured end-to-end improvement as modest and
workload-specific. The Redis number is mainly intended to show that the
over-notification can have a visible impact in a real workload; it is not
meant to be a general benchmark result.

>
> This led Sashiko to perhaps discover what it considers a "critical"
> pre-existing bug.
>
> 	https://sashiko.dev/#/patchset/20260831091023.66581-1-lizhe.67@bytedance.com
Regarding the Sashiko report, it looks like a valid pre-existing issue to
me. I have not yet looked into it in full detail, but I will spend more
time analyzing the problem and the proper fix. If that analysis confirms
the issue, I plan to send a separate fix patch for it.

Thanks,
Zhe
