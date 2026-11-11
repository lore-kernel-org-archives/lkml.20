Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364493;
	b=R0z1w2jW7PI3B+N+u9PN9xQCu9zgApmNSzxI5DNBtD5l6mc6fjofmQAM1kPb3PwpoTEf
	 JLs+RirAgAqtsW7GdVIVWh8fLQ6BCKBWnftIxmpu/hTsovV2MDthOKWKmlBWEmIbq0wno
	 HowVma0gV4TPhOSK+KSlWRunGCQNvYWjfiUAfGwt+Rd2/CcTm3y6H6FQphgYqkv2WyOKh
	 udMabwZBZQc6+KdEDe18iZhF68GTh2gbuNG+EVbMAEOESIJXpXyjjgRpWko6LN6d5sHKl
	 pmUbk9e4+hVuLTxrGGHFDuuzEnY3KlSwjOQR3ighfjgNqUDZWd7mH9fFNaLRM9k4gYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OMGGB93EmlGueDkjgwnpuuzgm9iPw+4Fv+LYRo7duqw=;
	b=0aHSMRpX3LqOfmEU8lYdLIyCxLWMaBS9qSGwVrvA12lczkNcGWcmK5hKcQiZYOQ5nYcx
	 gxArtaBtVAatUeDaxDHTy9i9QhktHGeMoWZUxSod53xAasj77gTjLWiKKHTvVJYuD8D06
	 2bswvHgnp2iIH3SdRgGQLvwwIgxM1TKj6iE98bFV/hl3idoF88jiYKuj3Zz+nRPCUnqRq
	 euhB3U6L5OK+vYRW+9rcRiW27MOWTTw1orfbbrwAUnhKkwujt3KhrjX6xasX8lJ9xiHFo
	 YC2zf+4KyAXr0RKtDf6sl0DwjFY52+AzkgT65wMZMKrD2vKbuNotk/v6zEOmbBAd0qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQbjFscJ;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15F0606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A15F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQbjFscJ
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a3c08d6928so4660314c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364492; x=1794969292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMGGB93EmlGueDkjgwnpuuzgm9iPw+4Fv+LYRo7duqw=;
        b=KQbjFscJ6nxNj6n6zH9SGuGxcM1FDMdKtHtfAd+bQHPrlmN8txXBWsiTzSvxeU8Lri
         kHh6A4GjBk/IhxdpRPp509s+JZxFuzh/f7ZRrIQu6taiVQ3tU7rkkfa97R9+Ko+JIoT7
         qjgqke8vlQ9L3m8cF+RL4HT3GE+rvYidvqfBTszOmqYYVAx/BkXZRmxBXMeYudUXRoPX
         R/wN+1IkOtgQ7/COFZqcZ9tHcf25AHINVuAMMUW+krFQ2hqqMqzeQbxYv3fcvFlQ0z98
         rlvXhC8A3hCZNbZdaLRwdZZjXZdWV7lQ0Nieao0m9MewEnb9itYQWmWbkXLy+93/31Uy
         PrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364492; x=1794969292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OMGGB93EmlGueDkjgwnpuuzgm9iPw+4Fv+LYRo7duqw=;
        b=Fe1laaiZqk+teraYt4nEZySSAg4XyE/D/P7lJWM4kYhrqWL0RklQSKfxR4Kw4iEBwc
         jDN8+sFWUYsoRJSQFUhjsjz7dqQGghafRLrI7GNeCjkUQDpKt+kenBJEDa9mb7dTZi2e
         /gnBlL29xntuphs5H3fDwpPGjU9j7XPgNC4a0c3FRtVKfiBYCvFBXGV9yaFETVGHGCXj
         qU5/eIS9BNiuz29EuPN0uperM66BRHS0/HCzmHR4MfczV+zHMi6ZV0inW5hSQqUWtovV
         2SX5HdOIb6rocEV17+EFeG8s1PoW1+8DP/DX5AIbIbZwKVlolyZ/RbBGL5NYr032KxOQ
         44xw==
X-Forwarded-Encrypted: i=1; AL+hErGlpJ/zXz02AUla26VIsmK/oeQ2xCoNXO/YeeAFD7bgz0l0DgVzGmd7UqmTexTL91XS1X778WFxlKlhaZ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UlSCg/abAYSGx/mwtwkCoUqYe2WGEYMTV0s2sPAzfUyQZPe3A
	VVjVoi69nQiJ4OYydiR7+kwfOXpyUBlbzR4Ij9Yrrxj+lMJ4A45UObeR
X-Gm-Gg: AYBFou0wsNl1ggzOgN8jRhcgOeK/wEDVIOcAr9XDzEPsTAO0rrDLWWEdS5XEvfRKIP9
	rWMlh9F9FVLly4mrIFcMLQMKQmXZ1ljl9/JlhRk9P/jQIvWxm00MFkEkJbh5mEa6Q2Ki2Uje/Hp
	4LrH3HF4gxJpkMIB3g9XO6FTdi6++veKvD6rrlT+/84W6sZKCW1+avQZQl0eQf3eC6Ibbpz+ncv
	LmEpxH/xThDUW0pSuTg6hhnbl1JryH5/pu93PLxRy7tHJfUV3jmnbLbXn1fyd+45vwXXhl+BaBs
	zcUS1AsBpCnf1uPTq35VjrzJQbBgZmp2xmCKZomULkvHideCDKO3QC3+h3tI1AngvIkdqtFMZFw
	WAbSpd9lVCAJNkh4SQddPhPIpX/1Tjmg9S+O+xU7rXoXuZRvYXsNBRyGXmZ3sM9y8aID9zzJ6E+
	cC3I7GAp9Yl8Bgn8ypwqHn+UPNBWIPHKz+8jdDbKd5BHy7CoYq4JiI+I9yQsELKyuCArmogoCT0
	JxKOYgVI/uO77QAnQWWXhw6wP/ylaoJ0qJlBoEiNC/7+AI+9xSwBqwj8TUre6RGdASIpgD5tl3s
	N61UKAShtujk5z/Y34Zt9mY8NpIoamMmjtqZGNBeiA==
X-Received: by 2002:a05:7022:ec02:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b3c02f36ebmr1120247c88.10.1794364491577;
        Tue, 10 Nov 2026 18:34:51 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm11752369c88.4.2026.11.10.18.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:34:51 -0800 (PST)
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
Subject: [PATCH v2 0/3] perf jevents: Report the JSON keys that jevents.py never reads
Date: Wed, 11 Nov 2026 02:34:45 +0000
Message-ID: <20261111023448.1970467-1-takano32@gmail.com>
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

jevents.py takes the fields it wants out of each JSON object by name and
ignores the rest, so a key spelled differently is dropped without a word
and the object is built without whatever that field held.

Patches 1 and 2 make the generator name what went wrong, and let the
model argument be omitted. Patch 3 adds a --check mode that reports the
keys jevents.py never asks for, along with a make target and a perf test
so that it runs without anyone having to remember it.

This is the second posting of the check. It went out alone in November
(https://lore.kernel.org/linux-perf-
users/20261110193239.1741014-1-takano32@gmail.com/) and the review found
two ways it could call a tree clean that no build can use: a MetricName
with a dash in it that loses its MetricExpr was invisible to both the
reader and the report, and a metric without an expression was skipped
rather than reported unless its key was spelled close enough to be a near
miss. Both are fixed here, and the failure-path changes the check needs
are no longer mixed into it.

The test runs the check over a fixture table rather than over the tree,
so it is green whatever the tables happen to look like, and it checks the
three exit statuses: 0 for a clean table, 1 for a reported key, 2 for a
table that does not parse.

The two misspellings the check reports in the tree today were posted
separately in November:

https://lore.kernel.org/linux-perf-users/20261108184600.3810059-1-takano32@gmail.com/
https://lore.kernel.org/linux-perf-users/20261108183846.3804875-1-takano32@gmail.com/

TAKANO Mitsuhiro (3):
  perf jevents: Name the metric when a MetricExpr is missing
  perf jevents: Make the model argument optional
  perf jevents: Check the JSON keys that jevents.py never reads

 tools/perf/Makefile                     |  14 +-
 tools/perf/Makefile.perf                |   1 +
 tools/perf/pmu-events/jevents.py        | 391 +++++++++++++++++++++---
 tools/perf/tests/shell/jevents_check.sh |  68 +++++
 4 files changed, 425 insertions(+), 49 deletions(-)
 create mode 100755 tools/perf/tests/shell/jevents_check.sh


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

