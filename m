Received: from mail.sysgo.com (mail.sysgo.com [159.69.174.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2676642E420
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.174.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789625418; cv=none; b=D48MVxTeWcjA3JHcDhnP4P0hjsijp7mlLJVEVNRBITMnBJGB4LvOHKruBkDSotKHqAq9rI80bU8lsMxgwRA8jSn6f2bjbC/76/z2ikep9UAPgmFftXDUF/6XH83DAzd/Gpb6fVSmmvFPfV8argzo364LJATTy9UG5LyGgRXrTKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789625418; c=relaxed/simple;
	bh=tEe8VhuIDRYurQfwQULHc5R++9tcpdIgtliXEwgG7zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sCs7DXYGmxJBU2wCI+aYursS+XQuGEbuw+C6shQVHxHTBmCm+l94GNicThtbkb5yMTBDYAbvQiczD1SbpX8WnnyDGQ6+PcUDNESqHFQUxg6IsGqQkoCKBq1jv9MLMPE9+rgeUcT8iX1KSdADpmWUmulUrHaCrcnO+rZmxyeXCC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sysgo.com; spf=pass smtp.mailfrom=sysgo.com; dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b=eu7UqjnU; arc=none smtp.client-ip=159.69.174.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sysgo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sysgo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b="eu7UqjnU"
Received: from mailgw.sysgo.com (localhost.localdomain [127.0.0.1])
	by mail.sysgo.com (Proxmox) with ESMTP id F327681261;
	Thu, 17 Sep 2026 08:10:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sysgo.com; h=cc
	:cc:content-transfer-encoding:date:from:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=k1; bh=6Et2e9q6C/dWbtJIaiQPhLFYUPp6kfdujOgPQDjcPNc=; b=eu
	7UqjnUWmIo2FJaaxKQAKlePe80DtQY22tVcJ7x/GnB9CLr49txGyXLyfVwJMcHnD
	lvjOkn6X4mMJooErYzZIhO4Hm976cGowDz+buuR9aMEiPw/sywIDNARlQyNV0auF
	FxPzEmIQmzEXolal7GGZxk3gan2yJX13gIh0v9ut0bEaMvsr4q1POwDXSiuXD2qd
	xXIRxTtSmDYsSZchA6xjUDdIjUq974taZf3O065nEailcFo8EHCWzeBZoIeXCo8l
	shEbz5298Rctpqkv1XDc5o06GuBU5wgmWE3QkRFgUI8eeQR4zu0LgHvVqGHpI9YU
	3tMOSBkSyaIbdyF0Q1iA==
From: David Engraf <david.engraf@sysgo.com>
To: tony.lindgren@linux.intel.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org
Cc: linux-kernel@vger.kernel.org,
	David Engraf <david.engraf@sysgo.com>
Subject: [PATCH v2] printk: Remove console options before decoding the name
Date: Thu, 17 Sep 2026 09:05:51 +0300
Message-ID: <20260917060754.37315-3-david.engraf@sysgo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <05107b0b-394d-4023-bbd5-8efef73f5542@sysgo.com>
References: <05107b0b-394d-4023-bbd5-8efef73f5542@sysgo.com>
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
 kernel/printk/printk.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 6d3d18a50da74..f4803fe05a0aa 100644
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
-- 
2.53.0


