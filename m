Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399844;
	b=fRGvmc8py9Hfd3DIGmYFkgtrw2gv0yOk8YifwiAmyW18ENbAwMwuOKGFGk5G+hy6blSJ
	 opvH6heXjmfYP0UI3GzokfyQ7yOJZHyJ8KqipDPOzVobF4r8tGiIYErvCA9351FePJWPC
	 j5jzDynRZ6p0Hn2YRA70aaom2FC17SdzZWMAPzhHKCMuRbnjeonAzOtevKQ9UO0v1cZ1K
	 5UQpcU4LsKOb0EHAGZJijji73/3e9BGt5a53SB7BK0mLyZwLb2yVxFRiGRItpKzPCA2LJ
	 0EaD8lmCltVvWC+VgDUjr7XKUV0mwQ2wV7b9NSL1QtsPZ/kGfg1FNUrOY1Eb83xbEmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bn9sP7pOkBKUuF5Aq7GK16TVx6Ldega12jAxTTo8a7Q=;
	b=BiOwg9ShfliBWXOOLX1s7d1AB9JmfyMqvYFv1DtCycB3ijRPVz6vky5AdR4GmI0H/t5v
	 xjhDcWCjJr+zfMZypsu+uRjx24nMb1mV7MYkOz7Uq4H5noirdTwx6B73YTZxcocZ3wpys
	 AQR4Sxhmyv+hzoZYqadNS5aTI3Q80MFL0ge8tUFWF0uELfWRyufe+0mTTWNFKQ0K88YD1
	 zFyLkJ2Pm0umbpGrQN0VWf79rbMqdoifXiP7+Ps+AMmqXocBagqVymxWQZ1zjOn21bKyL
	 bT6AtPOW6JLhp4beyhMMfMlGUBHvXjZKVzlBreS+8yZNrGP8U1PDZJTk5EWmVUzKt5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pifx0fcG;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7319860A380F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7319860A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pifx0fcG
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1378847f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399843; x=1794004643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bn9sP7pOkBKUuF5Aq7GK16TVx6Ldega12jAxTTo8a7Q=;
        b=Pifx0fcGwSiAi84R/0GyOiDP/sPeKP90ZZvgVbVXOHsH2qGKD3XFyMbA174DfwERc9
         mG7RpOYhEBdiVa5MQwQ2Fme1LYeS+0lcFcOUFqtQpDpOYCbA7vCLiaioq+aSMxVYgozA
         rzPrC/wQHbzD+V5Cp4+6VP4QjFzLgAMclAXOYTOfc6wxUVIP1UfPLNDGVVgkv1Ubg97j
         KAnY2zewv1DCOTO6++QBv/5OWrFzyqKCWx/mzTjVjMBZ3iwvYKTUtg6Kn1BYIcn+OxYg
         9ewL3rsL+yLP/jmv2l3u23dQMWIrylSv2IiLB4ZboKEB340ga9xp7o/cgDHDPTkxy5mK
         CDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399843; x=1794004643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bn9sP7pOkBKUuF5Aq7GK16TVx6Ldega12jAxTTo8a7Q=;
        b=LHWn3qn+/BAcYwi2V1oiEFWQQw5p9s3p9FxVuJsYk9rwj8mh42GzSdt1F97l/uX/G+
         6loC38qZ+GUv+Zc7CZvCroYRNXRMzMVw5u9dCdTmfcSzptgCzx481oCcaXffIbj0W4mR
         w+Jz3Hm3gO16w8ZTMYlmWptS0pdLk/KLbknhry83U8vLW9+mhLmilQn7sFlaOjR2xKcj
         T1IdCo2HwsHhpxGsu9IkgyrHWSHfGdjlCa9u259ZuGYZeVO3EolxyipQNPW0KKzWufjd
         Clz7HSkHObvIG/rokrTZ3G1VZrMY0/niQ+zfDYNT309ISMkHIhgiUj9HlB4i3vaIlJqc
         a0Cg==
X-Forwarded-Encrypted: i=1; AKwUvBwtZs0K8FM5pOvaSPJWNsLvMC/OXDNcaop2bGAEEijM578+qOnIhRrThOL7GxCTq+YskOZhfs9lpMvd3wg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRfKcaR6IIhvBBoCy9E1Ku4X7lQMmMuVnXrMJF1pA3pDmiiXhn
	PwHaxxDkv6NMTmRSQcxWIjMOkrzU4jRQWZQBuHEN7TeBBu0knWR4Gg2+C+b2lCwtazA=
X-Gm-Gg: AYBFou2Wb1CjRkNR9UG5if/DdRA54Igbx6AKuAWCao0eoT7EsaPzP3HVM3eYc2y76mf
	93SDgRahnamY1dFnmtAIKysMVg9bSCbuk2bjIWV6tG4zwVQ34lvuJ9J6Ol/yPtTcJkcDcg1sx/I
	6C2aPm1/6jOAyOR9/UPVHrsIZOzc9afGrbxLZsow2Z0m/oL9ij2HROwkUy/GnRj/F/uBkfWgvOH
	0wtovUAtqImqNwN9Dmbtisxo8c2oCOUFzjYz9i8Dgcmp0H6G53YRM7F1/uPCKKXxfm97s9vYcoP
	SgmVQ/KLwE02B/oYI48MBc4M9+Ii5UBPmPegbPVXWqBGdrGyvsGWaa0ge9P3D+vJGaP7Z7xO7kZ
	RUNmjDmneadcmN2ZcDp/QFT5MUuxdUq/Jawbb1bew0ab/YeUlz4HHfy0HeRwJCDK9hBk3eBUnXH
	Ls816cOwF7hz744GO/ATNTOLoEJYiv0t3PTgLo+pKzq9kT93EZJWG3N6ITFyJFEvobaW8BQYe8L
	RsT4fHG81VwtuP2Ub9ZjOvV+CEscPtf95Qb3Dvow6GsJNAv3pAgTITrEm9BY/H/Txyp/ilMrzV+
	tjUlGWaQmHJx69/PjU2Uzto383wf
X-Received: by 2002:a05:6000:1146:b0:48e:d40:a87c with SMTP id ffacd0b85a97d-48e64bba760mr13304359f8f.16.1793399842774;
        Fri, 30 Oct 2026 15:37:22 -0700 (PDT)
Received: from m2.. ([37.142.145.227])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm5457300f8f.45.2026.10.30.15.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:37:22 -0700 (PDT)
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
Subject: [PATCH v2 12/15] HID: ft260: i2c: abort in-flight transfers with STOP before reset
Date: Sat, 31 Oct 2026 00:36:34 +0200
Message-ID: <20261030223637.86907-13-michael.zaidman@gmail.com>
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

A transfer that ends without STOP leaves the FT260 I2C controller
with BUS_BUSY set. I2C reset (AN_394 section 4.4.15) restarts the
master but, with the driver still bound, status stays 0x60
(CTRL_IDLE | BUS_BUSY) even when SCL and SDA are pulled up. The
next START then fails with 0x72 (arbitration lost + error) and
further resets do not recover; only a USB replug did.

Add ft260_i2c_abort(): a STOP-only write (flag 0x04, zero payload)
then FT260_SET_I2C_RESET. Use it wherever the host tears down an
open transaction:

  - read wait timeout
  - read status check failure after the HID report arrived
  - write status poll failure after the report was sent
  - SMBus block read with an invalid count (count phase has no STOP)

Leave ft260_i2c_reset() alone for HID output failure (the request
may never have reached the controller), sysfs i2c_reset, and probe.

Tested on a UMFT260EV1A with a 24LC512 at 0x51. Five 1 ms read
timeouts each followed by STOP+reset left bus_status 0x20; raising
the timeout to 25 ms on the same loaded module then read 16 bytes
successfully.

This matters more with the 25/75 ms completion timeout from
"HID: ft260: i2c: reduce driver module loading time", which makes
read timeouts more likely than mainline's 5000 ms wait.

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 43 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 923ce6ee9dcf..50f68790c04d 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -549,6 +549,33 @@ static int ft260_i2c_reset(struct hid_device *hdev)
 	return ret;
 }
 
+static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
+				   size_t len);
+
+/*
+ * STOP with no START and no payload. Used by ft260_i2c_abort() when
+ * tearing down an in-flight transfer: I2C reset alone can leave
+ * BUS_BUSY set even when SCL/SDA are idle, and the next START then
+ * fails with arbitration lost.
+ */
+static int ft260_i2c_stop(struct hid_device *hdev, u8 addr)
+{
+	u8 buf[4] = {
+		FT260_I2C_REPORT_MIN,
+		addr,
+		FT260_FLAG_STOP,
+		0,
+	};
+
+	return ft260_hid_output_report(hdev, buf, sizeof(buf));
+}
+
+static int ft260_i2c_abort(struct hid_device *hdev, u8 addr)
+{
+	ft260_i2c_stop(hdev, addr);
+	return ft260_i2c_reset(hdev);
+}
+
 static int ft260_xfer_status(struct ft260_device *dev, u8 bus_busy)
 {
 	struct hid_device *hdev = dev->hdev;
@@ -618,7 +645,8 @@ static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
 }
 
 static int ft260_hid_output_report_check_status(struct ft260_device *dev,
-						u8 *data, int len, u8 bus_busy)
+						u8 *data, int len, u8 addr,
+						u8 bus_busy)
 {
 	int ret, usec, try = 100;
 	struct hid_device *hdev = dev->hdev;
@@ -647,7 +675,7 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 	if (ret == 0)
 		return 0;
 
-	ft260_i2c_reset(hdev);
+	ft260_i2c_abort(hdev, addr);
 	return -EIO;
 }
 
@@ -686,7 +714,8 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 			  rep->flag, data[0]);
 
 		ret = ft260_hid_output_report_check_status(dev, (u8 *)rep,
-							   wr_len + 4, bus_busy);
+							   wr_len + 4, addr,
+							   bus_busy);
 		if (ret < 0) {
 			ft260_dbg("failed with %d\n", ret);
 			return ret;
@@ -727,7 +756,7 @@ static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 	ft260_dbg("rep %#02x addr %#02x cmd %#02x datlen %d replen %d\n",
 		  rep->report, addr, cmd, rep->length, len);
 
-	ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len,
+	ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len, addr,
 						   (flag & FT260_FLAG_STOP) ?
 						   FT260_I2C_STATUS_BUS_BUSY : 0);
 	if (ret < 0)
@@ -795,7 +824,7 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 		timeout_jiffies = msecs_to_jiffies(timeout);
 		if (!wait_for_completion_timeout(&dev->wait, timeout_jiffies)) {
 			ret = -ETIMEDOUT;
-			ft260_i2c_reset(hdev);
+			ft260_i2c_abort(hdev, addr);
 			goto ft260_i2c_read_exit;
 		}
 
@@ -809,7 +838,7 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 		ret = ft260_xfer_status(dev, bus_busy);
 		if (ret < 0) {
 			ret = -EIO;
-			ft260_i2c_reset(hdev);
+			ft260_i2c_abort(hdev, addr);
 			goto ft260_i2c_read_exit;
 		}
 
@@ -993,7 +1022,7 @@ static int ft260_smbus_xfer(struct i2c_adapter *adapter, u16 addr, u16 flags,
 				hid_warn(hdev,
 					 "smbus block read: invalid count %u from slave 0x%02x\n",
 					 count, addr);
-				ft260_i2c_reset(hdev);
+				ft260_i2c_abort(hdev, addr);
 				ret = -EPROTO;
 				goto smbus_exit;
 			}
-- 
2.43.0

