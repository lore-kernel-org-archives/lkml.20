Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985646;
	b=Xi748+/l0EJnFt2tS3IIBDZ1POpLUYNnr8jHmJlkX8MZcba0k4ZpCT3j/09zUx7PR7N6
	 hylZ66M8HQYlc1esXFgMvLB9yLTEptn1Igifu4BXb4A8C4qgXjdGq7N7qNG6PvuBNWVnb
	 76tji4WgVlxlHOu353Zms0/lC1NjCIHFwwWYDO9SVhMMOIyiNyNZ5Cai7kEitmtKCJF+8
	 Y6F9eoXq4KKUQnMDqYt3HZF4smJ1PdFluGB5ir/jxFtqVHOk4q88r3g8IXTSkvagD7rcd
	 h6AJjpHNxinf33tVdkamE5q2kn3Dtxz+FHqyewsdSY754ObDXRPckApy8yQb0MAbYwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BHUfJ6dqmb8muzXfUhszYtRCrN8OOAsy6Pak1yYwLow=;
	b=WBy9ZR3oT1Q5QET3VoT7iVrIZkf9nJwHniEdoI0wkxEVwuF5MNwHlFqVLh4SfogParZq
	 9kb01Hca9Q1fO3e6epF6BzE1aPyUwW7odt6G+ZiwwfYP/3XYBfm6BFilH6h8EA7dkEwjB
	 obHPSb32gZL6+7h6ITdftozcuMdyXspYxQyv6CEC2tDF8fd9FDtRZXJCyzg7xl3tonOYC
	 3Q7zl94CQuUiKzbg7CHvNGUb3LwDTxiNGkM7STCKHe3FwNB+WWu3QgJyj/QOUhritNSu5
	 TQQW088TrgyU0+1i8HbRgxu7ERxBOLmSkv1LIwvlgougZyIutdDtUSCmc/DGr9HccMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FDdXO7hK;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14276606A336
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14276606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FDdXO7hK
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so8656045e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985643; x=1794590443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHUfJ6dqmb8muzXfUhszYtRCrN8OOAsy6Pak1yYwLow=;
        b=FDdXO7hKERRqxXDbXGi4PAIwGhx3D63K2D3Yt5PuLmMNTyNSyj8KQ/Df9XybZiidrV
         nX9u63QjxP9FXO/L73qD2kY7jLG0W1MlJIiSR7BX3sPaimdhbB6ZO/iCmtR3N18df/WT
         RF/QvHiCDluqmQQD+pTum9rNTCAhrol3yWxbOj0/5wbo0ME1dLO/pGzN/+/S/FfTkZUw
         PPExQV+LheB2ep34TnyevSk2fSX87WKcoBL3ezAOKtC9x/1QucIfaQq/G+IZNrjtlXRU
         AUig6CL1Xg86vHxorPKDGRX2jwWJHqDvmqzp+oJSg2mHeF+GdqxN0fCa1RXZpRE9ns1R
         gmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985643; x=1794590443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHUfJ6dqmb8muzXfUhszYtRCrN8OOAsy6Pak1yYwLow=;
        b=Od/scr6dnTvtaiF5F2JUDwS+4INrYlsLq4q3eI8LSQChSduIbbPdepshNjbktJXnAZ
         cRxsSwMk37qImzdHUVY+ESy2TdfW0riF3xdV0HQOkL4TKDejYedc4MpTGo3Jc2alhes/
         5T9wsYaZJ3YxaIVBo5sS+/54UJFq5MWqP6ys7Zsye+oNH7yCQQKC1iYd04nTX4FOGUkB
         Pu5MZqelVxFtd/NQO/T05B52og0+pKNSXvga9h+FwUBOflFxmrnhgcGy3VdBxxnoKFhf
         I/FJolbM64lk0j6ZWxXtLIqLQJViVneyTJrgZBbYX9LP3m11NGkmO+0ulm2Qw5vY6/5O
         VPZg==
X-Forwarded-Encrypted: i=1; AKwUvBw1roPicpIB9nnsGfd4k3AU9M4G1WZd5B17aFxQeANmamULwQgxoV71CkEy+IK2Z7fqdff+aX6jo4PZBms=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oAscQ9tZe3UZDweJls22xyPNg7VzdJL/nDmm/xOpa+GY+mgwl
	ldPNHxPOv4ORaZvMQdLmfEk2x8ThNsuWkPSOyuj8n6h43AJWZeFUNsBI27kvu0iM4og=
X-Gm-Gg: AYBFou1+pSNsCUv6pCugfrDSHyeYcQalYIGpVSK67ZPm83FE62p5jgT47PzAaqJDX2q
	iFyC1pgENZaztmpirzSw5CmvJ0Oi2d4R8+8omCF7CmdRFpN05YSwNJrdiHNwehF+7Iy4lzx2CBu
	yi+Egtt3tpDARGbOqFfxcNy23CB84jLPG9JgpT8IWXxcxuAWVYorGzoCCUZNIKxhSE+81aEFxB1
	QXQT/IaUoMf/8ptCUHJNhX6wnwYYAvPlFB/cQIoFWiJsSgoMdyLdqK9qF3LriVFf6GJitHBiuAP
	Q32Azu8UzU9WoDIa3tZKKfizi5oGaj+b8rwHMwEDLDo78TkXfq7SpUSYrRe4zJDef38PUkoZGLb
	abhX3u9ncQEY+N8Palca+8agwV323vXDt2MWGnPV1wJCYA38vGy2z1FY6I9WFDCcTpPWJLQv26H
	tvaICSgVrdqCwSIUcGmqVDQltT3MpYZgviFr611DaDr6REccP/vE2vp6h25r5eP1yBY1H7AE/aS
	lrhH0eJbjndG2UOQBp/t/UCbFO/+MskrykiWCOaNv2womyRIL3zCYLpXcy+6ORUEfb3ZVrDGt5T
	MO3RL+qX6fzx1B1mOyKBH3hskJ+zt+g=
X-Received: by 2002:a05:600c:19c6:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4b6e091ed94mr52650985e9.17.1793985643472;
        Fri, 06 Nov 2026 09:20:43 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b573366ea6sm159116615e9.14.2026.11.06.09.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:20:43 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v6 02/16] printk: Rename preferred_console to preferred_dev_console
Date: Fri,  6 Nov 2026 18:19:38 +0100
Message-ID: <20261106171952.207909-3-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106171952.207909-1-pmladek@suse.com>
References: <20261106171952.207909-1-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
index b8d62fec2569..435c1b7148f1 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -365,7 +365,7 @@ static int console_locked;
 #define MAX_PREFERRED_CONSOLES 8
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
-static int preferred_console = -1;
+static int preferred_dev_console = -1;
 int console_set_on_cmdline;
 EXPORT_SYMBOL(console_set_on_cmdline);
 
@@ -2586,7 +2586,7 @@ static int __add_preferred_console(const char *name, const short idx,
 		if ((name && strcmp(pc->name, name) == 0 && pc->index == idx) ||
 		    (devname && strcmp(pc->devname, devname) == 0)) {
 			if (!brl_options)
-				preferred_console = i;
+				preferred_dev_console = i;
 			set_user_specified(pc, user_specified);
 			return 0;
 		}
@@ -2594,7 +2594,7 @@ static int __add_preferred_console(const char *name, const short idx,
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
2.56.0

