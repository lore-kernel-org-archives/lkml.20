Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8755748123E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524312; cv=none; b=Qcl1AtDFocCC7H0U/6PT89dL+rEArdJX5GLSN9FB4LCcmE+Mf9irDEnA5I15/p6lWn+JDUmomDYEo+XmTVlXm37kCSxjfDgkNSxjoE1izmw+9IISyzvpHPgNmTjQZ2RpoY/+GwIgyZ4sS+2l4Ba4IaQ2jNiGs1JfMMBk9SiklUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524312; c=relaxed/simple;
	bh=V8XZTle0sIbvGn2TtClR0EKCbfw429H/jwAMPYSfJwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cZ92vux6AT3Z5TvHzGwC4UdulrRaF6J0CNG9opO224ZeGzz5oIDa4RkuRCz+Zeus4SVnQnba0jNQGCmIwlYxReDJxMHcLq+lp11A/p/q1ERdW/zfrqosdeKXm4uxVrcQD+exGoZ7O89UzOKiqIRsexQdIARefLwUEPVW/c472I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICPYN804; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICPYN804"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso14905995e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524308; x=1789129108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ydjw49DZM6ZNER4g2lcExI1LMpGhnZwTfnwbU+34mY=;
        b=ICPYN804Hdk0I88fKndLH8e+suzOJgIN2wFWBrOkCauSqfzTlfQiYaFBX/d13Fw83w
         klNcR9mzDWpajKq23y2n/ua6/jpMgnAygqpavNfRGHbKsQqmTmnOaGM39ryQbuW/JtUG
         X1+A+6nIKAqMcdnlcy6C4OIOk+UfWWcenEy4aZYw1UBp8WIAu2wfmyme3nPbdH/Q26TU
         clNJ8FYuE/wCywh8+N87EXxxmIYXTFuy6PkBtU1jA93wSk+wXxP9TIomZKE17i/+BRM4
         3CAyDohiuj7oXGgh9R1SjRDtkbfbDhpCJ1qg5OYaOR0AH9ZsX15hHN+kKtPsQFToHipU
         0yiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524308; x=1789129108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ydjw49DZM6ZNER4g2lcExI1LMpGhnZwTfnwbU+34mY=;
        b=WFSm1DE9+syMK87Fro3D1WczJAdHj8kRBDuGzbZZqypepF+ybkuKOgkXHpjqV6fL55
         3ztcQ7hOfKylJNQMvPYaAGwqtlouN2koBUBzWHnsqBiYVSrnybdxSMFGTEalC9LSKyLP
         p5it+jYvv+zeQEO4tbxs658U2NEzoOdbB46rdimNA+PJ/dWvY57GX/BWk/TyJxXcp4Yj
         +WjRa0jX2V/Ef7Ni0Lz3JB0LOuVJAPwX9VOZ+CzecmUcsyJDglpL7WnDx+Uq+p1+dogQ
         7HklmaGaEXfvuZlMsDHJfCok9XtA65niRZMQyKqNVvKkm3z9K2xMoRireOoAw3kzW7iD
         ChtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoz7TJbaMpo9KnUfoXgoO7NgqWfO7e1eIDcx+sXEbeuBWONPlpLjQdYtqOe1UeUiFfp7R5LC5Q54Z7vYY=@vger.kernel.org
X-Gm-Message-State: AFuF++n2VST7/9DWLFpK8/jb4St90CAv6Fwt4FJi8TRJuvxujjYnzDUc
	IogwWr6cDbAstvD28w6muxo/jpqcfDkj+5SqwQaGGYXokEYckcqQ951b
X-Gm-Gg: AYBFou2nEsVQk7MexNIrX9BmAx2T4pM5dxMoS0R+bDZXgJJZ/17a2x7Ktg4M9B3Phx4
	JmXPQgmu8YkwlDMxuIldPWSRU0N8ZxlEnqzQOs+T7pF7hZIe15Z9Sp8L9xYJH+xg7BfIz1kMkYA
	Zpn55uYQK8ptpBQDoxnmoGG6jpCmioDgCuSf8sJDw2f72m8lX/xauGEotSaWY6nMR/dY/Z6ZaHv
	RWEefx0bvOFEYhShPjjYOSc1MOl+gW2hAzqOjJvjia5mmoYfEOzXu9UWeoWpNI1v+do02cb0OX4
	qMyvHzbzE8enYgf+/8bQa/s8O80SPZYgV1u5VPwL8od9uY1JhUnZLAbujBKQoS3rFJKol9/+DK9
	ZzyFd7liZzA9m8HCMvciXH4KaLTprcPSsMsyddmw583sAYh6JQo/XmCeyPSgDdn/Aj4WoqiMofQ
	W3t4SO2GONMXkyTs+FF2VQ8v+gDN9SFmadI/xVBCUphqv6rAjhpURfsVD5O8VeWJbPM+/ki0oQp
	ypboXrrT/bSihKrKQENA3hoesoe8pfhibU4AVd4FuOMfRcvV8yyPYQJ4oPTDz0i
X-Received: by 2002:a05:600c:8b8c:b0:49c:f13e:e52 with SMTP id 5b1f17b1804b1-49cf893b58bmr41215435e9.15.1788524308369;
        Fri, 04 Sep 2026 05:18:28 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm20697355e9.4.2026.09.04.05.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:18:27 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: linux@armlinux.org.uk,
	dvorkin@tibbo.com,
	wellslutw@gmail.com,
	linusw@kernel.org
Cc: arnd@arndb.de,
	afd@ti.com,
	aaro.koskinen@iki.fi,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] pinctrl: fix PINCTRL_SPPCTL=m
Date: Fri,  4 Sep 2026 13:18:25 +0100
Message-ID: <20260904121825.43320-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PINCTRL_SPPCTL option is defined as a tristate in Kconfig, and the
help text suggests that the user can build it as a module by setting to
'm'.

However, it cannot currently be set to 'm', because SOC_SP7021, the only
platform that supports it, is a bool option that uses 'select' on it.

To allow users to actually set PINCTRL_SPPCTL=m, let's remove the select
from the SOC_SP7021 option, and instead have PINCTRL_SPPCTL default to y
when SOC_SP7021=y, then users can configure PINCTRL_SPPCTL=m in the
kconfig frontend if desired.

Note that I have only compile-tested this change, since I do not have the
hardware to runtime-test it. Please advise if it would be better to change
PINCTRL_SPPCTL to 'bool' and remove the help text suggesting that it can
be set to 'm'.

This impossible tristate was detected by kconfirm, a static analysis tool
for Kconfig.

Fixes: aa74c44be19c ("pinctrl: Add driver for Sunplus SP7021")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 arch/arm/Kconfig.platforms       | 1 -
 drivers/pinctrl/sunplus/Kconfig  | 3 ++-
 drivers/pinctrl/sunplus/sppctl.c | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/Kconfig.platforms b/arch/arm/Kconfig.platforms
index 2e118b65f93b..dc880addadc5 100644
--- a/arch/arm/Kconfig.platforms
+++ b/arch/arm/Kconfig.platforms
@@ -177,7 +177,6 @@ config SOC_SP7021
 	select ARM_GIC
 	select ARM_PSCI
 	select PINCTRL
-	select PINCTRL_SPPCTL
 	select SERIAL_SUNPLUS if TTY
 	select SERIAL_SUNPLUS_CONSOLE if TTY
 	help
diff --git a/drivers/pinctrl/sunplus/Kconfig b/drivers/pinctrl/sunplus/Kconfig
index 69f82590f6d2..7719838b39b6 100644
--- a/drivers/pinctrl/sunplus/Kconfig
+++ b/drivers/pinctrl/sunplus/Kconfig
@@ -5,7 +5,8 @@
 
 config PINCTRL_SPPCTL
 	tristate "Sunplus SP7021 PinMux and GPIO driver"
-	depends on SOC_SP7021
+	default SOC_SP7021
+	depends on SOC_SP7021 || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
diff --git a/drivers/pinctrl/sunplus/sppctl.c b/drivers/pinctrl/sunplus/sppctl.c
index 67e036d66245..89c6e2e92f07 100644
--- a/drivers/pinctrl/sunplus/sppctl.c
+++ b/drivers/pinctrl/sunplus/sppctl.c
@@ -1113,6 +1113,7 @@ static const struct of_device_id sppctl_match_table[] = {
 	{ .compatible = "sunplus,sp7021-pctl" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, sppctl_match_table);
 
 static struct platform_driver sppctl_pinctrl_driver = {
 	.driver = {
@@ -1121,7 +1122,7 @@ static struct platform_driver sppctl_pinctrl_driver = {
 	},
 	.probe  = sppctl_probe,
 };
-builtin_platform_driver(sppctl_pinctrl_driver)
+module_platform_driver(sppctl_pinctrl_driver);
 
 MODULE_AUTHOR("Dvorkin Dmitry <dvorkin@tibbo.com>");
 MODULE_AUTHOR("Wells Lu <wellslutw@gmail.com>");
-- 
2.55.0

