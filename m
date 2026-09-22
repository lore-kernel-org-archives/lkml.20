Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD81C3E1683
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056186; cv=pass; b=cgA46jBXPLCcaYjJFuPrfFsSZHS9GWet9il0/lWzIpx3z1imXoaWt3jHTzJztuSOMS+1Gwmgds+BRIMqBN+w+DQtsGUkt6Y8pYTfIq0n8rFzBVRx2SkFnZ32gnul8q6pDGGc/2xLwcSBxdc1U3MMmku07CfOuPzdHWSPO2tzNIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056186; c=relaxed/simple;
	bh=IaiBMhZiUx180hfzBlwurDk/2OaLS6t9ll9ildR+i7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hB40FZRXZZ4dqZlcx+9qXAMriFdXHjUGklU3y3xjqmKqlu8dQgKRQAzCVYkBZUEYZWaBGC+5FYzIYARLEa/XukJ8d8aDod/4oRlYpIYPrhrbBhA0uWOnnfuGcdNxEyyP0F+CcGUgp831MWuESG9GOJkpcIvH9iRkq3rKHxhvVWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWtDYcLC; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWtDYcLC"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c6d6660191so2526230b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:49:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790056183; cv=none;
        d=google.com; s=arc-20260327;
        b=e+FsSX61RvcT1kXNPdS4XbNHFKfJuQAy+vLFKOYSdPxi15Foi27Zk/YMCuPmU+ciNx
         Cl+stnAeyYZrj0bAFC8G3hL5Vd5Bf4ywHuksW70cxzROgDOVwhwPPUpgfEUrsa0kFZCy
         SJUVB+vGWazVWf5sjG+FDpfEbph1XyejY3yZTbSoajWeNvEYmzJjYm+hjo5gbpPg6l1t
         C7O7NrvtOydRWATX+NRjwG8vcbzHPPHec/NbrIGqw8k5l2SMBDshr134DgNws46mvIvM
         yk4/TcIKWLV9wK/eWQTEt2mjNBhGkEHl4rIJMS3HfwHiJEszGJjMKrVlqn3eigS6Xy9h
         baKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DPxPXWoz+HQZCMKgPFUzkLpcsujYcZZJRRnxahFNCJA=;
        fh=LsGrF46y7TbmobkjKGfjW1PlRRb0qiPSJryG0Rtj+k8=;
        b=LyrqUGPy7+2Am2mD0frCYsrCckxi5Aph3pCVZjIMp/6TGbSM5SuYhXpHP2VzPHuEbh
         ud1WC2mxpyTItqvYcdPkfoYt/tFY4zzDHC0an0V5jG+aHTwUY0jH8x9mXM8m1VeT64s/
         8Urpmq5BNg/trqXhXTGPAH5pX0/UzJTA10ObavycB9pyFGyjbZK/d0w74YmeSQELLhbZ
         2QyO0Uzt8G3ON6g+DtibFeVEqzC9dhHI7BFd8rwBiqTunKcvWTnEKMPJbqPXKCdUj8IT
         mpUBdCMUfeCX7dQ4OEtlaIiuucFtUHPgqFY7KwqEEAAaDhp1W9GcNONHLWEwTooq1nGe
         6d8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790056183; x=1790660983; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPxPXWoz+HQZCMKgPFUzkLpcsujYcZZJRRnxahFNCJA=;
        b=hWtDYcLCiA0hFsOwAxPW+sj2VcZYiwFaK91IBI2QgBUDZIYgzb9oGbpSwLGLdvbXH5
         ylViM86n33S/mBiXwnQiiKIafiowFWdnwQGvNdxCzYReHQZe/kYWRFjme9RsRbxOsBLh
         3ri+6jatKzqMme4qK0x8Cloe8T9TIAFoX1jPFUbQs3g3iBreSYmMbPGBK3faKIwcIQ9i
         jOT6ooGauQ8WK4v0v7Y73ResKKYbog5lZ/KCmKMoRMl85GvSMOnHp7boYuCh3fOi5woy
         +aUAn94CZQ3S6D7ZZ437hjw5et/I1nYxTOXK4/MSII8UheCyimqPcIBc599WL1itekz+
         TreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056183; x=1790660983;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DPxPXWoz+HQZCMKgPFUzkLpcsujYcZZJRRnxahFNCJA=;
        b=0BtjaQ0v+7fm7h9Mfmbu5VqXueRMfzjqwn2hbSPDpnEvqMrQxTKCJm/7/OLhRX13Tx
         DHOcH/DegCd8eHwEZYwY0PVs3c1VqthwvFeabFFH2NXlc33QyC2o5DNz8famUrzU8E6e
         E3GswZiNMUpNfaoWQsFjL46+TbsGt5/4LAM4CA3sQGb4ko+oQflwyXgDMK7zAEFVTzzP
         Y5JhEkl6Dk6o3HNV91Nkbdd21lIgJWuzDSZNbm0O6TkW7NJH2ubTjtNTlUwxn5/o4MYL
         98BDDQcW+vQHlutuRiadfpnZ0x+NEq9ImqUARJuNLS4d1uByXec4nNWhvLGU5LiFNRR5
         XcSA==
X-Forwarded-Encrypted: i=1; AKwUvBzSanN2qMxJUdihTqfZEFajLaRD5WLolMFpH2x/Trg2GobqmItkkvWP4upJHEz26Zcdw4riTb82iE65ebQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mE0AJNb8eHAC1orVCOd/r0nuUKnSuiyiyqEV0dB//m/kxR4l9f
	Uo68T2zwvIh92Hzh7VJbBkR7dCRWzasPfKVVYzXkHb1QNtHM9oTH+/7GhQPkTC6FmVnCHSKtU1h
	aqBOWpPWjJcCk01lqIrb+tihax7xZLBg=
X-Gm-Gg: AYBFou08tQhXnQ0lC+dgsTqsob9xWg6Dx2NSCW9o+wVNb6s7hnF/6cgLGboGluD33n/
	Qx3aLa+jvO+HiVZefZ68TMn2SoS/MbxW2Wl6f5siQyxyW93IvGmhGYyCPeb1Sjy/4iWlOB1DhTI
	mf7xdwxaSibKwriJK4qhcrLazrwJD+ljae1xtcSyHKWnuM3JuvhLtTcUn+n3rlr0Zlw2mKIrUaJ
	bMW3f8YBFWuhouMYNzosyFzdxMTkvFROXKfZm4MOHuoOrH1NqXUSfSMIcb13Dr3bErfPM6lIwlW
	xQ45+a21XDug9CuCO/OUDM3jgRi/wbig25TTfpwtJLus4NaEffJAuxv2erh/3XHhTyX8ZvilrFU
	NwAmbDevhQQ==
X-Received: by 2002:a05:6808:4f21:b0:4b9:a829:f012 with SMTP id
 5614622812f47-4d4657acac9mr1212151b6e.30.1790056183526; Mon, 21 Sep 2026
 22:49:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921154650.130677-1-suchitkarunakaran@gmail.com>
 <DLL5PFJLT64M.1W82K71YXNT3A@gmail.com> <CAO9wTFjK+oRT-maca6A1UDBrgYTGB0Zr48UiLm2Ees835POOFg@mail.gmail.com>
 <DLL8564LZU8N.16W933Z547TYI@gmail.com>
In-Reply-To: <DLL8564LZU8N.16W933Z547TYI@gmail.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Tue, 22 Sep 2026 11:19:31 +0530
X-Gm-Features: AcwNN1W6xOYvi9sFyoWMbEvyWviGH90dvlmITiywUV51uj567TW5Vdt-iXrGmWI
Message-ID: <CAO9wTFjNX18eynH7EJGjzMeE+yXx9XesLSW9gJCYXTSqNJMavQ@mail.gmail.com>
Subject: Re: [PATCH] bpf: add diagnostics for rejected memory and map accesses
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, john.fastabend@gmail.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 00:30, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon Sep 21, 2026 at 5:38 PM UTC, Suchit Karunakaran wrote:
> > On Mon, 21 Sept 2026 at 22:35, Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> > >
> > > On Mon, Sep 21, 2026 at 09:16 PM Suchit Karunakaran <suchitkarunakaran@gmail.com> wrote:
> > > >                                       verbose(env, "sign extending loads from arena are not supported yet\n");
> > > > +                                     bpf_diag_policy(
> > > > +                                             env, i + delta, "sign-extending arena load",
> > > > +                                             "the current JIT does not support this load instruction for arena memory",
> > > > +                                             "Use a kernel and architecture with JIT support for this arena load.");
> > >
> > > Did you read what AI generated for you?
> > > "Use a kernel and architecture with JIT support for this arena load."
> > > ?!?!
> > >
> > > Please apply human filter to every single line of "your" patches.
> > >
> > > pw-bot: cr
> >
> > Hi Alexei. I'm sorry for the oversight. I somehow misinterpreted it as
> > "Use a kernel and architecture with JIT that supports this arena
> > load." Is the following diagnostic message fine? If yes I'll correct
> > it in v2.
> > bpf_diag_policy(env, i + delta,
> > "sign-extending arena load", "the current JIT backend doesn't
> > implement sign-extending loads from arena memory",
> >  "Use a kernel and architecture where the BPF JIT supports
> > sign-extending loads from arena memory.");
>
> No. That is still wrong. Put yourself in user's shoes.
> How would you react to this message?
>

Hi Alexei, thanks for the review. After some research, I found that
the sign extending load instruction was introduced in BPF ISA V4.
Given that, would the following diagnostic message be more helpful for
users?
bpf_diag_policy(env, i + delta,
"sign-extending load from arena memory",
"the current JIT backend doesn't implement sign-extending loads from
arena memory",
"Recompile the BPF program with Clang's -mcpu=v3 to avoid generating
sign-extending load instructions.");
