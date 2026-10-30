Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399839;
	b=paleG8cc75HH/JlhYGXu4/ficg11F5P6QunBAhGC4QvOaUlZShkgJvQ+kfO1PUHrJ1nB
	 V+16ukeXa0k1s3IkRfBS0xh5PX97NUkpQ2vud90MLhNHiL32F4IC36f6hDxUcqUY3GEpm
	 PqRHuzL9zSqVU1LQ8zIcBCp/d8CpYynnX/4I2IP7thSACmHiL6+HvUDX5k4T+a1DC+0oM
	 U3R0hOfDQ7LFP3pCWxlfVZEZFDTGJeCQo9lOCFLBj74iQzeFpfzCTyOaYeMg0QkVQHvdO
	 611fCQ65ryQAqz6/0BMkDjrKB1JgeEY5wg+w8AUKE71uX8tCsakFX5jrj5T6l7U08yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MVdIdJZip4V6Y6Le2JTKH9hHaIZalIL6VdbzzoeRaKk=;
	b=AqzS/Vyz8/OCvVUTM1zaqGg2goJ5w8voC2jie8MRwHoC0zdRFORx8z9aXjdZOwbEwOp9
	 vhJM2TGoKWcQ6+TfLHOLvidBkvjdouNhHx3/0vRDWj7sXnP/623jgX1wb8G6Y7+OO6fIc
	 oGLyba7Fapab/xnPSrNCoDIZ7ghg4SrBTSvTsxXXZ0rkn6fxguQf7blVNTYNm1M7Z01QA
	 c14jTYcSyOP8O1ls8huqTVrff3KD9pB3YrbUHHxsKCoE5Fndtwk393eoSOIMbVCDvzcQZ
	 lcXgE3hy1VPE6oUHcZaeZyzZW8cUt6w08FQB9TuFK7A4CKFYpAXI4l8e8hAlKYRTEDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OYiSZd5e;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC2560A3807
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DC2560A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OYiSZd5e
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so9924855e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399832; x=1794004632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVdIdJZip4V6Y6Le2JTKH9hHaIZalIL6VdbzzoeRaKk=;
        b=OYiSZd5e/v9Qof0ZiLjCYYymHax/1QU48N2uX9dn4m1M4qccuhF1G7wPnKY4H9k4q5
         PtpzB3sAcrowhyCGu5SnRwnulcJ7mN5TYRubKPzHnWxekRYqBKKcn6vcPvG58wvpXJFT
         /5Dy7btFOddSdWxm31iuemYh/f+k0YgEHMlL9VebsDp0vzJl0OgB7BPRP+6RfiNU6nBI
         yjiLDMgcpLVx3nD6nstKc/BKRdRWRjaTXUJjTgQVhyQm01+g6C9edPm9evr2s2YlQpWr
         HUk0Y7meX1O0+a7b+k7Y2aSF/JhI48htx6On+lmTbAlfeFl1JuUNy7WdfgUMCJQneyHe
         cvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399832; x=1794004632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MVdIdJZip4V6Y6Le2JTKH9hHaIZalIL6VdbzzoeRaKk=;
        b=Mn38o4QZAQucKXg0ggEYIXpZcXXKEGrRK2OXVyuOaihCKSwzlQtsv3nLpmQrqF1Lb+
         BHZgmu7AaV9Et2FiJNy+IM0jEy7kgUWwEdu23OyO4JQ9eeuX31b37eF8zFG0PtRuXCLI
         bM71wRHZaQ2Ge97AivtKx2IikkGrPgdPCMweD8I2Ah1JPHKFsi7YbnQucsoBW0nILBhm
         K5vPNIdx33r+wWef2cyS9A2BTJKo7Xg6nJBLvMuaxuisZDUv0vkdnzZriq9UeP+aKbhG
         I5ue9BkVPCQI4BqmYvRPGEMaUr3eUXE9tA5/uBRsbm2klWj4grhfM2EkpYuhcipYeYr/
         t4Lg==
X-Forwarded-Encrypted: i=1; AKwUvByTnEHqmahW/2QpLuggDulWeDwipTLbEvxsQuThFcR9kbzY0xYs1Q7Bk2V6ZPs5az5r3cIv/uByKRaKnEU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXCSTVi5ohTeZdvuKvULWIKqoQbrF47wWrn3WdAEDgVa8ls4t3
	O54hy5mfR5fC96Xz/v8ww5sCx5oRYTLgRKr9d1WFD4zUHXx66pjyQrMv
X-Gm-Gg: AYBFou3H2WjpOfY6I6IcpxUqoVXLN8dcvCPeOUKSoltpCHdmfd4PUMZx7WAcvuViM5d
	BxnH6GV4YnB9moxLhuxnUWy1kZnAkQxM+rjFQG7/pxduv7ZsE0iHXDx9fLlLl/rKg3qiYa5Lo7y
	BfLar7f4cpl0uVel8pYjUz/F4t0/r2y1cW6LHCg127dbdyWf0T92iwn3Fsp4kFULhzhT4p7a96N
	jYjDHIeix60xK1OgUvDxwIY1z3zfuCZ24Umf9TjK7cIXHjudc9NCGyqSSUOKc6A1Nk/mMOfb031
	Sy6a+gvIODjarrIvHJ1mvaMunN0FAro9q0qr9s0n6Y3EAvDJfQ+YiwJqBUggBa0IEWoyWo4P454
	F2KYtLNMfQLPVQwGo5Adwu93EJNWiq36lFanXS+3tvGs9nmFLEg28i/I3QHzBKp+O7u+r+nKLF0
	2VnOJYJfqxdlbuxhEyhw8VX9VV91Erz3h/D5IjFa/HF/EGZfJNfsnqrdPrWFHF+uBn9k53Y+MGM
	RBU0C3Tosccvr+ot1TmgtH3DruqsQ96jBuGJIyCNGak3RlIa8Aerlc9ZVxQiAiZ1jy9f/5fQmuc
	JO6KdNiQP+2YWmHS+xq8qxfU00Rv
X-Received: by 2002:a05:600c:3554:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4ac18c7461emr88275265e9.35.1793399832545;
        Fri, 30 Oct 2026 15:37:12 -0700 (PDT)
Received: from m2.. ([37.142.145.227])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm5457300f8f.45.2026.10.30.15.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:37:12 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v2 07/15] HID: ft260: uart: enable flow control
Date: Sat, 31 Oct 2026 00:36:29 +0200
Message-ID: <20261030223637.86907-8-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030223637.86907-1-michael.zaidman@gmail.com>
References: <20261030223637.86907-1-michael.zaidman@gmail.com>
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

The FT260 is a full-speed USB device. Interrupt transfers poll at 1 ms
with a 64-byte max packet size, so the theoretical UART payload ceiling
is about 60 kB/s (~600 kbaud in 8N1). The chip advertises baud rates
above 1M and small transfers can work there, but large transfers are not
reliable above 460800 baud without flow control.

Stop forcing FT260_UART_CFG_FLOW_CTRL_NONE after termios setup. Honor
CRTSCTS (RTS/CTS) and IXON/IXOFF (XON/XOFF) when configuring the UART.

Tested at 1500000 baud both directions against an FT2232H with XON/XOFF
and with RTS/CTS (~2.9 MB transfers, no data corruption).

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 6f8d72938702..4b0b55c98f90 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -1897,8 +1897,12 @@ static int ft260_uart_change_speed(struct ft260_device *port,
 
 	if (termios->c_cflag & CRTSCTS)
 		req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_RTS_CTS;
+	else if (termios->c_iflag & (IXON | IXOFF))
+		req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_XON_XOFF;
 	else
-		req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_OFF;
+		req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_NONE;
+
+	req.breaking = FT260_UART_CFG_BREAKING_NO;
 
 	ft260_dbg("configured termios: flow control: %d, baudrate: %d, ",
 		  req.flow_ctrl, baud);
@@ -1906,9 +1910,6 @@ static int ft260_uart_change_speed(struct ft260_device *port,
 		  req.data_bit, req.parity,
 		  req.stop_bit, req.breaking);
 
-	req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_NONE;
-	req.breaking = FT260_UART_CFG_BREAKING_NO;
-
 	mutex_lock(&port->lock);
 
 	ret = ft260_hid_feature_report_set(hdev, (u8 *)&req, sizeof(req));
-- 
2.43.0

