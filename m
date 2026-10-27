Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793120678;
	b=SfHCO4HA7/g/SPDwaYRehjiloEmynxP+AE3MOXWgoCCm6szqFL8mkUVU7DWoy8cGPWr4
	 q20vZOwy3aCE71zPFvJc3ZxarnzBnw7NvENyResb87Om/ae64qI3sj33G39GQb2trkHO4
	 sXAFNT8UCXQFyg9zdNev2NJDujQrRyiPiU+QAfZYtxM0Q46RDcD+C4VL1BuHp2t0woY1L
	 Elg1kFLdaD/w8rpXyZsH/LwnPKDWrxBzxHwWtueKMU0aCiTLXKlx0VBySBpkDfZJ+8xbL
	 isvo2Dxg3550ZPzSxFYzwuZ0u5vkBnewsClRWU9eKQjrFihKSgerNu3NUaJfBWswFYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Content-Type;
	bh=vF3lYjwaP6Vu1eELbN7F7td7N/RNwt4u/bezxSwf+3c=;
	b=XjNzAFO4/TTorrIYdcfyXQdy+RY51+/5mgCv8cmsLsEZpqK0atRnmdsE3Q+jQ7B/3KGT
	 uKn/Z9vXdNVY1hEgJ118cl/8vjBAoC/6qCZSqQyF/lTyNsabO1PibmuAoCm276ByQaVR3
	 aG7BrxT/KGKC6/VLtaDOdD6oD9pBdkWMiwZCOOKEMe7ssVXI/CEUOB1l68XlKS1IZLToM
	 5jwmQ10dGNSy4LQkKAUKBv467goVwJD+YNb7XWNkDePzUM44BprifS/UgwOWSSc7uT0TA
	 2rIohnRtsyLYzOqbC7DetT25frlQWMOlWcc854XLVIImlq8jKzLjUUZtRdTW09mZgqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pG81yAw8;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D486A606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D486A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pG81yAw8
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-351788121cfso229596eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793120677; x=1793725477; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vF3lYjwaP6Vu1eELbN7F7td7N/RNwt4u/bezxSwf+3c=;
        b=pG81yAw8jX7gIgwuDJVfaxwUm4IiHuxT99V6Q3vbAIY6bO6PBPeCnn+bPdpgYmwkL1
         kWYCT3xbmanK3r79KRwmt8BUo5HJ5P0FbpO4cOM+76kZMNNPdTvRaJUQbMht9P99RvvE
         6bbZGGsNPlYdSI4F46tqzYekEKE19h0n6pncgaZMG8qmwqFjjaejjcKa0TMGgYJ6Oy7+
         ZnjAiyYxg6lyFEC4LTWreHA18inubal7ZD/+H4o+GlzsebRNkb7fkhTELUmS6mDZyPI3
         cDwAt6eYeGBY0WUkLlq3HyrskLQZxI7TOrE8jjHevRNq5NsnJPw4H4/RchsOJlxQbN7T
         c8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793120677; x=1793725477;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vF3lYjwaP6Vu1eELbN7F7td7N/RNwt4u/bezxSwf+3c=;
        b=hP1bzZa4FWr/SfSV02cOmmTooP4gVcRbrouNXAzdpRk67J8qzbbF1m1PMPhKfYhPwP
         rvG7JSGw7YOhWQu4HgiUAxr9VoOXN26FVDk8WaYdwbq69txD4Rm1puaw+vKTsoPDWHdq
         qi5jgGDhqgv+t+2BvP/+NaLFm6mVAIF2m3Qis3cb7H410B3adKrK/cyjTe2x5M+Otz/9
         GuH8Y9GVoCf09BM3kLpq9uJZ/6JY3KKxAGps26OXUaWl0xVyrRwyqgrdr7xEnllI3+0m
         7AwV1z40BnnfmkrlTTD6mJYBJpgR3lK8P7znkmAj4C41gKh5lvv0+jEL0Nm7tPQ0jWcB
         yD9w==
X-Forwarded-Encrypted: i=1; AKwUvBxcMhHU8YwuE2KD6/68tg0j3av4hV2keEyaiQXZB+9FVY4yica89H7kQj/hMBn0xMIsPmHMyXStvIrO4iY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9vaSbB7fIjGKy3I9oHfR1T1ZtvuyJ8DYXmV+vkCAuphW1E6lF
	3YTBqOJTIf4ApchGVpFqeVrlFGwanGGXSAz/HeomqEkbUqibfxLDh0eF6zxQanESHaNmoYCx+Nn
	9d2STA3mXVA==
X-Received: from dycpq24.prod.google.com ([2002:a05:7301:fd18:b0:36a:eec:f68c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea5c:b0:19b:98bc:326f
 with SMTP id a92af1059eb24-19b98bc32c5mr13845200c88.18.1793120676283; Tue, 27
 Oct 2026 10:04:36 -0700 (PDT)
Date: Tue, 27 Oct 2026 10:04:12 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027170415.2815859-1-irogers@google.com>
Subject: [PATCH v1 1/4] perf off-cpu: Use the CPU map index for the bpf-output
 file descriptor
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When populating the offcpu_output BPF perf event array, the file
descriptor of the bpf-output event was looked up using the CPU number
rather than the index within the evsel's CPU map. These differ when
CPUs are offline or a subset of CPUs is used, leading to the wrong, or
an out-of-bounds, file descriptor being used. Index the file
descriptor array using the CPU map index.

Fixes: 282c195906c7 ("perf record --off-cpu: Preparation of off-cpu BPF program")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf_off_cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/bpf_off_cpu.c b/tools/perf/util/bpf_off_cpu.c
index c4639f6a5776..ff8935688b43 100644
--- a/tools/perf/util/bpf_off_cpu.c
+++ b/tools/perf/util/bpf_off_cpu.c
@@ -95,7 +95,7 @@ static void off_cpu_start(void *arg)
 		int cpu_nr = pcpu.cpu;
 
 		err = bpf_map__update_elem(skel->maps.offcpu_output, &cpu_nr, sizeof(int),
-					   xyarray__entry(evsel->core.fd, cpu_nr, 0),
+					   xyarray__entry(evsel->core.fd, i, 0),
 					   sizeof(int), BPF_ANY);
 		if (err) {
 			pr_err("Failed to update perf event map for direct off-cpu dumping\n");
-- 
2.56.0.313.g2479322e68-goog

