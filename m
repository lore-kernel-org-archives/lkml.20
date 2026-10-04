Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A973C415E
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791130352; cv=none; b=YBDANuGMgAtQ3jAXgqIczVjdyh6iPmF18HJeB4kDTV69FFrfl5fXNvTZlFAhxPZXX//HVBHfNyKoxHCFnpzrI4bbd1ObISwaO5RuySrHo1MGWbjv58UKgWncrFXVoi97+r084drXckiGMQBDWa4Al5ZtcG6oWgX089Uq2h4MrnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791130352; c=relaxed/simple;
	bh=rGVDhqNGMh/JYdQIJyQbUCN/WGgje1VQT/kVwuupxBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XwTydxKOO/V58iKEa6OPZwXodTYmYoEQWLhdwIPO7PCybSLc4mhaLQjMS/cQEREEOpudXVtpeE9eN0ndftS5rChmwq40YAerGMl/p4LeJSLB/lj0OVuXM3kA3A71aa33SokK6K4f1dzHzsFOwzxo7rqrQEM9fHT37nK35+DQ78A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqG3K1F9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqG3K1F9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so7168085e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791130347; x=1791735147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZusJdekpvX4PX2r/sDPDS2JQlQc7VESUY/IytRH+5Us=;
        b=AqG3K1F9PG1AZM+m27B6P0V70dDBd2YzpETq15CK8+q+OJgsGAh/WS5V1QQgL6WK79
         OeyDsKHsHPOPb08qyJN5PyTn1Tafpyetke3simpPH05GyosDr+3CXDO20Xqy+zDOJ7SK
         7hJIZ53rmdSoVgBmDndNGijTCGqBszV70yjQfUBEpg4W8qtIeBVIgJnDWEqjimn1vS5L
         DYBeyGZkcTVsbozE3d7Ch/j+W6X7O1NNePTerKS1WKvsHxYXGhIdujXe3bsuj948hNZB
         2woCFIxAN8qE0EeUSiM3/xfPgFcnF/yBg/rnfCawHRKSrrHhLjpW//PZZgGyziV6uOyP
         1LqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130347; x=1791735147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZusJdekpvX4PX2r/sDPDS2JQlQc7VESUY/IytRH+5Us=;
        b=ZH/CKUYCF1MIG0KTCzMd+raw5BW93CkrTZuXd8CUIdnZbdIgtfDc6m7vzccf1+V9/C
         talYYQD0Z3lAwT2mA0r1feht7EakDr6c9trdG6OmNS/9CRt9cK6p1WS1kqn7YvVl49ap
         K1sNflVxe41q2F/TwSwv9/Nt743CzpvGJoMh1BPxHZULBs88WiC0ZmFcFIOx0k1PJja4
         raN6rIxNx9Ey2srfcFSgkGU3lemKJm3gYgXI6sUtccVlLVI+kQxR2vggxDxAD0VaL/vp
         AfNlO5SSkUfjt/QgPTlnQJ3PXCNTo3zlZaVSwAZKx+sM1YazDX8q9k8qEM4is4csq7X3
         v/1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwyeBTHaNw+Ikbs0L4O2Yf055zQdYVp05zDl/jgfjN58drgqQc09bcTtz/+rwinWJspftScx+9AB1ReBSE=@vger.kernel.org
X-Gm-Message-State: AFuF++nvOP2nS7IDwqm9uIP9GXUGzS6yEt4tOn/JFaUeY72KM2OYJ2id
	g1Pf5FbBffRSKMg7kktLIdg0REcO7657+zp/QDVTjQVSBhdbDFLi2AVR
X-Gm-Gg: AYBFou3X9PQm24WxaCHzOAkfWio6UhAloHtU4LqILyE+xzMUtUQAt6X4eCxPijj66YL
	UwXCwxro76OOEWMcMaQQhnQvkgsXvExaeRW83pnFrP8GkSRU7PcXgFqgHs2dv7xxHtY0MLKRZYw
	QwrL/B30QUBTU8AdN966ElBnx6C+xR0zfm3Q0+1njZm4IB7nNKMBuyDMTgKWZtQ4V+zlCWuQMAn
	uc6miRRMjMCUaDnQmsIefzgU4/7c6E5Wgxug2JYQaoRVNMH33RKTSthBhimyURdYURxaZvr7oX1
	nPTA7b+7/1TC0KjcubT7D48rtiCWzN4uaNzUfx0qE9xa7Vbszs04j94u8SdJhv7jRNBPhILeJPS
	RyiZYYkoVBuGx7Euf5ZG4wF44qIo0QB+tRTx0Fk05uchwkhWuyT9i93K9Kxd9R70rWVc5G1k7F0
	n7nL7Iln+fThdRMDIOq6kDvJiAbe4IHyxAiU89nKn0wIixiD2IL9ww4VSLsQnUqCPPPLousL0rR
	SSYYU4KnPb+xvHXAuF2ZmsZ8Q==
X-Received: by 2002:a05:600c:1f93:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a1728f7420mr2621165e9.26.1791130346465;
        Sun, 04 Oct 2026 09:12:26 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm308438195e9.8.2026.10.04.09.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:12:26 -0700 (PDT)
From: IS20 Tomer Maimon <tmaimon77@gmail.com>
X-Google-Original-From: IS20 Tomer Maimon <tomer.maimon+nuvoton@nuvoton.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v10 5/6] arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
Date: Sun,  4 Oct 2026 19:11:50 +0300
Message-Id: <20261004161151.803563-6-tomer.maimon+nuvoton@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
References: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomer Maimon <tmaimon77@gmail.com>

Reorder the pre-existing NPCM845 EVB DTS properties so the base board
file follows strict dt-check-style canonical ordering.

Keep this cleanup separate from the peripheral enablement changes so
the functional EVB additions remain focused.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 5edf5d1..2dc1a4f 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -5,8 +5,8 @@
 #include "nuvoton-npcm845.dtsi"
 
 / {
-	model = "Nuvoton npcm845 Development Board (Device Tree)";
 	compatible = "nuvoton,npcm845-evb", "nuvoton,npcm845";
+	model = "Nuvoton npcm845 Development Board (Device Tree)";
 
 	aliases {
 		serial0 = &serial0;
@@ -17,14 +17,14 @@
 	};
 
 	memory@0 {
-		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
+		device_type = "memory";
 	};
 
 	refclk: refclk-25mhz {
 		compatible = "fixed-clock";
-		clock-frequency = <25000000>;
 		#clock-cells = <0>;
+		clock-frequency = <25000000>;
 	};
 };
 
-- 
2.34.1

