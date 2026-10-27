Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117095;
	b=RLq+aza8qXG1EeBwReuhBhzP5kx0S1myptBIAihYagob2vnY14aZ/aXunG0yt31hScCO
	 qXyz1uaxmVgqQA8+wOnoTrzhmln+y6OYDcnCA86k1p7dEJz7dGcRYvLDB6joicwGoOfEm
	 E3g0+FxOBfxVb8NOir3QUBTjII8WjwY6s8x/vQMUickbTSNb8ONLDmNVub/FnO+DMPQzd
	 apL5A6/2P1pgWrE14Bvs3hb7b1rPRVqyw9DxcvbTOcItaA6TuY+XlwpvXsQ4MScRPPQPA
	 3g7v+zoj9A6lieNSAe75fuuvGdy9QI9DTCErVIT16TlnHTrrLWsVdnIJtbRiLn9MWpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117095;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=M52tRPd4Y/Q+FNrfpIKZtmvCqrC6ke7dRwxkri3ygYQ=;
	b=TdoNFFYwCL9DJ/cCCXs2fywlyCGeVKhXpoIqnX84Df8wp72EeWpsHv0upirXpxGdj31z
	 YVtKtFdPqcAt0oohaOZwnbymUqIbgGPeo6pCq2aZVSjEi85MO5AQtTIro2Cm7KA9NvV52
	 9MEnoE4X7a2RXEh6RGMhTZWK+xHR85w+gcpywywUihXEn4CDQG7rCeF/cNDQJKelDB0iS
	 atZTCg5Vcv2YmIoLEZypmS7ASPEgNFdwKBjF2WAhJa7pSpv40P1F2gqIafJOyF+b7059a
	 xCgvgLX4ismOEXI0mcZjoU3fz39QFA+DuEJHLQqiqZuZRVCaUUXc6ftnyBiCO2BLqrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Y+urVhuh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9EE60A2634
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Y+urVhuh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344091F031E6;
	Tue, 27 Oct 2026 16:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793117094;
	bh=M52tRPd4Y/Q+FNrfpIKZtmvCqrC6ke7dRwxkri3ygYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Y+urVhuhD0Ly3jQ2mw7lWZPDIfwgIGxN2B7iPqhysVpZsihzL5xB8k8WZq+s/Pxzt
	 oZtK+e5ck4LQBcjRB451HrO08jjcMp7waUFtJ6RWM/y7p9e+iEyyPTmj6KrzLl55j0
	 YHULekt64NS6HNxjfvxjLRUoqCUw9aWEQaZhps/I=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 17:04:37 +0100
Subject: [PATCH 4/9] w1: ds28e04: use the bus mutex to talk on the bus
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
Message-Id: <20261027-llm-char-misc-w1-v1-4-d2e6bfafb6a4@linuxfoundation.org>
References: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
In-Reply-To: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=3236;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=S9s2IGXOTwYMq0PTEcj5uHC+ppRl83iRH8Jh4QAxtN4=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPTs9oKlKI5srRd3nv4MpVzBa+9Ov16PedBZv09bPuP
 rvZ+M25I5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACaStI1hwZFmPlVVLdPTe3fy
 md8xPxg540NBCcN8P5W1t49F3/6atFbluvu+uYtf5/v/BwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

Since commit b02f8bede217 ("W1: split master mutex to avoid deadlocks.")
the slave drivers serialise their accesses to the bus with bus_mutex.
This driver, which was merged shortly afterwards, takes the mutex of the
master in the callbacks of its eeprom and pio files instead.

That mutex is held while a slave which has disappeared from the bus is
removed, which waits for the sysfs callbacks of the slave to return.  A
callback which is waiting for the mutex at that moment never does: both
tasks are stuck, and with them the thread of the bus master.

Besides, it does not keep the other slave drivers off the bus, so that two
transactions can get mixed up on the wire.

Fixes: fbf7f7b4e2ae ("w1: Add 1-wire slave device driver for DS28E04-100")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/w1/slaves/w1_ds28e04.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/w1/slaves/w1_ds28e04.c b/drivers/w1/slaves/w1_ds28e04.c
index 3b3c0789e1ad..30fb8415b659 100644
--- a/drivers/w1/slaves/w1_ds28e04.c
+++ b/drivers/w1/slaves/w1_ds28e04.c
@@ -123,7 +123,7 @@ static ssize_t eeprom_read(struct file *filp, struct kobject *kobj,
 	if (count == 0)
 		return 0;
 
-	mutex_lock(&sl->master->mutex);
+	mutex_lock(&sl->master->bus_mutex);
 
 	if (w1_enable_crccheck) {
 		min_page = (off >> W1_PAGE_BITS);
@@ -140,7 +140,7 @@ static ssize_t eeprom_read(struct file *filp, struct kobject *kobj,
 	}
 
 out_up:
-	mutex_unlock(&sl->master->mutex);
+	mutex_unlock(&sl->master->bus_mutex);
 
 	return count;
 }
@@ -253,7 +253,7 @@ static ssize_t eeprom_write(struct file *filp, struct kobject *kobj,
 		}
 	}
 
-	mutex_lock(&sl->master->mutex);
+	mutex_lock(&sl->master->bus_mutex);
 
 	/* Can only write data to one page at a time */
 	idx = 0;
@@ -271,7 +271,7 @@ static ssize_t eeprom_write(struct file *filp, struct kobject *kobj,
 	}
 
 out_up:
-	mutex_unlock(&sl->master->mutex);
+	mutex_unlock(&sl->master->bus_mutex);
 
 	return count;
 }
@@ -290,9 +290,9 @@ static ssize_t pio_read(struct file *filp, struct kobject *kobj,
 	if (off != 0 || count != 1 || buf == NULL)
 		return -EINVAL;
 
-	mutex_lock(&sl->master->mutex);
+	mutex_lock(&sl->master->bus_mutex);
 	ret = w1_f1C_read(sl, W1_1C_REG_LOGIC_STATE, count, buf);
-	mutex_unlock(&sl->master->mutex);
+	mutex_unlock(&sl->master->bus_mutex);
 
 	return ret;
 }
@@ -310,11 +310,11 @@ static ssize_t pio_write(struct file *filp, struct kobject *kobj,
 	if (off != 0 || count != 1 || buf == NULL)
 		return -EINVAL;
 
-	mutex_lock(&sl->master->mutex);
+	mutex_lock(&sl->master->bus_mutex);
 
 	/* Write the PIO data */
 	if (w1_reset_select_slave(sl)) {
-		mutex_unlock(&sl->master->mutex);
+		mutex_unlock(&sl->master->bus_mutex);
 		return -1;
 	}
 
@@ -328,7 +328,7 @@ static ssize_t pio_write(struct file *filp, struct kobject *kobj,
 
 	w1_read_block(sl->master, &ack, sizeof(ack));
 
-	mutex_unlock(&sl->master->mutex);
+	mutex_unlock(&sl->master->bus_mutex);
 
 	/* check for acknowledgement */
 	if (ack != 0xAA)

-- 
2.56.0

