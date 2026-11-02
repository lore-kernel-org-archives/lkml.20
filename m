Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649220;
	b=3finMeBRG4y33jgkm0r+2/UEA1yE1J3E4LXvCaEj4yRNzxlMUONFJNeypfvE7RzlTaVT
	 xBcrGy41puL36+vq5FN5oyuguHLtqfFveK2JBAoDKVzolBzb50p/1IRqWgNUrxbW0TwRm
	 S+xAPls9tf9Bf8IL+S+Z3XAlZzbsKSwdH6xNvlLrOgFTxzG1SOm4Tw34MmRuQH0GU2Wk3
	 bQbF4xB5g94HL/rNQuMq8cjSZ2jcV+orZc+30lNW8WMDZwzRkr6C0ar5gbJUwQzmoQZYJ
	 ZfyLYx6d1Q0mAYxZYacR/X0CofWsDlgQWelrmZNG6+PjoZ+eeYNQoZvBOjcTw7LOhYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TT+JdKCO8FQmAWG62bqZ1mtZpW2RojAaKod9k+xaBw0=;
	b=4g7R6Dbs7xa4GY6zgwqR5emMuzcuA5ogUxYvvx5ppBsQMXyzk+A/cjl/2FmTrvsa9zRj
	 fJ2IyEir3ZPim3ldOJEY9f0crgVGg9l0Q1geyJUoj6wb0iGYzQjo+2F6hGkGVvanvDvAs
	 RLdgAHqwHvWfyVhulEnpu8BaEj9SrZPRtZX4aX4DMNJe0k7TJbydbz6Lyv8R37OY9RJpm
	 faquLsQfs6QlhU319mXcY3tHg01/e/9xGMY6U67VoqFHKn0BbjuafjCmhRg2lkUGMeGlw
	 4qzJgLIr21Wn8iXuZ/RCd7v6UxxVFxV87Q58o07+o32XrR8MT1ZehvXUvFK2B20K8Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DZkmwp8L;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5AC606D80D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C5AC606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DZkmwp8L
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso15625975e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649218; x=1794254018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TT+JdKCO8FQmAWG62bqZ1mtZpW2RojAaKod9k+xaBw0=;
        b=DZkmwp8Ldw5cZdGpHHP/QtHPW9R7rixWvHRv08aEnWCneE7nIo2INsDT48hHdHi02D
         GLH/YW4V7P5aj6ICc6c/gCkz4grXOcRIvTS0aZMjG8cCF9mqBxjFZC5ssXT1DV48KM+K
         kUNRElYrQWcIGlt2uNRls9OAZJSHHmNsEGO9RwTDOvpDYJUrWKp+Uw5jgNfhkzhcB8fc
         2B9ufiHRYKCwhDCrNSd9MyYNscB70Jj4gBxrSZCLLzCLSof/r/UTTH82y0la5cCKhuL+
         bks16d3q7KG/PaEevRRfC+Y4/Nwi6Z3SaYKZBJKR3vFMJzuhOUbctQ4XVxyRv52gNdr9
         20AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649218; x=1794254018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TT+JdKCO8FQmAWG62bqZ1mtZpW2RojAaKod9k+xaBw0=;
        b=k1IPmeoQlnmVaA37mXO0UzMXZwqiieq5ixVe44zP0qzCrfYSR/07PHdL5ZE5dKks7K
         AvKQX/vfzaAQxqBTx3QFToMbYwKdMypd1uQfDfK1JOBHcb5hnz55PENEKX8lrNBJUlDe
         unclPuLh5lj+zO4jIHvMkL/D31v9+OskAJkx2pYVLEakK/FxhddvqK8r9zybDMaI8zKK
         I30/IzxmOGgcjcXPpGTjOdQ2LaV9c2dXJEGY6G6Mra5+rsExvyU6OdFGsM4xzOg26wn0
         vB+cQPp5yz4JRihs+Fk7Efw+q1SfRYSqqcUHxo0Hj8PDIV5hwzz7B1s9Q4Y3XoxLX4Ip
         7fnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDyrFtRGmzzOu+ejVC00+7lHyddZAQOKc1IYHDPrS6Y60OFDSc2ms+oj+VpfMl19RCxdvrvYz6E6OFGa4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkhCdpODm4M4TDERsviYLMBGkNZGX+1z0amjk7NiCgnnUa9qUU
	ahO0NX57r4Z+2SaEtdMFhF6ZtJKJ5hv2PtMHcHaZFnSYdkzfil5ec9gY
X-Gm-Gg: AYBFou202R0xVYx5pBnJHBM1TnWjh7aM3sSb4l5B3GBe2zGOZ8lh0GsyBXaLasXm+wK
	y0WwlfhQhlQJ3f7/Hb6sCy09PfEvQz05ZtCQ/dqG/bQasbA9TgkU643BSxw7Wz+u1JvzIvydfk9
	935oLBVy9SEEnvfwR485D90/vCX2W5c5j/GD4smGakIY6MiDvCpvBuOZiSc0kiZ9EmI1YciMrkI
	koM+Krn+vsPIbxLLmG3/vhSISZotWRsguwefe6wvZu1WCVKFeaV3lySlrOAvxe9cPXxmZV5molX
	oXMaRd5VffZy5I8QnnQ8qPSbhT73Vd4p+qbQcJzieXzwcQLkCcj0etwOkyXBamG1te4x7i4+3To
	ZDsVB1TXWyHDDW6vy1BiexRNAJ2VJTqG2KjdvlNc/RjorGBSITpixhWhIEsmiDF6Rh2SIFv7QoM
	eiseXKTPvx90AwhgLk2nKlasbypvcMboLV1r8VURdMzewPxQ9bJ3KZh5oi/SEzzr4sVg+ENqbRy
	N6kggo18pRH9FLSO6WBmRin5s3qlPBr4aafXdBhTU3Q6JEKE+YY/k4Ld7JDWYIPIVfV5M3SeqhQ
	nmg5KotSnDRjBmEOp3a2DoixuLPBdzTX4cQUvWEVjqpBIwciAC8WDjlWNh4/jHTndASvydP6KNi
	gdEVqbSSww3yWfpRV/1fsG4t4g7HGvjvjCpPnwQ==
X-Received: by 2002:a05:600c:848c:b0:4a1:efd3:9862 with SMTP id 5b1f17b1804b1-4ac1765d977mr237853695e9.21.1793649218121;
        Mon, 02 Nov 2026 11:53:38 -0800 (PST)
Received: from x1e ([196.189.152.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b727c6sm23542852f8f.16.2026.11.02.11.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:37 -0800 (PST)
From: Maritu Hone <marehone12@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Maritu Hone <marehone12@gmail.com>
Subject: [PATCH] staging: greybus: uart: fix heap buffer overflow in gb_tty->buffer
Date: Mon,  2 Nov 2026 22:53:32 +0300
Message-ID: <20261102195332.19860-1-marehone12@gmail.com>
X-Mailer: git-send-email 2.43.0
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

gb_tty->buffer is allocated once in gb_uart_probe() and reused for
every outgoing chunk as the backing store for a
struct gb_uart_send_data_request:

	struct gb_uart_send_data_request {
		__le16	size;
		__u8	data[];
	} __packed;

In gb_uart_tx_write_work():

	request = gb_tty->buffer;
	...
	send_size = gb_tty->buffer_payload_max;
	if (send_size > gb_tty->credits)
		send_size = gb_tty->credits;
	send_size = kfifo_out_peek(&gb_tty->write_fifo,
				   &request->data[0], send_size);

request->data starts 2 bytes (sizeof(request->size)) into
gb_tty->buffer, and up to buffer_payload_max bytes are written there
whenever enough data is queued and credits allow it. That needs
buffer_payload_max + sizeof(struct gb_uart_send_data_request) bytes
of backing storage, i.e. max_payload bytes.

gb_tty->buffer is allocated with only buffer_payload_max bytes:

	gb_tty->buffer_payload_max = max_payload -
			sizeof(struct gb_uart_send_data_request);
	gb_tty->buffer = kzalloc(gb_tty->buffer_payload_max, GFP_KERNEL);

so a full-size write overruns the allocation by exactly
sizeof(struct gb_uart_send_data_request) (2) bytes, corrupting
whatever follows it on the heap.

Allocate max_payload bytes instead, which is exactly
sizeof(struct gb_uart_send_data_request) + buffer_payload_max, so the
buffer is large enough for the header and the full data payload it is
used to hold.

Fixes: dd1c64ede97f ("greybus: uart: kmalloc for send_data once only")
Signed-off-by: Maritu Hone <marehone12@gmail.com>
---
 drivers/staging/greybus/uart.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index e1b73db6a17c..7bbac2603726 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -842,7 +842,15 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 	gb_tty->buffer_payload_max = max_payload -
 			sizeof(struct gb_uart_send_data_request);
 
-	gb_tty->buffer = kzalloc(gb_tty->buffer_payload_max, GFP_KERNEL);
+	/*
+	 * gb_tty->buffer is reused in gb_uart_tx_write_work() as the
+	 * backing store for a struct gb_uart_send_data_request, whose
+	 * variable-length data[] field holds up to buffer_payload_max
+	 * bytes starting right after the struct's header. The allocation
+	 * therefore needs room for the header plus buffer_payload_max
+	 * bytes of data, i.e. max_payload bytes, not buffer_payload_max.
+	 */
+	gb_tty->buffer = kzalloc(max_payload, GFP_KERNEL);
 	if (!gb_tty->buffer) {
 		retval = -ENOMEM;
 		goto exit_put_port;
-- 
2.43.0

