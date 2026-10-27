Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098229;
	b=RLm/Nq//6HyhRw9kUA8gXCxgBor+H2HpvlPKX7AMhAn7Np7gn3IagDZQSTv34zepI+iR
	 MPJG6GO1S43AK6aUFKahk4RvzCPHiqfi+pDsn7d5vnq4RO/o2luMmFEiM/QTU9XO0x5Cq
	 oZgRgEiIthUFCIo+SnHLHH+DRlNpFGgqWpHSom9Kl8nNDpvLXX5gzIYjYbzGuIfZbm/HY
	 ojigp/Ga4XatJ9OvgXabt/AFWzJsfOnG4KQALOTIL5lU3wLXtZYRgNZiG9jW+z2XrdBrv
	 EuGfnsOQyDNO/vyrLZ1LDOUdDGerNPgm1W+gRrSHaHiFqG1EQZzDzkOgxHOnl4gn39w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=6LxqbrR2lXu3aVaVPjXpNOCcYTO9SsUgRIZy5ix2VGs=;
	b=k4JXuJHwncqLQgx2J5snhVz5WvSZI4EaCF8E9axB6dYCCThdEviF2zfK6y292ZfIt745
	 /OgpX/PoDywi+xyzQ03wqpHe68KxlwcU3n1w+P78TeEPolvgrRC4/XOv5eKfeIIYHkXEt
	 gZYeOcrYjv9r+RnkcMak6WpSgC7A7SiWNjDyYegjsUVCSZRAj93nRFM3XXUA3BgoQxz1S
	 vyP3PvtDzSUnRh7Mcqr6vRj3Bx7qHm3bdT6WxBFcaotZJqhjvuOxJ90QyY7r3xl6kBwxd
	 dzN6z3jd4NMhlxw1TbxUYwZ+NgLI2xyq+As1V5VETco5YPifDyv+idmnqZEYQIYoq9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YyN3BPwL;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C03A60A5BC1
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C03A60A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YyN3BPwL
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so22294065e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098227; x=1793703027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LxqbrR2lXu3aVaVPjXpNOCcYTO9SsUgRIZy5ix2VGs=;
        b=YyN3BPwLPIDnpZwOgz5kdD5Eo4m9O35b1LiEWq+XZefcPkgQXE6OQzsw2bzaQC3uVO
         kzpKHky/pBFIaxDuzkCN1kJtMI/VnP7uRC+60YEwgfSrbS4XweVxWAPyWn/s7RYHmDhU
         8xAi2G3F5HAi8XoA78NkAX62jSxnfz/q2SNZT/QLWjT6YBKJ/ORpstYiF1Aj8CuweatT
         zphAcBWGSVPAZIaZO34uqG+D10tixWXJD2u4oOMzlG+v8qViI8DzzdN0YI1lPCltWdSf
         j5IBJ+Qp1lGiJwtymUeWbeMsKoeGlhnhzjmPRZYu9+YEfCH+mRqPitvYf9z2y4kQ1jzS
         BuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098227; x=1793703027;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LxqbrR2lXu3aVaVPjXpNOCcYTO9SsUgRIZy5ix2VGs=;
        b=O7q1PhOTkOYUX79+0iR4P6P5RXhEWvMKZPEENOW2IrinWENG8wCTZpRcf3BwWJDPAv
         ZSzj/nncIY1qsusaaFOvF5HhdhZzgevqPtmMiHeQzhoF0011Z/f2KQGQgT6F4SPfRBPW
         axTtVfhOeiWOLeyN9jlCkkLPALUvT4krSU5bfl9jzeGiKU8CaRQVTW4XfpZLAePV09IB
         +q+VWTb7t+fv5PadAOjJ+FMwhN0Q+WQOA+TMVOuyQrVyb+WF4DAyQmX/+eADFa2377LJ
         0yFy+VP4BqaCDNNby1iGdreqW+U7iJw5sZI9ChOy24FO1OF6Qqlr3Wh+/sSZXw/9cNkA
         kRUw==
X-Forwarded-Encrypted: i=1; AKwUvBxhyqLfTStCiIj4E0rO2roVsaw9PtZyrpa2mhnBPiVlbFlf9OXWWDfHLwjkB+K/bMvlVjRFX1aCAWe3XHc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZrCK8+1BtY1tsNig9s1aPF5Htvz6/adS8MGE2+UWNAk0JZAEg
	Z/iPuWcJ6zRZYRSswFb+oScneVY6gBIDc3vNShJnA9/iIGJ9o6rMLJWhkbVLLXzpxTI=
X-Gm-Gg: AYBFou33HpJYmQ1JNYhdRn6akYH/50MLjKjwpFICELxi6919KBaO9F9fxbIeAcV1kIi
	PwVFjUlKeQtIFMBpFCr+bYEDxfoMsRYVBEaxuI8tvqX/sA+YI5hiHnBJzw/BM7BBUii6TflO0oV
	XBlCYKF1MGSp5r8DH1+0lHEtHaBrwGTVVh3/cJcAWy2hch+PL+0FuQ8/gF3jJ0JqrYgJpg2ssx4
	Nxc379MNnKOhK+qQ9R07spqSjRy/uZRB2wq9qMOXiR4zoWZRIDfe2uhmx+LFGZMzrGdCX9Qdt4o
	UA5bSPfuzkjWxMNAfq3z1RWjtYrH1DOpmAxQyC/XTK5dnWcd0HarvVoJXeiI4DNkht0WzNu6BZ5
	h87HwkI3UusMemPG26l8fW2zmhf68WzitdAF/c8Yqz4+WcU5nFtWsOq7zE+IiDsR7MCmpDLr2i7
	3ZEZcyTOEmsuwP9Jco7fgBG8Ma/fbEXHMx/AHXVeowWCgMqVhTRF2JMm9mIblnid+LdtXoDCC5I
	6V1QOins6ewjMJqPmhmWFrNDVKDyFn7dBoAjgv2uzZbBGIDQDYLLJEOaNfh71nfRs6+O0gAmYKg
	T04vmoGl/hotboYWvsdcUU+0bXCfMYZ4nKZG4kl6EeA=
X-Received: by 2002:a05:600c:4f55:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4a35ac9a6d5mr198035115e9.8.1793098227517;
        Tue, 27 Oct 2026 03:50:27 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a046fefsm330869705e9.5.2026.10.27.03.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:26 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/23] gpio: ljca: Drop unused assignment of auxiliary_device_id driver data
Date: Tue, 27 Oct 2026 11:48:43 +0100
Message-ID:  <7cf7d80ba1211d8e0ea2c4e096eeb5c27c43a96c.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=LtmNoSs0VsyI/755R4pZVK8cbuvtZIuCZ1dOLhKQlds=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IGhbmth3+Bi8+Q0mz6mgNrTNnOdttUlOVi9i WVA8IeztsmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBoQAKCRCPgPtYfRL+ TuNLCACq/sPiomnwgRSfutf+IDdCiwxR1DCnVuaORN1MZ2hAdLzfFSKwrp+GfJ8ONTtfd/nWnAs HWV0VjHOqzTZmDoH3Sx582FT+84uDk6wXh1D2mQpdQgsdk5rqruyQvDSVUHyt8VZ47YA/+P7T6o Enc5XyHbibXdxzKQJrJ1hHtF1/POuQ/Qa5YE6onIwA/DpfQmMRYaWR35sMUM86wte8F42xB7UB0 KZ4+04S2vYKexexcMJWaoTne/M5rL+U0azdwarNqd+FZcOQZK3k6tpvFTws0lIOs4nRNuVt+3ce y16QqVMfOgNMMKPydLTGVNhhsKxRTh2qSD9ZKUgbjB9eER6/
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
auxiliary_device_id to zero without relying on that value. Drop this
unused assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-ljca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index f32d1d237795..ad5dc9a3a119 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -472,7 +472,7 @@ static void ljca_gpio_remove(struct auxiliary_device *auxdev)
 }
 
 static const struct auxiliary_device_id ljca_gpio_id_table[] = {
-	{ "usb_ljca.ljca-gpio", 0 },
+	{ "usb_ljca.ljca-gpio" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(auxiliary, ljca_gpio_id_table);
-- 
2.56.0.rc1

