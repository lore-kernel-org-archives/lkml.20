Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794362101;
	b=X1kCagICBCcZeWazOGHbfg0WyfeBpUHJl4PoNiu/CFN1KqkPUXkWGR7fQv4vimQ4FzH/
	 AGodd7nLHRz9vQ86hD/nMQEe7IkjkR4TdUakznncBrjzuImmYfwm+9awFnVaiKDH0ei6b
	 54Ls4HYBpa5r6iYN0LW45HWgKbG5umE2J0UFFz0NMT1E0W1Z13y1QLL+IOs68ZBokXeTM
	 FDWcwcr4vW4EFk8Db7MYE3HppEYlXguYgiCt8D6Dr9oGeaeix/bojVJqvXOTBtDxXfCrj
	 jMiLjFy6Gm22GB4NbgCY2ETFDzcvnTJG2vh4V12VNs/uT6+volBjTmLdYW3u0mI+D2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362101;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:User-Agent:
	 MIME-Version:Content-Type;
	bh=88xXlYyhRaZNXXS3X5RWnFnkAdm1161ZT112AKHXrTc=;
	b=D57UTVdKz+WX3yS7qFkwYuslpi0Ixf3mRTiwm+JsIqEs6f8EKWMR2bG6txvU3CyPg0mC
	 jWgpmNfm6eMMc4/RlFmPSkxGAt+cfZT0NZqs4xFt4y56Ws4RtQWXr2UiToBhRnXriOYHW
	 lNxSrj0smyL3ivoGcx18dli8KRSJrg82oIIFidm3Gg9RvJpE6z/oncd8fyJpbdgxBvnoR
	 pyaqZ1K6f2PF/E9kpM2k0g/IgILkeWKeF2VlvXZuyM/EyzhS3x7PdbHq/qi4FfXuDHALU
	 08WCtg9MujCSMXSwqiSS6cNXy+RZ9vIltUh3HZ1iaE1NUh//r2QGlkqYrlxWAjv79QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=C54bK2r7;
	arc=none smtp.remote-ip=115.124.30.119
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD35606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD35606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=C54bK2r7
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794362091; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=88xXlYyhRaZNXXS3X5RWnFnkAdm1161ZT112AKHXrTc=;
	b=C54bK2r7jNmzfBU9aZKJ1P+pFVOr6FkX3kNvl0sZCDnP3iR7U+/47s6HxQFXTUckeZnfiRml7cwcXcVU93eSv6/LX4y2eKbAK0smX79YNxM5cdMgZcVcTAJd4H328s7Kbj7jbExBaunLG23mQsACE3yUOxwOgU+Fen2N2prI4ms=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R721e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XEX4t7B_1794362088;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XEX4t7B_1794362088 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 11 Nov 2026 09:54:49 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: akpm@linux-foundation.org,  david@kernel.org,  "Kaitao Cheng"
 <kaitao.cheng@linux.dev>,  "Garg, Shivank" <shivankg@amd.com>,
  vbabka@kernel.org,  ljs@kernel.org,  liam@infradead.org,
  rppt@kernel.org,  surenb@google.com,  mhocko@suse.com,
  linmiaohe@huawei.com,  nao.horiguchi@gmail.com,  ziy@nvidia.com,
  wangkefeng.wang@huawei.com,  tujinjiang@huawei.com,
  mgorman@techsingularity.net,  chengkaitao@kylinos.cn,
  muchun.song@linux.dev,  linux-mm@kvack.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm/highmem: refuse to copy hwpoisoned folios in the
 !copy_mc fallbacks
In-Reply-To: <20261110112641.1196786-1-xiangzao@linux.alibaba.com> (Yuanhe
	Shu's message of "Tue, 10 Nov 2026 19:26:41 +0800")
References: <20261110112641.1196786-1-xiangzao@linux.alibaba.com>
Date: Wed, 11 Nov 2026 09:54:48 +0800
Message-ID: <87jymkt9nb.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Yuanhe Shu <xiangzao@linux.alibaba.com> writes:

> The !copy_mc fallbacks of copy_mc_user_highpage() and
> copy_mc_highpage() return 0 after a plain copy.  With PG_hwpoison
> set while the data stays readable, there is no fault to recover
> from: the copy completes, the destination folio carries no poison
> marker, and the poison is consumed silently.

IIUC, this is just RAS debug behavior, not real-world behavior.  When
poisoned memory is accessed, an MCE/SEA is triggered, and the kernel
will panic without a proper copy_mc_* implementation.  This patch
reduces the probability of a panic, which I think is its main value.

> Check the source page with is_page_hwpoison() in both fallbacks,
> before the copy, and return PAGE_SIZE, the not-copied-bytes
> convention of the real copy_mc paths, so the callers take their
> existing error paths.  On archs with copy_mc this code does not
> compile.
>
> Measured on arm64, where the fallback code compiles: a
> kernel-space microbenchmark measures 90.00 ns per copy before the
> patch and 90.71 ns after, 0.8% of the copy itself.
>
> Suggested-by: "Huang, Ying" <ying.huang@linux.alibaba.com>
> Suggested-by: Kaitao Cheng <kaitao.cheng@linux.dev>
> Assisted-by: LLM
> Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
> Link: https://lore.kernel.org/r/877bjowf9i.fsf@DESKTOP-5N7EMDA/
> ---

---
Best Regards,
Huang, Ying
