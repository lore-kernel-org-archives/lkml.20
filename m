Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C63288505
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295923; cv=pass; b=N9FzzCKqo4QweUPtP60fC/Xct5DPKhiSmHdTkNow9c6RvnnNtbA7zb+g2vq17EXpOxcWmcIQpEX0uXlCBYgNwvpWFxAxDTzDnSIdOOaOKLSgTO+iGnWGmHHgJ7lP0NkYV27xxDuBP5bWVqJ1qHalthYwANx+kDkn8H5+45iiO1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295923; c=relaxed/simple;
	bh=bATD+9vMV4i+DVgqapoexuJGpF5giIt/ENW58o2X+38=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jewqNdCSDMk7qL5XQY7POdhumu5yxKZngHwr5OMS59rrDDuLD/SkJTWnuV8RO5F2ky/rMZFqXAQv+O7nhiSBpsCtUzIMb5XRDzkUfIbQgx48W+ZoboR9S71zQ4PoTYDIG7pjx0V6wl9P7g5Onpkv2JeHElM3+o0SbRy7+VrKERw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVEMNf/Y; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVEMNf/Y"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c207cb16cf5so32666966b.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788295920; cv=none;
        d=google.com; s=arc-20260327;
        b=f2dKYub4E31+tgYyvIqZN4Y9bXnl+O6OLODYEcMiPX5vxozOIWwZmsZDxLioKHXJJC
         LxP516fz7YB6LbyDlPNJ9EMMAyzQlpzVq0zwsDLnP4rOa9+K6Tc1qOdQVk23+MAx91FK
         gPAr9tYCXf+C/G9Yp0eeAVjnYHhU8mYV3ZmbiMIVNt2BnRJE1zAADMKikzrOaRfo7G5U
         /2k5y1zRrVBF9530gP4SuriwXIGCQ2xgjjDhMAXAtDtO96CPtp50QWddKxr92ge7ImVK
         l3K6bw0oKrPpokQwCLuFRTXcYA5k5ZEnao2yej6w+aQ86gD1KQOfqGBz3zC7S70y7Eut
         AY6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=bATD+9vMV4i+DVgqapoexuJGpF5giIt/ENW58o2X+38=;
        fh=uxz/YlPeat6A9ew8qpoCdQy/Dod5a7S4f49Cc6HWpIA=;
        b=Y8ANg/erxJBMPCyxa/w/hE8J8mfn3vCm6rNWPjwb3PnGjfYncYsilFPWtfSYNtetZj
         w2jzlx3IsW1kQvUEbPKBp/lXNRf68ySIpu72PwG7EtDV2o1HYfHGXDoEC76xd+chkOG8
         RabhnOXga/qk1bJdh0zzSrftydkLc7zTI2cedHgnTV587VhHiFO6gX4gr6PTt3ZrogcU
         0oVsGVNb9yn1tFcTi3fes3ECm7Sc38Rc8Jw2IoXWp9SiIsO3TfLgbBa8jtsVoQvG/w1D
         qYAdcfeZrDBZPPfD+gTuZJh1rpzeph+G3uBsPaBxwxgTCzRvzhofPBvRifejlIJ2S4Kg
         RPBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788295920; x=1788900720; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bATD+9vMV4i+DVgqapoexuJGpF5giIt/ENW58o2X+38=;
        b=RVEMNf/YUuy4lbNYju7Hirs/vvWWLHjupriPAbhvWSA6m7Lt4yO+Z96J6s6ajTbhFt
         uz3CCmbQjHTn4JZUvKALazd9935hUSpJ0z9fWTEMAL4piUGBQoa5tj5G0gOAVJueBKGo
         SpvvLjtaOCJzXbDuces+5Ewku01s2w5d2rwZLp2qU4HHSfsybRYMqoe3UA7bve9n5WCw
         bpliofH0sL3IuV3Vco+8ideVqfK+pGF36uy387riVAWf1qtQ8ogO9ocimAjF5mgBWTGL
         wYunikBtRnRZwvgU5JbS6+mKBz1wJABVHs9Ra+7iJ4Ot9HV+rRFeiMRl2xpQdkcB3p1M
         UxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788295920; x=1788900720;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bATD+9vMV4i+DVgqapoexuJGpF5giIt/ENW58o2X+38=;
        b=ETt5dSEM8eEWa4eY2+LzAul1pKqwDPWJ+ffuvmWJZxrnQEiKiBDByUXEU6/T+MgjXU
         ukQq744qjYVF18G4aow9u5YQGV4HbH5JNKoUqTpSB/JATLr2nWDACWZ5c2iPbol8rGaa
         5A5vJgKOM1ag2MHIEXpyEU6w1BWh8965aYrt+MU0LEmV+xcheKPet3qOBq01cRcq8o2J
         eeJXdUYOLrHJGCXtC85flyU7Nhyjxo7o6yvA3uPSV+f/nLqHAaSijXaXl4B0KcBh8weT
         ZRzB6NZJnmHRNkICVQB6VttFdt/sCK5jPYbdiVwOF0f7WRazocsLbq9QidsqXteimbL6
         2XUg==
X-Gm-Message-State: AFuF++kikoPSiZ8IMkH0yjtGRmHNbEWxP8zB4WGmHez+SBfxsVfB3ZP2
	J5Yon5HjI134FS3Aw8nMA/PNbVFJz7KXDiFLkFVfXS7uC7i+iFjEm3W3nIYzb3kZRz5Fcu6t8M+
	KHT3cZV0KabbzEnn0lh4YujPa+HUE7Ew=
X-Gm-Gg: AR+sD12rKtzKbwxTm5NqeLJS8O+ZSpbDoKDXiz0qGw8pDQMVSAyBBpJ3yFPwmxWB8BR
	CaKrWsaFoBtn/6G5wGqTEJf4Xj5CHa9S4n+95kHPeCmtUTRIy90osaZL5tY2InbVndpbSrBGD5W
	85dtkvZqHWHie8gCzrVsgzkJJOgvg+s0DgNXmawum7b4u3jWbXfGHZC8tlhq4lq48FLg4DeB39w
	lNnT1FS0y3AiZsa6miyjlzhJqjvRcOaiD6Kmzz+gR91jYx7KpMFDIeyTtGgnN1DF7ZiG3B1jeCP
	aTv6BZAbaeopcILhprelpFNcKWaygq8NgGutHwfkLg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a17:907:d01:b0:c25:9195:6ece with SMTP id
 a640c23a62f3a-c25d5597b78mr2028666b.23.1788295920040; Tue, 01 Sep 2026
 13:52:00 -0700 (PDT)
Received: from 292895732794 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 13:51:59 -0700
Received: from 292895732794 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 13:51:59 -0700
In-Reply-To: <w7vte4itudtkw2yf4vbmuofiumfffmp2y52dpu2bqvqtdgjvpd@5femyiozss3e>
References: <20260725182628.221603-1-nsd.project.dev@gmail.com>
 <CAFLp9PEQQVuDpJPwrNvLN1-u3w3TMwZPUUrf0+rOBrvDjBBf1A@mail.gmail.com>
 <anlByPDZmvEhWeXI@casper.infradead.org> <w7vte4itudtkw2yf4vbmuofiumfffmp2y52dpu2bqvqtdgjvpd@5femyiozss3e>
From: =?UTF-8?B?YXloYW4gYXlkxLFu?= <nsd.project.dev@gmail.com>
Date: Tue, 1 Sep 2026 13:51:59 -0700
X-Gm-Features: AcwNN1W6fGPmdWB07o81OMVzEMGuQq_mleLKK15ow4KEIPxh6simphC5SxUnMtw
Message-ID: <CAFLp9PFH350y1OYpDOAuTETMqGf_akeWBMbgoBh-A0R7gYP0Sg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Neural Storage Driver - learning page cache prefetcher
To: Jan Kara <jack@suse.cz>, Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Honza, Hi Willy,

Just bumping this up, curious if you had a chance to look at the
window-size matrix from the 19th, and what you think about the three
questions at the end.

Happy to run more numbers if that helps.

Best,
Ayhan
