Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE297503BEF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784252; cv=pass; b=s6Y4tnGTIbYqq41kSzSPLqP+K+HvXPh4L+5yi/BAEr/2Gu8B0Mbk0fFfjnIRgMRQ6LRlcm9ApYojTZKwPFLjHPICP3+EnkcRqVOuzknhep5q9Es8axOXASXKbrV6MZ6/A5Adzyevr/gYLs8NDZ1ZEIvVGeP73dbK3Ia6ja6hLss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784252; c=relaxed/simple;
	bh=WTSCqcU3j5xCZOTesB/9TxVC77h8Ggh4QttO/MJod9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SqdmqDa/4m1aS5MijW+IoTWTjPJLuhRVqfghyF7Er35M3BHDLDOzyJjfEk3ya/29BSSmuoLW7SbHkn1MuSluQxastfnRHG+BXdOEXoTWcu3vdKto470RKrAvoVux+5+9aHIS9Rl/VsfEnq0dMLwAsaj7hzM5MrlnXhJSqtm/Yso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLGlG8BX; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLGlG8BX"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acaec6a74aso3132321a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790784245; cv=none;
        d=google.com; s=arc-20260327;
        b=ePIBj9I5d4jAdD/Qpqmjfg1lmMJWCUfXLsdMgIvbI7MRPDhDvOnKI/cKg0I/a2qoCv
         WFGD1ty7lGFOm21v5VIoS7zeQ7ldjLWngPSqi6Fs2zJuAq4pQ9M0c+63/LElvrSGKsGp
         h1YVfxNQUFspDP3MhKVVIcJDKWp1eDv5uyYGBgl0p/Dupip/JuVweaKIG//4sUif+vd1
         UJWDTH4O4r+LCDH4WfYc+dvQogqqHpm9KzsvZvQNXLXhLEnv82tSlJbYESbhoCJnncq9
         W0vCBn1D5oNAX32XBYv9DuuY4HbUpoU6Cmz1HbgiVTPmZg26WP+cIk2b2X+2fzlSOtsM
         2qFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R94s1y22nYOZdwT3AqHQhb+4sI67/SO/EEn0axk/2yM=;
        fh=8avVFkqPxPdXcS8lJpuDMbs1VJtuRbKvlnjMY80T8qQ=;
        b=GmjcjD5wGM2R/sqyCyfYnnW2byPQvg/Vb+aCfVhz56c33qBfQLdVREVC9CNt17GQ11
         WfH51RlAWHqzb5sJ1elSMlfFmqP/Og9eK21T/Rjc8fxM8Y0Jwv60VnudTWqVuoD6+5+I
         cXXOqc05QM0gmw/OaiCd+V/zDtk23Zuw27U7G2hayRY14IUyviH7eV5MnwXD47cMEb/y
         caVxtFv6IdI59Upv8Pe2NWTu4V47CZiWo4hp0Cgk3aXQW0rK7GjWauvxUPbNw5mCnsa5
         oCiW7mm0Re9EJ6Bq2s4eB7+Et63j/ZsLy4ifgYCM4OKAnqdItKUPIydqpi8bxrJZgWhu
         kpVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790784245; x=1791389045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R94s1y22nYOZdwT3AqHQhb+4sI67/SO/EEn0axk/2yM=;
        b=FLGlG8BXIOypDe46MSS8juUIya399x0t9EE5XYXn0fFaRV8zprPeBZpEN/sqYAFe8O
         zvYRy+cNJtVl7VmljvH37u/Yot5LGFteMyJ74n/TVU6grKoJ0zHTYPrFnbMFNnKFAi6w
         8yj+BR1I1ji5DoEdwS/hkZmVM2sp7VIdPq+qYVD/3is9tB3afJgZQ3Wdx5I6fBfjViy+
         Ucw2iSCoizhGDn9hI/b6zEYRUeO4yBaycPNznGLFDzNwDsQ++46Ns/bqydyC5UUrOz7k
         nq7c27sWF5LpbHAWjUOFRldbL4jrzvwPAId6E8WsZDwdu1Pnw1ltLwwCSBBkZNikHzhb
         LjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784245; x=1791389045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R94s1y22nYOZdwT3AqHQhb+4sI67/SO/EEn0axk/2yM=;
        b=kpGL6lW8w0HnRAJU1aU0DrusaMkLVI9xH90YXIvbecNZO7ISf6lRHKJGdoMmimoZ6N
         6keK3BP+E//3gl27JQ21TKcbZpVYIp2K1OU/mryfGYexDYp7fKe2i7KFkYRxAZLxr+25
         aoP2bma3n+TMDERRsBfbtTDXEUO4n5H9/uMEewOLaWR4cWZUHQ/Lfhk3Dx/diemECu9M
         8Z3/xZ5cLk7/f73PmM6dGVINRye3DEygJkrZkK2cHqwmHCDXMOyGeVOe257a45/8lVGL
         BtgTQsS7O6R61MHewga/bmMJ+KWL/K6C7YRYYFZHoBsb9BzE8KYAI1NfWonH+jFuL9RJ
         V84Q==
X-Forwarded-Encrypted: i=1; AKwUvBxQzU1sNyAtXR06Pt+Z6ononFrwjP6ogKMjAG/8ciRhgXA0iE8v1UfdDMkpyjV/cOaUjhjX1WS0J64lHmk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTdsgmwV8I3ju302BZ4kgMG+uFyU+TO9bgfM7VDjiOXlp5zWI8
	XcZk0cFptvGrnHpf//CtjfmO+a6sxupoCrT32aMB3n+hqrkXytuv5HgNr18SR3cCU8N0clnWZXR
	um1tQqkqOHeXV1aid+9RTT9qThVxf+ok=
X-Gm-Gg: AYBFou16wfNgNVjqedYV2dt2MtGNY8eb8J3T98HRiyCzXdD707XacbQnW+iDXaja9J7
	lC8Xj+qFd+K41PGsTJ1a81UKv+FojUco4QzYsOn/xEGIDJYVzsb0xaHdvYdnxg3e4CQgG65pM+p
	3vRWCUlEwFEAYHYPVMHza1nmpdU15kzBYcFRj8rnD6z9+gD+1dq4jpZ0Wtop8UPhseR8SYL1pnr
	erVpPAoGchX6ynT4/WerpriNb0th54CF3NVBbX64A8BNApRjw++PWhtGXDQ4V5KqgV8Tt5zQwT0
	rufy1tnvEIR57LHjEYq1IB+4hdXXJ925dAPnkF4s4eyzG5PvR4bu0cuTu+HQdTQLU3dAQT/PCVl
	MVmQoH+jZ30FqsI90GaH3HGoovj1HiPTROPIPTnsd
X-Received: by 2002:a05:6402:3550:b0:6aa:f1d2:ddc4 with SMTP id
 4fb4d7f45d1cf-6ae1992db87mr1462815a12.28.1790784244589; Wed, 30 Sep 2026
 09:04:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929222752.36427-1-ebiggers@kernel.org> <322e5255353e3a5f9e3840a496018edd980fb016.camel@itx.no>
 <1f85bdb9614365fedda81fb649147da48bf7be13.camel@physik.fu-berlin.de>
 <25c7a7c7bbe3c7f70fca559867e0883b9e4dc48d.camel@itx.no> <3ea57d640ac7409fa37b15ec9e3f49126347e432.camel@physik.fu-berlin.de>
 <8d3d3142d1ac323695a3ea2d5b3e2a10d2a129d6.camel@itx.no>
In-Reply-To: <8d3d3142d1ac323695a3ea2d5b3e2a10d2a129d6.camel@itx.no>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 30 Sep 2026 18:03:52 +0200
X-Gm-Features: AclHuK_BOLFZd_UzRzzswj2no7AD_sToBZdg182Vb5qszuJiuseE6gZyCLri0QI
Message-ID: <CA+=Fv5R0F5YNgORUx1c8YWzyFcS6wqVtmzQUXaS3vuLHYwBndw@mail.gmail.com>
Subject: Re: [PATCH v3] crypto: aes - Fix undesired override of some optimized
 AES modes
To: Stian Halseth <stian@itx.no>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Eric Biggers <ebiggers@kernel.org>, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 30, 2026 at 4:52=E2=80=AFPM Stian Halseth <stian@itx.no> wrote:
>
> Hi Adrian,
>
> On Wed, 2026-09-30 at 11:27 +0200, John Paul Adrian Glaubitz wrote:
> >
> >
> > > The T2 and T3 has a separate crypto unit, but not supported here.
> > > Support was removed from the kernel in 6.14. Haven't tested it, as
> > > I
> > > don't have the hardware.
> >
> > Why was it removed? I'm not happy about such removals as long as the
> > hardware is supported.
>
> Looks like there were issues that prompted the removal:
> https://github.com/torvalds/linux/commit/9cda46babdfe
>
>
> >
> > > Also worth noting, it's only used when the firmware lists the
> > > machine
> > > description's hwcap-list and the CFR has its bit set.
> >
> > Is that not the case by default?
> Yes, on real hardware. Just mentioned to clarify that it doesn't cause
> problems on hardware that doesn't support it.
>
> > > I have no idea about Fujitsu's SPARC64 X family.
> >
> > -relocatable-kernelI think SPARC64 X is not supported by the Linux kern=
el at all, is it?
> >
> There some chip detection for it, but I've never tested, or heard about
> anyone actually using it.
>
> sparc64: correctly recognize SPARC64-X chips
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D76950e6e54ccfc98a25b501dbb1bc879cce1aa29
>
> cpu hw caps support for sparc64x:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D4e96377983d2e060dd89703f1846ad920af9e17f
>

I while back I got a hold of a Sun/Orcle M3000 box, there wasn't that much
missing in the linux kernel, and some hardware manuals available online
gave me the missing pieces. I have an experimental kernel running now
with gentoo user-land installed. The box has been running stable for a whil=
e
now during normal load (building stuff with emerge). I'm doing some final
cleanup work with the patches now before I send them out.

Some details below:

m3000 ~ # cat /proc/cpuinfo
cpu : Fujitsu SPARC64 VII / VII+
fpu : Fujitsu SPARC64 VII integrated FPU
pmu : (null)
prom : OBP 4.33.5.d 2012/07/18 06:55
type : sun4u
ncpus probed : 8
ncpus active : 8
D$ parity tl1 : 0
I$ parity tl1 : 0
cpucaps : flush,stbar,swap,muldiv,v9,mul32,div32,v8plus
Cpu0ClkTck : 0000000000000000
Cpu1ClkTck : 0000000000000000
Cpu2ClkTck : 0000000000000000
Cpu3ClkTck : 0000000000000000
Cpu4ClkTck : 0000000000000000
Cpu5ClkTck : 0000000000000000
Cpu6ClkTck : 0000000000000000
Cpu7ClkTck : 0000000000000000
MMU Type : Fujitsu SPARC64 VII (experimental)
MMU PGSZs : 8K,64K,512K,4MB
State:
CPU0: online
CPU1: online
CPU2: online
CPU3: online
CPU4: online
CPU5: online
CPU6: online
CPU7: online
m3000 ~ # uname -a
Linux m3000 7.3.0-rc1-m3000-rfc5 #2 SMP Sun Sep 20 18:04:02 CEST 2026
sparc64 sun4u Fujitsu SPARC64 VII / VII+ GNU/Linux
m3000 ~ # cat /proc/meminfo
MemTotal:       16595712 kB
MemFree:        16337304 kB
MemAvailable:   16440248 kB

Regards

Magnus
