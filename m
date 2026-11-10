Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794349379;
	b=znuoBLRu+TErQo1YJhx9MgwH1bL9tN7CgRNm3agscSTxuUm1kip6hCU6OyPrgUhK+wNC
	 L0UYuieIEr85HQWZ1ooItVP5VmzZnm6hBrBVKsujDL68qD7Jl+R7XcoSDgAjRw/of2UXI
	 xu4VtdqaGX8Jq7RT85mUfNGeiWfKqu8zHcgPEp4obRaBRdF0cWJfNY25E4VpfjxEBtrn5
	 gGXxL4prPzj1zXHy9+M5TbkX5EvJHRn0wDoBb+Jw/MdtGBN/KkXZr4iUDMmN0weygiO7d
	 QZM9JJNDtiLdB8HeYebf44a2kdMyBvOBIG/EuaNi5ioJ+qOoApr5MtYdZAwjkCVEnFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Li9XzaIq9EHWuYpysZ2G/ZMmz4BCmbKyG6C1UIT8yjA=;
	b=IJ2gAIyzEpaTvm2Mu4paTvyUKjzDr6m0zOcRdz7vJiaH6tBMi5TzHPsN1JlNmb+C7dbW
	 zEzj/3ZZOLkQc9B3GcLotGrxJNDiWXgzuyxhY0BWfzHIDJJ6WhztZXPxcndgEcsi2c6gu
	 6mmbQ+ipHiwZMoPOH5iFdh7Uf2XGb1BeWdEIyuctwBtq/mdzpf/zpi3GpDkV75iHZWZ06
	 CxVKVEqioZME9HTFP78ZYVYeMzIddmb85rfItNPDsNVivHXO1J9L8kIvrM2ITjTfNxC4i
	 s+6UcDl4bCt5CjxgNAEq/ah5im0XiXT8E9f346CUfEnECjv5IU+f/SLp///Bcv6nX9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ftzBUYaL;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF99606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF99606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ftzBUYaL
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a315ed211so2877715eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794349379; x=1794954179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Li9XzaIq9EHWuYpysZ2G/ZMmz4BCmbKyG6C1UIT8yjA=;
        b=ftzBUYaLImfccBOkzMl9eeHxI4djWT13/GXWj3/OT2MJ3ON5mxoyC3XHGTZ1O1m3lZ
         tn2FVU13XwZdireiXYN4xfCw3bBqiOPK45LGg5dNybM2H4xLcHU90Msw06NpHvxyVg29
         QbrnBwnums2aVIFcjPRtKsK8QNpN6S4Z+MMLWETtlHV77PTGLyb01rmFMGFBL/WfWSir
         a4bJtDX6yNSbtetyW0/OOj0ifwahE0gIYJKbCljKx0Wh2Jp8FHgnI7jTT9ZWju5EIixF
         kLTflBt3lLSsiM9NP1l4IVdrSsiFVqUjSMoIe2zhRR/8fYo0Vibi/aX+ebA8AnJtJ7IA
         /kWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349379; x=1794954179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Li9XzaIq9EHWuYpysZ2G/ZMmz4BCmbKyG6C1UIT8yjA=;
        b=rKGZQq1ZS0q5MhYn4yIeJt6GtbdJ4VrzvUip5ws+IRIAxcynKJqmr5N/mDBW+14LAj
         CD/Y+2RgaaOw1JpvYS+5qsyjcbkhjq03wOW9mIv1qs2Ia2mBEgQwBVWZz454HZc3iJuF
         FVeymGlMFg9bc2hqiOps43kdPjsTx3y4fcTRJ9+cjk0ls6S5VSmb60UAtBz/WFTlMtsY
         rSpGATI/sr+KsxAGGADOKCRZRtWwvpXNGKf/r96+z8e/JmDAeZIq8STaMKQtHJaRb+OZ
         DbJI4vQyI0X8tA3+dr801cirOjjn9lEQKfVuAyx0w8erwG83/QmBOH8rhiwX1y1VE07V
         XYjg==
X-Forwarded-Encrypted: i=1; AL+hErF7oXzUPWXbs/K/a0/JPd+fFTe2j8nwZHIMbhJH5aIoSRwBhNaBZGTRGoZIgeT4e1i40lLeBoPaWiflixM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KXOavp92gIaXtjS/oSrh6LyaDoDArrjyhLofQXkpA1Dggymge
	bJTlS9B9IHkiv4wnFs7SklsbVRUTqNn1n+QtfEuPiHKxKgP6q+o8gmEy
X-Gm-Gg: AYBFou0ux88j2pN+/r5I/ouCfAeQ8sRFw3KHwwD+ILgu6rcd+9XXrTEfMoZ0ANnraaA
	jW9CJgKKq8E6KSiaO2kCJFPVHpvilg5fWPCCDtAemzDFP3OmzhG93Z8G3Ky2tK1VMG4FcjCZ428
	jowlYu4IWAcS3mVDRsu9foH8rwhwEQZM3tMRdWYoGfqqgbfL9SvF528pbxsZ5j0EHYiMgKYLzwx
	9f0X63sKju5lqi7DZmAzglpFxySDkau2WdCWLlnIDEXJC/z/ezu+mcZZfEXEFuzniY7Cyz13PBm
	A2IPnf2fKlonyk3xMmeU7/kAELwQqDvPy7apgDwrdQkFseO+EL0U+qy2nGtiXawLFtMn4GbpsBn
	ScWJ4GKDUjFy7k79KZZNg+HALBS+nrcrHocTAmgh/KkMWU0RbIdtjsTUmyx0nWgC8iSaBvucwUY
	WVG/vAXOSkIVlyKoWH8c05cIrriuFBgmwRnqotip/yjMt3gz8/HuDT2sLzuz0CqxJ0aCBlZ6Keh
	CE2c+13mnaFAQ6fhQdhwB3j9ZaMi1SjKGgq4mDjjv51BqLoPhHr2yUY25n9ebF5IrRIR+dsYA7s
	sJIrVJMBzsNkckHH3OUM
X-Received: by 2002:a05:693c:4086:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-3766aea3535mr1407329eec.25.1794349378450;
        Tue, 10 Nov 2026 14:22:58 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512b6asm9165030eec.10.2026.11.10.14.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:22:58 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 2/3] perf jevents: Make the model argument optional
Date: Tue, 10 Nov 2026 22:22:49 +0000
Message-ID: <20261110222250.1864777-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110222250.1864777-1-takano32@gmail.com>
References: <20261110222250.1864777-1-takano32@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The model argument carries a default of "all", but a positional argument
with a default and no nargs is still required: "jevents.py x86 <dir>" exits
with "the following arguments are required: model", and so does any caller
that only wants the tables for an architecture.

Make it nargs='?' so the default is reachable and an omitted model means
"all".  Builds pass it explicitly, so the generated tables do not change.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 tools/perf/pmu-events/jevents.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 86060a228b75..844fa82887bb 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -1486,10 +1486,10 @@ def main() -> None:
 
   ap = argparse.ArgumentParser()
   ap.add_argument('arch', help='Architecture name like x86')
-  ap.add_argument('model', help='''Select a model such as skylake to
-reduce the code size.  Normally set to "all". For architectures like
-ARM64 with an implementor/model, the model must include the implementor
-such as "arm/cortex-a34".''',
+  ap.add_argument('model', nargs='?', help='''Select a model such as skylake to
+reduce the code size.  Normally set to "all", and that is what an omitted
+model means. For architectures like ARM64 with an implementor/model, the
+model must include the implementor such as "arm/cortex-a34".''',
                   default='all')
   ap.add_argument(
       'starting_dir',
-- 
2.53.0

