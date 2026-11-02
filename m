Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621757;
	b=zLeLKTOGkIrsW7unPb4i3Xn959VGNXHiWFuJAVzCKWrob9ihipeDUEDB3im9ZKreu2r+
	 iFu3oUU7A8xIrPMrqzJcLBcYL2y9KHsIOOkEYWD9vZ5hgQv7YFcNNFrGsiO31O5JkU/zB
	 cbdazydbSY9+0Tw47IpWfDRsPes5ol4SD+qrrm7VzDMY9YrfUOHgf1+CypQ7u3OPCBVnd
	 XiJiTtspNJBUGb987WY7u2iyhBQZZp+veDybAl3zXoAz4f+78NJ5wYf796Vz1JT0ay88i
	 w8jOcH561ZlI/V0PSjg+0gHpHOlD4Kf3EPL8+XbBWUvhr3nb1V6mXtUzHcOdduHQ4+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Tfbh1sEe/bDWqkSnXbEmJhwFJWqdcIiSyVXsN0XzB/g=;
	b=kewbDKnOhqPa0SeqyjznAVN4ZyaSuEMugCRrZcNkK7FJYRk9vvn/VKsTLFqn3n10jrVA
	 fPOy41c+hq0G3Lv4yl8oqe1jZn4juf2sJg3l/30MoSSM/wacnrQbRR4qdqbKgyBAA4cJV
	 UjCAJvNvGeI7nPQQxUKqwGgSvcXGpiyf92MYOYDxoyRO+f2iQd4KqA7DxpSDvClYOBgf4
	 WSrs4/5F4UOCIvsQaNpZMV30kDv5fRaAr/LIrq0KkK5gV59+48Ia7KIOC1/SWHoMfeM2a
	 g9AkhRaqcMPbWWP3dg4pOCaQS1oWZYTgWbcckPy4IWXmrqVz2A1C/LKkG+tgdHwFQSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sYcKzM9d;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9161E60A5BFC
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9161E60A5BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sYcKzM9d
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso22727055e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621755; x=1794226555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tfbh1sEe/bDWqkSnXbEmJhwFJWqdcIiSyVXsN0XzB/g=;
        b=sYcKzM9d8EFXn7TM4eMl1zoSRfzsSlaSLAx3Z8IDMXtzXqFiEsUKVtZwQsAbuG1VQw
         J3MgoBeHHlU/4tbivrBpkvPi7EniiVRta8VwZ0SPYSEsAduZrB4OJ51LHA9CrUw5Fjx3
         Q5C46GTXDKDu67KAJ70dfar78IKwJm/O40k0QXnz20v7B6U7s1YUmdhX/g6ZUHB9qEd2
         nIfS9Bo579b72d5LSpoz3HTpLWJ46vSGAcahvoAsYegN/P8EA/9EhzKLMs/cuF82aCcO
         T5Ams4qCqzYqO4nWIckNmTKO5sQNWhkO68qw3DlrUV2/sH6OmZpQtDIu6jsubzMsSSWX
         Ps9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621755; x=1794226555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tfbh1sEe/bDWqkSnXbEmJhwFJWqdcIiSyVXsN0XzB/g=;
        b=yQzHQI4YqIiQ4Y6CV/vhFFLczeDVy2c+rkJJ1Hwl2hklp0/P2N/nj4afXaFpAK9lJ2
         ZnA+eDIVREaVO3eExUT129GsKTzqvGqWdfV4Ju7SKFSXdw4YUsFRchVwADHrXtKAAqVD
         qmwTcfGUQT+kmYn+wjMZ0Ak/clSxjvUWJUiRT6dJUcsx5gOc08EpIMa/WdSV5g1LT9OX
         cCtz1Lefg9MAp8Wqib/DjW8uyvbYd/p9kS6qLg3LZ/fh0J8PwOvpY1K4vMOrbxkhecTT
         Q+cPvnyHJBpx8diAEwk/FnuMr18sGt0TV+t7n7SB0i+SjqWsYfaGAfnwIiZijq5LGc4s
         dkPg==
X-Forwarded-Encrypted: i=1; AKwUvBzWMNn4R+hSsbL1YpZSIY7qEbQWxb7hbH4BmdjKWRoP9uAlTIljxwfa1McQBZo+u6Ag0OvuJAkagGyh6tE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnlohUelGSLapvl7i6WO4WOOG00CUtZyrsHUvpaewwY5iKkXSv
	xuVXat5MNZA+LHb3xkw+HUWBihkhZJZptK39c69DkBSR/wQxc248HxvZ2Uxw02DlXwY=
X-Gm-Gg: AYBFou2aBY0qSnJAPvWQ89CE6s5OGb2EOKZXSOny6RhqUFPhhMxhWK1N/viV+wx0UDt
	wJRD5SopRHDpHfOX+vS9/seT03mHT3z8WLH9iCVXPN1Rf2fs+RmfZtxGjJZqaoOYopDRin6It8G
	vXwhQPTqJ3jnftdo4uTlV9yE/xkT3gBM7Ob42Vp3AIVongUDlYBlTsdTktS20PQSjLvqWsV3zFZ
	ZYDl4+B1PXYOnSUv1DvsFSKt5b+wULYtFHfha0YOFJrujCe9JuCMaFm1uwvOdhP/581IX+asscR
	bCTmXoPIbZrw5fCkOudivWCFJ6ElhVSfq/NQ4EA24svnVdWjYl9NVnAjolxTqJi4mnMaeg5sxeI
	eBnlV8fuFnWBuKbV8srqPwGQYo928X8yC49R7l35OqrYl9j7pz70YOEMGMRo1CJTmEBzYNB3xYk
	QAGHbL3r0FZFj7lpYqg/u7z85m6bSkP8ANJyN36PatjF1cE8fA652ZYJgqsn4xPRMxFlSyXWHcR
	5Dpvrpu/GAtMEWrcOYYyEpYVKZ2PYCJruKZiBY29iwf7D+egxZcKPIzH9rz6RzMHNSzavdVoxtA
	9JGVdIvhrz4DBIDvYUGiWtWvjNZTkqIX
X-Received: by 2002:a05:600c:8b61:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4ac17752ee4mr210928905e9.16.1793621755020;
        Mon, 02 Nov 2026 04:15:55 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:54 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:23 +0000
Subject: [PATCH v3 09/18] perf cs-etm: Increase default timestamp
 generation period
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-9-dbcb0c281b9b@linaro.org>
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

The original purpose of timestamps in per-CPU mode was to roughly emit
samples in the order they occurred across multiple CPUs, rather than
emit all the trace from CPU 1 followed by all from CPU 2 etc.
Previously there was no way to change the interval from the minimum of 1
cycle, but custom intervals are now supported by the driver.

Drastically reduce the number of timestamps emitted by increasing the
interval, which is more than enough to interleave sample generation.
This reduces the size of the trace generated.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 47b4e386cc53..5e7d09b7170c 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -70,6 +70,9 @@ static const char * const metadata_ete_ro[] = {
 
 enum cs_etm_version { CS_NOT_PRESENT, CS_ETMV3, CS_ETMV4, CS_ETE };
 
+/* Default timestamp period of 256 cycles (2 ^ (9 - 1) = 256). */
+#define DEFAULT_TS	9
+
 static bool cs_etm_is_ete(struct perf_pmu *cs_etm_pmu, struct perf_cpu cpu);
 static int cs_etm_get_ro(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path, __u64 *val);
 static bool cs_etm_pmu_path_exists(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path);
@@ -458,7 +461,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 		 * Timestamps are required to interleave samples from different
 		 * CPUs.
 		 */
-		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", DEFAULT_TS);
 		/* Context IDs are required to associate trace to a process */
 		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
 	} else {
@@ -481,7 +484,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 * timestamp tracing.
 	 */
 	if (opts->sample_time_set)
-		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", DEFAULT_TS);
 
 	/* Add dummy event to keep tracking */
 	err = parse_event(evlist, "dummy:u");

-- 
2.43.0

