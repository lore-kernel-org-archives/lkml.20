Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E96D493D2D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680586; cv=pass; b=iCB3cAIjNTU8FU+xr1Pd2OmvHwJwbabCG9kYjIW3rUc2NRRs3UQ3QAoI9NjNIIS6vSwMWIGYsFgm+zfX8o617enn07aBdAlmIkDyixT5GrOW5V3nKLSr4VwnhtZqzO3Yrtybe3AFwvkVqlhry+MNeH9Uo8TND5mC6U1GGfy0kRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680586; c=relaxed/simple;
	bh=qgLoDi6Xh7D7JxGbAM+LdTIwZ8wB4ozC9PqydMFa25M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFbALpQYYJ+mHbGf5ocGY29V1gLdDYM6yTHldOAb4WbAxy5Fmocv8sPzDJnGEgoUuHNYs6ALBQ6pm3y9O09k3geWXda/Y3ZZtjS0TxQ/v8tJhYBYH7ke1DfvB3Kfmtvlg8eUHoB6cwXtb6wHya3kYbMlzXgMmVp08gfJ2hmK9zU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v31K2xAs; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v31K2xAs"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059f8so10649e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789680584; cv=none;
        d=google.com; s=arc-20260327;
        b=fu6Fpm7Zf7lwIQ0VOP9SjWuUrhcxBB+08sVlUW/FavtboTVlNI9NjowFFWkrDhRuoM
         RF+ZG0zX4K3QDxNBKkUmYqMhdX0R4P5g+qCIv3YP4QdBV9kmXtYrNdSx483TvixneTca
         orekSZ68s6HtEe61NU2bD3spiRfSjoEQ1Zl168+qxFzY492z4wD+af6Xc86z06cSNDGC
         2sOw89Q51r2/IT9VNsUUazG1aewTFjGjQy2M5SK4scLCR1z+gNxg7+IMWH1PGcNEx0Vf
         uMYZj9YKPj1cru/ybQ6Tj4G/573rCeaxV5HJQNSc+IokmoXoUU4doUih74oF1aAKXCdm
         2NPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qgLoDi6Xh7D7JxGbAM+LdTIwZ8wB4ozC9PqydMFa25M=;
        fh=9sXhEpmmFYpKvY6N7LGRsv2Xkptm6o2IDwWC+5tbLQA=;
        b=kt9y34gQgigzBw1sH9XLbbG/zhp23X4ZybHU5RjROSaYLZ6pQSCnI6h1B1hiW36mJz
         D7LNAAnQ2wgy0zzBHTZEN3I+F/2iWk5fPpaf99uuu/9vmuDzRz9fBj+10mTv7DLkVqES
         NaxBxFQG4gQ3UKiBpNy/hJ/PIvu28NeDGLLJFxHZYENTA4VU1oV/EkzjPDTdOqR7AwLN
         CdV59v/6/+tmMdZj4iuhPVmYG+j6x2VXt99oDqTP0yKpEwOmTE1RlOFR3NbiUI2jfjGi
         8BOr3O6YZ3UEVvNuafCa2104NtPegpUYC09fJIgRiTNx1OR9PPQkuLOrCFdEglFHxgra
         WT7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789680584; x=1790285384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qgLoDi6Xh7D7JxGbAM+LdTIwZ8wB4ozC9PqydMFa25M=;
        b=v31K2xAs4kc1vZHOyTkWByZOM8TMy+phP7RpVpUuEOX9a8GRdHmduPj94d3Nh1yhyw
         WUutoWbMfwDMqCL/k8FXhit1X0/ybEB4o9T7W3SATErlhIc6Y3yGfaYiULrPucGvrqZQ
         uE5BD1s6zkUxXsISYHIkJKFjGg9nb2v5GcNQ5j/JTdAzrVKOo6xu+PYku/PSKmP8clRW
         qZ5eRtin4lNoelGVoA8kjcoMIl1YOwtKwU44sY1gW0OZobeVPGbdD4IAGGKhQqlVEz2b
         sIrnscC+Ord8a7/IlsVdgpgNh83jL3rfOHQvEcSVgL0tdvcoMliiLsnN1VIm/KusAWk8
         pqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789680584; x=1790285384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgLoDi6Xh7D7JxGbAM+LdTIwZ8wB4ozC9PqydMFa25M=;
        b=mRkHN1Xy5gaCOrO84uD6QS3toiOsgGV5xGk6YTMYMossHBo7jN6fU2mGg8UfQwq4w2
         PykLM4Wf4y1niHpm5DIvhdVJqjIkQCezQfKX47e1QhPWA0DMvOd0C1LTmmwpRAHEFnBW
         fsQRG4xrXukEZZT7x+ADnL3tAhqW/Q7312JO+8a0wRLaoqGxmf6nhYPv5eu8763nmFPh
         BHqGwTRiW8D6/uaKOMXKnfnUHCbRyK6okcjXZNf3vOtEezqpRClVEnMXDQI3yDg22jqv
         cNsStEhYKsuHHr38+NUrZWlKdEjawntXnQF6kIG4JqBi5YNdoZTh5bP0V0tYmh11R+KV
         G56g==
X-Forwarded-Encrypted: i=1; AKwUvBzducCUZVdFVt728qSxlATQqKeck23T0wZuKhEzwBoSLjap3iZOEWUpzqTlqnMN4xkmriYcfpSF/torBoM=@vger.kernel.org
X-Gm-Message-State: AFuF++kaETdMGEY23JgY2vr/GVxJ50uw+eL4iQLcS+OxY3dhMbA8QnpP
	V+O595uzDigtp5fmsB8JsvAQbNTu6XBtbxDRO2LUb2PtKTDzAe/SqKZa8FTN6aIB8g/CqA0EyvN
	9qTrfloGn0Qfp2qirBRkmHnlSrBJVKYdhr/U19xQ=
X-Gm-Gg: AYBFou0h4egiDuvnZqUpTFuwTSUvw+FElmf22UVdSeEZ+2+y/sM9XVDoBJ2XNKsG+1o
	DteLbA/vDUCXjeIGJWB0mytw9ChaYzkEp36QUWmVRHPaSlqDJUjnydnPH7pPtRvL5qPtsx3G3tC
	blU2lao6WKQuRc824WGGRrvvqJoAnnBI2bMX1U06Qx4r/z1dQ2UWMg9lgpUE1tCCBShyrn7o37w
	kdSRwZBXIAA3DuHHxVd2SGax6qJlKufuiR7YjO2Kh03WMc882kP4LpY4jf4jAeex/bz8phxr37W
	DYqgpUuQQ2AN2r1EEFnPrMl8pLDBC0PJR+dakIw5vBX3DC6t9CSmmK7GBxdIduEzh2u6TKdqto8
	/3b12kN1XaHkjV7NJvfJB
X-Received: by 2002:a05:6122:328a:b0:5c8:4bd6:fe with SMTP id
 71dfb90a1353d-5c9b58e4d13mr267621e0c.8.1789680583441; Thu, 17 Sep 2026
 14:29:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916222125.1259631-1-morbo@google.com> <20260917011359.1585961-1-morbo@google.com>
 <9DA6BE5B-E65F-4E8B-8B56-A861042100E4@kernel.org>
In-Reply-To: <9DA6BE5B-E65F-4E8B-8B56-A861042100E4@kernel.org>
From: Bill Wendling <morbo@google.com>
Date: Thu, 17 Sep 2026 14:29:26 -0700
X-Gm-Features: AcwNN1VNx8kwm1pwS70fvvLDvkNMIiJFA0qoHj8KSyyD3K9Zmt_H0FI-tXmjMpE
Message-ID: <CAGG=3QV0yamwdhWX=vB4LaworiOJ0iUaDCJ3E24Wh8NHgHXpuw@mail.gmail.com>
Subject: Re: [PATCH v3] seq_buf: add seq_buf_strlen(), seq_buf_init_append(), seq_buf_puts_trunc()
To: Kees Cook <kees@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 7:24=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
> On September 16, 2026 6:13:59 PM PDT, Bill Wendling <morbo@google.com> wr=
ote:
> >Converting some strlcat() call sites seq_buf need behavior seq_buf
> >doesn't currently provide, either directly or without introducing subtle
> >bugs:
>
> Ah, our implementations have crossed paths in flight. :)
>
> > - seq_buf_strlen(): seq_buf_used() reports the full buffer size when
>
> We agree, we need this one. :)
>
>
> > - seq_buf_init_append(): seq_buf_init() always clears the buffer it's
>
> Oh, nice, yeah this is cool. I'd like a different name that mentions "str=
"? Maybe _from_str?
>
> > - seq_buf_puts_trunc(): seq_buf_puts() (like seq_buf_printf() and
>
> I prefer my solution that just truncates and sets overflow. Nothing i fou=
nd needed the non-trunc behavior.
>
> I'll send a v2 of the other series with seq_buf_init_from_str?
>
Hi Kees,

I didn't know you were working on this as well.

Andrew, please ignore this patch. I apologize for the spam.

-bw

> -Kees
>
> --
> Kees Cook
