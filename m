Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415625;
	b=gT+tA39jqAyXmC6XQxCS6f7WVNL9n6KlhseUe4jb43p9IuoCFxmj8r5yxDUXw4eAYQZ9
	 RgiaPZHoxNuMp/bKRx1zZ16RMW9Zy4xIDWsvzawuNZ1Osoh2oqSSDzruACYVJ/ydVRkTR
	 +4koJXEUD4jeQdpa/ce5SCZlrKJ17KXHhoNKeRxY1IobkWdJtW5E9Tc/W0BZgRgEkkzz5
	 H20ahOQmWj9ir0uW2I7OLEUi4Qd6vDlp8nl8YY6nDTfHWteqStlbeI4jNX6OlLLBBi8h+
	 Fo2N6iafxrlFrzf14TwHtU4XAc9IrcB7wACfZlRem3mnDdlaLLwJiG0JhFPE60H4/TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eBvXzXjAl0PssB28sXRWoJu57RNJWaLnVNDQ7q1+ZPw=;
	b=R3RuFXYCneLgJpk4lA2kPhrmcwvxMdWARlnU4qJmq9oMUC8F4z2LOnz6WsExAywBnGIt
	 iLqUlH2QMI0ThlKSXOjsFDNyljbnmEFECuzBaNIsQFFQzHnowrvVqTr6NZjJlPJkju+ne
	 6r8NzjdFk5ct4k2rCY9bDPV1SeQaABv7FN1Phy6qlHQSyVLJs7ErV7vxdlTpevBdON3CI
	 PiiSbXd8YfjPu9E4XrdOVAce84RpV7Xx8lF6AtA9L9B7vKhESJKX5mLtNkggx+DLoeQcI
	 PmqBpKXsKZNr7H/8CiBb17jw1Rwmb1Xu2bA9iCaH6wHzQwm4R/WvYSCxxOueEoLDQng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fhItvhyN;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122C3606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 122C3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fhItvhyN
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a058315c79so1755735b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415624; x=1795020424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBvXzXjAl0PssB28sXRWoJu57RNJWaLnVNDQ7q1+ZPw=;
        b=fhItvhyN97f+TqB77kXmFyDGxHEG5lTG1JgGnFySfPcgKGAUb4uHncpfAGcMzN8fAA
         YxdhptBxE5IrKCsUSE6kSW6aMXCQnl/6RkNI5iNW5TZtmCnUJLa6X2J/FLCWrhYDE6WC
         ZpoJKtGRhq/tKzcl7X8I0393vXkdHSdT6XQOJmbP2X2x5x5kDWCFTjVs4WosVhiguhxd
         q6+6YF0jWrI3gEa3u84YG6gKurpZpV6407KWa3l+1uFGCIVyPhz2d83eLAB2v+2xLOkD
         quxeQEqjXsivsCWH2xWLwYVz+DRYCUSljn76odj40xsS8WQLGYF+BOauh6hpXcqy0G7o
         1Glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415624; x=1795020424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBvXzXjAl0PssB28sXRWoJu57RNJWaLnVNDQ7q1+ZPw=;
        b=ikoiKjfCDIFvfY26KkwfW9ZRF//o6qLVdJNPeX6Wdfes2wsF6L41bSMR7AObbPKa4n
         KCfjHSu1tiuLDI/J3bH6Di+U3HROLdJOY6Fj1vyrjuwSN5+rCRzGK6RJb0C3OMie8YoG
         k77i+DFVhGdjci2V6zYRGpV39qYztoD0qWC4peviwQBRdMw79q9sw1rEoubkL6jb+B+7
         nHCFAiWH/szyTxnfjUu1Q/OQUe3qeHYasDI4Kw7gybQ75du4DcrYstPcZ5Q5CkLBOikF
         VzIFMWedt+CAK490QGbudD2bdr7dj7nNW8r27g5t2kd931LxIhSqpfjJjqnmMzYerLAW
         ynqA==
X-Forwarded-Encrypted: i=1; AL+hErHZcfuKyA512pywXJR3hihT4EtJfs3KECeKBojHto0M3ApjVbgp7KgmIddmd8OoME3tforNODNoia9GmP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q9ywMTsD/067BRe4CTTqKXzgjDXEnTUbIDHKEzWrMCBKtR3/M
	4HNj+2LKZ73CQS7zJxB4lEog+6DepF0V/oOIj7csjX2EH/o2ICFf34IB
X-Gm-Gg: AYBFou358fW/6Kz4xhbt/TIRKNJxn1P3VNfdCJF+/z1JESknNUzgqL3CRDadBGg5MzE
	BC9sJPRe6INLPew0gNzSOUN+veosTVnqR4Y9TazN92/T6jUX9z1F2ahe9AHWemWNyT0F4d5vXRD
	u0dCNfwe9MkFUbeijAlxIgJEx7eCWeydvWj4F81fHfRSUBYD0sYwbaqkOtje+obJuylCevZbbKn
	3vOuu7rWv1JGxnq6S0/UUe9QwtZ3sqPYWoMOmBPIKHCYF8OdDrbjus60T5F2rjGBf8N4oxCmzpf
	hHlAF/f3KV3qSQmKoC9n859QQecoI46UuQD7sd49vhjaXpi7nFFP2o/Xb/Zpot/JJ8Ks2TOAqQE
	Ogi3ciP61PTMJOp9ks+QvF/rWZL15f5onU2vs1Cj/+Z3z4RxpVm03P1+18nDTgxK+3FNzYsnPxf
	K9+DJM3TsnVE4t14BL0Eh0tjp9HwZ2BjnW531NwTrJ0ULD59h6sUKrp6Z+pZO9UrlPj8gb2fx/+
	+Bk2aF37xsV60nFy/+celXcEwGUaGjHVuqZjLtaoFPEi2O61GuDcKOdOZ7rUaijXtNdNzuFwvR6
	pt8nNiqtpGjPCkGnZuwH2DkPrZJ7vbnr2uBHu9ZjHHni/gqJRa+BxnhGxJ3MP3OEymt4ln/y
X-Received: by 2002:a05:6300:210f:b0:3eb:3952:d706 with SMTP id adf61e73a8af0-3f3000c0ab5mr3123096637.69.1794415624374;
        Wed, 11 Nov 2026 08:47:04 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f1effsm2296684b3a.49.2026.11.11.08.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:47:03 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Serge Hallyn <serge@hallyn.com>,
	Shuah Khan <shuah@kernel.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
	Jann Horn <jannh@google.com>,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kurt Lin <lylin1023@gmail.com>
Subject: [PATCH] selftests/capabilities: test_execve: drop supplementary groups
Date: Thu, 12 Nov 2026 00:46:45 +0800
Message-ID: <20261111164645.260593-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When run as root, test_execve keeps the caller's supplementary groups,
which usually include group 0.

Since commit 337490f0007f ("exec: Correct the permission check for
unsafe exec"), a setgid exec is not an id change if the new egid is
already one of the caller's groups. As group 0 is one of them, the
ambient capabilities survive exec of the sgidroot helper, and two
cases fail:

  # [RUN]	Root, gid != 0, +ia, sgidroot => eip
  # Wrong ambient state (AT_SECURE is set)
  # [RUN]	Non-root +ia, sgidroot => i
  # Wrong effective state (AT_SECURE is set)

Clear the supplementary groups before switching UIDs.

An AI coding assistant (Claude) was used to analyze the failure and to
draft the fix and this changelog. Tested on v7.4-rc2: as root, all 21
cases now pass (2 failed before); the unprivileged user namespace path
is unchanged.

Fixes: 337490f0007f ("exec: Correct the permission check for unsafe exec")
Signed-off-by: Kurt Lin <lylin1023@gmail.com>
---
 tools/testing/selftests/capabilities/test_execve.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/capabilities/test_execve.c b/tools/testing/selftests/capabilities/test_execve.c
index 46fc8d46b6e6..9428b787437f 100644
--- a/tools/testing/selftests/capabilities/test_execve.c
+++ b/tools/testing/selftests/capabilities/test_execve.c
@@ -8,6 +8,7 @@
 #include <stdio.h>
 #include <fcntl.h>
 #include <errno.h>
+#include <grp.h>
 #include <stdarg.h>
 #include <sched.h>
 #include <sys/mount.h>
@@ -90,6 +91,9 @@ static bool create_and_enter_ns(uid_t inner_uid)
 
 	if (outer_uid == 0 && unshare(CLONE_NEWNS) == 0) {
 		ksft_print_msg("[NOTE]\tUsing global UIDs for tests\n");
+		/* Group 0 must not stay a supplementary group (sgidroot tests) */
+		if (setgroups(0, NULL) != 0)
+			ksft_exit_fail_msg("setgroups - %s\n", strerror(errno));
 		if (prctl(PR_SET_KEEPCAPS, 1, 0, 0, 0) != 0)
 			ksft_exit_fail_msg("PR_SET_KEEPCAPS - %s\n",
 						strerror(errno));
-- 
2.56.0

