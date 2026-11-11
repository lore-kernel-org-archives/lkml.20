Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409769;
	b=NqmzWG5gFwKTKut/D4GlYNh/emwH1TRQxmHPDGzWYr/n8G8kgzd6O47O4iHFZnPDD7jB
	 JPBYVcqAqk376/N4EfaLTiQSagk0HsOWWJZBmaPnbxmjWUj4a5Df6+C+IZtfsSYaNP7w0
	 msWS1fSgp+KPM0MoKgvVS5lAo64+4kXARYUHZL0X2KR4CVkhzHmt0c/FJ1QgcEaC5NfLP
	 YnttHuitjH9EfXOroCGe0Ag0Tpu6160urXQvjBPbm/u03DtefZRLGPGD0QuBBRmqiYhtz
	 X38iGgsLrbftRRmDIYZLZu4V16xlpuc5Hzgufopnf1EgibDXQjT5gG784T/h03gbaMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AFn/Qw0D3tKs9pUdfzOYxJpfxee+cN+QZfY+pRX46I8=;
	b=V9/MPZstUMv0+UhZdFyMhnd81i6OnxlcZrkfcbuc3r/aZwgdnmaX8884TUvxJIsCFlqo
	 heHnJrpULJniQfDtwZb6Hkf3zc8GfCbk0xjuKuSJlt20A6Q97BmBZjFGNd4f6t2t8Nb+y
	 7Tfts1qSHNzANrIFa+eUAwJcK2Jx36DjIFsEs6JsI495qzFcbNVFBaiMfsw+kyqgwIC/X
	 wqrSrTmOy1no2q8xEbyejqVDcX7AU6OGuiZTTG1I/ztvkomXuAqVOiVCH8wJzawaCAT6J
	 eqtS/VYyVxaS40gRhfitqb76cKfd2B5Oh2RldhR7IM5hiXLYNdS9NgJQN7jwWBqYuwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZXYVgsKA;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394B4606A883
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 394B4606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZXYVgsKA
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso6761189eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794409768; x=1795014568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFn/Qw0D3tKs9pUdfzOYxJpfxee+cN+QZfY+pRX46I8=;
        b=ZXYVgsKAk53qpttghbRMIXr7FeIApxCdrrH5CUxEEYfIcTnDtKR1TyYgkxV0xfPJaN
         h/4230sx5P/vx0q/HCkOF2ma8+Oh3jYVQuXN15lKY8SEljtBtmjOaQJKigL0yi9b+6cf
         /N2jKjlGDGCGOMCJcctreLbIcMi2FJkvS6wr1IC6z5zF+HnC2+dw15nWkD1OuiCPj1lA
         mISqryPmIabtUharqu7kdqR7YMAhvJo2axhdGxJnZVnJ+2B3g8KVjdN8VPvepu9fI5r2
         0W81Ze2uE9hSlfmPm46XxeTssmRJ+48yudBf6CxtCAC4/EVrAQMwFdULEHW4OWkK7x2R
         D+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409768; x=1795014568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AFn/Qw0D3tKs9pUdfzOYxJpfxee+cN+QZfY+pRX46I8=;
        b=xvkeAHn/ziKAHdeQWFo03Jxi/TYkb3eEs/cPjZUO2xitOWCxRKNI9nB7aadcwLx702
         fVru5FHxO0a9dW/HtaRV/tPNmaVA2qJUh+5fein+uU3oCaJH6v9Hv6ynF7vSby0sdKMY
         hiHk6jWc0V2lKIhq6UJXDai1n8iSXnivYbKF5hLJmgM8U8kLVwuBDyL/7CTgQqxSDzfs
         X3GWSTa07h/QGi7dFxZ/46fsNWzpTh8coa48JSGU9qsbCXv6Ly4u4N6VdYKgDX4k5SuO
         qjMtjeAQGcguVEC2GbmGuvOb7GEXQXcnT78mFmoDalxbeROm7b9amT3TQkaEfps4gNRH
         hKpA==
X-Forwarded-Encrypted: i=1; AL+hErG0sQhU98RDsPD5LgwzpGAtxFh561haxFNwJAGcAUISstjJCcir2TpfMEfDD2JohzQYo6zJ8QlerjJ0BhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8chM3VJGXs+ktkkd+yzqX/7HHJlB2Je0oJeBuJ5ctaXREJws0b
	NepdEgVME5CMoFcyoF1gAKXCG0D5XW9Pyn/SYYRQC4Sxl6DM91TxEGhN
X-Gm-Gg: AYBFou2WDKYpCsfGkhTi2jLkS6PfrNoTPRGlOGas8Q8AwvBtYpAPcHBkhHCSON0XhYv
	mDpRmvMmJOgYXYQTE81xLE8Xr3AdA4xttS7DxlFwWESUdSUGy1F96CdB0APOhqFyuVyZPR+ePg9
	QH4OZSd3o0M7Edr/LBPlFctMcv35LuKh79cBY1jToFZdFb03s/m2C/M2or2JKNEyjCPU7hjtJoZ
	oOCBziHA6FbfaErxbnDJJB3fL0+6j2ZmZ6NrLQJHYxhqYMZWT62JlC7LJwVIo2yw7eivPKtVhYR
	QqodOYc+9bljovLIUOkA21/uREv1ajywQILD/vFKZQlMBP1CSpMvuSa4lS2nieeSisVL/Jf4UZL
	vndtiqFdG8dh8NaJolnzasvN4+SnwRZDMYUScJJaX6KxZe7tJ09RbwsU2lJ3ADd+RuIGwpWtYbl
	T4ikulLrMpbWOMJK3bR4tw2luRvxokrb1Ph9YihkyRpHGAlnc6BB1pIRBs163AilCDskaF4hx0A
	W0+FmH12ETNbzoHwAR8lwHxZoAVpkjaOIYfPDmCnQ3rwBLNPkrnM1hHGB+nat0OIOxEBWerT22X
	23Mimx4kSqJoDDC+c2mB
X-Received: by 2002:a05:7301:fa0d:b0:36a:1294:59e0 with SMTP id 5a478bee46e88-37685c7ab1amr3814775eec.24.1794409768204;
        Wed, 11 Nov 2026 07:09:28 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm18162507eec.27.2026.11.11.07.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:09:27 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v6 2/3] perf jevents: Make the model argument optional
Date: Wed, 11 Nov 2026 15:09:19 +0000
Message-ID: <20261111150920.2383157-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111150920.2383157-1-takano32@gmail.com>
References: <20261111132622.2349165-1-takano32@gmail.com>
 <20261111150920.2383157-1-takano32@gmail.com>
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

Fixes: 5a09b1fd1b1f ("perf jevents: Add model list option")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v6: patch 1 names the file as well as the metric when a MetricExpr is
    missing (the tables are read through a worker pool, outside the
    walk, so the path was lost).  The perf test's one-line description
    ends in "(no_mlock)" so perf test lists it whole and the test does
    not take a memlock slot.  No other change.

 tools/perf/pmu-events/jevents.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 843748915c12..04ef2f488283 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -1487,10 +1487,10 @@ def main() -> None:
 
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

