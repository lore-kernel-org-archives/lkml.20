Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8E045198E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140889; cv=none; b=qXFwpXgL1GvRrLoA/avYm5qp7eElwzlZW8qrRh5hdpmh6C31WqZRmRSgC+G/ht3stkW++k6vmxFt9QVDQ76NS/nMIkoC7/QRHJVW0VbgZCsge7ZdiMLSV922cw4HMRbiuvavZul8PJIP96c0TupaGbmRnuavfgzCpCA1bZjEGRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140889; c=relaxed/simple;
	bh=+ddBgdQMjneebT1Xm9H6GXtz+L0Qfa2PWgsMcHVNZ0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UdQdcChg7hU5GNzXG+Rcd84xD8CIH0Q1go2IBS5yMyP1tf5rI0fzo8NlYW102BYa/+h/k6ja96Tfv5wD7Pkn6/8JbrOiqUNED1agGDqTJnXQAaOQXYfg0KgtNr7tPlsEGF5ZAtsz+c7qeb8cZxlS+kCP+WEkM9Mi52J1ikZLzSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Sj6xzOMl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EjYBLol2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Sj6xzOMl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EjYBLol2"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792140882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sAZxgkUm/1QOIpkLX+41+B+U7ZsypmU64rIn82sXQto=;
	b=Sj6xzOMl/nzfrNU+ybM4TdwwGaatjUcaEf0TDXuNxJK8k/rjp6i41jzoFCW7jDodZ4KDF7
	tZA5i5ds7qrRfrl3h0i9SwRZFmGWhsflWCxvqsB27FCcbyzB/sDeTHUgzQ3WPqqyoxhDHX
	PHy528zi8fefrL1v4mJ2G/adzTotV4jKkf5BjJw8XxRPAUPlrI/kmMq3QC+RUBzQxJKFm4
	EzVGTPaFOAeWQNYzgYfkXjr8qcYNz318XkizkpHM63hVT8yMUxKw0464RWVqTWEDQTpfL7
	qPVi9GTssRYvXyEdqgp5/XFvuLytbkwYiKQjQLjaLIfJNZW6xCFVqoCD+bpJrQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792140882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sAZxgkUm/1QOIpkLX+41+B+U7ZsypmU64rIn82sXQto=;
	b=EjYBLol2lYXIe3NdaDsk1LL+Puiu5suh9pE2XO4WDp4npg3K3bqb9Js8avRnd64QlP/xJ8
	8WdYzofEyOkd3sBw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Derek Barbosa <debarbos@redhat.com>,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH printk v2] printk: Postpone kthread startup
Date: Fri, 16 Oct 2026 11:00:34 +0206
Message-ID: <20261016085441.857695-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There have been various bug reports related to SMP systems hanging
on boot. The reports vary but seem to have some overlap with regard
to missed IPI's during SMP setup. The reports also show that
reverting NBCON console usage allows the bugs to disappear.

The NBCON kthreads for console printing are started very early
during boot using early_initcall(). Since these kthreads are
asynchronously enabling/disabling interrupts during early boot, they
may be interfering with early SMP setup on some hardware platforms.

Starting the console printing kthreads later has shown to avoid the
hanging on systems that could previously reproduce the issue.

Postpone kthread starting until after all arch initcalls have
completed.

Reported-by: Derek Barbosa <debarbos@redhat.com>
Closes: https://lore.kernel.org/linux-rt-users/arPmYPbFLf2EldIl@debarbos-thinkpadt14gen5.rmtusma.csb
Fixes: 76f258bf3f2a ("printk: nbcon: Introduce printer kthreads")
Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 v1: https://lore.kernel.org/lkml/87ecdrqfhw.fsf@jogness.linutronix.de

 changes since v1:
 - Reword commit message.
 - Rebase from 6.6-rt to 7.3-rc.

 kernel/printk/printk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 0ed86b5e8b160..9a205f94bfac7 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3864,7 +3864,7 @@ static int __init printk_set_kthreads_ready(void)
 
 	return 0;
 }
-early_initcall(printk_set_kthreads_ready);
+subsys_initcall(printk_set_kthreads_ready);
 #endif /* CONFIG_PRINTK */
 
 static int __read_mostly keep_bootcon;

base-commit: 38dfd607b58b63b5488d5756786ee4ee499eebb8
-- 
2.47.3

