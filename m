Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794675289;
	b=LZ8iVNZ0YLdsDv3Rd4nlRAF7KqlNacYXmylAtYKLQ5MyHrk8oZJ4orYyGkxRG/F9I8FC
	 V1f95VAMAo/e+OAHeA+EZIx8ndt5i4KlnIeYbcc6Z8v5qK/j8thF0EhsdlBnk+Jf7B2AI
	 sdGe0Kg0wiRpZHorw2tUa9gqX6oWcnZqkP2OqpTFa2wfUZi556QhG+Z6a4/PQPQQmIfnJ
	 OZWWOdu2JULZfd/z+2di4v/Uw/8mnyvz47b0QhtvwLju2yzRmcgvD4leTsuli9PXDjD+G
	 B5FV0whXJHo/vIv8t55MHNJxPzIiv25i8Ndyvye1ziCb5QgOR+lBBMRv/Gdz305tTdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CF2sg4s32j52wgctvWrapA+d98gMLIJ8r2rlSSFzULk=;
	b=km8K3K79ZLJye8x6p6tA8sksWPfQMDqRtg8jMT1eDMRqma/mAEMsCYhB+sMgQFyL7bTT
	 Ors1wG0xTlYiwVV8MEtnvCeCj7aWTgesfnK+VOHA/uhOXBt2yQYG1U4AAQhMC/F0AgXcK
	 znqx1N3A7zx7iIioXWPHrUE/AAfW95wLxR+UOdKtS/tK/W3hLeB9oEMsKgBm3GKqNi+5U
	 nwjEWnRDJlvVV3nYDgpIbaUWrfVWiVwpUyLFlYJMm61+mo1PHWYwjAn832aUDDwlniqgm
	 ttEr039/a1DEmNlVwkjGWtCS8uwVPA+HPPPBiFlY/g8fB9rdyIbOMt/yGRLdEiqoYoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFHvuLER;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950F5606A881
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 950F5606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFHvuLER
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3acd523a802so23589161fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794675287; cv=none;
        d=google.com; s=arc-20260327;
        b=efM4tNpH1v4sOkQgB6UYsiqPFQ/2C4L2oj9RWGXeUGpotY1zHg9Wxux5/fF+JMT+jw
         Q3dqAbAVcKDllYwDh4hdRPrOiWGxcR84bKIBxZgMa3TASSZcUZyB+xcdFFyydh5tRG45
         keGhNcfDEeGhLawNzLxQ6aqD9Gm0B9Mo2PLere5ovkcWSv/vfQfb0aHl6KDVSCIgwa3E
         wSTn1IfEHiW+mMZWp7czTXlh9VYagFjWZkRSrK/n8lsa/No4TMbmbVXcrJ4m4RnwRkM7
         k+3/57OLwKkPf3fZQC/6cV0O1TxfYbmlelQ26kTKtnfRXrK5ZfqH1aPv/VFLH1eVxd83
         7TLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CF2sg4s32j52wgctvWrapA+d98gMLIJ8r2rlSSFzULk=;
        fh=7CavwKseMpg9Gxkxr/z5uu1ultobfgsxMpzEVBfqocs=;
        b=CSe7elcGT+7DAOG4CC3dLGyjb/czWJCH8MB34Qumux/QOllIF2B8CBkFmudtyJ9Scf
         Pk3osGT+vRbQZ3n8rBoCrXjtk9JuWV9mCFZtUxPvKUFy6O4qx3OxO8EAq5XWr10WZaDV
         mzJEfsd9cJpRpA3sFxufgtM9KVgdGB0s8DMcpTO1lcsWQP1Lbkn5jFjYAc6klE3RX1J4
         rDdCAxVeNxF2nMc2oi2LEbo1slKcYJN+iWbmxNa9Dk7G7HINptsmczHaeyaq3z9uJfuQ
         gqrubcn24FwSJvce7YT+Jb1oTUVbx9nGwfJlxQvBdIvkepjWzGM3hAqve+Prx1gsGO6s
         638A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675287; x=1795280087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CF2sg4s32j52wgctvWrapA+d98gMLIJ8r2rlSSFzULk=;
        b=XFHvuLERxLWaiXCeE49sALtCyWFdESrxx+rfmFUwsPIg4y31Pau9ZD63BGRXdEP8AR
         SOzbYRY/+Ts95qKSUWlYY4rpoNQ+U9NaVy/Volm6uwuG0JE0YStQBNCCmYj8qd/hJVMe
         DnH8Tj7FPa2oc0EIj7Mwrpdx96DEvY5c275PQtrYYUudnR15FrAF/y5P23SgGRJpOJRL
         3weuOg0cH7opmmjxQ/+d+jx/BikIBwLyOAK72uw60Y4uxbCIRTyuZb52jOfEOiCMaLE/
         QCdjeKLmNsqZpst4WrsHxCP1JhkiKlQIkPwnW/Vwa5ikmDTAEfOy5KoHTgQNSWAa1Hsj
         mfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675287; x=1795280087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CF2sg4s32j52wgctvWrapA+d98gMLIJ8r2rlSSFzULk=;
        b=RbFtZphmr3SwUOiei1Q5710qBvaJS7KSFVqJZhg+Qmapmuhvf6rYHROCzZ9UPzdDjt
         5idai/9wYqsSJGhBD71Z34lvFqSjTuEqudItgyz6HagLOOpbQ5jS/ZaftvMlYH5rWI5f
         92/oUIBaiJ0f3Anth04qdtBYllvZVqybbbKiyydHX3AEUsMAliLOCXUBw9/aZ9AxaPJt
         KugYeLR17m1xwBuJImMNfdVRxV4eVDI8Q9m3zsahUhkaE3BCFDArth0Gdhra0159Hcjy
         8qto875dUha3orjSZUSKzu9IaZZsJDXTU50B5PRTLpw6afnNzu6hUG8HYeYkzYiSjCmr
         cCiQ==
X-Forwarded-Encrypted: i=1; AL+hErEMUW+6kfir8QQLV10Ez5Pt04oN0Th6sGYvQERzdlQp4fzoI05MRC+35bx2RiW5TMEBldYEAbkn/q/ZF5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jKQh2O2xolCy6GlF2vHZVWcCw5XASqxbQv9u58RNrZZtow28X
	NcczkkGFZ544Qs2YMnWX1TlFWO3y1D14ESId2/0x7rwRhts2zU1WvEV2fdUBXY6bvWpvNj0+0/f
	iSmnq3DvUttkEexWPzxaJHPG6ELY50ciKYPGU78Q=
X-Gm-Gg: AYBFou2QKDTs5FTPt0GzAvvcX9F0kSoF2rGhDBzQ9Hyod/xtqQobPeW0SLz9QA06yfL
	zDjhZ2jP9cPgAcggKaqEorf2D/Ow7grNyIVZJpf5aoqw53Fvy74Pa0+ingzBllfAa3Vo5zVnIX2
	Qwme1oJRchJJO2z1ARmKzO+JnVSKU5euAGEHDjUHmEJfhDbrX4KQmmH+MGUAIiY6GB+zmMDFJkB
	LJFlk3btJ442m0ostPGsRUrm/z3XXR5BC+SgphIrZlkJ4c2aoA3aYPrUGu85Tj+OkPNwv1KMNYJ
	nXUV3uxpAMLg+NWbp3LZS46kEzncNDk9S96wRYSE/xm/MjQ1Bh2HHAKQCRpLtLzyJSDiga5Jb/m
	bFjLsyI9BUlEgtuUksk9cfMEmXDUsepj95LT/57IFpxUYrXo9LwPqEDBbvi+cRqUI6FNqcd9Vl4
	OWblzI3N6VkgZy5P6sR1J5
X-Received: by 2002:a2e:a105:0:b0:3a9:a1ed:634a with SMTP id
 38308e7fff4ca-3ae2b5223dbmr17570241fa.21.1794675286552; Sat, 14 Nov 2026
 08:54:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114094826.1282965-1-linmag7@gmail.com> <20261114094826.1282965-2-linmag7@gmail.com>
In-Reply-To: <20261114094826.1282965-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 11:54:33 -0500
X-Gm-Features: AclHuK_MrK0yJPPK27NhA5Tq6yYsNjKGRvII1NkeAvzQvNnX6YCbiW-FDudKjyE
Message-ID: <CAEdQ38FMuOzdFkU4RQFhZJkSiczzVLu-eBiZmjwpiUUahDvjCQ@mail.gmail.com>
Subject: Re: [PATCH v3] alpha: Add support for HAVE_ARCH_JUMP_LABEL
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 4:48=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
> diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
> index 850f1265cc55..4088cd56866e 100644
> --- a/arch/alpha/kernel/Makefile
> +++ b/arch/alpha/kernel/Makefile
> @@ -92,3 +92,5 @@ obj-$(CONFIG_ALPHA_TITAN)   +=3D err_ev6.o err_titan.o
>  obj-$(CONFIG_ALPHA_TSUNAMI)  +=3D err_ev6.o err_tsunami.o
>
>  endif # GENERIC
> +
> +obj-$(CONFIG_JUMP_LABEL) +=3D jump_label.o

Nit: this would read better up with the other unconditional obj-
lines near the top of the file rather than trailing the GENERIC
block.

> +#include <linux/jump_label.h>
> +#include <linux/kernel.h>
> +#include <asm/cacheflush.h>

Nit: checkpatch --strict suggests <linux/cacheflush.h> here.

> +     if (WARN_ON_ONCE(disp < -(1L << 20) || disp > ((1L << 20) - 1)))
> +             return false;

Thanks. The target is always within the same function and Alpha gcc
doesn't do hot/cold partitioning, so I don't expect this to fire, but
it's a cheap safety net.

> +static inline void alpha_patch_text(u32 *site, u32 insn)
> +{
> +     WRITE_ONCE(*site, insn);
> +     /*
> +      * Alpha needs an I-cache sync after patching executable text.
> +      */
> +     flush_icache_range((unsigned long)site, (unsigned long)site + sizeo=
f(*site));
> +}

On SMP this is smp_imb(), so every key flip IPIs all CPUs once per
site. That's correct, and fine as a starting point; batching via
arch_jump_label_transform_queue()/_apply() would be the natural
follow-up you mention in the cover letter.

I applied this on 0b4cadbe7c39 and cross-built an SMP defconfig with
JUMP_LABEL and STATIC_KEYS_SELFTEST at W=3D1 with no new warnings. The
patch sites in vmlinux are the expected 0x47ff041f nops with nearby
targets.

The diffstat in the cover letter is stale (63/146 vs. 65/148 in the
patch), but that doesn't matter for applying.

None of the above needs a respin from my side.

Reviewed-by: Matt Turner <mattst88@gmail.com>
