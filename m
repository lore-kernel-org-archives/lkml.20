Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B2D4A5EA7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420305; cv=none; b=fkeg53g8QRkVWtaQOKf6JxgIS5VF4z2hhEHfNBIwg5Ha5K7/1hAnp90IzVpFipaTmvvgkQVjKJ33X0w5fUnumbBsmDveGpFBpIDT/7yf+7IGSYodp04QP8an82/RD5oILPeu8/MHAu/eqoIHrF8AyMguBBbn+9bCmrxE85iMKR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420305; c=relaxed/simple;
	bh=3S8+SIZMe++uc49JSNvJUaBmn7A9ZJ1K3lr9hNoioA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDrENBCiiW1mxrzq9Ah5E8SIdE04pEhJZCpEAusJZj51+s+sjPXEO6aB/5iXR9vobU4RXUuS/OVsGfBpRtd6QzlwD2V2oi7k6RUh+OcgA6uwqKqiKofSma3p0YBNoJ2P0K1xruCQFK8zmIlct1K+Hd6Q3zxoUmRRayhK74yS9rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=KVGEmQ+v; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="KVGEmQ+v"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so911138f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789420301; x=1790025101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYSjeGcJ1MZAeWSYitC/YaPtibetrH4tpM+XIfJ1kBg=;
        b=KVGEmQ+vfeO2uyobo0FlK/Bj4AsmveGrc8+wmc09acKvGyMa7PwdLRIdzVbuuFQzPF
         r8l0AOP0PvUw5Z93VntXYnN3zIlwLQ9Luv5UG/nDG/frZYiAgeO2hfyG/jnFRR9phe/W
         +l/cEpjGmDK/H0IbC/RA0m9YxcA9UQoyPehZ9FG3C+/I90B906GD5ep6QyE9DnurFGSG
         3oEsKUrW/xT73tt4spHGIfqCjn9OpH7zqQxrdKxxahOliyyAilnZ2jCF1kRdjhuQvzzU
         Jmg5ZNRzVEbeB3/oyF/qXNBFrUiwWg+P81kYAAuzvCQKP1TYLiTyhKnSi8moFHrDG7md
         fRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420301; x=1790025101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYSjeGcJ1MZAeWSYitC/YaPtibetrH4tpM+XIfJ1kBg=;
        b=r1f6Qyq8QdMfTaWYL1aXY/Gz8mUV1qPShs/6u/NPHtSiOieOZreFNNUwUec7wIj4Sv
         2zx2xe/MV2iLcfL7r+hZiqft3VZiIGjVOQDyqO7OXmy9vHBZ6iH2H3relewla3tvLF9q
         PoTN/bK7UIAFBxVMrDtbpFytdjb1fBaWuxtRBsnG8Q2+ALYQ8HLQTI4Fu/8/9PVknEH6
         waWtxpikfdwKG8tKXa+OY7h16F/46EmKnjTzvnRMNn1cEuyj+bk3NHGmOWgWmZu40h5b
         tvV2V76ERFTD8XeoDxRxGHiQz/432XYaEyAefkGqdK0w8O4Hqmx4UCPm55Kz3QU16d7w
         KN4w==
X-Forwarded-Encrypted: i=1; AKwUvBzt7glz+aVW7b16uCyWm9hOfM8tJGg/01TYcOEw8k+I3cc0D7qL/lytAv/iKC6495xcHclYh+Olka3ICcw=@vger.kernel.org
X-Gm-Message-State: AFuF++kWJmtJQidJn2BjXbT9aCgAFnuMpIWSBHghvRxmioqA1fIVL4uL
	WqjI5ZEbeaAN06zh8oUUb3IMZ4vriVt/FNZtCjXzQg35FsBwTYFSIS/r4VpwM14CxSA=
X-Gm-Gg: AYBFou3qAAhQUxTunoEUhVp8uHH1UibS3FjW/l/TMcve66UojNeHRiq5Eg6moFPnPkm
	AfeESxqvBWwYD1Ry0k+QPcuXR5u8t0uZ3VoPX6PkRU8x8YiryTzy6cE7mptifPtEr0Ukg043Cts
	JaRYejH4aF8oXzC0/x9Hcqq+aHZWlo0LZ8dZZ7SoZISMo0ZGgfJ/dcEd69b/HqGslDC9r7KUUgj
	GJPvnL85OrGryKonGiwYOoXL7ntMdMCkplcj6IZYWBTcyaKWbo2P0BzzA/XTS143X1nFAjYbvn5
	b4MXIPmQ1r/P9qNT6WG/KXRRigogSYgs9h09JGVrS4OztVSj1ZQ7q279UFbHoZol8o6q7eeab8f
	PhkThzBP+3Yh9rasDsVfgJuIuvxIyagG7Osz4y3X0Km8161330iVc6rpcZ6sWFRxWpXxMF7vjP/
	0N5TMJM7membt6qG6hOApU5KYkGaLYl+YiR1nNoxCCoc+e4zB2ww==
X-Received: by 2002:a05:600c:6095:b0:49e:6836:5386 with SMTP id 5b1f17b1804b1-49e7d6deeb3mr16021605e9.0.1789420301380;
        Mon, 14 Sep 2026 14:11:41 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef74a5dsm5642305e9.7.2026.09.14.14.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:11:41 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: linux@armlinux.org.uk,
	andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next v3 1/2] dt-bindings: net: ethernet-phy: add needs-host-firmware
Date: Tue, 15 Sep 2026 00:11:36 +0300
Message-ID: <20260914211137.2760618-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914211137.2760618-1-f@lex.la>
References: <20260914211137.2760618-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PHY can be one that the host has to load firmware into before it can
be driven at all. A controller that connects to such a PHY at setup
finds nothing usable and drops the port for the whole uptime, even
though the PHY works seconds later.

The flag declares that. A consumer that sees it keeps the port and
connects the PHY once its driver binds. It describes the PHY, so it
sits on the PHY node and needs no prefix naming one.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 Documentation/devicetree/bindings/net/ethernet-phy.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index c3ebb3af8b52..e217101fd54a 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -215,6 +215,14 @@ properties:
       used. The absence of this property indicates the muxers
       should be configured so that the external PHY is used.
 
+  needs-host-firmware:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      This PHY runs firmware that the host must load before it can be
+      driven, and is not usable for as long as that has not happened. A
+      controller referencing it keeps the port and connects the PHY once
+      its driver binds, instead of failing at setup.
+
   resets:
     maxItems: 1
 
-- 
2.53.0

