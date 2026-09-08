Received: from mail-m127212.xmail.ntesmail.com (mail-m127212.xmail.ntesmail.com [115.236.127.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BCB1D54FA;
	Tue,  8 Sep 2026 07:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851753; cv=none; b=SBf4NhouHUE3CsLezcKGhE3iz6eOPvTuYDDKvx7AhrU14c+pGzMZ6hJPZ6LF5zbK0bANDKplwYzPwLTw6C1dhMIMQGzMQZap2PKSEEX7F3EQzI2Z+d4LgKeBoKv3Xtd1fc8/AKcMc1c44ux24Earx0tETv3OIyrBK+b3lsU0zYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851753; c=relaxed/simple;
	bh=gp3esHASp/g19i1ypvnclFOqgm8xN4o1yOkydMlEUJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXsQmlHn6JDgM6RRulR5f5wEE5eEzWZwc8o4jLP6CERez3lentBoXjjJGPIJFqLxdH6t0bw3RiIwHpBVaHg3owmHtZn9pAZ98uZLOH0VmTKfNAU7Bt9YBPFkW6/OiOmhxWqEPzX1xvFeQt0yl/9bEf/O/oso5WBPfN6OyESOMAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=115.236.127.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from [192.168.0.59] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ed122a35;
	Tue, 8 Sep 2026 14:40:10 +0800 (GMT+08:00)
Message-ID: <048d7470-a813-4252-a4f0-0ec29694f639@easystack.cn>
Date: Tue, 8 Sep 2026 14:40:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
To: Weijie Yuan <wy@wyuan.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>
References: <20260903041819.1776630-1-zhen.ni@easystack.cn>
 <a6ce8684-116b-42f2-a88c-154eb86bad59@kernel.org>
 <a98bde94-d1fb-4246-b7c6-e64303d8388a@easystack.cn>
 <5d4c247c-b8ea-4d3f-b2b9-d442d372fd03@kernel.org>
 <6744bcdb-3456-4ba2-95a0-a58c354bfbfa@easystack.cn>
 <ap-qDThi-NQgVXVD@wyuan.org>
From: "zhen.ni" <zhen.ni@easystack.cn>
In-Reply-To: <ap-qDThi-NQgVXVD@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa07fbedeea0229kunmc6aacfca1acab9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUhXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQh1OVkoZSB1DThhNShhKTFYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9CTFVISU
	xNQlVPVUhLS0pZBg++



在 2026/9/8 14:24, Weijie Yuan 写道:
>  From an outsider..
> 
> On Tue, Sep 08, 2026 at 10:41:23AM +0800, zhen.ni wrote:
>>>
>>> Sorry but your whole reply reads like a LLM slop. It took a lot of
>>> mental effor to actually try and engage with it.
>>>
>>
>> This reply was written by me, and its viewpoints are not simply copied
>> directly from an LLM. The LLM only assists with the wording.
> 
> So that's probably the reason. Your previous replies was indeed very
> much like the output of an LLM. Even if the idea is your own, after
> being "polished" by LLM, it's hard to read. I know English is not our
> first language, and it's not that easy to speak like a native speaker.
> But may I ask you did you read it before sending them out? I really
> found this bunch of overly formal content a little painful to read.
> 
> So I suspect the LLM may have taken too much liberty in polishing your
> text, to the point that your replies no longer read like something a
> person would naturally write.
> 
> The "Summary and Plan" in your reply in v1, both in its formatting and
> wording, looks quite similar to LLM-generated text to me. So I can
> understand why Lorenzo asked whether you had used an LLM. Come on, we
> all know what LLM writing looks like.
> 
> That said, I do not know exactly how you used the LLM on your original
> text, so please forgive me if I have this wrong.
> 
> Thanks.
> 
> 
I really can't distinguish the LLM flavor that clearly in English. I'm
sorry for causing some trouble.

My normal reply process is to first describe my ideas, then have the LLM
check for logic and grammar issues, and do a round of polishing. I check
the final draft once more to see if it has deviated from my ideas, and
make corresponding revisions.

Thanks,
Zhen
