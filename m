Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697720;
	b=nLYlKrHIuVcl+M+7MvIZ4WyCnmHShpDTpBHZCHlr+Do454stf91WbESJSmNLN9mQLjrm
	 ToCJ2EsbClw9i10DaygZ7HjWZGNVBG6oAW4DrGk5BNMjUS2Yx0YPlfoFpSn1r3Ip5r0VA
	 OcMZFL0f8lflqQ3YK6ROiLEi1ZvBSEtt+3O0hInmoXamsmLDpLR9dSzhpiKobr/Ui+5d1
	 T6bZEX8uKHNfatC5Ljb6bzvE0nAmXRzt1HXBWDmWoWbX/gcDLap/c7elxuUNd7xboi6WA
	 6JIIT2pAsIn8onGHwM1XZ7Kblr4vvbV7aHDkkw9R+KYBWmDsplUIheBSGz8mTva28zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6gQE3IU+t2cIqdtVZhrTpEEYl5O5vhKOK1Q7R6X/tsg=;
	b=GGBAcs9pRWkEJXmot3SSEi6BzzY8zg8cMaQXAz82JhBEjcvIVxP5yD+asuBGP9Cercss
	 8JqRc7sj080XHIhtixGukLNYL4Zuk9kQ5uR5wUhICG7ppV0yquw8qOvCuTrLBTp4GBf/t
	 hqqjXwDx9N+jEydUZzlXcI4Vf4/Hu8MqgGPtRjzBXIFm6ewHQqB4a1EjSLv7JUILMKW0q
	 jUfYtmLradquwABDQw52dDnHZDsV8InpAWSwyX4kSmw/Zbf3WPcosaRidVwzzomxwQ+Xz
	 Bn79HcHN91XP0MWd1jAS6SJIylNLrpc/xboBGjn/7LevwIcJ1g+HmmQx1fnvmW72l/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DzSqjZd2;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350DA60A263D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350DA60A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DzSqjZd2
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so22395985e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794697719; x=1795302519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6gQE3IU+t2cIqdtVZhrTpEEYl5O5vhKOK1Q7R6X/tsg=;
        b=DzSqjZd223Xa2elVAQbBkL6ejqVgE4nK5Yshf20ooHKziJQK2mgAEAXDKFgmVWyiSO
         nvKfNG6QmenzeaFXtWwoRLOAaH9ZcSxrlIAwL8mkpCirGe2nAx3S7j0x9qHIY8iv93o1
         udRKrfiuqFz7gRZ4sSRBLO382WKomnZYUdKJv7cpxeec3qzeQjF+vE8TP9VC81m0w0kn
         2OocJCXx2gFPpO3GS5le07hQKTb3fpdDiOO659DvFBekV3WFLiJ6x/ywAgBxzaGHB9dE
         rfINzOwENIrjTD/n8Jtc1ev1zXxRmQmhqX91w+Fj0XAi7H7sgTXrMEz1XR9KeKjaDQor
         DINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697719; x=1795302519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6gQE3IU+t2cIqdtVZhrTpEEYl5O5vhKOK1Q7R6X/tsg=;
        b=IGwbt6nNLBbofSs6nDJFruo+6wZrLOf8zamYjW+ujIqs4qjeKvqjZlgQvf8RnJyG8m
         U+QiP95RcFaFZAwB0Q4/GCkWLRslVFSLIzrm9/pRR+rQQzge0VFa1mhrBlktMk0scg63
         1MdzDc8myIOnm58kwNELSA8Cjc0NU/5t+8oZyuYJmimSDI3Jjt84xmTzLpX/SAKiMOXz
         buLi27vpUz2RH1mrnBWYqOryUXxryT4g59x/X1fQFhYTyeyVz02479pUOu58FgE6Vzq0
         3Q7btGzDiA1U6SGvzxu3MlXep4sGwW70o2JqFY31m4JI2pmDHLDdkrn3lTyc7yj5uFVt
         pKrw==
X-Forwarded-Encrypted: i=1; AL+hErGOGQgo4Yi+/UGn2VJzVVJpGvFtPzvd0hCuB9d6749xP7AxpQfy9oiJhH67aCT5yutwQkWDKlgIDK4LGAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z874sLc92ql8tkif5gDT9Isfwm+U8kJaO0BGmcv3aCGwcouxj9Q
	OW220m67kZjFxxDhFl5Us2ztQzJsb2Kz8pfz64nBSM/jB04JVk9UHIR9
X-Gm-Gg: AYBFou2WV61hvbFN13zYQXagzbRZkDQAd7nyixbyEmPk7ROh+5jcwxBd7aKZZa1oaZw
	n6RKiZqd2wtbm2+QuhoW1epvR+cSMZuHE7zz9hpmnO3Dz+jwkDnN7Zpgp17rbOmY3u9tCCOYgTc
	vFtjy/hlWnsHUr7KWRftNOXXoAI1dz6ZE9+rJHugE9S95svZjoTTw8ackQPCwN/DIqihC3TDAAa
	eC8F6U6qUctOQAItS7VC9SbaT2OO/oSxgJj9DbTpYMV4UtxCpNRwLE+sn86KkYV+c0yriBVas+l
	3WQZM2khDsS3yhLJvpQ8LhdLG7viQ7qYcc6AxJv736HH1aPrkYW5snwKO5ZGSd6HSCTaXs61KRP
	XjpWbQypJthcc6AMk+1Xvv5PiW96Wlv4L4ypvl1q3/VeX3AL92414/Zsqf/H0jnBi+MpHH4GFxb
	d508b2KAjBgtYGKJZ+O76fkKawoa4MFTzzPE5DwDZ2Fw6w+Dr81s7QqNgsC4RRs/wcjINrG5qCW
	BBRv7WOxwlFQa/LXSb8N3Ae+tOJt24f4ntvtkH59arLye9Nz9+00HHhw5evW5TEQqj1n+HTyQWt
	wbKlgIhapktoeaMLPy452JBzuVDg
X-Received: by 2002:a05:600c:588b:b0:4bb:643e:3b8a with SMTP id 5b1f17b1804b1-4bb643e3bd6mr54723335e9.17.1794697718472;
        Sat, 14 Nov 2026 15:08:38 -0800 (PST)
Received: from m2.. ([37.142.149.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm14910018f8f.1.2026.11.14.15.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:08:37 -0800 (PST)
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
Subject: [PATCH v3 06/16] HID: ft260: i2c: reduce bus-error message severity
Date: Sun, 15 Nov 2026 01:07:50 +0200
Message-ID: <20261114230800.1344401-7-michael.zaidman@gmail.com>
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

The driver logged errors when the FT260 reported an I2C bus error or
when ft260_i2c_write / ft260_smbus_write failed after such a status.
That was meant to flag unexpected failures, but bus scans (i2cdetect,
HWMON discovery, transceiver monitoring, and similar) hit missing
devices routinely and should not fill dmesg with lines such as:

  ft260 0003:0403:6030.0001: ft260_i2c_write: failed with -5

Keep returning -EIO, but print those via ft260_dbg. Still use hid_err in
ft260_hid_output_report_check_status for actual HID/USB transport
failures, which are genuine errors.

Drop the extra __func__ from the write-path ft260_dbg calls; the helper
already prints the function name.

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>

---
v2:
Fix for the issue reported by Sashiko: the write-path messages
printed the function name twice, because ft260_dbg() already prints it.
---
 drivers/hid/hid-ft260.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 13dbff661fab..270481766e2c 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -577,7 +577,7 @@ static int ft260_xfer_status(struct ft260_device *dev, u8 bus_busy)
 	 * to 1, bit 1 is also set to 1.
 	 */
 	if (report.bus_status & FT260_I2C_STATUS_ERROR) {
-		hid_err(hdev, "i2c bus error: %#02x\n", report.bus_status);
+		ft260_dbg("i2c bus error: %#02x\n", report.bus_status);
 		return -EIO;
 	}
 
@@ -611,6 +611,7 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 
 	ret = ft260_hid_output_report(hdev, data, len);
 	if (ret < 0) {
+		hid_err(hdev, "%s: failed with %d\n", __func__, ret);
 		ft260_i2c_reset(hdev);
 		return ret;
 	}
@@ -650,7 +651,6 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 			   int len, u8 flag)
 {
 	int ret, wr_len, idx = 0;
-	struct hid_device *hdev = dev->hdev;
 	struct ft260_i2c_write_request_report *rep =
 		(struct ft260_i2c_write_request_report *)dev->i2c_wr_buf;
 
@@ -681,7 +681,7 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 		ret = ft260_hid_output_report_check_status(dev, (u8 *)rep,
 							   wr_len + 4);
 		if (ret < 0) {
-			hid_err(hdev, "%s: failed with %d\n", __func__, ret);
+			ft260_dbg("failed with %d\n", ret);
 			return ret;
 		}
 
@@ -697,7 +697,7 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 			     u8 *data, u8 data_len, u8 flag)
 {
-	int ret = 0;
+	int ret;
 	int len = 4;
 
 	struct ft260_i2c_write_request_report *rep =
@@ -722,7 +722,7 @@ static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 
 	ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len);
 	if (ret < 0)
-		hid_err(dev->hdev, "%s: failed with %d\n", __func__, ret);
+		ft260_dbg("failed with %d\n", ret);
 
 	return ret;
 }
-- 
2.43.0

