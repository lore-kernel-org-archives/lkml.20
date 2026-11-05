Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879125;
	b=1o+qjoFFFknjW27PuG1OnBzE3LQxy4zQN+lTStrdaHeqwiVy+3Rg36naKAfQ1M+dcsOA
	 +zLAN67szTNAJUsUfAEKeIhXqckh5hiXaH0rSMaXcKGhPnV/e/pXVYLmOyRHWIEo1e1f0
	 6KB6EqqhpxBKJTOeW0Lx0O6gf8B+lCzIfZa990V6mlrlMu2Sor5aa96Jf70N0gdO8nDkH
	 /XLUqbymHu36AO8tmt1bz1mdPiL2dswaYq9VpjcQIRpB+Qrq09i5LA/w3JdiH6cKXItj5
	 TB9vxQRa/iHtIV94TjCRZz5a01wE4fRI1x1DOdeq+E6XqFDqpjnGWOp5q09x7IzCaBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gUWiFRM+jw/H+hBVieDnKYNLauqU39ebBR9r6EahKCk=;
	b=SBz10scH0TqTB6MblTYv2M4WFyEVbFeCvJEKkREWCRFE0SFxKNjjg7FEfVh/VX6geIzv
	 XGTPzOMffT1TL522xw4hARYbT5GCJCyQ3sjlcP6b3HIba/622vtErmfO4BS9ImTh/BRF8
	 TmdQ2PjYkQTUt3MIOjjbdDo1zcgYBJRkPdsAC0DWUMs0vX0wwQqNPqUvH0amO93amw9vA
	 MC2vP5I3mV5w2ui68jPCNks7dsJK1q4TbrXZUJe2roMO8Adsv6j8ts5mZ7XlcMtPojR8T
	 MW/dhieajhvcOaDFxTXXpckgWK+9IPdux+nuteSicQExIOcKYFgwfDO8/vHrH2KmmOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=okCxWMd8;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D736083631
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D736083631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=okCxWMd8
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so11580905e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879123; x=1794483923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUWiFRM+jw/H+hBVieDnKYNLauqU39ebBR9r6EahKCk=;
        b=okCxWMd8UfTSG2Fgtx3ehYOoeFtQhdiui/dxP9Ewf7dbpqvHLmtP6PHp8BdP2eo+Vb
         UQDkg7eHFPN2QQyBtL+QYVigs2Jgmb5w1HFRSN+Aha45rMnroRb0CSv3lwhY6Wb8ppf0
         jMJ1wq/cej5fII6HiEn1SVoKfI1j1M1uOa9aYhKupD9rk/g/Kf2qZ7UriCmD+idYtUmL
         Fo/cUUiw9wJmRyWQXgWYxxuJcM8pOjbIM0xSmJGD10IJ9EA/95E2oC0qh489wjKDuWqS
         aSMhqapZYVFgGolOvdAvBhYmxONRxhNzliVDyxs1HyMaJLms68TLquf3rQris1wqg7vQ
         v/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879123; x=1794483923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUWiFRM+jw/H+hBVieDnKYNLauqU39ebBR9r6EahKCk=;
        b=rN530fXf7SuheavKQ9y1vs/6kpKODn++80mJrE+R1EXpi9XW9iUHtSawU+umdbwauX
         rfGZS9aK5CpO1t3Lmjeeat6A3DRHo/Ls/+NLZDs558Hrr7PUWt2y8SFh2DdkJ9kreR8J
         HSp0kIAE45Rd2j0weVn9ONthlRPMs3Igb+LTX1GWZyJcl/3J9DWao23Rxjjf07AgWUvB
         TB05WUTmJvZG1z3mUZ0K89OrP+N/o3B3e0iatnvpHVNP8UGzncaYxa+1sJmRbFud3u6B
         K2LvCL/p962W+e3zbJKV6M6zgvuvObWXLgrzvow9bWtGW/iDO7jjQ4k9zJiHZdRLshyq
         aJhA==
X-Forwarded-Encrypted: i=1; AKwUvBy7DZb1FfPCQw2W0kUzvkpZaxMjAwQ07femmB7k9/iDK1nOblxVcVE/0x12wbRJ+YTXkYccgbMlIxxMiOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z95P30f2NgYxG9F9yFtJd70w+PT0ETlVoZyOUoTZTvSiH0EHYk+
	93HTgaUFivJim0Y6cipy5cWuHxY7neSpALmCzdwvoeO0ZCSabKRvBE1+wl5PyyulPqE=
X-Gm-Gg: AYBFou2x/R4bxpOq1uYJ++7v4ZDEUDZGT40wkX0EZHXTI9mBjdQJ0xAFdiaSxd0dSV8
	Pik7ih10vVtCOVDl7MYQbbIL//M/DG63niRsUOuBH4jiDLrTbpwG9DExFhA/LZWjY7ratgVwLu9
	uxyOsW9K43+EQ/Y7Vf4kSi25lMPLFNgavd/nso5Ft7sHcYWtVOJoaU8eLdVCZaHiP7wqYh7vcYU
	3SZQLUOftFLc4ymjzqv/IKSCtPa9duCIXouUyNsYWIIizhMf14wwC5Y/5b5gTDR2sYKc1FBlz7j
	/F1JnBGYh1hZ+bheQjAWBAlsgTDWiwJhSRtAbOpz6EWXNQe4SuUpfCS9VXf/S1B55eouum3HvLL
	hpf9WA1qvYM1f6Pa3h/VkWLBcB7gTV/Vpr9hZFQ7sa2jFtTTx5bhUGGR6/rAM3eyZCs1P8BB0eT
	bKQktD+at8x+uigmap1Ym7hstPKVDg68i4Kq/qnjtp2xkVsPWna0guJXW5zdRy2M/fuv4KawUZB
	yodikYaUt3zAGuLnDT06ehgIClGt73IOc06OT6ZEM/C8Duq8tB2wtevzdOpy5krVL1k5a5ZuU1R
	MfJ4726qgBAbSNetTbtbWv8rI06WH+rn
X-Received: by 2002:a05:600c:83c3:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4ac174711afmr401140925e9.18.1793879123196;
        Thu, 05 Nov 2026 03:45:23 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:22 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:51 +0000
Subject: [PATCH v4 03/19] perf cs-etm: Turn on context packet timestamps in
 per-thread mode
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-3-7759e0ce2449@linaro.org>
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

Practically this costs nothing and preempts future changes that will be
made to support decoding trace in order with Perf MMAP and JIT events.
It also helps keep samples in order when we add support for multiple
per-thread mode threads in the next commit.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index acfdb3f53821..47b4e386cc53 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -453,13 +453,26 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 */
 	evsel__set_sample_bit(cs_etm_evsel, CPU);
 
-	/*
-	 * Also the case of per-cpu mmaps, need the contextID in order to be notified
-	 * when a context switch happened.
-	 */
 	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
+		/*
+		 * Timestamps are required to interleave samples from different
+		 * CPUs.
+		 */
 		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		/* Context IDs are required to associate trace to a process */
 		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
+	} else {
+		/*
+		 * Disable periodic timestamps but generate timestamps for trace
+		 * synchronization. Even in per-thread mode with a single
+		 * process we still need to correlate trace to a specific mmap
+		 * around execs, which can be done with only timestamps of trace
+		 * synchronization.
+		 *
+		 * Use MAX to support the kernel widening the field in the
+		 * future.
+		 */
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", UINT64_MAX);
 	}
 
 	/*

-- 
2.43.0

