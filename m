Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349D34A0926
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820296; cv=pass; b=dm89KomtKMHRUwXonpi+xZHfn2V4rySWEQl58FBL0Tdcihs1AdY/OpcMoaGRunvNYZRsoQI1O8F8MfIwUq53LkrNDDIcc57Zo7qrG1Qu792YjhgNm+T/Rik9BxIN0dq84Se/Yh6Gojoozf/o91pvqONiH2w+Zv6jVBR8h5c/VD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820296; c=relaxed/simple;
	bh=2HkM2JG2ntV4O9L1XnPwIDhp9hlRGoVV+6lp00SUDi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpChn8wAq8zbZtRD1CRmKwMFxyXUsi4BfgbIICCSv303vGSak7VQSHiUnSbraVpHWULslLaYOH+BpHtUaoh18pYW5PZYGFmrkhHxdT+ieTDM15hHiIpiob4IFpBI4B5MPs+T2OLvWB+W6q4pTjEkNUVeNV2ASX3hYaiJqxtTCBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAwRCGPb; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAwRCGPb"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e2007dd8bso346446166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791820293; cv=none;
        d=google.com; s=arc-20260327;
        b=JwVY6jp2hsIJAMZg+wPfhyBNWDCgYj9h7OAjgFGtPLDybHkPnqYAyrkp2Lc16oxktF
         DWQ3I7QDXZzq6yRCeFM0EPSiBLlnfvdg5Qs9oWxzelC5NE0kpGTL06omq26PwKfv7S56
         UqsoDeQMrE3YTYKEtZdVSazFD7iX02EWF4ro9OlTE8J9LaK1OPDWDhBLhfyAmDC7qEou
         LKD6kjImw2wDE2alrCAwWCvlnaqACzZj0y1DsHc/fGsIEHCUA1240aMVHnlHw7F5P6nJ
         TDDw7Zpj6tE9TfM28uW36BFWY4A7+DC9pMfVvGYgehWyh7F01Ree6eU6Kw3T3/Qam26d
         xM4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ktNtTU9JVKl3ZfnOkIWLssk9gxWZSjBCu9lT+n1NcmY=;
        fh=Qenlc1nw7CwnTHW3ElPCZUYeTx0vs5fzkB/UEaOURwg=;
        b=HYskV5/bVQ5bBjFlmMn+WHDw2PTaMMI/YuuSjN8F0eMTvVd4ORcBpo0CkVsUQXoDDA
         LFkXmEqjExd5YgV5BTA0gJQ65/2PM0C2S9Td0HHxGwHeh1kK/Yn5FCiuvnUooba4V1C8
         /eumZEaj1chXopqlogQ8vTpDLfFRNBHFoFL6iXpJwVt96ojSVZCUkQlI/DnH2ENQB5nK
         mrJd230RCa5RHnWXdoOqebYzj5MvaaL5NAbPD+uGnt9h1/FE4lurn0fhkhPcy4VXXVZr
         IR5z/GomjeY8N1Q9yvo0SSMTpXBPv+yXlex+WCKstYn1bPFGGTd8Fa7PYm72E/ASDsHH
         rJZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791820293; x=1792425093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ktNtTU9JVKl3ZfnOkIWLssk9gxWZSjBCu9lT+n1NcmY=;
        b=MAwRCGPbF0QPfcfV9LnuZ5kmzcZSsQr/euUjqbBg109DgnrDdDQlH30j26KpRK0iQl
         JL5pmwQXyPs/Ko/IsrXlFrReAPp+f8uvp1M74hwpmJbekZxsVYzxKdiyNYH89O0XQG16
         moK8vjGr+e2SUn+GikOB0h6Ky14moFiRs8W/u42bp6iBR3X4CDJeFCezN3W/hW8Ot3it
         C4A5UUPY+N/kUEzMWp54N+nCDePa7mz0Zqg1yeu8WjACmZK0qu3Ekb3HvR5ufGtDBfkq
         4CMUDTTVZ7LuOkzG6vdpSbswau6RzGI2QPzzob51y7vzH2grxM3ukwG7nYHrHPiux6EM
         yQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820293; x=1792425093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ktNtTU9JVKl3ZfnOkIWLssk9gxWZSjBCu9lT+n1NcmY=;
        b=Sj7FhFNNamT8sD/CPdd9kM+D74ZlcCkkigNSuctX+Zc7hLRwca9+ox9WKOlVqg+Crq
         8IlJUwlRr3uOIJu+kU5kSfWk9qOyHhbii8J3LtXOredLPsGhWYyqyeg/s6cK2j1T9YBP
         1zEMKo4Dl1NK2r1jw8yaczI+eXbBpvWrlbwB+XwGGPnE61ETNr0qCqE1VsqCLUtvrXAq
         4spTocYdTv8bXay5VoOylmVsUYQ3YRY/wH1wjPMQafPGjO2ysRgqaB36DCbH2fSyQkP8
         lpxolGKdr0YujeGCqY+TfgPRy9SpXOBTuvUg9i/T8Yhw/cbTTSyY2G7HWdnOhKCp+Q22
         nmuw==
X-Forwarded-Encrypted: i=1; AKwUvBypPgtdxBAFYdP7uuT7zI1/HGJaEs37oKXEVVx3T/LKJLLoPuP0zKvMG2cV9DPucmBVdkwHqjs/qMTK79M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIM/7tnWN4p/eHfmARfkkio4b9h9/mEnZpPDdP92MA/DHEgvq+l
	8KIM3ao3b/Ejjdm9TQqY0AgUX4kHnZ0QgIV+cfdhXE0PTfzh3cVw58KUrCS8U4HIZOI/jSWMMss
	fYw9OotUtSylUi0gOc3TO8dkEVF0ZlShp6Tr7n2E=
X-Gm-Gg: AYBFou3Q7ceFcuSwi5wUkqbqJaIDgTQNxOwykdmjmzGvn3aRELWPwktD17DlogU/Ig6
	j+yr78kF/C9J54jjnKGPbvbVByTkeSYpMEvBDMBbArk8xJHMGsSy4AjP2/H6dQkonVoOtRJ60TQ
	Xw6sqdBLeZGijwcSbM31vkyWRShSHkdJaRRgt9vuFQ+Z11TqC7y7UDSs32WHInd14FD/UxSpcrm
	BgH9pZoJGM2q8Ibyo4tVHFpLhmBGwO8XZgBqB77Wep037JjpzVSZXPKdWYYVrA/XXbBaAl5/Y/Q
	OF7bpqGVCHOUbsD+eGRyunfVsqGUEoiW0apNNbpyclKwex5TlrrfHiaeXJO6KNNwyzvg9cK0m4v
	u3aIpsJxp52kppw+VDYC0zoGpOHSatCRwyWC97o6fDQ==
X-Received: by 2002:a17:907:9690:b0:c31:82aa:dd60 with SMTP id
 a640c23a62f3a-c31a9d0a5e7mr975742866b.15.1791820293222; Mon, 12 Oct 2026
 08:51:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 17:51:21 +0200
X-Gm-Features: AclHuK-xhWPZl4E0ja-mmL2ZAsaPkLiMeX7H21n80nyvvKlwLIZYd2jJw2alGQQ
Message-ID: <CA+=Fv5Rf-DKCTSnex2_Y9o+VU+mbHhMNzLJyBQ1+9hTjHufXAA@mail.gmail.com>
Subject: Re: [PATCH 0/4] alpha: perf register sampling and user stack dumps
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 11, 2026 at 10:16=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
>
> This lets perf sample registers and dump the user stack on alpha, which
> perf record --call-graph dwarf needs to unwind user space.
>
> r9-r15 are not in pt_regs, so they cannot be sampled. An unwinder
> therefore cannot get past a first frame that uses $15 as its frame
> pointer (-O0 code or alloca).
>
> The perf tool side is a separate patch for perf-tools-next. libdw also
> needs alpha unwinding support, which I am sending to elfutils-devel.
>
> ---
> Matt Turner (4):
>       alpha: fix stale user_stack_pointer()
>       alpha: stop storing the user stack pointer in pt_regs
>       alpha: use user_stack_pointer() in KSTK_ESP() and dump_elf_thread()
>       alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support
>
>  .../features/perf/perf-regs/arch-support.txt       |  2 +-
>  .../features/perf/perf-stackdump/arch-support.txt  |  2 +-
>  arch/alpha/Kconfig                                 |  2 +
>  arch/alpha/include/asm/processor.h                 |  3 +-
>  arch/alpha/include/asm/ptrace.h                    |  7 +--
>  arch/alpha/include/uapi/asm/perf_regs.h            | 45 ++++++++++++++++=
+
>  arch/alpha/include/uapi/asm/ptrace.h               |  2 +-
>  arch/alpha/kernel/Makefile                         |  1 +
>  arch/alpha/kernel/asm-offsets.c                    |  1 -
>  arch/alpha/kernel/entry.S                          |  5 --
>  arch/alpha/kernel/perf_regs.c                      | 56 ++++++++++++++++=
++++++
>  arch/alpha/kernel/process.c                        |  2 +-
>  arch/alpha/kernel/ptrace.c                         | 12 +++++
>  arch/alpha/kernel/traps.c                          |  8 ----
>  14 files changed, 122 insertions(+), 26 deletions(-)
> ---
> base-commit: 8f5dbfb93440d1aba216a1a34369a65654b94be9
> change-id: 20261001-alpha-perf-regs-v3-7e23508c1ca2
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>

The four kernel patches apply cleanly on my for-next branch. I built and
booted the series on my ES40 (EV67/Tsunami), and tested software-clock,
page-fault and hardware-cycle sampling, register masks and user stack
dumps across all three online CPUs. The targeted tests passed.

I have a few review comments(I'll respond to the individual patches).
The separate perf patch records and decodes the samples, but
I cannot yet confirm DWARF unwinding: the installed elfutils 0.195 lacks
the required Alpha support. Could you point me to that patch as well?

Thanks,
Magnus
