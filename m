Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793464323;
	b=kfUmutYcoCYgh9GwLN2cJ+wlJQMsZcOhy2gTx6Al2sNBFnTQhMd6SZ7S26zuCiKbsaz4
	 Ux3QEKId0LRicpQ8bGCfhnMgA2v6AJ5C6mQ3TCMCK/I1MWmewr8oWs9BMRqRKDZbLq4RZ
	 hRMdu40grpp+7AGRokESA4QJFILk2GUG5lvs3pkoTqagkRByPv9HVZ3HYiHbNKhwm4czo
	 VdCXYAzLZYN9ACJiSlKpwGwrWvpcRB600w9F/In8jEzn1bQK+hD6IApA7/flru656BopK
	 Rw2qHBcz9N0l4QQIrOiXi6qoBuuaCav4rEwymUJqnhBbmVluU6nIt7teeFBRQt6uddw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793464323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ZKO4tJEXvxWpmC9Exoy8Jx7d/5wQLfJe+ZpgYwzMhQc=;
	b=R//B70y7M3AOU2OEAwmu+P+wtZnWRbDCZ/Tm/jzS0EDvFNMxkO6sMZofS0LtqBEk/eZT
	 hsye7zxIBguH+6qrV9E9m4v9PoNiLVTM4EJO5J6Kuxs/udHJvhalYTt8v/iPAmJ0qT9+B
	 KFO3LuLnXmhsmjXIoB9ez4cu9BN90mQz9Xd9xfx+jW+dzyDnbjfKq792tkg4+QSLz8TPs
	 gOTrnC/L/SRmS+VvqCvTRLlLRaMdNmrxMJbhJKAlvqSdBhJxXfsqVFF7Feblfu3e86RxR
	 BPM9QQ4oySgHqFXxUMVnNAYqiAHS7lc0ysX/bf+LvAilrn1Ru7aWFcXXIabCEjv6L7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=BwwOcBaN;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C2E606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65C2E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=BwwOcBaN
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so1612862eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793464322; x=1794069122; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZKO4tJEXvxWpmC9Exoy8Jx7d/5wQLfJe+ZpgYwzMhQc=;
        b=BwwOcBaNhJbMcmHuY8sEcOr3ccOZNqs8U/1gAfrfvING8OfE9p9IjkZ798dA/Wypsv
         G8gp/Fj0yX3gnY2meNstfFXYpfqy9APnUDq/pe5T21z0j1w/MYeoGXUxciP3IRUvc3eT
         Rn1Ke7AP099YcNxMAtlYK8M76jPIlOBvcm3fMcFMFogYQGjE5kFIfZfq5VLQRWnJXTgr
         NCr92UJ6lKRqQwWFg5kNxZUAO7IEmRuJorsJ2OTfG7N0DpO8bd/oDGRfzey0Kgd0zKlU
         RQqIjpxeGD1fUR62TLCdKJV5c+oQ0kn60X2+HHByaYnGZ5TS1lE/xgzSkm1XM865v5XT
         OB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464322; x=1794069122;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZKO4tJEXvxWpmC9Exoy8Jx7d/5wQLfJe+ZpgYwzMhQc=;
        b=CIbWv3rxxVlobCghO/KLkANa/QsM+dvD7caXe7SUrxYNVuXnpUWkmh4OkPqf2zvtEP
         A75Od6GHPLgAcaUy613QD3bu7iSgMalcwUSTJkHMQKwZTPlBXhwjNiBMfkTyY4+K56Or
         lsok38zi60rCgqmuGV5lN+7QICqrbAxXlEVyxk+drg3EHh+vO3Q+niAum5JR4+l+HQfP
         CkqsDC49XJVH6jJpkCiB15ckH1iAgycmU0lGf8nTo1og6lAQTs0AWIo+T2auynNWg+Ol
         MYkzErby5cmAGfg1oqAt2HE88AbON+bOPy18Kfb7rOxYaXha20YBuhfxiBVkrkVxoc4f
         lfkQ==
X-Gm-Message-State: AFq9FYIVx7LJm/Kc+R31TDGG/y7hgS+L9hjua9XvuAiCiH4ny61OHKdq
	IzQxIm80DK2gjJn/U0KRuY6lRYTj3iUR8jDjPi1l4AVUfd2G4/qtxpmRCkeRPrt3dYA=
X-Gm-Gg: AYBFou3thwwvCzzqAk/cptLnlYSlYr5XvlMJA1Aol/v7rR/WWtE0WL1Dm59HC8C9X5f
	d/wNBGAkWkGGwxzFpOCToddVzvN5m+ANV5Owq1wIXW8X4dJIKYcPFvMIXd+DgB1VWjYXcClavdP
	Itp945kcVOUnn0JBfraBbqU7pY6DzO70BOUUvC29ZUe2BPbUK/mqYb5RP8JQG+WonoGy1SCNlxz
	6yVM3Yw6bLHXyuc49sHv5IAPt0nf9P4cCOJkQYbFdoW5v91On0ADkUaU6PsQDz3zaVY4k56JHc3
	xUAvW2hAk4FQ0R7U9y+V601KJBxH2RmuzEw6dAHJQ/bSFO/6ZcpRKl6TpmkpafVEAK0FrWCrlhX
	S2HUExO4T4C0cdFbogVQr5SQzKsB50kREdVnmVMxkfeeRX7JUE5Nigk3/NpkchM2mWSXTPFg4DP
	Ypx2246IKac4Mb3W2SqiFeCL3iJ1mwV6pzvXpuqQldjQW//1xuB8LNQW44knYGZUnpBgBN0QUld
	xrBWGinjXVmrH34jpkgmFGwQE1V99Wua+xFrZ9RS3jwrZIJo6FyZ4pGTYXwyInwYj0NdigbIEfz
	GhRFO3GNzQmqKtI+IjZpR9IaebedLO7y
X-Received: by 2002:a05:693c:639b:20b0:369:f2f4:b227 with SMTP id 5a478bee46e88-36a4238e9e4mr8344262eec.18.1793464322049;
        Sat, 31 Oct 2026 09:32:02 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm17929952eec.18.2026.10.31.09.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:32:01 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 31 Oct 2026 09:31:59 -0700
Subject: [PATCH v2] nvmem: eeprom_93xx46: send the command byte-aligned
 where needed
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-eeprom-93xx46-fixed-bpw-v2-1-817a31466f14@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4XM2jGlNJS68j8MCx6DjIm0aRFrC
 P8u1bh0eXIfZ4VAninAKVvB08KB7bSDPGTQjc10JeR+Z5BClsLIComct3c0RYyqxIEj9di6J1J
 VmqEYtNC6gX3tPKUwPV/qL4dHe6NuTnepMXKYrX991Eueej+L+WtZcsyx7SqllBFSanOeKM6jd
 ceGod627Q0fppR20QAAAA==
X-Change-ID: 20260928-eeprom-93xx46-fixed-bpw-e869f3f7077a
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793464321; l=4324;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=IsqDkRL6Zp5KEHp7cOeESTTFIo2aD5gRS7h2LUULU4k=;
 b=LsXo7AkAUCCiGbeYVJaB4L66laR8E7BIRigx6OfYzBFy0GZmH276+jnLqr53rqLntrJcpI7GB
 FPeFsuM5xmLBvBXF5eWvJb2VDzNxRprsZcTq0T9jQ0+nRy5t/PSW5Wa
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

Controllers that can vary their word size still get the native width,
so there is no behaviour change for them.

Tested with a Microchip 93LC86C on a Xilinx AXI Quad SPI core
synthesised with 8-bit transfers.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
On the 93LC86C + AXI Quad SPI setup, reads over the whole array match a
reference dump taken by driving the controller by hand, and writes read
back and are restored. Support for the 93LC86C is posted separately;
nothing here depends on it.
---
Changes in v2:
- Rebased onto v7.3, where the driver moved to drivers/nvmem/; subject
  prefix changed from misc: to nvmem: accordingly. No code changes.
- Retargeted at the nvmem maintainer.
- Commit message: state there is no behaviour change on controllers
  that can vary the word size, and record the tested hardware.
- Link to v1: https://patch.msgid.link/20260929-eeprom-93xx46-fixed-bpw-v1-1-bc8444902279@nexthop.ai

To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-kernel@vger.kernel.org
---
 drivers/nvmem/eeprom_93xx46.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/nvmem/eeprom_93xx46.c b/drivers/nvmem/eeprom_93xx46.c
index f9c3ab52c2f9..b6d4f7b03975 100644
--- a/drivers/nvmem/eeprom_93xx46.c
+++ b/drivers/nvmem/eeprom_93xx46.c
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
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260928-eeprom-93xx46-fixed-bpw-e869f3f7077a

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

