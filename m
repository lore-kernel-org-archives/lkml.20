Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699762;
	b=gmwpqyYg4rCjLex29X+cDBcPQlnDRE2Dk8f3hifKKQdQM4fPHPXP58sTgUrSz1uajaEt
	 4y3/bi/+BXn2e3j2AZ+dx8IkU9rzPJX5bFadSUqR+uYFOMQMdQhF//9kMmL5/K8E5caai
	 z5bmulJP9+5IfaWtV2sxEGv5CeM8/RbjiytKSoOFRYkxMCq3dxG/+3z2JR8S2mH1EB6sR
	 2Xark0er5nEFvQDdx6P0Su2L+d8XKfIYsGoAHeKqoZ/0S9NOhJvGGzwn+FtbXE/VpIhg+
	 a2iudptYz9Lkq+SV8+io3OS8YDiVvEW3FebEl/nm1uyg72z6H0Nj4hP7cf9PcZRTCrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sS8xPUczV4+FMDxOy+FHgx4wadDCkbOB4fdq2ZplWK4=;
	b=pWib7yTqy91Cqk1uRELo1lTgQMvHCQGZAsI3q0iI7VZVgUaVAn8QMhPe714LiNS64uWN
	 pnj57KraixzpcJTn3FUwvLMa+BZbatbfIdHznIhQq88YlTrLOa5xQOq21Y9dEuRzUsfu1
	 tX8cOrgYUicjOzgDPOZGplivvKWIk6EhHLAWwamB5UnTo/1JbQnqPWmmyLTweRv0TC9Lx
	 7WWe/gXX4/t5/1oGY4lkXQ2ejFNHJ4/eZC363S5uT1xx4Gp2y6vupshGoZDDmSjTnm+ma
	 4oygxd53auGGb6aRc2WoO/vuoGej7eMVe/r9EkrQQszbQxjI3RyyOoD8bV8n1J5L0vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h3uvQOmR;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1506E606A8BF
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1506E606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h3uvQOmR
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso1091995a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699761; x=1795304561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sS8xPUczV4+FMDxOy+FHgx4wadDCkbOB4fdq2ZplWK4=;
        b=h3uvQOmR0rWs341RwE/hWRujb+w/Acj48NC++U3xqw2uL8vEXibItmD4r/OnQqYlZs
         VfFM5nG7f0KeXDc8YqrX/nt8czV7aJw/bcr9d+RkZeT2kIRtBMRd3meIkWy5DHA0jBs6
         FHly/uqx7ZkK/sQwS4sdACutwS5rKamhGYtUc8QoiDWh9fReO3IkvBRnJEFZHgsDFBoN
         0FKLlJZkLKjehyc/AjjhDjTEfrbe2R21s9COVjlZ0+OKZ3CnE5Nm9vlS1ujHNsb7Ktyk
         gZcWSSqdYPtzzA3/yLLa08saFC9A5/y2sIKju00aLxprlEHL1J754FB43+vgCOCo3jIX
         WeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699761; x=1795304561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sS8xPUczV4+FMDxOy+FHgx4wadDCkbOB4fdq2ZplWK4=;
        b=nE0KPq52zHsRwhEPtwjC/psnV73SDrQTip8yZs4i57f85LWorlJ2XpxxbK2QQsxR2P
         Ah3yA+SKkPjz6uf9hno8jl3Dd8NbpUSjL0r7nCv1MoSkoGu3t2ritPEpt7BF694o15tE
         6awZZL+WFuvL8zDMEK/Y61GITwqEQqaN1rgMx+7NsgR4RSCZWWZvifWyVu1oblBW28BK
         /wqvw1W3sZ/H7BWcbHmpesFYgeuZdR0YkEtEn6iuSvKK2Az/SS/5LzPgtBKlq7LOJxR8
         rVXBAC1CMcgpTdqNe6Qm9vpOeRC1zdDl71FX2gGU2yElF7Czf0MzDnlvPyLUg9qT6A0H
         vAyA==
X-Gm-Message-State: APuU4Z+pvXzz/sFHKwE7UsSlf7NES05pg1V9u/a4d11EwOV88NX3pb/2
	paV96ddqhMfVeJj56mk6Lc1CR5mhQ3OFh43gSKO8azrZivWq3YJP2NOL
X-Gm-Gg: AYBFou2qqVIug47VvcQtgwtawgspxIHRhRJ4Btpqd7/FDCwBJxMhqDpA6hBWf83ZqE9
	GXr/3Wh6xWlPSni54po9hg6CCBDteP/YQC72o/AohNxK1pO36kIFA/urlz3PQ/C3Qa7K2Eo+NIC
	R87f6x/6Vk8g2mxSz+Nrq3W9dNy9eAuUut2kvc+LTLe8n6Oh8EIwk/FD3/18x6YlAza+/Uo4VKT
	GoA+5+UMx1oVlo7+CD0D470pl/bvAZwl7JGU+T5Vicp9qTs6FwpLxh4LIARCBJR+LR7p35cJxMs
	1ivMZIOEOhAqCvxiaUIfgw4TqoVj8xsSVyGvU3uFDnr6ahOfXBYA5b/1Rbm6mzoe0Zjhbw762oi
	FShaUx1LA71CllVxH+/qW7m/OHl3ajPyi3gyXo+ZHx8ASsbFT1Nzfpyn3mDwN5mHu35DHLUcis8
	qmHy7YSVRzGwrf7sfFZYj6B13HGriMWg67Dh9dKIM8g4TCDSLNpAYVv66hkadnpNT1Q8sslPSeB
	8XkFA02i5VgSZ4nEw8TaJIzL9XtimUhbfpOejWUa4+4oosBYlDTIaNm/JpQOd6SK1gX16x40pUK
	3K6Oqy2yQoxEHjxRxXKfS3W5BlINAYK7/lv621BEBXFfVJANpT/S9cNDzEOzghXo5jk3E9+34+y
	ufxHRTN5+N8QxJMzB9RhYx3WXY4VoUr5TQU0eTYXulz0tDWHZT+/AZdCvWi0ODRGDQBKw9miwUc
	Al1ZnB4d8fvIA7JWoU5UjohRg=
X-Received: by 2002:a17:90b:4a84:b0:3b0:ad42:dcb3 with SMTP id 98e67ed59e1d1-3b1b09fa377mr5893906a91.14.1794699761489;
        Sat, 14 Nov 2026 15:42:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:40 -0800 (PST)
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
Subject: [PATCH v4 5/7] dt-bindings: clock: ath79: add the UART1 and PCIe PLL clocks
Date: Sat, 14 Nov 2026 15:42:20 -0800
Message-ID: <20261114234222.88337-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234222.88337-1-rosenp@gmail.com>
References: <20261114234222.88337-1-rosenp@gmail.com>
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

Add IDs for two more clocks:

The second, high speed UART of AR934x, which is compatible with the
qca,ar9330-uart one, can run from a 100 MHz clock instead of the
reference clock.

AR724x, AR934x, QCA953x, QCA955x and QCA956x have a PCIe PLL, which the
PCIe host controller nodes need to reference.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/dt-bindings/clock/ath79-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index 27e31452544d..57d966ae9722 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -11,5 +11,7 @@
 #define ATH79_CLK_AHB		2
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
+#define ATH79_CLK_UART1		5
+#define ATH79_CLK_PCIE		6
 
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.1

