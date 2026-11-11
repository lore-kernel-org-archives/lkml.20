Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434266;
	b=ZTE/qMi7wWQynAqRy9/EuBg2xq5wSl4P6fAbklKfLYaYwuzB+K8RZ+bquVtlzUmWQVgW
	 k5kWHu7VlpM/IgqlaP2cR5dQxssTIiT1EjSYS4gwPFXnq3feYtUziCW9gRmOHddD/SqT/
	 ELUQ8qSguTD9cgmqMnK/0E8YziD10+3TNOVSDHyZ+vIk2A+QAWkTxU+uXQbC36gxc0ylp
	 5GG8VAOxIIplTnRBKG6XObhKnyg/jE5zi23cysJ2hl5zvP6G5phsG6hBMgV3sprT4zzxK
	 rL8oWsR6S5ERSbehHvUdvz3oaRNYg5EtLoGITk5H8RamTzxLvVpQFfu810dMoKmZGgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CsB56uTJEJHrtz+2WjYnHjiy4+fXaZizurtR1/wh/6k=;
	b=oZNAv4MUSc4scUQlzsZSso7kI5FAci2gcE3z0pWolRbYnyB/p1r4oFdPlTq49uh6azZz
	 Vd8L3WDb42xn4cpMaxHn3JlqymFlzbZKnZIAMdkYnbbLQ8eHG67MFBVa8PNwlWc/VV/y6
	 2FO9r8tzZGTEh0eG5ng6FxSlgxJRD82NRNFZapKto++PBHhuOdk4DONlQNZzVW189BCf3
	 CyYcGMgmFEKeIIEZ9p/nTi+DGcDWPSGE9UegGf+WulQDeS/Jjfxzq8pT18wXT7mUCP4wW
	 qeP/eB2faJyv3LKxoPZ7F9UK2j/mTb7dIHLPZ/LjNoYyeUr5FZE5LxnNhnycFpRl1Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rrVIh/Fd";
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D4160A380C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9D4160A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrVIh/Fd
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso1566073a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434265; x=1795039065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsB56uTJEJHrtz+2WjYnHjiy4+fXaZizurtR1/wh/6k=;
        b=rrVIh/FdrV8ih1hGXt254oV79FoZzhocTRet+LuCZ3i9sYsg6p+u8oviKyhrfht0Rc
         sUWrD5vMUOiVIOWKbVngXvsNsYnNk/f5YUXMJ0JYhZKgUXEQU2mimkGc8UHmU5wp1ftU
         ooQ31v06a6Pb/+YxXeU6izgiJ1wqCOP4JRMtqxJ6dYDSwyEQ9dsLyu38XxJRbDwnimD2
         xb7CC4Jf9cQpp69hjgOCbvPdsYZF9QFGBVjmhUmfyo+e1iL+SlJuyKlFE+q6nF+ZiLfd
         R3WlcvUfeOIun4ydxcXV/PTz4IAnxeaPjqZX3JHef0iPI511canOs6fHg6KrqIX583Ak
         xkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434265; x=1795039065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CsB56uTJEJHrtz+2WjYnHjiy4+fXaZizurtR1/wh/6k=;
        b=N8GJ0a44dVdVYMMHV608mJasJ7UFkbG9cqkWqFio5Xaa0PeGGaa6zPqSzPwPHO7bnT
         nIvzU3eAw5NP03Hq4PlW+RQO4ySllXYGzmAzwnWFq+IB2rDrRkLZuMVErt+NiypAAYir
         /9d6L5pbTo5MiX3NDIsZoN6iffQ36YlpybjDWpGIUylHrdNjxPF4l71dnSAnzVeVLOM8
         wkkuuvblpKZSrnSNLB/FItuAGNpnJHGJ5Umaay6iNucfylhZ0qaZj2rX5/0GxT+qtYQB
         ydpsmCp+RcXzmme6jXs0KVsR0bVwam4Kn1+Sk3Ft5vO40LryJF7safeIr/v/K7hLYjc8
         /wRw==
X-Gm-Message-State: APuU4Z+MFS/nFrz3LYYrb7oUNhd9FAaeb9omsDLGMNWIbqMCPuWsRKp9
	ylmSj6RIS5SGNxFQNAqZGz5GYxWT5WUqbuFgHRGk8tbfcRWuShG/O9qE
X-Gm-Gg: AYBFou1PRb5GAGovQzZV/2YR9AakV1xEHs0l1X+XVhxHQ9Em24BsQO3BarH4a7QezSA
	F6/J9q7G5fmzNVZLmBHNz/9/UqoMVnu6kAMtv8YSmmaKQc3mSXjYReDzAKo/dDYHUgf8I1bgffl
	mQYWm7t+0qjwsoI6bkmD7G7NkGVaFwtANTlF98gP6cckKk7wtgBPcbc4kC9pxL6/n6P5haEiu9A
	9PBLQQxiJ+T+QdDmrYNXiItt3RT2mTpdedT1qx7OakhafW/TyVKp5jmtxtbAGyVdi1Z0AbdySTP
	Qg2X2IDgSXi7oWkUmRCwEYsUgoT3A4chA/A9PiKm4frYWojb6bOkie5WUG/cV11772OkLT/ZWHb
	m0q3c/QEYSuebey2S243n739n3zpYGoNCSMOqa6odyOumwoAWukO1E70gZH9KyL21bZnkrhCCes
	Yvz+S7sT+uPeqyax6LFp/Vgcm2OM+VkAwNxhFW46SnOhy5fz8ycZm0WZv0yQ871NzJSftk5ma7c
	i7Dc1nCCZ2Thq4M3TDnDscFmBlKUj8WpxLnzOqOu2RsVIziqYzpnPkbpCASJXSVD6dca/2bMuPI
	z+uwyMs5jp2LelV33PJ/X4aSA95V/JbYohxOFk905szHOarSoV6FZzgDAdSREo+phcVCCmSlrzo
	OK6e4DzDcUHcsEViKsp0Xse3ug67543dmTQS8ak0J22utQ2O/47Q/e/QMd49lRcy3GT8TNHIYfl
	y1hTLrFfxUbnOFTTT+YGnTNO0=
X-Received: by 2002:a17:90b:2e83:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b182fe6fc9mr3518665a91.44.1794434264676;
        Wed, 11 Nov 2026 13:57:44 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:44 -0800 (PST)
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
Subject: [PATCH v3 5/7] dt-bindings: clock: ath79: add the UART1 and PCIe PLL clocks
Date: Wed, 11 Nov 2026 13:57:27 -0800
Message-ID: <20261111215729.10683-6-rosenp@gmail.com>
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

Add IDs for two more clocks:

The second, high speed UART of AR934x, which is compatible with the
qca,ar9330-uart one, can run from a 100 MHz clock instead of the
reference clock.

AR724x, AR934x, QCA953x, QCA955x and QCA956x have a PCIe PLL, which the
PCIe host controller nodes need to reference.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
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
2.56.0

