Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794934492;
	b=o58uo3Up0whZHy65bXsn/XF/8hjhV9VmGPpaSmPYR0z82vLBVyvsLyOngf6n/DUwgK//
	 SBOgcIc5soZuExc9HXQp7txmlZjh8+yGEALgPdMRQslEZQvTwW4cEGBHotin7hUB+KXZO
	 QN08VvkGciXC51/+Ok9pPjSX02yQBur/CK0ZEutQDFErIufhrEHpayC73TW9wp2lPrqj8
	 HIK1o5rqzS+W6aNK85E4AsVQ5IuPIKnUFIPPtvAr3wDN6kkeIcIFfmXetlruPJQFv8Rwy
	 h2mfkkEhDbUWqzZRHyxCpRpPGUp6/ratLIZNxLMmLOLePAsAmYdEFjYv67/U2LLWqAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934492;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=DGDRp2kvtb93Toj3Qe9cR7ofTSqhSOCGBjvMYhNFgBc=;
	b=MX7JbQf0HG5zQ/MVjRCYqIxhZVDSAjP+Itwzz28hq6v9SQijmg0C7ZksVcWgZeu2ioh+
	 pJL/NIEkfRsvvgcyZmlZHL5dAUaSDGjyRsR8opBc+hzJ81fBd+8hV7/YvupneuVdfvgQF
	 MiHW70AaSR5lTHDnPZEqNt0caiHj80mU1ycE8o2V2/r+53vMNaePPV5utmMGGrCEDqAiD
	 MZB/dQeiNEchI2l458w21h0U8XTwS5UCPCR3KiNdR+FORgKLIJwMp1yEmhhI6ZLxKy8xH
	 ohhBuTXh2yHt/WumJvM0Z+Gz/ieIWMnmaLynGzj1oppJejsdfqyc6o6fbo4XmgnT5Cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QHqQsfjQ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=boSBA9BM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4F7606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E4F7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QHqQsfjQ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=boSBA9BM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794934491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DGDRp2kvtb93Toj3Qe9cR7ofTSqhSOCGBjvMYhNFgBc=;
	b=QHqQsfjQKtr9LJKCFW64WCyAfWedjSVLliUPZ1Zh85vdoki/F9/VqkoFJU0RMpBOKJ6Xan
	KUhgcxdDMnHbQ+e46iAJ/IHtsM/vGRRIYXcko7FZK0LuRPalWUoNCLyc4Och2BzsMccoGQ
	XAu+qvfJ/z8pVAoHeOunYRii3Kf3UE0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-hJSE1-YkPJ6f-hDjuqXmXQ-1; Tue, 17 Nov 2026 11:54:49 -0500
X-MC-Unique: hJSE1-YkPJ6f-hDjuqXmXQ-1
X-Mimecast-MFC-AGG-ID: hJSE1-YkPJ6f-hDjuqXmXQ_1794934488
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso417935e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:54:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794934488; cv=none;
        d=google.com; s=arc-20260327;
        b=bb2d5r1y7Lz8n1ZRPWJRRgH+gGap81mDsAmhuUgKbD6h33RW8Cm4zj6R5MZN3zKLCB
         AhsaPbC0Su2e15mxAmjiR7WVdRhyJji1PSUFcUIPV9Ln5CPuWHhhBlmJSoCMJqWE0xFb
         c9oRcRhxIVL0uLf1yKceQC7dTkj6+20/BrSouABD/mYQmpwHkZiYo5NXmo1qDa6BV/Dt
         beTcmOgxBTArzkSBTu2IflPH6+fhVeC0Sz8pT+OZbV+ZTwoIYWwULArnGdztEu5VRsup
         rtSkmtWJ47u5DbwH8Ibo/CKx4LhHvbkfja9I8wCpL/o9FY7a3EKX2npNP3gPReGq1LGl
         Ha5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DGDRp2kvtb93Toj3Qe9cR7ofTSqhSOCGBjvMYhNFgBc=;
        fh=u0e/trk4P+iZFvjW1rJgZbrg3tHzRzCFN1zHKgbQPWQ=;
        b=O+0U2mlYsti0u9k/c6Ksw7qaJtkRMsejf+GuVggo3wHChHJPaQM+TSgHm5dLpynTmx
         IUaqIMZkQ1z8ycah7nx8k4EadjT5vJ0LCS3U0ULjOSb71TX3ljYYtc+d62JJ46IuSaU6
         N5zvixf4ZajgmvIpTVmCqhcE3qQIkBJeCTRHjwOsb4eB2b1SDN0GgNCDLzvM+chP3ASV
         DPsncUFw7LFmWTMSgwnRZFw/WqnqfsY9/Gh0vMFVbHTQbzfPe8An6N4TUBXKOX612YAl
         83HTKKzi2uf+A+feao3ZZFr33uR/icLrOyyJ9Z7CztbvVGhMVHiAW0O9iCSKimSwFDwv
         /SBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794934488; x=1795539288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DGDRp2kvtb93Toj3Qe9cR7ofTSqhSOCGBjvMYhNFgBc=;
        b=boSBA9BMzgzp/9GTmKfzsDUrEtRv3AnbWstOHFz5RtX6cqce2mGNSogsMbMOPU6V7t
         t8sl1g10XuWgovp0GQ3sglig/7cekSSHrErpAp7g2J5WXMz1WjElWhUBuI6EEVR+S90z
         MS73Y2D3szqB6xm2oC4MxjbNeYYFab8+w3rtw5oh++JtxsW7LBy+sLA1o16hBpCdaUMI
         2nQ3yFkVyF1r5bcvfAlywRT/mGzOg9oWln9HDcdjFN1gKVLL9q40dEi1N7X2ZutwIRg0
         UJDxAZWIhtfjcWCHUxCrQeAyIqiKmYiNMJsSrKtOV4GTBUXrafotFydASMGtuvAItyzB
         kzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794934488; x=1795539288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGDRp2kvtb93Toj3Qe9cR7ofTSqhSOCGBjvMYhNFgBc=;
        b=zbhHY7urH2uJuVqNEeFsTWlHX2IBTF6UCabBx7oq4L42s5d8b+xcoQDpuRPBjWAh7Z
         n3AaFkUhhTT4iByeIO1WHelvzvCNcwNDWx5V8r6+rRolHk+BZL6/V8vfkeDFDmt/dHc8
         Bu4LdSHT1VY7vmuUd/OKqf1ky9atxxyzEUXO40f2DIbJ8k1dpyzcoF+mBdxFc62DYlJI
         oNJCHrkwQ/nOcK+BhEaqYuP7lm8QgBdNj15nZe6c3Qxc56l0kefx45+Q6U1Pq19qpPeZ
         1UcfJrA4ZWBy/uVKL6zpy8KlpIY+9mBWfckv7aBdS8FcUN2xHts1oybrpOTEfykj3gMz
         n6RA==
X-Forwarded-Encrypted: i=1; AL+hErHJ+yeoTb2fYpGom4fXHxGvSNpS/4z+V4zn4EJD3/rl4JV37GykQK3aI6sscj+6vh3uUrrWUpAArhprUx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aBTP9h0yyg5P1LBSMed7uwp3akTNnZ8a2rDraOE2ns+oLCvvG
	a4xxTEdYwROAzwzD2oEyXmJUESERVsQpz2Oi6vHMW+gYS8XUvT+6XwW1ppHScdMtySpOSzO8W1P
	wlzUZs8s6reRJHKj6qgYfHcdoophHwnwEeQIkaXzzrmZMf/U6B+S2IyRNXxiOx944ifwkwgMtHi
	aGyPBKq8bt6DFMqHM3xOyXT3QVghMIP6nUe+qxoKKL
X-Gm-Gg: AYBFou1FsfsYle5ULHNKOUIgG1S3nGxf8fS0p/AhGEwrhxGVc8Ll4J+jl/vNK7B/wN1
	9qZTpgiY52vQVuq7DHFrlcCPCl7Y3mqMH6ouwRMR5cn8NU5i9MBuFzYnvCa1nSrij6TJg3A6/X4
	RNikTQx1xPbB3J6mfpDqB7d6/O3PHlB4YnpQZ31C8It9yoWFM1ncKn9OJC/mpjZn4WfHTZW/Xpj
	qUvT9grWn+YGUJncg==
X-Received: by 2002:a05:600c:6986:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb6a2db52fmr178231545e9.0.1794934488493;
        Tue, 17 Nov 2026 08:54:48 -0800 (PST)
X-Received: by 2002:a05:600c:6986:b0:4bb:6a2d:b438 with SMTP id
 5b1f17b1804b1-4bb6a2db52fmr178231035e9.0.1794934488110; Tue, 17 Nov 2026
 08:54:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com> <20261107023917.40606-9-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20261107023917.40606-9-himanshu.chauhan@oss.qualcomm.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Tue, 17 Nov 2026 11:54:35 -0500
X-Gm-Features: Aa3M54roB7QDb-4IN47SMi2aVS10SiwVpvGI_zdHUzKl8EZH9k7SzFLp96gzPDI
Message-ID: <CADRr4bc4v4Uaf2_1ZRFJXoru6a=g+PEYgKKK-vEzXgmV6bXqPQ@mail.gmail.com>
Subject: Re: [PATCH v8 8/8] perf tests: keep bp_signal memory accesses visible
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, Ingo Molnar <mingo@redhat.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 9:40=E2=80=AFPM Himanshu Chauhan
<himanshu.chauhan@oss.qualcomm.com> wrote:
>
> In the breakpoint signal handler test, a breakpoint is set on
> __test_function. Keep that helper as a real call target so the breakpoint
> has a stable address.
>
> The test also relies on the watched variable being accessed as distinct
> memory operations. Use READ_ONCE() and WRITE_ONCE() for those accesses
> instead of making the object volatile, so the source marks the exact
> operations that must be preserved.
>
> Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Reviewed-by: Jesse Taube <jtaubepe@redhat.com>

I personally would send this separately so it's clear that it should
be applied to the perf tree.
Thanks,
Jesse Taube

> ---
>  tools/perf/tests/bp_signal.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/tools/perf/tests/bp_signal.c b/tools/perf/tests/bp_signal.c
> index f580ba7486b1..2e4f7747d32f 100644
> --- a/tools/perf/tests/bp_signal.c
> +++ b/tools/perf/tests/bp_signal.c
> @@ -36,15 +36,14 @@ static int fd3;
>  static int overflows;
>  static int overflows_2;
>
> -static volatile long the_var;
> -
> +static long the_var;
>
>  /*
>   * Use ASM to ensure watchpoint and breakpoint can be triggered
>   * at one instruction.
>   */
>  #if defined (__x86_64__)
> -extern void __test_function(volatile long *ptr);
> +extern void __test_function(long *ptr);
>  asm (
>         ".pushsection .text;"
>         ".globl __test_function\n"
> @@ -54,16 +53,19 @@ asm (
>         "ret\n"
>         ".popsection\n");
>  #else
> -static void __test_function(volatile long *ptr)
> +static noinline void __test_function(long *ptr)
>  {
> -       *ptr =3D 0x1234;
> +       WRITE_ONCE(*ptr, 0x1234);
>  }
>  #endif
>
>  static noinline int test_function(void)
>  {
> +       long value;
> +
>         __test_function(&the_var);
> -       the_var++;
> +       value =3D READ_ONCE(the_var);
> +       WRITE_ONCE(the_var, value + 1);
>         return time(NULL);
>  }
>
> --
> 2.43.0
>

