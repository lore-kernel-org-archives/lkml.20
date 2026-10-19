Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422630;
	b=PQO3P7HHGe1vZ0zUAGS6W15/CT3arJ5lKQ1ZwDVZpmd+IWI0wozuLSGxrnMCYh2xz6a1
	 ycFX146ir2Jz8Bd1Rb3NhMZJrGIoUgjld4BM4EZr1oMNlbQdntZYf371M5gDsthmzJC7v
	 EFFpogs4FRAETjsO1wvC1+Sk6BPnEbb2RkyASjvnwihC0vW7bwoNTqT+vJsDjzmAc0nlq
	 lyPdOL3QJfHadHd9bUN5J5FWQTZVhhAiXW0Xlddn+44YC+2KxmCke939Ny5H9YWwB9gaM
	 xRJRk1exrjlKYZyovdy2L2QEoIn8JX813qANzs6GUq/vRdsaj8zlRl9D/e9BYajuC+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FXba2O0+JLMWs5otkIxip4NSbpwiNVRyJWBXXY257PI=;
	b=3/DsCs2Kp6v2+n0XEYieDAjfQqb4J+FvLtQgaTBvC9GKbdd5+d/+nD0CtE8ikj0QNsqF
	 isZ0dl6gWRfZmY1hFAU+S/bWRZ7DGMGr+e/Vj0mBvJyWisN0UKN4buByNX135i0x8KQWs
	 zwOc4Qt0WGEteCSaUS/CBL0mWZZeB83AW/e6Cs4yKSGxUjT+Xany6bp+rdEDveAZrxlwL
	 wNa5Voqo8ooZwZoaVx2e5nDEBZbK1BHPXMTXgWJ6AIjZtDhG3q/2hqFVPHQcy6LPxq+LU
	 wTtpf5O/YKBR+9vZh9KSNTXQjeAgis8R4Q1U80Cbob1F3scRjgXClNmpPbWRgLYDyRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=phj9+v6n;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDB860882A8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCDB860882A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=phj9+v6n
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e95bd1c14cso18252965ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792422629; x=1793027429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FXba2O0+JLMWs5otkIxip4NSbpwiNVRyJWBXXY257PI=;
        b=phj9+v6nrHvgpDf33NzYqW5nOaeKOTmPMbT3+sRePhKuR5fEvkMx7NSIFehclo7MeK
         qc3FEKaiId5qtu2KYeH9qIqcGJtISczggcJ4r4vXxZiOOtddH+WBA+cldatKaHCMoNn/
         Pb2O359AkIpm3QyC3xvYsrTZI3BP/Bjt4RvDtg5uH7BqSQH+4ZdkW4aR4lG+6n42OaQp
         dPR6XvyTcfAxKj3/xAlEUL7HSPdlCR2Jvnz1g1LChT32iIVkBojoa6L7DLMviWvUhI/F
         Zon7FmH/iTY6IKi7Om3k8C+P7Bp7B0O3+gGYoph22hjv5MXdgbJVApkUiHSSOFxrQ1Vl
         7CsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422629; x=1793027429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FXba2O0+JLMWs5otkIxip4NSbpwiNVRyJWBXXY257PI=;
        b=Tlb+28DqwKFJH7nXvQCTXgcvEzW9Stm/iR6OkNO+tD9MzMXQCk5+NlD8iVKJ7nvqfA
         8W412sFhPfqC5V1pryeAoXOrp4aknrzS05GjJGpMST3x51PFXEPW0dchFIVfKLsnKmC4
         zC0XBzkqz9nIhdtNbPXmAT5W2RzzhMz2nmFQJira5Ht+dScI0zIb4C0+ASyV6LvxMn7Z
         u28MOpkAvqXt+EY2r2ZgjkLML3AZDF6NL8AhppiwHcLB+VZ+H3Vs6sGZGFMpybd3lDDr
         K5s8P9mNnEFPeKwNUaN9qog0+8iO8wI4/iNA81YUmNrhMpdBzITEgYS2Ln7dKOmDwZQC
         ME6g==
X-Forwarded-Encrypted: i=1; AKwUvBxVs/u8IllvLjTa9Ysr/KF4zR95o994jstm/G0wqSsW+YHCbZXiGInZnS1oNU2b9XlEJN1HFYwtED5Iosw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBTILRsZcma1fIcvuxMrfon5XcWn6A6+h1pSykvR/YV2jC5j64
	SmKLuDiP7QYt4d2TEr94hiS70AXD6apUXs9GS+duHGFWoaXQG/ZIYCQl
X-Gm-Gg: AYBFou0uvIdxz97dRwZMiOYIxPuvkHVIHpp+XkgSmL/Jm3/tCQOWTXYEbaUp0DKN+/G
	4Qabs61T+3Mz5RAqrHIfX5BKSCKlM2l7/7pgZhPWNTTdnJW4uuXKiuPikWpI/2QaWQZJQUfvOS6
	MSjxSFmoEs2pY9yrEBQ+GMHmPvp6Lej+DQK3P/ThBsd2zUaZZJykC9Mxe8EnxWbk/0LQCHv+Ydm
	IXnkaS/SXawbPJamhdXRlwgnihINfBEPKkY3SsrcSiOi2PeUEgezF3vnMYEkJEWQ7CQSrSwnuG9
	hnI6AyP2ouOTIyQ2s2TkfhZOgLmGf3ZqNDySzv2X1GCu1X6quYpHWd0pUFB4z0N/SAydA/UDKxo
	mhyg9pWWMGlkfbUh1TQh5c/kFK4bv5htNXdtXEWausdT5MMvE1ngEiBcdJNN0H3PpCn2eo3Mjsl
	rKRiGqW6hAU/VRU9ovJNSmWbffXeS3liE3bL2zfYSOhcqyK9w4jsWaFsIFac8qKJ/+ZD1Oj70NP
	+1C6u0Ni7ciT/gn2F8zjEEDOQ==
X-Received: by 2002:a17:902:db03:b0:2e9:502a:ddbb with SMTP id d9443c01a7336-2e9a6c201f3mr70422375ad.45.1792422628968;
        Mon, 19 Oct 2026 08:10:28 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1501e25bsm2625435ad.45.2026.10.19.08.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:10:28 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: mpfs: Fix alarm register word order
Date: Tue, 20 Oct 2026 00:10:24 +0900
Message-ID: <20261019151024.2232338-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

mpfs_rtc_readalarm() swaps the low and high words of the alarm time.
The RTC core reads this value during device registration to initialize
its alarm timer. This can populate the cached alarm and timer queue
with an incorrect expiry time, or leave an enabled hardware alarm out
of the timer queue if the decoded time appears to be in the past.

Read the low 32 bits from ALARM_LOWER_REG and place the masked high
11 bits from ALARM_UPPER_REG in bits 42:32. This matches the layout
used by mpfs_rtc_setalarm() and the low/high assembly in
mpfs_rtc_readtime(), so the RTC core imports the programmed alarm
time correctly during device registration.

Fixes: 0b31d703598d ("rtc: Add driver for Microchip PolarFire SoC")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested with KUnit under ARM64 QEMU using RAM-backed MMIO and the actual
MPFS RTC callbacks and RTC core registration. All ten tests pass with the
fix, including importing a preloaded alarm and checking its timer queue
entry. Four additional tests covering current-date alarms also pass.
No physical MPFS hardware or suspend/wakeup was tested.

 drivers/rtc/rtc-mpfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
index 60596b0ea9d8..6616ca1f02c7 100644
--- a/drivers/rtc/rtc-mpfs.c
+++ b/drivers/rtc/rtc-mpfs.c
@@ -131,8 +131,8 @@ static int mpfs_rtc_readalarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	alrm->enabled = mode & MODE_WAKE_EN;
 
-	time = (u64)readl(rtcdev->base + ALARM_LOWER_REG) << 32;
-	time |= (readl(rtcdev->base + ALARM_UPPER_REG) & ALARM_UPPER_MASK);
+	time = readl(rtcdev->base + ALARM_LOWER_REG);
+	time |= ((u64)readl(rtcdev->base + ALARM_UPPER_REG) & ALARM_UPPER_MASK) << 32;
 	rtc_time64_to_tm(time, &alrm->time);
 
 	return 0;

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0

