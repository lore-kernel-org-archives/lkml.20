Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399840;
	b=IIKEUzF2nBnbS0b5lpvLXsudciLbbC6eQZoK6ZIkxzyEYlxFyAkOTjRZUxk8MhfByzsT
	 TCWq0tvTHOs5IVFbYXjaiSqW4KCkb07/cVeJ3+TO68N+1VLsBsoK51nduvifM71IgwE2Z
	 kcSOhYrucigXcMy0xLcVr9KrWnTtm0CGl2d8X+1hNvKfItM0c74dconB2oVtbXWHraLq4
	 LHlhEQoS5H7Wh8TISvGWbXMaGzhF9pzmQjJQd4hMLEBCa95bfGI6MVPugOcdoEysQ1YaD
	 u93hpv70HCwGVEqFgi2+tMhRQVEdv+lzJlj3R2NcpP0YKl21dbKOOiKVBw/7impeJaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uJVUWRv+X+dXynVZ6IIPhUljYt+AbMuyn+nbQfPo/N0=;
	b=D5U2ue+vMh+Nz3zzwFx7NNU482OYhlqZcoCAWeHPRVyFyFnxYZpCURG3llS/syrgniWo
	 pvYvfPZftaMnJdE68lBjPLMKlRCz8mZ3JPZVkVxKRCDd1PLDPc4LXvllW74G/s2qh5/7b
	 yAJhiHvAFXuoMzQUVAa9ZaIcPs6pGF/IAqAPE55SNuBWskJuGCjlKlj9rd3ERVWdkBb+a
	 AGdE2a2ECFx4dXxpNAiamF7WkpHTCZjdf0f0NnckBCSveVUlUBbwMf4sMR+P6vS+OMVBj
	 /MA+Cf9dTmV9g6bgglUjPPHYzYJ32Ehpam7cx3EyuGmM8R7xBHF/5ovCkQrgqpaXhFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd5EpnNO;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC6760A380E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC6760A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd5EpnNO
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a215e64962so12085165e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399839; x=1794004639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJVUWRv+X+dXynVZ6IIPhUljYt+AbMuyn+nbQfPo/N0=;
        b=yd5EpnNOD2uZtleapc+hZXnJ+TEjXTpUZJmmTe21kU25Yu9fYu/s/whBTAuP3x/wM1
         V8WVki5h1ivcr/NvTgB/TSTWqpQTfTVwqIwYn553dt0xaJtEb4TuWmeWmnHx1JLLAAxE
         KzWhcuPfI4kmVS06PeLeQrrNtckKErC+nCg+N1oO+yVXbrfyqwLpyZ5NFcj4nE6Mqdg9
         X6rQHL3kift3MfQof0XedmmzQedYkMTMeFTRGx1/MGrKVve+vxLlUKZTBOQ2EtMfYtQO
         rkHZJIzfu/mf50nmcYlvQACKBaK5OR7zp48II0T/3RsRzqTqddDLj3P1fHHUCj57nHC4
         8jZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399839; x=1794004639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJVUWRv+X+dXynVZ6IIPhUljYt+AbMuyn+nbQfPo/N0=;
        b=gRb17xAisshIahVXVB0YJKg+l6ZakDeSHAiDygsUusuTuml50jHwHCMpaE2vmzgTEA
         NQ6XSH1swRkPsEKf2mFTADZ0oKp5wpYLE+EzNhMqzi+YrKwontGx5b2qEOINJakyx6ip
         G8TTYgNvd02q3dDhgDflCB9kLpXnkYrti+Pwq1MnPCJ7fx8Vh4fY4rLER5J08c0rmFW2
         uGVCvrHF8jooIwgDEaxLJHOIhm4EdyoWZFo2kzlpCGQ3oIzAh+K45TmE2Tl33Bf9GFZk
         w1PFfJ/UteoRbXdTh/lUDHKoMm//WbYQ9A/ltGB0LwHyNZkHPL2es805uVluZ7nZSLDb
         0WTw==
X-Forwarded-Encrypted: i=1; AKwUvBx0J4WXaERyVpzZUv4O9jNgtIdZssp4AypPxYc+LdMWMwDwpj0erX3ahjEnDRp0rsJcsHbNt2lV7doIMMs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7g26IgC+RWd5igH3YDLPV0wCUUXu1Q3RIIFZeFjG5eMojR7pz
	qCN/XPnliglHGjgdJZmBjz1Gql1pd14VLsZscmABkzBCQiPM9EXJwXeQ
X-Gm-Gg: AYBFou1wM4o8qmebwvUVhVhqTJX9SD0x6u/eiRNVPAddpc+LzvRueKyiFJH7uYpvKmt
	lRbAjAzrxDudTyCHO8+4lsKyrWenkjo4knUK1bEtdkH8hpU29hlPTn9OInR7CaKnCoQPvFIAJfQ
	RGBxOr4tesJI6m63SDQaJuhBTTox3zFJ9Yo92/KUEBp9MBakviIlpswEgNEd9E/ssNrg8iFgnwV
	iIFqs0v0E8ezgVRLsmyIb2iYURt4frYdOY7W4qvB0VIETYF5yR+fNjflCSPSuiTxGL8koOTt222
	OLO5hNi1iX2wvMevvBmCDE/Nf9l8ZTIA/Y/atk5p4QJwliQcyCceZ6Oz4PBsxMoYf0/xQ341yZP
	xfLmO7IzbXktWCri0FPSBCx/0pUVhrlyjnvoiPMBeKLorzLYyd9ycd6rHHYk61lCNUg7WxgK+6A
	gXxfV5+9HsHh28xKUsRQ5kiN/YGzDFYPDlO1XJUU5slqNcCyynr/LtPCf1hH23ZJxKEBhVBQ7Zr
	6Kxqi5qkGVgP5fRIMIM+s1ANTvASVG3CGp45mwutwu/cp1IlDZl8FjZh5KLEm7vW0EZvAd8mJUN
	9fy/fscWi1MsXkDMyozSJFJwaE1v
X-Received: by 2002:a05:600c:1f93:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4ac182dbc34mr81626205e9.14.1793399838726;
        Fri, 30 Oct 2026 15:37:18 -0700 (PDT)
Received: from m2.. ([37.142.145.227])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm5457300f8f.45.2026.10.30.15.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:37:18 -0700 (PDT)
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
	Michael Zaidman <michael.zaidman@gmail.com>,
	Chris Keeser <chriskeeser@meta.com>
Subject: [PATCH v2 10/15] HID: ft260: i2c: fix large write transaction failure
Date: Sat, 31 Oct 2026 00:36:32 +0200
Message-ID: <20261030223637.86907-11-michael.zaidman@gmail.com>
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

Fixes a regression from commit 5afac727defa ("HID: ft260: missed NACK
from busy device"), which waited for bus-idle after every HID write
report except when the report flag was exactly FT260_FLAG_START.

Multi-report I2C writes keep the bus busy between chunks for atomicity.
Treating those middle reports like a final STOP caused ft260_xfer_status()
to spin on -EAGAIN after the second HID report and fail large writes.
Write-then-read combined transfers still worked.

Pass the bus-busy check policy from the caller: ft260_i2c_write() and
ft260_smbus_write() wait for idle only when the report they send carries
STOP; intermediate chunks and the command phase of a combined transfer
do not.

The SMBus side matters for register reads. The command phase is written
with FT260_FLAG_START and no STOP, because a repeated START read follows
and the controller deliberately keeps the bus busy to keep the
transaction atomic. Checking the busy bit there makes
ft260_xfer_status() return -EAGAIN on every retry and the command write
fail with -EIO, which breaks probing of clients that read registers:

  ads1x19 6-0040: Failed to read config register: -5
  leds-pca963x: probe of 6-0008 failed with error -5

Fixes: 5afac727defa ("HID: ft260: missed NACK from busy device")
Reported-by: Chris Keeser <chriskeeser@meta.com>
Closes: https://github.com/MichaelZaidman/hid-ft260/issues/35
Tested-by: Chris Keeser <chriskeeser@meta.com>
Reported-by: Bruno Giacomazzi <brunoceg1@gmail.com>
Closes: https://github.com/MichaelZaidman/hid-ft260/issues/42
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index dca0250f2c25..65835e13fa2a 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -576,9 +576,14 @@ static int ft260_xfer_status(struct ft260_device *dev, u8 bus_busy)
 	}
 
 	dev->clock = le16_to_cpu(report.clock);
-	ft260_dbg("bus_status %#02x, clock %u\n", report.bus_status,
-		  dev->clock);
+	ft260_dbg("bus_status %#02x, clock %u, bus_busy %#02x\n",
+		  report.bus_status, dev->clock, bus_busy);
 
+	/*
+	 * Do not check the busy bit for combined transactions
+	 * since the controller keeps the bus busy between writing
+	 * and reading IOs to ensure an atomic operation.
+	 */
 	if (report.bus_status & (FT260_I2C_STATUS_CTRL_BUSY | bus_busy))
 		return -EAGAIN;
 
@@ -612,13 +617,10 @@ static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
 }
 
 static int ft260_hid_output_report_check_status(struct ft260_device *dev,
-						u8 *data, int len)
+						u8 *data, int len, u8 bus_busy)
 {
-	u8 bus_busy;
 	int ret, usec, try = 100;
 	struct hid_device *hdev = dev->hdev;
-	struct ft260_i2c_write_request_report *rep =
-		(struct ft260_i2c_write_request_report *)data;
 
 	ret = ft260_hid_output_report(hdev, data, len);
 	if (ret < 0) {
@@ -635,16 +637,6 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 		ft260_dbg("wait %d usec, len %d\n", usec, len);
 	}
 
-	/*
-	 * Do not check the busy bit for combined transactions
-	 * since the controller keeps the bus busy between writing
-	 * and reading IOs to ensure an atomic operation.
-	 */
-	if (rep->flag == FT260_FLAG_START)
-		bus_busy = 0;
-	else
-		bus_busy = FT260_I2C_STATUS_BUS_BUSY;
-
 	do {
 		ret = ft260_xfer_status(dev, bus_busy);
 		if (ret != -EAGAIN)
@@ -661,6 +653,7 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 			   int len, u8 flag)
 {
+	u8 bus_busy = 0;
 	int ret, wr_len, idx = 0;
 	struct ft260_i2c_write_request_report *rep =
 		(struct ft260_i2c_write_request_report *)dev->i2c_wr_buf;
@@ -673,8 +666,10 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 	do {
 		if (len <= FT260_WR_I2C_DATA_MAX) {
 			wr_len = len;
-			if (flag == FT260_FLAG_START_STOP)
+			if (flag == FT260_FLAG_START_STOP) {
 				rep->flag |= FT260_FLAG_STOP;
+				bus_busy = FT260_I2C_STATUS_BUS_BUSY;
+			}
 		} else {
 			wr_len = FT260_WR_I2C_DATA_MAX;
 		}
@@ -690,7 +685,7 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 			  rep->flag, data[0]);
 
 		ret = ft260_hid_output_report_check_status(dev, (u8 *)rep,
-							   wr_len + 4);
+							   wr_len + 4, bus_busy);
 		if (ret < 0) {
 			ft260_dbg("failed with %d\n", ret);
 			return ret;
@@ -731,7 +726,9 @@ static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 	ft260_dbg("rep %#02x addr %#02x cmd %#02x datlen %d replen %d\n",
 		  rep->report, addr, cmd, rep->length, len);
 
-	ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len);
+	ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len,
+						   (flag & FT260_FLAG_STOP) ?
+						   FT260_I2C_STATUS_BUS_BUSY : 0);
 	if (ret < 0)
 		ft260_dbg("failed with %d\n", ret);
 
-- 
2.43.0

