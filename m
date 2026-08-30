Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC12292B2E
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101750; cv=none; b=t5H5h0FJcEJnkw27QzQk7bQ1lRZGUanBW2uFWqZn3ebmdpI5eAnUAZ2TDNpINExbfoXHF23iwNGOwuVO9DKKHviRRJVu/KpMKRQgRZ4hsP5iazB6w7yKkPLudCI7zO76FusKdVCKJdgaw/Hmn9SlTFudZZAeUgetLu2T8dyiRDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101750; c=relaxed/simple;
	bh=QByGBxzU220ZERAIuEw8xUkWTZggFPrYCl7mjEOxDnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dudKUN46nNv7N3rg/uVseivHAft51pIcUw4zz1T8mrbTglKOC/CdC/OMXc+9pWq5xCakgdt1I/ld5MWmfUqWbKuJlOkNEvS5lvFpYVUNzuAC58Y8IuRIAWSMwza+2flRQmezqZX4g1q6SWR9O7Xh9lqT2QqpqlYsb73Qj/Vad14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egT1EcFJ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egT1EcFJ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so3959127a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788101747; x=1788706547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f8qfcfBi8NC02RZX5r4ch9EYMf8t0tHqhPistvQsuBk=;
        b=egT1EcFJoJn0o0szhuxUYKyHx+xzAaVnjW5LPVVA1uTCd8xaXOfGmWXwZwC+rE196V
         liTBvsQK0CsPBHFx68w/DiYrwtrhjYjQtUHp8utVcHI0ui9e/2bH55N23ZOsVMEOwuIk
         i0oIqwKwV9RWsPtfqlMh/C/yyU37DKE00IH72DdpgZzAabf827ZeIt3Lql0k5KodyxLQ
         i35HrEMMAISEGD0bU5y/7nEK5NJK7tIlPJWIZPFza1lSCnr40fUlqF+w5a0gDzRMNOrQ
         ib8WT2GCqlxparv+k48OClMEQPEM24YqNagN9e29lsFlEgd7+ygJkJa25gGenlijhn/9
         FGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788101747; x=1788706547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8qfcfBi8NC02RZX5r4ch9EYMf8t0tHqhPistvQsuBk=;
        b=ltAmKcK1BRsbbu9+RIkdhnbeVQfQnk8Qqys/TrY/SezAbhsEKcWP3wUeql1MGE8p8q
         DcZvQJKaPFPvppX0cxxEu1DL9eedyrSXTBTkRGenyxLzwRpkF3Ye9atMHhj9AupEznXi
         734xldzCjBon2jkRaN7w1sN7HpFPOSnFN8I2037xH+I95AR9X1gNvURUQiHrv+2aUzzc
         /pADLc647ut9ahq0MI/OSh/UrHHC0gQj5m+3Bq7/J4JD/ey7uHbaBO04adS4CmFj0fVZ
         XN1rV7QVWfcvizjLGGtpgoojREPXDHfNfavpP5m8y8HGVWHQPwxZqRomuRyAvVwT4crx
         6bcw==
X-Forwarded-Encrypted: i=1; AKwUvBybanx8Z/dfmEBqohi0JNP1hr2f2ELwdcUGhEYpNgTw0oMv+/w7noqQKP6Lct4F5XmEbfKv/qxOliy04u4=@vger.kernel.org
X-Gm-Message-State: AFuF++kLvBNFzq8DCQtV8u8kyFWSXyZfxu+ULtKlBz0a+JxkyPA58+wZ
	ZQ/Y2Pdhbg0zkrKTCbCggmze2o14zABK3KUjmW6EFMsx5LKN7E9gzP39
X-Gm-Gg: AYBFou0Aux4yiAiOvGTT+sqLpEXiCFHvVRJqxQkJpvGwmXzQcfOO/qDkGiwO8clC3mz
	BfwW1UpufN1XF7oW0rcCFzaUUSzfzaTEAImEMEwJh4OjcvMAlwYP0LCjbERojzs5LNRumtOE4UN
	vGdeyEENwKYk0BG/wDSe5sZmIRxs4YX4HKYmjeJhpfBvIOiP8LpWgzqL7PNg8hkCV4uqDILXak/
	tUyNap/hfLXi94SCjK7A9v5HnMXYsgMlwlW0aWBO2mh70VdDdoCi0XvSUjgJirt1mJjvO6Ifat5
	mXkQfRdFI7lBf4nLVRqFPTNWEUNYiZEpYKzQdhhesuGTUTKv9JT8L+spj6SKmU+2CXtuoBtRSOf
	Pb/XWxO3dfYU+kSZe97cH+rDFKulpK8AhCqMGSiU1gd+10op7lJTrAHano9kjRGSXXUahLFFa/C
	Z7XYD5KoRYy6VwAd8LWdJOMJxmFh8ui8v/udxk6jK7F+9ZFZLIrUMwF405mG6WpFVIf7a6cO5Tm
	XoGCqFJntG9vLaJwp3XRQubQa96k/js3remjHw=
X-Received: by 2002:a17:90b:2e4b:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-396d0d7b9bdmr31281365a91.6.1788101747319;
        Sun, 30 Aug 2026 07:55:47 -0700 (PDT)
Received: from localhost.localdomain ([180.101.244.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7aaaasm11757472a91.6.2026.08.30.07.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 07:55:46 -0700 (PDT)
From: Aohan Mei <ljp1205831794@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aohan Mei <henrymei@tencent.com>,
	TencentOS Corvus AI <corvus@tencent.com>,
	stable@vger.kernel.org
Subject: [PATCH] perf: Fix mmap_count accounting on the perf_mmap_close() race path
Date: Sun, 30 Aug 2026 22:55:05 +0800
Message-ID: <20260830145512.2583689-1-ljp1205831794@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aohan Mei <henrymei@tencent.com>

perf_mmap_rb()'s raced path (a concurrent perf_mmap_close() has dropped
rb->mmap_count to 0 but is still blocked on event->mmap_mutex inside
refcount_dec_and_mutex_lock()) installs a fresh ring buffer and then
does refcount_set(&event->mmap_count, 1).

That is wrong: the blocked closer still holds a pending decrement and
the count is 1 at this point. The refcount_set() leaves the count at 1,
so once perf_mmap() drops the mutex the closer observes a 1->0
transition, detaches the *new* buffer via ring_buffer_attach(event,
NULL) and drops its last reference, freeing pages that the racing
mmap() is about to map. A later munmap() of that mapping then finds
event->rb == NULL and crashes the kernel in perf_mmap_close().

Restore the pre-59741451b49c accounting on the raced path: the count is
guaranteed non-zero there, because the closer's decrement of
event->mmap_count only happens while holding mmap_mutex, which the
mapper holds. Use refcount_inc(). Keep refcount_set(..., 1) for the
genuine first mmap, where the 0->1 transition is required and
refcount_inc() would WARN.

Fixes: 59741451b49c ("perf: Identify the 0->1 transition for event::mmap_count")
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Cc: stable@vger.kernel.org
Assisted-by: CodeBuddy:Kimi-K3
Signed-off-by: Aohan Mei <henrymei@tencent.com>
---
 kernel/events/core.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 4638544205f2..adcc04ca05f8 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7273,6 +7273,7 @@ static int perf_mmap_rb(struct vm_area_struct *vma, struct perf_event *event,
 	long extra = 0, user_extra = nr_pages;
 	struct perf_buffer *rb;
 	int rb_flags = 0;
+	bool raced = false;
 
 	nr_pages -= 1;
 
@@ -7314,6 +7315,7 @@ static int perf_mmap_rb(struct vm_area_struct *vma, struct perf_event *event,
 		 * event and continue as if !event->rb
 		 */
 		ring_buffer_attach(event, NULL);
+		raced = true;
 	}
 
 	if (!perf_mmap_calc_limits(vma, &user_extra, &extra))
@@ -7338,7 +7340,21 @@ static int perf_mmap_rb(struct vm_area_struct *vma, struct perf_event *event,
 	perf_event_update_userpage(event);
 
 	perf_mmap_account(vma, user_extra, extra);
-	refcount_set(&event->mmap_count, 1);
+
+	/*
+	 * On the raced path above, a concurrent perf_mmap_close() can
+	 * still have a pending decrement of event->mmap_count: it sits
+	 * blocked inside refcount_dec_and_mutex_lock() on event->mmap_mutex
+	 * (which we hold) with the count still at 1. Using
+	 * refcount_set(..., 1) here would make that closer observe a 1->0
+	 * transition once we drop the mutex, causing it to detach and free
+	 * the buffer we just installed, while this mmap() still maps it.
+	 * The count is guaranteed non-zero on the raced path, so increment.
+	 */
+	if (raced)
+		refcount_inc(&event->mmap_count);
+	else
+		refcount_set(&event->mmap_count, 1);
 
 	return 0;
 }
-- 
2.43.7

