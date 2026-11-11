Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392190;
	b=trYVFSTXRavKX0cEVYkxQarKimR66t+OmCP60SzAW+Wk1qOuCSeKvxpdZfk6AFRHOm9y
	 Rpp2LThb9CGsUiqpcGkhu+VtNSRza73U5flC4rfDqMzsMgm8VU+sMvz1csBxQEjojGNlw
	 S/Liy4syQR6ofhU4B+GR6qqElF8pn4Sic2bx8Sdd4pMXORWZqtre8c6D1X/J23QO+Pi+8
	 DXvv2crAZC1yOKkycW/3s9PuGDjPG4KOCtrgzgmsRSWtaJQIT7Qs0EEMfKeGGTSiJhbcS
	 Urflf2UMhLWi4+fdmxEock6oVnY0zFHNfnzkxKOBoLO5QIVd6I3Equp+10ihxLDwRvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d/IvGYdSU0x2hRQxBE1JjbZsWM2RLe7/sTpyhUbllAo=;
	b=FH/crjzshHg0EaFgPyLJ+u0nOgxwEhn+/YoXNxTs/0M29ypU8ZMH7hjyuRz0VyLl/2ZW
	 WX2nE9UJEDlq8HcBWwvc6dtRnoa+peefEBnki5fFIjMC0DH+gltnDAjNBAjjeSflMsYjE
	 ITTtCnggm6//kVDs2YaPuzum+gAz29/QKbBA/HwfPrM4K/GHrLZyE6GXKfpGX8i5dMeT7
	 L6ep3WcH1k3FEANTLU1TXcVbfqYn5CrgtXU53tAD6UpG/whiiKK/pHkj6kEE63ZCIXiSl
	 0pih2GqsUdrP/gDthsW225eEjuKD1Jlf6cKBljgkg/NMp5yQ7e2NbvPchZS2jZLEm0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zu6x9jvf;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351AC606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 351AC606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zu6x9jvf
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3720addb068so5493163eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794392188; x=1794996988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d/IvGYdSU0x2hRQxBE1JjbZsWM2RLe7/sTpyhUbllAo=;
        b=zu6x9jvf/Y3EYKErT5IhySBfSvma7bgcPl3N8bj7rO1deIOsdjwDsOzNRTj7JUAVRw
         n3pJKYeNcD7xkEej0G+uil1L/QZZS7fW/8pCweCtJlfM6AwhR0WGB1GQnlNPrCjhDZG6
         TopgFcf2SwZyMir0eFewYeUjTgZGxmbxCKnVB4y9/SDyW/KAzC0yiD2fd8CrM1+y6NIt
         ezQnXbTySqtaWSCtYf8EnHmqNse/A20j3OBaOw6OJ50ayWpw0VpUJMlUdRUFSBEnaasH
         AHCyiIr+8ZK+vb2xKhs/PUrZXDc1l6FJqIBOg62Qe4QJfX1LVrIHoKFTNiOrahtEaHzx
         9Hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392188; x=1794996988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d/IvGYdSU0x2hRQxBE1JjbZsWM2RLe7/sTpyhUbllAo=;
        b=PGjoyFvngGYgfZfOYFqDAXb6BQmHHvgvPLPemYap2QSguDdRc+P1ShaTv5pVdqem6y
         HBJSVSK+ajIvF+/QPRRP7g4T2Ymu3b/50X9OszFtMsjEIPC0kPVbkx19TM+WtLHEFfX+
         uLnJ9GFru3KGuxHlm2tU3X93nz0APVBfowhfqtuF2ClNR0+WCAONFeAm7kCKJio9/G9A
         bonOW0wASOj/aN+jhdiI01pdjzb5QRq9PZ4qjpOZ8pWS12pFXYev+Yx7hWZEOTyMoHdZ
         zvGENndI40HNBRg8FOBCHdzARkJGtlfnvY+/vdyf63xHYoR4LRtf/GExORpZybtdw6Sb
         fLDw==
X-Forwarded-Encrypted: i=1; AL+hErEhUNpNFSP1LA9oBQGjivJwOzvC+k1VRCA0P3/f4ebG9TUlCATCDjj8qAZXdD7pC/YBXYxHrRo2JJ8zCis=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kyMW1qM6ZovMOstuQYF7VrlEob9oL3B/1e9mm3j7p3LIEub9b
	9HOgDnzOdsTziz+P0txdVf1NumS9S+IEdldl31uojpyr1KWH8Hbe57nZF3Z8KBeq
X-Gm-Gg: AYBFou03R/MYAnY64mZQATs3lA9QLlMf9CWZ3xxYr7RBewZBY+IgNnkx9uWiqkWJXWY
	2PlUlVE2KqLbpsqv+8ODOcJBGE2dP51nyQuxfYlkuMF/q+qx7T9NtD7w/nVr0Hz0LNLNPvKePrI
	dcVhNWd3gUZc4Fjt1AmiU/omVCvl/0ANVEO5tP0WDPaZqv8oRXn7jSNqHIf6jiJ0wyIkovXqXCX
	HyqalOyiWkn7/3WWECFVQG1tPya2nqRyrIG1aoASgAFShz07e7nZgENWf5CIb2ePbcd4lc3Zhom
	CwGAzh3eEsEoHS0tBcGk7r30QMpfLEn1wCyEFPSPxIZ95uCg0NodyJ3+h+aznH0uokay1OMfDci
	cn9VF9G9MehB+l2lGGwhYpFJjzivb1W53EIdlDo2ECGScttelcinAQeAU/VV60Ut4TkslgmGhVn
	4w5F5LJlkwLAzE481ADMaClMNpz6gmPlU+zd6STgHsFLG+kTQUzAtLqrUi5FzeczJde+v0NSwpx
	gQ8vg9D5uVJC6FPoYSrHlJqaUbKEk9YTemEbswDfpHozu82xZWNVaq7EXJnrWhCSrs4VP0xkrRl
	Ra3u0N7/zgd00jdLiHqT
X-Received: by 2002:a05:701b:2219:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1b3c023e33cmr1755383c88.2.1794392188110;
        Wed, 11 Nov 2026 02:16:28 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm14134634c88.12.2026.11.11.02.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:16:27 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2] libperf: Handle an evsel without an fd array in enable/disable
Date: Wed, 11 Nov 2026 10:16:24 +0000
Message-ID: <20261111101625.2204836-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023085629.1694941-1-takano32@gmail.com>
References: <20261023085629.1694941-1-takano32@gmail.com>
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

A group led by a tool PMU event is opened with the members' group_fd set
to the leader's file descriptor.  For a tool event that descriptor comes
from open("/proc/stat"), not from perf_event_open(), so a member the
kernel refuses is marked unsupported; perf stat then releases the fd
array of that member while the evsel stays in the group.

Enabling the group goes through evsel__enable_cpu(), which enables the
members of a mixed PMU group from userspace because the kernel does not
do it along with the leader.  The member has no fd array left, so
perf_evsel__run_ioctl() reads its loop bound through xyarray__max_y()
and dereferences a NULL pointer:

  $ perf stat -a -e '{user_time,cycles}' -- sleep 0.05
  Segmentation fault

Guard the array in both places: FD() returns NULL when it is absent,
which perf_evsel__ioctl() and perf_evsel__read() already test for, and
xyarray__max_x()/max_y() return 0, so the enable and disable paths that
walk the array become no-ops; perf_evsel__ioctl() returns -1 for such an
evsel, as it already does for a closed fd.  The FD() guard alone is not
enough because that loop bound is read first; measured on the same tree,
rc=139 with the FD() change only and rc=0 with both.

Verified on an arm64 KVM guest (Neoverse-N1) with a perf built from this
tree.  '{user_time,cycles}' and '{system_time,cycles}' segfault on the
unpatched tree (rc=139) and exit 0 here, reporting user_time (resp.
system_time) and a '<not supported> cycles:u' line.  Real-PMU groups
such as '{cycles,instructions}', 'perf stat' with no event and '-r 2'
print identical output on both trees, and 'perf test -v 10' passes the
same 78 subtests.  The libperf tests report the same five test-evlist
failures on both trees: the events cannot be opened by this user
(perf_event_paranoid=4), and two cases cannot read the syscall tracepoint
id because /sys/kernel/debug is mounted root-only.

The events are still not counted: a member the kernel refused stays
unsupported.  Hang Zhengyang's follow-up opens these members with
group_fd = -1 so that they are counted.

Written with Hermes Agent, an LLM assistant, which made the change and
wrote this changelog.  I built perf with it, reproduced the segfault on
the unpatched tree and confirmed it is gone with the patch, and ran
'perf test' and the libperf tests on this box.

Fixes: 0b18bced5444 ("perf tool_pmu: Make tool PMU events respect enable/disable")
Link: https://lore.kernel.org/avQIOtt7Y67oXQem@z2
Suggested-by: Namhyung Kim <namhyung@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: follow Namhyung's suggestion and fix it in libperf instead of
    skipping the members in tools/perf/util/evsel.c. The FD() guard
    alone leaves the crash in place, because the loop bound is read
    from the same NULL array through xyarray__max_y(), so the
    xyarray accessors get a NULL check as well. Measured on the same
    box with the FD() guard only: rc=139, with both: rc=0.

 tools/lib/perf/evsel.c                    | 3 ++-
 tools/lib/perf/include/internal/xyarray.h | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/lib/perf/evsel.c b/tools/lib/perf/evsel.c
index f747c0bc692d..e23df3b2c1f1 100644
--- a/tools/lib/perf/evsel.c
+++ b/tools/lib/perf/evsel.c
@@ -57,7 +57,8 @@ void perf_evsel__delete(struct perf_evsel *evsel)
 }
 
 #define FD(_evsel, _cpu_map_idx, _thread)				\
-	((int *)xyarray__entry(_evsel->fd, _cpu_map_idx, _thread))
+	(_evsel->fd ? (int *)xyarray__entry(_evsel->fd, _cpu_map_idx, _thread) \
+		     : NULL)
 #define MMAP(_evsel, _cpu_map_idx, _thread)				\
 	(_evsel->mmap ? ((struct perf_mmap *) xyarray__entry(_evsel->mmap, _cpu_map_idx, _thread)) \
 		      : NULL)
diff --git a/tools/lib/perf/include/internal/xyarray.h b/tools/lib/perf/include/internal/xyarray.h
index f10af3da7b21..8bf76c12984e 100644
--- a/tools/lib/perf/include/internal/xyarray.h
+++ b/tools/lib/perf/include/internal/xyarray.h
@@ -32,12 +32,12 @@ static inline void *xyarray__entry(struct xyarray *xy, size_t x, size_t y)
 
 static inline int xyarray__max_y(struct xyarray *xy)
 {
-	return xy->max_y;
+	return xy ? xy->max_y : 0;
 }
 
 static inline int xyarray__max_x(struct xyarray *xy)
 {
-	return xy->max_x;
+	return xy ? xy->max_x : 0;
 }
 
 #endif /* __LIBPERF_INTERNAL_XYARRAY_H */

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

