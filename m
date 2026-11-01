Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793516524;
	b=riTPbrmrispDJlqMxXYHIgIZV1KjZfvFSNAXy8l85bFOgTJlQGrl9gb+bDhOC5YE/IFd
	 EJ1f3c80TqUjXE75uwrc75KqvLSKY6ctZ83kiihy3KqxCPqEXgOwpJ/brd6vgrRMBHy84
	 bS0FiSKJel+hdyikAoS2OVG479b7j52/M+2VYtvunZn1xwHA5jo/Upsy5ZKXaQQkYxt2S
	 cM9/HoQ+ZgnM1YCXbnI447m6Mssk6vbv/WigsgshMk/pni2RxDUEFTJtS27KJDhI3N0x+
	 o4VpXHm5ujJ8LMp4E0paDgQCLqCGXDImXRMcLA1X7POVIRBzkSu6enN0wi/jIqd4Hcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793516524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VoA8ZatI3XBB1U2/SoghhJIwCX1MF+HDGH5+WILuFZE=;
	b=TRthOWpcarSJ8gK+ncXRgmX379XTSEC3Ikk2e6L0uhtgGBKt5sORiRuIi6BQpMwFJCT3
	 8kQEyPGAsCiGe0ses0glOnG9N/shvdzaZ1PUOcX8dQ4kn8tpsf61KMB1RI1Z0cI2eHeVl
	 pwYxA1s8md61KMRxn7f/7AFh7zE7ec5eUqtevfLgIAaFmGXIimRKS+Ofg11XaKg1n0JC4
	 sb6icnJGwmCxygj++C9Iu2xRTxXKYS1iYeWVCYNMJQ2pacmoAl/tHCZfbaal/2FXx/6XO
	 j+diy1mUefuUDSMnERTEFmKJu7rjaG5CLuHfE5lrvFs0m6gvZaarn7wLqS+W4JVcPVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kA7pPlvQ;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB9F606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB9F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kA7pPlvQ
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1438d9363fbso1499664c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 00:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793516523; x=1794121323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VoA8ZatI3XBB1U2/SoghhJIwCX1MF+HDGH5+WILuFZE=;
        b=kA7pPlvQhwhKLULELE5/CBmTp6vqr0g/M9TexM2LeVp9dPO9ABH1M4zgdyHVVZbk6N
         qTEgz50ffPFUotLCboKfkUH7o+y4+6IzZitVvgh7aoC/G46G/KCoEjjlmUTUEUW/q2VY
         bo5xHEwakLulV4Brp1f+dgtaSQJPfIeR/9SVaYbbwFZLkbANlLT1QIU6UMYepxMJXF7c
         gFl2G2bLcC+vX/Qmyl38sRA3cpGG3ItG9cmgVnMrQXZRu2gvoi8guvfhWGeF+ZEoyY1r
         SiHje3WV1sJz6C5EvKz1YEZqNRtKdfFbaOQ09I+jPjdFXPJfx4FQV+shoQJ1nhAHJZEq
         yKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793516523; x=1794121323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoA8ZatI3XBB1U2/SoghhJIwCX1MF+HDGH5+WILuFZE=;
        b=RLB73fTg/4wqwAdiUUwGQXVLLbomEf6SwSSJCZLaq9SE6uj9jEvdSXfg5J6kkY3KEA
         cYg32/3PiPz0ekMEBzd3305oKfYPAe4M+9Kb5d8nnh+hXBzpO5vShg+t9pRjHuE4fNnx
         B1/Ip/mDC1EWcD79IZgpREj0PFggSeXln9nwepgM41VUXwK733H1CSbmWcG1IRdohrPM
         +m/bd68LZ+RwuNPZTB+C9keZlF646grmtBTiHEe2N0f6bmaKbcmBecfnWMf0JiGMqPn2
         /3/aAzHzXdX7KTOgylIdSlmVy05H7+19XidGjNNBqMX2aisYtxcINe7esxi+E1c4wwHr
         ZCMw==
X-Forwarded-Encrypted: i=1; AKwUvBxMt4UHQha65MRKUWYM/AYUDdA+auwZnQmT2KNbBXfZbvBCHtxNEkhs68qu3sPsth519WbciQrHXR5xqoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIygW2oqU5n8RjqQAj0KNztln42GFSPhP3AuO5ES962+p1Y7wo5
	MCDmYe67iXGgywdhhn6MQxNVHsowZEdjt6D1imL88Ach8wmt1Kh9rYlu
X-Gm-Gg: AYBFou27IJSbyY4akZZ80wLWaCD76qRWEiAyTK3Blr0i4gYEeijG5/cn6BfSokBW1/G
	MvuhoyU2bWDEXU1CerAzoXWXgl0ZcsTxEVD09bLv7hSU5o8uDP0WRUWtQksBFC1a3ghlC0Go2Z8
	XzMvn0BpaOgw/fvp8th+JfGhH1Zredel0980jydqoIveg/Ep205FN8pyLTz0BOAS0N8xqu9Ifp/
	vhpFWD4nJTm13JiP123/rmCpGaFUI8PFT/Mt9D0dl+5FcIPuBzvbZFq/zDITMCexn5GQ9rYNrlk
	C0+JXKM4awxbg1/8gJxe7Nv14DaffrRsXbE/74wiO3BnYKw9mQGja7da4V4LtKXFEJ6+8BNHa3G
	E7W0d7r/DbzloMoMF7LuIBAdCveTNggXJWjTVQOjRrVUyaZJMKy0gMP3XDoEWl4vAG5DVO+t0Hu
	QNu9WuMT4usQOSgV0knKEk8/AJoTOsVC1+T/YoupcIPguzkANCwPsDgxC34oGPqPcSsbudSKe1j
	bMnclER/6mufHHQXHsuyiEfRU17MW+lMbZJKFaj1EoITEebRTMJOpg55bzuy+irpQt3ye5LhFQ+
	4YFq2fUHt5uV+gBcHpEp+kk2YHWFzXkca2lR9Db+89ra2KpcXAoxpg==
X-Received: by 2002:a05:7022:7f02:b0:156:d588:c881 with SMTP id a92af1059eb24-1a9420e36c4mr14043652c88.2.1793516522423;
        Sun, 01 Nov 2026 00:02:02 -0700 (PDT)
Received: from localhost.localdomain ([103.178.205.181])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm38735421c88.7.2026.11.01.00.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 00:02:01 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sergio.paracuellos@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] PCI: mt7621: Fix reset control leak on PHY initialization failure
Date: Sun,  1 Nov 2026 07:01:21 +0000
Message-ID: <20261101070121.2714-1-sreekuttan2156239@gmail.com>
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

The PCIe port initialization code acquires a reset control handle using
of_reset_control_get_exclusive(). However, when PHY initialization or
power-on fails, the port is removed from the PCIe port list without
releasing the acquired reset control handle.

Since the reset control cleanup iterates over the remaining ports in
the list, the removed port's reset control handle is never released.

Call reset_control_put() before removing the failed port from the list
to ensure that the reset control resource is properly released.

Fixes a resource leak on PCIe PHY initialization failure.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/pcie-mt7621.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
index 01ead2f92e87..1dcaa2829609 100644
--- a/drivers/pci/controller/pcie-mt7621.c
+++ b/drivers/pci/controller/pcie-mt7621.c
@@ -361,6 +361,7 @@ static int mt7621_pcie_init_ports(struct mt7621_pcie *pcie)
 		err = mt7621_pcie_init_port(port);
 		if (err) {
 			dev_err(dev, "initializing port %d failed\n", slot);
+			reset_control_put(port->pcie_rst);
 			list_del(&port->list);
 		}
 	}
-- 
2.55.0

