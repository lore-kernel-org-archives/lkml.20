Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960359;
	b=VOxgFgGW9YUAw2MC630AemYe4fbda+D6uIdT4R4t0mDkZvK6LJTmZqA526SWEbVT55Kp
	 1SpE0e1h2DpqKhCtaeH+iI8feEcXusPSHeWjmYoCOWENVpbUMRkbeXnUuNm88XL46SIza
	 DxmZkOsri90iCRl18Ob4hIqC68T6hjXLcsp61Z1JsU34xyqN/URWLflj7dHzj7MZ3Autd
	 29iUXq6YWE+11vz5v4ye3VZDekG/v67APS4JSXEFHGK4JIjDlMbR6B0Y+ISjpeFiUe36Y
	 uy4Wx7RnOy/tmhLjukpd+1Lzf79vk05mHY0+lox7ZcbAyEhSCEzyNsDkmZ3BpWMjBLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960359;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=NuhksjsNAdRQMqvWLmBXY10ekQvRxyZAMILK7wtyNTE=;
	b=JYrPqRjbjNh1IaydqNqYdpx7qivNceYP9+pyIsMNKB1eLANpi5y37tyK399J1IQFCs1t
	 WL2f2ruIRTiCJ4XVS19zEzYc68tooRUS/NK4JyvEUjng28BdWDzyAqjEGvzQRugZaMLQ5
	 HC5kicdk45jRSebM8Zyd9HUzQX5R7JHxeCJFu16LiZSszelKeA74KddoB5TuF64hVbGkB
	 8J1WTYIWWiPb015n+RsTdZvQbi3QESmWMo/uiOERjrclwzfiiYtuBjQCt2dOLIA2z7HQD
	 6EiqRg8iMRZ4qyKiFsUYCIU4AhSWlbZJ+y9ESYKENfQaA+3Y7uBlJlIp99+iG1Z/3gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7506E606A326;
	Fri,  6 Nov 2026 10:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7506E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AIuX01863787
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:19:01 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AIuX01863787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960341;
	bh=NuhksjsNAdRQMqvWLmBXY10ekQvRxyZAMILK7wtyNTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iimGG0wyGcPDv0mJQfxfRrFbN3WZDTTVEJubsQgZhjwekItHeHuQ8iY/uvgURi3ZW
	 +6T4IGvfvM5o0M9YYTOuZlcKF2dRiIx4oNSHgWsO2tJbJo0IZPeiByEZla4QuMae86
	 Z9zCLWPJcRvNEilAFajRmGpHvATbIEh9iUdgggRc=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2 1/2] dt-bindings: firmware: amlogic,meson-gxbb-sm: add amlogic,meson-s4-sm
Date: Fri,  6 Nov 2026 11:18:53 +0100
Message-ID: <20261106101854.46569-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101854.46569-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101854.46569-1-christian.koever-draxl@student.uibk.ac.at>
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

The S4 secure monitor implements the GXBB interface, but its PSCI
SYSTEM_OFF needs an extra firmware call first (a shutdown flag), so the
driver has to tell it apart. Add an S4 compatible with the GXBB one as
fallback.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 .../devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml b/Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml
index 8f50e698760e..6ff2ddfcaf54 100644
--- a/Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml
+++ b/Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml
@@ -18,7 +18,9 @@ properties:
     oneOf:
       - const: amlogic,meson-gxbb-sm
       - items:
-          - const: amlogic,meson-gx-sm
+          - enum:
+              - amlogic,meson-gx-sm
+              - amlogic,meson-s4-sm
           - const: amlogic,meson-gxbb-sm
 
   power-controller:
-- 
2.56.0

