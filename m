Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793902411;
	b=4brltA34SdeYmLgbXqXZr78s+K8kc8Sa+JNle+jFvfg5GTpUOa5e/q30USuhiBBnFZWg
	 FvhVqX5SYB0VVQFhO74nIBWhmLls39ybVpsU8Be8Nx19eiJYLJgqpVq6LRVRiLDcVmJ2X
	 dtyDIcYDkuGtcvsqibx1l9coTU+GBQCz58WVEXgV0pGBWymvKaU05YG5PMtjeqrEb1Kcf
	 fpvXH43qFcRwwbJ4sdMXH2Op6u+BGq2xKvQ7H3xA5pCf+crgDJo/cNRizv32/6UGGhMn+
	 W9ouW7dSwDj2odzTCLTq0Lw722fh0QdEvuHwG0Z38XfrHEPKwikCnGqjAS1SYbSNy/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=098pJ/mjCtdUXxQuc1quST9UBoetMnmWWS/d/SLNK1c=;
	b=MzSPS8CGBsWDFZ626m0LZ11I+1rIY3uRL+bYrlBHChT9BkLz+KJZsyD5ATw1CkVHU4wh
	 NR52emOmi1buImThUE30q/9zfra8oQ6cbv4HG6O0+4+4foZu9i/ji/KaGdJRpcjSVngNW
	 fpUAlQ67M7vy1GpX8M40558Xh/RReDnwfilcvWn/R6CqYwBHxHRMPrWvvUAcUoQg9Bjsq
	 SnXaJpDX4esuQvrE67Ok126y/VU5QforPnZYqBR2JJDRIlh8ySjzqdnyBbIsNZ9wIElSk
	 OMyn1iywK0AYjB7gDpdxtr2LjPLEBzshM2wqlFJkY6lu/UYoKq8e5QKrjAAmyiuL/AQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.oaklandcc.edu;
	spf=pass smtp.mailfrom=student.oaklandcc.edu;
	dkim=pass header.d=student.oaklandcc.edu header.i=@student.oaklandcc.edu header.a=rsa-sha256 header.s=google header.b=L6TU1sYs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C619606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C619606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=student.oaklandcc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.oaklandcc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=student.oaklandcc.edu header.i=@student.oaklandcc.edu header.a=rsa-sha256 header.s=google header.b=L6TU1sYs
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b31ca7e0bcso22156577b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:13:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793902410; cv=none;
        d=google.com; s=arc-20260327;
        b=GnU9F2RfHk2ph8SnOiF8J1jq+t3Kv0oVdz3IlWIntI1jYr2BGjhQhKBKcCjy+NJ+TM
         XwXqQiXTFfJm7PVa3RkGqHxcPiec+T743JUGXgyJtOCYtzVZ7VZ93hnM4RG9kIFkkycG
         oFJOhw7hspGkQgPM3xlRO9ponwJmWPZscGANhHt4cCiJykOeqsXxGr8r/Sy83HE4622B
         AdpJz55sBqJ6rbdaGWEK5ly3zQQPvIhclQxpkm1AAiInancq3tq2mLxMDJhjOudyN6rd
         SKEZ/J23BnvIwyJJ75UuWrhwAyNVmORfCv/cRI0t5b75VFINgayOLyDrD7vkK31Ywc+/
         GlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=098pJ/mjCtdUXxQuc1quST9UBoetMnmWWS/d/SLNK1c=;
        fh=rjGGFiRASJ+xy/1BsIp/IFSzVOsYd9YnLZ7+PxJn8dc=;
        b=AUn8cv7BYKeTvgqfm1sHFhIf+8qZjdd7H3vf1vRuVQ+FiyZtE/otrBG3LVd3IpPZ27
         ac50YZTjnl35sYcaF3kP6p9FuhD79EbpTL+5WFHK9DE2cqJP2no7L6kiIVW2q7j/LeM7
         Gf/iyW8IvSpNu7pdjTVGTkgDU98dw5fwMA3fjCAV3HXsKsB8LbciO/pebMPe9RNb4TJ0
         +GWMNGxdqyXcDsNy1C55hCL04f0UaFq2SCetsX3F09ZeTRGC4TuTI/a7MHZqsugAOCsl
         FWAGUOkZuMai0XUBkMugJRbcX0dvRE7mtafleG5ZMOfjm0kOlFfhXVekSj+HlQgtly+c
         t/og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student.oaklandcc.edu; s=google; t=1793902410; x=1794507210; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=098pJ/mjCtdUXxQuc1quST9UBoetMnmWWS/d/SLNK1c=;
        b=L6TU1sYs2Py+1Gm3B7HjgxQllc30Pdo9NZiMwe5bW4b96/wYLcAngHynXLRisbOe5f
         MUKBU8F8eFWJELnaETJsBcr7NUqpcZUo6yj0XF7Eu6qANVuiY0FELfwMZtyMWXjJDlj2
         X5lODsb+v6tzUaBb/OeihlWXlVjml8Yrl10cJwIOY4/zmD/dFItCXulgTv2Ieg/qRM2S
         2KJYzSqkGR90c8CDHcjbrFRS/2tDV0atiYuQbgQs/cftTL7DcUu9OHgWRU9xW/IlNmRe
         /XKM/LXkqGrx5gJbQOWBhM4Np+v153Sw7WiYR/czMdPwNm6oe3h0KxTATypFICzBocg+
         hPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902410; x=1794507210;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=098pJ/mjCtdUXxQuc1quST9UBoetMnmWWS/d/SLNK1c=;
        b=ggMWtVHdHyQHhQv+ndOHIn/4XzRSU3qmkF+RE5vfdlFMeeg8hKJkoVXafKZ01cXKKc
         vboMIZfCiIPiqmyNPniKYXUhvXuxQJd0R9LzYEz/Qvfrh4xqffi4gDDqIwaekM9D4R9s
         njVWAFJpFz8w7Iaxh5pKnprx9H/KNanuWVGyG+CuXTXV/TtrxyvaAQKP2nQuHfPRKtKk
         fuOXhw2MxX6y2kNCGzDBsfeUJRqwBU6x8NIKQ9uiY63gMTaYyWRadAdhex3PEGhSTOS6
         tGpocwfcjPfEgJa0jDav8/ux9fIsOrmIeEoxFXhVYxPt5wzU/Ia0LlVDG1LM+718Ko9N
         4M0A==
X-Forwarded-Encrypted: i=1; AL+hErFCbE8eB2g/7o7aChAUg+jdRzsfqGgQpq3p8BFihTsEG8VFk6Ag6zjX32e9k6aHsANdBjQGfMWtQCHWAtg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yeqtxoQ0g5aSACc74nqHWtAEm0l4fifeL1NObqbAJl91ZQFvh
	FGG/Iwo/Qriy1/ft4EwEZLeYRc23cfHLFff9rO/40i0CcjPUZKeEcioKqU8+KyqwpvR+E75yWli
	IyuCbW3x45Or5eXhwQCcvN7sGjmcuPbTjmn4nXTL8gw==
X-Gm-Gg: AYBFou05k86o3z2VUBmleu3BS7AfjgKwJPVGP5pTSUSMi2D7qN2cnSsk/TQdr/BgUmH
	j6L3oSXmADcL1IrH7ongIWHn91gTe8VIz2CXycSPJTXY2ZCSbFEKMdcgEPRL7z94NbGyS0CGUux
	HZH6L2qYkfM83ZLXP4uLgvxIyg0Wryt8Fg+bJTkNCXuClD4qXxcYH3Aknys3yg/7YJt1cwce8eE
	WN4jvJDVIY8qZmOQdfMcfKsU+NMFI+9m612DuSNu5rSy4GDrV6md1z4rn4ytwDupoW1+sxa9XO1
	gWbJ+Ukgn+6wOzsFf4YVuFotj2OonnDCKMXstIG53jZz3dxQ4A0Vi5JlND8xrfivUsQXXv4TEDw
	dsTs8cOMgxUZYX98S7m13Ki89O0BwDqNqXA==
X-Received: by 2002:a05:690c:e3c9:b0:8b0:e348:2586 with SMTP id
 00721157ae682-8b2b6738e32mr154837347b3.25.1793902410239; Thu, 05 Nov 2026
 10:13:30 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 13:13:29 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 13:11:32 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>
Date: Thu, 5 Nov 2026 13:13:29 -0500
X-Gm-Features: AclHuK-HkL__-odPAdZTujQIEQgQe1lLyEI3SQMyBF-rOk0k-MqpTUFrExyNMec
Message-ID: <CAGQButum4PYb4A+hmqg-bJZbf4L3KkH6rT9tn-0_NTs3xLhGYw@mail.gmail.com>
Subject: [PATCH 0/2] kunit: tool: Preserve failures in parsed KTAP results
To: brendan.higgins@linux.dev, david@davidgow.net
Cc: raemoar63@gmail.com, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The KUnit tool's saved-log parser does not consistently propagate two
failure conditions. A suite reporting not ok with only skipped children
leaves the run SKIPPED. A result with an out-of-sequence number can
still be counted as successful, so kunit.py parse may exit 0 for that
malformed log.

Patch 1 preserves the suite's reported failure in aggregate counts.
Patch 2 marks out-of-sequence result records as failed. It depends on
patch 1 for a malformed parent suite whose child tests are all skipped.

The KTAP specification requires result numbers to start at 1 and
increase by one at each nesting level. The numbering change treats a
malformed result record as failed even when its keyword is ok. It
leaves the status policy for other parse diagnostics unchanged,
including a late TAP plan and truncated logs.

Tested locally: ./kunit_tool_test.py (100 tests), saved-log parsing
tests, Python syntax and strict checkpatch with the sign-off check
excluded. No live kernel run was performed.

Louis H. Poulin II (2):
  kunit: tool: Count failed suites with only skipped tests
  kunit: tool: Fail on out-of-sequence test numbers

 tools/testing/kunit/kunit_parser.py    | 15 +++--
 tools/testing/kunit/kunit_tool_test.py | 92 +++++++++++++++++++++++++-
 2 files changed, 98 insertions(+), 9 deletions(-)


base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.53.0
