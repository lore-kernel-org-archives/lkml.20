Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015571;
	b=jidPXrPMLn8+cFv8o9sKM74/NV8mgGtIrAU+uhvBTAauIV48Srx3hSTlncQ/7UZEv0zD
	 32BlZRkeoUkelrijPYWT0gsFOlKi54mca7rI6fDRrV3UhC/lttrGSyvd2J7FxxdzXKOXh
	 VxOT2jowoIwRqpyeTQjfdBVpnXILT8+1aNbUvwGDIM1Fm8JDM0b4nHdkoZcLkbNDAT/Ja
	 4AS81dO5ypsos7X+Xv/90NA/EYX0fiq6G6XroE5FdHwhzGxkSttB8m9O/KzvpbaV/MxP+
	 tv+5JhU51sVOH65UuIeurtslPYQU/1pwHxCXVGf0vN8oqKbjGnU8ffPJsJzEAxiNeJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q4qz4f3w8qZvH+lfEWnJgHnh5JL7fX33lsldO436874=;
	b=w7np56sbN+afhMuRpFy+lv3nuoBIJa/5dp5rKDt7BXZTqgQYPe1Cc2nJPI9vzNVevi7+
	 jwuKg+CN3i2W+uSdlRwLkUpg9ZxDxzAmu5qJT+QjSqnl1wp1gJRiCUTjoxhtVwknp94yr
	 O49hGhLLORqD8ka1Cc2S/JHYU+/hfty9FWXFrcIJCJK5aSI7B7WHzhpLgbHdEY7BimiQz
	 KL6KuqeGqOrLZEaxH0zpdMJwrHAhG/lAkItt8FRG22LTfDlkwn4trPcek0lMPC/q4ifwi
	 UMgvHbo686zNWgc0EGgBmzTAu72vZ0JIraRQeAKZhWUaSsAPNedqlePNlKHXOTBNxHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DE025+Ft;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D6A606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D6A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DE025+Ft
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1782034a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793015571; x=1793620371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q4qz4f3w8qZvH+lfEWnJgHnh5JL7fX33lsldO436874=;
        b=DE025+FtBNn4VeEvMFR5gBWQ5Oai9mVpesiny7S8dqECCx6kCIRfZWvKX8hSnDiBhh
         3euXFRXyZFF9U4zXPEAwAeJmcJhrfH9T8eIig1KskiInFI3JhRX50esPoQ6hiQvJhYFK
         ItscDTwxEFIAR+CELhFji6Juk13MYLHathnAhni3KgMSKN94q30Td5oryUw9+D2DHsNk
         Dn9MOqNIPx/3KYQQe2p/Kr67HJ8QVolg4HwWrGlc9PJnJVQEw07xweP5uo+B/5YpdmPA
         5wMxwbORGeGxTS57+xV9uI8zofxG1a1TtKcxkuB9niMsFlAhyK8WROJkhEzT4nNJrC8r
         lseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015571; x=1793620371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4qz4f3w8qZvH+lfEWnJgHnh5JL7fX33lsldO436874=;
        b=DvTbEo65H51WRQC+bJVeScNMPfXotfSXIiHSvtuJYwDsjuKFMx9/cblh4JfZv5V16G
         rrPVp1x3KpA97RUyUI/Rwag1xtmG3YtapDOBKM099Cv0/UkM+chosfW6IJFAo4JBsxMo
         wV4gIjw41VPPwc18lfcgbX0ad+7L3eRW9W4OO80Fq4x3ZbDeelIcp8Pt8ilHsvU+SYZf
         QuMiFcPEzJ5YeTZufwabkEEV8Ugq6Mxx4wAF5VV8rKBbPgjK6xMPg2KaV2ArYmz5BEFo
         jr4BeL4QZB0854Pi6ablhcgHNl4pfww1cnB43IxogrKDEk4CXnRqQt1QcH57lwyA20r9
         3ugQ==
X-Forwarded-Encrypted: i=1; AKwUvBxm5Q0PFv3goGXN3dlhkiJ3l9fymR2FCPxi8AuSRcrS7EPRfu5yoyP4OrSO7eH15ILPmqoL1xrqrhzxIZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGVEsUmtiKUXmW9PDliNXJ4O1VdkjXGdfNQql8/UdWG2uguyyt
	+/UekzvJOcHdjwXelxPpFM2SxxhdJH5A0RmylKxD8NDS4KN4pNIpnXFvZK89yA==
X-Gm-Gg: AYBFou3UdEIadENqmjYk4oicaZ35NUieHnjY1+aaKCMSQIPMEut+MfUUjL6ZDM8Xzm7
	OQ164n5d2N6E8cQoKB3E3PKYXgKxKnaw4SuTbmIHBTS9iXvc7qxxZ+lXOT+gLi1T9gDJTetGhif
	pTpLsdkt5BmjBnZYiR/HIU7GCFui+dAwqiN29HPvbIMpqkToRrw2KH9wiNmms/pZ9NEluQj2g/t
	tYEYNM/EIKAHgo2+vCeh3YWamDNcEWdZr1UzyYBF7nfmmhacDFH0NH1KsJIpdcn0kLJRwXNzu5Z
	xlhA3NfguNPa4WBLMrI1NSwI4dvv+Wosk/ydUAoRyQmaahZ/qvagxlcWb1C2JbpPGwN64i2GsGi
	9mYY6apyRQzq6/6eFMRxca+IgjW60E0V/+/XiOefikleT+3MOtoMnkiTjLqB61fJNejLaRWQg/q
	KdkLwFuCrzd9Su9lImMF7HNAZh0lQwmEZHWBBcymw/zUdrtZDWPbnxset8HhTBLXvrbN8i0DgqI
	LPaYVVw+N6EBldPrdZPlDmyavu1QNLuTvsA0oV2u0IbrJdE6Y3pDXTYjmo82bOehaH+wV5Koco=
X-Received: by 2002:a17:90b:3d4c:b0:3a7:a485:9d38 with SMTP id 98e67ed59e1d1-3adea093f2dmr4017214a91.5.1793015570761;
        Mon, 26 Oct 2026 04:52:50 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21026sm1374699a12.6.2026.10.26.04.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:52:50 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] spi: pic32-sqi: guard against empty BD list in pic32_sqi_one_message()
Date: Mon, 26 Oct 2026 19:52:19 +0800
Message-Id: <20261026115219.3528114-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

pic32_sqi_one_message() accesses sqi->bd_list_used with list_last_entry()
and list_first_entry() without checking whether the list is empty. These
macros do not return NULL for an empty list; they return the
container_of() of the list head pointer, i.e. a wild pointer into struct
pic32_sqi. The wild pointer is dereferenced immediately (bd_ctrl flag
update) and its bd_dma member is written to the
PESQI_BD_BASE_ADDR_REG MMIO register, corrupting the DMA engine state.

The list becomes empty if a message with zero transfers is ever passed
in: the per-transfer loop is then a no-op, no ring descriptor is moved
into bd_list_used, and the code falls through to the list accesses.
Note that this is not reachable from userspace today, because the SPI
core rejects messages with an empty transfer list in __spi_validate()
(drivers/spi/spi.c) before they reach the controller driver - and the
core's own spi_transfer_one_message() likewise dereferences the first
transfer unconditionally. This change is therefore defensive hardening,
found by code audit; we do not have PIC32 hardware to exercise this
path at runtime.

Fix it by bailing out with -EINVAL when bd_list_used is empty, before
both list_last_entry() and list_first_entry(). The xfer_out cleanup path
tolerates an empty list, and normal messages with at least one transfer
are unaffected. This also matches the existing list_empty() guard in
ring_desc_get() in the same file.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/spi/spi-pic32-sqi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-pic32-sqi.c b/drivers/spi/spi-pic32-sqi.c
index 5d3921e29..005bb6a0c 100644
--- a/drivers/spi/spi-pic32-sqi.c
+++ b/drivers/spi/spi-pic32-sqi.c
@@ -391,6 +391,12 @@ static int pic32_sqi_one_message(struct spi_controller *host,
 		}
 	}
 
+	/* a message with no transfers leaves the BD list empty */
+	if (list_empty(&sqi->bd_list_used)) {
+		ret = -EINVAL;
+		goto xfer_out;
+	}
+
 	/* BDs are prepared and chained. Now mark LAST_BD, CS_DEASSERT at last
 	 * element of the list.
 	 */
-- 
2.30.2

