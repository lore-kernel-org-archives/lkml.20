Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879133;
	b=wVZDuLynTp+rnu++h7HDKohd1GPrEX+0mR+L/DAfEi2T6pkD/2T47Sk7beYhoWW8qcDs
	 OE0nbk+eNn8yvq/Y8uD6rk1qnut6HNyAE1xhg9TybYaEI3+4lzvrVLbcmlMafb7CuV4Ga
	 TWBXlruLZ9366KSBvCz3ki2BFX7LeTTxkihMbf0AgAhIGhhVHbu/eOirGMIf4tJHoUxg+
	 pQcu2gIKaXt6D+569fS4iUdvsjg4XmbS9hDgGNWKdK8Q8jyESAOt9yVXEIxfJOaADMgX0
	 9BxxqaO0cjaD0Op+Hlm2FZ/VxrERJJYwqPb8VTF+QP3TisnrCAUXyLvJTwBTvTKf8hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oqj2T0WXB8ZBG5xgwGVwwKzGsMQkmNW87CSFX8dkW1c=;
	b=O6lXglwRZuWgW4JbNWrbE4Gk8B9p84xL6++8Ze2kIGQkz4E3Pnu31VVkHXy0BrKNntRv
	 gZL1FktpWB8lwRklnDSTOxiMccZymxq7MH1O6PDJ8R6LLTlwD+t80yQ+5KLqg2P47KgNd
	 spa/Y3GJD+yduCYE+UCzyBC9a9ijjv5RaJUSI4YknEKyjzobnVpa/vEKjihpp8cgJvLSZ
	 IfXR5PpUA1wCRxUtdWMUB7l417bddHghFem55BZBsXa2bDgtezkfRr35VlSqO4MZceCZX
	 ggqOk7lnaFVX8bYpUJx8nZi50MM/u6UPSUM9vTujII1bjHJFAB0fmR9PJQgokY+DiTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yvofcizy;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAD860A382F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CAD860A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yvofcizy
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a210470b49so13103655e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879131; x=1794483931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqj2T0WXB8ZBG5xgwGVwwKzGsMQkmNW87CSFX8dkW1c=;
        b=yvofcizyVVfGyph+dJ3vEwbU4lVksshxBSC9jWPZbxyr30nySOhCXhqj5IAsACtT5u
         zGxM8WAH0xU5MJQxzc4arn7QakSVdYo0stAl3HnGR+7+SxiC/HkFFt2qUrNZ9r9T5zB0
         8PMlIlZcTiS084mhFxLxIVIEWgaEilXAylmTLPTQxEowlCOLy7puTJG7oZMekVz4RZff
         Oh/ZTH9ZNrlq+Y6Zxhz7KSrAyQRzjs067+DQ1HSjnLH+F+J3wOgq9Cjzh4hcdrQQTPwW
         j1mIz780qkEgp0cKZ9rIi6VBNPNzG1h8JxiFqE2VnMROYVD3v8TCWmrAmKOR+RyaOJjK
         t/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879131; x=1794483931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqj2T0WXB8ZBG5xgwGVwwKzGsMQkmNW87CSFX8dkW1c=;
        b=sLSbrWWHOfhlEVvMKQQGFPlBN5figudjwsKPuYhXixep5DyMCWvUM1xf21Dz0dzVpk
         q08PsTNbisWjNepM64TIFegMIEl5KLLvm7Ejf96IItkuGM62oZELKUxj9SpRiBNelX+l
         SSnEyjr4kLflz5UDvjEyOmYxvbmcLrAe/2eE2vo+GgaOeKbxVjNY6UnB4To0Gtbxw4Qz
         9sQdUGOLoUGOcrFckwPFXa3Zum+EAcBTcU663t7om5rn7HSLR7ktm2dwxuc2/+xFtjCq
         Pjr92ZIfaDUIiyX/XUJVmbMaU929pAzOPdqGvV3EkVVXkTl9myIq8Zeg5HYvJ9Wvg6FY
         ParA==
X-Forwarded-Encrypted: i=1; AKwUvBxe7YARTwKLc/nDaP572qN71gVYQvR+7+rNFaaNQMoqMhDrNek/z3ccAdSz21hLxFvJ6+EE+4oesYHWng4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k6ab5Kq7DGLjD3Igr7WOCPJY1ULdUHAt7M9LXVRJN7zSIWBBn
	Sli55md5NJAXUBPx2Z+n098X5SYUYAIVJwbzLw35gejTjawaU6KmyMoEP0lQOth2biQ=
X-Gm-Gg: AYBFou2wScitXohXFVSmUUQB2FO6klepP8oBD/owm55I01kf8Swh5z28sifh7fHVjWg
	z80nl2pNl5DVzE6IrLxuOfsS46NeTdaTid462nhlTe+96+41DNQUTwaCWs5OeXIHMBjOGWCIqGB
	ebsUIjNObifUFKu3Ysql+ZLxgIFR/WEojb1EQhy3PGzhn1U4UWj642SzJEXm/1z15u9S9aa8lAC
	UysWKoTyB5oeDvqVUWk8W024QlDHd8ZPKAsJuxlYKiRhfJ/EM8aSTez2yhGpOW8de1Hm2snltcV
	3EXjlcVqvkujL8kDhqMokX9gtV90TJAnLwZmCDyVh2IOjNIhos8jvHqtEZAlM6EAmaU5BHDIa7x
	OlKJz4NObvGVDpP7IuB7NRUROchbG5kpn8W3OB++OI8VdhDoN1ngrxatXj4S31w2X8GVwZhTHRL
	H9kBUjMJ/3h833FguVbWKdhK5vMY3GN1L3uDpDLAFOoaVkUXtP35qbTL/sJ61kXR8RQLWIicg5E
	/+rhH5HWzAj2Pip3cD/UkLuhHoew0A9ZDgb+i3dAp/ijXVmL68W+2/Eo87SSx+1MhSlFJsVRJZd
	ojBUAh8QIeuZVICxdjaTT5BYl24OFwsH
X-Received: by 2002:a05:600c:a4e:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4ac187a766bmr411694955e9.21.1793879131015;
        Thu, 05 Nov 2026 03:45:31 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:30 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:57 +0000
Subject: [PATCH v4 09/19] perf cs-etm: Increase default timestamp
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-9-7759e0ce2449@linaro.org>
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

The original purpose of timestamps in per-CPU mode was to roughly emit
samples in the order they occurred across multiple CPUs, rather than
emit all the trace from CPU 1 followed by all from CPU 2 etc.
Previously there was no way to change the interval from the minimum of 1
cycle, but custom intervals are now supported by the driver.

Drastically reduce the number of timestamps emitted by increasing the
interval, which is more than enough to interleave sample generation.
This reduces the size of the trace generated.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
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

