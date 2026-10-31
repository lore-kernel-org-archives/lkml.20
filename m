Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793443958;
	b=EaXAXbDBQiqnAqIoYjI5cgfCDoZuXwRbaI6D5e7O6kBBoj66l1aJkRJ0FN+HiddswVrV
	 x9JBOt3dBXUJzCqRORa02FfSevWGgiS4OUyAxrIhJasOtE901fuZ75fwzQJazGOrTgm0Z
	 kUDTc1Jh0zj7LSHoMfji7DMl6zYSkbN5kBFozC9To0jzo6fdidy6w5kcEYAYLBxCFXMSo
	 FSgymSjnxtlWuHE0fJmpQZpPwcdhUQ+niLXpUArjbi6nLcRCjzJAWOlcFlbzhdwEoRNlE
	 C9w40sw+Jy6sH1BVfMF7PIf/xvmWlUmcoKdFmVKrCG6jOu68R1D3kMIaaFrx8PCzaoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793443958;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=nELab0FR/ewF6MqcRa7dk90EvRC+uIJilTIJqRMELkA=;
	b=QFhPz/XuT3E3Kw6MhQjBTZLKJzMZQRq8emw8igwo+GRd+Wbf7tAxEcqa9w9+58M/eTHR
	 McH2t3eNjIz0Ze2vOi+I5IfY1SbMKU8uvAaJrMWPdE3YcblvlQObph6i0qXuxB/+HtJSH
	 5EU1NMuCy2oUvNDrVtD+bRwvBxW8PurSj4VDRhCe9rEhP0avdcR8L15mapnMy1Gtsv1g5
	 zqZfZg9bXKVa7qx06/vZiynjm+x2eePz+ah6G5hVHU1ZB/0gM63UZXiZZmmTGX9laXvAT
	 OT2XDfuALo819KfI3DrGuP7JQMa7hiIem+08zX0bQLd6/WHeq41ObT+/jjuk1GthOlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UJaB6/R7";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF48C606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UJaB6/R7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E911F000C1;
	Sat, 31 Oct 2026 10:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793443957;
	bh=nELab0FR/ewF6MqcRa7dk90EvRC+uIJilTIJqRMELkA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UJaB6/R7uk1mlmkAIzYMEc7DUTnLcT8xULUIpx66y+1F/KK6ZNgvK+sbbeRDlU0yS
	 ulN/zOlwsrFR53cUj7rj/bJ+Vq7YZe1Sf18FOuGYthYqNZZvmCD9Epe1JVyBVuXPFE
	 ghqt34gN5SdUWf0sYcfx6GtBeb2oiKClfvHGkRr0yAI4L5jkMNKpSDo5lRyTdQoD9N
	 bscu3+1RVSih/32Knb+bUHkgwgQAshk/mnTLhjZ7PcxYaX+twfLad4pcz26uPb1rpY
	 OrODKE69jW3mWAszw1sQtuG7tAJLqb9XlAIxziF6jTuNJw6Yf/tYL0k0JB70TTZas4
	 yQEQsZ0xeL/0w==
Message-ID: <76579248-64db-47bf-b8d0-4eb3ca556f5a@kernel.org>
Date: Sat, 31 Oct 2026 11:52:30 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/migrate: fix softlockup in do_pages_stat() with huge
 page arrays
To: Qi Xi <xiqi5703@163.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org
Cc: Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Qiliang Yuan <odys.yuan@gmail.com>, linux-kernel@vger.kernel.org,
 wangkefeng.wang@huawei.com, sunnanyong@huawei.com, xiqi2@huawei.com
References: <20261031033330.3416326-1-xiqi5703@163.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261031033330.3416326-1-xiqi5703@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/31/26 04:33, Qi Xi wrote:
> From: Qi Xi <xiqi2@huawei.com>
> 
> do_pages_stat() walks the user page array in 16-page chunks but never
> reschedules, so a huge nr_pages can hold a CPU past the watchdog
> threshold on non-preemptible kernels. Add cond_resched() to the loop so
> long move_pages() node-query calls yield periodically.
> 
> With KASAN and function tracing enabled, a move_pages() node query
> (nodes == NULL) over 10 million page entries (~40GB) can trigger the
> softlockup on a PREEMPT_NONE kernel.
> 
> Fixes: 80bba1290ab5 ("mm: no get_user/put_user while holding mmap_sem in do_pages_stat?")
> Signed-off-by: Qi Xi <xiqi2@huawei.com>
> ---
>  mm/migrate.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 7bdcdb57652f..6c2371020cc5 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2545,6 +2545,7 @@ static int do_pages_stat(struct mm_struct *mm, unsigned long nr_pages,
>  
>  		chunk_offset += chunk_nr;
>  		nr_pages -= chunk_nr;
> +		cond_resched();
>  	}
>  	return nr_pages ? -EFAULT : 0;
>  }

I though we wanted to stop throwing in cond_resched() at this point?

-- 
Cheers,

David
