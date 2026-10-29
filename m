Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272351;
	b=2m4QXeh6GxiX1rFQRjdak813Fs2OlPcnYHvlFZaJT3X5wyjwcipiohUJTPoNTMT3OqxS
	 zS5Kp4MHuWcHEoQNv5Fr32tXvhrXbnNREyqNxssb7WzRKlq9ClNF+xunjOrFvOauPy3TR
	 RE5GmvY9Eb0jU11A1Q+k4LEUsG8ttYOcJ65TjAInyVtnlQE7lKRaOsnvhSHNgeMdllf1n
	 1j4DgK8mNaNQtpiCp3kWEJcEkFK7+WImjjYNhFMmdeuiOR5El2nPaLdsfFh5QpCOU/kR6
	 od36fzjhtrW78/47dF8MOHbgo/LZtTgQKDu/+9hEP6U7Kn/M7bier3JKVS7am0ldwTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272351;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:User-Agent:
	 MIME-Version:Content-Type;
	bh=0wHFqFmUHOMyAXGgatt6RtiWY+xh2oo6ZgNjkZL1EJw=;
	b=BeJMgQV4ELA85bK6rSXMdTK2ydQg3ds/nUkFeIPTADVwwX7VIxTURg7umdPzJ6FfvTYT
	 rTlI1YjHb32sazZelrKn8+HhbgAjxHyMFmxIUvo8++cdwMqlGz5Ieu2ifbfbU1Q2xfQAM
	 4BDv4trX+CrCS4QwxxTwZDELoVRyLFEmwH4Gbhe3bjGfFmxBmpqsljBlu9SS/IMA9B/3x
	 m01Xszo/pZvPMGv7859OqEuV+ebEhuWB+4Viuc+/nSylN0cKZacM9tYrS11IqJqm/INDp
	 zN6ZlExwTO29zHKxodWctBH6Tpb0OEmN3Tz+/Cg3B32tIDcrcDUc7v04EO5Fm6RMqjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=J2tR4AcC;
	arc=none smtp.remote-ip=115.124.30.131
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E701606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E701606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=J2tR4AcC
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793272341; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=0wHFqFmUHOMyAXGgatt6RtiWY+xh2oo6ZgNjkZL1EJw=;
	b=J2tR4AcCmlEYiZmwACVESFSvfwao+B3FKy+0OJYUdeWoFfy7tAf2HJkCF6VoEfTDje42vwE4KNa0BNujZlyVQnoI4mcdLmmQuVEu/AKzhWg9EWzMC+rwoQiH6b2C9gVLVRg0DRr0QMspHq7AyrYSRGNW+OWV22NYzxlSJIVDkwk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XDjF4uj_1793272333;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XDjF4uj_1793272333 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 Oct 2026 19:12:19 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: akpm@linux-foundation.org,  david@kernel.org,  "Kaitao Cheng"
 <kaitao.cheng@linux.dev>,  vbabka@kernel.org,  ljs@kernel.org,
  liam@infradead.org,  rppt@kernel.org,  surenb@google.com,
  mhocko@suse.com,  linmiaohe@huawei.com,  nao.horiguchi@gmail.com,
  ziy@nvidia.com,  wangkefeng.wang@huawei.com,  tujinjiang@huawei.com,
  mgorman@techsingularity.net,  chengkaitao@kylinos.cn,
  muchun.song@linux.dev,  linux-mm@kvack.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/highmem: refuse to copy hwpoisoned folios in the
 !copy_mc fallbacks
In-Reply-To: <20261029034254.2487998-1-xiangzao@linux.alibaba.com> (Yuanhe
	Shu's message of "Thu, 29 Oct 2026 11:42:54 +0800")
References: <20261029034254.2487998-1-xiangzao@linux.alibaba.com>
Date: Thu, 29 Oct 2026 19:12:13 +0800
Message-ID: <87zevwiwvm.fsf@DESKTOP-5N7EMDA>
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

IIUC, in all cases except debugging, reading poisoned memory will cause
an MCE (x86), an SEA (arm), or similar.  Otherwise, copy_mc on x86
would not work either.

If so, we should only check is_page_hwpoison() before copying.

> Check the source page with is_page_hwpoison() in both fallbacks,
> before and after the copy, and return PAGE_SIZE, the
> not-copied-bytes convention of the real copy_mc paths, so the
> callers take their existing error paths.  On archs with copy_mc
> this code does not compile.
>
> Measured on arm64, where the fallback code compiles (10 rounds
> each): COW copy throughput 1043.67 MB/s before and 1043.26 MB/s
> after the patch, fork latency 348 vs 359 us, forced migration 57396
> vs 57654 MB/s - all within run-to-run noise.

Could you implement a micro-benchmark in kernel to test your copy_mc
functions?

[snip]

---
Best Regards,
Huang, Ying
