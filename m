Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16083B05AC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371819; cv=none; b=r7A/Nb1lI6IFtbPjTfDCzW1Vm5eIz9aEs/o4YThprl4iyvA/HqcVMS7LfLd0Kh6Rp/Dwk0JAjI8yobA3Utwax9odJjQmZ1bx8U2a9UHsC7ny8wQdAG89geODS201bQqRec+PvTGbIEg28kqP1CLx/K6w+7n+dOLx/kpv3d/Hb5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371819; c=relaxed/simple;
	bh=P3KyXyTNzLWqPtiDsAWlEoyQ2QATyxAt/NpP8cQGtao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mOLhMPKpX4RJ5NmoDnnotsn0EZC3lG3HuEoT6KJbLKMtP6EOY0dFGGoigiob2ixCCPolIsp1lDC1/19x1N73h0ijjyoQWjOKDhjbTNcRFU/rlUa7qZn0qS2C3Z+4SJP8GMiZ8tyEz+ufxA05zp+l1YpEK0kdUawslBCBMhLd0so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iln7cd7+; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iln7cd7+"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so2175805a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371781; x=1791976581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=epeEoqFJxJZ9rzrd7Yj+uBKsPgIccWzbk6+MVwkssHo=;
        b=Iln7cd7+o5eBViKFtOjZOE5e/zOFAMQiK4voG5O5+FoSD3b4D5hOmAL6GR4rqzVTLT
         ZBuIs80RiKLH1XcvDWvglvZeXCiCNxAZzIbstGQ/NofVbeM1Lbx6pEHJm1rKUgV37iDT
         /hI66+SpyWy33NRwIghFkrvyZzPC2A/EHLywWW9GJZHvFSDNjlbHoNehfd+5N2R5KNt1
         LIvfq+UNzRLWm143KCIORZGilblgovvGWOJt7d+xbIL0o4KeHtI3vdMX86TnVdM1zS3E
         O031w2y/NsC51Q20kvbC3NOpoJKQsiSDmtov0jNWzfoC/WUQmjfHZX1V4AZy4Zbjq7rV
         lMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371781; x=1791976581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epeEoqFJxJZ9rzrd7Yj+uBKsPgIccWzbk6+MVwkssHo=;
        b=V9K8lv+/sJ1ZOvzVX4JifoVu3WJRq0y8D9mWJg+dmsdisL31qr4MYSjyBQggAd9HEq
         Tgi7Rbq3WQ4bhh1fZq9dP059RnP2fH1spW7QhNdofObe1jCNce/8qgjigifnnhLcdV7X
         71id5OQW7SW/G4QXakN2WVnfhzkcUc1CpCtqg1YCl8z7jmgyHZSIJ6U+IrkN6L17I+0s
         1F4fVMdawfSLJhcgVE5kAInbmUylB5cSs6JjBAvUyKGruxyxUTCszFCscSsg+B0R6Q/J
         fXbZ7Zy4Fm3f61P4SDgugfeDToYdxwvbwM9rNg+jLyFUIIS713pCdc0D+R4yGLIMLWA7
         GK6g==
X-Forwarded-Encrypted: i=1; AKwUvBzwa1Tmq0b1xLMOUkU8t0fE6RSo0pn4uLBdztnoBlWfuYh6rzmRwulfpEjP3xtiUgFx7676z2uPZC5N5Tc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfvwl1QgX2b72vfbGSIytss/tKqwtQsZVy6B2unOWmqwPhQO2k
	VrBDqvhUEoCn/Sjy/SG3VMPYHh0c7yn8N5p/yTVIsHYQS+4wvQTOALne
X-Gm-Gg: AYBFou2E+3N3v4NQ+1kzOH0m8ku25tUS1AA9ekb1HN+Yt6JvJGvV7xGjKPdVMuf/npE
	hi8x1XAE2ESLFFfI9peD7XtA0XQlG4NafgqSMcjFoyWEMvFKEq5te+rOCbMrs4KJt9RkGo/K2jg
	fgjtbkP1IT2/ZCzkHxBgRTURCgz6sCnAyTLSf1i/ec1TGml7ef3rdl9/YNK0gQ07z1TFtbSkLXz
	UJV6qqIEcdIBdYDTmrAN4XiociIeEqSQtfbLzbn76QCKkJyN/4xgBgkocU1tcLwDfS2qhoEBct1
	EEfWklHwPBhO1Z0E9JW1Loi2nEGWw4HdC+rKKLVo+LTCQoUxyDDBJ4XaFQvX7Fxt4vzES3i4i2I
	fTm2Gg3fkKVpPyArX4uPIuuwPtC5iNoDp7yIY7OeYefhXw0ISkgVgKagKvKOTf/PavuP6covY5w
	HsXcCXv/oQ6WLq6oMeavkJhdA0/y2YrUWNjUtF+X9WSCKIKb7X9BRh5oyR1LcxhxnmTvC4uNe5L
	g==
X-Received: by 2002:a17:90b:4b8d:b0:3a5:25e:85fc with SMTP id 98e67ed59e1d1-3a8a1ce5d6cmr1698155a91.63.1791371781245;
        Wed, 07 Oct 2026 04:16:21 -0700 (PDT)
Received: from lima-kernel-dev.. ([161.142.150.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5e825b9sm1450044a91.3.2026.10.07.04.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:16:20 -0700 (PDT)
From: Daniel Syauqi <syauqicode@gmail.com>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests: timers: skip raw_skew when adjtimex fails
Date: Wed,  7 Oct 2026 19:16:11 +0800
Message-ID: <20261007111611.2086-1-syauqicode@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

raw_skew reads frequency and offset data from adjtimex() without checking
whether either query succeeded. If a sandbox blocks the syscall, the
test can use uninitialized data and wait two minutes before producing a
misleading result.

Skip on either failure and report the syscall error. Preserve errno
across the newline printed after the second query.

Fixes: 51f91cbdf545 ("selftests/timers: Add clock skew estimation test from timetest suite")
Assisted-by: LLM Codex
Signed-off-by: Daniel Syauqi <syauqicode@gmail.com>
---
Tool assistance: OpenAI Codex helped identify the unchecked adjtimex()
returns, draft the fix and changelog, and create failure-path tests.
Prompt summary: Investigate the unchecked adjtimex() calls in raw_skew
and prepare and test a narrow selftest fix. The affected content is
raw_skew.c error handling and this changelog.

Tests: Built raw_skew with make. Forced EPERM at each adjtimex() call
separately with LD_PRELOAD; both runs skipped with exit status 4. A
normal raw_skew run passed, and targeted timer selftests had no failures.
The full kernel test suite was not run.

 tools/testing/selftests/timers/raw_skew.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/selftests/timers/raw_skew.c
index 0c87a8fb0..2ad5e2e35 100644
--- a/tools/testing/selftests/timers/raw_skew.c
+++ b/tools/testing/selftests/timers/raw_skew.c
@@ -19,7 +19,9 @@
  *   GNU General Public License for more details.
  */
 
+#include <errno.h>
 #include <stdio.h>
+#include <string.h>
 #include <unistd.h>
 #include <stdlib.h>
 #include <sys/time.h>
@@ -101,7 +103,8 @@ int main(int argc, char **argv)
 	}
 
 	tx1.modes = 0;
-	adjtimex(&tx1);
+	if (adjtimex(&tx1) < 0)
+		ksft_exit_skip("adjtimex failed: %s\n", strerror(errno));
 	get_monotonic_and_raw(&mon, &raw);
 	start = mon;
 	delta1 = diff_timespec(mon, raw);
@@ -116,7 +119,12 @@ int main(int argc, char **argv)
 	get_monotonic_and_raw(&mon, &raw);
 	end = mon;
 	tx2.modes = 0;
-	adjtimex(&tx2);
+	if (adjtimex(&tx2) < 0) {
+		int saved_errno = errno;
+
+		printf("\n");
+		ksft_exit_skip("adjtimex failed: %s\n", strerror(saved_errno));
+	}
 	delta2 = diff_timespec(mon, raw);
 
 	interval = diff_timespec(start, end);

base-commit: 602042bf29f6efde39cfb5fdd9289bf4854bc0c5
-- 
2.47.3
