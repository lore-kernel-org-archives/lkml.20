Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370249;
	b=PQdB8pZnDBMO79KxyvsLlQqh7QDF81wUdxkvHhIoYonYQh6hNlr5loDs6S1WmFE6dZm4
	 QzD8mppK9phCTHRi6gaxTMwTePv2yznAPpE7itjs5szLXoHP/oHopjj8b96onLKmwaZaQ
	 KMesk54qcKHT8kOFoa3fLJhfJR787jSIQ7zsPDCFOLbAwM2KulAnzuLmYgg1hoo0UK5VU
	 kTKS51uHmQr5S3h6Uo2JPY3cPFrLMcdV5LpSULuZ2bZ6jI0EMXSmKhjUBxJmXd50GjjID
	 a6FyceJiT47ccSwNi+Sddo+bFIAohDYqiG/l1xdYjkVVdB893Tc9TFPjXvDvDu+xn5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ySu7MEVrLJUCUm2blNlsN2/YDHnP6+c4oAKwJCwJsH4=;
	b=JNJAJyuBdHnfAVyjFQdhQadnen/i3dTsjQF735Y38LqwKrLzpVopxSW6xErIFJwzuMN3
	 CrDw8rNZW7G0DRRR8YpFf6GhrDvPsfdX/thLUIRUeWHuoobBR7fTJiChJcbvHob15Gdh0
	 h+WcKyIaNeFCSQ6NI97JPri8bL5qWKrZV3Bx/kJ/aCnYIV5w/Hig6qcQ60mtHVc5Nz5TV
	 pd3uD/ThtVkYIC1sj/6tMRkOhoZOprVSMWPHoVtQOtYY6ax/281oGjlGuyaHrP+MF1okK
	 y6yxuNbTlTTbtIxTd/Bj2o65ej1situ0uYpORwlHOtiUm0UVDo+Y50iwM4dFxPQmZTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="M0kHG/sh";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EFD606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65EFD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0kHG/sh
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so4747728c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794370248; x=1794975048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySu7MEVrLJUCUm2blNlsN2/YDHnP6+c4oAKwJCwJsH4=;
        b=M0kHG/shVIGSXiGDCigLoJ5jt51v2QuelVk+iBMsleWiPXx3Q3GA0QGfC3RUcQmc5E
         P4g+Y9kyAzBSzR0cJc936F5Y2EXfUC1VA5If9WYNHPRVCGKQOWz61XyJMy7PPN8BcPKF
         4EajKJuFNHx6se2t51A3330F2Mqm1wx5WoQz2ABZGdNHt8ja4xVqSB95WWp5XC8S4dab
         2Tzku+s/lR9ZulC2JqnKJCSO6f3s8CuytRv60FsI2mqmsEDuOEGwEowj04ljOdpAFstg
         BiAhoUsNFSBbQcV/FCRIfOcutoQ02yGG+IbCYemziFzrmWDWW98QefCJzSQwZR03aBnn
         FRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370248; x=1794975048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ySu7MEVrLJUCUm2blNlsN2/YDHnP6+c4oAKwJCwJsH4=;
        b=LGRoCNUO5K5iT4LUhpKMJV26Slpi80GVxIdkUJBLRHqCByjHIeKx3RNyf0hlkMApTt
         Mc7v+Zh6cn9Vy3FvYotyUWMVcfkmDAbShB/O1cPZZhtwryxXEQIdFxDoOL7mbHSPUK46
         RCJCAwy7LmJauXuwqd148QUTf8WvKnJIwu7eHaSqRvvsRrRdWtfCApqTvHwVGQtImlH/
         SVVvlWhqwnyvBvDox4ad7VAaltft5uU7GZgZdPgAmnL2rZVe76XOrqBsj4kG5Tm9nQNd
         ILxwcMCgSyTcnAttOqBDn3iEe1wNOg614Yx1/sqzy7VptowZSazND5j/KSrHUn3UiQUA
         INbg==
X-Forwarded-Encrypted: i=1; AL+hErHl2FP4aicTsaedIIlS2rnQBX+1IRNtRMpvhhttl0pF4t7bbYsTVySvw2KksHXtle6JzQ2h8m6tIUCKg+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aAsRVzdIVoxrQ7pQCK3fqVUcWlRKRvrA8hjyTO8vNTC6OFnlL
	mVhXbfvogm3/NLnsOKb6Lun1Fb3S/ehqsvL8FDG7J/So9QvtINKVPU9A
X-Gm-Gg: AYBFou1810PxsYCG1/zzUI3sbH4wOvam2YFpProreAapmqxkePdFeVsugQgXw0XDnHj
	Q/AolSYKKjg2toK8M2VhgzdCWNzBde4ECy9XZIixD/7Acc5yawpZ2YXmOg6+ozpfOjhsegwm3Tz
	n7wbC0lptdxCe7Rhw/WR/1CSLW0bCYWr60B+/yKiumSZ2a7LGCcsQ+NFcJ70ej5lRetybaUyR3J
	JC04DQTmH1I28cdUswnrOd2GPYgMJ8M7EA/NnVmjKyB9WtgiFLA0hOfHTBght99BAuKV2MjNGWJ
	kPQmnCT3fYuZwh/EsTTnKUjurHTR1cJKxNT8HcWFIfzTTZRlP7d47Q3oKeIhdEPj6q5M5Uzv16f
	izhHf8RGJVIajmXrjF8qmFWeLvJKW1FWq4RePPoECv3iOPDqfOpdA99NAqSQFaxfFVFBxLOR0XU
	2baXUxcVea1iJGv4EOc/hrprubiC3jagNVKoGeQFwOp3u5ZZ6333d4l09hQkq2Eliq+OidoQ0p9
	RLTDoebi93x0mKxmIiDvxW7P2CIgpAQr1ytjdNs7r/nnTol/VU2D5dRTULoqFkLujza7Xtj3VWG
	qy+sGxeRQMEBr4XXIL+tOvL+vHOtzCmkVO0KZ1qb5A==
X-Received: by 2002:a05:7022:1701:b0:1b2:3742:828e with SMTP id a92af1059eb24-1b3c024f239mr1196609c88.3.1794370248316;
        Tue, 10 Nov 2026 20:10:48 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm11451201c88.2.2026.11.10.20.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:10:47 -0800 (PST)
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
Subject: [PATCH v4 0/3] perf jevents: Report the JSON keys that jevents.py never reads
Date: Wed, 11 Nov 2026 04:10:41 +0000
Message-ID: <20261111041045.2031464-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111034333.2019831-1-takano32@gmail.com>
References: <20261111034333.2019831-1-takano32@gmail.com>
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
 tools/perf/pmu-events/jevents.py        | 407 +++++++++++++++++++++---
 tools/perf/tests/shell/jevents_check.sh |  68 ++++
 4 files changed, 439 insertions(+), 51 deletions(-)
 create mode 100755 tools/perf/tests/shell/jevents_check.sh


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

