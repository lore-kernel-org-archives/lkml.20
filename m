Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29883346766
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304484; cv=none; b=kNQw0IefKvDWwd4wIbKDlI4Jgz/PMBfC+/zwcTOY/h3ySCECaUROmgLsGzeXWeo/Tqp/kLatA475b9z5m0hHLpv7pRKKA8dI0TluQeYQ7OOP8IfbmppLFrsKNX0w+KFLMSPL6vWzTAV2teI+ZDttjsz0gMZskBi7piKKGLWUaMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304484; c=relaxed/simple;
	bh=1owLVTaxp7ZUWuc1J6z2fQOAdB4tV+thyxDWyohbQys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I+OX9BWobLx+Q3S/gX1UVMlYTymGtFmVN/1hIl+PaIIRYC6wqz+zPWd62bgnVaKMqhhTSIWxbDlvvCR80CyWLdBMOVO6MyWJZpI1zhx5hfQeuxFmXQzfL8w3IBbJ2kJtFYhH6ALD47LlZpodMM/bwp83WPK40Vp0eFvcx5cxXhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VznLpPNF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VznLpPNF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so17146395e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791304480; x=1791909280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8v77RP6NX1t8+mngdQWnjTKnGkpEcdnikya0pL1YxqU=;
        b=VznLpPNFF9P7PSrVUeQRUr6Zrz3RTseL2iWgHJSZhm9/jhwgRo6+FZIbnyexRrLA66
         9mx2WwrqunIAbu3ShnDewllXskAI2uqVeq5EnC25fyvcVqAEluyAlSWzodbNAX2+EqtP
         1YxR0+dqSoDllDYl4gwYtx02iQ7UikZlOaowdQj6mq7xjPn8wTJ2b2fjGq/k+JhQKxYG
         Ba0AgHWR4uWuoHLqbOYW68eADR+3CRilcCJmHYgxU+bDH7mAKAO9/bEimhbi4z2VmF5h
         beJ7cVLaTsjN/GxcDut3eV6QED4vR8AsjP4s+g2Yp44i+yN3uK0vTJOk2/Zi6MkVSd+p
         gwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304480; x=1791909280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8v77RP6NX1t8+mngdQWnjTKnGkpEcdnikya0pL1YxqU=;
        b=JV6V0WJCDZPvnOpQRmL3GTOMr/lA8RZzSt1E6qu+OjrOPI90jvUerXba2nr/znCEtt
         C9VQGUTCCsBSygMrhS49AGGmjxpbCYqJyTwTg/LPM39Tg6IAhUsOkUePXLO0zNwozTgg
         J0uDMo16ugZV6Cpa85WisFNFHwOhc+cQn2qf+E/wUY2JIPGd8lhjWCZTIjdLCWTDSHqY
         Xz7XZsDgpe4eH9gmeQGHJvdW0VwuGDos8d/dcFsOYTr/I96P3WSTVExgzz6Udz8/LI68
         X5UVAU2RSeqLVpl+waLEx/kY/gH/yH5NN0O48Q1fGsEC/FzW3qferKm0dJXrl/WHRE9o
         sMVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmDPouIKDklyxp41IM0T7i0dIjeDQ48JrtsUL75Qrg0HxpePhYcsv/dESNfm79w2/2qRddyEKY5vcFCd8=@vger.kernel.org
X-Gm-Message-State: AFuF++kgwx0SuKWdUNpVWSZqe0uKrwU8QSav1MVKhUgCmRincjaK5W4U
	L9oPJNcb4O/TgcffVQOACeJ8HTd/Saz/8tIEkI19j0uvjosFzDz4FdENR9pzo/PGbys=
X-Gm-Gg: AYBFou3ZQ16jabtvKpGzdGhiWbihfcaQnxM/NWY51h5wKCCO5x4R6bxgJUCEPtoMELJ
	AI8sntKFwkXvdOfONWRAwMDA9vKxT2Y8zrLw+uHxVSHwir62cstmPn+T6aL1826z8AcFmsUwFVT
	bMe/9KR2L/D3kDN5s7lCAi5aKEiSX65hFnwgzmdtHA6asbuBBi/EghcjO/THazdCo82hxEZeIdV
	9mOfaNf+xmvXMLjM3ky53HINJlszoZQjTdKa7Xa/at3ubEJbYIlFnYe5OH1B80qy38PCzsELNsc
	wr8GfSVX/t0qM45T6Hq9PyZ1Ou8HWbhHnwCAazNJSff3n8mLEM/rt5k4XIBuW1PnIjCRLFJRaMN
	JHe4kspUArUgyZOZMkfzzsMwpEgujQfeNISg7PZKg6rJrOpXSWM5IiAskQvZTDSR2Z2bPq49PsC
	+Tl0V3cgU4PoecFdtzuVuYIw7trp29UDxR+nDcOA+MFpTdlwSEvlmwiZWn5rCr+euKVlteDg1cX
	g==
X-Received: by 2002:a05:600c:3552:b0:4a1:7690:d878 with SMTP id 5b1f17b1804b1-4a17b551effmr32518595e9.17.1791304480263;
        Tue, 06 Oct 2026 09:34:40 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17a0fc2e4sm78918555e9.3.2026.10.06.09.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:34:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 Oct 2026 17:34:13 +0100
Subject: [PATCH v5 2/2] perf tests: mmap-basic: fix user rdpmc detection
 logic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-rdpmc-detection-logic-v5-2-b25c9d49baa1@linaro.org>
References: <20261006-rdpmc-detection-logic-v5-0-b25c9d49baa1@linaro.org>
In-Reply-To: <20261006-rdpmc-detection-logic-v5-0-b25c9d49baa1@linaro.org>
To: Ian Rogers <irogers@google.com>, Michael Petlan <mpetlan@redhat.com>, 
 Qiao Zhao <qzhao@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

RISC-V and Arm control userspace counter access through
/proc/sys/kernel/perf_user_access. Add that as a fallback to
set_user_read() so the test can exercise both enabled and disabled
states on those platforms.

Document disabled, enabled and legacy states in user_read_state and fail
on values outside the known 0-2 range. Preserve and restore any value in
this range, rather than just 0 or 1.

Skip when the control files exist but can't be written to
(USER_READ_ERR_PERM). We can't rely on always being able to write to
them when an exclude_kernel=0 event can be opened because opening events
might succeed for non-root users when perf_event_paranoid=-1.

This test isn't run on unsupported platforms since the previous commit,
so we can simplify the following things:

 * Test that cap_user_rdpmc is always equal to the requested state
   rather than checking it only when disabled. As long as we stop
   setting the cap in the attr unconditionally on Arm, this is ok.

 * Remove the USER_READ_UNKNOWN/rdpmc_supported fallback in the checks.
   Now the expected state is always the one requested. USER_READ_UNKNOWN
   only controls whether to skip restoration of the state on unsupported
   platforms, so call it USER_READ_ERR_NO_FILE.

Signed-off-by: Qiao Zhao <qzhao@redhat.com>
[Re-write to fix bugs in set_user_read() and simplify tests]
Assisted-by: Codex:GPT-6.1-Sol
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/mmap-basic.c | 131 ++++++++++++++++++++++++++++--------------
 1 file changed, 88 insertions(+), 43 deletions(-)

diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
index 208cd889f23d..2c3276e82da8 100644
--- a/tools/perf/tests/mmap-basic.c
+++ b/tools/perf/tests/mmap-basic.c
@@ -12,6 +12,8 @@
 #include <perf/evlist.h>
 #include <perf/mmap.h>
 
+#include <tools/config.h>
+
 #include "cpumap.h"
 #include "debug.h"
 #include "event.h"
@@ -182,50 +184,79 @@ static int test__basic_mmap(struct test_suite *test __maybe_unused, int subtest
 }
 
 enum user_read_state {
-	USER_READ_ENABLED,
-	USER_READ_DISABLED,
-	USER_READ_UNKNOWN,
+	USER_READ_ERR_PERM = -2,
+	USER_READ_ERR_NO_FILE = -1,
+
+	USER_READ_DISABLED = '0',
+	USER_READ_ENABLED = '1',
+#if defined(__i386__) || defined(__x86_64__) || (defined(__riscv) && __riscv_xlen == 64)
+	/* Unrestricted access on x86, legacy access on RISC-V. */
+	USER_READ_LEGACY = '2',
+#endif
+	USER_READ_MAX
 };
 
-static enum user_read_state set_user_read(struct perf_pmu *pmu, enum user_read_state enabled)
+static enum user_read_state user_read_file_op(int fd, enum user_read_state enabled)
 {
 	char buf[2] = {0, '\n'};
-	ssize_t len;
-	int events_fd, rdpmc_fd;
-	enum user_read_state old_user_read = USER_READ_UNKNOWN;
-
-	if (enabled == USER_READ_UNKNOWN)
-		return USER_READ_UNKNOWN;
-
-	events_fd = perf_pmu__event_source_devices_fd();
-	if (events_fd < 0)
-		return USER_READ_UNKNOWN;
-
-	rdpmc_fd = perf_pmu__pathname_fd(events_fd, pmu->name, "rdpmc", O_RDWR);
-	if (rdpmc_fd < 0) {
-		close(events_fd);
-		return USER_READ_UNKNOWN;
-	}
+	ssize_t len = read(fd, buf, 1);
+	enum user_read_state old_user_read = USER_READ_ERR_NO_FILE;
 
-	len = read(rdpmc_fd, buf, sizeof(buf));
-	if (len != sizeof(buf))
+	if (len <= 0)
 		pr_debug("%s read failed\n", __func__);
-
-	// Note, on Intel hybrid disabling on 1 PMU will implicitly disable on
-	// all the core PMUs.
-	old_user_read = (buf[0] == '1') ? USER_READ_ENABLED : USER_READ_DISABLED;
+	old_user_read = buf[0];
 
 	if (enabled != old_user_read) {
-		buf[0] = (enabled == USER_READ_ENABLED) ? '1' : '0';
-		len = write(rdpmc_fd, buf, sizeof(buf));
+		buf[0] = enabled;
+		lseek(fd, 0, SEEK_SET);
+		len = write(fd, buf, sizeof(buf));
 		if (len != sizeof(buf))
 			pr_debug("%s write failed\n", __func__);
 	}
-	close(rdpmc_fd);
-	close(events_fd);
+
+	close(fd);
 	return old_user_read;
 }
 
+static enum user_read_state set_user_read(struct perf_pmu *pmu,
+					  enum user_read_state enabled)
+{
+	int events_fd, fd;
+	enum user_read_state ret = USER_READ_ERR_NO_FILE;
+
+	if (enabled == USER_READ_ERR_NO_FILE)
+		return USER_READ_ERR_NO_FILE;
+
+	events_fd = perf_pmu__event_source_devices_fd();
+	if (events_fd >= 0) {
+		fd = perf_pmu__pathname_fd(events_fd, pmu->name, "rdpmc", O_RDWR);
+		if (fd >= 0) {
+			/*
+			 * Note, on Intel hybrid disabling on 1 PMU will implicitly
+			 * disable on all the core PMUs.
+			 */
+			ret = user_read_file_op(fd, enabled);
+			close(events_fd);
+			return ret;
+		} else if (errno == EACCES) {
+			/* Permissions failure, flag the failure for a skip. */
+			close(events_fd);
+			return USER_READ_ERR_PERM;
+		}
+		close(events_fd);
+	}
+
+	/* Fallback: perf_user_access interface (arm64, riscv, or similar) */
+	fd = open("/proc/sys/kernel/perf_user_access", O_RDWR);
+	if (fd >= 0)
+		ret = user_read_file_op(fd, enabled);
+	else if (errno == EACCES)
+		ret = USER_READ_ERR_PERM;
+
+	return ret;
+}
+
+
 static int test_stat_user_read(u64 event, enum user_read_state enabled)
 {
 	struct perf_pmu *pmu = NULL;
@@ -246,9 +277,6 @@ static int test_stat_user_read(u64 event, enum user_read_state enabled)
 			.config	= perf_pmus__supports_extended_type()
 			? event | ((u64)pmu->type << PERF_PMU_TYPE_SHIFT)
 				: event,
-#ifdef __aarch64__
-			.config1 = 0x2,		/* Request user access */
-#endif
 		};
 		struct perf_evsel *evsel = NULL;
 		int err;
@@ -256,8 +284,28 @@ static int test_stat_user_read(u64 event, enum user_read_state enabled)
 		bool mapped = false, opened = false, rdpmc_supported;
 		struct perf_counts_values counts = { .val = 0 };
 
+		if (__is_defined(__aarch64__) && enabled == USER_READ_ENABLED)
+			attr.config1 = 0x2;  /* Request user access */
 
 		pr_debug("User space counter reading for PMU %s\n", pmu->name);
+
+		if (saved_user_read_state == USER_READ_ERR_PERM) {
+			pr_debug("User space counter reading for PMU %s [Failed to get user read state]\n",
+				 pmu->name);
+			ret = TEST_SKIP;
+			continue;
+		}
+
+		/* Check value is in the expected range */
+		if (saved_user_read_state != USER_READ_ERR_NO_FILE &&
+		    (saved_user_read_state < USER_READ_DISABLED ||
+		     saved_user_read_state >= USER_READ_MAX)) {
+			pr_err("User space counter reading for PMU %s [Unexpected current state %d]\n",
+				pmu->name, saved_user_read_state);
+			ret = TEST_FAIL;
+			continue;
+		}
+
 		/*
 		 * Restrict scheduling to only use the rdpmc on the CPUs the
 		 * event can be on. If the test doesn't run on the CPU of the
@@ -301,21 +349,18 @@ static int test_stat_user_read(u64 event, enum user_read_state enabled)
 			goto cleanup;
 		}
 
-		if (saved_user_read_state == USER_READ_UNKNOWN)
-			rdpmc_supported = pc->cap_user_rdpmc && pc->index;
-		else
-			rdpmc_supported = (enabled == USER_READ_ENABLED);
+		rdpmc_supported = (enabled == USER_READ_ENABLED);
 
-		if (rdpmc_supported && (!pc->cap_user_rdpmc || !pc->index)) {
-			pr_err("User space counter reading for PMU %s [Failed unexpected supported counter access %d %d]\n",
-				pmu->name, pc->cap_user_rdpmc, pc->index);
+		if (rdpmc_supported && !pc->index) {
+			pr_err("User space counter reading for PMU %s [index must be set when enabled %d]\n",
+				pmu->name, pc->index);
 			ret = TEST_FAIL;
 			goto cleanup;
 		}
 
-		if (!rdpmc_supported && pc->cap_user_rdpmc) {
-			pr_err("User space counter reading for PMU %s [Failed unexpected unsupported counter access %d]\n",
-				pmu->name, pc->cap_user_rdpmc);
+		if (rdpmc_supported != pc->cap_user_rdpmc) {
+			pr_err("User space counter reading for PMU %s [cap should match requested state %d %d]\n",
+				pmu->name, pc->cap_user_rdpmc, rdpmc_supported);
 			ret = TEST_FAIL;
 			goto cleanup;
 		}

-- 
2.43.0

