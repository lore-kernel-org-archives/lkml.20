Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834173876BB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411275; cv=none; b=WvlFEZg91SVRBeHpvARykCtL8Hm7AE+VqAyb8hTJxB1lKx6vFfokygWoeJbVTPk9iHAa028mMvd9jINDxf5UCAZW/rlwua2KXEJVAJ5UcgrsBD1UGNnJed5ulEAWOGQsnbjSUj/pRbKcrZx8hQVp9TyswjEM0dckRoaIw4L7oUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411275; c=relaxed/simple;
	bh=+OR1gTWNrzIqf2xISmhfp+s65tbaKQebpLjqZ8qvz7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G6/QkwzO0ZSJCcQy/w0VYOmOIaAmcuk7nSERizBjzl3zLptBycHmAkBarMdjEKj1iyQdYVcY1IzZUn4+4XcyRdRe1ldgiZf7fA+CGCXJfibinqKmVDtZPkVMrXlgqgIyWLnXeZdMlRxCYwPKDyR0a/Jb08ndwWfQzb2l2+8qUes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeszYdF5; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeszYdF5"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-396750cfee6so1646500a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 21:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411273; x=1789016073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Xrkf+M7d/buQlEiH9zes2PfuHopkhsev9Nl4qDT6q8=;
        b=aeszYdF5zN9myhXKyD64ceUy5VOAs1Zj4Dpcvvn1oyWymgj3HtU6MhTDn0YZmmOVVO
         2PirmwuvcC29z7xwOnUvqDlEZ7rXOJuTq/Ngf5xY4hGb4otMK6V+8Vl1OWpqLtXsCDAJ
         BVZKQLJ5s042evNClEGPMVquawI3voDFr5D8NVv0BVQ+5YGacexPXGoIg70zyb4w2YPX
         pYqTiDLkN4yYofIPs3qSFhikFQuWsGGpNlQwHTi+3TbDLUDh9lZ8QtKca6Eie2q3IPHm
         gZU++9B0Ws0NsMy03xi2qVIAZQDNlfDOyv1pzthaS9fF5ShkVtHEZK2MnrModCmeOTVE
         FlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411273; x=1789016073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Xrkf+M7d/buQlEiH9zes2PfuHopkhsev9Nl4qDT6q8=;
        b=nvSi0cRHQWjP92+mzOhkGCL3PfqkE1CLEEei1QJlCiSsckbgjJc1Cir02SLgxh3EcP
         AHJe4yGpWjJimxD4sqz3xbIV6ka7NcE+Szbs0VdrsldyKy3TpTdyf2ouCyKQnIFMCDpm
         T+NTsWzu+fNX0bRRf04uui371gVU7u0FxIDCpNkAmKvY0T2jYlnpIYSLvE4Kn1t6f2bs
         nEFCF7CZKCCD4AdxjgGR62RBGP+J+5xGvrM+17cVdXoAeLSng9svIoT0BVf6TdFAR5MM
         ZrlH1gdXAKMBDIJ2XqUsSBApkfdsn7HY2Vbwj7rGRtu847AjYcYKcOL0cC8vjCDO4S5O
         wFVg==
X-Forwarded-Encrypted: i=1; AKwUvBxmPe2Ke4pps/mV6pHIWRm28XtqUEnazVugwx4gb5Jy/p1wRkX8LXLhip3MG3N3+YJxuFhUgu/0ecyDjUg=@vger.kernel.org
X-Gm-Message-State: AFuF++nCb0ktDNhSdllw/leliCrRCVQest3BwiX1cYraIacFrbEo6WO7
	vaBSbzwb7G9PhrefAo16hl9NQLjld8kA6ic9Wn9YmvoCFIVIM38DcHQSiPQVGw==
X-Gm-Gg: AYBFou21U1MNnyXcGPnC/EJubFC13gzD6mo/L0t2hcnNyL0K5IdRtGyg9FFZ1E4YC0U
	sktL2F81mRcOYo8wpID7DosApc+CRPTTR01EugJTxv5n6Oy0XUAUbODhAE6KoNN3NUM+ZrNZWLj
	Q0h7DcIhvfV8ZP6v6xSqPmq2X36I5Nx5VSh87u83I2ZEZla8YLyzCSJ7d1egMCvpUIVWLzfuBwq
	HRnN1TrENVMImthZ04yGrQEp4xdeY5rXwX8sYUy6y+bPuVdvEr+6NEuhhK9xX5KAqiqEcPj8qz9
	G0MD4Ce9c3pQ4Mk0DwMAu/8fijpAbva4yFh+HGOp15DQ5gF1AZv2rzvp0yx0AYqJWr2Qf1MKp2p
	b183+cHUxv4iJ49d/NtUGXPD/gooBJ4Jzv1DW8YX/fRvSeC2TYpiEpe/za9e1I1nr0H8ZNZMA8U
	W+sAJGjsOYbwaZOigKH83tT+sW7pNQPjnBEeIStKYJbCBjQTAf+iclHa8fV2KoNBFlng==
X-Received: by 2002:a17:90b:4c0b:b0:398:9bd5:490e with SMTP id 98e67ed59e1d1-39aee1427e6mr14134517a91.21.1788411272765;
        Wed, 02 Sep 2026 21:54:32 -0700 (PDT)
Received: from [192.168.20.42] ([115.70.157.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8f1cf6dsm2300801a91.3.2026.09.02.21.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:54:32 -0700 (PDT)
From: Tsz Shan Chan <tsz.chan.dev@gmail.com>
X-Google-Original-From: Tsz Shan Chan <tchan@jacques.com.au>
Date: Thu, 03 Sep 2026 14:53:50 +1000
Subject: [PATCH v3 5/5] iio: light: vcnl4000: add shared IRQ support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-vcnl4000-v3-5-5e69c2e715a8@jacques.com.au>
References: <20260903-vcnl4000-v3-0-5e69c2e715a8@jacques.com.au>
In-Reply-To: <20260903-vcnl4000-v3-0-5e69c2e715a8@jacques.com.au>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tsz Shan Chan <tchan@jacques.com.au>
X-Mailer: b4 0.14.3

Change the interrupt trigger to IRQF_TRIGGER_LOW and add IRQF_SHARED to
allow the sensor to share an interrupt line.

Return IRQ_NONE from the irq handler when read fails or when none of the
interrupt source bits handled by the driver are set. This prevents
claiming interrupts from other devices on a shared line.

The datasheets confirm that the INT pin is open drain active low, and
the interrupts are latched:
- vcnl4010/4020: The INT pin is open drain. It is pulled low
  while a status bit is 1, and it stays low until the driver writes
  a 1 to clear it.
- vcnl4040/4200: The INT pin is pulled low when a flag triggers. It
  resets to high only after the driver reads the INT_Flag register.

Signed-off-by: Tsz Shan Chan <tchan@jacques.com.au>
---
 drivers/iio/light/vcnl4000.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index df929eab2bef..9855c2954429 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -1517,7 +1517,11 @@ static irqreturn_t vcnl4040_irq_thread(int irq, void *p)
 
 	ret = i2c_smbus_read_word_data(data->client, data->chip_spec->int_reg);
 	if (ret < 0)
-		return IRQ_HANDLED;
+		return IRQ_NONE;
+
+	if (!(ret & (VCNL4040_PS_IF_CLOSE | VCNL4040_PS_IF_AWAY |
+		     VCNL4040_ALS_FALLING | VCNL4040_ALS_RISING)))
+		return IRQ_NONE;
 
 	if (ret & VCNL4040_PS_IF_CLOSE) {
 		iio_push_event(indio_dev,
@@ -1573,7 +1577,10 @@ static irqreturn_t vcnl4010_irq_thread(int irq, void *p)
 
 	ret = i2c_smbus_read_byte_data(data->client, VCNL4010_ISR);
 	if (ret < 0)
-		goto end;
+		return IRQ_NONE;
+
+	if (!(ret & (VCNL4010_INT_THR | VCNL4010_INT_DRDY)))
+		return IRQ_NONE;
 
 	isr = ret;
 
@@ -1610,7 +1617,6 @@ static irqreturn_t vcnl4010_irq_thread(int irq, void *p)
 						  isr & VCNL4010_INT_DRDY);
 	}
 
-end:
 	return IRQ_HANDLED;
 }
 
@@ -2047,8 +2053,8 @@ static int vcnl4000_probe(struct i2c_client *client)
 	if (client->irq && data->chip_spec->irq_thread) {
 		ret = devm_request_threaded_irq(dev, client->irq, NULL,
 						data->chip_spec->irq_thread,
-						IRQF_TRIGGER_FALLING |
-						IRQF_ONESHOT,
+						IRQF_TRIGGER_LOW |
+						IRQF_ONESHOT | IRQF_SHARED,
 						"vcnl4000_irq",
 						indio_dev);
 		if (ret < 0)

-- 
2.55.0

