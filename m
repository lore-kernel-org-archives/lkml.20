Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602555;
	b=rZLi+NKsszmSKrlIJs/hdxPT7gBb2m50bCc2TctlTX8g9qIy/Rkk78Z/t5yTwSESVppk
	 UOViduLAT76QAV/cGpQWwCUcuE/FN053ZrExXPVeS2oqsTyI0kpDKQtQia0GqDOVy06Yy
	 G5QwqI+ud5r6r97uUEleGppYEwKpiKmcO/Ss23Gn8srebiI9QbUWqgEXj1qcWIRHzFLJE
	 J05ah5cf6q2q+mQvQZVGtpZhzwDGLCmzZ/EmaVBwpOi9ZCBB1pCS/Pe+tQE1wwbqt7swy
	 GW3MQazIkLeZhPQygbxwLCGOBNHllZI8lsmsKZENGLJiutQrEVK80LNa9+k8EAymVcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kUEp7xcckn2qvmIvpQkkjMCZNbl4CYX1Cj+7Vm+f2qE=;
	b=45OdyRikDUTysIvrJVTDc+paqxbwZiPEu/lZmfcgfSZF2E7zMGae3QAiZE8cyBXSZNBT
	 bHGFMEz+dUuasq9mw2G9WM3Wd489ZzUDzyItvJNwQmeJ9hrXF5gs3fd8XCaFl6kHAeZb2
	 eINaPcHJN1PLnh4E2SxfIanitoGwP7tg32zU9uZ6Md1jU2+uAQNmtpZX3k7rkcKVtjMqf
	 OBshx+1KeZRyYPicIIIkx96Vrcr61lZFO9oT2cU1S1UVhzME3g5PqBiUWLvbeWTzLmGQ/
	 PHf30VyPKXXMaTfUmezyvBoeDWzvshhNBzxDntnEmA3hW+/JFF/j51dWhwjmro1Wwjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OBO4vWCY;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA9B606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAA9B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OBO4vWCY
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-19305bcb72cso1804663c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793602554; x=1794207354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kUEp7xcckn2qvmIvpQkkjMCZNbl4CYX1Cj+7Vm+f2qE=;
        b=OBO4vWCY/t9c3qd9fiPwYs6VYMsoSOjfVCpcr9GEbZhiV9XGu3LUiem/yKCG4pPTvZ
         86+zXLL2LONr5jAv7aXyGfWwVYxswFQop/mqHq8dIo+kBHmWCTiGDn0sdlneTU5Xd7PA
         pmeCp6FxFEOC5NwV+iop1PresX7ChZvFliKeW5h+KgNP1/BnL2wyRsJse29BIX7sSx0g
         R1TrBAmXx2jhbBwl8mqxoXyCG23CaQrs4X9YC3svAy2HP1/6xUB1je+CpPFBs32Y9+eG
         F/Er5lSWKGtdeKWZbSlTuUzkyTabLerDnFcSg/dy1RPUF1MuCDGVeoPg6x0rOrPMj4EQ
         IZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793602554; x=1794207354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUEp7xcckn2qvmIvpQkkjMCZNbl4CYX1Cj+7Vm+f2qE=;
        b=nIP1fkol7eyKxQDYSjow+vH44N8EziGmQyn8euqGfFpqISeLGmX4WFBjb0Tgc4IEQw
         ut+AzPNxsl+642exaG2A7aqdqSPJPXqAKngg64oyEj1OJNMJ5R/muRIvLr5ThCj7q6Or
         UHdz5VGy6Z1LNCf+U6n5xGnEiDfWwTzdZUr3SoUgixOO4RVifIJQQDh6+jgEUdgmPk53
         APmitvOYGA5zVi8GaMGOI+bXkrGv0gbk7ch5SlvjPy81ZAt+yMEeYVpPQ/R5J0mfsEDB
         Hxwh+QL12j6ZXT2T1lINFlXyUJmiHK5NFZpFvxfIMCzrFmRKZTOBZB7LIWokhpDbMBY5
         gOnA==
X-Forwarded-Encrypted: i=1; AKwUvBwp4PMk9eWrMY27cux6U9U6FTTWo/zjQsXQM6ZMMFAUF0Q5jq5JspP2CrKCiyT4vidgQnhohOrojYi0kPI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP4HBabaFdHyLslcQmF3Ig7beeplWGIzeJatMhD79KoRy79FaV
	fOEzKtl+2p1oyyuFSO0j6wdRH7fvZM+dft5aeP+RoSHSltkWJpUbZCJQ
X-Gm-Gg: AYBFou0F9epG/ZG6G5HpiXhqIOod349gZ3K3sZx7qwFdJq5gRyEioGOhUHSM6HoWzHD
	T2AxwhcKjawEXV5NoniEu3/oIwG72+NjszlnpoJ23In1U5kG0o8nLQxoOzUv7owgtrvGUZDMHnw
	iB0CPS5NWodWS5ionokbVxVSh+qPxJvZa2hLXrE1xba4/fXV5TpoKls3nIrn2uIMiuV+ihpNxC+
	LcXDCtcarN7WXFxmxka4P4Tx5GzcPn1Ul6dJDJn/hKRO5fcSsafrVhweByiSdMP4ulp/5v5Wcwc
	8xq6/hVRtvTjQUOj7HEggB2iffqc0WCLR/QChAEvRTHTUlvGhS+9UQvjkL9bkCv9GyjYPQn6h0D
	1T5GN0qT4MMoaNrT3WAqspMf0aO+4dkqxSBfIGW4T1GH/z68pfDzbc1EDpLV/apnZEeDOYnU/F9
	1bueAMXOmOONZMZitvsx1R9ErO/PNG52sFo5ThaYSRpgQ4wyUS1vQacCYqpef2Gg+1GkttHSNVT
	SkZVYCOKwYnIzhZyvKKdoykwDiEa7WGj+Qx2ddhj0acRa4xKL8e9fYtYh6wDu19obT0+w2zJpmG
	7KnZFWkzHQjC7l9cKZBtCnMdBjG1Mt7tu3eV1rvkvAaMm4HFQXPAiS6SjozbPpk+OqoheO1m
X-Received: by 2002:a05:701b:240f:b0:15e:6541:3099 with SMTP id a92af1059eb24-1ac5a0b8b3amr12928681c88.7.1793602553702;
        Sun, 01 Nov 2026 22:55:53 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm35819029c88.16.2026.11.01.22.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:55:53 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: o-takashi@sakamocchi.jp
Cc: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] firewire: Fix out-of-bounds access in CSR iterator
Date: Mon,  2 Nov 2026 06:53:34 +0000
Message-ID: <20261102065334.3087-1-sreekuttan2156239@gmail.com>
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

The fw_csr_iterator_next() function reads ci->p before
checking if it has reached the end.

This can cause an out-of-bounds read when the iterator
has no more entries.

Check the iterator position before reading the entry.
Move the pointer forward only after reading a valid entry.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/firewire/core-device.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/firewire/core-device.c b/drivers/firewire/core-device.c
index a68100d3da0b..36667841ca3c 100644
--- a/drivers/firewire/core-device.c
+++ b/drivers/firewire/core-device.c
@@ -40,10 +40,14 @@ EXPORT_SYMBOL(fw_csr_iterator_init);
 
 int fw_csr_iterator_next(struct fw_csr_iterator *ci, int *key, int *value)
 {
+	if (ci->p >= ci->end)
+		return 0;
+
 	*key = *ci->p >> 24;
 	*value = *ci->p & 0xffffff;
 
-	return ci->p++ < ci->end;
+	ci->p++;
+	return 1;
 }
 EXPORT_SYMBOL(fw_csr_iterator_next);
 
-- 
2.55.0

