Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8D353D0B8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084370; cv=pass; b=tB8wFNVecDINSw/6vm+oLFFoFFxp0z/p8CeVVNIIWy4VzTVQgZcOCKctUC4zSyCbXerDOqdCorAGhZzM4ulzVkhcGhHh9hGvq4sMKYcOTDoZcxRUUxYRcxR7fLKV07FHxFeQKyBHUMAdQPOvP4lPPPvwRt6BMKfj+AFoCxxI8e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084370; c=relaxed/simple;
	bh=nD4KsEaXnEP1yIinbRyVG2yxCHKl9vThb6+0s0ZuEkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IazZtu0Wu/S6XM/qGvZg3JUmhDPUwhqUmE0Dwq0ftExkxxBWC5HBkWi0+Xnu1cqJJKOaTFqgvRFK47BgbdPSyAzguQIZ4C4BcU8pWLVw6UsbZc4LZtzkS7m/gWnvMxfkxRr8JQGj+ZwKEIWsRpRZ/zJ2AclFPR54lRMdSZFduoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFv6TUBv; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFv6TUBv"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bb7acc6fa0so413598e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792084354; cv=none;
        d=google.com; s=arc-20260327;
        b=c/DshvK9iwVRaestGMovtDAuyLngdlEJ4b6YyfMEM0YsZuUJUV0zgmWKM+LcPfUY9e
         /nCDckaMl6fcaP58BZ8E596Np9r36/wG1NLrRm6uT8qVVR0VTKT4jLYxwmZ/8oJ2Jb6s
         BZiVKlZJKKDWGOuLcJaX1YTR6XGlpPopFi8ciqxN4DmZKN9gEorKrQ54QMavrPoeCKay
         GCVPy4qNJgu1uWuO1qcADW1jsjAZCTzFGqeXna3rh32VhZ0bRqmTBlJ+jve8PjnMKx9e
         r9xIepnky6uY5Hs6KMLdz6UzkznS1vzpWeYYbwRiX+OxgJ4pVLFrjQ2LDW5Q0jXVrL4u
         9tGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nD4KsEaXnEP1yIinbRyVG2yxCHKl9vThb6+0s0ZuEkc=;
        fh=l5qJkaPEIKsVXyIF+JlOlydr6BcNdes5GT0O4rFhAKU=;
        b=MvwfEwp1jGrIvTAjRYgUKhjqVhRzkxZKgOEmkGbFtsGJhXwbTSwSKByuT8Ke8bPbaD
         Sc+ekLIYqDcXtasD4W3ctwfxaiBXbsiIgiI6ceJ90n280Al6z+y3HbWvHDtzoISPIMMD
         DnOTO4BOhaiOCgSnIijq7wF66f6f+EpmEv0K1YdxsCjKA47A9bCR2TSj1cXPcVNb+djm
         6oN+/S6tzyJ0JZePInmLeFqaWa5D+s5cfR0iPExnGEJPnsV5+z0aqoaN+MoxzWhWrALH
         NJD+KIK+7ReESabKG3i3QReOVWOgzBn8IDFkGLJL2BIGbmNZ5HV4WG00dC2jsj7JEVG7
         THFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084354; x=1792689154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nD4KsEaXnEP1yIinbRyVG2yxCHKl9vThb6+0s0ZuEkc=;
        b=iFv6TUBv8mOfDTmD3pDNboDied+jblDVX8E1mJBZdetQUA4Fcw9tjZGcD/q92VuJ2F
         +EUWfORQ2EnCGZjWiNt/oKw/PLEPWBcynUEt4lKV9v7mrIehbsvge89MhSBrusxKt5cH
         4sLRmo8R7OP4EjvMSpTbIOWqseI431olO8VqjHOuO8z+rT+wAr9LmIvIrOpNbikns3EX
         MoA7Uk4DM6/AlrC2Yqx9bd4QnB14q1tQunu10Qs1B1avpykCRCPkbYUMm7L1bFNRYjdV
         o05vZElQLgcZhm32/vRG1vhRc7gcKPJRLZnTjPhSmnn0MImacUrbt2++Zh5jnAgmin9L
         i6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084354; x=1792689154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nD4KsEaXnEP1yIinbRyVG2yxCHKl9vThb6+0s0ZuEkc=;
        b=a6BaTGjdSq6Zlh7AGir2fyaWPwj+JsVbbS+JMwRdMh1V+iDBjFPhrKpKH9cZoNdAhH
         8PYgEhqdMHb1YTyrSAD3jvDvHHc2WMpbDeRuLP6cIzvC+gdNHR7STwCXQWf1dTO6IaIV
         qbNk3Rv5GCpq3/hjUW6pSqxEb/V5Sb4FzvcYBUHFM5QYRJvh4LJfO4NI12S6aRbwJ3PZ
         k12lNVvfzEg81PZR/nNaSKRx5dAmfNShI28vuefYsuDNbk4qQcf6hwLUBI5Ru31Rxg6K
         5bX4jVIfhz+KEDhyvay+W55o/eAWR3x7YNb8sXkRACoMmBAGPON8uBdNfLeD9ikqliF6
         nTFA==
X-Forwarded-Encrypted: i=1; AKwUvBy3EnUaCph+kzNHR7kHtKjIkJFs5JBAfqrjUneSDOgMzZYCyp1Yby5ql8T7Sm5FSIAbpvDCbg/08inB6Pk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCXrxZXXSP5HBxiMSLsD7ryLe8nnrYR4HtUPzPoFlWtfk+xMT3
	eChNgNXlY8KmvZ5w0gJcB0yPhsy+nTll6xIY17xwk9k3wzIrMezCRd7sEYHlei1sfCJmI+4ztru
	f2I8P9Iy9IFCx7UWYGs5hQrfpUzAmiGI=
X-Gm-Gg: AYBFou1WeI+CiQkhXZF7iESKB6BLktS7iaJpuNEbYaR3Zmlcj20YCEHxKlYo2cBejru
	OhjGeRaTpm92ujeK4K2uViKBOvz8EfvpSOC3ya+RczCqhtEuD2AhdGFXzG/Bg/mwtqttbHHPt2q
	amstn7USuSZMyi1jlTOd7nX72OF58Z2CPFERh0rTZ9h+7jXas5WkAjaXXNXaejiH2VzF363OcgU
	uMEGSwaS/DYJbMrNdtqLvOlJMlCVKKhPgC4x0ZPXUI75uvewvyzP1pB6voM1eQlpi2APWcUvsR8
	NcEDjNUSDcysB//XznLT85XIudFBHn4KtB/Lal4FsE3MJ6Fl1pOqsT3sIaluBasPb3+ynHT/B44
	pNfzYl23ZmNxLN53mdPawBKihipO74AfpCHHbSUEMy533pi/eRjmnJ8NlRxM9Qt5jAW/B9581W0
	12fY7jdiU7Z3K0PR3xucE9jtozYJKbskHBjH6+P9Vm/8LcN5nHE3c=
X-Received: by 2002:a05:6512:6882:10b0:5bc:e27a:5f91 with SMTP id
 2adb3069b0e04-5bce27a618amr4033303e87.5.1792084354377; Thu, 15 Oct 2026
 10:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014232030.GA3382959@ax162>
In-Reply-To: <20261014232030.GA3382959@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 19:12:19 +0200
X-Gm-Features: AclHuK-rFLQqM9_y82j8Ip7FLTl4UEhuh7F41F3OQw90CnQLbJzYm_7TdNUyycs
Message-ID: <CANiq72m14wLrcr5rfN2SADH+D6oQDp1o6R=d_NNkPkarS--ZGw@mail.gmail.com>
Subject: Re: Prebuilt LLVM 23.1.2 and 23.1.3 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:20=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 23.1.2 and 23.1.3 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 23.x
> series is no longer supported.

It seems to work in my usual test:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

By the way, the `rust/` folder is fixed on Rust 1.97 which uses LLVM
22 -- not sure if we discussed it.

Thanks!

Cheers,
Miguel
