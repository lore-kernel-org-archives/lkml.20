Received: from ironport.ite.com.tw (unknown [210.202.87.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961A445517F;
	Thu, 24 Sep 2026 09:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.202.87.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243802; cv=none; b=GIDwISe+Y4o0m1gF9RgvexgHqgZHwqIu8swKGySINclddffrSOUorvgnXPnxxQXGtEYvrP9QLTrE3CI4ELvHnExrEw+3Q4G18sflNusL5ZLjeCe8FrgXeVoN8RWnSr8muGEmeLhFg1SiKsohCpgBiUwwdyoViltn4zKtnvlwPYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243802; c=relaxed/simple;
	bh=4FgO2dLwecW5iGZq50/zl68YzJPfAciPjLybSW3NjlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=izuRqeW75Z6tiYyzRmgP2Omi3WQ5cWT0ARy/aN44W84NctGwrwfFGW48+focfxoPyGuY9B3nM2dftjWQ9VzYmWeM8vzUU1BVtUuYp0d0uyuPU0RQ+djjAzL0mafbJkW35SbOP9H+bocYjTljPE0uSMOeTo4VmnR7e/SqaYhcmnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=sB4LtRVU; arc=none smtp.client-ip=210.202.87.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="sB4LtRVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=fkz34UCEa7/tdDy7+k4QMkO4NHuR75ynEtPNsUFOwR8=;
  b=sB4LtRVUEeY3TxUzVoliGlPucpb7rzEE5WGaQIYtY7c5NDdzyBOMzG+w
   H3pOzh0VYLfJ9l+N/b8WHQGBClPZkalpQfjsK2SSoWRFI70+UbkiC8p6H
   83Xe43yg9guiTi36LfZKMiZTUBWu+R7c8yKZLq7Rp9U9YzOkFSqFeikoz
   TFKg66G6rhBt8bNZhWDGxdEflI4hlB79VX5j/N51qcqBy9gOp/vNvltku
   txXC+0DQ4yU0MiKn/ZCAF9iCjQvPFR4k7DWZjVCGqUlXZZOk679sLRWkd
   N7A6NIUt8oq8GJ62MI91X3rlQ4T0cmfatkThFq0kgDC1RDSOsIn59rgmY
   w==;
X-CSE-ConnectionGUID: hs3kPfJCSHaNwXsWM/D+kw==
X-CSE-MsgGUID: mLS9sQW7T+C9bhk3uDoy6Q==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 24 Sep 2026 17:55:59 +0800
Received: from jiraproxy.ite.com.tw (jira.internal.ite.com.tw [192.168.35.200])
	by mse.ite.com.tw with ESMTP id 68O9trhN039528;
	Thu, 24 Sep 2026 17:55:53 +0800 (+08)
	(envelope-from ite_pd@ite.com.tw)
Received: from [127.0.1.1] (ITE01791W10.internal.ite.com.tw [192.168.37.107])
	by jiraproxy.ite.com.tw (Postfix) with ESMTP id BCE4F2D59;
	Thu, 24 Sep 2026 17:55:53 +0800 (CST)
From: Amber Kao <ite_pd@ite.com.tw>
Date: Thu, 24 Sep 2026 17:56:36 +0800
Subject: [PATCH v3 1/2] dt-bindings: usb: ite,it8851: Add IT527x and IT885x
 series support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-ucsi-itepd-it527x-v3-1-a7392aa087f5@ite.com.tw>
References: <20260924-ucsi-itepd-it527x-v3-0-a7392aa087f5@ite.com.tw>
In-Reply-To: <20260924-ucsi-itepd-it527x-v3-0-a7392aa087f5@ite.com.tw>
To: Amber Kao <amber.kao@ite.com.tw>, Jeson Yang <jeson.yang@ite.com.tw>,
        Yaode Fang <Yaode.Fang@ite.com.tw>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amber Kao <ite_pd@ite.com.tw>
X-Mailer: b4 0.15.2
X-MAIL:mse.ite.com.tw 68O9trhN039528

Add compatible strings for the ITE IT527x series and for the IT8855,
IT8856 and IT8857. All parts run the same UCSI firmware codebase as the
IT8851 and are software compatible with it, so they are described as
fallbacks to "ite,it8851".

The IT8853, IT8856, IT8857, IT5272 and IT5274 drive two Type-C
connectors, the other variants drive one.

Signed-off-by: Amber Kao <ite_pd@ite.com.tw>
---
 .../devicetree/bindings/usb/ite,it8851.yaml        | 34 +++++++++++++++++-----
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ite,it8851.yaml b/Documentation/devicetree/bindings/usb/ite,it8851.yaml
index defd431aba97..fccdc1504a5b 100644
--- a/Documentation/devicetree/bindings/usb/ite,it8851.yaml
+++ b/Documentation/devicetree/bindings/usb/ite,it8851.yaml
@@ -4,22 +4,37 @@
 $id: http://devicetree.org/schemas/usb/ite,it8851.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: ITE IT8851/IT8853 USB Type-C Power Delivery Controller
+title: ITE USB Type-C Power Delivery Controllers
 
 maintainers:
   - Jeson Yang <jeson.yang@ite.com.tw>
   - Amber Kao <amber.kao@ite.com.tw>
-description:
-  The ITE IT8851 is an I2C-based USB Type-C Power Delivery (PD) controller
-  supporting one Type-C port.
-  The IT8853 is the two-port variant sharing the same programming interface.
+
+description: |
+  ITE IT885x and IT527x I2C-based USB Type-C Power Delivery controllers.
+  The later parts are software compatible with the IT8851 and use it as a
+  fallback.
+
+  The IT885x family covers the IT8851, IT8853, IT8855, IT8856 and IT8857.
+  The IT527x family covers the IT5271, IT5272, IT5273 and IT5274.
+
+  The IT8853, IT8856, IT8857, IT5272 and IT5274 drive two Type-C
+  connectors, the other variants drive one.
 
 properties:
   compatible:
     oneOf:
       - const: ite,it8851
       - items:
-          - const: ite,it8853
+          - enum:
+              - ite,it5271
+              - ite,it5272
+              - ite,it5273
+              - ite,it5274
+              - ite,it8853
+              - ite,it8855
+              - ite,it8856
+              - ite,it8857
           - const: ite,it8851
 
   reg:
@@ -63,7 +78,12 @@ allOf:
         properties:
           compatible:
             contains:
-              const: ite,it8853
+              enum:
+                - ite,it5272
+                - ite,it5274
+                - ite,it8853
+                - ite,it8856
+                - ite,it8857
     then:
       properties:
         connector@1: false

-- 
2.53.0

