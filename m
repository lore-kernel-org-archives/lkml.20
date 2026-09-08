Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA83258B6A3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883057; cv=none; b=rsbu+8MzgKrUWNSI95u+8TKWjrPDij9g05evSwZLg1YRYxZ56hyjQ27PeY2gYBFM7blGqM5a8HUbQR5NXf+f54x0bWs1Zn5JvihdxlECTq6cDsWYt0EbABLLRQP/Y1sS47+2kQiCwToSuvm7pA7P668Ym+qpJ3SOSnPm7yHdio4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883057; c=relaxed/simple;
	bh=3S8+SIZMe++uc49JSNvJUaBmn7A9ZJ1K3lr9hNoioA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4E0CZ37mD5IkqJUihFeMsD0adRRWqHZ7/WygmeOV8OzzY17tz/s7xuqehqNfb0bjwyGXgSSyKsN+u5/jTQDFT0lSQAewrQa/jnZqMJLP04KE7XukpEznyRIl/4mnKjCTzgDlDBJ05syxe4srSRgCKiNQ7fMEj4cAHbR+1BkCWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=eVK5xf7K; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="eVK5xf7K"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d036e0e99so19036205e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788883052; x=1789487852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYSjeGcJ1MZAeWSYitC/YaPtibetrH4tpM+XIfJ1kBg=;
        b=eVK5xf7KjGe1194lZRCfwEUhxfJZmJGwmKZXQ0lMZvL65VY6beZ9+BN6ISyQmuAeHI
         relgsr7oS/xlAJrI8M5VFlK9L9X2/sFc6MWEBofvj5BoX6Y/MCBhHKM3caJ3I6sYg+4I
         miVeqrDn/VcoQR4LeWjpetE6/cWLuvQC6nNvkZZ6W9jkZ1MpTN692RF8Jju22lZBMCOP
         LaFRTTaO1uXMYm+dheRLe7AdkXa0owHDZbvgN+7mtwu3LK4mjmCupHSNiI1CsjaU4GsH
         8OfsD20r15gKfKQfyZzf+rDS4OysOSGvnZOmXg0ZfoaOTEFrylGr1MDzqZ81cJoetXvm
         bQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883052; x=1789487852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYSjeGcJ1MZAeWSYitC/YaPtibetrH4tpM+XIfJ1kBg=;
        b=Xv5z323tbwc7NmrrqlUCRnpGsf71tv/z6qIMSXIiECFMO/XztYeLxI2douciVLrQGB
         21z679ITUSF+IWlh+YI2j14sre/e7BSAa8UeuP/CcuL+u329pBKSptXfLYUyu+AXV/Qs
         dfQip4139hyNlu4cP6VQZKvyU8J1YKNxMmG/e+w3M/yrzPhJK9E0UNC8o/HbdUCz0O7R
         sAutHNJan07JSaQ8wv1cl/5keqKpngnGe3o0O683Z8p5ZiH9TevRAlANHuS1Bc7z2VYL
         JgjbvtFJ1pWgUb6m8aYEhZ4gdpBc9XJThoWwcyFej5QOAaAFUHCthsULzJk7kj6f7VSI
         V8xg==
X-Forwarded-Encrypted: i=1; AKwUvBwaw6kMt6DhYn1CMj0E0s14g8pVcy3Z0Ul5HjzsrMXSO2CEjPwaVh+pnppozeTR/7fVgDHfEWzlo5If4Ak=@vger.kernel.org
X-Gm-Message-State: AFuF++lqyVCxGSwxlwzwLN3OJh6vpjCcH8u5XO8RNHPfPoY89Rd/4w+C
	OpVb5OGJoEiFBBtqcWUwfq2ur1p5XBif6b//36M5CiLHcd9dOrsCLmT/Y6bHaLVf/ec=
X-Gm-Gg: AYBFou3IPoejseBsdTh7LQRLjU6r45rxGuvtmxKZoDSa4YuTXmPs0SYSBIYqqhziLmb
	lzX6xCQP9P7pf+FbArI/bRW8++PJGglQN5ZDzcU6rXE5AuL1saoA2MRRTJL+ea5AVB6m3r8PZLZ
	9tH2RdXGekFizPtR6b5D7LITh9EL07lpyI4XFODjFQ6870u273f6QLlWmAr4OwPSFiW7kv02MaZ
	XvqTBIY8FUFrEx17jt9fqRKr733QXGYbXbJimZgxOZLGu7d8UAxOC3Rf6YCCn1yUkfBLk31KyPI
	yGfiiOZaAaD89ITBbHaOOPqshdkjltEQZRn5mhg0/6X6Pibcqn+etN4UrhLz2UQcFE8Yjsac0DM
	pr8mAbpVdMvZKkFcrh5fKzzTQaq4Y5fit4MftSp0a0R3vLDxMf3K2QJ1jqNsDtnOlfGydI8Vszh
	erkXVysMqUYi1RvndUpqUi4s7ZsDhsswnPTJCoUZk=
X-Received: by 2002:a05:600c:4e16:b0:49c:fc6c:bdfc with SMTP id 5b1f17b1804b1-49cfc6cc01bmr257597585e9.19.1788883052584;
        Tue, 08 Sep 2026 08:57:32 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm542370045e9.5.2026.09.08.08.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:57:32 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: linux@armlinux.org.uk,
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
	conor+dt@kernel.org
Cc: conor@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next v2 1/2] dt-bindings: net: ethernet-phy: add needs-host-firmware
Date: Tue,  8 Sep 2026 15:57:27 +0000
Message-ID: <20260908155729.4164814-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908155729.4164814-1-f@lex.la>
References: <20260908155729.4164814-1-f@lex.la>
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

