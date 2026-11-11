Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392384;
	b=bN+ZPYgLhdsYOYKkq6pxbxVDcMY9zwu68YaUwElCyMcHxTZDu0LiHz+fZGdYeesTXQ99
	 dZthICG677Q1Z/XVrrWbgCYNNB8+2lMXfZcCQEJvmgLfKK5aeyKyvPNQ1lLUe5P4xp4wO
	 p0e7wB9s7w8xpGfCe66iKSLkRcNm3jrePrs15k8hisDiYuIqYEZ/YnwO43jXd5rhbbb+X
	 wgYGMGtEWHNDVcfkHPlJadd0VuqWTY85qMIXFaPb+feqzg2993eZrj3p2La9wO9lJbm42
	 ajukXIfcbIzgidon3XL4idLKKEo7VVqtp/rRL3zkk5wPJ/1cDkK/tMNzS9+lYEmv58w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392384;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Virus-Scanned;
	bh=EuUZibU4Qx/Wwp5/9mignjaQTr9n5qcc+mnxg/CvI1M=;
	b=lR3V5fjftp7p+Eg0zGRFYtJiIdb1W8OdY+MbpwQeyMYHogbESWas6ePY4K4giyaItw/b
	 Px+6PU0kF2OzBNH/GlWUMZEgVkpyUw/fQaHSx/k5PCV+aClYKqUr3w5Yf7PsWBrhPBdDm
	 yazPsw9R0WQ/MgCbNduZE24dwPrfHIvPUI0ulWtQxTGXOpnFD/spcwfznsJyOYURW3i9W
	 8e11igUtCsdkic+9f9aOfLzOtc3T/4kOdQLfoccgCZKxSYm0DSr75KlnzeCfB1AxJLW6L
	 yQg81kPlsgaM90Xe0qXPRe68qgU+glpVZ68pNzHzKm8U/RwX0PbdE6md//r4VUuFAqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=CmpKbOGK;
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F87C606A31C;
	Wed, 11 Nov 2026 10:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F87C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=CmpKbOGK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=EuUZibU4Qx/Wwp5/9mignjaQTr9n5qcc+mnxg/CvI1M=; b=CmpKbOGKH2DJbjdrQmybWLc9sN
	99KGYDnMN9YDlZJXhGdLqySpk470lrbQ84q7Tuw7y5U9bpqAjG8rx0n7FAJ4DgH+9xRnmMtdavx5J
	RjeTogd0n7jw8BRbbhsYwk0McPM+jC+Jzy0/RrEmjIJYKsRmBvO57oF15Hxjw4J8s4y+OSKCFNlXJ
	MizBCnlcWWQ7lvx63ZWkzWLRQ5EWiLbGjdfS2NH66VQe/1ATqQkQDKLI0O8mTK+N8nD0+P7TL6fqM
	t+BrMqq3JMAxGIg3rLuGO3qErIEz7XibnFagMviPLt+Kn/zS9RN/6Wz8Jxb66aQrcnrYLa0znZD8z
	b2/G35Uw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xR5Qb-0006eu-2o;
	Wed, 11 Nov 2026 11:19:41 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xR5Qb-000NjR-0I;
	Wed, 11 Nov 2026 11:19:41 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] ARM: dts: imx6ul-tqma6ulx-common: add vref-supply for ADC
Date: Wed, 11 Nov 2026 11:19:23 +0100
Message-ID: <20261111101934.1216887-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
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
X-Virus-Scanned: Clear (ClamAV 1.4.6/28180/Wed Nov 11 07:24:27 2026)

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

On MBa6ULx no ADC channel is available as the pads are muxed to different
functions. Provide the correct reference voltage in case ADC is used on
a different mainboard.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi
index 5c90d0a3ee2e7..1cb1791f64a45 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi
@@ -10,6 +10,10 @@
  * - TQMa6ULLx
  */
 
+&adc1 {
+	vref-supply = <&reg_sw2>;
+};
+
 &m24c64_50 {
 	vcc-supply = <&reg_sw2>;
 };
-- 
2.55.0

