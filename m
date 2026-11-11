Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404980;
	b=ZnL4Zp55+3ZCv3QZUG4GKCI3RLNMnvkHiIF6OaLZdGxATQBYn2/PotZ0jq7fQ2ff7R/U
	 AGwxOLwzePHdBrDIqLAtdMGdEq08Cg8quplX/9J0LEVNJ4Dwrhjg02YNhpCf1xs/E2Fnf
	 TyLH87WstMwddvs23CKLm3KanV+eBB1NmaajMTZdebzG0OCqPcj5/sB60wNmeuHYe0yUA
	 mcRjgPTV9i2erpVs+AV+k1pGU/DH5WOOIQI9IsiX0hRFO3BJeXcaJflE+SfplnKlmBS0A
	 8i4YkJ0lzmuvVL5qMu6mLQbw2BErW27ABR6HzizQ3G6MXww5gkuiamPIu4ZVtbQVPlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ICmPBseWQJoBF6s/9mFq7gFHJnr6Bp/UIRwuOakdc3k=;
	b=WTLUpvN9ow0NpQiHIGkYETZzrtS2qLov8tot2A6C3MYUCp/J83PWS0+qDrFf7VYudrIV
	 NXEMlwcCJNp6sbzFtwQrAUoP19O7C5ZANW6V9KiCc5exE5jcqQe3rWeIJEJ9aUY2tgtxF
	 TsJ6MFgRsuY+GsKfcRn6RPSGBWXHfHw4WI3O9fMcXuZAH+nbjsiamTJ3xy5sw3fuZKp72
	 N8zP9+eQZ8QLFI8ZjyfpkQJkMWLh4KxxwWwErqK3U2Syp30x7FzVLatvTJu+YACSprcLr
	 0QgMS712EZ1p41saI5LkyO8YhwtHL3Z1kpkvhSNwms8RIM6X2cNTlESqXzVN5aF8RIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HsHKBm9J;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73062606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73062606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HsHKBm9J
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b3b31a6290so2701887b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404978; x=1795009778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ICmPBseWQJoBF6s/9mFq7gFHJnr6Bp/UIRwuOakdc3k=;
        b=HsHKBm9JEplJMcjdhmBEkJfuTrK/Gp7f+8n+G6/rynjE06L8JUK5XidxqV+upoTZDG
         R5fNn0irMWI4kZ9NTQegjV0D/hYyxbWCKteJWrve8rPZmdXUrRcb4MsXP034+vSAvDHg
         q+2nVaQwN5Z8jZqE+uRs1oDNStA2PqtNZcB66yJITYDeGZDhBTt+9EPHANqY6QroYY9+
         B2mV4/ovdywH4YOXI7g6USndZ4GYC8K3DId1uOxPqmc9CnGqCirPX/oq/C2BWfdLObX6
         9UadiUAnW+kNC1GGqsb7GUpyq+T0KwQxp4knEXbFqK0OUngNSNWw6DB1MZ8Bd403xKJP
         GeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404978; x=1795009778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ICmPBseWQJoBF6s/9mFq7gFHJnr6Bp/UIRwuOakdc3k=;
        b=f7qhIvzyrHxr33QxfHFzKJHFuZgLsfATRq2vfIr0+aSXp6A6onCVJeyphQNvnSgJVa
         0Bgy0lJnsuchrbbCmtLSV52pLEuhQhgRNv1LP8r6mYpgaJiyEvTWoubkRwXYBSBjbb80
         OuLv/ZGyMPljOgSgvcjGAKZ5r/KOJW7liLgEBrlTHo4hcZvjFveuYVwp79NZtk1OTKO4
         IS9iIATpR34myQvrCELsKvW6ydUujPP0cVLRkhVmAZiADcwwIGnzu56zKu4VVjJLssOA
         NhDNyUdkIaFAT5KtdEIgJYs2OPpiQA1XVQl5KLU/NWFF0voKIzwrR1AYRa82AX8VwpTp
         ObGg==
X-Forwarded-Encrypted: i=1; AL+hErHGgPyzcw0CBHOGEiZCO9Tbv9hexnYsVV0idWKqioMe7oB35ncovlaiDjiOrOkWetXlurQNVdtmidQdOzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QFRl7jRQjI8yS//GeXkAHNmAzpA/qYL13z09V5L64pWhEVyBs
	jHfazAwn2foPCNTEkFpJA1a6ebtMod3zNPAKXg+ocAfJVZhnQvF9wdpv
X-Gm-Gg: AYBFou0a7VKWWw4e6uK18DVTO8hweXmog1+uKws9q+mlczFkO4LaXEr8a0yS/3f11Cc
	f1u/fiCsgbwwmMFMMPKMLUyfN9i9V3u4quJi88CBJqw1exPm8xOY9xRVuXTUTCl5FbCZJ0wPBoU
	QCed6H3yOEpEfYLmEM4QpBzVYqWcTl+TvTxiY46Rrzv4/okKKllBY+fAOhCJkN3A9FnTyN3nPox
	XwrhCVrZSlEBHD2YpcT4Wv6M9yhT4C1VzWiigbqypsYSBTUCaXKRz+7H/PS9oga6G10rklXyhDq
	DrHRfpZCAY7bWkvDhNuCQ7ANldlypYAe9Rx5EOiq8f2BeE9WpSjkxEvD413ztsSziUqUmnFxmDc
	/NtIESlPeJ7mFwcygxzoF+JDMCFReYUzfE4Qqa8wVbJm8CXnZtewSXQiZwIEHZGBsYIoWmLfL3d
	yNbm8LgbydW6vtpTTJ9nMtL7E0czP0Cp/M2OhMo5HBlTvXuNbYQAGxJPRSOBuqKdSd+PXhIYxS7
	tNr+/NfMnaaycjthz9av0/EIeKNAKBkeCunh9BV7rGBQyKFUXGo44WvPFcY5Dh99TNtSPmgxFXe
	M46jsTG8Wp4YAzSMzb5zbCUC3uwiMx0URxGm0qOsXYxGU8XpCUaFPzd/mrTn9OogeddRJYdAs7Q
	fsUniOSAdNWs9Ie74hOEKbEi5x8MWHRnYNDYj9l0IKsFMsX2G08g5XTPrPM+2dH1mEyLOuGkIX6
	M=
X-Received: by 2002:a05:690c:a081:20b0:8b1:9b4d:b121 with SMTP id 00721157ae682-8b3a7ffd0admr14988867b3.23.1794404978378;
        Wed, 11 Nov 2026 05:49:38 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm44519817b3.34.2026.11.11.05.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:49:37 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7Z
Date: Wed, 11 Nov 2026 10:49:15 -0300
Message-ID: <20261111134919.90264-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
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

Document the Radxa Cubie A7Z, an Allwinner A733-based board.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 37a7d713ac71..2b9e4d3b2fe7 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -862,6 +862,11 @@ properties:
           - const: radxa,cubie-a7s
           - const: allwinner,sun60i-a733
 
+      - description: Radxa Cubie A7Z
+        items:
+          - const: radxa,cubie-a7z
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc
-- 
2.43.0

