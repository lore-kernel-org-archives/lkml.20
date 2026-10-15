Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD4F4D09F3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062727; cv=none; b=u7rwX8oMepgqtOOV4YhV0Q/2pZwZ8G/7iPu8OSyfX9hd7dwOogmA+uyX2w4r+WUuM3cBib4Xh38GdunbGNBtVgwA2Zv/AZpTqpw88BUTd2IMAknEsVOfsMxkN7TLLD1UMru+qs/Gxtq1E/FQ7WL7ZgUTeeRwVFL+au2R7xeGfnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062727; c=relaxed/simple;
	bh=souBc5LM+ZP8bJKYxVLBa3N/cFi5YYK6F4kM1fz93jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AQZ0dZyd0jztD+FWATA6ud3AtCZqFOYXzknB2WshRQzzNWHVQfNeydVmKGvjO4EMe6FaVGbY0B1aJ0HpkiLT05vQ2+5hWesX9c2dWgVXIT3G+9H9G/JGLeU7HzPQSusRuTUiFsgBqhn46klQctt7a+FQS4KlVyl3UaTc+W82qWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Edmfl/ug; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Edmfl/ug"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-141395927feso9873540c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062725; x=1792667525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Qizvs/lAA8DOR5ycYqynzWycuQET1RhOhDF12u5Cew=;
        b=Edmfl/ugV82J4/VO+IXtix9zNicjfBXsa8aRqgFxv5untoSnqpikEEgTmQHh/l172U
         Gs7fHj17C3ZUFy3IltxrbNYMKO7dcm728IVTuT/B5G8RrpFudQOX1Vk5cy4N6ol3WCac
         f1vY4yggZOVhLtpmwikh+vU/0IU4Pn6pcTS0RXmfDolDVZQ1q2FNCVkzSKcBVw7hpToD
         7gnBfifIp0n9sxUQ/dSDdO3EGG5nKO9g3JUS0KjselU9svlwcfY1GuF3TOtmeIV0Mpln
         k4lkYs2whvV3MEcScV8pS0C9CGoP2cYbj2Y5b0jHuUHZxoZkFee3LjLpSTP/S1AspyQK
         icMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062725; x=1792667525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Qizvs/lAA8DOR5ycYqynzWycuQET1RhOhDF12u5Cew=;
        b=XyYmDY3rPmtUfSQHWIT3HTODlElj4UDLtNTDSoM4kWKKpb9NzfCyYJ+a1KBogW8a8s
         I2aMqKd3GOIIOaqaXrwffZHIeS1pyZnYmMzi+IwCVrjuHZ87tPPYdPbvAshIHtBdr8h9
         7YpXjAmqEUAI7/ldMgX1+M2tNLV8DmCVkj4rWSb1r4cUjzdzU8uzPdPY55lAfB20+Nbi
         GXnRU36kD8XQF9rjG0oweksw/f8WRPQ/SyBYzCcccfG5SzhV5ShoGWfqIZ26pY5lIYfE
         K+qS4WUL9nzkqstFGmeYAonr2dNZHJggz6A6rjM8l2RIWyAYQK/LCZcupxjGBsuTgmG7
         hO+w==
X-Forwarded-Encrypted: i=1; AKwUvByFkjv/UlJ7+zK4wkwl9FgtgujLdnHmV4mZwcSF9MvVTg5DnyiTwlf0yAf/dbJchWl/fx/8c0zuUzqsKqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKI53jEWncISmrEb22ayPDsHMbrqHSaXAQIdmXGYkziRaugMeNx
	4Z13WMvFocaV5zvYsHxOUFETiDmBrLvg1/PMJHnvwBWb1Euda6gRb9W4
X-Gm-Gg: AYBFou1/b0NQAlncTa68xK8gp/b/oUGL6uYAktmQydyWT409UkKXSclLp4XHG5yIueL
	ejPgGI09jYz4zgi8zSHaYGGQFJMGcuDKjktP8XGslp6xFL/zW8+8ZlSW4Dth1g4dXo15EowV+Ho
	57C0aWRR76Cwm6mbMbVkP1FnIMoFIdSrApnECqmjIYXEEMpEwKzHPi4VUzrWWpmPVoc414ut3CU
	MQIz+/+DnbVJQM7MQB8QfNt7KL9iBLe9WVEJQCw9lJmSs9i3N8K75elc5838I4u+v1MnPoQzTT2
	qDFb3Qbh+nKiQCBp8RT/Xgx5ikccGUl9dO9VfZHIF/hyBAdfmu6trlHUjhwikV8SSWGdX5EnAFc
	XG4N0uMFZyK6HG505amO1PecFByvxMHYqt52EMFmKnRCVhZdHaL9eR4hYzA9ZXizDytpG6g6hNe
	7dXjWyAFQI7jXcFWDuRu79xbAisoj98u4zeNbuRt+pD05L4OND7TZSEgxhjo2WCJ4rTkybBUxI0
	13rxZ6fq++jwtvDdSXyfBrjFBpCWFgcQXf4KWk=
X-Received: by 2002:a05:701b:4343:b0:15e:e4e7:20f with SMTP id a92af1059eb24-16a5f01dfaamr26153079c88.25.1792062725109;
        Thu, 15 Oct 2026 04:12:05 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.200])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16997c21ff3sm54696473c88.2.2026.10.15.04.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:12:03 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sahaj Chaudhari <sahaj123.sc@gmail.com>
Subject: [PATCH v4] selftests/cgroup: test pids.events notification
Date: Thu, 15 Oct 2026 16:42:43 +0530
Message-ID: <20261015111243.1551387-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test to test_pids.c that checks a fork rejected by pids.max
increments pids.events and generates an IN_MODIFY inotify event on that
file. The test cgroup is the one over the limit, so the notification is
expected both on a default mount and with pids_localevents.

This covers the fix in commit 1765a153d985 ("cgroup/pids: Restore
pids.events notifications in local mode"), where a rejected fork changed
pids.events without waking its pollers when pids_localevents was enabled.

Tested on x86_64 under QEMU without KVM, on kernels built from the
cgroup for-7.4 branch (eb69e955de7b) and from the same tree with that
fix reverted. With the fix, the new test passes on a default cgroup2
mount and on a pids_localevents mount. With the fix reverted, it passes
on a default mount and fails on a pids_localevents mount. No kernel
warnings were logged.

Link: https://lore.kernel.org/r/20261013064812.875787-1-sahaj123.sc@gmail.com
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
Changes in v4:
- Move the test into test_pids.c as test_pids_events_notify(), using
  cg_run_nowait() and cg_control(), instead of a separate program. This
  drops the Makefile and .gitignore changes.
- Drop the pids_localevents skip. The test cgroup is the one over the
  limit, so the rejected fork notifies it on both mount types.
- Drop the duplicate pids.events check after reading the inotify event.
- Cite 1765a153d985 as the fix the test covers.
- Move the read() error-handling note from the commit message to this
  changelog.
- Rebase onto the cgroup for-7.4 branch.

Changes in v3:
- Check for a failed read() of the inotify event before comparing its
  signed result with sizeof(struct inotify_event).

v3: https://lore.kernel.org/r/20261013064812.875787-1-sahaj123.sc@gmail.com
 tools/testing/selftests/cgroup/test_pids.c | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_pids.c b/tools/testing/selftests/cgroup/test_pids.c
index 710109b53dfe..e775c5510cf2 100644
--- a/tools/testing/selftests/cgroup/test_pids.c
+++ b/tools/testing/selftests/cgroup/test_pids.c
@@ -3,8 +3,11 @@
 
 #include <errno.h>
 #include <linux/limits.h>
+#include <poll.h>
 #include <signal.h>
+#include <stdlib.h>
 #include <string.h>
+#include <sys/inotify.h>
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <unistd.h>
@@ -133,6 +136,75 @@ static int test_pids_events(const char *root)
 
 
 
+/*
+ * This test checks that a fork rejected by pids.max increments pids.events
+ * and notifies pollers of that file, with or without pids_localevents.
+ */
+static int test_pids_events_notify(const char *root)
+{
+	union {
+		struct inotify_event align;
+		char bytes[sizeof(struct inotify_event) + NAME_MAX + 1];
+	} event;
+	int ret = KSFT_FAIL;
+	int inotify_fd = -1;
+	char *cg_pids = NULL, *events_path = NULL;
+	struct pollfd pfd;
+	ssize_t n;
+
+	cg_pids = cg_name(root, "pids_notify_test");
+	if (!cg_pids)
+		goto cleanup;
+
+	if (cg_create(cg_pids))
+		goto cleanup;
+
+	if (cg_write(cg_pids, "pids.max", "1"))
+		goto cleanup;
+
+	events_path = cg_control(cg_pids, "pids.events");
+	if (!events_path)
+		goto cleanup;
+
+	inotify_fd = inotify_init1(IN_CLOEXEC | IN_NONBLOCK);
+	if (inotify_fd < 0)
+		goto cleanup;
+
+	if (inotify_add_watch(inotify_fd, events_path, IN_MODIFY) < 0)
+		goto cleanup;
+
+	if (cg_enter_current(cg_pids))
+		goto cleanup;
+
+	if (cg_run_nowait(cg_pids, run_success, NULL) != -1 || errno != EAGAIN)
+		goto cleanup;
+
+	if (cg_read_key_long(cg_pids, "pids.events", "max ") != 1)
+		goto cleanup;
+
+	pfd.fd = inotify_fd;
+	pfd.events = POLLIN;
+	if (poll(&pfd, 1, 1000) <= 0)
+		goto cleanup;
+
+	n = read(inotify_fd, event.bytes, sizeof(event.bytes));
+	if (n < (ssize_t)sizeof(event.align) || !(event.align.mask & IN_MODIFY))
+		goto cleanup;
+
+	ret = KSFT_PASS;
+
+cleanup:
+	cg_enter_current(root);
+	if (inotify_fd >= 0)
+		close(inotify_fd);
+	if (cg_pids)
+		cg_destroy(cg_pids);
+	free(events_path);
+	free(cg_pids);
+
+	return ret;
+}
+
 #define T(x) { x, #x }
 struct pids_test {
 	int (*fn)(const char *root);
@@ -140,6 +212,7 @@ struct pids_test {
 } tests[] = {
 	T(test_pids_max),
 	T(test_pids_events),
+	T(test_pids_events_notify),
 };
 #undef T
 
-- 
2.43.0

