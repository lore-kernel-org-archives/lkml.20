Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793546136;
	b=oXuQ7pj1jpMn2e+chCDuejeokLJQPY07lL7eRHL6xSp+D7livnBE7dQpFlQbmHyoBPhg
	 YRRvWBfHTXD7SZgV+rGpHTDrcP2kdy12YOxwucBAfgW6BoNTf4eQfzwL2iAsvVBHeDEKp
	 LLaMgZXYH1tX4+rPV8IcZhb6l5vcrJv4Eh0KajZzoYvy9SxtZeMKFkBaF5lxTQtQ1Y5oV
	 r7eg8R0uhCugKdCDOQAcWhA9Ek0k3orP/qi7QYeakzxUez3FmTsnkkA+wXWUH6olO/kKr
	 ETV1UDBYu4IIkSLYrYLbWAALzbnE1407ZeKOKaS39mzZHfula9h1XE3jd+lgHUTUQOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793546136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=utqb4frQ+ZA9/jToYadcpGuhd2odxNlrVG2GVdoU/3k=;
	b=jc+H144ssNDmShbPSPzwcC6rrdFM93ma8UKUBLKfbZIqoqV/5XXAA3ypkpm4i/F3qFi1
	 8Crs7VPU2URGSLVvAhxtoqfqVYGYuy7NoxUN6FR5WKfXPdBWLcyMGAMpPWK0nDvhd/z3o
	 tMtl+jrDwXI0agmGBn7hAJy0qCvTgnFVDS/ox16aUxkHgWsIZgccW8ZxJYBdE2mSyiIXh
	 gjZzy7dlmmnIUrANUKSLC3DLnOEXokT0osF9CFLryjbnSk9M+xXbwHVF9/0kX2YQDVxfM
	 T62N3/v5hZbCPxoKmysba+csoKFSMrJbBnTbuA9Tc21gEXcCF98geLETmmnCrmqPbuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=JTnZuDQF;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717E7606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 717E7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=JTnZuDQF
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-353804b591eso3878562eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1793546135; x=1794150935; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=utqb4frQ+ZA9/jToYadcpGuhd2odxNlrVG2GVdoU/3k=;
        b=JTnZuDQFRWYbN1jN5TZjOgt8lOcGxgkUBL31g6P7eI8HeXA5eBIYxuigshBHMbxkis
         TvkGAFtQwQ3PGnMnIvSgDE3/0Yahw5a8VdqpdKNiM6j+mrZi2ZJseLIm6nk03kcO6re6
         JTX8zmjnOUngskPmuxhpxe3cJI9dVzOqnYTU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793546135; x=1794150935;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=utqb4frQ+ZA9/jToYadcpGuhd2odxNlrVG2GVdoU/3k=;
        b=Umi2nUhVTIJolseplJKzy/dbweGgOcfCdGmAR6e+CWZu5ngGNwarPcLB+FlKOs3VPx
         XKERaVNH8ZUX75Gsq3psQTbdtZa8lBeHSPaiLI+Db2zvzjiyUvdXgCH8cOR9QX9ap3Pe
         DArV2g3n0knLoCranuPrqym0WonW3OMAn2OUhN0yzwQTKD0d9bIrh2hmRHAgnndQlopD
         MpjZgzVAlQUHCLi6CNBdTzHPcNcJEpzhkW+Jrf6xptRAEGwhizdAtg0BEtFSPenNLwIN
         qc6Mu6s5lYYtFf9lrC4y+DCaTIIJHqTC+y7Kcs8z2rVVkJeDbHzgpCXYGKGrCDYY02Dh
         IUKQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9lFj13nyxkylHA5RH1XNR6pLa21IuztWutqjO/snorF0FD22r0ZzEeaqhWAXKDfjTIW1JEpHUvrR8z40=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3LWJq97RrVG5G+3CfJ5ucjR74xFiGqs6bPgBkKb7ugjGE8NNN
	zSwaBzEL1kDxox/ukgb9PUyXsaD0bA9f596vkaSbTpLCQqTrZTalovLcso8g7tDrAY4=
X-Gm-Gg: AYBFou0+k28LE0wWasUvScDpXGjJZADgk+KsM/cERSGcNmjt4jnyeThbmBAgtR6J4uY
	zd3cmp8+HcHpiY05b158ClT8rE0mMppAuLQjfIPu0QepKc1QPOcreiFQb/1xSXxj4sCJwrkiMo7
	iD0pmaNpkyTAm4Dcp3M1XKLxX+9XsLJ7nm54seFvaSbkQKt26Z9Im+oIRBYI3PTDwuOOVsTXYDe
	BzLqOwhkIFXHGTj00uLT7RBZoB6l1Exb4K7BeKJpLX1NRnPxw3B4+3mehDJ4GLeZucdcem6R9Ki
	sbEUiLsp0JXUbjMHSvRqOxKPNNDo6L6KpGAyF9uc/P/tOa4PkTGC9s6+Xot6CSkAOhL9OpDCzpv
	V6yQGX0gjiq84I3BLbW0LltsCUqNUU2JlmqunENgHEPXAb5dP6Uqbbby3UInv7O9bGVQbY12BL4
	G50dOjD5sTItYi0SFMFihIohCFuo2a43C7oVkzTTxHhbY+xvRjcb0musjfMJgoQex2GHT8HIL+w
	x4j5jvm0TjBy6eN23itr4cD6eCcsfeRvRHh38rcdvAsuSBDDVPbvKXwtRGvaa6WoVlLpTJqNqxz
	dCXLaYkCZvkTy04uxKdIZ18zMbu5XA==
X-Received: by 2002:a05:7301:d594:b0:36a:16b1:3f25 with SMTP id 5a478bee46e88-36a42225ab2mr11543085eec.5.1793546135084;
        Sun, 01 Nov 2026 07:15:35 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm29688302eec.7.2026.11.01.07.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:15:34 -0800 (PST)
Date: Mon, 2 Nov 2026 00:15:02 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Gyeyoung Baek <gye976@gmail.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] accel/rocket: Report per-core engine usage through fdinfo
Message-ID: <audXArQ4P3Zz48E0@rock-5b-plus>
References: <20261031083642.1076356-1-sidong.yang@furiosa.ai>
 <CAKbEznsRK68w=qimTHifgDhD_Roi4eg2NrBYu+r6foYRZv1ePw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKbEznsRK68w=qimTHifgDhD_Roi4eg2NrBYu+r6foYRZv1ePw@mail.gmail.com>

On Sun, Nov 01, 2026 at 08:55:15PM +0900, Gyeyoung Baek wrote:
> Hi Sidong,
> 
> > If userspace (for example systemd-udevd reacting to the drm_dev_register()
> > uevent, or a client opening the device while remaining cores are still probing
> > or deferred) calls rocket_open() before all cores have finished probing,
> > rocket_priv->engine_usage is allocated with the smaller rdev->num_cores count
> > at that moment. Once the remaining cores finish probing and increment
> > rdev->num_cores, calling rocket_show_fdinfo() will iterate up to the new
> > rdev->num_cores and read past the end of elapsed_ns[].
> >
> > Similarly, if a lower-indexed core is unbound via rocket_remove(),
> > rdev->num_cores is decremented while higher-indexed cores retain their
> > original core->index. If a file is opened afterwards, rocket_job_handle_irq()
> > indexing engine_usage->elapsed_ns[core->index] can also write out of bounds:
> >
> 
> I reproduced the OOB access sashiko reported.
> I used `driver_override` to keep core1 and core2 from
> binding, so only core0 had been probed when the file was opened:
> 
>   BUG: KASAN: slab-out-of-bounds in rocket_show_fdinfo+0xac/0x120 [rocket]
>   Read of size 8 at addr ffff00000242b230 by task grep/461
> 
>   Hardware name: Radxa ROCK 5B (DT)
>   Call trace:
>    rocket_show_fdinfo+0xac/0x120 [rocket]
>    drm_show_fdinfo+0x218/0x2a8 [drm]
>    seq_show+0x340/0x648
>    seq_read_iter+0x318/0x9d8
>    vfs_read+0x220/0x6a8
>    ksys_read+0x108/0x1f8
>    ...
> 
>   Allocated by task 444 on cpu 5 at 79.841431s:
>    __kmalloc_noprof+0x2d0/0x740
>    rocket_open+0xb4/0x468 [rocket]
>    drm_file_alloc+0x37c/0x568 [drm]
>    drm_open_helper+0x110/0x2a8 [drm]
>    accel_open+0xc4/0x1c0 [drm]
>    ...
> 
> > drivers/accel/rocket/rocket_job.c:rocket_job_handle_irq() {
> >         ...
> >         core->in_flight_job->engine_usage->elapsed_ns[core->index] +=
> >                 local_clock() - core->in_flight_job->start_ns;
> >         ...
> > }
> >
> > Would it make sense to record the total core count allocated for rdev->cores
> > in rocket_device_init() (or store the allocated array length in struct
> > rocket_engine_usage) so that the allocation size and bounds stay consistent?
> >
> 
> `num_cores` is used with two different meanings:
> 
>   1. in rocket_device_init(): the number of core nodes in the DT
>          (the size of the cores[] allocation)
>   2. rdev->num_cores: the number of cores currently bound
> 
> This patch uses (2) where (1) is needed. How about storing (1) in a
> new member (e.g. max_cores), as sashiko suggested, and using it instead?

Hi Gyeyoung,

Thanks for reproducing it. You're right.
I'll send v2 with max_cores as you suggested.

Thanks,
Sidong
> 
> > --
> > Sashiko AI review · https://sashiko.dev/#/patchset/20261031083642.1076356-1-sidong.yang@furiosa.ai?part=1
> 
> 
> --
> Thanks,
> Gyeyoung
