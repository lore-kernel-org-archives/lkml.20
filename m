Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A25538642C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791861909; cv=pass; b=NyxMhdnMoI5jiHM58ipBOByfjAg6WdMknGCNyRWHf8U7tfbsyO3zqj0tjg/HvZLRHXELJ9xuLmjSW0gRxFYpv0AmcN88qWL9B2UdvG2SfVOwkE6T23PyMhtUGcWXjfpGuk3TAuAyWnT1Ddd1itzqrvGoT3vQEnjMrAlLX6/W/m8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791861909; c=relaxed/simple;
	bh=Qlj6+PdrddA+XIaFJDL/MjE18zhPUetQeHCIDXrZrJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJdrNyd8mk4T0YTKBhNEFQ003h43KVzYASS9T/HfPXNtCcjL5y9ORMubWZU9epx1MCYZr5zJds+d16dNJuDpvRQYRXSz4ZDVV7+zvURzJstoHabhGe649XWQfz3vWCIgomfroIG6rNV1k/bEnJSr+2FTZh+iNJrrsp7fHV/45n0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJecdFUQ; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJecdFUQ"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a9787a14ecso17794851fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791861906; cv=none;
        d=google.com; s=arc-20260327;
        b=UHIoDT+L2aZUGLWLfbON0ocjWPOldQdIhL1blSRKiy/dMFgziLXgOsxbA1QWdSw4Ys
         WRxDYS1j+uMGFnn1b5ZmoFM1C0PkfOc/ztj624cSmkuYPhPY60tTrUkF0uFpguLApaMy
         0U3yzcgZEl7T0RlVktzneNKEC+5JoPZxCVHNKXO5mqoVxdLEJNA+EGJtpF4dGtcPxH/Q
         lVK4Q78/yqW2cE88oZJMJsCTAhqflta+YjCuPPXiMOGLyQDcC2iIvePTZ+O73n/D4utB
         1gsaFZ2Y9EiVaEGjTF5+38zInsOhueMSKLL9kZG4SfXPx0CggvxXZ0yTyJbE1Hr1fToU
         /reg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uTqggzvRy7T1WnAA8c/5d02IgpIAPQR2aC2FYAifG4U=;
        fh=F31zNm75KdyYAPdo8FUq7Ohs3lyAXW8plbxzox42Xds=;
        b=BGA50bX4JkuD2Wi3NoIgEgDgtwtTJQzQz3C6B4TpyX2YWTnQpawWvgBxMkudfx4ghT
         42XRSKnqcbbe+MB3BTp652Yz5ZQzDwWSVJt8m2KbzA6e9MBNxuESTqLPYnehm8kVzt5I
         yXcUW73ygAxSbvtK3YWRnHwXdQXTDByjo+AUvFnm/fObO45+OJ636cKBRxJK/y7+aYjN
         rx/Z3R2iNxM3oq2QevR126KNkxi15K+ihCh/5+T8Txn6Bt4GDFtfO7MiRGhI3pS2yUro
         CiDHyTD9Ppdc3L8TbERGSyiqQS7fSOjUjDkd0pohP+dsSSg3HVK7bYGQXFAJRguwWLxs
         DjZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791861906; x=1792466706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uTqggzvRy7T1WnAA8c/5d02IgpIAPQR2aC2FYAifG4U=;
        b=OJecdFUQnuUdqqVsXwJnUTlO89VVl6Xc5CuxSDPfBAGG+cZOHO5pbmaIJYlKJ9VKu3
         0jeMPyP1Vcwo5MDlBe2fTILCMaXjjJgIcylG4EJAzQ9FTae777pLR0xG0h7j7zzv/FwS
         GyFxRSNTydaLAM8qZYD3Q/JpyGFRFJVL7RtPL6U23pYaY3m8qDSY7sO7zR7ACBQK6Fnp
         sNcpmhVbOUfIVsB5TzuiW23r9dBgadfFvCs6Ujr+XqFpzvTDo5JSQimjvHCi/btgZnIE
         FyYvzdVPFqz3sqD05hOYDKnLGRP/5/Aar8UrBImRZA+69ycX38eAjZMCkF7hrCPZ3CMu
         RsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791861906; x=1792466706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTqggzvRy7T1WnAA8c/5d02IgpIAPQR2aC2FYAifG4U=;
        b=JSEMZokRBf1n8MStQ+EFz/rUW7K6ZSZhjhHJ6Ojyu6SVhoYuOVoBesfHK26HZ/MROn
         Fx/ngGCQaiEem5lFLSLwucJVtxh7ILMZIGroC7I2VMVlve+gJ4LT0LWj4Z/jfKd2T8Ph
         gjDQRNO9IZWCgMxGrvEi9yWK9GlDK9W7znh+OIioKmRT9EC5U9BQOatYH9YeZIrfqmSj
         ghbb1GI8znrHqa0NOfMtKh0mZFENOCUUSRmuytQUQJ3FxQazqXXJ7VcFvJPwZrOYH4kd
         dARgZ91dIM1npTAyvseuRwu8ebzx/+26hgGZXZhPcAf7yos4B7n3UhRVW6B3w02TJhJ/
         TiAw==
X-Forwarded-Encrypted: i=1; AKwUvBxxRDv4DdbJK+AWYxGhLVsHOSknw31EN2LTqLjXNjIhYKSMCIfeH/ggyIN2km7UpvcSfEFp9CCUJaXT/5s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJau2k/R1lpqUmdjOmzPGTKOVVS+SFKPSzFGIDrLI0t9dhIyL4p
	LEXomd8wDfTsaM324aDdjbUXraFu1S4uxE+X/Go8cc7Ymc2lDsd7Byhw6okxlxesUDDPMl1Ww2X
	O7N/XzbFf93uxnZI26z3EYiZ82mIieMQ=
X-Gm-Gg: AYBFou3Pqogtf7Vpx+Cn8ENCknghdQ9soqOwOZ+ELihH7DUN9t6sF5xQzrCJ6yVEw+F
	VtbFmxT/wFaboxVWhHt1HStuaTXVam+wd1dW+AoZrw7FVGbB4ICfz3B+OxnMMsQh7Fdb7dWHUdq
	8jeocG0HqqxFsL3ID4dWfLY8gru0ThekSx2hwDIqE+KjFYDmrwAxbqP0L8VQoQvHUbTF/9RBSeh
	NXMlSAjfTuqNmpWAj7mNjWEXsrRsNCZLi0Ob6PD6a5JXG9Os5oE0YifS5gmkP0grypRKlM78uC+
	Uag7z7v6VXpi96SIM28i4K2LU2ok/IWIkVuawEg6IV4DgVVwltuY8pzXE74xTkNooJHkAHIsmHf
	04U4yEIgzRNYy7aBF3Vzjaama/XB1XSHEJxMUFH8=
X-Received: by 2002:a2e:a991:0:b0:3a9:76b7:c515 with SMTP id
 38308e7fff4ca-3a9c5253a1bmr24195321fa.8.1791861906046; Mon, 12 Oct 2026
 20:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+=Fv5RJpeusA2W4rRHOJMPRn8iF=OngRy05X22Myurs0wA-sQ@mail.gmail.com>
 <20261010022039.1610210-1-mattst88@gmail.com> <20261012133753.3a5868e9@pumpkin>
In-Reply-To: <20261012133753.3a5868e9@pumpkin>
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 12 Oct 2026 23:24:52 -0400
X-Gm-Features: AclHuK_03Oc5vixjhdWzw-DLdJM5sKo0togD5oZVsH_2hFCEPrVq0SbRDKzpVzA
Message-ID: <CAEdQ38E=_qKf+Ljy0qyBATVnjQYihGOkffgYaJuQLSmxim6Btg@mail.gmail.com>
Subject: Re: [PATCH] alpha: add 128-bit shift helpers
To: David Laight <david.laight.linux@gmail.com>
Cc: Magnus Lindholm <linmag7@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 8:37=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri,  9 Oct 2026 22:20:39 -0400
> Matt Turner <mattst88@gmail.com> wrote:
>
> > Selecting ARCH_SUPPORTS_INT128 lets generic code shift __int128 values =
by
> > a variable count. gcc open-codes such a shift when optimizing for speed=
,
> > but with CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy it calls the libgcc routines
> > __ashlti3, __ashrti3 and __lshrti3 instead. The kernel does not link
> > against libgcc and Alpha does not provide them, so the link fails:
> >
> >   alpha-linux-ld: lib/ubsan.o: in function `get_signed_val':
> >   (.text+0x1c0): undefined reference to `__ashlti3'
> >   (.text+0x1f8): undefined reference to `__ashrti3'
> >   alpha-linux-ld: kernel/time/timekeeping.o: in function `delta_to_ns_s=
afe':
> >   (.text+0x2ac): undefined reference to `__lshrti3'
> >
> > Provide the three helpers in C, as s390 does, and export them for
> > modules. They are built into the kernel proper rather than lib.a so the
> > exports are present even when nothing built in references them.
>
> Do they need an explicit (shift &=3D 63)?
> I've seen gcc/clang remove an explicit '&=3D 63' because they know the
> hardware instruction ignores the high bits.
> But I'm not sure what happens here.
> Adding it won't make much difference - unless it matters.

No, I don't think so, the 64-bit shift counts are already 0..63 for
any count in 0..127. The !shift check is what keeps 64 - shift from
reaching 64.

gcc doesn't remove an explicit mask here, by the way. It costs an
extra and per function on Alpha. Out-of-range counts give the same
results as libgcc's versions, which is all the callers could expect.
