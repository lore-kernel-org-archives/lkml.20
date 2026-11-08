Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794158817;
	b=SPjk2v9ngLmjBrge0Os8b3dxgns64zik6bftI6jCKit64r7EZnGUFIGUy0SOdMZovSA+
	 J6kKkXq29s8TGFyxVhOyYclcGUrC6ziBCI1g9sxseoSjDhU42i2tBTI73kcwLfgskVao4
	 X8sjioKvgrubMr6ojS44OdljwzPUsI+hiFJHZgwtkMenyzWmOp3b5DgMOQkSEe0aZ3gN6
	 S8/JCv8qZhUfWNwASoGzJlJc/mQ7JWhIQ8cpyXg8nEpCGEC6mcRRYnMgQENE7iIlPmySl
	 19MY/aJWLBd9qeafaUuj9oguiA2leK1QAG2ZcBd7h/ww8TrK1YY2XTjKIiPTWZTzlmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794158817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CbdDB+kP/MHD2Y+SM/e0nRF0wnRfuFbFe0PB8gpPvIs=;
	b=ju3cyPEwKzkk6AH0ZLQMPEWKbc+gKvlYv0K2fpuNQDGOxJkNfA35R9ppG0awia/l0VOZ
	 MhR21k//3BSN/d4xp8FCNc/4k3veVfBlz92+WU7l9yxQBjd4PcWPjaG8bMCQcQbSBd7gt
	 /O+QlPXiNR9sypmi2gVnw+ukfeQU5v51GDDeQvj+/p1XkUV1neSr1Fxh1U5Y3UwgIA4js
	 A/MkUZdmMhqOFtV1CeSk+hFcw/+oysU2wJzaH3IMPQJa4jaQsPBaRd+mEBASVwX7TJz1v
	 p3u+WNX4fBF4EJNZAx9PNr1zkXSs3C4Z/E/uF4AdR7M0UTRI6LoGxZH9xhip1Hc55oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yzm+MjtH;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B184606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 17:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B184606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yzm+MjtH
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c126fa1e3aso77421e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 09:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794158815; x=1794763615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CbdDB+kP/MHD2Y+SM/e0nRF0wnRfuFbFe0PB8gpPvIs=;
        b=Yzm+MjtHoqQiYFCsrsPT6q1xSu86CObzvUCbrJXamBuvYNMoqEeQ8DaZMqeF4no+r+
         yLlsJNsRzyVBdZrDHlei4OmrPhRCccrWouSyMJg0V10LHhnEeR1rmI/CwbAek9j3sH9Q
         GInmRmftGwzoFJugziXeoaS5EZSARLw7b5//QcaSTMKov+vux5gBzwI8vC0yRuIhxCfu
         sOmxwGLv3kZh7x0+bGdzjGTeqeuWTK0cDM2Grb5SNEYdDZAJEzZbqMaVnrq8ko2ZBYE/
         aMi0a12Ptej6LErfKv/YBcL0azS0Wt5TfOzuX3j+lNtT8wrFIDGFros6gVmx+9pmJhhF
         06uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794158815; x=1794763615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbdDB+kP/MHD2Y+SM/e0nRF0wnRfuFbFe0PB8gpPvIs=;
        b=snhD7d6KeAaq/BGwN4LWlzSDN/Q2E2vq7HodoWmdTr9EGynE4J+l7d2jSCGX0t4Z9T
         61i0xdnt/GAJ7NqRwm+Rq8X8kLl3Lpnb237e34uedk7RwH3XrYnIPTQ26qdJ4tCg3MM3
         0+/ZZr6A6Wxh3bMQQHgz6SjFrKkT8hCjLYifLtscV104rq9HXaA8JMwVqP9+QSlTDFSn
         ZGJsl8uMT4cq5cSlqu92gGdOGQDUui1QvPkUCbimWsXAVg3lFvdqV8kNksdxkuYYpjL+
         ziwg2YnjJdidLFVWJQ4l0vIta4hAYBSYlvuovgzkCnXOoNvXEEjIgAQ44odTccpaJrwo
         fBcg==
X-Forwarded-Encrypted: i=1; AL+hErH3NT+cFdmmjvBbjZU8471x5mnhi0AmhHTFwL4LQHMaDFix5K3PXRThlulLmXkdRcb3MeK2jjsd+0dnImU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QoNJBlyeA5yoArw6bKF72DxLhNpfdMeYGO78UWjdSews94smM
	SNnd9ME30AyJJVPD4b6462hiTTmoELussfWDlfDk1WpgXkLBQyJnYeVu
X-Gm-Gg: AYBFou2IsqcGILTm2j+cpTtHMet31BNf/gCKGmxAMsR/z4UfTSJB4Wy0eQ2d1Iqwrmj
	0Vv+Tqu+MeDcsn5y+87HI2B271PEH+xiUZ+f4usc7LevJmv258KxSzlAtlnygM2DrlKGv9UfOXi
	D9bBeFJOj3iDYM2KJwfwD3VqRjwew43rwhat5KUJGFa+bZOd3oQtjJ7wp2+OT77GDEOnfYVE2zr
	UqhFRDoL+B4ccY0/bKnwNn1IAuQMlxGOTWBv7SFFEWfJqDCr6M48jiUwzRHU/yTKWLtqhypVYVi
	DCunZuPaagOpzLsEBHLTiK6yeMzwo9clz61BsePnNTbg4bKwioGnWtsr9aYSh28dn+SQuFqAWvK
	sonIHtionLtyBKoE/6+dRH50glDdFSOHs/csAi1vXLs1A2okdBBlRAZtiICWrpMbqTc1kkneFFE
	wdfIx0F0slEKzdLjLQvCxZSapZ6SztCFQAA8En8AjUK4MOGMsPPLpUDn1GF78ZjCxRjdsbB2Wua
	rk2H+CdIBNU4Qbb6UDvD2DQpNBPGRv9pxJgM9S9pgV4TiY4szhILbUuIK8FhVuRDcwntJzKmAn3
	9+0Zzio3sWj4Hk6yQA8eHnS7S0f93zSFLdp9rP3gXPr01hXY1njiiyEsSDdhqAmYlmv8a55F79Q
	Xz3Etagjpu4vO9oJPCaJ62jnZVAbbAtizSk4wsdM=
X-Received: by 2002:a05:6512:3ca6:b0:5c1:4a79:b9c3 with SMTP id 2adb3069b0e04-5c14bfe48b9mr460728e87.23.1794158814973;
        Sun, 08 Nov 2026 09:26:54 -0800 (PST)
Received: from yantra.. (nekmmqsilaajbsz5p5z-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:1eea:2a90:84e5:71a7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b7fc37csm428983e87.29.2026.11.08.09.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 09:26:54 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	"Johannes Cornelis Draaijer (datdenkikniet)" <jcdra1@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH] hwmon: (aht10) Fix update_interval overflow on 64-bit
Date: Sun,  8 Nov 2026 19:26:51 +0200
Message-ID: <20261108172651.220121-1-zoone.rupert@gmail.com>
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

On 64-bit, update_interval writes are clamped to LONG_MAX ms, but
ms_to_ktime() overflows above 9223372036854 ms and the interval wraps.
LONG_MAX becomes -1 ms, so every read starts a new measurement and
update_interval reads back -1.

Clamp to INT_MAX like sht4x, so the limit is the same on all platforms.

Fixes: 8c78f0dee437 ("hwmon: Add AHT10 Temperature and Humidity Sensor Driver")
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Tested on x86_64 in QEMU with an emulated AHT20.

 drivers/hwmon/aht10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
index 6c263cb57766..c9ee50883f5d 100644
--- a/drivers/hwmon/aht10.c
+++ b/drivers/hwmon/aht10.c
@@ -222,7 +222,7 @@ static int aht10_read_values(struct aht10_data *data)
 static ssize_t aht10_interval_write(struct aht10_data *data,
 				    long val)
 {
-	data->min_poll_interval = ms_to_ktime(clamp_val(val, 2000, LONG_MAX));
+	data->min_poll_interval = ms_to_ktime(clamp_val(val, 2000, INT_MAX));
 	return 0;
 }
 

base-commit: f4e680ffc2e50867c5b590e26a37f8801a31e486
-- 
2.43.0

