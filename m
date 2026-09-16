Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A98424D58
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789586982; cv=pass; b=DGAl5cIHXR5vtLJ1SLTrNmCayWyXm9NB0dunWBaiDKEVpI7Zde4srgl6Lw3GAPqncGpy4yIKDdP/OVGoJPJsKkYKKnN+FTMEaB0pOcmc1hbUOh0zB+tAi7kjHjBar/9ie0Th0/0JHRQZ8zot8/JDLTOtppDJwfu6RbWV4alVXLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789586982; c=relaxed/simple;
	bh=X0bKO65h4md/AUwTLuBudve8hzWfGFXRoDF7mDTv/C4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lfm+De+sBy2twVEIaQuPjUfm8H9xO3+jlopmnXFnPqPq595sKGEOzkTdiKG39SsYukI3eKqGEM+c4HJbbMrC0AzF1gH4BQQC4eyz32fW2ZArwzorThyLmOewIe7lks08GFawuhKLe1GWENgFoR72nUTAEh8w8yy/4swsFN0p+dQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9MBEFwM; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9MBEFwM"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4c2c368cb3bso37803b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789586958; cv=none;
        d=google.com; s=arc-20260327;
        b=GNfbIHFVVzPZdaIbsTwDredBCyIUzgNK+DSiMzAm/JzYIxTkiyfzmCRcHwHeD6aX0L
         Nowe3lOpHnGHsKY1XX0y3jcDEDdXcdwmJEWQrls30FcjihEVxtA/naukiMruEy2TQAJL
         Bh+3o8T4CV2PtMNxOvmz05BZcUR6mqrppLqYdZb1Pm9SmIlyc8YlD2BUvnCsmrf4o7VW
         GXhtfFDiphaG8kRuBgJuXcLvwpHvZbYDpX+l3GxheSrMXwusNFS/o8+qPkqbGyJ6+g98
         W3z+x9T3pc/otdKGkcwSiy8GREuhlh9Q7T7w+Vj4MRm0Zedc1l+K6yhc/on7H6PmlZid
         MntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X0bKO65h4md/AUwTLuBudve8hzWfGFXRoDF7mDTv/C4=;
        fh=009li0AWQkWzw4j7xEg7wDhRxnP6fKzBQ1aWNUnug9Y=;
        b=Br72gj+/nyj3TuK5o6qmCmuVxpWKsjOKJ8Hc42dlrntMf1EKsjQJo0bODp0rL5EpBl
         Vc+bhPl3WbewGlzc2bdh1HXP70pdRbP1dHVdZCOl9njjk6zLIw+ZzPtvLGXwNmYMK6zs
         k1AzUmOfqxRoSw0l7ae62ScfpaHyJn64ogilU5tX2mDTl2nErMM8j6/ydKMRS6I/VE9V
         YwfaNPEmlf+V3/Ethmr283F5dRcoSpud9KOE0lNhjFaug5eMsLtTt2rtpaqv35aRdyJE
         nCVOBKdvBn5zOK/j4Wz2SkgFMJYsQrcPYtHboGcT+gR1ZzBRLEoOHXNhIXnBKbSkQONK
         2YBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789586958; x=1790191758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X0bKO65h4md/AUwTLuBudve8hzWfGFXRoDF7mDTv/C4=;
        b=f9MBEFwMyWboE7MBO69ThvN6CztqeYbP0BaguSPv3FQ1chKFY1+htzMjEDoOpr57Mz
         dV/bOHQmG8pxMi3+VFFggV5BjtspKkR3hw9JCnpLRIg6rixR+e9X2MiqtRkGveDrWlVN
         46LCUVYjXSg85Z97AskJsXeNr2z+RBuNpDiKoNRFZwRiVGcTCp011B2P7fVRb87hzqYn
         nOa2pIrm0WArV29f5P6A4KpVeYXKamcUbt4urDmAVfL1xNTEwOaKVUSesDrqL+PXzg/q
         vJlR2bX6WY11exQDIu4lpRvWIDitOWGDVE2MboEaYeQV+5Au4eBviljpjciVlOtO2QI3
         Ajrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789586958; x=1790191758;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0bKO65h4md/AUwTLuBudve8hzWfGFXRoDF7mDTv/C4=;
        b=jUI8L+Z/b305ZS2qXpi5nr1M9+LxlH5iZp+hZ3s47bcmfrZcYzbjPHlCLtARombC8O
         TAh8Vke7TrG33s//ZpEYLT2MYZztwuB9vUH/hkGDC7B7YY3xZ2zq1WBiBKueAlXyOz5p
         dzBRSLOmF81I8uOz/QD6weVQgwhR+OBB8JoSZF4xMm5xInWr2piaEb47Xj+rPG67TvmW
         nFge6PteKYjVd0+0v4n2pQvyCAYjGFJGauhFuLX9qIIZa7YecutpqnPhXv4luF0HF3Nx
         o+pYp7Sb3xpiJk207VRwtPujBfjRivhIcbSSroUAZwYNhPYCfWNg+/H0wDDfTEGaiT0j
         Eo/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxJOTyqcatvU8oS6ZnwdDP2rJKtphmKmU4lVMOOCIh84mQ3Za206Zu9Dp+Xqq6umWbO+hxGUpK+Kc+dTpQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nlQEusZB1zRqgmdjR+5b0wo5UrFsn3/VGFPeFXLjzaR+fFaLkk
	Em9H8k9E2eN/NBmSZ079weLR3XchIXoWUR1Lp+GcaWao9ZFNvMYLTf7w1kwV+eI/BcwOiAt17ky
	SRvYKeKPNcmdZfz6cyLepUBe3vwn6pWg=
X-Gm-Gg: AYBFou1nvy9ue1aDWv4IwiUPKcKal0G6BuGVrVnOnFAOTtEGhH5liI7YwkWCFzoE6Bt
	sx9LIh3J0REJbo3/SnIlZt5nrWTbsUTC5k8yCpUujlO+yNBQNJXaEac1iJ+XA45fZiXXq9eXn+Y
	JJUUot09pIWYYeutPfmHJ4wt06OgWS1pR/kRzVM3nOqIYD/EhJJZ7qNIPsfY4rHgHrXdH89P/D6
	L6Izs4vOJsyjy5lofkTS/Hkg937tAaGuyYpgybee9BNynTW+tn2GpE/QnRYHy03c8YBNTS7TOJj
	r9aJKmQcGDMpywW6fW99tXh64km1bles6jn46mnzYmEbqTrZEW80qtY=
X-Received: by 2002:a05:6808:c412:b0:4b2:8d9e:de11 with SMTP id
 5614622812f47-4ca4dc219f6mr5873685b6e.19.1789586958406; Wed, 16 Sep 2026
 12:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916181001.201787-1-usama.arif@linux.dev> <DLGY7IFP8MOG.YFISSWRDGKR3@gmail.com>
 <874fc50f-4764-433f-8a87-595bc70c4559@linux.dev>
In-Reply-To: <874fc50f-4764-433f-8a87-595bc70c4559@linux.dev>
From: Amery Hung <ameryhung@gmail.com>
Date: Wed, 16 Sep 2026 12:29:07 -0700
X-Gm-Features: AcwNN1WDst1cmT6BJveQWlz_V4KXaqctpiRs6Ar3jIL3hsk1lUSOIapHrHv5P-0
Message-ID: <CAMB2axNZVQr=bEQXGErSEOFrMfjn11K_ZvYErLwXQ3tUW9qPiA@mail.gmail.com>
Subject: Re: [PATCH] bpf: local_storage: avoid redundant IRQ save on bucket locks
To: Usama Arif <usama.arif@linux.dev>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, ast@kernel.org, andrii@kernel.org, 
	bpf@vger.kernel.org, daniel@iogearbox.net, eddyz87@gmail.com, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	martin.lau@linux.dev, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, song@kernel.org, yonghong.song@linux.dev, 
	yatsenko@meta.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:22=E2=80=AFPM Usama Arif <usama.arif@linux.dev> =
wrote:
>
>
>
> On 16/09/2026 19:22, Kumar Kartikeya Dwivedi wrote:
> > +Cc Amery
> >
> > On Wed Sep 16, 2026 at 8:10 PM CEST, Usama Arif wrote:
> >> bpf_local_storage_update() takes the map bucket lock while holding
> >> local_storage->lock. bpf_selem_unlink_map() does the same; its only
> >> caller holds local_storage->lock. The outer lock is acquired with
> >> raw_res_spin_lock_irqsave(), so interrupts are already disabled at bot=
h
> >> sites.
> >>
> >> Using raw_res_spin_lock_irqsave() for the nested lock saves the alread=
y
> >> disabled IRQ state and issues another IRQ disable. The matching unlock
> >> tests that saved state before leaving interrupts disabled. On x86-64,
> >> this adds a pushfq/popq/cli sequence and a test/branch around an
> >> unreachable sti to each acquisition.
> >>
> >> Use raw_res_spin_lock() and raw_res_spin_unlock() instead. They retain
> >> preemption nesting, memory ordering and resilient-lock bookkeeping. Th=
e
> >> outer unlock remains responsible for restoring the caller's IRQ state.
> >>
> >> In the tested clang x86-64 build, this removes five executed instructi=
ons
> >> from each uncontended nested acquisition. It also shrinks
> >> bpf_local_storage_update() from 1732 to 1702 bytes and bpf_selem_unlin=
k()
> >> from 1030 to 992 bytes. The affected paths are updates that add or rep=
lace
> >> an element in existing owner storage and successful unlinks.
> >>
> >> Document the owner-lock requirement of bpf_selem_unlink_map() and asse=
rt
> >> that interrupts are disabled.
> >>
> >> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> >> ---
> >
> > Makes sense. But did you observe any measurable improvement with this c=
hange?
>
> Meta fleet wide profile shows bpf_local_storage_update() as one of the mo=
re expensive
> bpf functions in the fleet. I saw it in production when profiling a hhvm =
workload as
> well.
>
> The main argument for the patch was reduced number of instructions execut=
ed in
> this expensive path that I see in disassembly (which is mentioned in the =
2nd paragraph)
> and better code hygiene as it doesnt make sense to to save irq again. I w=
ould imagine
> this patch alone wont move the needle in application metrics, but would m=
ake this function
> cheaper (hopefully :)) fleetwide.
>

Reviewed-by: Amery Hung <ameryhung@gmail.com>

>
> >
> >> [...]
>
