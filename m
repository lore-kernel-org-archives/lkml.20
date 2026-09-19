Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAAF30C35F
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789843039; cv=pass; b=Ei6jx425Nv0CdMiCfg7dftqknSeZ+YJYLK+9RYZ+DTpFfhJFCpDU0VZtfSJKD8TrHKBOvcDFS5bqs2HPJnCzISXc4O8+8aTjIYj8qrKMB08xs/Zo8CXbS5FeOdpuiti6wGTWisFpbXBqfQA3K62XAsP2BXMDvDLptVe2vHbOmXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789843039; c=relaxed/simple;
	bh=lxHFstBQpQ33imEsLlkA3g02TZX06v5LaHxiPA0L27Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WE4DuzBUWRrdivrrP0/pSM2v2ThZ2Y1gg1S39i8P6If7CFWVZQBcb/UbYjthk7tWVFySa6La+iw6bjdKARokSn0SQoqkZnFIStuhqFBj8b59pWRXlH7Km24QpI8G9l/9a0PNzhk6I/6mLK76ZK603/83j+biDhJexIHmOCz5GgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=6qt8RmBn; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="6qt8RmBn"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43db0c16so13567067b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789843037; cv=none;
        d=google.com; s=arc-20260327;
        b=lvVucsXW42GgBdHCbQmVd8swzJqpTszWFgyP1jrikc8QcAeDAh6WrGLR9C0ywMdpkd
         hciDNr72E7Mk+hiMvovbwMSlBIIFT5Ubld0/udK31YG85vNFZkNTbjlfnkhenhvrFTzp
         w/alwTDPAj0SuCSfmhEOg2IHZwO0+yIu+FMwrygSiAlD+XhWs5ONu6Zc/9/jYI6VRNef
         P/i7CHOFKHh4v7pjyZAQoMazFMJQdpvB4OsI0CK5fs684PhRPEn12hkqp6CIeTmEM7Uz
         SNiqqSqQFZpPlvPyRFV7KDFohbGJAujlO8BiJsNPYdXfrYJepmZXI/Ons2xKQsHz6lGs
         m/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E59/BUz5Pi6Dr18TnnWWI0RkEyqCowN7qMDJuzGo3+E=;
        fh=GZq5G18mxV6GWc9mdUf/iMe07ATCAQYoj55g5qHWjlo=;
        b=WrvCVrewtHIWLyTENtLQbbdIb4U28QIxQWU4hTM+vIFOeRF8S3XdwNXhibbho5HwK9
         n+r5Aa+oRuDI4ArR+FXCIzOxfVY6orjyO78YhyBhb07FlZgqgrQHx6g0/vziA+mbxe0L
         sUodNF+0zA3wS/OtOvFPOtCkZ0UrpB/S5aYPXxDiJdseWKsdYSHssaoy9seOp8H1MFUH
         Tg/rygRVPf1x8HDsMOjCUxXkVOseLN5lV2EQgX1gZdSoRdWJjms/wBdaWgumxzlDx3xg
         jtViEcepuTSRGseKi3ieccAxAsMD6frlhxlHlmns1zv7GTIq6c8lcKCGcyisTgo/h1N3
         HvjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1789843037; x=1790447837; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E59/BUz5Pi6Dr18TnnWWI0RkEyqCowN7qMDJuzGo3+E=;
        b=6qt8RmBnZ+P/o5Zl8WXueDMbV3LJUY4gWTLryJP6kokQdBfRY8woZo4pZ21IEgPHeO
         PTyRIzdngfUDCKZxPdjGnuJTwZr/mws9db4Xrpv0Grw8evXEsNbEU3PPciBpS+1cYJ4O
         gAYGFxoEKAipwTJmYh1N49zgqz6PHfG5j5ulI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789843037; x=1790447837;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E59/BUz5Pi6Dr18TnnWWI0RkEyqCowN7qMDJuzGo3+E=;
        b=gYoqiN9JQ78mqLWeV698/XjEvZl/Gwy3XUS3ehaBFbP/cwdlRa1gCwd7vSSISV4BDA
         lm1fjmKZbsCoxAsLY/Qwbjd1gTFOIYi0tTCC+5gU8NoAn0cqJNIHtKSXu70tEJ67bIEl
         RYTP0ZPq2SaualSGfrOnjc4bRqRZ/0gKz/DnKHswuTizmyT24QSUn7Cx5KBM0RLpwPHN
         qfoK2fIS14ycj5q1X2e4QuL4Hffuz4WhKpVnKOqM+Z6r11hjN86FNhA3uXbsyyBF4Q5z
         ZlP7R37P3LaZAL7leHHugClITJ4gvmESKQeK57DyOGba0PdhywOFAHG+glDOxC2skcIQ
         xqsw==
X-Forwarded-Encrypted: i=1; AKwUvBzVBaKiDtDkAMKIH+Ft1PzdiD4xesBOW3zOLL1laigw3a567Pxqa9AX1fLg/ef13N0mAMJiEwmXFHY3+E0=@vger.kernel.org
X-Gm-Message-State: AFuF++l7dgleXOFyJyzeBQCN3Ahvfg00109tEKncYM/n2IKjey7IJKGs
	TlVt6OvV1ZZa3vKDtYZnIjOA4mldNe3B4+xhRHlSwFPHCeKdb1cfXD7sS8S/3CERLJNucyC1KV7
	/Y+ZB1U7Yu1m5/r5J9nefrMgUH5f/P8TlIQBKy+6OJg==
X-Gm-Gg: AYBFou1xha9NUjJzAh9dupVHdFTOIiCGDVX7ms4J/hWD1GUMV3v2TlSF3Q7n/sNtqY6
	Ii4f8ZCuLKi76qF5OPGWcv6JqVQ1/KiG1G95pq9lrENUsV2PThZpZ6KLrzGNrGQhSwP/HIkJVRN
	fu57Y5ZqpxxnWfD0p5aO8sbgLCzmNyZps5SFu/DTmXDhJyPSGSdscnHZ923oe3K+zYpx9mJVlre
	oQa8RfxAkc1Y4B5aoo8afOYUnDTMakh9ekxqh8DT8Z4FOZDhk9ix2Go8SAfCW8Wsc8AiJ8vecwf
	qUOtcsdsny9l6x04WZaRwcYU0t00hlycULuENofaqkmQimXRriNXV4frkcJosbKQ8viPerpmrsF
	SVqUNE88OT/0=
X-Received: by 2002:a05:690c:d81:b0:81e:9b09:7210 with SMTP id
 00721157ae682-8973314c2ddmr17556017b3.16.1789843036416; Sat, 19 Sep 2026
 11:37:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-perf-symbol-memory-send-v1-0-1d3360e21f07@uber.com>
 <20260915-perf-symbol-memory-send-v1-2-1d3360e21f07@uber.com> <aquOfdBVYlr1QE8Z@z2>
In-Reply-To: <aquOfdBVYlr1QE8Z@z2>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Sat, 19 Sep 2026 11:37:00 -0700
X-Gm-Features: AcwNN1U0eFlAdN_d2-mxK1SAeqVRyi_pr7YM7LmMviwb1XyNgrHknNMzgmeM3U4
Message-ID: <CA+w=M=S9dWAoPyjuqvErYR684E5jE8AX0p+92Abm8mQBQdebxA@mail.gmail.com>
Subject: Re: [PATCH 2/4] perf script: Add --max-symbol-bytes to bound ELF
 symbol memory
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Andrii Nakryiko <andriin@fb.com>, 
	Alexei Starovoitov <ast@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > The counter includes every symbol__new() allocation, but this patch
> > enforces the limit only in the ELF loader, which is the source of the
> > unbounded memory growth addressed here. In this path, reaching the limit
> > can safely produce [unknown] symbols. Other loaders currently treat a
> > failed symbol allocation as an error. Capping those paths would therefore
> > require separate changes whose complexity may outweigh the potential
> > memory savings.
>
> What's the other loaders you meant?
>
> I don't see it produces [unknown] symbols.  Do you mean it just stops
> loading symbols when it hits the limit?
>

The other loaders are kallsyms, JIT/perf-map, and libbfd. Their
allocations are counted by symbol__new(), but the current patch
enforces the limit only in the libelf loader. I will name those paths
explicitly in v2 of this patch series.

The loader stops adding ELF symbols once the budget is reached and
warns once. Later unresolved IPs are printed as [unknown] by
symbol_fprintf.c:40 when sym is NULL.
