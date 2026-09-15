Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A91F43B6CD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789453229; cv=none; b=oL3VpC/jobTvIujXrt+zmdvxXAassNQlOVwHMKoAR6j0a2BCcANH7RpBY4t/WcTi7zqKEgaG4WJDMjvRbNMnjl/drvs7SPfqGKHQBiF6i+7bomUW/gPA8qD97BHS7Mf7gdz9wb+o2tdb+P52AN6QlbLIu1tuY+voo8zR5zm6uNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789453229; c=relaxed/simple;
	bh=wH+dFeWC6vXKEEbfhidfrbJMkAyAxzT8WWn3pPANH18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t14IsTx1ng8bzx3yPZVQOC9nQmPVwylbQzTWKfe8QtDxzjbzxUxfAGD/yEu+r6VpHPeGZWpqOcvjw88ljxYIijq2DvlTeluFnu77EPhQbCXJP9g2lBmrTeE6LSZ3zvwrpz2/pmpvQylHtiZe/w2AA3pdrw3PTOfqfsFTRTQsZEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0oeJQJW; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0oeJQJW"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398a5aad413so4051880a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789453228; x=1790058028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lvj/QENaps3fa980Av3u1jYrzQua2MT1zXpRDbfcu0U=;
        b=R0oeJQJWpD1lhz5KWL2O/cZdWJGyRc1HZR+Vy2FMasMkGvM3aSlOoWlfu1UYfDh0hs
         ac09C1mn/9A2kOaTzWa7HxsOE12UKj9j9elWUbBFj/wq8wQ8Eh7AQebg9MDzNFq3HGEI
         TAKfpHXPLiEbof77ysiPjeOtK1oHZ1JVp046fV0dNXxo1+kaNC2/SlrFct+t6Fi9Zeqv
         Nq96S8MsyY0zyJjiNBf4Yj8YFll429oqTMxtmqwPZIc1CUt4CivLo95ernq4U3tO9gAc
         j9ni5c/TLUNndMU9R5NiA0x8MX7lu0wIfyrkSeppjLS34wu2G1cca1E9dJVs7SMWxoBU
         jvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789453228; x=1790058028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lvj/QENaps3fa980Av3u1jYrzQua2MT1zXpRDbfcu0U=;
        b=ou0+xQKfRIq/mriPM00ZuOWZF8zc566x5AalqNSzVNJAI9+zG1j6v5lNpzXp/hQA/4
         sd3aPzi/sy/+YCi9ssb/7aIQE2ZUdyv4OMEGm/9QxOCaBEnR3q1utIKRh4Bp11EkPxHG
         C/KF0KwUSLZlcXACWZYl2ACYk4KDE1Hr2uKgEU8MUSP9Swn3gCSsvsnnrn81AEVAz086
         PjbBDgxw9z7q1Ck1zcbmNDW6pabu+1nQZpzlzPebHZ74SC3IE9ruaxohjbeB+IQElwnk
         LMwTIvNBo0afhKdfvjQ39wgkpq9Vv+VpHjH2XZORnUGfJAZGRuJ0NJKUlfqzfXYaYFz0
         F97g==
X-Forwarded-Encrypted: i=1; AKwUvByBNnoqxCA448i5ZkjQ/x64M5wMpVXdfNK1t1R0uzMU+Yo/q8q3VT8UGEBd4IYAVhBbZ3OOHq9EvzDkJQY=@vger.kernel.org
X-Gm-Message-State: AFuF++lYD6Oj81yZ/uchpnQGk860Y87nWGqNbC7irRcJid3HK4D3LH3c
	tHlIb9RA4Qu80Hb4r1Plk8O0kSjM3OwYgSx3cFxzzaY/yL2zAsD0q2x+
X-Gm-Gg: AYBFou2N3XECzW2anQeCZt2TyqrNJmTy5ejyHklFfDuOHhU1rBCjB43ZcLI0v35UBJQ
	7K5O3+LoaZnRmMetT2nY7ta8PZHS20yH+IEWKeh7tT1usT4eZ2li8flHKh/+vSXWAKp9Y58tC67
	rgJVvumhP+X+8tBq+635BOjl3GGYVlOgsrCUbg1lcm34Dohlc4vhweRvYHyu0ZsI5AFAd4C82jU
	bwBlauU+B8P3xmizyK6HoOVsvVIlVnOwXGG3dubxsqNBmU5kV65T47ZY7vvRORNuk48qbrJF5e2
	zkZ2VWULdBuTugcDEuoR/3LnVT7uYaUJDX4EkH8t5NeLaACE19HLp0M4hJ6ig/dTaBxyLW3DJ2z
	C1Wgujo9KmzFiMvEd8OYTrvsfgAImvIpAvV5aMG2n0ZiW8T/i5Dd6QvKCZCi20tksMiqUR8HcPF
	dvprjA35PtDXLi4lZpZ1SkL7EGHW5U5x35jdP/lkvkKpCYjdHHjti0tQbDC0LYG2qZmbPRnf4SV
	9NaYexCx+Q3RCf2AbfhzwXHriFNzHyUPgAednI4nlA=
X-Received: by 2002:a17:90b:17d0:b0:39d:c3bb:98e7 with SMTP id 98e67ed59e1d1-39debfa60f6mr11787559a91.6.1789453227707;
        Mon, 14 Sep 2026 23:20:27 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm3169047a91.10.2026.09.14.23.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:20:26 -0700 (PDT)
Date: Tue, 15 Sep 2026 11:50:15 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, ynorov@nvidia.com, ecourtney@nvidia.com, 
	joelagnelf@nvidia.com, fujita.tomonori@gmail.com, linkmauve@linkmauve.fr, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH v4 1/2] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aqji0ILj4gkDnkry@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260912065902.24017-1-mkchauras@gmail.com>
 <20260912065902.24017-2-mkchauras@gmail.com>
 <DLDJ7TNEH9MS.2I386V2SZ5QDR@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLDJ7TNEH9MS.2I386V2SZ5QDR@garyguo.net>

[...]
> From the current implementation it looks like making "1b" a parameter doesn't
> really help anything. The fact that it internally rely on `2:` as label is still
> hardcoded.
> 
> I think you should either make the label custom too, so you write
> 
>     "1:	twi 31, 0, 0\n"	\
>     _EMIT_BUG_ENTRY(2, 1b, file, line, flags) \
>     ".org 2b+" size "\n" \
> 
> Or you should just hardcode "2" and "1b" and document them.
> 
> This stucks in mid-way and is arguably worse than either option.
> 
> Best,
> Gary
> 
Hey Gary,

Yeah makes sense. Lemme refactor this with labels as an argument and
test it out. Thanks.

Regards,
Mukesh
[...]
