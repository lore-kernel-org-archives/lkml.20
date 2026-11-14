Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650548;
	b=zBMGrZyy6309FF97wcjfvGwRhVr32GRrwt2upptJJ1BKXb7ln+unf3e3tZx/nF7nCeQf
	 OgdNpc3h/ikTmfU9ihMfcOIfQP1I+KnDiYxTo7b7iqywVS49+SkrDqZgLSnJQXqYoLuIg
	 eX0pRB6rYPLD+Y8umPQ2Wpw8mO2Fl958ok+i9N8MxiiJsqKv68oFJhz2OChEY2/GhOEIL
	 FrUPg8vGpvg7HcKbCCo8YL9wTX7/mBSfL/YVFCma9MoHoAosRegCYdWFrMLOuCqRFk4QU
	 tPgmQDgukxRe8FBlPHs0IzG8jd23es+vLescXqk8oxkkZ2dmKHQ3FrCNk7xFS7irEHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fcsL6m/fL6wR5N1Uy9uUPHQ01kHmtdk2koYY4a/ebJg=;
	b=3voe+hZIuGZz8l9GFjHz7kkrIO1xRiy6xFHR3XO3fQ7Y57w2QdFiH0DnloPH8MiGjUxr
	 EfShYd76feA9dGBsqgR4bHl45mwlDKujLyi0voGsA35Kwpg4vv6Q4disNEJSvk89J64t2
	 5wD85YJrc21AUCCBtJojjuvqYX4kpTU8qdgU95KZFIPO7oXmbv4bsWsGYg7uEum+rJVCp
	 HbH0wn+mxUfWcy82v7+phGzRTNXideVLemolV1IneES8sn9UjH3bozvL/yu+zKNteaAOV
	 dq6EOyJv++UAWuBrWxMFYonT6l5IkKzA2nMnSycqh9sjAjiHap+u8cet18CsQE8lgmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hcnM1uH/";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DB0606A894
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0DB0606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hcnM1uH/
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e47347279so701670f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794650546; x=1795255346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fcsL6m/fL6wR5N1Uy9uUPHQ01kHmtdk2koYY4a/ebJg=;
        b=hcnM1uH/JOdRNdBD3zWRDS4dvhdMJbui9acV8z96oiZw+LB0SBPGf/JQg6wlVwTvQW
         4WPmL1OqCHep94fEp4HD3VDowqvNn0x+D6KNbtJhkpf43gQ++KJGx213zxovxXSpUf+K
         +c13zd8GE39FfrjEny5bGBbiYopQEpxh4+vfMFmrF/baOaPJDgZBuXNEq68KzNvutXzM
         YLrlSbhubbFsWd4aPaUSI9iorB8vmnsEg97/Wi6SHZh+3OaQdDtodpNi9XH2dGZe/kPE
         5GCC/oxTwUhQ5DEdFRmGe+uUvHXP98z7Gh7eaFk1zb8Ghw9drbXMY+QgQSLNtTrtuW77
         NlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650546; x=1795255346;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcsL6m/fL6wR5N1Uy9uUPHQ01kHmtdk2koYY4a/ebJg=;
        b=TFi+yWRKlWq8j3gDaQGA9drTVxmsSxynPuVjbskqQpkmcUM3dGtpm+2vy4xRmkMJIz
         pXTMVeu6VOJB4cFZkui7Qpl/Q6DZrYgAR53os9YBw3beOpojMA71GaGIwuDSlLzXjAdz
         HTDtl0YfDxdqMiFCRM6EA8RUe7lLY2oC61enGAxAy09Ot6i5XQZBB4xrko2S2yx4syWh
         SZ6TAPBOxghRHmQRDkfGgQYUSPcIVX0TZgS/dCkqHORk87vGbxuTAljSELVmbLHFHMzY
         YunD5wWqxe1EssVrZo5tTh6WvVwDgFhNFAkiJVIiJ0vgk43yNzkq13MxonngD53or7ch
         wlOQ==
X-Forwarded-Encrypted: i=1; AL+hErH+W3wRCiIHUHO3vcs7LE6lzZ5mzt/rVIukcy/yyBUEEYYsxVYvwf+HduOpd+Avnw1uUXLpJDy0heex21U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WKhR3/RTeG3w3OTD4B0xj6aVC+/I4zUPmWGsv0MD5jK789hQK
	lPzGU8KZpQdMLU8HtW6f4uajsdcNb0XKbi0pEzqbiXBEDGAUbcDXqMTb
X-Gm-Gg: AYBFou3n6UrHoXSIZ1XM81La2cpLgNbTKxAJyPHZmNpe+DmEKebRiaN9n0S8zOi5/Wj
	PBk6M6UGOwrRseoCTrECpCfXa5AFGJuoWr7GUKfOtfndVRxWgvaO45jJAPPnnvJ5Kd3W4B+aKqy
	R9Wl1la05cIfnFfOzfepqSIscxQ7JwBziIbdzXNU4iZ5hQx0slfju4e33szE47saQHaMRZJeBcU
	B9U39HyP765wycZolPHBhTDreZfvTv6yniBLmkYkOjtFVUe/dZskUOT6rPM+Ob6b2rspms83EDP
	DrLvaFs4qAm5rSJs4BOLnw6JLNqAE5WgfTwYsyIbXwBkST135jwdoaDxQVlsyShC4t1lUKaU6J7
	1zXYUvGCyXC8a0pXFWL6DSUNNbWONwYghWBbKl23Mqy+9BGdWv44g9Wdvnw9ZV5Pgc5Z4MDK9Zj
	j8LpVFerVZDTa8E0Cs68pN8/lHJK31B/dPRhfcBt9SLBrihEPaxSajwGGL4F3WwxglFaCvc3nAu
	f1P3CpGCoOg5i9pWn4LmiSaT50LsQ6UwrkMybATXvoSWZVKQZtOCe5+TPl8VAeuMn9nKJ3vokh6
	DO3DElNtr/rIGB6r2EIsQiWS3K/AClbjJg==
X-Received: by 2002:a05:6000:250b:b0:48e:5e20:1371 with SMTP id ffacd0b85a97d-49c6dc01593mr9674006f8f.4.1794650546159;
        Sat, 14 Nov 2026 02:02:26 -0800 (PST)
Received: from DESKTOP-TMG47OE ([176.41.25.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608cf46dsm10520184f8f.43.2026.11.14.02.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:02:25 -0800 (PST)
From: =?UTF-8?q?Ali=20K=C3=B6se?= <shroot1337@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	rppt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: sm750fb: Remove empty software I2C acknowledgement helper
Date: Sat, 14 Nov 2026 13:02:07 +0300
Message-ID: <20261114100207.9124-4-shroot1337@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114100207.9124-1-shroot1337@gmail.com>
References: <20261114100207.9124-1-shroot1337@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sw_i2c_ack() contains only a return statement, so calling it has
no effect. Remove the empty helper and the ack parameter from
sw_i2c_read_byte(), along with the parameter documentation.

Update the only caller to use the parameterless helper. The GPIO
operations and existing I2C bus behavior remain unchanged.

Signed-off-by: Ali Köse <shroot1337@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index e63f3b00ec4c..54ce355e535f 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -201,14 +201,6 @@ static unsigned char sw_i2c_read_sda(void)
 		return 0;
 }
 
-/*
- *  This function sends ACK signal
- */
-static void sw_i2c_ack(void)
-{
-	return;  /* Single byte read is ok without it. */
-}
-
 /*
  *  This function sends the start command to the slave device
  */
@@ -300,14 +292,10 @@ static long sw_i2c_write_byte(unsigned char data)
 /*
  *  This function reads one byte from the slave device
  *
- *  Parameters:
- *      ack    - Flag to indicate either to send the acknowledge
- *            message to the slave device or not
- *
  *  Return Value:
  *      One byte data read from the Slave device
  */
-static unsigned char sw_i2c_read_byte(unsigned char ack)
+static unsigned char sw_i2c_read_byte(void)
 {
 	int i;
 	unsigned char data = 0;
@@ -326,9 +314,6 @@ static unsigned char sw_i2c_read_byte(unsigned char ack)
 		data |= (sw_i2c_read_sda() << i);
 	}
 
-	if (ack)
-		sw_i2c_ack();
-
 	/* Set the SCL Low and SDA High */
 	sw_i2c_scl(0);
 	sw_i2c_sda(1);
@@ -458,7 +443,7 @@ unsigned char sm750_sw_i2c_read_reg(unsigned char addr, unsigned char reg)
 	/* Get the bus again and get the data from the device read address */
 	sw_i2c_start();
 	sw_i2c_write_byte(addr + 1);
-	data = sw_i2c_read_byte(1);
+	data = sw_i2c_read_byte();
 
 	/* Stop swI2C and release the bus */
 	sw_i2c_stop();
-- 
2.53.0

