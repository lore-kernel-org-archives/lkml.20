Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785FE46EF69
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463748; cv=none; b=lMa/O8xwE5HIw3QfDhsv5P7KWmJGIL2zhWAV6QIU8sQhA2RJgac7oobFVBZf3M1tCOqTEcyNmw3XzmKOmN474Xd3UKBclLlegO1e28t+3AMUcjfAfeu275WN6NfDq472mtlssMs/iYKcA975qnP2STgnNKtoM70OrjAt06VbuTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463748; c=relaxed/simple;
	bh=EmGj/TYa9cvf9jUjTZ/nRlWvKu/6pQ6qezCBwlaGwXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZTaCCJmiZRhE2UUO1JL05B1QLEsmXeCxfb0BUN9GKiMHg/P7qUV7jDPzyLiLN4OdMQV7ZgdNJirjy36WDdBLvkBtjP7pyhn/ityxtpp/hduZd0moFh6VFrSczDGPfNgzRubiMfyrXUq9O8cLmj7fvp3Cn76HV0qK1uy6BFbbxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kc6OsMVy; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kc6OsMVy"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d9004a1ac0so316835ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789463746; x=1790068546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KyTzZj9bu9m6y51EDmw17tS/R3K9wAgV1FMAvLd0wJ0=;
        b=kc6OsMVycQ7iZOSO9GlXWurDyYsmU3T86/G2VsCSnP8XnTzQ6Po1urUzAzsWAILgfO
         Te160Nh8FQ43Wc5VgnG36h39TvIv+x4rXJA7tdHztpr9I9BC2a6cLyKhVw/wF2fId8yj
         VabC9CCGhMdrGN7+U0LvvIZ2xyrh0CpM78nMr+xVBya0Qq9xQI+U8Qv1EDOb0q71rVMV
         ZOY2VPdoJ+U0S+oi6Lej66sj4QljXH9NFrt35FW0mbe+Wl/8P6fca1A7ZXPZJaRGvUgq
         G25l2VL/VrHibI3dmRwF+Wb+5buSaJY3hB5UrN8si0AhmUK+1X21VsGPfKM5UclDOCmm
         QB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463746; x=1790068546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KyTzZj9bu9m6y51EDmw17tS/R3K9wAgV1FMAvLd0wJ0=;
        b=wbXyq4DHlUHX2bb9qGxLFDdEoyNIf5UNoll6VYQy4p4aSCq5YJK0Da2w4jy+GISAAy
         73c8uVwNWywNY1/VdCkhkjpGONYye7h1sE2bXcMVehD3JN7KJ2KWBG1YtxrAV9qkX4Hm
         vf/mbsM/1qnhNTs7HMdxjtqmd418A6s29hy9ujXcoKQvt7UvchYUAKOoZaCLTPPb8H0I
         BCMA67QOhwDeY3N2UAbwywDt+ua/SFn/bWJ0cn1Ca9yWtyn2DWE22slfW20QkepXeRmq
         pMGgEcIF1jRAxwIELzeoWdGmoVlMciGHpv1Y1VKmot32NCGEjpY6pz1vrufKBOTwJwn1
         Oqvg==
X-Forwarded-Encrypted: i=1; AKwUvBxlOINLCCIQrpAmyefM5qCcWCUlAPHl+dL4GeCtsuNSNDfxqwXcnw/b7T6ysCzJ2PKLs13PgvHy1fbf0yE=@vger.kernel.org
X-Gm-Message-State: AFuF++l8mtPyG1uycL1bLE0bU9shIxYORNp8M/sDr7g3FOPje8bh/fnN
	hFt0W9Dgme0VKgw83x4af+IoQr9+i00ZgJZhfZF9Y/xwBXgkkCH5MHNz
X-Gm-Gg: AYBFou0s9qJ8JdswNEWui/65cmHg5kj9J8DYrWENXAziT31b6XIdpbrH5X/4BsK6Pn2
	6YADh3sHc7iNAe+bMLreZw2wVoVgurF5XbQ8FiXds34YXtXndoEtT93zqBacRvAQC5vu2vRswTi
	ohg3g6baoZuXwTMk50qZeiVzGhCngg8A2p+gpE0l0+zcbKUyphMv0SUfgd6BXyda7KLOfpUhn7W
	vP2D8IQerbCuuNE98u3qCqVCpP6ibdgQNOrCe+SjXGWGIIq6mLfFzAyGsA1041acL7MWEsM03ML
	TuuHKS0/cJU9gJfi1PgqI6unaOkp32zkW3qn0aw8iNOnPQXYbdp6up42ePel7uyJvU4VJb13MXc
	Oa+bXZFKLjX6XMQ6I1GMDfXlCa/6QeK90PX4Se/1iUMpd/KjQdV8aM3wgOJdvRRHTBKkugn8ofQ
	9z8vinayHBODjIi8XXZ1/VhZZGgLX5HI+cqST85tPKRK3mm/ecJM3xioRpYv7aVZFVWGxXrYHjz
	wHDvVrtpvFkhT+6VBdUiSym9HZ02hGoDpnaySMk/BU=
X-Received: by 2002:a17:903:3b86:b0:2cf:9347:f445 with SMTP id d9443c01a7336-2dd83851a2emr4167135ad.10.1789463745776;
        Tue, 15 Sep 2026 02:15:45 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4a7f17ecsm47233025ad.14.2026.09.15.02.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:15:45 -0700 (PDT)
Date: Tue, 15 Sep 2026 14:45:34 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, kees@kernel.org, ritesh.list@gmail.com, amachhiw@linux.ibm.com, 
	mahesh@linux.ibm.com, nikhilks@linux.ibm.com, robh@kernel.org, sayalip@linux.ibm.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH V2] powerpc/kasan: require memintrinsic prefix support
 for KASAN
Message-ID: <aqkMYJXu7mV40baM@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260911180536.3234640-2-mkchauras@gmail.com>
 <508afce0-d479-46f3-a2af-d7e6cdb65232@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <508afce0-d479-46f3-a2af-d7e6cdb65232@kernel.org>

> > - cputable.c, prom_init.c: the original comments said "use memcpy() so
> >    GCC emits __memcpy() under KASAN". The real reason is that these run
> >    pre-relocation: the destination pointer is PTRRELOC-adjusted to its
> >    current physical address, and the kernel is loaded at a different
> >    address than it was linked at. A struct assignment (*t = *s) may cause
> >    the compiler to emit an implicit memcpy() call that resolves through
> >    the unrelocated virtual symbol address -- before the MMU mapping is set
> >    up -- jumping to garbage. An explicit memcpy(t, ...) uses the already-
> >    corrected pointer and is safe. Update the comments accordingly.
> 
> Nope, see my other email.
> 
Got it. I'll remove this.
> > diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
> > index 6f6801da9dc1..233b5c650d1e 100644
> > --- a/arch/powerpc/kernel/cputable.c
> > +++ b/arch/powerpc/kernel/cputable.c
> > @@ -36,8 +36,12 @@ void __init set_cur_cpu_spec(struct cpu_spec *s)
> >   	t = PTRRELOC(t);
> >   	/*
> > -	 * use memcpy() instead of *t = *s so that GCC replaces it
> > -	 * by __memcpy() when KASAN is active
> > +	 * Use memcpy() instead of *t = *s because t is a PTRRELOC-adjusted
> > +	 * pointer and this code runs before the MMU mapping is established.
> > +	 * A struct assignment is a compiler-generated aggregate copy whose
> > +	 * implementation is not under our control in relocation-sensitive code;
> > +	 * memcpy() ensures the adjusted pointer is explicitly passed to the
> > +	 * copy routine.
> 
> This comment is wrong, see my response to your explanation. I think the
> comment should be removed completely, now it is possible to use *t = *s
> without any issue again.
> 
> 
yeah i'll fix this.
> >   	 */
> >   	memcpy(t, s, sizeof(*t));
> > @@ -55,7 +59,11 @@ static struct cpu_spec * __init setup_cpu_spec(unsigned long offset,
> >   	/*
> >   	 * Copy everything, then do fixups. Use memcpy() instead of *t = *s
> > -	 * so that GCC replaces it by __memcpy() when KASAN is active
> > +	 * because t is a PTRRELOC-adjusted pointer and this code runs before
> > +	 * the MMU mapping is established. A struct assignment is a
> > +	 * compiler-generated aggregate copy whose implementation is not under
> > +	 * our control in relocation-sensitive code; memcpy() ensures the
> > +	 * adjusted pointer is explicitly passed to the copy routine.
> 
> Same
> 
Sure.
> >   	 */
> >   	memcpy(t, s, sizeof(*t));
> > diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> > index eb9f556b0937..d6d7f1ede319 100644
> > --- a/arch/powerpc/kernel/prom_init.c
> > +++ b/arch/powerpc/kernel/prom_init.c
> > @@ -1363,10 +1363,12 @@ static void __init prom_check_platform_support(void)
> >   				       "ibm,arch-vec-5-platform-support");
> >   	/*
> > -	 * First copy the architecture vec template
> > -	 *
> > -	 * use memcpy() instead of *vec = *vec_template so that GCC replaces it
> > -	 * by __memcpy() when KASAN is active
> > +	 * First copy the architecture vec template. Use memcpy() instead of
> > +	 * a struct assignment because this code runs before the MMU mapping
> > +	 * is established. A struct assignment is a compiler-generated
> > +	 * aggregate copy whose implementation is not under our control in
> > +	 * relocation-sensitive code; memcpy() ensures the adjusted pointer
> > +	 * is explicitly passed to the copy routine.
> 
> Same.
> 
Sure.
> >   	 */
> >   	memcpy(&ibm_architecture_vec, &ibm_architecture_vec_template,
> >   	       sizeof(ibm_architecture_vec));
> 
