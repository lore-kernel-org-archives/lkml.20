Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE597081A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790726585; cv=pass; b=jWnCM7E3XKDe4udc113aJNWMNIRxUH3+JuGCkECltL5rjqWeMPI3ApksGsnSjJzkirq9FLtD33NjbEHfdz4S0o8GtD4NaG0G11042Pmv/7FOMlAWAoQfUiOaa+gcNfqa5KbROjAdRRIoXA0BC7uIg240x5zp/5w8MZwsGxRg4+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790726585; c=relaxed/simple;
	bh=qHDkxtafVGiLzVypTE9iASPqPy/DZ1H6CNsLVBQXQrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fafy4aJVTgC5aLu2kqiCukPT4mzcc9aQXpjHrfaaaChrCGeqZ0dljtZJKI0MLPfn+5YZ968eoVAlTM1QhAqrMZb9OMgLgZDw5SV+xsDV4WwEKh9gNRHkMkJaRQp36lP4rJr/K2SennqBztU5c5Wtsrr3fSQ7GwuR/72nz5or30Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=POGr4Xq9; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="POGr4Xq9"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5333401e359so59611cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790726583; cv=none;
        d=google.com; s=arc-20260327;
        b=bYWZaZN/zO2ZdRqjaoCbIkXsqg4K0UqTkvA5tWHAnjJVfBdBjuCwdO+EErAorMEii4
         DEijf2OgmM35rRfzTeuKxJNmFlRRnoHspr3xv3J5PP6OAtzAWXn/SOCr6cfJFAguBjk/
         FvbQEHk4BHOWWgsyEncIaDScHOQjLqpr6+Yea8xeerZHZyAPIMTKlRjfadvt6sxm5JIW
         EROXOCRtsyqNO9WF//wCVVRTF0Y3HykwhOaSPWFMw70Rlh7/XAW2PM/Y37v9IY12IBj1
         80F5ETbevECz3ur4m8HqXP+KSjvvqEMGsuHQZYo65J4ORolN8BB67YxBropeLSEfW0l8
         R+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qHDkxtafVGiLzVypTE9iASPqPy/DZ1H6CNsLVBQXQrs=;
        fh=qXzDdGkAous+zG6iVC4fM6EpdnqOKiLh6gincu3+RU4=;
        b=owI1JKSsIOuNbd4m9fw+9kjX4NiIZ0eVEDJIjluCur1UjM8CYHuIbmp1qXaNTs60TN
         F7sWIwnnySDdPiUFIHywKgo0fagXmUE8WmiTonK/P+LCy7+n4DpItuO3Lc4lOqZzZFXu
         2yiL8oQJuHRxkLCDZN3VvO4oV22md+V+6lGAmGXX7XuGm2R47dWnotZ5fiYmrfCuK6fm
         FUSx/sB8qC3eC4UmomN70zpa39PQRz+3YcEokSiqpV5b2f4C2zu2oNkUD7Yl4ltxpqDG
         0t+Z7InyHW2Ht6q02Me90xLsDv9WdnnAU7njUl2V5tTD/UBalU5x/g/rMztV2PMKeMxT
         iaZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790726583; x=1791331383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qHDkxtafVGiLzVypTE9iASPqPy/DZ1H6CNsLVBQXQrs=;
        b=POGr4Xq9ndVZoLwEi5L3szFpGmOFlHyB5P3lc/gdzW6BGEaOU8XTBgabt/Oz3fpTpV
         x0pREqIlMxG35A64vMEI5LoO/hqjeFsxfGBZlYAltQkGr/l0uLy/DsMS2qbdxiBnSpT4
         Ggf0dwiAt663RHXGH+R0VCF8jLgKvPPxFxlmQThVdpmbK0kWTpKxf9AwahL5ke5zRaLH
         hRYo7A/DN13FCgLj3X0KwmDM5VQLQa7T9uN+ABsiydkK3nm7mHxN6hE3ClP5jALLxTsj
         8CiqAKzeSTouRCr+dm9n4+RfUt4B/ahJiCFDVQPBHyANvUKtkHZTrcaa3h1cTc3/acUr
         yP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790726583; x=1791331383;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHDkxtafVGiLzVypTE9iASPqPy/DZ1H6CNsLVBQXQrs=;
        b=ntrspfh0uB7QMCbrrepdBpYrK/iNTrLdc+2g1SHONxpfsy57MtO2BjsQMMU+ncmety
         rvFM0E89xh9NuRRM3BdPrnl3bqnHyBft6uoPW1nghSiRn5+NW71jkyiIo8epGdT5WeP4
         HYS4UwWIji2/5mmLWM3aYGH4ZGGNSpeHkt+0ZBk33ob/WG4jYyD+o/P5cbfCo5RrweS5
         FaVuxbhlD+zTqDEfAGv1lbno9inDrsyZOiSMueywa57zk5w1+BLT4adWAmRmDyabE07p
         aNXl6YF/e5iQZbTkN+zh5r3QB/3VIqgPBdGaekYbvVcxxx6kykjs/T4mgoywwm8lEr6v
         rNrA==
X-Forwarded-Encrypted: i=1; AKwUvBxVpuWW+/0AN5xVe+Obh6bkJ+nWK7MOqJjWRwOBSLPRQkiVlNqjkFnV82462DdzjwKd4dzy5SATjJptmgM=@vger.kernel.org
X-Gm-Message-State: AFuF++l4PmCTmkbsJFciqtl9Kv5KzfBB6VV9tul1CyzEqR6z56HQ5KVC
	i4sjdXzBpNen3Bou4sa6bM5HZC3CfYMuz8Z5JI96rCHvQ/8Hcl5E9sN69lBKyVTnBnwkXMH+ZxS
	4m0qZ3YRpCzcMZtNuCEgjMj/2VfeorLBUeVrF3TV2
X-Gm-Gg: AYBFou3cDzF19zBFHKlru5C/RU1wKiYLkzUd1WL/lEAQ5Lrfz4QjJk0uMQT71Hqf/mi
	vKc+kJoB0t67X0AMHHX8cFro1G3dLc7ha8L4L4oYBVwyE4LgCEUtLLx/iykyK+kEmxPIGkGS3yG
	UJqOOzzLqDFXNdnGNpF3VUkantnxEV0m9Otprqjv4hW65plBlwP5YpSPGllE03dnIssjOsLtUCN
	GzFh9X/3NDZBFtEsrFHDt/0qpu/u4ZN1Rc8Zj1lE3bYcehs3aA08vUhcYLCO4kChhNtcTW8Ig77
	nbkwJJTEE0xPxjWiE41fzBAUcat6gA9MCBagush29WNDXp/f5Pj8NQ==
X-Received: by 2002:a05:622a:1bab:b0:532:84d3:abb with SMTP id
 d75a77b69052e-5336b71d9efmr4396791cf.7.1790726581856; Tue, 29 Sep 2026
 17:03:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929232621.3745312-1-avagin@google.com> <20260929235700.GBarxQTLOrWy1I3UZr@fat_crate.local>
In-Reply-To: <20260929235700.GBarxQTLOrWy1I3UZr@fat_crate.local>
From: Andrei Vagin <avagin@google.com>
Date: Tue, 29 Sep 2026 17:02:50 -0700
X-Gm-Features: AclHuK8pBAhxHDgkryR_lf8FVefQyFp4c6WdvkftFL3l7q2RpBjFL4gCCGa388A
Message-ID: <CAEWA0a6McVMNv1ALC7EoEeA9-7_7u_b5JrsqixifvsfVJ7b_8g@mail.gmail.com>
Subject: Re: [PATCH 0/2] x86/fpu: Allow restoring signal frames with larger xstate_size
To: Borislav Petkov <bp@alien8.de>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>, linux-kernel@vger.kernel.org, 
	criu@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 4:57=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Tue, Sep 29, 2026 at 11:26:19PM +0000, Andrei Vagin wrote:
> > When a process is checkpointed on one machine and restored on another
> > (e.g., via CRIU during container/process migration), any signal frame o=
n
> > its stack carries the xstate layout of the source CPU.
> >
> > Commit fd14edd82077 ("x86/fpu: Pre-fault only required size of xstate
> > buffer") enabled restoring signal frames created on CPUs with a smaller
> > xstate_size than the destination host's default. However,
> > check_xstate_in_sigframe() still enforces that a signal frame's
> > xstate_size must not exceed the current task's fpstate->user_size.
>
> Hmm, what happened? Change of heart after the fact?
>
> So I guess I am zapping fd14edd82077 from tip:x86/fpu now and then we tes=
t
> some more before we try this again?

I think it is a misunderstanding. This series is actually the next step.
The first series enabled migrating workloads from older CPUs to newer
ones. This series enables migrating workloads from newer CPUs to older
ones.

Thanks,
Andrei
