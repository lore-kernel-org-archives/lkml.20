Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794511490;
	b=GFRYbuQidjOmB73iiZk7EA54FGv3yIKMYpiPRu/g7VQb9NRVH9Ip/0Y8EfFTDeBs5Dno
	 dUlUi7MY3OVNs64AMYxK6PHun3f1rTgE5EqMi15I2TynOzC+AYe/4HaBIbIiKbfwOWzlO
	 zfJwDR0iJpV9A5QhBJD5Tsf1LNFpyjn5RQFx/jO20rVN/zZ6uDNuElYKB/S7/s13m7FVR
	 nmAPFEUd/F02KVTNtVp5W3otoTyUI/9NRD9bkQzfXxxbAXg8LTWAa1hZU+xaU8aIezM6B
	 QkvZsJi5Hud3qU5T5L5HDO0fPnZMzSUHjUUskwuHzjuPPUZO9tJxyGKh+Uv1XQlyXoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jlygkzaiytXLTgXwrjQaRLpn1zirXNFAaFt+aJvGZ9Y=;
	b=CgJW1B12JhMs7sttLeZi2KW0QfmWzS6XoCOaTxK5tGjQQqzyx20OEpnQBp+E5I2ZQHXR
	 X0ICRpD6Y+3TcUOZUPdHQTl55RrINtlHh0ETk5J5kzH+/cRPEHs07wb3tlB7W4g8I48Yz
	 1a/8wg3mPZ8VmbQyjry4Cx0DlekL5ZE9KYwvu+Qn3Gagp9FgpTIiThn0eCQ1zc9tZAgdf
	 hHNNjlB80I+Ct7J8OFgmi21bh28ayFh1WdJB/ygfTcwDFHSokpSzwP+KQFutPcTYdklBh
	 BZtY5q5Ywf+Di3DLEZvjZ8iqcZ3FbtyZWQipGnU2F+0Tw/qjxR90rskhS3JoQIgkYHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b="Q/DFsPSo";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A34606A895
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A34606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=Q/DFsPSo
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-89a837bf00eso4090b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:24:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794511490; cv=none;
        d=google.com; s=arc-20260327;
        b=p5Jo0o1ZKMYhXI4D75kmC21jtyrTNJSAaHtTaoYtIBsDRrYBNXVNWC+CBM+9iuAl2A
         YHWQtXvbx43gu9zLyFjxZDgPCEnWHrB0fjfmwIh7oZ2wTrNF8Bc7SHejlRVZ6WEZiaUS
         N2L6iyc9vW8Du+EEbTs1aSSKn8VUAYb9bX/PIYbnmfl04rAic1l5yhg0Wxq4eZ/5hqcA
         dGPn+YVD++5EMDmGoly3tP/p/8JeHh/x/7iLYm+X3bOmOcN9YfitlC5mpqs3zBy2GF9S
         aUuIUm28+EiKKH2I3dmstgSAIQfWzTLIjIUrvHFbrbbaImihcykqq4i42n3FsYobq67g
         gWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jlygkzaiytXLTgXwrjQaRLpn1zirXNFAaFt+aJvGZ9Y=;
        fh=lPjgrbPAaZmdXIfS3ztJBl7gIGqUJMXD65AzmUeYdTw=;
        b=R6lADjQcODHPYZrJNrldB24fTx6q62Fd9UzQfU5Zot1J+gw91gBiHBe3MtKX7zTcIF
         IqEXEp41DZbkX88voaih5tJXk6Ne5JpQhgMfoe1xqKSvqoHUXQYBKWxehoyLuRWHpu/C
         DrArR9eanBl8NStbQ7pytSQGFf+a6d2M5RiGWFOp4s4H4I5MgMLO4MhTbyjF05qSz+Jb
         vq/xEbeP4CBGkqtbnCCr5gDb9ReYZaXqQrqTHVOxa4Sbtx+jPWKeOTP0sN0FihW/hYeq
         /RWRoGqCL/I0LzX6wDw7IXkTRfZvS9ScG3SDemiwSP3AVjT6EsbAGP5Umu8z7HyqGv4C
         Mfxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1794511490; x=1795116290; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlygkzaiytXLTgXwrjQaRLpn1zirXNFAaFt+aJvGZ9Y=;
        b=Q/DFsPSo3p6WPNPOJbfbn+zAovgMIt2LHYdkaObz7LJ8Nml14Q/76bs1yDpzS4P/xa
         Q1ge58oNtMobrp9q2jbleLqYoYC08e6oymRZWtbtLcx7NaqHdy4yYcEqikUV3OzQIlW3
         niqyn7aHUYEHOalWFyWsKWrIyTNQXvtaiP+FDaPimg1M1vtUjEMhPMK/fJFwH+E2HUQz
         OxqodavYfYcaKH3cLGEuQh/olubLK0fDLDR+AHA0jglDcabD60QMnw3IHVpgH6EQeH/5
         9ke12qxsMmEgG5sckHRM4O9rlVbp2PkPODTRFfeBheli7EiZ4p5he1XKTRrgBZ2u5SCg
         06IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511490; x=1795116290;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jlygkzaiytXLTgXwrjQaRLpn1zirXNFAaFt+aJvGZ9Y=;
        b=VgYdus93exU4Bj2R60lrEXKB0KrQUIV797FBNBPUjCT3WM10kp/WFuILSta7FUdUv1
         tqbaRveOLuTDJ6vr1K+nmX6FwLJ+RmIStuv6dbSN9vUmT7dBjpQOuKDY37HaJXy9ZGxX
         nLfEI0LU77ukQ5EnEY26pCdjNHPGyC1jQMXkJC613muE2npor5GlobzMJMaOrGTc/Uo6
         MXWty+A3IwOIYgFp9NxLEMXIr4O7pKFZ1x230fwNn/CaRaPNa/uDt59V/teq5ycN93LN
         wIJIpCPF2rtQV5ZR5433bIMqvZVo/FpIcjXNhhBsyDx4Z+AS8bfS6Hi5DCcxCXjyDwj6
         3MqQ==
X-Forwarded-Encrypted: i=1; AL+hErHDaBU0h6dTQPMcgwKo/pU6gMoyZzAW8qv22ro4U7SF9nUzRSR0sVuyVQTXq+dN/1fefbxMxfftPHqWPbE=@vger.kernel.org
X-Gm-Message-State: APuU4Z86pzXTx0mVonmPysAE9NbqAxoRSIHJsNeXwoukvOoTREQeUu91
	6wO/6tYpvIAdJDeYuaG+XYHe+9O/NMhheT+PjmoIqr27pd+iwvjluX2tKYliy3SBspqZCny876q
	T8QlIe6stb0UJsRkw6hGAAbpqL5bx0IIkJYY3sb2EHw==
X-Gm-Gg: AYBFou3IrLxM6Ex7yE1p2CqT1yTDJghncnbf3f/XgxIu5TXrxe94sQEo/oc+jSArLGa
	1LSNq+/bbuG/PYZx94Kj+PWUBILR4aHoIOej4BKJ736GuX2AI+38GiwoK89MDHeEuofsSzmLqpW
	42SqdhWzGDiSLhWrKn8fUqQRK6s6oGYeq9DPF+7XpLKNbtyUXkZdZ1kC2tp/7F9iEDgLn8yyVm4
	KFl2CNoRd4duPlHNI8nGMP8U715CtuEyjSQL5QK9WP6ZIfPIEf4uazRhd/bLZ8W7TZ6YWNUcAFj
	Xxh08FBY0Im+A7OieH2uMRu0LZHeEQA5LVQHxnLtFEBVc07vQqbsal1Xo4TIXdFnCz5kfgcr4Pn
	sDia6XtBdNq7xKqO+WQlDbTXNbIySPec3xw==
X-Received: by 2002:a05:6a00:3d89:b0:8a0:92ec:5f1c with SMTP id
 d2e1a72fcca58-8beaf2a4d6fmr712148b3a.0.1794511489473; Thu, 12 Nov 2026
 11:24:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-bpf-preempt-v2-r2-v2-0-9d8f6b952ad2@sentinelone.com> <DMSU4S7392QQ.357Y29RMDZ8BJ@gmail.com>
In-Reply-To: <DMSU4S7392QQ.357Y29RMDZ8BJ@gmail.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Thu, 12 Nov 2026 21:24:52 +0200
X-Gm-Features: AclHuK-ZDEUJCai-MX-vK2KnyCinEohrdaF3lHXe5jxxeIvqToo4i-MZUdaZeSs
Message-ID: <CAPnbwjrBnhnJt7BC-QBEJNh9Jp3bP7WXVnT38mLv9txFrftcZA@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH bpf-next v2 0/5] bpf: Check recursion per
 task for preemptible programs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	JP Kobryn <jp.kobryn@linux.dev>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> The link walk doesn't look too bad,
> but pls share bench trig-fentry/exit/rawtp numbers.

Got the numbers below, bpf-next 0fb18ce8a2e9 with and without the series,
x86-64 VM with 4 vCPUs, lazy preemption. Each value is the median of
10 runs of:

  ./bench -w2 -d12 -a trig-<x>

  (M/s, median of 10 runs, min-max in brackets; non-debug kernels from
   the same config; bpf-next #2 is a second boot after the series)

               bpf-next             series               bpf-next #2
  trig-fentry  39.71 [38.75-40.43]  40.35 [39.74-41.12]  39.75 [39.10-40.08]
  trig-fexit   35.67 [32.67-37.56]  36.70 [33.26-37.79]  36.56 [31.69-37.60]
  trig-rawtp   41.07 [40.43-41.73]  38.15 [37.78-38.87]  40.30 [39.86-40.92]

In these runs, fentry measured about 1.5% higher throughput with the
series. The fexit difference is comparable to the variation between
the two baseline boots.

raw_tp is 5-7% slower, outside the run-to-run variation. Its run
context is a C local in __bpf_trace_run() that grew from 16 to 32
bytes, and bpf_trace_run1() now zero-fills more of it, realigns the
stack, and checks jits_use_priv_stack, which a raw_tp program can't
need after patch 1. I'll try to trim those and send the numbers again.

> Maybe we should do a per-task array of progs instead to detect recursion?
> It's likely more cache efficient than link list walk.

I think it would bring a different set of trade-offs rather
than a clear win:

- I believe most of the time the chain is empty, so there is nothing
  to walk and an array wouldn't save anything.
- A fixed-size array would require choosing a capacity and an overflow
  policy. Its setup cost would depend on the generated code; the extra
  stack initialization in the raw_tp disassembly is a reason to check
  that cost.
- The chain reuses bpf_ctx and the existing stack-allocated contexts,
  without a capacity limit.

do you think it is worth doing?

> A prog with a scratch map of its own is correct today and
> that's what plenty of production bpf progs use today.
>
> This patch set will make them send corrupted events, and nothing counts
> this corrupted events. Today, at least, you have a miss count.

 agreed, can we consider keeping today's per-CPU guard for
 the programs that depend on it?

- programs with a private stack (as in v2);
- programs that use timed may_goto;
- programs that use per-CPU map values: lookups, bpf_this_cpu_ptr()/
  bpf_per_cpu_ptr(), and bpf_for_each_map_elem() callbacks;
- programs that can reach a tail call, since a tail-called program
  skips its own guard.

Only the remaining programs would get the per-task check. Extensions
(freplace) of raw_tp and tracepoint programs still need a rule.
Preemption-disable, as you suggested, could later remove the drops for
the guarded programs as a separate step. The commit logs will spell out
these trade-offs.

> With the link list approach every B gives A 250 ms more:
[...]
> So the promise of may_goto that I just fixed a week or so ago
> will be borken again.

right. The proposal above keeps the existing per-CPU guard
for the relevant programs.

Thanks,
Mike
