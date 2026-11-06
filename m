Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.225.134
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794007378;
	b=Izkf/DCLyPmfClbBRIp2NAFWB9JINxQHfi53Cv0LKexYBziRM1qSwIgiEfzFhiyeJDk2
	 gnRi/6L1xmNF+FIsICt6ifJaOr7BCkd6VutangqfxibtNz0aztYhcGPS9Mig6Pe7rgh/u
	 pw58dpJce4AyoMYc7jM67WXB9/igzoga/xIpoFViWEyozg4zBAPE0y+3GjazFkkfgVqWi
	 IC0csc2z72up65DrfE8v3mlm40GrGKNkqv/FmgqCoA7EDOgJf18zv6Y4gY6ZngCZ4/8VS
	 iuioVE62vJiX7Xt7oRvHqymkaFMzQP7wUKibtq59SnvzPPu/MQWzRjlRcQlNkvGkiEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VabAwN5EHMrSbv+P+zBpwr/dYRbvnw6PDPgBdp5gh4k=;
	b=wfj305/AURqQv+Je7eqADZ7jL15fEbHADOcf44lyi/iClGYP9cvoUYmn7ONU0rLvPyN+
	 z/3Yvt+38lq6FbqZgOyzfzDStvonnXYp/Lym56fPMfbyga+APo+JT1vWryr2qFpGTZ8wZ
	 GBQDu1ysl7SPZwWUy4B7/vhBEfCI2ocDy2AEBjvXdWgCM9u5mGJfpKFjuESyVn1DPKb9Y
	 wSD7o+3v/Z1hUH4cOzRqP+X3YYMgKbeATkWQ46UxYfCKgoO/0jnTMk3ggLBldxfBemrun
	 x6pQVVjIC2YNxFJfwpGyrmTkB9ptRk0uG+2NH1ZzDzA9u4dCVxraMTxF2IXBMAPAFyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFHUnrRO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.225.134
Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D3C606D825
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D3C606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFHUnrRO
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-4a1d25d7d5dso4526295e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:22:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794007374; cv=none;
        d=google.com; s=arc-20260327;
        b=b3fTKLaVV1xqVeeACYxP+K6jkAt7/zTY6etwP1+ydMNkqZj6pfWHeKtXa3fSr/5nlC
         TqfoGNUcK/ySBfozTrh7xn2NJyUWvaCADsbaxr6ERatGi1A5+wL78BWIxQbYi9/nVgoS
         I1F2HsxMkwXz7p1TWHS1G9r8Hk9GCHVjN1WhcMD75ChxQMPi835LbJnqblY/xoY+20o+
         p93wH8e7uiXFvWewP8eK2YksP+AsK+Yef7gj9BRqcen6HyT4SB8UejsbBwbYeiBdr5GS
         OHWzlt8ecy2sPKW+1oUEyDg4OaM0J2oCWTPsC1CbQKIIpHFmBM0CMpmb6ab64DFsiPga
         PA5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VabAwN5EHMrSbv+P+zBpwr/dYRbvnw6PDPgBdp5gh4k=;
        fh=xLMK91PcsaUQReJ7PcW9Z/DDL5hA1Z65ig6WTJ5NVTo=;
        b=pHBKDCAe6zKczX2DHruOmzuNc20ltpoGkXENPCdDIBMG4KGX/2ZsA1ZZHEf6Of74Ac
         2M+XkuTCnClMFjZd0rv7TjHKxowAGroa+nHAKVi/8ZdsBkAkzC7Q3V8vvj6KLej9+bAb
         pEomFSYIhmiRsenPR75zkdqNCM+BoBHzb2iwqUdZmRsy2I0eZ9Zd/jAgoPY59tTfPr/L
         HLW5WZ6QtwlJo8Xvb1f8IUhV3InstvaGfzssJ0AOMuoCCYaEo64kyk0VsuKfYHn4lj34
         anHwCScKypfEnNlsYNAUq3GwCxuCj+8Efb7ViOFaQRcwLM5sSUtSPYYyV8jY+8XVBP8d
         sUZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794007374; x=1794612174; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VabAwN5EHMrSbv+P+zBpwr/dYRbvnw6PDPgBdp5gh4k=;
        b=SFHUnrRO4HmQN7e+Q6AdBYBKl7yVEib9/QnyDkfax2tsrS/lmViMi5QKklwXxUFdG/
         +yhD60LaSLj3UkPoTaunOBXx5ZiGebn0BzmPRdvrOkTB5tnMIOyc5iFthV4o92GgZog7
         l/CQxuNRIOVJzdAgcsq2sTLOTwAgkPQu5bANdm46ndyCuEzLIcmME8ZKPS2Y2kLiqtu3
         Js0jtCimXYroSRoWxd03D6xFsu2ZeBfp6QaUiUQZgQjLOrgNvY1wYoIBNiaGaKMUvbCJ
         J+WKB8yjb9I+a6vp7aJJ6l5d4h/JU8btHlRYEgUZZxTI5O4KKURrMKCKCvLTviPgcrYg
         d3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007374; x=1794612174;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VabAwN5EHMrSbv+P+zBpwr/dYRbvnw6PDPgBdp5gh4k=;
        b=AWqLmFS7yBq5LyI30F9aN3HZxi8jLc+5qXGVx8chgqBjmd1uNQBSZgYxe358xbumVk
         2VEZ4+JJmy3R8JclswG852WnBtq4K41JeQTyRO+uSHSCU77U9/VnzHy3WMmdI71FnfX3
         nFtttyY3zKL0FkBRCYZWzoamzpYQa4Czqn721FfbKM7VzB4VJq5uzXryyRsWafvbey2l
         NPv35TQhoXW6A+IG0uEvubi/6ZkubhdqCpJJusfFxd1Y+vsE4oBRVsCnQnQc8SfjzdIs
         kGSkSAnKqitNknO76NWkBZvxSXHkVBHUovV58JAvEVbm5kQfZu3sPQnhRilJophAGLKC
         B1Dg==
X-Forwarded-Encrypted: i=1; AL+hErGQD9oo0+fF2SAEUPFUwYj6LeY7A1Jf9q4sF6hp5IABwOrX9bPkUwqY4N8jp+McAvFVlTVbl8Tpv+6M5MM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g5IRRocJc0MjiWbwskwo/glGQFw75sP1k4uYUieIveYKykakW
	MA/XWJuUZ3Kr4P6VY7d/yNdLyiazMCUgwelYoWU8qi/+4eklG+ODT3X/IHbYgSJCpbwi+QTJ689
	PL/0tmzgxdpUAva2sUIfDZdh5iAfZraU=
X-Gm-Gg: AYBFou3AVZgVrFIa+9wB6aF8fEbxvv82fPGcs+xbUzc71rrPT3GobeH40CB0T6G7TjC
	+h9e8qAsthPGXO5l2S3fjcFHZyPq1mIt6ZE4NFbIA4Ml8EhFO+O1gUphMF406PN+HyWcqBTbLve
	lM7aHjAVYg87BHHUvzLTMDVCKMOhGM3SIFLUcNul1IobrROf9Orm6ye1mWC7aNbn2iNeN4mNYrn
	aNxmtTXMJdM24JlfgMj7fbw9A/yW20Bor+KorUKCLKkzy4o2essW97jBUw1g/vzSExicUjXzfzZ
	cyKmDJPmS/lpDBjROLJRbkFSMpYuwLaitXIAkK7mP1mAuDNJfNMKrd4brEB4sb8pZ+SzNzp+ekW
	aubcMOBYgBLcQww10NJ6+Ic47IeRjsZ6zwrlfmGFlHW8IJBcflCuMRA0xQQTHOXqRD3ja2RUDnk
	SqgGk+yxUuJ1KY0wOMs6aEqzJUAyXOZFMyRkxXFgxS1lGcct20l4Vws43N2eWI0QNefxTDRawxw
	+X7NCYn7Aa63A==
X-Received: by 2002:a05:6000:186f:b0:486:f907:ebec with SMTP id
 ffacd0b85a97d-492776e6a45mr8476161f8f.31.1794007373491; Fri, 06 Nov 2026
 15:22:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106231157.2840635-1-ihor.solodrai@linux.dev> <3702b4e9-bda9-45c5-8fac-392db6451823@linux.dev>
In-Reply-To: <3702b4e9-bda9-45c5-8fac-392db6451823@linux.dev>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sat, 7 Nov 2026 00:22:14 +0100
X-Gm-Features: AclHuK92sCiOAM7F3CpWdELzSinaVfoDskRhbPUSka9xmnk_bR16skNVIAILzSc
Message-ID: <CAP01T75v6J-8u7QV8hNJiUS95HHayEzjNhztSKiC-bN4R8kHfA@mail.gmail.com>
Subject: Re: [PATCH bpf v1 0/4] bpf: Scope callback arguments to their frame
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman <eddyz87@gmail.com>, 
	Amery Hung <ameryhung@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Nicholas Carlini <npc@anthropic.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Nov 2026 at 00:15, Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
>
> On 11/6/26 4:11 PM, Ihor Solodrai wrote:
> > A callback-calling helper can pass its callback a pointer that is only
> > valid for the callback invocation, and the verifier has no way to
> > express that lifetime.
> >
> > Two helpers need fixing:
> >
> >   * bpf_user_ringbuf_drain() passes a CONST_PTR_TO_DYNPTR over a
> >     sample it releases as soon as the callback returns. Saving this
> >     pointer in callback_ctx leaves it pointing into reused kernel
> >     stack and allows arbitrary kernel read and write since v7.3.
> >
> >   * bpf_for_each_map_elem() over an array or per-CPU array map passes
> >     the address of a u32 held in bpf_for_each_array_elem()'s own frame,
> >     leaking four bytes of kernel stack.
> >
> > Give the callback frame an id and make it both the id and the
> > parent_id of such an argument, so that slices and clones descend from
> > it. Invalidate the id and its descendants when the frame is popped.
> >
> > ---
> >
> > v2->v3:
>
> Sorry, I forgot -v3 when doing git format-patch
>
> Should I resend, or is this fine?
>

Should be ok, can be ascertained from the cover letter.

> > [...]
