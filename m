Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506190;
	b=YU4+OM2j2A3k/ob4Qq6ddRHYnxT93/RMQYralOh6W90GpWbFqmQRLVtU4Ns3AoK3+kBE
	 Ch7IkGg2YOHvr7Qh8QBTAuLBmoTdg0AEHUcBD5j/zowFsxJf7wV6a4ZHF6m+nc19By6AM
	 j5EwcWo7W5BalFn6GK3QIMmlv5ZGUqMLRrIEM8gEgNBypVhzXA2bVICSVxB4dXyFXV93R
	 LSZ1971yydrSFpjb18SOq/S1t0EmS8ez8sRoTjAoqiEZGm3toLGnynVJgVLlfotlfaPJX
	 1Mnvg/ap8nGGL0zldZ6AoJSr5qg82966mHtGpVeDMKwQXCW2lO1KDm+hFGrVDeTzjPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gKWAY7VVnpLDcrJZc6H5yDzttlq0pcYOErt/+PCFLEQ=;
	b=aMPWnihEqXssqf39FgFGieartsJQC5k8z+x46pP88zW6H9WoDKyMfYBY7OeChaWfbNmY
	 pXcUVlFtvDliPcdnoMOmn7pq7hmEnTDl08Elyxf87NBO1x8WH2bmYouuasxwr0WRo/d3Z
	 SVC5u9NPOrHDP2MRn7OltRyw97OAYmykoCxQ7W+e8ZrP0E/zv4UtiGW8p7RZ1aiWLNjCI
	 Po9CvSArBTXGz6eANz1IiaNCtJHr0IIIIQIFxRj3LYwM2kW+ubP244sFlfzEd4vq+WOxs
	 KudNyN5SHrB4DIPWXnE3wmctACK0kufYjJwsFQT9FFF8/8ZLFKKmzpstJK/4UG4FjyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V4N8nYzn;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D274E606A880
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D274E606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V4N8nYzn
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-498f5fa5103so14198f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506188; x=1795110988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKWAY7VVnpLDcrJZc6H5yDzttlq0pcYOErt/+PCFLEQ=;
        b=V4N8nYznopgnOiuHT+YUe2sVDXtjCImj6Txxvl1bwqi4d3Asn+8ZAyKdlT5e95SPFI
         +KFB7/0qQjtD+q98aaERU6rVjpz+z9wdrkql649gfqe8fC3pih2TwyXl4mOMvw+ospGD
         iPfFx6Worl76CFR2Pk8tMCXk2xk7nkqetu0TF48ux4oMdhJqXZt1NzW7fDbz9tR9PlOs
         lhZAIxdQbyQA7zim5U3P79sF3ueh7LYwd4+ubMyf81w5KJ1JZF1HcT3vMuEHFm0DpiSH
         N3aQ8m1Erf8obsUGHTdjrBWvjwtVbhTXsAW/VK0Ke5jyYtB4aaIze2O3m8VnKmUDsMfo
         t2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506188; x=1795110988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gKWAY7VVnpLDcrJZc6H5yDzttlq0pcYOErt/+PCFLEQ=;
        b=SAtmQeDi/Li2b7MiS4ZnDpIPE6NQA+7gnN6rg/Yp13EcOeKSC75EufqhyZFO2pWdFL
         biwJJ3964MA01jzXA9qjjomvr1ILtXml9qeSe2ZQ8lkA5NdP19AMnTaFcdrXKaB2P0TP
         83Tj2zMvAl2c6BGVneM8F9RtYsD1nX2guyJ7zbD8S61PYX4VEvVNij4dCNSMEho1Mqd/
         PviIbX+88ma/00waPCMBmjtdkBvrOnZwB1dbNddkjPxf+Yg3N88Bv7LdY93wwMzRvG0X
         2O7f3ZGdoLxnte/Mve3hovRPoNOT1W+/QXDs6TwSommUZm4MVP1GNZGv7YXBjjfhq3RY
         3uwg==
X-Forwarded-Encrypted: i=1; AL+hErFH/cFYib/IX+5bCVDn8BV570toiohjL/PoTn0w4AqAPPO5AtpW/D36YoyY3AyC38r4NLRM3m/AGk4ksOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z95wP/Sj/419x96ZQPh8DUasielkzXILWZm9mZXtB++rZcS5vHE
	72464s+i57WioJahSe0qYVnviae/aLHeGUiYAwT9E6FzuRy4cfepLpjT
X-Gm-Gg: AYBFou2BsP5YHn8OWJsQp8Z6YcRh4KnGnqjkysM/o0Y74gzeKw1ZJr3P6MIz2vAU9zk
	RP4d3nbyh/siuY31EfhbgFAa0K+bRjuaP6AZ5fe8t3I3PaBihWHrsagSN9HEw40EG0MVmfn2H9f
	AHtEB7K2JUf2ybGTYsaCkZDxF8U09A1UXozRLYfctfOE2HZIch2KZ2QAeW4rMuvLxDAt2cJl1RY
	Annt07olgYi9vv2PMtzj1kPlvBojJ7kBoHANo4hZn0kxxjJVyBoHCDQdI4xrVPG30JMmHfrQAcQ
	BWk3L+C9efniSm4V+QngX4u10OYZ8moQHimST9DH6Qz2WUmVsVVuUQqbmZvtipR5er0dNPOw+1n
	ebc8Dfv8jMhQFRCGOLiwLV8DsvE72plII5dQOx3h5MeKTMGOSKoIuoREgd0gi60dP8bV3e9c6np
	Vs/jpZ88x+J3YreHEV6pzU+OUUQnBzcM2HAKXY2AeeKYt7A5VzOYxuxbDp8Pd7excvgIXUpJTeH
	xPvENQxHTXIgfxytE1GZcmbLZbsEzkeGqjztyoCTFY1XbrbIvqoTdreOnSL2BZsGyUf2BcVliu8
	grxkChLyWo6+9kUCDQyWLiAQurPwSPzufZHuP/E+ibFty3OSl3NK+H4DTbIXHoh8VvmH6rK1xUa
	whcHRiTMRolVRkCuLnob9oBDNL32o38W6iIksPzmsLUaKkj1f8zE0Wfoh5pHU4lqTLweydm7uy0
	YphzDVhqdsjzat/ifR44TRGxnaJ5Gh+TE9W4mF3/4uag==
X-Received: by 2002:a05:6000:490a:b0:48e:353b:9f28 with SMTP id ffacd0b85a97d-49c6dc01369mr339149f8f.1.1794506188068;
        Thu, 12 Nov 2026 09:56:28 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm438408f8f.57.2026.11.12.09.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:56:27 -0800 (PST)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	b43-dev@lists.infradead.org,
	Michael Buesch <m@bues.ch>,
	Alessio Ferri <alessio.ferri@mythread.it>,
	kvalo@kernel.org,
	julian.calaby@gmail.com,
	jpeisach@ubuntu.com,
	rosenp@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC wireless-next 1/3] wifi: b43: set the DMA burst and prefetch bits of core revisions 40 and 42
Date: Thu, 12 Nov 2026 18:56:22 +0100
Message-ID: <20261112175624.40547-2-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112175624.40547-1-gonsolo@gmail.com>
References: <20261112175624.40547-1-gonsolo@gmail.com>
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

The DMA engines of the core revisions 40 and 42 (BCM4352, BCM4360) need
the burst length and prefetch bits of the TX and RX control words that the
vendor driver sets (0x03780040 and 0x036c0000). Without them the engine
moves about 6 MB/s and every link tops out near 50 Mbit/s.

Add b43_is_ac_core() for these core revisions.
Signed-off-by: Andreas Wendleder <gonsolo@gmail.com>
---
 drivers/net/wireless/broadcom/b43/b43.h | 6 ++++++
 drivers/net/wireless/broadcom/b43/dma.c | 4 ++++
 drivers/net/wireless/broadcom/b43/dma.h | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/drivers/net/wireless/broadcom/b43/b43.h b/drivers/net/wireless/broadcom/b43/b43.h
index e1e8083..80b299b 100644
--- a/drivers/net/wireless/broadcom/b43/b43.h
+++ b/drivers/net/wireless/broadcom/b43/b43.h
@@ -1001,6 +1001,12 @@ static inline enum nl80211_band b43_current_band(struct b43_wl *wl)
 	return wl->hw->conf.chandef.chan->band;
 }
 
+/* MAC core of the BCM4352 and BCM4360 (core revisions 40 and 42). */
+static inline bool b43_is_ac_core(struct b43_wldev *dev)
+{
+	return dev->dev->core_rev == 40 || dev->dev->core_rev == 42;
+}
+
 static inline int b43_bus_may_powerdown(struct b43_wldev *wldev)
 {
 	return wldev->dev->bus_may_powerdown(wldev->dev);
diff --git a/drivers/net/wireless/broadcom/b43/dma.c b/drivers/net/wireless/broadcom/b43/dma.c
index 5e1b30a..5f968b0 100644
--- a/drivers/net/wireless/broadcom/b43/dma.c
+++ b/drivers/net/wireless/broadcom/b43/dma.c
@@ -691,6 +691,8 @@ static int dmacontroller_setup(struct b43_dmaring *ring)
 			    & B43_DMA64_TXADDREXT_MASK;
 			if (!parity)
 				value |= B43_DMA64_TXPARITYDISABLE;
+			if (b43_is_ac_core(ring->dev))
+				value |= B43_DMA64_TXCTL_AC;
 			if (ring->dev->dma.ptr_is_addr) {
 				ring->ptr_base = lower_32_bits(ring->dmabase);
 				value |= b43_dma_read(ring, B43_DMA64_TXCTL) &
@@ -733,6 +735,8 @@ static int dmacontroller_setup(struct b43_dmaring *ring)
 			    & B43_DMA64_RXADDREXT_MASK;
 			if (!parity)
 				value |= B43_DMA64_RXPARITYDISABLE;
+			if (b43_is_ac_core(ring->dev))
+				value |= B43_DMA64_RXCTL_AC;
 			if (ring->dev->dma.ptr_is_addr) {
 				ring->ptr_base = lower_32_bits(ring->dmabase);
 				value |= b43_dma_read(ring, B43_DMA64_RXCTL) &
diff --git a/drivers/net/wireless/broadcom/b43/dma.h b/drivers/net/wireless/broadcom/b43/dma.h
index eddc882..14de4cb 100644
--- a/drivers/net/wireless/broadcom/b43/dma.h
+++ b/drivers/net/wireless/broadcom/b43/dma.h
@@ -91,6 +91,7 @@ struct b43_dmadesc32 {
 #define		B43_DMA64_TXADDREXT_MASK		0x00030000
 #define		B43_DMA64_TXADDREXT_SHIFT		16
 #define B43_DMA64_TXCTL_KEEP				0x03FC00C0
+#define B43_DMA64_TXCTL_AC				0x03780040
 #define B43_DMA64_TXINDEX				0x04
 #define B43_DMA64_TXRINGLO				0x08
 #define B43_DMA64_TXRINGHI				0x0C
@@ -120,6 +121,7 @@ struct b43_dmadesc32 {
 #define		B43_DMA64_RXADDREXT_MASK		0x00030000
 #define		B43_DMA64_RXADDREXT_SHIFT		16
 #define B43_DMA64_RXCTL_KEEP				0x03FC0000
+#define B43_DMA64_RXCTL_AC				0x036c0000
 #define B43_DMA64_RXINDEX				0x24
 #define B43_DMA64_RXRINGLO				0x28
 #define B43_DMA64_RXRINGHI				0x2C
