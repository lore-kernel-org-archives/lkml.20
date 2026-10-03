Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D0648EC9C
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791047251; cv=none; b=rdB7jae8yXbY3acpGdg7Fu2qwWRxbOLVP47HYYx8GiVS+o2BLzAKHAMidXs/rLjmuVATBYPD8yyzwmlDs02JC3IFICyHS68rNPhYwcnqtwFbqUiVndhdp0fU7IsfDlslvSCKlnEciUfWYnvio9R5XbHm/9mHjgU48eWBVQKUIY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791047251; c=relaxed/simple;
	bh=FzlyXPstQKA22LT8IX4LjRqLlPmdLdap5eNXvrcSaIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlIZgLyaYWVl/clrrfmJpTCR7tUAebspmqvKOe64z8WRWpO1LFMvfhpPvAQbQZ2WChjNkUAIEyP1nzRrDhSzyfwNdAhg9Jw3QxSgyVp8UPDJxG2AGrhCKWByI2IW2bB54NBtLVM6yBYxL2D2IXMnt0oSXutKcpcmizSUjJh99Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bISS3wm1; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bISS3wm1"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso4571695e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791047246; x=1791652046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3GGSdJzmN2dqwo1b/5Kfo2bKbnsN93Ci8hxqW9b45lI=;
        b=bISS3wm1Rv/Fi+Np3/B5QtAvYhuG2Zm3fpIaw17tCGh36ZXE4H6+w9xUVgNq/xUpZR
         cS2KitdgcBDnSt/nZwvrptn+xb+9y3hi3EpeXoLNh+hTrWJBvWv2se1eUlwtfDl/xmpX
         GLlrR7D2uCw4lnzXmjV15+dLwyZZsiOlhjvkdgRYS7+OYCukjWWkD1lgwNGFUYqs368b
         bIv9mMfzlz0M0bk6afVSXjlB2edkrK7yk619ZW5AJbbfjJkVQW525EkFM5cMNJixGFNb
         rZlQtYqvww6TkhO78QBoiVdY89OSCAII5tYBoD8a3uXlBgr8x4o+KJMBvIoFZJeGrHUt
         BEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791047246; x=1791652046;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GGSdJzmN2dqwo1b/5Kfo2bKbnsN93Ci8hxqW9b45lI=;
        b=xwkuTGNu74SuHvRj2A8l5fuLdVhosgXMuk3HHAMhxXzRyozCGb9wa6I+q6at9XGZvl
         Wjnj+XK6NnbbY5IKimqoZnF2S+WLwBerFXSQdu57o/vQ/97ZdUPfaA3pcgngr9j+HY8Q
         UJ7rGRds9WLL7azk1AF0enlaMCWfgtuzBVHydg6eb35pbWT29jm4FSmq9lySDgMzoN0Y
         na8VIqOCRff40+fftZdpKp3aoKL9NchXV1R4pnWR2XJ8rjOkFVjndqLstZS5k0JaO23/
         sH35n6tFzyJJRG/pA9BUBRS4EIstW4NiEhnl44Sa16e5k7IbbVgVOi4yXnTlk3T10sPZ
         8aGg==
X-Forwarded-Encrypted: i=1; AKwUvByncDgxw63RHNwwhgltYg5Ss2kYfyhJjNPaZjgS8sHMR7S8+Ec8/kbReJd/CXILJaIPrqmoEZx0RuIkRSM=@vger.kernel.org
X-Gm-Message-State: AFuF++kOwpElte66zs4YG9RGSjCR5wcya/TPdd10BOXzilwQPWVINZgr
	SE65n3NcHe2T76TkHFarQmuTTyl6wgHQ9185FtxxOH3yKh8YendRl9EG
X-Gm-Gg: AYBFou2LInSXQvgppGbzzX9ZnymNuQ/ygvdGnpNBMeOCv43C0b8NIyyscYUp+pJLRVG
	cW8bzHxym+SRjEJoj28m+O650w/TRA37vUI3YFrtrYuLnja8vEii+6bjQ5FLFD9KHlmQT6viH+1
	iU89Q5Xp47E0T18ExnVDqCMyY675jD19Rqf3xK3cOEXw8hD+MCIiLTSxFKvSKRRgc0hmiVWgM8i
	U1yA4OIMSUy7uTLW6o6kmPQEruiWM7F9AZGGuiBIK+Dq+Lwfyqy1MNnxgsxsu9Ba4M2qtJQnURb
	AKsWvjwtQaglL8cd1cyW7UA6q/5DmRx25qLRJY+e6jMTY+aacD8AuF/EwrkEdKFm0SfQKp2m/CO
	XKUnnZiRmTrjNuvqKygH4q2C3oIGJ299knWAt7EHXfvV7qEtymRUq3iRQlJc1heL9ne7NjVXVTd
	gVyRJFVXmC6YoJWCxbodjbKPVohMT+PtmxSrA0JiXYxFkaFalnoq5ltHnmGMWt7LnJ/ucBtKh23
	+HGW0UKfv9ufjMwDa24B41LypmmXsoulCupkw7Ak7ydNbf7mNK+pXqmpi5D621e/94SUhWyK4dj
	Mbpt+bqmcOXN9oRAWsxEoGDAPz3x/31HPNZZUNTLgOX3ZC8LIVDPmgOw7vHmE0mr2+GQKTt6WyT
	g
X-Received: by 2002:a05:600c:138b:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a02759b46fmr107744155e9.19.1791047245976;
        Sat, 03 Oct 2026 10:07:25 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380faaeesm12742668f8f.18.2026.10.03.10.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:07:25 -0700 (PDT)
Date: Sat, 3 Oct 2026 19:07:22 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	Linus Walleij <linusw@kernel.org>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Bradley Morgan <brads@mainlining.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
Message-ID: <asEzZ1wOQ_MbgEsk@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
 <20261003093827.77857-3-kmehltretter@gmail.com>
 <33197b82-3eff-4c87-b370-c677ca31a02a@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33197b82-3eff-4c87-b370-c677ca31a02a@app.fastmail.com>

On Sat, Oct 03, 2026 at 12:45:07PM +0100, Arnd Bergmann wrote:

Hi Arnd,

> > Kernels that also contain ARMv4 or ARMv4T CPUs are built for the
> > lowest architecture and stay excluded. CPU_32v5 also covers the ARMv5T
> > ARM1020. C code is already built with -march=armv5te there, so Rust
> > matches.
> 
> None of this makes sense to me: The target should not control
> the instruction set, that is what the -march= flag is needed for.
> Does that not get passed for Rust?

No. arch/arm/Makefile only passes --target=arm-unknown-linux-gnueabi,
no CPU or feature flags. That target has "+v6" built in, so Rust code
in an ARMv7 kernel is built as ARMv6 today.

I tried the generic target with CPU flags (libcore for versatile on
v7.3-rc1, rustc 1.99.0, CPU arch from the build attributes of core.o):

  --target=arm-unknown-linux-gnueabi
      ARMv6, uses uxtb/uxth/sxth/rev
  --target=arm-unknown-linux-gnueabi -Ctarget-cpu=arm926ej-s
      still ARMv6
  --target=arm-unknown-linux-gnueabi -Ctarget-cpu=arm926ej-s
  -Ctarget-feature=-v6
      ARMv5TE, but every rustc call warns
      "unstable feature specified for `-Ctarget-feature`: `v6`"
  --target=armv5te-unknown-linux-gnueabi
      ARMv5TE
  --target=armv4t-unknown-linux-gnueabi
      ARMv4T, no clz, no blx

So -Ctarget-cpu can add features but does not remove the +v6. The
generic target also declares 64-bit atomics, armv5te and armv4t only
32 bit. Below ARMv6 I only see the separate targets.

> 
> If an ARMv7 kernel includes ARMv6 instructions, that is broken
> on ARMv8 CPUs that are lacking the CP15 barriers and swp style
> atomics, so that needs to be fixed.

The Rust objects from the generic target have no swp and no CP15
access. The atomics go through the C helpers.

Building the Rust code of ARMv7 kernels as ARMv7 would be a separate
change. I can look at that after this series.

> 
> I don't see what part of rust would depend on ARMv5 instructions,
> it should just work on ARMv4T as well, though ARMv4 may be
> trickier because missing bx instructions etc.

Agreed. !CPU_32v4T only came from the armv5te target, which emits clz
and blx. With the armv4t target it can go. ARMv4 has no rustc target.

> 
> > ==============================================
> > -``arm``        Maintained        ARMv7 Little Endian only.
> > +``arm``        Maintained        ARMv5TE and ARMv7, Little Endian only.
> 
> Here you exclude ARMv6K and ARMv8-A-aarch32...
> [..] 
> but here you allow it, so I think one of them should change,
> 

Right. A v6K+v7 kernel has CPU_32v7 and gets HAVE_RUST already, a
v6K-only kernel does not. No technical reason. I have a patch for
v6K-only that I held back until I have a Pi 1, but I guess QEMU
suffices.

> This looks wrong, the choice between armv5 and armv7 should work
> the same way as the choice between armv6 and armv7/v8, if I read
> the rustc docs correctly, this should be using the target-cpu=
> argument on the generic arm-unknown-linux-gnueabi target.

There is no choice between ARMv6 and ARMv7 today. Both get the generic
target without flags and so ARMv6 code. And target-cpu= on the generic
target does not get below ARMv6, see the table above. That is why I
used a separate target for ARMv5.

For a v2 of this I would

- pick the rustc target next to the -march lines: armv4t for
  CPU_32v4T, armv5te for CPU_32v5, the generic one from ARMv6K upwards
- select HAVE_RUST for everything except CPU_32v4 and plain CPU_V6
- make arch-support.rst say the same

I have this running in QEMU on v7.3-rc1 with
- sx1 (OMAP310, ARM925T, ARMv4T), omap1_defconfig
- versatilepb (ARM926EJ-S), versatile_defconfig
- raspi0 (ARM1176), bcm2835_defconfig without ARCH_MULTI_V7

Would that be ok for you?

Thanks
Karl
