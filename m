Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039074;
	b=4Us8KbtgZwcp50o1WaMKS46uzMfIJk5nHN/44bN1AeUlGL5zRfmx7kr1qQvRx/HW+RA2
	 qodv5xcpY605UYcpOai4o2VWfosdb9vs83Sjes2EXR9eQRv8Lai+tD5kQKz9l6Monh1Rz
	 tXlNtD5ee/c7zMkZLOdUXHcrvrUlkBcspMS5SBd6R3VkW39Ah3tyyn04mmEz5p7Oja5na
	 1X8eXEJYbMiVt0SkHzXkSD3ZcX0DlJN/w+zdnLpUI0aEWx8pNgEZB/U+aG0ZThI1ktiC+
	 hCktR2Rms/bc3d1zMQUavsNoBS9KOVa6xI0IDgpBmzzkfZbec+m3JBE0ewT+MPhMzIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rUJh/hOnJVDzqfu7D8ijbQoRtZjwQJo7W2Gho0cz9Ek=;
	b=FaVO0qI+tzw99q8XHsanQwdTMLyef5Nv5V6BV5G3cnh0LVK7opZna/Q4LWqqLNCoGHKh
	 zE4EyuJ1n+lRDlWSeJp/uGuGjiSHAvlogMWL6j3VF1H1G74jU6mKseWoSAJUl9Vr0HyKe
	 H70P6BsmwhoewMwmfUuJkR6b4dpoggJgW3DTRjtY/l6r72vQdncumqbBnQZpiTmAZZ39M
	 zxfUfvT3UQydXP4QVV7zTQjKv77nTfIDwbphdTRE/0HAyqXNGDJsydkgE2NnqRcSwUYnc
	 BfHtDqSZzBxDt3E0whMu9bzw6QOXPWVxD5eaUawXJ2Pl78s2EktJJljKHqChgVEyWmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKeFkqim;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1B6606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 08:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF1B6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKeFkqim
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2761c69fbso3390437c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 00:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794039073; x=1794643873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rUJh/hOnJVDzqfu7D8ijbQoRtZjwQJo7W2Gho0cz9Ek=;
        b=SKeFkqimPya5fDVfeJLyAzYBe83AGQhACb2tnedd2tmpnurcnzmg6/64RZkMsAnwzZ
         jV5peLLmAyYCH7NKCb4IJ+xUZkAQX/0rbFVWe6l0ZyNwTK/Ib6Oey/tLHaAkxeBGpY78
         tbHXnl/DQszXELXHaTxhSkfQhlj3Mntb16zKI4+bI3Px42zgsvzEuILNO6nJVG+QoxGh
         ChCZDLH5NS58oq75I7FjOXIo0vJzYfk5NGV9UBoRbsQ2JFUZm/IUl274qydZpEtaRftp
         iWDpFVwPKdp4QzWaKr47w8Tlc9RslbobfQZKuBvKzHG5zF+Msq4Z0wFDvWX2DzNWe6Kz
         +NGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794039073; x=1794643873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rUJh/hOnJVDzqfu7D8ijbQoRtZjwQJo7W2Gho0cz9Ek=;
        b=tg6SbDeEjw/UrnLqmNnoMl+rWbqvXK2a9EpEYwS1Lcxtd0MKAolWVXUY55JPSyhmpM
         Dj7D/qk0NkI4Lxd/h5ZuVNN9YAWqSU4ZuLLJyCf3LZbC5OYz3N8zjOIiAnzh9ZM+kwOY
         oA+FMn6oucSexdD15AKPJjZtMkS3iKJwhjtaDJCDoRJle3ii/K26bsj3mJjiw1wQDoiC
         jYgU7wbHkZnmAalzOx71yoayv/WC9OYDUKlislVBi/T6hheqcVCe43+MdkeSNfQ+U07Y
         cG9hfIwq3LsPqE3KIufiTPSq30P5EEajBXqt+5AyQvg3McZPxew0dwpzDZB6RrtNAaFi
         J++A==
X-Forwarded-Encrypted: i=1; AKwUvByqV2S2F+2bnWWCA1UhqFWx5k9fGQFhvLlqB0zW5BShOdlSvqgZzTO1/vja3K7d1jX8EdlGk6kkSrP02wY=@vger.kernel.org
X-Gm-Message-State: APuU4Z96Tr/ztS9YJ5D69v3t2L5XpTAyw/e+N211tnmffrqCOZbzmlrU
	sxj/sDEC3DMPf67FZ/fQVgccWD6BgQdQj4WXkwxu7MfBPN5rycEHjlPV
X-Gm-Gg: AYBFou1BYTbFU/IxWxdpS+WsK2vmavqeawkIiF2hsEc6lW+gidcsX4eR6dSWT5yszYr
	9jwQ/+A9O+XyUZWVanspmlGwG57FiiRZv/QQxbVVNQLiRBW0MWLYkmMptTrKt97poFkXA7fJYjx
	psMTnHo4OQX7PU+gWUQSt3lhiNc+UA3Uydu7uhHmJX6iKpOVGVyrCsA781FH7Q1PzabPyWg6jfQ
	QXYqdQDvA6qvrm0BTjxC3IG56UVDpBtOe0WIGAMN1NqVM4DuoOOeGVHnc3qp0AQaTIY1IaPeuz7
	absXuFmTDg2gKfiJKHBBjQfUIe6FUDdztrt6dNwXfGpY81avY9utzYPHOrKjmaEi/3CVBf2HCXQ
	WWjrQx7NhLR4CNbwtbGjdXuTACWpG+3MEPKpB7aE7oh5S+q/b5QyUWZakEEYh12s5MfHNDZi2bJ
	R96QDTHPNgWxjv7UrPhZTWg4FRPNIBuz5FSfPsXhkOoRIfJkSoU3QMb5VX1adqumQYKax+q5Q/2
	4abVgIIDwaeW73wEwH2u+ELZlMO734/GgVg5aCjf3uBT/VM7idkcMNVOw1ih2zsOC6gmamet29S
	yQZKVx5AmJVCUUYdFJTJclcaCSXtXSB7XkPS780aIzYH
X-Received: by 2002:a05:7022:7f18:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-1b25d30af77mr7905466c88.13.1794039072216;
        Sat, 07 Nov 2026 00:11:12 -0800 (PST)
Received: from asahi.tail4da9e3.ts.net ([223.38.80.59])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e407cd1sm12587621c88.3.2026.11.07.00.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 00:11:11 -0800 (PST)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: designware: preserve invalid SMBus block count
Date: Sat,  7 Nov 2026 17:11:08 +0900
Message-ID: <20261107081108.1046163-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

When a slave reports an invalid SMBus block count, i2c_dw_read() uses
one extra read to reach STOP. It currently replaces the received count
with 1 for scheduling and also stores 1 in the message buffer. A count
above 32 is therefore exposed as a valid one-byte response.

Keep the received byte in the buffer and limit only the count passed to
i2c_dw_recv_len(). This preserves the extra read for STOP while retaining
the invalid count for the caller to reject.

The DesignWare receive functions were exercised with stubbed register
input for block counts 0, 1, 32, 33 and 255, with PEC both off and on.
The original code replaced invalid counts in the message buffer with 1;
v2 retains the received byte while scheduling the same extra read.
The arm64 i2c-designware-master.o build passed with W=1.
No physical controller or end-to-end SMBus result was measured.

Fixes: 69f035c480d7 ("i2c: designware: Handle invalid SMBus block data response length value")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Changes in v2:
  - Use a separate count variable for the extra read, as Mika Westerberg suggested.

Link to v1: https://marc.info/?l=linux-i2c&m=179344386454087&w=2

 drivers/i2c/busses/i2c-designware-master.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index a1bcc3797e4ff..49e9e36340c84 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -542,8 +542,9 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 		for (; len > 0 && rx_valid > 0; len--, rx_valid--) {
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
 			tmp &= DW_IC_DATA_CMD_DAT;
-			/* Ensure length byte is a valid value */
 			if (flags & I2C_M_RECV_LEN) {
+				unsigned int count = tmp;
+
 				/*
 				 * if IC_EMPTYFIFO_HOLD_MASTER_EN is set, which cannot be
 				 * detected from the registers, the controller can be
@@ -553,10 +554,10 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 				 * another byte with STOP bit set when the block data
 				 * response length is invalid to complete the transaction.
 				 */
-				if (!tmp || tmp > I2C_SMBUS_BLOCK_MAX)
-					tmp = 1;
+				if (!count || count > I2C_SMBUS_BLOCK_MAX)
+					count = 1;
 
-				len = i2c_dw_recv_len(dev, tmp);
+				len = i2c_dw_recv_len(dev, count);
 			}
 			*buf++ = tmp;
 			dev->rx_outstanding--;
