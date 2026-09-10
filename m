Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA1C44CF40
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049709; cv=none; b=IAPaObYFc9l/hlIVrOAwPCqdECj3XNF4F1cqGHfQZScwH/jviDR8el/OkydhYaClSRumPD8xA+8Hbd+F7pxyPt+7bsUsWY7Xu1L1IuirPaVGdknwk+/7P34aEiyLex/lGZI9Op4cNrzvwa6u//rAw1nR2H+dS3wz6L6Y10S37DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049709; c=relaxed/simple;
	bh=azTM3kSUr70AuudVIJzET1bdnS/wyOE2QbvpVvyced4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nGM2RC7L2iOL9DZuPZg7fTZ6tYpmtT7P6Hb5YfdxG6hP804L6drAH4nHRXhAXmlVCZ7HFnQ/4sR9mRdvYSehIMqlg77voijOz2EifK52FLJw4HWaPMXNjHVy1I9rMFn4mrRCgSkXQ/+knfG2JZckEimAC7r8aljY+QGmdFV2tRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OykTcqL4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OykTcqL4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988CA1F000FF;
	Thu, 10 Sep 2026 14:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049707;
	bh=TiUw/s/a5THXpKNutlCo5ceA78d7FKvTZXpt6nB2WDM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=OykTcqL4d2iurhxpPxK93+PH89vvmNx5+3i+Q3z2sh5S25z14NIvXJG9W0cxefFjA
	 NmdwFLDikwh5MJCPIv9VI/ggKb1BrDTx4edHuAPTPyD8Pf9nhxSKUIcZEYnu2/bB9c
	 tRwlUkkyUztPw4tcAs4jFtjpsovBvrl0O+CH67EU3UOHsYKl8HDzp9kkFxMV4Ilva4
	 M9pnRXd4809xytxNbcxwjvvr1OWn2Hims1vx/XUqQeh9IPXkv0wBDLWvZjkY9KPcNC
	 dM5x5RPEv2qsdMQjViayhqn7jHRNwFkeJJPq+llZWG/ws0Ud/sfUVstxoEBZ1S7bWe
	 zVs62TqX/jFdw==
Message-ID: <894da5cc-7bc4-4b0f-9d6d-ae80a169616d@kernel.org>
Date: Thu, 10 Sep 2026 22:15:00 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH v3 06/14] f2fs: stop using PG_private
To: "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>
References: <20260907-remove-pg_private-v3-0-6ae22f9d9272@nvidia.com>
 <20260907-remove-pg_private-v3-6-6ae22f9d9272@nvidia.com>
 <e5792e81-e8a5-42e1-aafe-58dc603f4968@kernel.org>
 <7e11c56d-05e6-48f0-b5b8-b4a0e18ddc1d@kernel.org>
 <520b6aca-b515-4720-977f-1adb484f2e08@kernel.org>
 <d700c4ea-b54e-4195-b124-3c89177ee49e@kernel.org>
 <18ab9827-9e10-4360-a1d0-3b25d86a71a9@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <18ab9827-9e10-4360-a1d0-3b25d86a71a9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 17:15, David Hildenbrand (Arm) wrote:
> On 9/10/26 10:43, Chao Yu wrote:
>> On 9/10/26 15:34, David Hildenbrand (Arm) wrote:
>>> On 9/10/26 04:41, Chao Yu wrote:
>>>>
>>>> David,
>>>>
>>>> Thanks for the patch, at a glance, it seems fine, can you please send
>>>> a formal patch? then we can apply to dev-test for test.
>>>
>>> I'm hoping Zi will drag that along as part of this patch set. Is this fine or do
>>
>> Oh, I see.
>>
>>> you want it sent as a complete standalone patch (will make merging Zi's series
>>> slightly more complicated :) ).
>>
>> I think sending as a separated patch based on Zi Yan's patch is fine, since the
>> purpose of this patch is a little different from Zi's one.
> 
> I'd prefer this patch over of Zi's patch.
> 
>>
>> Note that: ("f2fs: stop using PG_private") has been merged in
>> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev-test
> That just a testing branch, right?

Yes, if necessary we can append the new patch based on this branch. :)

Thanks,

