Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985798;
	b=AuKNkrwlbPlSs4/c9aU8qwy1maIYt4Om3eRw84C0fT1keDfFKcdU5+OU1X5QU1XnsXTC
	 MYGx5qOvefQu4GkfL1A/GtsZ9f1a1c34gncCZ3XeGyHH4m4/Rk9HnMJpZBZgmBgGeNUmm
	 KGDyT5yysSF/bbL6V1+ji5GnpqAKBjdbFC577XA/0jfUsq3SXf09yltITUB3OHGXmX5kD
	 grh/5/5Oz0wJhBs+xOCZtJCIj0wEGakdO7YeBRJc0w6Lc6SGCasf3WwWHbI5dEH8okUnf
	 zxMYnwjT7KfOCqFLBmgknO5R7uYjuMqK+pVTyxUyTrAGNSV6Xun9xCBNCykl2RyFt1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c5qXSU2oB7uYG0IjKESIyBPZauPIOpMrL+/5vCyIXq8=;
	b=xIBiGm8NvXT2Ve38f2cxwM9My/dG1tswQDzbQVhSo5AeStmo/3eC6YaFKUk1NRS4iYxa
	 Y6J/VUyM4qmJOJH3lyMvyT0F0jupQohNuB92e/9tutB6bRyMGDrvvv/j/LOLJYmeKnUsB
	 820JPnlmtNwkgJbTLFBihSt73Lwx2AKx1gH4ncT/qL/tdgHTDU8D7u2Lo639MiY5YvydE
	 9bTMr/flpKyVWtcv1dQXn9/YlYDeZSoMWw+8ejk4iyVEwR/jUHCHNr2aGg0xTnJPkUAeG
	 YxCO7qqeHlh/8lZIVwQhvaVDWnXpE6HqXOCN+KNrmj/GpQ7vorDL475Co/5dprroWew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="GsJ/S9XI";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99159606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99159606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GsJ/S9XI
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so7887585e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985796; x=1794590596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5qXSU2oB7uYG0IjKESIyBPZauPIOpMrL+/5vCyIXq8=;
        b=GsJ/S9XIFRwxp1uO+VDr06d9rSG4qmkThclRMYewXOpAvjxTWhxZuQHDZC5BU77PP/
         7FSh5OwBs3nLNxJIXftDhzTfxsTiBfgJ6/RoeVojPqWwi0FQfvcxndlLR2/v88ThDVSd
         QBN8uICmPE8WFklazTSszJRkB1a3vaomKnyWe0KU0Y/X+Gl7ftO1/I5LkBFaFSwaaPSO
         Sl6RmDatRytKUNwXzHBh0CvK6upBKDh0nR2VxsNBpqv9ghfLCoBZvHxg6MMJ0pL348ns
         LfU9N9jxA0nlXqtPU/cCnXAnBEfQMnwm9R+9jZyDjIq5waFhDugMTwO0SxkYR2i5dgcR
         A/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985796; x=1794590596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5qXSU2oB7uYG0IjKESIyBPZauPIOpMrL+/5vCyIXq8=;
        b=oQOQqgkObqK6Gd54WkcTce12+CaRjsLKsJ4cnUwYPBukh9Ao7iNssreArWBD/SVURv
         LYjkP59IPAh8KlvE9gKHFZa6NjW3SqiVWFz4HCfD4mgZEB0+6oZ6mXFNJvo9V/du4v5Y
         ZCkx2UENJC3cFA0v61rNIiS4P5joRKRvAXNlBx+EYboPEtIKrPZswCBmpJ8qrt7T4cfr
         ZCywFvYZLBSKpdrwZh0Yu05DzjZ3lKZbjUpvAfk4PcQmLAL7FFxk9VFfBq4BU2ESjDwB
         j96uz0Y1RrlRnGJ2LXkfPwnzVGYTeVNelVfWqR3o1piyFK2qeLWA+YVHFSWFFaHte2Wh
         goNA==
X-Forwarded-Encrypted: i=1; AKwUvBz7Zqw2W+x5qHPXnepueX+zdjzT9zeuWKYAEeaUpP3e/2zJ1wlu/evQPupy1i9NSx4ZCs2i4DT6ceMxdwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GpR6OJVvYS//TSIkYfvf6VcHYihaegsSYYS6BksfcNMZ1NLfh
	3tZkDfb1rYdi9mvM7RLfFNNYuh91F/jAokc6g+mDdG2cqE3uDAVkGTpBZq8gOwkGHmU=
X-Gm-Gg: AYBFou0my6GhibEoYtbFAeqqT35bMSv48HcbBFWvKJP8WhAyc2MBADcRoF2boxy5cCa
	dTX6xwS/58MAHdjK2G04hUII+NPsqlwGMt8GNBukoaSfTgZWLqn89V17hXAhTJW/3Al7eA9du9k
	lC5zk/QU53ielbkRHnvEKBVsgOiHAtWCVxCIMrvaiMy0o35IU8RyNJMAmH75wzo1vVU3gcsMKvt
	Ko/Afsoixw4CayoU9Sq3/5UBOSZvCq4rKx9QGy/6gochumZ4VbSotJQ7ieWolkwYLGraXX/KrrE
	g2S9z+msRN8GhnkW8D1sAKHT439MOjcpOtC0eFT7Rm7VnTCrR+a/l+FyAGKABD6+MjvanGGG5Gf
	THw5G/N1yEywTor8gHiWrf+4eocZYUpETKJjPHNNavxx0N/rc7AOawKeGbg/WgxLogFBKDFvIWi
	9pIq2DLQ8qt+TTnlAc0vwnuWAn5sGSsFpYMdcaW8f4odXIYKeVQLgccsqESa6NsWoAMCU8fsgHc
	1zca1IihhQtT0YeGpJg3/2g/l08yaZQsxse+exgF3aryAHb4fqM6rKuf2kb4ZfyoCFRBPRTA9/5
	9H9BI2g8gbwsJ3QmM8xT7n0CB+hqGnh/
X-Received: by 2002:a05:600c:4583:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4b6df4f2484mr55519915e9.15.1793985796065;
        Fri, 06 Nov 2026 09:23:16 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e28cce1fsm87009245e9.15.2026.11.06.09.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:23:15 -0800 (PST)
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
Subject: [PATCH v6 15/16] printk: Modify try_enable_default_console() to return error/success
Date: Fri,  6 Nov 2026 18:19:51 +0100
Message-ID: <20261106171952.207909-16-pmladek@suse.com>
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

Currently, try_enable_default_console() has a void return type, and
its potential failures (specifically when console_call_setup() fails)
are ignored by its caller, try_enable_console().

Modify try_enable_default_console() to return error/success, and update
try_enable_console() to capture and propagate this error.

With this change, try_enable_console() will no longer return success
for a pre-enabled console if try_enable_default_console() failed (such
as when newcon->setup() fails). While this might change existing behavior,
it is the correct approach to ensure setup errors are not silently ignored
or treated as successful registrations simply because the console was
marked pre-enabled.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5ec34dc2d168..cbbb9aed3e61 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4072,18 +4072,23 @@ static int try_enable_braille_console(struct console *newcon)
 }
 
 /* Try to enable the console unconditionally */
-static void try_enable_default_console(struct console *newcon)
+static int try_enable_default_console(struct console *newcon)
 {
+	int err;
+
 	if (newcon->index < 0)
 		newcon->index = 0;
 
-	if (console_call_setup(newcon, NULL) != 0)
-		return;
+	err = console_call_setup(newcon, NULL);
+	if (err)
+		return err;
 
 	newcon->flags |= CON_ENABLED;
 
 	if (newcon->device)
 		newcon->flags |= CON_CONSDEV;
+
+	return 0;
 }
 
 #define console_first()				\
@@ -4126,7 +4131,9 @@ static int try_enable_console(struct console *newcon)
 	if (list_empty(&preferred_dev_console)) {
 		if (hlist_empty(&console_list) || !console_first()->device ||
 		    console_first()->flags & CON_BOOT) {
-			try_enable_default_console(newcon);
+			err = try_enable_default_console(newcon);
+			if (err != -ENOENT)
+				return err;
 		}
 	}
 
-- 
2.56.0

