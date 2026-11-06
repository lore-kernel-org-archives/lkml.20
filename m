Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985693;
	b=SN+tgpYHaOUTIEBT39veqKHpE6quUNP9cviWsrPVckfoL7nqLkZWSf2WvTKB8ZzJSlSy
	 3awOUI3orxYTroXkp2n7rQqIyGH0gGFPMGuxkON7IjUxfTNHb5cQKGvjBAFNMRKaFxxm3
	 Yjz0iF/WdFzex86y5J7hHAPK5c++/cNEskC+rviAEo4HEVTGSlB28vMuddBndD1tlgnjB
	 +nHU7PmCjP7HswwAZU+5KA5e1sb8dTATdjqlumPFXAOsE7O/Hj9BT0MPB2MRbwltey9z3
	 0iDwvq/aMBflve96emX7g9cEdrdT2ju4t9P2Tu+uXYvgZeYirBlM6ZeY660DLoNF5/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aNbq2rk41FUTgdli5n1bqp7QxFkeC+oD6L0hTPhyCB4=;
	b=AB7PzzoNYIH4zThRMRv4Z7Eu6CRablABv8fRidrtFpl41GO3T5Ho8ta91uMoRtY6ROji
	 n48WZFav0ReWzX6xeOe6hMybeprf2YoI626yoIEhX4wIEYz49XzOT3ZMrW+Wl6DFuxPdT
	 mQ8tHQsxduy4/xNNWZ+sUWrsNH5zwHqP0hzK/nnqyJZvjsPWmmGEK7zl9xVt8CEJv19Rf
	 +iDbjNO59kf4R6ThDBEmUuR8oT8+wdZ/6I3jZWRY3XJsbhS3pJTcuzisnBDWQxpbM8CO5
	 8S8mgOXbdRbCgIKczljbfY4uOFYfiiuOiLPWUDIzpH5J5wYzZ1V9CfwqdJqxjf24krg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KPSK3vu5;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03B0606D816
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C03B0606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KPSK3vu5
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so6998405e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985691; x=1794590491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNbq2rk41FUTgdli5n1bqp7QxFkeC+oD6L0hTPhyCB4=;
        b=KPSK3vu5qyyHRx+VS/Tc6SJFsl/yZn0bi7sitrQz/YxI560ouxsz9GxAhWpIkuY+Zy
         aopIsr7tLilf54837NPnLLYjlEdg2mXYi0WYVJl4Z9KQQyDMeexVcByJeWvw+vyfRfDQ
         s5z2Q1SUyFuiAiIrlqAJZEmM9WEzaT3Z0T/3JwdCSV/Za0oiLl0ddT75Uy7Z0Ye8Q9cB
         UK2mZxPW0b2jzkPXsEGzCAvJQHynq4ELaedIMzv3vLVm2/8ObPex2VOkcOmvv/6X1x3X
         48CRiBtsM04HnpxGlrc9KrZ4Rek8OVgEeisrrfvWzVXn19nwdxixX0+e3Ws8CwPebEjZ
         MsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985691; x=1794590491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aNbq2rk41FUTgdli5n1bqp7QxFkeC+oD6L0hTPhyCB4=;
        b=Qc0YSRV5IfL0Mlge6p5kLr0MtNPG7XqtEsKlneGASnTI8KRf+JKQIiF9ouYnI5L2sR
         5PLn8X3R8K58jLsAGdVclxWgjyH4zBEDy6xHBtmwJokROE6pGUcQiPWqQJMP4NsnqxGf
         BerASEHz92Qxsk6veL3Yg66GVvouyEwGtMgiLGzuJrzqRpvIe+YhqEDU0QzRGyGeS6VF
         XgkHrAp9aHQL1YZIz5tLZrmvawdMizTZHEz3Mr4wok1q8JKtAX9TLxWlc1e7V3iqLZs5
         UcTwM7Zw6bAz5gtwc/z2l/UZoI45rIrGwOBYrku3Dow2ZnBE2eRFCiGqAFlXXWFTPTRE
         FZ4g==
X-Forwarded-Encrypted: i=1; AKwUvBwtCSR97QoN4zHHrj5vcjzFVtdU28ledt2aucIuysz3OLfrIOcIL1ps6w+PD7e37l/2d8fJbXjZU25qqCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w4XKvIoU2Hq43dJZI7X4HCdNK33sLv/a35AM/QRg4OIvTHB5a
	TeybQXsxIR2EADFsbZOOw8VFt1yxiFmhyNjs9h1S12gsNJsbpZITJx22NgeYs4vqQlc=
X-Gm-Gg: AYBFou22jGr0EpmlgLmPjY7BQz9ZlbpZQGT3oXM+SdBMLOm+p/kw/+JjxCesXyaqrgd
	ycYbWU93xsjqwtpOOWcj3nwTk5YwL3dMJA5EquYN67gbFlbSlZECS3+HzUFUu705M8Vbzz2iEeU
	1jboGFCdfLaCvdFYrtcAQtFStb7hDH9Q6TtS/fzMYn+7txEbWZnFBJZRcF6WeSJr7CnbAtxUBC5
	7ARTgMvXnr7Ku78xj4Va0XU5fFPz03j7MmEK6LcXg3rZSaTE1GA/pWRN037tx3RaF4+yTypm9wi
	URA+XIz/qCuT2lcEWo5kEU2Uk2gDgRyeFV+M6qSD1aKRquFi9b8MR6S4sMOSC0qG1LUZDdK+vOG
	pmWRpO4WXI5Mm+GdnXz25uu41JlFyzTcyPZo60LurofMfOa9ureduAkk+TZQko9Z+lYjIV4+X9X
	2R+/BtOAA8q5ty3xv7xt1Jwd0/J+Zwqr1cXIEWtT/howelnltsz9E6falsHUQhp2lxXoQDNF/Xx
	Zsoltalii/qs8FHMW3dW7h4jemiSWzFPkjDyJIanwLXapdRq/NkNyufI44PdZ3xzAc+Wqq45axo
	E8PiPFWV8p/DccwLJDUizZWIGEtd+S91
X-Received: by 2002:a05:600c:8885:b0:4a3:2f35:38aa with SMTP id 5b1f17b1804b1-4b6e007bf2emr45387165e9.29.1793985691171;
        Fri, 06 Nov 2026 09:21:31 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e28cce1fsm86878005e9.15.2026.11.06.09.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:21:30 -0800 (PST)
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
Subject: [PATCH v6 06/16] printk: Prefer the console either via name or devname exclusively
Date: Fri,  6 Nov 2026 18:19:42 +0100
Message-ID: <20261106171952.207909-7-pmladek@suse.com>
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

The commit 7640f1a44eba ("printk: Add
match_devname_and_update_preferred_console()") added the possibility
to prefer a console driver via device name. The name of the console driver
gets assigned when the device gets initialized and it tries whether
it is eligible for a console.

The above mentioned commit ensures that __add_preferred_console() is called
at least with name or devname value. But it does not check whether
both are defined which is a nonsense.

Add the check and do not fail quietly. Also shuffle the code a bit
to make it ready for adding more checks.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 6bba67e142e1..d082169a8615 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2561,6 +2561,12 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  * in register_console(). Finally, it enforces some rules:
  *
  *   1. Do not accept empty @name or @devname.
+ *
+ *   2. Either @name OR @devname are allowed. [*]
+ *
+ *  [*] A valid @name and @idx will get assigned for a devname later when
+ *	@devname matches during the device initialization, see
+ *	match_devname_and_update_preferred_console().
  */
 static int add_or_update_preferred_console(unsigned int i,
 					   const char *name, const short idx,
@@ -2595,11 +2601,23 @@ static int add_or_update_preferred_console(unsigned int i,
 	if (!pc->name[0] && !pc->devname[0])
 		is_new_entry = true;
 
-	if (is_new_entry) {
-		if (devname)
-			strscpy(pc->devname, devname);
-		if (name)
-			strscpy(pc->name, name);
+	if (is_new_entry && devname) {
+		/*
+		 * A valid console name and index will get assigned when
+		 * a matching device gets registered.
+		 */
+		if (name) {
+			pr_err("Adding a preferred console devname with a hard-coded console name: %s, %s\n",
+			       devname, name);
+			return -EINVAL;
+		}
+
+		strscpy(pc->devname, devname);
+		pc->index = idx;
+	}
+
+	if (is_new_entry && name) {
+		strscpy(pc->name, name);
 		pc->index = idx;
 	}
 
-- 
2.56.0

