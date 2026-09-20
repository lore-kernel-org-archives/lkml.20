Received: from mail-m1973182.qiye.163.com (mail-m1973182.qiye.163.com [220.197.31.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64AF3C2BB0;
	Sun, 20 Sep 2026 03:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789874825; cv=none; b=F3ZzAIyG7QBceQIVqvTA+ijuNIF5hu0VQRfszl5Idd8AObbX7dKONzZz2QH+iH9rwGv0v+L9VkfAH8uqmRDKPJtkZVOUmd6EHcsfQ5nYK0Bv0IH9P1kZBfofvOd/PXF4EHpTOSWtUGoA4iu0ZfI/WHH1TziXYP5HjRMpbPt5hNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789874825; c=relaxed/simple;
	bh=4vFYmCzdRJ6CGiU+FHTthwBZRfUP1kzd6SL1k4iiUTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubEw4GgupR8VM5okO90SU/W3BXySQ6zZO5n0ccVMYecWbXTyIEAnG2vdSvWya2WmpKpwm8QiO7w+lRm1kDw26mt4G23SAKIrQf+i4fTNcOBkFlFQdU0d7TxwBZKm6JrL4ON4jHIUEHLax3ag65Y+eU7c/45DyJbUpFEVGWvpUAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=220.197.31.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from [192.168.0.59] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1f4881c20;
	Sun, 20 Sep 2026 10:11:10 +0800 (GMT+08:00)
Message-ID: <99a94068-ab37-47c0-878c-7c1ada5204b2@easystack.cn>
Date: Sun, 20 Sep 2026 10:11:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907082620.2083838-1-zhen.ni@easystack.cn>
 <79548641-25f3-4ec3-a549-782fad168962@kernel.org>
 <6e8bfb0d-d595-4e6b-9536-0323ada57e25@easystack.cn>
 <b8e23456-00af-4097-a769-210a087d2b90@kernel.org>
 <22D1EC4B-FBCB-421E-B8DA-345B5F3505FB@nvidia.com>
 <d8d34e16-57fa-48b7-93a9-afbf4b950ce6@easystack.cn>
 <98ca914b-4722-448d-b5a4-7f095d0ca433@kernel.org> <aqPmlw8WYW9HSzIV@gremlin>
From: "zhen.ni" <zhen.ni@easystack.cn>
In-Reply-To: <aqPmlw8WYW9HSzIV@gremlin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0bc94e7a60229kunm9a1984bc79d8c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQ09IVklJQ0JPSR8dSB9JQ1YVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+



在 2026/9/11 19:32, Lorenzo Stoakes (ARM) 写道:
> On Fri, Sep 11, 2026 at 01:06:46PM +0200, David Hildenbrand (Arm) wrote:
>> On 9/11/26 09:58, zhen.ni wrote:
>>>
>>>
>>> 在 2026/9/9 23:54, Zi Yan 写道:
>>>> On 9 Sep 2026, at 6:28, David Hildenbrand (Arm) wrote:
>>>>
>>>>>
>>>>> Because it results in less kernel code  :)
>>>>>
>>>>> And less kernel code is good. Unless unavoidable.
>>>>
>>>> An alternative is to add BPF hooks like bpf_iter to do the filtering
>>>> and by default, when no BPF program is attached, everything is printed.
>>>>
>>>>
>>>
>>> I’ve also thought about a similar approach—perhaps a new bpf_iter type
>>> that could iterate over all pages by PFN. The advantage would be that
>>> you can fully customize what you want to print and what you want to
>>> filter. However, doing so would require refactoring the entire
>>> page_owner, and I’m not sure whether it’s worth pursuing in this
>>> direction.I’d also like to hear everyone’s thoughts on this.
>>
>> Certainly better than having more and more manual filters added to the code base.
> 
> Agreed.
> 
> bpf seems the ideal fit here I think?
> 
> Means that those who want this information can get it and those who don't are
> unaffected.
> 

I have prototyped page_owner bpf_iter and confirmed it is a viable and
valuable direction:

1.Most parameter parsing is offloaded to the existing BPF verifier,
keeping the page_owner kernel-side logic simple.

2.Filtering and printing are delegated to the BPF program, providing
greater flexibility and enabling more complex composite filtering.

I plan to further refine this patch series, but it will likely be
submitted as a separate series, as it represents a different direction.


Thanks,
Zhen
