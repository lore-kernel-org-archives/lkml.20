Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86F6344D9B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788138676; cv=none; b=Dt4Kau5rve3SHQRG4E9LT8QTNkNF9uAnIsKUmMbeIOpxhVxjnsjt7nWtLoSgzLNNyMEucNW44VhXl6ieAdtFz+hILI0ixopc5lzlXm8KYtoSAqHnUGFhBRM4Cq9hxen5HEmM869TbpELa4vGz57HXPW81qjUVlTtlLuGGOXpevY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788138676; c=relaxed/simple;
	bh=zRCl8UFo52UCUcfz7pBhtsayJFYRQ8hrYBMf5ypIY0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8VwIqnyH5ucmCge7AEGKz+xbpGCic2MgKIhb3PX1BVQrItwVfCjzKKKmAE1usSV35Tvdtv+QFykZS+TR3bRsoK+Op+Ew7qqtzSLrvhVeSl16udqRbj+c5IVhmG7FttK9jlYn3NwJVwDjM5qXGmzzmPRLAOeue47qYBlFt+9lnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lskqpYJZ; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lskqpYJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=3o9s13cVBSuR0ZrCiKNmgYn6U3efzqN57tyNUTmiW+g=;
	b=lskqpYJZ6VYu2aNBsY86JrAhCDDLeDPGHUg89EeS32OO8M8fIg5iyifKRCPbMp
	Mg5uqecVHIvSX+YI4rmlkYUpwxnX0jJS82vz7YT5aiP+T1eTbecz6rxZfB/YNolD
	FKpkFLGXbh6XoI/R/84BGNJrUqXqceWJZBiqmJN4BcDGw=
Received: from [10.42.0.64] (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wC3f5qJ1JRqNBLuSQ--.48685S2;
	Mon, 31 Aug 2026 09:10:34 +0800 (CST)
Message-ID: <cabf4253-1d07-410c-8714-062317c9967f@163.com>
Date: Mon, 31 Aug 2026 09:10:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] exfat: speed up file creation in large directories
To: Yang Wen <anmuxixixi@gmail.com>, linkinjeon@kernel.org,
 sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com, exfat@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260828145838.1187356-1-anmuxixixi@gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <20260828145838.1187356-1-anmuxixixi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wC3f5qJ1JRqNBLuSQ--.48685S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFWxZrykJw15JFWrGr43GFg_yoWDWFg_Cr
	W0qFWqyw4UZrn3CwsxCF4Yqr9rua18CrWYqr4xJr18JrZ3J3sIkF97XrnYyF1fG398tr98
	Crn7tr1ftw18WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj8sqtUUUUU==
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9woXtGqU1Ipy2AAA3U

Hi, Yang Wen


On 8/28/26 10:58 PM, Yang Wen wrote:
> Negative name lookups scan a directory from the beginning. Repeating
> this scan before creating each file makes bulk file creation approach
> O(N^2).
> 
> Add a 64 KiB per-directory Bloom filter and retain the next empty entry
> found during directory scans. A definite Bloom filter miss skips the
> directory scan, while a possible match falls back to the normal lookup
> path, preserving correctness in the presence of hash collisions.

I think this is a nice optimization, and for large-directory workloads, 
the 64 KB overhead is acceptable to me.

>   static void exfat_free_inode(struct inode *inode)
>   {
> +	exfat_name_filter_free(inode);
The exfat_free_inode() could be called in softirq context, see 
destroy_inode() in fs/inode.c, which calls free_inode() via call_rcu(),

so you can't call exfat_name_filter_free() from exfat_free_inode(). It 
should be moved to exfat_evict_inode(), otherwise LOCKDEP will report a 
warning.


Thanks,

