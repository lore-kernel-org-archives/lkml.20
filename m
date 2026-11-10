Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794349375;
	b=cEnV0CyP7DWpIQMuAdPRtQH/9DHWZYtHyWW0XJuH6mcinjj0Sge7HMqkP02RB/Jqny6M
	 r+cu5WSofYHMo+DQtKNoMXeMZ0+exM3KVFtYjGjoZIJB1j/yz/WT3MZmTnz3ksFcSbQc0
	 5HsL+yTjj0cxJFG6G9YVBV9fIIzLfNmZu1FoNN3uiAWQ+FCrzGcqqgDia/9CtZRJh9KsI
	 qzKX+whYX8BZXENM+sT+P/BYGJbY3ZlijhFJx0l7lEIJcmMDGpk1TF/coQe3R0h8XDUzi
	 pCsNVyYsGRR+fHNVb4qzW1HucDZFSDLXE8+1cBybRDsfxf2qKkcSxUvbsa9r1JYDMEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nzkx5Y7z3GIChRU/hZqVulN4xodJ9kYrg3nMUZEDXio=;
	b=gjqBiYk/xQ0zweknjgGhzLoZYxBRxuRZ4pwbtr6xVKzAPzDzlFAUqym6lUOlpMMHJPNJ
	 13B5IME8FN58Z+qSD9N/S7UY6gIlc3hYzUsX2xnKg2gZMmv41sLp5l8iFX3Gk9dLB9UKq
	 uexJ6qXLo7SAO/PtLPvZUksz3XbInE95eOMp2S9qqDV92fcaxj1Ae1od526Fdgn+KapGp
	 Gop9XHqaWVKgj9Cnd4DeVs14+fUo2+Wa1ojT1NvuINDwGuB9AWH7FZP2wbhXDjNkpbQIh
	 m/T2uHInQxkR27WHMPMed5jk/0S0uY1zxNWd6PAhY880Fg3Edn3W/P/wwzPPIKJfeoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XvGTBhNm;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AC8606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25AC8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XvGTBhNm
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36dbde64409so5283484eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794349374; x=1794954174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nzkx5Y7z3GIChRU/hZqVulN4xodJ9kYrg3nMUZEDXio=;
        b=XvGTBhNm8d0MD11G6qWywKQ35ggeOg4FT1eSVAWDia5zbdPY+cv81led/POLu1qcUJ
         vZ7ppnRN8Il9qxWg22mvNWwtGQH/kfSBvAFTvVyww9qOx9FGY/wIYoJAOBMMG10zuAYd
         1Ds/uBOOs7FXFC1mXSthyZ94QY2NDrUt9ggbehlWkgZlYhQAgv+4LN73AufnKE8p41zU
         JdUSFbeJJv1MU1STWIf1lUC2NiOVkZTpN91QBSjidO0D09Rb1wIgoxY9Hsji2ZYL+n3M
         69L8gROaZFGz9y/+Hmghfy+vQhaRnwop9UwlAceugMzE/V9dzrIZ6eJ3nk+EYtAKUrc0
         +lOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349374; x=1794954174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nzkx5Y7z3GIChRU/hZqVulN4xodJ9kYrg3nMUZEDXio=;
        b=T+YEzNARSteNodnwUOaWfz44eT0sIgBEbT94p5sWoYMuaTqDTaShxW1NRcRY9gki8U
         wM0N8ISKs9ZDnGpFC2SZskSquvbJDnq7/PIT14uZxccAKapK9ltB1B+KKrWYax8jQ3kQ
         dcm27bGi1HPx1tJL/iAOM0RXSC/4QexOM1F6QODKUCkc7BoTlRiYY/+TNcg1Wgy4cdTO
         dA4fU1Wxt74ydIasSWPaP1i2PDNp6JetoZ8wPbLiIc24ytKKqu7bOlJbB/UhmAt/RCGg
         ZOwB9PyBf8vsDzZ66EDGM735j6QOMBWFfiGLsYhlAGslC8rxTAysBNNPc0+CRnQeyEEo
         hMlQ==
X-Forwarded-Encrypted: i=1; AL+hErF5eDFReK7bwjFRZr79tDKUvf+2qSkMeVdwBmb85jkbtSVlyJXYVeLu0UOjwEAQvp3AstnPpy8E46sdPX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DbIzGkQ23nYAgOY3tSfXsobVE91KZiBL12y8+C/JTWIMwcf7U
	mYSSiYRkYa+cY+R/Xx7jS46rpBOnovGKULFiIQbnQCzEarnxEPig4Tj1
X-Gm-Gg: AYBFou0ZAIMRoQF72+n0qmpk8/qVEBRoVN2K/bS0GDmjzpaDxdGUA4UhkvAM4nArryd
	HwMCgqKAAIM5QjyIRCNd565R93DPpbduhC3CkZMLraCrnLaVGKvbGFr1Ag7WakamyUXa7RQLp1k
	Iy594cXXUUDvRYXFYy1aGK1GV4BZVPZFyzqw0OKrlzEv6k2rMsH4uHQMMIrobxoV81XeE1qXyUN
	XaeRwaktadeKX1kAXMpyMJTXDseP3BktU/6q2s404rgyjMikMuozIyS+3fM9LIZLtdwWqguS0tk
	j/I1lbW95ik4tEe2I+JgVtM/O6L36fEUlHgTudJc9bnAR+F7jj/rJ4DtDdn2y5e6cvKkT55jZWB
	yifME4RFYFq6pNcdkHnFij2RYKVluC5jOcz3RPdugvNl08dJht2DJp/BTovilKojluvM5Cv9ttm
	/JPJ/kJ3/rOTroENu5xXgjpOg6H59BpfQX95vDNOcRO3YKe2MKizsHIdpQqZzFPhQs+71q2QeI0
	EvLz0SEIvbmBtI9zxH5pg9IQJCBL/7xgwgMba9TnWkhx0Sx4+Y5TnuuGHiiPFNVfAa+5n0Yt5pi
	+NrYWLAHGMEImu1TC2wp
X-Received: by 2002:a05:7301:428d:b0:375:c5e1:931d with SMTP id 5a478bee46e88-37686171ed4mr921591eec.25.1794349374111;
        Tue, 10 Nov 2026 14:22:54 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512b6asm9165030eec.10.2026.11.10.14.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:22:53 -0800 (PST)
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
Subject: [PATCH 0/3] perf jevents: Report the JSON keys that jevents.py never reads
Date: Tue, 10 Nov 2026 22:22:47 +0000
Message-ID: <20261110222250.1864777-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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
 tools/perf/pmu-events/jevents.py        | 394 +++++++++++++++++++++---
 tools/perf/tests/shell/jevents_check.sh |  68 ++++
 4 files changed, 428 insertions(+), 49 deletions(-)
 create mode 100755 tools/perf/tests/shell/jevents_check.sh


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

