Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779696;
	b=u3rhCSfTQnXQsLO/7yMLb+0EjHzK3dhMg7MZdgKtwAUlM/7hev5dcnks2TGlU5P4qgFn
	 VhYzju52FTas0tnBF7TRe0RmgJm+xNYGzM80ahzg1AUqYb8N0RxKqvDl+eDVTtuK70fz1
	 MEQypgqOfuhDspXBp1u/dAiT5/mxfE1YNgl6DgSewmfTRcx24ggmkEi8jRV4lSaemLoB8
	 h6Hr3xxfy/ogf9jlXJCu4REqQt5PGpTKAUbRrlaMdVyAvTZ0OEVberTxCvCtwpngktaSw
	 dM9Qp084RS7ISM7vHowE9w1P089/Dx7E2lwMPE2O683u95UbBubEuZ2+QQ7Rf5Q1zaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ll+dYl6IjHGgVeB0nKnh3CO9OrbX/VIAlSchVwuRn28=;
	b=vG3PPTCBAnMSvv8YYe7zZ8pu23Tgre1GR7eei2nCMWG9PtoGFWyMUktNaPEnozcQ8QRa
	 DFecrS5Ct87q4ga0u90rkR+33Mkv/YpRvKvxnSe7Dk+NH6a6qdaNwEC0rKVuUHgnGphfO
	 aEtfPhxXM1uhdRtMHefo9GNegnPqf83jqLy5dfgcxlUkjJL9aD0yMleLNMjN+p3akFHlG
	 ZMfyiYuC7qwIRiMtlkC0/Hddukj4fSVmnk3YdW13yQnf9GPEhicCV7caJJ9JcwU/imCMh
	 rIdzzt9TgVkMcqS4w3zfpvFNsOibifvEHQbmvBpMmzHwdSgHpruwVwSFQVXCQFHUxoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLp8UpIh;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB0D606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCB0D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLp8UpIh
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so15345765e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794779694; x=1795384494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ll+dYl6IjHGgVeB0nKnh3CO9OrbX/VIAlSchVwuRn28=;
        b=lLp8UpIhczoGU99bKCQ/deeLU4T5+QOEljlbDSClUD4xBGymN7xpLVok+gvT6WgU8C
         S8Fw4KQGzqMKgthHIsCpKE26cWMhffe39FAnlPT33fg3S39lY7CqSNnyl8ycwYOGHGKS
         3NS4AIbQH1EgHzck90Rhy0TU+CEFMgteHQJd+0Pf6dLpAVXClgJZttXPb4DpunMGTki/
         szqDnwDynTAg5IBAm+x3HWSYO4nEZCDDgWSwwg/M8DYlaW4CCKJiWh+MoKUPkJpROG2y
         wcApysLZuT0rDb9oTgoeto1IuaGXMOyiUidNFhnx3AHAkc8a0SVsbiyUMpfDAkHuSxg4
         Fdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794779694; x=1795384494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ll+dYl6IjHGgVeB0nKnh3CO9OrbX/VIAlSchVwuRn28=;
        b=B4bqJTaTFyFxKVITsD47XrZjfyJEiauhykwvOkAILBXSh/H9unMeH+s9gy31vY2e4l
         kZu7GVmaDc69FYnoFgd/Izy+LWi2wyWiss1kwfs8B9wDZfJMW8GK/E+lEt6WsLrQn4gr
         S7VAJq2SsSc2AIhxVMRVgvlTECWhrezvUY5JNbzyy4nouHoT9kxwOu3H1aGcZgEYniAL
         YO7Fhd2WWO1Ehw8LEPQFJi7TSLHZNC0beVNIUV/stz7W619qws9Fx3cVBK0JNFgKXcAb
         n73vL5aGwY+tuSGNWtS3eMPU4VH7v8w7C/l5rHNdM2H42+9v0ih9LQcjC4xlmngdXjGb
         VnkA==
X-Forwarded-Encrypted: i=1; AL+hErHiqmeyxhzzZUgL2uqmHV31xWUBwZ06ugUeiYBsXLkWrJdpP3ezVXVkKgti+MqJgn0ToRGZsJwCIVAw68Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iLcDzoB6M3smdO/lXXKVwHeLbu+upQuK2uTHf83gj2ctmcL/A
	Oyxhys5cjj41W2vay03IOTzUnpyb0NXATP8zoRM6Bd3MakzhoM9DBrHA
X-Gm-Gg: AYBFou106GvHuh/efHKvKFEG7W1Lj4Y/yWRDxMhqEV6Uv5IlIsUyGmm1CIh58uxkobK
	PiW4lIuk8PO9097W2A5O7sq/3GX6R3W0NeEHxzXmjj0gcKsnPN5iKnqGNkL2+1/bpXUbGutHEoa
	e5Kqy5WU6S0BTt5LEpoodzfatbdf7uKefHTWQOUIdEJBAp26gsoNsrtTfZipDMesUI7u2HcbdpU
	IH3tvPWE8O5Sntwua+cMLR65Feyo9hzbXBKlWKBKkFh0nMwrYZvdW3FogOYNPGRM8jPQg+PBXW8
	q1nKr5SJzRkINMeJD1oq2q7UipC+Wx+gMKHGvvOnlQx5SYkI8xzTOPuQBHMYBo9jD5tSVeGpBJK
	4D8hK1ak/yKwrZj+qG+N6gBJXYoNyECLXX1xtJavW37w5+G23UTj75ur0SGgFCj/ZVA0BNUQ3HD
	WUA28fIubilnaj0C0PehNZ6wkbU+lZWce0R0QzUXzojrsBiLafwutuXieF03jT7tlBS9C0NR+ft
	qumN+72tYBmRQGOSe/aHPOj0+9pLtHqKYH5Kb18zKeEluTkDi9eTFYZrPHGQ2LONaKyVKtU4icz
	ZW9pwV6fnDVtsdRCr3gd86u1h/s1zdP+6fYOf8DfkDQGQc4PaPvMOIHIswCyxNXFEzZfTO725iC
	AAZwJ0kAzw5Gd1OBIr9yEB4cdN7nAhK7m9lqoGaKrPiop+cByXUHkSJiSBK3WTvenK8JsMIm4wQ
	bD
X-Received: by 2002:a05:600c:5617:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4bb55a71035mr134809435e9.29.1794779694189;
        Sun, 15 Nov 2026 13:54:54 -0800 (PST)
Received: from leon-mainpc.tail82c8c6.ts.net (77.119.194.237.wireless.dyn.drei.com. [77.119.194.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d673ce75fsm12553145f8f.55.2026.11.15.13.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:54:53 -0800 (PST)
From: Leon Pelzmann <brunonick1801@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Leon Pelzmann <brunonick1801@gmail.com>
Subject: [PATCH] staging: sm750fb: remove ineffective sw_i2c_wait() busy loop
Date: Sun, 15 Nov 2026 22:54:27 +0100
Message-ID: <20261115215427.112315-1-brunonick1801@gmail.com>
X-Mailer: git-send-email 2.56.1
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

sw_i2c_wait() is meant to insert a delay between the bit-banged I2C
operations, but it only consists of a loop that computes a value into
a local variable which is never read. The loop has no side effects, so
the compiler removes it entirely and the function compiles to nothing.
With W=1 this also triggers:

  ddk750_swi2c.c:95:16: error: variable 'tmp' set but not used
  [-Werror=unused-but-set-variable=]

Remove the function and all of its call sites. The I2C timing is not
changed by this: the object code of ddk750_swi2c.o (x86_64, gcc,
allmodconfig) is identical before and after this change.

The W=1 warning was found by building the driver, and the change was
prepared with the help of an AI coding assistant (Claude); it was
verified by comparing the objdump output before and after the change.

Signed-off-by: Leon Pelzmann <brunonick1801@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 34 --------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index e63f3b00ec..e298bf3128 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -75,31 +75,6 @@ static unsigned long sw_i2c_data_gpio_mux_reg = GPIO_MUX;
 static unsigned long sw_i2c_data_gpio_data_reg = GPIO_DATA;
 static unsigned long sw_i2c_data_gpio_data_dir_reg = GPIO_DATA_DIRECTION;
 
-/*
- *  This function puts a delay between command
- */
-static void sw_i2c_wait(void)
-{
-	/* find a bug:
-	 * peekIO method works well before suspend/resume
-	 * but after suspend, peekIO(0x3ce,0x61) & 0x10
-	 * always be non-zero,which makes the while loop
-	 * never finish.
-	 * use non-ultimate for loop below is safe
-	 */
-
-    /* Change wait algorithm to use PCI bus clock,
-     * it's more reliable than counter loop ..
-     * write 0x61 to 0x3ce and read from 0x3cf
-     */
-	int i, tmp;
-
-	for (i = 0; i < 600; i++) {
-		tmp = i;
-		tmp += i;
-	}
-}
-
 /*
  *  This function set/reset the SCL GPIO pin
  *
@@ -257,11 +232,8 @@ static long sw_i2c_write_byte(unsigned char data)
 		else
 			sw_i2c_sda(0);
 
-		sw_i2c_wait();
-
 		/* Toggle clk line to one */
 		sw_i2c_scl(1);
-		sw_i2c_wait();
 
 		/* Shift byte to be sent */
 		value = value << 1;
@@ -272,9 +244,7 @@ static long sw_i2c_write_byte(unsigned char data)
 	sw_i2c_sda(1);
 
 	/* Set the SCL High for ack */
-	sw_i2c_wait();
 	sw_i2c_scl(1);
-	sw_i2c_wait();
 
 	/* Read SDA, until SDA==0 */
 	for (i = 0; i < 0xff; i++) {
@@ -282,9 +252,7 @@ static long sw_i2c_write_byte(unsigned char data)
 			break;
 
 		sw_i2c_scl(0);
-		sw_i2c_wait();
 		sw_i2c_scl(1);
-		sw_i2c_wait();
 	}
 
 	/* Set the SCL Low and SDA High */
@@ -316,11 +284,9 @@ static unsigned char sw_i2c_read_byte(unsigned char ack)
 		/* Set the SCL to Low and SDA to High (Input) */
 		sw_i2c_scl(0);
 		sw_i2c_sda(1);
-		sw_i2c_wait();
 
 		/* Set the SCL High */
 		sw_i2c_scl(1);
-		sw_i2c_wait();
 
 		/* Read data bits from SDA */
 		data |= (sw_i2c_read_sda() << i);
-- 
2.56.0

