Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962040;
	b=berKt4dXJTD7hAlNJOaFNrw+smrcnfClwwR6IfoXxvf50n+Traz8cT6z0KajIA94KtqK
	 +wDt99IujHvNLTuISYXaJR6kwreev9mQU67osOozxLVpok8i8icgORhFwYt/W1u2+gQK9
	 YhyvJyhAgaw49O9vtvwdz0zdIMLYihbDVcPmEB+lx471XcFnTW8K1Elhnmr7o238EHQh3
	 tdFLZ2Ck5WJVmcvBWlV+GXyeRptyPBonU4unH4wj5yQfgQuNtnEcJYLiGvkTOqcn9iYI4
	 F0qXTu0pfDLUI8xvbbKUMZNH8lW8Jt1WtEiVF11ruoqp/Fgg5n4u7RSYbRGKhWV0qNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962040;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=l0jN2vxhDmORp4GLdhkPY56EqVBT5d3pZVuo+G3Wp9Q=;
	b=wUqeoaYmsxTedmrAKcKsTiTk5YtzQPMq5bWuPXxVdcmQ6DgvYMMaex7Fmsz2WMMy/SYG
	 FVpyd0lE0YdAyQfVXTRzYgNp6lxH2AtDdwoOfMVI8RsbQklS3Q1Ogi4qF+WShaJMbeOJb
	 aUkDp/Akivhceb/mQR6/Ggduzs0+Fqw9LD4Hk1hwe6atWP3SW9ZNdLXTDNt0EbShNl0L5
	 ruBAZAG92PecWcXTDm1U4tkMtnkrPVxKUWBPSl+erzlfrA43STUQVZD9TBXbv/mLHODFU
	 izrSVNLalV/7+nk08HKBpZXcB8C0M534Scpb798YveQkXVfMuhwHUefIMJSS7ngfTrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=OYwM95U8;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEB4606A32E;
	Fri,  6 Nov 2026 10:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BEB4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=OYwM95U8
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07G1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:04 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07G1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962025;
	bh=l0jN2vxhDmORp4GLdhkPY56EqVBT5d3pZVuo+G3Wp9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OYwM95U8OEeisUcEYNxeMFXwSJ1huiIuGXaz2YK6u/TLpn/YT+sPSdJSzl+HWRQ2Z
	 xPW1H6Y/19u0h0uZLA75+9JupZti8eFk1NZvUDD5ntXqYoQKCkPj8Ey8hiOS/LLywT
	 HeTs6CUJke5eehCbPduT59xK7tpsHcxYngBLQWAs=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 01/10] dt-bindings: arm: amlogic: add the Amediatech X98Q
Date: Fri,  6 Nov 2026 11:46:50 +0100
Message-ID: <20261106104659.54656-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The Amediatech X98Q is a TV box built around the Amlogic S905W2, a
member of the S4 family.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054fb2..9b35dc71e831 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -254,6 +254,13 @@ properties:
           - const: amlogic,s805x2
           - const: amlogic,s4
 
+      - description: Boards with the Amlogic Meson S4 S905W2 SoC
+        items:
+          - enum:
+              - amediatech,x98q
+          - const: amlogic,s905w2
+          - const: amlogic,s4
+
       - description: Boards with the Amlogic Meson S4 S905Y4 SoC
         items:
           - enum:
-- 
2.56.0

