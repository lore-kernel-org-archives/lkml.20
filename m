Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903942;
	b=FogxXVQsP/96xHgk1RI7G4vKNS0W0G9k7BVsucb2YqM4vvV7A2UwPyJnoDYHtFThJNQo
	 4+Tu44tVMfgyVVYaGIe/LOIOYJ8E2W+/wJuV4KjZSwUJ8vA5S/QCciPNxtGjotBbtyxu4
	 DbcriVld/ce005tvXVe5D2sUwqhlZqt+9ebejyYZ3bTXrO+57nhw+TkB3NECysPv1d2is
	 iKm9fX9ICWrb95aXIrXJOLhIwzNvINo+c8DUYa/2iKEBy5dhKszCVS9PDMlijvITlFnGI
	 FAinHcXajsOmaNg1ZAiF9YNeiuIPx4w0wFJ/OYKD/zWVZlueIwVBx5ltYG113d6Z1fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=j0XZKDsVtf9HKWZwL+enuicDpOLOYyRn9ya9fG1zl3I=;
	b=R99jCh7gRrECYeYfwJ7WH4aGiuz7jmoJi2mQu6VwwOzDIWHUwdz7kCGMPWf8na/6RgmB
	 5t/vgMk2PARTujcFEdkyQndB4sQ5eDkVFpTRCGzTiHE0pIv4oI6wbkyg2xsREXHG2L/uu
	 JvwadcBSZy8nUcLOE5GyLEFm5qxmcW/PkjpDKsT4nZYQIxLglZidfFqTpgdAOcfrNFTWg
	 3v8jhLP86lBqRZpMTcMB2YD7Zms6EMXLoNLvZkGJdvtqtoRFOasgKQR7u9AiXgj0jwgJ1
	 5J9PbrFFk5xKRklFnEToWgavMEPDyP7vEDdBOnguWZBWIDVx9AG9Onukm13vhEetfcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=q2BGRf0h;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F8D606A88B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F8D606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=q2BGRf0h
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dee593f18so4521700f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794903940; x=1795508740; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j0XZKDsVtf9HKWZwL+enuicDpOLOYyRn9ya9fG1zl3I=;
        b=q2BGRf0hG4Ol1uMv3dwQt5af+ox+TZ+aBPOr1vUQcov5SP1mRR/UMOfJfGA+ux/7kl
         cGw1L4dptC3cHgd5fQcN23NvvZvM+NYRKL4H3bkC8dz0ymarHcOcSwS84Pj2Hw4/j3AL
         RgbdVzSsdqEFQ0Sl29ZURF2fHopzVrZdRwupOkq6wHojaSCgSaPmke0eqmMt5/W09BTD
         6aCKvL6byjQcaLoC2csTbWpXdALRsv5BfX8BCAPV5iu4bpo03f8+Hv3P6BthsicM/3ov
         H0UM6f/U4Ok+1IUaIt8wH/bWmqgC8Qt9EEJGybL4fntpMPryRSpb1LZJ+NPtRZGe05Cp
         lLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903940; x=1795508740;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j0XZKDsVtf9HKWZwL+enuicDpOLOYyRn9ya9fG1zl3I=;
        b=eS83NfaQ0OQGr0mT/vkJLqnL5ZPFeuKJ76NUYbejgCuXxj+PhypySu3+K3lVbm27jx
         ARMbIutY50/i+ALjPMM6+X0sKXbuKOirB1srIpLl9gVSRA7BeJkmJSr0eOpeU7sYAw6T
         Sx87VXupv0NVsapZT8aubMOBuMa+S8QFPhNQEeEAJSMY21tbhLK4pasfBbccZqW+bLsg
         ITQzKU2EyCyfWXHfjpWDE5MP5yl4ZK08pM7i4iuVedHC1SYhEhDHnSIvy+mCVAYa+p7l
         aI3JLLmrO/SthitsXCkQrL/xQOvZZ151LvZ77dvOoFVcsbdSVL4HbjlraGvNC7/PtDui
         TfwA==
X-Forwarded-Encrypted: i=1; AL+hErHpPfXxl5igdICD+nFyNshK2Jpw+rf85GDA7ooWLF5lZ8tVkfh/P6UFxfbca09Y9igLq6uamYPs6B8v+qM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ri9kl7JY9t1jFRuBBlLKLlXGcImBT6+WaAuFSWVZd422UGY5g
	yi2RYH8OVSlf4accjXZHuckYgbufVFMwQkyu2kFrLbCbL9KI5xN+OKqgeZSd2P0kTFU=
X-Gm-Gg: AZFdTZcAr1qVdSJ9rhd4AyFZnjtmBFQSZzkdTUW8SRlNkvdYRtMpAVWIyc9bCAPFI3d
	Z4PEPKsno86bKpC45acliGjYuFj39UYiX6X58BGcnogVb/+Bhetgf2+KBu0CYJZXRP7xBYlxX3C
	5eN8dUQ14ZuohXbSMAj2gDb30iLFzL3hMRzDxPbbM2VJ/iN4aM6uTis1+3pKqq0ruZFTcCpk+rQ
	kzm6ZR5IKmai3j+4ekzqAHuXW+NWFOLe7Y+RnoskZO7F7w5g/fii6+w4WRUSBOeGY0a/Nc/neKX
	gRVEOR9EPgVkEX/nZkh2t+2j28QNT/sssjb9Ph5c4d5pnqAD5VaqNiUMJi7Xt4pN4zdrtL3tlx3
	GpGGo6k+oHK8UrfcFr2i2Q9uklusMIhpnNnHE/UPSUy48ib5ZeEeufspHwJpxwl4Q3yT9srbQr+
	CXs8DeqA27pVvQejNURlDuLZAkXiY/fjBl/Gmv4PlNtKA2fOnYUSCTBInsAbhTbOyXaCHcSAjKr
	LErDEdndo7MfngqK7+fCyNiRQWLUHj9QcyPfIPznfaw1llhir9iMafSa/57QnZmjwera0ya3qQi
	bvdRdN+UT3mvy4O6Wwjzvf6HikNBP4OajSGWHqTB3w96QDD4famFWGR+8ZgERRPWm9JVMpGj1Gn
	RG5K3+BQQ1A==
X-Received: by 2002:a05:6000:461b:b0:48d:f7c0:97c0 with SMTP id ffacd0b85a97d-49c71b5c656mr27830205f8f.50.1794903940046;
        Tue, 17 Nov 2026 00:25:40 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c81a63b1csm25450569f8f.4.2026.11.17.00.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:25:39 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Nov 2026 12:25:31 +0400
Subject: [PATCH] usb: typec: fusb302: Keep interrupt flags across a failed
 register read
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
Message-Id: <20261117-fusb302-irq-read-error-v1-1-a85d45b91912@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTsJLZEIVzEu2vJXxwXoDDUmh
 Ltbdfkt3tvIoAKjsdlI8RKTZa5wh4bSLcxXsEzV5FvfO+d6zsVi13oWfbIiTAzVRfkUuhSOyAN
 ioho/FFnev/H58reVeEdavzfa9w9ciFFjegAAAA==
X-Change-ID: 20261116-fusb302-irq-read-error-8a3ca5ef9ebc
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Yueyao Zhu <yueyao@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3710; i=alchark@flipper.net;
 h=from:subject:message-id; bh=J+1Ndt16wokvvXhpARWc4lYoy8taMio1E5aZN1Sz79c=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWT94W+yf57GcSqOtalhT+hCP8eTWzReLNZZ9vrprEQ3k
 Qf5c475dkxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVzscYGWZEBX/WibsmtvqGr9I9Gc0YeWuFL4vLV5Q+5GC1P8y5voKRYYHeRKs
 IhgK2sjp+t68G5yImKjlFBL2OMNi6p6sqOmIeHwA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Reading INTERRUPT, INTERRUPTA or INTERRUPTB clears its flags in the chip,
so bailing out on an I2C error in a later read loses the flags already
read. On Flipper One, a NACK on INTERRUPTB just as a source raised VBUS
lost VBUSOK. The driver kept treating VBUS as off, so TCPM never attached
as a sink and left every Source_Capabilities unanswered.

Keep the flags pending until they are handled, and retry the reads a few
times, as such errors pass. Otherwise a flag left pending waits for the
next interrupt.

Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip driver")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/fusb302.c | 62 +++++++++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 83bd287dadc7..9fb76fdd3b7b 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -100,6 +100,10 @@ struct fusb302_chip {
 	bool intr_togdone;
 	bool intr_bc_lvl;
 	bool intr_comp_chng;
+	/* interrupt flags read from the chip, but not handled yet */
+	u8 pending_interrupt;
+	u8 pending_interrupta;
+	u8 pending_interruptb;
 
 	/* port status */
 	bool vconn_on;
@@ -1499,6 +1503,43 @@ static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/*
+ * Reading an interrupt register clears its flags in the chip, so keep them
+ * pending until handled: a bus error on a later read would otherwise lose
+ * them. Such errors pass, so retry a few times.
+ */
+static int fusb302_read_interrupts(struct fusb302_chip *chip, u8 *status0)
+{
+	int ret, tries;
+	u8 flags;
+
+	for (tries = 0; tries < 3; tries++) {
+		if (tries)
+			usleep_range(1000, 2000);
+
+		ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPT, &flags);
+		if (ret < 0)
+			continue;
+		chip->pending_interrupt |= flags;
+
+		ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTA, &flags);
+		if (ret < 0)
+			continue;
+		chip->pending_interrupta |= flags;
+
+		ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTB, &flags);
+		if (ret < 0)
+			continue;
+		chip->pending_interruptb |= flags;
+
+		ret = fusb302_i2c_read(chip, FUSB_REG_STATUS0, status0);
+		if (ret >= 0)
+			return 0;
+	}
+
+	return ret;
+}
+
 static void fusb302_irq_work(struct work_struct *work)
 {
 	struct fusb302_chip *chip = container_of(work, struct fusb302_chip,
@@ -1521,18 +1562,17 @@ static void fusb302_irq_work(struct work_struct *work)
 	intr_bc_lvl = chip->intr_bc_lvl;
 	intr_comp_chng = chip->intr_comp_chng;
 
-	ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPT, &interrupt);
-	if (ret < 0)
-		goto done;
-	ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTA, &interrupta);
-	if (ret < 0)
-		goto done;
-	ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTB, &interruptb);
-	if (ret < 0)
-		goto done;
-	ret = fusb302_i2c_read(chip, FUSB_REG_STATUS0, &status0);
-	if (ret < 0)
+	ret = fusb302_read_interrupts(chip, &status0);
+	if (ret < 0) {
+		fusb302_log(chip, "interrupts left pending, ret=%d", ret);
 		goto done;
+	}
+	interrupt = chip->pending_interrupt;
+	interrupta = chip->pending_interrupta;
+	interruptb = chip->pending_interruptb;
+	chip->pending_interrupt = 0;
+	chip->pending_interrupta = 0;
+	chip->pending_interruptb = 0;
 	fusb302_log(chip,
 		    "IRQ: 0x%02x, a: 0x%02x, b: 0x%02x, status0: 0x%02x",
 		    interrupt, interrupta, interruptb, status0);

---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261116-fusb302-irq-read-error-8a3ca5ef9ebc

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

