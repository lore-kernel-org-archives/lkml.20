Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EFC4B7A4B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164671; cv=none; b=U32a0JHbJL0TYaw6/xc2//87Km4dgB8rPI9cBUxzfnMc0T2CiIMjJbCu76EaNJiXnahPt+B6qyp3q1D+0p2OZd6M1SoRvlvXSINdHECJhj4GL4L5ZHJVN0BSPdE9ft1AW0CsBD9u82LiQy3YyjYohA00Fs11s8Q4x7dG02pVpBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164671; c=relaxed/simple;
	bh=uCkvrVwi9MkF5f0wk0i1rEnOLVyI8BzXTlzhW5vddes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/ReeYV3DYsSKwvcfD+1dKgzLooSMbjEx8WBhQaRRRXvw4YHEQ1DgZzGYn0IvrpoUTeorUQGxNC9kXzcs4BznkVs+MsfiKxyspDVcG4EUA0+v8U61qTEdmfO0+OXpuOoFhmtUmZypVSRLG82lzof4M8ZAW5pFIZ5qMXsD+NVAPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y2FuG1iR; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y2FuG1iR"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso4588695e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790164661; x=1790769461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FVwQjSeRV+WHLIKI+Gc/d9Xm57b6eO5AzlydiXLlru0=;
        b=Y2FuG1iRzb7lhBPVLE3Mju18cnYLrw5m3QbqDr0iQc8m44SO9qEIF+Q3CsMkjNckbc
         UyCyJsXTxiUnxAhYUKrAX+p5bfrvjNGJZL8qGON5HLDdGQcMRdHOcqOiOM06wwKbO0K6
         iUbK9ii973RkGQU5S5B6cQuL3xsf1S3xS/np+5BkMH2YAHirn3QI4RvAADW0ZGCWy4eY
         +QVZSazEeo3sS7TGEITzMdeOlDtPciQagaClPZlmzi4iaPYyD9k4e/OzSSfGKYbXwVdX
         Baxg42q7EaMg6fk2DvyU468g+R8I8vRkqAqcsR+O9hkyduf7tDieEsG9ovXXoWRSgX+M
         OAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164661; x=1790769461;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FVwQjSeRV+WHLIKI+Gc/d9Xm57b6eO5AzlydiXLlru0=;
        b=ac0urt7+Tjjv/MwiX1bgexWVumzPdyNScKPF0HY47RqFeFaFNraOiUcikkJpfKHJzz
         5AbHqKIvjDNv7ZDQpGoeclmHebsaHJzZQLAMcEZjAl8zPV7IBwbXrQxfEuZgPy4ltHCZ
         VFw7Ng6X2+vbetpOsjN96jgYved+htb8JztEjMc/WlQO+2O0NyPf0ew5YxU6NfB5z9jr
         R4j9XhnZsXzgwSZKu8FhKyafEFM3Jf7/qs7zLoSOYlIN0EddHnWA4YbpcOGH2EFcFwGk
         vA8SozjroiC2DqsAIMRNfUwLedIJDdO/faPII0q85jewcwc3oi9h1RrcjgBTiiNeFYV8
         fZ1g==
X-Forwarded-Encrypted: i=1; AKwUvBz9wIFy878cwNMUEfWHrT0bhIiF5AcuSd8dH5OA2x3FKVTJklNbe8200TlGC5P48wLeRgE/Y6tlu7LqeV0=@vger.kernel.org
X-Gm-Message-State: AFuF++ksvXHWtadw2mVMuqdv4fcNYM3rfQve22CsK4WQCrqM4lbcjVkC
	MBexovpRMNapQPFSKAVSnJbZxn6tsonQZ62bo6GzCifvXPAomHQvDwZH8GBEChJCS+g=
X-Gm-Gg: AYBFou2ldcS8cqobqwLLp/gmP3zmLeTpW6ktLskT8RKBhfnsmLp5e7+XGPEfuls6wXF
	FmNeHGC1G4siIJj4uxbngdJO0eWJbtldlREEq2nsNIRVlIFh+x5cQ3J/1RZ1rTIED24ckDs4p8W
	WGGwNVQhtywRKvKHZo/ZOcdoSPm0ZRPWEPIH9SNpBGEXKobv7ZPBy66CFMMR1QwtX+CRDB7fKCH
	sWeJ/+V1DInaFMNcKXXZiPssN0KlSQHIvqWvO7I1Cvh2D49rhN14DrljKcRH7/JBlxIoWmTTd7h
	6V9DbeLAa2046AO7TbKkTFjra6ozdIyuhhcZ+fX1QqZOBRhNVOA5CSts7EoZwzLqT1JHljLWlle
	272QHtzLpYdfrbtF9NcqMxedNGS37Gajpf/25HwGp1+iG0DBVIX5/h1wnVn5fOlx/XNnh2guThZ
	/2edQL9bEH/QNevybITCJjGk+G/1xUL7mxHwMP7/WMoiew7Eh7lny8sW9cNlfJbdrA7oBQCLgY+
	R1utM9SuqeXYig=
X-Received: by 2002:a05:600c:8489:b0:49e:73e7:888c with SMTP id 5b1f17b1804b1-49fdee0b7e7mr30673975e9.4.1790164661458;
        Wed, 23 Sep 2026 04:57:41 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe1432362sm30595675e9.1.2026.09.23.04.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:57:40 -0700 (PDT)
Date: Wed, 23 Sep 2026 13:57:38 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: John Ogness <john.ogness@linutronix.de>, linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] printk: fix wrong number of CPUs required to increase
 the ring buffer
Message-ID: <arO-ssiDvVjJ7TIn@pathway.suse.cz>
References: <20260921163828.111061-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921163828.111061-1-ekffu200098@gmail.com>

On Tue 2026-09-22 01:38:27, Sang-Heon Jeon wrote:
> The default LOG_BUF_SHIFT is 17, which means 128 KB, and
> LOG_CPU_MAX_BUF_SHIFT is 12, which means 4 KB per CPU.
> 
> By default the ring buffer is increased when
> (num_possible_cpus() - 1) * 4 KB > 64 KB, which requires 18 or more CPUs.

Good catch!

> Fix the wrong comment and help text.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  init/Kconfig           | 2 +-
>  kernel/printk/printk.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 60448fd4ee12..446cbb59a43b 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -843,7 +843,7 @@ config LOG_CPU_MAX_BUF_SHIFT
>  	  with more CPUs. Therefore this value is used only when the sum of
>  	  contributions is greater than the half of the default kernel ring
>  	  buffer as defined by LOG_BUF_SHIFT. The default values are set
> -	  so that more than 16 CPUs are needed to trigger the allocation.
> +	  so that 18 or more CPUs are needed to trigger the allocation.

The number 18 is pretty ugly. It was supposed to be a power of 2.
I would prefer to fix the computation instead.
>  
>  	  Also this option is ignored when "log_buf_len" kernel parameter is
>  	  used as it forces an exact (power of two) size of the ring buffer.
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 00f8e1291564..c7d961256c88 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -1087,7 +1087,7 @@ static void __init log_buf_add_cpu(void)
>  
>  	cpu_extra = (num_possible_cpus() - 1) * __LOG_CPU_MAX_BUF_LEN;

If we remove the minus one:

	cpu_extra = num_possible_cpus() * __LOG_CPU_MAX_BUF_LEN;

The it should be > 16 and we could keep init/Kconfig as is.

> -	/* by default this will only continue through for large > 64 CPUs */
> +	/* by default this will only continue through for 18 or more CPUs */

Right, this should be > 16 with the current defaults.

>  	if (cpu_extra <= __LOG_BUF_LEN / 2)
>  		return;

Would you like to prepare v2?

Best Regards,
Petr
