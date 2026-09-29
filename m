Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088A4391828
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683580; cv=none; b=PgDR8BwMSyyfAHQUx0KUVBgHFJWAUUYxpMwgXiDrHWJ+l6GQXziCEVNBVsmWrLH/IhNsEhVKoS/FOVH+7x3+DqQDNowvfk1Dxe7fiPpDIdjCNoyv5hbVRQwMEKQONmuLeFx9iK7iOC0bszlJraqUO/l+HlT9BURiOhKWtrKIK/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683580; c=relaxed/simple;
	bh=xKm9fjldgiXQhNEJ7zG1k/4FdOK91pIC+qqkwObq5iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBBZnm6nL0Vxyy/7hvS/zTz+buXX6WRtvQDXp5F25NA2tP+75DfeKFXrixK5AOam5hHeoouTu0rP2mMPMZbCgGnsYGFjxZBvi1SD5XFAPETSekxvsufSP6vB+oMbop9Odes7C5ubEL1rA10wyAmZqEUwPyYlBjvKNNVUIowjw5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PTvGHgdY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PTvGHgdY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so18314445e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683577; x=1791288377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5cmWcahySk7JAGrsu/VVLOak1y2/qz5CR0j03zP0L4=;
        b=PTvGHgdYmeieEN5zC2BKugvTiRIBXDHhOQvPiiEqH9HtW9sT2b7EmC/UhDM76fWA5q
         2E23YbZd37mAp+TdiMxEF+7FspgYo/3s8373COMYeRaxEu6CQlkjVjB9en3T30az+d8Y
         e1/ZdqAuPNjlUQWF7EM5fsiqg6lXUhs5u2J79q317Fqli9hOAsNOrPc/bYVFyGhuOlgd
         kqvp3tcH/OK3q4emm9kaF+J838kItGPk8hWyUa73XUZDJ2qGWGQTV/JaQETBM3fH00lS
         /zdMn7CyRXA7v52tFkaILrdG5nkqUtOM51q5CBkVdT1pSmdTZfaXJPEXekeqM4CsVL13
         1LPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683577; x=1791288377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5cmWcahySk7JAGrsu/VVLOak1y2/qz5CR0j03zP0L4=;
        b=YBKpdfNTHj5kqtqNdMaTPyw2EJ1GY+QQEHki7Y4ZxYJRD8jC2+vR/fac0CszWtRBkK
         tpfFAKgQ/swKmAX0P2FBAvXOZOfv2nO7keDlAagsT3I3DCkoh038bCmer4jrbK/yGb5T
         BALevQKrskNo1FwsTOlFY/isVoSA7VJuvFr8miwxOH+O+OsQ6tTf2EpTiquado1XfjeM
         d6xNmtDcICia1fx89Eh0+dTv/J5Qrpy9nreyaj3s+lmj/D2ggc/ML5qJitiril8qHxOU
         3pzB3s19DK6Qs3NJ10YI/Qs78KMU+T782JR7H3dJ/ezWQSCL9E0DqcbXgBnKMJDE8NnW
         +Fww==
X-Forwarded-Encrypted: i=1; AKwUvBzTnVb7ZoKHbFD63uv88lVoM/HPHnTZI8D1eNfsI1nRXtf/ixzz+5bm41A0ND2jeHfGzJIWPWMjPStKoSY=@vger.kernel.org
X-Gm-Message-State: AFuF++li85YboTFbZAiTfAfWgWYcBkkMW1D/wzY5CCUIdHE2CGSpqiQd
	NnaZxZ0TP6uzJ1ygyAL0SN6/o9sQV6+QvrMmtqqC8ak1pna82vusAS76FZlmXmpojjo=
X-Gm-Gg: AYBFou0PtqnpfMw/fnrAjtemcvn3iGQ658AQCcAWl1sft11YiAIpKDS68s27+iXN1SI
	L+eKuXvMfKl92RnM0uoYxUS/30Cu5C+sc0TBltSyJXKAfy5r8YEk7wo8zWhc9Y+a3umOggjwM28
	9NdS7/nkfA7xodUEBa9stjV9iO6k6D0OxqQWg8JKXR/E3MrVQd1DyM6BPY27L0W3kOiLzbqKtxg
	Mrbqc0SCrNfrvDmbIKx5CZaEuopuJISRJNvOgRNqD4A7tm/6EpXvF1PEJ6Dbxz8bY2WwIDsexlI
	qBTkkKHxDKrV/jhT/M649/IXnahJQviTaok/6ZGKaxI7bZ4qG7o61k0dDtCB2nLhczjvBuIeUI+
	5Pu93InSudTf1eBFkMzZ522B+EBHVx4WBvd2oKPikEuPmLQ3hpgFB49aeUUtSGvqIAYbeEjoI6a
	WDVzSNVh02Gz1xERWkL3i5cmJLuejkTgGc/2PHv/U1loGTrhAmOcTAQZ4nQ8tXwpaEr3gAG/J9t
	P3qJeg=
X-Received: by 2002:a05:600d:15a:20b0:49f:f963:7093 with SMTP id 5b1f17b1804b1-49ff9637122mr123036175e9.23.1790683576984;
        Tue, 29 Sep 2026 05:06:16 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d58054bsm44124735e9.3.2026.09.29.05.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:06:16 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v5 02/16] printk: Rename preferred_console to preferred_dev_console
Date: Tue, 29 Sep 2026 14:05:32 +0200
Message-ID: <20260929120546.328616-3-pmladek@suse.com>
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

The preferred_consoles[] array stores information about consoles requested
via the command line, SPCR, Device Tree, or platform-specific code.
Within this array, the 'preferred_console' variable tracks the specific
index that should be associated with /dev/console (typically the last
non-braille console defined).

The current name "preferred_console" is ambiguous and leads to confusion.
It does not clearly communicate why one console is "more preferred" than
others in the array. Furthermore, entries for Braille consoles can exist
within the preferred_consoles[] array, yet they are never associated with
/dev/console and do not receive standard printk() output. Consequently,
the 'preferred_console' index must skip these entries, which is not
immediately obvious from the name.

Rename the variable to 'preferred_dev_console' to explicitly clarify its
role in identifying which entry is linked to /dev/console.

No behavior change.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
Acked-by: Marcos Paulo de Souza <mpdesouza@suse.com>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/printk.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 2cff224cf1e2..8166828a9801 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -366,7 +366,7 @@ static int console_locked;
 
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
-static int preferred_console = -1;
+static int preferred_dev_console = -1;
 int console_set_on_cmdline;
 EXPORT_SYMBOL(console_set_on_cmdline);
 
@@ -2587,7 +2587,7 @@ static int __add_preferred_console(const char *name, const short idx,
 		if ((name && strcmp(pc->name, name) == 0 && pc->index == idx) ||
 		    (devname && strcmp(pc->devname, devname) == 0)) {
 			if (!brl_options)
-				preferred_console = i;
+				preferred_dev_console = i;
 			set_user_specified(pc, user_specified);
 			return 0;
 		}
@@ -2595,7 +2595,7 @@ static int __add_preferred_console(const char *name, const short idx,
 	if (i == MAX_PREFERRED_CONSOLES)
 		return -E2BIG;
 	if (!brl_options)
-		preferred_console = i;
+		preferred_dev_console = i;
 	if (name)
 		strscpy(pc->name, name);
 	if (devname)
@@ -3935,7 +3935,7 @@ static int try_enable_preferred_console(struct console *newcon,
 				return err;
 		}
 		newcon->flags |= CON_ENABLED;
-		if (i == preferred_console)
+		if (i == preferred_dev_console)
 			newcon->flags |= CON_CONSDEV;
 		return 0;
 	}
@@ -4108,7 +4108,7 @@ void register_console(struct console *newcon)
 	 * Note that a console with tty binding will have CON_CONSDEV
 	 * flag set and will be first in the list.
 	 */
-	if (preferred_console < 0) {
+	if (preferred_dev_console < 0) {
 		if (hlist_empty(&console_list) || !console_first()->device ||
 		    console_first()->flags & CON_BOOT) {
 			try_enable_default_console(newcon);
-- 
2.55.0

