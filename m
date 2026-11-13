Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794544353;
	b=KMMIo7S1mapIZvn7FGvZ+NopywwocWd3yrt3xobJtL83ATdZzB3zExXhjFu4T5YFP4eb
	 i3h8HyiO9MSLQZpsBnCJGUDnORgkiXAI+3RbEKzVMfmog5b0x/7/yX31Q2TosgMwurGg0
	 YKqUWQQ/XDjMVdp4o8sNlpNYvYP2rgE8fdrrZzcxZKROvX9BNkD+7fnS6uJNz095DQ/zx
	 DxrHxjpRoHrxYWXtVMjO2unQnqc8hq2aTAMdftXMberxgk7hJcZHrVtZCYMqhzEw62yUT
	 3RNnu1u3zZUaKPSZxyQK51FCjML27C+MwPnMfCZs8EFeA0u09BVb7NDkOL3VGNVQCRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=sCCLjXvB4SGerpvauilZuDN1HnIkE/zMTqJ1S6MMnw4=;
	b=EbhELh0rorW7lri+4StO4YpQgTZZ4XpQ1MWvXGm4ujoDpoSLtynjCxf3hOilZVlT1mA6
	 8QOSlutMBiGtbxvfYmLrTNIHAT2D9fWplhr7gvRZGeobfnFu8S30KWT/sYfy3t57yrM9d
	 whIiNXq/+gmhABn5foH7SoDFAtnmqMskqgrNCUpqy7TEdUhrdiTyClMO6bjYQroNQzSiY
	 3cyVACF3kdjoV48ZuEBhLdeG9A5GibBbQsgGn37j98CkjjFGHr0SjOJwHiUVRhghrvJdX
	 uYNpCuN4Ap4zzYLii7hLkhh+yZIyUPstJVQ5/V+CuIsY7ckzuT51bAT75N39thwcG9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KU3XcFIo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6230606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6230606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KU3XcFIo
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b10d24345dso6190687b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:32:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794544352; cv=none;
        d=google.com; s=arc-20260327;
        b=CLzTBct9s7Z43iv2pHrFFu1Hu1xi+BSgb2wHgj7z2woTHbpZL7dd5TG7oY7IwOwXGY
         CGdH/VjDT0Uy0EMJqCzxe6FSy30UStcNsf2oZAue+WQRA2xIiDiF12DQs2fFAQiZstlM
         2zTz/jHVGR4cluD6vD3gXXIJBLdXHvlJEB/FvulsEbm2XYyN648TZKr8gijfUtbX+j0b
         xV8F1JoucDiUyfIrfVU3iJpRqzziBSh1eKT+/QOttnDDMSgc39sOy0qcPpjUrCcIzl+u
         MITp8qnybH/2bT7aefKh3YcgUOg3fsLwtKMCeIg5sBK2T2gFygBBrwBWrIuAg/EzME3o
         ljYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sCCLjXvB4SGerpvauilZuDN1HnIkE/zMTqJ1S6MMnw4=;
        fh=aeRWPm2cQ2xAFEzMsy+dduxTlpL4LZWl2PftN8dopDg=;
        b=mslKBjWhkQTGyBf0RMZETmLzFbDHJ+pmWUt5Ah3DtrxmvkLbnWv84lblynMuc6Vyx6
         gvedSHMeDmwskiYdVD74/lbAbKaUqvbsHdDJBVhyMRUWvqDDs7q6MhkCJ7DIJAMi/GNr
         PB7ykGX2Ub0A2oAp01QJgJExSfsMkoKCKmjKT3kpEXFxR65nZ4vChYPROd1/7if5WLNe
         42akxl4J0uTsVO4UFA3unjxHUDZGajsAGJlsKBdQxWkZqj+ygnVmoWvXhvK60/Qj3HSg
         uATYpXrvZzHNY7JRe6wFTEZsXE06383lT6fNShi/qaaihF74LbC1ec40Dm3vaEmxTdSg
         4o1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794544352; x=1795149152; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCCLjXvB4SGerpvauilZuDN1HnIkE/zMTqJ1S6MMnw4=;
        b=KU3XcFIoNDQxcQQek/1dH6Plz2KpqOXYhRj9EXzcxqX7s9tHT4sD/cglVKgEh0Rks0
         apqZzfgBLirbKySdWWar8mMIUxWPQz/1yfVow0++xQiLP3azkquvrjvaon7RRQNqkF/q
         rPNN3oTLT22JLejm5lhkror1tB7sC4uZQ9/cBWad0Wdi/AViynz3F26j1F16Urxswxjh
         4HicNjm5oYyKdnT14kpUmKI6EChYVmW7ai/BlVBIsRO7lRtFp7DLESKxWU1kY/T79lPq
         Nc5BLk+KlmrkaL5xC6BFlBGZI0yntpCK4XQYNpOmH3FoOPoWujb6Z/RmiB1IYWH5oyMe
         zmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794544352; x=1795149152;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sCCLjXvB4SGerpvauilZuDN1HnIkE/zMTqJ1S6MMnw4=;
        b=KMtVOnOhYInK5bDv30vNNAt+6+UWM4oSFvRsVak1FkrtXchF3TOc0h23RN5/oLzIJR
         fvkbhWEfCjHed7N89kllSObde2Fh4NK6n0ZrvXUI421s+QMkpVEzPrUOWjxGnJvARDoS
         HvF/ONvNXwTwGF2CtZw1en1JeE+KlkEwGePBX0QdljLT9Wk9ynIXXUBhXLP+Wh/rcLr7
         0Y83UCeujvIowWgSuKvO/9aV1SJtGU9TrfkAkmnQDQ29opC3+eY7rnYhFURPVDitBx7D
         iEAvwViDU9bwWbdEHe8BgpRu9hoxpS/ZEv1cZYPL1nvDwVs47jVRQGwQtHrevnPz1IuO
         O1Xg==
X-Forwarded-Encrypted: i=1; AL+hErE/yg4NX1SkMqNTBDcn/aLnwo27ODVCqRCSpS9j3opFTk4FZlUBfN0O2zEdBjbL7Jgd6UnTqr1heSNeNUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TFjQWbkrGyNUgQH/ALvZIUUYlPAVoUaP0BN7jCLt44jFdfg5R
	kWsoewBJWkJm6igt0ANaJaILRSoecjsjrXndt1tZrtJvL0I40rHSjlX/4+rxQ0/CCbkhrki4EjY
	OLgzagS8b9gDJKthwJfEPYO1yGyeN0QU=
X-Gm-Gg: AYBFou1vomBpjhR1Jbe3bfzHnhPNfnim9opq8TKkmMLpwOWfPlEUHcft5hsD/Ju10kW
	jXYg8HmC8E2u0IsV0OYLs28U8dwSpWCRGhF4vjbZHgKRfydp1CoP03tlzT9GE4vqRQ4mgD+OQqt
	Y2NDTKi/XB7EHT2ELzodYTH7M8mv2jITd9kIBTxnIjvmogamR/Ehb32mzZ8gCp9YcDVrjsHfW2I
	PXWZ4FYmKwcQcdmZzwF73maPgPkahtwEbKsv0/xHOJH0tAu+G9CAiAqhcCG+wLhcXncI4FbCssy
	k9UjTPXAs8AGq8cdiuhgYfLpH4OtKQgjrRgs5VDf3z937jGoZ5WfJqYqDYUpucw6DK9J6en01g9
	ON0hkcj5NP3vMOcaFCsyLyvPgHbpy0eaqupFB7w==
X-Received: by 2002:a05:690c:e3ec:b0:8b2:e0c3:1f4d with SMTP id
 00721157ae682-8b4aa31790cmr11872837b3.37.1794544351872; Thu, 12 Nov 2026
 20:32:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104133158.3187525-1-luolongjuna@gmail.com>
 <20261104133158.3187525-2-luolongjuna@gmail.com> <avZ3jEbnuVu5Qv2G@jpoimboe>
In-Reply-To: <avZ3jEbnuVu5Qv2G@jpoimboe>
From: Longjun Luo <luolongjuna@gmail.com>
Date: Fri, 13 Nov 2026 12:32:20 +0800
X-Gm-Features: AclHuK8qY8jjtI7qXkHC9b17eYQlt9s3RT5E2Xs4WB3O8zx_JowBcXEsuGQNeh4
Message-ID: <CAKL4jwX=ctyjXmm=Oz_+HXe89vOHWHgT_-KGyL47fOBEQTYJiQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/11] objtool/klp: Fix checksums and copying of
 wide strings
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: peterz@infradead.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, song@kernel.org, puranjay@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, live-patching@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sorry, I left out the debugging context here. Both comments refer to
specific kernel build artifacts:

On Thu, Nov 12, 2026 at 06:42:36PM -0800, Josh Poimboeuf wrote:
> Please give example(s) of such "wide strings" in the changelog.
>
> > +/* Wide strings, such as the u16 PSR setup table, end at an all-zero element. */
> > +ssize_t elf_string_len(struct section *sec, unsigned long offset)
>
> What is the "u16 PSR setup table"?

PSR stands for Panel Self Refresh.

Source    : drivers/gpu/drm/display/drm_dp_helper.c: drm_dp_psr_setup_time()
            /* macros expanded */
            static const u16 psr_setup_time_us[] = { 330, 275, 220,
165, 110, 55, 0 };
Section   : .rodata.str2.2 (SHF_STRINGS, sh_entsize = 2, Clang ThinLTO)
Bytes     : 4a 01 13 01 dc 00 a5 00 6e 00 37 00 00 00
                        ^^^^^
                        220 (0x00dc) contains a zero byte at offset +5

objtool   : strlen() returns 5. The checksum hashes only 5 bytes, and
            the copy includes only 6 of the table's 14 bytes.

> > + /*
> > + * FIXME: GCC's range_string() uses a one-past-end string pointer.
> > + * strlen() reads past the section; preserve the string base and addend.
> > + */
> > + if (entsize == 1)
> > + return strlen(sec->data->d_buf + offset);
>
> I don't understand what this comment means either.  Please make sure all
> comments and changelogs are written by humans, as LLMs tend to write
> nonsensically.

Source    : lib/vsprintf.c: range_string()
            p = string_nocheck(p, pend, "[range ", default_str_spec);
Section   : .rodata.range_string.isra.0.str1.1 (8 bytes: "[range \0")
Reloc     : range_string.isra.0+0x9a: R_X86_64_32S .LC22+8

GCC note  : Uses .LC22+8 (one-past-the-end pointer) as a loop bound without
            dereferencing it.
objtool   : Passes offset = 8 to strlen(sec->data->d_buf + 8), reading past
            the 8-byte section. Fixing this requires tracking the base
            string (.LC22) and the +8 addend separately (left as a FIXME).

I came across both while testing on full kernel builds rather than in
production livepatching, so I'll leave it to you whether they are worth
addressing in practice.

Longjun
