Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098245;
	b=RV/4uhwk5fM+srTrnjtiRKWIihi4HyM2ivqFvzOaOQLqXJsipJNURLXfqkYBo3QZRpHc
	 haT8LuirrQYalZ0DmQ4RDubUmbBCiXNQswCsknLvin0Ne17xPfQkmSy4kYG9fcJr4tyvu
	 j3pOd7DlATEDPRkdKxvqqGmIv88cqtJJ14MpNMRgwFuTI6soisUjF+ybY48RhAMmSmX6M
	 xKjgym1jiG1KVTni34k3uAkg1MdSrmYpM5lbWHxcYV0WIe9olBeX7Zk7KX6YPDtoKmzUa
	 k9SGB6dDCBoF7c1/U+bOXXmk7MtsOtlZdt0uXrf2+71Oic1nhhzngLNcSZV9r+OVrkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=BhjWM9fwaHnRJu6W/sKAqHkUSk5au4WkBhF6Oy2pRHM=;
	b=tE6/+j2ZSqjmG3QB54yQNjp+WKMHfjKKRR9gsUJivBBvJeldsPt50Gh8P+Vxg2O8Bzlr
	 5gjeV1rhelX6FWKAO581FIOayBc+0qkhwz6zlExyyucy8oK4vnBB3kEumhkwAo38Y6yNR
	 WMRi5O+V5WPkofySSFgaqMSWRJtWMyzIP++j1thDTxUhWBHMe4k8aTY1a0h7uSZmT19WF
	 O0/OrpIUdRoSHEalvgqII5J10EI4NlYXx6qFnBlQIc3S/Nf/F8Hal4CLExPEXQ1YnzaZd
	 BmHpI1zmrsWwy56VkfXwZsfBaUpIOv8YkY5BpWpvu1qU612TD9vKdJ0XkxhhmQyRJoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=W1itp+eu;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F76606ADD1
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15F76606ADD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=W1itp+eu
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so608683f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098243; x=1793703043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BhjWM9fwaHnRJu6W/sKAqHkUSk5au4WkBhF6Oy2pRHM=;
        b=W1itp+euIZ/WjSB/OQPs0YKMkyS4MJmuMxMSm8RDrbT4eHA7Ayve1HtlEAA/yjhfSX
         GV5B7rZF5wNH5gIg6DeZAIv2SJQAiE5s1LCo8lOFbGOHIe5p0bFa4344xlPEt68TMln+
         Wl8bJE4ZXfi0EXNqIfS1u72eY/zD+nzJsZSBX32qZYfcvYe6oGB6YlX7dsTpjCL0G+ux
         IzlCHtk4s7u4NaAF3KbC9GZjk6X0trXQ9fLNbUJsA9MBGvMtoWsju7wYWxXwZ8UtILFS
         mm0pjxUIwJ03WPG7P2gV26xSHHNTbPL7JXrrXnanI0Qi8OSEcTM70azicpcp0H//FdGD
         uWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098243; x=1793703043;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BhjWM9fwaHnRJu6W/sKAqHkUSk5au4WkBhF6Oy2pRHM=;
        b=ejz/bjxyE7AUVmO1hC8+GnzNBM6VO6FMbGfh57Ay66BkrSwdSEdyjanu8UVq/S8z70
         Z7QSQzbrds+2wMbsVtUPuZ4XPirGTQpunQuTz01JBz20sRtRnkUmUTwjZQEQ3ElakP3I
         ndpd/Zphfgqj+lWQC8jzyapWbT/4ScysZ7p7EZ7rXPbfUsZW2bbmxvtbtyIOoBxwTWoG
         OLtFaNi+FNeYvA2rF5qmEAT6vJCWGa2PZomtawInr97Iplf+JSN2oXS6eetnRr1Ab4+l
         mVdBjsGLJVu3Yb/cYN5SpNdHKLRes8JUHpbf8Y36FBDc2ofL2tJgCLaH8updHLvknsXq
         rHPw==
X-Forwarded-Encrypted: i=1; AKwUvBxdLbK5nDd8079ZHCiaX0nkSYxxDSjeU7QBUG/DQUf3GtaXKUmMs3J4EloiKWk8xUNvy6LfABBxo63kcA4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbWiRTVl6TOAO+d8bAf5yfZSu0OhxMqigTXmIejA5CZvRu+/cz
	kioxnyypGOVT6VFiIotlbvqNdnr8/bkyEIX3IFyVzeA6pwW02pRtFhMdXw14PzPoN/4=
X-Gm-Gg: AYBFou28g5ggPLxxVzuz/fc68qY59MFwpSNtWwkuyF8luiQz94Kg3isnGEtc37qYIxm
	e03e/h8fVPz2asSqYpCZIorUGVnWUDOYpzlK3L0AcKe06WwYwQ7QNURA5WbUjkS6C1DArl/mnjP
	OJi6BUQuKwd6Gx+MLg5MXXZD8VN470VftZ9Mq5+YRDXQoOkT8TPtmP9r77B0fj8OFbeajQJ03ZD
	SsqtCvFEeImBO7hJwVqCUUqXQs4FimbT11RJM38OWUx+fpCo6kXItgwAFBAFF9ehA42rcx/D/PI
	hHVfmNW4DSN85F+kOBAmcWWUjbX8zLkeW4vbTcrjvdXcUKappRsOrU1WdhftZjVI1RVENYZ0mcE
	S5Q+sa+hg6gOwSazx5Xpq0BKL4l0zc9Yk6SryCjYN0KPZ7LjWxFKyeaE746OWMxeg3I9nIlOPwI
	yX/3hPJgNPfw5/zMfdCX+nDcCFfX0DXlMpWGrB7ritLEWq/TDrcMYM3zd+g2QB+M4AMKuYGVQKt
	Df8dN+adaznrKS6/sGdOCQ//3gPUAyAstoYVzBYWLshYN45ydxLpLWlJQoalyLYPw1PSn0DQTFw
	4FxmksX+RMV1CuPEYKhg5BLooEVesvZegF+3aMOlPWw=
X-Received: by 2002:a05:6000:1287:b0:48e:22fd:1ea3 with SMTP id ffacd0b85a97d-48e55a5902emr3843230f8f.28.1793098243442;
        Tue, 27 Oct 2026 03:50:43 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebd4bc5sm22269671f8f.34.2026.10.27.03.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/23] gpio: pcf857x: Use named initializers for of_device_id array
Date: Tue, 27 Oct 2026 11:48:51 +0100
Message-ID:  <38ae02051667a7c6e2c8b6e2e9e97a8ff94ea814.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2471; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WYs95j6U3d4ePwnS1uhm/Fqgo4kFgcWrrBXRXKM8Pag=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IHAgjN6bhosqoi+pUuBsGnQRfPb07Do1lScE jAZ5AL/ErWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBwAAKCRCPgPtYfRL+ Ti5JCACHsyBCzKSi61IRSvOyacZQHUq8Dngp7W8dqvZPQpfXDpfVEhkd1Ik85QbSYCY22cD4qZO F+h5fAwLktwa0gwoNFmcv1HRFLI79O8UEK1GHK9wr5JHq5xqn91W4ECrvBqJA6OdBsZPO7n+AoM ufaZex/8kKPflIzBeO+3gOgmrzn2rYpDvtYDLHidAnM7K9tkjBeXcrMPM1lVOTGTl7ABMRvOvBt n7OvgxWSTlAmLX6pACtX3aqzeyVDpNfWXGmek6J+AJTCCgKlHz4bWLK+ayb4AAoVEkzZh86BXqp xLJGKr+QS/4VLCbWnCb6it0pi1UlgZXHqXbgrtwDkvcBS28p
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
of_device_id that replaces .data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-pcf857x.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 1ba6a09542f3..a2395bae4ca9 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -39,19 +39,19 @@ static const struct i2c_device_id pcf857x_id[] = {
 MODULE_DEVICE_TABLE(i2c, pcf857x_id);
 
 static const struct of_device_id pcf857x_of_table[] = {
-	{ .compatible = "nxp,pcf8574", (void *)8 },
-	{ .compatible = "nxp,pcf8574a", (void *)8 },
-	{ .compatible = "nxp,pca8574", (void *)8 },
-	{ .compatible = "nxp,pca9670", (void *)8 },
-	{ .compatible = "nxp,pca9672", (void *)8 },
-	{ .compatible = "nxp,pca9674", (void *)8 },
-	{ .compatible = "nxp,pcf8575", (void *)16 },
-	{ .compatible = "nxp,pca8575", (void *)16 },
-	{ .compatible = "nxp,pca9671", (void *)16 },
-	{ .compatible = "nxp,pca9673", (void *)16 },
-	{ .compatible = "nxp,pca9675", (void *)16 },
-	{ .compatible = "maxim,max7328", (void *)8 },
-	{ .compatible = "maxim,max7329", (void *)8 },
+	{ .compatible = "nxp,pcf8574", .data = (void *)8 },
+	{ .compatible = "nxp,pcf8574a", .data = (void *)8 },
+	{ .compatible = "nxp,pca8574", .data = (void *)8 },
+	{ .compatible = "nxp,pca9670", .data = (void *)8 },
+	{ .compatible = "nxp,pca9672", .data = (void *)8 },
+	{ .compatible = "nxp,pca9674", .data = (void *)8 },
+	{ .compatible = "nxp,pcf8575", .data = (void *)16 },
+	{ .compatible = "nxp,pca8575", .data = (void *)16 },
+	{ .compatible = "nxp,pca9671", .data = (void *)16 },
+	{ .compatible = "nxp,pca9673", .data = (void *)16 },
+	{ .compatible = "nxp,pca9675", .data = (void *)16 },
+	{ .compatible = "maxim,max7328", .data = (void *)8 },
+	{ .compatible = "maxim,max7329", .data = (void *)8 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcf857x_of_table);
-- 
2.56.0.rc1

