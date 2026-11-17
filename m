Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916761;
	b=X/sU/XL2VqYR9/xZCjke20WgsISEd2IsjkuxAy6uGGF8d+jp0pa8ZBc24+7oYyCCdFhk
	 Yf2Mc94nWAJ5xUu7YjEdXrL6JZs+37k6VufLFYP1T+W5WKdaOymhGSi4w7JzkBsFOFUWe
	 oejd51oYdIDDrPD+O9XUP/GFW3U7XoWu677anh6el2vCo6qdP5KiRzVsJAbIVfKTFqpQW
	 G1nKmfpk6TajbH+yXNnUkR2TPziND4zY1lzopRlL6vq1OEDCRVYTB9Ke/D/vAQ80fC75+
	 ntZnasbZV6OS/VR4OMDQwK+2j+mvllv3L0oh3JEZz5Bcst2Q3dQmD/WA3XdT9u4ecDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=WKTEAM9I3CkYQTlrLK0rIV5zDkc7uIjCWozyx9Jz1I0=;
	b=lxLPgzx0xcpZhUnbYmoQrODsuYMDly3b86B8VcGJzNmuwhNfAejqeES+49yNzUQXSHkl
	 lKYguK/9iVh3Qh1Jbliw2iFk75OtL01zUJVMjwJ9uh54HqgPoWh8nR9oJldyVwZrFRlLa
	 QquG6vznimnxIuRMwxeau3KlX7Mf0hznoAUkJt6ObGmvfkPTC9ZhMTvDJeK8AMUcpSWuv
	 1g0AiNU4Vpv7NskVjq+TtIqTIwDc71JElIxlhKXSfF3suO/v1r/U5g07vHM27Z2tiheib
	 WeqI59WLXYVQ5bxYGL1m8X6Z1WyvCAzEBqTgJ3Gu2ddoyAb4onK8MCkz/SQKur8i20Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qlUsY8SY;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6D5606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D6D5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qlUsY8SY
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4697404c2bso613201066b.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794916760; x=1795521560; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WKTEAM9I3CkYQTlrLK0rIV5zDkc7uIjCWozyx9Jz1I0=;
        b=qlUsY8SY/PEOwVqynP5GqlU3aDOnCcI5xwwfuM7tdLnK58ifttGwDACzcxW1wYx50j
         A69fpNXq6ymgd1FyPWlV7Ske6xHBlw/qV399XQmE4/kEecv5pgN/IhPJkkMzdfCF/jJn
         wwaElvwVPWT+GNpI2vgB5OH6POiTHgesq951CB/H25MoqeMUQZmQE5wWG0EJwblJuNTo
         kmBUObtVCFjOClfIgBKnTtZFWaEwwWs3Nwi6rhQNvkP8Qsfgss65DNs3DUGt/Z23uhMj
         7UO54jRGdgirZz2ABXndFlD9IVKHdy8qRxUWdlcczAmkX3f3VawdVU9Z8j7BcUSj5JGm
         6z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916760; x=1795521560;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKTEAM9I3CkYQTlrLK0rIV5zDkc7uIjCWozyx9Jz1I0=;
        b=SyTgAMDqnU+PqoEUyQ7YSx4NAja9SZ82eOKTZTKq5SQI5AHkR1oUaEksr2PQb7JQN4
         RTmS3rGbRdVy/JEErIQ+ZyuBwQUiO6vhVOkYC49raOUysvfFJBp2tmvPRO7VX+F/uV9J
         yJ2toxFhSR5MmaCf3tHEzYNkX3akuNIk+TIZbZYyUGU8akQOcpanTCKt9FiivbY1navn
         AsfYWO5PALvFT/TWLbgkXVE/rhNhZVc4TQLiOWUruq6C6CezZRMVG28kl3H2dfDVbi1E
         E3UxVuQVxGPSTHyhPeMP4QtgwodLo9SaZq/SyToZWfnseVQ8ZV/jgyRb2AJH2pX9KvdQ
         7i/w==
X-Forwarded-Encrypted: i=1; AL+hErGn4ffPrnP0cJDSBO1loMdfmYOBB9BtrSc9+a9xj/uPp2c2q7CMs9/ndvKvn1rTsRsFhHMtc3xhUCoCBrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z//9KrTOBeIS6QOk1uWD3SQ1AQ9ZVrwErvxOR6FPwk91Y8ZzZvh
	H+Y73JH9s1o8VY2+XFL+n/5l/UW3Dil02n6pb1UXy19aHF1o1X+UNjffCVzM8w==
X-Gm-Gg: AYBFou33/4Is8Ms5DKX20Apkjn4Z3h8oyAaF9y3/cUuDNi+NEShx5fy/cW1jJOVF6N3
	4S2jzoPbjT8hSK3DzzVJRGrzg5HH0TsxtDPHKCpfw9UElMrlmY1wUKyplWFHQWiDWOlJTbKOc7n
	QlqBkW/6k4aiOTNys9ybSOMyy0Ej2o+u97XPU3JP5z7rBnlTaE61t3IXcMvLzmahM3J3vr02rpb
	jviJFFst+4zcj5dNCdfkr6XxgRsmwrOTKY9GbDih6hoJ77HdjG+SfNuPikvm1+9v4CgmhCKpsd2
	noF35Wh673bhXIzLp1B+/LWpYkqUPahUXI94cjeHyRTXZKSYv9qm7pGfPiP40icwJtjFuNLkQVy
	i9u+lyvIS3HOKBGBcxHdcQWOb7MZhZD5S52UprM8pIwRY1qf8lQmHhb3+le4a96+PdBKTJTcCRW
	EXpO47wPduN455yJ3r37pdG3cusISjZbMhH7G8SPL7fIrb16Nw0V32nhihOtPhq7qpkL1A4FrZ8
	V6GvPxK1TJIrweTx+iKsWLELXb22bJhg/TDLTz1UmZSGKamXIWhVEYwbZld7IIlnItEMAgMi9A+
	Q4kKcHy1AZD5ZnJz5N52XiQQ7RJ6YxB5TbxU0v5rgJrc/D+B3aEKDLAf
X-Received: by 2002:a17:907:3f23:b0:c4d:22e2:1a2b with SMTP id a640c23a62f3a-c509614f546mr1113666366b.1.1794916759692;
        Tue, 17 Nov 2026 03:59:19 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50d71c2393sm259683966b.54.2026.11.17.03.59.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2026 03:59:19 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v2 1/8] char: xillybus: Improve sanity check
Date: Tue, 17 Nov 2026 12:58:55 +0100
Message-Id: <20261117115902.41359-2-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261117115902.41359-1-eli.billauer@gmail.com>
References: <20261117115902.41359-1-eli.billauer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The sanity check in fifo_init() added in commit 1ce74f6f2216 ("char:
xillybus: Add defensive sanity checks") is unnecessarily complicated
and may not work as expected due to the incorrect assumption that
1 << n == 0 when n>31 due to overflow. Replace it with a single
check at the function's invocation. This check also eliminates any
possibility for overflow in this function's left-shift operations.

Fixes: 1ce74f6f2216 ("char: xillybus: Add defensive sanity checks")
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20261109112800.48663-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changes in v2:
    - New patch, replacing v1's "char: xillybus: Use unsigned int
      literal". Following Sashiko's review, reject log2_size >
      ilog2(SZ_1G) before the left-shift operations, instead of relying
      on the overflow check, which a shift by 32 bits or more could
      bypass.

 drivers/char/xillybus/xillyusb.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index bd3babd39f35..c4ddde221f0b 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -374,6 +374,9 @@ static int fifo_init(struct xillyfifo *fifo,
 
 	unsigned int log2_fifo_buf_size;
 
+	if (log2_size > ilog2(SZ_1G))
+		return -ENOMEM; /* Reported as greed for memory */
+
 	mutex_lock(&fifo_buf_order_mutex);
 
 retry:
@@ -390,12 +393,6 @@ static int fifo_init(struct xillyfifo *fifo,
 	fifo->bufnum = 1 << log2_bufnum;
 	fifo->size = fifo->bufnum * fifo->bufsize;
 
-	if (!fifo->size || /* Unsigned integer overflow */
-	    fifo->size > SZ_1G) { /* Avoid signed int issues */
-		mutex_unlock(&fifo_buf_order_mutex);
-		return -ENOMEM; /* Reported as greed for memory */
-	}
-
 	fifo->mem = kmalloc_array(fifo->bufnum, sizeof(void *), GFP_KERNEL);
 
 	if (!fifo->mem) {
-- 
2.17.1

