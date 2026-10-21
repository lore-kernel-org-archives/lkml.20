Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792546244;
	b=kDjyWFZKVH0lPMUdMTyikZnaA/kvle6mUD90bd8mQ2DHE9lsLrr00oGlG6RuxVgUBj7J
	 GQcXvHmH1ruqFN9VF6Br4OPc16075O1MXPtxGpSdP9adka0Ywb6DJYjPFtfy32MFcxYU6
	 cKBn1wgaSHIFI0oB7yPqiA7H+Bxc38VknEyPhWGI1eX+0EL7znr1MY/C6304im4QaKEt0
	 8a42/m0wcQ+NcTD/2OytNj8X5HAhx2VQ6M/vbQM6KUIIvngBHZ7e1xYDsJuFJGdS3EPFk
	 xFSomPhlIEPKdJ1SEQ+7QB3ybZEhO+y+vXBBnAkftTUdXPF+fMTzHfEDMwyRMbgh/rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792546244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PAUNdUhGhVk5P10frznxuicWSRes7WCpJcGSrDhd0Lk=;
	b=Cr9ORkaK1rp0J0ok13mDvO51vUogRjBFJnHq4jCFG/5qe6NY4K7Igz75q4OqUkPbRKh1
	 PHA8l5KSpPxN05EB32q1xpODcInR6eQ9RWAk6x6ndLKkRwOAStbFP6XKPJditUNCMzt75
	 adE5FK03P5qLCQcq6seuowXvN2B+D+7pp1b6U5WhRWcIAjcgVaewcgEl45NV7QmmajtMR
	 mCREPrM/ZvXN9LaRIbKZbTrTHF0AcR6ll/3bbeaUDqWaiJXqfN0DCQAxRDdpXt8NcX8KT
	 RgF+zFwd1DcJL5JLmN5zxa2sP8yh6fxHJOO4apFQQiOEVUDCAbNRT7zPle2EeHETrqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hbm1n5Km;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62E2606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B62E2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hbm1n5Km
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5337c7b9937so149341cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792546243; cv=none;
        d=google.com; s=arc-20260327;
        b=TVezrhQJsw1GAB3jeG3IaEKNPLHObICFgfspj4F/xIohGNHSElI0GBbDjBd8yx8Ulm
         2WQofeq8WAxx3Ok1BlQ4vmIZvh9VHiuqH+y4IkD5hkoqAUAvBE0tahM9Rjt2Fipuac4K
         0Mk/jt1MtLbe/ROYJ5WozbtAe2EJlLxKGxBBgaVPVLizy9JLZXq0y2CV3lVXsy7PDCDG
         XnTj+0QwY7GFqRF3/LstkEs8oKoKNDHeJ265ZJWmYTPRZ5EMg3KZIrKdU5Nl4eVjdRNF
         JfdErV+iWoZyecUHIGsyC+dOlE02Zo4PXFCDREXmTM7OTAoz86VfcM6bXcIBzxVHdELM
         Vrig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PAUNdUhGhVk5P10frznxuicWSRes7WCpJcGSrDhd0Lk=;
        fh=VRZPlSukPv3BerK9mSPFFDRuOTLfULpGFIT+qHHNjwA=;
        b=FjJSxuhrC/x7yy26VV64kt8LwwUzCBYk/LrQiVbx0GQYrf0Ij1hwL6402uarCEMk1B
         f4JlNr0m8IPIERzLrHdB3TMEN0CEwz6wDf3QDXatNYt9gqdh3as3jS4I0FNkB/uLmwvW
         ASgNev1EOvGUHgE4bTzsi+IUZtFX2B2OmlwKq4qsjUsbBM2/KI+M8g+aHf7wn0jP5q2E
         qSl5iVZFwjRTMTnySWvCV4Q/hsDrrwCb4dyLu/NMNHAI39SGtitqfy2zCFOMGT6z5Pz4
         fU8jbr9dvgEvRmLy8johb/N/spr0rDn3mIvLW0U1RLUgz1mx5hJuc11rcIvTprrWm6SX
         6Tmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792546243; x=1793151043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PAUNdUhGhVk5P10frznxuicWSRes7WCpJcGSrDhd0Lk=;
        b=hbm1n5KmqZ3I2eKENapPbC/2vdQHWHNUsuKkpm/gEN9PA/LdLIfkSMFh4zTJYHkpXH
         OydBIU5v4tfZjPCnPx5eSSHfq9odcpSvYupQFgj5PPQZ/XOqvl13TRksTKDRPNRZrjxg
         NeLMwpettJdn6Gu4iTgrth1NsFA3R4MGb/04YZnhKBLbjZP7AM1/e7jo27+mH67Fv3gw
         cYTWygFp4fWQNfOPGyrw8IDUtmZ9PGlUaXaK7uVHrptvwifpR0Js6aG+rkYoU3dsfWW2
         CuZdULSM2dx06x3F5G3hn8JyjDWJCQVrXmGClOcvIZ+wA2Vbu1Pjprt8DjXtlWhhcSPd
         lnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792546243; x=1793151043;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAUNdUhGhVk5P10frznxuicWSRes7WCpJcGSrDhd0Lk=;
        b=IA9VW0rkL2D9MAE21NRKwLp3II1/Nf1R6aJGNwHyciF5LCH5Nt/+1jpLm7NLGcR7fn
         +Glrj1hVFJgq8Cl7ZqEKpOjSgauKZCcm1BwLH46tFuQ7sjfs8PjCCrKubHm9Ppcgy/pY
         hgJqz469iRlrAGUGIfyS87Oa8H8MDGzESTSYxDgU8vbxXqaL06yflQKssNIAdMPShxEJ
         6vfJQLsCKbK5IAyt2JEOlYaH8w1fnbFLwC0MhwzCpLCqW0siyVQXVDdqrv7q8kspXkwy
         Lh5GV08UY/3bhFfhTB+ebrcBUTCAJPEjHywICJkJBfsz48tGZ2yBMFYC8RHj+gBVugQH
         P6FA==
X-Forwarded-Encrypted: i=1; AKwUvBx/JCyZQ9PHPep3L1h08wz1E2WfuzMvT0MXuKps4m2cAKnyixc6UudoSdEyFcYANqY/z3eppjXEOn2rdV8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvh4ZDQkHitsPYIZ27NypllyHxuv9M4bJ0aodq2+NwI7HOry6k
	rA7gGMxcrHQo7Xn0VAQUDy4V+TogpdGE7JopfAD/n/pxYQUrcDTtEaylsxc92jpY64ZcxNdNLAD
	l5O3rxqjBjy8P/Lmq0K2I/QDcrmpPBb3NTML8f3pb
X-Gm-Gg: AYBFou3clsFVm5yPKd3AabS+2bEvf/2T12z0h9gEkupRWOyJsAGAkYQVdJXjszHbqVe
	0Z11x42RgXWu0yQ14FYsb8tATbQ0jGVfS3RrAzoh92JpsfYr+lr3xWAaIHptIkbTVXUD/89swe2
	MygiaX6nBGzo/gUkZ3zSbFzr4aK3VZ+OKbCcYS7xeXSX0XG5tvZogPLSWI2wrqVfDha9n5Y9QCI
	koiCs4qTCy8bzZQRov60q/+/Y5Xz58sT2N3Srxvb5aIol4xo7nvEGl1J3emuBTZAwmfzdMRCNoy
	BBmrTtj3NZ6ryKB4ibMZMlT5rcNSQBtpUBCQRYoyC8CauGngHOqYB7ivHD3VGeAUAML4YXZ7eGc
	j00JH90f25PLaUNWIVbsnx0lJ1zPAKQFHowD+1Q==
X-Received: by 2002:a05:622a:a889:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-53684a855d1mr35309201cf.0.1792546242034; Tue, 20 Oct 2026
 18:30:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019164241.403644-1-bwicaksono@nvidia.com>
 <21f58af0-fa3f-41c5-ab03-216c60fbe2f1@linaro.org> <ate93zQFkfAecIv2@x2>
 <CAP-5=fXUMVJwtAp+8dA8V=hBD9q4x6J4YiUufwXAOXcAJoAKTg@mail.gmail.com> <SA1PR12MB6773C6D7355C7229EF1341F0A0672@SA1PR12MB6773.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB6773C6D7355C7229EF1341F0A0672@SA1PR12MB6773.namprd12.prod.outlook.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 20 Oct 2026 18:30:30 -0700
X-Gm-Features: AclHuK_s5I62ce-14bqNjkF3ExUlJi8orsBz0fc6wg1Ud9yaq6K2V9y2A5lKOFg
Message-ID: <CAP-5=fVXO+2y=0S+hRYgAoO7Vsj7xs4dbgrJ+YzMHmnkHHgx8g@mail.gmail.com>
Subject: Re: [PATCH 0/6] perf jevents: Add NVIDIA Tegra410 uncore PMU events
 and metrics
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, James Clark <james.clark@linaro.org>, 
	"namhyung@kernel.org" <namhyung@kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vikram Sethi <vsethi@nvidia.com>, 
	Rich Wiley <rwiley@nvidia.com>, Sean Kelley <skelley@nvidia.com>, Matt Ochs <mochs@nvidia.com>, 
	Raj Joshi <rajjoshi@nvidia.com>, Thierry Reding <treding@nvidia.com>, 
	Jon Hunter <jonathanh@nvidia.com>, "john.garry@linux.dev" <john.garry@linux.dev>, 
	"will@kernel.org" <will@kernel.org>, "mike.leach@arm.com" <mike.leach@arm.com>, 
	"leo.yan@linux.dev" <leo.yan@linux.dev>, "mark.rutland@arm.com" <mark.rutland@arm.com>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "jolsa@kernel.org" <jolsa@kernel.org>, 
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "ctshao@google.com" <ctshao@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 3:15=E2=80=AFPM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
> > -----Original Message-----
> > From: Ian Rogers <irogers@google.com>
> > Sent: Tuesday, October 20, 2026 8:33 PM
> > To: Arnaldo Carvalho de Melo <acme@kernel.org>
> > Cc: James Clark <james.clark@linaro.org>; Besar Wicaksono
> > <bwicaksono@nvidia.com>; namhyung@kernel.org; linux-
> > tegra@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-perf=
-
> > users@vger.kernel.org; linux-kernel@vger.kernel.org; Vikram Sethi
> > <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Sean Kelley
> > <skelley@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Raj Joshi
> > <rajjoshi@nvidia.com>; Thierry Reding <treding@nvidia.com>; Jon Hunter
> > <jonathanh@nvidia.com>; john.garry@linux.dev; will@kernel.org;
> > mike.leach@arm.com; leo.yan@linux.dev; mark.rutland@arm.com;
> > alexander.shishkin@linux.intel.com; jolsa@kernel.org;
> > adrian.hunter@intel.com; ctshao@google.com
> > Subject: Re: [PATCH 0/6] perf jevents: Add NVIDIA Tegra410 uncore PMU
> > events and metrics
> >
> > External email: Use caution opening links or attachments
> >
> >
> > On Tue, Oct 20, 2026 at 12:15=E2=80=AFPM Arnaldo Carvalho de Melo
> > <acme@kernel.org> wrote:
> > >
> > > On Mon, Oct 19, 2026 at 06:23:16PM +0100, James Clark wrote:
> > > > On 19/10/2026 17:42, Besar Wicaksono wrote:
> > > > > Add event aliases and derived metrics for the NVIDIA Tegra410 unc=
ore
> > > > > PMUs.
> > >
> > > > Reviewed-by: James Clark <james.clark@linaro.org>
> > >
> > > Thanks, applied to perf-tools-next, for v7.4.
> >
> > Hi Arnaldo,
> >
> > can we not take these in v7.4 as there is unaddressed feedback:
> > https://lore.kernel.org/linux-perf-users/CAP-
> > 5=3DfWucvdYefDOL3Vn=3DO=3DYUPEXE+tngDDfPLv-
> > T5i3WkCJVA@mail.gmail.com/
> >
> > The specific problem is that the NVidia PMUs have adopted a convention
> > not supported by the perf tool of 'pmu_name_<socket>_rc_<num>'. rc
> > stands for root complex. What ends up happening is that aggregation is
> > broken as the json is claiming that pmu_name is the PMU's name while
> > the suffix perf_pmus code thinks pmu_name_<socket>_rc is the pmu name.
> > They've wrangled support via the json by claiming these are sys
> > events.
> >
> > We can either:
> > 1) support a new suffix convention of <num>_rc_<num>
> > 2) push back and ask the driver writers to name their PMU correctly as
> > defined in the ABI:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree
> > /Documentation/ABI/testing/sysfs-bus-event_source-devices
> >
> > If we do (1) then it would be nice if the support for that could be
> > contained in this patch series. In any case these events don't belong
> > in sys.
>
> Hi Ian,
>
> Could you elaborate more on why these uncore events don't belong in sys
> directory? Is it because T410 already has an entry in mapfile.csv?

I think the meaning of sys and system events has always been unclear.
The original patch series is:
https://lore.kernel.org/lkml/1607080216-36968-1-git-send-email-john.garry@h=
uawei.com/
However, since it isn't tied to a CPUID it should refer to things like
accelerator or network cards, not regular uncore PMUs.
The whole notion of sys events/metrics needs TLC as it doesn't make
sense for them to be in vendor directories if they aren't tied to
CPUIDs.

> I put them in sys so perf matches them to the PMU by its identifier ("Com=
pat")
> rather than by the CPU, similar to hisilicon/hip09/sys and thead/yitian71=
0/sys.

So it would be better to follow x86 as a model.

> For the aggregation concern, I replied on PATCH 4/6 and will look into
> it further.

So CT replied. The ABI document was created because the hex suffix
broke aggregation, which we fixed. As your reply details, cross-PMU
aggregation has been broken by your new suffix convention. With the
conventions we have, PMU names like i915 will match a name of just "i"
and ARM CPU names tend to be valid hex suffixes in things like
armv8_pmu_a53 - so we ignore suffixes on core PMUs. The distinction
between core and uncore PMUs in sysfs is also strange. Anyway, it
isn't perfect, but we documented it so that future PMUs wouldn't break
aggregation again - or if they did they can detail in the ABI and perf
code what the new additional convention is.

Ideally we wouldn't include anything fancy like physical addresses and
socket numbers in PMU names. Such information is already present in
/proc/iomem or the topology code, and the naming irregularities only
serve to break aggregation. To add detail to the PMU, use the caps
files. I don't think the perf tool should add new ways for every
vendor to aggregate, determine sockets, etc. It is bad enough we have
to carry fixes for ARM PMUs not honoring hot plugging and for the
cpumasks not being set up properly on Intel PMUs for sub-NUMA
clustering. Ideally, the perf tool could work in a user space
emulator=E2=80=94say, an x86 perf tool running under QEMU user emulation on=
 an
ARM64 CPU. Special-casing CPU type and PMU logic defeats this goal.

Thanks,
Ian


> Thanks,
> Besar
>
> >
> > Thanks,
> > Ian
> >
> > > - Arnaldo
