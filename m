Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63E63368AC
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704127; cv=none; b=e3zmjPG+GhyzY8ZGbfvMCZdyXsTX8CtdPffSHEh/QFT8x/+NH4iVz5pSDujV/ETIycO44yHSqN9k69aLU/BXDjC/xdenX6AyVkASEl/nItzmqvqJwAqDS2tvA5LtEt8PeTfsjLHR8SEgWeOeVDCtNWeQp6y4E83vJql7rDXPlnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704127; c=relaxed/simple;
	bh=JV9rR6PbCXCY0nVK5UFr8KLbHnkplhTSCpGJoiucHIM=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=Fd/BXgoxJq4shS8trgVDdyw12SrTC5kb649vHNZlVMtEkp5gSmQNAslbfQNETI94QSxgPzYkXNLd/vuZVIKaVTOCWTF4p0lkbOxW1YZaQ60UWRCF++FGGFlEDzHm6X96S7t7xNmjycMex8mooc5Aqj3YJz4KFtYccUn/qwfUtsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJQkpzhk; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJQkpzhk"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso3176408a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788704125; x=1789308925; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NIjbz58RkaN9CyXskmjKtWIhRZijYN8x8rvjeIyidGw=;
        b=oJQkpzhkr0rxWlwVLCwKtfjoNpmzDwdYu+W19sTSY/Y1MXJnAaqJ4syx6vd+EI+Mri
         TrF3ndl2y5b+n968LWaiYdXhjCFRobt5MqT7fpIKz5PgecT9E2M4kZ85YyZ3n+SDz9Y7
         3DP1Ng8lZ3hYPc+Wb04hw0SxWaKVDeqnkM1IlJfRq42oEQx+nsFhvKHQWgt0dhG5N4CT
         OYLwVTVnbIRw/SwVC4i8OZwIWvjnDR8gQFec6+uAywkVU1R0sOIzjxoeeQXbdFpr2MgT
         XMZI+itnjJlgSd1FbD4xfhTUMZgM/kDgejrVUmd2MJQc3eD6cD8jIUqljGWNXu0/iRsr
         BiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704125; x=1789308925;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIjbz58RkaN9CyXskmjKtWIhRZijYN8x8rvjeIyidGw=;
        b=Y9dBxyidTWua0okM025bAT+fv6cze20gYO32S82WDoU1zIONRflRaEX2Q/ITmg0p+m
         hzYNX6AltgalcBL2DQ+7fGAgYgJ0RZG04d4ltT8BJfQeTRyKpMwSxFfrkk1TeccKMj2I
         RrctLGaRtQZQ9oTFafw0kKuQ+nl9jY4gCDLJhZA11WBE6+z0PgxvW6qIYfJ4WMAFEYEF
         /WyajcYN1erpM7p7RA0MeUHvoqthN3M7rIA4324BKDxcfGyXAqN5gcR+xaqjYG2ZlMpv
         N83AVFYmRUHYWhR+a7gYOgk/W9gUgbGWIpZroSf2rc61ibaJnQftBg8JioSQdhNAR7lc
         RkxA==
X-Forwarded-Encrypted: i=1; AKwUvByNL01EJ6+9TUrfV0VpNyIJAFnGTpEoVO4qkDOAf5g+bu2xJUhunY6Nspau2O5ThZK+ku29c2il1qXcGfo=@vger.kernel.org
X-Gm-Message-State: AFuF++lAZiaZJl3dCL0sNEKYictFdGpzzCyrsSL32xoiHps+nqI4NQKz
	1PMXqRrXkJyJ2Ij9JxsnS9kFHKOf0Ay2DOEMWBJJKy1/KrKH/Y4iuSG2
X-Gm-Gg: AYBFou3HofyeWePBww58ycUiHZg0yiCPVzreI9t0G9QrTkL0RNr2EW8j6BTX/PSZq/5
	3kQsYqOaA16Cx0WzqL5pmaNAXmRCzwlbwQ7uoNDJkZcbr2yTE7Jo/gyQbHpiqlZ+zf1l+WAbGRu
	iOr4O83CwvvWah2uHfcn8xkVNU9ZAa+NJEUxFFfgSiKXBS+FYfJSkIO909N5WavmPM3oChP7IU2
	sh35To9/xWytu13fJzdYYmTD7eYpWgjEj7w47TottK1KzqjhX2h70vyBs9xfvaXNfAn8DcDo9aG
	iaLgyHaLjoE5q3SdSz1u2xDCWQTxvp/K9KcDNOa3+kKbiRX6NuLhuT8p71be754HEC33YWM9a7V
	JfdMT66apGU82TT/skeBvJPkmpULCh7Yk51ImnW0jxdBez8qoySfXvvgdpy4HzStmSIm6MvMlZM
	YzPsL6uueI/86NqncXXOVC3abyo3C1yCkrrCEOKbiIcGnymvEJ6U+WfWX/FiZ2QYtrWYX0pR9If
	Ng+6f5IkASjJHG27cmuODsoL9M2NwrVFzXBK8liDUma
X-Received: by 2002:a17:90b:17d0:b0:398:9bd4:d18 with SMTP id 98e67ed59e1d1-39b26298ba1mr25491217a91.23.1788704125253;
        Sun, 06 Sep 2026 07:15:25 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433f4e845dsm2309013c88.10.2026.09.06.07.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:15:24 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>
Cc: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Runyu Xiao <runyu.xiao@seu.edu.cn>, Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH] ext4: shut down error report timer on failed mount
In-Reply-To: <20260904065648.4048108-1-runyu.xiao@seu.edu.cn>
Date: Sun, 06 Sep 2026 17:55:36 +0530
Message-ID: <o6eay3b3.ritesh.list@gmail.com>
References: <20260904065648.4048108-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Runyu Xiao <runyu.xiao@seu.edu.cn> writes:

> __ext4_fill_super() arms s_err_report when the on-disk error count is
> nonzero. If a later mount step fails, the failed-mount cleanup path uses
> timer_delete_sync() before freeing sbi.
>
> print_daily_error_info() rearms the timer when s_err_report_sec is nonzero,
> so timer_delete_sync() does not prevent the timer from being queued again.
> The rearmed callback can then access sbi after the failed mount has freed
> it.
>
> Use timer_shutdown_sync() for failed-mount cleanup. This matches the normal
> unmount path and prevents the timer from being rearmed before sbi is freed.
>

Did you hit any issue here? Sure timer_shutdown_sync() is safer variant
against a mod_timer() call by someone later, but I don't see what is the
issue here (maybe I am missing something).
I don't see why timer_delete_sync() on a failed unmount is not safe? The
mount itself has failed so there are not a lot of things which can cause
anything to trigger mod_timer() later? Do you have any example call
stack where we can hit this issue?


OTOH, I think we might have a problem in function err_report_sec_store()
though. It seems disabling the timer has a bug, since we are only
calling timer_delete_sync() there but we never make
sbi->s_err_report_sec = 0.
The comment says, 0 should disable the timer but seems it is not really
disabling it. Reading s_err_report_sec back is returning non-zero and if
we try to set the same value again - the timer is not re-started either.

	/* timeout in seconds for s_err_report; 0 disables the timer. */
	unsigned long s_err_report_sec;

Also, looking into ext4_update_super(), I think even the first error
doesn't re-arm the timer because of the wrong check.

		/*
		 * Start the daily error reporting function if it hasn't been
		 * started already and sbi->s_err_report_sec is not zero
		 */
		if (!es->s_error_count && !sbi->s_err_report_sec)
			mod_timer(&sbi->s_err_report,
					  jiffies + secs_to_jiffies(sbi->s_err_report_sec));
		le32_add_cpu(&es->s_error_count, sbi->s_add_error_count);

I guess that problem could be due to commit [1]
[1]:  d518215c2719 ("ext4: add sysfs attribute err_report_sec to control s_err_report timer")

Seems like multiple issues in there. Care to look at that path too?

-ritesh

> Fixes: 66e61a9e9504 ("ext4: Once a day, printk file system error information to dmesg")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:GPT-5
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
>  fs/ext4/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index bca0dc87d..154e00901 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -5809,7 +5809,7 @@ failed_mount8: __maybe_unused
>  	/* flush s_sb_upd_work before sbi destroy */
>  	flush_work(&sbi->s_sb_upd_work);
>  	ext4_stop_mmpd(sbi);
> -	timer_delete_sync(&sbi->s_err_report);
> +	timer_shutdown_sync(&sbi->s_err_report);
>  	ext4_group_desc_free(sbi);
>  failed_mount:
>  #if IS_ENABLED(CONFIG_UNICODE)
> -- 
> 2.34.1
