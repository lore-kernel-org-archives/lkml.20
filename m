Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403590;
	b=wZGeH0d28YcsVWAR+XkQ5ZUuUImcf3MDUH00C3CArdXeEKNKmvts4l97yfcgFm2UMhJG
	 7IIXmHlW/hbcRHEGC3WFihxEAWaUCDzv4sQnjV8kRwIULKRzeigpvhxZwLxhPkrMIMiSv
	 TXotIpiix+7qXv8PTZ5OEZozwfsnm0znrk9dGoXEc4rqzZ0sViqs07/2KqBzw2dAZHeYV
	 GDXAnoaFhK13oj0Ob8WLJSnrwUgFkSf3zHAUw2OZ2XKPADklMfnjwen/4kvCIOJW0AAzf
	 IAttWzlw/MSdztjtCqzzrcFaEcIzqhqFCr5qA+kV2gxK9w07Q8maTVwPVxdu+qUOIsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=88rAM2oHhFqNhLiz8qe8zFsCZuZ5oGk0TJbNGquyza4=;
	b=Oh8P3uUfCGbE2SXP+hk10pc9PBbW6ZYHqN/6bOx57vwwV9o626RQOtcbEXGI6+dEhoT5
	 KzBEWnGrZG0XSZEOZgvymL1baTWq3ccskacv5Y1D8k8MkN+klzycs7+Y7Ntjuff5Ntgzt
	 +0TdjW0bG2cFad4P7AVHqXa8DFdFKpXUJU4O+MPPBZ/H+huxLcBBaLZUsxJ4hRnOfIoyu
	 EXIMI3CA7+hyzkoWE607vSM9n6Q3XwVSI4itUGoVoG8w7NwZdbEmB+FWiW6USaLLIDUcQ
	 zLZlwFvpyrCjYu+iHyWXlYr60KBFk4/aGRi/Ja+eR8g86dgKcdJ5wh7TXwER3pWrXtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mEeLGdIL;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD31606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD31606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mEeLGdIL
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a8cc11ac42so3098090c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794403589; x=1795008389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88rAM2oHhFqNhLiz8qe8zFsCZuZ5oGk0TJbNGquyza4=;
        b=mEeLGdILxddied5+J5ytDjMBs8y/z9lOnZA92CI5+T5OGiiKebFbIyyn/YflaHYzhy
         loWwkNlUG2Dq9A5lFvCmZDsFKmAzTaEW98Ibzg5ZZMXpRarIj7JPYzW6XoFSe+5lJrzg
         7ULt5y+KeoFQ83fNf1h1IxX9H7W4yNXa1Clg4KI8i/8RMp5Z9/YoacwDqYd0rlMkTk3V
         4amUgodqLEUZVYv6Ej6/qUWAdXR4aAH/2In4aFQarkv/ThxmovVDsUlgmtpMldkp0NwI
         ySJLfF6gd9EbGhEFQ0aAzmkqaAfY54hHTCJ1dPQb8E0C26VEiOmSFmIfthQ/3COuHOXw
         FPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403589; x=1795008389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=88rAM2oHhFqNhLiz8qe8zFsCZuZ5oGk0TJbNGquyza4=;
        b=kpIQEZUqTSyrn5wMRpkZo3wK2BhBlT/hYYMwUX1zJeqKyr18y1O2dFMGJK+st3HtVu
         kVwFs/lw5GWiq68gVQuyOF1A99VtphDJ/aaMzOyvIJ9GALvCcJ0vT9WnURU5oeyuB/Xm
         jPc7BbY8vz8QSvftWSR3YAckK7c64bRebpk4N/TDYGn7YF3fbnBHsfm5U1wPIFO6U19K
         NOQ3KK6Ia5MO1T+D+QD7iMqAvre8aGKEqrsoqUgFtF5KDT3eSluP/MWl0oumu7mR7Nr/
         Z8JevCKQWMtar9A5ne6o7rWkMQHqKHyq/G2p99jtl6wb6XAp68BogUOW4AVyiV3+de72
         qnXg==
X-Forwarded-Encrypted: i=1; AL+hErEUBQn0bdglGj+T9afwo+8BkaLOc9ZKQX9NQ2ULSgi53w6nBYVaRlW05jBAQtfl4j+dGyJSg4u93p26yuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8962RbPOPDMsAc9dF/zDhlYRAdItCvL7K34n1UIMI7e1h5ZSDj
	5B/u+b7uwVg9qi3e70jjzrxUm165q/PNYBho27rnkPvCeJZkpVU2/fSj
X-Gm-Gg: AYBFou28tTC5o3EnG7lc1o958QLe/+t+nRqxOYa6vHbymAgP1qyuUHEyRhK09kTy/jP
	VCM+8mZhuBNelmKrYWLDeztKe4rzpHTH5cBPcFbKwwrwoS//6zMCYzBhxtNjw67kainE9eSaZL6
	GC1nDFsLnKouWYKvmqOrwdl5CEc7pfHg2cK6mKWGgUpIsNwjlq33IdQVIAEmPm2qLQQeKib1udm
	ogBxbn9uOFTagVRLhP3dmC7q4gMjES+GoVKHZqPEGALkyEtu1WbT/Za9wWWVaoU6tSXeXrxSoDM
	zwZyeOqb07UFLp9Gt1axBnc29YhqmOevuFK1t4Y64RNAjCeKMjORYhciBXO1R/8apc+ZXuqxtCj
	iue/zepxC9JsOC1dRnwV+zCnS+FR1T98BcYtHv/ropDOBAGcdN9nYvguzsoxA1CvsQiUqB4yv64
	K1FbWJ4+y7wYi/6HrXUlYSb6o9nZR7lfAtDWtOO/sMcyg2gbJC//HSxMiyV5tx7dEs21ZQ5thHY
	AiVvxMsxd3Q6KEWiu5thQvkSMKO9fEXH/3RoCOBQyQ+Dfi5/y+F1/4cemh64DrN17931vUNi/dw
	3Tx4u0jvqfPYQvUE4lIa
X-Received: by 2002:a05:7022:2510:b0:1b2:6844:25c9 with SMTP id a92af1059eb24-1b3c024a16amr3072928c88.3.1794403589243;
        Wed, 11 Nov 2026 05:26:29 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm33053502c88.10.2026.11.11.05.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:26:26 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v5 0/3] perf jevents: Check the JSON keys a table may carry
Date: Wed, 11 Nov 2026 13:26:19 +0000
Message-ID: <20261111132622.2349165-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111041045.2031464-1-takano32@gmail.com>
References: <20261111041045.2031464-1-takano32@gmail.com>
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
and the object is built without whatever that field held.  Two of those
are in the tree: "PublicDescrition" in 16 entries of an Arm table, where
the lost long description repeated the brief one and so nothing a user
saw changed, and "BriefDescript6ion" in one entry each of three AMD
tables, where the event is generated with no text at all.

Patch 2 makes the model argument optional when the tables are generated by
hand, and patch 1 names the metric that has a name and no MetricExpr
instead of failing on the file.  Patch 3 says which keys a table may carry
and checks the tree against that, instead of reporting the keys a run of
jevents.py did not read.

v5 rewrites patch 3 rather than revising it.  The review asked for
something strict and simple instead of a near-miss heuristic, so the
similarity cut-off, the tracking of which keys were read and the wrapped
objects are gone: the schema is a list of 51 names, 47 of which this
file reads, and a key outside it is reported with the object that
carries it.  A JSON Schema would say the same thing, but perf's build
would then require jsonschema, which it does not use today and which is
not in every builder's python; the list holds the same names either way,
and a vendor that adds a field adds one line here.

Patches 1 and 2 are unchanged.  The check is still something a maintainer
runs - make check-jevents, with JEVENTS_CHECK_ARCH to look at one
architecture - rather than a step of the build, so the generated tables are
byte identical.  An architecture that is not there, or named as a path, is
an error rather than a silent pass, an object where a list belongs is
reported, the name of a metricgroup is not treated as a key, and a small
perf test runs those cases.

The two misspellings the check reports in the tree today were posted
separately in November.

Link: https://lore.kernel.org/linux-perf-users/20261108183846.3804875-1-takano32@gmail.com/
Link: https://lore.kernel.org/linux-perf-users/20261108184600.3810059-1-takano32@gmail.com/

TAKANO Mitsuhiro (3):
  perf jevents: Name the metric when a MetricExpr is missing
  perf jevents: Make the model argument optional
  perf jevents: Check the JSON keys a table may carry

 tools/perf/Makefile                     |  13 +-
 tools/perf/Makefile.perf                |   1 +
 tools/perf/pmu-events/jevents.py        | 228 ++++++++++++++++++++----
 tools/perf/tests/shell/jevents_check.sh |  62 +++++++
 4 files changed, 272 insertions(+), 32 deletions(-)
 create mode 100755 tools/perf/tests/shell/jevents_check.sh


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

