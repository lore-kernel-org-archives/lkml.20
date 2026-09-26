Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C1F39CD10
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790449499; cv=none; b=VaOO7RNohw7dlX59kWwUjLr5ZOa1Cb4UsdYKf9VqqZmfkVk8brgOYxxaS73uFvWkRAIVRtnQmX6xK9sGp0WFYiQFbfn8sT4HN2IwM9X3FO/7eQ9SPJTaTPrGZftWcUqL57Yc3STDjdh3lKnzXzaLEuiqpZp8yzLEj7GfTxT/Y4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790449499; c=relaxed/simple;
	bh=L4A1fxJ3tPV9/tI/nDKPZdkFGHaPTKrChsaQcyn0hoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4qQS3Z9Lm4SV/EPFAmZFl175emQ+eGQ1EQuSj7CCZsQD/3l6EE0PvqG7ckuRHCPsUCsYl7oRYa2AVlfnkxD1cPEEzt/TIetN4HNtOnlS1U4rvMExOFf6Bs7xtO6dvyjCtdnT02dleisMImdbGquBpDdtKptYfqlIPOXoaUj9a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jos7U4qJ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jos7U4qJ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so1142350f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790449496; x=1791054296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2mvFNOm4Ish0nzna8egVnRJE6+xNsqM+lxsIY+3qhg=;
        b=jos7U4qJenlDP/AFKbQy3WjIh0PDu5cHjHphO2EKoxxCAgwDdSWXg+hJzR/YNKP+Ra
         Rma5lBpFSJIZJK8BqWeo00sISi2p2iiRQMXrhr72YmJWYRRiQRrwbOc4CeMYZwKYbuUG
         8ivey3H0Isc/ZRIZ7RNCq/mJikrnVjvAfJFfzmYGKsIIITLnd/WMcDpf08/dnlqBzAu3
         TL14AYTktqqp83DhAZnwgnhH6TTbrercQKUEsdSodk04ToO6EUUcJD1H72CdqvS+FN/F
         wYdMz7dtL0/z9ijyxumrVEmIkiwzps01QIhgmFslok73BFyst0mufoMlAeUYrWlpNGGY
         BUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790449496; x=1791054296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c2mvFNOm4Ish0nzna8egVnRJE6+xNsqM+lxsIY+3qhg=;
        b=PcUYHC96A0fl2K0aCoafs6cAM9pXZh5oE4Sm7wv1+3IASIUm1GvLGhIYdd+9nqRick
         WWXSzgeoHncSder9ileJ7OryUUUULirKBM+MUWI8QBpwA8Ch5hgTgpAXz6nhxb5YlyEu
         GRG3j7dQdYBSO6Ro5ZSDTrmWGvAmGUHMG9gmAaZUn625tWh/BneWjhtsoQDFumIvh3Rp
         JY5xh3chgwpTRRe6EAVrGDXhB9eHcYVx3tUtrLHVw9cOAsvHOYSs3Bay6fiUdJ6uqqo8
         8bk54ZS4StgtsPPHYiRVAn+HvJpzPQEYXX9fdBDLpgXNVKueWJyk0PkQ+WPXH16f7ovL
         WSBg==
X-Forwarded-Encrypted: i=1; AKwUvBwdhEYFXhrtHJZQOLkvDAqb1vP+cKGVVdg0+n02UtrD5b1CqQb8n5MuqrNPekQnIJZr/V6LNw7MfLSmVEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgf5VwFdMxN7/PykQpqFvXIGs7SY02ek8Y1RJczMDxHVKHNxmu
	UHkl/BE3bErYxCOKZSsY3Uv7sue3X7eBsIKOGb4s46ISDynHcJMl9Ko7
X-Gm-Gg: AYBFou1gIaeBFafm973C/9PfzR2bOtTFmgKvE42dP1bHC2tPmd9vkaORNXpAMUv0Qgf
	wjPN3KkICTpaALmgAFF2vkiI2G/gu+ZnUGRO0MW3fdh8YMzdtx+FKe+V65zbrX5ZLWkamYCFGVd
	LoSUWzeQj5NrlmJJ8aQc82Eyqtrr42p26gVjF74nlgP9+eNDUtm0akYgTxFgyZD0+edpgVTNMWE
	rFIAyaNHDGDUO4nLcwHZHsLMJeI7nj/vWNQHewZ+6XD8eKRF1M8uXwZ5H9Cq/K5qhqUsgaQU6dh
	2yQmMq31Iqa/IE+MH+RJ//0FACBttbedNWOvbBU1AHg46Z2/NsI++FRBzw23fSMnxKkYNVllSGJ
	AXDCFs+7cMCPhT0nk43PVfOZJh1LJhD0hWogcQ/PRmrvbXcsXovJUqrw1J10uw/Zx48pGvW/7Jb
	ZfONb4z65Vc3r13XwMlENFp5I8LbjZE/uSD0vUaVDnEyRs05M7tgD/K5lp540TWghxnAoQrYLlU
	/47KmaR22rb1RkB83xUl8+f312PsNmU1aEQUq6thXf1d1wjRpubcHnbm7tBpcIi6rDYJjeg5DS2
	6FTP7etKHuYsJ5BEZ8EXbeCmQoOSThBSl+4KwXHraiNLBX7wjuQ=
X-Received: by 2002:a05:6000:70b:b0:484:3317:a19 with SMTP id ffacd0b85a97d-4887db2d084mr9402512f8f.26.1790449495804;
        Sat, 26 Sep 2026 12:04:55 -0700 (PDT)
Received: from mikebook.tail5724d6.ts.net (83-244-142-114.cust-83.exponential-e.net. [83.244.142.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm15216880f8f.9.2026.09.26.12.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:04:55 -0700 (PDT)
From: Michal Pluta <michalpl2003@gmail.com>
To: acme@kernel.org,
	namhyung@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 5/8] perf bench futex: Stop when futex_wake() fails in futex wake
Date: Sat, 26 Sep 2026 20:04:04 +0100
Message-ID: <20260926190407.1106421-6-michalpl2003@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926190407.1106421-1-michalpl2003@gmail.com>
References: <20260926190407.1106421-1-michalpl2003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If futex_wake() fails, 'futex wake' adds -1 to its unsigned counter of
woken threads and retries forever. Exit with an error instead, as
'futex requeue' already does.

Fixes: 27db78307481 ("perf bench: Add futex-wake microbenchmark")
Assisted-by: LLM
Signed-off-by: Michal Pluta <michalpl2003@gmail.com>
---
 tools/perf/bench/futex-wake.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/perf/bench/futex-wake.c b/tools/perf/bench/futex-wake.c
index 12a75be077a0..7674622639ca 100644
--- a/tools/perf/bench/futex-wake.c
+++ b/tools/perf/bench/futex-wake.c
@@ -207,9 +207,14 @@ int bench_futex_wake(int argc, const char **argv)
 
 		/* Ok, all threads are patiently blocked, start waking folks up */
 		gettimeofday(&start, NULL);
-		while (nwoken != params.nthreads)
-			nwoken += futex_wake(&futex1,
-					     params.nwakes, futex_flag);
+		while (nwoken != params.nthreads) {
+			int r = futex_wake(&futex1, params.nwakes, futex_flag);
+
+			if (r < 0)
+				err(EXIT_FAILURE, "couldn't wakeup from %p", &futex1);
+
+			nwoken += r;
+		}
 		gettimeofday(&end, NULL);
 		timersub(&end, &start, &runtime);
 		runtime_us = (u64)runtime.tv_sec * USEC_PER_SEC + runtime.tv_usec;
-- 
2.43.0

