Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD9E4E0B83
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552983; cv=none; b=CxwOaJ6QKBqh5ZMSpiRn9NTDoLdaE28rk84SojOF35eQRVFd05V6USdV1YvKPo0/b/INAr8olSl6CELreultdVrYb37togIffBSu/1/aI0WbJ5WdUjcjGFcn48PWWvMhk+EtbGBi1ZG9jkxm17IIAeWFMFKyPr1SSBZtrbrkb08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552983; c=relaxed/simple;
	bh=zZet8n0Q5OOAua1rvVURqPRD0By3UNSCDjmnS7Uw6aU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhpjjWM9aKUFCuy/PNnfoP1j9jr9qtDyb2zYuOZwi0koT8+Z4EMf0ve7WFegn49nn2YBQGdvE7Y7aBq+j/5uaLWtSfhGeo3SdxjCdGV3m5UXMELBj+9kck8NmOfxQ30JHbFe8K70baSukebXa+qVBW9dEvLnDzp9krHwO/0uVo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8246b13cbso11977715ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552981; x=1792157781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HxXmIcoBEJr40/B0k7/txPx8ho1bntDPfNLOQrF4rzg=;
        b=oJ9H+RXA810p3fOWAOTZII1i4+tJibGkforvtwARaOeXyugfaOMd/4Kp0i4McW70LU
         OP+Gwvvkmb8TkUBYm5NO/3nxL2coqgY82Q11h7vzJxmh4XTtAyX2q1hrjOKte3TKRPGd
         /f7V1PnbvCSM2nxPoBHAZ68Cn02HPrYlUD0svM8n/OBOD0UwYRxMOHathKd0BHvfnNF+
         eTcpJ5IE+1cX56dTvhPYKnQol3W4+SlWRz2ZtBLP7z3tXK8px3r8lbfNJO6xR8pR46bq
         fqlKCaGXrFusuBEe+LSPYYv3VNfwksnTKgT6rQ86t9TFp0CvVxoD4YDzmgEFR2mv2ocP
         YUhg==
X-Forwarded-Encrypted: i=1; AKwUvBxbE3OPOfHpGMs10bz7OFe9akMIJ/G5OQ28rrCev7a30Ob7bJ4TOba/Wx5M6dClVWAYo7MaO7+iPvtWbkM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZAHEC0C6uoHxmSv9hjWA6uBWgggZajlVt1SHRTfufy7j0UJ4K
	87iQpjZvv3vILngKiA9QFHbuEwUjh407OYO3kRem5SiR6W1vImGCg4ib
X-Gm-Gg: AYBFou3yXC7tvVLXXgxOtO2Da+NJDuIa1MDZ3IxNXU+0t4ciGWPUZyAHkQyPmJlNmyD
	76FD31oketoGfn+ScbEZ8Wxc/hU2hpXRUX8CbYydPlmaDvkZAla3vGNk9oPDB2BMop/hcpFC/Px
	VI5BXLXaKptHzGyDE5OTh59toR8cYH48RFqhNpDQMWtj6dfplW2rB0hkND86DSPZQKnLjBqpPN5
	IWjNk701EyZgZLIqa+8RXkhSX0Q/VQcEbNrdby47VaYFBR5lz6+zpwwyYPNSbDBX9uEiL6bTM14
	XOgVHarB+A5vsj1cZY+LkpziwfbeHcwF83mbrKoGK8xTtF27qvqqQITu/Ds6Jl1cWQSAXeGyr45
	P7b5+jLkPdRm+be8OzKdwfUhNvDyzN7BNqxW4DUrADebVwcJ+dgOT450M0Emll6xohBX+X7Sds/
	MJ4Un5UAmKpBP/4jX2xx7iCpfDnNJANhzLxcaZiexltN7HaB35LaLSxSxyLyqsPYVbtD8a+g==
X-Received: by 2002:a17:902:ecd1:b0:2dd:7646:35cd with SMTP id d9443c01a7336-2e84271c054mr18115105ad.0.1791552980705;
        Fri, 09 Oct 2026 06:36:20 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8484c1641sm7656985ad.15.2026.10.09.06.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:36:20 -0700 (PDT)
From: Aayush Kumar <code@aayushk.dev>
To: broonie@kernel.org
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <code@aayushk.dev>
Subject: [PATCH 2/5] spi: lm70llp: Use strscpy() instead of strcpy()
Date: Fri,  9 Oct 2026 19:06:06 +0530
Message-ID: <20261009133609.579046-3-code@aayushk.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009133609.579046-1-code@aayushk.dev>
References: <20261009133609.579046-1-code@aayushk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a safer function strscpy() instead of strcpy() for copying to
arrays. Only idiomatic code replacement, and no functional changes.

Signed-off-by: Aayush Kumar <code@aayushk.dev>
---
 drivers/spi/spi-lm70llp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-lm70llp.c b/drivers/spi/spi-lm70llp.c
index e61e89b41..bd8028892 100644
--- a/drivers/spi/spi-lm70llp.c
+++ b/drivers/spi/spi-lm70llp.c
@@ -252,7 +252,7 @@ static void spi_lm70llp_attach(struct parport *p)
 	 * We are binding to the generic drivers/hwmon/lm70.c device
 	 * driver.
 	 */
-	strcpy(pp->info.modalias, "lm70");
+	strscpy(pp->info.modalias, "lm70", sizeof(pp->info.modalias));
 	pp->info.max_speed_hz = 6 * 1000 * 1000;
 	pp->info.chip_select = 0;
 	pp->info.mode = SPI_3WIRE | SPI_MODE_0;
-- 
2.56.0

