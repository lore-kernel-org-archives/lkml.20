Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793444057;
	b=16mYGbEjJ4STa4dM9iyX5tlNw4IsusLqfHIc4IhAWm5JksjxsRd6ft691Nc4G53yW3ba
	 j4QRrOY9uS3gJ/jMDn9LIyY5VYY7ObcY3BIXNE0khrHBxOGbvsR0lyS3uRBoZNqeW/zpH
	 LBorU/6+Fj9yz/v37JFMQD0EnpzRvT9BRusr8OmwIMq5KEgcKaI5mUkZ1EcPTY5hKp5l0
	 gKDizuJF+VDjJb2sD6ThVe4Hmitz/kegjzdZzkad9Flf3wRvBGtZFUEIO4HJ5pqlTZ7PG
	 P3s4Px/Af6lL2hD5OlMgAFaAKpnWpiAWzv0xGBMMoSEaLMStbbAgeDvqIqdN9Ezy6SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793444057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7Xy5C3gd+08js1GAOtSSRa04UMfhl4cyMda6mXjC430=;
	b=wXSFDKXUEpudhiPjsh5R0eQY5pzo1q1Zd/AzPmp01RV0II4pOhQK8JfDirS0KQ/K2lLU
	 xrdnQ8wMJ2s90IDBKinI8SdK+Cp1IA2U91JkD0/iq4Rzy5FjHDGdj1ACNeki74v1Ht4OW
	 B+xniZh+spRsNug3hKxzt9OpT6RyHdIisz2agt6psbhxl9IRM8P8dvlJ4+5LAA2svfCJ2
	 xg7psjYrS4N5sZy2HLKDUAFf3Ed/8A6Sc3PS8QGZmJoV+pXpPK6+89iSnD2J9lBXpD1Ro
	 Y6ZUWl8r4rVBwwvygDc7odR+KmwKskw+NR7dADQzOxGJMR2WzqpkX39JOWmeq1JrYoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ji1qwbZK;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC372606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC372606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ji1qwbZK
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e7e742a2c7so10403405ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793444056; x=1794048856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Xy5C3gd+08js1GAOtSSRa04UMfhl4cyMda6mXjC430=;
        b=Ji1qwbZK23SCMCsXbvXhhK0j2k+HOHjek/jkDVdy9oS6kMdxCsu+3km53Og1wNOE5s
         mCVeGhqtbPm4dt6FdBsVi0XRVZlQ/le9h6az2enJAmmlkyQTietyTPb5PQqYTNQMuXSo
         D7G4vD5VUUBkVf23zVvUljLnEELunSyoh1khXH5O+e68fEFay3ATX3TNHdhC9AwyNb8X
         NMspy/H7+H8f1nVyKIEJwm3o9fgd+oyXg+brxzKbS5h0gj/6uKhrG1k9c4cyNzHldym0
         Z00JjHjGMJ75ADSZ+VOgicvHehUmOEt5OPWMtY2OZYjmP44iQTqCsUTZJCpGWqes+4ZN
         cxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793444056; x=1794048856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Xy5C3gd+08js1GAOtSSRa04UMfhl4cyMda6mXjC430=;
        b=LdroQgq66uNKqKPbaod1jEU6SChWhpdJ58b37WCqeva+7PItwzqE6+Neh1vcevPliy
         Da0EeYGVPWaEB+p6lCTkZ+HczJl9hzM0p1oJBsApt+ypSk1NHmXsOAXc9VY1GARumkaQ
         bgsgFI5OZ3mYlh0t3BDE4XZ0iKAxDiwkvX9CGD3d/x1zEIoS+LxzCq35gwEA1P9VFLzQ
         g4sqV4jDb2o1pbApQQCDhq8L7QYfS732X7omptzR5g3cJ683djfUvcd+s1dUq8UBfU2W
         ++pjYQisJ3bw9EDwbQu7fk4zC5j5Th8m5cfxLZWfzW6og7Xha3Dyv7TVNDhVhBLvTPB+
         7Zkw==
X-Forwarded-Encrypted: i=1; AKwUvByxu4nIh1bOKuh5R4JSB6RfVH5FFAwYPxvoucf3Akk3pAUUuxUzLOwx/vQumBcEjzxPSg4b1Pw50r9dKPo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMcqIAjcYRALnnN+E90m9Fw5OcWHkHOXGZxRNbnjoHflIBT+n5
	w5OcSSQSg3SfA+LXu/I8HjVmLVyTb7h9JIzEUDZzoiRwqWRR/tjjUiYn
X-Gm-Gg: AYBFou2z3mHU+XybLuTk1V5SHNJHSyq3koctlEupP5nbHSgApyEWVWo8tODAffMHGBR
	DoojAtYZIfjI0ZAQ28tFIAb9SMjMzqQjm7T8Pn6dut9/EQNneTrGaOLzAx8jWx9SmjDKe1jtuPv
	Q3Au8xgNXdz9kJHyD41xLwgxnBXqO2EgmAJZzJ+U/aWJzsFTt/V86fTemBCVqm1/P48Yx0REkM0
	u5ARiraYTNv6vSyqfcpYYw3UVOY4V1e9IXjnGTDi5k/CFdhgCqMiKUTCFS3UJQDoPnLBi6lzr9F
	XVMcWg3qH/QY1bh00Us2Ke3THAhABP6lHxhhDqKajgSCrektVXPvtsKOrYBl/ZBu5H4Q/2FQMNd
	uN4n42k+6r0/zBtd1O4UV1Gz0dgI4s3jyAdpe2Dtp5g5ld4ievrTGjPeS2Rkq6od45B2tfsENVy
	U7vRLtveVWR+J8logJxISu6fO4q1VvMbqhTs3OlFoj92fczbHPcPYros8gjNqwBl5e44/Sf/x2t
	MOno2sRsHTcB/gMbe11gaac/WoaeU2OQN2z5arD8MxUEpUqjVWdF1uHA6xJlC+50enV0gJQZWIY
	OVxfHVayhyts9J9a9xWAWiluPBVutdwMpvbmKfQk56mVvQ==
X-Received: by 2002:a17:903:1a4e:b0:2df:9e44:32f1 with SMTP id d9443c01a7336-2eb364e1741mr34179695ad.29.1793444056037;
        Sat, 31 Oct 2026 03:54:16 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052bcbsm14745625ad.10.2026.10.31.03.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:54:15 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: designware: preserve invalid SMBus block count
Date: Sat, 31 Oct 2026 19:54:12 +0900
Message-ID: <20261031105412.16825-1-pocj8ur4in@gmail.com>
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

Fixes: 69f035c480d7 ("i2c: designware: Handle invalid SMBus block data response length value")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
The DesignWare receive functions were exercised with stubbed register
input for block counts 1, 32, 33 and 255. Counts 33 and 255 became 1
before the change and remained unchanged after it; both versions
scheduled one extra read for an invalid count. No physical controller,
STOP signal, PEC result or end-to-end SMBus return was measured.

 drivers/i2c/busses/i2c-designware-master.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 7e1d9a2e77332..f38ffc5b0a347 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -563,7 +563,7 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 		for (; len > 0 && rx_valid > 0; len--, rx_valid--) {
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
 			tmp &= DW_IC_DATA_CMD_DAT;
-			/* Ensure length byte is a valid value */
+			/* Limit the extra read, but keep the raw count for i2c-core */
 			if (flags & I2C_M_RECV_LEN) {
 				/*
 				 * if IC_EMPTYFIFO_HOLD_MASTER_EN is set, which cannot be
@@ -574,10 +574,8 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 				 * another byte with STOP bit set when the block data
 				 * response length is invalid to complete the transaction.
 				 */
-				if (!tmp || tmp > I2C_SMBUS_BLOCK_MAX)
-					tmp = 1;
-
-				len = i2c_dw_recv_len(dev, tmp);
+				len = i2c_dw_recv_len(dev,
+						  (!tmp || tmp > I2C_SMBUS_BLOCK_MAX) ? 1 : tmp);
 			}
 			*buf++ = tmp;
 			dev->rx_outstanding--;
-- 
2.55.0

