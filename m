Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CCF4DAF82
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414421; cv=pass; b=Sz+0zYCtTqO6hqoYVfNRQ5jTDJGi0GimsCds9A/46rvqTTnjxWNt1zzgSrLPrRTsqRrofj6gQ4smVVndycy4G3BkZNjN2vylcLpw2m4wtbz/niW+ymdJDKzuBkQiymkycEEVnZvQ1XeamRun/CuQtdrKAbskc1SZ+4cCuP5fkh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414421; c=relaxed/simple;
	bh=57gmab27H+NiRucFf3CyiDJlRJIR87MgR1UBZGb6bBM=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMgN2+3J8FuujVsA4tVwa+jGgSceVz2cZz8vVnVvJ3qB7l7i1hMjRxwscWZhOiyZxuGLoTkl90swtAQlOdzWFFVz5kB+3pPVH8KTh0g+vAAKcMiyR1IuSWK6sMWQw3vVgE0a60SRYvo5oCU5mOOPLNPCzoxqGDZXdGbONqMld7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G86IfJhF; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G86IfJhF"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-78fb1fb9508so417404137.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:53:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792414417; cv=none;
        d=google.com; s=arc-20260327;
        b=UCYUez56Acw0BtYFQtTPWtcL/+gej+35hzDZXvCcDYoGIup9rCjiXeKEI1e5EsODhk
         iY7k84gEiAuNa0KPfO3djfhh2ud01vEIX2Xyt9vSsA8KXVMxQkgrYFoX/THJ2iwNldYF
         xBXr0o8OPgWi/NsGrJx6FJlbTkuVAAxsXtns8fEpCDxYnt4ODl8qNY69QZ0Q6RWH01Dv
         KYS9QyCjPcJZsnhgbAqfwW/3nXLFp9PKnlB9dgDU3mB5myZdzCtRR4+4dVUWcJtWTTiF
         3roroHYIMwe97XoQnPj5LEwZCK6GUSvfwYwU/99XN8qzfel/9+B1ummx8QlT6Q/ScsqO
         751g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=3/NLlVqFCmhHYroSfjpjqG8QkfUxXfmrd0tU9Bct3fk=;
        fh=sty6WKXGLJjMKzPq3NBrrJWBGUhV3Zp82Ep7w/OU9xc=;
        b=YtpkrNuHmXKMwZ5Dtiuv9AQn7MPxGXRtr5quNExkUJvOgd27cAcfQZ5FCIFNuQFlP9
         XaAdcx6aOBr4k8DReJc9dLOmcI2xD2pONqHuJfgZ200nEmExg1NkyAfaEhnzo7wRH2vZ
         OUVopYUeHguGvfeJtyqfurgzA3NSmcyVIrkCozg0fGHYJmXPh4i6mlwnfBHdGqY5VHjp
         lANWmhfWSMxYIqU0lDtfqYlzZe74r1I6x7ebvOcHksqbY3BWR6BCqCv7peLrt79Yj0ej
         lPcmq5gKW3Yv7K5+TMdBlu2ZrnAEkMsD7UKrwSprIVwO5D3ziJqooYd3QLNQgz1CBoCC
         IO/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792414417; x=1793019217; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3/NLlVqFCmhHYroSfjpjqG8QkfUxXfmrd0tU9Bct3fk=;
        b=G86IfJhFKtisRX4iI3xEJfm4QccbjcJM+c4D3xZNeCyiQrZ2vQen3LMKoeF7JYD2+u
         CBmvvuNRo7ZvD6bLHG2/k77zV2JzUvmBS6gd/l0GE+8vOvYjrtBsgErpw9r2Bwit5J/Z
         /evQpQASGHqLN4yZsPUpcTrTJYzEtZG5gRGiknKoHILHZqtnc/9uGTWY7LtFrwc/YGPp
         qgZW4K38UMdTDyffNX2qVvm+qVzqtFzwhJINtrpJkmTIo99i7TEtj9nEcKJCh4kG2VDJ
         d5Gqkt3ZFQQ8KEmvBpPaVhReIlEXYd/vlMuo0u/tIIyGefYr13LxbLm65fzT5QisQWi7
         s2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414417; x=1793019217;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3/NLlVqFCmhHYroSfjpjqG8QkfUxXfmrd0tU9Bct3fk=;
        b=2QUXMsu5IA9n8oe2td2Xan0nnIFgcggzw16Up97A95+L9r1haTp3ij2kvUdBixpYaB
         SwIG04rae++QltN2thVR1hJByTUd6ONP6hT2y4k1UWmpYaaH6deycv63wZ0FoRl+BfeV
         9V288H4PuWwA3EOB774h90HIPcOjUPkQqmArcz8GhiSzIV6yWX29QLZVvEa54snxwvtp
         Jlc1J83RQt9LSFFfMWBniDkpgWUQ40eOkvuk2+wZ1W4x+XppNwSANukFIT6+dEtN4Td4
         R5xvHaXnRMYXllax9tnTWbTn4uv9aRv0DObGMNUBFzUWaOYP3NklBVYnxOESS7o0apuq
         6BLw==
X-Forwarded-Encrypted: i=1; AKwUvBxYPfEKU4/e0+ojymhOylOsPcFz4XCXjXNm8n6PubqFrPltUaUq3+cuysLwrTvUF69nM2Koo9KfsONrIrc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoTHhH/zDNBhkJqKl2fteNcacA9oJBthK8XiYoyNnl9ZwpxMq9
	fPgNsPMNsxRufOZ0D4a33CrprFwMyFv0T5hTLKIKfz8ZmjprW2ibarTM5jYpn0Ii+VPZtoHrk2K
	oWN5YFBYoB+CHEMIOpbdk82hcpnydvcA=
X-Gm-Gg: AYBFou3h+nI3Uj0SApwQawK06F1Oe+l1A31yYDBrlAaNCjHDqja9uVGRtIqrwK0n6CN
	jKFe77QOfi7LGSpVEXMsIl6p18EEHBBlFdR8FCDJfJJ/5ygoytIDcDtiH7wuEyrXduKeE7lPxsG
	wLuRLmQDQQpPnxxBKs84yU79i2o8rWHcuTfzaawugu9xvziXRERyCHAwMLkaHu67eqhGYKuFH0N
	RwO7L+ouJyPhmV7yOLetTllfGCDe7u194FIe2PVBbmUhxQLfJstDAjdA6n2EggP9YPA0mvWJpge
	ChBOrh0WKWZvMY3dTb3cKwrshmqTbm5A90j/q3jzAS6UoAS5F/M=
X-Received: by 2002:a05:6102:75a:b0:7ba:7a64:5946 with SMTP id
 ada2fe7eead31-7cc1823be8bmr2109998137.35.1792414416776; Mon, 19 Oct 2026
 05:53:36 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 19 Oct 2026 07:53:36 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 19 Oct 2026 07:53:36 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <atXu-v1i-xfbEpr8@ashevche-desk.local>
References: <20261018-adxl345-event-state-v3-1@gmail.com> <atXu-v1i-xfbEpr8@ashevche-desk.local>
From: Iron Berrington <berringtoni36@gmail.com>
Date: Mon, 19 Oct 2026 07:53:36 -0500
X-Gm-Features: AclHuK9aJJ9socvVeKS3UCCh5J3roGS5cdnAdGir0viMETLtUE_cFR_H88lVd2g
Message-ID: <CAF2O-sNPw9=ihB=zW1Te6Lyu+wd45QUPJH1oHX4U6EB=KxCHVQ@mail.gmail.com>
Subject: Re: [PATCH v3] iio: accel: adxl345: separate event state from query errors
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lothar Rubusch <l.rubusch@gmail.com>, 
	Joshua Crofts <joshua.crofts1@gmail.com>, linux@analog.com, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thanks for the review. In v4, I'll replace the two breaks in the
coupling query helper with direct returns, and move the error checks
into the rising and falling cases in adxl345_read_mag_config().

Best regards,
Wenqiang


On Mon, 19 Oct 2026 13:20:42 +0300, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Sun, Oct 18, 2026 at 09:42:00PM +0800, Wenqiang Zhao via B4 Relay wrote:
> > From: Wenqiang Zhao <berringtoni36@gmail.com>
> >
> > The activity/inactivity query helpers return either a boolean result or a
> > negative regmap error. adxl345_read_mag_config() converts the latter to 1
> > with !!, reporting a failed read as an enabled event. The disable path
> > also turns a coupling query error into a successful write.
> >
> > Return query status separately from the boolean result by passing bool
> > output parameters to both helpers. Rename them from is_* to get_* and
> > update the event read, disable and link-bit callers to check the status
> > before using the result. Preserve the successful coupling-mismatch
> > no-op when disabling an event.
>
> ...
>
> >  	switch (type) {
> >  	case ADXL345_ACTIVITY:
> >  	case ADXL345_INACTIVITY:
> > -		return coupling == ADXL345_COUPLING_DC;
> > +		*matches = coupling == ADXL345_COUPLING_DC;
> > +		break;
> >  	case ADXL345_ACTIVITY_AC:
> >  	case ADXL345_INACTIVITY_AC:
> > -		return coupling == ADXL345_COUPLING_AC;
> > +		*matches = coupling == ADXL345_COUPLING_AC;
> > +		break;
> >  	default:
> >  		return -EINVAL;
> >  	}
> > +
> > +	return 0;
>
> Replace 'break;':s with the direct 'return 0;':s.
>
> ...
>
> >  static int adxl345_read_mag_config(struct adxl345_state *st,
> >  				   enum adxl345_activity_type type_act,
> >  				   enum adxl345_activity_type type_inact)
> >  {
> > +	bool enabled;
> > +	int ret;
> > +
> >  	switch (dir) {
> >  	case IIO_EV_DIR_RISING:
> > -		ret = adxl345_get_act_inact_en(st, type_act, &enabled);
> > +		ret = adxl345_get_act_inact_en(st, type_act, &enabled);
> >  		break;
>
> It's better to spread
>
> 		if (ret)
> 			return ret;
>
> here...
>
> >  	case IIO_EV_DIR_FALLING:
> > -		ret = adxl345_get_act_inact_en(st, type_inact, &enabled);
> > +		ret = adxl345_get_act_inact_en(st, type_inact, &enabled);
> >  		break;
>
> ...and here...
>
> >  	default:
> >  		return -EINVAL;
> >  	}
>
> > +	if (ret)
> > +		return ret;
> > +
>
> ...and avoid adding this one.
>
> >  	return enabled;
> >  }
>
> --
> With Best Regards,
> Andy Shevchenko
