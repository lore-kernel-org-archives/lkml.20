Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792770579;
	b=ZPE7TagpilyBTFLjc72ALr91K2oMknCbreJkYtdJb86bkEHBbp0Fl/zy17+s9JPKxbjF
	 PxgQFunkH00gppvOKAaH1FulZXHd75eQ9s6EEJXF65We7rz78M2qeC76nzHOzJi4B9xHg
	 HAPFT4S6H+RXT4zh+wYaeo9F7qKjStoZU4hVF0dnSfPtqdUyyGA+/5umdL1p6O+LgDmM6
	 iCU3zo9RvGJZDl8nqe0nVh0Ja1upkbbbJbZEgzU5vKRjgjMeQbo5DiCtRRul3i0WcaWuK
	 EqLe28qu7sZOC76YVAk9rTnrOoRgd9XBRHnkOVbpmQkCQ+EUC6CJN8/6xND3ZC8bGQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/RK4UOW29+Nhcipq5Ggc/UTGX+NrHJSO/XS4ifyEc6Q=;
	b=evAVn5rKWdBTSoXvVeus6ZcYKIxGMK8juPCWD01ENZGhuazabPt9mmmB+qxenJRahgH3
	 z7NvnDjNpHIRNIN8QJYfkdWSKCJBlvKMfBxwwXgt0WANRdL70aUDFkPh7b3dvVWY4i16t
	 uai/jEjO3j/ZUfurOrwapLxsV+zqbLTFS87E/XUXLH3mirgIZbtySt355bYn5eUmT6liO
	 2dtNBjVxRdqUUw2FThVQcitqC7SiP/bePsI0YQxSBuqNsiGJpa8MKITt2aM5bv0YbnwuX
	 myIa59/ny76apsO68O2SYzun3KqaQY/VOvpBW+erek+NX7WrJg9KTympY3Tu0jjlYMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XTfX+pIh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEB3606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CEB3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XTfX+pIh
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so1666450a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792770578; cv=none;
        d=google.com; s=arc-20260327;
        b=odNWieYavunzSXymfJ6cx6g4ECb9Aeofp2Jx68mAFR7ySjnRmBGkHxOatg2yBLyYyG
         WCRB0MxeSN/3431WV8T3R7DU6kyrXFK6yULwGQOfFd0oiluMm+EQEVENDskLjk9PPAfn
         vJYTR5K0i8+ZS7UjukO3FsyZsLFUvFJeRdB5I6OACNIQ9k+OyvARrhoFkABAg0WHH3rH
         riy2Fl0i3ISV3HwPT8/r01fPonJQ8XEln9Ex2r9tuYGh0v8+AW9sHKmGiX3fZytjRaEw
         AQCNaZy2E12JGZGUh3KL3RsM20dub2K43ZA16Ow9N1dCjZ4o8DiiPw6oCv22y9b4Jak8
         ZIKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/RK4UOW29+Nhcipq5Ggc/UTGX+NrHJSO/XS4ifyEc6Q=;
        fh=zp7w+3fhQ/EW9Md1lRsoCsQ2RvAVcGk/VB/cgCcimFY=;
        b=O8I6ywGXgE8/booPOTb6navJA4z/xPUX1XFYFWHobZEutZ0HW46Qxf0DCh2gGT6xnt
         VrZctCm8upxevQpk24rl3MJYVGWIrtlzF7aPvlM1N/uvqYACwVH70pJB49wm1BogBJ4M
         Z0IZirYiqUZ8ZuL4A9lL2T3/+ybr8U/aaf3eZFsNFSs8NfyRoF88YVwolel8DB28MMdq
         WH0Qp2sSwrAZ3bWaUjW7BuueQSxd9bhaVmLk5W65OVNZI7avjSo8ICRmDaQfPIxGwo/p
         9iqa1jZQuIUSGqor9pYdL30SZEJlA86UjZ1O0lkJaL4giMVstrsOKBP6u3Nc2Gpy7fmb
         MvBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792770578; x=1793375378; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RK4UOW29+Nhcipq5Ggc/UTGX+NrHJSO/XS4ifyEc6Q=;
        b=XTfX+pIh/6V7uw8wkaTRFcEuskgirPIFOWjkqceW6VkijhyF5UdX/8v4rMZ3qgUmWP
         fz/LdxbRkxF2Xu0q2syPGyJoIhfZICRa2HTnwZ6Zk/j9oCHLYJNwnrF+4+4401hFcZ/3
         IIl4Cd+OaKkZjC8DsgKvfxB3v8eJ+Xn6YOqyc5DAqg6yXKGfBQc5f2+/29ol0HioMh3y
         KmH2ZpUukDNCN7QnJz67vMvYpZY145xgWwurePG2HC6o30pnDcXNF5dWhg4Wumvivp7d
         wroGy/kKqT6V3EhOV+Xxun9Ql+I1H7Y/1LUchqiZuabXrM47a8QuIwv8P0jsDe5IfUjp
         N+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792770578; x=1793375378;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/RK4UOW29+Nhcipq5Ggc/UTGX+NrHJSO/XS4ifyEc6Q=;
        b=z5bS2S8RLGAQBKTNsPxbAEOKEFvu+t3FbVmdNhY3NCNDJrdVDtfEqxrxw8D5ZaeIaM
         KZyVEZzVqRIxxpifQVWKKRpTuEFkrn0BT7ilYkRkJ5pwtvUo4nbBWDujgPFI5wUHKXXi
         WZwGjQrE7BW9jQSIukA71RsJx+sOcFNLFM1veD2ca7lo7r8lOfADWTDN+l8xNrCgCd6N
         z/+fNS6JPCobbh9Opw/Qs08rrim8hUL2lMARnGmKyypqgfUcv7WAK9ANRgqNYZm5PhCq
         4t2DIzgXm0uw0ZQXvKkpC6z72g++Fj8SMdzKbZbheMso4MUUr66QNq4/lCEd2H9OTtrb
         01TA==
X-Forwarded-Encrypted: i=1; AKwUvByKdu39IxpnFaSav4EQczN5wEM2a1qjZuA32ZgRngqa2xb6byF6XNZ5wMcN9z0sBpshawe+qZTFPlRgPG4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiq46XHx7QAZH0bQsS0l84a3VFtwMQBDiE3IRRpUuhJneFW/Gu
	U2YPP1Lrkrkluh06wiRnWRmk9qByeJd1tw2It05PHbYx5q2c5UkQCgDRa0PE6VX9R3J434/4QYs
	ucXocJP4LLkhxSrtnTbeM6EZ/J8TFe+JVdF2BeJ2xJg==
X-Gm-Gg: AYBFou1ilvOPHm+2rbOzEZQjNv+OdP3FdswdMchbZfiBkJVg+ug4xf2W10hHSSMjen4
	Br0/aR1+PX0AMINgpOKUANd+LEXxDF2eJAKNnxgDcMU7dLlWzt3ZHI7ctb2n4WI2NQxPPVoJtyW
	GfsXZ7eoy47yPs3NtizlBkJ12oBXBwnHzvfBcmpdQzyxfbWttHoLHFiJzrNnyFUfc1oioQQ5nef
	z1Jxf1WvymUBkPvpkGYVGN4xfeNagObsOxcvBMpdYu2M25GFp2EBKdOgJDduVcdSG4XrQe5726h
	kd47leUAYJCfsu2aX+Vhz1RsMnnUOCuI3MoBBpt7Un11fcaq/BlwMzw2oov/SZrZQDEc0Vmu166
	GjWiz8jyZmRpLU/TYpzb2qD/w3o9BO1cJz/MmOxfdOu6aO+n0aA54a9v4H7tBWm8kNdLhBss1Yx
	0QnCmUPsJK5m5tHhk=
X-Received: by 2002:a05:6402:448f:b0:6b3:f692:985c with SMTP id
 4fb4d7f45d1cf-6b432c16470mr4308980a12.44.1792770577651; Fri, 23 Oct 2026
 08:49:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023023105.28829-1-laoar.shao@gmail.com> <20261023023105.28829-3-laoar.shao@gmail.com>
 <CAKfTPtD7UsFkH=YPp9Faf0LX8ppNDw6hkVgFd-0Y30oSBYdgfg@mail.gmail.com> <179276890032.2252127.6836118712740428624.b4-reply@b4>
In-Reply-To: <179276890032.2252127.6836118712740428624.b4-reply@b4>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 23 Oct 2026 17:49:26 +0200
X-Gm-Features: AclHuK_eFV6GaHUsm-a5G95nthHFI5tK598AlX9SAOZI8fQUkHY4UmHjk9aYbds
Message-ID: <CAKfTPtAkN06AKxQZrTCT+_C=x7v8f+S3EC=nkcdyJpuspfop3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] sched: use static_branch_likely() for the NUMA
 balancing tick check
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: Yafang Shao <laoar.shao@gmail.com>, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, david@kernel.org, tim.c.chen@linux.intel.com, 
	yu.c.chen@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 at 17:21, Gregory Price (Meta) <gourry@gourry.net> wrote:
>
> On 2026-10-23 14:23 +0200, Vincent Guittot wrote:
> > On Fri, 23 Oct 2026 at 04:31, Yafang Shao <laoar.shao@gmail.com> wrote:
> > >
> > > task_tick_fair() checks sched_numa_balancing on every tick. The
> > > static_branch_unlikely() annotation reserves the nop for the disabled case,
> > > so the default configuration (NUMA_BALANCING_DEFAULT_ENABLED=y) pays a
> > > taken jump per tick. Flip the polarity to static_branch_likely() so that
> > > the fast path matches the default.
> > >
> > > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > > Acked-by: Gregory Price (Meta) <gourry@gourry.net>
> > > ---
> > >  kernel/sched/fair.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index 973647ad6c2d..71dc47d6114d 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -15351,7 +15351,7 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
> > >         if (queued)
> > >                 return;
> > >
> > > -       if (static_branch_unlikely(&sched_numa_balancing))
> > > +       if (static_branch_likely(&sched_numa_balancing))
> >
> > static_branch_unlikely is used by default for other static keys too
> > like  sched_cluster_active, sched_cache_active, __sched_core_enabled
> > sched_asym_cpucapacity and others ...
>
> every other instance checking sched_numa_balancing checks likely(), this
> is the odd one out.

Some other places might be behind another key but otherwise it should
be unlikely()

>
> > So systems which don't enable them don't pay a jump when not using it.
> > I don't see why numa should be different
> >
>
> numa balancing ships enabled by default.

Others are also shipped enabled by default

>
> This just looks like cleanup to me.
>
> --
> ~Gregory
>
