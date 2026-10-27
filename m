Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098231;
	b=GxC3Vf2kGaKcOEj+QW6F3JhOIMPqbgNma9tXbSjzvZ7c2TW6tei120Rb3J6kmfR5ogvD
	 4gyFZYLbMG0AMzlPCi3AjVRDZ//CelyVnYLLNqeiHmk9eQwW7zl2wWqD64BoYTND2x6ut
	 lGErpreUR6jFeza8PfXBkTMtYwUIdPS2yxrjrehIhKUTjq26ma7d3rUgpU/E4cjk6Xb/A
	 laUdAGOcBKw/fZCGwbZ7+ttrrGJRj/nd//n6HPB1UDl267lXY8ltJCGQ8VljWlxoV6GFZ
	 8KUSod60SHtAoklF/Qx5QM+Zs8/CiD/FuT4YvBtxYo0hQJU5gDDlD9CNbq3XPUy6nqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=DufeBrqyUbSnmQ8skjhQG6l+F7Ults2Rkyo8mZPpFPY=;
	b=LdwNcwid2LiHFwBS7uWTe2/h8CgTD8RXhd+R1os8B3Mey0cLguRCsmCDPeOLMhtRLnt5
	 1wOX7InQOlXsFqorUuCTeOMya8eETPayJY4kcX96GPNp1V1ycn5AEoroBAVvPzfd3Mg3a
	 AS+6Dw/QCK/+cIbRlTgD3YjHEVrsAeF84jPsKTwm98nzrukVLGg5RxRbF8nGGhF9ssOOp
	 BeK80vproxwLQBX4BjI9Nl5Wz/kwF8/anxQRfLuhmhhIb+I0pB1jAzdn7/d9yNE1h66yo
	 LQnxoJS7Ham666zn1GvNjHJ9YWzf2WHS+cO2qdpz1y5urYBlZ0xrsqCCF810a62VWKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ecB6596H;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ED860A2613
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4ED860A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ecB6596H
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2388474f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098229; x=1793703029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DufeBrqyUbSnmQ8skjhQG6l+F7Ults2Rkyo8mZPpFPY=;
        b=ecB6596HtOJNyVOW0IQr5NfjFDPH6zgyqpUII9qLvZ9wFpZPt1854g/OezLwwZIGlx
         hMd4eFiqaDRrUWC0gAcgM1/W6cGbAP0eyI1DTxUsYsFlyYuO/74scWBJHrkpqO1m4MPM
         0Kb3kMIHI4LxRFr3jku92PHmyheb8MxtjsOvHYO3GFOWDe/0i4o/f1az+ZL+jvo4ESbz
         z4Nl0OYkHKhpFsStJEkN9MFeKdddYaOGza/b5hGyiSiMHn2e6B/LRVuBI9Bp5+HO8cva
         apqI6IezBLZ1BPjOwC2DHUDeC2Il1zpwPiXqVcfTnIj0HS0vOyIAQPkIj4mafOTpxliZ
         muOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098229; x=1793703029;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DufeBrqyUbSnmQ8skjhQG6l+F7Ults2Rkyo8mZPpFPY=;
        b=cjclMsa1VcBbcsdheNXZ3J5GKekDycFezRfHT0/LnUX/9kaF7XCaL4eu6T+Dp1Wtvp
         I7ewvOCK/34D69FgP2+Vy+LxYJMww0Hh78HWvoAR2WqoZSjqqsPUuuX6bbzqUJrNRR2j
         zHT+7yk5ZV/Kb1UdHLhXc3aYjuuusl6AAJD7vNOfz3webvyZfALEjIuARagu3htty3nN
         xq5US6sgi+BXQC9Ibrgp8u5kJtpC2zMnpRD0BdfFOaJsUec/+cywPxLxSKnhK9oDw7WG
         4jcWKyWmyeRQPqIJqzPyzHk3voUucBtyH9bWlTy4sj7s1hcEjl4gqFLNaJ/PyvXQFiBD
         6O6Q==
X-Forwarded-Encrypted: i=1; AKwUvByRX3BHXxvr4GZJouvR0hzx75NfNpT+tXZiNLrSA135fKlIkerX83XCYkjRZo0MWdX+qrjHPNVmnfU7aI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiA3/JaeU9nMS5hVxmMyEXKpIYlpGEkZxS97sL0pEUWC4ROniV
	IldQ9nHVA92+x+k6WqTaG6rjohf1ULNtUOddM/v/AJM5l46Jt5kNiTJhYGdWUcXLhb4=
X-Gm-Gg: AYBFou3RpNlMJBUmWnJT+R8ZSeZGe2y5yEXmfzKPXV8kp4uENlLrC9er5nIToyafvZk
	kqT70HohjWgSs/f9BPZ3qV9/1g98wC3Hpca8mlB4/hUICVQE7a9UmQc3YF/9hwFcOXTP9RzBNf7
	u/327I4hATFcmhE8eFOTPdeqiNijeDLzfToHFw+aCkwWtsKGSUnr2R+TUWzBeVY6f8LoHH4Yzgb
	PqSh42r0adX8+ts13CU6x35MPStFBNk28SJtMKQC0t9qytSW7Bxt1pxBP00rwYfmwBYN4gMbfjg
	v8TbSoBx0AX/FGo9khHGkR6z0XuzJsbb2garqF/k3YCISoLKvCbhm0GSlNJLrAarpmVKw0uRUmy
	4F7035GiaRvrbC0KHD3iL9CTlLBrpQdaHUmz3QPHY8vwmrCBoPtB6JD/zQk52tv2LCSJHsF7hxY
	xP4Xh+u6MoZN3MgWdnxCRjyr/4h1smPbv1e5OuTvbH29FvBHp4dt5j5rP6rdWbSZjxfV1yc/OcZ
	49UjBveHVfDP4mIcPcqk9yUStEVsI8uvumbLkX0iU3zmE0HzobH4TtK0grk2rDxn8XLaKccGV3N
	5Cn0ANHGsCNuy13LiIClzVbx7RB+NgSMPBGX5PyloUY=
X-Received: by 2002:a5d:584c:0:b0:48e:56fa:9645 with SMTP id ffacd0b85a97d-48e56fa96c1mr3303066f8f.29.1793098229260;
        Tue, 27 Oct 2026 03:50:29 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ecde7easm22352475f8f.52.2026.10.27.03.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:28 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/23] gpio: xgene: Add missing ACPI module annotation
Date: Tue, 27 Oct 2026 11:48:44 +0100
Message-ID:  <19f784b91a0aa51e83a85d69a933fdc197fb83f0.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=781; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xq5mEKXuCDf/ep4/z+js4VuJ0kfEYf1RuGm8A0Z4zms=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IGm6YO+TcXKBdlcvHmveG3G04xES01Nq4bFX EtAVF/OlCCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBpgAKCRCPgPtYfRL+ Tj5iB/0ZWdAujVmwhrVlbS6aFROKC/zqJvBOGgXKxcRcNirOgZd2zSuUsSfayH0TnerX+EiJp7v xdF27LAdBSL0egS1CZvf3jQQE4owlESkv6V502kXB551V7pgvW4CXqZ+yuWltUOiOZcvWIMNxVP iloVrv04cdvSuLfV+sKvVP00QJDxTLiVstZBBUftPn6soYwxvWRyHAgFtl8B/q5xNr87+djfATV VLvT9Sb5RyPaI2KOz8Igx7xBi02Zhl7SxuZB1uxsG/3kEG9ffzWhIuvN/yAdqmnNvOHP175p6pB O6uKY/O7VKhtrskyJPpE57NnODN/shyh68sV0WRdfBolbhUB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using an ACPI device id table is
supposed to declare that in the module's metadata. Add this information
for the xgene gpio driver that failed to declare this.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-xgene.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 22d22962963b..ad0f1551c271 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -197,6 +197,7 @@ static const struct acpi_device_id xgene_gpio_acpi_match[] = {
 	{ "APMC0D14" },
 	{ },
 };
+MODULE_DEVICE_TABLE(acpi, xgene_gpio_acpi_match);
 #endif
 
 static struct platform_driver xgene_gpio_driver = {
-- 
2.56.0.rc1

