Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763649;
	b=dGLvhgneEsN3J6+4ZhJ/kf1qzhwegrkZiPkAOZ9ParhZH7W0ktajXyihnLxLEusHL8BZ
	 g07JHoH5tKe9dNqbNI6UdcBQlkEr8CbknmqT7xen6x+zCzEJkuRbZ4nUbkNZD/2Nx8CGt
	 bpIMK8mfWF0VGoN43J7VRgjK9s/iw4+YdyA2gEMTJYvKUUbYRMQhitsIn5gKV18rfyFRd
	 /YG4n3HERbDoZNUOclt8pysUzrIAgYZBVrfnDx7F55antbq1z7qHkoBzHYtQgcZbBIe+f
	 5SxSMZpp4YgrIBx/ppsoyP08zdmhXpSTr5/plc9XwgNCcbxpdpW6uJlKKF8+wxBDjUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tiQ6Fa/Vn2QTQoifHh6BKk70IvD8frJIBqHoc+DS4Nw=;
	b=FFcS0EBIi7F2WMpkgPyXgMxjVZhCgoMju6L9tIDTOjggDLzUWUMAMfA8NXU0u4SXTAsm
	 Zqr2D6nAxttjSrubqYuPDlqIuEJkPjNMUdst3RDyYVAP4HlFgzp9oETbIo3KjzAcvnL8g
	 LBjIjAeGayZNcQENnRE4QNkaTKYivhgRGTFwbvjZ8Gm8EaQIiRAvgTnEkHSNgotnZqhtJ
	 GJTnsR8T2mt4lmyLTEclgJeQYKAcLxryCQcpknNlE/JmH9ODQJa2A5VLphlUSdneSwPd7
	 SW8IOwB9UPpFdGh6G8o2F/jz74w+1k6nHOwMpq3OFHAC1gVIwpP4nsUXDeVNgeRcpBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iavYT29u;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F0E606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9F0E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iavYT29u
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2761c69fbso768147c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763648; x=1794368448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tiQ6Fa/Vn2QTQoifHh6BKk70IvD8frJIBqHoc+DS4Nw=;
        b=iavYT29uzsoPP0/Qa5Ukk8Xty01Iq4dM0YF4RbSc+L62N2M1s6wNoX0sqcmxQBpqw9
         8oFssKM5EuQq3CEg44XDpGxsneR9GGNf/aCVuMmGU64w1sfzqZieVr2SKBXiGoNnmGJZ
         mkwvsnutxRN5cWNYxGwRJrQR6zjT4jY6TyB9FiT5L8UNm7WxJgCuvBI+IhIBeo+xUg+4
         DaizG9PwskK6E432BjctkjNdubblcBjypkjIEV6TCUjhmrD0cWSpzNzFHCOFilBhfUJW
         +eY1Xl3Ebs2S0fBytxJd1b6u4K+lJ13+RNrlEyoL4F1SfL2knfKjTJW9zoITfF66gegn
         W7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763648; x=1794368448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tiQ6Fa/Vn2QTQoifHh6BKk70IvD8frJIBqHoc+DS4Nw=;
        b=tUkuA+TtUJgIvxX6qXLL8BhbEApkbITa2clsUdsRgp7l+My3MvDo8wJMjIYGnC+aup
         OE0Wxq3lR0wgjubHQ9Rcx9/WdzfPrn47rj0UaK8PJ0W9ugU3Za4ReNUWq/5nFEuHgE84
         I9eM9x5TJtQX9T3z/ERYF8DsCa733YTClJEcMjXFaDQ2ZF5RMg2iYuMfkxYYajsCnUMr
         bcKYDHb3Wu9eOHbj0Kw71NSLk7v3e9Tu1ggn+1V2t6BPyj8OL7Hd9HYR8/Zrns0Ihf/i
         Cw86kNstxhT6+HP2DvaFLynolx/yjWZdSefd2pEcCuZefr7l05tc/PbFPkLFOgWmy15H
         pg+A==
X-Forwarded-Encrypted: i=1; AKwUvBxTVzcW3xB6DaWqOAA5OdDgtq4KAaj7eVoYAyC7PxvaoYiZ7+MFZH47VMDakpr9dwKv3N1//sTgVKcUW9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vC1bsDSjqUw9m5XGHxrp4ngVJl9jjsIUXDhgBoPa/tLR5iuYi
	R1dcv19jqpbbayAf4K6/iHFujh5T7K0ncjvw+VBH85hqUIOh1INli6Ob
X-Gm-Gg: AYBFou2KOLky4tTiTbqfaV9PgSi/u9tLqhZznY1w3OJIrDJrppvLlb+DQ3eRAA2ir8Q
	SPIqXd/rFkiKKB3owBqaY2Kv1o8AFq4Sv6xupWTCGzOaQN7DAOFsyY/qZb/7vXtESg+UjRR+6Fa
	Ffc8FlZVWzDx5T6tmmeqA/X4mO4N62dYMGW4TL6Po4OYiX9dmgPJxivKP8V/VgmWvxKaTPFk47Q
	lt//3+uipqCB7tYu0PcP5m5iJt/Pea10euyv6kHjODS1cIzDJoZcyxriyWLOoKQiIDA4gcuTnrE
	3hUfSjtQY2ecpkE0LW37OyZDmlCF06JYP3EhbZZCMr4kzLgIIqdyu1OvgxqeQJ3ASpePACojcvE
	QUB12qlSauPPaOAVbdBIb4qhBgsR7+Iemds/tz4L9qyCFfJUAd5Vv8D6Evxe9h07Ur3YSPlE+nL
	mu7DNZ1em6ha+qiFf+S/Xfpkxbo11umZnZRZhZzyqyq6NVxPx3Qz31A1iwkA3fryjgLdasXODPh
	oXTGIKb0JK9fYrFg/AAvdupsgWVuvVWQAFeF7P4tUKV15z4YVmYi+jvTmDipt3mVit7xgP/bbXC
	+xnbJd6hH3rwlZv4xHjZhVV/UTLRCDe0Eja4rMOFuATRszDBi1eDTEbOcNLlehuQtbD1dPde+Ew
	8hcbEqX4jll1PEU+V
X-Received: by 2002:a05:7022:ea51:b0:144:c112:5f24 with SMTP id a92af1059eb24-1ac5b028d82mr22099032c88.25.1793763647565;
        Tue, 03 Nov 2026 19:40:47 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm3528508eec.2.2026.11.03.19.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:40:46 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 03 Nov 2026 19:40:30 -0800
Subject: [PATCH v2 2/7] gpiolib: fix fast-path cancellation in
 gpiod_get_array()
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
Message-Id: <20261103-b4-gpiolib-free-v2-2-ea46767c9cf8@gmail.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
In-Reply-To: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

In gpiod_get_array(), when a pin on the same chip is not in hardware
order and the preceding pins form a contiguous block, the fast path is
cancelled by setting array_info to NULL. However, descs->info was
already populated with the array_info pointer during the first
iteration, leaving descs->info pointing to the aborted array_info.
Consequently, subsequent array operations still use the fast path with
remaining bits set in the masks and wrong hardware pin numbers.

Clear descs->info alongside array_info when cancelling the fast path so
callers do not erroneously use the aborted array_info.

Fixes: c4c958aa64f3 ("gpiolib: Fix array members of same chip processed separately")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f33033dd9473..9a850f5c1917 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5307,6 +5307,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			 * hardware number is different from its array index.
 			 */
 			if (bitmap_full(array_info->get_mask, i)) {
+				descs->info = NULL;
 				array_info = NULL;
 			} else {
 				__clear_bit(i, array_info->get_mask);

-- 
2.56.0.385.gac671c819a-goog

