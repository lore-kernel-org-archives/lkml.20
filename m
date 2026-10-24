Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792879638;
	b=r+/eMf5kGmU8gZk4W9c4rCyW8onUXK0BpCDVw7eiZWXRhUU80LxMtrxGmSUdR+M0P/+x
	 XA3P2Cofh9c+raWdp+gsZY6UEjZYXOANkX4QKNTc6QskFWsVUyqmnPBJmxyv+GgSWpbhY
	 /8GznjHVEHYattebHnRCiD9MH5K4yfslmPq2fla0qhzszYKslp+RUN7CD0F1kTPwW9ve0
	 Wr3Ku+eL8wujQfI0aDKBz5sp5KbBTrmIl/tw/twbEmv+DCfUXpRTICSm5w/3M5mQJXmCl
	 zizaZOMQQrUIDErv+XlsB7YlTT0yoop1zg52UeYLtH7eDDKv41lSw6Rbrac0z+LPnyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792879638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tQ3jUZJIzHj6BmefEU8b04rCHYVmSDvqexKo06XbRm0=;
	b=aK51Cy5xWgfAJCMblVsQr9kOfKb6NUdVHnvGUTk/wYEVVdjoD4igWXMmvi1J1Tt5Jo2O
	 BI3DWtRGHe3mmsBznbb6T+UnBpEee9M0kSAZJnw23V6ukNpUDVZWJG38qaz2wntbvhl5k
	 xzC7yK54hCUKYQ4+6MbNCjLO+xZ0Erp1BvWRwuQVSreDVMMap+tJkvQf5Wj+5SQ/Druzr
	 ti1QOdU1gTl1g61IAzsWDeY+VDsT9p8ZZ1pYpyYh/rJyz2MXX8nhSU7PYm7pNZ5eagkye
	 T63HmvU0YlPzhRQ4cs01jMz5yIQVUv+4SGGzXwT6QNUocnRMT85+bH+U6Q6f0VotzLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=J2pjKcHm;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EDA606A325
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1EDA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=J2pjKcHm
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so12212295e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792879636; x=1793484436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQ3jUZJIzHj6BmefEU8b04rCHYVmSDvqexKo06XbRm0=;
        b=J2pjKcHmpyNpyYak4hiq1SqLoHAF6XZ35w75hkj/BumakTFlBwBraSHF2PagBbWmip
         W3Dk43oauZBfj1Nh2zbRvGi5ZPCe1peDeMDB1S1xj1IBuT5Ij2JhjA3cCE/su9ELlFMK
         MiRaxrm1HSw5V8evkCV4PZLumnDDXTq8oTFpVesi9wv2CT41uB16F8mFkOWBui/lnjL+
         pWNT9PKZox+11oMfnZOO9gGsZQzPxIdAhBL3d95XUuGIW33n+n9Fu4NPXThXPSORGoBi
         O5E39mTTHrUQfoFbuhnXXKHz4DvtOBxe5/VsYbn4MBCFI3OHLKClt7luQKEnUaSCVleE
         32bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792879636; x=1793484436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQ3jUZJIzHj6BmefEU8b04rCHYVmSDvqexKo06XbRm0=;
        b=jVW5wbYHLq0b4Pf5dYXpTFUtR3YFxeRVj2VrKD4zpIzKL65yBYPriMLvIeMhblP+Og
         fz/0SLX9Ax8DY2/HwadGGkKUvxa73ukcPKr/hyfN7Qzo/TPMp27AEH5SMLnCqPgKdEen
         bToTpS4ahaRBl7e/kGWlhNNHu1ycExGb+zLXfUtJVF/hcK7ppWDvG7aNcst6WkMX3ZRo
         3rMtV2On7+n11gRpFhCslPbXLjghL2zlv6YGGIU0ezqQUAEbGyAM9r3lDx1AujQwnwT2
         hxMHXY27MBzdkTcC2KwP7OfdDP3jIHPvboZtaELcvH0t0nhkHO/PkP1uaI/OQwe2Pfon
         r9oQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrWQ9htGY/S1PCDvV0+6lLDXoXnJsJe92e+f5ibsjSVF46y0Fy8+ByZvYLzIijk2a3whnpGaiG/1Q91WM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuEbpA7RHVFPzX2aBjF5YXcP/Le0/laMOBWTampPUe2kt/goc0
	JfWOuKx5ciPUDHBDiSeAhCPZ9ua43/0+zuwr8Y3vR3P4+4Vx7YiOjkIeA76kiLK6b3s=
X-Gm-Gg: AYBFou2dbWGeQr0VhcbvHoFb4+oIat3fxVbwLfzVk/Pd6qRmnSBY0XLvDEy2OvymLcF
	pvNSPj1NRsSw2JD4UAlRPoFK231k8F+OKcth6Q21s62nPnkvHPAkk0FJduOFWzkiVSydZVXKhhj
	zbGmGpWa1JD1UdHHlpwgUJmGW6fsCW9gL0205Dol/k7+pPhqrQ5kfck0FEdwPxpo35aEmKq6R4E
	eE9OYO/kM0Jx3MNF+No17X+mk+qTIL8nxPKchBh6TCrG8m7P36EtfcgwV5U8DIVWukV2LJKwXx/
	cogfjiIK4Uo5Yxt6Ulcfvv26QT7OfiT3PikOdXyU17tmHa7IT9/us1tljWZVaaWwLUD5fLSJFFy
	t0KP2oVmRTZHWkSguQFQLKEE6Fn8aanFYMnxinsAse3i5yJkGXXKYg3u2lg8TOth1a9uX6IO2GN
	lqgaQDtVtpZUGxCEoMoiFFSBEXM8Gggh2m92OS+lwxRFv0c5f0/JaWikx3gDDYINhNddg6wwsKl
	+UcOXtVi+7rxXG337svkKQWsTT84QlVDf8aDYe7+7hq84zv2DfNa4FK1wOkUsr4oF7+TA2M1Rh6
	s16xoslUltbpLakjOte+1gmux570i+ZYhWYtXmjw79DbSaaNMMX2BAQPV+OVXhgvAXjOLCg8fFJ
	yKr8MH8YsLgfvEbI=
X-Received: by 2002:a05:600c:4e87:b0:4a2:cbe:beac with SMTP id 5b1f17b1804b1-4a35aca73dfmr47824675e9.23.1792879635309;
        Sat, 24 Oct 2026 15:07:15 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a06da5fsm53466635e9.3.2026.10.24.15.07.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 15:07:14 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/2] dt-bindings: serial: ingenic: Add the X1600
Date: Sun, 25 Oct 2026 00:07:11 +0200
Message-ID: <20261024220712.23250-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024220712.23250-1-olivier@mgcrea.io>
References: <20261024220712.23250-1-olivier@mgcrea.io>
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

The X1600's UARTs have the X1000's registers. Add ingenic,x1600-uart,
with the X1000's as fallback.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/serial/ingenic,uart.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
index d5f153bdeb0d..635342d43ddb 100644
--- a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
@@ -32,6 +32,9 @@ properties:
       - items:
           - const: ingenic,jz4725b-uart
           - const: ingenic,jz4740-uart
+      - items:
+          - const: ingenic,x1600-uart
+          - const: ingenic,x1000-uart
       - items:
           - const: ingenic,jz4755-uart
           - const: ingenic,jz4750-uart
-- 
2.39.5

