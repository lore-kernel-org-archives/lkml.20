Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879129;
	b=SYiVuLv5Xyn1bQwH25ZnW0KNOEWfyxTkOZQo2hkdNJ1dxh+I+h7kLraP/QxjUqN01ZgR
	 o6ukdGTo7HIPMQOTy6H5NHbSbvQwWNxXTqCuxSipbnm3PPlt9tSjkSMizwtG8gzrA4NQW
	 B1RrEg3yTDsfqcXLszIBd4yFlyg5DPyADydElQYRDECtI4a0eeYq1XGXIRPu9ZOlUSW8m
	 IzUuFcpONSQKJVpySjZtzYHiL16TTvTktYTW/76ty3SNpCEGSjJ6qNRVScEzScR1hxOuE
	 RN24VJdBY9uAOhIlSM/u9WVbVfFVRirtPYw08c9GcyhwwOLPj3I+c7hdJdLf4TQ9JLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8nO8m5nI3CkRV1ykmT+uymlgm9DyQtIp8KkHOyYs+CM=;
	b=kFxUqF8KWEsznI9rpeshrtLw+AIk30R9t4SJKfjlThdrDn8GwB5bxsxZ3MUixBTVKLVR
	 UJnqXVVlCz8lo4Kt+TY5yr5CC9zOJJ+xRp0SV1mpG6Igist/U0LlLIHxdqKtF11qDEwQ8
	 BJZX26b46/vcHguXA0o4XR1+rElZ0jpRdznIjOEZPFlmxWsv83ouQUn1gVyDA4b6woDkM
	 N6JgGJqKWZphS9jHlsPRRYoTvOe1zgzluxV4WNd/1NLcm9u0o1it1iqzKplE5hLrIMpWI
	 knZ1NkHXF8HvhtUUV2PUaFce29e35gWtKF0Iv+OuIGBAU7CnGCGbWycJjr7ernVDRVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="pyHQL/h/";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CC060A263C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8CC060A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pyHQL/h/
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a210470b49so13102875e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879127; x=1794483927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nO8m5nI3CkRV1ykmT+uymlgm9DyQtIp8KkHOyYs+CM=;
        b=pyHQL/h/1OccjhzKL2M1XGln5AqqkPKB3aRWWnpgUVxs+F6BHQ+G8CsT1tLS+pLyZ8
         WZS3VD2svEUucK6CuQ/fLH9kOgHqWH5cYh9Hf+Yca1Sm8tv6XZAYkddWuO5372cexhuE
         FHw8eCyngNqfNJBPYCrQYKJ3OPuACiQVPqqWinnCf4N0iTyfEe5oEs1i7bAUWEbllXlu
         fAbHtiHedKynqRKqeEJZ1b6NSM/1pMimcOOiJB4CmsNNQLZuCnrX5bg/Y1Q7i1c+Wg5q
         uZr8y7EJwNn2R3o/J9fRJKktx7DHV+RtPpg6Qli6/qDEEW6yIcUqvoT/ebSfHe1Qcp0o
         H4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879127; x=1794483927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8nO8m5nI3CkRV1ykmT+uymlgm9DyQtIp8KkHOyYs+CM=;
        b=jr7rSUBFxgHFRmiJrkXSm5W/JooR3M7GQxVfr5O5L9vCUxQ3xawH9Oc9r4xJYb0VP7
         b/LP01k059FG0uw9yya0X6eh3AmVZCri2duwEQWKjkY+ivy95uiM22WNU6aCjbQjBLHk
         gAERJ8RU3ZNFfg0z2AZgh5G+LAGyui+paCKSG2QQlZqancRF5jg7C/Y2QtqqSJ+Nmzaw
         kSyE93gcdXbLbHTawjFcd/JBzDyncWkHHwaynUwr9GZdo2w4g/TISRniZDNa5iOgUL+P
         eip6eMI2walSG9m1r4aLSR8NJRmmQrlId1tKKUldTCifqfUcgit8nW5T6XgmBpnWu3MI
         +kGA==
X-Forwarded-Encrypted: i=1; AKwUvByjkf0eALWIxRBweuBiXsJhhnYNmEaLq2us8M4B6iLwgwWWLt/+oEUEgqeAzhor/z4hX+hAVNESHSmbbis=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uGViyKfpEpsdU+gwh6cFJ0Qt2/2GFHicBkDYOD/kitTK6lJWF
	NCAroyktmmFuZJ1iHo14bk8YkXNpf1Z2tPrmGEbLCToL3bvdSnRDfHqupGLT5uJxDwg=
X-Gm-Gg: AYBFou1pLPSuFR0AHnrOsX3+Zv3OUUVrUVyhbzmQBgCuu6F+Pw7TP5oTeia3gdmPI5F
	PteAKAl2zyMQxzihLNKXtCLVQxWQ8Uj3nP9gnkSdq3N3szv0TBZUb2SEPJYpYNoBxzhFCaMDXaz
	w2jy4/sWgJU2/DGTj7zAHfFFHjg2RVAEhSYsmtXHpH5xyGMJ6HH2EZBJM2iGwdGxsRwTHO7uVN8
	Z86uWl8IgjLVcwf64VM5vJiTvu4ZmB/l3avZCkyneWjqcxo9Sa2Fu9PVOe3Hd7m203ur+hvPSIW
	VL0/yTJiPJrw4ox26NO0a46xm4s3S8t0xUvKsiGItp6mDrOsYMx9RRiH2JXErMP0lRdOTkyVE0x
	jDUbljsBi1LkO8JwU5GNx7Gk/l+6L7XN9eklciRFgLnmlHZO7NTkqCAXH3bZ07H1cL/sGGz+1Qf
	HuLA/OaATALQO5ADSY8kD1IiTiPRawzyeXMW+Wdln4UTG0y6CO5lyU9gBfs02pcMTFYJsYlo/n0
	JOD5ypMG8upRXzfmBz16W1n+GuKoJPfJMQ619MbPP3eMqpJtrbm1+yF18E/frJooXkFjLfNucYi
	ZrcArstF4hPMAFcrmJOvCRIZvme1+N0YrQ==
X-Received: by 2002:a05:600c:64c5:b0:4a2:150f:1613 with SMTP id 5b1f17b1804b1-4ac17a367edmr428463435e9.7.1793879127187;
        Thu, 05 Nov 2026 03:45:27 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:26 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:54 +0000
Subject: [PATCH v4 06/19] perf cs-etm: Don't drop previous target for
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-6-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
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

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
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

