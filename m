Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559AF31618C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862380; cv=none; b=BrTrIk1kI0N/9Gg2uwM2ZV0GpjeKWVHrUE3pV1scUitzEYiHCuyUUI1h7GyZ5vHW82AS4yzkBlKMuXjm8hD9ljIm/dgqcjNR3KYjpUGZfISv3ORvSLPEo/FFyTJH1KXDWiqny5vlpGJf/zhB9kj354j7cFqf89fKkd5OGuCNovk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862380; c=relaxed/simple;
	bh=PKx7CJFbiIF3HCbReDR8YJxGAKcqibEROhASjoPKVhw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qJc3Rpz1Ti8MR1Fu8gZ1QJ0WjB8KupJEwhrutsUJzfIzchu+Jr4q0P/TghxsubwFMPr8+qwnrNT7Bi7PqHcLr44kNw0NApRpnnY7BKAS3WJHRC3TANyp+kMU4M2220DAv+CmhHMV+EYRSbOQvKwuspKbIlCiTiWTk9oEv/AbnOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZUm3UzW4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZUm3UzW4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8791F000FF;
	Tue, 13 Oct 2026 03:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791862378;
	bh=81fEEjV6Pw59jq+VLLeeVEQCDO76zTf5RtbeOlr3HpQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZUm3UzW4c/NlvVoZhyu2MgDxUbbhAr8AJrAjLwu8YXKO8/RSaAa6qwYHsOJ3md2hW
	 iOZKBXnAVv0Z/fbcMuZD3b6ZaMA7FWHpGOnyax6hMrIuPOvxFxlp5Sdnf1vH/Bc+vh
	 fqvRK3Y87Emfm37vddpqp8py8sBhpx6cR2snUENg=
Date: Mon, 12 Oct 2026 20:32:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Biplab Raut <Biplab.Raut@amd.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <hsiangkao@linux.alibaba.com>, <terrelln@fb.com>,
 <yann.collet.73@gmail.com>, <guoxuenan@huawei.com>
Subject: Re: [PATCH] lib/lz4: add software-pipelined prefetch to decode fast
 loop
Message-Id: <20261012203257.614d88c12146544aa6487b4d@linux-foundation.org>
In-Reply-To: <20261013032010.2453893-1-Biplab.Raut@amd.com>
References: <20261013032010.2453893-1-Biplab.Raut@amd.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 13 Oct 2026 03:20:10 +0000 Biplab Raut <Biplab.Raut@amd.com> wrote:

> From: "S. Biplab Raut" <Biplab.Raut@amd.com>
> 
> LZ4 decompression of cold 4 KiB pages (the zswap/zram hot path) stalls
> on cache misses because the input stream (compressed) and output buffer
> (uncompressed page) are not resident in L1/L2. Insert read-ahead and
> write-intent prefetch hints at the top of the decode loop in
> LZ4_decompress_generic() to overlap memory latency with decode work.
> 
> The prefetch distances (96 B read, 128 B write) are tuned for the
> page-at-a-time workload where both buffers fit in L1d. Prefetch is
> architecturally a no-op hint on all Linux-supported architectures;
> it never faults, never changes correctness, and compiles to nothing
> on targets without hardware prefetch.
> 
> Measured on AMD EPYC 9755 (Turin, 2S×128C), Ubuntu 24.04, kernel
> 6.8.0-90-generic, real zswap path (cgroup-constrained MADV_PAGEOUT +
> full scan-back), Silesia corpus, 15 paired rounds:
> 
>   Kernel LZ4 median scan:  1.0994 s
>   Patched  median scan:    1.0472 s
>   Median paired speedup:   5.09%  (range 4.19%–6.99%)
>   Patched was faster in all 15 rounds.

Well that's nice.  I can't actually recall a case where prefetch made a
measurable difference, although I'm sure there are such cases.

We used to use prefetches often (10+ years ago) but it seems to fallen
out of favor.  This code is a prime candidate.  mm/ barely uses
prefetch.  Maybe it should,


