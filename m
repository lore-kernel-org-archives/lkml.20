Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB0051E42F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699373; cv=none; b=hBf6wuL+ovt/V7OUuQbdRPFLzMpQefTTMs2aCNVwGQYBGlkZSlVsL9EkuZKVr4xU8b8P8xhBBW6Fk/LTFggEJbygABywtWQJrbWOVY3JY73Upmch6BhV+8Nt0Ni8ixzmy8ycSyepageQsllSKV0HXl54gPe1RqB0TYoZVmhI69w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699373; c=relaxed/simple;
	bh=vcT+Zzd+vE6Z39PInHOWe02MabNe9/BcK78DGCU2rYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZneQokNw//3HPfDtdsLzwV3OfyGTxu3rdecEM0IUWOXHeLfRuUGsJRAs41nNsTGBHTf4KaC/V5gyetRZV1Rbk5lsrtw1ZgZa6mTMyBJjAzHc37eFKPqznxTz1EM33I+QefVLlb+Q9kNmD5buRgcWoshh1IoHlKlD3P+QqMeTjMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=AgReUMU6; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="AgReUMU6"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3428f70d7e7so2584910eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790699371; x=1791304171; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cqCcPgjdXxsiX5Uof8ZqSQfzNKhH6HYTgE1PZuD8hcE=;
        b=AgReUMU6jgOEDqXVLt1shRIDs19yP8jccUvYFcQ3zu/C8p/OIvt3eR96PgV+Q7EZJ7
         32zTF0XwXEdQgTYi5YJCHyh7kNf5Ia8YWFNtoZcVqieeuCMwtuphtz6JhtyRxSwdXqzH
         hZJd9SACZG/KuyNcMztczGvv9UKrR9MPODBaSFWJ+1Go3m66oaOABe0PM8WKPNbqbqKT
         md8yRth/Rbocy0wrWtFVry18sFI9JvdfoaFaffwZd3s0pJ+RQcQSMDwr3mSP25bJQFQi
         a5wGhYqWT3qFYkSAFQxl9nK8dRVq1/O6xREtmJZR1ZXl2WP9vmYuCmsgCKOypFQg8xuy
         Gt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699371; x=1791304171;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cqCcPgjdXxsiX5Uof8ZqSQfzNKhH6HYTgE1PZuD8hcE=;
        b=NQ29hKQ1QjMkAUHXMNuGtP4NdXeO3fH+zODODelLOohiA5JVwBx/YIXgAMt6Hpo2yK
         iLKis2JI3ulHBTdH8sRk7YzukFFuHYEc0Ieg7mrkiM7pYXVmXe35HoxP+tAg/6SroSD7
         osoPyEY+O6J9P4Umzfpvn5cUQoIz8YFE6ZNASiFowBIWc++xtRHJaUlfDpaSiuw5EiJD
         Cz6tzdh4KBdczBjdfRhlusm6nbogpmo534MvDcMRYAZRuyX1NGuMz+Zp3urJ8Fdmyq4l
         8jAJBDaVQAq04PKvNn/hI8PQZgNnXQsFjp1MuFyg3uc0ytKtD1O5LpKQYIRb0CMdkK/6
         95PA==
X-Gm-Message-State: AFq9FYKOUyl2MPfaTF4fA2UkMw1sC2fIb62hncODnA36r0fr4O3RV3t3
	RtY1KyhcgkRwgkZ0dIjpOzSCZ2zMgaZx9syzDCSwRQOhl+28jMkbM+TwoA3CBDJ2YpnZDZEgrzK
	Zykhr01o=
X-Gm-Gg: AYBFou2Leq720yxNVhgkwAfzdFyl2Sfs7yttJ18USA2G/NfIdhAPqb7ZnhX8FqDorO7
	l/tSTHte5zcRKtuidwhk66dVeeFJWJ5qLyvwa/N3RkSZMCQozNyfaTCIkA+hRm5f+yk4HOz/Bi7
	tvu6ESogBJ2/jDl4hYf+lj626Kn38KcyIsSrfQWsf5Htj7I5lVrFw+Zt2WPuNCuAbUAazjGnvZi
	McXy/EMMq87kVALLpUjAvQtQjW0V3O6qQ2QYfgevWIafmg0f2wgcaOYlphb5n9oL8Fv0E4NWuzE
	2LDCYVBnJ4Yb/FsC5Su10GiL76r9O2nErVugQs36Np8+HXUqlHnBFPmHZxtAh6o8iGXBbaMGexM
	bh6bJ5ig5bb/DX6gl4sRxaVJJODBEnLuwhQl/6xBl+A80wohfzJFlPs/kiqZgrxuUpEd43kS78p
	ryizgwavjD076HMUGEOeGpgT4PjvGvFz6pqCN1RrDuZ4QgwmjQXwR/OsKTV+B1OAv8B0X1q4Yy4
	w==
X-Received: by 2002:a05:7300:c8c4:b0:34b:c0ff:765a with SMTP id 5a478bee46e88-34bc0ffa4f2mr1315748eec.0.1790699370046;
        Tue, 29 Sep 2026 09:29:30 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c383b2506sm512104eec.15.2026.09.29.09.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:29:29 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 29 Sep 2026 09:29:27 -0700
Subject: [PATCH] misc: eeprom_93xx46: send the command byte-aligned where
 needed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-eeprom-93xx46-fixed-bpw-v1-1-bc8444902279@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywrCMBSE4VcpZ+2BmErS+CriopeJHsE2JLYGS
 t/dBJcfw/w7JURBomuzU8QmSZa54HxqaHz28wMsUzFppY1yumMgxOXNrs35YthLxsRD+DI643z
 rrbK2p/IOEXWs5dv977QOL4yfmqPj+AH8Qf0PewAAAA==
X-Change-ID: 20260928-eeprom-93xx46-fixed-bpw-e869f3f7077a
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790699369; l=3636;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=vcT+Zzd+vE6Z39PInHOWe02MabNe9/BcK78DGCU2rYo=;
 b=wU//NRl4Z1fGxIKmd9i/7YB4rit3sfqfMfeu71o07ZrGTBlEF8jefwu8iDIKsmn5c4gg7N4c9
 NSMmLjGl7p+Dn/u6uiwqXQzfNrNZL4AklepIRKW83cvwGsNpGbdLlqY
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

A Microwire command is three opcode bits plus the address, so it is
never a whole number of bytes. The driver asks for it with
spi_transfer::bits_per_word set to that width, which works only on
controllers that can vary their word size. Controllers synthesised
with a fixed width cannot: the Xilinx AXI Quad SPI core takes
xlnx,num-transfer-bits at synthesis time and advertises
SPI_BPW_MASK() for that one value, so every transfer is rejected
with -EINVAL and the EEPROM cannot be used at all.

A Microwire device ignores its DI pin until it sees the start bit, so
where the controller cannot do the native width, pad the command with
leading zeros to two bytes and send it eight bits at a time. Only
leading bits are added, so the data phase that follows keeps its
alignment and needs no change.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Tested with a 93LC86C on an 8-bit AXI Quad SPI core: reads over the whole
array match a reference dump taken by driving the controller by hand, and
writes read back and are restored. Support for that part is posted
separately; nothing here depends on it.
---
 drivers/misc/eeprom/eeprom_93xx46.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/eeprom/eeprom_93xx46.c b/drivers/misc/eeprom/eeprom_93xx46.c
index f9c3ab52c2f9..b6d4f7b03975 100644
--- a/drivers/misc/eeprom/eeprom_93xx46.c
+++ b/drivers/misc/eeprom/eeprom_93xx46.c
@@ -102,6 +102,21 @@ static inline bool has_quirk_extra_read_cycle(struct eeprom_93xx46_dev *edev)
 	return edev->pdata->quirks & EEPROM_93XX46_QUIRK_EXTRA_READ_CYCLE;
 }
 
+static void eeprom_93xx46_cmd_xfer(struct eeprom_93xx46_dev *edev,
+				   struct spi_transfer *t, u16 *cmd_addr,
+				   int bits)
+{
+	if (spi_is_bpw_supported(edev->spi, bits)) {
+		t->bits_per_word = bits;
+	} else {
+		cpu_to_be16s(cmd_addr);
+		t->bits_per_word = 8;
+	}
+
+	t->tx_buf = cmd_addr;
+	t->len = 2;
+}
+
 static int eeprom_93xx46_read(void *priv, unsigned int off,
 			      void *val, size_t count)
 {
@@ -148,9 +163,7 @@ static int eeprom_93xx46_read(void *priv, unsigned int off,
 			bits += 1;
 		}
 
-		t[0].tx_buf = (char *)&cmd_addr;
-		t[0].len = 2;
-		t[0].bits_per_word = bits;
+		eeprom_93xx46_cmd_xfer(edev, &t[0], &cmd_addr, bits);
 
 		t[1].rx_buf = buf;
 		t[1].len = count;
@@ -201,9 +214,7 @@ static int eeprom_93xx46_ew(struct eeprom_93xx46_dev *edev, int is_on)
 	dev_dbg(&edev->spi->dev, "ew %s cmd 0x%04x, %d bits\n",
 		str_enable_disable(is_on), cmd_addr, bits);
 
-	t.tx_buf = &cmd_addr;
-	t.len = 2;
-	t.bits_per_word = bits;
+	eeprom_93xx46_cmd_xfer(edev, &t, &cmd_addr, bits);
 
 	spi_message_init_with_transfers(&m, &t, 1);
 
@@ -251,9 +262,7 @@ eeprom_93xx46_write_word(struct eeprom_93xx46_dev *edev,
 
 	dev_dbg(&edev->spi->dev, "write cmd 0x%x\n", cmd_addr);
 
-	t[0].tx_buf = (char *)&cmd_addr;
-	t[0].len = 2;
-	t[0].bits_per_word = bits;
+	eeprom_93xx46_cmd_xfer(edev, &t[0], &cmd_addr, bits);
 
 	t[1].tx_buf = buf;
 	t[1].len = data_len;
@@ -334,9 +343,7 @@ static int eeprom_93xx46_eral(struct eeprom_93xx46_dev *edev)
 
 	dev_dbg(&edev->spi->dev, "eral cmd 0x%04x, %d bits\n", cmd_addr, bits);
 
-	t.tx_buf = &cmd_addr;
-	t.len = 2;
-	t.bits_per_word = bits;
+	eeprom_93xx46_cmd_xfer(edev, &t, &cmd_addr, bits);
 
 	spi_message_init_with_transfers(&m, &t, 1);
 

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260928-eeprom-93xx46-fixed-bpw-e869f3f7077a

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

