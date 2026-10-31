Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453730;
	b=rzpPJBo7vadHhGQL4USBsfFm3eMt+jjioT7e4sgGLD5cV1Czeb4t/kPDwBUHj8IgWuTj
	 fM+UZjShw6SgAnOEKU74PR32FShycfcxutqnkVcKWMEBbUo7AcGx+PM1OnNlNfnLonLrj
	 Y54Csa2oNnu/s+0h7w3eXtlRfGGcsXuag/8EWQeR338fPgclxRxX1G2Pr8K4YQNVDyEEe
	 tuIZsncFWkdQJSlEwa66wDy9vsAtUDOlqo82dQ/mymNJ/oULgPgvbGuahMxsVAe7iz2kT
	 ipeUtke/odnZvohVg+FCKIAgOrCTJErvlLgAv9BDdWv7BDX2RZ1uMLaGGVwKAmHZ4bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jYABWeDo+AGiod8hgPoggERFln3qmx9KSSnUFrivFQA=;
	b=LSrGNXCBpe303CuSiZ4CBeX0dkUO8c9DJLwxjJThPuNPeRZmnFrAhKrTYX4wyAxlcpU6
	 +ngRQg7Xulf1bS9+Dkj17Gc88aQnMMOV5mjnYqYza1N2fYgRGIq4Dyp9zFUhD+RVDJK/U
	 obWNnAvOfPamw2YQHtbqZIjI7HstFjoVim86sxfVkY6NJlKRn0M+bMLYzEnMv8d7mxfL1
	 4jkPtWHIpRLVZwS3u4sdleNsHy8ZW8BpxmZED5RCPoIPMqoMiBasPRq3MqFtZrj3uMPAr
	 kt6417RU4/AFDctgrxse5u7Jiqm2vCIa0gK4j90yrThIB1jzkddlUM3M/CCFuGIKnhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mX4wM0Tg;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635C5606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 635C5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mX4wM0Tg
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5366ae57896so19227221cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793453729; x=1794058529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jYABWeDo+AGiod8hgPoggERFln3qmx9KSSnUFrivFQA=;
        b=mX4wM0TgZgY0LPbLWGS2TWIQo9dW6F+CNVQtMb4E0wYV0YYJmqABQFQ3n41d8lcMP+
         ZOf8JTOUJe7wwn9Gm8kVd1HHLlSQwr4dbqz/C56sIucLWkSQescmtjJlptUosOFxdZCT
         qE8NUff1K8EhMsxf3aJ1HFTEIMMFZrbUxtw1c5eZT9TEYojoV/Dda55eicgHuFh3rfpH
         oMfYNJU0xPNQLsAt/k6lSoHcDUCym9YL59D6Mz9b/Msvp5lSlWbZ6mOks5x0ZC6I2oAh
         SJ52DkkTGIb1fRtFKkDyKPs04rKsKJjw+T/665i18LO0eiUA8xB+DQzy5W1JAl3AnwwX
         ejog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453729; x=1794058529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jYABWeDo+AGiod8hgPoggERFln3qmx9KSSnUFrivFQA=;
        b=Nv24YRt8kfQDlWRSnfR8mY0rqTg7egS9lLm5mHsBkQQRIxxYvb05VONfbmikLljCuQ
         KVwVzh04+3Aa1HJpeqeMN+0HsSb6JfVY26OfUaMhsMK7ZTRYN2j/tEvIXdEQgwFEZwUq
         MpWS3hmiZg/SE92Kko8q49CIN3MGckS4nFR6tEzM9qQ2YqW58B+sCZXSpmdnOiQOnB1R
         ZBzCytp2TjqdQN5LacGOVp7+qibcLlNb9sKKRRuLQYa0NwPpoZGbx6FN0unyF7Cm5bX1
         VdU4gaIchu2vhdfeRa3RCqdTz+RehS0bKBPqP46lsmNLKmABwqgIu23ws3Li7BYXl7CG
         fJtQ==
X-Forwarded-Encrypted: i=1; AKwUvByNuBG/YbaRNxES/aeAYfSkr39Ovkh8SqBU0fg7ggpNkBtAOl4UhmV5uha3II4at0nJ9SwtWZGqltK2KXM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTuluL+z5jq3vpjrC89k7jPL3LtRgc+ICgNh3F/XThtSWL/iVM
	pnHYFDTQkcp/cBSGwobp0g4PsX6MEIHatHV1yK57TOT+QTCxaXLZn1c=
X-Gm-Gg: AYBFou25tQJF8/uDceoIZgwjGu6v8CnzubE+I6LEAlmriVMUlQGEPpV6iRAAATdW2MB
	cEykcQDzSE28CsVQoA4vnUNVyvvTJNZvGRyoqkYpASLxZSOcrWI7b+Z75PtvLtzeqipysIB6qQc
	A3Z4nLM9O1y2RkvSyPp7Anh4KLZ+fzRcIpLQBo4BRzOFkpsG2WAHEchiP9eexmYtw2PvraIJ9j0
	M0bcOXvefSa4C7P1vBzN0qr/y8mQBg2PkIxj6ouuUp7PU+icWgQPNpPeBJjdPDfGfsmUaX+F78y
	3Ez93alCwmncDNH6DyGAGnnsquvc/j3tCVzy+zbsSgijWfHv5WDieLuwQp/L49vw2ZyxP/tpdET
	Z6wWA5+RxbDDfeGD96eOZCWO+wy2KgMa04tl+y9TzpZuQvqlAn8iQ0Oy9dtKju3Por4bnePVCU1
	8pRkDUVw76Z/SZNod3jGZo1PL9rC4TXuXbyyafaM02KyI/1Enuygvgt0foFa+MoPDBI10eCTHpF
	eESYtOKeZkVgl/klKGC4wmtS6GOqExM9BUp4a54qhqQxAe8Sp/Si4xRxB/WUE7XQQapAKemcZWc
	4FHIt8OuhjjAAJrNqs5geYBcUt0o7lZDm2cDVgS8HTpjHvK04qOXOnWVNrng+5COUDsBwlqdNsG
	FwguYJMQ=
X-Received: by 2002:ac8:5f08:0:b0:537:83ea:6923 with SMTP id d75a77b69052e-542b714560cmr82010581cf.34.1793453729164;
        Sat, 31 Oct 2026 06:35:29 -0700 (PDT)
Received: from phoenix.rocket.std.internal ([2a12:26c0:4608:9602:488f:ea65:c201:8ce2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54311f75fd7sm38713741cf.11.2026.10.31.06.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:35:28 -0700 (PDT)
From: Rui Salvaterra <rsalvaterra@gmail.com>
To: pavan.chebbi@broadcom.com,
	michael.chan@broadcom.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rui Salvaterra <rsalvaterra@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] tg3: make depend on ZONE_DMA
Date: Sat, 31 Oct 2026 13:34:56 +0000
Message-ID: <20261031133455.3070233-2-rsalvaterra@gmail.com>
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

Since 614f4d166eee, on systems with ZONE_DMA unavailable, the Tigon3 driver
fails to initialize, at least on systems with BCM57766 controllers. On a late
2012 Mac Mini:

[    1.226623] tg3 0000:01:00.0: Unable to obtain 64 bit DMA for consistent allocations
[    1.226718] tg3 0000:01:00.0: probe with driver tg3 failed with error -5

Fixes: 614f4d166eee "tg3: Set coherent DMA mask bits to 31 for BCM57766 chipsets"

Cc: stable@vger.kernel.org

Signed-off-by: Rui Salvaterra <rsalvaterra@gmail.com>
---
 drivers/net/ethernet/broadcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/broadcom/Kconfig b/drivers/net/ethernet/broadcom/Kconfig
index f0bac0dd1439..c9875daa043b 100644
--- a/drivers/net/ethernet/broadcom/Kconfig
+++ b/drivers/net/ethernet/broadcom/Kconfig
@@ -124,6 +124,7 @@ config TIGON3
 	tristate "Broadcom Tigon3 support"
 	depends on PCI
 	depends on PTP_1588_CLOCK_OPTIONAL
+	depends on ZONE_DMA
 	select CRC32
 	select PHYLIB
 	help
-- 
2.55.0

