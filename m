Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434264;
	b=tp3LXq93Cnj5gcQeOLXMusfT5kgzKwLF4XnFXfDPMZzIbHvpMlV/ZxIB/HjdFtNY6MhV
	 nm2JFFZ9k6n1seWSGGoCZ51yWORu7ta+OHW6+xsoWRTCssr4eCB42Er8I/nATfePVf8Od
	 Txc6CteuQGBXRWj2D2V0ZIaUy8dHpKO2B1dUJcmmlylwcmjzHk1r+//spPg5jLs3JDW8d
	 nEcqhwtuUTrMe2CkmzWG9SBREWOSyKrLUg1aCZQQIVModg4SdIxVZoM3gvna+dN/mBRod
	 bsfw7onaKSiSxjro0BfxmZ6OuCnaBuBzomONvlHnUSg2ycgDnT1ICq7DU1kUM+XrSNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E5HcxdpQOV9RFM6o/ZfBmmKRtQ1dbEjJPmX/Bpim1FU=;
	b=jQTy1+1RO9hcJDhhIV3w4C/8BMf0W9cTsw9GFRaWIYFsUK7lHxISsg6dY4arPGjoBLsT
	 Y87QBUU/hdei9Dsxv0GxGMMEbxpnG+c4ab24c1z6pWVILrvWcNqvSm6qnjYnnY0O9eFpA
	 HcobYSNJv1aOpCpdiPC6abALyTx4oHZ0GSyJ9Q0IJzFtr8AikZ+naNuWacCza+pzUawzN
	 0WW/ZZ/cpx4xrfaT+C1+Q43zlkquzJXSTPA3Bwj3s0VDjKbNsGXgC+3PTMo3cZpT6t+Jl
	 mE7E20GmxGkqFFCpTn7ZDcWZEhvPByL7hbBeWeTvXeIs+1RJUN0Nondjs9T9wSjeRYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKJ1JhnH;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B6060A262C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9B6060A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKJ1JhnH
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so1530304a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434263; x=1795039063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E5HcxdpQOV9RFM6o/ZfBmmKRtQ1dbEjJPmX/Bpim1FU=;
        b=VKJ1JhnHMnZGCpinQvAzVFJUC+MbAAWmd2u5CI3zAOXpLFiDx7qCSS5UpLi1NaBYYP
         8jq2SRgENOiXlwWGjY49oH4aMdu+O0hzKXwExUAzMNnLbozVx3eyyU4T638F1VUbmpnM
         6PL5odfyF2/P2ZtBS32m4knDnod0K0NDyVKjS7kMrNWi35aTu5TwNxgQcsMEdh1H9+O6
         nL8I6S6xfDpE0Gnnzy+IKFUPeNVSubrO1pBsr3skACJx1iDKO/7OHCCODCaABc+8d1E6
         /oibtIOK4J3BvX0UKCjoPTtSLLF/oSokhlSC6CY4EgPFqEZbGVD4bcPp5WYsijHc6ewt
         Tu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434263; x=1795039063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E5HcxdpQOV9RFM6o/ZfBmmKRtQ1dbEjJPmX/Bpim1FU=;
        b=t7WM3SAqIlNz/Rok+pavhbmyWNctnmIm4HgaHMfKv8l5znahWW2/Do2oCIK1Fe1pG0
         p8rE8RkT8io/Oo9yjwx4CyfV1tER4eBX++7zmWH/kVqs+NHFVrFwcU17Z0iDDuecwH7k
         3y+FXw+UAgqI8+L3Yz7XRVE/8ZjubQB1mcp6rl1jNHTavrJw0juLzS6dlk9Aqqb2fZoK
         7Ugfpeg/vJeXQJRMu3nFyKRO63GNB6IcypOuKTSkUVi8jPIkPomWZFZk796A8nWvrVN1
         jkLfqYt5lau937AWOIHgNLrhTymDo0RFUWWYn0PnMZipy4/yEZ0nZvisJwMiEZfuXoLm
         mavg==
X-Gm-Message-State: APuU4Z+Xodls+KJ4e5xYThtab0nSK29shqnaYMqcRsO1atGv80Yux8j+
	lCbPDS07+wxwOTKiFo+faSwHai+LZYRtEVtD0f5gGmlmEBeydEIPAVJ0
X-Gm-Gg: AYBFou0z5JdrCGwWcGO7G/LALINtouCMYVf4jTrNjP99slE52dSY219IVtUW3anulFQ
	ipJ4mOB8hFHYbBNKTBbAvs6jwA1oZDiltsnhcL/Mp0f6gK1KaaYb26E3Sj5Jgvlt1IG0Yb1Byo1
	nN5eG8ORqsy81BfKp0a+LnIFIqaxKHhaTQGG77xRR4dys5dAkM3BX4ufX68NIhrIOos9JOk8GmW
	m9VVi1veF937HWDGs64xf7hlmunSRh7mB9A/NEbs0OanCD+86/AcTmqonnFWL2t3w/DqkFgrexn
	nO81JM+SY9GZaJhmVuRIEHq5qVHno+WlNGwR/sMb/m0qelQPXZgwsvqW5QzJiLPmJp0eSyMHT7v
	TOWDf4iwUDHee3Q6/W5KeEubtmtv5HWyJYHxi9LPHXXJ/tNOi0t69DPrxtz8lj60vmOu4uRV4M1
	QetmuulrKOJrEZ5dCn0FntR3xv33TJYVYCHCtBi5Svk/GB2wigCT3mj38Ud+/QUsluWU8PBKJQo
	84WwZdA07FLjWIsMd5wCm3gSq9ya7jdSORg2eOJblDsQ9CvjzHYE1w/UCsvcMsB+PIinGJZMqdW
	4XDEI/aAwOYeaCr3akh4e+IvIcFX21MP3Z2UQx7pkhcsP0dLK17kuil5vovgqb76UA+K93X3OuO
	ubGW32DOAOHLufr8B+M0QOi2PRos2w0ZhE5efmpFZhHthAiL5bJpgD7A59dbJ9mECM/eK5ncptG
	g/FQ==
X-Received: by 2002:a17:90a:c2ce:b0:3ae:5572:c4d1 with SMTP id 98e67ed59e1d1-3b182fdb069mr3632430a91.62.1794434263235;
        Wed, 11 Nov 2026 13:57:43 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:42 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 4/7] dt-bindings: clock: ath79: drop ATH79_CLK_END
Date: Wed, 11 Nov 2026 13:57:26 -0800
Message-ID: <20261111215729.10683-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111215729.10683-1-rosenp@gmail.com>
References: <20261111215729.10683-1-rosenp@gmail.com>
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

ATH79_CLK_END only counts the clocks for the driver. No device tree uses
it and it is not part of the ABI, and it would have to change whenever
a clock is added. Drop it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/dt-bindings/clock/ath79-clk.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index eec8f399b9e6..27e31452544d 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -12,6 +12,4 @@
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
 
-#define ATH79_CLK_END		5
-
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.0

