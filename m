Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5534EBAD9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535809; cv=pass; b=ncvLAblRWAqAk5yF3icg4OGcAcC+KE7zke3y8Ounao93ryOLTMgdK/hhcleZmBufOyZgIeSxLe1wfU2fTk5/gqcVIzrRjGnqSG7OC89YpPNaE5PZXpsrEiAa1MngIZjwjKT2wSyLhHV99+cUS0MQymuRtU8o5Hv+PA8+Wij2uy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535809; c=relaxed/simple;
	bh=3Wg1EYP2B6OR4Q8rmxA0jv6rQKmK/4iCDjiGcU/Welk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fDtPXDXlw3c+d0RaLAkEfNAUthgPltwPEI5AvNRvKVcgmgo1F7PVBZS/OwIo6MQk+Jcc3xb+izMiIJUcmiKqI7tCmvCCI6ZlHis2Bz7VxRnRhIyfNqBeCFYCP5/imhefL4hoZxUIXloS4sb19LPtRFyfakPQbOB3ks+2Bhp8/IM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kw5eWXyX; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kw5eWXyX"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a1a3bb6c5dso10388091fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788535805; cv=none;
        d=google.com; s=arc-20260327;
        b=bPDaqcQW54BrnqJpN50fRfkl7pyflr66C8fw/8LQKD+T9dh04qhmWmi3W1GiRQghg1
         Cj/+eo1VkJJsIWvZaz+vaaubBjRQbCJYcXRNudpPtfQk1LTwq8WXr4SnvVyyt274+qKd
         atQvbNcu2tgRjhTaMVNE5kPOZF8zzDagcu6ZO2jcb01eNS3VDbm9nAYc875SjidJg5tT
         YgqkrNarXJi70bRtkx6BLmZ8hBJO3IOXGVsspWd3zhh8dBLyy+pxjI4QwBOZLJKfwErQ
         fIp2INvqrCw/1ujNwnLwkj8x4h3MI06YCUIuhPEXOVWkh+f32hVl/yHRNPuFteZK0aNp
         +MMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sKA7G9k/SJrfVHqgC7G2BjjCfagiZOUSUNeg8K5wWvs=;
        fh=JuZnyPcDKTaSTWKnsj/DFMJtB7tDzRne4tJixO5zQms=;
        b=SApR+T4Ow+Wt0wt1J4UFOsken4G75f7yExRkItAMGM2z/R8GHS81PgWOyP3xa70DB3
         50AFO1xHhGM+0Ky72aMV/2JASLyV8gmoLeunyin6cwcuJhgUDozHJg6kvfsbryP/7x8v
         LEia3OjER/0R7i9eyxt1FUDPFJQTJ6IGWlHM5OnzA0MewNWU9lhSjUglV9bkcIJd3wZB
         dZdd+luX6xb8F8IiLXVYn8/pyMfGR4nOU4abLOvFeE+QYxbWmLo9EJBxuKpMU7pI6zJd
         D7woB1lrrpyofzCzJZx1TXZ9zTqXE4TXq9GF+GFAg1/0eWOGwvp6qQSdA/IwGdjoQRYf
         OjCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788535805; x=1789140605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sKA7G9k/SJrfVHqgC7G2BjjCfagiZOUSUNeg8K5wWvs=;
        b=Kw5eWXyXkx6TYtm+s2zYoAwHCf8gE/rk+H+81xakptMMK59wFVY9uLE9OsqHbvhrYm
         b8b6D3Fmp0WPfaUUdPEULMmkpGHdO8TE2ij4/I+PHQ+BlRRcsNdpiBrsB1sSnd/3FZsV
         GI6gnII9aPFYAyxF5bmpYZp/L8WDBdaPK9A8E10aE4V1y7eMy/6SjoulZb3Oop888sIP
         UUf5skg5JJHfV6zgYMwHu9z2dCpzpvWigc9UB3bInNGDzGrqkDSiXC1/6DFXZ81+xxDM
         cJEYYL3zPSICo0i2C7fxiOz7TPWJG7jDBavuziNTt/Rm6WtXHZfxrM4T89rCQOlAs848
         KlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535805; x=1789140605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sKA7G9k/SJrfVHqgC7G2BjjCfagiZOUSUNeg8K5wWvs=;
        b=ApXeoZsSMTfJQ3YhlPTkOxUU58qQxJ4oP63Hv4lnIATxP3Om6cD6sfGnQCE5JNcs94
         xWnmBcR0Ra8H4xwIguFEII3YlywZn4hGxUXwgYufRPKlbezAHnCtdzG6Czdfth7VlFQu
         MIJXg7He6EC2GGAV+un3R1V0LplJq+wLkRwI0KFZfbYi+l7lUPTpOpiXtqsfkyQSl9Ba
         6xSzvjzlkNelqPKMq6/LU5LuRVnoISR4zif72aFdhu/s6uJpsEiZ7oz25jfByLdHwuIF
         ytl+YT+MUoReqoYQIhRNTvMk8KxoATHY2TPr8ciPT3Sg/u6Km63+ImacXu2CtfG+J6Ci
         +R5w==
X-Forwarded-Encrypted: i=1; AKwUvBwhtv+q2m1g+x2Sq5iMMe4fkHZrqRMO1FaVBiL6Wou59AsOJBkw5xTWgRH2Hhach/wy7CNzn5E+ecQf0g4=@vger.kernel.org
X-Gm-Message-State: AFuF++lyL+7/9K15IgaTpkytKzortT5IoKeD8QkxExCThLMDDJOQEn0Q
	RtGdySkyE7ueESNA6t2rHvdE8m5CfjaP4wP1IxO2wKOxNEKn0xq6mj6aJipuL2dR+HqIYthhnf6
	d3a2zwGf3PShTiMHQZD5QxbIYms4d5Hekoqqe
X-Gm-Gg: AYBFou1z12NchNlaTDdui0k/NMfTSYAznd4N6pV+tF18q6PJtgQ2xfHIg/ztWVwRBT6
	zCVEY/706IJHmORPsJ9BC6rStvZRwHFy7x23DGQ2qjh146fkRmhAJ9e5GFISW0AmdYbv3R52ZRn
	JZlA7uahlQ66AeCAzyONdbfU8sXtEcUK3Hf8cBrBkYpJF0UNqGcK74ciWvLNXCeL8dRILGHBAEj
	zpVmIwqJfGAHhvn5JlFopIsP9zoJ++i17GyI7DU2VW+WfvIWyPEeujvf8JuKe9XGIKeUO/8uHlE
	NYHaZeSRqIfMynfHItkme1aMS3rauptXp7lrIRgpM5gqURp1CAiRZ9TK6jIqM5zeo+uLOizoTWS
	4og6PU6L8wWo6pDA2526kSnpL8tmsPVBBiAcsq3N/0j5JewXlIPpLmXWn0H8m7Hgq8xis6OTdO6
	JnraPLXOKNbxIaHn9e9w==
X-Received: by 2002:a2e:be29:0:b0:3a3:7680:67f7 with SMTP id
 38308e7fff4ca-3a3768069ddmr4258741fa.22.1788535804804; Fri, 04 Sep 2026
 08:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904082741.578048-1-ubizjak@gmail.com> <20260904082741.578048-3-ubizjak@gmail.com>
 <CAHk-=wiKvgXTJAXveUoWq0+Wn=E5255-Uc5ZzhXDgk31iXEZgw@mail.gmail.com>
In-Reply-To: <CAHk-=wiKvgXTJAXveUoWq0+Wn=E5255-Uc5ZzhXDgk31iXEZgw@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 4 Sep 2026 17:29:53 +0200
X-Gm-Features: AcwNN1VLHH6KFUKFuBcpdyOhmOftv_vvBlph_AR-wCslZDNf0nC6MtwkAMT2vkI
Message-ID: <CAFULd4aynHJZ3hUbXk5WuyreNDE5D0RppiZFsGrYmQgiaqvVAw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] compiler-gcc: Remove obsolete RELOC_HIDE() macro
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 5:16=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, 4 Sept 2026 at 01:28, Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > The GCC specific macro was historically used to workaround very
> > old compiler bugs (including pre-4.1 ppc64 GCC). These compilers
> > are now long obsolete.
>
> The gcc-4.1 bug in that comment was about how the use of "=3Dg" caused
> ppc code generation issues.
>
> It's not entirely clear to me that the original reason for this macro
> is actually gone. The cast to 'long' has not always hidden the
> provenance of the address.
>
> The use of inline asm in RELOC_HIDE() actually goes back much much furthe=
r.
>
> I do agree that it probably is no longer relevant, but that commit
> message is actively misleading. RELOC_HIDE() itself has nothing to do
> with the ppc64-specific gcc bug, that was literally just a small
> indepdendent change to the implementation.

Oh, now that you point out, I was looking at inline asm, but since the
patch removes GCC specific macro, the commit message reads like the
*macro* is there to workaround very old compiler bugs. It is
effectively inline asm that the patch removes, and as you point out,
this inline asm caused ppc code gen issues. Let me rephrase the commit
message to fix the confusion.

The cast to (unsigned long) should remove all compiler's knowledge
about the pointer and force the compiler to use integer arithmetic
instead of pointer arithmetic. This is what the generic version does
without inline asm.

Uros.


>               Linus
