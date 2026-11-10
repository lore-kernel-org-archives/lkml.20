Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322984;
	b=EhQ1ZMWzwXgUCRiYF5PB45yPn8HJ+P4N9Q79Pumg8fz/WrFIDXfoY5N65tS83hhiTckF
	 x+NMeIOBTJOG4OctaC1O9HScG5s/Uhhn7owpRl3MHJ6b+dHnkWUzYRaX2Ph2Aherfi+bO
	 4YOjUXTXt7jSsUW0uahkhqTCxEZrzEop27ff0JLrMY9f0/7rvE8mmZntoiGB/TvNXgUuu
	 5sdELyiQgFI229zRy/Ic5PMcygqwfu82lxytAhnR0y9v8sMAPEsAOSABqlOO35A6ku7Cu
	 lZrQGyb6Sb9D9P0DsM8uRsGxtmcaXP/oFP6kWI6jWHpbJH5xpA4nuuY3x2GSePrs/lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322984;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=/Ms9fHl+Wtmfii43ihf+yjzVXhxnohQZCPZu3JMzrfg=;
	b=0p8PZdGYnKvk/vLC7I7tHy9YkMEfushN7kW3nVuI/J0ZuGiEhrfyODPtJNU027Zv/dx+
	 7mgGRXs7HbpXdKnkL2ps+L3aWBMCb5yA6xqEjp63km00ZRfUkJsYMK8Y9HKuVzu7ZEiuC
	 unDu4qE5+P4WnB4L1qg01esTweMu5z2L+/k3aEVf8pcjV1GCK6VtMhCcLXJ3lhAtm14RN
	 A4Gd/vA3wVYxQlcKhJtO6uNBZ0CCWl/PZI61gzx4RibVjLLqjcuPPEhhg7mK3d/OnuJEM
	 MPvRaPexAxz6ClTQfu6GFD4U1HpMaYDEQCWljnzEXyMO6ODxuRkl4nGXgI2U7zmt5ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=RVoyQouY;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30986606A320;
	Tue, 10 Nov 2026 15:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30986606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=RVoyQouY
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E108110DBB8;
	Tue, 10 Nov 2026 16:02:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794322977;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/Ms9fHl+Wtmfii43ihf+yjzVXhxnohQZCPZu3JMzrfg=;
	b=RVoyQouY8IaQpkRDz8OmD4eYAN0M5eZfSeC4UevCQI4msjEolfG1hU5KNBQI1h9+8qOnQ2
	nBwVsQ2aa5A1MPznaW2Jpv0v6Liy7x+pq0WwfRTJRfmGRtTqG/BDdft4AOlnYEtMzWtY3q
	iTv04WBdEAW2bFa7dq+gKmsiUdT+ZK79fEh8MlXrw0kJN4JQwPt+g0QiJfG4hxwCKAMwLg
	rOcon2NKbC4RymST7PGwUeSQBd+tTw2QSvb22fOaiauWHlrsYDGT2ic2CIXmoBvx0ZuRts
	uQ2O6ZTejRiGhYHrr8TNQocH61urfScS0XmOPjrPdUUXhraxMLvtSEWwDEYxAg==
From: Lukasz Majewski <lukma@nabladev.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH] dt-bindings: trivial-devices: Add National lm77 temperature sensor
Date: Tue, 10 Nov 2026 16:02:42 +0100
Message-ID: <20261110150243.1531953-1-lukma@nabladev.com>
X-Mailer: git-send-email 2.47.3
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
X-Last-TLS-Session-Version: TLSv1.3

Add "national,lm77" as compatible for the National (now TI) LM77
digital I2C temperature sensor.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a8b2b9deade4..9413ee0626f5 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -387,6 +387,8 @@ properties:
           - national,lm85c
             # I2C ±0.33°C Accurate, 12-Bit + Sign Temperature Sensor and Thermal Window Comparator
           - national,lm92
+            # Temperature sensor
+          - national,lm77
             # Nuvoton Temperature Sensor
           - nuvoton,w83773g
             # NXP ISP1301 USB transceiver
-- 
2.39.5

