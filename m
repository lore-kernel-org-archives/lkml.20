Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300319;
	b=Wc7PUF6D/UuuecBxX8LJc538gYja+PG9RmmjchGirkpWfVhene/pLMxeYuoveHWccdkb
	 OWxRXHy3+Rd2qoPSR/0++IPjneg4FSR6dtdlAqwfRrWROu3SdSlSBEfQFTnsA5ZqtxRoP
	 49oApSfHEaFkdKkf8Co6hSFylq1ii89+T8s+SMYaGC/k/Gbjara18puIaJW0l2OcExv75
	 LQWcnbmftam2UXdEcFGLaO2y2/RuduZ5gktOxKdQJLogpQ96SgWO5xSDDv94lvHW6rXqc
	 AL15kT76SXeUjVEBe58Yg5y+VUk5Y09uIX0ipK3+zVUXyaNODQdYLAN4atNsvIrnDlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=XE6ycAnMXu1bQU/ooZUSiqmjYw2pSbI0uNI5n7hv+8Y=;
	b=q+qkg8K6Za2mTZBkh7No05S5twsHeNWUSgiW2Fo5taJccCFSBcO6J1mLiFf3mxtke4yc
	 yh/FTirKKOyqSLm0pAuY9J7+Mhk0bjsftqN11jxLH0sK2yqbY/b/fEzKmPydKRTMQzU8C
	 8xpFEhTBIehhyw04D4FU5DA6jq9CyeaD1sA1KZQX3nKW9ADfMlhpmBkOW8/zVdx/57xLp
	 sDCxdNA0Fz376Fe7MOz3F82s3ZzZxpSVeIgAg5Mk2QcV3HZyeqV36N5t7xZB0LjRBXzSR
	 n68imXiwJuZF8gfpq8rSttl8Q8TP6lyQR8tlcl/zczhC+xUedhMhduMVi2s09SriKAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SHGEAkqW;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1C860A2620
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED1C860A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SHGEAkqW
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-14394530ec6so2892731c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300313; x=1793905113; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XE6ycAnMXu1bQU/ooZUSiqmjYw2pSbI0uNI5n7hv+8Y=;
        b=SHGEAkqWPsT/YfAZqG1IaYNh/Bv6h62Oq9yHdJ8L3qMsjd8lyuM6qKjkLlqT4UXNS7
         Zf2sxePWISw+KvpcI8uv0soEzjR0e7DgqtAgGBvBNy8BkwFdwIPEuOOT/AMyMFllBvlF
         uvZu8/0tVUifVKo8chRZuPqM4Gj61Y38pa4LAKzBrjIUZ1F+YLgDp0ccem0OPDXwGMqQ
         6aGV6/TSroLOdjc6GQNYgpYWheQgsQaPv5aAvGr7lN5D4RkZhy23kBtQXQGNza2Kwe2e
         4LyD3LGciVw+u0+MLIPxrr2hyk2viQfhvu/jCJaQUYi+ea0FMCROZBh1rXsr20Lhmb58
         NPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300313; x=1793905113;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XE6ycAnMXu1bQU/ooZUSiqmjYw2pSbI0uNI5n7hv+8Y=;
        b=iQ59oPKGiMq3AMfgGwQZTaz/a6ktedLPx81bYuGGddIfbVMsTeDjhcNcT1G9X1l5vp
         XhbDGVAwosoOss0q4hn0Xe2gd7wbQ0UdUR0yWatOsT8AxUzwwHC70VjF00xbw4tuLv6B
         YHqAaC7T33QFt9yNSjDku/cgvpqpf30vobBT/kFw8dfj+DNM5GDmcmJzBrYKhqh7vnEn
         XFBXGRkhyo/kKUiVu7Ei+u6h5hdHqpk2ndyM8DEwnQ3/t6WGuTnRAt46IZ2ZM7QWsVbD
         spDVvnmyfL6Ap0otEmTMb3nSSOCtt3XLDWKTgTFWw4AMugoiYOS0JlVP75uQsnQnHO72
         +cqw==
X-Forwarded-Encrypted: i=1; AKwUvBzdEVTNxYNOmtTL4amUZ5wv/QcH/yjNzfhldRYRcJp3kmxWKGWpvzgSivdHPBLEeSdKK75ur6ovVyCENkM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvUGHa7dlMC+WHD0cxev3XF81fMn+oO45cet5sdCdDZgFo8oKM
	oT5Hnnt9VAxNvWNTir+6G5r3it8tpQSmR0LSmFcPVq1HUSBFBa4Xztzt
X-Gm-Gg: AYBFou0BQMV894D3HWyHfmqsXZ46iyNDzdd7FHJ3m0G2Et00PbCNtIPQ7BQj33jPmp4
	GJIrQQerXdz9q8iGRquaUr0lrOfLzLgqJ4RSJklGlGR4uJANbe0j89hPuMoAY8XgloywRCHxB4O
	K8ExC+3+fN6b5EF9WSuONfXKO4izPjn/IuPwT8K/6F5J8bjVYxsjmTItXuWbeZPp3bH8Ulw1+oq
	Rk3+8Q0EvX11ZJ7k/wsbUIBr/rreNXrpB9FzcYysowWbeT4f+/ORYWYcani4q4M97E4gdh8yn+z
	BAnPTlIu5suHMpdtYZzHjfInj0hCVIFBfsu93LB3EyAjqKyYYwVQgKT30YSW2e08MXxPqygDccd
	Gk8ZdHxz8JGcrlYm5VB6e8W6pJYEfTkEfHJpBaa5XlpMUYajQXd0es9YkONnEp2qwVPHuiuUhKR
	YVxYUSJ+R8IGDdYC9JMZD2FaiZf4Dp5XeXee3NqLxXQ42u1fgNWh9GB07Gz8ZXu+ELyeqlMcrje
	EC1wHSdRUUnzeXwb+R1AMe+d2DifQktfO6R81hQaobzGERk5ojV2RAn4akyNOgKr1eV2PYjstxD
	vn8iNYo9iOn8sgJXZTCiyTuejw36QHhS5wSYA/xKxIjt1GIQMEpj1V0LH6G8yeomXtMfnMCQFpt
	89/IomgSYV6mzSb8LPw==
X-Received: by 2002:a05:701b:4589:b0:14b:cf58:ce15 with SMTP id a92af1059eb24-1a6d208add6mr7430450c88.43.1793300312786;
        Thu, 29 Oct 2026 11:58:32 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8310:80a5:1043:3f70])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458fa3sm603891c88.4.2026.10.29.11.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:58:30 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 29 Oct 2026 11:58:15 -0700
Subject: [PATCH] gpio: sa1100: defer GPIO chip registration to
 postcore_initcall
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
Message-Id: <20261029-sa1100-swnode-fix-v1-1-112f4d83d191@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEaX42oC/yXMywqDMBCF4VeRWTuQSYsSX6W4SHS000WUjJeC+
 O5NdfkdOP8ByklYoSkOSLyJyhQzqCyge/s4MkqfDdbYiox1qJ7IGNQ9Tj3jIF8kejpX04ND7SH
 /5sR5vpqv9rau4cPd8g/Bef4AD6TQWXUAAAA=
X-Change-ID: 20261029-sa1100-swnode-fix-11499713eb7a
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Guenter Roeck <linux@roeck-us.net>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Registering the software node and the GPIO chip for the SA-1100 GPIO
controller during early IRQ initialization causes boot hangs on
SA-1100 platforms because the software node subsystem has not yet
been initialized. At that early boot stage, attempting to register
software nodes dereferences a NULL kset pointer before console or
driver model initialization.

Nothing on SA-1100 platforms requests GPIO lines via gpiolib during
early boot before initcalls run; only the GPIO IRQ controller and
domain must be initialized during init_IRQ(). Defer registering the
software node, assigning its firmware node, and registering the GPIO
chip with gpiolib to postcore_initcall, running after driver and
gpiolib device initialization and before board consumers register.

Fixes: e4671f292ebb ("gpio: sa1100: register software node for GPIO controller")
Cc: stable@vger.kernel.org
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/r/2a561a27-a3bf-4cac-a4dc-bfbc5c859f45@roeck-us.net
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpio-sa1100.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index e4f3bf949b87..1916200ebbd5 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -8,6 +8,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/io.h>
+#include <linux/printk.h>
 #include <linux/syscore_ops.h>
 #include <soc/sa1100/pwer.h>
 #include <mach/hardware.h>
@@ -322,7 +323,6 @@ static const int sa1100_gpio_irqs[] __initconst = {
 void __init sa1100_init_gpio(void)
 {
 	struct sa1100_gpio_chip *sgc = &sa1100_gpio_chip;
-	struct gpio_chip *gc = &sgc->chip;
 	int i;
 
 	/* clear all GPIO edge detects */
@@ -330,10 +330,6 @@ void __init sa1100_init_gpio(void)
 	writel_relaxed(0, sgc->membase + R_GRER);
 	writel_relaxed(-1, sgc->membase + R_GEDR);
 
-	software_node_register(&sa1100_gpiochip_node);
-	gc->fwnode = software_node_fwnode(&sa1100_gpiochip_node);
-	gpiochip_add_data(gc, NULL);
-
 	sa1100_gpio_irqdomain = irq_domain_create_simple(NULL,
 			28, IRQ_GPIO0,
 			&sa1100_gpio_irqdomain_ops, sgc);
@@ -342,3 +338,29 @@ void __init sa1100_init_gpio(void)
 		irq_set_chained_handler_and_data(sa1100_gpio_irqs[i],
 						 sa1100_gpio_handler, sgc);
 }
+
+static int __init sa1100_gpio_init_chip(void)
+{
+	struct gpio_chip *gc = &sa1100_gpio_chip.chip;
+	int error;
+
+	error = software_node_register(&sa1100_gpiochip_node);
+	if (error) {
+		pr_err("failed to register sa1100 gpiochip software node: %d\n",
+		       error);
+		return error;
+	}
+
+	gc->fwnode = software_node_fwnode(&sa1100_gpiochip_node);
+
+	error = gpiochip_add_data(gc, NULL);
+	if (error) {
+		pr_err("failed to add sa1100 gpiochip: %d\n", error);
+		gc->fwnode = NULL;
+		software_node_unregister(&sa1100_gpiochip_node);
+		return error;
+	}
+
+	return 0;
+}
+postcore_initcall(sa1100_gpio_init_chip);

---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261029-sa1100-swnode-fix-11499713eb7a

Thanks.

-- 
Dmitry

