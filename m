Received: from mail-m15590.qiye.163.com (mail-m15590.qiye.163.com [101.71.155.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF8848AE24;
	Mon,  7 Sep 2026 12:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783324; cv=none; b=MaChItaZJy6uJNjIzgQV9AB2GwVXvPTM21jbDNKW7MTciG1mzzPk1F5rNTk0k9IsR02owbhH7IE8qWzk9sgk08Bcukiyq1D9n0K73KnsJw3j6ZcN/TvpJczjxwG/vSsAhn3fDs78F7mtJ92G/4+gQR+2upzHN5ZXlKew9nUVHNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783324; c=relaxed/simple;
	bh=5kKggtBdRl4rZ9zyEywK0zf5oVYIDwHj6+eAh5xVJvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YuKYeaWgKRIWrJ2dn5MHslUzDVeQyXKj21dhtYXQH/AHfqYQHrFX40ba+YgGJ+6XjM5W5Y2no8LoBrxyI0FMp35Mv5z94JCvm82vSUw177xaa8P2YQROYzqYgnqR0PSXiNFQkff8aApxx6EAFjQpzbyC+roXE5vbX3eW0eiWbbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=101.71.155.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from [192.168.0.59] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ec924d00;
	Mon, 7 Sep 2026 19:39:48 +0800 (GMT+08:00)
Message-ID: <810d5cd8-03fb-4cde-8637-e1d7cc1e1df8@easystack.cn>
Date: Mon, 7 Sep 2026 19:39:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907082620.2083838-1-zhen.ni@easystack.cn>
From: "zhen.ni" <zhen.ni@easystack.cn>
In-Reply-To: <20260907082620.2083838-1-zhen.ni@easystack.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa07baad5c40229kunm9172ee8f171186
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGEwaVkJJGRhNHxkaHRlLQlYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	hKSkJMVUpLS1VKQktLWQY+



在 2026/9/7 16:26, Zhen Ni 写道:
> This patch series adds process and memory cgroup filtering support to
> page_owner. Following the previous series that introduced print_mode and
> NUMA node filters:
>    https://lore.kernel.org/linux-mm/20260707115411.1714314-1-zhen.ni@easystack.cn/
> 

I have checked the v3 version of Sashiko's report:

	https://sashiko.dev/#/patchset/20260907082620.2083838-1-zhen.ni%40easystack.cn

It did not point out relatively helpful information.


Thanks,
Zhen Ni
