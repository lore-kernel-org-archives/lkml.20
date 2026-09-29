Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C6A503904
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683627; cv=none; b=JiFZi5ugJJZahetU642idrkHbVLbQSwzapOG7Pct/hZvq5SuMgRtGIwdvNO3zpmIqG82rEKIoENC+gW752se3gQwjemvJJ/Ap87JMhX7gXnY88zf5J/3bA0j61VjAhhe30iVHinCbr7VFo7Zwi40SnRQXCUTpnXkk5n+15oUHAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683627; c=relaxed/simple;
	bh=Ell6cK/gUkDcXbvwB+agFIDjyUwZiEU/1OpNq7GBsIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bg3Yth25Mq9DRrbZgf/OQP2hRU+nmhIFoOZHkf8QuH2CxmWfKHTooZJZC9MtOggLsUw98FcOLqCi47DMAlk1FP8g89MpEuZp0wVVQ8thUVRxKCrtxh7boUK5V3Ls5ik6L/zfkWrX93eDaPRU/fIsNcSK0avdOxyyWFAobVrJxBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ATYxiIRL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ATYxiIRL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso24854065e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683624; x=1791288424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1H//wS5mTvvTRnwWl0tjhy8Vxoqjw8WkQSI1UbgRCw=;
        b=ATYxiIRLCLYB0RsAsWMCvYj1O/fJE85ue+kJQfSDll1yyjB4X6pMUytVyVGhbkoAj5
         XYRPQZd2Ctc5lh1owDHGGsHqnZFwyoN8ngbJX1gIRtV4a6BdCSw19BBxF06cWEUjCKuo
         7Y4OMs2LpcfCHrA6r17kpd7F7QInJAeTpcQ8/Vef8BQkGgNczILEl97i6i3uXq63MISc
         MKMr2EqK6+GNPNeTsupReRStZVtd3SyXnjlbWl2Tzz/Q+pSjp9GmKC5tqLlZySEg5kOo
         38BmQcFpUCdTl6UpN9G/R68+0GMLNFvMiVTX9d7Usnt6BMM/Z/rvW5GhrYHXLKPicMnP
         bVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683624; x=1791288424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1H//wS5mTvvTRnwWl0tjhy8Vxoqjw8WkQSI1UbgRCw=;
        b=rW0XzexASq7uJNRQsFYbLmk7NLYpAVbZxUIZsoCyZ5D6d7nrsMoyyreJMmNtMBp3HU
         jdJnA0UGdVnCxDrIuzfXvynojr9Qv+NlDO+0DUOxBGblaEK/AOz9gyBcLREHwotqD0h1
         rjxihQUr9sLXnc+AKdW9i9gjTEp2Nv4+YeWZlYD1NS9N5lMWhMOmoUysVwdz3kMWjqpr
         Kx6bxhVaLSI/R1EaCt3t0SGN4Vckpjg+JftMIDpaDveHvvwUpPiS5PYmHnV85GmCLhqw
         Er5UXA5ozRbwe9A/hffeIdO1rv6jXj/X5VJGRDKHblqM3qrIw1aizaxtzJnCDH0O/23l
         7AMQ==
X-Forwarded-Encrypted: i=1; AKwUvByJTgwvyW9hk7TdfOZCLMPnaTkeHCFsXiLPLflUSzvOuuT5Y03kcFpYNWetS3FWaYyz1Hl5EMxfoD/fKT0=@vger.kernel.org
X-Gm-Message-State: AFuF++ls6Z9z/8iH7LFBEQtGciSOGnvlv5yxzJb29GHP3dnL4x2zsDBh
	BMmMOkltWi7Y4uXtuzfsRp5SG2zd2XIEG2ZsU+8rsG8a9dKDcFGo+oPRarIHYYyt5MM=
X-Gm-Gg: AYBFou059psUPCmt5P9UyeMC+uIdzsgTgdKIc0+xh4ot+vmh5T6K1CCBEBX9gHEaMVW
	Vphm9djtS25h9TkmiNy7OztkzFWybM960+WV3KF1jLRboIcxefBIONoDw+22YNyKjkMrnyOAddr
	QyPEIzpDly57D4T12WX+fLrP83n9Qmw+05KFfKh4zsvuLoY9Nsr1XXrd9DiKcG3J2WEXOxHRXpj
	1cTcjVBH/qqK7W46a4+Yl5DV9y8NjXvy3p8wxAzWou+qjQyTQBcalMLASU1dhM2jGYK9QadyBJ4
	TlrC0OR2LxPMJwwbApqm9jNLtCAVQ/GG5cUNb286MWlmNW2cAr64kfFIu0q7yXfsibRa4ePPNnA
	8RbyCrJ4M8KuA+Jf9P0Ik6ng00ZRImr79d94swH5oAjJkIgWe7BgXS23//lXAC7i1nLW07qqDlF
	eRdQJZunO5xNoeyS34fTLOJp4udz6Lc48kkB+qu7wqQWGUZKOaEKUrX5ZKVsthivt84H9g7mQT0
	bbfqKk=
X-Received: by 2002:a05:600c:c114:b0:49f:fe79:62f1 with SMTP id 5b1f17b1804b1-49ffe79648fmr131704145e9.27.1790683624185;
        Tue, 29 Sep 2026 05:07:04 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfecb39sm80006735e9.7.2026.09.29.05.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:07:03 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v5 06/16] printk: Check that index is not defined when a console is preferred via devname
Date: Tue, 29 Sep 2026 14:05:36 +0200
Message-ID: <20260929120546.328616-7-pmladek@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929120546.328616-1-pmladek@suse.com>
References: <20260929120546.328616-1-pmladek@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current code makes sure that a valid index is defined when a console
is preferred via a name.

On the contrary, the index must not be defined when the console is
defined via a devname. The index will be defined later when the device
matches and gets registered.

Enforce the 2nd rule. Make the checks symmetric in the code.
Do not ignore the errors quietly.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 0199c918ef03..b8c348e305eb 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2559,7 +2559,7 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  * it updates some global variables which are used to make the right decisions
  * in register_console(). Finally, it enforces some rules:
  *
- *   1. Either @name OR @devname are allowed. [*]
+ *   1. Either @name and valid @idx OR @devname and @idx=-1 are allowed.
  *
  *  [*] A valid @name and @idx will get assigned for a devname later when
  *	@devname matches during the device initialization, see
@@ -2581,15 +2581,6 @@ static int add_or_update_preferred_console(unsigned int i,
 	if (!name && !devname)
 		return -EINVAL;
 
-	/*
-	 * We use a signed short index for struct console for device drivers to
-	 * indicate a not yet assigned index or port. However, a negative index
-	 * value is not valid when the console name and index are defined on
-	 * the command line.
-	 */
-	if (name && idx < 0)
-		return -EINVAL;
-
 	if (!pc->name[0] && !pc->devname[0])
 		is_new_entry = true;
 
@@ -2603,12 +2594,24 @@ static int add_or_update_preferred_console(unsigned int i,
 			       devname, name);
 			return -EINVAL;
 		}
+		if (idx != -1) {
+			pr_err("Adding a preferred console devname with a hard-coded index: %s, %d\n",
+			       devname, idx);
+			return -EINVAL;
+		}
 
 		strscpy(pc->devname, devname);
 		pc->index = idx;
 	}
 
 	if (is_new_entry && name) {
+		/* A console name must be defined with a valid index. */
+		if (idx < 0) {
+			pr_err("Adding a preferred console with an invalid index: %s, %d\n",
+			       name, idx);
+			return -EINVAL;
+		}
+
 		strscpy(pc->name, name);
 		pc->index = idx;
 	}
-- 
2.55.0

