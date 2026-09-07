Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A3A442B1D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783941; cv=none; b=Ivo9VdKUC2JZNj/3vLbTYI8lcyRHenRChP6zMMrOQxvsXq4yYQm7JH14XrH/pOdPjYOlHFKaLIcZIa9qd7W7gg/voE+T08/WEYZZG/2vSj6U7SSUP3lbFGjWM8Kkfly5Y/VlgesYBpimFQDE0ioTPz+sOZlW6Ok/bVZMJLxPlG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783941; c=relaxed/simple;
	bh=Ib3Us9jDp7gOb7Ezv5hc90Km3gIUaftgYZt/6DT0sCo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=UOpruAJDvTRicGU7SrsF4ny85lXE/58/F+qURfuioAjkdB94lBs8mZkqiXfea+e2mrZ4D6tbu3S7cgVpQqB/VVPhnmTzqfUZyQ+VapLgPHxtz1ohuuib392no8wYwr83cY8ROE42O1Fo6YekcAj7kg1AwcBKsJGRxKOecpulV5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28dafb8e1so4732677b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783939; x=1789388739;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+/8X7/aJH9Rxs8JACpoPDVAwbu8DBz8/zZ6qIpJzJ04=;
        b=rqi2b/aL8sY/21aoEldKjwlvlf3QZS0jnVnYIaeiUor+UAV+vvlHkqFiBfdNcEjeUl
         YV6s0d+PTKc17k+v2i3NeEdtPgmueM9O0Ti0neU29lMEuBTl/tQYm6ZG7OfArSgywQsO
         M+univrtDPlVDVX4AkLusO7JfKIslYeeLD7BAA9q03gabcvyTyKnNRhlyGvUiRWFX75i
         Vx5wzsPWBSDzaA9A/XzNGd/owpYOfPFF7/cI5kWWRFot0PJBO8ri6CL8Rc/sjk36v4hk
         jlMIK35MNTSW9IncRTqFyKlaZq6czarEcInlYCAsXsYbxTDJP+DzulFR6NojTi4KVwBB
         V6cw==
X-Forwarded-Encrypted: i=1; AKwUvByaaaBPGKZQGNbgkutQDXv7DgBtTB91OVCBlqyAaImZtqo6jJTooL2oeUxPVJm2f1wT4m8A+/RPl6AXOXs=@vger.kernel.org
X-Gm-Message-State: AFuF++lSr3C7srI6UIaSQeWpJYe10dMWFrDEwWURRpoDY8u3jOH942T4
	kG0KJBzRCS85+3CjtwzF+PYKHIR/D4uMDpkNYjVAO2AT3Dd27BxQiKSm8pPyprw1oaB/OMrZjdD
	oJTJHzKQMltNCiuVt4zqdmQDYYrOXJmHfsOCN0jCltgsw7tvvaCJmz+/0EYg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:67c4:b0:4b9:a8ac:47f with SMTP id
 5614622812f47-4b9a8bb6acfmr11759371b6e.29.1788783938960; Mon, 07 Sep 2026
 05:25:38 -0700 (PDT)
Date: Mon, 07 Sep 2026 05:25:38 -0700
In-Reply-To: <20260907122534.618443-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9ead42.b223f61b.7f796.0000.GAE@google.com>
Subject: Re: [PATCH] mmc: vub300: fix use-after-free in vub300_delete()
From: syzbot <syzbot+f312381a95cc080992fd@syzkaller.appspotmail.com>
To: adrianox@gmail.com
Cc: adrianox@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing

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
