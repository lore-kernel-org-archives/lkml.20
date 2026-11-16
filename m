Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870009;
	b=DtZ7Rl1jtRowrQl4RG+jC4zDdp0Vcaw8CtCwqg+MZ3qhcZDGaoROHIrU12VnZfQM5U3h
	 vtYQLkfBFXXfyWW74ALMMEDaIojBKdOGnyagK+QM+ZSeCSVQvILj9WLMd3nIR/oFFwUaK
	 WryY0ud8AB/PVpVbmw8mUh1lSOgcRSwUBlKhcV2hjC1M9iYy46nby7u5mPCqbHMgOzzh+
	 3E0rJiUg1tPWH7S4HWkdfiwK2vGF4GmgTvl//jhBmIbEd9pL7vXR4FVqAIOKx0BkNRBrF
	 0sllWMsnzNta4ycxqRN3zmfsddAK3Y4AX4+LahNUWNoHTb6AQJ9oQiowUjXqHczJB3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870009;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=WUolhYDZbslOOIbkyOEoOPPNwXhWzrlgPsJ43aUqTJk=;
	b=sFYKY/myfLSBcbLo0wnCzAc48iXutGKL7+a4dASBDDvTFQQI9HcwPjNMahSc5LAmkZXy
	 M7QpF3OJ4tXhXF8G1bCQSv+M9rEghw+fSlO3YWODOQZNCpDBSnDqvU1iTdzsltai4Sbp4
	 IglFNG5oFmeUFczuteoQ2tppZzUbIqxGG6sp5r6y92bXFr3Vx8K348H2pe5eCA674E+Pe
	 55j6vpNaehDOlZKIGdb7GLhnyKODvt2Ia0bfTtTlLXSkXiluQeFCObDZtaK/TiQW7kcfW
	 KNaZnSVvsZ0bUZPsy7Rrt2Ve1xQxEFO4MLHuVwLyGWfETq8+LsYtzoKQvNpT3+Q7p9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B100E606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B100E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4d86f5328so10794837b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870008; x=1795474808;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WUolhYDZbslOOIbkyOEoOPPNwXhWzrlgPsJ43aUqTJk=;
        b=YpkXx+tjFpZO85+4u8VV5/5wH8gb4aOypsi21w585yR+x/TDsGX6OYaw8BfJB4XdRq
         mgXYM8nqCFxqgEkDuRC2MaQk3lvBl6Lr9Z9Mo7O1wQQQBmFMMrFPfm5i1IPYzV/CYZGH
         il/cXUGh1KucdLeBi5YcdltJRCinFOkG4ozqP2T6x8jr1iejXPjMrUVMRUyNvYfvYgVW
         bvg+DnqVvHJ5Wsv674MGe8FFlpfU9SOO05Y8Lq4Zk038vxojtIgzxCSMNR88/NM1cl0J
         qA6jVIYy46R9YfSKwCqB9y3pBmAjq+ZXXeob++YmarGREBeoA2HHFJh38MTMv6mBhgPZ
         JTUw==
X-Forwarded-Encrypted: i=1; AL+hErE+1yeRA50GxXEJ/l4/yqUvzhTvXdCGyq3BqwvWXL+S+UyxZsWLTW5kimRrTuC4zTXtyU4bbczuAvrgx+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a44tr0jVXex7DpsEIzbWZNSmOVq95MwO/w0P9Yj6bTTsNdU+M
	cdJo51O8VZWOqdnjchslV68A+t7Ftw93s7Lpn/VzhxuNzTaYAdK4U1Kp
X-Gm-Gg: AZFdTZdyVWSz1dr28VOqZ/JScbPqj07ulmB3cgfla2G3/2U+Pe2b8QjQfVGyGLXjRGg
	C6jDbj9nMR1cPqYMqDEor0B8QZeA9I+nVD7JTdkBkiV89MLi6Cx7TepZIUzlPFfM8P/u0j5wT4w
	YrJWWd2l5CEbFH4w+rjLvIDFaEMiw19XozjBLOIwf7W+tiZgNAS9JbtffMa8gJkip0366Y6nAvj
	yGiCEw1cWTXDGyHN5XpJ+aGfJc/BPYgmcQWvnZow1RY7/xoKjeIo9JbhTnwCTG63Y9dmvOnRFSq
	urLyU9y3wNc0I0INuwn8J1vHhlJ6XRM0UvrYfjdIA/4c9qklc9lN8wwbo2Ag7PY+X8HJPSdS2Xr
	/pEazoR4hDbIGjrjH0Zu09ut1v0j2NtROxABWrRMlv72GBFWO1SR7dJc9OcQSBD7bV57Pzvxh5M
	kkCwU7GGVTU8JMhADljsKwM4QuUqQBKfhsy0mR7ht+VjA5q7PiIE22u+bPXGzHZyNG2oXVq9ayc
	ft6uOnNxQnOTPOyEdP67l15ta38NyH9o8+3VtUylJAoGrFtjnLSy0+r0rNLgnY/XwSgQEkderts
	FM4bz5bVYyX4QWm65djW0lol8ywDGf78jNYDsPLJPQN9g4Xbu73YaSGyyCJqxu6NVeKs3ZrLIAh
	p7PrkcAZ8ssHgGp9rWTlqFIdmyQ+HGaZwiscrVL524pykT5TW6y0iRw==
X-Received: by 2002:a05:690c:e3ed:b0:8b0:89ea:6aca with SMTP id 00721157ae682-8b4aa0d0116mr67609057b3.6.1794870007633;
        Mon, 16 Nov 2026 15:00:07 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ebc50e40sm10721347b3.17.2026.11.16.15.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:00:06 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Subject: [PATCH 0/5] iio: potentiometer: mcp4018: Add Analog Devices AD5246
Date: Mon, 16 Nov 2026 17:59:49 -0500
Message-Id: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQ5AMBBA0avIrDUxVa24iligg7FAWkTSuLti+
 Rb/B/DkmDxUSQBHJ3telwhME+indhlJsI0GmUmNiFowr6K1hVRalFblxqAsjTIQg83RwNc3q5v
 f/uhm6vf3APf9AOCXSituAAAA
X-Change-ID: 20261116-iio-ad5246-8d4377128747
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The AD5246 is a 128-position I2C rheostat that speaks the MCP4017/18/19
protocol. This series adds it to the mcp4018 driver, so it can be an IIO
channel provider for an in-kernel consumer, here one that sets a fan's
speed through the channel.

Patch 1 moves the out_resistance*_raw_available ABI to the generic file,
patch 2 reports the wiper range, patch 3 adds the binding, patch 4 turns
on the vdd supply, and patch 5 adds the parts.

---
Joseph Telaak (5):
      iio: ABI: Move out_resistance_raw_available to sysfs-bus-iio
      iio: potentiometer: mcp4018: Report the available wiper positions
      dt-bindings: iio: potentiometer: Add Analog Devices AD5246
      iio: potentiometer: mcp4018: Turn on the vdd supply
      iio: potentiometer: mcp4018: Add Analog Devices AD5246

 Documentation/ABI/testing/sysfs-bus-iio            |  9 ++++
 .../testing/sysfs-bus-iio-potentiometer-mcp4531    |  8 ---
 .../bindings/iio/potentiometer/adi,ad5246.yaml     | 54 ++++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 drivers/iio/potentiometer/Kconfig                  |  6 +--
 drivers/iio/potentiometer/mcp4018.c                | 59 +++++++++++++++++++---
 6 files changed, 120 insertions(+), 18 deletions(-)
---
base-commit: 94921bc9eb214f838481faa847cda5c42e486013
change-id: 20261116-iio-ad5246-8d4377128747

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>

