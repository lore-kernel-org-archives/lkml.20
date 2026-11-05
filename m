Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879140;
	b=FRpEhLR/c3pTa8RrqXql/xE0NUbSC+ge7iY8P64TStG/huUEKHMGFFjGRu2370W5WIxS
	 srqDQhM/ogwwdZnXtfQYHQHKS5pHdYLctCnB7zd+KARV+nBZp+OHj9ynVMaxLTL3beh/T
	 dhPNgWXHSagNhuwKa7OxhgeCtj/KhD3ChBAcHCTwxIKBbs5EFEXHAl9g0yNFgNVzPycT2
	 5kCgkrmLQ7OUgiEMYTjTKb0cbBsXaNuVP/ijl/vbUiKQFaMx+PGgC5KUBopiQQjGYm09D
	 2qk1+U1CymsUk4yyxIDpQsA64isgQ41XVb/PM4SRRiuYhJkOeM5C3uw9mqLzMgkEJxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=o1EbclO0CpwqePVCV1L0T+e9zUmbTQ8j93ZAYJlyj8s=;
	b=baYfxYew9UJh+1ZO7afyw2jyi+D1qW91pqh6Yo80KkqIGkR/H28V0/JpsrGc2DMqPbGc
	 E4EMTGnfRZ4Gv5/C96W6iNq80kQsI9WOYCRTgdukqJ3wAY9D3CxiSADrcgs1SDQ5ljDcK
	 rFoXT14zqpOJLmjjeoW3/zgfcJOwikkKywo0UA6dXNQyNQ9m+3AEcC0QaNPG+nBrae81X
	 6g5AwzjuLXPFbZFuoBAf+94VaaOB/j/NOsXtC5gUTvR6T1YLNdwvVkBTM6PJu6FsievjQ
	 Hj+L+0FoKvzA3seIMVMFT7kNYWe8CWdaJZmmd+5ROun7vxqQH8bIq6FNdB5xgRvV9Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OigcssTz;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A256073ABF
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A256073ABF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OigcssTz
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so16437885e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879138; x=1794483938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1EbclO0CpwqePVCV1L0T+e9zUmbTQ8j93ZAYJlyj8s=;
        b=OigcssTz7nlgnoizVRlOpjIfNlQMYxJysGX/ivmf+5x9hf+CVPMsH9KryAZiQw7QH0
         /vqu41gvJKAP/y1qSAFLKkKZOw8CEuFH/f+bZ4FqYdVMwuLuJKIApP4ttly+ygvR0Tyg
         XC/5SMIxNvfOlglFtzrfvTgpgUZp/4LjjySPCBlr186qqpYzCXWzsqYjqNkHp+4qLRCe
         kOn+eNXThLa5ZF+ZVM+Wz4/S8AughtTgPCkslwnvK+IpZaAbxpr1lvvmH0xA14UNn6Al
         Nu3ZwsuxJdZFCE1Ud7yeN56/04ZPKvVO7rzJ1ddbg9ixSFu/7V1SqdvOijX27wuuNGoW
         iE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879138; x=1794483938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o1EbclO0CpwqePVCV1L0T+e9zUmbTQ8j93ZAYJlyj8s=;
        b=N2lWptRaWoyWkcNjqOVrsEPyiC8UR5uVEkuXraKiNdnRxx1f4TKWdGaLpMLr+XoFil
         sRAaEyj5psE9JjIO+BXoZwT3UfnPRElf6j2PTiqcwtoybTd+6WAHXZ/A7bFYWnP8yGVK
         gSeJw5PpqEDZKPtjUKTx2uDawHAPX3uedKwf0d8tdKeHmVjckLZDNdNuBGKvX2xWjtKz
         Ra9Ir5UmKpJvdQ1ONWVsheYTnxe8neCHzdl8eMryKBc9897F7Z3oCj9RRd/YzLqS9W77
         sZpR6XcAnEaq12n/Oy/KoSvvui/QsToo1Xm05eyBq36JvN8lxyqo46YftJFXM1kUu7hS
         gEEQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9XW9cAgt4tBd5HWZG9ghiT+rD2uoRztvpQSwtnEIbJZCkG/O9GoFVQgjoJIudrYFPQFER8oIkdfMogO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L+W/+Zyqr398tfHO+8E9+kB3E7lNlZ78MqLmTFNXpFfCDB4cH
	ko0ocHxOx0tl7JgUu1ZfmZ+7PNTNwSWIzZATa5GGioIitVNz1LxsQ3M9cXe2GTCbCq0=
X-Gm-Gg: AYBFou1E1FSKeRMZDoVzY0UAG3La63PnX0txEcLCN4uqEaM88SFgjzxwhbQkZ50nbTu
	a77Hrg8tNVvUVm+LN0pKKCq0v0ad0/KfcuYrkU5xdLIQYtTVNjLJOh/DZtolgQelguSfWGwVLvo
	lOllJRW1IxnGT+oNhNVCNwx1+Ujc8DO76q709uoz3EizKSuQNUKYTXWyEBP4VXmLibYoAl5i3RW
	y97nCglGLSXQFmh/QPElvhXT1QXpXYXQh8dAflRW3BBrAeniu5mk30q8RCXCMXhTpPmtsBSICDZ
	8paP/PfIUj883evv4ffjWPOdqXefkhFTTb6KqM4qAkt3sZ7DWHXIzInRtncx29cawWWsSJvOgv5
	rDRI91eOKIrxGdpFThH9E0D0vHmqYXVZk+w0RyYFUc6G+b2RWK7YNrX47ezV+RP6auTjOGwVLhl
	UdxP0HBzMYboPHBLCIC0InM1Lu9kIIM+aukP/KyI6kQ7t1UFkpoEVGLMeUmCsEk7NXhktpp0j9q
	PKG/FB/pfRy7aZ6IG94+KVCZ/hLntCsgpdcRzlkmVSu1Vo++dmvVDFwR7llAea0pHLek6azQWz5
	na2DRHBYcT8BcNW8YSZhxxn2iTwiQ20H
X-Received: by 2002:a05:600c:5295:b0:4a1:e92b:ae4a with SMTP id 5b1f17b1804b1-4b3c3545146mr113538265e9.21.1793879138032;
        Thu, 05 Nov 2026 03:45:38 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:37 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:02 +0000
Subject: [PATCH v4 14/19] perf cs-etm: Don't print missing buffers in
 snapshot mode
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-14-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

The driver produces lots of AUX records for trace data that was never
captured in snapshot mode. Downgrade this to a pr_debug3 message as it's
only an error in normal mode.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 320164645f61..51431a4d5db7 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3361,6 +3361,9 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	struct perf_sample sample;
 	int ret;
 	struct auxtrace_index_entry *ent;
+	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
+						   struct cs_etm_auxtrace,
+						   auxtrace);
 	struct auxtrace_index *auxtrace_index;
 	struct evsel *evsel;
 	size_t i;
@@ -3414,8 +3417,10 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	 * don't exit with an error because it will still be possible to decode other aux records.
 	 */
 	if (!found) {
-		pr_err("CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
-		       " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
+		int level = etm->snapshot_mode ? 3 : 0;
+
+		pr_debugN(level, "CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
+			  " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
 	}
 	ret = 0;
 out:

-- 
2.43.0

