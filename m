Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB282EEE92
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557361; cv=none; b=n8sTGDwLCb7657Psq83G4RGQ3Ipy0M5Yo5OvrLrtRN3wD2jfCF0YS6W/lazqFbzld48ZchNzj0F3aJ2Dj7gZnQ5ZQukT+u7kQoun+oYvk6k7hN05FS46wckNP086aVav9doRs13fKTrT4TosKqFIPHL+khmj5pfx/nJxqPdkbB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557361; c=relaxed/simple;
	bh=l25+WiU144RGBRMkOv5IbjnpvOBERXMWI8BE5cGW5+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iGa5seczxttCe6VYs3cPYUY3nF4FO7MUg0IFpWc+1AO3/Qaouyer8rlKoa25pqJQIeNlDHOWB/uX9QmvrD+6Z+g1xS1RT+GN1RcEYF0SxqKO9RLRxfKNb31TAlgyWNFfzBsfivm7J2BqKmPjxBAFIvRVQvvA4dzZYIQRLTzXkv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fObnAKfa; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fObnAKfa"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so6575405e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790557358; x=1791162158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxbintdRsWyAeaZ3s1DbMkRkjMg6f+veSrku5GObMlo=;
        b=fObnAKfaDSadtvo5f23UNTVriDzgPbmfz8m4p8au+7kicVkR3klsS4snXmSG37NiBY
         9ey9L4RCJVwzrrXTAJK+4jRlyYKaTFSMC3nSXmFos15lRkl8S562o2OMH7sZZK1F9Q1S
         rXnW4Q9cx+uPEkqVhxDLu+RWpCWTW8YcmXChGf+Pvlb4tK3stqokE3yuCWt9MbzFb48E
         VAmNMHiMftyEbHHUIHLQrnQMu+CaurWrDgnHs05UnRRsNx8/OYaiovsrqycwI/UmK7m/
         c+pWJFZPvlSMBZAISEbAFdWPtS5G6xYnlPJJsiD2Yhp8sUUFJ5GqSUDTa/ceCbmhFoAZ
         F7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557358; x=1791162158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxbintdRsWyAeaZ3s1DbMkRkjMg6f+veSrku5GObMlo=;
        b=X2/o4xUfIX0m6v3+AyLypgC5VgHhTkypDfn5awvfScim5Lu1w8tEuRYh4/srptXpmc
         Q+J5BdYzXERCWdoUlCoD4cDl04oDj6/aV+rnr1baqS5yqI0cI1lbARnm3c9WmSI5+Yj/
         669cvia9TJvQjwoE3Qc7fPkTDvESfCSTpLXsYr5hgE6DuPFjz73eRGLgyzWgrau6RtuW
         SXS4veO1G4snai2iCuJuKqafb7LYsnnvT385itaLis2MrZeZ2UlpAtTtBLBY4Sm60qwE
         Uh8z6SbmRc9Un6KB9C991c/99HwG0zVYoLYooKU9divu6zgytluB/pl9KLhtw7kXnKNu
         7+SQ==
X-Forwarded-Encrypted: i=1; AKwUvByhNpoJJh/fZenyK7eXS+72XQPPdWFp3lEsXQnsu/wCSMzOolVDP4NgicE0o9m0yGbHuw8Hos7SKxlgBno=@vger.kernel.org
X-Gm-Message-State: AFuF++knV9zRhsuU4bm15/9emfNKWj5BQQUH2nlsl/8sDSuLn5ub/yWb
	iojghB4NKGlkPA0B1a7iKuZ5mb4kXpbtY/V+lI95YpOprueqh7zu6AHG
X-Gm-Gg: AYBFou3qmZw7TUKVkQ+MNKGKxum//FQsJAUUtTzUTJYTxoNhvuahBLDZUbtubu3ScKP
	dnVCpjhaG9VZM+04LadotwE8+kMvSolimaKQKlHNBzgDILurl67zc7DXmB8Pf3ERrUvLsjU0EMC
	zSMp3/kRR9l6tlfdT/+txjGToSYVCZCYqoIOhdniBVCzAEZEPbCuxPeHRxYBW6aDBUKzsNiLtv4
	/vCitw5qKfwUrpxLc7QUd8tFg+f75B/Dxs8s148OPZwB6XYzK9Nc4x88++utuJf6dDltRN7oDZ7
	nKMaEG1V4ophWFVKM81UoFbNmgGhiwaW6LX9zxjDjkH3Oome7nZ5V/GX0/JLz8T7SqWywND9vzn
	g7NemNb10IylOhTEHZ5feK3JOMLwIc+2zU4vWEu3rnRCWnXsYEizIb2eQ6Fvbd8FutDJPybz9eJ
	Ki8SOmtXByc02c0N3Q6oWlX7ypb8czMwFISvRf49mYPdrgre4Qf8mZ/UTl03IHDeB/nlq7TAI4B
	a3V5EN2pPkt0fe483ZEzeIoApIFqc0Q1GeBhw9jIhoMg39kGsIMGwnQJT0oj+BJI9g311xhpUzx
	YoLauSwY3Df9g6mokWC9W/wKoxlwRIyDYABxVhn8HHKEShc+2Io=
X-Received: by 2002:a05:600c:37cc:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-49ff06ed91fmr126773505e9.26.1790557358335;
        Sun, 27 Sep 2026 18:02:38 -0700 (PDT)
Received: from mikebook.tail5724d6.ts.net (83-244-142-114.cust-83.exponential-e.net. [83.244.142.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017652d1sm144207825e9.5.2026.09.27.18.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:02:37 -0700 (PDT)
From: Michal Pluta <michalpl2003@gmail.com>
To: acme@kernel.org,
	namhyung@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] perf test demangle: Fail when demangling fails
Date: Mon, 28 Sep 2026 02:02:23 +0100
Message-ID: <20260928010227.1903673-2-michalpl2003@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928010227.1903673-1-michalpl2003@gmail.com>
References: <20260928010227.1903673-1-michalpl2003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rust and Java demangle tests only log a NULL result from
dso__demangle_sym() and carry on, so a symbol that fails to demangle
doesn't fail the test.  Set TEST_FAIL.

Assisted-by: LLM
Signed-off-by: Michal Pluta <michalpl2003@gmail.com>
---
 tools/perf/tests/demangle-java-test.c    | 1 +
 tools/perf/tests/demangle-rust-v0-test.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/perf/tests/demangle-java-test.c b/tools/perf/tests/demangle-java-test.c
index 0fb3e5a4a0ed..a8eb0f4effad 100644
--- a/tools/perf/tests/demangle-java-test.c
+++ b/tools/perf/tests/demangle-java-test.c
@@ -33,6 +33,7 @@ static int test__demangle_java(struct test_suite *test __maybe_unused, int subte
 		if (!buf) {
 			pr_debug("FAILED to demangle: \"%s\"\n \"%s\"\n", test_cases[i].mangled,
 				 test_cases[i].demangled);
+			ret = TEST_FAIL;
 			continue;
 		}
 		if (strcmp(buf, test_cases[i].demangled)) {
diff --git a/tools/perf/tests/demangle-rust-v0-test.c b/tools/perf/tests/demangle-rust-v0-test.c
index 904f966c65d7..ee4ddb61174b 100644
--- a/tools/perf/tests/demangle-rust-v0-test.c
+++ b/tools/perf/tests/demangle-rust-v0-test.c
@@ -58,6 +58,7 @@ static int test__demangle_rust(struct test_suite *test __maybe_unused, int subte
 		if (!buf) {
 			pr_debug("FAILED to demangle: \"%s\"\n \"%s\"\n", test_cases[i].mangled,
 				 test_cases[i].demangled);
+			ret = TEST_FAIL;
 			continue;
 		}
 		if (strcmp(buf, test_cases[i].demangled)) {
-- 
2.43.0

