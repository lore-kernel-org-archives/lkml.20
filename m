Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818440;
	b=I42kiuuEh0D2JavQ8C9JDu25p0hfyvIE3Cp4P9KEhPbjloyWZNIOC4Zb4Ry7hUz8JjWz
	 LiDxH6D0CV7Tx1mlELc+2Xm54BXRcAYW1Hfx7/uHYfuu3Tiro7qtGe6CLzmXUXWNlyUEO
	 oNwTJkerliAtdRcJOid/T1kBEdD26Wiw8H0dVsA/jtpozM8AbnggHxiSaudJGKNYX9N8F
	 gmTMIz4fSOnaGipz9/Lfkbs8mK2wZJYJuh6UEkVNRsEIhGzwArhSkUIkYIJwx1pIPDx1h
	 OHUej8/gt7ksRbUXenf0ZYQJ1dDkUCOS7vIrM5JEej/vIYOR/VV6djdIgeFPQoPbbOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=MW25hjDMN9fnl42Jgp9cMMEDFOlPXuWurbBc7DgYrdY=;
	b=GNdKnC+WBc+zmqOBgbNkEq8Lll3cKmXzO1J8LjrU3QYTDE0dWWfW7jJHEkBRiDgMPSpS
	 gu4aCh0Ti+B32LgaOVnGdH/Beo644sTeiDqO5K/HaHHhecryn29oeHkUDqRQrRsBSVqP6
	 GZXvEJeoxTDUiflmb2LlRmVnmtaT+u/u5pyOWs7rg/g0qHl6p8w47HRqxCtWZQTjCghVb
	 2tT18ofvCGtuUr+nSYL+DEgPdFza27pqqNtZ1UX0E3/cDj69w4T36mzuDdq0aMTPCHZHZ
	 +2hxFQNHqate0GYaVnTB1afG9pdpoIBpQoC1DG2hwjdPlKq4rnHu5eSzkgH/ToMlLeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygO6a+B5;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090BB606EE9C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 090BB606EE9C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygO6a+B5
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0d126f631so11586137b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818438; x=1794423238; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MW25hjDMN9fnl42Jgp9cMMEDFOlPXuWurbBc7DgYrdY=;
        b=ygO6a+B5rv6ddJNrX1cdMEwGNrWTj7H6ceQS2/xXOBM9XJoCUp5m+OcgzbUzn4leVF
         WyLIygXkFMxs2pgG1y+a0EaSTqSfsbjw+YIetz7PdcsTGWLwHuInr9DpZPsTlEBjIH3B
         R2lVkkcSptzriK3Iw14QyfW2wLTp9AckPLZhEDOyBDJtkJfEExWsaFcgydbOwFwlSvYb
         yhBEgRGu1TZOCaCocH1YcriJd+C4GZYOp9gE4naazA4LU95eXiSE+lWEONn0JIpGEdb5
         aRTV4yWpzjOASQJpSC27jvxfOaEddPoIMH3arUzPtY/nOK1SlA7OuBfhlYls+23Btfdt
         sKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818438; x=1794423238;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MW25hjDMN9fnl42Jgp9cMMEDFOlPXuWurbBc7DgYrdY=;
        b=BSGG0dlRABfmohmvETUlNdAklAEsQEfbH4kUwgTFnCMtLlSpnGRzTNQQWiFN8TfXEv
         v2dNN3cutf83YqU4dVkm3ToIQlgM7c+/KBWosCeVRnaxcSNToY/F/qlpNVE2G8GbGv7J
         wxGp/X+Wuzqwg9zz24TsQfojjrG7Ec16YqsvNK0Tj4I03IgtvDiLbM0pyBqXNfk8DjKp
         sHo95vDbYMgiWxrBjLtZVXvhHI8x/BuaJj70EHc50eBG3wKLpq1nZ8KEdVg4rWPEYvs4
         0SUpd8ZcFvueSF38CEIpidj1U0KvRBOgfUJIbdI8ncEVHowbyJHP7DgQEzfVI8CdsXP6
         v++g==
X-Forwarded-Encrypted: i=1; AKwUvBxU36pYIReubQNaFfID6AzC9N3yllM7naQT15f2b+A5dumeyGhg/+UPQB2xa54q9KdZOSl/zomm+Tju1YQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pjaf3Knb5rCdnb1svJWFkbHbr3JUNVk+TiOdVA4FBVFuyUFq1
	2nhxSU+l/WY4CGsgR7aawboLRm4yl12/UNBGyru20HKgY5Ffy2jJCvi9
X-Gm-Gg: AYBFou0hK4yWTjlVbPLpGCSFdQqSsrPjvXsI6YE7k2E7B0hWTkxs+5H4FsB5Qa7gg/V
	7DX8fESnuA9MWuKT/avs8OdLLrYgXiKvScAtNWi7GWE7GLVV7cRMz+x6zdnwiZ8TVUK6aRQ3IWO
	QJeQUzfuRlXfuCFyhBUsV4odOMfRmbRW0o5L03qHSLbEN0r8nahWlYIjqDcjH9NNiYbnqPX/MB8
	0chx8BW7xyDwzY9jyfxkxx5bL+65ByYIe02yc8pJ11+RYcljG1D5zPyG9shHkJySiYpocQw/ZjS
	gI4wOJO8wwlLx2w1rxg8z3sxO7J0YO8tPkleAMp6puaWv5L65gF1tuCrKxtSfocALdHujnJgZYO
	zR0HI4U/+nqQ95YqVoDTRZaEiv0h5OCx6rBEQj2GvsOAOxLIn56qTD2PEOqhuOtFHnX/bRUNbPu
	7U8/WKpey0OCgKcH02W0gFB/h6XD2/0Ak0alQwkeV1WQLUb6sfmhkJe93gL7BXrIHiuwV7GOYlf
	vCcT7CEsnf1ZI0rd9WFriQqccGtrD8/o1IhoARKKtIhx+9D+Ms9mcuRrY3O1L1sIGokDMWt/4KH
	XdRIXmQ0hPQJXqa/LRFh+BIGhPrvZIztA2PH6HMmFANAmXs+kGM0O97Sn9TeVb8OPq9RY0Wf++O
	OCHRIIdy/qg==
X-Received: by 2002:a05:690c:f05:b0:8b0:9e27:fcd0 with SMTP id 00721157ae682-8b2b66c4171mr120311327b3.21.1793818437748;
        Wed, 04 Nov 2026 10:53:57 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309b9f50csm24364847b3.38.2026.11.04.10.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:53:57 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v4 0/3] perf alpha: Decode ProfileMe samples
Date: Wed, 04 Nov 2026 13:53:55 -0500
Message-Id: <20261104-perf-alpha-profileme-v4-0-1771ea02950e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOTQ6CMBAF4KuQrq2ZTgmCK+9hXJQyhRr+0iLRE
 O5uwYXEhLh8mZnvzcQ8OUuenaOJORqtt10bQnyImK5UWxK3RcgMARMBmPKenOGq7ivFe9cZW1N
 DPIUwy7KcJEoWTntHxj5X9nr7ZP/I76SHxVo2KuuHzr3W3lEse38qRsGBmzjRIpNpASAuZaNsf
 dRdw5aKETeIhB0EA5JpQgM5UIL4i8gvEl7ZQWRA4twkJIpCnaTcIvM8vwFL/6wuVAEAAA==
X-Change-ID: 20261028-perf-alpha-profileme-8010299be323
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4163; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=mwri5c3a60UO9UOwmoXQFRAV5LNNQJzOrWjLaoTcg4E=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe17s4z+N4sOaUzbn2ZQ/cRSQ8XdIsV4bMNdms1ZiWd
 TSuOZml4yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK7pEmFk2F0nFFCxut
 H/RXVl+NMnmw3eHBdWTn3BqLHL99U5z6a75owMGywOb8kukUj4aH+xTIXVlN3jxIS957Y6rTURY
 rdj8rnPAAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha kernel series "alpha/perf: add ProfileMe sampling" adds
ProfileMe sampling to the Alpha cpu PMU. Each ProfileMe sample carries
the profiled instruction's PMPC and its I_STAT and PCTR_CTL status as
PERF_SAMPLE_RAW data, which says whether the instruction retired,
whether it trapped and why, whether it was a mispredicted branch,
stalled before map, or was killed on a wrong path, and what PCTR1
counted while it was in flight:

  https://lore.kernel.org/r/20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com

This series is the perf tool side. Patch 1 decodes the raw data in perf
report -D and perf script -D, as is done for AMD IBS. It copies the new
uapi header from the kernel series into tools/arch, so it should wait
until that header is merged. Patch 2 adds a script that sums the status
by symbol or by instruction, in the style of DCPI. Patch 3 gives perf
mem a ProfileMe event, as the kernel series reports the DTB hits and
misses of loads and stores in the data source.

To try it, with the kernel series applied:

  perf record -R -e cpu/instructions,profileme/ -- ./workload
  tools/perf/python/alpha-profileme.py --pc

I tested this on an AlphaServer ES47 (EV7). Sampling a loop whose
branch tests random data reports that branch mispredicted in 21% of its
samples, and 0% with sorted data. As a normal user, perf mem record on
a loop that loads one word from each page reports the load's DTB hits
and misses.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v4:
- Patches 1 and 2: ignore TRP, and MIS and the trap type with it, for
  an instruction killed before it was mapped, as the kernel series
  does. Thanks to Ian Rogers.
- Patch 2: record cpu/instructions,profileme/ in the example, as a
  precise event now samples only retired instructions, which leaves
  the killed% and invalid% columns at 0. Thanks to Ian Rogers.
- New patch 3: add a perf mem event for Alpha, cpu/cycles,profileme/.
  Suggested by Ian Rogers.
- Link to v3: https://patch.msgid.link/20261102-perf-alpha-profileme-v3-0-4bf6e1dda733@gmail.com

Changes in v3:
- Patch 1: silence -Wpacked around the uapi header, which breaks the
  build where __u64 is 4-byte aligned, such as sh4.
- Patch 2: only read raw data from cpu PMU events, as a tracepoint's
  payload can pass for ProfileMe status. Thanks to Magnus Lindholm.
- Patch 2: print a table for each thing PCTR1 can count, so that mixing
  events no longer averages unrelated values. Thanks to Magnus Lindholm.
- Link to v2: https://patch.msgid.link/20261030-perf-alpha-profileme-v2-0-9ce2f0b0e622@gmail.com

Changes in v2:
- Patch 1: copy the raw data out of the sample and convert it from
  little endian, so that it decodes on strict-alignment and big-endian
  hosts.
- Patches 1 and 2: follow the new 28-byte struct alpha_profileme_sample
  from kernel v2.
- Link to v1: https://patch.msgid.link/20261028-perf-alpha-profileme-v1-0-f46c1938d001@gmail.com

---
Matt Turner (3):
      perf alpha: Decode ProfileMe raw samples
      perf python: Add alpha-profileme.py
      perf alpha: Add perf mem support

 tools/arch/alpha/include/uapi/asm/perf_event.h |  31 +++++
 tools/perf/Documentation/perf-mem.txt          |   3 +
 tools/perf/arch/alpha/Build                    |   2 +-
 tools/perf/arch/alpha/util/Build               |   2 +
 tools/perf/arch/alpha/util/mem-events.c        |  17 +++
 tools/perf/arch/alpha/util/mem-events.h        |   7 +
 tools/perf/arch/alpha/util/pmu.c               |  11 ++
 tools/perf/check-headers.sh                    |   1 +
 tools/perf/python/alpha-profileme.py           | 178 +++++++++++++++++++++++++
 tools/perf/util/Build                          |   1 +
 tools/perf/util/alpha-sample-raw.c             | 156 ++++++++++++++++++++++
 tools/perf/util/sample-raw.c                   |   2 +
 tools/perf/util/sample-raw.h                   |   2 +
 13 files changed, 412 insertions(+), 1 deletion(-)
---
base-commit: 4626d370ae89b8af4d46a45372b269f926ec662d
change-id: 20261028-perf-alpha-profileme-8010299be323

Best regards,
--  
Matt Turner <mattst88@gmail.com>

