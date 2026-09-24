Received: from mail.sysgo.com (mail.sysgo.com [159.69.174.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582353D411A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.174.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233363; cv=none; b=VqsJGsY5YTI+NaFNhIgMO6htmSi9JptMZA3cswQ+qJuGtdB9lroZxgEPuucE8EY/lf6UsYViecDWZ4IdvWeeE/THA3a+diCAcdxFrS6pW4yizvXH79EVjlTpYiYY94S23Qu4xIPG5dI8PIodDZBIps09H95YBIBk426w5pDouPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233363; c=relaxed/simple;
	bh=L8L1Nte1emHABjpKiCnGcxwmQXzmI4oe3zLBqcU6DbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjZ03QglpaAZq5hDFb9uzdTxAwnYtDxoH/rFd7uBSAxibhlhldWhrq8+l3rbqjufEbG+Z0k3ktgC8OOHxXyjEswLUDq+UlD1zsllIHxeYdMb3US/Ya3Tmb6W06upNSJzFX5FLgSgffjdW0oJfJZrhLGejeAb2PyrGAIPZ2dnySI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sysgo.com; spf=pass smtp.mailfrom=sysgo.com; dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b=Qf/rVUWv; arc=none smtp.client-ip=159.69.174.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sysgo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sysgo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b="Qf/rVUWv"
Received: from mailgw.sysgo.com (localhost.localdomain [127.0.0.1])
	by mail.sysgo.com (Proxmox) with ESMTP id 6DDA48133B;
	Thu, 24 Sep 2026 09:02:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sysgo.com; h=cc
	:cc:content-transfer-encoding:date:from:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=k1; bh=IenFTvG+9K1mRg6NRR/wgMdOiZyVrEsqFHMEWV+/kxo=; b=Qf
	/rVUWvNcIBiT8cZVqpUyPF9yIekH4wx7/6fjxK8krDqSr94B6TmmjtfrfBHE919K
	lP+8yC0Z5kWZbFcQ274JDpifN71Ga3PRdTlHGF5Hac/s/xOKqOkoHjb59ngNQ5FT
	dZQuaduLwV7kRjenV1219I+dngmWUSjkbb886rKCwLoDhkYu1WwH4lMB+YeIDSsG
	CCGIMVAOZ2B446FVOzed5IzpU09a1LgIS/QS5ytkoYIDKMzwCE5q+uvviVFRx8ZD
	axAWn+3+/QW08Ll9FmYFCjZsejPGphUZF1y7NC64N2KOpOHp6/fm5Wd3rryZTDN1
	Dipynm2TxdPWyP+YO6UQ==
From: David Engraf <david.engraf@sysgo.com>
To: tony.lindgren@linux.intel.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org
Cc: linux-kernel@vger.kernel.org,
	David Engraf <david.engraf@sysgo.com>
Subject: [PATCH v3] printk: Remove console options before decoding the name
Date: Thu, 24 Sep 2026 10:00:57 +0300
Message-ID: <20260924070153.250783-2-david.engraf@sysgo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <582e545e-52b3-4adf-9c93-446ad0fecc93@sysgo.com>
References: <582e545e-52b3-4adf-9c93-446ad0fecc93@sysgo.com>
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
string and refactor idx handling to clean up the code (thanks to Petr
Mladek).

Signed-off-by: David Engraf <david.engraf@sysgo.com>
---
 kernel/printk/printk.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 6d3d18a50da74..2cbb84effb619 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2646,24 +2646,25 @@ static int __init console_setup(char *str)
 	if (_braille_console_setup(&str, &brl_options))
 		return 1;
 
+	/*
+	 * Decode str into name, index and options. Start with options, since
+	 * it might also contain a ':' used for DEVNAME.
+	 */
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
@@ -2671,17 +2672,18 @@ static int __init console_setup(char *str)
 		strscpy(buf, "ttyS1");
 #endif
 
-	for (s = buf; *s; s++)
-		if ((ttyname && isdigit(*s)) || *s == ',')
-			break;
-
-	/* @idx will get defined when devname matches. */
-	if (devname)
-		idx = -1;
-	else
+	if (ttyname) {
+		/* Detect @idx in ttyname and remove it. */
+		for (s = ttyname; *s; s++) {
+			if (isdigit(*s))
+				break;
+		}
 		idx = simple_strtoul(s, NULL, 10);
-
-	*s = 0;
+		*s = 0;
+	} else {
+		/* @idx will get defined when devname matches. */
+		idx = -1;
+	}
 
 	__add_preferred_console(ttyname, idx, devname, options, brl_options, true);
 	return 1;
-- 
2.53.0


