Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818913C1D48
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159864; cv=none; b=Qv9+BdrOQOQnTJBnKHBhX150AitTlHYInnFw+4E1kWst/8wPKbDqp0jjQ21/aC8sN8nXFy8bLztHIpVSo91QwsumjU4HjnsLxcwNpuaY06lFW+GEYHgUH3oNExgiXBQYhGbJt/Fo1+GDBz6oNeCnPeX0rvnIedXRmjP3n5BlowY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159864; c=relaxed/simple;
	bh=M43cnpBymSCKMsCZFG2tX0uJTeC8mhh6vcO4ugsUQiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRNUlho6yDnJMylrzU3xSKWErGU5ttYs6BAx3hs3FqpRTZr+MuYjXXMdQEjo02q4Sb07r9niNz+qkrSjlDucz6nAKO4CvZno37QA4TS9/W7MC3AkMAj63UYxM8vSoxjvpkgo8HNZHNOmrKBU5uNrQKKwbQmAbzh6YXkmz7zwhJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7+2RE+N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7+2RE+N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503741F00A3E;
	Mon, 31 Aug 2026 07:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788159863;
	bh=v4fCl+LDvzJc+WHGg4yHN0f53K4cDgIw8xSEt3PLJuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z7+2RE+NRI5tCXRBAhNrOxg6Dz1TZb0KrLE4+rPAftxtwjPCjURVT3BovaeKgFSbY
	 buw5//P5GcHxZAJJ2i+y8aHb8Y2Biljvcv5ERA7RO68GFj2hGZRK+GJb9vMDZLMNlx
	 ZmY0C0EhaypewluSvdfWJw6ZVxFlhT1Qy+2zz1kqOeMiOMEyrn2ukd7LYabJguGo3Y
	 QtSFxph50sYL3xSYsbEoEtHNTy4lmR5XJ3SB+mTOrFbn9TPfSZWbjbKHQ7HOmYJByw
	 +yuTkDG/jWhuPJ+WwFgSlpnHJQj/u+jJGCRdLQcNrvYJGIFwajTTO8zeB48RGQL3EL
	 5VtbvldCWoHow==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Petr Mladek <pmladek@suse.com>
Cc: Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	tzungbi@kernel.org,
	tfiga@chromium.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] printk: Introduce CON_BYPASS_LOGLEVEL flag
Date: Mon, 31 Aug 2026 07:03:45 +0000
Message-ID: <20260831070346.3490745-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260831070346.3490745-1-tzungbi@kernel.org>
References: <20260831070346.3490745-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, offline consoles (e.g., pstore_console backed by ramoops)
inherently rely on the global `console_loglevel` setting.  If a system
is configured with a quiet serial console, the pstore console is
silenced as well.  Consequently, during a panic or lockup, relevant
verbose logs leading up to the crash are lost.

Introduce the `CON_BYPASS_LOGLEVEL` flag to allow consoles to bypass log
level suppression.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 include/linux/console.h | 4 ++++
 kernel/printk/nbcon.c   | 7 +++++--
 kernel/printk/printk.c  | 6 ++++--
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/linux/console.h b/include/linux/console.h
index d624200cfc17..00ce21d73256 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -180,6 +180,9 @@ static inline void con_debug_leave(void) { }
  *			constraints.
  * @CON_NBCON_ATOMIC_UNSAFE: The write_atomic() callback is not safe and is
  *			therefore only used by nbcon_atomic_flush_unsafe().
+ * @CON_BYPASS_LOGLEVEL	The console bypasses loglevel filtering. Every message
+ *			in the ringbuffer is emitted, regardless of the global
+ *			console_loglevel setting.
  */
 enum cons_flags {
 	CON_PRINTBUFFER		= BIT(0),
@@ -192,6 +195,7 @@ enum cons_flags {
 	CON_SUSPENDED		= BIT(7),
 	CON_NBCON		= BIT(8),
 	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
+	CON_BYPASS_LOGLEVEL	= BIT(10),
 };
 
 /**
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 4b03b019cd5e..bb5669cbf51b 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -981,7 +981,9 @@ static bool nbcon_emit_next_record(struct nbcon_write_context *wctxt, bool use_a
 {
 	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
 	struct console *con = ctxt->console;
-	bool is_extended = console_srcu_read_flags(con) & CON_EXTENDED;
+	short console_flags = console_srcu_read_flags(con);
+	bool is_extended = console_flags & CON_EXTENDED;
+	bool may_suppress = !(console_flags & CON_BYPASS_LOGLEVEL);
 	struct printk_message pmsg = {
 		.pbufs = ctxt->pbufs,
 	};
@@ -1014,7 +1016,8 @@ static bool nbcon_emit_next_record(struct nbcon_write_context *wctxt, bool use_a
 	if (!nbcon_context_enter_unsafe(ctxt))
 		return false;
 
-	ctxt->backlog = printk_get_next_message(&pmsg, ctxt->seq, is_extended, true);
+	ctxt->backlog = printk_get_next_message(&pmsg, ctxt->seq, is_extended,
+						may_suppress);
 	if (!ctxt->backlog)
 		return nbcon_context_exit_unsafe(ctxt);
 
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 3fcdf4b4e2e5..b8a7a8b69af7 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3125,7 +3125,9 @@ struct printk_buffers printk_shared_pbufs;
  */
 static bool console_emit_next_record(struct console *con, bool *handover, int cookie)
 {
-	bool is_extended = console_srcu_read_flags(con) & CON_EXTENDED;
+	short console_flags = console_srcu_read_flags(con);
+	bool is_extended = console_flags & CON_EXTENDED;
+	bool may_suppress = !(console_flags & CON_BYPASS_LOGLEVEL);
 	char *outbuf = &printk_shared_pbufs.outbuf[0];
 	struct printk_message pmsg = {
 		.pbufs = &printk_shared_pbufs,
@@ -3134,7 +3136,7 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
 
 	*handover = false;
 
-	if (!printk_get_next_message(&pmsg, con->seq, is_extended, true))
+	if (!printk_get_next_message(&pmsg, con->seq, is_extended, may_suppress))
 		return false;
 
 	con->dropped += pmsg.dropped;
-- 
2.55.0.897.gb25b4bd76c-goog

