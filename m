Received: from mail.sysgo.com (mail.sysgo.com [159.69.174.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAE637104C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.174.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537250; cv=none; b=Ed8ARPtYO5vk3bspVd/OXR2FpqCYLkXcQkVNjyMIpq8ehUr1x7xjD8aHW+CqB8JNDapok8qkBKc2lgzJX4nIk5NXavJQv7l4jGB8jiA33Ejko5Cr4WujD3MfTvDSnPMX/yFvZM/Mts5yY5VTA8dtLGpEVK6xAA9MDtPfZU89UdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537250; c=relaxed/simple;
	bh=BiY4U9sglsvFiBXi3brkIY0NZNdc8WRbZCLzVIPPUU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uDcyqEHPppyvfToMG3MIqmcTgz6eycD5uqtSYSCWpB/guxQ4OEJ12qXPnobo7cRygwmgfrMiexLO09fuztvtHL4NmF/8t+lJVWp/JdJzV164gSoG8hTnOQJfQux0uZiztFRq4NN/pV0NIHJVgYz8/4pQK97X5DDVcnGo1au9w04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sysgo.com; spf=pass smtp.mailfrom=sysgo.com; dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b=XMQNP/5Y; arc=none smtp.client-ip=159.69.174.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sysgo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sysgo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b="XMQNP/5Y"
Received: from mailgw.sysgo.com (localhost.localdomain [127.0.0.1])
	by mail.sysgo.com (Proxmox) with ESMTP id 3930181217;
	Wed, 16 Sep 2026 07:32:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sysgo.com; h=cc
	:cc:content-transfer-encoding:date:from:from:message-id
	:mime-version:reply-to:subject:subject:to:to; s=k1; bh=fSOZNINz6
	6eEYMWaaaTgWaIt6DYSqa+nV4VMfPUJHus=; b=XMQNP/5YNrDT2wfdGPw1o/zcu
	nlUmqrksDEHoxHZ02/UihhaQkQQuozWLstJwj+FpeAtcEp9MrW2Hl6MK5Eip210/
	UJASVDSCnsDZ2PpTGvMKTTxHF17KCxfb9xkYY3SRM1Sq38BcEm2poC6utxRf8fTk
	Zc2ZqmNRA/6PMeRVf+JaSk8mXZ01MdGqDFR3aQpaEhrRN5x68PM484GTKzaVKTEi
	TNILT6G+vpkBJppqOTq/d6rSCyv/Vth02VUDA6VJYcLUwC0yG4RQZkmrTLS0Swl8
	WFr5WxoY3OaaGz58fEG9EUbpYPyx19RxAfTRmxVtLXXaKBKCPV8N0egdKhxjg==
From: David Engraf <david.engraf@sysgo.com>
To: tony.lindgren@linux.intel.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org
Cc: linux-kernel@vger.kernel.org,
	David Engraf <david.engraf@sysgo.com>
Subject: [PATCH] printk: Remove console options before decoding the name
Date: Wed, 16 Sep 2026 08:32:18 +0300
Message-ID: <20260916053218.40546-1-david.engraf@sysgo.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes a regression when a console option includes ':'. Commit
7640f1a44eba ("printk: Add match_devname_and_update_preferred_console()")
introduced console=DEVNAME:0.0 hardware style addressing by looking for a
colon. If the colon is part of an option the name is handled as devname
instead of ttyname.

Fix by handling the options first which will add a NULL terminator to the
string.

Signed-off-by: David Engraf <david.engraf@sysgo.com>
---
 kernel/printk/printk.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 6d3d18a50da74..c297a0ae04f7b 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2646,24 +2646,22 @@ static int __init console_setup(char *str)
 	if (_braille_console_setup(&str, &brl_options))
 		return 1;
 
+	/* Decode str into name, index, options */
+	options = strchr(str, ',');
+	if (options)
+		*(options++) = 0;
+
 	/* For a DEVNAME:0.0 style console the character device is unknown early */
 	if (strchr(str, ':'))
 		devname = buf;
 	else
 		ttyname = buf;
 
-	/*
-	 * Decode str into name, index, options.
-	 */
 	if (ttyname && isdigit(str[0]))
 		scnprintf(buf, sizeof(buf), "ttyS%s", str);
 	else
 		strscpy(buf, str);
 
-	options = strchr(str, ',');
-	if (options)
-		*(options++) = 0;
-
 #ifdef __sparc__
 	if (!strcmp(str, "ttya"))
 		strscpy(buf, "ttyS0");
-- 
2.53.0


