Received: from mail-oa2-f32.google.com (mail-oa2-f32.google.com [74.125.231.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AE059481F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202968; cv=none; b=H+4Wfb2uuPKc+o5/6IsdPu22KDOx9C8hTrJkVmAe6BW4VXnUZRW600Mj+3lUWhfVPRVW0MRNsMA9VgCzS3HwUgmqK8FZaUiNnb0D52zU+sJz26nmwJsKpvgFfOSN35PPr8X0xPBGwlkAn51cZ9GV69dZ/VLQWyd9NHeKEMISCt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202968; c=relaxed/simple;
	bh=dVCVMamiUaB96gu4NX1kujuPDVFnoxAGuPP2zSXDqA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJibMD/SOwT+vyXJuXQIgmkb4KSvt2mY8Sehf3NwHXxgzW23XG+c2U0+w6KM/0o3bSA2A/sV/eao8n050WNO/AXdrYHAhhhTWpkJxdW8UjDGtj/aMhTdEENzKNs0JGiGpEJ0CEbzcw+OWYybcmIDrv0bzyY8DzxrGfXnB+tWOb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=la/DfI6Q; arc=none smtp.client-ip=74.125.231.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="la/DfI6Q"
Received: by mail-oa2-f32.google.com with SMTP id 586e51a60fabf-46a63c34533so1397264fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202961; x=1790807761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=anf0fctja+VnMMprL/dVwONTSp+dELUQq5LW/V5rUuo=;
        b=la/DfI6QTd1+YOGuL+x1fIC7Dgmsg/bE2W10m+JNaRhlluQESJ62SUM2g8/ZtswlVS
         jbU9PrNEqmve437AfB11EyE3pDakQRMtUgE9aT5EXdgqh/d/4fxV5wEG87Y3MpMOjEEQ
         PbFemXLDbiAInawrxLg2QIrm7FrQH4+sC1IvsyhjQEGuNlQkAa18vcbhkIUg4CPEhhKg
         3yJigbhiOuv/OLpMPWkhZdJrkGkgRb5+t0dcH42LFr56OE10bW80kFaNjLlsB7B4L6ND
         llm+NTVRKe/nIfzE3J6GbdBprMjc64WrCQwznzfu5+9OqiakRmf9Ui8OqDjDHadvqWfO
         /5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202961; x=1790807761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anf0fctja+VnMMprL/dVwONTSp+dELUQq5LW/V5rUuo=;
        b=UGL5hbZ28g1M3a049Xm2jMZI5WboauitaynxK/Qb9e+pr5z2+n2Q3y+GqyyCINsBDT
         kPM2SpTc9OgOSCmxNaUnElNwVkrCxToaTsQiIkSaZtz+lTgaFioAtFI4ephlAsYSXiDJ
         oWeCB9xeHbcWzynyJXoPWJULiljFOnFKCbRJtuRYg1ZIPX4rRrraqCY78WlBnPCnr1NZ
         X3vA2zS0p9xYTzJd88/aqt7vXbM1aaskXYhDtHh4ebvkWthaXbYv1rHk9rKG4yBgVE25
         jgpVw/mykYUy0epkTltWSaKrGOqTs9X7pEathGTlxbQwFiQoU27gwqByGvKOTdfxZH5y
         GxpA==
X-Gm-Message-State: AFuF++n7ogXdYKdQmLWIixyd2QfnRXj+bwfhIa/SrH1mfboORUpoy9AF
	qmSaTN8As+/bUDd+KSQn03c8uXVFs7w6XSF/nQHe+b/6JixJg607aMei
X-Gm-Gg: AYBFou266/Uq+CPS1bMJi5Reaw1koPF4fSBTKOnWMGnDiai5YRMXVtlqquHxxhem+6V
	OuNcb3e4lVVQnV9Tx1RysvfdoCeFPaWCE8NxPdJnM6GdJ3AFyIXMJnBtvIkr6p/oS49yhy9PMDd
	G9p16Gy+UX9EBBrcrM9HdMFUk+MXLChJlGrYjvGqkCwJeGxp/EEomhPoR5LmljwSVrknyNrbI+W
	ePY3juS3pgxiWBiU237g1gG3KAn4r2VvnGBPDO6W9bs3xqhjV6g1kYQmiInixUxDJsSrpvrV0iI
	TXiqqiLsUtkkxYcysNBe4eNl4bEsr8Qa9PEuRH3FOPPpnHQOkymitr0a47ODN4JaaQc+aoiDiLV
	Ra0mfi7IpPGgcSFlzrmzrT9Ww9703pa2rjZFNhVtSVCVfvB0nNNIuyJyow2A1SRRrqQe5bqcAj1
	jGxBsTRNyQVXmvKJArCn9J7Tz1bG+vYSjEBRhoV6ycMmz1sjK0+MUFWghvuHs7wiVEG5A8/sjyg
	9VjIkga0krLhCQnEyY1qWepaSskkSiY8pdlLW8aTLjUpIVFnAKtrSvLfPOyG4aC0zKIZ9YNlQFb
	ZhzjKlEbWMjnySLv259F
X-Received: by 2002:a05:6870:3912:b0:491:2ed8:3505 with SMTP id 586e51a60fabf-491e2441c2dmr772232fac.0.1790202961310;
        Wed, 23 Sep 2026 15:36:01 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-491ee1ac486sm559401fac.16.2026.09.23.15.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:36:00 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 23 Sep 2026 16:35:00 -0600
Subject: [PATCH v11 36/38] dyndbg: add epilogue to dynamic_debug/control
 file
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dd-cmap-part2-clean-v11-36-9b6c217fdf2f@gmail.com>
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
In-Reply-To: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
To: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Jonathan Corbet <corbet@net.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790202874; l=2252;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=dVCVMamiUaB96gu4NX1kujuPDVFnoxAGuPP2zSXDqA4=;
 b=xv600zdesEVIz3KiAGz67sw1u76JqgY26LqYwDj3pdMjhveZMs8ss+XJ/RmWb/HveYQerfo24
 I624GaaLxTQDvfT/Qvyw8uAGdpUY3zCzVd1BxwZnYRc7XkVEOPjCSdX
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Add an epilogue to the control-file, to allow display of statistics
etc, without disturbing the header.

NB: epilogue lines should start with "#: " to distinguish them from
lines describing pr_debugs (and from the header line).  No new lines
are added here, only the place to do so.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v9:
. update ddebug_proc_start() to return EPILOGUE_TOKEN when seeking directly to epilogue.
---
 lib/dynamic_debug.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 098fd2639cb6..88440c1f6abb 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1186,6 +1186,9 @@ static struct _ddebug *ddebug_iter_next(struct ddebug_iter *iter)
  * read() call from userspace.  Takes the ddebug_lock and
  * seeks the seq_file's iterator to the given position.
  */
+static char ddebug_epilogue_token;
+#define EPILOGUE_TOKEN (&ddebug_epilogue_token)
+
 static void *ddebug_proc_start(struct seq_file *m, loff_t *pos)
 {
 	struct ddebug_iter *iter = m->private;
@@ -1201,7 +1204,9 @@ static void *ddebug_proc_start(struct seq_file *m, loff_t *pos)
 	dp = ddebug_iter_first(iter);
 	while (dp != NULL && --n > 0)
 		dp = ddebug_iter_next(iter);
-	return dp;
+	if (dp)
+		return dp;
+	return n <= 1 ? EPILOGUE_TOKEN : NULL;
 }
 
 /*
@@ -1214,12 +1219,20 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 	struct ddebug_iter *iter = m->private;
 	struct _ddebug *dp;
 
+	(*pos)++;
+
+	if (p == EPILOGUE_TOKEN)
+		return NULL;
+
 	if (p == SEQ_START_TOKEN)
 		dp = ddebug_iter_first(iter);
 	else
 		dp = ddebug_iter_next(iter);
-	++*pos;
-	return dp;
+
+	if (dp)
+		return dp;
+
+	return EPILOGUE_TOKEN;
 }
 
 static bool ddebug_class_map_in_range(const int class_id, const struct ddebug_class_map *map)
@@ -1271,6 +1284,10 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 			 "# filename:lineno [module]function flags format\n");
 		return 0;
 	}
+	if (p == EPILOGUE_TOKEN) {
+		/* use this soon */
+		return 0;
+	}
 
 	seq_printf(m, "%s:%u [%s]%s =%s \"",
 		   trim_prefix(dp->filename), dp->lineno,

-- 
2.55.0

