Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368617;
	b=hAxkC5p5AiUPKauNxzu+QimP17tAfts9znIl13pueogFgifExZuem8ZPIfq84YC3jFZ7
	 FjtNgvGjFyMfPMHbQeGVsBA2uEJpeSwaNXWyYodm4TJAqwgBN6eZJhnAsLM8+xXZZWexz
	 TiSxXRQ9KezkATh9je7ciJqZiD4qCzKDfeqIVpjTF6+YMyGdL/Z3zmAbw9kKQ02asMIwz
	 czonfL5yrfSWW/XdfLsBFuZMG8oGJv36vbctPx5rybFgdQzKyob8yCyNgYxC9jDmNNRWd
	 Y4/uBAtNlI+fzN7SIXAykFXJGtMr5muamiI0K+gETHZcjM2CFmKIUeHk6MlflK4RsWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kwYmMiAK1P1mFFs+hIJi/yGH1cRLg6EtQq/T8ZaVPig=;
	b=4ZCbwIbHnZWe1zcrgjgCv4lhqq/Tvhz4zNnLPXSOiEq0FvI2YQ4ao94dpW1ciArUrcZ7
	 so2jyTDbespqZCzGB1K0sVQ4tVdzA+dEvlRYzpe5H5WI/qstZXK5ounYIMOJdrxYmSnKd
	 g9U+e3jzNONxCl9eSB3nyzv9TT5cSrCAri5vTZn4Ry8fyB/H8zMxYeXdTGQNzFksS3FGx
	 T/wKp0aUMhmrn2h0oT85TdpQoWg0TL1RolGTnNt+IgZGhH+TfH0gyobqJG8/IzlNcAIGh
	 D/BhFEQI1cB+ntJ3D/O6YrF4Sw6p5xMguusH4BOWBXmaYXLe2vaQSHAhSOt/lnvNYag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D7HkTN/U";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C190606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C190606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7HkTN/U
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36dbde64409so5734274eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368616; x=1794973416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwYmMiAK1P1mFFs+hIJi/yGH1cRLg6EtQq/T8ZaVPig=;
        b=D7HkTN/UMhUlUGCGHstMsM8DqUu1y/DIEAddi662Y3nvS7TP417Zhe6oLXHZ2H8Pa1
         +SfmGE2KB/mOVHP+TJRSbhwuTpAZjsJLVSsXHT171CWgyNloUDuny/GegRV25gwJbyfI
         K27oacP2Cv4gptuEfj+Wj5lM3m1KLSmYTlYk9v5rDbrfi43SwDzshpSIDvKGQ0cMUmBs
         hRxwo4ClMnua1dCGwtZvHMyRhdPtJNbu919NiDDoZGQWooaY/cdKRVoECrOyg1xXxG9V
         yHaekrLyzkdZW665AgMxCLxyRUsmpIh45PKdatgN+zb73H5fqw8U3c8VNfduEZ3WwwY6
         QP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368616; x=1794973416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kwYmMiAK1P1mFFs+hIJi/yGH1cRLg6EtQq/T8ZaVPig=;
        b=0EVVoLne4pPEjvpxW2PpG6fp1EE+KHnscb1tkVQdZN4UN6SOZC6xWT/xx5ohcjqAMD
         /cVI0xjfEw6iFVG8WYTHGesNrrpkCpHxmWshj8zl8eES1TCvYj5Y04svxtpSijjw99gE
         3BWTfgAIPuoLXK3oEuC4Wy6W1qD92u9PrboJ2wuBWU0EWlWTMhw6U4/7cFmU3z7QZi6A
         EMqMmKJ+hhxlJwm8de1Q1Mwner/BWM5Bl0nPQSycgGFL0ZPCHTFESC6umBPQ8JioLkf7
         F3oqrTQdMPm8/yk5t5/6/YUGvKNwNXfwIUo1fAEiXB/aejM4Tg58sHFUGvInKRFMwWOI
         QC7w==
X-Forwarded-Encrypted: i=1; AL+hErFgkkMB+Cu4fq/gGN09cboviTI3bx9W8qWfrYJiByq9KESHX8PRVv4Ci3i9v3TESNEwqUKf0AoaYzfAnIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DauhNDnWG73neqlDs7c+SCJfdt8RKOWgyA9CkAqdUUZkABL5C
	EQLlTDJEN4u/vuuKBZSWJqrqTAo8qMkgJ4LybnpoB41t2o0uce+D1ny3
X-Gm-Gg: AYBFou3+Eb79U1dgI0/DKgOVWGW+zj73WH+hiJfypsTOKreTevavJ2GWs8ZLjRVpaLy
	Rd8IVyg1tAL279i3ZILOdyp3z/3BG2gBu8tC6irCuHtcc8XSWeHyGySh1u/oMFWkWpElllM1+EQ
	RL4jX5O5NgPHhrjVypRY8WOlk1CiQbkbQGZEAWISu5cD3sDF2x/7nD+I0sBNijKaVL4sWP8xIZO
	pYbSLNPOTaP+DH1hltmaIm5CLhsfD4uSELrBIZtwlVRubilg1QYekMlyw6DRHvCU+ohoC6NDvN4
	JFGuvsCM1BrJRaY4TMy2O/mtnRkzv3z5pNyAEFVHAF3N5gMRR8Ahn+OAyRLU4/zxC4zimwKpEBs
	+3CNjUCEFCsZ++33o2LFf4H2UbfcSIDqMeuTDiXmeFrKh7VncE4Sjf6dBHBQklEauUw5WmBmpFp
	YZh9b1LYqEXwrRnNkRPczTWjoA58Pcs9aBCXZKhW4rZj3oMJM5UM1Tp3YbvGHzp2yOklTLjR8i9
	/unAwDyFHNIQEyLCt2Y6MSNYzQ/aFJFYJVag92yKVquk7voiTsF2DECbAVSx6XQucVZ2VEma0jY
	qlAnKU2bj0LtU1CSRi+JNA==
X-Received: by 2002:a05:7300:8a19:b0:358:8f02:e0ca with SMTP id 5a478bee46e88-376854b83d1mr1582555eec.9.1794368616376;
        Tue, 10 Nov 2026 19:43:36 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm13498026eec.19.2026.11.10.19.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:43:35 -0800 (PST)
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
Subject: [PATCH v3 0/3] perf jevents: Report the JSON keys that jevents.py never reads
Date: Wed, 11 Nov 2026 03:43:29 +0000
Message-ID: <20261111034333.2019831-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111023448.1970467-1-takano32@gmail.com>
References: <20261111023448.1970467-1-takano32@gmail.com>
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
 tools/perf/pmu-events/jevents.py        | 397 +++++++++++++++++++++---
 tools/perf/tests/shell/jevents_check.sh |  68 ++++
 4 files changed, 429 insertions(+), 51 deletions(-)
 create mode 100755 tools/perf/tests/shell/jevents_check.sh


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

