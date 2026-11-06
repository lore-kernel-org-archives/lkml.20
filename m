Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793936181;
	b=xQ9VnZEA34l20DlroH75FJC+fZ/wQFE0+Cb8mcd+MDTvCZ547cojiESFxt2q5UvdfPtZ
	 qVoiC+zotKqNZP/rfn2O2DKOhg+97pPcLB0Br8ia+iJiQY9MNlqkHd6g7uXtYaYgWYdH3
	 Z4GztcIJ4BlX/RmOM+Q+JjiY6KGkJm25evnWUYiAJ71pgidLNkYjIiP4d0RXANy6qqIaQ
	 5xpCUQR7MvH8bsnAhiNs3HerjTSmCzTSnYeFe2RzXCLJPISjUlJdNydoE4cpw/frKs/JN
	 osYRTKxN0sLSslEWfc7ofDDXvMIqx2p2dez3BEYBRt3KubSoMkRnLW53TAZaSDW6E9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793936181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=E5FA49RIUKI5pAc/vSoRJNZK3KKi94i7VkyLkvvMsy0=;
	b=lbYuu/73VzVjckl0LWuE1uu8pRp2+ZiYMDFA4njwy6+io44u10us3qQfNbAWHZV62vlr
	 QJMW1Jsx4zJWei1yjuWl5p9G31RLaeWz6C0S90WkOyf4JniE8pwpE9VvovFgjI8Jz65tl
	 dOsZVhZhuF+C9nNOqwTliyiwWyOy+VJbnd3i8tIq5PnMoD9srZeU6TxOm6+H+ltFc5zHn
	 Qau/cyiEft5W0v5F40psJvVGlJFsOoXSeCF7+dJhvmibvsvgsnBVc3HD8Axt/J1V1idW7
	 TQY3fmxUeZH4vVDGtFc+apnPX/CI/cEWLngZkKmRXoLKutgzmagEXoq6TYdmCb7Kr4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=reh9sDA8;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BF4606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4BF4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=reh9sDA8
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06454116eso75681b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793936180; x=1794540980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E5FA49RIUKI5pAc/vSoRJNZK3KKi94i7VkyLkvvMsy0=;
        b=reh9sDA8skVuB8ifvOKyxlE3HoJTcVoo/tDtoYHnycFdBxv6CRB94CUwvH9nL8+Iv5
         33p0AQeC76pm2/qf26yIrECs6tASfBd9ZHC0532HKU43Av4IG/sPHMtNiW+fvDlZkKv4
         5bM4kkWo4GqjSnl+GdvxmhkKcqwUq8VpORauCN25gZYBW0cmGP7wyHB0hOjDsIAIvO7R
         ZW9/8QFST1X5tBMlNHXI9kk8H/uO776qxoDbr6GA8KpOrEQPqQjpVfv3PqYO4n3ErE33
         FEx3a6Iy0xEYswHOPx1yNquDP7Y3wn85lRN2Vlm8xN1XyfnJcmgN03kUkEZt9RBEeGDl
         5HSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793936180; x=1794540980;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5FA49RIUKI5pAc/vSoRJNZK3KKi94i7VkyLkvvMsy0=;
        b=jkYuyuMMImvrZmbuBjl5OapTYIy/v29cwpeibMq15hMUDHVgmZPPuVBLgGA2LqvBHq
         GZvf/FB7Lu0au6xx0ZLgg92NSd9hR11TGWQakBpLqNFhkLi/kV+rV7vSogsrtCWUz33W
         9IHJ3GObzmIZqMuqdFJqG64LG85UDTQEducxeJ57G3dVy1LjZ1bqx6KGhaxDB6b4Sf/L
         Mr+XcyccOYU/iGXmO1c4Jo5k1OZehzyhDrqM2uJ8h1l0fjILkaColn+hhpaL7ZxDVct9
         M7lMh9AX16aaEUwVsaXc9lnkW8FK7hfUkoZ/TYM+kT+L8OaFpWc5IZXuUKlS1d12WNVZ
         7Pig==
X-Forwarded-Encrypted: i=1; AKwUvBzHXfVO/sUdEj5aQ2ptFYPXtBnHc2m0blQPv4/IEJG4CXR0OzDaRbM6+MxAcMpmD9C0ynKev2O3UYSBsho=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iH9q6LvZPPYjyT9C0N87tPnC2VCk3SZK+quS+5bK6eAuUVFnX
	qqTsTgspQ+G+I0AshBNrkQeA5HKB+tMl11oWMGgIN9ZUNVVjyToUJqIG
X-Gm-Gg: AYBFou0RjH7k6/JFp01KN+9LioA5uCAA4+AELxZHBd2FPxIjn7X5mFTcn/t//PJzV6H
	daTnygyMZkV/xvrah8Lw9WdDphHr1XfMx4G+q6aga+Iku7EtnbaFuf/5iKNcGZzXp3Mb2hJT4LE
	7RAApObgGm9pQcIP6Up8DQiKklX+FbjUv2IoCNJFF/HYkgAMXdNGqY+ONFczwP94YLc6QDt3nK6
	mltHJVxAYYNv+bp2uEkxAssqJfITxvdloZ00oT3KfIZohCuNubEZ8v0TgdzpcZRqvijRWGuogeT
	r4GgIMeB4EIj6ITrL19M7AtoTi3tE1LHk8OTULgAdPs2gDd8IVU1e6zFsGhZKFNNZbzuB0aingf
	cpxXIsvXY1YKrBWLAAkt0zGYtkF5rVevOmUkG5ESReZ28dL01DR1AFvagAqKnHkxHlyCmeE+ki6
	RAVrJwejLasEsPckQVw+QHnZ+IafA9zDsE6ay7US3HMGBTmSO9KGmhpHb0iODpBUg5gGU2pg/4s
	MI2TqPt5gXgkc+zdW1RPhPNY0cEp//x/We5JFyHG53isr0m2PFpQXFyLb8hALEtNQeC9hAq/tkd
	F8wKyGyJqIPelTxlGX4IeUWNJfFOP2egdtnJ0COD/rbglLvwe7BJ1pTakN1aWdTSAQ==
X-Received: by 2002:a05:6a00:ac2:b0:89e:8242:f35f with SMTP id d2e1a72fcca58-8b37aaa23bcmr1180100b3a.13.1793936179768;
        Thu, 05 Nov 2026 19:36:19 -0800 (PST)
Received: from localhost.. (59-124-112-186.hinet-ip.hinet.net. [59.124.112.186])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597ef3d1sm211248b3a.22.2026.11.05.19.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:36:19 -0800 (PST)
From: chipang_kao <prozac2734@gmail.com>
X-Google-Original-From: chipang_kao <chipang_kao@asus.com>
To: ilpo.jarvinen@linux.intel.com
Cc: W_Armin@gmx.de,
	corentin.chary@gmail.com,
	denis.benato@linux.dev,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org,
	prozac2734@gmail.com,
	scardracs@disroot.org,
	chipang_kao <chipang_kao@asus.com>
Subject: [PATCH v4] platform/asus: Move ASUS platform drivers out of drivers/platform/x86
Date: Fri,  6 Nov 2026 11:35:52 +0800
Message-ID: <20261106033553.12411-1-chipang_kao@asus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4c78b25c-0873-d6a9-2672-67eacff3c29a@linux.intel.com>
References: <4c78b25c-0873-d6a9-2672-67eacff3c29a@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ASUS WMI and related platform drivers currently reside under
drivers/platform/x86/. However, with the emergence of ARM64 devices
utilizing ACPI WMI interfaces, maintaining these drivers exclusively
under x86 creates unnecessary architectural restrictions and Kconfig
duplications.

To allow non-x86 architectures (such as ARM64) to select and build
the applicable ASUS platform drivers:
1. Relocate all ASUS platform drivers and headers from
   drivers/platform/x86/ to drivers/platform/asus/.
2. Create dedicated Kconfig and Makefile under drivers/platform/asus/.
3. Update drivers/platform/x86/Kconfig to remove duplicated entries.

Signed-off-by: chipang_kao <chipang_kao@asus.com>
---
Changes in v4:
- Move all ASUS platform drivers and headers from
  drivers/platform/x86/ to drivers/platform/asus/.
- Add a dedicated Kconfig and Makefile under drivers/platform/asus/.
- Keep x86-specific drivers under the X86_PLATFORM_DEVICES
  dependency.
- Move ASUS_WMI, ASUS_NB_WMI, and ASUS_ARMOURY outside the
  X86_PLATFORM_DEVICES dependency to allow them to be selected on
  non-x86 architectures such as ARM64.
- Update drivers/platform/Kconfig, drivers/platform/Makefile, and
  MAINTAINERS for the new location.

 MAINTAINERS                                   |   8 +-
 drivers/platform/Kconfig                      |   2 +
 drivers/platform/Makefile                     |   1 +
 drivers/platform/asus/Kconfig                 | 163 ++++++++++++++++++
 drivers/platform/asus/Makefile                |  15 ++
 drivers/platform/{x86 => asus}/asus-armoury.c |   0
 drivers/platform/{x86 => asus}/asus-armoury.h |   0
 drivers/platform/{x86 => asus}/asus-laptop.c  |   0
 drivers/platform/{x86 => asus}/asus-nb-wmi.c  |   0
 .../platform/{x86 => asus}/asus-tf103c-dock.c |   0
 .../platform/{x86 => asus}/asus-wireless.c    |   0
 drivers/platform/{x86 => asus}/asus-wmi.c     |   0
 drivers/platform/{x86 => asus}/asus-wmi.h     |   0
 drivers/platform/{x86 => asus}/eeepc-laptop.c |   0
 drivers/platform/{x86 => asus}/eeepc-wmi.c    |   0
 drivers/platform/x86/Kconfig                  | 152 ----------------
 drivers/platform/x86/Makefile                 |  10 --
 17 files changed, 185 insertions(+), 166 deletions(-)
 create mode 100644 drivers/platform/asus/Kconfig
 create mode 100644 drivers/platform/asus/Makefile
 rename drivers/platform/{x86 => asus}/asus-armoury.c (100%)
 rename drivers/platform/{x86 => asus}/asus-armoury.h (100%)
 rename drivers/platform/{x86 => asus}/asus-laptop.c (100%)
 rename drivers/platform/{x86 => asus}/asus-nb-wmi.c (100%)
 rename drivers/platform/{x86 => asus}/asus-tf103c-dock.c (100%)
 rename drivers/platform/{x86 => asus}/asus-wireless.c (100%)
 rename drivers/platform/{x86 => asus}/asus-wmi.c (100%)
 rename drivers/platform/{x86 => asus}/asus-wmi.h (100%)
 rename drivers/platform/{x86 => asus}/eeepc-laptop.c (100%)
 rename drivers/platform/{x86 => asus}/eeepc-wmi.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..832d2528be10 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4226,15 +4226,15 @@ M:	Denis Benato <denis.benato@linux.dev>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 W:	https://asus-linux.org/
-F:	drivers/platform/x86/asus*.c
-F:	drivers/platform/x86/eeepc*.c
+F:	drivers/platform/asus/asus*.c
+F:	drivers/platform/asus/eeepc*.c
 
 ASUS TF103C DOCK DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
-F:	drivers/platform/x86/asus-tf103c-dock.c
+F:	drivers/platform/asus/asus-tf103c-dock.c
 
 ASUS ROG RYUJIN AIO HARDWARE MONITOR DRIVER
 M:	Aleksa Savic <savicaleksa83@gmail.com>
@@ -4246,7 +4246,7 @@ ASUS WIRELESS RADIO CONTROL DRIVER
 M:	João Paulo Rechi Vita <jprvita@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/asus-wireless.c
+F:	drivers/platform/asus/asus-wireless.c
 
 ASUS WMI HARDWARE MONITOR DRIVER
 M:	Ed Brindley <kernel@maidavale.org>
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 312788f249c9..aa004b0e4406 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -22,3 +22,5 @@ source "drivers/platform/arm64/Kconfig"
 source "drivers/platform/raspberrypi/Kconfig"
 
 source "drivers/platform/wmi/Kconfig"
+
+source "drivers/platform/asus/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index fa322e7f8716..34e694e6da14 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -15,3 +15,4 @@ obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
 obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+= arm64/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= raspberrypi/
 obj-$(CONFIG_ACPI_WMI)		+= wmi/
+obj-y				+= asus/
diff --git a/drivers/platform/asus/Kconfig b/drivers/platform/asus/Kconfig
new file mode 100644
index 000000000000..984f25ee84f5
--- /dev/null
+++ b/drivers/platform/asus/Kconfig
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Asus Platform Specific Drivers
+#
+
+if X86_PLATFORM_DEVICES
+
+config ASUS_LAPTOP
+	tristate "Asus Laptop Extras"
+	depends on ACPI
+	select LEDS_CLASS
+	select NEW_LEDS
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on INPUT
+	depends on RFKILL || RFKILL = n
+	depends on ACPI_VIDEO || ACPI_VIDEO = n
+	select INPUT_SPARSEKMAP
+	help
+	  This is a driver for Asus laptops, Lenovo SL and the Pegatron
+	  Lucid tablet. It may also support some MEDION, JVC or VICTOR
+	  laptops. It makes all the extra buttons generate standard
+	  ACPI events and input events, and on the Lucid the built-in
+	  accelerometer appears as an input device.  It also adds
+	  support for video output switching, LCD backlight control,
+	  Bluetooth and Wlan control, and most importantly, allows you
+	  to blink those fancy LEDs.
+
+	  For more information see <http://acpi4asus.sf.net>.
+
+	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
+
+config ASUS_WIRELESS
+	tristate "Asus Wireless Radio Control Driver"
+	depends on ACPI
+	depends on INPUT
+	select NEW_LEDS
+	select LEDS_CLASS
+	help
+	  The Asus Wireless Radio Control handles the airplane mode hotkey
+	  present on some Asus laptops.
+
+	  Say Y or M here if you have an ASUS notebook with an airplane mode
+	  hotkey.
+
+	  If you choose to compile this driver as a module the module will be
+	  called asus-wireless.
+
+config ASUS_TF103C_DOCK
+	tristate "Asus TF103C 2-in-1 keyboard dock"
+	depends on ACPI
+	depends on I2C
+	depends on INPUT
+	depends on HID
+	depends on GPIOLIB
+	help
+	  This is a driver for the keyboard, touchpad and USB port of the
+	  keyboard dock for the Asus TF103C 2-in-1 tablet.
+
+	  This keyboard dock has its own I2C attached embedded controller
+	  and the keyboard and touchpad are also connected over I2C,
+	  instead of using the usual USB connection. This means that the
+	  keyboard dock requires this special driver to function.
+
+	  If you have an Asus TF103C tablet say Y or M here, for a generic x86
+	  distro config say M here.
+
+config EEEPC_WMI
+	tristate "Eee PC WMI Driver"
+	depends on ASUS_WMI
+	help
+	  This is a driver for newer Eee PC laptops. It adds extra features
+	  like wireless radio and bluetooth control, leds, hotkeys, backlight...
+
+	  For more information, see
+	  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
+
+	  If you have an ACPI-WMI compatible Eee PC laptop (>= 1000), say Y or M
+	  here.
+
+config EEEPC_LAPTOP
+	tristate "Eee PC Hotkey Driver"
+	depends on ACPI_EC
+	depends on INPUT
+	depends on RFKILL || RFKILL = n
+	depends on ACPI_VIDEO || ACPI_VIDEO = n
+	depends on HOTPLUG_PCI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select HWMON
+	select LEDS_CLASS
+	select NEW_LEDS
+	select INPUT_SPARSEKMAP
+	help
+	  This driver supports the Fn-Fx keys on Eee PC laptops.
+
+	  It  also gives access to some extra laptop functionalities like
+	  Bluetooth, backlight and allows powering on/off some other
+	  devices.
+
+	  If you have an Eee PC laptop, say Y or M here. If this driver
+	  doesn't work on your Eee PC, try eeepc-wmi instead.
+
+endif # X86_PLATFORM_DEVICES
+
+config ASUS_ARMOURY
+	tristate "ASUS Armoury driver"
+	depends on ASUS_WMI
+	select FW_ATTR_CLASS
+	help
+	  Say Y here if you have a WMI aware Asus machine and would like to use the
+	  firmware_attributes API to control various settings typically exposed in
+	  the ASUS Armoury Crate application available on Windows.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called asus-armoury.
+
+config ASUS_WMI
+	tristate "ASUS WMI Driver"
+	depends on ACPI_WMI
+	depends on ACPI_BATTERY
+	depends on INPUT
+	depends on HWMON
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on RFKILL || RFKILL = n
+	depends on HOTPLUG_PCI
+	depends on ACPI_VIDEO || ACPI_VIDEO = n
+	depends on SERIO_I8042 || SERIO_I8042 = n
+	select INPUT_SPARSEKMAP
+	select LEDS_CLASS
+	select NEW_LEDS
+	select ACPI_PLATFORM_PROFILE
+	help
+	  Say Y here if you have a WMI aware Asus laptop (like Eee PCs or new
+	  Asus Notebooks).
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called asus-wmi.
+
+config ASUS_WMI_DEPRECATED_ATTRS
+	bool "BIOS option support in WMI platform (DEPRECATED)"
+	depends on ASUS_WMI
+	default y
+	help
+	  Say Y to expose the configurable BIOS options through the asus-wmi
+	  driver.
+
+	  This can be used with or without the asus-armoury driver which
+	  has the same attributes, but more, and better features.
+
+config ASUS_NB_WMI
+	tristate "Asus Notebook WMI Driver"
+	depends on ASUS_WMI
+	help
+	  This is a driver for newer Asus notebooks. It adds extra features
+	  like wireless radio and bluetooth control, leds, hotkeys, backlight...
+
+	  For more information, see
+	  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
+
+	  If you have an ACPI-WMI compatible Asus Notebook, say Y or M
+	  here.
+
+
+
diff --git a/drivers/platform/asus/Makefile b/drivers/platform/asus/Makefile
new file mode 100644
index 000000000000..d3b5c4fc2ca6
--- /dev/null
+++ b/drivers/platform/asus/Makefile
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/asus
+# Asus Platform-Specific Drivers
+#
+
+obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
+obj-$(CONFIG_ASUS_WIRELESS)	+= asus-wireless.o
+obj-$(CONFIG_ASUS_ARMOURY)	+= asus-armoury.o
+obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
+obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
+obj-$(CONFIG_ASUS_TF103C_DOCK)	+= asus-tf103c-dock.o
+obj-$(CONFIG_EEEPC_LAPTOP)	+= eeepc-laptop.o
+obj-$(CONFIG_EEEPC_WMI)		+= eeepc-wmi.o
+
diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/asus/asus-armoury.c
similarity index 100%
rename from drivers/platform/x86/asus-armoury.c
rename to drivers/platform/asus/asus-armoury.c
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/asus/asus-armoury.h
similarity index 100%
rename from drivers/platform/x86/asus-armoury.h
rename to drivers/platform/asus/asus-armoury.h
diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/asus/asus-laptop.c
similarity index 100%
rename from drivers/platform/x86/asus-laptop.c
rename to drivers/platform/asus/asus-laptop.c
diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/asus/asus-nb-wmi.c
similarity index 100%
rename from drivers/platform/x86/asus-nb-wmi.c
rename to drivers/platform/asus/asus-nb-wmi.c
diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform/asus/asus-tf103c-dock.c
similarity index 100%
rename from drivers/platform/x86/asus-tf103c-dock.c
rename to drivers/platform/asus/asus-tf103c-dock.c
diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/asus/asus-wireless.c
similarity index 100%
rename from drivers/platform/x86/asus-wireless.c
rename to drivers/platform/asus/asus-wireless.c
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/asus/asus-wmi.c
similarity index 100%
rename from drivers/platform/x86/asus-wmi.c
rename to drivers/platform/asus/asus-wmi.c
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/asus/asus-wmi.h
similarity index 100%
rename from drivers/platform/x86/asus-wmi.h
rename to drivers/platform/asus/asus-wmi.h
diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/asus/eeepc-laptop.c
similarity index 100%
rename from drivers/platform/x86/eeepc-laptop.c
rename to drivers/platform/asus/eeepc-laptop.c
diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/asus/eeepc-wmi.c
similarity index 100%
rename from drivers/platform/x86/eeepc-wmi.c
rename to drivers/platform/asus/eeepc-wmi.c
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9ce384e0475e..b2c6cc923694 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -213,123 +213,6 @@ config APPLE_GMUX
 	  graphics as well as the backlight. Currently only backlight
 	  control is supported by the driver.
 
-config ASUS_LAPTOP
-	tristate "Asus Laptop Extras"
-	depends on ACPI
-	select LEDS_CLASS
-	select NEW_LEDS
-	depends on BACKLIGHT_CLASS_DEVICE
-	depends on INPUT
-	depends on RFKILL || RFKILL = n
-	depends on ACPI_VIDEO || ACPI_VIDEO = n
-	select INPUT_SPARSEKMAP
-	help
-	  This is a driver for Asus laptops, Lenovo SL and the Pegatron
-	  Lucid tablet. It may also support some MEDION, JVC or VICTOR
-	  laptops. It makes all the extra buttons generate standard
-	  ACPI events and input events, and on the Lucid the built-in
-	  accelerometer appears as an input device.  It also adds
-	  support for video output switching, LCD backlight control,
-	  Bluetooth and Wlan control, and most importantly, allows you
-	  to blink those fancy LEDs.
-
-	  For more information see <http://acpi4asus.sf.net>.
-
-	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
-
-config ASUS_WIRELESS
-	tristate "Asus Wireless Radio Control Driver"
-	depends on ACPI
-	depends on INPUT
-	select NEW_LEDS
-	select LEDS_CLASS
-	help
-	  The Asus Wireless Radio Control handles the airplane mode hotkey
-	  present on some Asus laptops.
-
-	  Say Y or M here if you have an ASUS notebook with an airplane mode
-	  hotkey.
-
-	  If you choose to compile this driver as a module the module will be
-	  called asus-wireless.
-
-config ASUS_ARMOURY
-	tristate "ASUS Armoury driver"
-	depends on ASUS_WMI
-	select FW_ATTR_CLASS
-	help
-	  Say Y here if you have a WMI aware Asus machine and would like to use the
-	  firmware_attributes API to control various settings typically exposed in
-	  the ASUS Armoury Crate application available on Windows.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called asus-armoury.
-
-config ASUS_WMI
-	tristate "ASUS WMI Driver"
-	depends on ACPI_WMI
-	depends on ACPI_BATTERY
-	depends on INPUT
-	depends on HWMON
-	depends on BACKLIGHT_CLASS_DEVICE
-	depends on RFKILL || RFKILL = n
-	depends on HOTPLUG_PCI
-	depends on ACPI_VIDEO || ACPI_VIDEO = n
-	depends on SERIO_I8042 || SERIO_I8042 = n
-	select INPUT_SPARSEKMAP
-	select LEDS_CLASS
-	select NEW_LEDS
-	select ACPI_PLATFORM_PROFILE
-	help
-	  Say Y here if you have a WMI aware Asus laptop (like Eee PCs or new
-	  Asus Notebooks).
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called asus-wmi.
-
-config ASUS_WMI_DEPRECATED_ATTRS
-	bool "BIOS option support in WMI platform (DEPRECATED)"
-	depends on ASUS_WMI
-	default y
-	help
-	  Say Y to expose the configurable BIOS options through the asus-wmi
-	  driver.
-
-	  This can be used with or without the asus-armoury driver which
-	  has the same attributes, but more, and better features.
-
-config ASUS_NB_WMI
-	tristate "Asus Notebook WMI Driver"
-	depends on ASUS_WMI
-	help
-	  This is a driver for newer Asus notebooks. It adds extra features
-	  like wireless radio and bluetooth control, leds, hotkeys, backlight...
-
-	  For more information, see
-	  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
-
-	  If you have an ACPI-WMI compatible Asus Notebook, say Y or M
-	  here.
-
-config ASUS_TF103C_DOCK
-	tristate "Asus TF103C 2-in-1 keyboard dock"
-	depends on ACPI
-	depends on I2C
-	depends on INPUT
-	depends on HID
-	depends on GPIOLIB
-	help
-	  This is a driver for the keyboard, touchpad and USB port of the
-	  keyboard dock for the Asus TF103C 2-in-1 tablet.
-
-	  This keyboard dock has its own I2C attached embedded controller
-	  and the keyboard and touchpad are also connected over I2C,
-	  instead of using the usual USB connection. This means that the
-	  keyboard dock requires this special driver to function.
-
-	  If you have an Asus TF103C tablet say Y or M here, for a generic x86
-	  distro config say M here.
-
 config AYANEO_EC
 	tristate "Ayaneo EC platform control"
 	depends on DMI
@@ -357,41 +240,6 @@ config MERAKI_MX100
 	  To compile this driver as a module, choose M here: the module
 	  will be called meraki-mx100.
 
-config EEEPC_LAPTOP
-	tristate "Eee PC Hotkey Driver"
-	depends on ACPI_EC
-	depends on INPUT
-	depends on RFKILL || RFKILL = n
-	depends on ACPI_VIDEO || ACPI_VIDEO = n
-	depends on HOTPLUG_PCI
-	depends on BACKLIGHT_CLASS_DEVICE
-	select HWMON
-	select LEDS_CLASS
-	select NEW_LEDS
-	select INPUT_SPARSEKMAP
-	help
-	  This driver supports the Fn-Fx keys on Eee PC laptops.
-
-	  It  also gives access to some extra laptop functionalities like
-	  Bluetooth, backlight and allows powering on/off some other
-	  devices.
-
-	  If you have an Eee PC laptop, say Y or M here. If this driver
-	  doesn't work on your Eee PC, try eeepc-wmi instead.
-
-config EEEPC_WMI
-	tristate "Eee PC WMI Driver"
-	depends on ASUS_WMI
-	help
-	  This is a driver for newer Eee PC laptops. It adds extra features
-	  like wireless radio and bluetooth control, leds, hotkeys, backlight...
-
-	  For more information, see
-	  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
-
-	  If you have an ACPI-WMI compatible Eee PC laptop (>= 1000), say Y or M
-	  here.
-
 source "drivers/platform/x86/dell/Kconfig"
 
 config AMILO_RFKILL
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 229057234d00..88f45e03ee19 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -28,16 +28,6 @@ obj-$(CONFIG_ADV_SWBUTTON)	+= adv_swbutton.o
 # Apple
 obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
 
-# ASUS
-obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
-obj-$(CONFIG_ASUS_WIRELESS)	+= asus-wireless.o
-obj-$(CONFIG_ASUS_ARMOURY)	+= asus-armoury.o
-obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
-obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
-obj-$(CONFIG_ASUS_TF103C_DOCK)	+= asus-tf103c-dock.o
-obj-$(CONFIG_EEEPC_LAPTOP)	+= eeepc-laptop.o
-obj-$(CONFIG_EEEPC_WMI)		+= eeepc-wmi.o
-
 # Ayaneo
 obj-$(CONFIG_AYANEO_EC)		+= ayaneo-ec.o
 
-- 
2.43.0

