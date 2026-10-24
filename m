Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792866488;
	b=eWKtrU4tz2b/PDF3QYhS2Qw/zFmsa0nhSXa7JN/o3DmA183HZruJnkrMVX9Dv0Mugqo8
	 S3TkbqsCVwqqci+lDW7GAm7BU71Hdm7ivlYkAcedQP0YdxpgS2b8rydn1iZKQAuw7VpYm
	 brzgl8QJAQeAdFfbUiP3Z0Ne+2Fckzy4DlMRtaRlqt8IV8P4lOVgRMqxACTDTHUPTRi2q
	 nDQt7rhiJxYDVq6VaATyKBEEOQHyTiRRiSk5WeYffi3bZBauC7znwMSeZpz4OTJ7WOrN0
	 pBurf0i3TlYpp8wRPHzX3XE4rJMZfK/KuUkmyzROAcN0oIgnoTpPmS4ZWamakwY8TwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792866488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HZGm2VHNwK7IrcWUVc/yEaWLTgQRlsvvFiY8hoXSYTA=;
	b=CA7eyxrz4FCC0hjTMeTa0YRBmOL6jfhGMRUMzBXuUOLH2wV1Nc35nIW1jQb4iscGKyy1
	 +Yh8eXHMQ+YAkkHTOmqQBdgnZgEVJ2+XnltCIq6kJPgAX9k63o6vNeYdJW5U3XUHwuWIz
	 A0CRHs53ACic2kogx5JNb+HzO8+BYMBoui0AzonWq1u61UjlFwlafTpfCtz4jCuWsBFB2
	 xGwYeaL2QcZQng0tfDZR5AltgBovWo7CU7uXn2NGrt6YxlWBZ+DSkkRrbzFTPWoB4moDa
	 sogaTnQS+6lpLgrqvHSnAWsnOeluchc+0CcFsgVNSF/Nf+o/HU/wVFn37Zu8OeuGNEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=scIcMFgs;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A33606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21A33606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=scIcMFgs
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-536717a4d83so15609341cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792866487; x=1793471287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HZGm2VHNwK7IrcWUVc/yEaWLTgQRlsvvFiY8hoXSYTA=;
        b=scIcMFgsc+uJLHXtfb4EryYJUQ0LWywirVYNvgIkXvoxkzFgXwEjiUddcF0ZjeBq/i
         ZtsgduTxgNZI4HxAnjkv4FNBKHhx5a6VjAhcNurUtXAAuRDQ7mtLQaDLNWQ1T55KUvb7
         Q4bqTItwdu52r4vx7R49J2MHxtThw+DXD35/mRnSksqQkZOJyQs2rHkBpna82bX9nS03
         DMod6/5rRRHUKYzQR3/1Qx2VG6CEAI7wouJX7OvnA5c1M3ptLhrbr7fnMr881IO5tWG2
         9k5z2i6lPJD3qFpLjvn75ZDUpOyM5TQs4D8oM5mmg61cEsoXicjzH/r6CQP/9ITapnQm
         KNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792866487; x=1793471287;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZGm2VHNwK7IrcWUVc/yEaWLTgQRlsvvFiY8hoXSYTA=;
        b=K+JkKK1cAc65yubrrza1x7GY37OhF4cB6uL4BqhDQnQZJocrapVoOvEmBzr/wJGAMk
         XlagMy0NB3b6RjllFRTvSfuce0G0tDPlGa2bFbBOfen3pgg0HLycs4vqnsp3YN+5wzYM
         xF8YNs4qBVTHQVj7JFxL0PBiIDSJNpGYqq08yW5JsvbpqB/nijevL33Hojgtw8iREeTt
         zKchFyMPubsMo3VXt1qRoqIB9U7oe5KB9TgcjScONacsc9F9g1VO3+ZjWms3TtK+j4Vx
         4N66GSHFnYWoJY9fROJ+G0+pw4HvqjBsbwteBxhkj+bRY4SFWBFnl78TthBhWZjgE5/R
         8dcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxryecbM9+Zf8sRZYSEEe3p8BH23zjudvGYeRToCsAQmtyZ2O2uPxRFHrbhmi2XUUBFgr+k2N/q9302t+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvq5KebHydo/rzjlMuvQu7Msk0lKLTIFDSUPtQ43cNzpffsr7O
	XJEQahPzoV0c7PGRBvFeHrkhF1ekVofAb6ckzhqBWndwwSQMsjk7s2MLFXihiwz71w==
X-Gm-Gg: AYBFou2+NuqhxDl0UTxkLPjkiNLcX8PjvFvmANVPq3hJRBMQyMzVs7lEAV/YisGW5hI
	OOhUsWAqr4rCAu2INd1ckHJ5zY7ZSBA0sK1dLu0ZZvaTKcfJM/hk39FJ6Vq4q4yh7az+olOJ0ia
	QJc/L2Po5eV21u7VhrzZXDh4NuRXaFVqhdp2BzbYA2AtAd3W6COPvk1Yc8yw97erKRB7C/xl8UF
	MkiOPIAe5TEM4zJ0pX3XhvT8G2GJGoagFBlVXn36rpqGO2TqooSmIrTnM588FnWUdTURBBVe/wC
	gF7xom+G+RAjfVDiR2ScKAOEPF9/5p5xviqoYO+US8TjTHP7iSn94bNS5Ung0AyNJdL71ec4tU7
	vEb/VNU8IGVDrGGFiOzrVwteR0qRA8fy+UCvqCg5+5BL6nqqnsv3pujRGBnNg1Jd1X9H49MYfKn
	2XUjOiVH3bTiFLxQGkMhxLjE1v8W+YU0fj/2o/9MVwBTOkTxWdiSzdSYmWIipL273n5JNQlvPa7
	Hae4/DAX1Sw2GU5bsa/YylKDOnRvUUIeY34JcPPtcgSZ7dLcEhcZKbZ
X-Received: by 2002:a05:622a:410e:b0:536:566e:6b52 with SMTP id d75a77b69052e-5383b5ebe08mr38603831cf.27.1792866486889;
        Sat, 24 Oct 2026 11:28:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bd0865sm26558646d6.14.2026.10.24.11.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 11:28:06 -0700 (PDT)
Date: Sat, 24 Oct 2026 14:28:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Igor Putko <igorpetindev@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usb: core: hcd: flush giveback work on stop
Message-ID: <c1f1a281-de3f-4966-b4a8-e9fd0b5268c2@rowland.harvard.edu>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
 <20261024155614.2732-1-igorpetindev@gmail.com>
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
In-Reply-To: <20261024155614.2732-1-igorpetindev@gmail.com>

On Sat, Oct 24, 2026 at 06:56:14PM +0300, Igor Putko wrote:
> When an HCD is stopped/removed (either during module unload, driver
> unbind, or an error path in probe), pending URBs are unlinked and
> completed. However, for root hubs or HCDs with giveback done in BH
> context, the work function usb_giveback_urb_bh() may still be executing
> on another CPU after __usb_hcd_giveback_urb() drops the URB use_count
> and wakes up waiters in usb_kill_urb().
> 
> Since the caller may immediately free the struct usb_hcd via usb_put_hcd()
> after usb_stop_hcd() or usb_remove_hcd(), the running worker accesses
> the embedded giveback_urb_bh structure in its epilogue (e.g. clearing
> completing_ep or clearing the running flag) after the memory has been
> freed, triggering a slab-use-after-free write detected by KASAN.
> 
> Ensure all giveback work has fully completed in usb_stop_hcd() by calling
> flush_work() on both high and low priority BHs before deallocating.
> Also remove the misleading comment in usb_remove_hcd() claiming
> flush_work() is unneeded, and document the queue emptiness in the
> usb_stop_hcd() kerneldoc.
> 
> Fixes: 8fea0c8fda30 ("usb: core: hcd: Convert from tasklet to BH workqueue")
> Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspotmail.com/bug?extid=a5b220cacb0618384d5a
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Igor Putko <igorpetindev@gmail.com>
> ---
> v2 -> v3:
> - Remove obsolete comment in usb_remove_hcd() regarding flush_work().
> - Add comment in usb_stop_hcd() explaining why flush_work() is needed.
> - Update kerneldoc for usb_stop_hcd() to state giveback queues are empty.
> v1 -> v2:
> - Use flush_work() instead of cancel_work_sync() as suggested by Alan Stern.

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/hcd.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 8e8a5f59b319..f403795b17ba 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2773,6 +2773,8 @@ static void usb_put_invalidate_rhdev(struct usb_hcd *hcd)
>   * usb_stop_hcd - Halt the HCD
>   * @hcd: the usb_hcd that has to be halted
>   *
> + * The two giveback queues should be entirely empty when this runs.
> + *
>   * Stop the root-hub polling timer and invoke the HCD's ->stop callback.
>   */
>  static void usb_stop_hcd(struct usb_hcd *hcd)
> @@ -2787,6 +2789,13 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
>  	/* In case the HCD restarted the timer, stop it again. */
>  	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
>  	timer_delete_sync(&hcd->rh_timer);
> +
> +	/*
> +	 * Even though all URBs have been given back, the work routine itself
> +	 * may still be finishing up and accessing the usb_hcd structure.
> +	 */
> +	flush_work(&hcd->high_prio_bh.bh);
> +	flush_work(&hcd->low_prio_bh.bh);
>  }
>  
>  /**
> @@ -3059,16 +3068,6 @@ void usb_remove_hcd(struct usb_hcd *hcd)
>  		usb_disconnect(&rhdev);		/* Sets rhdev to NULL */
>  	mutex_unlock(&usb_bus_idr_lock);
>  
> -	/*
> -	 * flush_work() isn't needed here because:
> -	 * - driver's disconnect() called from usb_disconnect() should
> -	 *   make sure its URBs are completed during the disconnect()
> -	 *   callback
> -	 *
> -	 * - it is too late to run complete() here since driver may have
> -	 *   been removed already now
> -	 */
> -
>  	/* Prevent any more root-hub status calls from the timer.
>  	 * The HCD might still restart the timer (if a port status change
>  	 * interrupt occurs), but usb_hcd_poll_rh_status() won't invoke
> -- 
> 2.47.3
> 
