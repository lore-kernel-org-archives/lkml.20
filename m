Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513173;
	b=Ha2MhmI/GvFTpID7G6JcqFYjwjGpwOxN2xIFeysJzo0rUREtiXodvFYRnzRyJoTyxRtH
	 hxfQyEIvHfCds9fm8IEwwfcoGI+k0OKn8Z57jDX2vKDAvm6197Pq6bUKmdHs2+CeUTt9O
	 C3guS0qj3myXkDVJlBYh+kESp83Nen9/uOCE+Y5mPPnR+z//kmzmcxJzz/D/DjKigEzek
	 umbRdIygHD9efLVPMcKTWbSUZ+mnmXcIlt5U051LKvkAp7/MJd/HtJugW/c0F3I4bV7J2
	 PXwpBDzwl39IjgKWrv/MTd9BcPTsKldIMBa6q4h7dMi51W6At4mdOTS02RMw/leA+lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513173;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Stat-Signature:X-Spam-Status:
	 X-Session-Marker:X-Session-ID:DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=eWGVq8ZSqQJOAFzRZtJg9Fw0d+ypLxqKr3xDjy9bwiQ=;
	b=CEfBQbmsVNyPEST+6XYSQ7IIYSWr5RKSHVHS/B8zaoH1KdijiwJgNQM52AxYcLI3ttOL
	 EQaYvw5YoloNfhuLcIkjWJue+zhlnq4ImilODszm+W2rBG3ya2Irz7zJxGS0o3XAA90Qi
	 OmdCJlG6XEUuR8ap0JD3CBllaS8Fzb8GafP1u/z/UJFxekZAFhcoZSy4XP8xJmICiUKqv
	 PhnSjeY8YSw5S6G+AYlV+RyhpdyvxMKYfWCtPN9KZTzi3+FJXAIukKivRqcm8MPbQPxP3
	 KOEBg/NmPlz2BDi6Cgd6lLI1FXxPdbRQ/9VAtSua0lY9qxzLjXFJ7ZXt8LaqnwXwO+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=h8yaDumx;
	arc=none smtp.remote-ip=216.40.44.13
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738A5606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 738A5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=h8yaDumx
Received: from omf15.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id A3E9D402BB;
	Tue, 20 Oct 2026 16:19:30 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id 06B871A;
	Tue, 20 Oct 2026 16:19:28 +0000 (UTC)
Date: Tue, 20 Oct 2026 12:19:23 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Gabriele Monaco
 <gmonaco@redhat.com>, Nam Cao <namcao@linutronix.de>, Wen Yang
 <wen.yang@linux.dev>
Subject: [GIT PULL] rv: Changes for v7.4
Message-ID: <20261020121923.72c650b3@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 06B871A
X-Stat-Signature: e6y9ffp9whgw8iobczd6n4xpszuka31w
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+zRK4hxC2fryyMo3OHTXfPXOeV9IUu2R8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=eWGVq8ZSqQJOAFzRZtJg9Fw0d+ypLxqKr3xDjy9bwiQ=; b=h8yaDumxqlVMxLDpC/PtW9JTxh8xbFPIvVAiIYVZNmpp7BtpUXynOMNzbJ/KpsZE7FcEoQDDJ/Wkq+nt9Ky+KC4jL/aK5q1dIVuqWLSKhpdvHQXt7dvGm7oq7ZrTHY0YJXgjCijDJoG65YpfS8i8A50f+seRhAKje8RMIXLFnl0=
X-HE-Tag: 1792513168-496309
X-HE-Meta: U2FsdGVkX1+77svN9HIpktJ625YElrl6dG0up2lF1TjnpoQMJVGMciTDivcFD9Cc6iHkQI2lu1A5o1QD2w2iTZM0t1LGPXcb2wBOjGwmBxoCCNnNbwSn0adgLG2MG6tCZil0pBp7L1+oKLj1/utE48u+dEcP8VAlT0R9CaefzDOLABVxGk+/KtnpkcfjYM14YDqBiIruKc1NcRnFJqvV/iI28M+o5oUmP4+8rVMC7PLK2lMDhsAFbVDiprn3n99swgdZg6XKMNshhaSUFY/CpP9wqPsIHgrJtcpxl3JSJzQepOpg2HUmbIMRcHH5gXQnMD53v4DU5TwpNs9Gs3Z9+BHz/elryFEF


Linus,

runtime verifier updates for v7.4:

- Improve lockdep annotation for reactors

  Reactors are not supposed to take locks, so they fit the LD_WAIT_FREE
  lockdep class. However, reactors may run in preemptible context and
  if the preempting code (tick or simply the scheduler) takes locks, we
  see a lockdep splat. Switch to LD_WAIT_SPIN to avoid the splat while
  documenting that reactors should still not take locks.

- Add KUnit tests for reactors

  Add KUnit test cases to validate registration and reaction, this
  requires exporting some symbols and other minor fixes.

- Use the right rv_this variable in the wakeup monitor

  LTL monitors were updated to use the generic rv_this static variable
  but this change wasn't propagated to the newly introduced wakeup
  monitor. This broke reactors for the monitor: update the it.


Please pull the latest trace-rv-v7.4 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-rv-v7.4

Tag SHA1: 229d02a5765bdbdb90064f0ac7595effa1e3209e
Head SHA1: 5e9bdf2924c9041ff1520b528db6104626e9ef41


Nam Cao (1):
      rv/rtapp/wakeup: Use "rv_this" the rv_monitor variable

Wen Yang (4):
      rv: Use LD_WAIT_SPIN as the reactor lockdep wait type
      rv: Propagate rv_register_reactor() error from reactor init
      rv: Export rv_register_reactor() and rv_unregister_reactor()
      rv: Add KUnit tests for reactor registration and dispatch

----
 kernel/trace/rv/Kconfig                  |  12 ++++
 kernel/trace/rv/Makefile                 |   1 +
 kernel/trace/rv/monitors/wakeup/wakeup.c |   6 +-
 kernel/trace/rv/reactor_panic.c          |   3 +-
 kernel/trace/rv/reactor_printk.c         |   3 +-
 kernel/trace/rv/rv_reactors.c            |  12 +++-
 kernel/trace/rv/rv_reactors_kunit.c      | 111 +++++++++++++++++++++++++++++++
 7 files changed, 140 insertions(+), 8 deletions(-)
 create mode 100644 kernel/trace/rv/rv_reactors_kunit.c
---------------------------
diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
index efa930f94ea4..9bfd429ffdea 100644
--- a/kernel/trace/rv/Kconfig
+++ b/kernel/trace/rv/Kconfig
@@ -113,6 +113,18 @@ config RV_REACT_PANIC
 	  Enables the panic reactor. The panic reactor emits a printk()
 	  message if an exception is found and panic()s the system.
 
+config RV_REACTORS_KUNIT
+	tristate "KUnit tests for RV reactors" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	depends on RV_REACTORS
+	default KUNIT_ALL_TESTS
+	help
+	  Enable KUnit tests for RV reactor registration and dispatch.
+	  These tests verify the register/unregister lifecycle, duplicate
+	  rejection, and that rv_react() correctly invokes callbacks.
+
+	  If unsure, say N.
+
 config RV_MONITORS_KUNIT_TEST
 	tristate "KUnit tests for RV monitors" if !KUNIT_ALL_TESTS
 	depends on KUNIT && RV && RV_REACTORS
diff --git a/kernel/trace/rv/Makefile b/kernel/trace/rv/Makefile
index cdbf68c84f5a..c895d81dfdad 100644
--- a/kernel/trace/rv/Makefile
+++ b/kernel/trace/rv/Makefile
@@ -25,4 +25,5 @@ obj-$(CONFIG_RV_MON_WAKEUP) += monitors/wakeup/wakeup.o
 obj-$(CONFIG_RV_REACTORS) += rv_reactors.o
 obj-$(CONFIG_RV_REACT_PRINTK) += reactor_printk.o
 obj-$(CONFIG_RV_REACT_PANIC) += reactor_panic.o
+obj-$(CONFIG_RV_REACTORS_KUNIT) += rv_reactors_kunit.o
 obj-$(CONFIG_RV_MONITORS_KUNIT_TEST) += rv_monitors_test.o
diff --git a/kernel/trace/rv/monitors/wakeup/wakeup.c b/kernel/trace/rv/monitors/wakeup/wakeup.c
index 01b47416f24e..2e803e79181e 100644
--- a/kernel/trace/rv/monitors/wakeup/wakeup.c
+++ b/kernel/trace/rv/monitors/wakeup/wakeup.c
@@ -128,7 +128,7 @@ static void disable_wakeup(void)
 	ltl_monitor_destroy();
 }
 
-static struct rv_monitor rv_wakeup = {
+static struct rv_monitor rv_this = {
 	.name = "wakeup",
 	.description = "Monitor that real-time tasks are not woken by lower-priority tasks",
 	.enable = enable_wakeup,
@@ -137,12 +137,12 @@ static struct rv_monitor rv_wakeup = {
 
 static int __init register_wakeup(void)
 {
-	return rv_register_monitor(&rv_wakeup, &rv_rtapp);
+	return rv_register_monitor(&rv_this, &rv_rtapp);
 }
 
 static void __exit unregister_wakeup(void)
 {
-	rv_unregister_monitor(&rv_wakeup);
+	rv_unregister_monitor(&rv_this);
 }
 
 module_init(register_wakeup);
diff --git a/kernel/trace/rv/reactor_panic.c b/kernel/trace/rv/reactor_panic.c
index 76537b8a4343..db7116ceafff 100644
--- a/kernel/trace/rv/reactor_panic.c
+++ b/kernel/trace/rv/reactor_panic.c
@@ -26,8 +26,7 @@ static struct rv_reactor rv_panic = {
 
 static int __init register_react_panic(void)
 {
-	rv_register_reactor(&rv_panic);
-	return 0;
+	return rv_register_reactor(&rv_panic);
 }
 
 static void __exit unregister_react_panic(void)
diff --git a/kernel/trace/rv/reactor_printk.c b/kernel/trace/rv/reactor_printk.c
index 48c934e315b3..002a10f6aa7b 100644
--- a/kernel/trace/rv/reactor_printk.c
+++ b/kernel/trace/rv/reactor_printk.c
@@ -25,8 +25,7 @@ static struct rv_reactor rv_printk = {
 
 static int __init register_react_printk(void)
 {
-	rv_register_reactor(&rv_printk);
-	return 0;
+	return rv_register_reactor(&rv_printk);
 }
 
 static void __exit unregister_react_printk(void)
diff --git a/kernel/trace/rv/rv_reactors.c b/kernel/trace/rv/rv_reactors.c
index 2f5fc8d18dea..8e57a95d446b 100644
--- a/kernel/trace/rv/rv_reactors.c
+++ b/kernel/trace/rv/rv_reactors.c
@@ -314,6 +314,7 @@ int rv_register_reactor(struct rv_reactor *reactor)
 	guard(mutex)(&rv_interface_lock);
 	return __rv_register_reactor(reactor);
 }
+EXPORT_SYMBOL_GPL(rv_register_reactor);
 
 /**
  * rv_unregister_reactor - unregister a rv reactor.
@@ -327,6 +328,7 @@ int rv_unregister_reactor(struct rv_reactor *reactor)
 	list_del(&reactor->list);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(rv_unregister_reactor);
 
 /*
  * reacting_on interface.
@@ -465,7 +467,15 @@ int init_rv_reactors(struct dentry *root_dir)
 
 void rv_react(struct rv_monitor *monitor, const char *msg, ...)
 {
-	static DEFINE_WAIT_OVERRIDE_MAP(rv_react_map, LD_WAIT_FREE);
+	/*
+	 * Reactors must not explicitly take locks, so they should be
+	 * LD_WAIT_FREE.  However, reactor callbacks can run with preemption
+	 * enabled, meaning the preempting code (e.g. the scheduler taking
+	 * rq->__lock at LD_WAIT_SPIN) may violate that constraint.  Use
+	 * LD_WAIT_SPIN to avoid false-positive lockdep reports.
+	 * But you should still NOT be using locks in reactors.
+	 */
+	static DEFINE_WAIT_OVERRIDE_MAP(rv_react_map, LD_WAIT_SPIN);
 	va_list args;
 
 	if (!rv_reacting_on() || !monitor->react)
diff --git a/kernel/trace/rv/rv_reactors_kunit.c b/kernel/trace/rv/rv_reactors_kunit.c
new file mode 100644
index 000000000000..3850c6dda288
--- /dev/null
+++ b/kernel/trace/rv/rv_reactors_kunit.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for RV reactor registration and dispatch.
+ *
+ * The dispatch tests rely on reacting_on being enabled, since rv_react()
+ * returns early when it is off. It is on by default when the suites run
+ * built-in; as a module, re-enable it if disabled via
+ * /sys/kernel/tracing/rv/reacting_on.
+ */
+
+#include <kunit/test.h>
+#include <linux/build_bug.h>
+#include <linux/rv.h>
+#include <linux/delay.h>
+#include "rv.h"
+
+static struct rv_reactor test_reactor = {
+	.name		= "kunit_test_reactor",
+	.description	= "KUnit test reactor",
+};
+
+static void reactor_teardown(void *arg)
+{
+	rv_unregister_reactor(&test_reactor);
+}
+
+static void register_test_reactor(struct kunit *test)
+{
+	KUNIT_ASSERT_EQ(test, rv_register_reactor(&test_reactor), 0);
+	KUNIT_ASSERT_EQ(test,
+			kunit_add_action_or_reset(test, reactor_teardown, NULL), 0);
+}
+
+static void test_double_register(struct kunit *test)
+{
+	register_test_reactor(test);
+	KUNIT_EXPECT_EQ(test, rv_register_reactor(&test_reactor), -EINVAL);
+}
+
+static const char long_reactor_name[] = "kunit_reactor_name_too_long_xxx_";
+static_assert(sizeof(long_reactor_name) - 1 >= MAX_RV_REACTOR_NAME_SIZE,
+	       "long_reactor_name must be at least MAX_RV_REACTOR_NAME_SIZE chars");
+
+static void test_name_too_long(struct kunit *test)
+{
+	static struct rv_reactor long_reactor = {
+		.name = long_reactor_name,
+	};
+
+	KUNIT_EXPECT_EQ(test, rv_register_reactor(&long_reactor), -EINVAL);
+}
+
+static struct kunit_case rv_reactor_registration_cases[] = {
+	KUNIT_CASE(test_double_register),
+	KUNIT_CASE(test_name_too_long),
+	{}
+};
+
+static struct kunit_suite rv_reactor_registration_suite = {
+	.name		= "rv_reactor_registration",
+	.test_cases	= rv_reactor_registration_cases,
+};
+
+static int react_call_count;
+
+__printf(1, 0) static void mock_react(const char *msg, va_list args)
+{
+	react_call_count++;
+	/* Busy-wait so a timer interrupt fires inside rv_react(). */
+	mdelay(20);
+}
+
+static void test_react_no_callback(struct kunit *test)
+{
+	struct rv_monitor monitor = {
+		.name = "kunit_null_react",
+	};
+
+	react_call_count = 0;
+	rv_react(&monitor, "no callback");
+
+	KUNIT_EXPECT_EQ(test, react_call_count, 0);
+}
+
+static void test_react_callback_invoked(struct kunit *test)
+{
+	struct rv_monitor monitor = {
+		.name	= "kunit_dispatch_monitor",
+		.react	= mock_react,
+	};
+
+	react_call_count = 0;
+	rv_react(&monitor, "callback invocation test");
+	KUNIT_EXPECT_EQ(test, react_call_count, 1);
+}
+
+static struct kunit_case rv_react_dispatch_cases[] = {
+	KUNIT_CASE(test_react_no_callback),
+	KUNIT_CASE(test_react_callback_invoked),
+	{}
+};
+
+static struct kunit_suite rv_react_dispatch_suite = {
+	.name		= "rv_react_dispatch",
+	.test_cases	= rv_react_dispatch_cases,
+};
+
+kunit_test_suites(&rv_reactor_registration_suite, &rv_react_dispatch_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("KUnit tests for RV reactor registration and dispatch");
