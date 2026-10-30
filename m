Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371025;
	b=dNCTQskoGyxA0xRd0lhvSRV2LCvzyk1q1aVlBkvl25q4bI/dtHVkL/Ol+g4WQhxJNYLz
	 hp5HI21XA8lGMr2A1kwU8dK/7svRNrnBj7/lg90I1WUOZWeY0ZkJrJfq2mZCa/fpKfXNe
	 GU5NK51N5RhLJcjV4eI4EHcjtyfrna6nOstgiuwzjNtMayabB3zGbUY1inRysP6DJ2frB
	 8oar4mPoabQ39HXOplrK4r57XosPoM363wSqtVFp8m1w+M+RIrbA9BUElrKGGNhjSoSJl
	 fd9ZRw3svwRI1yS/thCHe7m791/yOy27v0mjxFh4rt7JHN475UHKqapFhIqFoYw3gkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iBxXvBbGe44Ze49Uw14IuF3fOKhR7Jc9p6+rhpDhzQ4=;
	b=2Jej9KgMORyeO9ZBK6gWiBnyjZ9ZyZ3UV96cRPyzh8VlfVNhhGPea55Ql7c9S6VYiqMo
	 vFA0x7fWfTSkGLEk4iOOP1g8NoyMYHWxeuIL10bLcoP4GmaKeWqIQuc+uRbYl3xVssEyo
	 4m83LEshDXE4c8XizU//PKmh+3mAH2YaRf6+C8yO8qlHoHajnN6aCVoUtkw0CJEwx91S2
	 1R7ShkWNKpf5KuT9JGV7miMHlgHeE3ygcDojg0QCeO703uMxi0tUD/LZIsxS9BxdW2qMZ
	 ydCR80YRph8HxdGrYtrdHFXIgwuG7ru91vVe1umXgMmR4x7ztzwk7Hqm8ZSs4g5BwUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=j7DcKTU4;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2091F606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2091F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=j7DcKTU4
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91c719669a8so8453926d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793371024; x=1793975824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iBxXvBbGe44Ze49Uw14IuF3fOKhR7Jc9p6+rhpDhzQ4=;
        b=j7DcKTU4CGu/2fywHpXKP+CPwy/2IY3Erylg8cTykocuHHzU4ofjl1vHMUoIAcAqcl
         JWdxgoSwfQJfc1PznTFE61KRYj+DUzqFuBSS1hBLa7vHifd47kWsrl1XuCvCMBaVWuUV
         Ob8xR9cHpSVQ3irmX0soLlmO9sK0VfjjWrhdg4pyTS5i3PBVN7hXLJQGXGbyHeUcyRvQ
         zRYy+ZEtA0s9AtYTHxn7yAF8c9RvFI6VLnijt5g4BszNrtY8zap9VLUDFxNZPNs3TPAH
         XtMr1BdGmeEiDrNAUftw739BilYfSBihnUu40Ddyx+geSFsHzCPJEthM+70gbamFNMDT
         /IoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371024; x=1793975824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBxXvBbGe44Ze49Uw14IuF3fOKhR7Jc9p6+rhpDhzQ4=;
        b=PoIewL8dmafkQKlXJLLeXDFS3DlOV7e1gpvMRBgVcNpQirPTqptzzDeZvGD0aWxJzI
         sRBl2jJaTOoQ3d+tcLppNGBDaOuSZSJ0HSA3pJwRKuuz+OaCgAe3slw4S8j70GVfgRFF
         xi3vRpikKDkdK9ssehsNzE8v5lcRzOsrEHMw0zDlmApybu4sedKIHznmRkhZWfO9rQ34
         lGzvdE/mUDgo1uMCUl47vGpybIEtbZhz6lrQUyUtqo+qeiE0J34OHwycjB/18tEVTy9T
         SI4fgkvkrX4kvUzHkS40Er+Hliuux9GJaztVSASQ4RUuWp96gLLNlZhObljAuiNt6GBr
         waLA==
X-Forwarded-Encrypted: i=1; AKwUvByp+9MYQYyrmqxEuDAprk83W2aXT/97jYM9HO88+skXch0aoY7CIxs3jR5pxLSHjiu6XzfUsuPpGJ/W6fQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLc/ImyyLu958RWe6xjvvANKt5Yl6Gjt0iBJNiAN65tMODjB4I+
	GKBN9UAJhUPiUmxWpeKy27r9C9bBilEYKdn0AiHWfA6m+07YbpK++2/THNhOBT/4ww==
X-Gm-Gg: AYBFou1YKcKJlLg6RGS7LImtyjSBrxkJwYOwhagKpZ36QBPoKv2rFT/iDebngYElTqv
	ePAEZXHbJHcnOYcjOOrHdqupNKvD/AXSbntdWtPlKp29bzusmCylWtAvmogsmLvi+sE39UUSD1N
	LC7Yid8qwsE42CZqZEiXkOnWrHUU87G2QS4wkVC6r9iog8pp6zBvbLaW9VI8Cbj3miPoJBFET6S
	Si3PIf0ieNrUQOZsbxPkMBhA5vKX7GmvZvWIA3Cbwx268qP+i6/KssjBqroZHAlaHr60kkPVYVl
	HxDD1X9hwED+0c+7M8fnH/JS4Y9rTqB5thMQx57KU1jRMNG5O9/DDAktxGru/ncGbfeKY0AvNZl
	8xEYTP8F/jasLahl0S0HyEJ1N9P4x2WSxb7gUPgTT7yREu2y0a1Vl0nSWSO2wZ0GDGF5bcz6t0L
	22sI0B1Ap/lLmGpuOuOmj5qMYxkoiv9eFKjaiYS9hU2aVnlr4rhgNj82A3eL6JeVQK075SPFo+4
	r0Mr/JW/SupnJ4jBHwIqNxKrI4A+5kJ5RgMgxNhDcSfzSGjILfJ9X9IpqnpfIqJbYHWL4SYTnO1
	WtL5nkG8UJlEU+SvW+TsoafvHOfKyxvwKaqNnJedLPP4ssSj98A=
X-Received: by 2002:a05:6214:d81:b0:91b:934f:d417 with SMTP id 6a1803df08f44-91ca4b84688mr37485346d6.55.1793371023779;
        Fri, 30 Oct 2026 07:37:03 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca8071408sm16643346d6.40.2026.10.30.07.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:37:02 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:37:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: hcd: Cancel BH giveback works on removal
Message-ID: <138f4b10-bb28-43e4-a131-c956f282b525@rowland.harvard.edu>
References: <20261030072129.40d0d89c.michal.pecio@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030072129.40d0d89c.michal.pecio@gmail.com>

On Fri, Oct 30, 2026 at 07:21:29AM +0100, Michal Pecio wrote:
> Turns out, we do actually need to flush them, because workers use the
> 'high_prio_bh' and 'low_prio_bh' members of 'usb_hcd' for a brief time
> after all URBs are completed, to track pending completions and possibly
> reschedule themselves - see usb_giveback_urb_bh() implementation.
> 
> Flushing would suffice if the works don't reschedule themselves, but
> cancel_work_sync() is more robust against stray completions.
> 
> Syzbot hit this issues twice, but not reproducibly yet. I needed a 3ms
> delay in usb_giveback_urb_bh() to get reliable UAF after unbinding an
> HCD. The works run in soft IRQ, so they can be preempted by hard IRQs,
> on PREEMPT_RT, or in a VM. The latter in particular seems to offer an
> opportunity for "unlimited" delays and may have affected syzbot.
> 
> HCD unbinding can occur on hot removal of Thunderbolt peripherals like
> docks and monitors which contain xHCI controllers.
> 
> Reported-by: syzbot+cade843a1e4af0651f5e@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/linux-usb/6a8a5047.dbb3a75c.13dd47.003e.GAE@google.com/
> Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/linux-usb/6abb3515.c6a7fab7.e5ea7.0459.GAE@google.com/
> Fixes: 8fea0c8fda30129b ("usb: core: hcd: Convert from tasklet to BH workqueue")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
> 
> v2:
> - changed "Fixes" as per Alan's suggestion
> - clarified the comment as per Alan's suggestion in other thread,
>   let's see if this will pacify the review bot
> - another syzbot report
> - more elaborate/plausible speculation on how syzbot hits this
> 
> v1:
> https://lore.kernel.org/linux-usb/20260823125831.6ea35650.michal.pecio@gmail.com/

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/hcd.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index ee19628cd653..88f88e7ba464 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -3053,14 +3053,13 @@ void usb_remove_hcd(struct usb_hcd *hcd)
>  	mutex_unlock(&usb_bus_idr_lock);
>  
>  	/*
> -	 * flush_work() isn't needed here because:
> -	 * - driver's disconnect() called from usb_disconnect() should
> -	 *   make sure its URBs are completed during the disconnect()
> -	 *   callback
> -	 *
> -	 * - it is too late to run complete() here since driver may have
> -	 *   been removed already now
> +	 * Hopefully no complete() callbacks are running anymore; disconnect()
> +	 * routines should have waited for them to prevent UAF of driver data.
> +	 * But we must wait for workers to finish accessing the hcd which is
> +	 * about to be freed (and shamelessly drop any remaining completions).
>  	 */
> +	cancel_work_sync(&hcd->high_prio_bh.bh);
> +	cancel_work_sync(&hcd->low_prio_bh.bh);
>  
>  	/* Prevent any more root-hub status calls from the timer.
>  	 * The HCD might still restart the timer (if a port status change
> -- 
> 2.48.1
