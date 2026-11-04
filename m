Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804337;
	b=JqFYdmX5twVxkA6S4A4UUqN8lFU2gBWR1AkenlIzPk9HGkIffnQz0C+THHndku8R0PjD
	 +xkxl/jy+S9lB8hZ7eFnjBBmuaAAb9C2APrunv6CxURXY41OyQwm/Z404rJjnp0VbQ3XA
	 1miC1QXi3GCrultenVmqiSBPmA2IjCBLab3ud5IkfxS8+zxzdoaZ7LGYe4ArUDz0DXM0Z
	 Ax+XE4LAvZXMKnrr0BVnwM0cvaIVhR3CIGnZO3krsbpf0kowknKFq3KBfJkGeY+snzKwz
	 raJCEtFP/tYxWZoyHK7CIVe1zCgVaBr/znrn0Z6v3hC6KQ8wQeV/Q0PdDgiyitpySbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZlCHGoRtMbV0sOxoCDUMJOhQ5x4ULZVSAr4XX4def2o=;
	b=VfaIY81Bjx7RCjrk7VVEIeRijdECqf3csh4bb9UwJFxMDDgp1pjkH0/Kgd/VJDoO6ykc
	 8dY/jBcNPCj9d/59OVXEQb0tWVcn1/4FiPzorPJ7FaobMusGqUz27WenYKE+crYzvWX8+
	 IxL0N2WsLQCXy+7Tc8ePJhgwKgY3FlHMnTPZwpkBj86vLwMBqeLMwWQ4XrTndoRWjqdxx
	 NZDxZgQq02jmyi80H1hsM0p3zGANr4KLkUaqrAAXJnyDZqDkeLkbfN7A/pF/JU2UT9ueX
	 t7zwR3rmA/kg3cbXR6YqYrV5ENZGGdzwApU4P348wnYKKB1rLjwZQrFe54kJSTgQKhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RTBZu8tc;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F117D606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F117D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RTBZu8tc
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso552940a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793804336; x=1794409136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZlCHGoRtMbV0sOxoCDUMJOhQ5x4ULZVSAr4XX4def2o=;
        b=RTBZu8tc9ZTv6AtCaet4trrXcWvfn1A+8EG4XmeivJYuWzW3XEQjCw8R1vBs/cRUjT
         Nxudl+1aCdsh49Hzj9MzoiTIXZCBpXQXxQDncIY62iCBpuRTra91eTSRBQ4G2c4Ymu0x
         kxoj9k4VfGCbHMscGnF14gPILbFhYNw5cTek1KnnD6bSCkagg30ey+rJrHeaw8X+ap4C
         x7jBBZqxkVmKfxIEiLemu/uvnS6Szid7oPCyAoNBCbpPurjBkEwExk345aHTYZZYFAiI
         tKnmKFBdTkLTTn5+VDS4ClAIDADuYuXtwPOfco2D8S1P8vsqrPOigtVs50PQ1DR58xAt
         evsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804336; x=1794409136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlCHGoRtMbV0sOxoCDUMJOhQ5x4ULZVSAr4XX4def2o=;
        b=XcP2oK7CAYR7eTdvRVlQQQPVPkLVBuxLk/6gCcpJyVJTvdV9h7SYNpXM/brx4dHJXQ
         MOtA+NMWcKiVtpRfB8HyN58LP06qViVU3hM+eQlqNLGOZBO9ksIxLfdLfjKzCwvS9efi
         zqcSHJNBNaVM1AGnkssd/bLh2qzMyvynFdlP5gVwfEuoglWExdp0BgwJI0bJVoUGfh51
         fQxPVGrifGv+8MGTQ7La/maUTGWsMWobLAKsApWp/qY6V5S9dX/ozg9/TiFatTGhKmDk
         nvLSSXY5Q8VhKAf/qPpsX3i1M91jxIKLb5wcupJHI9pkPLRDFFilHPN7pnVNr/yNGdFO
         FpDA==
X-Forwarded-Encrypted: i=1; AKwUvBwUTveb5mfniCXWq8SyYXPBs/PEUqiZA+ZvltLSK+8tkEfHD0USuY7RkOQfsh1OtTtq+QV6s1OCOkIciJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SBJY6CDE6x40H9Ch7AZY0rXbLVJaS8ZyNqYww/ZuKylNKDIda
	9T4KT8e5XmR8PDeJ0W0BwWM4zX5TkdY5Uevf5YZSQt15ZGoYukJgeNWY
X-Gm-Gg: AYBFou3dnE2xG1AqNpO8g1YdZYv7QCFd84ux3IHdIO1XMvLDxCaKyNqg65l6SEhQJLO
	/wIZCTVuGTWBe9KrsH5bIHSULmB2OuTxsPr1LfbOA+Wz0mdUyGHkER7td08hqIytGlMvtXYGMHY
	/TD7r/3nsMIRvWc4VqxPuoKstBerDw+1qOV7YLqzUHJKx3hFZtQ5ZTSiE+rZTlXqYtdp7+xLGX4
	zY4L9GXTcv53NmKgCG7U5txgbUiw+3BBPHWkrBc9qkGZ4eyPhlV09IJkebSHSj+XKyIdXr3jho2
	ZVjNCOoWtMOBumNRNX+W24/CdvNKKtswZFwMIrw9bzWDZdIRRgGFSn+OgbuWvrTc9ptIXD0dpcS
	3YIDQaSzSWuPc1h8kMdEGTRmbceTgw3DDxaaJswmc/cC/Qj2m5KQEOItUvOf4u4Xi2eK8+dQmCO
	DjMS9iEndlDicZS3ylbm/YdXEA9w/OTW7m8BvhaAVYmI7zDzQQ5oBMObKq4nyFeuglBQVWExkA9
	K1GGvSwsF9jzS+Lmj7k+gAlUXKkYhcofq24L1UIp9KKkZhvy1xyrWg9Lh3fHJ88Jm8/GzhcdlTb
	ULUHkqiAosL9MVku6UQInrtIFTjG3PkrQEqQMRhDGbErzE7k7Jj5fyr0aUGQkIJn8zXkxz94hli
	6FAu1GIBcP4X1tihyB3Ppk3xaxh62
X-Received: by 2002:a17:902:cf0b:b0:2e9:4175:3077 with SMTP id d9443c01a7336-2eb364962bamr175279525ad.15.1793804336225;
        Wed, 04 Nov 2026 06:58:56 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:5040:8550:f5e4:709a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08bd596asm9269185ad.1.2026.11.04.06.58.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 06:58:54 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rtc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] rtc: raspberrypi: do not mark the file comment as kernel-doc
Date: Wed,  4 Nov 2026 20:28:30 +0530
Message-ID: <20261104145844.32361-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
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

The file header opens with /** but is not kernel-doc, so kernel-doc tries
to attach it to the RTC_TIME define below and warns about it. Instead use a plain comment.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/rtc/rtc-raspberrypi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-raspberrypi.c b/drivers/rtc/rtc-raspberrypi.c
index 0547a96c6..657734b96 100644
--- a/drivers/rtc/rtc-raspberrypi.c
+++ b/drivers/rtc/rtc-raspberrypi.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
-/**
+/*
  * rtc-raspberrypi.c
  *
  * RTC driver using firmware mailbox
-- 
2.46.0

