Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794591657;
	b=EBvXiI86p36ZaVZeJKlyRbE+b6uAHSKBZrK/6DKBoP0DI9QAmFgK0wDLr8Mns1CPRsiO
	 tp7+qOlbjgJOQ6ZbABNrNTCdUioUAB4JNLTaEVB3ui8N3q/mFxo1bappDwtnpcO2yBCWk
	 InE24W6aEYxVtkIFQX4p6lbONzmXBxhE6M5ZEBXXtUK3Bnah2ACRsA775ZDBc1rWIuerT
	 FcrAyqffrso4h6Vhl2TnS4ETjzDSu31WTugQZ/Hu1Mb5Rt1rZVJdLJwoZBE/eEur/1ojH
	 o6J3KK7oJtvtYGeHwd7SABEm0qq4h7ysGARZ9/K09Z/Dbfje8cv1YfHe9ddI5mYwVOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=aTsfJL3Fjl6wj8r3f4NqIO8QlG5kearlzOuXsxbj/LM=;
	b=D07Qzb7XIwXUZZr6fO1AaAGM7W8/oZ6yHjjbabE89wa2jUuVi5ko7sr3yM8IHwSYAsB/
	 WVJorkiVLlS3JPtTDG82c9QZuo+R9pvVugEqy6b8q1ivjbHyGdWcFIwSaCV9ZZ3sXOhMJ
	 7VOtsZERsA/gfEgOIzvpMiA3DMQoD61nJ7WlhQuonCZxt9WFUBFe5Fh63TKd1q/dEOu5q
	 gAmTMhrdnKEKpI2EFb3B4Y7jsXzw2IN/Ue30Laml3zP0rMqS6bZT5mzYW00SqZrErc/5Y
	 Ssw/AMgxyEE39Z2kwMrhnFUAurFuz4RDS7eK3IGwROBuTLy/yjVAi9mOeLYIFnswiHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4Rzv+Og;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85F3606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A85F3606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4Rzv+Og
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c445c95d553so233796466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:40:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794591655; cv=none;
        d=google.com; s=arc-20260327;
        b=fRwyXuJ92MSdgLcuskHzzUaZGX8fML4gOsefnr9kaP4mPUSpDaqNQePk2KO+N4MJ2+
         oq/ZzA5xChhbzIw1dN0sl7XGVYJVSx5AYi/y+smYbSRpgXWsyWOijFRO6P4NrcYno9EJ
         WccIfvfHJ3FZH0/n18g52IEOnEERzBcLeGJ3gpuzy1NjgrVRFFTMHPOaS6Km0hsA7wgn
         Nt7Cgh5PbuohAIlKv6P+8MPc+EYRTmKYitC3qWJ8mrCuCtG+pKQEUajBgknNjf5vJoVF
         cLhVDbejhyj9GcIBpq7v/QJixjw4h0q969lo3SGR7DSdUMXwF0PQPiVXtH9UisnUGp2Q
         Q9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aTsfJL3Fjl6wj8r3f4NqIO8QlG5kearlzOuXsxbj/LM=;
        fh=jdA3RseObJKWVcKZ77WV8QFCNjDJVrb+Z3+aQ157gQQ=;
        b=sjcsNV4gyq3aukVvO8aahI+gPKOMTJx61qTX7usACJ/kFPlCysYuF9R7OMvBWIGIMn
         4gDPvLG+vytZg8vawQ8UPSkni3BcrMfgKXEfHrVa+CBSnGgmKP09j7TnNSOYUtVLP0oL
         5Kug4zDg5UB+MdwJnsyBZrdyztmergyWnt/mtlrFlsb1iK0FkRVwhZsOHRl1QqGmWm4v
         g3uLvyM/bChAbSVLuqRshkCahlEqfdN2T/BKa7+PMutWPMRId3pBpqmf5jDUx3Z9TucC
         OokHzZmek+2BC5//EQjHXClgnGRWK6+aEE0vWLuWPlPx/MsvexjH4owNvin7bYPlLaPy
         26vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794591655; x=1795196455; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aTsfJL3Fjl6wj8r3f4NqIO8QlG5kearlzOuXsxbj/LM=;
        b=B4Rzv+OgmVdQHu4oJh52XnWUQXyObDL2qSwELgYm6bSBy27hzqLEH+Olx7/6Swgyig
         spbFBD8IesAJU5bpws5ADa4pY8viZbT7IhfaXlA56KJ6TDb8qcyBoJWlbIcuqIGwSq6h
         DQufYlYdxRh90I8ijl7Ipx6X5rH4stremZF8sLwqs5S2zYuTzRE5Vl9D/YWCDCJRMhVP
         yyoxANPOnT2SDDdyKphWzSNDgWWvyhKwc2xoqOOK3xThcAO6dltUnQcbQCShFKGFBbja
         SVks3rZWsSqu1BdtKI+z6LJUMCLsJcFuaZjmeAPNXnrbyQxz/F0RckGFGCU/GJ5kDRHR
         cXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591655; x=1795196455;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aTsfJL3Fjl6wj8r3f4NqIO8QlG5kearlzOuXsxbj/LM=;
        b=Qf2oPkKVED+Qlc24WU+9rkUiEJDiiqAHtOS2kk8BxNTwMyo0w09zAuw5nV+z+qCpsg
         KTvvbHJeAHzrylKleMiennoQgkAT6a7Ypi7V7T4w8g/DUVh45WiUYP8iA8c3abDK1Xp8
         WIF7cK6mG/4N6eCL8A3VsN0sAiz9s61AmHSeYFsACnaWiCe/xTiBZqTY9B6YBlMoMXnH
         ZS/6kVEN80OVtHTU7xawNjelIW1acKgY2ZRHMiI26WUUJtrFhIPAHRalPzJm1dYRYtpT
         71aFYw2nz9XIAY9Hffty+EJb8wrUl0Ciurpo1EHgzAYPU6wXaWOgsi0VSnt1dTzJxkR4
         rZtg==
X-Forwarded-Encrypted: i=1; AL+hErEKZ0G2HWycSP8YTM1aOWY9C9KLj0FAKMBuDvoXS+bASjDZyuZkorZgTbNeuzdsX6fOlmjY2kIMj7LRE7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mdu5DVgsdpeeqpyOQvF6jgxKESO6mDTawDDhz9TylSRF1M5QR
	l4VM/EqkOBRoHelvVzsEr2n91bg8bTfoDRLP5C6jp9RvHU9i3vCy7x1EqV6cCICoQTPJixrdg6h
	acc3p6s2RY7U7WAoPPY4zPrnnPOFAn7g=
X-Gm-Gg: AYBFou2tzgiUjrikSEvg2/XEh4f6YxwZ9M1yikXIUtjHgG9kpjdDxMdYUDraz6twJxn
	w6+bphs4UprIf65tw3vgwhtcGlZZLAgghpTHb0eJB6XwwVyWu4Y6uN+XbckGAE0BGSzmqQ1Kim2
	3Yjmn9iq2OEXZrZDSt3DGc9+45z1CiEeFs6Goq6INn2FrsNhJqKr5c1Bra8upWeCORFBclmngUL
	pYBtKG3dSD00tfmQuLUEG5MF9E10fjFhhDvHAQsDLtIGwtMC+hH6vl9xQaJMhvkXsVZIn286Bz2
	N8i67J6hg+QA8gre8BjqZXawGTOU9NTVddmBoHX93ENPvFR7HxLN/NBcBDal1XNU6etxH8yMjxF
	l6CDpiIdPxlyRidnOJQ2KSot4f4CooA0YhJOwCw==
X-Received: by 2002:a17:907:3cd6:b0:c41:cf68:bbcf with SMTP id
 a640c23a62f3a-c5096399d37mr295805066b.32.1794591654892; Fri, 13 Nov 2026
 09:40:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-i386_bpf_jit_wrong_code_20261028-v2-0-1dd0b03072a3@gmail.com>
 <avdKWKhsV6dcZ02W@google.com>
In-Reply-To: <avdKWKhsV6dcZ02W@google.com>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 13 Nov 2026 12:40:43 -0500
X-Gm-Features: AclHuK9DHBXdCNLb2CbpUETFiX9UBlNHVVtYQ5vnqxH4CRZp4OwPMstms9PtKpw
Message-ID: <CAJZwKkiBQJZofwpps43SUGT05Hb4oOHZtv1+J6n_30wqOO-LCA@mail.gmail.com>
Subject: Re: [PATCH bpf v2 0/2] bpf, x86: Fix i386 JIT signed ALU32 DIV/MOD
 and MOVSX
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Wang YanQing <udknight@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Yonghong Song <yonghong.song@linux.dev>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	"H. Peter Anvin" <hpa@zytor.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 14, 2026 at 01:35:20AM +0800, Kuan-Wei Chiu wrote:
> IIRC Alexei mentioned previously that he didn't think anyone still
> cared about i386 JIT, so the i386 JIT patches were not merged?
> Now we are seeing more i386 JIT patches. If we really think no one
> cares about this platform anymore, maybe we should remove it to avoid
> receiving more patches that we don't plan to merge?

Agreed that the i386 JIT should not get more work than it needs, and
that is what v2 is cut down to. v1 added support for new instructions,
which Alexei turned down, and all of that is dropped. What is left are
two instructions the JIT already accepts and compiles wrong, so a
verifier-accepted program can run with values outside the range the
verifier proved.

Whether to keep the JIT at all is the maintainers' call. As long as it
is in the tree, these two patches are the minimum to close that gap,
and I don't plan to send more for it.

Thanks,
Nicholas Dudar
