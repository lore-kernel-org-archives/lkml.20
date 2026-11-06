Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985751;
	b=QJdLDQWeFnBcdNXYnaj0UDsjHMbMIKReA6swMUQGdOo3DtTssXZO9jZoNgQAUMoGq4Zr
	 gDy67TWT2mS8toSpVy9ZwbKK2autZ8nxqDaZ53g7lowqjDgG7GU/T1A8D3jSMiXSYUAkv
	 3uB4z0KYEj9zJGx+hKRDnWdiqxYGdC5PShjrBSXGa6/j7zMwLbqZe1zZfHvdcGxTxb1Q6
	 33qqujfUJ8h/FXZgbvs/E0xoOnFE/SyEJs+qkmidIF4s+ta20cLZ7q3ucN4qnm8ZDehKg
	 YhO+EEwv8L2C3Y6eHrjyTripR7eyuZWd5936T1dNa3kk/NOA0JBt/mEQk7qbqkLWOHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1ZlRTZyG90aBhHc3pJWw9EK0xkQ7hrbVzYow7IEo9Co=;
	b=Ia/1qeDZP4I8WPNliSVhqAzFVACK7/BLgo8Ihi7KMQjnyVncKvtZ+55kt14/nYLmRp9R
	 2VB9+6pxu7FNdO3laR6KJnMnCHRnhgD8i1coiGjFVAJYppTX+gJ1K+hNHk4LUjtGkcV1W
	 YUFEuVVWvOoXINYLp60iO/5sOsOPy2YRC6dOLJJmihNCNTA/NcvzkarBpJULN9hxJW6mA
	 UiXS5X84fOHXFHtrtTnhspv4QAbnQ+JJG1AbfxjstS/y/S2CbnF4FYAf3GGkS8n2NJg4R
	 zeoqw4n5jk/9eKsZOJxNKEO+xPnINRAHJLBnhjlF7DhoijWAzhlLuGAgNyD1SHq9ixA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dgqURb8n;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBB1606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BBB1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dgqURb8n
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so7979525e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985750; x=1794590550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ZlRTZyG90aBhHc3pJWw9EK0xkQ7hrbVzYow7IEo9Co=;
        b=dgqURb8noDcgBN0NbkG5f5uzjgxbcI+WsFO+6UvQtcXRXR8a8PrXVTJUNKZpynWXsd
         XELL9rJx0jtGsha/sUUjiMH+iEa/2mWhq0UQQhAsd8zquMSFU6byntxNBt58o0CdAnyc
         An9dY15lEaC83CDXJMYPf+3TLpg55MLnmteaxHgY44/+oiRg2bd3dQ00iYVo+8+8jIpf
         A7YeXOVy6CahBZJhGKNc5GgTRz6cUdMnIB//ApuZfeg/is5ZGdNwu02hHX12RpCDW5/x
         yNRlXMnB8eSMszZRTO/Friqb6oKGarfmiJC70bSiT7jUGpbYrHJHpRUeMWYDwfwFOD3j
         d8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985750; x=1794590550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ZlRTZyG90aBhHc3pJWw9EK0xkQ7hrbVzYow7IEo9Co=;
        b=GpvOh0BRea3agmaus7ArlmaDHdkHjI1YE949mAj25ujO60/TObz2I33akEYhJyL2qG
         v60xakKH1fb090227iHW8g3P8wyHSZL1a5B46pmTH37WEuE9Xkj3HUeBOn99n09MCQDt
         GFtFYmhnA6vZmHVnz4c/6BktU0O6unyhD+OJC6WmDgr1aPEfpQNbiXVoz3FNnUIwQcJ+
         i+zDiBz9QZgjTljLKVTg7xPqib+GKnAg/Xtuwmzts3sWL0bSymRoF5WIRZhS5jZNUiU1
         pC9/9zqamRO6gQQ0U32a+6unwDMMgEplj2MwXPd8NmcOi5leniZ/czYKKQxlqFLC6kLz
         +wQg==
X-Forwarded-Encrypted: i=1; AKwUvByXkuNdJb6Gz/VBrW2PJK0jjileJXio/LgQV+SLspRVoZsU/Wz5Sjr8ERgpBsc4FnHRi975Nk5n88ZUwRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nWL18aixPlMwvNz4VjYmvainq10rJWGz3QbAlncdZY7jKjlYc
	qQlqj16r0H2BjJcwCcHxCvICM8V2fVrqWdPFHdUrkpHCOlJAHBttJUaTt2Pf84xIRWM=
X-Gm-Gg: AYBFou1F/VsOdPQEySIq4YC5iHEjo1U4D/A9Zca/2hGoW5HoMoUBTnfheeW9puN0hPT
	M/PHwfYenmaLJNyj/kec0Fn29GZG4reLh9LrtrDCC7h/2PgCGY3eSRvRhILZC00rd1QcoYu/nD3
	LRYMUYg4OcmCF6klcQko6ZrmiT/eJIblle284sdYEn6rdWrCi5njY8aTLMPly06xHZfw2JLULg7
	1TTdVvKDVN7Cr5Z/zoYFlOBjvGsPtIi161J24PYeE5GPzYA+NjvUsGu7XL85OYpJ9QSpv0NcTeY
	diDDjgPNQ47BLL8MzEXxZi6UvInbny2Aeqv69ICiAVSQs4w72WVLlr3pLh7xBlWWyC5tBOIxRKC
	jlJn8r9e05GBm6Tr47809yuKUzw79SmZpNvlBY7veeM22jyaqZNXCCzAzp1Bdrq8xsHmHkzjuFl
	pZCpsDHYOTvVq8IatKDMlDL3qsrF3ezDd73kj853dmXbT8PgzJO16WIG0coxVYHvsvFD09WgkTh
	g+ut/vVc30LFeOKzY9E+JMXnLYT7ssuCeCI38m0y+tZQNS+vgmc0WoL70v73VfldeDClLCPseoX
	GtPfhnnOel++a4Y96lgbgRhGCFlv6IA=
X-Received: by 2002:a05:600c:4e11:b0:4a2:59:f568 with SMTP id 5b1f17b1804b1-4b6ddee38a5mr53567455e9.14.1793985749669;
        Fri, 06 Nov 2026 09:22:29 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbe9e31sm10185655e9.2.2026.11.06.09.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:22:29 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v6 11/16] console/braille: Lock console->setup() call during the registration
Date: Fri,  6 Nov 2026 18:19:47 +0100
Message-ID: <20261106171952.207909-12-pmladek@suse.com>
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

In braille_register_console(), the console->setup() callback must be
called while holding the console_lock. This prevents a race condition
with a possible active boot console that might be using the same hardware
registers.

See also the commit 801410b26a0e ("serial: Lock console when calling into
driver before registration").

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260423130015.85175-1-pmladek%40suse.com
Suggested-by: John Ogness <john.ogness@linutronix.de>
Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 drivers/accessibility/braille/braille_console.c | 10 +++++-----
 include/linux/console.h                         |  1 +
 kernel/printk/printk.c                          |  8 +++++++-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/accessibility/braille/braille_console.c b/drivers/accessibility/braille/braille_console.c
index 1b79b4d88bac..bc338e57d8ef 100644
--- a/drivers/accessibility/braille/braille_console.c
+++ b/drivers/accessibility/braille/braille_console.c
@@ -408,11 +408,11 @@ int braille_register_console(struct console *console, int index,
 		console_options = "57600o8";
 	if (braille_co)
 		return -ENODEV;
-	if (console->setup) {
-		ret = console->setup(console, console_options);
-		if (ret != 0)
-			return ret;
-	}
+
+	ret = console_call_setup(console, console_options);
+	if (ret != 0)
+		return ret;
+
 	console->flags |= CON_ENABLED | CON_BRL;
 	console->index = index;
 	braille_co = console;
diff --git a/include/linux/console.h b/include/linux/console.h
index cb8be9ea4a76..b68279a22514 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -710,6 +710,7 @@ enum con_flush_mode {
 };
 
 extern int add_preferred_console(const char *name, const short idx, char *options);
+extern int console_call_setup(struct console *newcon, char *options);
 extern void console_force_preferred_locked(struct console *con);
 extern void register_console(struct console *);
 extern int unregister_console(struct console *);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 49c5624eede0..0e68af9a3490 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3957,7 +3957,13 @@ static int __init keep_bootcon_setup(char *str)
 
 early_param("keep_bootcon", keep_bootcon_setup);
 
-static int console_call_setup(struct console *newcon, char *options)
+/*
+ * The function is intended only for the generic console registration code.
+ * It has been made global only for the Braille console driver which
+ * is partly using the generic console registration code but it is
+ * integrated with VT code instead of printk().
+ */
+int console_call_setup(struct console *newcon, char *options)
 {
 	int err;
 
-- 
2.56.0

