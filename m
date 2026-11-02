Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621763;
	b=qbtG8qOJAY1d5FMrOzska4OTMqjYFVNZmxzDzfhTRZYUu/XH5a76Zqe6X+LLlTWp3xUf
	 zdFwJBvRM9aZcI2Xc7fNFydfdxt5kRWFA3WQtm6LSmIJnK6TdQsR2WNgCj6ra+aEn6POi
	 vGPnhsjduZpvWqfZLOAiGZNYE/SF8XpZBta/3bwXl/OsxMrJyOUuTB2CBVXodloIrnBbl
	 RvzJv/Jfhjh4aL4tuiApu7WV0ahmHpjesevjsj/nVpryjBaBvJdBBAJpAx/ShXnP+L0F8
	 P65fF7OgGTTm/BX0XJe2lh7sFiUfMhnKsDr1lnVrYuyZEXw7q9gymDSk3DDjSEhDcGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+9NpFkRdVW/EG2TCUGvGJ4MlQ2xcOGmdMzm207Q8vjU=;
	b=D4y15Io0XNy3nPEupe22OWle355YKCNu54p9iEpTZk50UeT/ktDukcqNVbiEAROAigiG
	 YbOTV/UQXj5qjZjwAd2URUcpDXuH4eIUtQxSbwLuYhecolhKhgJ3kOhZp9a9pkGtxSRTY
	 0Hvo8wWPEGDrKWbUAhIVsC0StMem2cHiQmqjix1I4tcgm6sOGX7uimvbYRdxx6RJNWttL
	 zPYD4o4VytzM4hln5Vx4gKr2VFKW+kHqt+MIb6wju4fd1UZ3hkiz3wEQRPDZ5MD7a3ULi
	 ki/63Ji9syVgqVCL4QHToyTWkqYqzRGNkJ6MtyWn9yGAWWQjHMUpAGLr8l4mhE1Hejw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nZhe5IHD;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0D560A260B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B0D560A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nZhe5IHD
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so25631135e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621762; x=1794226562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9NpFkRdVW/EG2TCUGvGJ4MlQ2xcOGmdMzm207Q8vjU=;
        b=nZhe5IHD6xsgihUEa8+tjQPo8jbIVrf2OSFHZ/AqCfRaj/3f5j3GapYq0+ZbJJiWU9
         VVE6D3zCaTB3qyuHyBYzat0/VseS3GTEq4dkQ2RU0IpjXbbzgw00RyrOkj1lqHI34gMK
         BnO5quG2YciTUywpW52fZl0FZdy5q8hxpqv1YefBUB3lGSnAqUK/ThL9l8S/TgRuz69v
         FvpOgplTeEbyGmFZSwv7e6Po5oBpz4tYyRWvsl6kOJqxOlHH9JTdEkji6Um3uhaabjZr
         fXbki5YhNBZAQOiV6KuKDx2tDkmA2zE/kYVeG2DMd/eJdLPDAqCYOdBo2zcWeyx63292
         UpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621762; x=1794226562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9NpFkRdVW/EG2TCUGvGJ4MlQ2xcOGmdMzm207Q8vjU=;
        b=0KyNkWrkbb2v56TkWCIXP/Wtpk6Ijo9SpHjCUjbm830kLpu1bdZiIfKkb0b2C77l0i
         nBK7exM1CtL2HMUKr4DaZUISVjFuTUvcJnyy09oQLJ6PZrZAWZAlwgSAZnXcp56vy+yV
         4C7NzfutF0a5CsZQ9spoUMRZhaUVnOM3c5vcp2RdqiqNFe6iZuDelCxcm4Huoqdw0S94
         08DvvOXNO5H/+qJIeMQ2letRIvvFsUGku/V1fmtrVWFxxrddmccKjvsED9G+UyIVWk4c
         JgYBmWhOSXcjDXj5DUuiPD9WRleciHILtSjregBihSQmmqM9i+5+rxvXg6NSQEpv/atg
         wIIg==
X-Forwarded-Encrypted: i=1; AKwUvBwtKKpnNl0f+ge7GASsHqAtgTMwlB8s9I822EIQAcIGMVvHCT1fmyhb1lCGAqmCkSOULl5m3MQhv87zD2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqwmbAmx4uIWepBASVhXZUPMIdazIZUEjgBfIjcqlG0sH3oQ7Y
	6e0a91UeVh7YgxqE1ZVhB7TfKgXtcC6A6cz9qnCFDxH/dtuCTvAFnxbuSpUeIcm8eXQ=
X-Gm-Gg: AYBFou0k4I9BwSYS0enBQNOz+cDc3UAa4BXX7m5Nyyhm1u5ckgvKmnad/11uhDV3iGY
	mmxuUhn8CaasP+RbWudVJBd3Y8kM8HHtKufivAjPieIB+gVp4ox2YAYwd6APbVRycuiNOV4ogT4
	nT7sg5OLDvVkS+GMuAFeT05UWBA58S6Lt1P4CmtMsHBtIFZ1B+OltFGOEYTMNKfJa5qiNiVWVOR
	fJY1ytuGWF0+oB8UP9ZuOfRBe0h4gAr2Zcp84hoGKy33qpa6nYnOM2moAcsTJ1K2WeconDR9lks
	5JKA4Sh/g/SUPr19JNjPIZPfOISZSm4ockGHiFBdixcwsYF/qVNCxYrjuRp6WQ0nCIqP9/k2XYj
	GPb5hKwZABf2HRHSjk1utN2qP3F63BixUp+bHqgNH5nqddKCiJzzdgAjMf0bz09cYAekfcgdcxU
	Dul++hEmRE1ehw3VzMEGiutpJwW6f8EThcSZGWvjmIkdpYrswI7wdeqX4DFtns7Sb/Wo+AT+VrJ
	Jao1c+DOZEdjh5pgBOaAV6IifoplEifdboBl0ncfHeSS2lk4t4cLdEfONxSSZQbaVUMI/ru7zAp
	ZGQyiQESM8/fYZ8YPnxMeG44Acc65xhrB8pFeIE8Q8Sl3OdH5+lSoA==
X-Received: by 2002:a05:600c:6285:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4ac182dc8f6mr222521195e9.34.1793621761658;
        Mon, 02 Nov 2026 04:16:01 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:16:01 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:28 +0000
Subject: [PATCH v3 14/18] perf cs-etm: Don't print missing buffers in
 snapshot mode
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-14-dbcb0c281b9b@linaro.org>
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

The driver produces lots of AUX records for trace data that was never
captured in snapshot mode. Downgrade this to a pr_debug3 message as it's
only an error in normal mode.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index e899d82b7c93..c880a1ca7533 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3361,6 +3361,9 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	struct perf_sample sample;
 	int ret;
 	struct auxtrace_index_entry *ent;
+	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
+						   struct cs_etm_auxtrace,
+						   auxtrace);
 	struct auxtrace_index *auxtrace_index;
 	struct evsel *evsel;
 	size_t i;
@@ -3414,8 +3417,10 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	 * don't exit with an error because it will still be possible to decode other aux records.
 	 */
 	if (!found) {
-		pr_err("CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
-		       " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
+		int level = etm->snapshot_mode ? 3 : 0;
+
+		pr_debugN(level, "CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
+			  " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
 	}
 	ret = 0;
 out:

-- 
2.43.0

