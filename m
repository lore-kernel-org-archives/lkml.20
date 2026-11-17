Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794883283;
	b=qQXB8KeYEsIWrQbe1+NMTE+stpqyoAjakJa5UoyoFUw+rchFOD5SH2H2uZPUn0hL4yiy
	 6vNcHGIdqFxscCMXziNSGISz+3xr2iqYYWDYYaVYC1gSAMiPbRkvlculDc72xmIqcRV4U
	 068fxi87cEmPCr9KyZkSa7zdw2FuSyzzBFVoIYwgtAYrts2qpHv/4zRSGlSQ4GqiDRQft
	 CNHr290bO88ZQ3jwv1FAUnHeSIx838RTBEDzVO8JU0xcsgaS4+eOrXjyI/nClNQD63nkK
	 NpSRecuvC2XNs8UKuud8dF0QdjBx3XQ3BRVp4Je97ynkrZ3f5h6WsQ21i4L8IZ0QDow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=HvQs1sv0nGP1vZDuQ/BDK5aYspXa/hu3w+cobCl25Dg=;
	b=svv9jbIpogpDPMtwuhXd9cky2YqGFfu7cLlUA7U/iuIsA7es7ysgH4QZtMSdpoCMmOYU
	 r3wlKqguOFiqUtMjEk38/ZmkgFcnhStXzm9jUruulo79ZxmCdSY1+EzLogo3H3mXtUcqp
	 5XfQkgNPvVY5kwDOHTIJT55+2swNIyGHkZ3ivJUcbgXm27h4mA0n7uQSWN+59a+MHmrsX
	 7hOZSIXP5cAzC703IDvY/dnYlovU2fd4MucTa9sM9WWf+9e0am3FXtDkFgSqv8J1IEMI3
	 0HRO2InI0Z2Vec2as3csLJM+cNCqpsQ+XFTpfDoQgTV7vndFp0QwB1IAqmat7xUgNJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iUqEGC9n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9B3606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE9B3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iUqEGC9n
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9210214fcf6so1326686d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:41:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794883282; cv=none;
        d=google.com; s=arc-20260327;
        b=qg23vBA2Ljx7eGvpRfznNcnedqu1fRBpDoHf+g8dfGZ8TlpHe/be70hRRfb3Expszx
         0hR0mfmhJnOC/s2B8IG1M0PIdPeIMyYPzF4renpggmGiJuqa6jjw/4LBlsUPHKmbs+vH
         r2t6qbKA5lQU6MlCY7VGZrwauQTLi2DuMx3Phx2BryQnLPGJC6m18a0XcZbGePYNElBD
         /wa4rDej4NLOgyDOKLk1VKMIjvqvt6yA8eZsKVQiE371j244CjpSsxRkC8wTRP5lKtYM
         8CQ+39cam2sDDGT579pWnFlCQ+g5IJJt9mnQG+n1kK/qT0B4JcvnQUcm7ElXoKha+4hm
         OdOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=HvQs1sv0nGP1vZDuQ/BDK5aYspXa/hu3w+cobCl25Dg=;
        fh=08QZ4N8jFwwEI2xhfWUJUoLSIx63Tu5eH3RNMSw4zuc=;
        b=P35cLwncPaGNI1V6TGOL53zRs4XmsL5kXWbyvp821DAv4bhcply3Gsu9As/jfNeJdq
         eiRDJxHLQp3YB+gvz1DB//Gc2oyM4cOXdv8/qVI0LfkSL/KVAI5q9JUgakkVXILBre+7
         kdn1Lnhg7xuVgejg9pyGDGG7oTcdtEtQnuUt2ewismmbUCql2pB9sUkzwwmPPJ5MTWcd
         hEEjzJdOc3G1qGbtNks6eciyIJrMM0t4BdAvAKmKDsh7fx6FdpV5yKQdEx5ZvCYhri94
         qzMVN+baElOib8JrnGXcJpLeUXE2XZek7xWki6tGfBUd5iptr42crMBOn1yt2MB1EQ+G
         SDqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794883282; x=1795488082; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvQs1sv0nGP1vZDuQ/BDK5aYspXa/hu3w+cobCl25Dg=;
        b=iUqEGC9nnx8o7ijuV/qO1rJEsb6fK6NoBQHYd8uDM5RHQ1J/W3lZOazsoDrHTwxf8j
         IoRa/6lYq5mmAd5bVuwwZbcBJa8LztEz0ljoa3leuR56F6DRGWXEZjhMSYN1bpvPn8qZ
         PAcsnLRE22rjrVR7tmAw972Op7VIW1PVnHWi5qZnp2E9Kb7RIdbIgjcw8xHC0gpyL18g
         CvOmtNQzFs2S8112gGfB8HWjSyPos6qVzrrGMHZFt6JmZQy7ludvGdnCLfdV3ikM+8JB
         fRxKHLBxvkobzW536bC+KOTMuH0milGkbC3u2xxVd2zIGJou/X7iQYDPb5KNH19tXQLj
         LqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883282; x=1795488082;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HvQs1sv0nGP1vZDuQ/BDK5aYspXa/hu3w+cobCl25Dg=;
        b=qY0x0rJa93p+Jg8gc8PhZZ5/Nw+Fjy7/ihrHJXen0pcJDPkwGgRwBMMC3Nx+9M/S+l
         ecBODzXtzN+r4RUbXfrezUZw9oz8ZUUamOBTZXDoTtH+umfYOdLbMRX1nCnSIyk1+/DS
         Jhm8iY1iI22mURxEppXF6daw2w19iYCOHTZUHWJQwC5U3u0fNb0p+B5FyU3xY+0awPz4
         fLY1zch/fNBGUyu69yhCCw0Y0/MqLuAjhBkEVSoWmQQ8iiQpxgJOsej6JRrFX1pvh5zl
         /yUct/ITKg+Jsd0kGa7+B7qlkuwTPGxVoPQz+Lmhb2WZcKMwNAyVaiZqdYYOJos/qkiI
         abbQ==
X-Forwarded-Encrypted: i=1; AL+hErFjkjTCR42+/EqkUrvKXbHga44VCbOa3g+FNgsDbNmPmubXN3Ew0ggiRlj2ceT9MVcc5OpKapqxrVLPi3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+g3DB+vKkGUFDfhR1msn33iEDTHUhXqzJ1+QZkpgSqMcyVc/KZ
	vuS39ArB1SCCrQeGjd/ri+OB9vyF+r2Lojqgt3WO9gvg0pBUJnsigOEa87Z2zFgsAg6+hLhAJre
	YHyBKhGphxxdEgTU/LM9o8Y1m8iVlYQ2Yk207gVtl
X-Gm-Gg: AZFdTZfeqqKHuOmcIXz0RaG+jOvt2aDuKlcDIOIppjnMIIvkd4v0Tl6qpM7xV2geqSs
	9sy5OEkvS8CztCOcxkxFXh3Jjc01w4h9Ifnvj0JZyagNGKRPnK8jhXqCWCDlSelJvB5ZRHLNsjM
	PrvKyQ6NEx+IrZV0lHDfPFe0tshwIylt+B78dIunD5bz0kgz9hpMD6U0ZxP6md8kRLR9PnrLJhX
	VtigOrSSFLyl/4kL3wgmFuLOIIMLNS9RpMVTHGe1kR5qcodZcKvhxAjErCJnR56gaZ6Vi6pqp7m
	+VadkOPSd+lnGMR93wPFuERUqSeWftEpZmno4ky1cXC0MHE9vCILIUBHugUYASGlz0SDdN00kaq
	EdBy3CoUeRIw0437nkhTfAuFpDh1RRFm9jOEBEvEcUSl3GHIDQKFmnD0H0/b/CE7zQvG9l3qtXv
	bowGmKw8Pb0Tk=
X-Received: by 2002:a05:6214:83c8:20b0:920:fed1:a8da with SMTP id
 6a1803df08f44-920fed1a991mr13219076d6.7.1794883281247; Mon, 16 Nov 2026
 18:41:21 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Nov 2026 18:41:20 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261117011513.39419-2-seanjc@google.com>
References: <20261117011513.39419-1-seanjc@google.com> <20261117011513.39419-2-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 16 Nov 2026 18:41:20 -0800
X-Gm-Features: Aa3M54r-riMCYzwFL0iUhgl_cPKG725IFXZzjFvHz6XTzkSM6fUmx3t1Iz2ifRk
Message-ID: <CAEvNRgFB539gu4hhRaM8qhoJUiaU2jjmCRze+WZHbtGSc=x9Fg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] KVM: Disallow prefetching PFNs (for SPTEs) via
 VMAs for gmem-only memslots
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Naveen N Rao <naveen@kernel.org>, Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> Disallow prefetching SPTEs via fast GUP, i.e. by VMA lookup, for gmem-only
> memslots as the whole point of gmem-only memslots is that KVM MMUs should
> get PFNs *only* via the direct guest_memfd interface.  More importantly,
> this will allow skipping/ignoring/eliding mmu_notifier invalidations for
> gmem-only memslots, since it will be impossible for KVM MMUs to have any
> mappings based on the to-be-invalidated VMA (as is intended).
>
> Fixes: 576d035e2aef ("KVM: guest_memfd: Track guest_memfd mmap support in memslot")
> Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-213282@kernel.org
> Reported-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Closes: https://lore.kernel.org/all/avdAIMDfgL_wy1rx@gremlin
> Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/kvm_main.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index cf4cb586f140..9938b753948c 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3172,6 +3172,9 @@ int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
>  	unsigned long addr;
>  	gfn_t entry = 0;
>
> +	if (kvm_memslot_is_gmem_only(slot))
> +		return -EINVAL;
> +
>  	addr = gfn_to_hva_many(slot, gfn, &entry);
>  	if (kvm_is_error_hva(addr))
>  		return -1;
> --
> 2.56.1.703.gf848ed807c-goog

FWIW, I also looked into kvm_read_guest*() after being pointed there by
AI. Those take a HVA, but don't take any kind of long term pin or have
any reliance on MMU notifiers, so those don't need extra guards.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
