Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361EF19B5B1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787812389; cv=none; b=UPq5tZcVMa2811dxuBCtxB77cYR5Sm2rc5Wec7FbFZZOtMm0Zim6gJfBUE5xgjYTMPvU8HEsY8kp5MDuWPLPJ+DYAqRiYEPnJwwthQDPBesHyLn0GgR0963b2iB5NHlxxMEV9Lg/IrCe09rsjoC1nwkMLL1N/L1rUq3sB4cGYQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787812389; c=relaxed/simple;
	bh=4x9vi7toy/IUYELOmeuC8loVNN+kA4zytxalEGSZT9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s2J3iPkBsK80ovGUM3rAsr6tcKnkzIfQ7u6+Ghl79POL/qPCwTanKaNQ1l1d2dTr1IUZAgpykicDnxGHJj4GQVXNGjpTzDTdBcHqTM4ssF59H4VBf9iUezFJG5REgr9zoUHRPhBsAU3S971pSFr34knbdBQ/qHtJiIZwbpV8SDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=WbyqNHoQ; arc=none smtp.client-ip=111.22.67.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="WbyqNHoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=WbyqNHoQHS8pv5wx6OEnhvISlvb1qlDbTQ2TbLmIjrEjCDyhVgbdI/AZs6qW5CWQek43+SaC3HHJ/
	 ImPSPeRCipGcOV9C2nowDpWgTgwAH62XYAegKToQcc2onu8v/t417aY3g54banSeFF4oFMJ/IgK9iE
	 6MpxZGWzqcvBHSpw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26a8fd95f6d4-ac192;
	Thu, 27 Aug 2026 14:29:51 +0800 (CST)
X-RM-TRANSID:2ee26a8fd95f6d4-ac192
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181454368174 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16a8fd95cce2-1ea5c;
	Thu, 27 Aug 2026 14:29:51 +0800 (CST)
X-RM-TRANSID:2ee16a8fd95cce2-1ea5c
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: rostedt@goodmis.org
Cc: pyudistira519@gmail.com,
	sam.moelius@trailofbits.com,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] samples: ftrace: Fix wrong parameter names in MODULE_PARM_DESC()
Date: Thu, 27 Aug 2026 14:29:43 +0800
Message-ID: <20260827062944.3329-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

The MODULE_PARM_DESC() for assist_recursion and assist_rcu both
reference a non-existent parameter "assist_reursion", which is a
misspelling of "assist_recursion" and entirely the wrong name for
the assist_rcu parameter. Correct them to match the module_param()
declarations.

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 samples/ftrace/ftrace-ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/ftrace/ftrace-ops.c b/samples/ftrace/ftrace-ops.c
index 8cae38d8b879..5ca621149687 100644
--- a/samples/ftrace/ftrace-ops.c
+++ b/samples/ftrace/ftrace-ops.c
@@ -44,11 +44,11 @@ MODULE_PARM_DESC(save_regs, "Register ops with FTRACE_OPS_FL_SAVE_REGS (save all
 
 static bool assist_recursion;
 module_param(assist_recursion, bool, 0);
-MODULE_PARM_DESC(assist_reursion, "Register ops with FTRACE_OPS_FL_RECURSION");
+MODULE_PARM_DESC(assist_recursion, "Register ops with FTRACE_OPS_FL_RECURSION");
 
 static bool assist_rcu;
 module_param(assist_rcu, bool, 0);
-MODULE_PARM_DESC(assist_reursion, "Register ops with FTRACE_OPS_FL_RCU");
+MODULE_PARM_DESC(assist_rcu, "Register ops with FTRACE_OPS_FL_RCU");
 
 /*
  * By default, a trivial tracer is used which immediately returns to mimimize
-- 
2.33.0



