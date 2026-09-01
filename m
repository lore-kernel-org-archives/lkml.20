Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C56369224
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248761; cv=none; b=n8lYsVKClQ1NG6kmwOYqwR2ibVYJI7zNwiSQO5dI96ra4876M1lg+Xrluw8ZdSYp9jwU/jDMO8ktHbc7CYDDLFOcwYUPmkLfqti2L0pKKemogdTfmAZ73apdwzcsikJL7PggTOb+FGOMxsjtzBgfYh1fm9jvOisP8hwrgSJTC3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248761; c=relaxed/simple;
	bh=Mid89gYgVMubNd5SeLtGPKU9Eu9EvreEAN2NM2qvLSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jX5wdCSgNy1e/r4kf4l1Zuhxuea2aTdV7VqGYvJyuKGRpUdQxF+XbnQLpdZ4hlOWJ1f8zS/04f0GAcqP3NOZ6FRNDnKefv9DrlQR5LEd/UXdxM+HH96gX9fzc7OAcKf8SLUiPtmQLxYPA6mFphdH7Wt4NAomD9+dsNbQ6FKjC+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oQO8Ohoi; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oQO8Ohoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=T92CL99kwa+djsSu7LsHukv/QHdIGeOl+96thK07VmU=;
	b=oQO8OhoinXFC91NTvf/exFLREj/hsO9k8siVqYnmeupxoAzonLxfl986lx/fcE
	f8geTizqlGP1sIAxa5+xyuNtWmmYEIO1EmTMGmtlPEwg9ngJaxP6Yrn52Jcdas+x
	Md0tFFlgsxSSctn+Ij/gmLbpS/ISzF0Ewt9c0A2tAGRNY=
Received: from [10.42.0.64] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDn96+VgpZqNaBQTQ--.50045S2;
	Tue, 01 Sep 2026 15:45:26 +0800 (CST)
Message-ID: <d112a566-eaf0-4db5-ad33-91208b98e82d@163.com>
Date: Tue, 1 Sep 2026 15:45:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] exfat: speed up file creation in large directories
To: Yang Wen <anmuxixixi@gmail.com>, linkinjeon@kernel.org,
 sj1557.seo@samsung.com, yuezhang.mo@sony.com
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260831151539.1239134-1-anmuxixixi@gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <20260831151539.1239134-1-anmuxixixi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wDn96+VgpZqNaBQTQ--.50045S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWDAFW5Xw4rZF1kur4xXrb_yoW8uw18pa
	1rGa4ftw1kJ3W7Jan3uF18JFy5J395GF1fX34fCry5Grn8ur1vvr1fKryjgayDu3y5Wr1a
	qa1jvr10gwnrCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U20PhUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+BcGo2qWgpc5aAAA3y

On 8/31/26 11:15 PM, Yang Wen wrote:
> Negative name lookups scan a directory from the beginning. Repeating
> this scan before creating each file makes bulk file creation approach
> O(N^2).
> 
> Add a 64 KiB per-directory Bloom filter and retain the next empty entry
> found during directory scans. A definite Bloom filter miss skips the
> directory scan, while a possible match falls back to the normal lookup
> path, preserving correctness in the presence of hash collisions.
> 
> To avoid overhead for small directories, build the filter lazily when a
> directory reaches 1024 on-disk directory entries. A filter reclaimed
> under memory pressure is rebuilt on demand.
> 
> Manage the filters using a per-superblock LRU and shrinker so that filters
> for inactive directories can be reclaimed under memory pressure.
> 
> Test environment:
>    QEMU TCG multi-thread, 4 vCPUs, 6 GiB RAM
>    4 GiB exFAT image, 32 KiB clusters
> 
> Test script:
>    mount -t exfat /dev/vda /mnt/test
>    time sh -c '
>            i=0
>            while [ "$i" -lt 20000 ]; do
>                    : > "/mnt/test/f.$i" || exit 1
>                    i=$((i + 1))
>            done
>    '
> 
> The measured results were:
> 
>                           Before          After
>    real                   589.48 s         5.33 s
>    user                     4.72 s         2.28 s
>    sys                    584.63 s         3.03 s
> 
> The elapsed time was reduced by 99.10%, from 589.48 seconds to
> 5.33 seconds, corresponding to a 110.6-fold speedup.
> 
> Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
> ---
> 
> Changes in v2:
> - Move exfat_name_filter_free() from exfat_free_inode() to
>    exfat_evict_inode(), after truncate_inode_pages_final(), because
>    ->free_inode() may run from an RCU callback in softirq context.
> - Link to v1: https://lore.kernel.org/all/20260828145838.1187356-1-anmuxixixi@gmail.com/
> ---
>   fs/exfat/dir.c      | 280 ++++++++++++++++++++++++++++++++++++++++++++
>   fs/exfat/exfat_fs.h |  22 ++++
>   fs/exfat/inode.c    |   1 +
>   fs/exfat/namei.c    |  44 ++++++-
>   fs/exfat/super.c    |   9 ++
>   5 files changed, 355 insertions(+), 1 deletion(-)

This is a fairly large patch, which makes the review a bit more
challenging. Perhaps next time you could consider splitting it into
multiple patches in a patch series :)

Reviewed-by: Chi Zhiling <chizhiling@kylinos.cn>


