Received: from ironport.ite.com.tw (unknown [210.202.87.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CA947FAE6;
	Fri, 18 Sep 2026 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.202.87.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725803; cv=none; b=dXCqsmW+SdUgSoaYw9UpydJ6ffSvYb73SebvslOqYKOJ3G9OVBPH0Rzuc3GN/85Za6r3WoXWsOets1peJIlyklQJO40SHJrFsQp6luihWituvfO6XmMFpydQ60nMT5wxStZSixewpqg0Z2oZ90/cP3Psvvm3ZBglzmWZfuL6CXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725803; c=relaxed/simple;
	bh=+pVBRNiWt6ukTZ9wMuwWGgt8Hcc6r3T53DnNO6//6uA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fv9HMnso75ouiZYk68qmdhmHGGIRI5oi38LDIK3IiwSIkkOHHmHs6rBEoORLmjb/7gIuy+JDr7shCFLIHEZZxqdtSnFjb+YH6Y7oY/eE3yOlT71k9GIWWvJ5YTpWjvOrIbJIJxYB7yS/Z48zUHUdjOLDy2MOu724fGpcdIfFebE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=TTw170YA; arc=none smtp.client-ip=210.202.87.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="TTw170YA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=1zB8D27pJ915lI9AsFSoNbsDVqY2nfH2kWFzMGaP4n4=;
  b=TTw170YAAYrwkAPY60SBesNj3a8wKoCaRHg5Ah6LUc5WRrwxqn1k26Wx
   nYr2EaST5uax47nBADJSyL4CZP9rb+7nlJGICiBU2JWboB8I9UBmWnypm
   NmGZIZ3LDJVSw4yODEjnwzHEm+jI7gYN+16gZCJ1POICpoQOheRxNcxRI
   XTBvL+RTnE/tJb09yZ6FySe2Y5Q3TiakbTj3WXzMYeJeIjegEtnpn7swu
   EZ+BjtkQraFh5iDDIKTVZ2QPUEIgdoekSz94VrhvjqJ1LW21tsu1EgKRa
   358OQqq2ThYiNt9wCFhPRzUw9XnSzfCX5sghD/BDCNnvHUduO8g5JDvay
   g==;
X-CSE-ConnectionGUID: HFkeX7ehTnaeAumr1kL8xA==
X-CSE-MsgGUID: 3/CM3YGbTW+ttY5cAccaaA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 18 Sep 2026 18:03:07 +0800
Received: from jiraproxy.ite.com.tw (jira.internal.ite.com.tw [192.168.35.200])
	by mse.ite.com.tw with ESMTP id 68IA33dI091797;
	Fri, 18 Sep 2026 18:03:03 +0800 (+08)
	(envelope-from ite_pd@ite.com.tw)
Received: from [127.0.1.1] (ITE01791W10.internal.ite.com.tw [192.168.37.107])
	by jiraproxy.ite.com.tw (Postfix) with ESMTP id 42FD52CA2;
	Fri, 18 Sep 2026 18:03:03 +0800 (CST)
From: Amber Kao <ite_pd@ite.com.tw>
Date: Fri, 18 Sep 2026 18:03:43 +0800
Subject: [PATCH v2 1/2] dt-bindings: usb: ite,it8851: Add IT527x and IT885x
 series support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-ucsi-itepd-it527x-v2-1-7b2d9437cc72@ite.com.tw>
References: <20260918-ucsi-itepd-it527x-v2-0-7b2d9437cc72@ite.com.tw>
In-Reply-To: <20260918-ucsi-itepd-it527x-v2-0-7b2d9437cc72@ite.com.tw>
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
X-MAIL:mse.ite.com.tw 68IA33dI091797

Add compatible strings for the ITE IT527x series and for the IT8855,
IT8856 and IT8857. All parts run the same UCSI firmware codebase as the
IT8851 and are software compatible with it, so they are described as
fallbacks to "ite,it8851".

The IT8853, IT8856, IT8857, IT5272 and IT5274 drive two Type-C
connectors, the other variants drive one.

Signed-off-by: Amber Kao <ite_pd@ite.com.tw>
---
 .../devicetree/bindings/usb/ite,it8851.yaml        | 49 +++++++++++++++-------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ite,it8851.yaml b/Documentation/devicetree/bindings/usb/ite,it8851.yaml
index defd431aba97..a44da61ef24d 100644
--- a/Documentation/devicetree/bindings/usb/ite,it8851.yaml
+++ b/Documentation/devicetree/bindings/usb/ite,it8851.yaml
@@ -4,22 +4,36 @@
 $id: http://devicetree.org/schemas/usb/ite,it8851.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: ITE IT8851/IT8853 USB Type-C Power Delivery Controller
+title: ITE USB Type-C Power Delivery Controllers
 
 maintainers:
   - Jeson Yang <jeson.yang@ite.com.tw>
-  - Amber Kao <amber.kao@ite.com.tw>
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
@@ -63,7 +77,12 @@ allOf:
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
@@ -101,21 +120,21 @@ examples:
                     port@0 {
                         reg = <0>;
                         endpoint {
-                            remote-endpoint = <&eud_con>;
+                            remote-endpoint = <&usb0_hs_con>;
                         };
                     };
 
                     port@1 {
                         reg = <1>;
                         endpoint {
-                            remote-endpoint = <&redriver_ss_out>;
+                            remote-endpoint = <&redriver0_ss_out>;
                         };
                     };
 
                     port@2 {
                         reg = <2>;
                         endpoint {
-                            remote-endpoint = <&fsa4480_sbu_mux>;
+                            remote-endpoint = <&sbu_mux0>;
                         };
                     };
                 };
@@ -135,19 +154,21 @@ examples:
                     port@0 {
                         reg = <0>;
                         endpoint {
-                          remote-endpoint = <&usb1_hs_con>;
+                            remote-endpoint = <&usb1_hs_con>;
                         };
                     };
+
                     port@1 {
                         reg = <1>;
                         endpoint {
-                          remote-endpoint = <&redriver1_ss_out>;
+                            remote-endpoint = <&redriver1_ss_out>;
                         };
                     };
+
                     port@2 {
                         reg = <2>;
                         endpoint {
-                          remote-endpoint = <&sbu_mux1>;
+                            remote-endpoint = <&sbu_mux1>;
                         };
                     };
                 };

-- 
2.53.0

