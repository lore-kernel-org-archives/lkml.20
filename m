Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793440244;
	b=44FdxYAc75O8VbiW/u3UxarqXqDIQz69sIw3kMXh9wZCesHsRHdoj1fuE35ZL2suHEme
	 +bBaMaT1RbRVpuo5ouYlXNtqceOQqPRe+zWIrUwC55O0hnAJKd7ubRLPSBX2bQXcubJj2
	 LiIvwZrPpt48dkd7CGI2R81XRqjHF3MItzr5IxT2TvHYW6p3YT6NjATC7iWS2b4qoqj2l
	 bj1nU0kjHtg2pBcJqW4dhtpVO9B4azkiBSasTC+pvOQBmg6pP/tK65w+zhWhTCRybCpuk
	 1dICyyKnuRernfsvoqwsKJL1/4eZimKQQkR56WP7UGh/KqkJ5WlGAbXAF5PSmPO3Jog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793440244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EivTM9AaIOsrkRjqX0xsfFPqcFyziSUsNmwZ7BEydgk=;
	b=xThq+AAJE6oeLaipgq15etOKGlgCS9OTOjMQS4cV5gwdM8/7AXepvXj8vSUe5U6TAewk
	 YdzMhRJczeYzpELSZb5JIlT811QG7LHkAahAD4uxW2sBSzQ2zyGdc0p1lI8mrwTSAvCVX
	 WGg+OI0uEqN+ZCmmBFiftf4K0lUBOqydc0gQxV5sG0fjxOOCBuIBAXEXH1iRRQBrDElK/
	 bgQzWdxohCamXQfTx5iNr3un6D9pJ5C+F7KLX+ffyga6OeIGicBYh5H2oPiEpCqrJnRkU
	 HgMGBNrrJqwrWrWvQyjhByCTTNbmL3AUCp241yNOqPZr1mm/3MD0uquZITpmtaWVbGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iw4oW4d/";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BAE606A320
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BAE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iw4oW4d/
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35b2c599f43so1121587eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793440243; x=1794045043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EivTM9AaIOsrkRjqX0xsfFPqcFyziSUsNmwZ7BEydgk=;
        b=iw4oW4d/RyKBW5a1pYUtjFSFu6pJ15+v1M8Ps2Fa/meQTeGbEItgeF4eCgjjZuuM1Y
         UMBWzwdzUMMtQYDGZoC98Vhj9YBtZs/hJJ0pWdzV7Uh8dYRFhM19GaA4+oO84Ywd/Wh4
         y78kIys+Lfl9ZbsUUz6v5wEP2exSOW0Kz57pBSydGt8jgj6fOULsqqnfQ09vMS/X/x1Y
         i3MAkvYpMvuHIDqdjmtXxWKcdBJDEzFihtwS++kyA2U0y6BjbD+2MOBJwbbw9zVRJloT
         46gWf3qrr2GoDInbF4iUYb7EWBW8uKwnjkjfwjUW8ncUBLtmWovDQiPKyC4V+NMBOxX6
         FAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793440243; x=1794045043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EivTM9AaIOsrkRjqX0xsfFPqcFyziSUsNmwZ7BEydgk=;
        b=WrwsRPSXp9TexK/pvnAHelqhus9qLwBJQcgyarqiLiEdkKvstbJwvl3a2ll9DVkNKt
         WJIDUcarId/A/eSL/91QwY+cpXAr1P2b6Glpdgq8e9SYb2stL60Tywu6Vwo48vQtASNb
         gZ2bV4/jgiYkhREoCt8Kb79nXf/3CRQYaqL6fkU+K95Rqa60cxQTCWWSnmLiI6UrjeIS
         pt0eVqmOeh7lHwXNQG9OTCumO5iPddYW4GpLoVxiImrdNqiWFo1kYpOMdtOwJ2/SDZYW
         XI5CWtOzPvjzgVyXVO6sGD1VJrxepcCfYzAdE0+0Ra1TZyoeb3neKL53sknZPERB+PkH
         9uDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXTGs9sNcpsJuCS36+3zJeJkY9REKhHIOHx0rqXLfZioHMYeNhaaUc6Uc2uX8Gjzwt0D00iBXMLUChCjU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI28H7+xLWXQjZk1KRrqWzqsGKhhlJANi0MwpBGVlpPLx/nXNKP
	bgTeWBmp/HD9ItzkvbEexMEo46J/4Tc7O3rKiDK+X090tymEKT2YAykE
X-Gm-Gg: AYBFou2WTCI3TpeJDaJDV7Qal8Fea1zzBbnDnpI+uWhy6FGF4k0nJ5mLaWmbWlQdBnl
	ONVwwqJF3AkphfkMTxpsJrYWEAqGSGiNHi10v425SWkGK2lQTg0oXu/ZWLYTRtT2ZhJoykg6/B6
	/5aNTF1aYRv4wTY8BXR37owclBjXlqvQ73fpJ/RZj4KqTqvltv3/6uK9AaDZSC81nbDqpkuIuQO
	GumgCo8RErbmrQXLtDGih1td3n9ykcrC5jCq4DzTLlGYqikMANf1dCygPqE75kXz5/B/D84iorG
	PfgybhqZ03a9+4d1eJujnzboEuC66ipaHXzA1mZ3xk2uuYL8ndD23Sj4km+FnPOVL1o7ghyX8eR
	eHEmYOJQR0AUkkibmd0MLbcYTzle6+lq+dpTqgfC4Uv2U+URzBFxety8yIBeeaPWIcUWoF7/8vb
	9Sg21TXMa03bQkOvW1oqQ//R4kh2ceaiGuZp2qDT5qr+B2Z3jO5Ef9YiEArEzB4jEUV6phoHZ6v
	S93eMnn5Ohi08uRfXG9dHs9Z6Z7W6LD4Q2PEkoHAZ9n+4CocbVFIa8l4CQasdUUYKbYQcXmLZDl
	AikLA3jodsTtfKuKFwqOR5Hh5cQRDPvr0ELbiNYZPRkpFA==
X-Received: by 2002:a05:7300:e918:b0:35c:de00:93d3 with SMTP id 5a478bee46e88-36a4247d812mr6622966eec.40.1793440242826;
        Sat, 31 Oct 2026 02:50:42 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6eabbsm16137291eec.24.2026.10.31.02.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:50:42 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (gpio-fan) Update the speed cache before dropping the PM reference
Date: Sat, 31 Oct 2026 18:50:39 +0900
Message-ID: <20261031095039.11683-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

set_fan_speed() writes the GPIO control value before dropping the runtime
PM reference when stopping the fan. pm_runtime_put_sync() decrements the
usage count even when suspending the device fails, but the error return
currently leaves speed_index at the previous running speed.

A request for that same running speed then returns success without
changing the GPIOs or taking a runtime PM reference. Retrying the stop
instead drops a reference the driver no longer owns and can trigger a
runtime PM usage count underflow warning.

Update speed_index after writing the GPIOs and before dropping the PM
reference. The initial same-speed check already excludes a stopped fan,
so a zero target is sufficient to identify the transition that needs a
PM put. Preserve the PM error return and the CONFIG_PM=n exception.

This keeps the cached control state and PM reference ownership consistent
without restoring running GPIOs after a possibly partial supply failure.
It does not clear persistent runtime PM errors or claim that a failing
regulator has successfully powered off.

Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")

Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
An arm64 QEMU/KVM kernel exercised gpio-fan through hwmon sysfs with
virtual GPIO and regulator providers and the actual runtime PM core.
An injected -EBUSY regulator disable error after a running-to-stopped
request left GPIOs off and PM usage at zero. Before the change the
speed cache stayed running and a repeated stop underflowed PM usage;
after the change the cache stayed stopped and no PM underflow occurred.
No physical fan or RPM was tested.

 drivers/hwmon/gpio-fan.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 3f78375eeb448..08b58b49be5b9 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -150,7 +150,10 @@ static int set_fan_speed(struct gpio_fan_data *fan_data, int speed_index)
 
 	__set_fan_ctrl(fan_data, fan_data->speed[speed_index].ctrl_val);
 
-	if (fan_data->speed_index > 0 && speed_index == 0) {
+	/* The GPIOs have changed, and a PM put drops the reference on error. */
+	fan_data->speed_index = speed_index;
+
+	if (speed_index == 0) {
 		int ret;
 
 		ret = pm_runtime_put_sync(fan_data->dev);
@@ -158,8 +161,6 @@ static int set_fan_speed(struct gpio_fan_data *fan_data, int speed_index)
 			return ret;
 	}
 
-	fan_data->speed_index = speed_index;
-
 	return 0;
 }
 
-- 
2.55.0

