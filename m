Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399832;
	b=bSFOJbdxGA3DSJdVL3Ju1G2yBvW9UBKXn/kfTP/8aaa9R9z+CAPD/wt1owFtPs0llN1f
	 IiRIZhHWKAShmDJdP+Z+lFBxsvKqGL80v4fzSp/oGFYlOFDuYcm0w8ZEPMILxZreVQFz/
	 pFOJyp+C4e2OhR2WNM7XtOE7HRkDfrNfawpZkm7YAY3kSine86D2CwpGWu3ASgp851IXq
	 /knUp7XQGVlwDL96oix5xQN+zmawjvxnr6SnAJbeZSCrajcfK3jmBbi0Z6Rm4qapBwHE7
	 E7Cak9K64IAmTpR4F0H5AkJCnP7AZabQjVeEc8S9eOdCAaFT6dXY0QDi4JOegkx433A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sP2hVHAVMdCd71PC1oEh7JsIUfocP68BztywM/bv2xs=;
	b=MksZuk2LZaD/IwlCv0k032XrGh8cOk8OahDyUSzVxC2lGgSTTSacHCNyQfzJ7I2oy93Q
	 99icmdAAmAJSGr0pKS5a7YYby1wlxJyC4D0tRL140WcfhUjoQUmQXIfmlfq2pH62/ryTO
	 fS44+1ZxSiuvQ02Ai4raru+5aER/oVZrLuwaEE+B8JLZ5Qp7D1YqzZzJbDET+L1y/rr2D
	 pFtI/fc+lo0sgjOVLt+SXQJ5CMnppHSlCf0TJFZzKLrVT1xE2kh/CCbU0X7bQhwLVWbmJ
	 ++lGv6/zN4WvqsdZ9zgMQfNvMvlmB6c2+cUO7AvAXXwaPzAl54ItQ8Ds9KY/mLU03tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EafwOiiX;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FD9606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31FD9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EafwOiiX
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1139865f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399825; x=1794004625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sP2hVHAVMdCd71PC1oEh7JsIUfocP68BztywM/bv2xs=;
        b=EafwOiiXHEaqqbR7hi61+gMjjDO+KwUP0KsRRYFdhrZ7D3Pgtqm96rMkTbPcUQAPDP
         /YAKxBqE48kb/28sAkRonRoMhY8xQb1y5VplesdUgC5YCcTKlb+Zycr7Mkv3lYbxOCWi
         vZjVjyf1vN6w6ihXSDkU/O1pyQvfK8zZO4vLoJqIGA0P161p7+kzvhkXUifByIT1RVm2
         Iv7nCdC++9OKj1ojPERM0vizQhuL8Pvcs3NOPrtI80LQK8t6COqcCXf2ltm+APU0Ii/n
         /0IVayUL7dNw+OW3mCGj1iOKS7HcWAFDUy49236Z/hr0djYgmHT0jIqLBq7lLpr+BnSx
         4YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399825; x=1794004625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sP2hVHAVMdCd71PC1oEh7JsIUfocP68BztywM/bv2xs=;
        b=2e8c4csbQ1ny+fVSH93yB/pHH1yjUiLG89/34eAPzglAgX1Iif19VCtH6USJUwibI6
         ocHdX8PE0sNGUtqyIqAe3AP8OqabIzCUKF6FVHs6CvI6ZMm3EpB8yN/4AglMGMQQbwhG
         OBk1II+i/jnAuCF7aMNVHjYk0CHOP9ZVNWQ0BrFlPN44I24FCsxLrFERtKtJ/sqLlJo9
         j35q8npjOoNolZt0sIfMUqX+Lt4V3wA51d8AX7GVEtq9RYcvYM1HwqNY0y2V9zotJ2pE
         vGrvGNzK9bRUFflB+X5v+1nSjDU6XTlbJAwiD9k23xXp7ExtvH+M/xLqBxMIjF633bR3
         cGfg==
X-Forwarded-Encrypted: i=1; AKwUvBwbs+RuW2B1fKVB2Ycvbi4BJ5KXA0o+fI/ZNY1vXNJWZKzOBzJZrY47oDauFB3JPvdctYlOsx9b4kUFTIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWnqD+6PlxL1pxRjMqhHPiWA0HBrIvpajRTQwyXS3tVTVWSHGA
	Ydr+kFyweW8acqe/L+XA+KMgPou6pCu9RUHXIGWaxDw1h2P+pX+kavRX
X-Gm-Gg: AYBFou2MQHEhrHhdffBg14AkIEGs0vH8J20/RfsoXVQLYR4wG0iSoUUP4EHCmnR/gZW
	x3C7tjPjAL1lBgoLSBQQWKPsS6k5I5gXlGt8Bu0JXLyTtlhnr3bWLe/ivpGPahicgn8hZKbP1KO
	qK47nRd87sZTRI4lWFnDzN0AboXWiboXAj37vtfsHev2nyeQ1KE3mknT6xs+FSfOGnS8haMJt2M
	vtRlL39uNQh+psMZJNB2YQX/BwFWwNoZO6B7vxz0aTF/Qc/kBYpK0eUa7g693EP+ktDtU5gSzBK
	PYjS9F25AkhvgW/9zyjp+rDqBovp+Rf/g3AsNWxqv/mgGmB+PHXANQId8fmMh3+XiWqeY0ODRUA
	OpcqtgmvtZd3AA1U2F5CkIwPuEQdQ83IfnyqrNiGhxQmN+kpyPtWGxA0uHjUc52i7VGfMlW9kT8
	5vUirY1L0BYR2PGewCeDuyC+xrRMPQlM1H3Ix+mBaSWztemznsD3+tm34K+JMe+4QH8hvgauexV
	+QLthEkVVWJGOx9QPmZwQrxdkBoIJ6ewAYNj9LhFZUcMkCTq/P3EHOzyriz8VeBmk+ks1EzDtXQ
	3DAlGk/tKN7XabUHrpJOKWKhvgmx
X-Received: by 2002:a05:6000:4b04:b0:48d:f069:570c with SMTP id ffacd0b85a97d-48e6e51840emr8553717f8f.41.1793399824369;
        Fri, 30 Oct 2026 15:37:04 -0700 (PDT)
Received: from m2.. ([37.142.145.227])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm5457300f8f.45.2026.10.30.15.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:37:03 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v2 03/15] HID: ft260: add GPIO support
Date: Sat, 31 Oct 2026 00:36:25 +0200
Message-ID: <20261030223637.86907-4-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030223637.86907-1-michael.zaidman@gmail.com>
References: <20261030223637.86907-1-michael.zaidman@gmail.com>
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

Add gpiochip support for the FT260 multifunctional pins, including
GPIO2/GPIOA/GPIOG function selection via sysfs, and enable the
available GPIOs according to the active UART mode.

This supersedes the earlier pre-UART GPIO series:
https://lore.kernel.org/lkml/20230211115752.26276-2-michael.zaidman@gmail.com/

The gpio_chip.set callback returns int to match the current gpiolib
API, based on the adaptation originally contributed by Rio Liu
<rio@r26.me>.

Read the current GPIO state before writing so a set does not clobber
other pins with a zero shadow. Apply direction and value in one
feature report, and return a failed value write to gpiolib. UART mode
OFF clears only UART-owned bits. Reject an out-of-range uart_mode
index (reported by Sashiko).

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>

---
v2: GPIO shadow, combined dir/value report, uart_mode OFF/index
(reported by Sashiko).
---
 drivers/hid/Kconfig     |  10 +-
 drivers/hid/hid-ft260.c | 607 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 570 insertions(+), 47 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 670bce481c42..122a5b816d2c 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -386,12 +386,12 @@ config HID_EZKEY
 	Support for Ezkey BTC 8193 keyboard.
 
 config HID_FT260
-	tristate "FTDI FT260 USB HID to I2C/UART host support"
-	depends on USB_HID && HIDRAW && I2C && TTY
+	tristate "FTDI FT260 USB HID to I2C/UART/GPIO host support"
+	depends on USB_HID && HIDRAW && I2C && TTY && GPIOLIB
 	help
-	  Provides I2C host adapter and UART/TTY functionality over USB-HID
-	  through the FT260 device. The customizable USB descriptor fields
-	  are exposed as sysfs attributes.
+	  Provides I2C host adapter, UART/TTY, and GPIO functionality over
+	  USB-HID through the FT260 device. The customizable USB descriptor
+	  fields are exposed as sysfs attributes.
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called hid-ft260.
diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index c859486cb28c..e24f3151fdaf 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -19,6 +19,8 @@
 #include <linux/tty_flip.h>
 #include <linux/minmax.h>
 #include <linux/unaligned.h>
+#include <linux/bits.h>
+#include <linux/gpio/driver.h>
 
 #ifdef DEBUG
 static int ft260_debug = 1;
@@ -57,6 +59,11 @@ MODULE_PARM_DESC(debug, "Toggle FT260 debugging messages");
 #define FT260_RD_DATA_MAX 180
 #define FT260_WR_I2C_DATA_MAX 60
 #define FT260_WR_UART_DATA_MAX 62
+#define FT260_GPIOCHIP "ft260_gpio"
+#define FT260_GPIO_0_5_COUNT 6
+#define FT260_GPIO_A_H_COUNT 8
+#define FT260_GPIO_TOTAL (FT260_GPIO_0_5_COUNT + FT260_GPIO_A_H_COUNT)
+#define FT260_GPIO_MASK GENMASK(FT260_GPIO_TOTAL - 1, 0)
 
 /*
  * Device interface configuration.
@@ -151,7 +158,65 @@ enum {
 	FT260_IFACE_UART
 };
 
-#define FT260_SET_REQUEST_VALUE(report_id) ((FT260_FEATURE << 8) | report_id)
+/* Multi-function pin functions */
+enum {
+	FT260_MFPIN_GPIO		= 0x00,
+	FT260_MFPIN_SUSPOUT		= 0x01,
+	FT260_MFPIN_PWREN		= 0x02,
+	FT260_MFPIN_TX_ACTIVE		= 0x03,
+	FT260_MFPIN_TX_LED		= 0x04,
+	FT260_MFPIN_RX_LED		= 0x05,
+	FT260_MFPIN_BCD_DET		= 0x06,
+};
+
+enum {
+	FT260_GPIO_VALUE		= 0x00,
+	FT260_GPIO_DIRECTION		= 0x01,
+	FT260_GPIO_DIR_INPUT		= 0x00,
+	FT260_GPIO_DIR_OUTPUT		= 0x01,
+};
+
+/* GPIO offsets */
+#define FT260_GPIO_0		BIT(0)
+#define FT260_GPIO_1		BIT(1)
+#define FT260_GPIO_2		BIT(2)
+#define FT260_GPIO_3		BIT(3)
+#define FT260_GPIO_4		BIT(4)
+#define FT260_GPIO_5		BIT(5)
+#define FT260_GPIO_A		BIT(FT260_GPIO_0_5_COUNT + 0)
+#define FT260_GPIO_B		BIT(FT260_GPIO_0_5_COUNT + 1)
+#define FT260_GPIO_C		BIT(FT260_GPIO_0_5_COUNT + 2)
+#define FT260_GPIO_D		BIT(FT260_GPIO_0_5_COUNT + 3)
+#define FT260_GPIO_E		BIT(FT260_GPIO_0_5_COUNT + 4)
+#define FT260_GPIO_F		BIT(FT260_GPIO_0_5_COUNT + 5)
+#define FT260_GPIO_G		BIT(FT260_GPIO_0_5_COUNT + 6)
+#define FT260_GPIO_H		BIT(FT260_GPIO_0_5_COUNT + 7)
+
+/* GPIO groups */
+#define FT260_GPIO_WAKEUP		FT260_GPIO_3
+#define FT260_GPIO_I2C_DEFAULT		(FT260_GPIO_0 | FT260_GPIO_1)
+#define FT260_GPIO_UART_RX_TX		(FT260_GPIO_C | FT260_GPIO_D)
+#define FT260_GPIO_UART_DCD_RI		(FT260_GPIO_4 | FT260_GPIO_5)
+#define FT260_GPIO_UART_RTS_CTS		(FT260_GPIO_B | FT260_GPIO_E)
+#define FT260_GPIO_UART_DTR_DSR		(FT260_GPIO_F | FT260_GPIO_H)
+#define FT260_GPIO_UART_MODE_0_SET	(FT260_GPIO_UART_RX_TX | \
+					 FT260_GPIO_UART_DCD_RI | \
+					 FT260_GPIO_UART_RTS_CTS | \
+					 FT260_GPIO_UART_DTR_DSR)
+#define FT260_GPIO_UART_MODE_1_SET	FT260_GPIO_UART_DTR_DSR
+#define FT260_GPIO_UART_MODE_2_SET	FT260_GPIO_UART_RTS_CTS
+#define FT260_GPIO_UART_MODE_3_SET	(FT260_GPIO_UART_RTS_CTS | \
+					 FT260_GPIO_UART_DTR_DSR)
+#define FT260_GPIO_UART_MODE_4_SET	FT260_GPIO_UART_MODE_3_SET
+#define FT260_GPIO_UART_DEFAULT		FT260_GPIO_UART_MODE_0_SET
+#define FT260_GPIO_UART_MODE_1_CLR	(FT260_GPIO_UART_RX_TX | \
+					 FT260_GPIO_UART_RTS_CTS)
+#define FT260_GPIO_UART_MODE_2_CLR	(FT260_GPIO_UART_RX_TX | \
+					 FT260_GPIO_UART_DTR_DSR)
+#define FT260_GPIO_UART_MODE_3_CLR	FT260_GPIO_UART_RX_TX
+#define FT260_GPIO_UART_MODES		5
+
+#define FT260_SET_REQUEST_VALUE(report_id) ((FT260_FEATURE << 8) | (report_id))
 
 /* Feature In reports */
 
@@ -171,10 +236,10 @@ struct ft260_get_system_status_report {
 	u8 uart_mode;		/* 0 - OFF; 1 - RTS_CTS, 2 - DTR_DSR, */
 				/* 3 - XON_XOFF, 4 - No flow control */
 	u8 hid_over_i2c_en;	/* 0 - disabled, 1 - enabled */
-	u8 gpio2_function;	/* 0 - GPIO,  1 - SUSPOUT, */
+	u8 gpio2_func;		/* 0 - GPIO,  1 - SUSPOUT, */
 				/* 2 - PWREN, 4 - TX_LED */
-	u8 gpioA_function;	/* 0 - GPIO, 3 - TX_ACTIVE, 4 - TX_LED */
-	u8 gpioG_function;	/* 0 - GPIO, 2 - PWREN, */
+	u8 gpioa_func;		/* 0 - GPIO, 3 - TX_ACTIVE, 4 - TX_LED */
+	u8 gpiog_func;		/* 0 - GPIO, 2 - PWREN, */
 				/* 5 - RX_LED, 6 - BCD_DET */
 	u8 suspend_out_pol;	/* 0 - active-high, 1 - active-low */
 	u8 enable_wakeup_int;	/* 0 - disabled, 1 - enabled */
@@ -202,6 +267,18 @@ struct ft260_get_uart_settings_report {
 	u8 breaking;		/* 0: no break */
 } __packed;
 
+struct ft260_gpio_state {
+	u8 vals;		/* GPIO[0-5] values in bits 0 - 5 */
+	u8 dirs;		/* GPIO[0-5] directions, 0 - in, 1 - out */
+	u8 ex_vals;		/* GPIO[A-H] values in bits 0 - 7 */
+	u8 ex_dirs;		/* GPIO[A-H] directions, 0 - in, 1 - out */
+} __packed;
+
+struct ft260_gpio_read_request_report {
+	u8 report;		/* FT260_GPIO */
+	struct ft260_gpio_state	gpio;
+} __packed;
+
 /* Feature Out reports */
 
 struct ft260_set_system_clock_report {
@@ -223,6 +300,12 @@ struct ft260_set_uart_mode_report {
 				/* 3 - XON_XOFF, 4 - No flow control */
 } __packed;
 
+struct ft260_set_uart_dcd_ri_report {
+	u8 report;		/* FT260_SYSTEM_SETTINGS */
+	u8 request;		/* FT260_ENABLE_UART_DCD_RI */
+	u8 uart_dcd_ri;		/* Pins func: 0 - GPIO4,GPIO5, 1 - DCD,RI */
+} __packed;
+
 struct ft260_set_i2c_reset_report {
 	u8 report;		/* FT260_SYSTEM_SETTINGS */
 	u8 request;		/* FT260_SET_I2C_RESET */
@@ -234,6 +317,33 @@ struct ft260_set_i2c_speed_report {
 	__le16 clock;		/* I2C bus clock in range 60-3400 KHz */
 } __packed;
 
+struct ft260_set_gpio2_func_report {
+	u8 report;		/* FT260_SYSTEM_SETTINGS */
+	u8 request;		/* FT260_SELECT_GPIO2_FUNC */
+	u8 gpio2_func;		/* Pin func: 0 - GPIO, 1 - SUSPOUT, */
+				/* 2 - PWREN# (active-low), 4 - TX_LED */
+} __packed;
+
+struct ft260_set_gpioa_func_report {
+	u8 report;		/* FT260_SYSTEM_SETTINGS */
+	u8 request;		/* FT260_SELECT_GPIOA_FUNC */
+	u8 gpioa_func;		/* Pin func: 0 - GPIO, */
+				/* 3 - TX_ACTIVE, 4 - TX_LED */
+} __packed;
+
+struct ft260_set_gpiog_func_report {
+	u8 report;		/* FT260_SYSTEM_SETTINGS */
+	u8 request;		/* FT260_SELECT_GPIOG_FUNC */
+	u8 gpiog_func;		/* Pin func: 0 - GPIO, */
+				/* 2 - PWREN# (active-low), */
+				/* 5 - RX_LED, 6 - BCD_DET */
+} __packed;
+
+struct ft260_gpio_write_request_report {
+	u8 report;		/* FT260_GPIO */
+	struct ft260_gpio_state	gpio;
+} __packed;
+
 /* Data transfer reports */
 
 struct ft260_i2c_write_request_report {
@@ -333,6 +443,7 @@ struct ft260_device {
 	struct i2c_adapter adap;
 	struct hid_device *hdev;
 	int iface_type;
+	int iface_id;
 	struct list_head device_list;
 	struct tty_port port;
 	/* tty port index */
@@ -356,6 +467,10 @@ struct ft260_device {
 	u16 read_idx;
 	u16 read_len;
 	u16 clock;
+	u16 gpio_en;
+	struct gpio_chip *gc;
+	struct ft260_gpio_state gpio;
+	u16 gpio_uart_mode[FT260_GPIO_UART_MODES];
 };
 
 static int ft260_hid_feature_report_get(struct hid_device *hdev,
@@ -388,8 +503,6 @@ static int ft260_hid_feature_report_set(struct hid_device *hdev, u8 *data,
 	if (!buf)
 		return -ENOMEM;
 
-	buf[0] = FT260_SYSTEM_SETTINGS;
-
 	ret = hid_hw_raw_request(hdev, buf[0], buf, len, HID_FEATURE_REPORT,
 				 HID_REQ_SET_REPORT);
 
@@ -402,6 +515,7 @@ static int ft260_i2c_reset(struct hid_device *hdev)
 	struct ft260_set_i2c_reset_report report;
 	int ret;
 
+	report.report = FT260_SYSTEM_SETTINGS;
 	report.request = FT260_SET_I2C_RESET;
 
 	ret = ft260_hid_feature_report_set(hdev, (u8 *)&report, sizeof(report));
@@ -919,6 +1033,347 @@ static const struct i2c_algorithm ft260_i2c_algo = {
 	.functionality = ft260_functionality,
 };
 
+static void ft260_gpio_en_set(struct ft260_device *dev, u16 bitmap)
+{
+	dev->gpio_en |= bitmap & FT260_GPIO_MASK;
+}
+
+static void ft260_gpio_en_clr(struct ft260_device *dev, u16 bitmap)
+{
+	dev->gpio_en &= ~bitmap & FT260_GPIO_MASK;
+}
+
+static void ft260_gpio_en_update(struct hid_device *hdev, u8 req, u8 value)
+{
+	u16 bitmap;
+	struct ft260_device *dev = hid_get_drvdata(hdev);
+
+	switch (req) {
+	case FT260_SET_I2C_MODE:
+		bitmap = FT260_GPIO_I2C_DEFAULT;
+		break;
+	case FT260_SET_UART_MODE:
+		switch (value) {
+		case FT260_UART_CFG_FLOW_CTRL_OFF:
+			bitmap = FT260_GPIO_UART_MODE_0_SET;
+			break;
+		case FT260_UART_CFG_FLOW_CTRL_RTS_CTS:
+			bitmap = FT260_GPIO_UART_MODE_1_CLR;
+			break;
+		case FT260_UART_CFG_FLOW_CTRL_DTR_DSR:
+			bitmap = FT260_GPIO_UART_MODE_2_CLR;
+			break;
+		case FT260_UART_CFG_FLOW_CTRL_XON_XOFF:
+		case FT260_UART_CFG_FLOW_CTRL_NONE:
+			bitmap = FT260_GPIO_UART_MODE_3_CLR;
+			break;
+		default:
+			return;
+		}
+		ft260_gpio_en_clr(dev, bitmap);
+		bitmap = dev->gpio_uart_mode[value];
+		ft260_gpio_en_set(dev, bitmap);
+		goto exit;
+
+	case FT260_ENABLE_UART_DCD_RI:
+		bitmap = FT260_GPIO_UART_DCD_RI;
+		break;
+
+	case FT260_SELECT_GPIO2_FUNC:
+		bitmap = FT260_GPIO_2;
+		break;
+	case FT260_SELECT_GPIOA_FUNC:
+		bitmap = FT260_GPIO_A;
+		break;
+	case FT260_SELECT_GPIOG_FUNC:
+		bitmap = FT260_GPIO_G;
+		break;
+	default:
+		return;
+	}
+
+	if (value == FT260_MFPIN_GPIO)
+		ft260_gpio_en_set(dev, bitmap);
+	else
+		ft260_gpio_en_clr(dev, bitmap);
+exit:
+	hid_info(hdev, "enabled GPIOs: %04x\n", dev->gpio_en);
+}
+
+static int ft260_gpio_set(struct gpio_chip *gc, u32 offset, int value)
+{
+	int ret = 0;
+	struct ft260_gpio_read_request_report buf;
+	struct ft260_gpio_write_request_report rep;
+	struct ft260_device *dev = gpiochip_get_data(gc);
+	struct hid_device *hdev = dev->hdev;
+
+	if (offset >= FT260_GPIO_TOTAL) {
+		hid_err(hdev, "%s: invalid offset %d\n", __func__, offset);
+		return -EINVAL;
+	}
+
+	ft260_dbg("offset %d val %d\n", offset, value);
+
+	mutex_lock(&dev->lock);
+
+	if (!(dev->gpio_en & BIT(offset))) {
+		hid_err(hdev, "%s: wrong pin function %d\n", __func__, offset);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = ft260_hid_feature_report_get(hdev, FT260_GPIO, (u8 *)&buf,
+					   sizeof(buf));
+	if (unlikely(ret < 0)) {
+		hid_err(hdev, "%s: cannot get GPIO: %d\n", __func__, ret);
+		goto exit;
+	}
+
+	rep.report = FT260_GPIO;
+	rep.gpio = buf.gpio;
+
+	if (offset < FT260_GPIO_0_5_COUNT) {
+		if (value)
+			rep.gpio.vals |= !!value << offset;
+		else
+			rep.gpio.vals &= ~BIT(offset);
+	} else {
+		offset = offset - FT260_GPIO_0_5_COUNT;
+		if (value)
+			rep.gpio.ex_vals |= !!value << offset;
+		else
+			rep.gpio.ex_vals &= ~BIT(offset);
+	}
+
+	ft260_dbg("dirs %#02x vals %#02x ex_dir %#02x ex_vals %#02x\n",
+		  rep.gpio.dirs, rep.gpio.vals,
+		  rep.gpio.ex_dirs, rep.gpio.ex_vals);
+
+	ret = ft260_hid_feature_report_set(hdev, (u8 *)&rep, sizeof(rep));
+	if (unlikely(ret < 0)) {
+		hid_err(hdev, "%s: cannot set GPIO: %d\n", __func__, ret);
+		goto exit;
+	}
+
+	dev->gpio = rep.gpio;
+	ret = 0;
+exit:
+	mutex_unlock(&dev->lock);
+	return ret;
+}
+
+static int ft260_gpio_direction_set(struct gpio_chip *gc, u32 offset,
+				    int value, int direction)
+{
+	int ret;
+	struct ft260_gpio_read_request_report buf;
+	struct ft260_gpio_write_request_report *rep;
+	struct ft260_device *dev = gpiochip_get_data(gc);
+	struct hid_device *hdev = dev->hdev;
+
+	if (offset >= FT260_GPIO_TOTAL) {
+		hid_err(hdev, "%s: invalid offset %d\n", __func__, offset);
+		return -EINVAL;
+	}
+
+	ft260_dbg("offset %d val %d direction %d\n", offset, value, direction);
+
+	mutex_lock(&dev->lock);
+
+	if (!(dev->gpio_en & BIT(offset))) {
+		hid_err(hdev, "%s: wrong pin function %d\n", __func__, offset);
+		ret = -EIO;
+		goto exit;
+	}
+
+	ret = ft260_hid_feature_report_get(hdev, FT260_GPIO, (u8 *)&buf, sizeof(buf));
+	if (unlikely(ret < 0)) {
+		hid_err(hdev, "%s: cannot get GPIO: %d\n", __func__, ret);
+		goto exit;
+	}
+
+	rep = (struct ft260_gpio_write_request_report *)&buf;
+
+	if (direction == FT260_GPIO_DIR_OUTPUT) {
+		if (offset < FT260_GPIO_0_5_COUNT) {
+			rep->gpio.dirs |= BIT(offset);
+			if (value)
+				rep->gpio.vals |= BIT(offset);
+			else
+				rep->gpio.vals &= ~BIT(offset);
+		} else {
+			u32 ex = offset - FT260_GPIO_0_5_COUNT;
+
+			rep->gpio.ex_dirs |= BIT(ex);
+			if (value)
+				rep->gpio.ex_vals |= BIT(ex);
+			else
+				rep->gpio.ex_vals &= ~BIT(ex);
+		}
+	} else if (offset < FT260_GPIO_0_5_COUNT) {
+		rep->gpio.dirs &= ~BIT(offset);
+	} else {
+		rep->gpio.ex_dirs &= ~BIT(offset - FT260_GPIO_0_5_COUNT);
+	}
+
+	ft260_dbg("dirs %#02x val %#02x ex_dirs %#02x ex_vals %#02x\n",
+		  rep->gpio.dirs, rep->gpio.vals,
+		  rep->gpio.ex_dirs, rep->gpio.ex_vals);
+
+	ret = ft260_hid_feature_report_set(hdev, (u8 *)rep, sizeof(*rep));
+	if (unlikely(ret < 0)) {
+		hid_err(hdev, "%s: cannot set GPIO: %d\n", __func__, ret);
+		goto exit;
+	}
+
+	dev->gpio = rep->gpio;
+	ret = 0;
+exit:
+	mutex_unlock(&dev->lock);
+	return ret;
+}
+
+static int ft260_gpio_direction_output(struct gpio_chip *gc,
+				       u32 offset, int value)
+{
+	return ft260_gpio_direction_set(gc, offset, value,
+					FT260_GPIO_DIR_OUTPUT);
+}
+
+static int ft260_gpio_direction_input(struct gpio_chip *gc, u32 offset)
+{
+	return ft260_gpio_direction_set(gc, offset, 0,
+					FT260_GPIO_DIR_INPUT);
+}
+
+static int ft260_gpio_get_all(struct gpio_chip *gc, int item)
+{
+	int ret;
+	struct ft260_gpio_read_request_report rep;
+	struct ft260_device *dev = gpiochip_get_data(gc);
+	struct hid_device *hdev = dev->hdev;
+
+	ret = ft260_hid_feature_report_get(hdev, FT260_GPIO, (u8 *)&rep, sizeof(rep));
+	if (unlikely(ret < 0)) {
+		hid_err(hdev, "%s: cannot get GPIO: %d\n", __func__, ret);
+		goto exit;
+	}
+
+	if (item == FT260_GPIO_VALUE)
+		ret = (rep.gpio.ex_vals << FT260_GPIO_0_5_COUNT) | rep.gpio.vals;
+	else
+		ret = (rep.gpio.ex_dirs << FT260_GPIO_0_5_COUNT) | rep.gpio.dirs;
+exit:
+	return ret;
+}
+
+static int ft260_gpio_get_direction(struct gpio_chip *gc, u32 offset)
+{
+	int ret = ft260_gpio_get_all(gc, FT260_GPIO_DIRECTION);
+
+	if (ret < 0)
+		return ret;
+	return !((ret >> offset) & 1);
+}
+
+static int ft260_gpio_get(struct gpio_chip *gc, u32 offset)
+{
+	int ret = ft260_gpio_get_all(gc, FT260_GPIO_VALUE);
+
+	if (ret < 0)
+		return ret;
+	return (ret >> offset) & 1;
+}
+
+static int ft260_gpio_init(struct ft260_device *dev,
+			   struct ft260_get_system_status_report *cfg)
+{
+	int ret;
+	int label_sz;
+	char *label;
+	struct ft260_get_chip_version_report ver;
+	struct ft260_gpio_read_request_report gbuf;
+	struct hid_device *hdev = dev->hdev;
+	char prefix[] = "ft260_";
+	u8 mode = cfg->chip_mode;
+
+	hid_info(hdev, "initialize gpio chip\n");
+
+	dev->gpio_uart_mode[0] = (u16)FT260_GPIO_UART_MODE_0_SET;
+	dev->gpio_uart_mode[1] = (u16)FT260_GPIO_UART_MODE_1_SET;
+	dev->gpio_uart_mode[2] = (u16)FT260_GPIO_UART_MODE_2_SET;
+	dev->gpio_uart_mode[3] = (u16)FT260_GPIO_UART_MODE_3_SET;
+	dev->gpio_uart_mode[4] = (u16)FT260_GPIO_UART_MODE_4_SET;
+
+	if (mode == FT260_MODE_ALL)
+		mode = FT260_MODE_BOTH;
+
+	if (mode & FT260_MODE_UART) {
+		if (cfg->uart_mode < FT260_GPIO_UART_MODES)
+			dev->gpio_en |= dev->gpio_uart_mode[cfg->uart_mode];
+		else
+			dev->gpio_en |= FT260_GPIO_UART_DEFAULT;
+	} else {
+		dev->gpio_en |= FT260_GPIO_UART_DEFAULT;
+	}
+
+	if (!(mode & FT260_MODE_I2C))
+		dev->gpio_en |= FT260_GPIO_I2C_DEFAULT;
+
+	if (cfg->gpio2_func == FT260_MFPIN_GPIO)
+		dev->gpio_en |= FT260_GPIO_2;
+	if (cfg->enable_wakeup_int == FT260_MFPIN_GPIO)
+		dev->gpio_en |= FT260_GPIO_3;
+	if (cfg->gpioa_func == FT260_MFPIN_GPIO)
+		dev->gpio_en |= FT260_GPIO_A;
+	if (cfg->gpiog_func == FT260_MFPIN_GPIO)
+		dev->gpio_en |= FT260_GPIO_G;
+
+	hid_info(hdev, "enabled GPIOs: %04x\n", dev->gpio_en);
+
+	dev->gc = devm_kzalloc(&hdev->dev, sizeof(*dev->gc), GFP_KERNEL);
+	if (!dev->gc)
+		return -ENOMEM;
+
+	label_sz = strlen(dev_name(&hdev->dev)) + strlen(prefix) + 1;
+	label = devm_kzalloc(&hdev->dev, label_sz, GFP_KERNEL);
+	if (!label) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+	snprintf(label, label_sz, "%s%s", prefix, dev_name(&hdev->dev));
+	hid_info(hdev, "initialize gpio chip on %s\n", label);
+
+	dev->gc->label			= label;
+	dev->gc->direction_input	= ft260_gpio_direction_input;
+	dev->gc->direction_output	= ft260_gpio_direction_output;
+	dev->gc->get_direction		= ft260_gpio_get_direction;
+	dev->gc->set			= ft260_gpio_set;
+	dev->gc->get			= ft260_gpio_get;
+	dev->gc->base			= -1;
+	dev->gc->ngpio			= FT260_GPIO_TOTAL;
+	dev->gc->can_sleep		= true;
+	dev->gc->parent			= &hdev->dev;
+
+	/* Wakeup chip */
+	(void)ft260_hid_feature_report_get(dev->hdev, FT260_CHIP_VERSION,
+					(u8 *)&ver, sizeof(ver));
+
+	ret = ft260_hid_feature_report_get(hdev, FT260_GPIO, (u8 *)&gbuf,
+					   sizeof(gbuf));
+	if (ret < 0)
+		hid_warn(hdev, "cannot read GPIO state: %d\n", ret);
+	else
+		dev->gpio = gbuf.gpio;
+
+	ret = devm_gpiochip_add_data(&hdev->dev, dev->gc, dev);
+	if (ret < 0)
+		hid_err(hdev, "cannot add GPIO chip %d\n", ret);
+exit:
+	return ret;
+}
+
 static int ft260_get_system_config(struct hid_device *hdev,
 				   struct ft260_get_system_status_report *cfg)
 {
@@ -934,29 +1389,36 @@ static int ft260_get_system_config(struct hid_device *hdev,
 	return 0;
 }
 
-static int ft260_get_interface_type(struct hid_device *hdev, struct ft260_device *dev)
+static int ft260_get_interface_type(struct ft260_device *dev,
+				    struct ft260_get_system_status_report *cfg)
+
 {
-	struct ft260_get_system_status_report cfg;
-	struct usb_interface *usbif = to_usb_interface(hdev->dev.parent);
-	int interface = usbif->cur_altsetting->desc.bInterfaceNumber;
 	int ret;
+	struct hid_device *hdev = dev->hdev;
+	struct usb_interface *usbif = to_usb_interface(hdev->dev.parent);
+
+	dev->iface_id = usbif->cur_altsetting->desc.bInterfaceNumber;
 
-	ret = ft260_get_system_config(hdev, &cfg);
+	ret = ft260_get_system_config(hdev, cfg);
 	if (ret < 0)
 		return ret;
 
-	ft260_dbg("interface:  0x%02x\n", interface);
-	ft260_dbg("chip mode:  0x%02x\n", cfg.chip_mode);
-	ft260_dbg("clock_ctl:  0x%02x\n", cfg.clock_ctl);
-	ft260_dbg("i2c_enable: 0x%02x\n", cfg.i2c_enable);
-	ft260_dbg("uart_mode:  0x%02x\n", cfg.uart_mode);
+	ft260_dbg("interface:  0x%02x\n", dev->iface_id);
+	ft260_dbg("chip mode:  0x%02x\n", cfg->chip_mode);
+	ft260_dbg("clock_ctl:  0x%02x\n", cfg->clock_ctl);
+	ft260_dbg("i2c_enable: 0x%02x\n", cfg->i2c_enable);
+	ft260_dbg("uart_mode:  0x%02x\n", cfg->uart_mode);
+	ft260_dbg("gpio2_func: 0x%02x\n", cfg->gpio2_func);
+	ft260_dbg("gpioA_func: 0x%02x\n", cfg->gpioa_func);
+	ft260_dbg("gpioG_func: 0x%02x\n", cfg->gpiog_func);
+	ft260_dbg("wakeup_int: 0x%02x\n", cfg->enable_wakeup_int);
 
-	dev->power_saving_en = cfg.power_saving_en;
+	dev->power_saving_en = cfg->power_saving_en;
 
-	switch (cfg.chip_mode) {
+	switch (cfg->chip_mode) {
 	case FT260_MODE_ALL:
 	case FT260_MODE_BOTH:
-		if (interface == 1)
+		if (dev->iface_id == 1)
 			ret = FT260_IFACE_UART;
 		else
 			ret = FT260_IFACE_I2C;
@@ -997,6 +1459,10 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
 }
 
+static void ft260_attr_dummy_func(struct hid_device *hdev, u8 req, u16 value)
+{
+}
+
 #define FT260_ATTR_SHOW(name, reptype, id, type, func)			       \
 	static ssize_t name##_show(struct device *kdev,			       \
 				   struct device_attribute *attr, char *buf)   \
@@ -1017,37 +1483,42 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 		FT260_ATTR_SHOW(name, ft260_get_i2c_status_report,	       \
 				FT260_I2C_STATUS, __le16, ft260_word_show)
 
-#define FT260_ATTR_STORE(name, reptype, id, req, type, ctype, func)	       \
+#define FT260_ATTR_STORE(name, reptype, id, req, type, ctype, strtou, func)    \
 	static ssize_t name##_store(struct device *kdev,		       \
 				    struct device_attribute *attr,	       \
 				    const char *buf, size_t count)	       \
 	{								       \
 		struct reptype rep;					       \
 		struct hid_device *hdev = to_hid_device(kdev);		       \
+		struct ft260_device *dev = hid_get_drvdata(hdev);	       \
 		type name;						       \
 		int ret;						       \
 									       \
-		if (!func(buf, 10, (ctype *)&name)) {			       \
+		if (!strtou(buf, 10, (ctype *)&name)) {			       \
 			rep.name = name;				       \
 			rep.report = id;				       \
 			rep.request = req;				       \
+			mutex_lock(&dev->lock);				       \
 			ret = ft260_hid_feature_report_set(hdev, (u8 *)&rep,   \
 							   sizeof(rep));       \
-			if (!ret)					       \
-				ret = count;				       \
+			if (ret < 0)					       \
+				hid_err(hdev, "%s: failed!\n", __func__);      \
+			else						       \
+				func(hdev, req, name);			       \
+			mutex_unlock(&dev->lock);			       \
 		} else {						       \
 			ret = -EINVAL;					       \
 		}							       \
 		return ret;						       \
 	}
 
-#define FT260_BYTE_ATTR_STORE(name, reptype, req)			       \
+#define FT260_BYTE_ATTR_STORE(name, reptype, req, func)			       \
 		FT260_ATTR_STORE(name, reptype, FT260_SYSTEM_SETTINGS, req,    \
-				 u8, u8, kstrtou8)
+				 u8, u8, kstrtou8, func)
 
-#define FT260_WORD_ATTR_STORE(name, reptype, req)			       \
+#define FT260_WORD_ATTR_STORE(name, reptype, req, func)			       \
 		FT260_ATTR_STORE(name, reptype, FT260_SYSTEM_SETTINGS, req,    \
-				 __le16, u16, kstrtou16)
+				 __le16, u16, kstrtou16, func)
 
 FT260_SSTAT_ATTR_SHOW(chip_mode);
 static DEVICE_ATTR_RO(chip_mode);
@@ -1061,27 +1532,46 @@ static DEVICE_ATTR_RO(suspend_status);
 FT260_SSTAT_ATTR_SHOW(hid_over_i2c_en);
 static DEVICE_ATTR_RO(hid_over_i2c_en);
 
+FT260_SSTAT_ATTR_SHOW(gpio2_func);
+FT260_BYTE_ATTR_STORE(gpio2_func, ft260_set_gpio2_func_report,
+		      FT260_SELECT_GPIO2_FUNC, ft260_gpio_en_update);
+static DEVICE_ATTR_RW(gpio2_func);
+
+FT260_SSTAT_ATTR_SHOW(gpioa_func);
+FT260_BYTE_ATTR_STORE(gpioa_func, ft260_set_gpioa_func_report,
+		      FT260_SELECT_GPIOA_FUNC, ft260_gpio_en_update);
+static DEVICE_ATTR_RW(gpioa_func);
+
+FT260_SSTAT_ATTR_SHOW(gpiog_func);
+FT260_BYTE_ATTR_STORE(gpiog_func, ft260_set_gpiog_func_report,
+		      FT260_SELECT_GPIOG_FUNC, ft260_gpio_en_update);
+static DEVICE_ATTR_RW(gpiog_func);
+
 FT260_SSTAT_ATTR_SHOW(power_saving_en);
 static DEVICE_ATTR_RO(power_saving_en);
 
 FT260_SSTAT_ATTR_SHOW(i2c_enable);
 FT260_BYTE_ATTR_STORE(i2c_enable, ft260_set_i2c_mode_report,
-		      FT260_SET_I2C_MODE);
+		      FT260_SET_I2C_MODE, ft260_gpio_en_update);
 static DEVICE_ATTR_RW(i2c_enable);
 
 FT260_SSTAT_ATTR_SHOW(uart_mode);
 FT260_BYTE_ATTR_STORE(uart_mode, ft260_set_uart_mode_report,
-		      FT260_SET_UART_MODE);
+		      FT260_SET_UART_MODE, ft260_gpio_en_update);
 static DEVICE_ATTR_RW(uart_mode);
 
+FT260_BYTE_ATTR_STORE(uart_dcd_ri, ft260_set_uart_dcd_ri_report,
+		      FT260_ENABLE_UART_DCD_RI, ft260_gpio_en_update);
+static DEVICE_ATTR_WO(uart_dcd_ri);
+
 FT260_SSTAT_ATTR_SHOW(clock_ctl);
 FT260_BYTE_ATTR_STORE(clock_ctl, ft260_set_system_clock_report,
-		      FT260_SET_CLOCK);
+		      FT260_SET_CLOCK, ft260_attr_dummy_func);
 static DEVICE_ATTR_RW(clock_ctl);
 
 FT260_I2CST_ATTR_SHOW(clock);
 FT260_WORD_ATTR_STORE(clock, ft260_set_i2c_speed_report,
-		      FT260_SET_I2C_CLOCK_SPEED);
+		      FT260_SET_I2C_CLOCK_SPEED, ft260_attr_dummy_func);
 static DEVICE_ATTR_RW(clock);
 
 static ssize_t i2c_reset_store(struct device *kdev,
@@ -1105,7 +1595,11 @@ static const struct attribute_group ft260_attr_group = {
 		  &dev_attr_hid_over_i2c_en.attr,
 		  &dev_attr_power_saving_en.attr,
 		  &dev_attr_i2c_enable.attr,
+		  &dev_attr_gpio2_func.attr,
+		  &dev_attr_gpioa_func.attr,
+		  &dev_attr_gpiog_func.attr,
 		  &dev_attr_uart_mode.attr,
+		  &dev_attr_uart_dcd_ri.attr,
 		  &dev_attr_clock_ctl.attr,
 		  &dev_attr_i2c_reset.attr,
 		  &dev_attr_clock.attr,
@@ -1402,9 +1896,15 @@ static int ft260_uart_change_speed(struct ft260_device *port,
 	req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_NONE;
 	req.breaking = FT260_UART_CFG_BREAKING_NO;
 
+	mutex_lock(&port->lock);
+
 	ret = ft260_hid_feature_report_set(hdev, (u8 *)&req, sizeof(req));
 	if (ret < 0)
 		hid_err(hdev, "failed to change termios: %d\n", ret);
+	else
+		ft260_gpio_en_update(hdev, FT260_SET_UART_MODE, req.flow_ctrl);
+
+	mutex_unlock(&port->lock);
 
 	return ret;
 }
@@ -1619,9 +2119,11 @@ static const struct tty_port_operations ft260_uart_port_ops = {
 
 static struct tty_driver *ft260_tty_driver;
 
-static int ft260_i2c_probe(struct hid_device *hdev, struct ft260_device *dev)
+static int ft260_i2c_probe(struct ft260_device *dev,
+			   struct ft260_get_system_status_report *cfg)
 {
 	int ret;
+	struct hid_device *hdev = dev->hdev;
 
 	hid_info(hdev, "USB HID v%x.%02x Device [%s] on %s\n",
 		hdev->version >> 8, hdev->version & 0xff, hdev->name,
@@ -1648,11 +2150,16 @@ static int ft260_i2c_probe(struct hid_device *hdev, struct ft260_device *dev)
 		return ret;
 	}
 
+	ret = ft260_gpio_init(dev, cfg);
+	if (ret)
+		goto err_i2c_free;
+
 	ret = sysfs_create_group(&hdev->dev.kobj, &ft260_attr_group);
 	if (ret < 0) {
 		hid_err(hdev, "failed to create sysfs attrs\n");
 		goto err_i2c_free;
 	}
+
 	return 0;
 
 err_i2c_free:
@@ -1660,14 +2167,15 @@ static int ft260_i2c_probe(struct hid_device *hdev, struct ft260_device *dev)
 	return ret;
 }
 
-static int ft260_uart_probe(struct hid_device *hdev, struct ft260_device *dev)
+static int ft260_uart_probe(struct ft260_device *dev,
+			    struct ft260_get_system_status_report *cfg)
 {
 	struct ft260_configure_uart_request_report req;
-	int ret;
+	struct hid_device *hdev = dev->hdev;
 	struct device *devt;
+	int ret;
 
 	INIT_WORK(&dev->wakeup_work, ft260_uart_do_wakeup);
-	// FIXME: are all kfifo access secured by lock? with irq or not?
 	ft260_uart_wakeup_workaraund_enable(dev, true);
 	/* Work not started at this point */
 	timer_setup(&dev->wakeup_timer, ft260_uart_start_wakeup, 0);
@@ -1708,6 +2216,20 @@ static int ft260_uart_probe(struct hid_device *hdev, struct ft260_device *dev)
 		goto err_hid_report;
 	}
 
+	cfg->uart_mode = FT260_UART_CFG_FLOW_CTRL_NONE;
+
+	if (dev->iface_id == 0) {
+		ret = ft260_gpio_init(dev, cfg);
+		if (ret)
+			goto err_hid_report;
+
+		ret = sysfs_create_group(&hdev->dev.kobj, &ft260_attr_group);
+		if (ret < 0) {
+			hid_err(hdev, "failed to create sysfs attrs\n");
+			goto err_hid_report;
+		}
+	}
+
 	return 0;
 
 err_hid_report:
@@ -1723,6 +2245,7 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct ft260_device *dev;
 	struct ft260_get_chip_version_report version;
+	struct ft260_get_system_status_report cfg;
 	int ret;
 
 	if (!hid_is_usb(hdev))
@@ -1737,6 +2260,7 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto alloc_fail;
 	}
 	hid_set_drvdata(hdev, dev);
+	dev->hdev = hdev;
 	mutex_init(&dev->lock);
 	spin_lock_init(&dev->read_lock);
 	init_completion(&dev->wait);
@@ -1770,19 +2294,16 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		 version.chip_code[0], version.chip_code[1],
 		 version.chip_code[2], version.chip_code[3]);
 
-	ret = ft260_get_interface_type(hdev, dev);
+	ret = ft260_get_interface_type(dev, &cfg);
 	if (ret <= FT260_IFACE_NONE)
 		goto err_hid_close;
 
-	hid_set_drvdata(hdev, dev);
-	dev->hdev = hdev;
-
-	if (dev->iface_type == FT260_IFACE_I2C) {
-		ret = ft260_i2c_probe(hdev, dev);
+	if (ret == FT260_IFACE_I2C) {
+		ret = ft260_i2c_probe(dev, &cfg);
 		if (ret)
 			goto err_hid_close;
 	} else {
-		ret = ft260_uart_probe(hdev, dev);
+		ret = ft260_uart_probe(dev, &cfg);
 		if (ret)
 			goto err_uart;
 	}
@@ -1818,6 +2339,8 @@ static void ft260_remove(struct hid_device *hdev)
 		tty_port_unregister_device(&dev->port, ft260_tty_driver,
 					   dev->index);
 		ft260_uart_port_remove(dev);
+		if (dev->iface_id == 0)
+			sysfs_remove_group(&hdev->dev.kobj, &ft260_attr_group);
 	} else {
 		sysfs_remove_group(&hdev->dev.kobj, &ft260_attr_group);
 		i2c_del_adapter(&dev->adap);
-- 
2.43.0

