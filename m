Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913392;
	b=knDppXAI+75pqvzo8Jh2+G1dwkksWpc+aKQJWmktTjG9CyuEuT3umCWSAlFcB3ZtbUKg
	 DltlEloSdu30+Rgzyazs9ujE/x2+YdQ8CaZBR74f178yywj+X30zABz0OUVZLM3FknBcE
	 P0MQCwSPXY0PqWxKWcKz/hgfY1DuDwcsarD3DT9AEVpwwRjtas7xQa8iYB7oYwSX8MuYW
	 zL5gjcOJK6eZ+BkBD9ycpvvZAih0ZPuWqlX6usArhnA3KBpMpIpmZwKqGy2w0n5ciufb1
	 FhpRYXo4Ky7cznefhq1Qi9qwTdmqOAAphQ8uGNiqlS2Rfwm67myoOMLdssNePoO/xhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xRj+1WgN1BrmQW8Cu7h3hEln/8iUG3pzDfaG3KwvBw4=;
	b=FcX8lii9glSHhxyb1ex2CBqH0TkEk7Cm8RAsOcAFxmCbn5wQmeBOUOwYNygI+tMKQKDf
	 0s3cX/wiqaJtlojL4x/s2LGvL2rmtxo7iizupI8hFVFO/bNro60P7kx2WOk4HMQ1sYC7o
	 QUeYpyDYLILo6aXTliC85qjh7rGDi/rzM7F02f6H1fQ7oFbV+16DE1zf+di88V98JE2cQ
	 N7oJbjIBTXvQexCV5oaszwFAtrnqrP3u7A/yW1qQQgrZhVsY3oKcFMM+WZT7oP3HsFUtw
	 Tf74yBEZVZpNSKQuKokuf0MadYTMZkgXPA/CK7McSlaTpR5snbSPFMpi5UMh3fQJvaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+UsAmZG;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35AA606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D35AA606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+UsAmZG
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so27705825e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793913390; x=1794518190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xRj+1WgN1BrmQW8Cu7h3hEln/8iUG3pzDfaG3KwvBw4=;
        b=I+UsAmZGmbl+fJKyfhrjvbUQBr+vmNGkYXN3MA9J+7vqCnUOTn4liWlg7hvRpAAgsH
         y6YitFWx9cfFARQzlbDFXco2Jk/g8SrZ57Zro8m83yT65BYaQW5QTE8/EsawolbKZq+h
         ahWyPZ5BtdZyK2a0H2aFiACQKXOChfpuV0N+M32dfOcHmOt9KrOgHM8SL5t2KG8uZuVL
         aeLjYiqlYl/fkpBqZGuI4TdKlgTlrDs8kuvahyZVurywY710MpNuTQ6VKuttnmUHaro7
         H7xStlaPX6R2ZZ7VAkKznSwQj4U/Oeq7JnbtrY3nboOhZ0viwX8HwQ1hWnDClj5WYKUx
         oIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913390; x=1794518190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRj+1WgN1BrmQW8Cu7h3hEln/8iUG3pzDfaG3KwvBw4=;
        b=fzei+Kmg06AaKLUFwmmL54vKmrrankAipfUvjDyj0D18id+96fJ/3F04+Ljp7/IL/z
         ONeu1wuPoSvmJUIokjLEswKZhxYHuJY3logYdEMnkIgoRYdvuOuoQagrbYlMmQ6DMo7Q
         4kCWW8dyUQeeQ05q52et7iJ2j8XQ3+l5j2Z7wPr7Ixw465mJhbveax5M1u4w5J6DbyfE
         r8+pQl2Y4Ox4CJPGUk+B8/w1c1bgxxoI8WXqyC50NmHXLV+rnRjfRapeSIwtWTCw+1lG
         2vBLvDETrPvwegnGXWfRkpAmDrGu1tM0QMsXVw19E/H2i1Pg8zy8i2eXqXegp0tXRyMQ
         n5Sg==
X-Forwarded-Encrypted: i=1; AKwUvByAcTKYuGMCUzvpTD7+fNDagSFaK9RxwwEh1m9zR0y92hhk8MyxPTc4mN9JDzxAY6b9nVn/Y14o4BTW8F4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fnd+XN4BrSx7eJGvJyn7MBEByfrF2+v5XAP+sVpMdjdga+Lg2
	8EdPKEHxk9/43aYwrGtguJXh8rx5SFUuXLooq8FhboB9qYWEryzpR9B0
X-Gm-Gg: AYBFou0E3OgJhxwixJNaUuqO2tJodQI6XqZytlvygBS06GndBpZ9I3uoWiJd/tAHGvB
	fIyv1OSU2NWDT6Y1pDDuZU+2vGN1chQ/Yty9A8XFVnrhNlS764W8BryDU0ofgt4Gn40Zzb36iZ7
	pvAbIyas4lJFYVQRby26EulOTWSg+KMymH26G8Dur1xhVF2gY3aWhec1khPVMNzxvfQ8HfDs89M
	9bFmHjmhhht2fOn7XhAz/F6rTNp/cSUd89ckb7tXnNT2C2N37a/IMlfoiRnodYE01nOOR3BDBXZ
	jsJEuKIwmhzkrRD10C3xF+aGs7RekIt/ffuGS/a4aVq8eJsa2+fo7fUnOQjjgBt3yHSeH2OE5eT
	xD5kNf4bEYvY3ywfl0TQl2kXQBsAwq7vjNC+PdFJ+Cu/rMfAnk/gnMSnc3/l5OzWZBU/IWoxLEd
	mclmJPLC0aQYHEMJZozgADIMc4QVwke5P+UgycFqviJiPXRLFdJ3UP4BzdA6pp0YMTxGraC197l
	KoVxHiHqxAwcCLDj+MQyxFkp73M6cqKltsYXy/FsYY+AjA/q338YOy5o88UADCO7uiI237Z6R7N
	lxIOTDrVoHEmwNJMiZf87RpNhMAHwFq99+c2n4DUsAy+xZSGhfu0IniEwNfJKswiPCfFewtbTzM
	=
X-Received: by 2002:a05:600c:8b05:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4b6e0172847mr5899255e9.32.1793913389982;
        Thu, 05 Nov 2026 13:16:29 -0800 (PST)
Received: from localhost.localdomain ([87.13.215.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fedc09675sm11703458f8f.55.2026.11.05.13.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:16:29 -0800 (PST)
From: Francesco Giandinoto <testata.nucleare13@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Francesco Giandinoto <testata.nucleare13@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org (open list:STAGING - SILICON MOTION SM750 FRAME BUFFER DRIVER),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: sm750fb: make g_fbmode constant array
Date: Thu,  5 Nov 2026 22:13:16 +0100
Message-ID: <20261105211344.17532-1-testata.nucleare13@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The g_fbmode variable is used as an array of constant string pointers. Add the missing const qualifier to clean up the source code and adhere to kernel coding standards

Signed-off-by: Francesco Giandinoto <testata.nucleare13@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 21e310274..47d2917cc 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -12,7 +12,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char * const g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.56.0

