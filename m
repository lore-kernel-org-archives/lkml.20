Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792952377;
	b=yhAJ+2PiSK4eDghqjXXsjzibCUA0NqKr857JalD+VdQsFTeXTcr/DZvtdGXWe7JLgDN9
	 c7Ue+nlH0wnPeWelnBp6yJL1xneLJPEcboIhE/qmabhYvDEA+vGdNz4GzrkVI0xGqyjbP
	 cSJU4ueCKuXLh0b40GtvdyHMBCDRnsa3rgIp+IcD9qwAtHEBiIrqmvjEqDPtulyh5vuMa
	 bvN6k3dcjloeQQPxrzYHmBtkGU2Hzk9nz/MjV2va2lLCEhVpdPdSPEnHBwfJMDP7lxjrB
	 C/yLtvyol1dLWC03tSErd+ZYFFgV9o+gK6+RedWDqlVWMoY+HlQX9ptyG5gKRkoq1Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792952377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xHkFulZhzfdcytD8jcm7yE8C0cb0+bXKg5xNAHor0g0=;
	b=BIMS5w5mDcoElHVvEuWQoH8PE9F0Ti19DMg5yryI3QtavRLNR4H95PVPQEHoEmP5lM/Q
	 Lm4z23U3X+cItDkheRB4Zk+Iz4fr9SemCPRLty0kZp0v7adP6dRRkBaidT3M/TkPdMRCZ
	 rF5Y9aL3V4FiqbYjV3q8cdcUryGNtMtTT3iEYlPUVn6ds0wGJEQUAl7XwaGC1HtW9X7kG
	 cD6LU0cn0tofOJ8tittLhkhZwdPGzo13OeHtugfJoodG4u8OcLvnlKWOeXkuXvqGqrhmN
	 s9tRb8EvS400+T9y+nuqochbfYjhUh8uAqVtGv/j67qCvtotyVAMyMTZdUT8iELhMmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c3D17ued;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3535606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3535606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c3D17ued
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso18581545e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792952375; x=1793557175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xHkFulZhzfdcytD8jcm7yE8C0cb0+bXKg5xNAHor0g0=;
        b=c3D17uedB/11KdUwEGzKp59eVMgf3RY2OyN+Q0UK0ghWGfxp/v3Z8S2trNNM8sTub2
         /rXLNxmQ21QLKtnif7yjDkKDyyEaDBczbapqUnbrhi9nlvocrChT7laHS4wHqoOwEI3g
         Q/EUXL6NTVpWjocnKxsFTGCKX5jb4ko8BRyeB9v3YBSut5ij0P0vINLMywww3mczSmAN
         uSfpjcQWwLr9j9ZfvdoDYtyUua+3cMVu3xVXVshS4VQ/JZvBQcn5fWMBZBreUC4TgwRh
         l+3bRVhId6ErXkmQVD80gjzKfcrb6XQpDcypAQt2TOm4SJ0u+NZ5fzC7ZhOZgUMezeck
         g2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792952375; x=1793557175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xHkFulZhzfdcytD8jcm7yE8C0cb0+bXKg5xNAHor0g0=;
        b=mnxqTHWy8pg4bxIPCVk8cvIhVGM/ZN+70CObtEJTeUX/nduOP1WJkTHzMJ1nrWl3EM
         Oe1EnU79nsNgW/yObMQVDkzwl2rxegwirPGWRv7oCr9b/QwnpuTbecKctKe0HxXnobGZ
         J9QenxfjwKtBf1Bqnv2LEZMMLpDLf1NItEeMvdWItnwHy4/qDk+QxSWjPE5kjcas+kBp
         eIggE1DfkFblPs2+21+O2ChQKBMEt3OlVbOIq+wSUQQiKPgwvyzGJ//AhZJGDP8YPWB5
         2zyIgKsVGuHzlb4Wp9lflq707pRhpvoOBCN52+gRWzwgHe63t2I4CgAujxVd6MNUX9lN
         yLWQ==
X-Gm-Message-State: AFq9FYJ/ZOhIfDwrTG3q2cCZE4HKS/HkONoEqpV/oc+kf5caIhjvTLS+
	APxrlAbCbJ/LhCGRavZoiF8xYqDIG/iv12tK9szUbmtFf7R8tLtWIro=
X-Gm-Gg: AYBFou2U+oPwccdJJ1C9jcmBU4CQgpD/jroxeBfMxMPWKo1EP2M9reZYIsr74zECotT
	3Qdu28rjmi+3QLXEBPnKh1F60AYdrjxNSNqrCzzmIJz9TW4EtPbWqb5xIl617BhsXQph8wa8E8X
	03/xi2QCybO9sjYkAR0fSZWF3m+JEZyfRHSYjiwnbDMkk82V3VYnebgo+LicOyc7h0ERHSfxJrP
	FxVj9k0IhZovBcQ6B8EiuetdXoP6dd4QCD9pXx6+E+ji4V68P/IgsbJKcf4EOz+ItfNQjVRfGQk
	Fd+7YBSLRv5JzOCcwlbTd0zcd2fU5Tb1BsC8qh9dMgJcp+bP0xv4M6vgVGC4BX0sZ+VgC9/EOXD
	+VMAcDju3VPrzxjll/hr4GglYwq6K0ykIavZXk1F+G5RZUBVTOBn3KhjS7jE7ztCfx/sEdjxJhI
	2iNklgoYP8CfyLG9u0AocNV8QMQA00FZs8dXe4/V3Y51YNV6u6xuGYztgEbkTW1qk21/GOZlU80
	slXIcvSeaqNjG0mbJr58Udbt9vGGooO7AmIy1k=
X-Received: by 2002:a05:600c:8b2c:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4a35acaa6d1mr86565045e9.27.1792952375238;
        Sun, 25 Oct 2026 11:19:35 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2c0458sm136103515e9.11.2026.10.25.11.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:19:34 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	ajay.kathat@microchip.com,
	claudiu.beznea@tuxon.dev
Subject: [PATCH wireless] wifi: wilc1000: zero-pad SDIO write buffer to block-aligned length
Date: Sun, 25 Oct 2026 18:19:33 +0000
Message-ID: <20261025181933.3775301-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

wilc_sdio_write() rounds up the transfer size to 4 bytes via
ALIGN(size, 4) before passing the buffer to the SDIO controller. When
the original size is not 4-byte aligned, the trailing bytes after the
payload are whatever data happens to occupy that memory, and they get
transmitted to the wireless device firmware.

Zero-pad the trailing bytes before the alignment so that no stale data
is sent over the SDIO bus.

Fixes: c5c77ba18ea6 ("staging: wilc1000: Add SDIO/SPI 802.11 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/microchip/wilc1000/sdio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/microchip/wilc1000/sdio.c b/drivers/net/wireless/microchip/wilc1000/sdio.c
index 67dea1360f0a8..1a8c7ffcba496 100644
--- a/drivers/net/wireless/microchip/wilc1000/sdio.c
+++ b/drivers/net/wireless/microchip/wilc1000/sdio.c
@@ -441,6 +441,8 @@ static int wilc_sdio_write(struct wilc *wilc, u32 addr, u8 *buf, u32 size)
 		cmd.address = WILC_SDIO_F1_DATA_REG;
 	}
 
+	if (size & 3)
+		memset(buf + size, 0, ALIGN(size, 4) - size);
 	size = ALIGN(size, 4);
 	nblk = size / block_size;
 	nleft = size % block_size;
-- 
2.47.3

