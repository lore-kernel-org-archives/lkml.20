Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A439B370D49
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005949; cv=pass; b=B+9S+qptxAH1Wa47yN1WqRxG0CGVhV8F3GAkhFlM324/3g5BfbaOxQwPUBn5n/Pqt5VBRKXhDE/xzK7WPKg9qNydhttb6MQ5ZrL0lzBTAcg0kLmAH9pi3x9e2T7Jq9zCZpSjXByx3Vgqxe8WUH4pNQFUQ4NIWATP9zMlBf9FuiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005949; c=relaxed/simple;
	bh=582l4UN9d8ZpIIQBKyvfoe2ud1OuHObN9VtOBwz13Bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2z+7DYCXKmvgLeSUnhuOEOiqx8Y+xKt5yR6cEJgAzuPOIQ+dkOVx6e4Qf5+tIBkgB6HqqDqzAR/60+jsIn9vXV+N5SM9e1Y0SheEdJqb6/uBIYITu4EB+rbg9u1mJbKovG14LqE0Fn4EWOIw2af/TIlXozzWy/GcIimWSlVUQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lf/veVDZ; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lf/veVDZ"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a9787a15bdso37342811fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792005945; cv=none;
        d=google.com; s=arc-20260327;
        b=sO9waqR/a0l5LiPXCBToCodfTg62/9Yq5kV6zvhgFH45mFnElq0jjyL5yp56rXkt3V
         EWQWGBS77zZsuVV9GKk7e+5VwC/I1S25giadOGOBsdLVy5Ns07qiUJVvYzNzSU9KSpfc
         6uo1cNI5DJydHmxOeGRQncloiHra+SARX+5XNvh0MKVSbIgGT8SW1FwbaP+WE757N9hh
         mxc0qGd4AruhblMMHa/WD7lawWebsugGXElWCqsEW3WdVO9+b5XhCAlgXHnZPhZT1yEL
         M5hHLIhxTZ9jNmM21d4sDX/kV6kfTFhqM4PrJlhdqpXu3zHaRlqoKyYZGYbHklZ/SPwe
         pLnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=582l4UN9d8ZpIIQBKyvfoe2ud1OuHObN9VtOBwz13Bg=;
        fh=PBDzqp+6bojrbIACtSB8SiEWPjEA1J251aKogi3MX/8=;
        b=Fix/f6T0ASPn6p2y7cmRYcVUVAcch4nZ3jzTmZHmTms3+G7KKVqwDx69fBBu4Yg9Jm
         mtBt0sgIB0xUHZ4CB3FrR1Z91/I7vbFtmV8BfnNNW3cTuQV2PLUCLpwcl+pNZkpOmeBb
         9rNRQyY7YtBO1njVGQN91mm8mO/Zus4az/n8L82sPJM6jpAwcjFNJd0kR7CA+hYprzIL
         1G3LZ5Fkt96pqQ6g7tiZ1dqM6GOsUMGy2cfkjqqIZY3PeROfLLC0PVJX86gifDFpeSlP
         VVAJvdnnlwo5Kkviyv32oxsdG1V/55++Kw7nPpZiQyDujYNH78vT07Wz+wtmFq2I0zFm
         owvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792005945; x=1792610745; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=582l4UN9d8ZpIIQBKyvfoe2ud1OuHObN9VtOBwz13Bg=;
        b=Lf/veVDZ41zt9JtV37fHQydGMiRhfhYhcI+4p8Rigg1OHh+2WV5OVGC8zMKAJE4exE
         veWcjZwjS24jxWX+M/WWdCjinLxnvs8IMmasa8t0DLaEhjfo7QvP3D735kuPhA+AZ6D5
         suHVZjTUiM3QKhmSjdjP702nqkVLYPXB0OtsoQ9FFNmqjCYlfwuIRwhuUmMZ6U4b/645
         etQGQfscMkcV2x4V7Oow3fO0a40kuCLa5AZyTrHUVPjYht8j8iNrBYvy1rGaZ+ymQkSH
         TH7dne5GfJUOY7BBKN2bqJ0dyvQsFL4uXI9IQdC2d/Lhs7AQUyGCCM2O1mAFaC+zSer3
         Z2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005945; x=1792610745;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=582l4UN9d8ZpIIQBKyvfoe2ud1OuHObN9VtOBwz13Bg=;
        b=1eY8c1gHLpWQEJSUJpTEFTTuGYq2eRq4be3kTjuhYOVynB8omdcoGVLkCwcd0jFQqU
         eyUhvluZBNcE1WQ+flUhP6SYFVA3k9CAaz2C23z++4JXwYyAcbLEgwXHDnnLUjRyJWLK
         WKnJX8fzhhIUJ9niAIEZ+cdO7YWagGSaW15p2tzvwVZcLgs7QiWAti2m1BoYLZmW6Lnz
         K0ciBM3zrDs2+52BImAB+hJhpChGyoKIrbzzWA/8Q74gF+QzHDdzb0BXRDr2mjFF/SxF
         fIsaQpjWhcSRakw/K6kOluI14HMNiOj/fY1swZrHKwhY8nPFBu1b/jbvbMdtBvUdP1Lm
         unaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYzo5k1DH1yEWymdSRJdFFZYWORsT8swW4tC8CQsUzClDavHDZ0D60A66D54AA62cc/yvvatwqo7AEnBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKp9KTD+TSUj9d5EWHhAf4TGI/D3QB+jDnkGOedz92lMFwJR5F3
	XKXtjcyQsQKQ8xYlC3QMfTDQZGmhP3AKHfPemVyRdoA/uyi46SHjNQE8F+JJqe8rPpxT2uFqD9M
	Cap2BtZ3+XPDh3VghItoDo3YN9iN52CA=
X-Gm-Gg: AYBFou1Jy+Y1IJIRdG35pkzveT2J9713o4B+j2OBCO4nkrmUdlVBQrVu0y4JWyqcWJM
	K+TrPifuqvtEOJ4QXZUdmFWntrU/Nj7DRmPZUH3mzhH1I/NeIorl4EAwBCW/ZDEkgu7Dmm27SjY
	b6zPFOJlJClbtkE2VZFDtcXVscXMh+NgC71gK0To8Shf3aPZk51vxkvpGAnPBwrm/Vhz28bvFdw
	sKbR52LM0pRhssbrKS5I6RiwyohIseC5fCMJxqiFC6CaYhUFUv9Q8I4tmsGMJhXPotIZ1nCduxT
	fUv3sRPPo/kmDEYhxH4bpDXYYVSwMtj0MAPQVCEf1H2JuGH7BEP10Tkk
X-Received: by 2002:a05:651c:b28:b0:3a9:9b0b:e0e9 with SMTP id
 38308e7fff4ca-3a9c539ad00mr43922551fa.6.1792005945250; Wed, 14 Oct 2026
 12:25:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004212403.208681-1-oss.patchbox@gmail.com>
 <asm4DV84UitLCbve@dell-wzy> <CAGG=RgApzG=MeZ9xbpeBzqE0i0Q6RCPXtnyS-30JfEDPDKNN0Q@mail.gmail.com>
 <as4fKufR2O21NWk5@dell-wzy>
In-Reply-To: <as4fKufR2O21NWk5@dell-wzy>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Wed, 14 Oct 2026 15:25:33 -0400
X-Gm-Features: AclHuK8bWEAIT_jes9eLRLNmTdyx38C_iJwbW3y3L5STgV7Y6fOZaRlXyp6RKPU
Message-ID: <CAGG=RgDVsPHjLMTEgoqjh17hfnBUg3WUeca93VrDS7NTshHsOg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/i915/gvt: Don't replace a DMA mapping that is
 still in use
To: Zhenyu Wang <zhenyuw.linux@gmail.com>
Cc: Zhi Wang <zhi.wang.linux@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Xiaolin Zhang <xiaolin.zhang@intel.com>, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, zhiw@nvidia.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 08:08, Zhenyu Wang <zhenyuw.linux@gmail.com> wrote:
>
> > You know this code much better than I do, and I can't test it without
> > GVT-g hardware, so I may well be missing something.
>
> I can understand that but I think for any non-trivial change or
> for sensitive part, testing is a must...

Understood. I'll hold this patch until I can test it on GVT-g hardware.

> > The case I had in mind is the guest mapping the same page at both sizes
> > and keeping both, e.g. 2M in the PPGTT of one context and 4K in the GGTT
> > or in another context's PPGTT. If the second request replaces the entry,
> > the first shadow entry seems to keep the old DMA address, as
> > shadow_ppgtt_mm() reuses a PPGTT that is already shadowed. Is that ruled
> > out somewhere? Please let me know if so.
>
> Shadow ppgtt is created by a PV interface, so each context would have
> separate shadow ppgtt or shadow mm. GVT handles guest page's dma
> mapping per-vgpu as for per-VM. But GVT handles context submission in
> order, shadow ppgtt is populated for each submission. I think even in
> your example that possible one page mapped in different context as 4K
> or 2M, it would be remapped as size doesn't match for each submission,
> so no invalide dma address access.
>
> I doubt if i915 could possibly have such case in reality..

It does seem to happen: 7366aeb77cd8 was written after the same gfn was
requested at both 4K and 2M during an OpenCL conformance test.
