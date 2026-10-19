Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441286;
	b=g79kqzF53p+gwXvrapdzC37rqaMjoWDKkhNESxRzR5k99LbEpeANoPKTD8p7jV+Z5O+G
	 jmliANjeiI35V1jTpJ5uKxDYhQONBh6nzeElHqAA5ogmqKI18SAcfuvxIr9GjB1fYGO/v
	 uKbzhV35KqA3/olrE3mUSUGnrOiboz4rR8kg/pnCZe9ZHpVu3ImGWr5FeIC6NnYucXtgi
	 NILEFPhlISlf5PQ3l/cWELMsL4munsAZFf+fEuq0OzS5i/SpEhroWleQF0ArU4Dp/M5dY
	 PWvuWHAP6+Crz4/ZSqZV8DPGuR8yFderB4d+WPjq2oMgwUkr/UXGm/oIqN2DrKWCNJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5SGe5k/sxuefMjqMn88o6FMTCheBSXX/pG7tZNOtng0=;
	b=LrgFDK7rju/ewRQ0HCysrG9ZnUZlQzlnPCJ8aXlYw4kDKgVPc8bvcFtcgMcEZ87f3gto
	 YfU19jPJ7BTDvm+R1rfw6Jj6skOrpnM7ebxvXBjxEAV5F5k7HVVZ7DEUIK5HRwYUHrSca
	 CfevWSZ71UGpObo7FZp8nOj0xxNItIkv88ZfG/6ChUV0iDcLVbRXfOcD6U2j9En9g3phk
	 bmSGZeIXx7ugipij7lk69l6N6mtsIPzHCvUtvusG6Bjs0wil3m8W726l0CuNE8WqgHnT3
	 Md7RaJSFs2JKXWiuPuPEYYs5DcZRiVWK11etn/V5pzX0qO9j4+vjEUTfkTyf776bP7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N4F39o8h;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66EC606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D66EC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N4F39o8h
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso28527965e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792441284; x=1793046084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5SGe5k/sxuefMjqMn88o6FMTCheBSXX/pG7tZNOtng0=;
        b=N4F39o8h2bRYjS/nBSs4Wut7jXe6vQDCJezCfqTuYfaQu05wkEFpcElLDnPgy7E/aq
         FZMZMaV1NpnBXOQ2Op3ITzaZ521eVpNf/a1ffNEGKSEYQbxNLVhg9Ax0P5VBM5zqvXAy
         j7nwulX6ct8uzCRXsJcLfRFcohmZwnmMHqRaRBkyAxHhVc3q8DQGras8KtOWEFQdP9zD
         YaRK5EOqha5tjyBpEAV6PHtMH6GkxVTBWiQzX08AIcktgQJ3Z4+X3qSpW9hokVb1MSQw
         0HvmvddD+EGwhitr6PZqmtIeSxmsJzv879Pd9kaxE3xTBWYGppR96++2Dj4YIy5bmQVj
         f44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441284; x=1793046084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SGe5k/sxuefMjqMn88o6FMTCheBSXX/pG7tZNOtng0=;
        b=jDm1oSmmRP2sBzcBUC82UB5pbiCrRHx9XgHq51r/hDO+4BxEkf7L9Sh3HchZvKsxqe
         AD9YEv3iuarCIcLJG3c4C/+iJLQ6ALYPvnBrZWRx3S7YcAnu5IdPbLPzjjpHFbI9IqMX
         5w5KBsOlmQBMyPFarZjghs9j3Q1LRrXezB8Ke0B6pCLk3WBZo/QatFUvnD6dGtJHCa4z
         3ZUfcOrnS5HHHPj1QWkhG0M0EPitU122OmlmJ5FXVd/i3ozLnKK84PZBXutH/e2K0+i7
         8twJ4KMIYLnnaZgl6aIgYG2fJPQyWwd9+HecqiugCepcCptOpVAQPYZKoErX5pI/6uf6
         Z7Eg==
X-Forwarded-Encrypted: i=1; AKwUvBxc5viiwUQEsmuEdaIExVWtg5Zns5Uy0sHs3NdwhcbWTTOlwkwn/JQKGeG5JcHuMQI7jY8Ubbmjy72gV3Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlTItwOMcfZtQhgfLUQD+fS5xVu5ZrSea/EVY4CH8Av2KzoeTc
	SfsG/avVTk1r180pBpN+71MM9j4G+RvMUm2fB+RfuRwro/z73PTsUrq4
X-Gm-Gg: AYBFou29EbJiP6PnsQOd3bnU8M3/KSxFRcXWT3IVe/e/qTlw8IKUhsT29Iv4VG8Ho5H
	1+OxOlLu03PEvS3X3Xh0S7nctANP79AduR6qj/E7LPgkmsuMDw9gNqzpeZQ6PsIxFBUojPHcGSv
	XMS3jzYswbeWrUohP54VJhiuUb8bpUmK2h6lLnsvDeANJVcM32gqRsCQT3l0I8ZLOc2l9zNtGEA
	T2klcBviB9ow+4EVIZU1NL+uNXKDyDpTUpANRfL06S96uMNbjK32AWDKHuFxLsa8u6goPTFUfF5
	EtIzoOFdK/gOAvAh7UDZyYIInEKReSWEpLy8Q5ZKcZmLyvTd+ZrJb64Oie7x+7Obrla3wZb7f7x
	AuvLyXcCaN7ndW/zOvbGEyTtiWx19Y9E6G92DlBVAg+87JBLYbV/erqlIYK1HZuQ6tdqXk/8weG
	vALbhpYvu7/rjqEUasEkRPy1K7gCwgaFPP7gOuDozkTYOVLdQznWcAIqUGAYpeVJip4r+0iJCU5
	TT6GnDKQYGybKPUgEEMe2sbYlA=
X-Received: by 2002:a05:600c:4f06:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4a1e69d931cmr119638455e9.22.1792441284070;
        Mon, 19 Oct 2026 13:21:24 -0700 (PDT)
Received: from DESKTOP-0KSTGNI.localdomain ([156.213.131.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817d8bsm943142f8f.24.2026.10.19.13.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:21:23 -0700 (PDT)
From: Temitope obabi <obabitemitope765@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	Temitope obabi <obabitemitope765@gmail.com>
Subject: [PATCH v2] staging: sm750fb: Remove redundant NULL and zero assignments in probe
Date: Mon, 19 Oct 2026 23:20:15 +0300
Message-ID: <20261019202015.1724-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The sm750_dev structure is allocated with devm_kzalloc() just above,
so its memory is already zeroed. Remove the explicit NULL assignments
to fbinfo[0] and fbinfo[1] and the zero assignment to mtrr.vram, which
only set fields that are already zero.

Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>

---
Changes in v2:
- Remove an accidental duplicate of the note at the end of the patch.
  No code changes.

Note: Greg replied to my earlier sm750fb patch that keeping the
explicit zero assignments is good because it is clear what is
happening. In that patch the allocation was in a different function.
Here the assignments are in lynxfb_pci_probe(), just after the
devm_kzalloc() call and its NULL check, so I think removing them may
still be useful.


 drivers/staging/sm750fb/sm750.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb217b..8702f6313f78 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -969,13 +969,10 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 	if (!sm750_dev)
 		return err;
 
-	sm750_dev->fbinfo[0] = NULL;
-	sm750_dev->fbinfo[1] = NULL;
 	sm750_dev->devid = pdev->device;
 	sm750_dev->revid = pdev->revision;
 	sm750_dev->pdev = pdev;
 	sm750_dev->mtrr_off = g_nomtrr;
-	sm750_dev->mtrr.vram = 0;
 	sm750_dev->accel_off = g_noaccel;
 	spin_lock_init(&sm750_dev->slock);
 
-- 
2.53.0

