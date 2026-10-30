Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793366551;
	b=rcxdkNpUxn1J07eVTDwJHTUylUnv9lsK/kwLdsGhPfdrMsXQnMpHshzsXP6wWGH5D3R7
	 itYzH+pHfKmxL1lUT301KBRHG+RZFFv81nf/tvvPvDk4TUqa4hVgNoKRDBzsB1RV0zDbc
	 dOkEsJaB7MsUlezgefyS+t67pb6nj0QsWx16VxghN9OdKvW7BYpmhqvGe/PY4PDVqKCnW
	 gLwJrsb2gdU+CL5FJJB1IH0wC+lSOIbaf+PzTqlTrR3fjPrTgfKYQpubOBrUUBZVVw4/P
	 Talq3qPtdeHkEGBes1Uv0I/JJCuuiLbINGYtUTN5faGdBL8dvC8a7VohlwKI05SZ9Bw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793366551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wDbS/KENWLlu9JTjg4GkcGMa8Vz0Lw2ntMasExna5uQ=;
	b=VbEhQRIc0fPFfOT/SHoWU9I9LoaakUCqBKUFIo5DJcYRKnfDhC/+FJZEByAdTcE5ppML
	 /Olmjvx7J4p4F+2WnZV0JOBIjz0qcW7zJiBoz2YRICUykxyn+fQ5nG2cq2TlnwiDepzhK
	 N4ZDJQKwSylASeD8aOfBSuQpeWA1G4yYDflrj/HR5blLApeLbmWbjGERsojPuFmOT+4bl
	 YbfNtoRDnj068Vbkmxb9YyrLlrEIheKIqS9q2v5F6ZYvvNpKPmJnlyiAZwm4hWU5Evs/h
	 x4PrLLMBNxPC8BerfxDL9+HmBrGwZEbU3f4gKDsZW3JxaOd7l5gO2F/hmvcpfed94Pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=PFFHII5B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E0E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7E0E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=PFFHII5B
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-679a2b5fe87so533710d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:22:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793366548; cv=none;
        d=google.com; s=arc-20260327;
        b=Egi0S7ZxHrqYXU9kUPWyFVOB8MlSUK38miFqQlypi4q52rxyhMG7UPhrJhR3ofDe06
         GGKC8kH4j0qyNZHTmWDkt86ZRlanfq5SgR9+pHuB0fhfYJeUA9Q6serNAdwwz7+zWRr+
         Cm0V529+pJqmvfIedAzRTzO+bWSB4iMynMilpZO3+p7pcmUFxEqzrnAkNaGLfKi2eSJc
         65aFYFZ9lq5WLRYKJjzBVQAtp4u06T0zie5/qr3/oQYjToRDhbaVYSAyi7FRdZQ0jwAJ
         qMlc2vjtx2n6le21OlGeW+G/CI58Tl6i2MkyL5DuIT+pOSsT2+z44zWThK72dQijYngz
         rnJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wDbS/KENWLlu9JTjg4GkcGMa8Vz0Lw2ntMasExna5uQ=;
        fh=wX96WYFMErR9YHjYjQ7JLQljrycYTU9HbwVUEGjbJqQ=;
        b=JtsmRKtg/GxxTwam9BP5SKN4y6BvjaruJQBRfs7TmY8IrZ72M0Juh02Ip/a3JQksxM
         9LjSRklK0p1YOE00ek50qSrU/gA/QUCPwH7X8oWQPcNXGh30DqolgrDgwJIi5HkuPhNj
         2dn+tUwww1jaWtCg3nqLOP+Etnopkb1RmmTSHU4GSrXUCWw3yeY5F4dIKDReBukP3gQ+
         hWtlWZ8Eyl4v/1f/56BW6FatHJFVBJ+S9XsOjhWRRSpkmtInjE4sIByZC9Csl4s+65Nl
         0W4E9TvB/pXNJek6i3qsMPIGQBitcHabVlbllNf+TqSlJwI+PG6jAtwo6Fn94/qUe357
         GShg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1793366548; x=1793971348; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wDbS/KENWLlu9JTjg4GkcGMa8Vz0Lw2ntMasExna5uQ=;
        b=PFFHII5BxiVSfubs582dOHaqArRLaVXV1GGLOaYmarCMKjAY3gqXC8mHth9zsDBRQb
         ZWCLEjMZbY4pSyXaaGyJCs2ty3rjSa6hkzw8rwXyWNSxywTsyzH0sniGu52dtSD4k0m4
         uiezpq6AAwU4VMPjytD1nY49bybrnYMvBVjew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793366548; x=1793971348;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wDbS/KENWLlu9JTjg4GkcGMa8Vz0Lw2ntMasExna5uQ=;
        b=TTR/vAzO8fRVx0LhNvtrLOvQtd7tzF25WbwYlOkyCWkMcd43X3PQj6grua9tgwQR6y
         Cnnys0ebkm8PPv9l3Xh+7K1tzUKpgn0XBO+29Ed0PXBUJpGXJcCZSIBpSzZxjmOkdLT4
         zME/2hL4xe1bBHYWEvWo55fe51T6L41yAR5QbqufSJ/X9zKYrPGw16CxdbweAcvXLToY
         7Ba2H1qY596wL1ejmyRrKCHRnGZnu7jcDBM7i9AYucO0thjnIL1C/18VBkf1gop4QRuc
         RbPPcLPOB6aQHi5/wwXop+gE7Q0S58pV79/gKwv3Xnv0uSTeAFfOzIIAErpNTC0u6B8M
         vCNQ==
X-Forwarded-Encrypted: i=1; AKwUvByjwgi1BZ2qdwumKpJyUO0Y4ziRm3+csN6U6/9KYZcEj5CarQlIiImN6h+0OmqmLp1O0YqSVIFhyLqskr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPdkP3eDr4NiuVj012Ggj42o+v0trF6yLsiTaANO4PuQBbFmEc
	12ukZNLYdgYoajQRbzHO43Ws9Fy/9U0gzA0jnudLcMwWYXwVEszL4W+1sHuONNaENFu1tXdUL4b
	BFkE3qpYSZ21ny7otc5scXtrObpgQddbA1tp/Y8gXNA==
X-Gm-Gg: AYBFou08Nwf44hIyMsmVIs+BTyR8Q9IcsYu9cEAJg0WMYkRypXkmzgshhCm1/mzszD7
	AzXD38hdqEwA3M9luCTDfgBh+JzVRg4fjpjBY5ik6FSEWyFzw50dPYgy8Nsb738na+fl2kXdlok
	6k+ncbw9yeKN+NoC/RlUbRKfZOGv6Pysdu7pByE2WnLoCbuA7trELWnywEO5DvLRbOPdMEsBVhp
	GJNB3FyICGhi3AItFjnT1aVRkiLk2VuSEvDw6JGzvTMwBb82p4e3u69KG/kBq42K+MZ5jeC5vf1
	2KasqHLUVCKM3YJQ3rnoL9KKx0iLIio3RQ8FjevHB1zkJlB9+A+yIlkzWlPlCVsTpRBq4+BUvM2
	shg9KQeZMIULBxDTfi2F0gTxzZRIsTJ27KAvLUWsdORnvXIKDHeuG2W6xP4zXbUjUQwY/dw==
X-Received: by 2002:a05:690e:d8c:b0:679:91be:2aa7 with SMTP id
 956f58d0204a3-67ba4f54999mr1158346d50.76.1793366547261; Fri, 30 Oct 2026
 06:22:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928075237.3055101-1-irogers@google.com> <20261027231513.816148-1-irogers@google.com>
 <20261027231513.816148-9-irogers@google.com>
In-Reply-To: <20261027231513.816148-9-irogers@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Fri, 30 Oct 2026 06:22:11 -0700
X-Gm-Features: AclHuK-iiL-Ld_wXLssW-sUHXFNxuacVIP9_dp_rieEmV-QPdsLDk7h2zP4f03o
Message-ID: <CA+w=M=QyQLD72nrdHMoq+FOkbhkJ7c_5xjm3j0NEbEq0XJRUNA@mail.gmail.com>
Subject: Re: [PATCH v2 08/18] perf symbol: Add reference counting and DECLARE_RC_STRUCT(symbol)
To: Ian Rogers <irogers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2026 at 4:15 PM Ian Rogers <irogers@google.com> wrote:
> struct map_symbol ms = {
> .thread = thread__get(list->ms.thread),
> .map = map__get(list->ms.map),
> + .sym = symbol__get(list->ms.sym),
> };

This fixes a real bug and worth it's own patch ahead of the
conversion series so it can go to the LTS independently imo.

Since commit bffb5b0c0976a ("perf map/maps/thread:
Changes to reference counting") the temporary map_symbol in
merge_chain_branch() has had no .sym, so callchains merged during
collapse lose their symbol. With this line, the default
'perf report --children' output changes on recordings with inlined
frames: a line like "|--35.41%--0x55566d988a0f" becomes
"bench_sched_messaging" / "group (inlined)", with different
percentages.

> - frame->sym = NULL;
> - frame->sym_name = pos->sym ? strdup(symbol__name(pos->sym)) : NULL;
> + frame->sym = symbol__get(pos->sym);
[...]
> - if (frame->map)
> - frame->sym = pos->sym;

Before this patch, frame->sym was only set when thread__find_map()
found a map. call_path__init() stores ip = 0 whenever the call path
has a symbol, so for those frames no map is found, and sym_offset now
returns 0 - symbol__start(sym) instead of None. Returning None from
pyrf_callchain_node__get_sym_offset() when there is no map would keep
the old behaviour.

Smaller things related to this patch:
- call__parse() no longer records a call to the same function, so
Enter on a recursive call in TUI annotate says "The called function
was not found".

- builtin-annotate.c now takes a symbol reference for each block_range
entry, but the process-global block_ranges tree has no teardown.
Patch 15/18 retains symbols with a refcount greater than one, so any
symbol still referenced by this tree is permanently ineligible for
shrinking. Could block_range get a cleanup path that puts the symbol
references and frees the tree?

Thanks,
Alireza
