Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38823391822
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791048298; cv=pass; b=MN3Jf6Tc5KuFRmod0DQNLBBd95QFxLUYCA3SBbSdhZmLgOScdAbNtQwyaLSL3fE0ni3ymxIBg9bzu+7eKS/ZpxV6EiGIQ4x7P77CzNmnuEPcEO9WWTi3OPOp44unpVMy+c/EAus9uOEU4tdgKE+fXLre6NyfzFztessMALiDS5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791048298; c=relaxed/simple;
	bh=NvcB03/UfBEDw+SJvs39CUjmPCM1Z+7rSnuluHlZg6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Chd666urvTr8RcTPKhGRyid1cPFJL/4+JqdzB6JQC5Nlf/Gd/5shrU1/0eBLzWFrl9sTbnBF/ZgQLzz4MD93ZGbyUF8MERYptTRpE7YjyHklmLri5tGaPPMXU3L/DFL1cFxA0kAAYs1KIiYVNoyw1GUmLNGsbPZ1FAJLic8VIqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d34TOg9k; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d34TOg9k"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aaf10bf094so634608a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791048294; cv=none;
        d=google.com; s=arc-20260327;
        b=Vrg9yK3mR8cmC4/XOvXroCUWtTU/1MZ1Z+7Dwqt8AGIkgT698sAyMcqVfSRz7UoHFP
         mPlNgVV45ykkefqymGj6N9n6Z95QbXf5rhhzVFjSIEYqcUX6HExPZPwcNJe/2UlHSrli
         MayIcO4Y4WURZmLSxXxvW7f9HyvN+XlzADi8MiMx7XiIj90Pb7ernL4OMLToakwUsHV8
         c6JLp4alpjeeg+pGCMRMu6m9XnAPo08T5vcgNs1n5PeQoyXRpO1MjoLCP07RBCO7CvpV
         1dYe64o0R4a+cC6gDKtjyE27qX+/EJUCOxOo9QoUVtSaUDtbrZrWrJXOwgaJWqQkFGAG
         OnFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uFdyfTKH1tj7mz2/irRhCn3QWgr+wWFYsFTpKuz0Xyg=;
        fh=WqoOIpf9LRNBrpoFYAQKDG+U7y1vUEf8HJXe4xCkNlk=;
        b=WiKhFVvo2tPaxvFY+jLRUpqU9TmAnQmar0g5zrEkw5ShA51HZPKZLrwXmvFS8KfDNF
         QCgWq1PTI2D4PVdeAnWCeEOsNlTyetIKmK/J8ooBn4mUMl4hjw0NBQUbnec9ct+uen6f
         BflHZ6dvJVEMUbVUDLQlkj4OEg2jBXAVs7fIhaiKsUt1DQ1Hkp3LB+DNwQS2i9cyow2k
         xoeZzMdmOaT1Fqa6Ua8t8knWfeFtYH4JOGu/32Dhv2sLrWx58ipuHRYqNmo4gpTwP2mn
         L59L/tCivJIDhS7Yg84DQ2LE/eIVLiv/0t7katQqzNn64kX4iv7kFkCvRz8+nUfOXjIN
         f02Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791048294; x=1791653094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uFdyfTKH1tj7mz2/irRhCn3QWgr+wWFYsFTpKuz0Xyg=;
        b=d34TOg9kZA1do7hdgPAyJb8VHT2upOut0Cexdi+lpk0rd16cp0gKybIxrMude9tZer
         CdjF7p79TQ0oS+rL9V9gTeoHHMDnBd+ETJg21I4gLCHPGlMy8SdS++lpQOTjgfCWXtmd
         n4ai0qYsK0UoIkVsDGu2hB9VYgBaVIwY+epULcV32rs0MXYDK2dHdWEZCvlumOBKppji
         WGz1G5g4d/BHrAOEFLbtXeTBShFHd+6EIicu53A5s6pE0AO3b6KgI1s948QSBfjv+kTH
         eCEif0/QkcogAqg7vLxtMMtaYIvfRbKupahdGua3NMcALLS1HiPTU9+ddmmcxXYS/U4+
         yHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791048294; x=1791653094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uFdyfTKH1tj7mz2/irRhCn3QWgr+wWFYsFTpKuz0Xyg=;
        b=h8MdNkqJp57R5FNEdDayaHd5Pv4UwTGrNg4SVFDUw4PX0W/pVAWp6D1jWFFtwEtvJW
         QVPTgJvjY6FAlftqNQ00g0jxGKIhCtlDv4hdohRcLUR2Pbp8VumD0Vz0JeylcsHMUJw6
         UA77xiugJwgot5ZGOleDJCgAweQ4NZhTsaMQWoRIIdSnU5kP+OwTJT2JiwCz4lAtCsNE
         vKDatzOyhbEQx9yekIH+tL5LagOnAAlQJ2faYHyjVx+y+Hgic+7V58HATJH0dpj7nuju
         uvtdAWhIc3DYHXVoooJdgaw78s/rwn52zLo17hXS1jXwF7bGo8bvLkeP242Vt9Q94a7/
         kwmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvpsLttJqzjUNjxd6BzR5+GMXMZBKqK52RxjRmIUWeqqRXbg5e1Lg5EMhbPZ7tfF5Gm8Ga3iCwzyvpkCI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOofsWR/yj2rohc7nzSMdTLH/URbJ5t3HeLSWGKkAMlvHgTtz9
	jDq66R1Xy0vC1WMcBg6YrtvFCmf4UtbWE5cDA1Hw4sXiH0d1Tv45Dq+QRlAJKB1PpeL8dX//i68
	xaOEb6TauoKrloZ9haPCpGr0uTOsXZe0=
X-Gm-Gg: AYBFou3xyezEK21cpLUzyE265JS+8CP/gkaYG/erY5oXyaSqVf6iigdWxX6L+QnG5fS
	8G5PkzVIngMi3fkdPG2MzuoHGJt2esju/v1Pt8Qwwd7W222sxSfPKiUaYH7R/LSnhixY0NITbe7
	TD0GDw7Oa1ZI+WNdKq2VSshxW4kSnNsQVHVp+OSXHAZrVXvMVXqFgQOCAk5dmlryZdUkV5TgWPA
	sKUuQ7u3qbmB6jfDnLWqPxiXABpJD1jmLeBhX/VRaEXmSczXaQGTg5N1n6zqyg4jtkBKsgDEhGN
	iFFHz3zeCsIlt38Tx+oBkbc57VVjw5j3ZbmK8nJmhJ3NSjxIniQcfPNc32yQ6FErxQNv3a1otG2
	G+dNervSie3W4CAvSO4EAsZKfbcZCjkLZx8J/fNc8bA==
X-Received: by 2002:a05:6402:2349:b0:6aa:ec10:81a6 with SMTP id
 4fb4d7f45d1cf-6af9e2c1a52mr4941597a12.10.1791048294103; Sat, 03 Oct 2026
 10:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003125627.3419702-1-stian@itx.no>
In-Reply-To: <20261003125627.3419702-1-stian@itx.no>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 3 Oct 2026 19:24:42 +0200
X-Gm-Features: AclHuK_j5RV7QxEWELBdlhZMe-OrkmmSRgKa6Vmvk3LBGY7X-uSoN4QK2WO-tKg
Message-ID: <CA+=Fv5SCMgMpd1tVwhdfwC7QZ-TNRnou3UAdgVjOX425EwF5Ew@mail.gmail.com>
Subject: Re: [PATCH 0/3] sparc64: stale TLB/TSB entries can livelock a thread
To: Stian Halseth <stian@itx.no>
Cc: Andreas Larsson <andreas@gaisler.com>, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stian,

On Sat, Oct 3, 2026 at 2:56=E2=80=AFPM Stian Halseth <stian@itx.no> wrote:
>
> On a SPARC T7-1 (M7, 256 strands) running up to 256 compiler processes
> in parallel, a thread now and then stops dead: runnable, fixed PC,
> system time climbing, no kernel messages.  One was caught retrying the
> same store for 25 minutes.
>
> Two causes:
>
>  - flush_tlb_fix_spurious_fault() is a no-op on sparc64 (it falls back
>    to flush_tlb_page(), which is empty here), so a write that faults on
>    a stale read-only TLB entry faults again forever.  Same for the PMD
>    hook.
>
>  - tsb_grow() publishes the new TSB before the other CPUs have switched
>    to it, and all flushes go to the new one.  Stale entries survive in
>    the old TSB and are reloaded into the TLB: read-only ones feed the
>    loop above, writable ones for unmapped pages point at freed memory.
>
> A probe in the fault path on the T7-1 showed 128 of 868 spurious faults
> during one toolchain build and test run on a CPU still using an old TSB
> that held the read-only entry, 31 of them repeating on the same thread
> and page.  A SPARC T4-1 (64 strands) shows the same: 143 of 2780.  With
> the series the T7-1 run shows 757 spurious faults, none on an old TSB
> and no repeats, and the build's system time is back from 29 min to 7.
>
> Patch 1 avoids a double flush once the hook does real work, patch 2
> defines the PTE and PMD hooks, patch 3 keeps the old TSB flushable
> until smp_tsb_sync() has returned.
>
> Tested on a T7-1 (sun4v): five consecutive full Go test suite runs
> (make.bash + dist test), once with THP off and once with THP enabled,
> no stalls; a T4-1 runs it as its daily kernel.
> On sun4u (V240, UltraSPARC IIIi) it boots and survives TSB-grow,
> copy-on-write, hugetlb and fork stress with no stale reads.
> Build-tested with CONFIG_SMP=3Dn and without THP/hugetlb.
>
> Tracking issue with the probe patch and the logs:
> https://github.com/sparclinux/issues/issues/108
>
> Stian Halseth (3):
>   sparc64: provide ptep_set_access_flags()
>   sparc64: flush the TLB on a spurious write fault
>   sparc64: keep flushing the old TSB while tsb_grow() switches CPUs
>
>  arch/sparc/include/asm/mmu_64.h      |   5 ++
>  arch/sparc/include/asm/pgtable_64.h  |   3 +
>  arch/sparc/include/asm/tlbflush_64.h |  10 ++++
>  arch/sparc/mm/tlb.c                  |  35 ++++++++++++++
>  arch/sparc/mm/tsb.c                  |  80 +++++++++++++++++++++++++++++=
+-
>  5 files changed, 127 insertions(+), 6 deletions(-)
>

Tested on an M3000 (SPARC64 VII+, eight CPUs) and an Ultra45
(UltraSPARC IIIi, UP). Both booted and passed memory-growth,
COW and remap/protection tests without observed regressions.
The Ultra45 also passed HugeTLB mapping tests.

Counters on the M3000 confirmed execution of the spurious-fault
hook and both old-TSB flush paths. I did not reproduce the original
livelock before patching, and THP was not tested.

The M3000 tests included a separate integration adjustment for
my unmerged Fujitsu support: physical-address conversion in the
four new old-TSB flush paths. Your three patches were unchanged.

So for this series:

Tested-by: Magnus Lindholm <linmag7@gmail.com>
