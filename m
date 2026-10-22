Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792702151;
	b=lK5FDzKtFXaNVDxBr/SZcE2SMQcmqf0U1cwba3z7OWzwFecuEeC2l43jDsU3p0jetUKL
	 PUWsm9JH4V6LxBTD9ILSOqQsonhJdHbkDjg5zmdLKBuD+W4kXUAgNbuIZ4Ca3cCt4t0RC
	 zDqoe1q4FPqNU4/z+amO2+6ZAt7dFiAMTUKjZOk0VYLbpJahsfcsNu4f7oziASoh5LYMN
	 61Se50T+zeSc6nlDGHTirTRW2SXN0nqXw46ViA+FEG1ZApW43iPImY9ABS5M5URAhSiwJ
	 DlrBHejM4xFntpjrAOretHvN/H+dIWO6fr2qIgvX7AxwV5HF0l4BRWIcmdpLtQ372fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=OvzPCxIrkqhvZBNjMscOG7UdsRW24r6x7d5VqQHpYiE=;
	b=TSf+W8Cp7rc4UiUrLXK0guIYrRlVegzUK9ht+trywAa4BAwqm0DFw234Z/EKcRklPVZ5
	 rn5KkPOOPbhMeQSliv/18dg7AzRNYliN5N3hEraYSj5SksMGIRKtkrTCPLMHJ+pMGqxta
	 U/LRcv3pb08hHmjeoaAnrwzXRvnYT0uS7MhfQ80+7+mMU1mQ5zVqSD9agdHeiaDKKosx1
	 ujjQDJGHXUQkQhkfL3KPAqHdlPCQiHTm7+LptnF0axXP6hUiBi94TaUssSwVwG1nXBvBx
	 K6yn7XDihTfxJUUloyj9mQlbLDd9BdnhgIpzMHvf/2cuwvvMlt2TpPySBnSkpIHqvPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iHeG9thE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA49606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA49606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iHeG9thE
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so250032a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792702150; cv=none;
        d=google.com; s=arc-20260327;
        b=bc7vVv1PAQwNt+5HGkn+H6rPDXnreyHOVSh+DxyW48Oxn8goNCk27Ov53ELsHJhkst
         NzDPFm7acCY0lobZslL4vUNvc6NknfjQb4Gq+5RGG/bJPkYOZFSr3/Vq8FHEdQN+D5C5
         R4ifc1FTDtavlAOn0IOZ3akSgLM76hcrCR9BRnTwcrcyvvK3WzJMYxOou3jyAa2gbRs5
         Pz4f5dkdN2dWHOQ73iFmNd3jk/RqxX9+VtKS/qr2oqAy01h5fFggA2jznHNFI6ZwCESF
         TLj6F0rr7S2UQ03iIhtz0M3eVYsw0HYL7dcog9vRNc+Wbifwm00rh1lsqatFOEHpN1dR
         o2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OvzPCxIrkqhvZBNjMscOG7UdsRW24r6x7d5VqQHpYiE=;
        fh=AbgTxhcdx7fdORvZRvdhh+25BLXtHGJaO1rtKEeg0aE=;
        b=MuDeBOPynYFfO9WQjaHvEbX70oV3bupuuh8rxLstbgBpabr1m6dqdR2hZ+VIxBaBv6
         xjcJlawNysogVPd7rDrvwg1jA4Cbw59BZrgZC8YW6HyGJ3hFS9u61aQHE68zVbpD/yp8
         kJ0SP9sBQU2MwFrGNWvCP3E6Q3GJWHLC6ha1uoxtFOwdNFt2wfqap1HPzoG9zfPouqbW
         //LfbkOApXHi1JTMbg5e55fOAzlraituhPsIHz0eU9kAQwsdQfNHnvLlIousRPMR6ToB
         IW1/aaxMwo6SjiWOyJgvrPI2ocTuMFxmUJmBXXBJX50H2+PxAg3+UChSzQdsMUM7GszP
         FPuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702150; x=1793306950; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvzPCxIrkqhvZBNjMscOG7UdsRW24r6x7d5VqQHpYiE=;
        b=iHeG9thE3s9LcKelk71iglCN4F0Afd1LeQv0OUazHFT5/yzyvP7hDjbH75G0x56Tdj
         xWppbOD2Ildu+aq5RVND9vxGp+SIu5/76bgxeQrx9Bk9hVGoma7IOnsleLTlOXd6HMDa
         cyrijq9a9zWk9jC9QdTbeQKOfHJFp+jS6r9Cpdyq8C7eyK3utqLzVnYShlNYezFf0ibS
         CgSST+CKZRtQ0/5IJR8rLJCShYW2Mezp7XlbVuzKLcWDGcJ+Zpz5esSQg8wDxgOJ6yQN
         ECiR2VPqDHnuMF1+LwFX52xzodRJcuxCYBXui3McxTIGYu+OfLmjVE8xqtOzUrwlLZKR
         6Isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702150; x=1793306950;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OvzPCxIrkqhvZBNjMscOG7UdsRW24r6x7d5VqQHpYiE=;
        b=hTuI+McqLhML2m20k0qQiQW6s4YooUPjiYqjoSpQjQCmyCP/Nkv6kijpFE0cpO1em4
         WByTwHfKlz36uMdff/0j9fCNBoQU6gQ1QBvpBrLwTnfwuL8SlTUYuwf+YKMbg6+81sTF
         mNS0T+dwSo8s/yT0mKByFPWFZlWsVvwmYNmCqZcuQ0n6IorrtmmaomWrLnyCclZSyrDr
         A7OepDnEHhWEYbfSocTj33mj1sMC0o3MPwcu0KvSYSLZ2cHITz2++3SfN8SIgItA822C
         frd8IFk6Ng+hBn8TIsuVZFFA/1jRj+aFf67Uj9PJ7Q1WTylxCHgMMrpUESM8P3yT8fcz
         Ehew==
X-Forwarded-Encrypted: i=1; AKwUvBzhi2eABDW63hhBXyhTnCvDDDMuExK01az3Z1UaiXNde/YxkueYdiwQYK3RZy41sdUfMcWTF9zEsWhvH50=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWZDyztdyA62qU7groEZU1XmWZpbTvdikhD7MU6jlabkFv+ivm
	1suyj3HpUVPbEcC8NkPm4tNjUI6NDo4mS3YZXmBepg5HcJm9E3T78xMnsHHy6ECSSaMBmYtOv5Y
	YM2OWpPdrViszjiMCp2lbPoBPraUukIY=
X-Gm-Gg: AYBFou1ztsYvHXVmrNcXrE89cNA9qtw1SS+VQBE4H8pzlFQHdCrevjvGPOAMe0UDGhM
	gnedtcP0KHexgYhlOxBxQLIQ0kgcEeNjmPxx+rErWgJcS0NjDUktGx1btLyPzsfk59AEYw1LHQV
	l2Rc27teNu9aL/EAAj7sJM/JAJUogCjKg8bzhkhVxJzAPR9aJvnyCmw2fCpUnNdDO3OgO60vf5R
	Hv92B/DRMuDA6pPMsT56G8IDWY0u0K1Iuyrv7AVHEoNFmk6mnOirbV314ogXEqUCuDhHvL5btn+
	0FUJanazytNpFIcCnxDGVos3qiqm8SqN3HqyhBbvpK82quu0c+ROG/TuwOscHSQI4CXJMW9NV/t
	MUvlc5jkncbVy5yWlGDknR0yWXFdNCAHpwwe4s3t7Av6Cl5Q3pdzqgdU4PwtwOJvmeh2p5ZSfVy
	VlCaR+mkNY1pziKpRR//0ZDjek2239ZUatwsOKL6JB
X-Received: by 2002:a05:6402:24a2:b0:6b3:e399:406b with SMTP id
 4fb4d7f45d1cf-6b432bd8c35mr771506a12.17.1792702149698; Thu, 22 Oct 2026
 13:49:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022163241.2504922-1-fuchsfl@gmail.com>
In-Reply-To: <20261022163241.2504922-1-fuchsfl@gmail.com>
From: Adrian McMenamin <adrianmcmenamin@gmail.com>
Date: Thu, 22 Oct 2026 21:48:58 +0100
X-Gm-Features: AclHuK8cDu37qi0ceXqicT2LWOMRDAcC3-mTU4N-HReiSSPGpfvVUaMqm6R8bQU
Message-ID: <CACwZE5RA=WSgkUv98+CUfnT4Q2N231+ejggofDuYHB7x+Uz+gQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: sh: aica: Fix spu_memset() stride
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Markus Elfring <elfring@users.sourceforge.net>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 17:46, Florian Fuchs <fuchsfl@gmail.com> wrote:
>
> spu_memset() writes one 32-bit word per iteration, but advances the
> destination offset by only one byte. spu_reset() calls it with
> 0x200000 / 4 words to clear the 2 MiB of sound RAM, so:
>
>  - three out of four writel() calls target an unaligned address. The
>    SH4 can't do that. Each one traps and is emulated by the unaligned
>    access fixup. This call to spu_memset() causes 393216 unaligned
>    accesses, visible in /proc/cpu/alignment.
>  - the clear covered only about 512 KiB of sound RAM, not 2 MiB.
>
> Advance the offset by the size of the written word, to clear the full
> sound RAM using aligned writes.
>
> Fixes: 198de43d758c ("[ALSA] Add ALSA support for the SEGA Dreamcast PCM device")
> Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
> ---
> The patch has been tested on the hardware and sound is also still
> working well, the boot is faster by about 4s due to less unaligned
> fixups.
>
> Previously: 7.9s to boot:
> [    2.900000] AICA AICA: ALSA Driver for Yamaha AICA Super Intelligent Sound Processor
> ..
> [    7.872000] ALSA device list:
> [    7.876000]   #1: Yamaha AICA Super Intelligent Sound Processor for SEGA Dreamcast
>
> After: 3.8s to boot:
> [    2.892000] AICA AICA: ALSA Driver for Yamaha AICA Super Intelligent Sound Processor
> ..
> [    3.796000] ALSA device list:
> [    3.800000]   #1: Yamaha AICA Super Intelligent Sound Processor for SEGA Dreamcast
>
>  sound/sh/aica.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/sh/aica.c b/sound/sh/aica.c
> index 078fc7fc08f9..04f80c8c89c0 100644
> --- a/sound/sh/aica.c
> +++ b/sound/sh/aica.c
> @@ -94,7 +94,7 @@ static void spu_memset(u32 toi, u32 what, int length)
>                 local_irq_save(flags);
>                 writel(what, toi + SPU_MEMORY_BASE);
>                 local_irq_restore(flags);
> -               toi++;
> +               toi += sizeof(what);
>         }
>  }
>
>
> base-commit: c1b1c25de0d6008c3fcabc942fba635ea3693c3f
> --
> 2.43.0
>

Yes, I don't know what I was thinking there - nobody who reviewed the
code picked it up either, though.

The trapping presumably stops the whole thing from falling over and
answers the "how on Earth did this ever work" question.

Acked-by: Adrian McMenamin <adrianmcmenamin@gmail.com>
