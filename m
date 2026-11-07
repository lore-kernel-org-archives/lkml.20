Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794064764;
	b=TqE/63IX0jVZ+F1bdeyXC7Cy5Hx1Vf26EiaKpRvExL7dpi9691myH1v0bDCeH5Is/ARQ
	 BIIY7fJES2eXcI2jAHUXqBsSviYF8Z0ufrzF0aGXI5iUXYSDjDAQtpFaSQP6J2M+FYXhg
	 X4S3golY8WrDMwZwhFBh7TIrNev90t0WZoK1apESIvaxYAAixiqNHAchipiJT+MIRL6af
	 lPSkqnUiycuOy0C1InnvY7QVAvC1NmUV5D6R3kWQXhyQebjw8uF0X89I8WPN/S9E16Tqr
	 HBxe4fUoCPdzAIZ/F9psNYzbfgRpd8akeMIsIMnOou3KRNovDg9rHwoTCK4bpdR5BwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794064764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TCe5C4xdEErz55FhjSGIX/KlPHKWFEB9lSGU0iZlRE8=;
	b=T447F6LPs88xVrfWkEOCiB0+nHW9hVU7flOoyZ9V3zy33uv6eL3vdJ8Kc+pwYWQk9i7g
	 ll8glAnJ8CXOwFJuR66hA2o/feCfH3gTVkbDKuy1rbc4dbs5LoUfr9o169RKopLNo2+fy
	 8FraCjNEJCNkmR+avyjd4rOx2VhUB09OcXnUEvaq2caGssWGu0zGOvzAsPWP9UqRioeAx
	 RoBBgHXoLBhUgm1DFbW6rYAPV/l84OuVOOI3/VhZUlxJYFe9IzkvNL5zxQj5lTEBw1Fnq
	 lx7VcS5dO17tgm8rLgWj4IVcdci7+3ywIuoDFEuHQFLy1JYaNIfsBS3kmVcoRPoyP+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BMXLe9as;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D039C606A9DE
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D039C606A9DE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BMXLe9as
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so10925251fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:19:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794064762; cv=none;
        d=google.com; s=arc-20260327;
        b=LR+SIOs4lt3N4Px5xNNEyiIUPgsdj9xMkuh43M7kFduUe2sSI50VXE3a+91CDYmB7L
         8ccJLVN1KZBo2cJywaz/c9L/ubceHk47Bk7TkZLK0KpdgHJ72m73V7phe+vSSFwn0czs
         60ZJlUZmxzdjJL+D/wPBeX6nKOZXGUrqVAC3jVHRjylZYAS5cI1hgujPuGWpDdbsyGlW
         91mTKt4FuZ7EetOH0KncTIc45RPkBzjFnp4UlM6SRTfAu5v/cp5QV+WkRaUOKwd+6Kvv
         eezRkkPfVY8tp4FjO7u2tmK8jskk1BZIV1+9+2ML9jqlx6P++VLxNZpdyJzzdo1zWlju
         N+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TCe5C4xdEErz55FhjSGIX/KlPHKWFEB9lSGU0iZlRE8=;
        fh=I3PoE2jLBo/1Y7HLzaGVBfy6Rk/4P2PoNas3ZyIeRXc=;
        b=YlSDg8XiYsltLTnn/SkXqjD9IWFyfv6C18zD0qLoUIa1zLYiWqwti1+33aQ5F0UsO9
         rf673qUaXx1bV1a3b+12k1StbIv0gSn90Y5w22RDfTcKkB0t4xDb9Mwq9x0J2mUbMXpd
         CIfDZoMnAOtvVzE37KzTvmv+PvvPAlNycmiqVUqB74fsJYPs/z6Ei6xyXoC/4Od9stTL
         ZDM2fWMMEjxONlSWtsmPpPX1KuMSJPIX6UjE/ayCzQPQ4rkfyOlZJf2BcnTp6M5u6fU4
         vMTiFym91pXwCiatWk163w+oT8c/w3WydJLJ4q5cmole6GZkq/2vNl9AK7Vb3JVasKYb
         5Stw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794064762; x=1794669562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TCe5C4xdEErz55FhjSGIX/KlPHKWFEB9lSGU0iZlRE8=;
        b=BMXLe9asDa9HsaE20cK8e4xNiPQvMM94seSFijkjZ9mZaiHLlCAKeIYjkc6zGqIMxc
         eoZz0lFvDB83y6XC2rvIoeNxpD/5D8+bmLp6gmCTIcG7VmDK884ssi56cOrti8tiDc1K
         vkT926g62lwoIEYEMwisnJ8PdCXPvQ1PfM5uK4cB6+J3cM9Kg8joucr0guWPia3zZ9Nh
         EIMa9+WvUhQxEA66V2zief/ZwS4A365ZcLy4yEihD/KI7PO80SSb8kUFui6TnNj8AVo8
         8mnLTht6sJfxLDFHLoMXQsf/L684SCJlDYVSgWSOSsrR27wlTI4utkSaeFeXpVba2OAr
         ZiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794064762; x=1794669562;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCe5C4xdEErz55FhjSGIX/KlPHKWFEB9lSGU0iZlRE8=;
        b=uSs3/zHXgTWujasboUmz//7rWaV1RfUDlZLgfMM2avCeDMLvaq6xDKlO4irG6hrMGx
         4rsjiJMPwGn+Ab/an3X8HobO2QdsEayTZj6wA96zftf9wShD9pTMj0EaX6+dJSdd1jXZ
         X2HS+lGrr9W9HcqxcsRtOxk3AC2p91Bomu/j315qBGS5uq3/33mdqwW+mVTD0+7tg+98
         r2fKMXslkrm4Nj2aPVE1iRvPovAQXIMWtSGdJ2QP9uzyVOvP48hZZbKaQv0WMEuc494u
         eDJglfK9eY9tyqyF259hHEAaOTgm+C6308Z8Vg2R915zgWYYytAxuHGe5enHJ71Zrkb4
         JeQg==
X-Forwarded-Encrypted: i=1; AL+hErEN+5ydf8zwO4Bcqp0b3TVZsieaa33sGX1w1d73Pxxeub6zBe93Cf6nWNkXNMLS+9wHVrT7CDQjfsogwxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WhthwCMTYgpNrjsLSJpem8B1h86FmpQXv7SvS7iORPNIDDZij
	0a3e/VpkJwihczd52dPrOnwnlJ3ohRDLMsrSpPHqLFXB3B1EN8JRZYCsUxROgPx3jCk1BruLZqv
	GbOrhkPWfT58p1RTAxXwAiW6yAZuWNZM=
X-Gm-Gg: AYBFou37a62J0NsQa1oqr9xXVJxtV9PWO0qI4gmtT1KewzxpvKW260tZEh8X3OUvstz
	KY6BUqpKfzbrBXvKrK4K6D5Q6JSCfbD7qHujbMaRkqNION3U3knvj5ygtBjl/dExARstADnUYV9
	DucMjGZUGWbzXWcik/etzd1FGUf0xB+EWkvHoGCClRiOzHFhcuZB91L6ziEUOexfuOHD6bXiXUO
	BqeMSPh+Id7zxKLy/g0VeTzcc0H/dyxbzt+LOwqoz6Y3VKcfD1NRSgWhGNaa0Po2cKIZwGycwrU
	bw0Q4LgS5Qik03MWXZnb4NWwm/BQcaYd9DHjGtcxJWQqiNywBJrSF9vE9+d6WcUJn5d0OcqSZW9
	7Q1WFN4alCnIbyJonA93q6XdjNc4eSV37ZdNeVw==
X-Received: by 2002:a05:651c:31c8:b0:3ab:ac4c:186d with SMTP id
 38308e7fff4ca-3acf3a19450mr11358261fa.13.1794064761813; Sat, 07 Nov 2026
 07:19:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107030708.1031977-1-graypanda.inzag@gmail.com> <c243e6ab-3eb9-471c-9b6e-91064528ce82@kernel.org>
In-Reply-To: <c243e6ab-3eb9-471c-9b6e-91064528ce82@kernel.org>
From: Junyoung Jang <graypanda.inzag@gmail.com>
Date: Sun, 8 Nov 2026 00:19:10 +0900
X-Gm-Features: AclHuK_dNYM1XnHj7rfsjRaDgzAmEJTriPZ9IjNPu2MGSc4-bhL3xcJuJZ6cHwQ
Message-ID: <CAO7ntTQGLNtHiu3SY+6HaRZi5gimqjbmw_FoeTSRYpqi1EbnbQ@mail.gmail.com>
Subject: Re: mm/mremap: F_SEAL_FUTURE_WRITE can be bypassed via mremap() VMA expansion/duplication
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Hugh Dickins <hughd@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 11/7/26 04:07, ... wrote:
> On 11/7/26 04:07, Junyoung Jang wrote:
> > Hello,
>
> Hi,
>
> >
> > I found a reproducible F_SEAL_FUTURE_WRITE seal-policy bypass. A proces=
s
> > holding a one-page shared writable memfd mapping created before the sea=
l can
> > use mremap() after the seal to gain writable access to additional file =
pages.
>
> F_SEAL_FUTURE_WRITE is not really range-aware. What makes you believe tha=
t it
> would be?
>
> I'd say it's expected that if someone has write access to the memfd, it h=
as
> write access to the whole thing, not just some subset that was obtained t=
hrough
> the initial mmap.
>
> Any documentation that made you believe that it works that way?

Hi,

Thank you for the quick feedback.

My understanding came from the following documentation and commit history:

1. Linux man-pages: F_ADD_SEALS(2const) / fcntl(2) (under "File Sealing" ->
   "F_SEAL_FUTURE_WRITE"):

   "The effect of this seal is similar to F_SEAL_WRITE, but the contents
    of the file can still be modified via shared writable mappings that
    were created prior to the seal being set. Any attempt to create a new
    writable mapping on the file via mmap(2) will fail with EPERM.
    Similarly, an attempt to write to the file via write(2) will fail
    with EPERM."

   (Reference: https://man7.org/linux/man-pages/man2/F_ADD_SEALS.2const.htm=
l)

2. The original commit introducing F_SEAL_FUTURE_WRITE, commit ab3948f58ff8
   ("mm/memfd: add an F_SEAL_FUTURE_WRITE seal to memfd"), which states
   that the seal:

   "...prevents any future mmap and write syscalls from succeeding while
    keeping the existing mmap active."

   (Reference: https://git.kernel.org/linus/ab3948f58ff8)

3. Linux man-pages: mremap(2) (man2/mremap.2, regarding old_size =3D=3D 0)
   and the comment in mm/mremap.c:check_prep_vma():

   mremap(2) documents that when old_size is 0 on a shareable mapping,
   it behaves by "creating a new mapping". Similarly, check_prep_vma()
   notes that "!old_len is a special case where an attempt is made to
   'duplicate' the existing mapping".

   (Reference: https://man7.org/linux/man-pages/man2/mremap.2.html)

Combining these references, I interpreted the intended invariant to be that
post-seal writes are restricted to the pre-existing mapping itself, rather
than granting the process blanket write access to the entire memfd.

In particular, two behaviors seemed inconsistent with the idea that the
process simply has whole-file write access:

- Even when holding a pre-seal writable mapping on page 1, the same process
  cannot call pwrite(2) or a fresh mmap(2) with PROT_WRITE on page 2 (both
  fail with -EPERM).
- Calling mremap(2) with old_len=3D0 creates a brand new VMA covering page =
2,
  which appears to bypass the restriction against creating a new writable
  mapping after the seal.

However, if the intended design in mm is strictly an mmap()-time check=E2=
=80=94where
any pre-existing VM_MAYWRITE VMA implicitly retains the right to be
duplicated or expanded over unmapped file ranges via mremap(2)=E2=80=94then=
 I
understand why this is considered expected behavior. If that is the case,
perhaps clarifying this in the F_ADD_SEALS(2const) man page would be helpfu=
l.

Best regards,
Junyoung Jang <graypanda.inzag@gmail.com>

On Sat, Nov 7, 2026 at 10:18=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 11/7/26 04:07, Junyoung Jang wrote:
> > Hello,
>
> Hi,
>
> >
> > I found a reproducible F_SEAL_FUTURE_WRITE seal-policy bypass. A proces=
s
> > holding a one-page shared writable memfd mapping created before the sea=
l can
> > use mremap() after the seal to gain writable access to additional file =
pages.
>
> F_SEAL_FUTURE_WRITE is not really range-aware. What makes you believe tha=
t it
> would be?
>
> I'd say it's expected that if someone has write access to the memfd, it h=
as
> write access to the whole thing, not just some subset that was obtained t=
hrough
> the initial mmap.
>
> Any documentation that made you believe that it works that way?
>
> --
> Cheers,
>
> David
