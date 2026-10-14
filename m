Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15044368D5E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948271; cv=pass; b=YdN3uqAYiHlM8CzTiVLgWKbmM5P+y1Cm4+Y4yvP8RcFiVLE0NJU1U5GKRrGFoythrxZ95pEJPf8YiMCeghGVCrX/w27ZI2yGzJB6XloSv8QnmCmi8KuixmfbeiTaSyU8PlzQ4YA9ZK4Ps7jliRuwsqAcEM/hlhMWN6769LvvGuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948271; c=relaxed/simple;
	bh=7WV/PgD0jc90ZfW5o6KBecMjjiz2ATBD8Ix0KIOuLqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qtc/qnfs+H7mIXfDmR7DMuEod7bMwSsex92w0VDpgcEjFmaZ/HcG8K5i12r0ojheo9QgJaBwlaD8iPFgK0nwUyPKXpIHIZg8tuVEIQMFXIfrJ3SUCOo+KW1MzMGoW0hVyTLgKN1ayhSVvZwQ9BwD701W2C9+3Tp3FyR4kETcMEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oEri3Ohl; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEri3Ohl"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8aea7b7ca0cso25251957b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:24:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791948269; cv=none;
        d=google.com; s=arc-20260327;
        b=THHULdtMkbua0nEHNe5MQydWeOMTZkPV5BdFGteKcJ0pf594KL7WJ/bnsszDlR6Ymq
         fkgLV6jAIGha6LfSA9/l7EXE9uRc10qdS6ijN/T4Vr4Pn1HfzItqwaXt0XJhknVAnLz8
         BSa908a/J0OEejsxvT0kxhlu10HveTx6HICc4uMdwxGdYBsdlTya8iuKeQjhNa5Tb3k2
         YUXHCBqRz3WN/ygHqpFglTbp9ubLwymgT9Ak1P0Z/EiZFarkX8RmnjfWqX0yKnyDy8nw
         HZb+8kXleWBD8/HWnrFP7VUFoPu/8tIJkPtd1deXzWUcLMwYKczi43ZGmdogA57UUCrD
         p/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5W3Yp3oK6NosuISWrK7hbNW+ZeNBXIIyZITKoeVCL+k=;
        fh=Qa0T/Tj11uaWZ0VNa4e8+n270YPx90rELai0szxCras=;
        b=mC9Re7fsRRSrIma2OZ5NAW5RP9pwTTK5Aj6r/+aIzHulCLoav/Ya4DJ8mc/ZRbx+24
         /kCfCfRxynL+XqFTLYVfyaOoYuOvbGSRX1MJ5Q+OYzofnLduqfQlnM4ocBigpK+gnSaH
         Dza6AsQJSQ2U6X9pp+ygTDDzoFFYXCusSsOdIiAsbpNFIs5BqUjxiGRaKwdswIqqWLqI
         p4dRjvz2tYre9G0vgWr2S2mHd8ZyFD4K+jKfvspfjbbrpvNVx3v5xhLfljvMdPG3XcLV
         pPpsXaPYWLxfBgIzEDvJ9iSHjG6LgMtSWas6sngBIYIqrvjj6dAu3GpB7+mwmbVL9Ya8
         fizg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791948269; x=1792553069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5W3Yp3oK6NosuISWrK7hbNW+ZeNBXIIyZITKoeVCL+k=;
        b=oEri3Ohl69azgqvvm+qtmq20bwVL9rDPFvQSroQ/unXcByBKp25wv8wHPbUB7o/E0P
         Xjgrg5/XhIbfTuAghG2FbNfdmOHuR5+1eyX63dAqh3kVdRanbtTyJMkCb8v/sExJkEKl
         HpaoGXUdnDEiK3QaZ6Zm11gMLVXH8uMr7IDqTIF8zCSTBKE1tm4HX7RJm72GL4i2pMMg
         Q1TtxhsbvYDtYEtUXQDlss0r86VHX7pgGRKMZ9w2WaP12e5ERUlwJjDV/smzrsJLkR3M
         dQu3i6MDGoAHPh4QRtkYvCWg7KoYJolCie6Y2P1Hzl31B5reEiBu07jiohnRwY/Ppe++
         THtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791948269; x=1792553069;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5W3Yp3oK6NosuISWrK7hbNW+ZeNBXIIyZITKoeVCL+k=;
        b=gj/AnivJXIphGHlNuI+WIWR7pJ9Jvrtl1VStW+WOThMFnhGbfjznR0m/ABQOKJ1Jqb
         clO3nNTBc7TXZ6bh3eJF/Xr2lHgAaqeoDGom92DM0S4zFtwWlJAVjM8PjwG8Q9SQU1Gb
         6/CiuYjqwsbOdcVnepwxtB5PyHqooDsbV0yGTqY8zjjud9e4ZeeOnmXz4PoZmXoMK0Ss
         JGMyvfl7TO7+vGLrUQgiM8POuG0P0OCO8DA7NUhivfGMMrSxX2cMsy9N51OXDDFV2FV/
         Dz2+GJZCzZN/FG+mcObmMae0h+VSQi8uJQEZcWEFjLvG8+lPTZoTOzdGnKLR5y77IrEd
         UrSA==
X-Forwarded-Encrypted: i=1; AKwUvByfuumfeqa9FDr6n2jbp56h0KAfQXYmTpMgNwBa0Es/IRfEJyJ5T2rZmEtKypbyI+91HalD+Tl/A767rsw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7u2CBdWiI9NWoD4nIPl0RDkkYUZWXFcQJGJlMGgGWnabSTrd5
	DR3rjKzEf5RscSvfVY9CwKNlxBHDSF6CCztRdAXwnCC+oHMgy2DBnGYQkfkqtlLgr4deWZb5fym
	b3EuXYykxdGGGMhni4UgoXhXAFxexuL0=
X-Gm-Gg: AYBFou03j8VB1Kg0uot/sBfWqF75iZNjad2DVZmSmAQNCaR2fTc/KJjJqV+B7JSkId1
	zxKlN3xw+OdTiw+bcG8D2AtRuUgW7etnoQTsyE18PQDOJJGJ1pleGEAb1mC8+nECey+5BSHdXI9
	Jg0r6+oPsMk5XgfD1N4RHE1B0Ex9n6gQExvHyECd4Djta0o3cwR/ZOVQDWaMFh6RyK2aDHXLuBL
	lTbLDQBCcJI81c5IJmh3ry6NlB73z/2Q0QB0t2sj0v+f92mTHq1lgEhHQ8mkDuX+ckIQeQXXdYZ
	oHShJyE3UfzEpPymx7ulRZftj7AMgbQMx7PrSMml/RzKKmB9IytL0W2usAdlxTlXtqrwO0bRZym
	OA/rbAi+k+Q==
X-Received: by 2002:a53:d017:0:b0:675:74c6:79d with SMTP id
 956f58d0204a3-679362ac182mr3741120d50.122.1791948268949; Tue, 13 Oct 2026
 20:24:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012120438.52849-1-laoar.shao@gmail.com> <d9a3367a1852158f60cc2e89677fb12f@kernel.org>
 <CALOAHbBE_1ssK_26c-UY7N6WxhkVNpB6v9WACVGaOiWZ5zchCA@mail.gmail.com> <3eda489898ebf7c848ce61760af745d9@kernel.org>
In-Reply-To: <3eda489898ebf7c848ce61760af745d9@kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 14 Oct 2026 11:23:45 +0800
X-Gm-Features: AclHuK8rh2AW6bZVG8ZqRjg04D-kUz_OaCPBeR9yqJbXuPX4vDKYFO4Wi9z6gLo
Message-ID: <CALOAHbB58xLBdBOZCwJ=4yeKyvGvSsX1wfeAXehD2SGHSmB1+A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] BPF-based per-cgroup NUMA balancing mode selection
To: Tejun Heo <tj@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, akpm@linux-foundation.org, 
	david@kernel.org, gourry@gourry.net, hannes@cmpxchg.org, mkoutny@suse.com, 
	shakeel.butt@linux.dev, roman.gushchin@linux.dev, yu.c.chen@intel.com, 
	zhao1.liu@intel.com, bpf@vger.kernel.org, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 2:02=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Tue, Oct 13, 2026 at 10:16:32AM +0800, Yafang Shao wrote:
> > Part of the consults are keyed on struct folio rather than struct
> > task_struct: the folio surface answers from the folio's memcg, the
> > owner's request, not the touching task's.
>
> Right, and I take the prctl() point too. It's stable uAPI and too rigid
> a bar for this.
>
> My suggestion is to start smaller. The op doesn't compute anything
> from its inputs. It returns a fixed mode per cgroup, and you don't
> need struct_ops for that.
>
> A kfunc that takes a cgid and a value would do: -1 for the system
> setting, otherwise the existing NUMA_BALANCING_* bitmask stored per
> cgroup. Task callsites read it through the task's cgroup, folio
> callsites through folio_memcg(). Same capability for the use case in
> the cover letter, a per-cgroup field and minimal plumbing, and the
> kfunc can grow later if a real decision-time policy shows up.

That's a good suggestion.

I believe that will be a good start for other per-cgroup memory
management features as well, such as per-cgroup THP.  Also, it is
much easier to backport to older kernels and rapidly deploy them.

I will draft it soon.

--=20
Regards
Yafang
