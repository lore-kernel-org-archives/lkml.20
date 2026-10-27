Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117098;
	b=2X63HqqWe7VVgD5VF/p2JlxwfcxaR2RMYy5V0/EvHeL+IKw2LyXD5rQcNPCACJ/u4Xy+
	 KmXNlJpg+9b3Ki18mSpVkPjJzVAzPDbBrx0wrklOcv/4VqyBvkP11ZycEeet3sIvlhEy6
	 VZKf/Khjtvlfnx/3cz1B78e2uIiCbCSQzyqe7OGo2CKpiMZS0TgxSr0bhJ+Ef+xfLWo7b
	 rT1C09R1geVWxCdiBeXVN38PRlm6VB6XSTsZXUgfiW0URrNuqeDGOPDSWQZWM3c6afsfY
	 3ZVXarTC1eiWO+pUt3ai6b51l5gmJIZQXZqLjKNM3Cs9W6i3X5rARYtBGPOn5N2AgMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117098;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/F2rwD49QkwQAj+Z9fNARvxK5O30lNNhgZjymWzOyVs=;
	b=ztHXrLJbdysedrpL1GEzKN9tZJbqfhuYfxqzHAY0zlsNkjhlwVrllVRAKo5YxIj/30LG
	 K+jSZJVOS8QNEekTSoXGK2yBVsG18g6brNpJTBhepPIHHvqC4RW0dRDRVxgh78NmIHEEE
	 jiJH5I7pwHDrvTvsEajSLZgHYSmj0rXcKpktxF0/wWo+3YiHZvILjd9QS/2JqkRalNzzD
	 HtSpV8osq6gTQnt8IciHFFXk1sJS4ZOCDIzUPK6l10XuUhZd9XX98Y3oemNClZhn+7q/S
	 5vKiaw6nRfuyr5BUNl5sjIbZ4dtASo7+OuL4NKEhmm6WA/RJ7NyDj+I8GX09vU1VwrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=VXOrbtwq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF902606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=VXOrbtwq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1180C1F031F1;
	Tue, 27 Oct 2026 16:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793117097;
	bh=/F2rwD49QkwQAj+Z9fNARvxK5O30lNNhgZjymWzOyVs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VXOrbtwqs4BSUtYx0rRkBbsX/yo0ELN6PembB5DCNn+xym0CfK2pP7djgfBnISDVa
	 K0RFPQujnwoqI8PK1YNlHv129oZyRi/1kIJfzGaJDY246NXyKOk7SLHHxr5VG5YwhN
	 AU3uO0H7b17F1jR91HVxUxURWxnYWN7KgYDhtn+o=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 17:04:38 +0100
Subject: [PATCH 5/9] w1: ds2805: use the bus mutex to talk on the bus
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
Message-Id: <20261027-llm-char-misc-w1-v1-5-d2e6bfafb6a4@linuxfoundation.org>
References: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
In-Reply-To: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=9M9xKTdni9HST2Eh8vxcSLFI0NV+b91HvNnx8K4xgiA=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPTs/85aHk8Oqv2T+9Nyl+J963zyo99b1Tbe5pJu4lz
 mr9P/ozOmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAikdYMC5qfxEsv4nvmoCNs
 /HV7tEjkw00vpzEsOPyTeYpF1raD31Yutzr86PcKDuZoKwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

Since commit b02f8bede217 ("W1: split master mutex to avoid deadlocks.")
the slave drivers serialise their accesses to the bus with bus_mutex.
This driver takes the mutex of the master in the callbacks of its eeprom
file instead.

That mutex is held while a slave which has disappeared from the bus is
removed, which waits for the sysfs callbacks of the slave to return.  A
callback which is waiting for the mutex at that moment never does: both
tasks are stuck, and with them the thread of the bus master.

Besides, it does not keep the other slave drivers off the bus, so that two
transactions can get mixed up on the wire.

Fixes: f6887531c0c6 ("drivers: w1: Add 1w slave driver for DS28E05 EEPROM")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/w1/slaves/w1_ds2805.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/w1/slaves/w1_ds2805.c b/drivers/w1/slaves/w1_ds2805.c
index 9c86b7985d0b..bfcc02ecbdb9 100644
--- a/drivers/w1/slaves/w1_ds2805.c
+++ b/drivers/w1/slaves/w1_ds2805.c
@@ -102,7 +102,7 @@ static ssize_t w1_f0d_read_bin(struct file *filp, struct kobject *kobj,
 	if (count == 0)
 		return 0;
 
-	mutex_lock(&sl->master->mutex);
+	mutex_lock(&sl->master->bus_mutex);
 
 	/* read directly from the EEPROM in chunks of W1_F0D_READ_MAXLEN */
 	while (todo > 0) {
@@ -123,7 +123,7 @@ static ssize_t w1_f0d_read_bin(struct file *filp, struct kobject *kobj,
 		off += W1_F0D_READ_MAXLEN;
 	}
 
-	mutex_unlock(&sl->master->mutex);
+	mutex_unlock(&sl->master->bus_mutex);
 
 	return count;
 }
@@ -211,7 +211,7 @@ static ssize_t w1_f0d_write_bin(struct file *filp, struct kobject *kobj,
 	if (count == 0)
 		return 0;
 
-	mutex_lock(&sl->master->mutex);
+	mutex_lock(&sl->master->bus_mutex);
 
 	/* Can only write data in blocks of the size of the scratchpad */
 	addr = off;
@@ -256,7 +256,7 @@ static ssize_t w1_f0d_write_bin(struct file *filp, struct kobject *kobj,
 	}
 
 out_up:
-	mutex_unlock(&sl->master->mutex);
+	mutex_unlock(&sl->master->bus_mutex);
 
 	return count;
 }

-- 
2.56.0

