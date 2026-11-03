Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749538;
	b=L+VtoTZynfiUDdeG7Zvorur4SJCQmoebXrSDN1tvTsNiCZMELEvZlf2ELsV9LxE5Vjc9
	 whR30qcHUHWk11yDLr5+OgLFQ45u8WNppTWRrtALv6Thvio5v21JaInM0ULN47+r1wjEF
	 MOC+h2YOa1lWRIYkxde2KtHJ9a0Cw00xn5wsVtsZAjC5r0diOIUSYhbMtZ72qy6DNu9dx
	 El74WUbAI1nsmWM8ubZYqUp/mKBsBbfNPVqttWJAKovJ3vMVZyNSWp479X3lrgATuAiIh
	 9lZzBAJ4FGoyNAppLc+4VaZwSdBXJyMoz766PGXAxFVRkHos8m72yvkJ6uLkzSYUVJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=f04SE8jtYJAS4lmqfAB8bp6af/1ppJs2us9i398YNlc=;
	b=jx427Y5FDfxvksYzBRUXGgx5KYahNdeTIfn2AS+0YiZigsrgvLJsGRYunZwI6sBdW+Yb
	 Tj92xMfqXpArPauyUE1jt6hTfpHzJsDnx85Auh2EzBYK0h4gwcMQkymF/73yCaUO7YQHx
	 5fMIjAX7uzC0TAEWXYpxkIxnrNpCzbokH0CJTczYUL8g4b5fQhCt4TY2EbbT5pngLp++c
	 QsRlR9joZc98FCGIRzn6aLOAy66onJ1xScNdqxOFsNcCD906xPWvazcYg3vcj0InY1JdE
	 xBJdssJtHuxUvT3DCISK6UIJx0mX/D8WDsaIq+aNm93n2VEfI+f7wXMSZQR6xgOEd5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BncyKMkV;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001B5606D809
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 001B5606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BncyKMkV
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so374901c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749537; x=1794354337; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f04SE8jtYJAS4lmqfAB8bp6af/1ppJs2us9i398YNlc=;
        b=BncyKMkVdt4jXMWiwPEG1jr85wLTQ6CSysk9cSRw9kXm57myovGWQpf8KpbnRtUIlj
         KnlNR0iyRprRolXRNXEZ/WdvYeXCBMW8x5JmJ1Nl42QWTUOovYdC3R0phwfuvC4Ah3wt
         MH+TxF5fnEW8Gci05fC1ZmpqJlHmIdU2aSn3o8THt+ub6Z3EBAggXUT980fYmQ9VbLNm
         07G9IKBilGedSAAngvHI5HareF/PO37T+s6fQb9eqOvNejEKDZ9ZywDV7BtLJsGUC00l
         zK4dL/g3amMhNg2vL8IGsJiAcPmlp6NxgcQY5yn6V9Fp+ql8r8E7ZpXHzujOASwPcoX9
         k9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749537; x=1794354337;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f04SE8jtYJAS4lmqfAB8bp6af/1ppJs2us9i398YNlc=;
        b=YSnWwbMHdpqaNwW83ZYtJAY5sAKXpC7O3r+0/LTgbM9OH5V31OBkgzvFci5Z5XytDY
         I+dAo20CfOMlg9EcUViXsWTxd0I7KyE9b4APoQ+uJEhBAxPtenXyxI6HjepWCBfUNsSm
         gxUxQhQpaLyxvLELdbc/BxSBUYVtWR5W3cKvYEtK+OYpHc3VIjZaQdW4bZsC/d+QXqiW
         NbIsTbQHHXMhyqGqt8BEpamIT3LeAhBdiIYGcRlQt4S1epAW1f/HcTwqeXj7RTC/VfOD
         aVrAb6cGW5eGTsSi1HDzdHVZaFJnZgWCdzGzbxYJgustjEtAOdtCyOrrp5hJpzS/CJ3d
         5Pgg==
X-Gm-Message-State: APuU4Z/dpj6iSW1J/1dbXaah4SADF/jy69nPpQKewKh6ArJIbCA7PHKv
	UlqIbdjlnTv6TLp3ULsHDS5E3wR3CCo/VCbPsKP9ZiiIGtIXro2PW4QtppyJTHPsXImyFbLNr7W
	QeEVtUXAtnQ==
X-Received: from dlaj3.prod.google.com ([2002:a05:701b:2803:b0:1ab:7a71:e7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f0b:b0:13b:3132:6e99
 with SMTP id a92af1059eb24-1ac5af2da84mr19796869c88.20.1793749536644; Tue, 03
 Nov 2026 15:45:36 -0800 (PST)
Date: Tue,  3 Nov 2026 15:44:27 -0800
In-Reply-To: <20261103234502.1008382-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103234502.1008382-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103234502.1008382-12-irogers@google.com>
Subject: [PATCH v1 11/41] perf test: Make the CPUID matching test architecture independent
From: Ian Rogers <irogers@google.com>
To: linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Kan Liang <kan.liang@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, John Garry <john.garry@linux.dev>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@arm.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Sandipan Das <sandipan.das@amd.com>, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The arm64 CPUID matching test called strcmp_cpuid_str(), whose arm64
MIDR comparison was only built for arm64. Now that strcmp_cpuid_str()
is given the ELF machine of the CPUIDs and all of its comparisons are
in util/header.c, the test can run on every architecture.

Move the test from arch/arm64/tests to tests, as a "CPUID matching"
suite with an "arm64 MIDR" test case.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm64/include/arch-tests.h      |  1 -
 tools/perf/arch/arm64/tests/Build               |  1 -
 tools/perf/arch/arm64/tests/arch-tests.c        |  4 ----
 tools/perf/tests/Build                          |  1 +
 tools/perf/tests/builtin-test.c                 |  1 +
 tools/perf/{arch/arm64 => }/tests/cpuid-match.c | 17 +++++++++++++----
 tools/perf/tests/tests.h                        |  1 +
 7 files changed, 16 insertions(+), 10 deletions(-)
 rename tools/perf/{arch/arm64 => }/tests/cpuid-match.c (75%)

diff --git a/tools/perf/arch/arm64/include/arch-tests.h b/tools/perf/arch/arm64/include/arch-tests.h
index 474d7cf5afbd..2b3834a5ddbb 100644
--- a/tools/perf/arch/arm64/include/arch-tests.h
+++ b/tools/perf/arch/arm64/include/arch-tests.h
@@ -4,7 +4,6 @@
 
 struct test_suite;
 
-int test__cpuid_match(struct test_suite *test, int subtest);
 extern struct test_suite *arch_tests[];
 
 #endif
diff --git a/tools/perf/arch/arm64/tests/Build b/tools/perf/arch/arm64/tests/Build
index d44c9de92d42..bd15c6bbc1b2 100644
--- a/tools/perf/arch/arm64/tests/Build
+++ b/tools/perf/arch/arm64/tests/Build
@@ -2,4 +2,3 @@ perf-test-y += regs_load.o
 perf-test-$(CONFIG_DWARF_UNWIND) += dwarf-unwind.o
 
 perf-test-y += arch-tests.o
-perf-test-y += cpuid-match.o
diff --git a/tools/perf/arch/arm64/tests/arch-tests.c b/tools/perf/arch/arm64/tests/arch-tests.c
index 74932e72c727..ad16b4f8f63e 100644
--- a/tools/perf/arch/arm64/tests/arch-tests.c
+++ b/tools/perf/arch/arm64/tests/arch-tests.c
@@ -3,13 +3,9 @@
 #include "tests/tests.h"
 #include "arch-tests.h"
 
-
-DEFINE_SUITE("arm64 CPUID matching", cpuid_match);
-
 struct test_suite *arch_tests[] = {
 #ifdef HAVE_DWARF_UNWIND_SUPPORT
 	&suite__dwarf_unwind,
 #endif
-	&suite__cpuid_match,
 	NULL,
 };
diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
index 58858f3d2bf9..4a45b6740050 100644
--- a/tools/perf/tests/Build
+++ b/tools/perf/tests/Build
@@ -44,6 +44,7 @@ perf-test-y += stat.o
 perf-test-y += event_update.o
 perf-test-y += event-times.o
 perf-test-y += expr.o
+perf-test-y += cpuid-match.o
 perf-test-y += backward-ring-buffer.o
 perf-test-y += sdt.o
 perf-test-y += is_printable_array.o
diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
index 0b8897fd42ca..67d162ec9ef2 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -177,6 +177,7 @@ static struct test_suite *generic_tests[] = {
 	&suite__util,
 	&suite__subcmd_help,
 	&suite__kallsyms_split,
+	&suite__cpuid_match,
 	NULL,
 };
 
diff --git a/tools/perf/arch/arm64/tests/cpuid-match.c b/tools/perf/tests/cpuid-match.c
similarity index 75%
rename from tools/perf/arch/arm64/tests/cpuid-match.c
rename to tools/perf/tests/cpuid-match.c
index b073ac33ea9b..e3d4a349f393 100644
--- a/tools/perf/arch/arm64/tests/cpuid-match.c
+++ b/tools/perf/tests/cpuid-match.c
@@ -2,12 +2,11 @@
 #include <linux/compiler.h>
 #include <elf.h>
 
-#include "arch-tests.h"
-#include "tests/tests.h"
+#include "tests.h"
 #include "util/header.h"
 
-int test__cpuid_match(struct test_suite *test __maybe_unused,
-			     int subtest __maybe_unused)
+static int test__cpuid_match_arm64(struct test_suite *test __maybe_unused,
+				   int subtest __maybe_unused)
 {
 	/* midr with no leading zeros matches */
 	if (strcmp_cpuid_str(EM_AARCH64, "0x410fd0c0", "0x00000000410fd0c0"))
@@ -36,3 +35,13 @@ int test__cpuid_match(struct test_suite *test __maybe_unused,
 
 	return 0;
 }
+
+static struct test_case tests__cpuid_match[] = {
+	TEST_CASE("arm64 MIDR", cpuid_match_arm64),
+	{ .name = NULL, }
+};
+
+struct test_suite suite__cpuid_match = {
+	.desc = "CPUID matching",
+	.test_cases = tests__cpuid_match,
+};
diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
index 20ae3609892b..0d54d1d5acd2 100644
--- a/tools/perf/tests/tests.h
+++ b/tools/perf/tests/tests.h
@@ -201,6 +201,7 @@ DECLARE_SUITE(util);
 DECLARE_SUITE(uncore_event_sorting);
 DECLARE_SUITE(subcmd_help);
 DECLARE_SUITE(kallsyms_split);
+DECLARE_SUITE(cpuid_match);
 
 /*
  * PowerPC and S390 do not support creation of instruction breakpoints using the
-- 
2.56.0.385.gac671c819a-goog

