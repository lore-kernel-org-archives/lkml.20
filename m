Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274618;
	b=wgR45rnS6omqqZOLrr+bvAVMzCgyxh52Astx424XC+BlpF6chaBvtiLjhdee5XdQPzJD
	 S0M+LhNox1H8uXxv8Ri4dAAqi9PqF1CBx5nAjdzKjW2xmTiLpwOSO75jvi92jfzCfWBGL
	 DUseWC0RCNk/hl62h4NF4jDMDVz8WtOWO/S0sWr8RkeC1XXi8AczUyiBiLkDSJ0N36pNl
	 hGrVUGwj0AYL3swbsnVREM3qCbQpy8gPQWQ5x6TXPUgLg6y2c0PXM+fu8ghRWRUFrGPLA
	 NHvDcrZRPdlUoR+iW0HGrTkTEfPaNwL3B5Pjh0grVY28s+cEAtMyNfUIztO0FbYMP4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4REj6Cc3PcYKPXeO0BJLjLikBlGobV/sM3/zRfrSm8A=;
	b=K3nHau5hLHWa+xYcbx1/jeC0Av/1yGOZg0SI59wQjYFcWQ1Rerp0ICRG5wi0IIrdhIie
	 hhFp3xTvByT0j0ts2uLKjadxDy63Xh2l7i7ARTy1xBfcOeA76A36mLc2oKfCoOdqBOI+p
	 FpBVwUvR4NJ5zrsmuohIBu9s+7q4aoDZoelqX+eWk2e/hnEGuWMfM5TeNIXxSKC5W6xeH
	 4/6mPDfDyAwKBs+PhpSj6Z5Ay7zgLV5KMI03cAyhSW+Zw4IIfd3iM2wBtwjfjKxFYyfh4
	 JmoVlrjaz570snQ6yUCypKT/czdoXtZsZtlDDlO6zEqqgyTpnJExtYngULox/vrLMeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IifquLZD;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9106860A2602
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9106860A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IifquLZD
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e96502e447so12603765ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274617; x=1794879417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4REj6Cc3PcYKPXeO0BJLjLikBlGobV/sM3/zRfrSm8A=;
        b=IifquLZDZ+cGll9llv67+7ME61nc7o7FQKMoq1Pmy+5nIBxla61YJWHsHKruAn+vkt
         1E1pM0yuqw7uDjvRtjt+gY0g0we1m4sBlfJfOTOa4nQvvuD0+J9DogAgK4oUBSLcpFVH
         UKQmY4AJPzhsBAhfF6i5Z5PnBBLV68vn/QBCqHtNaVTaE/1uxslVDkwlgZEphqjCIUTR
         KmfsnLIwFB1oE/ZOPOmcHaUcp7dLiqOm2dzbJVwPUsPRP3XBJjNsRhiM+fCcKCv2eFgO
         amp/0xP1jIWUcIm9ebZV3I1M81tgb8OVHBAMhdDZR0FRk9wQMYooq4l+B4nuFWfj6Qfo
         aHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274617; x=1794879417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4REj6Cc3PcYKPXeO0BJLjLikBlGobV/sM3/zRfrSm8A=;
        b=DQ4La8VR5L3jlkV2/GAowvK3VHViDfYte8hZ+0gya5GYb+Of3Po9D+FMBHqHEGl2Ar
         u8rLN7eMO46qeMGhb14YfgWxEpgp9AL1jU5leveNJ7SPaXaiZ6W3RuqbJ1fpbMZ9UH0o
         WP9Do7wu5q4mC70QXUcb3k2pdUovzYboN6pXS/UwucaRJOja4n3LlC900p/iPL0CxfK7
         UzofxrWra3sWyTYlLEX/DZaXRuo6hDCYHagfu9uzVZvXuRops9TZVH7eRhePEMLmUY34
         ZXtpk4rS5IHXoc2PMImurLeyO6xDsYPBbdg/mxdaWFCiRpBUnixzdzbD56hq6dm+sHdp
         yw3w==
X-Gm-Message-State: APuU4Z9RtA4sBQ6hf7HDvDg4zyPVmeq+fNF4KMR0NhwQ2rOY7EiHpgSU
	Wr4GVBJI2kCwrTEkjYBXRV2h7Uj7ymtkaYQgQHYE1lbepKlunFwH+hbE
X-Gm-Gg: AYBFou2G4VzavoFfDwTPuy/mSeStLUwPm0vtfxxy4pxIj7Pm7vAFTgSGK9lUSg0/uN1
	8oVEE7Fv3Az4hxwSyVoDd5JDn4pSXWOgAVzlUU5/Zz+TcllDrmRVTu7xiQzI8hNgRh5/7R7z72k
	4NeBpZkj7xC6dx5Yz8Qgb+EwgFHvS8a3FIH9UcT/39dx7jPusHFw8lYXB9Q43v3vb/Gw9Ed9Jbe
	fpwf/O9OoGuiE5u6eF44Q2oODAiRmXQGinGRiTDrEj/inYyOgO3xs6nCoY2gQMYGxEsaSGJhEFj
	5NSRf9EKKkYyd5u8cwO81nXKrJ8+D9ajjkhgSmvaRak/GlZibWI1v+OpI/zUNckkEtcuuWu5Ah+
	GPO1XS3AMNNTgZTfZvUM/GdnoTnzRl9waflp9gTATtfm4yEsWkiU7XLM2Dze5Bq+3uzRGG8oMqm
	imolxZOu6GipA8fEIIJr7tCNClZhdUzWUpvnns2f/IBZ73zIGF1kPSw06RiRaaezeXsjT0kfSla
	sana0y2BDe/Sy0fG20reTmehN92taO6lYke4G89nZmOWZn174mdNAB3lDKBkyJWO4FvO7QnXYLy
	qss0czvoY5Ly7dP+mSbmchL3B3QjSD+hoHaRN4QWcHo/BYwrmkHZHT0UFSeb+/yMgqFFrCLEHu8
	kNn+WM37al7gqdaxJoH2lU/ef/ha2uBznEzVl+KzAryfiV00YYhWPxus+JHZ0WAzCWMl/WotjKa
	ZoakuYsR59InnPac5xgdJA8uA=
X-Received: by 2002:a17:902:e944:b0:2ed:630:40a4 with SMTP id d9443c01a7336-2edb91f5535mr10276065ad.11.1794274616976;
        Mon, 09 Nov 2026 17:36:56 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm3399055ad.50.2026.11.09.17.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:36:56 -0800 (PST)
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
Subject: [PATCH v2 3/6] dt-bindings: clock: ath79: add the UART1 clock
Date: Mon,  9 Nov 2026 17:36:43 -0800
Message-ID: <20261110013646.1582970-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110013646.1582970-1-rosenp@gmail.com>
References: <20261110013646.1582970-1-rosenp@gmail.com>
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

AR934x has a second, high speed UART that is compatible with the
qca,ar9330-uart one and can run from a 100 MHz clock instead of the
reference clock. Add an ID for its clock.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/dt-bindings/clock/ath79-clk.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index eec8f399b9e6..f8a98e4d206d 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -11,7 +11,8 @@
 #define ATH79_CLK_AHB		2
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
+#define ATH79_CLK_UART1		5
 
-#define ATH79_CLK_END		5
+#define ATH79_CLK_END		6
 
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.0

