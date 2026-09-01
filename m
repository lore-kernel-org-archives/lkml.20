Received: from mail-m19731101.qiye.163.com (mail-m19731101.qiye.163.com [220.197.31.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09396477E38;
	Tue,  1 Sep 2026 09:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255001; cv=none; b=EP1iY761tIrDIn/xiC5upe9dhGygXf+3lMKBcW8eOAbbFpC6Qlc8L9VKwNShpNiUBCh1CPhDWcsVz1CneRKNDTL13xjaEhifWavPuAA0U22HZGbr5L59rL0/A5/hez4evXv5LsJ0xWC0uoVRtqQNECVRdEHCpjIvE7DvGymFSeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255001; c=relaxed/simple;
	bh=RuvC0Mb1hXzGNEj1wXe9mxQRq4jRaB97EUM+Kmujsa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3BNM3q96zSNUNETKUGSYfcPhSWs+33RPDaK8sKqjB/hYzW/x/ND+cmNNTChSDL02SS10kRdv372o7A2Vvp7f0hYyOkNFu3zXnJmN7xmq/vFR/APgQIuCGx7rbUvr0y639ULXrCpYV5o1rBkBkW/748NNc/pUKk1Q6bS884/aKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=220.197.31.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from [192.168.0.59] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1e8f18a64;
	Tue, 1 Sep 2026 17:29:44 +0800 (GMT+08:00)
Message-ID: <53e17480-31bd-4c90-aac3-6542b88ffb95@easystack.cn>
Date: Tue, 1 Sep 2026 17:29:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup filtering
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828031339.1270699-1-zhen.ni@easystack.cn>
 <apEx0wT_hWs1Q5Wp@gremlin>
 <20260828113654.d01abd8baed3f73e87506eb3@linux-foundation.org>
 <9fce3210-3548-4df3-ae00-730b666f5d57@easystack.cn>
 <apZ99NHTmNI_nIwz@gremlin>
 <ff7d838c-8ea7-4a91-86bc-f6899970cdcf@easystack.cn>
 <apaG83-HCFTuASQ_@lucifer>
From: "zhen.ni" <zhen.ni@easystack.cn>
In-Reply-To: <apaG83-HCFTuASQ_@lucifer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa05c4d99040229kunm324655a22845c4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHU9IVksZGhhPQktNGktITFYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG



在 2026/9/1 16:10, Lorenzo Stoakes (ARM) 写道:
> Again you're failing to reply to kernel email in the usual style, and it's
> on you to figure out how to do that, not me.
> 
> Reply, inline, to what people have said to you.
> 

Understood - my previous mail was indeed a plan document rather than
inline replies.

Sorry for the noise.

> Do NOT ask them to read through your 'plan' document and give yet more of
> their time to compensate for you not following basic kernel procedure.
> 
> I have done hundreds (>1,000?) hrs of review upstream and I have only seen
> these kinds of 'summary - plan' emails since 2026.
> 

The timing has a simpler cause: Sashiko itself only started reviewing
patches in 2026.

I would normally prefer inline replies to review, but Sashiko did not
send any mail into this thread, so there is nothing to reply to
directly. Its findings are also heavily duplicated across patches, so
a grouped summary is the more appropriate form here.

> I am only asking you to engage upstream as everybody else does.
> 
> Since you ignored it, I ask you again - have you used an LLM here? If so
> follow kernel procedure as per the documentation I linked.

No. Every patch hunk and every fix/no-fix decision is my own.

> --
> Cheers, Lorenzo

Thanks,
Zhen
