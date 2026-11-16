Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815114;
	b=O1RXPCowqUjpxF1eahhDjo8W0EbsxMYSFtGs0HCCVQQqdHQWmkEdPNEYkvYbKx+vawEM
	 vXBGAdaRjFJgdUgUaDM+t6qmSo0wZwHTihKXzdp3hJXj95bzM6xjiEB+P8Z5xx0xReEuy
	 n5wJU0VkCmzMWakPCOqAaSr8RXYbglK1UjNWi9aSkJVT6pdYdYqqwJL1/xnwboFxHqIVX
	 d3kUAfRbOi2azqio6tfGEQVE54xulYybasRc7n24N5fV6eU4n0+eW0nEj2sePyYJXjYFu
	 mXLf8lj9M2zWbxqflLJhz4YS0u6//YjWaaAw7gyI0LGQ3r7pJPrK/uh5alf25QSiHuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=AGt0uBqNqrRBqkScWR/mb8l6aDImYIyfnkOYjdl57zg=;
	b=l4c4ZUXr6VyZf3R2HXUtuESzxDXhPLjmcTClH5aOE/4rPPI9uQjh10ZMj+IcWn73FU80
	 hGjR7s6P7I5N9REMWn0A1clJmJT3cTzzOT6G3dO6s2mEeM+Hqrr9a5g176dBwJojiF1Xr
	 KJfL7HNnKIxEh21zzSOIfhXNtmpAqs/mp8biU/U6Ik+VtJFNarkoDDY5iXwanDnzxok0G
	 8JOBzH3iydbTjdcidcYhd5H0ibqgyMzAJ+YHdfJv7Ro7D6sWWLQbI7ffxqQ6s7OKGPmqK
	 SrbDPBpQR4tBs5VlUZ17GUHaX6w7A8n4i0HZbeZr+BG4MZcBs/e3rt4gS4BxL2KaJXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m5pm5Vg4;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED3F606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED3F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m5pm5Vg4
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so3915944eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794815114; x=1795419914; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AGt0uBqNqrRBqkScWR/mb8l6aDImYIyfnkOYjdl57zg=;
        b=m5pm5Vg4t7Wg1bRT8UDv5ZOx2rye/UtjlR3e//Hx34+afV8SD0Ddpa39FJ7+s6wub6
         Xbk5z2wwYLXYbvkCaa8yibefV5Vvmx6ix9/qo6NuDfqLz0uBn6lZ0sCj+tCGvG6Qu2cz
         1TzO8uRIVHc9VlKMWLEWvtnMk9vPhwXpK93y6m06dhao9LBaacuqkjgibcevN4Ozw7lM
         xmAxurgddF4wP25JzjxY+T2G4vLQvRcX96nVn8MfRuU5zvP9btLJh1ZR9UyeEmfuU7t2
         D2kVogDolxnMJFIeH4povwmHuAMqf5liR7N5DLY9JRxoV01fWdt+5WES1DCwgjp7l3xm
         NfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815114; x=1795419914;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AGt0uBqNqrRBqkScWR/mb8l6aDImYIyfnkOYjdl57zg=;
        b=qK2HcE0j1jvq4SHOzRtKAP4coNjkbMx3NQ8HjW4ZORTPkIrTKqDtlcnoyo3n8yYZM5
         pmYsOKFAjqWJvU7UzsST+HAqab9TdENGkV0dMUsCWzjvW0YLrBLf1CJNr8AVa4tCEMQT
         gTtfpq6pc1Nw9Olb+SIWZ1YZT/bN22TO8qxh/d2vfZvM/11dGQHvDiGmRCK2cgEY4/wc
         PiyPXNnmkxS6m/GDZcYiQoO5FQSF852U/M7RD+kDKBhtWs8v40jx27RZMjX6cQgt/8+V
         7sNLOl2ILQyJ+wVXKj8zMVdJ1tF0YlcfJ/6uYSUHRKDLtjOJbgD2c5Pbyqg4cbWk8oPW
         8TIQ==
X-Forwarded-Encrypted: i=1; AL+hErHl5ZS4rxhvEcqy3KpVjokQzCiFu52P5dP4VgMkDAgadNU1ISthquoMlchhu2HDbrQXDymhPzB5i5kqDRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rPRLb96PtV44Vn4Cmojz/jcWQf1MApXnTpEZWNN3xLjvLzmfc
	DzkIT6UmJRbYQ/ekRdqF8KzjJZx1/jkXXGAccoLx3rd3P/mxfCRhUsQbl6LAV89+OQpuMUgWxwJ
	mNgtptMOH7g==
X-Received: from dybme13.prod.google.com ([2002:a05:7301:188d:b0:37b:f69b:a36b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:90b:b0:34d:755b:d60b
 with SMTP id 5a478bee46e88-37968b8a031mr8712195eec.34.1794815113280; Sun, 15
 Nov 2026 23:45:13 -0800 (PST)
Date: Sun, 15 Nov 2026 23:43:58 -0800
In-Reply-To: <20261116074414.3174737-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116074414.3174737-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261116074414.3174737-4-irogers@google.com>
Subject: [PATCH v3 03/19] perf/uapi: Add BUILD_ID_OFFSET sample types to UAPI
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Leo Yan <leo.yan@linux.dev>, Dmitry Vyukov <dvyukov@google.com>, 
	"Steinar H . Gunderson" <sesse@google.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Introduce PERF_SAMPLE_BUILD_ID_OFFSET and
PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET in enum perf_event_sample_format.

For PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET (and
PERF_RECORD_CALLCHAIN_DEFERRED when PERF_RECORD_MISC_MMAP_BUILD_ID is
set), encode a deduplicated table of variable-length build IDs
(u32 nr_build_ids, u32 nr_offsets, followed by packed { u8 size;
u8 data[size]; } entries padded to 8-byte alignment) and an array of
64-bit offsets whose top 8 bits encode the 1-based build ID index (or
0x00 for unresolved user addresses and 0xff for kernel/context entries).
In common cases where multiple callchain frames belong to the same
binary, each unique build ID is encoded only once.

Suggested-by: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/uapi/linux/perf_event.h | 59 ++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 5 deletions(-)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index deb7c42d109b..775420ed9aee 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -165,8 +165,10 @@ enum perf_event_sample_format {
 	PERF_SAMPLE_DATA_PAGE_SIZE		= 1U << 22,
 	PERF_SAMPLE_CODE_PAGE_SIZE		= 1U << 23,
 	PERF_SAMPLE_WEIGHT_STRUCT		= 1U << 24,
+	PERF_SAMPLE_BUILD_ID_OFFSET		= 1U << 25,
+	PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET	= 1U << 26,
 
-	PERF_SAMPLE_MAX = 1U << 25,		/* non-ABI */
+	PERF_SAMPLE_MAX = 1U << 27,		/* non-ABI */
 };
 
 #define PERF_SAMPLE_WEIGHT_TYPE	(PERF_SAMPLE_WEIGHT | PERF_SAMPLE_WEIGHT_STRUCT)
@@ -840,7 +842,8 @@ struct perf_event_mmap_page {
  *
  *   PERF_RECORD_MISC_EXACT_IP           - PERF_RECORD_SAMPLE of precise events
  *   PERF_RECORD_MISC_SWITCH_OUT_PREEMPT - PERF_RECORD_SWITCH* events
- *   PERF_RECORD_MISC_MMAP_BUILD_ID      - PERF_RECORD_MMAP2 event
+ *   PERF_RECORD_MISC_MMAP_BUILD_ID      - PERF_RECORD_MMAP2 and
+ *                                         PERF_RECORD_CALLCHAIN_DEFERRED events
  *
  *
  * PERF_RECORD_MISC_EXACT_IP:
@@ -852,7 +855,7 @@ struct perf_event_mmap_page {
  *   Indicates that thread was preempted in TASK_RUNNING state.
  *
  * PERF_RECORD_MISC_MMAP_BUILD_ID:
- *   Indicates that mmap2 event carries build ID data.
+ *   Indicates that mmap2 or deferred callchain event carries build ID data.
  */
 #define PERF_RECORD_MISC_EXACT_IP		(1 << 14)
 #define PERF_RECORD_MISC_SWITCH_OUT_PREEMPT	(1 << 14)
@@ -1095,6 +1098,38 @@ enum perf_event_type {
 	 *	{ u64			code_page_size;} && PERF_SAMPLE_CODE_PAGE_SIZE
 	 *	{ u64			size;
 	 *	  char			data[size]; } && PERF_SAMPLE_AUX
+	 *	{ union {
+	 *		struct {
+	 *			struct perf_build_id	bid;
+	 *			u64			offset;
+	 *		};
+	 *		struct {
+	 *			u64			zero;
+	 *			u64			context;
+	 *			u64			cookie;
+	 *			u64			ip;
+	 *		}; && attr.defer_callchain
+	 *	  }; } && PERF_SAMPLE_BUILD_ID_OFFSET
+	 *	{ u32			nr_build_ids;
+	 *	  u32			nr_offsets;
+	 *	  struct {
+	 *		u8		size;
+	 *		u8		data[size];
+	 *	  }[nr_build_ids];
+	 *	  u8			pad[];
+	 *	  u64			offsets[nr_offsets];
+	 *	  #
+	 *	  # Entries in offsets[] include PERF_CONTEXT_* markers (which
+	 *	  # have top 8 bits 0xff). Kernel/hypervisor entries (after
+	 *	  # PERF_CONTEXT_KERNEL, PERF_CONTEXT_HV, PERF_CONTEXT_GUEST,
+	 *	  # or PERF_CONTEXT_GUEST_KERNEL) and the cookie word following
+	 *	  # PERF_CONTEXT_USER_DEFERRED are raw 64-bit values. User
+	 *	  # entries (after PERF_CONTEXT_USER or PERF_CONTEXT_GUEST_USER,
+	 *	  # or in PERF_RECORD_CALLCHAIN_DEFERRED) use the top 8 bits to
+	 *	  # encode a 1-based index (1..254) into the build_ids table and
+	 *	  # the lower 56 bits for the DSO file offset, or 0x00 for an
+	 *	  # unresolved user virtual address.
+	 *	} && PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET
 	 * };
 	 */
 	PERF_RECORD_SAMPLE			= 9,
@@ -1306,8 +1341,22 @@ enum perf_event_type {
 	 * struct {
 	 *	struct perf_event_header	header;
 	 *	u64				cookie;
-	 *	u64				nr;
-	 *	u64				ips[nr];
+	 *	union {
+	 *		struct {
+	 *			u64		nr;
+	 *			u64		ips[nr];
+	 *		};
+	 *		struct {
+	 *			u32		nr_build_ids;
+	 *			u32		nr_offsets;
+	 *			struct {
+	 *				u8	size;
+	 *				u8	data[size];
+	 *			}[nr_build_ids];
+	 *			u8		pad[];
+	 *			u64		offsets[nr_offsets];
+	 *		}; && (header.misc & PERF_RECORD_MISC_MMAP_BUILD_ID)
+	 *	};
 	 *	struct sample_id		sample_id;
 	 * };
 	 */
-- 
2.56.1.703.gf848ed807c-goog

