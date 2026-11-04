Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816092;
	b=aM9Q2z1905eTRkAdqg7b7BXOmQ9peFdA22m0km5Ei7ShKEV7N+9RJ4ZwLuISaRjY3vYU
	 kMjcjgm9WRdBXZRKfnZspUbW3ODj+RoUMBQ/paybOpMirL07bK/80tFo15mNnBECaROqM
	 KC1p8Zwyw4JVmtB2kJhH2GWvCBKEb03iJ1O67tRJxSFeTNSLjwkP5kD7+Vt9zWjqJyMmH
	 6f62J50L7ZFf2DkpSljYAU1KbpbPbYXkQu3K0wNBmIAc5c0or5EXqPXFtS1HvzMl4a0Aa
	 ZytQ6n9sEGBrF0XoHVOfalY2BC4WIh+u3nWHQJVI+SCb9fOMnR8bnQyq8NVnYDPNB/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=DfeGOvmUfDpzP4mFizKgHmdxnSnCScH5+Avbi/H3FJ0=;
	b=OlkhYC4VAaixhHw4IzviGYR2euuNqcd3D8uz5gQuqPEEPL7QQoXqRIq1wnDs2WgBrCmt
	 EvtZZliegDzHWbf+G7k3Qd5FX6cWM9VCUMpMonswWU9euCyjOKWvNFFnCL7ARMNa3KfW2
	 uXIjk0d1EKY2sRqKqALKUvFpgxjSNV2E0V0srE9ljLsniZevu7KpWkHTixcXGkvj5ak8v
	 GDcL0wSm+zc9wXl8ojpFpU4MgU4X5mpDr9Dr0vBQa91ErYpiZijh7SJBQA/ApKdAv8fWL
	 DnfQ7JmrrlBsqKyZIzsjA0yVLU6IL92CwE0qzOZxHC20WxZKQxJgqGnQUu4i8QrbQEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bbE59zz3;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E31606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73E31606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bbE59zz3
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35b2c599f43so91551eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816092; x=1794420892; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfeGOvmUfDpzP4mFizKgHmdxnSnCScH5+Avbi/H3FJ0=;
        b=bbE59zz39uwOkY0/iXOQ0Jr1I+oSgVCnw1LdD3pRukxMtscF+4ARLgd8nkwVx5VgwJ
         b+CV8mEZ1JJi/rx/7lueEkwL1ebcPSaHF2OvlR2qTGlNOWnesDSYJUnRck8R1kU98Qc2
         o8nr6tY6D+sicml+LQqVNBiY0r1dCLCzfBXpkjxwVVRjt4RcBlPFOZHtirCvw4G8HOwW
         z7PI0Drkzk5BdF/XwfywBZjzbUV6ojvwwfFBKGP2JpIWwwMpNFYPFBmIK8KRImpiu7Vm
         3v2rsqB3uSgu6/ePCjgIBVnyybXG0V1ijAuy5uOL6bv8cC8bIkSdutpkJYRuuqHYkahN
         1CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816092; x=1794420892;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DfeGOvmUfDpzP4mFizKgHmdxnSnCScH5+Avbi/H3FJ0=;
        b=zWvGbDYNsEKBF9IZuJ6tU+5OPCi2kr8MlFndfAEhXEdWRPQp6nKo0YHd/mn/m+ZdR1
         Wx+dYxoUvLr0jDFdsw8+vMEcsFf+v8+q+ljJ36vG5Szhyf8lo7ZkQ07n31EOIPvrSAio
         JsCr5r8O/W/Mf/RW3kTVXhayJQvNrnQEZGbfS3YWxjfZoqt8zi/UTzJcVBw/4gGXNULg
         3gC7UlJv32UMMC/WRk/SfIoR+bWikHzTcPTf6mtupMM/LG855nWSojTaFZawspt3Mdti
         xcmmE7WImcqLqjmJb5T7KAfpYAlJGUjoi3ouhNY4nS2lv+08CJd3VBoJD3TLJ1/U4f3s
         3PJw==
X-Forwarded-Encrypted: i=1; AKwUvBw/1bVEcpujIc1gMJpS/QPL7njhlLUsxcqaa1euct6VK8XV0A8btQiUpfnsK2y8Q76vQV7sLt3ol8ufcGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h9U0mj+Ww/H8Ksm74roIlyTUzOHRqbOkXs4Z53X10rtr6w0cL
	eQ1I9pIO6Gw1FHPNO6/TGxN7afAUIF6VB2MYPtqXQGJFiDwErwzIOkOQ
X-Gm-Gg: AYBFou3/JJr0rEpemUf7H0MsTWC/d+LvOpKiB3bju/Vi0AUfyQcr1uyncs6Y9M4YAEx
	jXAz/+wvZzN8iFBR4Z4AzKLmB6/+lkpHjPRrMte5Syfb3Aa7W5udtbMywSpQVPmkDKqBP8ZXK1L
	kmfPTtuQoZM3fA1wOr0IIwjNs4xkWw8Y6aPN+c2ovnN0FWIv6ZU59MJuQjHWjuzHRgwNTUIQkCQ
	0fL6p30UdqS088C+TL7u2E1jD3afCz10Y5FjuZL2G5/8yeZWab7A2yCVyowdgc4ZQOfECq3Ea41
	dRUs8VD15QDbZdmJlbePSK4qLZjk+j0rapbUtalThA2obVAPB6TKgeBJ4wD4n2SqTQ67cJ6VxpR
	7jRmCUmi+QBUnCYBVMCJd6pNVHv+ludwbAnaj4WHmxH5obp8xCaPvje/w+lLuoXObARJcdepz+6
	/YtQKbUc5pu7hF2IUkV1LEuKG92o0NGV8w6ijQ26DNkdeMphRSfvjRO9IJ3ZskJ2HM+bZQUNRB0
	JzX/gkQS564e6ko+/BCmZT60TsGf2SkiFu98+rRWDRiftuOD4Bs+aicz88M1CMGXQliyjBWbzL2
	a0fP2KUTvTY508lKysSWRSweEQ7FG5UfZRQw40Gzo9rRagY0T8kX6WtRaaisiU2W/Z513k6T0cw
	TRmybx8EkEPM3R9xn
X-Received: by 2002:a05:693c:6092:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-36a423e52c8mr29585321eec.23.1793816091527;
        Wed, 04 Nov 2026 10:14:51 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:920a:44a8:6f02:232e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm9024708eec.8.2026.11.04.10.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:14:50 -0800 (PST)
Date: Wed, 04 Nov 2026 10:14:49 -0800
Message-ID: <4e7b28ae9ad5de3708c549d62a4bae68@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] gpiolib: avoid krealloc() in gpiod_get_array()
In-Reply-To: <ausjJSZkaGKNfykE@ashevche-desk.local>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com> <20261103-b4-gpiolib-free-v2-6-ea46767c9cf8@gmail.com> <ausjJSZkaGKNfykE@ashevche-desk.local>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Andy,

On Wed, Nov 04, 2026 at 02:20:53PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 03, 2026 at 07:40:34PM -0800, Dmitry Torokhov wrote:
> > +	array_info->desc = descs->desc;
> > +	array_info->size = count;
> > +	array_info->gdev = gdev;
>
> > +	bitmap_set(array_info->get_mask, 0, count);
> > +	bitmap_set(array_info->set_mask, 0, count);
>
> You don't need these, as memory is nullified.
> Also note that we have bitmap_clear() IIRC.

bitmap_set() sets bits 0 .. count - 1 to 1, not 0. Both get_mask and
set_mask start with all count bits set (assuming all pins in the array
are eligible for the fast path), and then gpio_descs_check_fastpath()
clears individual bits for pins that do not qualify.

> >  		dev_dbg(dev,
> >  			"GPIO array info: chip=%s, size=%d, get_mask=%lx, set_mask=%lx, invert_mask=%lx\n",
> > -			array_info->gdev->label, array_info->size,
> > -			*array_info->get_mask, *array_info->set_mask,
> > -			*array_info->invert_mask);
> > +			descs->info->gdev->label, descs->info->size,
> > +			*descs->info->get_mask, *descs->info->set_mask,
> > +			*descs->info->invert_mask);
>
> Why not using %*pb for masks?

Switching the debug format string from %lx to %*pb is orthogonal to this
change, so it is better done as a separate patch.

Thanks.

-- 
Dmitry
