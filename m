Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8523D171C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 20:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791492568; cv=pass; b=MrmFeuMqv5tdClG9/ikfdqMZ16UfPMKQ1BFFHiqT3ZLmsDbXg96hwGYeG8WSqGAB/sEHvYtwkPqkD5PTHTM7JCCx/daVZ12dS8AZmc3zHC1kDCt7Z2roM4FXBCkD7NVRRTFZh7h3Xbb6YWtDj9UUUygx2vVZbMgPtM2fJPwhuaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791492568; c=relaxed/simple;
	bh=Ga599ZX3Mr76ihAc61srmvnaS4ilVrwnaph9aVtQkFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxDEN55S+ayIpnBXVWgBg2Q3nwNK2KNFBhOv/wZRq1ofZRJeDJrRk7NNg9EZB/YFC5+6EjE2noAnnUpPNRAWXw8pJAEqNnNmHCr/2UXje/9zTJqByLcWk2rUFaydpaz5t4b4OThMMD8f3O1osrpEUsMBSzxqVHf4OKlnUb3TuYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3QA0cX6; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3QA0cX6"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso1956410e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 13:49:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791492565; cv=none;
        d=google.com; s=arc-20260327;
        b=jOhFRH7OSIkZjrNLeATY/94BQ0trDYfsRuOU0rAYgtdGfjcPbTSNYh0+NUna17XPKy
         6G+8LiWcmFOh53djNAO5c9y/VPRWA28BBQEORaWHjF15+uE4JeCa1yYIAsfQ6CxI3mzI
         idTnZJTju0uMGYJro0KmM2UzovE0nffxk4M2G8Yhz+adkVIWxOJLFIma4869ltZEk0oi
         ASAhIQ8smDFnTMqKP2gkxg4D3K2vZpgcOtvMp+cnhb1bXAHI5WtFuPc0zojTD6Zt9S8+
         8J6nMZigpmtPDk2thjoTfjnFP4wGT+FeT7BLIsvEz0RACZ3eJzABB+hnCRi77AWwsrWJ
         ShVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wf9eR6XwQKqDw7hx5JDyY1pAL9RLJYxNR29Noi0v2B8=;
        fh=WzD5IqM+NigZgj56xCos0pHRH72kKohcFzEKopEmoOM=;
        b=SVgxU+zNfaPllVdQoIeS7VAEtrhJXjcwHL/fTa1MyT/Xvd7gAcypvoT6XH76Bwuinw
         +jZSOm0lYY6TVoRD5N3vfg0SFDI6He/894zbRMbUIyDM9qdyCrhcQPptHNyYrbtoERw8
         c7CdDAm1tqCC41vG7PCoSF+SsgPYdnqXafFThQjIFw7VzmcqRisNa2rd989FQyWqjD6v
         RbC8BE1uKLN/cxpxvTfDlFwwm9V5RRMZYbKJnjDUkUOYowV2evc/hEJGZUUxMn3I5R+/
         mAc1l958fQ76SoQktPRCv5FBBkL+KvO4TI2p1tTweUWrs/J1C7g8cfCOFR52rmNv82zp
         fjtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791492565; x=1792097365; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wf9eR6XwQKqDw7hx5JDyY1pAL9RLJYxNR29Noi0v2B8=;
        b=c3QA0cX612HlJvtnCqhM4+5CuqbY8IhawoA+JrZHPhFofIWdZFzL0cJ4Hh6yVdc9dE
         txXhqBNBBPGjB+aoUZ20DrSfZgVvX4xbhhdnpRPcoQiab8CDrRMdbsMuUHWY5WlQN+8c
         VS7kAhqM0sUfsZ/q21jdnhLVjEwoyvM6KRsJx/Stv4dNieTAljyL/6H0N00x8GHNJp6n
         g25KA8Ue357QXI9e6d/w+oOcxEGMQEZIcJKkARD21QxQeSFcF+bM04V3Y/3dkKKluwt/
         lExA+zpa4Q4hE2mbD9Eh72UzIVenPrmtrbPbuH8j3oqx0aOx+VAv4Y8RVSMWIrnzPKXH
         b1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791492565; x=1792097365;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wf9eR6XwQKqDw7hx5JDyY1pAL9RLJYxNR29Noi0v2B8=;
        b=D234X9wfoZx8BuRePKb4HQp1OHY9WO+RKEL3DKL9XZNeI8BRG2Ev8Kc68Eq4mHEuPj
         Dp/J1x57miIaX17PGEwOW+eUhQRiEo04W5giLS+IZRW2Z0k/to8vmO4zxDxpTKyO/WRj
         7TrbahP2GYsQWv6QqGG9cYbDNavOiSFn27TOZ2xIQ0QvoifR7w3DVOK9sH9epuoMqvKY
         BbV5xwF9XPJHr8wbIHZZAPwOmzfoqq9IApsgfhmlFvj741lTXjP9B3vJec06Os1frsco
         DEyBRwLzby78dM9C9beuo54Wot6wDsYVMgmNWAVHmGyvBphmAHvbGpMsTdEqEzo+o/LV
         ZjlA==
X-Forwarded-Encrypted: i=1; AKwUvBw5WXpEXVKglZBeEzQcrIcKFHgd0l3zkjFKB08Z6CsJ7VDXnNienHa2iyFRU0yvjlTMBZQMv/GtoyXYPN8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLe+pI/+O/KJB1skkjnYPuaf2eoAprZCAii6BFYHJAAnw0vY62Q
	QSLplS0e3VEI43CYWF5lA3mr31ItKf46GQO7291isEFrPag54JxXv+mc9GSHg1YDfcmkFBDyBZE
	4hWfRXLkzOZHutLDd6v4njh2EHIII/I8=
X-Gm-Gg: AYBFou133vjENabqk4YTc7L/90C8DVo2njxqwXkkCkbVOv9d7pEI7UnKej8+mqCAUfb
	okFvwJRKEeubWQoXNAnC5EeI+6Iq35NwWEjelG+Tj0Cy6C3U6PuOQ0gSU+4TICMhHp88jUHhiBE
	61FmikNgrYI0rzJCr0P4uxkDIDeP4hnYUmxLHsJ+1f47pRO3KLem4Z/aFRXZNkZNZ7JmdzHTUb8
	8h/hDQZO/3Zg/PrPhr9onmEdvktv164UqafA95uZ8oPjn+riEyteGWI5BixsKXtyHPGqAkWAJJe
	KsIECH+Mz2Y9UMrogoUCV6DiFktP/ZceFAAHNtGbRhWI/QHc37LnglUvZGCXxqCcziyACSii6er
	V3YSRy6Oe9zf0xQ==
X-Received: by 2002:a05:6512:2245:b0:5bb:42a2:31fa with SMTP id
 2adb3069b0e04-5bcd0743f51mr2355277e87.60.1791492564814; Thu, 08 Oct 2026
 13:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225110548.31431-1-linmag7@gmail.com> <20260225110548.31431-2-linmag7@gmail.com>
In-Reply-To: <20260225110548.31431-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 16:49:12 -0400
X-Gm-Features: AclHuK8_vOoVjkuMythyEP1pi3zO_VYWRP3KEuAAd4ZRgtZfVlu8c9OpH9_kgB8
Message-ID: <CAEdQ38F7RstggOKabd80tr2gofrMMAT0N1agN-RBeybxxJWDVw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] alpha: Add support for HAVE_ARCH_JUMP_LABEL
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, skhan@linuxfoundation.org, chenmiao.ku@gmail.com, 
	shorne@gmail.com, corbet@lwn.net, glaubitz@physik.fu-berlin.de, 
	macro@orcam.me.uk, macro@redhat.com, mcree@orcon.net.nz, ink@unseen.parts
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 25, 2026 at 12:02 PM Magnus Lindholm <linmag7@gmail.com> wrote:
> Implement static key (jump label) support for Alpha.

Sorry for the slow review. This looks correct to me. I applied it to
your for-next (the arch/alpha/Kconfig hunk needs a trivial rebase) and
it builds cleanly with W=1, CONFIG_JUMP_LABEL=y and
CONFIG_STATIC_KEYS_SELFTEST=y. I have not booted it. A few comments,
none of them blocking:

> +   select HAVE_ARCH_JUMP_LABEL

Please keep the select list sorted.

> +static inline void alpha_patch_text(u32 *site, u32 insn)
> +{
> +   WRITE_ONCE(*site, insn);
> +   flush_icache_range((unsigned long)site, (unsigned long)site + sizeof(*site));

On SMP flush_icache_range() is smp_imb(), so this is one
on_each_cpu() IPI round per patched site. A key with many sites, or
a module load, turns into that many broadcasts. That is fine as a
first version, but it would be worth a follow-up that implements
arch_jump_label_transform_queue()/_apply() (HAVE_JUMP_LABEL_BATCH)
so that a key update does a single imb at the end.

> +   if (disp < -(1L << 20) || disp > ((1L << 20) - 1)) {
> +           WARN_ON_ONCE(1);
> +           disp = 0;
> +   }

With disp = 0 we write a branch to the next instruction, so the site
silently behaves as a NOP. I would rather return without patching (or
BUG) than install something that looks valid. The comment about what
other architectures do can go.

> +struct jump_entry {
> +   jump_label_t code;
> +   jump_label_t target;
> +   jump_label_t key;
> +};

Optional: HAVE_ARCH_JUMP_LABEL_RELATIVE would shrink this from 24 to
16 bytes per entry, and the module loader already handles
R_ALPHA_SREL32 and R_ALPHA_SREL64. Fine to leave for later.

Small things:
 - <linux/mutex.h> is unused in jump_label.c.
 - JUMP_LABEL_NOP_SIZE is unused.
 - ALPHA_INSN_NOP has two trailing comments.
 - There is a stray double blank line before the include guard.
 - The commit message could note that this relies on kernel and
   module text being writable (no STRICT_KERNEL_RWX on alpha).

Did you run CONFIG_STATIC_KEYS_SELFTEST, and load and unload a module
that carries static keys?

Reviewed-by: Matt Turner <mattst88@gmail.com>
