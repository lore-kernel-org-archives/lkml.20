Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D7F36F91F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431048; cv=none; b=toNCebl3EFWbYB/GaQNx8Cjvwviewr+XktX+RNr6ABRz8sBGtaSEj1gj/EOf+79KrhA/sUmNazEcLuMaEiyXk5/8xrpByc/Zq7Og8HLbexL/PnRSNvI8wcXXoh/AH02eBhv3M+Ni6nj9m0w5nmKWyaw23mlhhzcVfVpI9O4k3jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431048; c=relaxed/simple;
	bh=Cigqw7alaqMD6veKjChnhLsYweDGOcKz7YUcqTCBfzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IGhYKYktnCjQiFrF381Hr+sVd7rk0Wa+pUZsK/vLgMU1wQPjNNXZZvEltZhLTBLFoiSEcO/lzNVvoofvHjpRmVbO8ahYt3tBQ0cM1rf1eSUCtkCbYT5C/eQ4z5A3gsf9YC7/FogLn1/n+/CsOuQBDPqXNBV7lAloklMry3HZtDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TT5Ivd84; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TT5Ivd84"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e6038cebefso12643315ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791431046; x=1792035846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1UWwPXhJHy9dia16H9fR1NKH9kFmP3Q3JfyJUA2WzN0=;
        b=TT5Ivd84+8fJ6DSLKJOaVdR1ZcybNDZF6cV1QMMpUa4aJQmAJT9SawW1OeGvkpMwSO
         cGINbsWmvBCabboVKphOHk1EF/jYWGocaYzwyair2d8Xk3Pomrz1mqEK/eJTEm/aBIYD
         ZEfIU+v8GKpcQVavzB0X6dPJ/XqXkqWbsKHlxdFoExnEUzqMqOEy2mqBr28M3oD7JGyf
         YA/7l1VRYFZd3imTkR66rX+kZQ/b6hy4XsorBrfav7OpcZSB97yjYYOAR9aNPmqo8b+G
         cD+MzRSy++T+nd4hlLcVAHZGix0omZKKnEFdlB2ZsGN2/1EloKBvy6s2f1Z2YowE9uTD
         01fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791431046; x=1792035846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UWwPXhJHy9dia16H9fR1NKH9kFmP3Q3JfyJUA2WzN0=;
        b=ZezLWOdj8NOH3AK9cK3//JcRDnTJQ3EU6dtg22p56rgN0WvZZ4Lx0lKU0gv6H+xcB6
         lkqDzUkBfSsz1jZ0mAW8FPElWLaqKLsk5cFcjXeOGJNrfUlN6pCOcnd4VMhSbKxLkMWZ
         Uy631kiDZ2DhdtOGGBOUxSYA6lncxapWQ9fS8lWqfuJcr+J3xOiTU2OrS9nGmP3CTsmw
         U8ADhzueyXcDPa8i/nNB7TAuV5EG4RTYyTWvccWrf0z9jmzaZz58l7QK9IyYlWeAF8A+
         l3BpmoFmuYrmn5pOirynGmD3bC767CXeauVo3dDVEC+nKoF/TYJbHWSaX+m51DKPUTEg
         tRtQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3WIyPvJzGp6ffDjuhtTYUn0w74ceI5CY5hWDm/hktU34h2cbYhK/P+xzMZRIKVBeiCXPed4fhs65KwWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVVYnAMicJiw78y95eo0ga9UMPI7GkpJ5uqK+qaJV6UG0i1/tV
	RFTiMXlIeoZF6pQzZXONVGXlRRruW/UnH5MnnvbgjhWS3MFmxeDWmrsa
X-Gm-Gg: AYBFou14BLv6hHZSPOThpV4N+X5J61Vs1GSPj+g+nbwRp3GImq4gClvfZPuq+q+JXD4
	tm450ZlPPBR8L+81kgcZi1Mh4HDQnUnG3vklQW/m0BoAVVFkyXSc6H+sbsmS1p8LCqg2YT+eHio
	HY0vxouLftMU5EtSu5MbArC5ywHinXQjM+F0GjNE/tEnrMHFJA84dMMrDB+bpnIsyFLUhLdiuYM
	VhjwWyYHLcA4j/cSNIzaJFwRg0+QHUN/yyJXvabZtoUDDvtZ1v8Pl1Z1RR9+3DGO5Ei+1QYNh/k
	3JMYn3nEGsQIGmWtzQ0z46wdorAQVRyM9GncLFPMigAkeH4jnG9EUW4GfCnE17TRCTNRLHyDsFS
	6Zofu5n9TLDOwSYZ7Zd5qsOc11Ygq83pTumO5JTMvDkQncX5npU1lIJ7B9MhVDX8HyiTwLXUccG
	tZU3dbzVSpAIVOUiXz+nnSGUpM9QqOTPAMOiMDjN6TFe8Nojqie7zQOxXsk4q2AsEIo2vRyQ==
X-Received: by 2002:a17:903:110c:b0:2dd:c100:943d with SMTP id d9443c01a7336-2e60057c861mr46793765ad.59.1791431045966;
        Wed, 07 Oct 2026 20:44:05 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482ccb3sm18614595ad.51.2026.10.07.20.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:44:04 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Paul Moore <paul@paul-moore.com>,
	Eric Paris <eparis@redhat.com>
Cc: audit@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>,
	syzbot+39b8fea0641107a1ccee@syzkaller.appspotmail.com
Subject: [PATCH v2] audit: annotate the lockless read of the audit control lock owner
Date: Thu,  8 Oct 2026 03:44:03 +0000
Message-ID: <20261008034403.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

audit_ctl_owner_current() reads the lock owner without taking the lock
and KCSAN complains about it. Only the current task can store itself as
owner, so the check can't give a wrong answer. Mark the accesses with
READ_ONCE() and WRITE_ONCE().

Reported-by: syzbot+39b8fea0641107a1ccee@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=39b8fea0641107a1ccee
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
v2: drop the comment in audit_ctl_owner_current(). The KCSAN build of
audit.o disassembles the same as v1.
v1: https://lore.kernel.org/all/20261002011712.7-1-bbnpreetsingh@gmail.com/
Compile tested only (gcc W=1 and the KCSAN instrumentation diff); I
could not reproduce the race in QEMU.

 kernel/audit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index 631d6d4a23cfd..d0c2036bde759 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -247,7 +247,7 @@ int auditd_test_task(struct task_struct *task)
 void audit_ctl_lock(void)
 {
 	mutex_lock(&audit_cmd_mutex.lock);
-	audit_cmd_mutex.owner = current;
+	WRITE_ONCE(audit_cmd_mutex.owner, current);
 }
 
 /**
@@ -255,7 +255,7 @@ void audit_ctl_lock(void)
  */
 void audit_ctl_unlock(void)
 {
-	audit_cmd_mutex.owner = NULL;
+	WRITE_ONCE(audit_cmd_mutex.owner, NULL);
 	mutex_unlock(&audit_cmd_mutex.lock);
 }
 
@@ -268,7 +268,7 @@ void audit_ctl_unlock(void)
  */
 static bool audit_ctl_owner_current(void)
 {
-	return (current == audit_cmd_mutex.owner);
+	return (current == READ_ONCE(audit_cmd_mutex.owner));
 }
 
 /**

base-commit: a8bdcf944504980635c2069b4a4cfcf677b09bbb
-- 
2.43.0

