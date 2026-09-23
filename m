Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177A130C14A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188734; cv=none; b=UBs1fppIu1dnYU7+zdiCcrV8TKcjAsjIcwK9HThy0j/1WbJxuxM99HQM8MuuSyRy7o3RE+Dwbh/UqGd24LQPeZN8V9dXTpKqw8NgJVRGHPOjQuL98iQX6oxH5n1mZS0Jw86IzVYR90LKmb66GUc6W9KilxQJk1Ex/0aA7di6H0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188734; c=relaxed/simple;
	bh=Hrf6TGSXaQZejX2G95XddLGIeiFd42MClkLORFt7Ecw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W05g56VgIYbs6BG4JRvzUrOz6ys46rhnA0TMCjYzzdyLQEe/w5sgIGZT5cKRdtXCJlBHjFaFSErF5YjMzpko53NJLsFwrVVZYeM8dr6j2aRhipuxLL8n6SNzWIza5ohDnRgaf/77g0t9JVWuUIuyi++Ni34B3/ha2vvsxewHl8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QO+KrlrT; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QO+KrlrT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=SOx8Dva3HBzRw8/29K6Um9IaE2+mdF6DajAzu0PEF90=; b=QO+KrlrTlwm8TfwQqlmBG2b3Dp
	+9+JPIM3lbv/xgAnONVrLF91mDoNd94gGvMPHmoT99BieEs2GB0ZlL0hvi1GoTag/17OF6UVnF7mq
	n1Z3SxARmukjsDExPUvQzWXOoIxlqzxa/C2m9l3AoEYghgT5h3FnY6N4qWdpusdzdLKdLjCgJNovo
	xel82r6ai6sb4Pd5av6SkwPUMm09lkkBjSOtavG9o04fMJLDGeHKcbVdf971C7ucQOILa4sXnGfMD
	fp1LneRI5kGvdZmCLvJxZ03hTLY9f9SZIscVNOi5FblqSwZk+2qUM8OEbsd2U9BFM3XYxVtbJQtHH
	x1groHQA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rrm-00000009Ee1-1AQF;
	Wed, 23 Sep 2026 18:38:50 +0000
Message-ID: <111d8f8e-02f5-46fb-b8bb-45729d1e33c7@infradead.org>
Date: Wed, 23 Sep 2026 11:38:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [f2fs-dev] [PATCH] f2fs: quota: fix unused-label warning
To: Arnd Bergmann <arnd@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Jianan Huang <jnhuang95@gmail.com>
Cc: Kelvin Zhang <zhangxp1998@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, Daeho Jeong <daehojeong@google.com>
References: <20260917142222.1591270-1-arnd@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260917142222.1591270-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/17/26 7:21 AM, Arnd Bergmann via Linux-f2fs-devel wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added label causes a warning when QUOTA is turned off:
> 
> fs/f2fs/super.c: In function '__f2fs_remount':
> fs/f2fs/super.c:3142:1: error: label 'restore_holder' defined but not used [-Werror=unused-label]
>  3142 | restore_holder:
>       | ^~~~~~~~~~~~~~
> 
> Fixes: 3f140a60c92a ("f2fs: quota: fix stale lock holder on remount failure")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  fs/f2fs/super.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 6a2f09c61dcd..8358cdefa859 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3139,7 +3139,9 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>  	sbi->mount_opt = org_mount_opt;
>  	sb->s_flags = old_sb_flags;
>  
> +#ifdef CONFIG_QUOTA
>  restore_holder:
> +#endif
>  	sbi->umount_lock_holder = NULL;
>  	return err;
>  }

-- 
~Randy
