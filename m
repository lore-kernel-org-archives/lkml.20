Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793376082;
	b=A7oXlN6uW0VYLMPtJNSz2xFlSv4zmnCgtg5V9JmJOhpmIou9T6gBlU/bkTRgGiO55kN3
	 qzd2ce3wuTmZR+b7D0fCzza3JqdC4l9nx7JaAe/mGlGqk8YMTAggwIOLO6dwP2KBBX0bp
	 6TmU4UxJ6ut4JiXdZPWL0KWVQDsPfSUNasfg+MH5/9JSgU4eApgqpGxmGsYzGYExDkZMZ
	 QfeS1z8TenrwJs2uTfbMWfiQnbuZexMwlmOcpLzv6210jIaZ3e0zZ/nOmTdVzg9w4Z1nH
	 Zi16FCHHWZNcgTCQ146QrhaWFh5mAucfpYO+OS/Zf5+KT05EshC+B82LbZMf/BDI9Fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o/+lnKpZS8UOplQCz0t2aWM1C9+hCFPPGrsM343ScB8=;
	b=dZe/J87JBmvjT7VGQEnTSZXpkTgR6Zvbplqp9txbI5noBV9hgSoSL0G3PO2Ljmu5nrFf
	 zhYltl9PTOQXpVewb3kUKHB0VaSzqCkrGvkwKE+pB/HIAErVLmzpHYUt7y3LLaLfypes9
	 lSuyed9Z5cJhi4reO+/BfaWiQhI7wPRP/eh6Xu3gTioP1pvPoa5b2Y8P1pNmrZN6OIUlA
	 ZurUO6BOiBu2s0Z1kg/EGEkeI9T8R8ygJBnPJ5RC7hj7a8r7ZxD6//c+ZHoF5IDNkBiYG
	 mEIMGsjP23pjTrNZ+HUVOv0ZG325mjOB7Sld/rmpbBGcH3zAuLvl4ZE+jCk6bBsatUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DdVpOj+U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BF3606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11BF3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DdVpOj+U
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5383c97c8cfso302261cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793376081; cv=none;
        d=google.com; s=arc-20260327;
        b=MUTzaSBXg/LUrHlzQDSkMN0F4LdI8EAdTuA9aJch0JUtMuClI9wEQ52zYTt9n5wsLL
         t/kQPjq8IGhzL2BxgiXJYCiHtQmDQzBcdItcEE426Xx1Iv1dF9NCBLISMh7J3dCFMSan
         MYYAkTYN0bcqdFa5ENY5Sm44IDR1SAwkjOe8xRR/DTHnhCy+6cza7t4DID8Uu22w5c2g
         ppE+IyTfQgwj0Q0Ew3jOtjNieWiSZv8g4/LjpwkRlBQb+h4l5M3fFSQOu1ls6/2PJeeo
         isxplvS/OW0bEFg++Y5TKVfYl41gZuLKc6oseshZllhj9SIn9g1ZGpa40brJsDXaoVA6
         5NnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o/+lnKpZS8UOplQCz0t2aWM1C9+hCFPPGrsM343ScB8=;
        fh=62khBQC+QEPsRyIBLfYs9KAypdGFTD8Pzg3d4gIAVHk=;
        b=eOQc6FidC6JwBTOh1VVkY/SCRuvn9DMviZkRuZeqr4WwKsAVGWWBmDHdzuIAsZki4N
         U+zrvRi1NozemJVS+oIhJfvhs56pmO2ctwRCTKJTYY96sKSHriQuuZ+IlJaAVyAcpdL1
         AzA/kd2jw1PMDRYaSdLznhKORPGz7aXQEc9QNPVTqQ509U5btVHOQREe9bp5XwlyabOh
         lzjjVTbBxnHYBSjytR5T+MFHf/G/ATX/5uqqKHgkD/MYUtOvgLUJVXY1bicTYGUXXmvq
         ZW0G1tSv42OwB2mtO/vMD+nG1cBWbhxVugtvrBRWasGNbavsXmmSfksKRXK5foFGG0e7
         t5Ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793376081; x=1793980881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o/+lnKpZS8UOplQCz0t2aWM1C9+hCFPPGrsM343ScB8=;
        b=DdVpOj+UcZY2Ucue4kSHwhXkoHV1K6ECGDJIYP6NeL2tZomqO9uf3VixD2XdhZATcJ
         /8+qKFa+k4YUOx9y8tIzk/Pr8xAIjSbNU9IDIfR9qZTIsgfqNrQv/WwYfzEgVt0p0aP7
         BRtL+QQ7QLLqBTrFgXnX/xTtA8wda/dKHj6EjF7mssh15y12jN2FA5nXKYbd5zTiF5aD
         OUS6VvCLSzbxDN3Ccu7FqvHMMjYIkNHRjtS28MtI8xWlfI2Hif9Con9n8cPI2KlpM7mX
         oVPcO0YhaJYzOtoM2hAf3q11e5YCdDyiTUouY92sXgzCPu3hOj+C2uxUgmI2Pk/2Veng
         9fdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793376081; x=1793980881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/+lnKpZS8UOplQCz0t2aWM1C9+hCFPPGrsM343ScB8=;
        b=cUiY30lIPkqCHy0YE8ko7yvB+GUWykOX3D5PEU01HKkR0jkeIX3ui7HJ178zesd5X2
         JDge/9aXIQ0CHndZON2dd62F9wF6jl0Sc3bTzbrFHc1U//aHNtdd4jo6Lp1R0QqQt23f
         x9OgL5EEWI/Nu35uOoqkKpx4KU6jRj/VYUt5Vg7Ci6O6NQu0q5dOJ141N8g7ZNSxQG3Z
         ToFFngv6E1OG+UWjzho7R8gbDJsuB5gBJ1T/KXfslPsPDiu0KLInnhXvkN8waXUVw6iQ
         dh/gsSPjZmM8Dk5j5chMLEVLH0QHnzVSnjSgEO3DYknG/UCAtMfoJsfQONY0Ce4hhWrn
         ojTg==
X-Forwarded-Encrypted: i=1; AKwUvBwqlmkP8LqAS4V717hE5Ot4EwXFyD1j3iRxuXiRbVIcIvG7zq8PA3TAZAaKVvddSRKpDS09ARRoURqLRKQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKamwiqQpa+MyxKErZpuuBqKZK147hl4wbxkcfbwkypBjDpDUV7
	YeQFpTbkRxgftrQ4eY7QlloMGErwlusMipjciL9cm903RaGVZeG8uww1uvOcAOj+ZeGnSSTGV4d
	dFhndy5ISuyva96Uphzx50Ds2Jpyq2ppemuaEY1cB
X-Gm-Gg: AYBFou0dnQWT7VxzbI8nwGAVz8qlTCZ1TYtgcpY7zIsbFI5ai9CDhj2SMm+MqEofRKb
	jMN18l6cO1JWXuHeDmtlIz3+6EWTTYlpvsvwVkvhIdtKwi0qTsWKUfUFzJxyleay/iDNq3W+yI8
	198ykhTvnDU8QGeXA/BCrzEmE+Qz1qh9mYRYRBCWUXbt23tT+jFpmMFZ6Emn5/5+IDc2CT+85SF
	8Mas4jHrbU5NSwKX8Q1BFaRqgpYnPfBT8qbtEXEcNskCZVfDWdw4zx/O47MJWn3ZuoLPvJ4KwDB
	Q+MGo8jJKZGboGgf+WEhnj7jSOHDHKPq8L9MH+INcxH0wt4nqaZVQCBOvBgHHQkMqWabwo3qBgF
	bP718m0B0BG6doKktg/0gCYZuSCHHWURXT6CPRPDTGCz1TQDkpfUNUs25YvtDkz91bYm8nD2KA2
	3td0mgczK3mlL8
X-Received: by 2002:a05:622a:c01:b0:532:eff9:ca08 with SMTP id
 d75a77b69052e-5414efcb679mr42769651cf.12.1793376079865; Fri, 30 Oct 2026
 09:01:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-perf-symbol-memory-send-v6-0-7e90415f0101@uber.com> <20261028-perf-symbol-memory-send-v6-5-7e90415f0101@uber.com>
In-Reply-To: <20261028-perf-symbol-memory-send-v6-5-7e90415f0101@uber.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 30 Oct 2026 09:01:07 -0700
X-Gm-Features: AclHuK_OjeqjZwBPO4snTGJFrMD46uy3rLYf52KHdKqpHrAUmO5Zup9dkdYM0mc
Message-ID: <CAP-5=fXFjno1Rrya6HBkBwBoSoa=68VFNUWXn32j9ehbR+9QkQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] perf test: Test lazy symbol name loading
To: haghdoost@uber.com
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 4:42=E2=80=AFPM Alireza Haghdoost via B4 Relay
<devnull+haghdoost.uber.com@kernel.org> wrote:
>
> From: Alireza Haghdoost <haghdoost@uber.com>
>
> Add a "Lazy symbol loading" unit test suite:
>
> - "Duplicate selection without names" checks which pairs of symbols
>   symbol__choice_needs_names() leaves to their names.
> - "Lazy symbol names" looks up lazy symbols whose names take one, two
>   and three reads, and two whose names cannot be read: one with no NUL
>   before the end of the file and one past the end. Lookups do not
>   return those, and dso__sort_by_name() keeps them, named "[unknown]".
> - "Lazy symbol names loaded concurrently" looks up the same lazy
>   symbols, some of them with names that cannot be read, from several
>   threads while another walks them with dso__for_each_symbol(), and
>   checks every name.
> - "Lazy and eager symbol parity" loads a DSO (perf itself, or the one
>   given with --dso) eagerly and lazily. Lookups of the first and last
>   address of each eager symbol must find the same symbol before and
>   after every lazy name is loaded, and then the ranges and names of all
>   symbols must match.
>
> Run the parity test from a shell test on four hand-built binaries:
>
>   - a split-debuginfo binary whose function section is NOBITS in the
>     debug file and has no PT_LOAD in the runtime file, so both loaders
>     must fall back to the runtime section header;
>   - a shared library with symbols present only in .dynsym, one of them
>     an alias that duplicate selection prefers over its .symtab twin;
>   - a stripped shared library whose local symbols are in .gnu_debugdata,
>     one of them an alias of a .dynsym symbol, which must load eagerly;
>   - on x86_64, a binary with an IRELATIVE PLT slot whose IFUNC loses
>     duplicate selection to an alias that loses to another one in turn,
>     so the PLT symbol name depends on how the IFUNC mark is passed on.
>
> Add a perf script shell test for --lazy-load-symbols. Record a small
> callchain fixture, require evidence that the perf binary was loaded with
> lazy names, check that the controlled test_loop symbol resolves, and
> compare the eager and lazy output. When run as root, also profile perf
> in a private mount namespace whose build-id cache directory is hidden by
> a tmpfs, so that names must be read from the build-id cache in perf's
> own namespace. The test reports a skip only if neither case can run, for
> example when libelf is missing or recording is not supported.
>
> Signed-off-by: Alireza Haghdoost <haghdoost@uber.com>

Huge fan of testing, and Sashiko can be a pain about corner cases.
Thanks for working on this! I'm happy to add a tag when Sashiko is
more happy.

Ian
