Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4A5514762;
	Mon,  7 Sep 2026 16:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797540; cv=none; b=NKXJCJVUgQxf5kb1A9xsoHGIcuBkCe4smvYgLSlhg2QqQf2Qb1W7T5LL50R2SbFmNN/peVXtwYzwn3nymjrxxCTsi69ljUT8hemytkQ9jOkCCbfKRVyHeiLJGVG1dDqK1kx/cPcaKAyNsGxSeb2rk2yeDf3/dw3BQEw0T1gMa5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797540; c=relaxed/simple;
	bh=G2F6FbAD9vn4IvzWBWh0aSIh+oUNh09NSYrfW9dBMQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c6WhJmQRZL4DqCvFgBN1LaGyCA92aO0NPW3Ejr21YZUIl20NmITM7VaVrNHxKsCw3gRzlKSX2JSCr9weRoq7/Fq+PolG+SM68GSlphanP+ObyKLHFd48lpZmMzxeZXEMW+A1etnOQPrgik/MQIf8gE06ESgaT37oOn5nRepTze4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Mzg53cAY; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Mzg53cAY"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 653A011DAAD;
	Mon, 07 Sep 2026 18:12:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788797533; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=JeA7gvxgHLA2RU/64BLRdxjcMQo+Aba/0ZU2WSO8u6I=;
	b=Mzg53cAYWnDW5vkPfY1LIWITg7Xt3OFcNqfmz/cqhaULfVFwR0l7Nu2EHLrhobc9hCfohu
	AXqIlCcPuGFR0DxUri3L+9SpMCrBx0sqJB+zQvziy0nITF05ZepBTGt4ETyccfPbX4kpag
	4dXZ55UvSBjFSIZDp3tapKmmCBIv60z6Bpv/R4iUNOWq134q7MTXZYZQ6LivgD+kNesW1D
	nP4bgly4H8GNTgGTlaEjxjo39VFaofHVSsso8+mlhSoOi1n1Odo71HWdgoMNOmnAkTBaL/
	54Ai4M98Dxc+Jao4kemumMz0hqDipoOU9vHtV4Ypmo3LtnFZSi8qd6Uo5xJi2Q==
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
Subject: [PATCH 2/2] dt-bindings: usb: generic-ehci: Restrict access-controllers to ST STM32MP2 SoC
Date: Mon,  7 Sep 2026 18:11:54 +0200
Message-ID: <20260907161203.713424-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907161203.713424-1-marex@nabladev.com>
References: <20260907161203.713424-1-marex@nabladev.com>
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
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 908b02d9175e0..9f5130a0e784c 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -217,6 +217,9 @@ allOf:
       required:
         - access-controllers
         - clocks
+    else:
+      properties:
+        access-controllers: false
 
 unevaluatedProperties: false
 
-- 
2.53.0

