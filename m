Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466265;
	b=gsz3ditdJS5xqmthmnRn67VzmDK0d13AJQry+slmRLwQ1FeebiYeFonRR7UQwj/K4uf3
	 HVdhZinzLcGoTzzwVYb640eBEcpVJj1AU/GwZTXBP4+2FNbAYNtK1qEv8bGJPdqJ7pyT5
	 v/EqkZQanLfiHz8IdOJE+7BaikmomPyrnOtSLPyzBjOG1kqAPhC49NUcIrdxVG1CrLiWJ
	 LK57YleezNJi+fINb7aT0euJv6thF4Axu0IFMjVP4k1HFQqYjfAvxu3OzkZGvD/Sj9l7+
	 9ASLEQwd+CW7r95vKmFsFR/4p0ysNn6yCdhgVzqp92NYFGkw+PArSiRMxej7Ptc6M9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6lvU2zDGpTn+1S6znFlJVbEIM8CJDet7iYqjJ+8Ec+w=;
	b=FN53ysZCV3LJ0MQsX/B4dpiw5iU0WI2WcQ6jzrHclDf0g0T6t5jIe5vE/oQuopEMiJoZ
	 mqV0GjHAg8kW26HaTIdaVZMmBPUL0BKmupC3glpmhbu3r6BjDKEd10fZUoryxz9D6JZZc
	 XGTQlhtiLHCI/hJhNJiO5NZYCeN5B1q2GDCp8bR1BGNM+FiFQkp7pd30dXL+CTo0U5C4o
	 8YShx67u8h0RsQYlGLrWO3k9YNMaFvMm53yD668RtQrzWPKx58O/1qSd+5x/1nRS93RoZ
	 EbHj3V+6srZR8K1E8Eua2Mf7sQC3EZxM5RDHsaABPNh7PvkQQJIod81semhwEBDLC7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ity1023+;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14DC606E91A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F14DC606E91A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ity1023+
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso5943896eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466264; x=1795071064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lvU2zDGpTn+1S6znFlJVbEIM8CJDet7iYqjJ+8Ec+w=;
        b=Ity1023+42ZnCkMfnjvjKZ56iaq6kJJAgdbwJkOMrVTtsxctKdhXNfmZPWebSMZzwN
         72k7zoC23K9Ah/W8P3TDW0/JuI3nYGObHM3HDvwbJ2bDcQj87H1qsM6Tb/ar4HQF/Y5p
         SLCtpi/o7Y3jShW4qDZclAgAwDrpMz+sYlenPn4w+kyoIzOavI2lGsLWKNt3QtrWHusS
         KanIW6ehlVspInU1/G+MXAwOzlUNXWhxYKItnt4Qf8GKTu6V6mczpbb51yBKHivjFU4Q
         lI0s1sRkKCf7MxAscMEbIosT0OIlYW3MMlIb67kVinltLmoIRfDzHTMZsOqNZeW1KfLT
         bHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466264; x=1795071064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6lvU2zDGpTn+1S6znFlJVbEIM8CJDet7iYqjJ+8Ec+w=;
        b=XCPwMR7D/VrY6+dX/JdIg7yYzlaHukjlRTOCinZQ0dkEqo1wANy67iSHGEMb6+S62U
         VHmOoDP7BITgal4AhCTrCaZjM+9n4tseCMkB7BPfwpL9cvc+IeDcVNNSN1uDpDgLARCK
         V8VGOl4OvZWTqZG59JJvCpEf6PZZ0Sj+zJ7l4XFe+SQCbngDQ2e3arpyrvqNYhifzoE/
         hoY0VCrebqbJRmmSW/uajIKxL6ux18bN4SDjMtx4MESfht7KY1y0pXaCy0DawNG9Ijgx
         rZkpVKSTfojrYzScc8yzoneO7IUCH9Nwwxi6XTmRLPvkJwQBAk9AV4TjJRNx7FFYQ3HA
         v9yg==
X-Forwarded-Encrypted: i=1; AL+hErFt41DJwgPink6XUcX21hu+i58s+4/ah5G+eJESEz3g8i3M93s4LmAuHp0lBRQFNs9Rbwn737ZQFg1FmpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mlXsn4krempNsEHrB7XAKvPUvfwCVd+kVWamEs9kCDGSmaySN
	saC+73qq7pbjcIJDhbSW44XtXFcC5chJZwYMfgUEtCa4kjEVZZpANyyZ
X-Gm-Gg: AYBFou2liGBwKHiqSVJHNEUMu15RMOoUHHZYiddkvYd8i1hRisLCn880P3NnD1iZgG8
	OwnBcgYfeq6ocW443/unvB81RZZy25N/80cc1yiAEdb4JiouZmmurGZ9UndIBzXqfnpB7rODfRm
	1DTruQNp1n5MjGyW1Ztsugn5P9PateT1bby0QLZ0LqG7usbzOenoNaFDLaFyaFv1gRLeVFulZNx
	dt4Xj+OrQV238wyE6I3x8XsBhrjUgzelvcFUXfE920oLUjrHGWYoa+imaCXHQqHCfWPUPGpxtMw
	dmOnWfRkogu1SzClZeLjZmbOD085OnfRDdwqxQkYVMCGHKFsD4K4Sewo0zT9VfPejwC5qO/DMjL
	W8vY0gPIar7+ky7KuvaaGZ9B0YX2UBLGQTnihoDFQluCt9enOd597lwbxGl+pRtCzNBzHvt5Mp0
	G8asvOYx1gGofBEYuSdittcaK8qcT5J/VDtEND9BEIQPXNTIPl5vDj1OtMjSntNxy2+P3Ee5Vbo
	R6e2qpafqckPitt7yfwiJKmqZoXe3YFTrl67txr/tHLe3dKB7G7li2s8fhnmTWP1fKP87gNiQe3
	0xhc0KjrU0aZ2zL6W0h6WdGCvXJDivovGNmbolmXYEvNa+eYkGXbD2WOYefXPxCfNP5nDuR3d6s
	/m8r3SU0cl4fQK6Ws
X-Received: by 2002:a05:693c:42db:b0:368:4acb:f8a with SMTP id 5a478bee46e88-37686074abcmr5459037eec.17.1794466264023;
        Wed, 11 Nov 2026 22:51:04 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm20788624eec.9.2026.11.11.22.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:51:03 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kim Kyuwon <q1.kim@samsung.com>,
	Evgeniy Dushistov <dushistov@mail.ru>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Input: max7359_keypad - drop platform data support
Date: Wed, 11 Nov 2026 22:50:57 -0800
Message-ID: <20261112065059.1802480-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112065059.1802480-1-dmitry.torokhov@gmail.com>
References: <20261112065059.1802480-1-dmitry.torokhov@gmail.com>
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

There are no in-tree board files or drivers instantiating max7359 via
platform data. Remove platform data support and pass NULL to
matrix_keypad_build_keymap() to rely entirely on device properties.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/max7359_keypad.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/max7359_keypad.c b/drivers/input/keyboard/max7359_keypad.c
index d2b8adcfc9e5..686832fe2931 100644
--- a/drivers/input/keyboard/max7359_keypad.c
+++ b/drivers/input/keyboard/max7359_keypad.c
@@ -157,8 +157,6 @@ static void max7359_initialize(struct i2c_client *client)
 
 static int max7359_probe(struct i2c_client *client)
 {
-	const struct matrix_keymap_data *keymap_data =
-			dev_get_platdata(&client->dev);
 	struct max7359_keypad *keypad;
 	struct input_dev *input_dev;
 	int ret;
@@ -206,7 +204,7 @@ static int max7359_probe(struct i2c_client *client)
 	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
 	input_set_drvdata(input_dev, keypad);
 
-	error = matrix_keypad_build_keymap(keymap_data, NULL,
+	error = matrix_keypad_build_keymap(NULL, NULL,
 					   MAX7359_MAX_KEY_ROWS,
 					   MAX7359_MAX_KEY_COLS,
 					   keypad->keycodes,
-- 
2.56.0.567.gdb80ae8cd5-goog

