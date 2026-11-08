Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794110409;
	b=j+GwX3JU4XcXnWZVXMMlr5NTD9SdApwc5KqIdpfI3+es2aUmecVi39uuOYMgK2tTmq+A
	 VRI+6q8Fy+h9Vh9LaNKIRWGtU/ScMhZzu2O/UKnSdDJq06fXvxUuog7c4q/L8VwP1tfHM
	 bCvOCFAXFyRjS1TN2P1Kh3rC6APEIiDOtExd/LP8bWRInAD9dWRxow00NtpXUN8mvMTRu
	 lCKbwBxKiNroRSV2QYEC+i5hmqW+RktsAg3dqp+KBCqSU/YWkFWbQ4f39KU3REhyrWBI+
	 CbvVv13/ne3ee2C3wHC1ncrPzdazioDnvXy9rCPCYhJEPIv/2iKeoxoVqq6PBl5sQPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794110409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=MXs/vYPbzWYafmxmgKumqAJHyqvTX01sR3Js7JwVAao=;
	b=V6WbN+1H+azqcd1ecxRFFUGbP9sdR90a47N8yejTttepQPkuZmjmG9Vx/HalhtiDQzWc
	 WJSiPcz8Q0oetputHe7s4p0loGfh74NCA3vLOuPciSH0dPaTLQ/fXkZziLRze0D8f6PM1
	 Un/yzxDG5f2ZBo77U0cq49VD5T5P/2tpJ4wMXo5yqUOLaZiGKTbPsxsZAHj30wwyX1qFf
	 304oORT/yTZJMZpMew9dwbZ6liCnlnnXGKlZCJTP29zOZjyVqWszevUU1/PksQZn7hmTC
	 nrbCKJkwES2oWTK9RW00/+mHoyfZfeLdTte/lUl6aI5UtnJmU28iuTzRhASnbxS5EyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EkCR26WK;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF25606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EF25606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EkCR26WK
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso649415e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794110408; x=1794715208; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MXs/vYPbzWYafmxmgKumqAJHyqvTX01sR3Js7JwVAao=;
        b=EkCR26WKGBesWOMeuUYBjQxQ9VPM0sDcZMo7omY9i+uEbe3+Q4QslZkKDLsGKI1GGI
         sTQ01EoP/syAhkaNcd67YQ1RhS4XmzavWUgPgZ3fMkTDiYipMTq1J7Y9i4rklxd3vyVE
         ZUE1FRLKQRqOih5d/cC0uitnflb8JpIHozECrD6WPC45IE1tdYK2mZrp9DaqZnCgmnAL
         a6+LXIrzoR2CDfAi8OzK0ioqDMhHZgUCZSr+H5+ZBEQgtCrkEiTw3JkU2KbnXK74atIk
         FZxGud+NuLPqjPWnj3QnE/xzd0poANc/iOMmh6TFsUauczd3Wyk8YQBusljapUEWv15G
         faGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794110408; x=1794715208;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MXs/vYPbzWYafmxmgKumqAJHyqvTX01sR3Js7JwVAao=;
        b=XamgSUZZP32IyCIx3dUmP8FLJ2w9Qxr7QqSzwWyx48W74Q2z1DGWg28A5f+mRmWXnG
         chzNxIQgU3UqamxHckwsW47LMN4qJYBrLO+3JML9U2iyL13wZkrmP6XW+cXkO736zBHU
         BEOlI3oUTHWsUFwtMnjz0qKhU/kUxntdq2ChkAfPZcolRH9M0ednYEkaDkOfPMFwS9vZ
         nHvuVM88e5vzWelkkV7flFqqNL1MLcYrOhVTpmajtzYh1fE6wD8YRZKHTK6zwH9EslRU
         krOdagkG8KUjgL6bIXaZxgwmzyzTxQ7AcYDFybgJZcphfwHddD5tQ2jQQMH9j+lHodin
         6HdQ==
X-Forwarded-Encrypted: i=1; AKwUvBySovfvu5N4thnVpVX69buFpR3AlM/ucNnUCPw4DhAEDQ8hGfQ2PGIaZLoucwGQC6av36NerNxpArI04vw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fcEwv+cJhhiEKCjPz8hcAER0grbGj5X83s/oiWpxZGszcOMiH
	GYyYhuHddyInpBOb+twsSOYP2mKuz7CPvlBanQW3AEPtHOYzx3zCmFsj
X-Gm-Gg: AYBFou10rQ7ZDepz6UJGE9ascwy2JMczQvanMep6NenpOTO4RFjTjpR7hBycjd6B2AV
	UJZaGqTfrSj5djc2kqKXHNcpEoF9Lv29XXqQeO2EC7/wYw9MCPSHkOxt7fJVrAZrTADqtWKdjOQ
	m3bpAutpsoDXogu3lFeoN7wIWfbZF/t5jTZ8IiPUNkAowyC/02tYmfDgypclfo7BL9MBKInDzU7
	8zLez9HUe6Q/6ugmAkYakgyJU/1BLkaH9xi3KJlu3SDBGB1FjBVTPngIzJbAuLeBTL5Yo8/JcrO
	IU9nuKiwSKxAmK5QNLMicdAADJ4x4j4lcF7q4yk5TuJKl22K63NoXG/5ntWE4yK2/gK0AXY6VyC
	zpUgugtqcZQd9LsZBNZzExqaYrZHQZ6QGr6y9XbiheR3CRIHMX/YsZzY8+wllKQBR+pN/IkaP9a
	tB9LVevtewAh+NPKPDs5ehJ7GWy8JidEOQd5PD8gAQrjCx4S04Kger7hFyR9DLOrEAM5L7/Jd+i
	9tRuQopiUs0wtOR+EOhiCkAIdh+rGCdZAxvTzGALcC7cGICeCy+DLZ5ZnyTnlPZ85chvdImMAxm
	jtWEp3+QvaM7sUhfKpJuGVkCBZVpQcCOnOjkyd/eHz72x0UGIxc1Nu0oEm6iVA==
X-Received: by 2002:a05:600c:1c02:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4b9633cee71mr11013845e9.8.1794110407861;
        Sat, 07 Nov 2026 20:00:07 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f3163sm1736310f8f.11.2026.11.07.20.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:00:06 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/3] hwmon: (max31760) Fix local limits, standby and the
 initial fan speed
Date: Sun, 08 Nov 2026 03:59:52 +0000
Message-Id: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIALjz72oC/yXM3QpAQBCG4VvRHNvaoazcihwsBqP8tIOU3LvB4
 dPX+10gFJgEiuiCQAcLL7MC4wiawc89GW7VkNgkQ7S5mfyZosus6fgkMdZ3mCtThw40WgN9gzZ
 l9Vv2eqRme1/gvh8nIgcJcgAAAA==
X-Change-ID: 20261108-max31760-fixes-0af187603717
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nurettin Bolucu <Nurettin.Bolucu@analog.com>, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794110404; l=1156;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Ziw3YkmSyzfldrT5i6PlnnWtcqRZBGP8NMAy3Z4o/Ts=;
 b=qHzpvm9GMvYTw/xiK4s4TFssjytv12/+x3xSgdIuIXf9FJPgOU0TrfD4sMQ21wuUNcrf2feeT
 oA9/nxYXcq7C8I9oTlJLyFbBI7dOP5tdxTYqmMfxn8HrGk81FFJUsQY
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Three fixes for the MAX31760 driver, found while bringing up the Samsung
Galaxy XR on mainline. The headset uses the chip for its two cooling
fans.

1. The local temperature max and crit limits are swapped.
2. Probe never clears the standby bit. The Galaxy XR bootloader leaves
   the chip in standby, so the driver gets no temperature or fan speed
   readings and can't control the fans.
3. The fan speed reads 3000000 RPM before the first measurement.

The patches were written with the help of an AI coding assistant
(Claude Code), based on the datasheet and tests on the device. I
reviewed them and tested them on the Galaxy XR.

---
Stanislav Aleksandrov (3):
      hwmon: (max31760) Fix the local temperature limit registers
      hwmon: (max31760) Leave standby mode at probe
      hwmon: (max31760) Report 0 RPM before the first fan speed measurement

 drivers/hwmon/max31760.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
---
base-commit: f4e680ffc2e50867c5b590e26a37f8801a31e486
change-id: 20261108-max31760-fixes-0af187603717

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

