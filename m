Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793516738;
	b=21yxuuy1Bq2pWois++vlv5/iAnduQ7i8iczOF2I/jBVJ7no0Djz9m/4yK+AoAEzJuElD
	 eItel8uP81jwkzjfSxtd4teb6m5Ce56DAcZHDx/w9AeAgUxz8HLw2/rs+ruobdaewBhEc
	 b4Ib3Mil5jHTYh7u5WdiQ3+a9ci5jISM/ywbcIQqpKYCgm0aZH6xm5oltdq/78OT848Jj
	 aqzUKvy8TP1JmVWpQ8Jj0IepkhAWnX27eaOzke8DOrnSK8BkNysI0sVxDEssXGAMhJT6a
	 I7Hp/qjzkAl6B94+YxDf0JxIjYnAhtRqd4IkqAeamWLL5A8YYiXYIPUvSayBxIhEMOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793516738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xXObFxvyVf638rF8Lwj1qoYtZtoDvpGbdlBiWuPOAow=;
	b=Ihg/p+drTAJ5lyTQagGzslTD2cdqaRHrTwh8RDj7Fc5kPFk8qIdWTmXQp6MWXL/b7vhN
	 0cgVKl7pYnOYhh3u/KSDZbbd6RbLkrI6L1ZlGey9sCDaHsuP81NFV3X0EnIsEkgUj4CG6
	 ngNK7awjzxmicK8dQt59uovSeIOW5qz8x1xrezDu3bBkaDK4bvVyD+G3XWbkIF5BZUW0B
	 cEap7KttCp2/8ZIaY3HdLBw16Bdily1/Ey794kapPiwzHXrWSkFWip8SUWIBClyI8Cffg
	 /FQMOXKLqZH+0aou4PudZrFBBwUtdsT/IPf4Vs1z06J1bchBjgdfCkvKkriiqvj6cHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9ky0HVc;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23161606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23161606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9ky0HVc
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so25735275e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 00:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793516736; x=1794121536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xXObFxvyVf638rF8Lwj1qoYtZtoDvpGbdlBiWuPOAow=;
        b=a9ky0HVc/Kqk2Pf7E3jPBge1cZyVSmvG7vCDgL333pHwk6Ne6OKWikq6zr8hUeUaep
         19g6O9XrwqKo5n3yy+6MvRrydpgYQOEhQZdT4INArkLsB/WGU1Vkkeevjxe/KUIp180E
         FsX6emNjX9ov0RsIxofIs4S03kWvSzsodo1zxwR4bAKXTod4yX8BLz3xDeTl1hy2y2kn
         uHw0ewOJbAtKZOLVWkA+wAAmhvyQOCBsYJvO5BKB1GggBOftGcSzPU2rhYIxvDWOe55+
         so/SAsO65sM6m5QKLJ6bHl7nnY5lU9rIhehy+brZdyKkv2sXiGs88UmbvhZhwnpcFxxR
         +FEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793516736; x=1794121536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXObFxvyVf638rF8Lwj1qoYtZtoDvpGbdlBiWuPOAow=;
        b=aTFQyEmM1xPKbAaufUvAl+zRVGXjpgSpYlf2gVe93Fvmji5boC8/f3YLjQmCd0MtL/
         KNBbILwLItR1EgCOPZQ/y93IbAc5c/ErYoQGMTNti0V/UthCEJXu38r+q6C43gkB83wx
         51m6Jicx5AmzuE0n2iB/d93xJD6Ke3YciDLmtIGKFM6upMdItVaimUwn3D2h/KH+h5/L
         3d/PKKQXX725g2JMj3K/SErqEAx3HYPEBvv6p0I+Omu2SCYzKBVBrbW/6ETfAeKUnGYx
         Mide1f03uLzhdD6CeFAC4VpR7AB5MAqrndAJHA7XKf5q35UOjoHieDHsrTIgR1X2rhRz
         fnlA==
X-Forwarded-Encrypted: i=1; AKwUvByEGGXGtOwD6RFuwpM6E3x/rV1jQ7DX1u5CpBlNRp5oIApT6D9/ykwxYbg0gB3FMtLjgZx+DEtr2nzfcFA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9H0PnYVuReuyuavccgou0VKYK0lzUJBPYHLqH0mG21cRhfoqw
	/Bjye2jxSaiEz+zfRWh03nOdKMseYMSFC6jPK75L482kzq304GJL4jGT
X-Gm-Gg: AYBFou00MIDSM0OTcNFtRwPCmf6YIn3SnucBZt/UUPAi0530+fw4OQZDtI2dkwQgGc1
	aF2wcsmhbdKqzPxkKCJ0XtpdOvDCoHU8o0xVPMghnV6F3M45QMxFLiHmb92BKOnYPuWrGZUCkX9
	EscF7okgLVxNZ6NVHZO0Gg7FL6EGd94HapXJlJ0VasaOnBpr4nwGGhOdyU9Y+Ycf4+Xuoj+v+Du
	rmKsRvDFdSquOhoGdkZtBMtd8K1pgOuXAwy41E4uZZ/ElNkCl9nf4ccAlrik5i8OAU8lfSsDDng
	VmXcC86wbnI3ch6gt5pS0EDSKckuzLjzVinOsE1X0oISU3t0nf1k60vLhT3/k38/Q2DXc03tusg
	cGNVyWNOnyo07UwWR77telreZObqxCp70luhOIXFUVjh3VLQ27Nt55VUA8P5uw1nKjv9JATW/AT
	elkqg9XsAd2RnJRE8xw+g9jBRk/Q1yFHrI51ZG/Flr0ikG+ts0xYPzsJ2t8dO40ysMkJqde3i4w
	G6lv7jSlOCsOJo1MMvbvycay1ApzG/e744J2xY1plhXwrmHlENk3ZTJU9OSlfRJVBZWXdqHH7Om
	fXiN5nxCdCVg96CWAzesFkaCpml4a8zWQEmVQ5w7UiU4aw==
X-Received: by 2002:a05:600c:5246:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4ac16acd947mr163406115e9.4.1793516736270;
        Sun, 01 Nov 2026 00:05:36 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:1f0e:d397:58dc:8e89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a762bc1sm82006195e9.4.2026.11.01.00.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 00:05:35 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: tglx@kernel.org
Cc: radu@rendec.net,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] genirq: Avoid signed shift when probing IRQ 31
Date: Sun,  1 Nov 2026 09:05:32 +0200
Message-ID: <20261101070531.192212-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

probe_irq_on() uses a signed int literal to set bits in an unsigned
long mask. For IRQ 31, the shift results in undefined behavior and
can set bits 32-63 on 64-bit systems.

Use UL suffix - promote to unsigned long so we set only the intended
IRQ bit. Current in-tree callers do not appear to use the affected
upper bits, but better to clean it up now for future correctness
and safety.

Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/irq/autoprobe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/autoprobe.c b/kernel/irq/autoprobe.c
index d0af8a8b3ae67..a46376373b3ea 100644
--- a/kernel/irq/autoprobe.c
+++ b/kernel/irq/autoprobe.c
@@ -88,7 +88,7 @@ unsigned long probe_irq_on(void)
 				desc->istate &= ~IRQS_AUTODETECT;
 				irq_shutdown_and_deactivate(desc);
 			} else if (i < 32) {
-				mask |= 1 << i;
+				mask |= 1UL << i;
 			}
 		}
 	}
-- 
2.43.0

