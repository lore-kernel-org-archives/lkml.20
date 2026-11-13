Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548981;
	b=aN8uR5PnMB5JnXO/NSCGWvDTcRRkmu3KfDyLTfl/56NO9Tp8t4hq034K/gyFpE4wM/by
	 dJFdv95gqVlDgXLj0QJ24xkGW9Hwe07Zz3cV338JmA/M7e1JmG06vtyLWe0Ri41t4xNod
	 NOtemBmsVriFYgMlOwpCzSTXKVf5kpGCQBvOylfMrXMF8EGiAu8CJxvQgRnWD/W/kAiq7
	 H48zTZjtYJSfEKN3YrHSjybzkUArRbKXer4SuAzs2Y6lqv2/Z7vESpKc8+aC76jFhuS+R
	 LRrDIA2BQAig6ptkFFiJAg7CoQ4aiXh/3YFO8iv8Mma4iVPyz4kz66kJ6BZ7HIoAWPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xQdVfz3MZ0n2Y8Oaz47zK9HN2fz7nOQrOgwJG2ZDEIg=;
	b=AbKV2zbv36SyNFjagvUv655MXAA3wbdstgdLxEEdyQChlZmbmNA/MIewBF8sbcqhIKOm
	 du682zTLpKgP986pNm6BisYcU+iwAWU/kaaFZMX7qkb0gea9vkb9QXhyOoJMZPFuAlouc
	 DKCnEsk9kLa7csg2uR6i4Y63056uPAItnDqxzsQTrjMdJo8cokXYD+e1GGjRCVQ0wwfVK
	 InA88xal82mbYBIiL9ePgPfjyhXKmQcazXbQpBa5iLYNAI6YC3mgj1Lz1m7dmI8tjDyfV
	 bVm6V/ZMaznSO77P/HGPzvGlBxcigvRVv4ioYpikIIsAy2RzRgSCVwlqNOK4WlzafJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vo+LxCNq;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF902606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF902606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vo+LxCNq
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ccca948203aso386633a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794548980; x=1795153780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQdVfz3MZ0n2Y8Oaz47zK9HN2fz7nOQrOgwJG2ZDEIg=;
        b=vo+LxCNq0Hxjv1jXVu/Ve/PTfjdV+EGgC8fcfGVeqPQdY1IwMwUXiq+8hqvNvnjgrs
         hFJy3xtj79ub3Npkw6fs4B8dt5KeFLkyl021eKZ9i5io5GId4/1yQ1wPf9aKV62nfL+9
         L18T73aQXWNONCCLnYpPtUlLQRkXM81Ma0oUVliXA+uu8KQMUR5CjMhwVTwzF+k4DX3R
         rMthfnqBZAQWj9I7Gs6dC5XbsrRqO746THiMdaylZQ0ezW3JnlGzLusrMIkfEuuVuU9v
         /KtYDujZ7dU82S9xPh8KTXfAGxuKLRc7gHZwwajDkAZGdl22lepzQ2zRMhjh+CRo8RBl
         gkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548980; x=1795153780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQdVfz3MZ0n2Y8Oaz47zK9HN2fz7nOQrOgwJG2ZDEIg=;
        b=VoxBv1MHnuzwsutFBapHc46qDefBClNz71FfOywGRJdfA7s0Xq99J4WbI7luEOqpSv
         gZOM2rmH/bPffnRa+CGRAo918AnFagmcqeToRO+meh9wGkOztevJ4hfcREr0GMW30Knq
         Bm36kLdD+7RBW5ODMPFqGtuyKZA5jo+SmWqpzqD9FrcaBlllqAE1ET9RKKrgg49lJ9hM
         HBSFY9cQ6egBxZCJ9I0pdobOPO8WyASX/HxhXzgBydMWgNFESypmsuTJtmrFcZ+TgZSf
         DsONY6oWcYAatFk/jE8Tkdpe/c4kGgLWJt8HUP9vMqSBLD/aKOyPLVQPZpX1N7edAUZi
         3Bdw==
X-Forwarded-Encrypted: i=1; AL+hErFheCi6QwbEjR8p8UfcdmbpJjjIIvnGcCqHEp7ca4tX63Tr3dEp35q2qDSt/VV9owtdbVuHbF0upmeMOiU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y7eT+r2MZkaskcK9QMpTvYwkDNzZzWOtXG8d8CPmTBm7XAPGe
	Dck3dx6euZ843KjX8E1jUvVCFx0fqjhebWE/kqEN7+Zl+r7ShqvZh8Wy
X-Gm-Gg: AYBFou0F+CERnkCJQIFU/KnLOYAQpnkRcFhjxA+xBPfdT+umC+pMOGNfNdltbGNHwrf
	FWz7rJAtJ+qHFtJTUvE0i3k8q8aZlWOuQfqcEOgt3bPgOcosoDC3asfe9ckMGzAlgjPplCjpLBc
	We5hh8B8At2E30cEclEtitu7tIVjAiDSsI4iQ59/gDiiGAXqCSn5laADJAlj+2TtGGbdUfZbE7l
	lF5M7hv2n1gGH1ScX65WmBMz934FuuRNfX3odeSGbnS08zvA8b2bDIB0AFm5F2oXwaYz48L5/al
	TvFpai6Rn44eAToKWCVgvQkFy0H9wQbt1ATsSo9GgMacMDwlT/jWnDmLgPdxrwcy4yzEs1AGVFx
	R6AWS10pf6je4DuFvqbyOBdCPXB681pY/ioG27MgR9QnrB45j+NgviDxKSDLArInRCpzw4ae+Gv
	bb6yhGiPjk46SY/3JINDxaIi1o7O8DJ/py+HxiCia4InVpJoPpaIeTjd8GKPlLGYMH0SdQ/uLMy
	00Kj4RCAAENjka0pZY1o6cyW/JV/heeH1xPU6KY4sNBD/aHktHGzF9vjQ/2TOJW0PAHjhZ3VCN9
	wE+7XLXGqc+c8mNO19xcXYVxIpydkWhdHuCNxYB8SuWYVElumSxg9fkhBSb9LfWaRiWKDAfo0GK
	SkBCQrmFDMarhN7MXkzJtdeleo9p8NNPxG2/jKvAs+HboLTEeblFrJ65QBJd30Cc=
X-Received: by 2002:a05:693c:3f02:b0:36e:1fbe:3571 with SMTP id 5a478bee46e88-3796365ee8dmr1372806eec.3.1794548979615;
        Thu, 12 Nov 2026 21:49:39 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e25c-c447-241a-96a0-8669-d6f0.emome-ip6.hinet.net. [2001:b400:e25c:c447:241a:96a0:8669:d6f0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm3518485eec.22.2026.11.12.21.49.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 21:49:39 -0800 (PST)
From: Wayne Ho <wayneho219@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Pascal Sachs <pascal.sachs@sensirion.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wayne Ho <wayneho219@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] hwmon: (sht3x) Fix overflow when writing alert limits
Date: Fri, 13 Nov 2026 13:48:57 +0800
Message-ID: <20261113054857.97048-1-wayneho219@gmail.com>
X-Mailer: git-send-email 2.50.1
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

limit_write() encodes the limits with 32-bit arithmetic, which overflows
for the largest accepted values:

  (130000 + 45000) * 24543 = 4295025000 > U32_MAX
  100000 * 42950           = 4295000000 > U32_MAX

Writing 130000 to temp1_max therefore programs -45 degrees C, and
writing 100000 to humidity1_max programs 0 %RH, so a limit set to its
maximum makes the alert fire instead of never firing. Reading the
attributes back returns the cached values, so this is not visible from
sysfs.

Use 64-bit arithmetic and clamp each result to its field width. Even
with 64-bit arithmetic, 130000 encodes to 0x200, which overflows the
9-bit temperature field, and 100000 encodes to 0x10000, which is still 0
after masking.

Prepared with the help of an AI coding assistant (Claude); I reproduced
the bug and tested the fix on hardware.

Fixes: 7c84f7f80d6f ("hwmon: add support for Sensirion SHT3x sensors")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-hwmon/20260725222229.EA69B1F000E9@smtp.kernel.org/
Signed-off-by: Wayne Ho <wayneho219@gmail.com>
---

Notes:
    Tested on an STM32MP215F-DK (SHT30) with this change backported to a
    v6.6 based kernel, reading the high alert set limit register (0xE11F)
    back with i2ctransfer (before -> after):
    
      humidity1_max = 100000                          0x0133 -> 0xff33
      temp1_max = 130000 (humidity1_max is 100000)    0x0000 -> 0xffff
    
    All other accepted values encode as before (checked exhaustively in
    userspace). On hwmon-next, this was build-tested only.

 drivers/hwmon/sht3x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 866e9113f..68ab1cf1e 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -388,8 +388,8 @@ static size_t limit_write(struct device *dev,
 	 * adapted for fixed point arithmetic and packed the same as
 	 * in limit_read()
 	 */
-	raw = ((u32)(temperature + 45000) * 24543) >> (16 + 7);
-	raw |= ((humidity * 42950) >> 16) & 0xfe00;
+	raw = min(((u64)(temperature + 45000) * 24543) >> (16 + 7), 0x1ff);
+	raw |= min(((u64)humidity * 42950) >> 16, 0xffff) & 0xfe00;
 
 	put_unaligned_be16(raw, position);
 	position += SHT3X_WORD_LEN;
-- 
2.43.0

