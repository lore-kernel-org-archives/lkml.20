Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1361F31D366
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790978104; cv=none; b=V2KK8aSTT7PTm0jSMN0pM6aQ1EgAJ5hVUcx8mF63Xutcl1UXyVzA8QSa623iCNCHYlfYBbOEHVGTzSv8CvNDDlLFz/8GclFoZ1YsTSZmhjTVGxXDhG+A7CLBvOMKt1myp/3wU0niWbVj4p+t3+jLodKJw4HfgwHAOLJ78QY6f8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790978104; c=relaxed/simple;
	bh=VD3Hz/9DzNsRGxMWcveNGmeZZzofDchA7Ax7edN5DOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HJJGmidnqNbnh7iStV/q20FXmXISpOwMC2vIHqpC7/MTNoffbboPBFUWVAa637eY1pHvpoB5WUG+hsSVAr1SSsyLXDifcQI+Qwws4USIXr+emLlyzXEez5aQpFiqLspcIcN+oq5lEU/wt95Q31rmrtGaj2X1Fr7AN/spyAIycrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=NLGDTOUa; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="NLGDTOUa"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8871ada1a26so141997b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1790978101; x=1791582901; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hBay+pkpwERtZ4nN6gmSwBzZpZ+h9K9WoaUNPQ21Vl0=;
        b=NLGDTOUav1QAkA0nWFIf37Mc0x+1A/+Ct8w9MG4i7jB2y9HFtlKYBCf+dMc5Z2f5wa
         4pwRynadwxTFWfFEnL3/TZcukXdSGCCg7yVxLb1lPLClZHYd6BUUdwzOX3BRahjZFgrk
         DZu+Nw/0NQBoqKNOMviVxPNeZlHsy3E00GDoLYBcyYYHDiEtDj3yfsRprsEA9fvWTeEO
         88KuZCXqUOwfWeJVA0twXpgENPPeUYOV7RYE2OTt+fnLH2toWTFM3a23fwLz2nxEVBaq
         brhRbcrPDkIGYym9iTrbOevAFYZoax11ejYasOfPViY/hSN7x/kuD+DSJeaLLr2PXqaI
         Tihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790978101; x=1791582901;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hBay+pkpwERtZ4nN6gmSwBzZpZ+h9K9WoaUNPQ21Vl0=;
        b=beg/yiE/k9+7KU3Aw98kIxx5Wo+gcp6Fh11cX7wvrCJTBM59FeHr7Bj/89/9M/5Tw+
         nn225LOXLYpKuGu9GO4G50IQ+O0fsnsOcEeClNDZo33cRqbgiA3zR4o4jwFV9jOAshuT
         iIGA/jiUDiM6V4JMtrYIAWtETwmN3Hn3Gsr2rX7k8YBiooLPwxRB4a/8r7i1Fw9uH2Ar
         oL8/NY7SDZB12mX9YiCknbX6tkY4oGuS71mfNkjxMP3uxPuC490T/PD7La8izbKUWAUh
         Z0RjEm8d8qq5QmWyS1oHYODjxKRG6pqYlNoqDnNlS0cZtiPbkGGZE953Zfe40X10V60u
         /ucg==
X-Forwarded-Encrypted: i=1; AKwUvBxX8sWmvan5PKOZezjKshV9D4hgApW1vHDmzMqmHN9ukEjLhJokL8xVvELKopcVMzzPbAFCrU5s5ktUWHk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlojLnotN6T+g/xwkHrLqhzMISQ0R6xaiE9QgQ1/rKI0oeVUAS
	5FxcTemOnFab98/7WraYFxYKWRGCle3+Nd+3Ll8leHw33DQuC4h2r0HfoJGrUMKr9Gw=
X-Gm-Gg: AYBFou1/TV/yHBsD5YmcTF62BG1i/locefDgHUi3dXWiHwMR53fkVUVJHW/PAGEjGSu
	xYCJKmMiwIVYTDmWwd2dlDOlMVyzE+lC6CvW4VqmYMGGjcDgAGDdDhlU7BF2PdwnNZUnq0fWewg
	E6no/Bp3xKc1WeV2Km+x5CpSSfL9ljn3YhY8nRdQfmundHlxR1Z335WxNNCe97v6MkiyStfk2TO
	qBrDKQdimsWeT2yShp6YtrQtBXxhiPmPrZt7pztXO3I7H2A9VKcDnrX24nR/NmipcJkPkyQW8Gv
	LhShbb1W46BqNzvtf+xcwxyEETCOwzgbFdPShbeGvgfH2LIcyilv3pmjrzpZzlDy+pfBjP3JUWT
	p0RBV36h6kveU7hGj+jNPjRr6xOL7BX0KO30WjcxluTXaWrwmEh5vtcyKAGlciaCqXAXoT0R7vo
	+qFzMAib4Ljn+eAVFaAON7gHz6uPfwtywMXbl3GfhYU0IoX2bHPTYRtYgIrdB+x11Ny3NovGnbx
	88Et2AAIWnesdJ0ZdUiayFUlMLBelcw5Z1VGJ/ZF0PPth/T8ouScg==
X-Received: by 2002:a05:690c:660d:b0:8ac:e42d:35a with SMTP id 00721157ae682-8ae94ce98acmr4734927b3.49.1790978100965;
        Fri, 02 Oct 2026 14:55:00 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:24a9:81b6:f7c4:c7f7])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae328ee37asm14837137b3.10.2026.10.02.14.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 14:55:00 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 02 Oct 2026 16:54:46 -0500
Subject: [PATCH] selftests: breakpoints: Skip step_after_suspend_test on
 systems without a wakeup capable RTC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-breakpoints_rtc-v1-1-a3b6542a0fdf@oss.tenstorrent.com>
X-B4-Tracking: v=1; b=H4sIACUowGoC/yXMQQqDMBBA0avIrBuIUULwKqUUjRMdhSgzsRSCd
 ze2y7f4P4MgEwp0VQbGDwltsaB+VODnPk6oaCwGo42ttTZqYOzXfaOY5M3JK22dbZwb2zYEKNX
 OGOj7Oz5ff8sxLOjTvYHzvACTQei/cwAAAA==
X-Change-ID: 20261002-breakpoints_rtc-0686388d44ff
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1

This test puts a system into suspend state and uses CLOCK_BOOTTIME_ALARM
to wake the system up. This alarm can only wake up systems that have a
wakeup capable RTC source. On systems without such an RTC (for example,
most RISC-V boards), this test puts the system into suspend and just
hangs, requiring power cycling.

clock_getres(CLOCK_BOOTTIME_ALARM) fails with EINVAL on such systems,
so add a check based on that to skip this test on systems without a
wakeup capable RTC source.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 tools/testing/selftests/breakpoints/step_after_suspend_test.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/breakpoints/step_after_suspend_test.c b/tools/testing/selftests/breakpoints/step_after_suspend_test.c
index ca2aaab9e4ca..727790259429 100644
--- a/tools/testing/selftests/breakpoints/step_after_suspend_test.c
+++ b/tools/testing/selftests/breakpoints/step_after_suspend_test.c
@@ -18,6 +18,7 @@
 #include <sys/timerfd.h>
 #include <sys/types.h>
 #include <sys/wait.h>
+#include <time.h>
 
 #include "kselftest.h"
 
@@ -158,11 +159,21 @@ void suspend(void)
 	int err;
 	int count_before;
 	int count_after;
+	struct timespec res;
 	struct itimerspec spec = {};
 
 	if (getuid() != 0)
 		ksft_exit_skip("Please run the test as root - Exiting.\n");
 
+	/*
+	 * CLOCK_BOOTTIME_ALARM cannot wake up systems that don't have a
+	 * wakeup capable RTC from suspend. Check if we have a wakeup-capable
+	 * RTC to prevent this test from causing the system to hang after
+	 * it suspends.
+	 */
+	if (clock_getres(CLOCK_BOOTTIME_ALARM, &res) != 0)
+		ksft_exit_skip("No wakeup-capable RTC for CLOCK_BOOTTIME_ALARM\n");
+
 	timerfd = timerfd_create(CLOCK_BOOTTIME_ALARM, 0);
 	if (timerfd < 0)
 		ksft_exit_fail_msg("timerfd_create() failed\n");

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20261002-breakpoints_rtc-0686388d44ff

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

