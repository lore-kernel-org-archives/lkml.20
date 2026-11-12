Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466243;
	b=N2eELrwzKRP1QCi35T1T5+M/zwfrw5+EHZ9AwDa+b5WX3C5VeJuh7gZWb7JhWSZgaYHk
	 Yjj5uVb6JGVubJFieLUynPQwMlZ+W3CeToCvI+3go6oJ7z3HWQ4dkuZxXs6vfOLgLKpCz
	 oQPU/r6/g512/3oazP6/fjaWfzNT1r/mH7xyyp8zHoJfPEbhmR4xXj6LkAhf/4n+YFWwA
	 cKOnux73krWtUUQ58TaE1iffhzPzAaWxLMg1X/7kwWTJE5aZhVqLEfnA5rfTUjUXr1vM9
	 XQFR6C2PgXUhesx7A+oUNvmsSTJpnJhRV+QLJCA3/1Xka7c6rTtsK4WZjPUtEWBVisw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IJo5FhkmfRFeA3bVZuoHDTgSiU4n7TaRZfXtWJP39Do=;
	b=OP59Sn89X4YfO6fz+Vx0BJ+/mdxlkN+liGLEsshD4+LMkznLV3+U/qwDUr/ApKDQ8fWr
	 FUZ8DVZIua4pokD8g9YRdJTp0O43ISHGxKJPwGQm8FYYq2askqmj3qq4hbJbb53mjFsW8
	 vclQDa4dE7a8+aZzMGHLUBl2Xk+GhzsFtRDxpQSxIttt3naInQr2lUmCXFT8mhuHvJ9aw
	 KylnZoDw86hMHEhFLUS0uit8N5lcWms2M4i48mxBLNrIvPKvEDiiCGhCUtePM63PTMKLI
	 czDD71mwpMAsH/FiUAddLHjljIVm3MFRVyB4dmR6jAho6TdgeZPG+Bac3oww3qA+VUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fB+xE2Gi;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E5A606AE74
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1E5A606AE74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fB+xE2Gi
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so2430622a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466242; x=1795071042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJo5FhkmfRFeA3bVZuoHDTgSiU4n7TaRZfXtWJP39Do=;
        b=fB+xE2GisD7HuQoAFnSRD13Nkzm2JwK5vNXnnQY0Kb7Dp9mdzcPCTeFsQfYppD0w2t
         Taf/zUsWoWQBhbdhFbqtL/ju2t7rj7lXilJDHs+HA0T3B1N+UKwkufwGfca8+ED4UJQC
         cELXg8KQ2SUapFLn9nsCfjHsDgv6TD0qJxHwNMD5/EY860QofVuoU/A3aYp17YnNa6zf
         yp85DK8i6gUo0yhuAvfCBD2kyyLQLQ1fJfC91dLThFiAYsOyOm4vhzihJUM6JqDmREkc
         +HxhjEXZBRpSMv51x1/ngCA5i01Csw97zsk14w3Yqw2pu3ENt63BL6pI0kCcBDGHV9ZB
         HIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466242; x=1795071042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJo5FhkmfRFeA3bVZuoHDTgSiU4n7TaRZfXtWJP39Do=;
        b=CHb0o0Q4xyxWY4e+l7iufMr3FK5zdlnlOwdzRudx8YQ/iYBunyMoPEooaCsjOKp1kL
         lBreyf+LZc5fUngUbffUnhSyE1G2KCWTrk5G4zEQIuQabRrnMiBWxp/gExZnAwZoDQtn
         we17QhvUeHmyapzRE+FpHLxaSQPBQouyahES4WQoj5GYNylayVqYZiluvzGqDdcfYjT/
         adbUrxyEZ6q0HCRGdjVQsB1mRRVWLMIV2u84EKoNLdjUcr3Gz8R/kpsvdZTKKW7Wh+7p
         KvRNITdI4EdGD+ccjHveCnEytdjtLyix2/Xk/ymZB3BD5kIA/FGeaXfhpmqCviuRoiQY
         g/dQ==
X-Forwarded-Encrypted: i=1; AL+hErEwAcgHgkIP/83pQyQLEqBZr+SFYgQLPFF9eN9hIwPpwkNtFo2FKEDq/br6ZXOOYqmwd6fTpEAsStVpXDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hXgMBPzuVbv2ENhZeOvUOmhcR4fw2+eerxEIktTCDEn/lxSMW
	5w9a8J/7kmp10duKwz2ZafuFT7wMNjO+C3+qU/62OMrIXfZd9NWDZt1A
X-Gm-Gg: AYBFou0gChxwmzUIPCd0TnQ+c4575Rxf5AAortSgQs6FCEiuvEDnqR6iUsTv+Mg3Lin
	yIEN+bRSE9oJmjjp7TwGtrDppouck+/I5fdSNoNynNvuDFkxKFFR1+xuVCc4bJwwMQ3Mc95yI4c
	aLtq2+S032iyy912RDJpydBDFbLCQtoqx+yIj128AbvD5cELXyQQoRtc4pR2NA0DjrvED+W5WrG
	VC6W6K8QYGe8fcKKepLJCTcTVSMQmHCRlMOyXU9eX+D9Clk5NfNpvzKmLriaKDti/Bs/XhyKsgG
	xu9wceCgpS33rdY+c1ym7IHChQw043mGMeIzV95TDPxaNKm4SXOCrRGZMel7F4N2+Bp5is6iNRn
	aOU7KMW9W1jD1tGWdxm7F5XVGbdGtGI2djm/eWzbfZjMSwuJPLgJXt7lxht4WCM6RWYE/UT/zRQ
	OK2pS4Fk5IgY8y+uZAchXfVhxgpX6S3ke7bVUx6mQD+Vs/r5PaYTerI+a0kFRFKsoZ82F8v3M29
	8HewfRCDzSHFcaYdZwXzKByJhR7Rb/QvNziEoPOIoV6zeQ0maefz1+Wh4Q+D9c2mv1i5HF0+L6E
	vVG2xXRKX5P9Frvh5hiWTUe43KWpqojdrLtfD6PdF24i0atLqG8GWeObI35lDwS5zSGe1pA1Ls0
	r2bO8Tx5+DQANDDcf
X-Received: by 2002:a17:90b:4b05:b0:3ab:3675:8ed with SMTP id 98e67ed59e1d1-3b182efad65mr4640622a91.22.1794466242188;
        Wed, 11 Nov 2026 22:50:42 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8aae8sm3073297a91.14.2026.11.11.22.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:50:41 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Johannes Kirchmair <johannes.kirchmair@skidata.com>,
	Yuki Horii <yuuki198708@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-input@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] Input: tsc2007 - drop platform data support
Date: Wed, 11 Nov 2026 22:50:33 -0800
Message-ID: <20261112065037.1800467-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112065037.1800467-1-dmitry.torokhov@gmail.com>
References: <20261112065037.1800467-1-dmitry.torokhov@gmail.com>
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

Now that all in-tree board files (including SuperH ecovec24) have been
converted to generic device properties, legacy platform data support
is no longer needed.

Remove the platform data structure and associated hardware callbacks
from the driver, check the pen-down GPIO directly, and remove the
unused platform data header file.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/sh/boards/mach-ecovec24/setup.c     |  1 -
 drivers/input/touchscreen/tsc2007.h      |  4 --
 drivers/input/touchscreen/tsc2007_core.c | 89 +++---------------------
 include/linux/platform_data/tsc2007.h    | 23 ------
 4 files changed, 10 insertions(+), 107 deletions(-)
 delete mode 100644 include/linux/platform_data/tsc2007.h

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index f662a296a54c..1e41ed9d2cce 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -24,7 +24,6 @@
 #include <linux/gpio/machine.h>
 #include <linux/platform_data/gpio_backlight.h>
 #include <linux/platform_data/tmio.h>
-#include <linux/platform_data/tsc2007.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regulator/fixed.h>
diff --git a/drivers/input/touchscreen/tsc2007.h b/drivers/input/touchscreen/tsc2007.h
index e346fb4f7552..f65186b8e709 100644
--- a/drivers/input/touchscreen/tsc2007.h
+++ b/drivers/input/touchscreen/tsc2007.h
@@ -65,7 +65,6 @@ struct tsc2007 {
 	struct i2c_client	*client;
 
 	struct touchscreen_properties prop;
-	u16			model;
 	u16			x_plate_ohms;
 	u16			max_rt;
 	unsigned long		poll_period; /* in jiffies */
@@ -79,9 +78,6 @@ struct tsc2007 {
 	wait_queue_head_t	wait;
 	bool			stopped;
 
-	int			(*get_pendown_state)(struct device *);
-	void			(*clear_penirq)(void);
-
 	struct mutex		mlock;
 };
 
diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index e8d87cf00f8e..b3c4c0c9c42d 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -25,7 +25,6 @@
 #include <linux/i2c.h>
 #include <linux/math64.h>
 #include <linux/property.h>
-#include <linux/platform_data/tsc2007.h>
 #include "tsc2007.h"
 
 int tsc2007_xfer(struct tsc2007 *tsc, u8 cmd)
@@ -97,15 +96,15 @@ bool tsc2007_is_pen_down(struct tsc2007 *ts)
 	 *
 	 * The only safe way to check for the pen up condition is in the
 	 * work function by reading the pen signal state (it's a GPIO
-	 * and IRQ). Unfortunately such callback is not always available,
-	 * in that case we assume that the pen is down and expect caller
-	 * to fall back on the pressure reading.
+	 * and IRQ). When the GPIO is not available, we assume that the
+	 * pen is down and expect caller to fall back on the pressure
+	 * reading.
 	 */
 
-	if (!ts->get_pendown_state)
+	if (!ts->gpiod)
 		return true;
 
-	return ts->get_pendown_state(&ts->client->dev);
+	return gpiod_get_value_cansleep(ts->gpiod);
 }
 
 static irqreturn_t tsc2007_soft_irq(int irq, void *handle)
@@ -126,11 +125,11 @@ static irqreturn_t tsc2007_soft_irq(int irq, void *handle)
 
 		rt = tsc2007_calculate_resistance(ts, &tc);
 
-		if (!rt && !ts->get_pendown_state) {
+		if (!rt && !ts->gpiod) {
 			/*
 			 * If pressure reported is 0 and we don't have
-			 * callback to check pendown state, we have to
-			 * assume that pen was lifted up.
+			 * GPIO to check pendown state, we have to assume
+			 * that pen was lifted up.
 			 */
 			break;
 		}
@@ -166,9 +165,6 @@ static irqreturn_t tsc2007_soft_irq(int irq, void *handle)
 	input_report_abs(input, ABS_PRESSURE, 0);
 	input_sync(input);
 
-	if (ts->clear_penirq)
-		ts->clear_penirq();
-
 	return IRQ_HANDLED;
 }
 
@@ -210,14 +206,6 @@ static void tsc2007_close(struct input_dev *input_dev)
 	tsc2007_stop(ts);
 }
 
-static int tsc2007_get_pendown_state_gpio(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct tsc2007 *ts = i2c_get_clientdata(client);
-
-	return gpiod_get_value_cansleep(ts->gpiod);
-}
-
 static int tsc2007_probe_properties(struct device *dev, struct tsc2007 *ts)
 {
 	u32 val32;
@@ -252,49 +240,14 @@ static int tsc2007_probe_properties(struct device *dev, struct tsc2007 *ts)
 	if (IS_ERR(ts->gpiod))
 		return PTR_ERR(ts->gpiod);
 
-	if (ts->gpiod)
-		ts->get_pendown_state = tsc2007_get_pendown_state_gpio;
-	else
+	if (!ts->gpiod)
 		dev_dbg(dev, "Pen down GPIO is not specified in properties\n");
 
 	return 0;
 }
 
-static int tsc2007_probe_pdev(struct device *dev, struct tsc2007 *ts,
-			      const struct tsc2007_platform_data *pdata,
-			      const struct i2c_device_id *id)
-{
-	ts->model             = pdata->model;
-	ts->x_plate_ohms      = pdata->x_plate_ohms;
-	ts->max_rt            = pdata->max_rt ? : MAX_12BIT;
-	ts->poll_period       = msecs_to_jiffies(pdata->poll_period ? : 1);
-	ts->get_pendown_state = pdata->get_pendown_state;
-	ts->clear_penirq      = pdata->clear_penirq;
-	ts->fuzzx             = pdata->fuzzx;
-	ts->fuzzy             = pdata->fuzzy;
-	ts->fuzzz             = pdata->fuzzz;
-
-	if (pdata->x_plate_ohms == 0) {
-		dev_err(dev, "x_plate_ohms is not set up in platform data\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static void tsc2007_call_exit_platform_hw(void *data)
-{
-	struct device *dev = data;
-	const struct tsc2007_platform_data *pdata = dev_get_platdata(dev);
-
-	pdata->exit_platform_hw();
-}
-
 static int tsc2007_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
-	const struct tsc2007_platform_data *pdata =
-		dev_get_platdata(&client->dev);
 	struct tsc2007 *ts;
 	struct input_dev *input_dev;
 	int err;
@@ -307,10 +260,7 @@ static int tsc2007_probe(struct i2c_client *client)
 	if (!ts)
 		return -ENOMEM;
 
-	if (pdata)
-		err = tsc2007_probe_pdev(&client->dev, ts, pdata, id);
-	else
-		err = tsc2007_probe_properties(&client->dev, ts);
+	err = tsc2007_probe_properties(&client->dev, ts);
 	if (err)
 		return err;
 
@@ -318,8 +268,6 @@ static int tsc2007_probe(struct i2c_client *client)
 	if (!input_dev)
 		return -ENOMEM;
 
-	i2c_set_clientdata(client, ts);
-
 	ts->client = client;
 	ts->irq = client->irq;
 	ts->input = input_dev;
@@ -346,23 +294,6 @@ static int tsc2007_probe(struct i2c_client *client)
 	input_set_abs_params(input_dev, ABS_PRESSURE, 0, MAX_12BIT,
 			     ts->fuzzz, 0);
 
-	if (pdata) {
-		if (pdata->exit_platform_hw) {
-			err = devm_add_action(&client->dev,
-					      tsc2007_call_exit_platform_hw,
-					      &client->dev);
-			if (err) {
-				dev_err(&client->dev,
-					"Failed to register exit_platform_hw action, %d\n",
-					err);
-				return err;
-			}
-		}
-
-		if (pdata->init_platform_hw)
-			pdata->init_platform_hw();
-	}
-
 	if (ts->irq) {
 		err = devm_request_threaded_irq(&client->dev, ts->irq,
 						NULL, tsc2007_soft_irq,
diff --git a/include/linux/platform_data/tsc2007.h b/include/linux/platform_data/tsc2007.h
deleted file mode 100644
index a0ca52c41ccb..000000000000
--- a/include/linux/platform_data/tsc2007.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __LINUX_I2C_TSC2007_H
-#define __LINUX_I2C_TSC2007_H
-
-/* linux/platform_data/tsc2007.h */
-
-struct tsc2007_platform_data {
-	u16	model;				/* 2007. */
-	u16	x_plate_ohms;	/* must be non-zero value */
-	u16	max_rt; /* max. resistance above which samples are ignored */
-	unsigned long poll_period; /* time (in ms) between samples */
-	int	fuzzx; /* fuzz factor for X, Y and pressure axes */
-	int	fuzzy;
-	int	fuzzz;
-
-	int	(*get_pendown_state)(struct device *);
-	/* If needed, clear 2nd level interrupt source */
-	void	(*clear_penirq)(void);
-	int	(*init_platform_hw)(void);
-	void	(*exit_platform_hw)(void);
-};
-
-#endif
-- 
2.56.0.567.gdb80ae8cd5-goog

