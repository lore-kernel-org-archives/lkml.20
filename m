Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499554;
	b=4oM18R5cZQJMOwj+auNz8s3/jTusp+lpMFrleswlKWRxGed2zpwABTUxee/ha3WUCFdb
	 NYW1OoS/N1wU41L8ziF6NRWLJGjfAwUqJvmqCE6hUkF0ALHvg8l/t1Deqy6gVK8uUUgwo
	 2kLIc7+gDPat8ODLH5Ygkp5sm5tWe7KOlvTcA9//QQkD5Vg0L2zsln6HJs6yKn4HriVNO
	 vx9hXpOYLButTnB4AlrTm1jxFbuSSTwfZhtEhxu5ZFlIr/nEh1ee8lloJN9MS+cj0y0nD
	 erYYQff3Ea+hLZ2j7zcmCup+3NTFcvb5G+3ZG75NfeFCSMtus5XRS+eNSC9/yWW2BBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o8iTVgOTiZT73c0h3+A1eigD9lE2pHsZudl5pIAmkQI=;
	b=EyuQ6KL0R+sZyi8NOfrELdE8t5/5/llbT2MH7e75oaxt/rYRUCIHhf/ZyzZ2DCgVwGo1
	 aa5ZEl3v/eLJhoQNz/O0MQ7+uz86KoGJVnlQrG72HJ2hGg8RRTlatrHblk24ZXyuf2CnQ
	 iWjPYtwiU/RzbcHnSoFU17W4prgKLqQ9uEn/pR4D/W2gXnCIJyY+Ia5ueb/waau3yAuGE
	 C4LnnblmRPLlCXqhI4fYgsedTO7yiSbyZEw+NMNtHqIrnlorcrPTBUtYOMZR6kn27TJ83
	 x2hUaIchtTUYWkkCQsGoJXwYHNMnPTp7TS9jNbVVuBuce36BwI9WsXCg7d7DzJibMLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTWT1m0Q;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB55A606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB55A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTWT1m0Q
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2977860f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499552; x=1795104352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8iTVgOTiZT73c0h3+A1eigD9lE2pHsZudl5pIAmkQI=;
        b=KTWT1m0QTT0IiZ+OiePQXtoD9hL26xv0+bxj8gkZu3CnT/s7rK1bHV+T5jA+yVy2JH
         e9WASE1yr87WPJfZvr4bDj0rfP7KgXfGA2HIl0INE9UKHFUdjRJb6xin92zQFGO3kva3
         qV4FcJhJf+hBvWE8I3AiE045NudIMMQ+ful4qu0cuqfVWhr0zzcx8dkpooKYdKnRw6yc
         7c8za3dsAKoECNiijG+9nyaPbkKqFN6FUVTo/6EGhOTLkfK6rR9w3VFwozKw94dmHE2c
         zEf5/PisDigDGeqqRJZ74a/mdSHcCxJMiMeDbDq2ybrXZz1h5RA/wSAxa4qU4BZa7eRS
         x1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499552; x=1795104352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o8iTVgOTiZT73c0h3+A1eigD9lE2pHsZudl5pIAmkQI=;
        b=IZ9A4+KcqygKQiSyd++rlTKF7gDJYIoZIX/XQOpyIdyMCfv0ZXSqcVJNcLGDN2UYEP
         Fg46hLu1uIFlq8gmymLZyyiw3n0nYBP6cSGiA499U1ZH4AW6HIH0KS2eFoBQ0xutMJVa
         Ua3GlfpNC+MQ1ZR5eeHYNM+sbMqx2vXSasZjPtckzVP6R3M2n6W0mT646D+RxdHRH2+V
         IMRuC/Zde9Jz9abs1X09dCFPZHzfUmyx3vdLo0FO3cvJp/X+dYSJy2ocHu28uxvmInyj
         Gx0YB48NFURP+qux7iQJ0ovsFIlVosOsG8S+hWvwGHXMrNtDpSFCEIWiZeLiYULpPkn4
         K1YQ==
X-Forwarded-Encrypted: i=1; AL+hErGMQvm7nymxAnqrjEgO1I8vdgxDD7Yz5H8xYCEOUInTAHu3ujHz2n83oIFIqK5l+IUkN/lPYJQ+IVAwM8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z96043xJW/MJwAw+2m8vuNIyWD8nVYRNNVX7y+JnJhlLRXcAkwg
	tZWJZsJ+8TWsohJ/t4iYegv8w+zwj7SkNXb6NnHqMOFKq8IRRzaD1JB2
X-Gm-Gg: AYBFou3uE98a3oixWVBNAy+015STG+tUSQfteyxuJzf6+FoS0VBEc3O0Jn9jTNzNr1b
	2qsHBIPiRvqRWcuI9PrSOaiQqeftqGJxVVVssnwy9MZlXBzNB3/moWCHlwxfAYNKSQP5fbQ2U39
	X1Rlolhg2fW0T9jb59hDi0oxAjU7/lZs7mMPvx8OvBxrTe91NH17/o6fpfqCNNvBWejx88Ul0z3
	vFpOsHxmkXgx2+RDvQZ8DmtubpS1FhFcdEhXEG6aja6MqXKOEGAUE2z+R2TAogj1ql1aYHk0LC6
	2Ni9bhc0+ElZp4mXpOOEXtTUGaAKcDzQ9dQ7WXZ+Nlr6718FakLrGpDexcQzW5M0l62U4JhmNUs
	/eFbfrjj6yUkDF/OcXSL3nTRPmissIbAIRgJQEEsIT5MgrS3FIa83KbVGqfv0G3Tci1X9n/khqL
	JkrAYtAx+PaaW1Nw3TLRx59w0sjiN/+/GEVjgJ7R6BHKFyHw+iCis3WSEOn66ipDczuTcEr1sS6
	sPJOORT7cC1wBAezZ5SWNK5/zyAjOlrutTaqqvS3O+Q/P2NBV+TpVTVBAUKf6wnE6SokNUcFNL5
	rTo4Ker4/X4FFsR+myuJb1NQW7qdTXJrj+51yKu9OJXJlzeWK9QSwWqmNlM1
X-Received: by 2002:a5d:588c:0:b0:48c:414f:cc12 with SMTP id ffacd0b85a97d-499c792de9emr11285652f8f.40.1794499551691;
        Thu, 12 Nov 2026 08:05:51 -0800 (PST)
Received: from AVIV-PC (89-139-9-231.bb.netvision.net.il. [89.139.9.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f78214dsm23615f8f.25.2026.11.12.08.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:05:51 -0800 (PST)
From: Aviv Levinson <levinson.aviv@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aviv Levinson <levinson.aviv@gmail.com>
Subject: [PATCH v2] staging: greybus: uart: convert idr to xarray
Date: Thu, 12 Nov 2026 18:05:46 +0200
Message-ID: <20261112160546.27094-1-levinson.aviv@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026111219-guacamole-quality-2ecf@gregkh>
References: <2026111219-guacamole-quality-2ecf@gregkh>
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

The legacy IDR API is deprecated in favor of the modern XArray API.
Convert the tty_minors IDR to an XArray.

To prevent locking the entire gb_tty object while loading the minor,
switch IDR to XArray and use the internal XArray's spinlock (xa_lock).
To respect TTY encapsulation, use tty_port_get()
instead of direct kref_get_unless_zero().

Signed-off-by: Aviv Levinson <levinson.aviv@gmail.com>
---
 drivers/staging/greybus/uart.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 2b1a5d4671dd..054bdc232942 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -339,24 +339,21 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 {
 	struct gb_tty *gb_tty;
 
-	rcu_read_lock();
+	xa_lock(&tty_minors);
 	gb_tty = xa_load(&tty_minors, minor);
-	if (gb_tty) {
-		if (!kref_get_unless_zero(&gb_tty->port.kref))
-			gb_tty = NULL;
-	}
-	rcu_read_unlock();
+	if (gb_tty)
+		tty_port_get(&gb_tty->port);
+	xa_unlock(&tty_minors);
 
-	if (gb_tty) {
-		mutex_lock(&gb_tty->mutex);
-		if (gb_tty->disconnected) {
-			mutex_unlock(&gb_tty->mutex);
-			tty_port_put(&gb_tty->port);
-			gb_tty = NULL;
-		} else {
-			mutex_unlock(&gb_tty->mutex);
-		}
+	if (!gb_tty)
+		return NULL;
+	mutex_lock(&gb_tty->mutex);
+	if (gb_tty->disconnected) {
+		mutex_unlock(&gb_tty->mutex);
+		tty_port_put(&gb_tty->port);
+		return NULL;
 	}
+	mutex_unlock(&gb_tty->mutex);
 
 	return gb_tty;
 }
-- 
2.53.0

