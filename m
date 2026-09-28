Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A084EB870
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618172; cv=none; b=cygANaAqksIEE0WdGfAHLKEa0A8cRFDzWmb99Ncq4pTYFjmmBLxoEomTV+d1l7LtP/AtFQiNrjn/1dZ80wHTd/8iuTjqO4aoB9+eXzTXLcmalXsHuBugoot8iSe1E3zC4j/xL+HTGyS1tBs4p9EzsKq7k4yZQm57xisZfYwHt4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618172; c=relaxed/simple;
	bh=kjPzSgKukGJeOcNErrJKgTuGs69bRKEq8kMNgC1lM6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R6W32SYbEjmDMi1O1FxqK72U7DNWRVVeNur1bOGrJqg1vD//QX53rH5AuK55QyZtIhI3je2E8RaC9xoJcSSCynN/nMy0vkDBEUv8qeuedXAEUyj0pebyUd46uVv0MEXvDcANatEeMJytNV/rLx6nvYDf+Gbg+vvUuGY6ahqHc0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bTmyhsV2; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bTmyhsV2"
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-8812140819fso533440b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618170; x=1791222970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejipg3r3UVU9vc4qrGUJPGiICgZ3Att93JZtQzMULZA=;
        b=hq/Eq7bdjzMTtOobOzyOBaX9tRgsOjt+s3D0rKThpTL4CwXvWOrGqW9cXk9xGP9CdH
         bdRRjzos9ADjT4Vj+tvDOzsuBzN1QfyzXPOwg3cnuRcqxZqJcSJ7g2BSKrxw2xuoG+Jv
         iPXogZHbIqvB3Wdryo1uMILTxKyR3juBMxps30z3bWmzL8gxPVaJbB9xXJrpwnef8tjK
         guKXrZgiOKFFx6QyKdiP0XHkZibkCFuZXbJefCND2dGzHL4mqakeOFcnilmIWk9dnwQJ
         Ziasmd7Vp2L0csNfQiZrmB3iIAjK+UVlATxEofpkW8rGe0sPfqZ1ZupmUfYVkEKC6qOY
         39uA==
X-Forwarded-Encrypted: i=1; AKwUvBwol+5udLoYPmy8xjT5QSnXbq7rRpr1E6QKreErnz8txjmwx0NTcwlSslGgaT/6aEb2XtP2e/PEr+i/Utc=@vger.kernel.org
X-Gm-Message-State: AFuF++kzdYtCxNTJ0F7bZpC25Y/3QWa7OmOiJjkBib2reBrQKz5pqm1f
	PViUlNDORzEyiGBSu0j6HQEni4dPE5USPzN6ipmYsEJlcX69VBSKTr0lQdC4HQUCI1vUKAkNH4Q
	XUlYCHGUUIiXx3HLUn/ETCVWqa6truAlQpJ2OXJzRshbVMUNj/rMUt07lt5P3ovhNIfvFHw8X6C
	qHnym6eCJsP4MkaC9ywJ1MSFJoxky5jFqZj0w+CdogcLCD+mrwYpS2wTgGyuUCPudKhXRw+iKe8
	xeN+SvSTezPz/rQ
X-Gm-Gg: AYBFou1u+OcTnIHN72iIXekPwuXobQm9LnXNZncp6QMM3VBVLSOhJqWGu3PsxJTIxc/
	oY/0JVaj0JnwZd7JmT94CvRSA6tCWIwAPAyA8cvCBb7bQbywzmUmBPpkVKkrwTd8RSNE0A7ocqZ
	0Ho+iEbrD1ntNw8cY06itkDIU2DWHxxIkz74kUUfGzDKYXZ+UcxtxHTBXXlzITi6+ONOvSQ6nA/
	4/9q+/O8LjWNWFbf4UbXn+H/YoK7oCB88jgYPUf4Q2tRO+PO8huKNN7UG7uS9AEgsbL1FD9oMVc
	3HUwyjIN47vIcb7/v4p8Skt6lpY5D5wLpxziD9OQf5VJN2IMrJEMz7dlg41Qe0a80AKLeZ+jYpj
	71i6TgzQ5tHDApXp3i85tyggU92N0PYd/4QaH51SYvjJKBfDKTM+TgEApyKcpCMjVANOliWLRM3
	QoosxqxVQtSfflHcqR9mUOjedP36Fz2Ccc
X-Received: by 2002:a05:6a00:368c:b0:882:94ab:20ec with SMTP id d2e1a72fcca58-88294ab313fmr3760129b3a.25.1790618170005;
        Mon, 28 Sep 2026 10:56:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-87fedff3c63sm5365313b3a.6.2026.09.28.10.56.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:56:09 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34344599f01so713034eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790618168; x=1791222968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejipg3r3UVU9vc4qrGUJPGiICgZ3Att93JZtQzMULZA=;
        b=bTmyhsV2W3zEeIElFc1Qq1OP0Be/WT0zuS8i1mfa/sHPsUrhPhuKV0TjRnFgpD9gK3
         ZJCgAHzjgvDAGXahfMF6VY7Dq5NVizLWZFZJq/K0tLDCX8p7/DNB2zi6qp8dw3xe+EG0
         ByJp7pw3MhlGHWUer8LgDtzPrPf8YmG3hz+CU=
X-Forwarded-Encrypted: i=1; AKwUvBzVHCa+ON+Ye9EmOJRk4rCVDg6yVXT+IloRoaZZ+79SqnlfxD7BHJ3PVLVtEL+2AcUtxet6Cxfy/vA/bK4=@vger.kernel.org
X-Received: by 2002:a05:7300:3e93:b0:340:f935:5fa with SMTP id 5a478bee46e88-3427384f956mr10865969eec.40.1790618168035;
        Mon, 28 Sep 2026 10:56:08 -0700 (PDT)
X-Received: by 2002:a05:7300:3e93:b0:340:f935:5fa with SMTP id 5a478bee46e88-3427384f956mr10865927eec.40.1790618167270;
        Mon, 28 Sep 2026 10:56:07 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm26076069eec.10.2026.09.28.10.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:56:01 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>
Cc: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 1/6] panic: Add a notifier chain for pre-kdump callbacks
Date: Mon, 28 Sep 2026 13:55:35 -0400
Message-ID: <81cb85568b36273a8e66215b3e6d671b8488d402.1790014793.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790014793.git.zack.rusin@broadcom.com>
References: <cover.1790014793.git.zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Selected crash callbacks should not require running every panic notifier
before kdump. Add a separate atomic chain with an at-most-once dispatch
helper, and invoke it before panic reaches the kmsg dumpers.

The helper permits another call from the crash path without repeating
callbacks or recursing into them. Document that callbacks may run in NMI
context, with other CPUs running and the kexec lock held.

Link: https://lore.kernel.org/r/aquttpMVKX8e6zGB@pathway.suse.cz
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
New in v2: separate pre-kdump chain, with a set-once dispatch guard.

 include/linux/panic_notifier.h |  3 +++
 kernel/panic.c                 | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
index 41e32483d7a7..3ad390764a41 100644
--- a/include/linux/panic_notifier.h
+++ b/include/linux/panic_notifier.h
@@ -6,6 +6,9 @@
 #include <linux/types.h>
 
 extern struct atomic_notifier_head panic_notifier_list;
+extern struct atomic_notifier_head panic_pre_kdump_list;
+
+void panic_notify_pre_kdump(char *msg);
 
 extern bool crash_kexec_post_notifiers;
 
diff --git a/kernel/panic.c b/kernel/panic.c
index 213725b612aa..d78e90abb192 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -82,6 +82,10 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
 
 EXPORT_SYMBOL(panic_notifier_list);
 
+struct atomic_notifier_head panic_pre_kdump_list =
+	ATOMIC_NOTIFIER_INIT(panic_pre_kdump_list);
+EXPORT_SYMBOL_GPL(panic_pre_kdump_list);
+
 static void panic_print_deprecated(void)
 {
 	pr_info_once("Kernel: The 'panic_print' parameter is now deprecated. Please use 'panic_sys_info' and 'panic_console_replay' instead.\n");
@@ -567,6 +571,27 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
 		crash_smp_send_stop();
 }
 
+/**
+ * panic_notify_pre_kdump - invoke selected callbacks before kdump
+ * @msg: Panic message, or NULL for direct crash-kexec entry
+ *
+ * Dispatch at most once per boot, including recursive entry. Callbacks run
+ * with interrupts disabled, possibly in NMI context, before other CPUs have
+ * necessarily stopped. The kexec lock may be held. They must not sleep,
+ * allocate, wait for other CPUs, or call into kexec management operations.
+ * The message is read-only and may only be used during the callback.
+ */
+void panic_notify_pre_kdump(char *msg)
+{
+	static atomic_t started = ATOMIC_INIT(0);
+	unsigned long flags;
+
+	local_irq_save(flags);
+	if (!atomic_xchg(&started, 1))
+		atomic_notifier_call_chain(&panic_pre_kdump_list, 0, msg);
+	local_irq_restore(flags);
+}
+
 /**
  * vpanic - halt the system
  * @fmt: The text string to print
@@ -682,6 +707,7 @@ void vpanic(const char *fmt, va_list args)
 
 	sys_info(panic_print);
 
+	panic_notify_pre_kdump(buf);
 	kmsg_dump_desc(KMSG_DUMP_PANIC, buf);
 
 	/*
