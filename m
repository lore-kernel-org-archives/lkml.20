Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792782365;
	b=fLM44DGxA1w/lMz/e/jEBrSSi+CGaE6uHw1+8Ps6Er+/1+eSQwDPBw8vV3P7/KnA5O88
	 A3ndnFa9+eHmx3d/OIDYRUPgn413PPZylcv3/HWDtj7Byuh9L/F6YqoLXPB68J/vwKgOr
	 zMG0QbsOLf0O/S+Il8LuPxZ46O1luPByYXb2L/DMiVBdgqWKAVpjIIZVHCfUdloJ2QRPI
	 t7u5otfvacBkrIGaTQ+kcqtwtCqWDaYTu7AkV9wFsak/Aw8JTQaFad+Vb2aUuWy9wck02
	 eh7ed2c74+k6gpVeDrXmU/GbX7Iydj2Pj9FFpkM5hSIsipYHkXpCfwNl6jKT/gd3Z9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792782365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=O3MLcVpvSLEppgS59oKT4vTeHqiCTAcmRuUuPH2KdWw=;
	b=Lx1KgviMDv/2IdVnEHOlD4VlurBAfJDOxiGxdC6Au5AFEeX3AOHew3uXX/+2HkMQsOS/
	 +t2CSI2QPlRXfQPcX0I/6C5W9AAA+WH6IqMe7n9F3fBas0340aPLeTewpjwIEgVowsjAx
	 eeg2BXDmZO5xl9trzoxmmSSled+oqJ4ie7Ih5psBPL/Va888nHVsLyHPdBb1C3x+jBqCX
	 HX4OTiGlbdLv9e2sGX+U74g7JWs8pPEmli1uhiCY+cDGI6EC3oLYuVX4jpL3ZjZmZ/tNP
	 7nk5trN8dS7C/3cytxS9CqTEDdYCNkjd6zotbApHillWFDlQtbONx8LsLSAXJ6uo1eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="K/Ta2d3r";
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3893606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3893606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=K/Ta2d3r
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so1341419c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792782364; x=1793387164; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3MLcVpvSLEppgS59oKT4vTeHqiCTAcmRuUuPH2KdWw=;
        b=K/Ta2d3rNg2FmIpSS5lHcOrmfMk4pdUOAWwtfhtIR1jWjdyU3CKt1WQls2Ud6tMZvz
         bLBT8yBMXe/S/T/TzqsHlONxbLQ81dM0hU7Cue6xlPqV8y6fX2SBevrC79moM9I4AXR7
         65GBFhSn1MZuYEdnghkj3gsVL+ihtNH3z7IJWfd+QO/2p3iEhD2WmIMLRs4NuV/rVhIU
         Q2+16xEeCuGOuLc5jxxd9J6D/qMV+MoXNnTJV/MGu4HGP+dEpg7vb4ZGVmdXusLxQQv+
         2la4cg0hh9uB+XRY4HQJpLnXuktJIPZDluy44j1JiwLYdlX1Dj454BxccjCUP+nS9tps
         tSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792782364; x=1793387164;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3MLcVpvSLEppgS59oKT4vTeHqiCTAcmRuUuPH2KdWw=;
        b=BoX1jsmxaoUFzY4+Vy6omcGw3zcr1u0A+Qt+0p+i3o+gdMNp4pA+hNr4wkU09ZIsgp
         RtP+frMyDq3+p4BP4CibT/eq4INIAFrcYusH/GFMJtoPV+wfmmT3HEFJjZfMj2GDCxX/
         JYwFL8lwNvZEc/n7zncgxqdgotoNX5gTbII8HDfWx/FgodxncKXyDkJ8DKhkYQ8a/fHz
         LZOHzy6Bw3B9RyItSu065OOJA/or4994ARWn+Kv7oWFGMM47KIOFkvmy+l9BoBGC4Vz9
         WZU1Vs3h6/w6wBIPR1NOJ1xMcoNRHTsb7vr+HS6cvRaQ/7sLz6CKOR6GH76OXx5eDUK5
         SOIg==
X-Forwarded-Encrypted: i=1; AKwUvBzU2Oo2A561uTHA6tKggjcm+kxHr0b4y07vGkqaHCvL1Uh7OR/OubHkjyJt+A31qyIekQpsKS+fzs+zMwQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUa5NqqCOzlbM7wUsA2yktPnm6ePCDuI8agBjQ0oHGDHRAnkQ8
	9ZnQRNCgMEHemVCzeBXiCh4h/3LQh9JlHk9G2hWCsHMohIyVQyCYBefkIC+PIK5Otk89Ikk5xtj
	F1ssQDnjO9w==
X-Received: from dlbsj2-n1.prod.google.com ([2002:a05:7022:f902:10b0:158:5d29:90be])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:454d:20b0:165:dd90:1f54
 with SMTP id a92af1059eb24-195c74c48cdmr3769878c88.47.1792782363705; Fri, 23
 Oct 2026 12:06:03 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:05:48 -0700
In-Reply-To: <20261023190558.3050796-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022203003.1779152-1-irogers@google.com> <20261023190558.3050796-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261023190558.3050796-2-irogers@google.com>
Subject: [PATCH v7 01/11] perf bpf-filter: Fix bpf_link leak by using PERF_EVENT_IOC_SET_BPF
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, ddhariwal@google.com, eranian@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In perf_bpf_filter__prepare(), the unpinned filter path attaches
skel->progs.perf_sample_filter to each FD(evsel, x, y) using
bpf_program__attach_perf_event_opts() and ignores the returned
struct bpf_link *, leaking the allocated struct bpf_link_perf and its
BPF_PERF_EVENT link fd.

Furthermore, bpf_program__attach_perf_event_opts() is designed for
callers that transfer ownership of the perf_event fd to the returned
bpf_link: when bpf_link__destroy() is called, bpf_link_perf_detach()
unconditionally disables and closes perf_link->perf_event_fd. Because
evsel->core.fd owns FD(evsel, x, y) and closes them in evlist__close(),
destroying the returned bpf_link would double-close the perf_event file
descriptors.

Fix this by attaching the program directly with
ioctl(FD(evsel, x, y), PERF_EVENT_IOC_SET_BPF, fd), matching the pinned
filter path right above it in perf_bpf_filter__prepare(). In the
kernel, PERF_EVENT_IOC_SET_BPF takes a reference on the BPF program and
_free_event() -> perf_event_free_bpf_prog() automatically detaches and
releases it when the perf_event fd is closed. This also avoids enabling
the event prematurely, allowing pe_opts (.dont_enable = true) and the
LIBBPF_CURRENT_VERSION_GEQ(1, 7) guard to be dropped.

Before (built with EXTRA_CFLAGS="-fsanitize=address"):
  # perf record -e cycles --filter 'period > 1000' -- true
  [ perf record: Woken up 1 times to write data ]
  [ perf record: Captured and wrote 0.024 MB perf.data ]

  =================================================================
  ==51328==ERROR: LeakSanitizer: detected memory leaks

  Direct leak of 1568 byte(s) in 28 object(s) allocated from:
      #0 0x7ffbe76ef24f in calloc (/lib64/libasan.so.8+0xef24f)
      #1 0x625df7 in bpf_program__attach_perf_event_opts (tools/perf/perf+0x625df7)
      #2 0xbeddc0 in perf_bpf_filter__prepare util/bpf-filter.c:507
      #3 0x8f3def in evlist__apply_filters util/evlist.c:1421
      #4 0x44bbcf in record__open tools/perf/builtin-record.c:1469
      #5 0x453f9e in __cmd_record tools/perf/builtin-record.c:2594
      #6 0x45dadb in cmd_record tools/perf/builtin-record.c:4427
      #7 0x5df56b in run_builtin tools/perf/perf.c:383
      #8 0x5dfa0e in handle_internal_command tools/perf/perf.c:436
      #9 0x5dfddc in run_argv tools/perf/perf.c:480
      #10 0x5e0333 in main tools/perf/perf.c:581

  SUMMARY: AddressSanitizer: 1568 byte(s) leaked in 28 allocation(s).

After (built with EXTRA_CFLAGS="-fsanitize=address"):
  # perf record -e cycles --filter 'period > 1000' -- true
  [ perf record: Woken up 1 times to write data ]
  [ perf record: Captured and wrote 0.024 MB perf.data ]

Reported-by: Namhyung Kim <namhyung@kernel.org>
Closes: https://lore.kernel.org/linux-perf-users/20261020053226.55936-1-namhyung@kernel.org/
Fixes: 56ec9457a4a2 ("perf bpf filter: Implement event sample filtering")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf-filter.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/tools/perf/util/bpf-filter.c b/tools/perf/util/bpf-filter.c
index 72e83ac1d6a4..506414e5c407 100644
--- a/tools/perf/util/bpf-filter.c
+++ b/tools/perf/util/bpf-filter.c
@@ -40,6 +40,7 @@
  * The 'dropped' map is to keep how many samples it dropped by the filter and
  * it will be reported as lost samples.
  */
+#include <errno.h>
 #include <stdlib.h>
 #include <fcntl.h>
 #include <sys/ioctl.h>
@@ -423,16 +424,8 @@ int perf_bpf_filter__prepare(struct evsel *evsel, struct target *target)
 {
 	int i, x, y, fd, ret;
 	struct sample_filter_bpf *skel = NULL;
-	struct bpf_program *prog;
-	struct bpf_link *link;
 	struct perf_bpf_filter_entry *entry;
 	bool needs_idx_hash = !target__has_cpu(target);
-#if LIBBPF_CURRENT_VERSION_GEQ(1, 7)
-	DECLARE_LIBBPF_OPTS(bpf_perf_event_opts, pe_opts,
-			    .dont_enable = true);
-#else
-	DECLARE_LIBBPF_OPTS(bpf_perf_event_opts, pe_opts);
-#endif
 
 	entry = calloc(MAX_FILTERS, sizeof(*entry));
 	if (entry == NULL)
@@ -501,14 +494,13 @@ int perf_bpf_filter__prepare(struct evsel *evsel, struct target *target)
 		goto err;
 	}
 
-	prog = skel->progs.perf_sample_filter;
+	fd = bpf_program__fd(skel->progs.perf_sample_filter);
 	for (x = 0; x < xyarray__max_x(evsel->core.fd); x++) {
 		for (y = 0; y < xyarray__max_y(evsel->core.fd); y++) {
-			link = bpf_program__attach_perf_event_opts(prog, FD(evsel, x, y),
-								   &pe_opts);
-			if (IS_ERR(link)) {
+			ret = ioctl(FD(evsel, x, y), PERF_EVENT_IOC_SET_BPF, fd);
+			if (ret < 0) {
+				ret = -errno;
 				pr_err("Failed to attach perf sample-filter program\n");
-				ret = PTR_ERR(link);
 				goto err;
 			}
 		}
-- 
2.56.0.307.g5fe7bd680c-goog

