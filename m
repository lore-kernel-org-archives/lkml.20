Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55823A9DAE;
	Mon,  7 Sep 2026 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797536; cv=none; b=Tyl2O+LNyjqWL6xwPajLZ+OGKiZzst3L+0L8NmXLePK4lUMy+bf4v0IlC3O9Cu7PfjipF9Fe01QetDm3/f0LDz0MHi1Pr72Ck3nr/R7C5O7HqYV49X17PEu0HWVdzGhY3aWrBMgQqNlejnV0FlzBAjVCtv7e8AAuKeXeV8Kur04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797536; c=relaxed/simple;
	bh=3u6bCRB3JwqsXbGlIyMoRInAHLy5juD2oOrDDFF/lAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cntrbC69uxg0/d+0D8EuV2KGZg9lqpf/EVKRZwfsQrfe/PDiTDS5XuToIwXMvD9urKtnHTsEmLfXKh9oU4c6swzbLxpvYhqpurxEyWcfcfc002xOXqNmtvBkIBX97bHLUE+nmc9uuxIlnLGpZojMGxxPPcOXSgZunhewMGv/mt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=HRe2Spde; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="HRe2Spde"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DEB111D0D1;
	Mon, 07 Sep 2026 18:12:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788797528; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=nmrLDUpli0xczKPjyc2UOxB5amey9DMtoKl7SwhodJ0=;
	b=HRe2SpdeIkiqzutGSpDg/sMU7VSzFY79LU851PioylIIf4wkfK35btGVTXoCFe3gY6iLnd
	jnjg23KH4rxLoCBdWNnfJfH2nAiT/gZoFo4NF3MpVgpvoI7SlVJza3t9VMueZvfKOD3zVT
	Vz583TwOVHNKpPfng4RGXg5w4AqbH4Pv4g3jmvrX1BYAHw/xNAQT8qQiATZyq0t2L4hSbh
	VJSq3hobVML7/1W/6x6UkiZYgVZUFNi7LD0mBCkEnZlIJuQsNTYDUYwzpCZnUk0RnMBLQw
	lhBIhnF34jnnH5sCOq7NxMQXfiDdgKGy+FtWDfmmnjr082A6jqTH4UM95oD05w==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: usb: generic-ohci: Restrict access-controllers to ST STM32MP2 SoC
Date: Mon,  7 Sep 2026 18:11:53 +0200
Message-ID: <20260907161203.713424-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Tighten the access-controllers DT property availability, restrict it
only to ST STM32MP2 SoC, which is currently the only known user of it.
Once more users start using access-controllers, the restriction can be
losened here.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 7a8c3c2318153..cd9f51bbb445f 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -237,6 +237,9 @@ allOf:
       required:
         - access-controllers
         - clocks
+    else:
+      properties:
+        access-controllers: false
 
 unevaluatedProperties: false
 
-- 
2.53.0

