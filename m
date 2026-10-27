Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793136731;
	b=3EN3mHB99Vwqqm3iTC//onsrq605Y5H4TE+Yqz6a/WRnDBrR7yTENeHhQNorwDa+0KJk
	 ySvB/aRSxyiC811UcTVG2YlZHFMmvnrTs+96E+y3ppbFUYEyJh8mXXEu6QftpaQex6TTG
	 oTu/iD0JeRbe6Jy5aUW17YL38ZbZxeAHT63ZTG5OOxVJYoRc2ShddYD5nEPJSVKIQaPPL
	 Gq7rq5gIMQvTcxG6QE3bEYg+lz8hrHZ7wBekU04P1WHG4XOjMVBmdkI+zSmv12upBFgbg
	 028F+zeKOVYcddD94JtsNpHC3YxBa3gwpJEI5Nw7SLZFnm2SYYxky40h+Icwq5L8T0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QuhHDIMVu5WYcDA1LFoQtTkJOtLD/1lu0y5o2UH4ICo=;
	b=YzrdZzOuoHxscrFOC0gypscYcDn2ru29iKQtj6HPe2IYu97zfN6kXjokqgb2GX7R1eg7
	 dD43V3YZNGwvTh6PHpSJocygy+a1JgJ0qC1pJ6+cfCPsHOcMqQHkUpJpwEjmpp0HOY/r+
	 o/Z7sh8H/b13K4jpYDIyG/M8tgUuTuM9G2B1kdRmgg42ZReylnlWCdPJAeUiqvdwUDGyU
	 s1rh3JwCg+2/9NY6pXLQtdrwjsyOkHbtq2Jla4MuzAYxzpzCQVQvYKzc269RDRACcW5ny
	 imBUSL3qamQ32boOd+tDCsFvhTUux4icgTm6LGyKJAJYjyEmpq8eJpSTHJFk+sxLGPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S4q8x2rQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D6D606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44D6D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S4q8x2rQ
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6af8620a7d2so491923a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793136730; cv=none;
        d=google.com; s=arc-20260327;
        b=f3a802DYMnL048MICs73evdv/iLHej/j7bcQQAUjIzyrPPqY9aJ1K9UoTdvHmwku4u
         jPCXedeoRAFkxFHShxI7WLL7NQrESWU8aQ48d7UAIoBu59siXXk5KHYO25FHv/JsfvFx
         SUMW5bSDFc3f/1xib0/J6MFnm3kFV9O/KaQLVKhr18RnNAHCggLmnWSq7/RYwlrvdCZw
         Ne6ZQpYOVjq+f+TI3makuQOMQrsMTlfzSPsY/oX4SHeyK+X3QpgIogXao1DCFlWNAnVt
         T7N8Rg3z4hRZvsrygvZDk53gthHdNyy/jngRjI3JxuMvpsWSS2OMJDI578kw/2caYAhX
         tvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QuhHDIMVu5WYcDA1LFoQtTkJOtLD/1lu0y5o2UH4ICo=;
        fh=FbO1nBbtm3QB2iLGEo+m4MYqfMy273L4IjefKTNJkx0=;
        b=UThyAn0rvonijCn/2uSldIakmchqiraJD8IhgRncM2+jZ/t9jU/i9HQv5ooLy2um5R
         OA43JycT1oZzhebVzSLrfGqP6e6LhFzcQvyU5zfMJfmOxstzPy3UKgeuYF723sqq8Rcb
         86/F1M2jTFSFMgG8EM2BPp+19mybN1QLuOhVEqUQz0kbBC2LX+5ycq7vcq0YbC6OI3Eq
         xQBQbSxGks05BUJyKbo1VF4mFflNVv+jlGUd9yRjVO9W6RwWeo0tzX75d/VocUwliQvI
         SQsgvHMDS7r4hwyjyejSaMEuKg8PXg2A8LVOretMHGBswX7l05+mYZhhO4/GAzQAL4Tk
         6TwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793136730; x=1793741530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QuhHDIMVu5WYcDA1LFoQtTkJOtLD/1lu0y5o2UH4ICo=;
        b=S4q8x2rQcUgbgnB2taH0pkeX7W824XEztlulInCkstTN98gFWl50fOUHsLcMogIWem
         +SWWuuIF9ShMS36X+rzUjPd7KU7unYZs0GbPKlZZc+H50ZsfMxB5kFt9pJF7G8rQPafS
         Yj/Qmgt7zp+vc5tnLKCYLsenY72iRxUoBzH1XWuLuKRRylx2sc/th56B7WwrxdvuqIlj
         tisiwgUTXoSytzPTLshRseVU8MV/f68st3yxUw4yxkUyz/mWdH6jW87vSpFl3DClcaci
         WvuRRwXmAgU+OVFLKqPNuTNITzE4a/9IGHAuQqBbyFGnX3jJ2y/T3HqHGFlomaAJHMvR
         E4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136730; x=1793741530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuhHDIMVu5WYcDA1LFoQtTkJOtLD/1lu0y5o2UH4ICo=;
        b=dVoi9+bQgvYUCNjzv/lswjHevpPWXpLEOaoT0eVclTaQ3ZVJMFXjst4lUpoX6AwVf/
         nzi2OfVl868v6xQxMxJdrUBW+3w6wSrlq7rwqFb1gIvn8zSIYRu0sSrw0bwlXvZBbkY8
         7qz3MeB/GtPEZYTNyyqHmaetf0ICS8USyyQdU7aK1KjlYtEAECwbGR2yk9+UGbP2VaFL
         J0Pw2c6H2N7ewjKcFKlGQRPY8hGvEubuMcfDb5V14k66HkKNhbJDz1JP4ede5Ie618nV
         f/GKaY4z8D+GrzYt0iMvPABnoMIjEF8Ug0ZkILeZf2RZIE6pyfmqxHBRbiNxyviW5Rs7
         KGPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzXOz+EY+xqJ5zqJo8fsMe2a94MuTOeRBV4oGJ9u8qAORxRYEsoo/boFgf5PO0E+CN8yE7jA+Ff13eFDI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLskPoBqn9U9a+O9cx9s2eKxb3OEfZfOMQIDJ+db5gvRApEDw4X
	DThTx0agqPKPZw5MLB9d7iWZzcwluPLSMk+dBOU1vwCzvCwYHTGtK8Maiw+xb+Hda2y7bOwNQRE
	EPt4Zlv7n0WpRiE9KWe5lbtvxyQJk6tl5Sq+7ScWV
X-Gm-Gg: AYBFou0vRx6S2/sGZSf9hg+qXSOngNJ1tMeD8wfBBR9cTbNlDLLJfjpQ4jncVSThUul
	4zQ9hBPgJ3X+uriyJCXM7lgNsXzD87gvbhpNW5D2BBduim1+oFb56HkeUqPk1iS9/WzhjCSow+y
	IN4HUOLw6z9Xhu1xbVYOoObU6CFSYpBukU0sDFjz6qRnrR7ZI3zbSjoSDX2lIEneVybZtwF8UOA
	sjAlsHM5Yw+8kSCPp6I5E3jceqOkzri7NrDJrZxm611tTFrOuNWYFFLgMdRaVZy2L8RifDSUWhW
	xobpnP12AMVXaXGvxEP3NAvoMvMUqWpud4IkoDdlBlxZ9lGsnBxAGuNsY0FNLhGjTpu5RF48kXc
	GWR3a235DgFTlMnZQZhnLZsL+M3dYaZaGnZjEDpQTNVX03H8XpEy+eA91RjnihRF0n+/OWQsRWL
	+pQuOMtPVXO7nM
X-Received: by 2002:a17:907:868c:b0:c46:bbde:734b with SMTP id
 a640c23a62f3a-c49bdf39dc0mr39237466b.32.1793136729307; Tue, 27 Oct 2026
 14:32:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-9-wusamuel@google.com> <a925a7a8362e8e9aa0270c2b252aedcc10694857db29c31f66d6f7c5ba89ac08@mail.kernel.org>
In-Reply-To: <a925a7a8362e8e9aa0270c2b252aedcc10694857db29c31f66d6f7c5ba89ac08@mail.kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 14:31:57 -0700
X-Gm-Features: AclHuK_3f2GFNzZ4NDx25anrHi3Bvdsj3Ks-ELoCN4hDAJz29yzPop2fh0fcApc
Message-ID: <CAG2Kctryf8+44WKQzUOzyMmtL4biW3Pbg3Pntzkn3Ot49RhFow@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: bot+bpf-ci@kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, andrii@kernel.org, 
	eddyz87@gmail.com, ihor.solodrai@linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, martin.lau@kernel.org, 
	mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:51=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> [ ... ]
>
> Should the BY_ADDR path return -ENOENT when kallsyms_lookup() resolves to=
 a
> BPF address (for example, is_bpf_text_address(addr) is true and the addre=
ss
> is not in vmlinux or a module) unless bpf_jit_kallsyms_enabled() is true?
>

Thanks for the catch. In v3, I'll update BY_ADDR to gate on
bpf_jit_kallsyms_enabled() so hidden BPF JIT symbols return -ENOENT.
