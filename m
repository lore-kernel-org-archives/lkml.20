Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826571;
	b=whVuePnDe3wGj8eJyjmDiA8Ol+HeO6FCyREIARbP0ta0e7j+ACiFCMnnUPzhFeU5emDb
	 Wo/lITYyAsI3sNr1ibOy7x/2YPiUfPKtSHABuag2PFVUmpwNoW6A0RxZs52Dew4sDc2fl
	 MfluoWKgT1wQVP3rYxip/Q9qfJ8BhuQ79L5hC04Q8UMaCRcI3cewQq+Eu31R7WMi8zMsa
	 RugwCJJbVCA2nq1I+/P4xk0KoXKzIIIZzy2RRWsxfWbV+H+bqQqlqk8BxFsBuUfdieDG+
	 hsrwZhJqMMIKVxBOMpbZlLZGhMHTKVAQYAsMDJiDFIl0xt7fJc0SDRTRUdb2dewozBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Uuenm5c7uLenhEpnUWoxIYDWfrao2MY0rp9vEXUhv6c=;
	b=Pua6Wfnw6YoBExrunBf3dFyDQRI5YbPclB/dChcgG7g0FJann0uCg4zAyKpIXHyyLcIT
	 QqC1DCaqleCt3QakT7VKq+xRH4ibxcyW3FgK+qNiWq6ntpEItiAzS2mfMeKtkS04y85yf
	 QUBZNeGFFXyjvOKcFMXlzDdDkmhk1oIsvr1dsmqqadldSOrmUm6oulU5q+1gXyHYhnADv
	 cxo/3wGOEQrPVJuYoIum5s1xiJjSZKfR0tUtsVVVI3MsPRLooyTiT3gZOblXTPTUQ1mjZ
	 x60qmsokP5abFcDdBVxNNgB5GhkzWE36g6XXxfCkyZVOVQK8O69uSbngQRqcLR7zP3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=me5ihzqy;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325D3606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 325D3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=me5ihzqy
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67db35e7953so892114d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826570; x=1795431370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uuenm5c7uLenhEpnUWoxIYDWfrao2MY0rp9vEXUhv6c=;
        b=me5ihzqyzMngZ33PKeWakS+9H/wF+BrDnb3sNRskbLAS7FAfWcXRA/+3MHA1+x0PwA
         yL1Zw3c2vxCKQnpDLoeE6EY0HFmer37j43SgHK+jZx1oWwpW+BvKNEXLGfKvJ8aoC7n4
         wBmAO7eLNAqnaTTBFMaY+OBsLJ6K+UMOVn4N4wMqwqdv/IzbfGYB8SIU4gusKnmPNbUx
         ChpnbkAS8s8A5QB37c9ze7VDbl3/KBWfes0LOHtweXot4ggaIy05zP9JVi/ErSOySF8h
         s6v9DhRPV73KeQYKmt1L6rQtyY4Q6No0+o5X9gLIiQX7UG1k6rWYlkjcT+5n8UEpeQ+D
         seNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826570; x=1795431370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uuenm5c7uLenhEpnUWoxIYDWfrao2MY0rp9vEXUhv6c=;
        b=lIOdGDT6OleH+gxYz20yMiSaR8vZURJHTOdeyPdXf8uqc0lvewadu82wV+GX+9b62v
         B27UJ/f3UQyjKWkIuGw/iAJVz1Fu2CWaJP9UFNaMWGuUtFMfi7AWMacoQy2GipGWUC8f
         CdhjboCWEM54PAR//6nUSqnzdaRUU3rI0dryVFi9g4EbXnc6l/Gbh/XbeI7STu2NQFPd
         NShFz1L9KiIX4gCjGqHWy5fA7aPZdYck6nQ+YUNMCbHSwu4O0NcTkuP3/crOC76Ep6d7
         ZubCSXPaiiKWWZDy96uHqDLLl1RKVQmX5jCS7OebndEKOFvMT5aqDgiml3ay+Zu+lV38
         OrQQ==
X-Forwarded-Encrypted: i=1; AL+hErHiREKz70JlYAm0yX0mV0YPKVb1Cav/62XvQKutCiDpguVrLReCeKJJqDZNPOKOSnClDKWVksLUpYxl8+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y600pFXxYYWPOB5eL0lboBZrArTjwozHUOMEiv3DojFQz7SnN
	2kgZ5Nc91VMemEXVuY69KDhguJzYnxvsGtcUKEMnqGadpV9xTmK3/pDE
X-Gm-Gg: AZFdTZeGM8AA2mM5rFXq4RbNu13epNVwzssWU9fKJ0YUDyOjgIYt5A4/xKdlrdYDK0D
	JlZgxUGoZhdvaW6xm6De/Ft0Rw78AXsTSmjizOlEUhfKunysxE78EJc23RMe4tqpptA17KB2Lnu
	NkZ71bU4eojH7SSVvrSSh4HOd4pgV42WxPvXx/fd33BTz3TZV7Ftja64YhyA8GuLAbzWKaPWM43
	YxNMuArsH9AuN3pEKUidI15fxgOFDQKujI/qd+kUVy0kjJiCWDfUH+vaEme9tkvs3hX8WxZnsNx
	JyZhYtjW3w0xlZMXiBBtgAOaLkvoHNu5dWvrQeV640mF5yUzOTVfn0z6hthINJsMM1P71UbBGk7
	x70t0yvYQZe0IWc5PlMLm6JRY0z5ccU57M0LxRbyAzLtZ9O0E28KCJZJt1HakJq0CA2bJowkVsr
	pGKs2jbMHlxT71PGWSX1rcgnC2TereXEfef3XGGvU5bscLC0HPwDKUDZuVjdm16FIBCphJjgf2l
	QQh1zHER0BbgHoZxzFIJUxcvnj22dohdgXqhhtiZyOPCm4KETOz3OP/CiRYAXcHjqBt7QagigR4
	4ma68rqwgBAkr7aFmIttMIMnb8swPMrIqI+fv5hsUB7txPgggRNaCPar8VKKb35SgH+wokbOxlV
	vCrMYXDxjsc+XCxJ7/gKtuF35Zp5j5IyX5nwL
X-Received: by 2002:a05:690c:389:b0:8b3:2445:889b with SMTP id 00721157ae682-8b4aa2eb92bmr50305027b3.91.1794826570279;
        Mon, 16 Nov 2026 02:56:10 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa41:8a69:2b8b:32cb:351d:f30d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7f1a0dsm82274987b3.1.2026.11.16.02.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:56:09 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
Date: Mon, 16 Nov 2026 07:55:43 -0300
Message-ID: <20261116105544.669029-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
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

The Allwinner A733 USB 2.0 PHY uses the same configuration as the D1,
so add its compatible with the D1 fallback. The A733-specific
compatible lets the driver clear SIDDQ before releasing the PHY reset,
without changing the PHY configuration.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
index 580c3296a18d..da4ad6fb3531 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
@@ -23,6 +23,7 @@ properties:
           - enum:
               - allwinner,sun50i-a100-usb-phy
               - allwinner,sun55i-a523-usb-phy
+              - allwinner,sun60i-a733-usb-phy
           - const: allwinner,sun20i-d1-usb-phy
 
   reg:
-- 
2.43.0

