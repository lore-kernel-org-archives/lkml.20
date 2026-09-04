Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B6544C678
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535080; cv=pass; b=e5MI13s7/Tg9YUicyzQ62Wt+ULQ11JJRsX+NT/9A5c4zxamOWJRf91LyuidMKfjWRs7Pbx9soWlM3IKsf62x0io5cz5I6lD0K77coPZZiRfnIWKbdK29SKCl83Bb63MISrnHXYNqBn+kqIsMdwP6wDd98eka02hW3Cf2Z7XzVG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535080; c=relaxed/simple;
	bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gyfc4TQvSBoXUXvUQ/6KjMgn6t1OeatJDZVByVmHSW6cDtxro8Y3HJozHa/pNbOdTweas+eW/Aww2Jl/2jA7kMCjrrHmyT9qXIqpIYk2viqXQb5GfmHLEjJPHPqdYOkgfTpgow0Vdyv1973Wq6Kll7DJJQpVezUyg8+HDuxdHp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqGs1q9a; arc=pass smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqGs1q9a"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so643177241.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788535078; cv=none;
        d=google.com; s=arc-20260327;
        b=qUG/Kbmzjp8GMdWKE4hOW+rbIibItyKRQwxMNqYoWTcVOsFOKGvXgOdzHaEmXQ+Nus
         FZtXm3u+oynD50OvIuJQ5btmjM7XabVRVAnTG2TwdF0HYLkCI4fXIcnQWkwBA1YeOhdk
         r9ONqJSLVtbxpu39t/2Sp36gfSM6Up6vVi1k00AK3J/EIDsESvoCy+Fw6TS17sInp0xp
         TNfSlnBLTgIOnTJwzSMLXptkneMgkdK7ct7IJnNPsF2CEwh69+pYfDMU/o3c94YBgy/0
         dQj2VoO8MeGcmuvubagOSqEO+3GxfCcitprVBSF4i6PTYWzGIB8TRmH4OuRB7+jnuHmx
         Wd7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
        fh=2c7Vk1ywRbIxXad22vnNKlM+ht6BFXAJpRJleA9F3cc=;
        b=fHAf2uP1hwY9tTfmgT6Pn2UgkNN171nso+oPI712IdgSlE8Tf+VDGo8CiY5GHvKLtu
         Xp5vg2GXixtuHs2u7UWQWEJwY0xpFcTBXudklucO+QdX5YFcvmYOrX+HU8DtLR+cC8XI
         oGiMBGLXeyPlgfOtPmU/FgtUhj15VtlBRYjbqqNwisuJvsmn9FmTWtiDTXgAA21rnK5h
         NAuDEVnyfQSNYRQRWhG75GY7HHL9cbze0KizAORRCQxLhcjqem+2VVa6YY2Mxufwyhz4
         yUcfL3Wcyj0UTjvWlhGI8YMBzfQHwc7YD074d8p2uyt4j4jD1BjDDSHLiOPlACe1tW0i
         iQ5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788535078; x=1789139878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
        b=lqGs1q9aVRXf4uDOu0LQyLGbVTM7mQl7nE76OuI3UO9NFmclw0HLAUCKmUfOkqNrsL
         5h6ypm3rQFdUqPV4ZOKzujh/IyF9VhRS0ZPKr1anvU+C1etKGmD5aa0iXX2qqvsZX9Ie
         O0srS2JBQrUz3qwDWdiRfLSkfaq30YYT4xKUFx6Z/m/Usfdc9VYXYLj6c8TR7niehiZD
         lxFOiSCwCuu4xMDyc9ix1xTTUEEQQf3aTMPWHhkHov7tCBKDTofZWfT6rB1OyGXz8Lum
         5q49Q0Gi9noLq987/An23D3PQLXR6T57MCQh4ZCj3QLBZol2fqc8JnMk5R+aMAUptBYA
         TO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535078; x=1789139878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
        b=evABCF0MAeEqbFlGt8ocDzLuHMw46rM5s5juDPiVUaoRbv3VII1et3Xpl7qTR5lfuH
         OkaOpf46oKqjmP7W1sLoxEk+i400/+AU0SVlftES7VaI2nB1kQgRh/y9GmWgvOt3dTit
         LXa2L+Ov9c44l61KwKaAvxYzfLXoFBXLPMfdWuKWWgRZfvU2cNWlb3UdpX2tQ9jHUJOR
         oCSiXekzTrOFpcyfB4VKHzCKtgp67RjU/k47Ee3q5RECCAJfxNf98hbHzkBIdM9LBnqI
         5qh9LC9QILHS3fsazuiuOVADRVwvqm05usLlfSRy60wvRee0IlkafDoAh9+I7HXc4O42
         vLsA==
X-Forwarded-Encrypted: i=1; AKwUvBwg1AzRvLUvtR0UBi9Er0LDbZuQ16i8iW5UzAH1XQwDqm5vfBFQAJtM/lJxd6akWLbQQ3f0c1M56+XLHAo=@vger.kernel.org
X-Gm-Message-State: AFuF++kXiDUyKJMnPO7tDI9Tx4ccXVSXH7Mjc+4gCz9Ku6RWjn4GhCrw
	inwdyClLbi/cfP8KBpTlp7QzB019khjCrEaqLyde0JEIR8aEyP1VPI27pcIaYpZOK3cdlDWl/hR
	P0b+WaUUlwAraHuplS0QfkBkyQn8i4YU=
X-Gm-Gg: AYBFou2UvZW0GwBW6QTLIZqT9tqU9vbpvaxdZjCHcrozLNReENaVwLck94aQnnJtKRb
	Bhf4VmU5HXMjWLCP8OVwxCbST3MoUnbZyJIlSex22swt1ecbvvqmyAPi4SuRH/Q7X60haplsdbW
	eUkS6ZodDP9xL8TybsdHvVPWPmq3YPO30DuwIVRGDDW4CR8yjzuso2gEqDxApLlUb0vmDqYXHkm
	7KWdAzANuziPZYjz/FHtxw9/SjzaGg8CXP9xhSQm/CFJ59x0SS4H2KVQek1fjS7bxGtgzCvYRh/
	8aWe0Ae8FiqDqEuXmg9oo9iZQaZ/DNkckbeuXgcrxeaP3ibjaUObwc7Er3n+JAv4QAk1vax+jVx
	Ya3ye7D+DxS/5q4A3cwUCXMseWOw+y5mZ2Vv+nh/vO2AJVs459jOaXilDkU0GSioXq1noTYR4OJ
	KUfH+K2hNmgLxLMt9x5QjBYLtiywuWQdPZ5PWEmqOZ+Pw8j9IMxA==
X-Received: by 2002:a05:6102:80a9:b0:786:4822:308f with SMTP id
 ada2fe7eead31-78a4a9aea5fmr2343885137.13.1788535077663; Fri, 04 Sep 2026
 08:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
 <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com> <87se3p13jy.fsf@bootlin.com>
In-Reply-To: <87se3p13jy.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Sep 2026 11:17:46 -0400
X-Gm-Features: AcwNN1UP0lhDRhRnmSbud-UU5EERiros9_WN1FPXC7f3fDYdM3_vq5pk0G9NwE0
Message-ID: <CADvTj4oW8Hxv_b5vWM5pbeB3wEO-WoqhLwyinCTFPNR6wTHYmQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: support randomized OOB formats
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 8:42=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 10/08/2026 at 17:04:50 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > The controller randomizer covers the bad block marker along with the
> > rest of the OOB data. The driver currently compensates the marker bytes
> > before writes and after reads so that they remain plain on flash.
> >
> > Allwinner NAND firmware instead stores the marker through the
> > randomizer. Media using that format appears to contain bad blocks unles=
s
> > the randomizer is enabled while reading the marker.
> >
> > Honor the allwinner,randomized-oob property by unconditionally enabling
> > page scrambling and leaving the marker in the randomizer data stream.
> > Keep the existing plain marker behavior when the property is absent.
> > This changes marker handling on all supported controllers; the H6/H616
> > protected user-data placement is handled separately.
>
> But I think the reason why this has never been done is because it just
> breaks raw accesses, including the BBT reads. I don't think this is
> handled, is it?

From my understanding raw access bypasses randomization entirely.

When writing the SPL(which does not use the same layout) we use a
pre-randomized image.

>
> Thanks,
> Miqu=C3=A8l
