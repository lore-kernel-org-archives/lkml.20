Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621752;
	b=nC36oHMzyo6o+3/mhJy+TurHLocaKbRrzi4y5furag9A7Fki4aPzqEnzjTYzG8z4BuIm
	 bOGLF53q8Nq9xV+KfPYvge4O5dpNhZn3kF9WxSW3pgP/PSYSdE0wWV6covOdG/rUHQRGE
	 UvJisJmJjFcqU8f8LLLrxTVf1WdLafHU7AO8/0FgqGF67TSbh55t4xekI/ww44ufDAdbR
	 6wKCmLme0wv0cKwTZsjIlRW7e1nYqbeSVbF2yTUBTv/VU+vwTQDIGHFzqmsD5iT81Kvjo
	 DpFqTzKT+dD8anGmHrwJj55MJCpFlb5tROn34vIhUeSU6YT4108FejtXKqB5zfLH4rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oer2FEylh2AuHX11Qb8KMHS0ZlqBiWuym9WiBTameTg=;
	b=4dED3u9m/eUQawm+smPLIGicXFa3fi6GwfWVlsUlfGhSGEfNtEdGNiiiVXqG4Pnq2al3
	 c6bQa5ePRRiQRBciRLex5b6E4Ij1CCO1hXwtvTDim31ZWBs8nxJT+469xHftJhbcLoNXF
	 asNZothYkRbQ579bFO5JKy2ChkjkBuZCC6NOqKGT2ILxl00ePKGhdQtecAkLNXzQF9rer
	 42TBpObcAvObwNLlOTH6/cElqpN36ykA2zK0ZIjTSd/u55hA2jjo+C25BuSu5XPveDSJm
	 EAwuD5V+iaPVytdea24C+X/mGTbaFX23uz50Nr5XE/9DyrIjz6S1rVpUmwcO8WwZT9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gvnO6Qr2;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39D360A3828
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B39D360A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gvnO6Qr2
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so24209205e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621750; x=1794226550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oer2FEylh2AuHX11Qb8KMHS0ZlqBiWuym9WiBTameTg=;
        b=gvnO6Qr2RYy5zQZT176OT/G2HVWIFwlXQzUK0wo4atjCzvz9E/z4GfaBV/6Il8L+OZ
         i8E7Lm0kFrsJcaKrMqvpGLMiTBZ2zvHVGZslCK3GlC3WrRSg2rn1Atmz58qDexatGiSl
         jdQY2U1LDfifRT9NUR7UPxFrT2DfOrL7hZPI4+FdOH/D8wOs/ZxP1JxtDfiUqXPjN1ZL
         9SHEZ8nP2o1Ecndpf7z68kI31CgVGPfj0kpckDpu0WycpRf+z3FMRrlByLcnFLgMmvHu
         kONwPH96y2jNPhcSLhgch7XLzK17ZbuxJ05/YDbDNBaFsYFPLTeJiWns7GEb7DXy+ZeR
         UK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621750; x=1794226550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oer2FEylh2AuHX11Qb8KMHS0ZlqBiWuym9WiBTameTg=;
        b=eyWw23RweY3DEyMxflk3AWsbqaeeqhvWb3w8Wfcp28He7I7NazkEqemtMLiuxwomTY
         y1iRS8crxWHdSQ1fmuftXkPh6H9IfvGJOZOiTJYXYgMDBCSJOymgErVoyOckur3YXxHC
         mnRdC9LyrelAVrnZ7ZLDQb2j/XTPVASk/mfpgg0Cxmh4O/LY2XwaE/7tFktr2We3laXd
         j/eab1Mr5N71kUmFHTfnmQyMiEARB7QpIZkE3XUZDs2IBTXypDF0ODHwVdv+H1VqiR/O
         UpFreVOSYGTnwou67X/bxYp4fWHKBg6gN5BLQ+DLsGbIXcQ87JxO789sPHUZN2yTbnki
         kpUg==
X-Forwarded-Encrypted: i=1; AKwUvBwH227YxJC3IVWBLfxnvyevmPnLQgEZZC9vUJOqAMtzNTML55I2Lj59Mg0LkBcUawH/uEfkUN+3//kyPxg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqHPEDW01U3pwwtdgO36/rLLPLg/OQjP+R1v8Re+6fA308NmoQ
	Hdwiea9BVxyDj9qYv5PBHHLx7dtJG3liKcGZm7yM1CCLiFB272HZ1ksKfv9sJkiBe4g=
X-Gm-Gg: AYBFou1FZsovAwqsGkehLTmW4W0CdGmgqqZAfO3dc9TkjWJX5PAuBB23c5AHErRbHho
	IXhrhZXP31OqEV2jItJjvomXwklXBRe9sYYHw5WFcsMvZU+VcVGtHZU/sfXuUxJDTjlQdafvQTF
	56vLJxPrvCS7iX2XKnsZncYvdSU4z8dW/3wK2Z4ND2BUWX7BVyy2C88reEU6/EnR09SXPNWuFWH
	h2AQWwUSGx0loO4ZYraga+FkGrDpdm8Q37Pn8vPYxVMKflrbTHBn5d6i+7zcPfQRg3ABJTn0s2D
	FerRvnrg28qXHXJQYWXXUVVEpjeniyUSgufef5xCd61Wm72rfBl7V8OS/QehtrfChOhPOfSzwYE
	WxjDz6mDgDIVkW8ZFZwej3kMKWuRYb+3c+BpwGHxIYmkSpnsPRvxzkV/ijdKcBpnVhqTYuscssj
	h0s0sVVsxnjYXpTuvW/gL9Csdsptv1um+MTC+iCxsoOFEz0v2nz8i8nGxwTVKaw0e52FY6KfkBj
	7M1zEUhs7faUgM22TFrePpkONQNTbkMUiZu9cmZaLIgUxufLGmwxJ4qi8jHXRS1dyMbpwFiejPI
	EF6f8a7OOvK2aFJFYmly+XCVs++MfQcz
X-Received: by 2002:a05:600c:4e90:b0:4a4:f48e:78fa with SMTP id 5b1f17b1804b1-4ac175669e4mr220866395e9.12.1793621750147;
        Mon, 02 Nov 2026 04:15:50 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:49 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:20 +0000
Subject: [PATCH v3 06/18] perf cs-etm: Don't drop previous target for
 kernel samples
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-6-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

The branch target of the previous sample is used as the start of the
range to disassemble, but if that sample's DSO is "[unknown]" then we'll
drop it even though it's useful information. This happens when recording
userspace only. Save the address earlier for "Trace On" samples, before
we get to the early exit condition for unknown DSOs.

In a later commit to change the default timestamp interval, trace will
be collected that triggers this issue, so fix it now.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/arm-cs-trace-disasm.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/perf/python/arm-cs-trace-disasm.py b/tools/perf/python/arm-cs-trace-disasm.py
index 1812ccaf4b20..5a7daf927bea 100755
--- a/tools/perf/python/arm-cs-trace-disasm.py
+++ b/tools/perf/python/arm-cs-trace-disasm.py
@@ -52,6 +52,7 @@ DISASM_CACHE: Dict[str, List[str]] = {}
 DISASM_RE = re.compile(r"^\s*([0-9a-fA-F]+):")
 DISASM_FUNC_RE = re.compile(r"^\s*([0-9a-fA-F]+)\s.*:")
 CACHE_SIZE = 1024
+PERF_IP_FLAG_TRACE_BEGIN = 1 << 8
 class _State:
     sample_idx: int = -1
     source_file_name: Optional[str] = None
@@ -252,12 +253,12 @@ class TraceDisasm:
             print(f"Event type: {ev_name}")
             print_sample(sample)
 
-        # Initialize CPU data if it's empty, and directly return back
-        # if this is the first tracing event for this CPU. This must happen
-        # before the dso == '[unknown]' check because the initial
-        # CS_ETM_TRACE_ON sample has ip == 0 (dso == '[unknown]') and
-        # carries the starting target address in sample.sample_addr.
-        if self.cpu_data.get(f"{sample.sample_cpu}addr") is None:
+        # Initialize CPU data on the first event and whenever tracing resumes.
+        # Trace-start samples may have no source DSO map, but carry the next
+        # range's starting address in sample.sample_addr. Instruction samples
+        # in the first range also have TRACE_BEGIN set, so only check branches.
+        if (self.cpu_data.get(f"{sample.sample_cpu}addr") is None or
+                ("branches" in ev_name and sample.flags & PERF_IP_FLAG_TRACE_BEGIN)):
             self.cpu_data[f"{sample.sample_cpu}addr"] = sample.sample_addr
             return
 

-- 
2.43.0

