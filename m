Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6958641DED5
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 22:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791154351; cv=none; b=igqQD8pA3y4/wEThnjlgtfTzd3ygwr+FgJ4jc2FdAwtTTc75vmqpRFASf+MGMfDujCQV7+9Rd9hpmZQez47/nneGWEitRonmIXelWwfL3Unoz+wc99C2GbXNxjMqlnp026hzNPZdEMsQSsSNqIMjq/7HB2T90fxwrw0an75J6dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791154351; c=relaxed/simple;
	bh=iUX0rypZ3xf/SH5sB9G6Uz8fWv/TVGB7aC4y+ZSUuCw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=P8txiw/Q10dt35FILdD9X8XnV6so6iYqtt8xa2Rp1kNGjtidlpre7F6gayiWhugszAOi3I7tVm836mo2SPqzzVC5jT9lebqw2/8DW1ZnYKHC/YWQaRg7CvcsiqSdu/95jvAehbuixBSExlEfYb9KOLyG7JKDFw24/3rxZTifiVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuWq2JBk; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuWq2JBk"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e50968489so801903d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 15:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791154346; x=1791759146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gNU7QFwaNW3Vr4qAV6/bo1RjIhjs4Gw/kzl9KhJGzgc=;
        b=KuWq2JBkOPCrGTA1X+rVWsaQAmyqI80WIIJu6WmBeGPlCwwd8aeX+Ziv0gENeCQyKs
         UGHRlCC+ZBuDZ0guPAYc6GXacXdznZvAxSmbfW5gwoW3TYT5Tys4eHSC9yqKabxc/xYP
         Le/wsg8zwNXmxGf8CS9pH1kjFXO4Svr5GKoDk56CWN0ae2gGmGNRLmHJtwdIorSC7VrT
         N6mnCpRPynClAlODHCki11v9hx8oFuHZJkRlgQdm+t47Dq9obmZjx1ePuOSW92UqRe9i
         AxswocPnBg5QMVHgk8/H9fR7aKwTD+rjTl6q9KhsK+rG4dRkdWjPmaWXRGUd6f2ApAe2
         ZtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791154346; x=1791759146;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNU7QFwaNW3Vr4qAV6/bo1RjIhjs4Gw/kzl9KhJGzgc=;
        b=bNsSGiEY+RrCjnCC7YP4BnylTansTpX/h8MdZGQ1Jne0nX/XepPWGslG0nnljQw5gV
         BbxjatEas/XWn5x8eKUSriC0nhfWbSaBHrf/FDMPUfV9ViPZSHI2uy8k/Z0AbhPnd12u
         FIfASA1RltqZCcknjFG8Y9wVEL8FTPoiXHOBN+wgcvsi6LY8sk82VZMfcnwuKBYmFyP6
         kP84c3pSxRCa9MUaLP/3B4LJztxst/oPTx0zgMX96uEGBfvau6niBi9U2OLSLWxA+zYL
         Pnh+gLrsVYbbT80mVSSVH38eHBJ0ZT6nc1mJ2IRjPa5ucmd7FPkeZ9A3NqS3B7ZXP0ps
         IB6Q==
X-Forwarded-Encrypted: i=1; AKwUvByuG0rl3d9TNTi2w2klfroZVCqToDcEG3ig3asZDjvPEZcXdlYDvQne3t0ua6dJG5JYm0TRtQWV9S63I+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMbCEXsQiP9/h0lVPAY9g1a4IZVU4VrtOOhPAqQ/X3ZE+pcj53
	BEJ8qQzVTyhQQFpmNpNeVAmi/ghQyyojd9ntXQFD5QIB6CQERFvVtKFg
X-Gm-Gg: AYBFou0BpknfPVqMLx/IsHTqvyq4z+L4eMJ3mqfEBazXDnlAocrwRXnYs9IWyKuL10I
	5l2Un5G0r2p4uZwnsR50PMBi7SlGsRNI7FvzHStTc5ktbBWCp94AvJDC139CfM8GA6A0M7k9hQw
	aM0+vF0pUI0l6KJ9hAbWgOJWvg+BcThcIwXkE7uNtVBHLs3M/Wv+qLM5adOdmQniGqC7711RuEm
	hY9O13Vs8tFMbV0eLMBugsCVMnWUCdisILAcS3JT7/exM+mGiDmgWho0os/Jggng8Ucdz5RQjNk
	S/LDj6mRvK2aeB1PqbCQjEApSpxAVDeoD94/t5xzzkd+/eveA+XEy0B+L4NKm7dUlg6ttNO5Rgq
	oJdQrIG5kY2WumuJe9lHzlZm6t2r+6fj7Rc+67sudQq2M7l1nydalNXOZZkkF+bSpcscA4f8awk
	yNiItFeg/lTnj0AkQWwCRfc+Nt63BCm1AgbUKuT2b2W9BXwiLhAnUmU+gOoRvVnWKMwDFwCzvli
	WBQUcKA7DinscMY3awZiJzuyDqQ7ok4Jda1f4X6e9Lgc3EURnPG
X-Received: by 2002:a53:ac88:0:b0:677:c369:ff5b with SMTP id 956f58d0204a3-677c369ffafmr1639953d50.63.1791154346051;
        Sun, 04 Oct 2026 15:52:26 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1baf25bsm2314865d50.14.2026.10.04.15.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 15:52:25 -0700 (PDT)
Date: Sun, 04 Oct 2026 18:52:24 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Umang Pokhriyal <umangpokhriyall@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.3720fccc8b4e4@gmail.com>
In-Reply-To: <20261004174739.36179-1-umangpokhriyall@gmail.com>
References: <20261004174739.36179-1-umangpokhriyall@gmail.com>
Subject: Re: [PATCH net-next v2] tap: report IFF_DETACH_QUEUE in TUNGETIFF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Umang Pokhriyal wrote:
> tun sets IFF_DETACH_QUEUE in the flags returned by TUNGETIFF when the
> queue is detached, since commit 3d407a80b62f ("tun: Report whether the
> queue is attached or not"). tap does not, so userspace cannot tell a
> detached macvtap or ipvtap queue from an attached one.
> 
> Cloud Hypervisor ran into this when checking queue state on macvtap.
> 
> Report the flag from q->enabled, as tun does. Unlike tun, tap accepts
> TUNSETIFF on a bound fd, so ignore IFF_DETACH_QUEUE there to keep
> writing the TUNGETIFF flags back working.
> 
> Assisted-by: LLM
> Signed-off-by: Umang Pokhriyal <umangpokhriyall@gmail.com>
> ---
> 
> Notes:
>     v2:
>       - ignore IFF_DETACH_QUEUE in TUNSETIFF so the TUNGETIFF flags can be
>         written back, and describe the change as parity with tun (Sashiko)
>       - drop Willem's Reviewed-by because of the new TUNSETIFF hunk
>     v1: https://lore.kernel.org/netdev/20260929142238.41742-1-umangpokhriyall@gmail.com/
> 
>  drivers/net/tap.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/tap.c b/drivers/net/tap.c
> index ff67d99deb39e..832439b8a8988 100644
> --- a/drivers/net/tap.c
> +++ b/drivers/net/tap.c
> @@ -932,6 +932,9 @@ static long tap_ioctl(struct file *file, unsigned int cmd,
>  		if (get_user(u, &ifr->ifr_flags))
>  			return -EFAULT;
>  
> +		/* TUNGETIFF may report IFF_DETACH_QUEUE, ignore it here */
> +		u &= ~IFF_DETACH_QUEUE;
> +

I suppose we want tap to expose this state through TUNGETIFF, like tun,
because applications already use that?

Else cleaner than working around bits would be a whole new TUNGETQUEUE
call to match TUNSETQUEUE. Rather than to squish this into TUNGETIFF,
while that has no equivalent in TUNSETIFF.

But, that approach does not help existing applications.

So this is probably the right way. Just want to quickly check.

>  		ret = 0;
>  		if ((u & ~TAP_IFFEATURES) != (IFF_NO_PI | IFF_TAP))
>  			ret = -EINVAL;
> @@ -950,6 +953,8 @@ static long tap_ioctl(struct file *file, unsigned int cmd,
>  
>  		ret = 0;
>  		u = q->flags;
> +		if (!q->enabled)
> +			u |= IFF_DETACH_QUEUE;
>  		if (copy_to_user(&ifr->ifr_name, tap->dev->name, IFNAMSIZ) ||
>  		    put_user(u, &ifr->ifr_flags))
>  			ret = -EFAULT;
> 
> base-commit: cfb7793d1bc0f7d90571611979654cf1b3886b29
> -- 
> 2.53.0
> 


