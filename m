Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB203583AA1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202903; cv=none; b=KOG32gwKv2NtgEuzHScDjSGj6rSHTfQCNxiAqI76VotCHzjJrP5HQkjJkZcvW/g96h4pMmqlILz0mELpBJ57UcRxl5J8ftcxAYEgxvzD394LSPM0UjUTQYhN6glYgcWtfpqat5eeQo5/avRYTBh7LwgrzpbitSVbjz8tbnAILYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202903; c=relaxed/simple;
	bh=kcJmyR2ErJB3b2aUXQffOC1Yo8OFza9JdCBgcSweT8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cwPeKeRDRiGXORO8CL4zby3Gx7avqLQjI0UI+8hDm+puV4Ud0mirU0qoaujmhj3UbLv9v1Kamo8taXH4shW+L2V/tvq7RLvWyXs4MtjMkNNMn6rTvfhodruckrALF5ozn6q/fO2Xi5rS2yzcZVbLKJMJ7rb7bErOHjqqU4eYI2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfTBkFwq; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfTBkFwq"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46dae65dc5cso744245fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202898; x=1790807698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xNViDLZP/ndw6d10bbxAPq/kQLONZJvroL/iiRclils=;
        b=HfTBkFwqlxsh2gjM8+oO+HUYsgpHr+L8RIEvXMGQoDylzdUHNukSchpSIHsqLXVYp5
         9W2LC7dKTHuKsElfKDlIIdOs8KwGKY0emEaSiLB75sAy0T2tzmh/rfSDTyNaqY8bNart
         YC5mQill8F/8XLD+sJUsOvFhb/XNXlrb55gwKQ3Ff5yd76YhcSzc0FZsXA2YOPPGgVMF
         +HSprVmj6LNf8MhDjD+ynhlS2O+SynL4I/IKZk/tKCoHPRKUKx5tjBfXmSGaU5iQ2dHB
         YLsPF8C0zfNu/X4YSMLCC5mVBgqtxbraYZwMDg7K7eRxZYeM8eq1V6cY9frEF2IniOf+
         DwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202898; x=1790807698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xNViDLZP/ndw6d10bbxAPq/kQLONZJvroL/iiRclils=;
        b=ONceAe0JYRPt+KgX66e2g91rRRkxXcpe+Uqx4RQyno5LMAbgQJr6W3q/br9n+yGSyk
         edfvYZSAcPWPODWxRv6hS4rRCCYP7ol3XB7rrdoUakXaB12pLP2yD6iFv+10OlxCEaqW
         sEDpOml1PybuTAqv9tkEOrZNdyfIIf9VsGtxalIdZxPmrnZxR9dgDGN/8d5Gr+cxhHRr
         mTZ5Zt+LYtZk2JsaX4NMdTk45RQhkbuDih8+1RJC5cPN1ocWyTQaIGp2w/GOvAoJHjwf
         CwpHk8NW+xhX3wT5DY6OC43SOlY7fZQOITRaRS3UjcTtnvKEo0OnuKD+/DZkrD9fmAOK
         AFHw==
X-Gm-Message-State: AFuF++nN4wCOkwnPe8SwNlCKKf+G6HlvoNT8kanKdgDPPV938cg0xrzh
	k5WF+bGY7puDsecopxAVlm9g4XvjRVERDZDxymrka9JFurPs99r/dAYS
X-Gm-Gg: AYBFou1wNLPS1GTpyIFNTTHFVf+c7ZvVcIQVi7jbT+AUFK/6TU12eCcvgH3GZ0T+gCj
	dPUCSKU3+9YXmM8V02Ls4qzZO8twC/GNAcaWZ6AsUECqMleQNtpz13MOzqi0/E/nnEf4zQi64Ja
	48lvkPHxlqk833ZmMKpeHQrCG2eWVHX7VwP0J5t684w7z+XNPMWcxQZIq1jFNa9chR2iLFqnP8I
	ikm3ftDUga84Pa/JMmFEx/aKu3gBS/EX93OHa+91X6lEBU67wW0N1b382lcyzT1HbE5fCLd2mmF
	ZFW46PXqV7KilMU8VbaZ4kW2Lx38KHV9pMZKJCmXMbIO1LX/hfLCgKZQZa1wNa4M24q7ztRJZZU
	pYuaBkcZmD45aDCYPx6v5E3KH7jDMKGVYfSvuUCLyuf+URz1UbvNSCd4e9NFuCYE/hNo9H4SXfM
	UBBnhVqTR02oDI9D4mfVyP4spAQP7eGomNrdRxZJME8w8436krm74kSQVTTFE9dCLYITa4Y8sei
	uWLaG0z/2f/+SoIE+pf5gOiZBmoY2nGa35/FW8MAfEkEboJyXIHwspy+NCfYBrdg4v33eKT/hoP
	lH/EMK5uBHjvVjY5C9c=
X-Received: by 2002:a05:6870:80cc:b0:475:e2e9:4f4b with SMTP id 586e51a60fabf-491e83eeaf3mr672694fac.25.1790202898430;
        Wed, 23 Sep 2026 15:34:58 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-491ee1ac486sm559401fac.16.2026.09.23.15.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:34:57 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 23 Sep 2026 16:34:33 -0600
Subject: [PATCH v11 09/38] dyndbg: reword "class unknown," to
 "class:_UNKNOWN_"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dd-cmap-part2-clean-v11-9-9b6c217fdf2f@gmail.com>
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
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790202874; l=1375;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=kcJmyR2ErJB3b2aUXQffOC1Yo8OFza9JdCBgcSweT8E=;
 b=EbxJ8aNNn2N8JWyaS6BS7GNKrgNA37jjdazA0+2phkEkOMkVK1BeOeOwCsbS7bDOavlG0jg3E
 9f6ObqsU7WvBJArvz0Lx/Dn7IfQl791wTvtF+oh1MjjDRgkeEqKxwyh
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

When a dyndbg classname is unknown to a kernel module, the callsite is
un-addressable via >control queries, and therefore uncontrollable.

The control-file displays this condition as "class unknown, _id:N"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_ _id:N" to loudly announce the erroneous situation,
and to make it uniquely greppable.

NB: while this might be seen as a user-visible change, this shouldn't
disqualify the change:

a- it reports a classmap coding error condition, which should be
   detected in (or before) review.
b- SHOUTING the error makes it more visible, uniquely greppable.
c- the classmap feature is marked BROKEN for its only current user.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8682c23b5fe7..13a3d1a8c3ca 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1174,7 +1174,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 

-- 
2.55.0

