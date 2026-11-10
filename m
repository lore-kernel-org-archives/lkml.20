Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274619;
	b=5GKMBuOnSfsH83UbCv7EeaijmgHEjYE3GTTMZvjyHLqPuhN5kQZHqVbha3XDc+byd1AB
	 TXl7Jgkm0pQtJ3zi9YfdSakUzQvoN46auC4dZxovEf8ag3tLbMFZv9/raoGK8EX8udkcL
	 H9UWzt0MFCSShAkjJJ2jLNkAZPjJ354YyrGuL+BrlQmuGscV+RGgtn/DX9BGiG9/Qukes
	 HgPAOdI7JMqgkG1LdbpFfZSIlzZq7UXitgg7KgxOZdk0owCEJLXgOtdfpXyQCnfyMdx+v
	 xSg8bKM5Fi9N0iKcBDZsNOoyoERF+YgIM+yNbu7r68qudKyyozSU7Bw6rONjlPg+Atg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PgiLeA+AUEhjknnf87xwKUw9Fc6CxmoE+hmCmn2ebwY=;
	b=umBuZaT2JC/u4BuixVsgaMcp4ksAPAFdYJKiZ+MMkrNZjSQ5aYvPeFPrWrD4m9X1Mk12
	 OnE21SfVl60hp4RXkjVD4ddOf1jP2gU3NS+wnDAUIu1RcXwXyXVEVydrhVeptERoAugmR
	 IQ5OqijH4qZM/XxewPUrKa5I8TLuWoOj+AAPy8m6dzpdSqe+hqg7MRij4ct5uwQMXr3z7
	 jpuLS1Fbel8U+h7yTZGxItAAhwpFrq1P4WwowEM6re6YVoTcxP17N5LtpBP7RsxwexLot
	 THT0Qe+PpfjZDM0II8iFsZVczi60POKiawoxy1pUi2N3zvArnhlvqM3EOWm/X9PKgJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J/Rw16cP";
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026FC60A2615
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 026FC60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J/Rw16cP
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so6244975ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274618; x=1794879418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgiLeA+AUEhjknnf87xwKUw9Fc6CxmoE+hmCmn2ebwY=;
        b=J/Rw16cPObp3yLW1VgpFIWKU4KeUmtm3z4y2VmDbBVazCBovIs2FM5JXnEVwLXyb2X
         9STnPdgpuFcYIdVM3DG8uWtyf4DXNvgRhjft5K91+pQhT7yhrFIrgtoXTAIJHEMp8BhT
         quYrdUTNAh8JM7KNW1t0MQ5OVtX9gvOFWrqA6oO8k4/zq/um962HANiY1NnnRKg/KrG9
         fOaVnSYKG8QsM2w6ProTIwSKcQr0Q655EEfVLg8h9CFjBGNo4xnQ6i8wD5wdGLBW7ZZg
         dH4UkYQ+JHj3usvF6fExn9sBCZq4T3AwLIH/QZsRXIBt+1CImw8EVTclYFU51Amf5gvS
         xgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274618; x=1794879418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgiLeA+AUEhjknnf87xwKUw9Fc6CxmoE+hmCmn2ebwY=;
        b=Vqk6USckiPKkQNEhgMBrlTtlOqWPPIeXSeucwkKbQ91p/TPGpC8MCviHCTR+gJYWHT
         pdZkkJNxYucvp0dJIMfhAbcYEXtuvh4uZC32G8qei477+DBGLJFG4X0A0HQgAMxepmqR
         mCPX/s9ODXhk0EPe4ExkCqOIqxMk2EcPmZEBA2RDGLyt7UOqX//FHaAFxXdPEvUeg0Js
         CZn+qVX3e6qgvv/rmQzsyczcf+16vqi1+/8F9U7OAlRwVGjkCAw/vDSLvN90cMnIYb8x
         waHUYarZIEv9XdUdG5CnltUlmbu3qTCNLFG7H12BZEfuDVo7FSN1h9WVCgN3HSc53SmK
         pYdg==
X-Gm-Message-State: APuU4Z9u04obZwBbmivyt4xOSnTPN+tz3ML/x4IuAh7xutJwy1IMNAPc
	y9R6bBARDhtSAZ7pdjRrbzSNfG+x+GiBMcA+oqmq5tnum3I/8whzIn1G
X-Gm-Gg: AYBFou01DaBic4n7RPRy0J3rRqX/nWIPHjDPxkHIv7zvRO/8Pfu/YyZWWQRW8GyZnq4
	GGjMrNKN3nHUJv1A8vDu6FBlVl/5dmg6yHhBXhUI7fZ/To0yAJksRivHj2d5lsDDAmCPWiW+IfA
	G2RBFIg8bfSIxThjQ+8R032av3hH/Ld371jKKgjDrTclSv+laeivCv6LW5k8wPiEwLcIZ8BaWxK
	l8hfvhA0L9mJQywT1cKfkb9dSSHKfccGgfxP8XA18G2wmbpTddyXBG+CTuFb5Vth2wFTUqrpdBn
	sJ/Sbf+xLyIZHclk7SYvmzslSLnpwrhmwcmt9vcVsRhCUm53+BpP1mbSUUxXyHvqSiEHbJAQwnc
	Pau3cakUn1L+LJLwH5grKXtWMLwmmcJKCBz0hjdqaVJ8Pa4GGytK/c16POTE/HjTwujxalRBBTQ
	1RN5OiQVFYpkDedeEjNfDqDsz6lchqDMvLT0wZC7ShEJiths4R4PhwCoLLFqw2D5scrB/ZCvi0c
	fZctaDztImXyyqulGdXo6mSQiFG65anf3OMrgaE9HCVk0XIJE+3pavQ8Jk+JqqnJjQycp5tGCfu
	q3boXKn/TlpNe25GE6SiDUYbtnprzPRGTjPbFD1dKhdFCgQR6MEIEr2WciA2kgq2PTzB+Dj53Gz
	F885WGrRBcVIvyBYVX76rMI25iB5oNBX+qLOz4NZzm3Qa7tt7YgT3f1pszmI/7JQtPq7Dl5cl46
	EATA==
X-Received: by 2002:a17:903:1252:b0:2e9:5c51:19d4 with SMTP id d9443c01a7336-2edb912cd82mr9735785ad.29.1794274618427;
        Mon, 09 Nov 2026 17:36:58 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm3399055ad.50.2026.11.09.17.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:36:57 -0800 (PST)
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
Subject: [PATCH v2 4/6] dt-bindings: clock: ath79: add the PCIe PLL clock
Date: Mon,  9 Nov 2026 17:36:44 -0800
Message-ID: <20261110013646.1582970-5-rosenp@gmail.com>
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

Add an ID for the PCIe PLL, which AR724x, AR934x, QCA953x, QCA955x and
QCA956x have, so the PCIe host controller nodes can reference it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/dt-bindings/clock/ath79-clk.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index f8a98e4d206d..e4956afd151d 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -12,7 +12,8 @@
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
 #define ATH79_CLK_UART1		5
+#define ATH79_CLK_PCIE		6
 
-#define ATH79_CLK_END		6
+#define ATH79_CLK_END		7
 
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.0

