Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F0A31F99A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 23:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789860415; cv=none; b=olT1VRLqmPV3T5jYCGywcs0E4I70MPSPceUa8N5nbDIYBJq9dzaThXp0gwDwtOxPyIZh4KkQH3C89jUqDYGDnOViDLNnYHiVXIHhJY0VpJDMXKqXPpHAzlugihIqeLv9CEq6yYhLXS6AgLyIzsou32grxOuNMS8QwTvahlgI4Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789860415; c=relaxed/simple;
	bh=8m3njsY7nU5rm+TvgEX6BcPAiD3cMEiHEU33wnu6NBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mNUmAYFlUoSho3py1EGo8TEjYWckQqsxaIAzUsz1p4ju3PKcK86Bk8f/0PAG1fuvC0fMXOj0fm5IMu+HYpvejMR6V9KZJUb/zwMqYF/JEtL3aKCljMMJc/aOZ9hHCwEPHIJHmPaFsJjjhjNRz9/+K4LqxclOZGwEnwzKOBgSejM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxeIzNpP; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxeIzNpP"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-399026951a2so310536a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789860413; x=1790465213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAG1Wt9duT4JjEVcuFDSCUzSYolrkP4eFLAnvXFQb/c=;
        b=CxeIzNpP0puvP0dL4SSflJCTzaOtGpBtKNaKU0wlAiWcomvqCF8a3B9SyGg5uHi3PR
         dwmbS3NcmDpPyFsq8XQVsAODu3rMEdLdpRMn+0j2nufvviS8iMTlnKhF0SffTyo4k3CH
         ie9eRHo5IN65PtFumfUNZdM/pirX/OrKh5hCZZSrLWNiS7CMtq85A86KB95suoSTw95h
         Uv8J+1ZrU6BMsnMkj12FUWdLgxEpuCF6jjXikxa1BGLnB2kcfARnRM0iRPyqO3N8o9SJ
         UbiMCj3OmoyBvZ3iC/CN6MWhV0OHKqN+eW4tY/gSDR4JTDv1KkHoHBnIqlEjqmPbTcrs
         5gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789860413; x=1790465213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAG1Wt9duT4JjEVcuFDSCUzSYolrkP4eFLAnvXFQb/c=;
        b=CLhb/7ftnoRvKQy5PGEInup9rNI7xvfq64sT/RGHLUNZOs7KvakypxmZM9QBgylpaL
         WGgJcV6+6S2DBA3p5qYI7FItHhF3x8Tag/lZ38rRORyBOOH+5EASCuQeKuOBWr6FTfjV
         6ah9AqAWmwKxQ/Z7T1oocY16wncOawXoMIyLnai40SvhPTfArITGzutON5UX8YruhxCZ
         cFe1c04sKZ+yzUyTOYROrKzgLFQl0YN/38Xtru6h/0fwU8mPfCr1I/RF17g8tRt5t/pv
         CZ5p7XeiRoycYJTUqrPFDHWUCRCThf/Ti5LbyUFutVOW/w2jTfG+f/pWSdxNz+IOcyyS
         Q2EA==
X-Forwarded-Encrypted: i=1; AKwUvBwCvuTVCG85l2/hTAzFYOZTRFZ0vqQv0G9ZnLtpb0/j4cfDhCxXSDkM+pYtyuyEaEsusLwLX9rnaMvbn4I=@vger.kernel.org
X-Gm-Message-State: AFuF++m+duMJ29Iz3iYgwhC7MXulXz793oE49J2px2G0RW0iokJwbeA7
	EKBQKQ7OeXSFg2dTEnz9RrUXynIe5PvsWMYbeJTE5CiG/OXfESJ/BAhp
X-Gm-Gg: AYBFou1Veo5oSoFY4mgA86cM1q95eLI2ZSNz8F7o9e4yAaZ+l/NOCKZASLnhBazAqVr
	JR6/SrJNKu5C+yoVpK294UpcltndZW6FJydXRA5NAO5A4umK9HBDHs/gqY9k4AzaIWg4ICpHslL
	griDsCZvCyWacQqxUtv+oc/txnCHx71eeVPROl+A+O/TwhV7Zrc4mPbcX7APJn5+6FxWd5VcZZY
	2pwZ0C8d90PVPzlxYmc6iBJuYrpxMub2jOWqVkoflm4eOCzHWOJtI0xMr60Ot77XLNt8Iu1R17m
	XUT17ipcM9ypG/nbvwfjHHqxZdy6TXuwRvzG/L6ZbfE6LQdCguHnv6bwJz3helr1dxw7zav3Ug+
	v4P9H8dPWuolqcuFn1x04lQH4EVRZxJG1sSf5hqnhhwgmulRj5Oea+Ha1YmZQTXzawdnXMeROsH
	ZfXKWVoYfLpuDwnJZFahCWMkb3RpoiNSq2XlRseSJBpa1MMDkEALbzZ0CW4wgAa2uWEYuzGdz6S
	MhDBpJVZjuOiFKSnjhz5eY0v71YxzArItDFJqL+4vwa8mOarNcVAiMU5mai3QlKkjlO/rbo+7Fo
	J+4ifGmy2AfZU2Qg6ww=
X-Received: by 2002:a17:90b:50c6:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-39e599ff59cmr11676598a91.5.1789860413482;
        Sat, 19 Sep 2026 16:26:53 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c33186490sm7218935eec.18.2026.09.19.16.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 16:26:53 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Navon John Lukose <navonjohnlukose@gmail.com>
Subject: [PATCH] i2c: designware: size the RX FIFO threshold to the queued transfer
Date: Sun, 20 Sep 2026 04:56:47 +0530
Message-ID: <20260919232647.448748-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i2c_dw_xfer_msg() leaves DW_IC_RX_TL at the 0 that i2c_dw_configure_mode()
writes, so the controller raises RX_FULL once per received byte. Program
RX_TL from the reads already queued, capped at half the FIFO until the last
message is queued, so there is room for the rest.

On an Arrow Lake-H LPSS core with rx_fifo_depth 32, a 22-byte HID report
costs 2.00 interrupts instead of 21.43, and a 452-byte descriptor 0.14
interrupts per byte instead of 1.64. Mean HIDIOCGINPUT latency rises from
2522 to 3268 us; holding /dev/cpu_dma_latency at 0 removes 94% of that.

Assisted-by: LLM
Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---
Tested on my machine, a Lenovo Yoga Pro 7 14IAH10, and one controller, an
Intel LPSS core with rx_fifo_depth 32, where it has been the daily driver
for the past five days.

The half-FIFO cap matches DW_IC_TX_TL. Untested: a RECV_LEN continuation
longer than one byte, and cores with rx_fifo_depth below 4.

The two interrupts left on a short read are a TX_EMPTY that only runs the
state machine and one RX_FULL coalesced with STOP_DET.

psys power fell about 1.25 W in one run. It is out of the changelog because
the figure depends on how deep the platform idles.

 drivers/i2c/busses/i2c-designware-master.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index a1bcc37..f4ad207 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -378,7 +378,7 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 {
 	struct i2c_msg *msgs = dev->msgs;
 	u32 intr_mask;
-	int tx_limit, rx_limit;
+	int tx_limit, rx_limit, rx_tl;
 	u32 buf_len = dev->tx_buf_len;
 	u8 *buf = dev->tx_buf;
 	bool need_restart = false;
@@ -484,6 +484,19 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 	if (dev->msg_err)
 		intr_mask = 0;
 
+	/*
+	 * Size the RX FIFO threshold to the reads already queued, so the
+	 * controller raises one RX_FULL for the whole burst instead of one per
+	 * received byte. While messages remain to be queued, cap it so RX_FULL
+	 * still arrives in time to drain the FIFO and let the next TX_EMPTY
+	 * queue the rest.
+	 */
+	rx_tl = dev->rx_outstanding;
+	if (dev->msg_write_idx < dev->msgs_num)
+		rx_tl = min_t(int, rx_tl, dev->rx_fifo_depth / 2);
+
+	regmap_write(dev->map, DW_IC_RX_TL, rx_tl ? rx_tl - 1 : 0);
+
 	__i2c_dw_write_intr_mask(dev, intr_mask);
 }
 
-- 
2.55.0

