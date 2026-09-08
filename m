Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020089.outbound.protection.outlook.com [52.101.225.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3094CA79A;
	Tue,  8 Sep 2026 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867805; cv=fail; b=cEtxBeQsoZ/qp/nARarYwwBs/Vtf+hyHwwpUAh3XM4x7dJMc37ZgwMmESGZ/YRwIQ4g9MNucLTPouWbAfXBfWgiOg58VSExA4VwcZpmW1Plp/9f9AU1j4y7tg8NQRjqZjWtUBX2meGWdmjo9XcgtdHRC7w7BVfmMGPy7QeMFIpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867805; c=relaxed/simple;
	bh=azmRMN/Eds9h5dAhaNnzR692eHFAgbprX7PCxj+s4Js=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KTcwLVc3GcO2TJa2S4KLWpg9j+PgiONFxVYDfOlZjp9iOZ58qdRarA7sLeYj0Nx5/fhS5K1dNq+qA9/6b5Bz70JHb35ondolqVgrgntOGRRepxN55pxLpAPMKBzedBdwiKXjFgvxhOSVBhzGgl3wolz4JEyJ+hyQ5i8olOYN5h0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Wjtblh/j reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Wjtblh/j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGEXT+fadR4tnb4mQ+9PkJoGx1VIHjQF5vY2DXwGWMnqyFtHIoSCWQWvT7E5zgVduaEb0qUXvkU+rpHkdNSKn8exmb/WFsvJPMmZ7eRHjlTaxgRz0NRi2cTXLioZm1uyo4gkZtYBmZHeScSFFxtPJUb55Ll6LA7m9myHRA7DgJFMcnRggTIEqkLyThtlloF7lapzuadCPbrb+HQ9ViDqbkE+7J7hclPbvia5VaCGBi5SofoxNAt3bUCkr+/JuxsL1dbQmZCNcHUdHOct2XPsrWtUka6XN+rc+qAlKIfB9Op+M5tu8V39Vl2UUrw3HASFbyKpvbwZlI2U3JiIBQiNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58Ujcjtsw4rUVPQg6iXldnBxlN+OCkF66DAvGEBGz6k=;
 b=dZ9xYeu3bymy7Pf1+h4ak6iAdQKSIAAVV6rpOtY9JnpEsdMTK2JuEPhDAr11J3AotKNfJm3TTJCSuhVoxexJka6Be5i5T36lpcYvEmu7Rw5P2rBWhxymL9kDQFMFapJNFzHHokR61k0RN8O0srlbOflux4IEeAHsoJeupkmHDLzlM6yC7OEPDdfmxE54Tt69DUAYDZgxK6Hpo8E7nTPJv2QMQ062bFozH51uS/iYEDzV5h7bvza42h+RwcgVQ9+RswBMNwTLy3e19bb9g7dMCyQWCEBeUP4F8LyjdaGYKf1ZAeIhaxTxHi7aA1dvUwdRAML9oceyhIRKlFliatDKFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58Ujcjtsw4rUVPQg6iXldnBxlN+OCkF66DAvGEBGz6k=;
 b=Wjtblh/jNc30iFRhxus/wq9fgdA4v/pxNnmPb3sHmmqWMp2aZS3lum0RE7yKmOUQ6gT1Rrje5VuRlpCGJUaEfBypxPL5BXKq+5M+J9SDZXmWU9gcKH02pMb7RWLN3/9jEV787ABy+FNi4riDuIpPYOKg7Eimntw90VkZ74snqFbmojgGE1IeSl9IdWUHL+zUekqMoQdKMROs/6HbYv87+h1pajWGJ///gj9lM4Ujia0pvAIYb9vWsQdcQeOtBGOlWYoQkvRV74vFRh8lhvZyRfEmyMpirOCV9GtnlRyHSCPXnjRDSqIwwSaqpM+7bQ5AqO40bIjqdIUuBgy6r0BEIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MA5P287MB5159.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 11:43:14 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%7]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 11:43:14 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: tarang.raval@siliconsignals.io,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Kate Hsuan <hpa@redhat.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v5 1/2] dt-bindings: media: i2c: Add os02g10 sensor
Date: Tue,  8 Sep 2026 17:12:27 +0530
Message-Id: <20260908114235.86568-2-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908114235.86568-1-elgin.perumbilly@siliconsignals.io>
References: <20260908114235.86568-1-elgin.perumbilly@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25e::10) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|MA5P287MB5159:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ed5ea7-4e6f-472a-25a7-08df0d9e5dfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|23010399003|38350700014|3023799007|10067099003|56012099006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	d+mlwXd0SyQ24Nxycdp4Y99KvhhC7J29/0VTLnoHlY9UroRHMBMXReV7K9znScIcccXwlZJ18rr6agdL2Waq4I1GFcajoc6qFDAI+jJwFobQ+mAQJ8HkmVqY5AJzOBPurdf2sYuaXcD5bkiXlrAtZOhYTLfIPflVyiQwazt3GGqm7Bang9DQ44fwerF79NkNs56MNSUo5rcMljexoxxDDhOPYQqnQMtVoyCYTaacp+rnlYdN2nIj1JCgp36btLUV0FxZHggotYGb86H5NJUQqFkBNcGXWxatC79mmLaCBicEgwVd+Hbnt+Kbs6eXxLJ1A5rTwCGlrFieA5T5sG5YlgvviYVQn1vFmKe2JCX0CmoPeAztSj9EAeYxNSfelwRka+3lCYPKvIUKvuQaqClLWPL31LLW1msBtRqcmOrv25erakjZcDpmIPekaY7aHyibxB1Mh0U8TtQY4ouZMcqvfGI5B0Mgqr3ZEEzR7KNLzoiNZWLXaefjEf6h8FzBAiA53qWmXSd3hSZazNfQOS4Pq06W8vfQU6CYxbFwTOuXyiFg2Zf4rfU8mWO/PAormKLkoogee1ueIgZ9lF+b81U/UOfs3mjKr4sGJRrFDzy02sceMi+WabIGUfT56uOyDhsaxa+fILYM4fgkwYDmMS24SLZUPRZKCyT8PtYH7RL06cQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(23010399003)(38350700014)(3023799007)(10067099003)(56012099006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DtJ18sgQ/422K6p5AbF9aw3RpOncuGbC2sKYwhvMGRNuM5/E0VtnT4yut/B9?=
 =?us-ascii?Q?dNpf7d3/1HBhB1Q5VT/IpJ9hRBbpE3XaPHKhP+UHDOSnfz76dckKu7DN7VRq?=
 =?us-ascii?Q?37ER+mUIdte8I4mINxEG57lJeBdf/3xUZOqnhANuUpb1k0QhuJj0e6XjYMaA?=
 =?us-ascii?Q?72JNke+6rRkxwMFEspV3stSDvIm0a88BvnQWB6D2Uvont6pHhCVysWBk5iP0?=
 =?us-ascii?Q?K2LU4uMyQkb71g4RTXGNY4qyvcp5X4YwfEa2xc6GXsQgvVnbxSSsaGtoR6a7?=
 =?us-ascii?Q?WFByoq7E+W4paj/zZBXiVvTMYuiiaqlMMPosbDDaxtvgPhnQ06wiNFh6rEze?=
 =?us-ascii?Q?/QylhV95NTx9o3qs4K1K8fK6ZJJtu203YSliyJFrNPfK9ahnMObFwMJpB4+j?=
 =?us-ascii?Q?p3KRnbcTkmD/0Pxn6a95sT1j4XvDX3xuMQ3hGnz6+Y4KISpSgdDiVp0YyNMj?=
 =?us-ascii?Q?XApcBzktVWoblF6ALFdQgxLafK8sfm88Cf2I4CGdWdhCk5ax2KxF5aA/4ma7?=
 =?us-ascii?Q?hmltXDybD5WYROX6DooUOXk1TA8dFiF9Gu6qSqhspzezRcT4Y7SlOPglgSoI?=
 =?us-ascii?Q?GDfo40WbtmLTomihihG3Jtg6GyN0dxcQzk8aEWaAy1zEix0xO9ke0scTTVnu?=
 =?us-ascii?Q?Ebj0V4hOBWMlxTTCR7uGun0wEfLc4ffDuwUyhaM3+7ZRvOi6bWOUzlyGqt+P?=
 =?us-ascii?Q?Mi+6CXhjlJUeQKv2GliY8E0zXeTZ6VhizGYyxogAxAALIXkMspWt8g73TdeC?=
 =?us-ascii?Q?eSBa6quctTXaPJfh+fU2oBbSTn4kXKsjPIeKPPBrc6SdM2vCk69HC+AM0Qvj?=
 =?us-ascii?Q?WU8AVIcE92DYNGbfTI7H5xK9h5JqPBdyp2fZUN2mfsTKa9tl8JOsDBo++Qsh?=
 =?us-ascii?Q?hhap67Heh1jpEEEusITP3SBSPW25IbfAxgyqxuT9UMNNtp5o5uPxec/iwOpk?=
 =?us-ascii?Q?fIo7B/tns6cWOZQpz3UQfwnW5oIDz8/45wFVTG4CLYARgJ8T9cyXEjChlrl5?=
 =?us-ascii?Q?SpB8M8p/8PTE28RKQKEeYA1DuU/Xc5/uHQnQJwZ/SxCQs2YPoIi2ArFs0zbL?=
 =?us-ascii?Q?70SCIp77RYtTg2zaS4yKja2/JtXX0GKNNq9GXssCPtcKEoC+yChZLtyHyvqa?=
 =?us-ascii?Q?lKpE8G4HnZrom4TsVgbdtc1ylptV4Fdp09wW8lIDLgCQolOdCe/Bin8+9qAm?=
 =?us-ascii?Q?RtPeoMtnyPGyFm0w/u8aiuNDnp7l9zmFslirPwU7A6PROcOdHGZvQGPp0tm1?=
 =?us-ascii?Q?ltPyFKtGsLw/URQyOCQNqwQP8iN850RCzSMUSm/cd5mZ62BW6eKHA3scZbQv?=
 =?us-ascii?Q?JnbZaIDVKJqx5xex6tt0EEV9/EFdGT4G9UHj1kIHHfkCDNTgGvsbjqdssbIe?=
 =?us-ascii?Q?Th7nWSNPbF7ZhP292lhUOHsQkEol8zGF9H2fNvEINEG2mDR7RU+y0S3AXrcp?=
 =?us-ascii?Q?vo2Dv40vTX9F1tJx6Is0Rgfqnb5DgtOLqZkxOq+w9O+a1Yri+jRsf7+KZ7Pp?=
 =?us-ascii?Q?uf29RZwue4iA9VHETNJcTn7urJWU64RhSANoMMXkWBuS+/3iMXxsFo7Rzh2O?=
 =?us-ascii?Q?0ayEfNbkiTSuoCMBVZ0/VLJIIKrnP7fqaS+4UfZSK9Zatfpm5y7jlQhj/eiB?=
 =?us-ascii?Q?B+BH7eIlKuXk6Rdhhhdg7lXhJ5wwl8qk3m/wz0aL37y3bIwpcZMI6mf2Y/QJ?=
 =?us-ascii?Q?t7Dfbhs6PTyOgHPLORtqKev4TYuvsBo6uNNAkE82lVa8JIaizeo4aCItq1Gv?=
 =?us-ascii?Q?J087TikYD1d3wHISFqIhXPQHEP/uG/koXLT2kUe+142epYj6ylYr?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ed5ea7-4e6f-472a-25a7-08df0d9e5dfb
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 11:43:14.3689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoeCHo/HhUpy11zp4Tcdb2M7PTZGQtE9tdEvZrAjcVc839PNLln9N79aTSiFY4sVwV8nxWydxOlU2mTmqTI7JdDe7lPG4Y4DnOfbDu1XFsQcMmhgjwy+Yjg8U7kJEvCA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB5159

Add bindings for Omnivision OS02G10 sensor.

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/i2c/ovti,os02g10.yaml      | 94 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 2 files changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
new file mode 100644
index 000000000000..8a9c253c26b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,os02g10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OS02G10 Image Sensor
+
+maintainers:
+  - Tarang Raval <tarang.raval@siliconsignals.io>
+
+description:
+  The OmniVision OS02G10 is a 2MP (1920x1080) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. It outputs RAW10 format data and supports
+  a 2-lane MIPI interface.
+
+properties:
+  compatible:
+    const: ovti,os02g10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply (2.8v)
+
+  dovdd-supply:
+    description: I/O Domain Power Supply (1.8v)
+
+  dvdd-supply:
+    description: Digital core Power Supply (1.5v)
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        required:
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@3c {
+            compatible = "ovti,os02g10";
+            reg = <0x3c>;
+            clocks = <&os02g10_clk>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&os02g10_avdd_2v8>;
+            dvdd-supply = <&os02g10_dvdd_1v5>;
+            dovdd-supply = <&os02g10_dovdd_1v8>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <720000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 95227134bcc1..3a4e6c047c54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20190,6 +20190,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 F:	drivers/media/i2c/og0ve1b.c

+OMNIVISION OS02G10 SENSOR DRIVER
+M:	Tarang Raval <tarang.raval@siliconsignals.io>
+M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
+
 OMNIVISION OS05B10 SENSOR DRIVER
 M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
 M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
--
2.34.1

