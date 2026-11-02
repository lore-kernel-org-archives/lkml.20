Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793588221;
	b=5l6prhWKTN0f8dCrtP/u3tkLlnZzAkuPXoaJYLEgmgcHw0eTl4ZVtHJ0aBoiYZ6aKGSv
	 ObVLIkPQNgnZWCzz7rkZrlWql6lqPEABZCUHWflY+LL8swZEVM9MowZFIktTFi9bkCaor
	 x+CyUjtvsmEKVTZ3aN1fAEi8G2Y+nb0jYhoqBqVES1GCE+ENlbbWOC2bwg7ABt5qaPKBm
	 A4hbDQpEsvlOGYMwA6WOMTOGhtyvqnLM3dCr0QKRPFptKJmKRhgfGDPf51xhzi4jzchEk
	 +vVrT321mm8c6f75MSH+uQZ4C/gIB3MeHdTCOWKwW71ERt5PX1Rz/EBxW/pE5JA7yWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588221;
	h=DMARC-Filter:DKIM-Signature:References:Content-Type:Mime-Version:
	 Content-Transfer-Encoding:X-Original-From:From:Date:Message-Id:
	 User-Agent:In-Reply-To:Cc:Subject:X-Lms-Return-Path:To;
	bh=f6eZQaYDZXMgf+0isykjo7ZZmLKawkQEHO01TtOhj3Q=;
	b=IR0+IfMz23SNGUOfiVxrzJNFAHNlPqTidEYeDrh/hn5iUWnXj5kLQvStGzeNVSKW8WdW
	 pUyF1WwM878OdsaCsZaPqj5tLieQxJqbFWqHMiNrp8+BttY5i6Y+/cDW4dTswMM4TDyxY
	 vGbnKVI/I8sRLNzXmEBtyEwooKyDYogznaJYjFKSjMKlY3N48RjZBXk1nX3n5NNW1zNcY
	 0K735BZhssu6mT7cjctb3cf3xwIsFtMRcgLFjQvC5oV4bvoC/5bORJHYodqZCMGNJSNx5
	 1aMhhMl8WsNqO6nBZfXYSeB+uEWl1b9zrsTd96sNrwrI3+ylFWSOCzJZ9Q53WeGpLSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ic5dd+V2;
	arc=none smtp.remote-ip=209.127.231.115
Received: from va-2-115.ptr.blmpb.com (va-2-115.ptr.blmpb.com [209.127.231.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3F4606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA3F4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ic5dd+V2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793588214; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=f6eZQaYDZXMgf+0isykjo7ZZmLKawkQEHO01TtOhj3Q=;
 b=ic5dd+V2JV+cpanb/cyp3CBWM6Wb9T4m0EmoVJjCjw46iu6xdht76Xmsgo5ce13LyhYDYp
 tg6P6gESqvyi+PGpJG5TiLZWVa7IdnhKWjCuDzJK6LuDyI7wQpTMKZKvYA+lgGcmlby1xS
 yAR3QmU7cT/arIuzoqMDjZXEu7J0Uux+DQaXaUClRSDfO5WwIHR6+mJLkTME7mthiZ3BdF
 KgS6N5gugzDr7/24xKuRrz0V5qYgWfYev2nsQRG9+r5OL7BvmwciNj004/mKEC2kVkuH2Q
 OZhdW3r1K+zyyZsJY/OaBdnvtIRrmxp27b7EKOyucwLxRnUjBItnB9qFTCCW8Q==
References: <20261028041253.74839-1-lizhe.67@bytedance.com> <20261028041253.74839-2-lizhe.67@bytedance.com> <0676993f-c04c-4e4e-9f8d-1650c8fd6d6e@amd.com> <010b2b6c-8f1b-4c3b-913f-cc2e8b957759@bytedance.com> <a6bcd771-fcf7-4fe4-8c21-5e65bd579de7@amd.com> <1bab234e-8914-4694-b0aa-f265fa49c6d3@bytedance.com> <c9cf96bf-f3b1-47da-b22a-9600b5fb01be@amd.com>
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Date: Mon, 2 Nov 2026 10:56:27 +0800
Message-Id: <3318a7f7-4dec-431b-9284-ec7c2807151c@bytedance.com>
User-Agent: Mozilla Thunderbird
In-Reply-To: <c9cf96bf-f3b1-47da-b22a-9600b5fb01be@amd.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
Subject: Re: [PATCH v2 1/3] sched/numa: make free-space tiering promotion bypass configurable
X-Lms-Return-Path: <lba+26ae7fbf4+347cac+vger.kernel.org+lizhe.67@bytedance.com>
To: "Bharata B Rao" <bharata@amd.com>, <akpm@linux-foundation.org>, 
	<bsegall@google.com>, <david@kernel.org>, <dietmar.eggemann@arm.com>, 
	<gourry@gourry.net>, <joshua.hahnjy@gmail.com>, <juri.lelli@redhat.com>, 
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <rostedt@goodmis.org>, 
	<vincent.guittot@linaro.org>, <vschneid@redhat.com>, <ziy@nvidia.com>

On 10/30/26 11:44 AM, Bharata B Rao wrote:
> On 29-Oct-26 5:03 PM, Li Zhe wrote:
>> Yes, the case I am trying to cover is closer to the non-overcommitted
>> case.  We do have deployments where memory is intentionally placed across
>> DRAM and CXL memory, instead of relying only on natural spillover from a
>> full top tier.
>>
>> For example, the orchestration layer may want a cgroup to use a planned
>> DRAM/CXL ratio, so that DRAM capacity remains available for later
>> placement decisions or other workloads.
>>
>> In such setups, the top tier can still have free space, but we may not
>> want short cold accesses to refill it simply because the free-space
>> bypass is available.  The intent of this patch is to let those
>> deployments keep using the existing hotness and rate-limit checks even
>> when there is top-tier headroom.
> Thanks for this information about the deployment model. This is a useful
> conclusion to reach.


Thanks, Bharata.

I would appreciate further maintainer feedback on whether this series
looks acceptable.

Thanks,
Zhe

>
> Regards,
> Bharata.
