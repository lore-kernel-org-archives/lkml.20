Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411E13C9EF0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061993; cv=none; b=P79LHydyF+01uiMcHYz7uk0sMZo9iN+vW0sHdowGqoK9INdgUqwk6QRms1GdBgppjcH1CMVs6eB+exkhDq2jNHVBDAJ+vcttUMRPMw3BqB14AmRLJRgJKwFERCpQYVzn0WnmDMmPenipP2ecSkNRPsM4EPUDkV5A3A1/ilReZTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061993; c=relaxed/simple;
	bh=UIeHGzko9PNGSAFX4WTjAsYcLZre5mbCyVd5/P2jJGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eNGLxLtoSWGQeUUOv1MGr1NjcPZKdUMfypdTq2nWGEke1HFnU8A8WkuhYDyEhH6NDV3mhDVPjiW09eH1BzkarU5ELVh7lI6ZOnCvGLcGL8jlSd8rDkYv9FhSlWaXm1aGN0JH3PYTpy9ZkBGEx9BWgnbub7NpMzgKvJk0LKspkOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EqBghxV6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EqBghxV6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so18053695e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790061990; x=1790666790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnhbPdt7hfIV/6LXnAHz3D7CDaGQANxV0Uyd8rSU9Jg=;
        b=EqBghxV6CGX4X/gdDMrUese0eongaoXz+uf4DrLhsIvF+D9cbZwCWREx8a4SyotJh/
         T6T5jAhCrxi9/hg4CYrTaz1hNKeKkARMmHLk+aZ2WrIz23DqGMt0yQO7PEuYIzRfXKJR
         jKIZ9zuXsUQhjtlfCc/TUOp4xYeklNMzQv2c/Qxv8GD2bSHt6vaD6ZhhwYpcVb5UOR2b
         8zrMV+/8SZX1DbkGHYZz5dg/kcr90DPTV+w9+3+j07j0O5QCt9G1YfklsOBknRXTQREY
         yIBxIBA0GWV6eCI/crWOZJ0+63Dw/cvTxf2mRsNJuS9n1P+yQ43Y1HzHxE2MXaT0n/93
         issw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061990; x=1790666790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fnhbPdt7hfIV/6LXnAHz3D7CDaGQANxV0Uyd8rSU9Jg=;
        b=v+VkPxd6YG9wTW+vjdfhLjNNKSNN+3aPZRs833ccE5Uti/+OF6DH8OC4HbPw7/fsFF
         yuXs0qItEfudpQFP/s81X+WWJjN9MoaztL6nH3P7rl1quGQ2AQy6/yZS5OU9VErYmUHq
         eUATm5Q7z+W96bGb+W0R7Hag20mRLBEOgsxAtgVGeCUFche14er3zkrS05t8R+yZFc0g
         jepS8gKrIsv2Ury9OEHY1IjDjx0aAPizKG1OXkm99lnitaOxk3juyzDv7iAYcN7+e6LR
         hqu5cw+2jeWD8IYXl7I6DTTN4hHmSRqXGmCkpuqE00FVAHnCZA/oZmMprrTfxVAtUIav
         WAJA==
X-Forwarded-Encrypted: i=1; AKwUvBwZtWPJHxhffwMEHM71e8o4bT5YWR0TTMUK/1BCDkeL6RuofFlrhblMGPaA45Y08wmLo1viJ0cftndFnX4=@vger.kernel.org
X-Gm-Message-State: AFuF++k+Z3Kq6m33zAYXfBKANFcdQyqhswq6cUz7ExOq5B1vdtZ+4/aF
	yb6O/9w1/4MpZ9QpPwYUq6hwhS/QDbXwcaiKXVLHkpwpPadu/mFM5FfgCChrpbdez/E=
X-Gm-Gg: AYBFou0m6mJ3CakuI/P7A9TgslXPMAIQx7IWc9R4fRhSGPopd1rVhzwtasCsP4jlIaN
	epcoJwKOMxcUcg02KmdleFT306wk+QCBLUt5CSen6LCNFJ/Z+t8U4+9WLYIe3HGOQGP0By1EDdj
	yKHnfwOKgumHvJsfSAlg/VfHu1SweosMfqyEIatFAlBvcIm9GC8jJfs4axfsiZvNYhcaEcT8+Zp
	KgIpYA4hMyReQBEf4cENufU8hu2IodyVnKtGzA/d5AwluuVrJxkUXb95dM0+1Mr0HSzAmMKl0i6
	VjGNETyxe0aTVRndsK21UaKaF/8xKaHhKPOiVbKrDYBzac6j6pQYMh6Z7wGhH+/1HtvI7oOIfgb
	5S751OeoOlPg6giMkjaVq1Ifm2Gj+N/vSQzrGxFUtEeb/f54U+19b8ROlmZuw6OZvG8SE23IFax
	kBCvVwV09tfMW52nBlpVNxu5HAXnBlDLuB5uK/LU/nSZOgBdMc2IfIwwyvvIz4rNRx+aE2zDeA
X-Received: by 2002:a05:600c:c0c3:10b0:49e:823a:9dec with SMTP id 5b1f17b1804b1-49fc5a10b5fmr167223725e9.3.1790061990534;
        Tue, 22 Sep 2026 00:26:30 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8cc05e9sm52966385e9.5.2026.09.22.00.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:26:30 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Fushuai Wang <wangfushuai@baidu.com>,
	Kees Cook <kees@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	linux-serial@vger.kernel.org,
	Manuel Lauss <manuel.lauss@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH 1/2] printk: nbcon: Introduce Braille helpers
Date: Tue, 22 Sep 2026 09:25:57 +0200
Message-ID: <20260922072558.98854-2-pmladek@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922072558.98854-1-pmladek@suse.com>
References: <20260922072558.98854-1-pmladek@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These helpers will be used when calling console->write_atomic
in the Braille console driver.

The Braille console is not registered as a standard printk console.
Instead, it is integrated with the virtual terminal (VT) and writes
data using the legacy con->write() callback of the associated serial
console driver.

When the underlying console driver is converted to the NBCON API, the
Braille console needs to use the con->write_atomic() callback instead.
This callback must be synchronized by acquiring the nbcon console context.

Fixes: d3539347022a ("serial: 8250: Switch to nbcon console, take 2")
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 include/linux/console.h |  8 ++++++
 kernel/printk/nbcon.c   | 59 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/include/linux/console.h b/include/linux/console.h
index 502d1abe3f50..d780f6de303a 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -615,6 +615,10 @@ extern bool nbcon_allow_unsafe_takeover(void);
 extern bool nbcon_kdb_try_acquire(struct console *con,
 				  struct nbcon_write_context *wctxt);
 extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
+extern bool nbcon_is_braille(struct nbcon_write_context *wctxt);
+extern bool nbcon_braille_try_acquire(struct console *con,
+				      struct nbcon_write_context *wctxt);
+extern void nbcon_braille_release(struct nbcon_write_context *wctxt);
 
 /*
  * Check if the given console is currently capable and allowed to print
@@ -678,8 +682,12 @@ static inline void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt) { }
 static inline bool nbcon_kdb_try_acquire(struct console *con,
 					 struct nbcon_write_context *wctxt) { return false; }
 static inline void nbcon_kdb_release(struct nbcon_write_context *wctxt) { }
+static inline bool nbcon_is_braille(struct nbcon_write_context *wctxt) { return false; }
 static inline bool console_is_usable(struct console *con, short flags,
 				     bool use_atomic) { return false; }
+static inline bool nbcon_braille_try_acquire(struct console *con,
+					     struct nbcon_write_context *wctxt) { return false; }
+static inline void nbcon_braille_release(struct nbcon_write_context *wctxt) { }
 #endif
 
 extern int console_set_on_cmdline;
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index d17704fe93ae..a5e053ffe4da 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -2002,3 +2002,62 @@ void nbcon_kdb_release(struct nbcon_write_context *wctxt)
 	 */
 	__nbcon_atomic_flush_pending_con(ctxt->console, prb_next_reserve_seq(prb));
 }
+
+/**
+ * nbcon_is_braille - Checks whether the nbcon write context is using Braille console
+ *
+ * @wctxt:	checked nbcon write context
+ *
+ * Return: True when the write context is associated with a Braille console.
+ *	   Othrewise, return false.
+ *
+ * Context: Can be called in any context but only when Braille console is
+ *	registered and the struct console could not disappear.
+ */
+bool nbcon_is_braille(struct nbcon_write_context *wctxt)
+{
+	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
+	struct console *con = ctxt->console;
+
+	return con && con->flags & CON_BRL;
+}
+
+/**
+ * nbcon_braille_try_acquire - Try to acquire nbcon console for braille_write()
+ *
+ * @con:	The nbcon console to acquire
+ * @wctxt:	The nbcon write context to be used on success
+ *
+ * Context:	braille_write() for emitting a single buffer on Braille console.
+ *
+ * Return:	True if the console was acquired. False otherwise.
+ *
+ * Braille console is not registered as a proper printk consoles. Instead,
+ * it is integrated with the graphical virtual terminal.
+ *
+ * This function acquires the nbcon console using priority NBCON_PRIO_EMERGENCY.
+ */
+bool nbcon_braille_try_acquire(struct console *con,
+			   struct nbcon_write_context *wctxt)
+{
+	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
+
+	memset(ctxt, 0, sizeof(*ctxt));
+	ctxt->console = con;
+	ctxt->prio    = NBCON_PRIO_EMERGENCY;
+
+	return nbcon_context_try_acquire(ctxt, false);
+}
+
+/**
+ * nbcon_braille_release - Release the nbcon console
+ *
+ * @wctxt:	The nbcon write context initialized by a successful
+ *		nbcon_braille_try_acquire()
+ */
+void nbcon_braille_release(struct nbcon_write_context *wctxt)
+{
+	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
+
+	nbcon_context_release(ctxt);
+}
-- 
2.55.0

