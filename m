Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588187;
	b=A0QSnwbH87zR6b88BA7iSnVbmGBRtKcXIpb9Wo3HJaktPrDJuebyLAnfVq7oRAfFW/5B
	 38YChJNPK9TtYqvwBNTJBIBrT84puXyL6v7iuMWgVBjqm9zB6RKPwEKXGHg2+K00hYIH4
	 IrN9kcDq2ZoqEUW03DTW046FxZoMbiqB6EZQS0THnMuFA5WGPCPNX9WB18MJCVIOOHxlj
	 Z7d24GSrT4JHkEQXO/xhgGd47nndWGTBDUng9nJgL21027dw7zDvEcQlv6RtmvtAOc/ol
	 A7DuDaZBGxs3HJ/ndvdXwlSM1/g9U0S/UBTFxEGQKgu9SgsiEZFSAM/153b6yZFwxRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Q08y28kaRtiqf3uk8BV+2BQPytUqi6HBvnka7EjTRCE=;
	b=Y6G52OUSEIc+eA0d/USy+mBfzGlrScVXmyn/x7qvkJaRvnhbub4/lbiK700nBC4VbY67
	 lzcih/qPz8QjqWmBjmAFQWWFfLN5JERGBKNBdN0pFWCn4b9+C/IuQLH77DXwjafgGM0GU
	 mlp9QbcaGGjgDb9W1WwGx9rSO+KS6RgarxQ1NM6uB7LS0oQo2NqY7f74OCeqbF+CUEZmn
	 6bwxOKd4EdzL3+OT9wcqkeueqtVCXHYHqH1dPlwWiggJI3r+svCOzYmH14aWp/dQ+20Nk
	 dNvB1UOxIcB3qI+z4lNY3DYJqWR27T98t7zDnuTUQDbAlJi0D6etoqRFIXTv3KPTMSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fzRM6wbX;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA49606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBA49606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fzRM6wbX
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dee593f18so573914f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588185; x=1793192985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q08y28kaRtiqf3uk8BV+2BQPytUqi6HBvnka7EjTRCE=;
        b=fzRM6wbXaiaCzuT+9CevqVF20mKC2vooPhqvxyiZocf4ThKWiQiRWxjmNirvf5znqh
         mazbzo0FJ32fDAxyn6hmY1+afGgeMK92SL7paM8gSHU0Lx9uXZdVYd38TcmLINfQgrhL
         eJ5xUSe9anfkMVU/VhKhNb1cw3OA7/ZgP5BeCdz8oPO2QUprkgCmiMboKpGWyiSBvd8F
         +JGbsrRPMzRKeMCMw10vQubojtNALkApJugc/cUH6zKi7Y4f1e0Y3g2PIWZ9OW0y7B+1
         03LjhnuQp5wlahzUCboYBZ5rhdYzoZ6G8gwSPOdHwaKWxScCjwVHQjx90N4kl8NYmrKs
         390Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588185; x=1793192985;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q08y28kaRtiqf3uk8BV+2BQPytUqi6HBvnka7EjTRCE=;
        b=tfMUOwIwmVBEBXlOa8+7mpv16sNTuMghG0TyQg5vEey9+AaR3XHLDDOArGUTk36bby
         sBs6cLTbmsexW1omVmxsW+x3pZCo0kJVesY29GkVfh5Rk0rvR+oFplRdmJEaZJWcjH6k
         3JZpad+Iq88Gs0Vee1H717TYQ92PsXloYOSVoUgiH84u7L1j37VE1SxNf8NpAqqbLURw
         VE1C15uh4sw8bnjZCi7vanyz4ekFgj71hIonOFrM7gVR0aU+/z46fs4utLnRjQcQgcIu
         VACnLAjjspB4HgUcRmzJkoLrNXZ6aGTnT8m1ygph/EeiTgSsuPD3xhj8E2Zd+0fSsY4N
         T66w==
X-Forwarded-Encrypted: i=1; AKwUvBze0IseUeSg2oolN9qsisapVuD6fVyfRT2gkpBN5xOpukvQ+NAkN4xiu1Yc71RulJpUDdXUIrFBLHNy34s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRZS4Q+/9cpj6aPiJuVO9/nxtL6Qhux7Us8vQU/SvvZCktsP+o
	CbY+4dSMoc0+VLsYIGTNtmvqfpmqVkTbgOByav+3Zvct9Hb+uGIUocCY
X-Gm-Gg: AYBFou2uZoVU0vRQHAsPQ6KPeEhyDXNJk2/MRQN0iEqujywxl1x+cXxQ3oYnAyZxyEZ
	Tt1CtWioTDnp8A8esN1BFvCc8g9blumj7YG/8+wxMCV6EdKL4/GULgscV8+vcRqhoCo4yun4EgY
	6L5FrlVCHLkHOHMgOXI1ZwD5F+WQl7WrpU2dCys48YlHiL+wCV4ULMX9E/sB5aMT2Tq8JwQggC9
	JD6vogeHl9n8huT2a9b7/4OskchZkU1OHxqo5ZvGOMlTAelCYhKR5C2gMwKfxghwASqPqkc53Gx
	hZf6Qf587RrLb99/r2ff+unb1vj/dlxQF7MvxNp7W0FsmwM6BF09qZ81rtmfIF5YfQJ/cZNMSy2
	kzXIksQpaPngIhDUQGxtoaIXapX80373LI0Oy2wsvmDuNCTdBvro3/ZzG29I9mcj7etAOjoLCiM
	fRcKiiNdqOWmPK0Ccv1I6egMNrXC7hBWiTURp3fyXpqc8/csD24D6/hBe51Ii72GFVRb8W6VD9B
	zE7YqZvICn1Tvuu4Hk5vjjN/a8Ei0hp4T1jnrjrHE1SdWxPDgJFdQ==
X-Received: by 2002:a05:6000:15c8:b0:48d:f3f8:f910 with SMTP id ffacd0b85a97d-48e264ca949mr2913670f8f.34.1792588184900;
        Wed, 21 Oct 2026 06:09:44 -0700 (PDT)
Received: from localhost ([2a02:8308:b092:fd00:d28d:9c92:be85:1c3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm5360894f8f.22.2026.10.21.06.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:09:44 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:09:43 +0200
From: Jan Remes <ciakval@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joe Sandom <joe.g.sandom@gmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, martin.triska@mycroftmind.com,
	Jan Remes <jan.remes@mycroftmind.com>
Subject: Re: [PATCH v2 0/4] iio: light: tsl2591: fix lux calculation and
 precision, add I2C ID table, report saturation
Message-ID: <ati5lzd2KotvmMC6@mm-ntb-00805>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joe Sandom <joe.g.sandom@gmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, martin.triska@mycroftmind.com,
	Jan Remes <jan.remes@mycroftmind.com>
References: <20261014141650.259929-1-ciakval@gmail.com>
 <atEdM6wi_FAGFjrr@ashevche-desk.local>
 <20261017031411.05dee323@jic23-hlaptop>
 <atXSBHbOPYYltHUW@mm-ntb-00805>
 <atXZwm5DzCK8S0_K@ashevche-desk.local>
 <atdRJ3JqAyGWOnxf@mm-ntb-00805>
 <athxOKkugAYL62F9@ashevche-desk.local>
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
In-Reply-To: <athxOKkugAYL62F9@ashevche-desk.local>

On Wed, 21 Oct 2026 11:00:56 +0300, Andy Shevchenko wrote:
>
> On Tue, Oct 20, 2026 at 01:31:51PM +0200, Jan Remes wrote:
> > On Mon, 19 Oct 2026 11:50:10 +0300, Andy Shevchenko wrote:
> > > On Mon, Oct 19, 2026 at 10:17:08AM +0200, Jan Remes wrote:
> > > > On Sat, 17 Oct 2026 03:14:11 +0100, Jonathan Cameron wrote:
>
> ...
>
> > > > FWIW, I don't think it to be very urgent, as people probably don't use
> > > > it on x86-64 (seeing both as it had only DT probe support and that
> > > > impacted users are likely to have noticed the oops).
> > >
> > > What do you mean by the second part of the sentence? It's as easy to use on
> > > ACPI platforms as on DT, we have so nice trick called PRP0001, which allows to
> > > enumerate "OF-only" drivers on ACPI platforms via SSDT overlays (or other means
> > > of DSDT/SSDT provisioning).
>
> > I did not know about the PRP0001 (thanks), so please disregard that
> > argument. Still, I believe x86 users to be few if any, since the oops is
> > quite easy to trigger
>
> True.
>
> > and AFAIK most x86 distro kernels ship without CONFIG_OF.
>
> How is this relevant? This driver doesn't use any #ifdef CONFIG_OF or alike,
> so most likely the driver is available for x86 as well.

I thought that CONFIG_OF was needed in order to be able to probe a
device using the driver's OF table. TIL that missing CONFIG_OF prevents
only manual probing (`echo "tsl2519 0x29" > .../new_device`) but not the
ACPI mechanism.

So:
  1. Please ignore that argument
  2. The wording of my Patch 2 commit message is not correct ("cannot
     be probed on a kernel with CONFIG_OF disabled"), I can send a v3
     if that's preferable.

Thanks for getting me to learn a bit more.

Best regards,
  Jan Remes
