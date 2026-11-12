Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466204;
	b=ekI6mFCpHjiRn1mZDf3UlLeEjYWH0V2O7iGB9NPqSlmCkTd23vMO0Et/zW+REaTw1EyU
	 leDmi3w72BAUkUD7n55E9MMbMBH41Lgf4CGSMTWfITNOyH6VwfRKqe1Z0rY1u0uF23y1h
	 8aNsQsTUCeCLET5VfuK67KD2Glho/BfXK/vL2hw4vQYM8jabl/iUa1cIPb5r6coHHeGYc
	 HSceJuMEfiYRXxyI3zZkNuhN+eA8xV1VEl+MVJbBlUresE9S4ybb4xaNKPRk4rQ4IPV07
	 btj8kOkQmitjY3H4HiznX4tG0/aF+UkFFaDAO7gx5qL8pvTiXkM/sW1CX+ULr7QorLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h1v3GwTQW47LQ5TJOhvyv2Mw5v+tziCrMDZBrKab9Q0=;
	b=gZUBWXTqWLuRoTg1ElFLz4sVuxDaqMDl3IuKCNJu6TFe3conDtmqxmQLhYpquGqrhNz6
	 WceUyVl19h9MPgNRrmrt2LBTxFjXWXAZ0XaTP9J/E5ebKkFJJo8CeJTdadRqUY7y1gwF+
	 7ByjANmFOPsYLlXjLqU+c4v/fZYGewZheM+Q+AmeFgn4BYPpAoYP9QC/3I3hiH7QO736B
	 m/PLs/VUtp2wcuPapaMUjX0uQgzLx4g9S9l/dby/0rFqdzgrd4IXLvxQ9t5kO+Giwri7I
	 GB467QIMbxV2295AN3QPuhs3ZDWlbXxYb8JGtdPOrilDgznD2uXvaxUkM7TgZQGZ8Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e4DC2Jg1;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BBD606A882
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73BBD606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e4DC2Jg1
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36f8cdd30beso7306002eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466203; x=1795071003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1v3GwTQW47LQ5TJOhvyv2Mw5v+tziCrMDZBrKab9Q0=;
        b=e4DC2Jg1DGduI4t0xDJwc64Byyii//Fx6ciVlfdglJcqMUA841Oj3nOl8HyZASERwt
         DNTMeTpKk4g5v82wQZt3M0dIqMs9ty+rKOK7nyIcIz8hFLyNOSx69MjkeXBemrllxKp1
         A7hqhgRP/mpIvT4XjdeUSIaC1rwzdCbPfYndsWGPfLJiw83XBK7EFoc1g9+kKPL4+u1f
         +E9dVlWhQOqQMHnpc+71MUmQo7zMI5tX25K/yx07SB5NfVShc6A+a8GjshuM66RooyKH
         sVo6sxPhebfNQ/Q1HeWO1i9JUHAF3jP2oAe7eJpJvxlKAISt+yk8Xw3bY5cd3ipgZpdT
         LUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466203; x=1795071003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h1v3GwTQW47LQ5TJOhvyv2Mw5v+tziCrMDZBrKab9Q0=;
        b=j8zzYUAMf/+hQ/6OUB5rdxynfw2PBLfR7SlWWlJyHKsOhPLpMMRMQmwgMTAJY/5jXE
         mKXr/7BMbWokP6iQ3pFqfeJeOIggWmT0JTqV4sxqe389gdWkNSgJqp9c3GQOdudhTnr0
         4A48iinlrc5o5rgoUMMf0d4vrzXprXw+1p+/+3/bD8qY+OypzEhNHBoE7okXbOB3Y1f4
         5HiGbdrpV54ncdxvgEpePIjCAxCqxqW9oma4oKFEF42kcp0M+oiauhdgdOWMninbOem0
         zSAmQOUrB3y7sQK5xMC20k45nLGtXu5+LrncwfYUseGwswu1kYEvOF8hE9+ZKYosBIKX
         SgFA==
X-Forwarded-Encrypted: i=1; AL+hErF0cPFEy8+Plw96hD9NjC5RNPcTBvppT2zDW2ZESymWX5LuqEXARopF6yg4M6JOlPSVWaj2TRe1qygE2e0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VqJaylVUy+/ZBmanLuzE0vsMuwZ2hK7UGI5vX44mE1Ek5LJWo
	ZOmSUAIf+zXmDFlrWA6IVpoI7XUK0anqGZ1dDOVD6Db2ivO0rlMaHSVM
X-Gm-Gg: AYBFou06fe6yXJDjlHMPOsYMbEumJ2hBbcuurEL2c2ki1vVAAGYAqHBKMLqZSvY7nv+
	/1c2+RSkYNoVxc4kSyNTJfwUDREBaOYP6TYC8Dk69m6AkHRKp0Tn0XzZlPDxY+4psQN3lTazMcg
	FuU+1my/Cbn4kZ7ojni0rU+MJbM0KIoOV7E5GuaOJnEXvBmcQX06IEBhjofXlghkfShjpx4nlDx
	WlYw3xUaQiH29OYlORLJ+6jl89XOmDyj7vxWo1OwjoDQ6N4DxAN5EALbQ1ZUZ9IapRsKp/DD2J6
	cv2Oya9v7VrbtrV90BYqiiDQ/lcWkFTxtTktSQ5PrIJbwpMtH4h3K5OakI66CCUxKGbZhuVepHv
	ugBNO02XeZOwwZr7BIHbsdtvV/2lsc94WkpoQVUFB2XnOV1ZySedn5yubGSFxnluvQft90yzYce
	ElA+uArGlO3uj7Bx0ELMgrMIgBc1h+WgGkNg38nzth7d4YF4YI/La6iz9EiuTqrQVjZ+i8TgLr2
	5id3EvUkAaSYzxjAO36V7bp+BtkrfNqYKFGLJMxo16pgFtHDYVfcJsaUbgFhW/PJDPaJtSnk3la
	OvpdWGmsxHDPUb5eAB26uFLzjNO5pN5ibHXJC2D0YM203yKnBYeHyS3QqHVULQbNZrO8aQ+8ZLu
	/FCP/h/9bkkw8Jl23
X-Received: by 2002:a05:693c:8852:b0:371:ede8:3e9b with SMTP id 5a478bee46e88-3768721116amr4902164eec.36.1794466202380;
        Wed, 11 Nov 2026 22:50:02 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm27190961eec.19.2026.11.11.22.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:50:01 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Kris Bahnsen <kris@embeddedTS.com>,
	Mark Featherston <mark@embeddedTS.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-input@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Input: ads7846 - drop platform data support and cleanups
Date: Wed, 11 Nov 2026 22:49:52 -0800
Message-ID: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

Now that all in-tree boards using ads7846 have been converted to Device
Tree or software nodes, this series drops legacy platform data support
and its header file, simplifies sample filtering by calling
ads7846_debounce_filter() directly instead of through function pointers,
removes redundant memory barriers, deletes dead code, and cleans up
minor coding style issues.

Thanks.

Dmitry Torokhov (5):
  Input: ads7846 - drop platform data support
  Input: ads7846 - simplify sample filtering
  Input: ads7846 - remove unneeded memory barriers
  Input: ads7846 - remove unused code
  Input: ads7846 - fix minor coding style issues

 arch/arm/mach-pxa/spitz.c           |   1 -
 drivers/input/touchscreen/ads7846.c | 434 +++++++++++-----------------
 include/linux/spi/ads7846.h         |  45 ---
 3 files changed, 171 insertions(+), 309 deletions(-)
 delete mode 100644 include/linux/spi/ads7846.h

-- 
2.56.0.567.gdb80ae8cd5-goog

