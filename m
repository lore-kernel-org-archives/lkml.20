Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E982A3822BB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340017; cv=pass; b=AcTtC3clbFPLi8bWAtk3FJ4uiv9+6WXnz4nXUhKisrQCHM9WyYBu9CBlkMsBO5873u58apjK+vao8KaYGEeo9Le4YaSSBp2BEBfTtKO83F2irzxFEd7xYEdblb/OAyEij3oXYfiBZz3bTJmBG225jVFZU0RflYpydzMiQk5AJHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340017; c=relaxed/simple;
	bh=f/oAWcmx7K+DKRoD+p4X1wlw3GKStmI56tYlt0/zKsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uG6plaBmTxJVMurwJSD8mVxDw0CnetXAIBhMacFCxrgAtETfWwGr90A8et5dTb2MtCTlR+I9ce8JTg7M+rYnJDV2wbtJ7CRfme5PGCV0PYnoHhdS3KIT32yeszQZ8GmJDG/GeEjUbZqXuUOHB/K1lfI+/vco4JxhpqWH4WFxXjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p9UBXjBU; arc=pass smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9UBXjBU"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b37782d003so589233eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788340015; cv=none;
        d=google.com; s=arc-20260327;
        b=lj6hb5CrrmUhXiuTraA13onp3783efvsQKioGsVx+RMYfKfVzCc/04wmH9attRatGO
         6VcIgozu4dFXPQKJd+cOxDV17ntJBkecH+pzFPE8GODTDzPfhh6kVYHctFk9YUcE0x0P
         EwTx3q7HjRkBJEyIwO/oqHRlrZeOedh/NO3bl3z+fStvpnE4VMLg0aUpuJLWaIADbOk0
         O7oJwzj9lUIp2Mhk3Xdn/3aSDJ/pw8FTNe9yr9w7WVVwXGCIFuL/OpNs3thTOCgy02UI
         Vul0WuAeUjjwtpu7EMEoZg7t3cUL+ZBcKDLkb6+uqjcv7TGWy3z/xBRblDjDK0JRyQwW
         P2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RvG7k49zHG3a3L7t1TLI0SMoKt3IOzcysRODmcBXppE=;
        fh=ubLqGj56crd0Jo2mjAs2Noy9VHtoGPIzzDMA4zKagfA=;
        b=dFE3C+okFEUqbAjtRIVzmR7d6FZTfZePMiA7MjJqsw1SPERaPAa8MxQ52ZBSmr53Aw
         UR8NDsCiCm3tylKINPU/XcbI8kmSXq2ZBDpFga/C4T6kf9NFRbBce0LcvFdnkYLDRAui
         oxw+5x16P1TzqjkQFn/jDEe5LGnbm+kuCaaPcpyHgrVXP0SovEEnCmlKDthiBASunOXQ
         o6RfVmdM+E74etYqt3fGzNiR/xi7atbzBpFIPPnHYP6rsADTyX7ujx1OznyMEIE0PtH/
         PmzszjRuDSme2cQJDV3JtiHW5e/0xaACa1jCdPzGS0UkuURu5y7hZF6TWlGm3LyukIlh
         nD+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788340015; x=1788944815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RvG7k49zHG3a3L7t1TLI0SMoKt3IOzcysRODmcBXppE=;
        b=p9UBXjBU/wstsIsnVKXhda22Q3EZYrGSWdWowxmWO9Oqkx03Bri4CCCnMbHEnRBYeG
         veTyRWpu4ZgdWJ1uIiNfuAdh7zlRs9KhXbQlgY1RaDCu/B45Ork0qEQWGC2pZIh3xJTy
         OdwQxKRqiDDhxIELGGTpF9WA8w0MgbVqJ9KblUV5J2TKouwzGyOCr5elofctmJIzJoOp
         w0H4UZJz38OWLlA37rsoWULJw2ybxzfm7bUStclaGb7h9UxV6gEQWNyzVeBJ98HFQFgZ
         IJykjDcKQD1ldC/mnnOg7g7CwGB7+xgwfd/OrlpxmC7f5h8VOZWAayjjOJiBy54oF6ji
         hnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788340015; x=1788944815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvG7k49zHG3a3L7t1TLI0SMoKt3IOzcysRODmcBXppE=;
        b=ecJMoV/8bXtBs6TH6twkA+k5O9NUOkUa32lt4rnLLIiTRFwJ/SfG+XaUwKt21yFSA7
         w9g7sT1R8caHtvpurI3AkhZSeJUyf08FHSlhGaucr/+VAznER3JU72Wnq5aCvRCZrwzJ
         2kCKONS7m8Qgar550FQpZYY6mHk9pM3eN6iet+5cyd2WmYr0P6/kDdJEwZz7Sicxb4Ln
         Jfh3qEFlUVhTmaM+XU8DmZ6QTY4raKn8eDMZ165zbLclAqP3Ru16Ddt34P/v8hsMsXZb
         IAw1WJPabeHAHHY7e3uB2Et2qbUBcUdBn9IhdrFbxsCbC5gDmwsjbxgvWXxmU1m9DAAq
         hneg==
X-Forwarded-Encrypted: i=1; AHgh+RoRjwV4JsAViIq3vqGdOVVA0bWeW40yoai9v7Dia/wXWGX8ZYBkbtbPG3QXgpgTjWfxrxO7CM8y45oNqfI=@vger.kernel.org
X-Gm-Message-State: AFuF++kIBqxtIAPRopiwkyvrKbv3MIcDxkop2SjaGVzHkITkUqmdji6u
	3panVPLoJoFoU8oRENZSuyIQIKOcWzhqwBF2n1HAIej9ypOwxj+AabtRTOkewMj3Gk98FSYSY2P
	erxb6x/k6EcFQ/YxmZcjbrUNTSMEeu9h1RqEiLDe6whez
X-Gm-Gg: AR+sD109QhdHqkJLjPZ+Z4/HtOd9Eq9/eS8CAN1jG63fit8C8uOCivQCmcJvaO7Ve6O
	RmL25BJwUMcI0Fv52iKbXTzI+S7X7mOu7iHyQXxKVMyxQlfUrVcSigcr1jAmy7lIaCCYcnmAnkn
	QQhQ7/BHWJV/wXl8ClFm/SPxdTXjoCpXHPwFPbojk4e+lL7A4hhuVX+TL622TIDmO/jD4MeVfTj
	oc352GodtXRdayj9cSQSFLbCSI1whA1jMI5yEKfVFn9azd9j1Suhn+PWKbBcUNSu0vE4GyZXNe4
	CgJieUlYZJ3CKxJuWdJgA04Tqe9TD8g0EkhcRvtW05UpevprEU1SHxz4EFHxqNEyrJqZFPDwHBj
	JlbFHkHMFB5D0MNtUK9grvfjJTpC3Kg==
X-Received: by 2002:a05:6820:609:b0:6b1:ab9c:3ef4 with SMTP id
 006d021491bc7-6b481436a76mr2278065eaf.27.1788340014534; Wed, 02 Sep 2026
 02:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819185349.29407-1-pisarevden@gmail.com> <20260824153542.491012-1-pisarevden@gmail.com>
 <CADnq5_MEb72btY3NtbEVgZm=H_7OV6k1xC_t5YXVM_ONrZ2b3A@mail.gmail.com>
 <CAMpx=TVt=iHo-Tj=3yFv+E0PKxMf+e-GO7oeMZMhLJCm4kKD_w@mail.gmail.com>
 <CADnq5_PvB8BeQTGRowzF2jkdUOpEdXb7C7S-Y0tFiqJqCEHP4g@mail.gmail.com> <CAMpx=TVjGYemrPJ7d+VBvLx9TELMd68QF2ML4PAsy++e62cjiA@mail.gmail.com>
In-Reply-To: <CAMpx=TVjGYemrPJ7d+VBvLx9TELMd68QF2ML4PAsy++e62cjiA@mail.gmail.com>
From: Denis Pisarev <pisarevden@gmail.com>
Date: Wed, 2 Sep 2026 11:06:18 +0200
X-Gm-Features: AcwNN1Vk1uWPPZDkyYCHBKq0rnk7KZXDH15oIM8nEmhE7Nf2ZLkzjc9_51g_SfM
Message-ID: <CAMpx=TUwhvDF_eBrSW04qyia7c-tuF3LmOb6kE95gC12GbM1Bg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/1] drm/amdgpu: MMIO TLB invalidation fallback
 when KIQ is wedged after S4 resume
To: amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, mario.limonciello@amd.com, ionut_n2001@yahoo.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Denis Pisarev <pisarevden@gmail.com>, alexander.deucher@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Correction to my earlier test report: it turns out my system
updated linux-firmware-amdgpu (20260622 -> 20260810), amd-ucode,
and the kernel (7.1.8 -> 7.1.9) between the failing reproductions
and the tlb_inv_rework test, so the clean result on your branch is
confounded.

Stock 7.1.9 + firmware 20260810 is now also clean: two hibernate
cycles today, zero "failed to write reg" errors (previously 4/4
cycles failed on firmware 20260622). Upstream 7.1.9 only has two
trivial amdgpu display fixes, so my theory is that the amdgpu
firmware refresh fixed the S4 KIQ wedge.

If it's useful I can downgrade linux-firmware-amdgpu to 20260622
from the pacman cache and try to reproduce again on stock to
confirm the firmware attribution.

On Tue, 1 Sept 2026 at 16:45, Denis Pisarev <pisarevden@gmail.com> wrote:
>
> Hi Alex,
>
> Tested tlb_inv_rework (tip: cd3e1ff4f (HEAD ->
> amdgpu-kiq-mmio-fallback-v3) drm/amdgpu: fall back to MMIO
> TLB invalidation when KIQ is unresponsive, kernelrelease
> 7.1.0-MANJARO+) on the affected machine (Cezanne / Ryzen
> 7 PRO 5850U, previously reproducing 100% across hibernate
> cycles).
>
> Result: hibernate resume is clean.
>
> - stock conditions (no GFXOFF workaround, hook removed)
> - fresh boot: 0 "failed to write reg" errors
> - after S4 resume + 30 min of normal desktop use: 0 errors
>   (control on 7.1.8 stock)
> - the amdgpu MODE2 reset at resume still occurs as on stock, but no
>   invalidation failures follow
> - one caveat from my testing: kernel was built with a trimmed
>   localmodconfig from the running distro config, not the full distro
>   config
>
> The GFXOFF correlation stands from the earlier single-variable test
> (GFXOFF held off across S4 -> zero errors), but with your rework the
> KIQ dependency for invalidation is gone, so the wedge no longer
> matters for this workload.
>
> Anything else you'd like tested on this machine (multiple hibernate
> cycles, sleep, specific tracing)?
>
>
> On Tue, 25 Aug 2026 at 19:20, Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Tue, Aug 25, 2026 at 9:19=E2=80=AFAM Denis Pisarev <pisarevden@gmail=
.com> wrote:
> > >
> > > Hi Christian, Alex,
> > >
> > > Understood regarding the fallback - dropping that approach. A working
> > > KIQ after S4 resume is the real fix.
> > >
> > > Regarding GFXOFF, I agree that a gated-off CP/ME/KIQ would also fail
> > > the ring test, which aligns with the data. The ring test passes upon
> > > resuming and sched.ready is set; however, the write-reg/wait-ack
> > > handshake begins to fail during runtime, starting in the same second
> > > as the thaw and persisting for hours (80-140 errors per hour, measure=
d
> > > over 9+ hours). So the KIQ initialises fine, but then stops completin=
g
> > > those packets.
> > >
> > > The GFXOFF attribution comes from a single-variable experiment only:
> > > same workload, one hibernation cycle each. GFXOFF held off across the
> > > whole S4 cycle (disabled before hibernating and verified to be still
> > > off after resuming): zero errors. Also zero errors over 15 minutes
> > > after re-enabling it post-resuming. Plain S3 suspend never triggers
> > > it. This is merely a correlation; I cannot prove that it is a
> > > mechanism. The existing semaphore workaround comment in gmc_v9_0.c
> > > about losing invalidate acknowledge state across power-gating cycles
> > > appears to be relevant, but I cannot prove that. I am happy to run
> > > whatever tracing is required to identify the mechanism from the
> > > affected machine (RLC/ME state, gfx_off_state sampled at the time of
> > > failure, KIQ fence timestamps and register dumps).
> >
> > Can you try this branch?
> > https://gitlab.freedesktop.org/agd5f/linux/-/commits/tlb_inv_rework?ref=
_type=3Dheads
> >
> > Alex
> >
> > >
> > > Thanks,
> > > Denis
> > >
> > > On Mon, 24 Aug 2026 at 20:31, Alex Deucher <alexdeucher@gmail.com> wr=
ote:
> > > >
> > > > On Mon, Aug 24, 2026 at 12:30=E2=80=AFPM Denis Pisarev <pisarevden@=
gmail.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > v3 addresses the two findings from the sashiko-bot review of v2.
> > > > > Failure data and trigger isolation are unchanged (bugzilla 219492=
):
> > > > > S4 resume on Cezanne (gmc_v9, GFXOFF) wedges KIQ TLB flushes at
> > > > > 80-140/hour for 9+ hours with sched.ready true throughout; holdin=
g
> > > > > GFXOFF off across the S4 cycle produces zero errors.
> > > > >
> > > > > 1. [High] "VFs and interrupt contexts silently drop TLB flushes o=
nce
> > > > >    the threshold is reached" - correct, and fixed. In v3 the latc=
h
> > > > >    only reroutes bare metal process context to MMIO. VFs and IRQ
> > > > >    contexts keep submitting to KIQ exactly as before this patch, =
with
> > > > >    per-failure logging, because they have no MMIO alternative; th=
ere
> > > > >    is no longer any code path that drops a flush without attempti=
ng
> > > > >    and logging.
> > > > >
> > > > > 2. [High] "KIQ and MMIO race on the same invalidation engine if K=
IQ
> > > > >    recovers" - this remains the documented open question; no code
> > > > >    change in v3. Our analysis: once latched, this path submits no=
 new
> > > > >    KIQ commands, so the exposure is limited to already-queued sta=
le
> > > > >    commands and the recovery transition window. The engine serial=
izes
> > > > >    requests internally, so the realistic worst case is a lost flu=
sh
> > > > >    request caught by the existing ACK timeout ("Timeout waiting f=
or VM
> > > > >    flush ACK!"), not silent state corruption. If maintainers cons=
ider
> > > > >    a fence necessary (or a dedicated invalidate engine for the MM=
IO
> > > > >    path), guidance on the preferred mechanism would be welcome.
> > > > >
> > > > > Full patch history: v1 (initial fallback+counter), v2 (GFXOFF hol=
d,
> > > > > per-instance counter, irqsave, VF/IRQ restrictions, MES error
> > > > > propagation) - all from bot review; v3 (this one) fixes the VF/IR=
Q
> > > > > drop regression the bot found in v2.
> > > > >
> > > > > Also still open from the cover letters: the alternative direction=
 of
> > > > > fixing the S4 resume ordering itself (RLC/ME vs GFXOFF) instead o=
f a
> > > > > runtime fallback. Happy to run tracing on the affected hardware.
> > > > >
> > > >
> > > > If that's a problem, that should be fixed.  That said, did you have
> > > > any success with the branch I proposed?
> > > >
> > > > Alex
> > > >
> > > > > Patch 1/1 follows.
> > > > >
> > > > > Denis Pisarev
> > > > >
> > > > > Denis Pisarev (1):
> > > > >   drm/amdgpu: fall back to MMIO TLB invalidation when KIQ is
> > > > >     unresponsive
> > > > >
> > > > >  drivers/gpu/drm/amd/amdgpu/amdgpu.h     |   2 +
> > > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h |   2 +
> > > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c |  18 ++--
> > > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h |   2 +-
> > > > >  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c   | 123 ++++++++++++++++++=
+-----
> > > > >  5 files changed, 114 insertions(+), 33 deletions(-)
> > > > >
> > > > > --
> > > > > 2.55.0
> > > > >
>
>
>
> --
> Best regards,
> Denis Pisarev.
> pisarevden@gmail.com



--=20
Best regards,
Denis Pisarev.
pisarevden@gmail.com
