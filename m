Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624F744E643
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764263; cv=pass; b=oZf5PP95lfqtXK3/icbfY5KF/jWKXNnq51nbMYr1arMfdVkRvdWbymMW7JxpgBa6H10C1KbvTpd8R6026uIZgM6LX7Lxl82rR+t8nK37sfrwuV/m96LnCUNKYs/Dhbd53LzJRCGRUZcUJHqjsM6/I0Oq/lQYK9Zyud/7J1BvAOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764263; c=relaxed/simple;
	bh=zpRXAe/tk52AlzcBOEsFifQ2bzrJm/4BiZ+5Fwp0hxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XrKTiEMey/V1dSq8/ngRN3cDEV0sVr34ACYuFAB1WvLRFWwfkVHpTd9hKgmbx2/Z7sXF1jX15wSOqRRkkEeXstxENcSjSxYaqxCte7Q1PsQhsQer8udUCIDOhSzJSl3ZCYNp3cxa+L2XNFVJHLcW6CFThX0tXw3go75Yl/OwQXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sO7hteWt; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sO7hteWt"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482dbc9a00bso62661f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:10:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787764250; cv=none;
        d=google.com; s=arc-20260327;
        b=kMK7qkMm42bHc9h9C/2DMMjEFfg6BYh0WiQBZ3WtAZszej2jYMTpMMNV7FAeFt9w9k
         vkuSUB8LDi6XfUiwvylQ0zoLk14gmrxgk1AnU3B8yc3bAxvvmtRQZ0Ajivu0Xh3TeNsp
         /RBIX/NtKFiqE5UaltXJ+9jdKPHtvscWBb1/BucugEsebZd1T0XmN1Q/52jAAXpf04w5
         79N+ag+skXJ5f/L1aDncUZH1+XURRPrlSJTTZLJlInlWbGKL6+t7l8JtxjczkYDQ+nbx
         1+WTzz5WRCD4dlv7xsyb3cvHPTy8tfsbJrtHYkS0rJceHqDkItmSpB77h2etc7OtZuke
         rx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C33/RTr3a45MhCrcAOe4IXwcMFotPZnSUAEPINGFBDg=;
        fh=Ep03vaMGFFVGGqdynq7wBzUMHIwsIoddwrGxxEGT1Gc=;
        b=MaDUF/VEPv6MET+wK73J9IemVmk6tpduRsfd9ugfT/4xKd70CpzZDG2afEk02hNMBq
         75PCNP+ZJpk0MIqDkym7cwKzLuznB2IUf7It51BKwwJfGdmiEuoAND1qKr7e2p/dC+A/
         w/R/tjzFTdxkzjXXjI3nDRM1KTTiBHtJVVCE91ksdl4Ps9RLbE//ldeUKnPtrrxngqkr
         If0WIoYTsYJlPQR6K9PFhV3IXWATastQEOAMm7h/VswxTSzZaaoW1pj5q/1I8uphxVtG
         qKHLZMJmTehoE614OC59BDCl3hO+M5RYuu3MVONKtEYYjlQFyxt+mjNYOsjs5Kq9bxpn
         jZSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787764250; x=1788369050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C33/RTr3a45MhCrcAOe4IXwcMFotPZnSUAEPINGFBDg=;
        b=sO7hteWtQBIRfpcJEk78Avuz+RjD1GI3txY5K9r0dCukDfr+3ImEdBxiBJ+tDgafnG
         JHMX7vznlMVbvWvHJbRN+wBlAdi2/G01r14SsSGh6/iZEqaA/fC32dv+82xpI+X5dFUS
         vScJFOIGJX0pv2LAIEPLmRmIkXO1q7qMAI5Bq9iwbrshe0t4li1dQ/q/m6l76iDzUz5s
         YVsbQq3DZjpZtQAYXkoTLdKgTL+A2v57Qr2lmLMiVw+diAswiCp0zdxToLvCNkeenaUO
         UV00KfBYA4LSAdfHY8Ze/n20aprQLWi46fHgEu5Kl2csKI9yBHSvpomvDi5Kl71hEyu4
         KQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764250; x=1788369050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C33/RTr3a45MhCrcAOe4IXwcMFotPZnSUAEPINGFBDg=;
        b=GM5lKohGoNsdh+BOVcmjdggQdencv34bLMF3mxCbrk89D7y1aCLFdW3y/KA8Zd/sSE
         DGmvkbJfLK3LFyMjLBeZ2l/RiqboyOz+TTH7qjZ7CwG13EcS348eHScvXZUXLRyBYYkR
         qdvGvLqcIAqU+8tQnX5BY64FqLcsWa6HKpYZAA1DObQToJbjkrk32A9wDTD7lMLz6T7P
         BbQF69IjCFJJHJit4uHJ53l0yXZTTqtD4QdZfdZLYr9OpA0t3RJfxDzLIYkewhXixZGI
         WTvHlD2hq6VSsREXZ10b8SgR+WcQLsDTDqTbdYf9guPb3Agm6FzLzwU9zzKdpFjKCiEN
         RAcA==
X-Forwarded-Encrypted: i=1; AHgh+RrQ79IgTWYeiqAeyujR+nIeoJKuR8T0OaZOxeIjkICsaP5K5vA562guVzFhHqUlOeLP2qMLwCVmlXRINHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kOOy04Nk9DJqjkNMW1MmsInEVx20w5aK/q6sC1cIyuSRBhnb0U
	h2n7Hj0xI1CqOdEuFh6RKpkniuxKTodj68JLvnUMDZ2l+EUmxWHUG9SCjWNNwwiHwuQx9f+42+k
	ml8d2l0197vlsBqB75RAi1BGYeiRl0M0=
X-Gm-Gg: AR+sD13Nk85z5/abj0DS4TNJOSHkaun72zD7K/5gCumtemqNl0iZ7rbaIkQKnHMLqet
	m5usKmfVBlsuC/ow0UtUMszy0IqJf3ISkhWIi2eJIkG2hWWxXw1H//nysjmNINIpiVOKVdx3Hio
	X859VFu+2tHdb7wi4L1fLVcGJ2fxK83vR5Hq9FsfmPL/op8EkwItLFRXcy6Ae4PfIx2YbVR5N9p
	WoRdK75l2mjxa39acQe2clbaYfHGFah7kSSH/TNZZgYmZlOMI8eQt3RZSQxMgRPgy5BGocFepDH
	D9hHvYlD+BW8VGKqxKltvw+tV38GI6ivfqQEEXVItOYSovHZZMM0HPOuMAfnDnXg3UfuMKsgs6/
	Ztg==
X-Received: by 2002:a5d:6f0d:0:b0:47f:71a0:c060 with SMTP id
 ffacd0b85a97d-482eab5ff3cmr634773f8f.2.1787764250208; Wed, 26 Aug 2026
 10:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826122558.2662013-1-usama.arif@linux.dev>
In-Reply-To: <20260826122558.2662013-1-usama.arif@linux.dev>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 26 Aug 2026 10:10:38 -0700
X-Gm-Features: AcwNN1UY_oOpB_Wq3_fowiaqVP0X_Osa5KQ5Tfmau1VqN-lIGJIFBmzzrbkdcK8
Message-ID: <CAKEwX=NRXuqRTg9L3AjBVeaXhm5bxK_rHe8d7d_GUOGKjxC3xg@mail.gmail.com>
Subject: Re: [PATCH 0/3] zstd: probe the CPU for BMI2 support once, not per context
To: Usama Arif <usama.arif@linux.dev>
Cc: dsterba@suse.com, linux-kernel@vger.kernel.org, terrelln@fb.com, 
	linux-crypto@vger.kernel.org, yosry@kernel.org, hannes@cmpxchg.org, 
	chengming.zhou@linux.dev, shakeel.butt@linux.dev, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 5:26=E2=80=AFAM Usama Arif <usama.arif@linux.dev> w=
rote:
>
> zstd picks between BMI2 and generic code paths at runtime, and issues
> CPUID to decide every time a compression or decompression context is set
> up. The answer cannot change while the kernel is running.
>
> It is not a cold path: squashfs calls zstd_init_dstream() for every block
> it decompresses, and erofs, btrfs, f2fs and crypto/zstd all initialise a
> context per operation. Each probe is two serializing CPUID instructions
> on x86.
>
> Patch 1 routes ZSTD_initStaticCCtx() through ZSTD_cpuSupportsBmi2()
> instead of open-coding the probe, which also fixes it testing for BMI2
> without BMI1 - the bodies it selects are tagged
> TARGET_ATTRIBUTE("lzcnt,bmi,bmi2"), so both are needed. No CPU in the
> field implements BMI2 without BMI1, so this is latent. Patch 2 skips the
> probe when DYNAMIC_BMI2 is 0, where every consumer ignores the flag
> anyway. Patch 3 caches the result.
>
> A 4 KiB crypto_acomp benchmark [1] in a one-vCPU KVM guest, twelve boots
> of nine 30,000-operation rounds, median per-round mean over 108 rounds:
>
>                     compress     decompress
>   unpatched         16,756 ns     3,455 ns
>   patched           13,646 ns     1,002 ns
>                     -3,110 ns    -2,452 ns
>                      (18.6%)      (71.0%)
>
> The main reason is because CPUID is an unconditional VM exit.
>
> [1] https://gist.github.com/uarif1/5cf02f0e22c23f0d1b3d84348f12914c

Awesome! I'm no zstd expert, but this looks very nice. Thanks for
fixing it. I'll defer mostly to Nick (is the fb.com email still
working?) and Herbert for correctness checking.

BTW, I think this has been reported in the past:

https://lore.kernel.org/all/CAJxJ_jhvyMukPLThpgcdCMHwbp3b3bFvc4Va1cK79_3z6u=
bhwQ@mail.gmail.com/
