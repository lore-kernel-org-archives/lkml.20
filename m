Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794310627;
	b=AL2Ulwx57BoQduHYXVuldcTalgd+o3atJNl946sTD/E3qUdF6HmiiA9K1f1ilC7VBep5
	 N0GFddqnxUFaxoNwghrOAVZZWU7hpomLatTGzV3o1S6WLP/6EoSi3n6QYt0Ii2PZiJ0e8
	 CY7MxIELS03e6kp0zCMuZV4Irnngnpui2LMZRi+zPQYccO+ETu4yMa3FUR3+RuStFbLmS
	 gbIwdyo+nSdkUvM6wSrHgwbeRvYVGA+vlMxxCGefjefH2q2ZOocq0uvGMSt4vRhNdrutW
	 4Vai+AfqMtvCnsGqMZmyNnuPQ0hFJjq6NhwnchbNFq91mo5o1y/PXT8kCMKdYtnATKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qt/neJcxZ9xZ75W+JO0+hRLDr4yabM2iU7/BXS4KDeE=;
	b=4uheAgfQzEP2EFzIfA++SDpiLiilnUmDzCNObj9UkN9nrT8d1JEsV8JiGpWMaZkx1I6b
	 sD+k+ZDVgZM/E4iJ+pkz2BHtfdjkUvgppA67n+MzEKztEcoWOplj7wYuU7J4vLVSuOdM8
	 eD9WfBCHpMf4+VdtUTHFzaXDOP2Fd5BuG/zZxbfcR6n8fxQ+yWO27m/QV++quePDIxG9B
	 Rj5jC5GM9E2/0GXF9Ju1A2a9biuDRrJ0Ga+KOA4C+IPNKQKw+C5Z59YjuOiFXTv0RrHIl
	 q7xnIrrZpDVfKC/viF/8/5xAYvxXuf3MtIkDdttGMG20hMJKGp9nJngfYrNi9OwRpOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTHyTB6n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D72606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D72606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTHyTB6n
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6767d92cde6so2059803d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:37:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794310626; cv=none;
        d=google.com; s=arc-20260327;
        b=baO9O8Bjc4doEVaRFq1pesRWFP96/szNAx7lEe76k6VGj61bEm2vNs+nm+ClCgOGIR
         627mn//9rMC0OH4G/cbTYMXM5AopNwc/Oy+sl0V55Xa0JFYHe7eD0dBRT9b+Jf1hkouY
         Z4dI8lRxbiEym3AbmC11mkDjBVbuxSEWEiVOko6iszzlLc4e8kloOdSIwiQljXVFC75E
         yQ/JVkjFTYXXq3/8cwleUVi71CQRQ+ffZNfqlcoxQh2kxrhjkxbhOP6h5kXb8vyZSIze
         13OOHJ7Kf/REhj47brhUkyZaxEJzQwRKxGexFVorisdf/KmJtzwEsBEYO5cduTV0p7GR
         W2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qt/neJcxZ9xZ75W+JO0+hRLDr4yabM2iU7/BXS4KDeE=;
        fh=E5LRCCSev4NVAC/GAbM4AiSD3jZe2oNT94ox+ZWE0JI=;
        b=JhkfItSxljCxK9py9o8oM5YneIGZN2nW4rdU1bu+lurfZWKZHuT1fb4OBj6IJHCvPG
         27uMHSkY8Iw0ZDh5uW0Flw14HTyraq8JyeznPcNjBHa4Yor5dmCHeS+7BqoSgIZ0rrmZ
         XSYLIL3xjOqxdH3qR8Oc/5bs9pSe9LaatlMiVSe5BszaLBTETvE3d8U2kQu0zqqO1V5f
         oZB8iClXueYZh4BZcy38r08sYmKzaaKx+rygQ6wOycF5AAmCaz3Dpe7lkF7YL6rlZov0
         glFzGFejep4BE7I0nodaV//KSoNfUjFZO9SZlHlS7JjBYl4SJM1zugQxTLtRz5OfNbdA
         iW8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794310626; x=1794915426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qt/neJcxZ9xZ75W+JO0+hRLDr4yabM2iU7/BXS4KDeE=;
        b=JTHyTB6nbZ8JaA/jdut3kJtMd66vKZ67uO8vZqznGa2kOEFm+X/fcfaMMWSuW7O1by
         ldOQw4FC/6+3QYvmrdG9gUV2ERIfRnrNjo9543Z4NaaSie5iw/e9wNBcLksOxhjnmUWp
         D3X4c3nfy69aLw6Q9L1mVRSjkWd/VMSP3gzGVKCpukMIJPcKRiSeytXqE8f2bB5EhpMM
         alKLIfcFv6SxTZlX5DUbBlQj9wC/Nn8SOqxyKfb4UeRERyXWwGOaLDDtQKu5S+1nCrS+
         Cuy8aDkbQinmx2QGZcxW/XGzyrjoUVjSj3anNguDFH3AGuoxxk2hE2fQhyR5J6v3ip59
         yiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310626; x=1794915426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qt/neJcxZ9xZ75W+JO0+hRLDr4yabM2iU7/BXS4KDeE=;
        b=MyGANyBBKDU/y9YOzRa3hJCZMOXRiWFp1dCSQLrvj5BqvIu5CCRDnYTKghz3YDMg9G
         5PBTASQJdv138Y64Pygslrdyat2xCyWwdltd7YjzoS6F1Qv2yg6UIc8iO72zOwcpJbPo
         HJPqciCTxrggBN3EnkCKKDcPtjIe5CYN0A5Ds2QaJPhPDgUHgO6WvIU+rrkL10zBDGrA
         TQgAIqJwPQwolgDkanUmACgl0UTAICvdLJG+yYDMC6ZsDQOihq5gwMS/h7LMFGSxcrNb
         q21h+h2J7zmo5YviYcm6LZQ5km0NKP14Qw0qWqadVLWTq2eszfGDJjV7hcKvGpCXHtfD
         9Xkw==
X-Forwarded-Encrypted: i=1; AL+hErFhETOLddWvuKKpmVmVwPnQaQG4j8l0Ui+TBXcALLH+hw1biShX6nzW/I7f5Gi7mrWo9XkiE/XnGUeP9OI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qApbQpHo1YgFCyuYCbqTORePzRmLsyIz5fdcYrk0q3UND3NBW
	7eNfcU2UmB+DHbJZUcrrn7KNe4tFt+jWqCZc+LvYNN5iqUAt4uUeemkPXietljGA+GvrgqPX19U
	AmvwD+hhcLHLi3gNBm98l0cAmkiJ0Hss=
X-Gm-Gg: AYBFou3AUfXER9lct0to++JV0llf5vnnVIMtI3INAn8vk6GeRUKwWdCJlcGXa3jrlo1
	e24EJYUIHMxTM3wJCmZ4DKv+n3Z12UbdYDI5bLyYm8JzDHXw0Rgi47Z5AjuZoV0g7WSpHfB/px1
	fLsMKV21/oq18U5NoPIExD2d1EOk99Mv2Ag7eVcqdZqndLoDg33/0dNnPipj8kJYASDj7WwYWVl
	nIhwMfG5iLkCZKSuTc5AUbv+Q553O7ZGBiP5bKfgsdCOSzJe9W294uGoNwZtlM3B1YDpB4oQFBL
	jMJj2zbXNVT/cSMz0P//Rdjo5E0fytQRpiBM8HRVRo/epVtq2lwMat3qXLc2RtQoBTGRk+mP4zB
	/TkjWAaut7G82OyM2NbeUfMY/HMJ6op8pjnEsrqzbS+rrY5wz3BfQMYGuhnRZ3ThoEw==
X-Received: by 2002:a53:edc5:0:b0:679:887f:a2bf with SMTP id
 956f58d0204a3-67c567cfd59mr955013d50.36.1794310626310; Tue, 10 Nov 2026
 03:37:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105160209.1504867-1-ekffu200098@gmail.com> <20261109213346.634e83b158ee7086e64f9cd5@linux-foundation.org>
In-Reply-To: <20261109213346.634e83b158ee7086e64f9cd5@linux-foundation.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Tue, 10 Nov 2026 20:36:54 +0900
X-Gm-Features: AclHuK_2rdVIzXDvlS0k-IPNS1HMB51W2pzMFbgaNitdqk4GrOOh4YW5AtmS_js
Message-ID: <CABFDxMGtYLFSiCLHsXn_ihG3cv-oCgo01FW6e+9aYN2gvM+W_A@mail.gmail.com>
Subject: Re: [PATCH] fault-inject: fix boot failure with fault injection boot parameters
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Akinobu Mita <akinobu.mita@gmail.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Andrew

2026=EB=85=84 11=EC=9B=94 10=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 2:33, =
Andrew Morton <akpm@linux-foundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> On Fri,  6 Nov 2026 01:01:58 +0900 Sang-Heon Jeon <ekffu200098@gmail.com>=
 wrote:
>
> > Since commit e9bc360b105c ("fault-inject: use prandom where
> > cryptographically secure randomness is not needed"), setup_fault_attr()
> > calls prandom_init_once(), which calls kmalloc() and schedule_work().
> >
> > But setup_fault_attr() can be called from __setup handlers before slab
> > and workqueues are initialized, so any fault injection boot parameter
> > leads to boot failure.
> >
> > So use DO_ONCE_LITE() instead.
>
> thanks.  I'm surprised that command-line fault-injection options (or at
> least failslab) have been broken for 1.5 years.
>
> And what's going on in that code?  Why does it need to call
> prandom_init_once() from three different sites?
>
> I discussed it with LLM for a while and it proposed the below.  But I
> ran out of time to think about this.  The code seems to need a
> signficant rethink so I suppose a quick bandaid as you suggest is good
> enough for now :(

Thanks for looking into this. I checked the proposal from LLM.

>
>
>
> Could we use a shared initialization helper instead?
>
> There are three prandom_init_once() expansions in fault-inject.c.
> Each has its own guard, so configuring another interface can reseed
> the same state after fault injection has started.
>
> DO_ONCE_LITE() avoids the allocation and workqueue dependency, but
> doesn't serialize concurrent initialization or wait for another caller
> to finish seeding.

In theory, right. But IMHO, do we really need serialization in
setup_fault_attr()?

> The patch below keeps prandom_seed_full_state() and gives all three
> configuration paths one lock and one completion flag. The three calls
> remain because each interface can independently enable injection.
> Moving initialization to an initcall would leave boot-parameter users
> able to inject faults before the initcall runs.
>
> An ordinary spinlock is sufficient: these are configuration paths, not
> the interrupt-time random-number generation path. It also preserves
> the lock type used by DO_ONCE(), allowing the RNG's ordinary locks on
> PREEMPT_RT. No raw spinlock or explicit interrupt disabling is needed.

Right.

> From: Andrew Morton <akpm@linux-foundation.org>
> Date: Thu, 5 Nov 2026 10:01:33 -0800
> Subject: [PATCH] fault-inject: initialize random state once without workq=
ueues
>
> Fault-injection boot parameters call setup_fault_attr() before slab
> and workqueues are initialized. Its prandom_init_once() call expands
> to DO_ONCE(), whose static-key disabling path allocates memory and
> schedules work. A valid boot parameter can therefore crash the kernel
> before boot completes, even when its probability is zero.

Right, and that's what we are trying to fix.

> The debugfs and configfs setup paths have separate prandom_init_once()
> expansions. Their independent guards also allow the shared random
> state to be seeded again after another interface has enabled fault
> injection.

Reseeding could be useless work, but it does not break the system.

> Replace the three expansions with calls to a shared helper. Serialize
> initialization with an ordinary spinlock and set the completion flag
> only after prandom_seed_full_state() has finished. This retains the
> existing seeding algorithm without allocating memory or scheduling
> work to disable a static key.

Code description is correct. But we can easily find how the code works
without this description..

> The lock protects configuration-time initialization, which is not
> called from interrupt handlers. Use an ordinary spinlock rather than
> a raw spinlock because the RNG acquires ordinary locks that can sleep
> on PREEMPT_RT.

Again, right, but no need to describe this in the commit message.

> Fixes: e9bc360b105c ("fault-inject: use prandom where cryptographically s=
ecure randomness is not needed")
> Reported-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> Cc: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> Prepared against c2366a2edc886a5a02d2a43de8b1c6ec09bab840.
> Source inspection only; this replacement has not been built or
> boot-tested.
>
>  lib/fault-inject.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/lib/fault-inject.c b/lib/fault-inject.c
> --- a/lib/fault-inject.c
> +++ b/lib/fault-inject.c
> @@ -12,6 +12,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/stacktrace.h>
>  #include <linux/fault-inject.h>
> +#include <linux/spinlock.h>
>
>  /*
>   * The should_fail() functions use prandom instead of the normal Linux R=
NG
> @@ -19,6 +20,24 @@
>   */
>  static DEFINE_PER_CPU(struct rnd_state, fault_rnd_state);
>
> +static void fault_random_init(void)
> +{
> +       static DEFINE_SPINLOCK(lock);
> +       static bool initialized;

declare below fault_rnd_state looks better.

> +
> +       /*
> +        * Configuration paths must finish seeding before enabling inject=
ion,
> +        * and must not reseed state already in use by another interface.
> +        * These callers are not interrupt handlers. An ordinary lock all=
ows
> +        * the RNG's sleeping locks on PREEMPT_RT.
> +        */
> +       spin_lock(&lock);
> +       if (!initialized) {
> +               prandom_seed_full_state(&fault_rnd_state);
> +               initialized =3D true;
> +       }
> +       spin_unlock(&lock);
> +}
> +
>  static u32 fault_prandom_u32_below_100(void)
>  {
>         struct rnd_state *state;
> @@ -50,7 +69,7 @@
>                 return 0;
>         }
>
> -       prandom_init_once(&fault_rnd_state);
> +       fault_random_init();
>
>         attr->probability =3D probability;
>         attr->interval =3D interval;
> @@ -240,7 +259,7 @@
>         if (IS_ERR(dir))
>                 return dir;
>
> -       prandom_init_once(&fault_rnd_state);
> +       fault_random_init();
>
>         debugfs_create_ul("probability", mode, dir, &attr->probability);
>         debugfs_create_ul("interval", mode, dir, &attr->interval);
> @@ -456,7 +475,7 @@
>
>  void fault_config_init(struct fault_config *config, const char *name)
>  {
> -       prandom_init_once(&fault_rnd_state);
> +       fault_random_init();
>
>         config_group_init_type_name(&config->group, name, &fault_config_t=
ype);
>  }

In general, the shared initialization helper looks okay. But I think
this should be applied as a separate patch. Also, the commit message
is a bit verbose.

Andrew, is it okay to send an extra patch based on your suggestion
with your co-developed-by tag?

Best regards,
Sang-Heon Jeon
