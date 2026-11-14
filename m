Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697735;
	b=SlQSPB3ZivGmyUfdGNQK2fuP7k5WxPEMoJCdVsz0trq9O2MdI6H4gEMfYG0Q2dXD90UZ
	 mB4awrpGjlzAtCePWVYeu9d03VYpQoi58qydBk0d3986qhltAYT+wrOnUBZC7KMLERjES
	 rk1Q/4L69HJJDpvstSnqFT4EZXVl/2Vl+UuzyDjFUOaez1cVpp/lh8freNyaRx5KE30sB
	 UQ9wvh/F7OFVnucJz7mo69dbI/c+ZJaKunpsNjRtTzs9CeegTHWFqnKF6vQsv6alnDnHb
	 XSiLXHSPy/OAZKQlZLZjiBx2h5mUiZ9cjper7tAtOwglrmREqO0egA7+Cjd87+3U59g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hh9ybCpP5y8fCdG/ue0SgeIlejwXAiQet93xa73o/ck=;
	b=GZEYoad96Me6j7o2W+94eTikElYbEOHaPQ34qLTFk+bsxHDFnIgfRTu/KaxOvun3FS2M
	 UqNwu/BOru/kEd6ClKMirhKQFm4Kl/WRrRqkmffIE1ODF+GuZzh//JdVjabD54725DtR2
	 1ObtaMy3LjjZGGOvjcho4OYqUDE8xSG7E1T3CvNmBga1PrOtXk2jG4kfuCZz0yTsWB1U5
	 Hp4kLegJqtVcym5EEacao8XujK579Ip+NzHnkOpIQmn3O4LFOWUYGu24abqM1PlonKIIJ
	 wjBgjYHWvR7z2yiAai8pq24KmA2/EYwTw9b5EDaoDO6kO6nQBojuyjYmuL7EVPofQCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jeFJb/c0";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18D260A6F5E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E18D260A6F5E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jeFJb/c0
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49412eb1474so1030961f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794697733; x=1795302533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hh9ybCpP5y8fCdG/ue0SgeIlejwXAiQet93xa73o/ck=;
        b=jeFJb/c01M9tftwZV+FhKblIVrnpLKLb+K0qW29KG8tNYlpIt2M0ZA/r3nSu2sNB00
         MwRBxF+fvkIJobYzGZlbR9zhP1oSohsw9+QLS/qLiDoNr215xRcFwSxqToxY1PgEr75G
         yYxSxbq6ZprH62dUFNhBIkEqmEUTIkYo0m3OKc18rbjj+64lwlFKnKcFeT/TuI2fIxO8
         PRtGSohTG4gGxMjlnn1dqiOCGxe2BYWtY9zeyiN91yQZltWhb0tuB8CrrBgn1XoUZV6A
         PZzeLPUWEFUUBdoh7wkx6yS4wTgfvAuxvZ7LbaWK0TgMCAYSd3RO1Vkt4JkvyslI6ypC
         8d8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697733; x=1795302533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hh9ybCpP5y8fCdG/ue0SgeIlejwXAiQet93xa73o/ck=;
        b=tC/b9FmkhXjHcooIau2G9ucWPUN/vWHxxON1WGviafKWMeTBFhpiB5rkoSZrcB/2tf
         zPRWnbBPh0jBDqFzoEuoSljX3UhcYKQuSpCj9SCF7h9gaJK/CdrtIcOxRuZSSzwRA8Qh
         AC9EVMeo/Bc+bR6vcYPE4M2ILlhmvXXEmjuYRQTzUh5fvfn4kqLwOKGqCNmOqKNHgsNq
         94IqpGdRgS6z6wOCKaR0eGXr93qIbt9AZbS2qD4c0FplYScc+TaaeO1dEC5kVjisWQ+x
         FpyVKscDQRMEEfUDTKcMG/TbkQId/sRpSONi0tpkQjD6IM3fEJOd3UOnuC6ErlxXmi3J
         EeFA==
X-Forwarded-Encrypted: i=1; AL+hErHuwv1y6fQrdNMeURvBtA4k9oNb2YOGSoqygT6u5qn3Yc891pjsP4UNLwOHqHyuVVPr4fHyjWfBOKNEq6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/TF2aC+VQUaO8bP75eG0tOYOfbG9Vh7X/r0wWbL0tSHoalZFZ
	CIrHy8qXfSC9pIFxnpqrrRGby1H3naRX1fQQ+6k4naVY/EOYl+TskQ+c
X-Gm-Gg: AYBFou14TgMcfxZaA3eLHLbaH5rIb0JZ4v0/3HhAd6SLa80gbKuUUr/I6XLgFuJPUh7
	ODud3R0XGUIWCpFB7Qid7Kc9r8YCLx+sqzmfQDIbkHZ0FVWRaf8mu27FqYM2M4yYvr5Xr9PRCXx
	07jirQhgR/3TQWjl+Hcyek7+N/DKfe31WRx0pq4eQbFu8QLS7iemBYuN4qqdufqz1U8r4EfE2cl
	AxOVfgp7A2rN+7GVVy/4gSYfxQNcNRl1nLvCTDKZqJADqh4DlKDBJq3Pr//E5f9PGiEZtsUM1uf
	fN/DOopeMnylJZjFdQGm/lyq2iYt1EqCw8aCK6GaMhp0hEW4l+gQats/xScNac1aEvbhRWi1z0O
	Y3lObZeiUxoNtveZU1qhAeSAGoaId5m/qJ9zCV7o8DePZNHpgweYkv4iE4wVtr7PlfGkDnO3JPf
	Go2dCWiUBH5kZVDCs8nwv5CLPvs3bx943hZCvIsGkKoQzLhztjOgnYRpfqJQMU88jZ7CrsGr5Ng
	qekz6WGkbKcuv53SkUTQujJBWgOShXNhAkvHNOBV3iZcYmtOabI18T7XffmpfcZkD1JJAj7gzLt
	d7vNdklNZaAry4OpwUInq7v9bTbj
X-Received: by 2002:a05:6000:1a8a:b0:48b:f93:3b87 with SMTP id ffacd0b85a97d-49c726da6e1mr15621389f8f.30.1794697733385;
        Sat, 14 Nov 2026 15:08:53 -0800 (PST)
Received: from m2.. ([37.142.149.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm14910018f8f.1.2026.11.14.15.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:08:53 -0800 (PST)
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
Subject: [PATCH v3 13/16] HID: ft260: i2c: reject an I2C clock outside the supported range
Date: Sun, 15 Nov 2026 01:07:57 +0200
Message-ID: <20261114230800.1344401-14-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114230800.1344401-1-michael.zaidman@gmail.com>
References: <20261114230800.1344401-1-michael.zaidman@gmail.com>
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

The clock sysfs attribute passes any 16-bit value to the chip. The chip
accepts it, reports it back in the I2C status report that clock_show
reads, and runs the bus at the 100 kHz default. A read of 2048 bytes
takes the same 0.298 s after writing 50, 3500 or 65535 as it does after
writing 100, while 60 and 3400 give 0.387 s and 0.058 s. Userspace has
no way to see that the value was not applied.

Refuse a value outside the 60-3400 kHz range named in the datasheet
section 4.4.16. ft260_uart_change_speed() checks the baud rate against
FT260_UART_CFG_BAUD_MIN and FT260_UART_CFG_BAUD_MAX, but termios has no
error return, so it falls back to 9600. A sysfs store can return an
error, so the clock store refuses the value.

FT260_WORD_ATTR_STORE() takes the parse function as a parameter now, so
a word attribute with no range of its own keeps passing kstrtou16.

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 5564ed62cc48..391128e4bb35 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -69,6 +69,11 @@ MODULE_PARM_DESC(debug, "Toggle FT260 debugging messages");
 
 #define FT260_WR_I2C_DATA_MAX 60
 #define FT260_WR_UART_DATA_MAX 60
+
+/* I2C bus clock range in kHz, see the FT260 datasheet section 4.4.16 */
+#define FT260_I2C_CLOCK_MIN 60
+#define FT260_I2C_CLOCK_MAX 3400
+
 #define FT260_GPIOCHIP "ft260_gpio"
 #define FT260_GPIO_0_5_COUNT 6
 #define FT260_GPIO_A_H_COUNT 8
@@ -1592,6 +1597,25 @@ static void ft260_attr_dummy_func(struct hid_device *hdev, u8 req, u16 value)
 {
 }
 
+/*
+ * The chip takes any 16-bit value and reports it back in the I2C status
+ * report, but runs the bus at the 100 kHz default when the value is
+ * outside the documented range. The report gives no way to tell the two
+ * cases apart, so refuse the value here.
+ */
+static int ft260_i2c_clock_parse(const char *buf, unsigned int base, u16 *clock)
+{
+	int ret = kstrtou16(buf, base, clock);
+
+	if (ret)
+		return ret;
+
+	if (*clock < FT260_I2C_CLOCK_MIN || *clock > FT260_I2C_CLOCK_MAX)
+		return -EINVAL;
+
+	return 0;
+}
+
 #define FT260_ATTR_SHOW(name, reptype, id, type, func)			       \
 	static ssize_t name##_show(struct device *kdev,			       \
 				   struct device_attribute *attr, char *buf)   \
@@ -1649,9 +1673,9 @@ static void ft260_attr_dummy_func(struct hid_device *hdev, u8 req, u16 value)
 		FT260_ATTR_STORE(name, reptype, FT260_SYSTEM_SETTINGS, req,    \
 				 u8, kstrtou8, func, FT260_STORE_NATIVE)
 
-#define FT260_WORD_ATTR_STORE(name, reptype, req, func)			       \
+#define FT260_WORD_ATTR_STORE(name, reptype, req, strtou, func)		       \
 		FT260_ATTR_STORE(name, reptype, FT260_SYSTEM_SETTINGS, req,    \
-				 u16, kstrtou16, func, cpu_to_le16)
+				 u16, strtou, func, cpu_to_le16)
 
 FT260_SSTAT_ATTR_SHOW(chip_mode);
 static DEVICE_ATTR_RO(chip_mode);
@@ -1704,7 +1728,8 @@ static DEVICE_ATTR_RW(clock_ctl);
 
 FT260_I2CST_ATTR_SHOW(clock);
 FT260_WORD_ATTR_STORE(clock, ft260_set_i2c_speed_report,
-		      FT260_SET_I2C_CLOCK_SPEED, ft260_attr_dummy_func);
+		      FT260_SET_I2C_CLOCK_SPEED, ft260_i2c_clock_parse,
+		      ft260_attr_dummy_func);
 static DEVICE_ATTR_RW(clock);
 
 static ssize_t i2c_reset_store(struct device *kdev,
-- 
2.43.0

