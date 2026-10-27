Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098250;
	b=XuZ3RzaB15KVTqeg1u2u1AyR06nhhRmYO3RVJx695eVZywWkkBae8B4SyBKvaLSUJhoW
	 zbUa/S3Lujm8zgA2nu1ALeCtRLXcRLsbZTx9VI52wcExHBt/p2i2sNJzuZqyHM2WiUGx3
	 rcUI3WiuloQM1BnCTPeR6o4egL0lB9eQDX0niVa6AWte9BRZkX6oeuO2sSDnSaAW7uils
	 gEqGBohp6q73e4+ATa2DpiF3DRUI3YZ3O9YndN0tzphPjj4+PyxnzLX2jYsxFipeT22x2
	 VZwHgoSolYR4ChebSP+csLpNYZsj7SkGmFVVDGbtBo0XOzipm1W1cUJDRULIqz4AcWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=08drD1ymTUi9hsmUJNZ4ArGmW7O1mMyycL0HsIwG3PI=;
	b=qSA4nDWtx4kl4VMx8Stvf9kZ9O1cdmI3n5ToOi6Rjl6cc9jckbiWM73eKETxJQgY+YyE
	 Nr1lURuvPtvRtNuvNux3U8HIzzILmTuzWDcSddNFjhKw80yw9Teh/H41dTwhhwa/Q5Uah
	 avHMtw+XFXrDaXKc2zFxz1U3E/oB6yOj3tgNgNoiUoE/PbJkWwVEhZdK2FQyXCfcI2OjS
	 G/6Bvdjd2A3UtXxZPBN0cV+jfkYQJBwYGCRvmD7XN4+q6H1TWQR8gHTvOu9y7mPfRPd+q
	 fMV2xvnreeILTZvq3YVVZhHm2M2ZyIasI06lwffvPqki0JzvoOfrionBmWMloeAgvBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ds7Hggy1;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9F260A263D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA9F260A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ds7Hggy1
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so27117155e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098248; x=1793703048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=08drD1ymTUi9hsmUJNZ4ArGmW7O1mMyycL0HsIwG3PI=;
        b=ds7Hggy1g7y2Jsxb88pE/u2fCtID/rsa8ZSv+O0xeHxBL3PZc8FpU1cGpfCmWckcJ7
         KrPJEHYcgSiD+U8fEu/GS7OkhjQwIu5dZJUL2JXOf/6pvBGXzbdXiVE8JMdRvHWF4caf
         X3ITPxH+W4bXXb0KThumJCSvMzH35CfokJ1E5m1csTM0+XY6TrddJDbaAWuGkJ/u+KOR
         UBtIHWYoAEFjmmX4LCY1R/2T+nluHCZuW2S0JsRxKURlgrxbG/ea+t8WAQpx7nWjjuK3
         31+4rJfMhsPy8J9Qhy+09uP4YiFqn4dvmQjkD9v6H1tkI+WLSx8Xm5er5j0sYU12Mdsf
         Uu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098248; x=1793703048;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08drD1ymTUi9hsmUJNZ4ArGmW7O1mMyycL0HsIwG3PI=;
        b=A6zvBu9baqCvZOMutkQOJtwxEcHlTt+Yf9GhkFDnHtRSN4vr7nn/Zir5pzAYnajfE8
         +Cb6+XrRAY365owZwFuRdhctyJCr0LpyvENydhR7yh7ksMIcTXxQo9FPSXko2XkUvLI7
         MACCw3R5OL1SjqoVozIy8V+TlPxnTxGr+KeA088xm0dafwRyQ6D0adIUhFoeE+53X8vz
         JV1T3v5JUwUOeLeixTVKtbidwmyPc5fyGkhnbB8Uxn9NJxjMbPIEHRvRkW32G2o3Peg9
         2S4l30+mDDIKqoZ6yqTN//KJ7lX+6Bg9HepOw2tyETmRQsLS/qDGWD/w3QJRmSO/QNz3
         Jy5A==
X-Forwarded-Encrypted: i=1; AKwUvBxSTnV2O3bdu17nE9KM7yYBpZRZgzw25rBU3ksUcXgLrwWZJcs8OkeEZvlCjT0A2M+M2/hYs+DYkt8K14w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIGwM8GZgAssxPZDzXvFmZTY22EKf+Ie0u5pG9Ie2FEFV6iijH
	dOiEg6klxbBAlDXoofOG4ZZdoQEPrM+opCnO7ikaF9GYpw2tMTEi5w+rrH5mErTNHDg=
X-Gm-Gg: AYBFou39xiMN6w2xhWvkQBy2N4g+5xkRVKZy9jlYkj5KIvrY2szeaAt51mWB1O8b3rW
	vEHkZbnfIfGnkiXF8QOg/7rntKHv+Srax97RL1GvulVWQaCCN2oKwVx2q9saSbxOnBxM4RwHczD
	SRvsaN3dvBzB1KXYkgSJaEwnwU5vmg/+Q2f+UQwTlAA4SUALDQUC/orW3znpYm/zp4s4uHbFDyx
	oA+2Phik0P9o0aLXGNKHjRQn8J1AuMdAvzReruBbAcTagUgdpyKtam6cvQ6mZPIlq6xagFQzJ45
	v64MhP1OlLrlYRM4krV3Pb2OnY7uDtApbPqJ9rDOZnUrRk+cGeNPfkM2hlMzYEaLsBCfA/ok6q3
	LTcg81bSVf4XDlMpEBZD2yK+YYfFOcPWxkkSL2MF/bfX3y6jDMWjiW23YLOgJ5bfKd7t2nGF+Ub
	hkzWuDGRscIXlnQ68LyAj2EErURqFqRwf8z1/+h42okhh7+3sBzFfMuewWwm5BRFT3IIsVEe3AN
	NYE/Eqmz1MLAtrVhJxIGlVbpyRjwOP5v15BooEjGx8v9EhRKeBTSlNlHK92yzMEj5/GM6Vw+dNU
	b55D/V/I9ZzLwwNidXNNp8uzpq7qxwgwOiUTQJBua8AVC3WEB2KunckffZtGVfT4u+zzWOUMZGE
	uOTTJdxVZo8FlaiBW
X-Received: by 2002:a05:600c:8b86:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4a35acb17bfmr177092795e9.22.1793098248233;
        Tue, 27 Oct 2026 03:50:48 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a359fbb725sm257775775e9.0.2026.10.27.03.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:47 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	"Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v4 17/23] gpio: virtio: Use a named initializer for virtio_device_id array
Date: Tue, 27 Oct 2026 11:48:54 +0100
Message-ID:  <0ff54324a8cdb1f036bd01f05dfaff75512d8abe.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=HvLKZnIb7RtprxLD/D+7QxSMDdlX02hi9zaVYI1agxw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IHL55n0O6CbSHLAYjy/VwqEdsY+cZcVZlvXU /YSi3wb+H6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBywAKCRCPgPtYfRL+ TtSNB/47f7idwujRUL62MyxZqdila+JxQe2sFy21p90zLDAWqeOh9phY6aVPSFuI3cCtJl9FIHm yXmV+NgiGxVGPbGmjtaVlNt7TvwxrKKD4DykEceu4+LgcW1qWY6KJwSVK/4pve14di0ygt8dTzv k8kToE94nDb1GWFWy8HbKhbgWVNYP21R6r7C/q+ZTrWiJtzXIW7qBg2eMpqsuQE5Ak5FAf1zgGg Dv1jyW+oJVVwfR6XK0/Ch4mhQlvqOQoEEccJ5mShNSO3wnh07Z0eu+IvJtIytag85I2oKnNtp/X pln5RT1N5amHzixg5WZB7cLEQJCDiRy392STmwpWppui45f7
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

This patch doesn't modify the compiled array, only its representation in
source form benefits.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-virtio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index ed6e0e90fa8a..42871db05ec1 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -646,7 +646,7 @@ static void virtio_gpio_remove(struct virtio_device *vdev)
 }
 
 static const struct virtio_device_id id_table[] = {
-	{ VIRTIO_ID_GPIO, VIRTIO_DEV_ANY_ID },
+	{ .device = VIRTIO_ID_GPIO, .vendor = VIRTIO_DEV_ANY_ID },
 	{},
 };
 MODULE_DEVICE_TABLE(virtio, id_table);
-- 
2.56.0.rc1

