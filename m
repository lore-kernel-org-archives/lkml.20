Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576304;
	b=Hee1/tyeB7W55pHyQXblz4Avhhi2NENcoJLn5UAEpzwcbEnvecOd4TzlDt2WN2kUTwvv
	 fDD/jqNxpYD0soEQJZS5L8dkowmmnTaeLbmPLgH946GssKtJi2zpXS6CrlNs6tbhlftbr
	 n+PUBIe3u5g5PegGet7ntu6RJOlx91grUM94EDMSWKPKxTnSni4DDen+Yu3reYROlx+dC
	 E3ZORQxk19unDEzfbj0CdrCkIMc3gylQKUUSHr4A42Vf0CeL3omqsZ8x45NJlTjbYkC5N
	 WQc62zhMs6wSXXExe3sCfVbEcZo8A5OzJDqgdlpdLTGD0Ib0gfDGtajQgBETYx0gd5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5zaK3r75fyAGpe/N6SPZ8mxSlYoXEgN0WMAWjFhZmTw=;
	b=otPiFTv6Wd5cEIg/SKmlM/LTkGMPefZhGDaRBXRMgEcZsRSjsxVsN3ZQlGb9zqvztZ1U
	 Lpln2/DUl0RxAIZboJ3DhvynGjhI9YIPMNreNlT58KwEiXTGV8RGt1dKulXH+mgJCSFPx
	 ADkcu0SvQipQV0wAdj8x1yHO5cL2TLc0PNTeNcPUUD5N3jVaczQ0JahVT1NMNA3UM0Ob0
	 z3n7kUs9l+nY20tUGLsbcMBAwunf//BkBKbSPMUHE/5GYmpKOsZsS/2klKb93UP0sJl+X
	 vSB792Xg2aW3l1aW7oVfhehKX3LgRxhiORhdvjuE5KtG7+HC66aWKXCtMzxKK/GED/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=roF6fkZP;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685A460A382F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 685A460A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=roF6fkZP
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so437742f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576302; x=1795181102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5zaK3r75fyAGpe/N6SPZ8mxSlYoXEgN0WMAWjFhZmTw=;
        b=roF6fkZPNjzgGJzrWiMQXiN2Wc44I2PVmFTUk1FMt0IhuzEsA1Ce0lTzHCozjx8aRi
         rpma8+sS1Rn1oSPpU/DrOq8OwNSxTutItxqVdXzPUd0Y1oro/9RmjwHDJnUZ/rIhsmcq
         qn9+wMBkNbI/+3AWHhne/38UAo0mxSbrT8+zFEKaY4hxOjfZQY4q1ybN0da3RtdpTdbU
         arjIT72BaqTzdgy6gXuIppu7xVGBM5Oiv+VDUgRwNRBPMRYsMgJAN+v7s4gCrAX59i5W
         FPsOLa9yKTtd5B5NYdr7LibVcrZIODo8r9oCKHmOwoAceU6umfpv2ZHgGnKKkSDDDXN3
         ayfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576302; x=1795181102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5zaK3r75fyAGpe/N6SPZ8mxSlYoXEgN0WMAWjFhZmTw=;
        b=Ql9XdAX3IqFhLwSXTupHSf0LkXHPI/AshQFTX2rya828zelKlj7iCyyX8fSmJoMsym
         GpG6y9NIqiJbp9RzKsUZDKEfkgXZChoJzdakgjeM/z+dajsk1MFn25TTK4qKjHmUWV7K
         Zz2TNqIIt/WG1hY4Edgu++yChW98g0imL3i5AUyyZNYB7SVujfmwWVY9zkBhxW+ajDBK
         4wVQWvcMyCdG5dbEQLyLgkxa6SNDhcNaJM5f159HAljppkTFoW9IEfsGtl3ksLoKry56
         3UiOT7KiaTzRhyOf+wj2l+ne/94Oe89FRNw+8g6zgvmkl40BPnTAZvCLM7xtXO7DQCoK
         NPDw==
X-Forwarded-Encrypted: i=1; AL+hErHROwbVUf/xMuWUKFQVLBobnFcwiS/B/EtdKC/hUc/SDn6O+0OYkdfL2VAa5aUk4eNhEo6+rNSH+1+ZRzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/nVDhC2+XK0bfeVbP5Z0cXgGYymulJqGqwlp0jrtdlReEFHtU
	8stz3xin52CDNpWCBkcoQXONe1eA+Mje9AJt6fqhOzuKul2qfKFOlXd7
X-Gm-Gg: AYBFou3bLoTUU6aXJRy7rXSrZxNW+76RvdvDWNZaRrNoVAMVt+tiI3ncXE8H4IsuvQQ
	i7I4xsXRVuq59HeuY5nHEt7PXUbc9NjgZGasrPLKRW0k6M53K1XhbUpwUF4R36AfvsBL7QPX5cd
	029L+EuRl3EZMw2CWwrpQKjpmoRA46lbzU1hg/LMmXOsOwF+ZTfA4SIu8/WCTIxscigskZtHios
	0gX/sll6ET3xSGtj1QZa+9rWwupfmLzBYrmazcOOqW3pZdIry3ko7zKbHR0/bIHCQPBOKdWNDhG
	2A5Y8e6WXkchcztl9Q2wE9WaRmxhZKCJCguURfkt40yhC8cDUL+n6sEqE2Ei/sqO/PTW3Esnvnw
	nJpvoyz/m5aYCckpG9Q7DJ1psl/I4DpXoY0xGHLhS3PJm43evkHDxMQb5zmuogFHyNbmpeCPbRr
	ATBAUlA0F3jLoYGhAS3unUc0X10HDerhr5NRVWQmzA6pQTxN4B2kHhPQo4cu1rGo2eSZVFIUo01
	p23HXLCXife19YAIbh3LLlBU7Ht7/AEndK0FS1w8WtzC1H4aQ7DQ7uGv1iUNcvB7ANCQ96U4Mi0
	2ajSfCIGURF3Dj8OvPAQsy03l4Z7orRumPVwoTmmgHnACrVb78oNJxcGIzt6+SjzTwMeQnmyDU1
	Y5lMNfpQT6NhF4DkeAeUOZXqBG5U+
X-Received: by 2002:a5d:588b:0:b0:49d:8ce1:265b with SMTP id ffacd0b85a97d-49d8ce127f6mr623677f8f.6.1794576301673;
        Fri, 13 Nov 2026 05:25:01 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm4680211f8f.57.2026.11.13.05.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:25:00 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 13 Nov 2026 17:24:43 +0400
Subject: [PATCH v7 4/4] watchdog: vt8500: Add a restart handler
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-vt8500-timer-updates-v7-4-a1dcc4031b12@gmail.com>
References: <20261113-vt8500-timer-updates-v7-0-a1dcc4031b12@gmail.com>
In-Reply-To: <20261113-vt8500-timer-updates-v7-0-a1dcc4031b12@gmail.com>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2820; i=alchark@gmail.com;
 h=from:subject:message-id; bh=OwJrpMobo3ei/jcBwY7ucGlfHptMOi0z7hTygfzHI6M=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR951+4t1B7S1azcYJz5ITif+9trrD0BLrGLV92x9do4
 6RL8kmhHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1YgEjQ8/7/oUK3+bHSH85V2trxP7D6+LsrQf2HjzYytNWtePVtUiGP1wce5d
 wPeN2uJehqMrC/Hk737eHih+fqis25D2tvhRjzgoA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Reset the SoC through the watchdog when the machine's own restart hook
leaves it running: the PMSR write in vt8500_restart() has no effect on
WM8950, so a reboot there ends in "Reboot failed -- System halted"
unless a watchdog armed from userspace happens to fire.

Arm the match a millisecond ahead of the current count, which leaves
ample margin for the register writes to land, then wait for the reset
to assert so that no later handler runs in the meantime. Return 0 if it
never does, or if the match can't be armed at all, to let the remaining
handlers have their turn, as an error would stop the restart chain.

Register at priority 0, the last resort, so that the handler runs only
after the ARM machine restart hook at 128 has failed to reset the SoC.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/watchdog/vt8500-wdt.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wdt.c
index e0f838fd1d50..bde8a5e1a9d4 100644
--- a/drivers/watchdog/vt8500-wdt.c
+++ b/drivers/watchdog/vt8500-wdt.c
@@ -4,6 +4,7 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/bits.h>
 #include <linux/container_of.h>
+#include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -25,6 +26,10 @@
 
 #define VT8500_WDT_DEFAULT_TIMEOUT	30	/* seconds */
 
+/* How far ahead of the current count to arm the match for a restart */
+#define VT8500_WDT_RESTART_TICKS	(VT8500_TIMER_HZ / 1000)	/* 1 ms */
+#define VT8500_WDT_RESTART_WAIT_MS	10
+
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
@@ -75,9 +80,21 @@ static int vt8500_watchdog_stop(struct watchdog_device *wdd)
 	return 0;
 }
 
+static int vt8500_watchdog_restart(struct watchdog_device *wdd,
+				   unsigned long action, void *data)
+{
+	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
+
+	if (!vt8500_watchdog_arm(info, VT8500_WDT_RESTART_TICKS))
+		mdelay(VT8500_WDT_RESTART_WAIT_MS);
+
+	return 0;
+}
+
 static const struct watchdog_ops vt8500_watchdog_ops = {
 	.start			= vt8500_watchdog_start,
 	.stop			= vt8500_watchdog_stop,
+	.restart		= vt8500_watchdog_restart,
 };
 
 static const struct watchdog_info vt8500_watchdog_info = {
@@ -107,6 +124,7 @@ static int vt8500_wdt_probe(struct auxiliary_device *auxdev,
 	info = container_of(auxdev, struct vt8500_wdt_info, auxdev);
 	watchdog_set_drvdata(wdd, info);
 	watchdog_set_nowayout(wdd, nowayout);
+	watchdog_set_restart_priority(wdd, 0);
 
 	/* Let the core feed a watchdog left running, e.g. across kexec */
 	if (readl(info->regbase + VT8500_WDT_EN_REG) & VT8500_WDT_EN)

-- 
2.56.0

