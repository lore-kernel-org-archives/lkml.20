Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194435;
	b=Uel5YoIbWte59DjiI5n741gXF7LgUApv5IWd11e5VTsNJ8Zhg329lAOc2TtAEYW/dWRT
	 Mx2Xc0eYYLmk94JpkkrgLFvoEOxnK20nRzIHe785HMQIMHHRnyY8cCnTHtD7vMvnVIkik
	 o7TCq1RqweeEZPjRoT4eqXAeQyuMhWBCOoI1rVYXRsI5upPgxHgKkfXzn8h+lyAQbDNfh
	 3uPLirMVr2GdFYzxmZU7koFg6hCsnQA9UhPxJYbFWMw/itX0nfPC34XcZ+Igf6ouuBT6X
	 TB0A/CZiVgyBlonaKGT7/GbUca3T5lQ+cyeHnYUY3KPBG692Sqo+/kWXJAv5pafdWGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0jiG2rD9So/arZvMAXmt3lPJiORsbNPvj+sHUkRM/lY=;
	b=aTWpGjvpeAWZGkJyJoFWcI9UAXr/HaN15cPRTrp5TPXJk0ul5jLn6Qx9hvqrIiOPiS2A
	 oUgV1KybaJicaV7FBaQPn8zA7SVXPU8OjawRJa/U9DQDkoUZHrXWNS9rn3Mc3ft7FkeUF
	 /Y8N+pYgcQLewIhwKlfMdfgNe2LUoyvtcaaXU5iFR5KX7nzbOWtuU8/ErOX4VHVa1L7F9
	 ycmj1kIaqxkshwcToe4VDiVvuwLhSy9shnmcTSImz32y8YkPSn8S+4DIDV/adq/9SFBxC
	 94OvKV0s3zcU6PRVNDj+5lfPmDGIHNcO6/sj+z2mKgZGInustri4igt7oGyOlZA/pDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="dLn/UHz5";
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5255606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5255606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dLn/UHz5
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67583c777abso1182266d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20260707.gappssmtp.com; s=20260707; t=1793194434; x=1793799234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jiG2rD9So/arZvMAXmt3lPJiORsbNPvj+sHUkRM/lY=;
        b=dLn/UHz5laULvOPw2Z4Il7Aes12V3tgaa7l8ko/Z6TiMfArXMOE0vl5uTrR+SM5+UC
         UXFW9wsVIwY7y6LQZ8Kp7zfKyM2kDUosLPf1Ulylv65drrBZkQnx9UltIGDC7E6Y8v5X
         vwnC3zFVtn+PPhm6Xqmb90g5fxvW3ExPK0sCXwdU1j6tyT5zdgBDt3uLraIrJulfCxZu
         FACMECN/6hf9PgeufeuE3m5Z/5aJMCrCGQdje9ZZQeU4OZytdlGUyRiMn2lENLTUQC0I
         cX4W5vCVgrdNNQaW6ET7ZfWTwM7jkpctDlFBps+8rRNUpTevoiHxA0NpeASFFj4Jj+Tt
         BQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194434; x=1793799234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jiG2rD9So/arZvMAXmt3lPJiORsbNPvj+sHUkRM/lY=;
        b=STyd9++kIL1DDkzzP/OBRqdi8PIbRUI7sVWSy6Y38aupfX/waCehVCYevJugxrTlc0
         c2A3WWssqRWKsJ2gxlZocnlSZgZtQE1J5rVYnZduqFErTGi2TTIKfReNipqZRjHkTSNi
         826rqutM7WAsJ+QvZs66tg+DJW7flCGCXv6XiHHubioxISEmETcZdMqYHMyfqD9LPCAG
         80jLI24LfYP/21tiLViiKB2gdiquszB/hnwowI6i88oo6GoS4WsvLJXx1JHOhQUC1dPi
         vX2zg0+lu4CDqEaih68Q4obNuTPlVOxeQiEuX/4VohAInxMNdyBO0Mh73PBiF55hFLOB
         kaTg==
X-Forwarded-Encrypted: i=1; AKwUvBxTeN1hxGmNLyAMkmFOeaezo3Qw8QzuDTBlXm1wmpras6RBC4B+0RsvqzmtQBEP+3LSFXL8giyfwusaM0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoawk2Cb0thYOXLFmcIfCb8z8OroGkh6OvpX9VxwnDWwoEfFP+
	kt3ovuuop2NtImerp9TBLaTKYXGaF/itfUhYs/3/lRJ2xAIEFMOflDOj5GtGAO2WGlYb
X-Gm-Gg: AYBFou22Nscxs8NbGTNE/v4hRHlSyq+fIncdcha/g7LoIbHwIXhNW830Bd0U9c4Ymem
	KJDfFqvO2lK3OXNxbT8Gde8QzOtrbRvtNMMegLTCAqZi10Auo7xNAmH9S+rBxja8UWXXxXlYIsw
	7l1EiLr1iXCk0Q0dtCPlWyTDvZIV8qYNaL4ZFvsT8GOJyC6FFBvrAnkPQiSxlFxzU4Ir1il/mSZ
	uCIe8UezliaaEP5svB5MJZ/0yhH4I5ea966DTsQLt233SfPQHQD+NepINYa4vJvgMEuGnxHBKri
	tN0pNldl4iK9BqEPtLRfZcXJy3xhyo+wFsxMQmXPRcv0iiLHUVo4+Vf2byPM33YxBvcSoe5S+c7
	MakyO0WqgdKh5F8zZGAvStZbhwM4DNWL6+LcAFDmnavbwPZUJVJiQnRAeyIgxNcuzvuV0DUY2yU
	mGhV0cc256DTbZiquxj5FxbwQ2gBLxWvjou/svQRtONNLPxaJMWT2GJV985QKNZwgyI1D1W2Ywo
	xFhh5xo9vGSLoskqW/Q3sWQL8cdMu025VmSx9cxKLDFQsj+3A187kg+V0PLcCM42fgnxZck6X/W
	GF1BK3u436WgGy3eAw5Y04jK2hlUGGrfNeXZDlP7kUl53KkqZLBgekjBYk1zT/KpGxWEH6YKjLe
	8JDShWqak2rqj1Y+aLlgw+0DP9RqabDl1KIiEn9V+iI6JAcw=
X-Received: by 2002:a05:690e:4884:20b0:675:449d:3d72 with SMTP id 956f58d0204a3-67a814bcec8mr653958d50.32.1793194433581;
        Wed, 28 Oct 2026 06:33:53 -0700 (PDT)
Received: from CC-KJQTV599DQ.attlocal.net ([2600:1702:7b5a:ab90:103d:30e1:1f09:a9ae])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a79f38dfesm1694911d50.1.2026.10.28.06.33.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 06:33:53 -0700 (PDT)
From: Ketan Bhardwaj <ketan@armoriq.io>
To: Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>
Cc: linux-security-module@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-api@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	linux-kernel@vger.kernel.org,
	"HARIHARA SUDHAN . R" <harisudhan@armoriq.io>,
	Ketan Bhardwaj <ketan@armoriq.io>
Subject: [RFC PATCH v2 5/6] kernel: add KAP checks for unshare and setns
Date: Wed, 28 Oct 2026 09:33:34 -0400
Message-ID: <20261028133335.75899-6-ketan@armoriq.io>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261028133335.75899-1-ketan@armoriq.io>
References: <20261028133335.75899-1-ketan@armoriq.io>
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

Check unshare and setns against the bound task's authority. Neither
has an LSM hook, so they call KAP directly. Every namespace type is
checked, and setns checks the type of the namespace it is given.

Unbound tasks are not checked.

Assisted-by: Claude
Co-developed-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
Signed-off-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
Assisted-by: Codex
Signed-off-by: Ketan Bhardwaj <ketan@armoriq.io>
---
 kernel/fork.c    | 4 ++++
 kernel/nsproxy.c | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index eb198c8..4216a2d 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -52,6 +52,7 @@
 #include <linux/cpu.h>
 #include <linux/cgroup.h>
 #include <linux/security.h>
+#include <linux/kap.h>
 #include <linux/hugetlb.h>
 #include <linux/seccomp.h>
 #include <linux/swap.h>
@@ -3276,6 +3277,9 @@ int ksys_unshare(unsigned long unshare_flags)
 			 current->fs != current->real_fs);
 
 	err = check_unshare_flags(unshare_flags);
+	if (err)
+		goto bad_unshare_out;
+	err = kap_check_namespace_flags(unshare_flags, "unshare");
 	if (err)
 		goto bad_unshare_out;
 	/*
diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
index 3fb1595..d41d7f5 100644
--- a/kernel/nsproxy.c
+++ b/kernel/nsproxy.c
@@ -25,6 +25,7 @@
 #include <linux/proc_ns.h>
 #include <linux/file.h>
 #include <linux/syscalls.h>
+#include <linux/kap.h>
 #include <linux/cgroup.h>
 #include <linux/perf_event.h>
 #include <linux/nstree.h>
@@ -589,6 +590,10 @@ SYSCALL_DEFINE2(setns, int, fd, int, flags)
 	if (err)
 		goto out;
 
+	err = kap_check_namespace_flags(flags, "setns");
+	if (err)
+		goto out;
+
 	err = prepare_nsset(flags, &nsset);
 	if (err)
 		goto out;
-- 
2.51.0

