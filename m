Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701014;
	b=LCLzwEqbnL8614CKJTSvDSLGk457qrAh4EPeBKrsFZkTt/gCfvOMSZFn5LHHOVh8S8k6
	 8Zl3YpkART5v4yNJUFIx7wNzqvXqMtLSwwjfTAYFc1unP126v1od6lxNLIsPksy6DEPIY
	 9dgAy4oDVzrNp/Tm5SE3yCxRZ9gp7pjkpuNBTHEP80+t3/inX/2zXkqkb51PJAtWt9DaK
	 GS46CCIXj5RFu8WjH6hn7LV/XrDWZ/2bV2t58Jzll1eFZT6p5jFZRMR7NytOiUMmnKruw
	 VlQIe2t7P59SCQXTh6tp6hfmrGnKJfWFhT3LqSWb9bPoGMJ/rGvZpt7GGrV2KTJ+9xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=O3MLcVpvSLEppgS59oKT4vTeHqiCTAcmRuUuPH2KdWw=;
	b=unkPj3LT6I6jp0y2CjtyhCvQAIrYRoxX6+zSSljPJazn7hOayGMFaBEszhhd+FS7rxKI
	 JWN4uWrdSTHWuY8adtKR4A8imQyq3EHJdu7SeLWEiBcMN+ytRHnZ1VycXS4Hb7Pmf7zx3
	 BPOvR9hgevS8LS+BF0iEyV7X7P/m1dxa/r2YJpleCEsDURnmfzEsh78PpfbLYqlOdsaan
	 48RTMigqp8GSHxRERZUgb+VaFGsyhRSvMtzAmGqTX1ysiiZhnbqgEASmS0flunJvKt67g
	 TVFISynvkSvH600YGpYyfQokzNhLMok/Z4WfNcnDssq9BWThTbHfzDWF4stxUx/yy+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=g0neAIb4;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9569C606A333
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9569C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=g0neAIb4
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1665200f4c2so189520c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792701013; x=1793305813; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3MLcVpvSLEppgS59oKT4vTeHqiCTAcmRuUuPH2KdWw=;
        b=g0neAIb4q9E+PcQsVJerL9EHCv0AoxNPcvQ0F2TlpvOm3sJAIMJ6QNeavS8IL4bi7M
         hEaRic1F7MbGkDptxJKmZ6sc31wG03+9vdXXzVNQff9xquOcQTD4IPXD76zl/zKBUIOX
         qWyS8ClLs0uqqSU+BFgWxhv/ydZ9eCM6vE47hlCm5fq3GemTZC5OX7QgNhKoU5a7frny
         HmBgV5xMzjAGTajifC5yE+KgIYXo8986ufWyH9UZgaj4jBR3B64Xfcowwm2G3JAw4Z4E
         u+MI0Fa7I+4onJ0bKjQYohaP9bNABkxMRSDgMxGrzbLq72wn5XAKYT118Y7BMSy6O6dM
         1QEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792701013; x=1793305813;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3MLcVpvSLEppgS59oKT4vTeHqiCTAcmRuUuPH2KdWw=;
        b=butHNoRm7KcXp0fsW2mzdppTJfn9s36exK0zuDDzCe6X3LcF58xjSxtExwY/PNQl0W
         Mss9bTtMGoxgoVr3SMqr6/osu4fr3X72W7H9RZEHz9347skX/fkhKyXeGKfJBUoP1TAG
         Ps0lWAKzS0PsLdciCGUhfYvsCeZdo/jm3NYmvXfxcR61IeheHc7y59TmlftciTXozwKg
         7t0f7JwA5+16eXzTe0TlU46aW5FBExGEKxXwDFAQXczdQbvPyFFMvG8r++NsyzZut8Gh
         bJBoGElYsXlXaDOo8X4ubaJtlbMbBaSguNzWMKl41w+b39jCVxj3GauDYGhQ64ImVp/W
         BSKg==
X-Forwarded-Encrypted: i=1; AKwUvByJguCAufW2bWScfJlNYKbAiE2PJZd7M3jy3BVrcI3Dp9JSN2WB1TcWKSK0iyb4mswmVEQAJcuuLOgVT2c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqGhUvABcrz8MX2ZDzeSAVmuK8pXdS8DbhmVg7eGH1d+Rw702M
	xr8tO9ogvP9qVIIdAlKEhY8AU160ZwPbtKS3BTAzw+6x8CpRaY1BfcN2aEP6V69jrqOgUT5QALK
	d6gPCp1WK1Q==
X-Received: from dlea10-n2.prod.google.com ([2002:a05:701b:420a:20b0:191:8034:8348])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:e09:b0:151:2e62:fe4b
 with SMTP id a92af1059eb24-195c5bc781dmr615801c88.23.1792701012400; Thu, 22
 Oct 2026 13:30:12 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:29:53 -0700
In-Reply-To: <20261022203003.1779152-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020205859.1080743-1-irogers@google.com> <20261022203003.1779152-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261022203003.1779152-2-irogers@google.com>
Subject: [PATCH v6 01/11] perf bpf-filter: Fix bpf_link leak by using PERF_EVENT_IOC_SET_BPF
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

