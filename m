Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794617970;
	b=l7MbUtn9hlWHZm1h52VBopokT8MqtKhOmB3jKQH+NJeN0h2MfDpXDvOw1kDth71iA05o
	 WoTut9AgbZ9+ADeHxU96Ox5KQbBDFR83ZbJeRhCQWyOZEEtPTYmfk1uWTkqJPhp/4yAtz
	 th8qsl7x2bw4JxkcEWyxcBs541e8lDvOTZJUsLh7Mr0y2ff8I5jQoI2s+zmk8n5+sT3VY
	 jEa27wzwuOf26MEcp4JUtc/15IBKskZL9N5zAE+sc5doThnZoTKTlZBs9x5fH/sIg1B3N
	 BxyvOOLhRgwVc0tFWpE7vraTNIAyEp28kY2G0Tyo/dyMit4wx3tbLC+72C8Ycea8nwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794617970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QMsZLVog74iOpWaQpOPOS8T9N6kbs3KpXXjJz5qYWLA=;
	b=Tg3KK1UXjO8bSCnc9zRbs344sG5ODoQwiLxKEMlc5C4W1HEho35ONd8ast2pwEudDzHa
	 BtT15V2uSXd8e5O1mr8xIzrXUia8B2yjX4G8r4Ks4NWiy4Ib5dNFRi/IAQk2nvVNKeGql
	 fsKbJA61qTnt8lHCCxRof5sBS6h1f5Xl5I9BXLWrpP1NlF9AR6Zwkok+0mv9JpR0d7J3y
	 vMS6cb8L0t/e1lcm3ioZU4JR2TsZfG1BMFX7cm5EKp6cJoLmQvJRmhlDfrVBk7AQMuU/A
	 ABxWyx2/VRHzcu2Ud2cgX2WVjFx4bSFjJXjcUe7RG7D5fMqJRNDYqtpF7lVxo/QNauQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W8nsx5AV;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0A8606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F0A8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W8nsx5AV
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so2198712c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794617968; x=1795222768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QMsZLVog74iOpWaQpOPOS8T9N6kbs3KpXXjJz5qYWLA=;
        b=W8nsx5AVQBffPoy+k16BhVjMEDDodl8fDpI8OkPIzbFye9cL6ccgCyI3Nx41dY28Hi
         kK6cQbOcB/AGp8zSyFVENsFpbDkOWK/tC89mGKH+SNXgXoPuvmZPphX58rhOXgdU++H1
         pGQRbCPlPjp/bh3su4U7G57oiVVBzrvGBd0T8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794617968; x=1795222768;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMsZLVog74iOpWaQpOPOS8T9N6kbs3KpXXjJz5qYWLA=;
        b=aS+3Ys0TAto2B5zYRpc3t3xA8trZcIrKJ7D2aOmh95OuiIiIU/yBcxZbbbyA3Q3sG0
         BNLaAdkaUVRl+aycXnXNUN5IRBxPLTCmUySZbA16Eys5udiN0W40IUMx7Bfw+Hmkimju
         Uyl9uhQPqBrK8NP8Mbtk/DrTv+pw0PC1v+FTttjFuy58ae9uEOUP+rdFuyQ7z+V7xkRQ
         xoa37593Ovk0mfSc25mkJJ8dYakNvfwKnR2OoOUIcQFU03p/6uIj4x5BlYlwiH8I5Cgw
         6CumZu39//ZLctVTvNyyavcHPGe2v0vDUGlHRoaplby9n3SFdQ32SgPQOWWqi9Ou0Gmf
         Fisg==
X-Forwarded-Encrypted: i=1; AL+hErFJ8/IhFvbOKN/wdm6H0L16Ju6QWJfVR/lQ0jvRdC0w5LibJeflhBOgjQw1SQziPmeMYHJvO8o2H0lkC6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z93piaywM6pJJf02Rq/IRbBjYDczojcsCBpg4VA/wzF3r88198U
	AjS3Rj9VlD81hJO2mF4ynCuyceJBuArnRK+fl6R6RULAQAYyWidUovel3t8WkUAX2w==
X-Gm-Gg: AYBFou0X7IzSvs7GJxAbU6XLtVkN5Dso4P7/Yzh0jOIR2Nr15VWjTjjUGcRLPBt5059
	zsSXsR8mIfTBBaDjauRAuupEdvhO8TCO1+8BlGwmoGlaz/oqZvYglOKLvwK6I9NYSgj0E2sybqP
	xyQAdsCgorvHTE5u8+rpmvQ4Oi2p4KfG4C+0K6uxS+kPL3hM9NXasHryC6xzVS/B9dmygrkjjty
	nd03iONlchEV1r8PWfh5+Csmf7ySwrH4CHbxBkRFex5Yyjmsg60NuJwVZBJl9jegqcpdH8KtPg6
	wi5dssdqhfL4xIHTqozG6chISEgBMzxdZZzZjF52QSQEvZ/O/X+bY4Z6W8TB5B0JbiBNR2VR5Ks
	YZjT2F3+dUakXKYwuxhiYSDRKJ5pVTvcuYLHWrQZzS0KvSq75sgnpAbSrO95zeTMNxXYYYz3Wnx
	0FdVfxblnk4ALtu6c3sFBOxHbkI1G2gxP09FiJMlg7UVh5+L2XG+HzPKL6t+jzlzsBQ5DWccHxN
	S33Bm+k+1+Cx0D7P2EZ7V4ZaQrN7+LItGzbpCKjd+eZU4VaPcC9xtqCvqahvpZuHuog2BAe8Nzx
	oQzotaPGP7KAYrtNpjc7KUjwYHNTlFrvsgFaJT78SIHRuIEkjvlS9VNPByn5hgcXGGvQ
X-Received: by 2002:a05:7022:7f0f:b0:1b3:b3de:9231 with SMTP id a92af1059eb24-1b50309823dmr3952411c88.14.1794617968357;
        Fri, 13 Nov 2026 16:59:28 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c0e6:2ee8:7d51:ad79])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b505b5bf76sm7931235c88.10.2026.11.13.16.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 16:59:26 -0800 (PST)
Date: Fri, 13 Nov 2026 16:59:25 -0800
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: Re: [PATCH v1] PM: runtime: Update last_busy before calling
 rpm_suspend() in rpm_idle()
Message-ID: <aveybY5Z9OWQYkRS@google.com>
References: <4789427.LvFx2qVVIh@rafael.j.wysocki>
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
In-Reply-To: <4789427.LvFx2qVVIh@rafael.j.wysocki>

On Fri, Nov 13, 2026 at 02:27:23PM +0100, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> When rpm_idle() is about to call rpm_suspend(), there are no reasons
> preventing the device from being suspended, but if the device uses an
> autosuspend delay, it needs to be taken into account.
> 
> For this purpose, rpm_idle() adds RPM_AUTO to the flags passed to
> rpm_suspend(), but doing that alone is insufficient because the point
> in time from which the autosuspend delay is counted may be too early.
> 
> For example, if the device has children (or consumers) and the last
> of them goes into runtime suspend, the parent may now become eligible
> for suspending, but it may not be worthwhile for it to suspend until
> a certain time later.
> 
> Quoting Alan Stern [1]:
> 
>  Let's say the last remaining active child goes into runtime suspend at
>  time T.  Let's also say that the parent expects none of the children
>  will need to resume until time T + D.  Is D sufficiently large to make
>  it worthwhile for the parent to suspend and then resume?  If not, the
>  parent should remain active.  If yes, the parent should autosuspend --
>  and the length of time the parent should wait before autosuspending is
>  on the order of the value of D (let's call it D*) that corresponds to
>  this crossover point.  Thus the parent's autosuspend delay should be
>  set to D*, or something close to it, in order to achieve both
>  objectives.
> 
> Moreover, if the parent's autosuspend delay is set to D*, it should be
> counted from time T at which the last child has suspended, but that does
> not happen because the parent's last_busy timestamp is not updated at
> time T.  That leads to undesirable parent suspends occurring between
> child suspend and resume [2].
> 
> To address this issue, make rpm_idle() update the last_busy timestamp
> of the device when it is about to call rpm_suspend() which most often
> is right after the device's last child (or consumer) has gone into
> runtime suspend.

Is it worthwhile to note (or at least hint at) how many other things
change along with this? e.g., how pm_runtime_allow() (and therefore
auto > control/power), all non-autosuspend pm_runtime_put() variants,
etc, also extend the autosuspend timer? I think we agreed these are
acceptable effects, and likely even desireable, but I'd say these are
fairly major changes.

In any case, the change looks good to me:

Reviewed-by: Brian Norris <briannorris@chromium.org>

I meant to make time to test this out a bit more, but ran out; maybe
next week.

Thanks,
Brian

> Updating the last_busy timestamp when rpm_idle() returns an error
> without calling rpm_suspend() is not useful because the device is then
> going to remain active for an unknown amount of time and its autosuspend
> delay needs to take effect later.
> 
> Link: https://lore.kernel.org/linux-pm/fc43eb13-816b-4cd0-9711-848fdab605ef@rowland.harvard.edu/ [1]
> Link: https://lore.kernel.org/linux-pm/CAJZ5v0hKpjMsGQm8Cpa89x5wkNxqkggDNbp+eQ0S-E52DETWjQ@mail.gmail.com/ [2]
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/base/power/runtime.c |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -560,7 +560,11 @@ static int rpm_idle(struct device *dev,
>  
>   out:
>  	trace_rpm_return_int(dev, _THIS_IP_, retval);
> -	return retval ? retval : rpm_suspend(dev, rpmflags | RPM_AUTO);
> +	if (retval)
> +		return retval;
> +
> +	pm_runtime_mark_last_busy(dev);
> +	return rpm_suspend(dev, rpmflags | RPM_AUTO);
>  }
>  
>  /**
> 
> 
> 
