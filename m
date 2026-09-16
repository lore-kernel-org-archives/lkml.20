Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D6C51354A;
	Wed, 16 Sep 2026 13:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.35.192.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566485; cv=none; b=DcwJQLAyAYrtBAzgKHJego3652D8GxGJgAAkjzcKw5ZuMmp3NEeWWzv2FeeOiG5BdSUFRK83s/3WmXWvDf8uzutzeHBQkyv+1e6J/6OW0Xjvbc4OvXlv/cUnOVqKGV/96uI4D/ZAufmg9ng2XUaAnPHfXrjL/y+6rHBduVoa0XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566485; c=relaxed/simple;
	bh=J+OJcNc4h9kHXVf0hEDlKjUfqJc3pXCNG6cZYWr6dLk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PXQBcx5ZneOt/zuwYDNUz1Z31pOGxOn6Xi/JC+PVo07oILdM8HSjrGTnYWVEDrGCoMycjfBMbUXCTXRm8v3s92JFiagoMSoekHPydPR1b4gIC4VMCKZX9hA4+as2TWsND7B7tt/wNJsoAxZKixCqyvieCnCZuPhstufeKvd/2vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Y3aZl9qC; arc=none smtp.client-ip=52.35.192.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Y3aZl9qC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789566478; x=1821102478;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gvRdsHR4+gF5rQas10HzvXQ3d3TheJDRb2wluWJa7jo=;
  b=Y3aZl9qCZJv7chkqPBJ9J283T/KXbNcrl2h1eA7KJoZA68HRVkl7mPv1
   k3AkVE3zfg9Z5OrsharWGJO7NDI1nUwItUtZfV3dC/70cHDsHz/CY6p68
   gipVuVWUNR+yXgNM6Pe7YQRmAFEwC4nHvheW1JWWsZgfAqKaaHwnYGpiZ
   BdKRaVYRUKmfk/WnqmcUXwLvSdfAZFjKP8Foi6hWrEPAlvCiLhy2ljWQx
   Y8nhIAuybqqs+HEylm6kqN4i/7wpjjY4SO9yLICIIuFr6TIquCl9SWHrI
   aJm9sLUmADHkcXOE6/eZnFquOWPuw4Sol/ke1QeZApR1Or+qLylrPRAon
   A==;
X-CSE-ConnectionGUID: i7TOV8U5RmmjE6FsV/+9Jg==
X-CSE-MsgGUID: 3vWC3e69TTC86uMWWhh/bg==
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="28591687"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:47:54 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:26467]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.60.208:2525] with esmtp (Farcaster)
 id 2dc1d371-716a-4c2e-b8a3-1c73465386ac; Wed, 16 Sep 2026 13:47:53 +0000 (UTC)
X-Farcaster-Flow-ID: 2dc1d371-716a-4c2e-b8a3-1c73465386ac
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Wed, 16 Sep 2026 13:47:53 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46; Wed, 16 Sep 2026
 13:47:51 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: pps: pps-gpio: document optional idle pinctrl state
Date: Wed, 16 Sep 2026 13:47:43 +0000
Message-ID: <20260916134744.46354-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916134744.46354-1-farbere@amazon.com>
References: <20260916134744.46354-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D037UWB003.ant.amazon.com (10.13.138.115) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

pps-gpio can now release its pins to an "idle" pinctrl state when the
driver is unbound or the system is shut down, in addition to the "default"
state that the driver core applies before probe.

Document the optional "default" and "idle" pinctrl-names and show both in
the example so boards can describe an alternate pin mux for when PPS is not
active.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 .../devicetree/bindings/pps/pps-gpio.yaml         | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.yaml b/Documentation/devicetree/bindings/pps/pps-gpio.yaml
index 383a838744eb..035c780ecd04 100644
--- a/Documentation/devicetree/bindings/pps/pps-gpio.yaml
+++ b/Documentation/devicetree/bindings/pps/pps-gpio.yaml
@@ -28,6 +28,18 @@ properties:
     description: Indicates a falling edge assert, when present. Rising edge if absent.
     type: boolean
 
+  pinctrl-names:
+    description:
+      When the PPS input is muxed through a pin controller, name the "default"
+      state to select the PPS/GPIO function while the driver is bound. An
+      optional "idle" state, if present, is selected when the driver is
+      unbound or the system is shut down, handing the pins back to their
+      alternate function.
+    minItems: 1
+    items:
+      - const: default
+      - const: idle
+
 required:
   - compatible
   - gpios
@@ -40,8 +52,9 @@ examples:
 
     pps {
         compatible = "pps-gpio";
-        pinctrl-names = "default";
+        pinctrl-names = "default", "idle";
         pinctrl-0 = <&pinctrl_pps>;
+        pinctrl-1 = <&pinctrl_pps_idle>;
         gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
         assert-falling-edge;
         echo-gpios = <&gpio1 27 GPIO_ACTIVE_HIGH>;
-- 
2.47.3

