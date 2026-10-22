Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792634342;
	b=yPbKAnesTxKw3kY7CTMdxeKZF7paxQ6scjnYYLi+VTV0hB69BR1dif0klgxOeV1lUIyJ
	 ZO1BNPeE5kRYkMv4VvRyQFV5ZIfHSxXKH4MW55OJqnr+HSs6hKxhZNeLgrcShnJPUwj2e
	 GKuHDHmKK7Vgn2/jNYwyK0yh8BWjfX8vEbUkYahN7YOg1n+dEsIYX81MAnaAmJtEh3bZB
	 IbhcYc01Ng8X1a2zIcadvfZ6DSvrjVX5COBUIP/FoPsv5TkkUT2H1QCAlf8aFeWUXdeAZ
	 sSCO8lzP5IyIt30Wzg0YZOwB5eVQnt8KJNGW1pVI8xyYBJqmkKDxJ7KGZkkSum5Rw8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792634342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ow6Xf98skWxAAfr4tUT3DSmhy2FgTs7yUfongXRVX40=;
	b=PaZvtE0tnDyWRbn1CLOt2WM3RWgCOZxXjjC1VAmiv6rIxjaD2uaUWWxQF0ymUjh4dnXY
	 GSLsHO4zZXqbi704vNQXdBdydGyr03cZqsUztbeOG+6s9LLhSeTS5uhiQq7Pbi6SiXFaU
	 RznH3WQ0aFSpUleMEBTGi/8w672u547uRXQkIS1XsX6l4248YfiuNd9y4wF+8pVQsbxN8
	 uKYi/jrhQhM8FoPO9h35U+2HQqUJw+f+ll8FEfWuQNQbF7sk00VKBk8UoHlreJTDsjl6X
	 eghOsPL5U+mbzlVOgf9gdgGhPEFF6aV0C/tEXu5PWa7XfqBzP0zIsUl4dgTs7v/exAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=murgatroid.com;
	spf=pass smtp.mailfrom=murgatroid.com;
	dkim=pass header.d=murgatroid.com header.i=@murgatroid.com header.a=rsa-sha256 header.s=google header.b=Dn22YTWF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF06606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FF06606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=murgatroid.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=murgatroid.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=murgatroid.com header.i=@murgatroid.com header.a=rsa-sha256 header.s=google header.b=Dn22YTWF
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3550c917fd3so1824845eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792634341; cv=none;
        d=google.com; s=arc-20260327;
        b=FM2Bl1awYEV2qs41DI8wtY8kRx2F/Ox8Z6eb6Ph2KBFXFVvVNlCFYUEQJBjNL33CRk
         1n1xQ1xf8cDhuVPf5wRyrZakc0iwGTI1GttbFCvC4bThscoeBvqjv5eGkxYwCBBT9eV0
         ebC0BjVCTwvmIOjXQ6b1lrc19Gcdxq1gHuxrBvOPvaQVz2h4dGvDHM4vS9y3ETcScQlR
         LtIPjEeJQAxB43r4Oc4TfSQX1lHypy3BcXtumDpHKIb7dmKQH3z8w6LDoQ+29gDa5vwP
         dZEzR619fmmoUfLI0jP08UBVaYAXeeGwavitM3bOen1aEMJdsTJRKrZHCsrw2PDxaBsR
         1AzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ow6Xf98skWxAAfr4tUT3DSmhy2FgTs7yUfongXRVX40=;
        fh=KXrcdrhHyBmeiQMpIW9QXWuuXDdTHFTQve+eFlf7AuI=;
        b=mSpoLIvAffnaEtlh2c7+9MBOH/7oLOr/AE6ENs2rNEBFdMnAuanadtw5hVV89nGY1l
         oeXVmc3xNez0DOFUTePQxUixC/IrFAQk4LCvDgUMNOC7ggHUPjhm16h2xJKGPXSat//T
         XnwZvAgLZUpChTbm0Pp6j+oFWHLZQ+GK1d+ls3RHj9lVqr4vbYJwAUgsQaBjPs7tee5w
         +3gIIu7jzgPOtWVKIM4+w9nE/csbgm5MuiYBMysFIl7ryfRcMGyYNIuerSQrhYtXURIX
         kwzeNRVD25y1bteMHMEaR+CWtAc/dHiKCEYGLRICjmxBS4aWPi6SLKUP/I+ex1ZobdIH
         tMXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=murgatroid.com; s=google; t=1792634341; x=1793239141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ow6Xf98skWxAAfr4tUT3DSmhy2FgTs7yUfongXRVX40=;
        b=Dn22YTWFHXuz5eBGAfgcXhBaSngAcdqW6Ktq+DQbZGylcggyWaChglRW/PsuJhLKQg
         ttkF4JCIZP0NHjN2sKShcr4i3TjPFg+AUESLvr8tjPomsIvOO3VHDGgnFbu7HXRmkwJz
         kImqDIsxFiYu0K537EdLnpNStdF056NaZPRo14LbHN/aqM0mWS4rIhbcixaBq8jovoA8
         W6w1+JotaqCa3STOt6xyC2CdQVdq2ylm+m5PNfmvuVoXH0WeS7zIEsdTk6dsJR64Fv2s
         xW33Ws90oMWQ2mjlNcvVNYalCROvgRUMnn1KIjCqem8758v8B/qRmxfeeJxCtX06kTx/
         cZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634341; x=1793239141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ow6Xf98skWxAAfr4tUT3DSmhy2FgTs7yUfongXRVX40=;
        b=WdJk+Kw+sgVlFPsgWd7Mq8KPjHq2j3Va3S29nWY7jKQwgzk4IJpP3hK1ERGNFAg4M1
         UkaZ+7iM6zkh7TXGj4uk65CqVECbi5GTCXC3oANxuhUdWhYT+jd/vD9pdeW5WUGKJ43s
         5BW1HJQ9FVz+sRd9uXc3l3+c+Mf1tgm5+F0KHOQqEAYUu/B5+gzgXUmjlRKwk+G1eD4O
         StrV0cpc1zGaDOE+rbjx0pc57+eaZCuz33OxqcxARN5MTEvm0cvR5260fGnAIZWsknMU
         UmabIRKZwEAQej8Y2+OwBMnrR8lGJjUdpIviW2cOHi4f+tEOG4Z9xiawLuIKiyuV6O9a
         E55Q==
X-Forwarded-Encrypted: i=1; AKwUvByrKz6sNjYqzMgZ0Sm2NgU1qKFD65okHS6+6dNCwi2VUvrxID4UGuCDiG/S1gDHDun7BedHTyEPCz8aW5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN9Rj+FQJZcaFTpoviIP5Y932HhjqZWgyV5c8YrXKOHB6pU0vo
	UAwbw8u6xVmZNJkLNoQdtKI32bD9rNcSNJ9E4zbm9g5RkRWdkwkD2MnIdOLCwMzsvapPf6OONaS
	wttm58bqKTQ4IdfbAoPcpWjv8y7X/wELptbPkmOCC
X-Gm-Gg: AYBFou33qQ9IEiSiwIjNrXhFRsoGUYZHaBL/CrRt9Mf8GUFBJha9QQB7ZDxdZwKzedi
	17D6lP3dpFKRuLnbZUo5eXnHVGT4IxkSJ7mdd/GTTis0AWtZE4TEcZk67OhVZFk+vu2qtmFwAU2
	QxVjRDSovdUOeP4b34SWBiJyd+FqdMeiJPZhxcCAQAIv6cVvmplK/IMtaNv0k5q3Akum9eubrUH
	mLEbzs1ZsS/dkxNE4ac4iemWyOqVSKMfYAv/YVzDMMDAuc/GIA1AVmk8BcErnAsNrurd/cdNYy6
	q8lhGLdaaifg4fLT+1A3x9V4H6C0kCwk48xPlIllrskqYbWYy9hJJW8E46MZ0j226p+8HaSju5U
	7eMO/RiXkyUXZaObxHzCAAUYdMZhMaIvcofGxZVnu4kLFBF4XJgf3kPPSQ/XdhaBfe2Jcdm21Ox
	NLu9qHY5JkUMMiwQy0t35glugqj4hsxNQzDfo=
X-Received: by 2002:a05:7300:e70c:b0:351:1bdb:e3b7 with SMTP id
 5a478bee46e88-3674cb37bb2mr5335214eec.15.1792634341036; Wed, 21 Oct 2026
 18:59:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019023420.83976-1-ch@murgatroid.com> <20261019023420.83976-2-ch@murgatroid.com>
 <4470c427937d26035d81b99ee7d06e2a602ee4d7.camel@linux.intel.com>
In-Reply-To: <4470c427937d26035d81b99ee7d06e2a602ee4d7.camel@linux.intel.com>
From: Christopher Hoover <ch@murgatroid.com>
Date: Wed, 21 Oct 2026 18:58:49 -0700
X-Gm-Features: AclHuK-UlpT4QZJ3hk8thqk-ORABl_Te8RQcU0z-w1fijnZP-8kQdVwWN9ZtSy0
Message-ID: <CACw0PsaJr6E0Y3AXoGKDUiKp4vsaA+GEJjPqEhYuSoKqDp1jUA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] HID: hid-sensor-hub: Synchronize callback removal
 with raw events
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Lixu Zhang <lixu.zhang@intel.com>, 
	Joshua Crofts <joshua.crofts1@gmail.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>  Is this issue actually reproduced or it was found by some AI tools?

Real life.   I wedged my kernel several times with an MCP2221A usb i2c brid=
ge.


On Wed, Oct 21, 2026 at 6:22=E2=80=AFPM Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
>
> On Sun, 2026-10-18 at 19:34 -0700, Christopher Hoover wrote:
> > sensor_hub_raw_event() holds pdata->lock while it looks a callback up
> > in dyn_callback_list and calls its capture_sample() and send_event().
> > sensor_hub_remove_callback() takes only dyn_callback_lock, so it can
> > unlink a callback and return while another CPU is between the lookup
> > and the call.  The sensor drivers remove their callback in .remove()
>
> Two spaces before "The".
>
> > and keep the struct hid_sensor_hub_callbacks in memory that devres
> > frees right after, so a report racing an unbind can call through
> > freed function pointers.
> >
> > Take pdata->lock in sensor_hub_remove_callback() too, outside
> > dyn_callback_lock as in sensor_hub_raw_event(), so the removal waits
> > for a report in flight.  pdata->lock is otherwise only taken in
> > sensor_hub_raw_event(), and callbacks are removed from process
> > context.
> >
> > Fixes: 401ca24fb34a ("HID: sensors: introduce sensor framework")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Christopher Hoover <ch@murgatroid.com>
> > Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
> > ---
> >  drivers/hid/hid-sensor-hub.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-sensor-
> > hub.c
> > index 6470a290ebfc..7cf9f398592e 100644
> > --- a/drivers/hid/hid-sensor-hub.c
> > +++ b/drivers/hid/hid-sensor-hub.c
> > @@ -173,7 +173,14 @@ int sensor_hub_remove_callback(struct
> > hid_sensor_hub_device *hsdev,
> >       struct sensor_hub_data *pdata =3D hid_get_drvdata(hsdev-
> > >hdev);
> >       unsigned long flags;
> >
> > -     spin_lock_irqsave(&pdata->dyn_callback_lock, flags);
> > +     /*
> > +      * sensor_hub_raw_event() holds pdata->lock while it looks
> > up a
> > +      * callback and calls it.  Taking it here too means no
> > report is
> > +      * still using the callback once it is unlinked, so its
> > owner may
> > +      * free it as soon as this returns.
> > +      */
> > +     spin_lock_irqsave(&pdata->lock, flags);
> > +     spin_lock(&pdata->dyn_callback_lock);
> >       list_for_each_entry(callback, &pdata->dyn_callback_list,
> > list)
> >               if (callback->usage_id =3D=3D usage_id &&
> >                                               callback->hsdev =3D=3D
> > hsdev) {
> > @@ -181,7 +188,8 @@ int sensor_hub_remove_callback(struct
> > hid_sensor_hub_device *hsdev,
> >                       kfree(callback);
> >                       break;
> >               }
> > -     spin_unlock_irqrestore(&pdata->dyn_callback_lock, flags);
> > +     spin_unlock(&pdata->dyn_callback_lock);
> > +     spin_unlock_irqrestore(&pdata->lock, flags);
> >
>
> The patch looks fine. Is this issue actually reproduced or it was found
> by some AI tools?
>
> Thanks,
> Srinivas
>
> >       return 0;
> >  }
