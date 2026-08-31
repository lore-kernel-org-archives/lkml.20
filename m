Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358183C09E4;
	Mon, 31 Aug 2026 06:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158913; cv=fail; b=QoJWUFTCS322anQ8na0RDdhRWWCbhCSAVuWKFIdsOAAKqaCbUujqgB16rj3RT6ORroqWf67bo/nPMUr6/SGx/j/GXYi9Uwn0h9oAUGlq4S9Q0i/hYTGTtWUXgR9R8Lr/hnYYrHVzIR9lt3pn5Jz822AFMDtffJzFaDTKNqhzI5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158913; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KjUekrr+BPdawUMQOCX+N0QkBOYvvR+soJ3UOaR0iJp8j7msDA9Hr6cvXUNQdUEGiYirv9URiJ0aBdrvQrbFNwSTAHlkiiJ5YHm6VfHiocpncUp5pOt0yx+lq3bnPswWVjs1OvyIIUHC3Seh2Y4O20+SEM2xfFuBbxhmkJhxkkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aLM8KMVx; arc=fail smtp.client-ip=40.107.162.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aLM8KMVx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfbDkaAdeYqpFliSOjT+urnBs8UhqgYaSTrsPQA2HgG3qO1lxnxyEquzzLpDXfiXJaD8KIv2DyP5hZZvQMudtIEbNGE+YUWT0ImnvtjOE5hmovDTH2+qX2tWE/wuv+dmchURjUYE1GDBqRv/BkoELjHigJzIHYADXmMaZrYN6tW1qidiUw+He3/8kpwIbsG8UYWKpfUsCt8lMHTN/CgG9oz8KX3djYjWYacVrymE/kcdpeWhv9r34rOk/U0M0y3SeuVJVHzPS8b0b6GDEV5mXJg8lsetWPltfQZLx8y8hexaS6JVaRSRgNM7ONKPDGFuL9FFRK3Mygp2figA4Q9TPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=r2sko455O0NUm3E1iiO1FI8t/UvAyoyAvcme8dVf7JbGWUpBKqcS5MAmLBOZYA2jbmWlEzJ9S8/7isIFEqcPQMGiJoolvbPxNyRFbGy2iQjeWBr+XvXaiTqiJiknkiaqnwH8/+uqEuvVF0Ar9ycL2zuOCaktJ2bg/g7PE6Nv5yhBg88axFXDFnDr/GtTY2gqFqEqxJUM11SOGZp93RHTI4lRics25N0oO1SRFqT+Z4pffnWLsVHVS26eLidrdgPAK0JYbmVgSVRFdOVq+luCno1YAKlVqHHkLrL0T5IlFa8WCfyk49Ars3vsNby3kAKQE4UeJrcmr8Z5hRbJ6M8ikg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=aLM8KMVxFlEjiknXVnrZFcF+uBKUmqmul/RZ89WJqfe7s2R54yBqxcB3wy/curpBdqlvIaqa6H6zJTohdooHbD99snFnn6nWOyRISJ/v501YvM1+eUFz4jr654txSQlOBnLTef69EJfPGNEABrRpy5PAcWZc7TJ7mvG8L5YgwC7f3PttPdf0KAeF4q3Qi6iZAyGJCqZOdHOQ7WFg8Y9HnQdM0gGs5d/IP2JJG0wO9fFA2Jjthr5S0oZFM0PpSWF9mH85J6rVUv48krCj5GML9djRSEJC7U/283ZlHDd5GSZGJ8AAKyJfhrItapxcF+wPC/BdMBBl37Ya8GtRQzVueQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by DBBPR04MB7705.eurprd04.prod.outlook.com (2603:10a6:10:209::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:48:30 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:48:30 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 31 Aug 2026 17:48:23 +0530
Subject: [PATCH v43 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-imx-se-if-v43-2-a3deadbda4ef@nxp.com>
References: <20260831-imx-se-if-v43-0-a3deadbda4ef@nxp.com>
In-Reply-To: <20260831-imx-se-if-v43-0-a3deadbda4ef@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788178704; l=3245;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=JBv+xUT7NDsjgfJ6OPQlfC2FohAdgrQqmABVz1p6gB78aVRczGuGpBkB9RTxwxDaAYLJZa2Cx
 1xi2vKuLYUZD/3VF+0jZJ3UO6npiSKrN37pmbw3odnkoEeNxObnUa2i
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI1PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::15) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|DBBPR04MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 14913641-c524-4034-b819-08df072bde2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|23010399003|10067099003|3023799007|6133799003|22082099003|18002099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	C42ruXccyb1mPRLlNt/qQFCgTJQ21AbEiuqiu7SGGXpX8+WCF2NHtxwcWSdhzfzvVG/7VUJVrT9vF1zeRr+Jc3wR6Z9Vn2atDuzidn2F1Ji0SNaB6WfV9XIn0OIulHZi9vjBXW637IAivlavY0UlMnKx3ZAxJ3e+YHU+WrjXhMdwkXvefa5vlFuoyeKzUw48+pSQYY8wtssmAfqcCtS1kiBhq+GydN9nyOWi2YJpO3pIWpSRkQwx+iV7zr9paCdMiN/WcicUIGt0xbA+cCFRdfSVtRBzI25X1PuCZLBEkhDJ6D1iOj+KtPqHRoEAIDIwHSe++hR4z5bhN31AExxEbM+IixUrYTrvKzZ8lf8ylB0o+pf5dJB0skjtQ0nAGd6I2Q7TcN5CqwCIeeeu5uEU290xieEp2dH5p5cbcDHZUNityV5Q9QX59lFvNqiCTkwzqUYD2Z4Bq1fv9TDT+Eza/IW3FuqSOwEkWJEFfLcWf+XbSTodvbicxPRlbJE5Y6X/Ux+/bx+FrflJGJ/DeF/WqeCtbG21XfHwPWT11IbKFO/ZW/F+0MqM6ZC79NlAAE+qErIJVG27ca8YcpO2hLWoPBM8yzoIMZaWWsQDm5Y+Eu6BCHeOHwyhN73shF8Q5S7xyw6sY0W6x32pKIM53HkO+OIbeBQ2FEOmjXDPL8K8Agw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(23010399003)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFh6Y1BwRjlmQWc1ZWp4TGZneStQVXJiNVh1bk1YbGtNODJVaWsyQ1VGckJo?=
 =?utf-8?B?U1hqeEw4amE3N1NNREhDek9ZUWc4d2F0NHRHSkd6TzdxU2I5andBU0RXVzN1?=
 =?utf-8?B?N081ZnBNaU8xU3dFSlFoTGlVNFZJSmhZZE1oNVEvY3Q4TyszQzBTUFh1Z2RD?=
 =?utf-8?B?TDJtdG0vbkV4djdyNXdWQzVSWDQ5MThHKzU3ck9wamJWT0FDM0lPZHR6K1Ba?=
 =?utf-8?B?UzVmUjQ2emJtaVQ3eGpGNEdxNWJqVFdqNS8wVmlETjZ5bWhJOGpoeUdkdnA0?=
 =?utf-8?B?RnhaenVRQ1JNaTFNV2F1S0I3MmtXUERhNFJVMnhvOW0zcSttaEFIM2FNYWlE?=
 =?utf-8?B?VXQ0Qnpqd0VxOXU1VXpjRzQ1MUZ5M25zdE5PaUw0UDNYWFRTcE4vYlV0aGFq?=
 =?utf-8?B?YlJnRUlIQmsrdXhhNlU1V2dMZ1Z1ZkFvcUs3Q3dyN2RhMXFoQVdoeXBnODFO?=
 =?utf-8?B?cXFLUlZ0eGNCUFJ0MGRZRThaWVp6bUNlL2ozOW5MSkx1RjhrT2FCQ3JacWdw?=
 =?utf-8?B?RDBDMTJCSiszR3FsVVNLY1B5aTJRUXpLTy9zYk5VNjVJT1BJUGZBT1YzUytX?=
 =?utf-8?B?VEFGRHMvaWpSRWdxQk1zWTlDYStta01wUVluVlI5blE2VEQ3a1N4RkN6OEtP?=
 =?utf-8?B?MHUrcEF1U3d2UXNueVNKdTQzcUJFQ0N6SThVK1NWczh6eFdidmxqNFFlK1Ix?=
 =?utf-8?B?QTdsa1dkWTdlOTl3eDdscjh2aTBMTEw2dUNaUStOSEVrOEJxR1NZR0FHN0p2?=
 =?utf-8?B?R1c4NytFcVVna2VFNmdTYytBWnhvVGNQRDhDRlFkSjlnQ0dyRCtVdXZlYlNF?=
 =?utf-8?B?R1hPelh3cjVlbHFmWW8rdzhTNkk2MW8yL2NzekltcTBOcXMwaFpNcFoxRlNN?=
 =?utf-8?B?RTdNU3Y1TnI5VTEwZlh0aFZjbjdVTkJVM0xncDNKV3FuTzA4Q2JERm54YnR0?=
 =?utf-8?B?Z0IxSVZXSWJRR0xOeE9RYWNmMUFQZk1FL0JkY25jQ0JiQkhsdUY0OGJlbEpo?=
 =?utf-8?B?TDN3L1ZRbG4yY3BtMEE1UURWQTJaZS84Sk9jaFlCVnY2RE5YVTZoMnc4clM2?=
 =?utf-8?B?TkY0SGhNdDFWK0lRY0IwN2hTN1E2VHozb3RnaDV0TUdadHJ0aGZSQVRJamxS?=
 =?utf-8?B?UXZoSTZ0amVCb00xRXVUbmViTDd0UVJNN1podzFWbUdablpSZVkzMm9rMHBS?=
 =?utf-8?B?eGhKS0tDVjNqTk1qNmtwakUzbXpiT2laZGUzSTNWRS9NMlZvWXRXeWNqTFhQ?=
 =?utf-8?B?bDcyYXVHc2N2OWpUSjFoM1pPY1laVENLTUp6Umw5bE5YMTFVd21qNVlHbjVL?=
 =?utf-8?B?STRrZXNZd2RVa2hvci84bHQ2Z2sxUENVaWxMU01DbkdkOGgyRkR6Tisya3Mx?=
 =?utf-8?B?NGc2RDh2SEFWQTBNMW9LRlZudE5KVk9uS2d3eWNaOFFraEo4OTNMM0pUcGU3?=
 =?utf-8?B?ZCtrV2IvNXA2aElJNG9MeWNnU2UyWlhrTjZnKzdoc1hYSWFFYVBVclFldmlD?=
 =?utf-8?B?MkNIYWtwZ281YzFPbUgwd0RHR3dzTnZ2eUlsNkpIcWFRQkYyaVlsdlA3b240?=
 =?utf-8?B?WWltbkFmTlRVTHZGRnZDd29XaXdNM0YrTTlHRVpybmkrR1FTU3R1UjArOEZs?=
 =?utf-8?B?MnYyMkFiYkxBT2xUV0FCRElhcExkL3FYbWJkZlNJM1VCOEdIQ1dBdDVtdFFx?=
 =?utf-8?B?NkkwcE1LZm5QTk9BcUxHN3M3emJ5UGNBdnIrc0xzNlJRTGFLYXFscUt2VkRj?=
 =?utf-8?B?MWVkRkhkNGpNR0J5dS8yYjBOc2JpSngxQy9IZXp0NVBvaSs1elVIM25JV29i?=
 =?utf-8?B?WFEvOGEvcDYrTlJFUXlML0RnVFJUQXhDY09FOXZJR0ExZDdTRG9OSWtKNEhw?=
 =?utf-8?B?MXBxRnhlcHRHVWlwaVljMWNlMVJSU0hJblhVeVVxcHBPcEMvcitkOHUyMlA3?=
 =?utf-8?B?czRyQzA5V2VIOFlIcXR5dlIrM0xjSVRNTXpWbjhsQWJPQmVFWXF4TG5iTkRa?=
 =?utf-8?B?QmpBWHdQcytNL0NEbUtqaHVWYStiY0JnRFQzUXk3cnFoZHh1akQwd3N3Qy9i?=
 =?utf-8?B?YTFyWjFUeWx1Wkl1ZmVIZk5Tdkd4cjBuc2dnZFdPUzZlOE9aajFLWmVsRDRh?=
 =?utf-8?B?aUVGQVZWQ1VZZjh2QlVxVWFlNktFN21hRWlmSHBXSU1SR2paUk9VcjR1c2Yz?=
 =?utf-8?B?ZVhCVHlBM1JSbGFZS0V4M3dVRXlIKytjK0hKbXZxcHo3Q3lqczg2ajZXOFg4?=
 =?utf-8?B?bWlmdWkzZDMrQmVVVFQ1S3ZsNlErVnJSL3RjWUNDYXU1bUZvNkZUcXMwNDls?=
 =?utf-8?B?d0tBN2FWcnA5MnlQRFFxK2JnNGNqa05pRzJJbWFjcmxqeElTVlFGRmhUZUtw?=
 =?utf-8?Q?GjJzjuR29K5QgXxoHAY0AGRCHnHmpESKTmFTZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14913641-c524-4034-b819-08df072bde2e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:48:30.4212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKbxHS51jwS2EundCq+c+ShkCv5Q3yO7pjPM+Ymsm+e+GYjHSKmeqr8ouFub/3rVLyjxYkG31m0/Db/UYLfxvsFNcayTWYP0TDGuGhdEMolvn2hPAyy8fsEiom4QFw6U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7705

From: Pankaj Gupta <pankaj.gupta@nxp.com>

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0

