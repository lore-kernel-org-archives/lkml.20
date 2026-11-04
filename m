Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829603;
	b=wJv0w8/f9bpiG0HfL+lNE9/qXN4FQ5piT+7I/FrP96ccptUMMf0iFkKt+NVLpj5AuudP
	 G4vWI6y6g6eEeMM2aSHXhSOAosC1jAr7qaHB1PRFrc+khEqVODSUBmrVp1rtQnT6dwV+4
	 dI9a+WQ5HadOHMyFWkpmwBobbXzNd/wQFsaB628Ww7zLvJdgv18dUaHuddCtoW6PeceR5
	 8DOcBNyHccMge05Ue1kbuZKBCpL3Mm8iZW0e7vB47Me+BK2zs9CsP0VDCt43pnQDpuePl
	 45gS1X2bkUBQSUQ7SOZsfuATv2QkIp0XhdsOcWvhy5jRbgL9ViyG2J8MrcSiIhOtYmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QdTFClJEcyQ2skUjhMpJ7JAqchbY3BE2cskvPjfKm94=;
	b=SYDnXJOQWi9T9L8nM9XHT1KulXMiUv2C3oM66HjiDdwcc+kn/uW79GqVXq7NHpd1ajWh
	 uBwIQrF+LsX5xy0KUYLhFfcwZ+d7YrCblUxdBzUJqKXdZZ7qK8r4H4I3RZqV4+pVMUpno
	 uDi2YRaH2NqjII8rS2Ej16bi/v1i3OWlHAyOH2GcI7nCKgKW2zK5XYYZdt3Ikji6minsB
	 S4grq7F9m6U/YbES6sbz34stGgRZxlE1GVEJAfqwx50q1nMoxb1o8QnZ5QXfszRPmxBrI
	 k2hNmHpnza3pUXFqqlZsMjTYzKvjVLCGE5iW7W+N1jAFme5To6yeK6VeFaXE/yCRSvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWOchdt0;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E275606B2D2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E275606B2D2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWOchdt0
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e60f9af6e6so11890985ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829602; x=1794434402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QdTFClJEcyQ2skUjhMpJ7JAqchbY3BE2cskvPjfKm94=;
        b=XWOchdt0PSrtvFhgV+EbI5Ik73InYESfTmGWf2FrM49HyiL1WyGqLQKjUNGdPOOB+6
         2cWNZtpiTKrI53YQY1/jlXeqyXJYKIfQcv/Y3bqHNS32L8KabMOguu/wrZgE+hhTYHKU
         HZEyIVvLJT5yMIhiRP1i2q8rDG/O2au3YPAhgv+MaFQvytnd1gDm0PENqh5Tg1kqrV1O
         sRqJEnIeyz2VToedqY3jVIOWhXXsJrPAiaUoE8KdWRtErZHM7g8YWdO3CSYGfOrlmZl5
         eiJhE5qYl/4A8AgX79v3CxT8CaEJE6JsSgMUdMUXUc2oepbLGPsbqr0QIEurwOtjNksG
         S/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829602; x=1794434402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QdTFClJEcyQ2skUjhMpJ7JAqchbY3BE2cskvPjfKm94=;
        b=CbLwiR6MbrWMxDxnRQK/2UQis4BRHvr7n5xoO06SWUqnq4cnEzhEQfu5sJF7QL/bC4
         vkGtJFevlni2jQS41hbP3wRA1ZgpQO5a/5DyUynPtOQK2FuxWMO3IXPTutxCpcHeXlo6
         hYIbuINTzXj5FI9qpz2sXf2ngQHaJb+1G0wl2U1IJMevrkkqDZwAR5f3LMMgYVP7rYEB
         TWTeIx5MjEuz14Y8S+aE5dp7/aBIiK1mHa0KyCRHFB7chxXqpvEFv+R9uR8OSRhhXc7J
         fVac/8vNUKXP0JB2BGrTlj/kcLiLN9+COinGCCa3sP8l/ioAoEAI4N8ch768QcrRDEvn
         Y+YQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2rNu6vntvILrHBPXVxQPXbHQw8ZaQ6WZHc27f4LJMCxmeT9XMpB++i2dQ20pC13jqMT7WMbcCl9mxDoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z92niYw7UAalPKsXYzHIsUuOQuAvU7iVxLF+5QqdwEVc4jV37nO
	9ahPctwFyGOeIfWhYEOpIhGGD7YOKUGh7MMxDxXJXYJYoXTEcZf9Mnd3
X-Gm-Gg: AYBFou0OWWI2GxzZ84TnjDuzyMwpGoQbUM7PUgwQI7GsoyyySSSzo33cKfIKqC4JutD
	df0Rz1G5hPY26LHus/Lv1OO2sCx45vBiUtjHOZ2p7l8NhAuxQD3TyZC6hczqHFPcCXYqi1KnZ/i
	MutheniXIPj6jST5WRNauT/IP815mgEv/TehXe2bjoA2P2nYpEtJiLUnEN9cVXIeek+sUDGtK6H
	zr5KeYSwWGBNr8g5xtmUCsrvKnc1+IyXH36sKTXDBIsYMdp3qR/su+X8Bla6JMeRkKOlAbiRiQB
	LHj68CwiX29fEfR7TD6meF2Ti+vj8U/GTSDyQauhJJJPg6JZCm2wHIwxkIJz5ODpzamrQMrNWvP
	xCmsyeQ7VN/CFfTpkDKeItTQQIiwZZalKSQ9VDAXpcj49gP7rk57vTs7b/d3HxJdxnC+st4ClDw
	RjXSlCLJpJHjJ1rpFkeJeXAvHV0yMp1w+sik/NWJQTARjzopBwBj9srbDxZa09rcpKMOI33FCYd
	WydDYY8gn+b6U8JILr+X49D01RSe0xl4WuQ6e+GDiMhZFU2jSSpPlj7E6HSHTbmxPKuKcoLYRPK
	aMfz+umQpifLEerL6H0ZuapdGjR/oCaORZSQvk++cFgpb0mhfIuiYMA3VL/6W0ChLZZ/PZvIozs
	/PV30TehR3BeuFgq/e3OiMKlD/LKTVS4fsGFOUH/LRg0URgqSr7psMSTNxzO1sfQpVkcGdiVJYp
	QdfVk=
X-Received: by 2002:a17:902:ce81:b0:2ea:dacd:1663 with SMTP id d9443c01a7336-2eb364f23a4mr180965875ad.47.1793829602218;
        Wed, 04 Nov 2026 14:00:02 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e4dsm11237865ad.21.2026.11.04.14.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:00:01 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/5] gpio: ppc44x: assorted cleanups
Date: Wed,  4 Nov 2026 13:59:54 -0800
Message-ID: <20261104215959.24035-1-rosenp@gmail.com>
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

A follow-up to the earlier ppc44x GPIO conversion to gpio-mmio. With the
driver now built on gpio_generic_chip, a few leftovers can go:

 - Patch 1 drops the label and parent assignments that
   gpio_generic_chip_init() already does.
 - Patches 2-3 deduplicate the OSR/TSR source selection shared by both
   direction callbacks and fold the single-caller __ppc44x_gpio_set()
   into ppc44x_gpio_dir_out().
 - Patch 4 expresses the MSB-first pin masks with BIT() and GENMASK().
 - Patch 5 trims includes, switches to devm_kzalloc_obj() and tidies
   up probe and the OF match table.

No functional change intended.

An AI coding assistant (Claude) was used to help prepare this series.

Rosen Penev (5):
  gpio: ppc44x: drop redundant label and parent assignments
  gpio: ppc44x: factor out the OSR/TSR source selection
  gpio: ppc44x: fold __ppc44x_gpio_set() into ppc44x_gpio_dir_out()
  gpio: ppc44x: use BIT() and GENMASK() for the pin masks
  gpio: ppc44x: tidy up includes and probe

 drivers/gpio/gpio-ppc44x.c | 89 ++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 52 deletions(-)

-- 
2.56.0

