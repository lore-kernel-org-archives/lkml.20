Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3671F4EFFB5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957847; cv=none; b=tAise7e3yuwYa9g0ForZRuayrM288VU2489t8T/ZICvSHs7PJtkUvqR24+OnPIztikg0VN25Tc+0GsgtbsJRE8D90yoW3i7SyYYRM58ZUaGFE61AF5wKds1uX+5DendGjilWdSSMoF5UnyrVj2b2SjAQvn+6oIPy4H3Gfg8RJfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957847; c=relaxed/simple;
	bh=Yrov+4xcxfQBnrSGVO2pHdXWIvXxICJUG0X7+N5k0E4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwB7fzmmutZL+AcylT21Z4PZCRpr00ihL51QBv/f0n5nrG3UXzV6xdxoUUE9RLVrt13xcY2B/JMjiQmJloI7EtZgY1+CmhoqsXQav+svH6yLY3wsuzY180cZjbWZeCWybDU4DI9LaaTAGe1zlpNdPugF6OBrHEj78HZw6bhxzlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRPm1zme; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRPm1zme"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae19959791so82271a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790957841; x=1791562641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inUXALtHTvzEHgf8GUFS30DP/3xlzvolY7NUu3QFipU=;
        b=GRPm1zmedtZDbofip+l8xt7GSuyU0kCwiuoZyuo6TX5IPzc6DEwBV0l+6Q/RflsdSw
         fHoXDnucy2mthbuwAxRlKCDB6o6bj5KsxvmKsbx9GJOP7UtuMrnfeX3Qr8xh9FXBqB73
         vg0RIj61EgfE4a1CjbrJxsIWmRdBLetWWwcp0yI7GfF4mHgm+1zpNAm3uYDqeiBeYNaS
         1iH1DB2AvAVmsByB0Z7HyFpJjLYlBrgnvP4dzLxkZaQdwcPg+mK5uq31Ij/YRu+b4rSq
         lsrRXdfl07hvJs6oXjy6S59yUYv1UHjItpwer/F7IfjHCdNkcocjsaxYs/3dVQxk8qEf
         6D3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957841; x=1791562641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=inUXALtHTvzEHgf8GUFS30DP/3xlzvolY7NUu3QFipU=;
        b=J505XIbyyg2R5BbUNAg680VuUknmkd61SkJ3ntzW+oJoIkn9R56BXht1KR4hx3kk4u
         T9ImPd+Iwmn7pUki2KnuZwqXYtDMTwBmKXe5XOf/wp/JKEig32zY9egMV2LqhTbYA31b
         0U/DW1/jTsfUkoHYWwrldhSBQ34FwxDgjt9jgKrHyBRSQXziPBkNf87oSud+H33YyJCm
         bQyewckSn/RbHuIGENzGG0eYQGXbU6vZ04qwKT4DVJ6MrQM/R7RxhlAEIa8sruutBrkd
         WgUq+R/bG2gRa8cQveSHsobGgJF2IiOjvPgxcW5vx4+lToLwmqg35rr7A3hnP1IkC7DA
         9UMQ==
X-Gm-Message-State: AFuF++lBq+yrOz16tDL1ssXjjiK79NOTKoGAAzbpOx4C6klirogMGtaJ
	r/z04CnphKMcsbfonUtBY/Cl+t5NVjMXfudd/uEdvUWyAYzo464X9rAD
X-Gm-Gg: AYBFou2w9Br/MV11pxfAfu71wEEYMJIj6OwCJAVKgEJIy5+cwVkTahCilDEZyERdtb+
	Vi/Q6PEpgXhgR/jLCXR6SKTAgED0fm5f7EQkl5cSh1jvGofJUsUVXOyTqDoVH2qTzmzAvKheRKd
	w2f5UKTiy1qMMzJctT0wrxd8QFzrxwYA/miVwcbLdpyQvGyjSymwO32Jol9q6i0X8YzTR6L8/y3
	hhN4fMlKkhw370lsTn8m1/ui8Vwnjench8aBqq74Jyo22d/2by1C6t/8vuKOd/TJBGvkLvpy6Q1
	rN2/LAFOHACDkhIBvafnhLZ4AcdDRpOCQHei871vX8Blyit6ez21ASk/IOOwHm9NxbUc0ZLK+7K
	1gr20MhpW+37nu9PiLu7JXb4BcWqkdnOngibWvDoLA6xj2EG1u9U7FjQweReA5o06+Vt+a4ZVGE
	SfCziqXwRUUXRBHPhOo6AuAMZnDOat/OuuzgU23/etXjK6TvjJqAV0y6J78D7WbttqmDpRNf60u
	D+T1CigWCixKEYK96ezp7cq+v0o51z/qcGU9bjO2g==
X-Received: by 2002:a17:906:4fc5:b0:c26:1649:47b4 with SMTP id a640c23a62f3a-c2e4afee0demr267257866b.42.1790957841298;
        Fri, 02 Oct 2026 09:17:21 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf5f4e4sm106437166b.42.2026.10.02.09.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:17:19 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: sparclinux@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: linux-kernel@vger.kernel.org,
	Magnus Lindholm <linmag7@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 7/7] hvc: add an M3000 firmware console backend
Date: Fri,  2 Oct 2026 18:14:29 +0200
Message-ID: <20261002161515.932316-8-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002161515.932316-1-linmag7@gmail.com>
References: <20261002161515.932316-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide hvc0 through the IKKAKU Open Firmware pseudo-console, validating
model and console properties before matching. Serialize firmware calls,
keep the bounce buffer in locked mappings and poll input each open tick.

Keep output buffers const and bound no-progress retries because HVC
retries EAGAIN indefinitely. A stalled firmware call remains unbounded.
Use the existing SPARC p1275 interface and HVC output contract.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 MAINTAINERS                 |   6 ++
 drivers/tty/hvc/Kconfig     |  10 +++
 drivers/tty/hvc/Makefile    |   2 +
 drivers/tty/hvc/hvc_m3000.c | 167 ++++++++++++++++++++++++++++++++++++
 4 files changed, 185 insertions(+)
 create mode 100644 drivers/tty/hvc/hvc_m3000.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..5bc9b1cabd0a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10728,6 +10728,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/fujitsu-laptop.c
 
+FUJITSU M3000 FIRMWARE CONSOLE
+M:	Magnus Lindholm <linmag7@gmail.com>
+L:	linux-serial@vger.kernel.org
+S:	Maintained
+F:	drivers/tty/hvc/hvc_m3000.c
+
 FUJITSU TABLET EXTRAS
 M:	Robert Gerlach <khnz@gmx.de>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
index 5866195de26a..0feb7ec98f4f 100644
--- a/drivers/tty/hvc/Kconfig
+++ b/drivers/tty/hvc/Kconfig
@@ -134,3 +134,13 @@ config HVCS
 	  will depend on arch specific APIs exported from hvcserver.ko
 	  which will also be compiled when this driver is built as a
 	  module.
+
+config HVC_M3000
+	bool "M3000 firmware pseudo-console"
+	depends on SPARC64_VII
+	select HVC_DRIVER
+	help
+	  Provide hvc0 using Open Firmware stdin/stdout on IKKAKU only.
+	  Input is polled; no native UART registers are accessed.
+	  Firmware calls are serialized and use a locked-image bounce buffer.
+	  Say Y to use the M3000 firmware pseudo-console as hvc0.
diff --git a/drivers/tty/hvc/Makefile b/drivers/tty/hvc/Makefile
index 98880e357941..5b0277deb7c9 100644
--- a/drivers/tty/hvc/Makefile
+++ b/drivers/tty/hvc/Makefile
@@ -11,3 +11,5 @@ obj-$(CONFIG_HVC_IUCV)		+= hvc_iucv.o
 obj-$(CONFIG_HVC_UDBG)		+= hvc_udbg.o
 obj-$(CONFIG_HVC_RISCV_SBI)	+= hvc_riscv_sbi.o
 obj-$(CONFIG_HVCS)		+= hvcs.o
+
+obj-$(CONFIG_HVC_M3000) += hvc_m3000.o
diff --git a/drivers/tty/hvc/hvc_m3000.c b/drivers/tty/hvc/hvc_m3000.c
new file mode 100644
index 000000000000..0ef4c888a6a2
--- /dev/null
+++ b/drivers/tty/hvc/hvc_m3000.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Experimental M3000 Open Firmware pseudo-console backend. */
+#include <linux/console.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/irqflags.h>
+#include <linux/string.h>
+#include <linux/spinlock.h>
+#include <linux/timer.h>
+#include <asm/oplib.h>
+#include <asm/spitfire.h>
+#include "hvc_console.h"
+
+#define M3000_WRITE_ATTEMPTS 8
+
+static int m3000_stdin;
+static bool m3000_ready;
+/* Keep firmware buffers within the locked kernel image mappings. */
+static u8 m3000_buffer[256];
+static DEFINE_RAW_SPINLOCK(m3000_buffer_lock);
+static struct timer_list m3000_poll_timer;
+static bool m3000_poll_active;
+
+/*
+ * HVC's idle backoff can exceed the firmware input FIFO's capacity.
+ * Wake its worker each tick while open; keep PROM calls out of the timer.
+ */
+static void m3000_poll_tick(struct timer_list *timer)
+{
+	if (!READ_ONCE(m3000_poll_active))
+		return;
+	hvc_kick();
+	mod_timer(&m3000_poll_timer, jiffies + 1);
+}
+
+static int m3000_open(struct hvc_struct *hp, int data)
+{
+	WRITE_ONCE(m3000_poll_active, true);
+	mod_timer(&m3000_poll_timer, jiffies + 1);
+	return 0;
+}
+
+static void m3000_close(struct hvc_struct *hp, int data)
+{
+	WRITE_ONCE(m3000_poll_active, false);
+	timer_delete_sync(&m3000_poll_timer);
+}
+
+static ssize_t m3000_io(u8 *in, const u8 *out, size_t count)
+{
+	unsigned long args[7], flags;
+	bool input = in != NULL;
+	int ret;
+
+	if (!count)
+		return 0;
+	count = min_t(size_t, count, input ? 1 : sizeof(m3000_buffer));
+	/* Serialize the bounce buffer; p1275 separately serializes firmware. */
+	raw_spin_lock_irqsave(&m3000_buffer_lock, flags);
+	if (!input)
+		memcpy(m3000_buffer, out, count);
+	args[0] = (unsigned long)(input ? "read" : "write");
+	args[1] = 3;
+	args[2] = 1;
+	args[3] = (unsigned int)(input ? m3000_stdin : prom_stdout);
+	args[4] = (unsigned long)m3000_buffer;
+	args[5] = count;
+	args[6] = (unsigned long)-1;
+	p1275_cmd_direct(args);
+	ret = (int)args[6];
+	if (ret > 0 && ret <= count && input)
+		memcpy(in, m3000_buffer, ret);
+	raw_spin_unlock_irqrestore(&m3000_buffer_lock, flags);
+	if (ret == -2 || ret == 0)
+		return input ? 0 : -EAGAIN;
+	if (ret < 0 || ret > count)
+		return -EIO;
+	return ret;
+}
+
+static ssize_t m3000_get(u32 termno, u8 *buf, size_t count)
+{
+	return m3000_io(buf, NULL, count);
+}
+
+static ssize_t m3000_put(u32 termno, const u8 *buf, size_t count)
+{
+	ssize_t ret;
+	int attempt;
+
+	/*
+	 * HVC retries -EAGAIN forever, so drop this chunk without logging when
+	 * the no-progress budget expires. This cannot bound a stalled firmware
+	 * call or lock acquisition.
+	 */
+	for (attempt = 0; attempt < M3000_WRITE_ATTEMPTS; attempt++) {
+		ret = m3000_io(NULL, buf, count);
+		if (ret != -EAGAIN)
+			return ret;
+		cpu_relax();
+	}
+	return -EIO;
+}
+
+static const struct hv_ops m3000_ops = {
+	.get_chars = m3000_get,
+	.put_chars = m3000_put,
+	.notifier_add = m3000_open,
+	.notifier_del = m3000_close,
+	.notifier_hangup = m3000_close,
+};
+
+static bool __init m3000_property_matches(phandle node, const char *prop,
+					 const char *expected)
+{
+	char value[64];
+	int len;
+
+	len = prom_getproperty(node, prop, value, sizeof(value) - 1);
+	if (len <= 0)
+		return false;
+	value[len] = '\0';
+	return !strcmp(value, expected);
+}
+
+static int __init m3000_console_init(void)
+{
+	phandle node;
+	int ret;
+
+	if (tlb_type != sparc64_vii)
+		return -ENODEV;
+	if (!m3000_property_matches(prom_finddevice("/"), "model", "IKKAKU"))
+		return -ENODEV;
+	m3000_stdin = prom_getint(prom_chosen_node, "stdin");
+	if (!m3000_stdin || m3000_stdin == -1 || !prom_stdout || prom_stdout == -1)
+		return -ENODEV;
+	node = prom_inst2pkg(prom_stdout);
+	if (!m3000_property_matches(node, "name", "pseudo-console"))
+		return -ENODEV;
+	node = prom_inst2pkg(m3000_stdin);
+	if (!m3000_property_matches(node, "name", "pseudo-console"))
+		return -ENODEV;
+	ret = hvc_instantiate(0, 0, &m3000_ops);
+	if (ret < 0)
+		return ret;
+	m3000_ready = true;
+	return 0;
+}
+console_initcall(m3000_console_init);
+
+static int __init m3000_tty_init(void)
+{
+	struct hvc_struct *hp;
+
+	if (!m3000_ready)
+		return -ENODEV;
+	timer_setup(&m3000_poll_timer, m3000_poll_tick, 0);
+	hp = hvc_alloc(0, 0, &m3000_ops, sizeof(m3000_buffer));
+	if (IS_ERR(hp))
+		return PTR_ERR(hp);
+	hp->ws.ws_row = 24;
+	hp->ws.ws_col = 80;
+	pr_info("M3000: firmware-backed hvc0 tty ready (serialized, polled input)\n");
+	return 0;
+}
+device_initcall(m3000_tty_init);
-- 
2.43.0

