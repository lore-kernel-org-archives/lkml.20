Received: from mail-m15592.qiye.163.com (mail-m15592.qiye.163.com [101.71.155.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B358542EE7;
	Tue, 22 Sep 2026 12:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080750; cv=none; b=pMC8SEakMn/kDq4H9ApoAxK8z1pm01AzxFXDw4Nz5CJIUaYFxb2sGfYWO64sPEUXSk/U5BB7nDJukyAhFwfCpnSv/AVGwrVqUnnc1kkNPvSuA+jWrHX7DlTa04XphT5ir69oplDo6cpbgeLT+bX2l78lkXoItkA0wfLvrYr5pbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080750; c=relaxed/simple;
	bh=+hjTpQprf0Z8tlsaG+yPN+m4yjVcDMKXTcpEU/4pilI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2h0r05THRgG9FEbRurifn3m4YMnum4w0cJJiRyHqrP+KS2JJFgxvMoa0UAT+oTJtikxFOy7Kn3SioPinCOYtQIarzXtf+1gfs09X1LO/0S8ORL/ope9WkHswjXgvBq4wgp1z28Gw6bmP9u5orSjz/g6DbyU/FHGKmwNzQ2eKdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=101.71.155.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from [192.168.0.59] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1f642799d;
	Tue, 22 Sep 2026 20:33:41 +0800 (GMT+08:00)
Message-ID: <0894f68a-9cef-47ac-bf8e-86cb18b6cf67@easystack.cn>
Date: Tue, 22 Sep 2026 20:33:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
To: Zi Yan <ziy@nvidia.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
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
 <99a94068-ab37-47c0-878c-7c1ada5204b2@easystack.cn>
 <8997BF57-2124-4F71-9CEE-6F7D31A15D87@nvidia.com>
From: "zhen.ni" <zhen.ni@easystack.cn>
In-Reply-To: <8997BF57-2124-4F71-9CEE-6F7D31A15D87@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0c91b8cd90229kunm1cdcecd753db0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTR4eVktDSBpNHksZGUweHVYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG



在 2026/9/22 00:25, Zi Yan 写道:
> On 19 Sep 2026, at 22:11, zhen.ni wrote:
> 
>> 在 2026/9/11 19:32, Lorenzo Stoakes (ARM) 写道:
>>> On Fri, Sep 11, 2026 at 01:06:46PM +0200, David Hildenbrand (Arm) wrote:
>>>> On 9/11/26 09:58, zhen.ni wrote:
>>>>>
>>>>>
>>>>> 在 2026/9/9 23:54, Zi Yan 写道:
>>>>>> On 9 Sep 2026, at 6:28, David Hildenbrand (Arm) wrote:
>>>>>>
>>>>>>>
>>>>>>> Because it results in less kernel code  :)
>>>>>>>
>>>>>>> And less kernel code is good. Unless unavoidable.
>>>>>>
>>>>>> An alternative is to add BPF hooks like bpf_iter to do the filtering
>>>>>> and by default, when no BPF program is attached, everything is printed.
>>>>>>
>>>>>>
>>>>>
>>>>> I’ve also thought about a similar approach—perhaps a new bpf_iter type
>>>>> that could iterate over all pages by PFN. The advantage would be that
>>>>> you can fully customize what you want to print and what you want to
>>>>> filter. However, doing so would require refactoring the entire
>>>>> page_owner, and I’m not sure whether it’s worth pursuing in this
>>>>> direction.I’d also like to hear everyone’s thoughts on this.
>>>>
>>>> Certainly better than having more and more manual filters added to the code base.
>>>
>>> Agreed.
>>>
>>> bpf seems the ideal fit here I think?
>>>
>>> Means that those who want this information can get it and those who don't are
>>> unaffected.
>>>
>>
>> I have prototyped page_owner bpf_iter and confirmed it is a viable and
>> valuable direction:
>>
>> 1.Most parameter parsing is offloaded to the existing BPF verifier,
>> keeping the page_owner kernel-side logic simple.
>>
>> 2.Filtering and printing are delegated to the BPF program, providing
>> greater flexibility and enabling more complex composite filtering.
> 
> Without attaching a BPF program, page_owner could still print to
> the console, right? Otherwise, it will break existing users without a
> BPF program. You could add a hook to decide where to print the results.
> 

The existing console/debugfs path is untouched -- the BPF iterator is a
new, opt-in channel that coexists with it. Without a program attached,
page_owner behaves exactly as before.

>>
>> I plan to further refine this patch series, but it will likely be
>> submitted as a separate series, as it represents a different direction.
>>
>>
>> Thanks,
>> Zhen
> 
> 
> Best Regards,
> Yan, Zi
> 
> 

Thanks,
Zhen
