Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760488;
	b=e0Iuj9iw5ekqt7SYbnehSxUq+NoC0NM4hCyTa4w5Fi0JIJ2uQoqrEFempkoEPHY9Klj/
	 5HX5h7m7blepfnI65FCZ1LQeqwQ5EFuVZHXbV9jL5/Y/mVwa3CI2fxOz7P25S1aYxAFlD
	 728Qfo9EgHNfbj3RcUrYG2z/X1RmBaIysQClDl8B66CiODnMDktzX1SiZSdsoifrhO9Cr
	 9RkcYIVXnG+TESBPVv6iQnPXksiQJ8nDIFuegmq0a7ENpuW3Isc8K7wosESZrNFFJnbTF
	 VPpS78Z/6cvBBRYmTYyICe5Fhx2KnWIt57lm3aJTjnjKaU03K0pR05pi9iGPvC8mMlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l4MqBiu+6D9UqT2D4Jf42GEvZrA2Lb2vwka2d+l2yW8=;
	b=5t7YFUeA28/Pge89rq5Yv+17Jq4kR2Ue1bdXYqeKOheYplbBcV8jAw8YtNG/dW/1qiPF
	 ILukwzstxxUEYpESQXdCPAIzHfnZBFE3SRL/QA3eINbawWVUBNDXh9JiLmXHeTu+tYHoo
	 CPjhMiz8YOTp24oXt2shCzSMC86dx1qzorYDqh71u7TMmmToDhZ0CcUV8O5IXNI6bN4qR
	 pGF0WfiY+2N+9afznR3oICnBfdgEWv911ZWuBINFcNPjavn2HgfS69I7MpG7NJVaGg8ZC
	 EjnYFGqFhrvCaubhqqDbC29u8r5yvjQOljQ7LRWOKd88biqae8nKsE7bIA1kP9uhAhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=FKcdBx3Q;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52304606A330
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52304606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=FKcdBx3Q
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so19742945e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794760486; x=1795365286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4MqBiu+6D9UqT2D4Jf42GEvZrA2Lb2vwka2d+l2yW8=;
        b=FKcdBx3Qdi8yNwMxAo83rqPSg9b7Ri9Z/aQqRlU2zJy5m27il0OrqrUT4hzxun4CpU
         RO/klRpCB4aF9sZrBwQFAldWlJYAt5NoeY8HfkvX13bP874421A1sILxpPcRQf0VjOIN
         d5+i3gIVrnqjMCD/FDkYNiyzqescKVePrjrsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760486; x=1795365286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4MqBiu+6D9UqT2D4Jf42GEvZrA2Lb2vwka2d+l2yW8=;
        b=eC97dgXpbzuVwwDgbwDSFj1z6RKp6TuORcjn6ciwzCO5vj65vNNNJF0RFsUkYZCPtW
         zlGbpBljidQJPr+X/2yfIyQfZNhhCC6LpTn6ZJVNvghvXXERwYrMXZJOyZi+Lw+mdgt+
         5Xd86UHtEBYpbqGD4loXk8UuUKNma8xRyx0iwJPHxsLp2rNxv6atjl+hBr3t+jdORn46
         WMS8atuWJhgfvNhTSHiatiUx6wI7c6E6YHRzfp5jkhzw6j9Ss+juDt1a6jqaBpCihXO3
         KlF0riyFA/49MkZD8lqZph4GRpirD8Pz857LMxNNGUvW6vPKKqofIuvvhnGbYaPL+kHU
         DlFA==
X-Gm-Message-State: APuU4Z/JXLSyaxZ7U6LesD1Gt9zb0PrfCBvL0HEazgsq1r+iOJOMkyOH
	nNG1zXXTmJhfJeSMN6MwUZPG6XE5F72Jbr9kpfGZRggnoC4WWfI8kA1mNfsuHxwhnWg6FaXFOMv
	ts9vo
X-Gm-Gg: AYBFou0Qaqw1uwppMUYLbn3YgmlRQ7Izpn83I2S1op0D91nTsn5p2XlG6dep+g/XF1p
	T8kEHcxj11DJVfCKx29ssuHW0kMgPr+IpV8majDLAf8Sth1U+Qw3aDazhB+qr16F0viNllNUbZs
	RJM2UY8LJdsJZjS6sGOdKo2M7HveyO9cOJPS0gaPMiPcBiDYN8Fk0QR+hwIAbMJt0fmXWmeBSg0
	IdSSXtxv8331CF5+dK3qkqqNUKcuB1G3WxbcTM93NvET86Bz8ka4rWA/zpSLrIiPVLoBKXbJTRd
	JnkfaWYwEi0ssnYVrhBVEQ+IO9/wSbcJVhdg72MeQAVvMTBtrPT9fKl8aTrNLmncGMvyb8KtDR2
	hs1RWuLsef1hczigt1d5DN0P9jdtx1ckEFqyFqlORTKP98/56smabR6a5I/vEZ8k9N5M/Vr3YzF
	POYgUUcPKxlcooDmvTddXzF8wfHf2Rwh2o/jMnlJbSt0S/D1rjk/IRnLqTMaO3NknGAFbpDN/4A
	hsxR2sd0i5SQoarziz9e3ATnErnoPq8cFZ+x1yj4+NZN1gwmk+yolgKH9sB3eTr+8mkMEheZft2
	kuBEtFBHGPxi1g8qavtu7ag2TRcLTrmWvG+xUdZn/GbnS6hBYN5snmzaZ3Rw1WShtrYWS9XZ3kf
	Xxu15Kuc4cSO1alVqgpyj1z1M2joXr8am2giIrHGn+WOpIktVWj/FUSpmp5E9/QQODL4rGQ9kSU
	EsRWwYHJL3b6vuEU252ymYQp34xw==
X-Received: by 2002:a05:600c:4343:b0:4bb:5e8a:7c9c with SMTP id 5b1f17b1804b1-4bb5e8a7cc5mr89345295e9.7.1794760486606;
        Sun, 15 Nov 2026 08:34:46 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f782396sm17500021f8f.24.2026.11.15.08.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:34:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/2] arm64: dts: st: add mmc aliases on stm32mp257f-ev1
Date: Sun, 15 Nov 2026 17:34:30 +0100
Message-ID: <20261115163432.2601947-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115163432.2601947-1-dario.binacchi@amarulasolutions.com>
References: <20261115163432.2601947-1-dario.binacchi@amarulasolutions.com>
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

Add aliases for the mmc nodes, so that the SD card and eMMC host
controllers get enumerated in a consistent order on the
STM32MP257F-EV1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 9c38c4fe0c1f..69e3ff4cecd4 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -22,6 +22,8 @@ / {
 	aliases {
 		ethernet0 = &ethernet2;
 		ethernet1 = &ethernet1;
+		mmc0 = &sdmmc1;
+		mmc1 = &sdmmc2;
 		serial0 = &usart2;
 		serial1 = &usart6;
 	};
---
base-commit: 23c62304dde29abe92013d85910d03a77dada35d
branch: stm32mp257f-ev1-emmc-aliases

-- 
2.43.0

