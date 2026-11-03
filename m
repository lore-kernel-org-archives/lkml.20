Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746247;
	b=EbnDu1KmOfbq+9/3NTNGdoWRlRrDoo1RXTZeYngxwN1q47JzmpX9hidhJalYxaBljPPn
	 mx2BuSteJgESrO3hhHrn8UlAv3ln//cOGYbgw7PuBTOKKtL+RRqjLMXzpJVYggVa+/FK5
	 ns0n6bL52NXl6MP80wL3/2JuG1TDvhv14VCD5cCYlGp2PzQVvaQ5YU6hejuFxKaYEAQ0b
	 YR1MmMZYHBzFd/5xJXRcHhx/o2UqteseNGa9FNoUAkJfTP0pMTAYn8cmog8ab6EQ2wOYG
	 7/ATMw/u3psjZWjXAz21u5rmhIWMi1Eu3MwopvJ3i/A0oaacRX5V3ZvTowzJGTmTX0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=LlFo2ep2P1KPlq/R+Mfiz9sgo8hglVDiwuMn3YrPXds=;
	b=jaE+n/1asFs/5UwPAacMrzpNoJYwD00EytLP18N0fLrdCv+dl+3VFxYRxez+3MTddhEA
	 B30PE2xdaLbJkwGyYfizQJVE/m6qGQIwzNGAzSl7YJTK376hVv7JZfsRrNMlhpUUygS8X
	 A598U9L5Ldbo7wSnNYigitm5V8dhhs0JJIBbUeBJUW3MR88CdIT+szVZB2FAcclmLfbjf
	 j4QU09lI4ERey7Xh2hH6GOJN0YdHTtCVmTo0S8qoBo8aHwfaHy11QzcjZmEMgPD2LjRlB
	 Lo1gLpSYkZln+FnGMwLe1B4a053X6vE0OxzAWTfeEUk+vtWy1pN16YbxuN9VkbDv3jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="o2/V0RJ2";
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2766606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2766606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2/V0RJ2
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2761c69fbso325084c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793746246; x=1794351046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LlFo2ep2P1KPlq/R+Mfiz9sgo8hglVDiwuMn3YrPXds=;
        b=o2/V0RJ2Hi3g+gmEbMtNuOkrlTrbVO6X1S5M5X4R8Dz45BdmpG3iBjItK2kT9uQTzA
         Ih4cMV0rdNcIYoCS7aaFZjZns+KmciLD1fDDE6x88ttWG6WM1I6v81zq53bgsfNMF5pS
         WSDCc8SF+NY6Y7iMU+iA9Wd8x9oECfFF7pY7noqOtGM4Rw1L/JButaOH1WYsAyFPLT5M
         F1Ekmr+NaispYfZ9ypQk2Rbwne1ODljAN7ihhxbl/HNgQFn+QxhlKWw0/AIb+xXCrWmx
         7SLCN0CQOfemq9tkuUXFUwv1EVTEBrDnmBB5yul0dd1e7uhRiBXERAlWuehcSRmGW44J
         P7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793746246; x=1794351046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlFo2ep2P1KPlq/R+Mfiz9sgo8hglVDiwuMn3YrPXds=;
        b=hgsFbq5RKQrkIWo/WSh6Ao9KHFAnTMZtYQzfki7eq8DHOAvcidEUkUyavAwV8uShiB
         aJlA82Tdy/taQlWZt3++QGcnzWLV733r8dv70FzxIGPZZfyYSD+yBeG+yAAuHfES9eMZ
         zS4Q/4ktDJ32PRqXOjmsYt5L+ctgJ2cKYKQLOr7r7Qag6U057uYxNS/RebdjHFEbnJ0d
         5BIqDBrdwQWdT3LG5efKkpiPbyEVvNpAq/HzYU1IK/p/RLSTo7F+DwzoxcHiH8Sm86/M
         FKMjL9WAFcNBxiexLmGUnVXfwhotJ1rD1j0CTAX88wkQxea80W2GBmtkvygvxRGNR8Bx
         r6/A==
X-Gm-Message-State: APuU4Z+wmh7BCSGR3c2REyTsG9tba56ToLEmsZNK1R93/I1V9EqRvEm3
	ZsG+nkFhM2WqJbCevloeHp7f5WwujwGVyIuAClmg6Xb0PXVlXdviBZyiwJZAxw==
X-Gm-Gg: AYBFou3JhfaeYNsmSbDMqtquB/xpWQ1STF81ica8l4Yb8NkvTsFixMybCuDFS82qscy
	HJsxi/71dbMsADcvRh4yBrr5Bf/l1CJaB3Cock2cKzuIgpBjvG5aZE4Ieahn3yk7CKUBJsgU71G
	PS8IuuqkaWyuBxE9+QW4jx02dXOvjXC9pwHRD/usqwONSS8MJkRBeQpMwVNhW6guFfswnLf3Vmf
	CgFjZU95vabJxJSS69n6yWyXotSvGuYPfv04s447Vz8YJd1tbvtaNJC6sFFAw+ZBY9SvbGqzGi9
	cRDaYQqFHQa6QUzSX5Utqqwee3+0y+XKQYdJZRg8nmjk82i8uXqSvgnWG1kBj+7X++39rkUEa+j
	SDNH6d+SCCifHJs9thFgwrGT38msUuYWGkgnNuoOFEk0YZfqwuyAjut/BAD+zEPnfmRAzmuw3ub
	/y4J+5MYUJJvdrABSSVUPXOgGMTJg68i/XkOQcsoTj+b98vANR+01LZafGBmIYh/73bVEEcVhNU
	efM7CgAcbzTuVW7jqEAel8R9PwlKUqyKEwHXsDGid91xaVoFZvRNLS0jq55G345EpDDFS3vRddf
	QkA8MAIV
X-Received: by 2002:a05:701b:4187:20b0:19b:1202:77f8 with SMTP id a92af1059eb24-1ac5bf91695mr23676431c88.32.1793746245851;
        Tue, 03 Nov 2026 14:50:45 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm2781161c88.17.2026.11.03.14.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:50:43 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: macro@orcam.me.uk,
	Florian Fainelli <f.fainelli@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM)
Subject: [PATCH RFC] rtc: m41t80: Support SMBus adapters without I2C block transfers
Date: Tue,  3 Nov 2026 14:50:26 -0800
Message-ID: <20261103225027.1248035-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The M41T81 on the Broadcom BCM91250E (Sentosa) is connected to the
SiByte SMBus controller. The controller supports SMBus byte and word
transactions, but not the I2C block transfers required by rtc-m41t80,
so the driver refuses to probe.

Use the I2C core's block-read emulation and provide a byte-write
fallback, retaining native block transfers when the adapter supports
them. Propagate transfer errors and reject short reads.

Individual byte or word reads do not latch the complete clock register
set. Recheck seconds after reading the time on adapters without block
reads and retry up to three times if the clock rolled over. Return
-EAGAIN if a consistent sample cannot be obtained.

Maciej W. Rozycki proposed SMBus-only support for this RTC family in
2008. The same SiByte limitation was discussed again in 2018, including
register latching, seconds rechecks and a possible regmap conversion.
This change revisits that approach using the current I2C helpers.

RTC access and date retention across a reboot were verified on a
BCM91250E. Host tests with mocked SMBus transfers covered native and
fallback paths, rollover retries, short reads and transfer errors.
Alarm operation and retention after a power-cycle were not tested.

Link: https://lkml.rescloud.iu.edu/hypermail/linux/kernel/0805.1/1778.html
Link: https://lkml.rescloud.iu.edu/1811.1/07408.html
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/rtc/rtc-m41t80.c | 65 +++++++++++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 1385cb43864b..23d02b95a606 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -188,11 +188,41 @@ static irqreturn_t m41t80_handle_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/* Some SMBus adapters only support byte and word transactions. */
+static int m41t80_read_regs(struct i2c_client *client, u8 reg, u8 len, u8 *buf)
+{
+	int ret;
+
+	ret = i2c_smbus_read_i2c_block_data_or_emulated(client, reg, len, buf);
+	if (ret < 0)
+		return ret;
+
+	return ret == len ? ret : -EIO;
+}
+
+static int m41t80_write_regs(struct i2c_client *client, u8 reg, u8 len,
+			    const u8 *buf)
+{
+	int i, ret;
+
+	if (i2c_check_functionality(client->adapter,
+				    I2C_FUNC_SMBUS_WRITE_I2C_BLOCK))
+		return i2c_smbus_write_i2c_block_data(client, reg, len, buf);
+
+	for (i = 0; i < len; i++) {
+		ret = i2c_smbus_write_byte_data(client, reg + i, buf[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int m41t80_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	unsigned char buf[8];
-	int err, flags;
+	int err, flags, tries;
 
 	flags = i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
 	if (flags < 0)
@@ -203,12 +233,25 @@ static int m41t80_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		return -EINVAL;
 	}
 
-	err = i2c_smbus_read_i2c_block_data(client, M41T80_REG_SSEC,
-					    sizeof(buf), buf);
-	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to read date\n");
-		return err;
+	/* Byte reads do not latch the clock registers across a rollover. */
+	for (tries = 0; tries < 3; tries++) {
+		err = m41t80_read_regs(client, M41T80_REG_SSEC,
+				       sizeof(buf), buf);
+		if (err < 0)
+			return err;
+
+		if (i2c_check_functionality(client->adapter,
+					    I2C_FUNC_SMBUS_READ_I2C_BLOCK))
+			break;
+
+		err = i2c_smbus_read_byte_data(client, M41T80_REG_SEC);
+		if (err < 0)
+			return err;
+		if ((err & 0x7f) == (buf[M41T80_REG_SEC] & 0x7f))
+			break;
 	}
+	if (tries == 3)
+		return -EAGAIN;
 
 	tm->tm_sec = bcd2bin(buf[M41T80_REG_SEC] & 0x7f);
 	tm->tm_min = bcd2bin(buf[M41T80_REG_MIN] & 0x7f);
@@ -259,7 +302,7 @@ static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *in_tm)
 		buf[M41T80_REG_WDAY] |= (val & 0xf0);
 	}
 
-	err = i2c_smbus_write_i2c_block_data(client, M41T80_REG_SSEC,
+	err = m41t80_write_regs(client, M41T80_REG_SSEC,
 					     sizeof(buf), buf);
 	if (err < 0) {
 		dev_dbg(&client->dev, "Unable to write to date registers\n");
@@ -374,7 +417,7 @@ static int m41t80_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	}
 
 	/* Write the alarm */
-	err = i2c_smbus_write_i2c_block_data(client, M41T80_REG_ALARM_MON,
+	err = m41t80_write_regs(client, M41T80_REG_ALARM_MON,
 					     5, alarmvals);
 	if (err)
 		return err;
@@ -397,7 +440,7 @@ static int m41t80_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	u8 alarmvals[5];
 	int flags, ret;
 
-	ret = i2c_smbus_read_i2c_block_data(client, M41T80_REG_ALARM_MON,
+	ret = m41t80_read_regs(client, M41T80_REG_ALARM_MON,
 					    5, alarmvals);
 	if (ret != 5)
 		return ret < 0 ? ret : -EIO;
@@ -906,9 +949,9 @@ static int m41t80_probe(struct i2c_client *client)
 	struct m41t80_data *m41t80_data = NULL;
 	bool wakeup_source = false;
 
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_I2C_BLOCK |
+	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_BYTE_DATA)) {
-		dev_err(&adapter->dev, "doesn't support I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_I2C_BLOCK\n");
+		dev_err(&adapter->dev, "doesn't support I2C_FUNC_SMBUS_BYTE_DATA\n");
 		return -ENODEV;
 	}
 
-- 
2.53.0

