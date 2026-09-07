Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3843488230
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783782; cv=none; b=XeXsPRATbPObnD2kUCUPkfhiX4+X7denbdQUHDaWU//vTTwIEvJX70yeZfDlxk6z0uHs9/yql8VavfT0UDsbWNyxZRmw2jqcJTI+Z2DIvLa047IX6ey7uK15FkalL+/q6tI5lbifnBz1mWSknCY1sY8ZKa0icJQL2shy8yiZEXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783782; c=relaxed/simple;
	bh=wD7hNYzuesfYZ3a9lzYzQIuZlfewTarfn2KBcPZgwTU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=nJctXbZaTYuxYpVz6zAur4IN41v/lzrDnYkFMHJCE42OoqDkmeZjNLh8nSBHsnnIm3MaBqHmXj/hunGbMQmpzNPGQks5v/NTXLbkJqDjcSGVIN+No1e6QT8jp3GtctBPBINXX3rPKmcAG6/nVZAo3JOTldgzZEpE0LHoeZkYMvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-48e5de5a23cso3910051b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783780; x=1789388580;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xOrGxREelxsmhNeTG+ebfXctb2in/gNe4dzt8yqbBZ4=;
        b=iDnpzxgqXbIyxaVu2oNXX5hpnvhr2u7FNV9V8Gr7UHSRoINQB/5ChnakCHYH8xwBM+
         FgY/DDnEx1TObgWtrrBQc6/iptO+cmDY5Wyvr+T9SJBwHMi2kxJC7pFqiVp/B1nT1GUS
         PbiGwu+FnU8GVrbgKYRUQo7p7F7Vg/dkC3of32khFxhBymaSBaGek9cmythT4JnIE96d
         8Bs2W6oLcS1UEk/fPKeJ7Tk9yWyMV+rddIV5lPG2HZw/wqeubdmF5ORw4wP8/3qjzA/i
         1MvqR5tupFt8s4Xdu/8NWqS9Fih6Q9L60IrXOOZlhUJggq66J0PnPXIPaoeertp59sHG
         oo0A==
X-Forwarded-Encrypted: i=1; AKwUvBzGZDZ3v1cW3azSQGq6cMrlvzciygn2ZQCv7zimJdZ8baEno1VAfNw18RgiR3X0wO848nWunXwRAl/rCSM=@vger.kernel.org
X-Gm-Message-State: AFuF++mkRQkpdiGblt9CF5kxHB9x0k+NeK5CDvc4j9Cmky28vi1F9/Ys
	8tIVW/D2M1WsFsNthsIHaxApxSHLg6XbXTTs+aHoG+rjJveefZuQYnv9bM9O5OcD3F8SBpInyea
	8bL0ZBmX7HaFdNNrw6hcSh97rEmKL8X8yPbAdMBp7A8+b38TbUBUOXXjDiFU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:168f:b0:6b0:4199:3cc4 with SMTP id
 006d021491bc7-6b6fea84e5dmr17966430eaf.27.1788783779886; Mon, 07 Sep 2026
 05:22:59 -0700 (PDT)
Date: Mon, 07 Sep 2026 05:22:59 -0700
In-Reply-To: <20260907122254.617709-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9eaca3.2bb5a69c.24b23c.0000.GAE@google.com>
Subject: Re: [PATCH] mmc: vub300: fix use-after-free in vub300_delete()
From: syzbot <syzbot+f312381a95cc080992fd@syzkaller.appspotmail.com>
To: adrianox@gmail.com
Cc: adrianox@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

This crash does not have a reproducer. I cannot test it.

> mmc_free_host() drops the last reference to the mmc_host, which causes
> mmc_host_classdev_release() to run. That release dereferences
> host->parent->of_node, and host->parent points at the parent usb_device.
>
> vub300_delete() currently calls usb_put_dev() before mmc_free_host(), so
> the usb_device is freed while mmc_host_classdev_release() is still
> reading it, leading to a slab use-after-free.
>
> Save the usb_device pointer and release the mmc host before dropping the
> last usb device reference. The probe-error path (err_free_host) already
> does this; apply the same ordering here.
>
> Fixes: 8f4d20a71022 ("mmc: vub300: fix use-after-free on disconnect")
> ---
>  drivers/mmc/host/vub300.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
> index 2dae474dcd06..5000f694cb0e 100644
> --- a/drivers/mmc/host/vub300.c
> +++ b/drivers/mmc/host/vub300.c
> @@ -370,13 +370,14 @@ static void vub300_delete(struct kref *kref)
>  {				/* kref callback - softirq */
>  	struct vub300_mmc_host *vub300 = kref_to_vub300_mmc_host(kref);
>  	struct mmc_host *mmc = vub300->mmc;
> +	struct usb_device *udev = vub300->udev;
>  
>  	usb_free_urb(vub300->command_out_urb);
>  	vub300->command_out_urb = NULL;
>  	usb_free_urb(vub300->command_res_urb);
>  	vub300->command_res_urb = NULL;
> -	usb_put_dev(vub300->udev);
>  	mmc_free_host(mmc);
> +	usb_put_dev(udev);
>  	/*
>  	 * and hence also frees vub300
>  	 * which is contained at the end of struct mmc
> -- 
> 2.51.0
>
