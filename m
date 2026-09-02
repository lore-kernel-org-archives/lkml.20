Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE4E396B70;
	Wed,  2 Sep 2026 11:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347137; cv=fail; b=dG57WNDWYpemsLnB/f0vdSUxccMFNcktcZdIAYMVFstbRhMYcQCxsz0hntpJMmH0wzIxTKsfMLAs4FZRmi4ojSlar9NAikr7OlxJJiQfOVexzFOYPqkPm6zD5IZSrbRcMRLPP6zX09HBzJGxRWG7uxhu/gYsGfCGtD3XYOICCD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347137; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VBDIEsaxuD8VpuYF4Tm6QJuYgLlcqe0/NqxfFZbsgJ2sCh07dyCAI8zeyeO6ciACUbdfxt3REe2yhtciFtMX6VNQWRE5kJ8Tcu8Zi9Aa1tSlkdUE2nfHHZV+YPPC9QpjbDvtqBPaiJEFIn6DpQY/y4cRMbX5ndAK63vNZPntGWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VuGWSdMF; arc=fail smtp.client-ip=52.101.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VuGWSdMF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgnKfPCqtp+DKE8cB9sUxIrM0LJjtaVeclz1jaI5ji4sanmCv6d3zHR9KCaqTxP9gAE0Yi4ABOMBnhmR6frKzNl7nYO6g8EhTUmk593WruvJoos6xXGNNyDXlEW0zNAKAW6e6uvF6mvAy6b3qtCZJYj+MJR5z0xiy4o7sNn9MaE+xwEIO7fJRf0EVqIVDQ+O0z3mC+CnWWUnxvSYezlK+M+afstMsTYiT5/zR8pdErjHl4AyR5qSbPPP6oEcxYT/esrw8l3PtcCxwXKvnP1IBfDRF+IT3xIA5E6BL+Av7hcMk5tjyGQUYcvHgnOBwVBTe/n6FtEXtVxQakurlZRwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=fsc+nU47DiRYRzFOOJz0Xq9/UJ0JnUGgpZMVpCULqRipW1TJ/1FD5/4rCAGWijm40KTS/1EYTuwRH4J2qo4qnA2pskqUgKB7oBkJOQnTi+AHR59puj7803kctifDr4iDDtXyPhMTomzNF6VUrSuGCStCc3H7BFNw2QbWIcBSzLKN9jfj0LgjfcE3+chktQVML8RzFewpYY+bl2vct3tz6bMZ9DqT5shoNHoK21rr3FuJX03GLVAX2vqeExMISzBjZ2l1uTILabm8PcmOuGgdvEgkpp5UYIutajxlH4N98MtoRHJdWAo7Fjl9LZ5B3nCqp62zQ+iYvUL4fxF2l380wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=VuGWSdMFTiWlz2gmeRfjA8NxtmD8a22ZNSW9cwPcpNMLoxg8uXlQS2HgS4nBHDujIn/XLWekopfjEpojgGqYKocbfxY/1afD9u0fADSVOWC26194DdLDLyWUx91cEmKz5YAZ9iqZX8Pu68+Wi0AR1DqWp32pbaJ49PTvrFeiuPQ4jwOnSgmkMVNqF8wTKXX4W/syobgGJpzlc9lw5qDyub4bkGrjbt4ngeMDRP/bRX2K/Fm9tal7mQzf5qVtBpZefOke8Q38oMNzJOAe6xbTDRziB5M0HSsqmu9UfiBjbhXzHVG1tKccE37VwRh3NEZmHbBiQYbhXYOmKaSVA8n1Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM9PR04MB8131.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 11:05:27 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 11:05:27 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 02 Sep 2026 22:05:15 +0530
Subject: [PATCH v45 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-imx-se-if-v45-2-6e400879d8ec@nxp.com>
References: <20260902-imx-se-if-v45-0-6e400879d8ec@nxp.com>
In-Reply-To: <20260902-imx-se-if-v45-0-6e400879d8ec@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788366919; l=3245;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=SvLRyfsNXU9fOwBATTAB6Rv1byu6MRh+dGc5woH6/ycWH1rNrEXLl4MsVAb2CxWTL/nFqBCJX
 LKLcCtKBhXvAgk6LeOXdBDr1xnst4yJjwN9HzWWL9TLvZr6BwUpAyND
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI3PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:295::13) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 9717f4de-2890-4ee9-c7b3-08df08e2181f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|366016|19092799006|376014|22082099003|18002099003|56012099006|3023799007|6133799003|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	MkqV7jE7aV/dgPPDP7ZmvzIMqnJINSFOVyMHeVifhAYKngji3dk7zhf85FaL0BsVbQrjWaX993JKJsLlGT/zDBR9xVqB0h5HHx2ocNnWqGnmOHIkp4xBxNyQaFng307fYzShXF5YVw+wlvmbJ62o1B94YkDW+Yp0rSsbiByog9ageRXFmnkcfpSl3oQGHfm4eZuLlsF5R+nQWmP3rgxA+HO3j4PRho1/yo9XzHPrQkj/wndhnaX3nZo/GgHNqRNf8slDZS79T06DMu8XnjkxwPAkxNZiZk4PexycMoL4xQVQT/RilLlZssMaJIL6mnacpEmgvQnt0EcJIl0uERe4akI7wLsY+wxdASZcfLSU8qlrXHIdNNHsp2ZHSp+gejKhOfFAoq/k6+3yxBqo8iYp+qkA4YcCv8zGrY5XEhjT+mcSqW6AqlnqZm1PshJWVT1EaLEcP6GjAzNlblNOZ56ETp0mVeLRdNLaXnLaJLVnLglPfpz7FevOgM6T8NsDjdn1HaySMJHf2CVWMN7l3JcxcfcbnnWNb4PCZnRU6/ReM5DAELytZb6/o7FNqY0TzMflN45U4m9RUpGLV4xB3+Bi2dAIDo1vbn4JUePAHoyiCjFzxZeDmP7xL4dA3ttYoCG39cmTC/RijbyySBCMxrgyCCMEmtE2I7vsh4E0/Js7ch0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(366016)(19092799006)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(6133799003)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2hqRFoxNkNZZGVkWnJOb3RERTI1MDE4dmJPTlZNREdlcHdJMTlWQm1UMk1X?=
 =?utf-8?B?SkQyYlFHc3oxYmZEOExGaTR6K1VZZFd0VFM1clQzM3o2bEdMQ29kbDh0cWtu?=
 =?utf-8?B?ZWNjd0VWeXBYcDFCa3UvQkROeGlPWkpBUFZKeWNOUmhBL21YQlp3STd3a0pH?=
 =?utf-8?B?V3plT0U2bnBValJsL1k0aEg5T2g3YlZ1RXExbnlLODN3emRFcXlaSlY5WURS?=
 =?utf-8?B?VXpsczJQV2dxVkQyRmpMUlJyeGk4OW1wbEIxZnRmOXVtUEhMNmp6TktuRFp5?=
 =?utf-8?B?MVdkaVZoTithWTNhZ3UyMlhSenVKL2tkSzhyMEYxTWpEUFVXaWFNaHR0bmZV?=
 =?utf-8?B?WjRIaUJkaWpXYWdYQlVUY1JqMWdsaW80cG1KQlJMcGw1ZXFxY01iVEdCdEky?=
 =?utf-8?B?SnhabG5ZdVNhbmtiZFFEMm1IQXVPWiszYnZPQ2RKS21lMEZOeW5FUU1HN05n?=
 =?utf-8?B?KzdISTc0UzhJT2JrRE9KU2c2Z1VpdE5HNW1ITG5OalREemduMHBDNTVOVVRh?=
 =?utf-8?B?WjFpa3RCTWZuYzNpK2NaUDZoTmFzUEFEbkp1Mk1TSmZXR1dKdk1oSjU3OWZG?=
 =?utf-8?B?VERVNFExVWs0UFE3NTVKWEhLMGhhOGtUUS9Fb3c1K2tLY3lIelpWM0o0azg3?=
 =?utf-8?B?eFVRNFl6a3JPSk5melNqcVhMdUszM3hJc0J4RHV6MWVOMFhYaElrbE42dzY2?=
 =?utf-8?B?eGhmQVArdC9zQ2daZ0NnaEM2MnZzU3U3QmVmSE8wbFFsR1dxMnVLN2VaRWs1?=
 =?utf-8?B?dWYwT0IrQUxYeE5iaFE1UTlNdGMyN25GdTRpaFVnUWNnRU1SejdSTktVQTJs?=
 =?utf-8?B?aE1VQzlXLzVxZkc2bDJKekFORHBoeXlhdEZaUDNFcHd1MUkrUGdxakJUWGR5?=
 =?utf-8?B?eHp0NXd6ZTRHaGE3VUxVRWRSMjF0UExhcGFSd2NaQXdYVXV3L2tQSk84ZkVC?=
 =?utf-8?B?VHMwRGNKWDRGWmFsUTlYMi9DSWhSUGIxclYrTFpYK29vVStGekxTWmJUNlZp?=
 =?utf-8?B?MkNGRDBtRUk0NmJJZnVrVi9GL2JXTC9oTHBkYXMvc2c4bWlDSkRreU1tZzF2?=
 =?utf-8?B?cWEwT3JiNEwvazdMWXc3dGZaVXJENWJqbTlPMFBkc29qUjFuTWxneVpyZEh4?=
 =?utf-8?B?SUk3aDdHOVdlaTJzblZ3Vy84R3hmcGx6VzVGWS85cUJCZ29uMHdqOHIwT2x4?=
 =?utf-8?B?em5GcGZ6MEZnZUlPcVBpaGwxSklJSi9vQldoZUh6QW5LSUZ5Uy9hcjVpYktB?=
 =?utf-8?B?RlBmVUJLek4xVkU1QzNQUnlQOHc4MXBXS21XZXV5V3ZnbDY4S2pJempCaVdQ?=
 =?utf-8?B?RUk5WUpkdW82QWNuYzByTkN2OWxrMWJtWkJsQzQvSzFWQWVaclViTVpZbzRx?=
 =?utf-8?B?UUtHUUJtbXFEUDlRNHJYZGZBQ1Z5UGxSUFFJUklROWtMQ2lVa1lJSFdIVURt?=
 =?utf-8?B?dTlGRXhBejNiMTl6MnZRcmtuZzYyMnJ0WXlDMlh5N093UVlFN2loa1RmZGZl?=
 =?utf-8?B?SG5tWU45eVN1bUhvcWVQTnpRSjNZN1Q3ZXV3K2w0dVQzM1RHRit1VWgvM2Nm?=
 =?utf-8?B?NURaTUZadkphZloyY3lOd09RY1IySk5jZkUxaDNYd3MzWjQ1T01PQ2RlTGVu?=
 =?utf-8?B?REh1dFlGUldFNk04cFQ0aHNGTEQvZ1JwckZKYVFScC94RnFxR0ttZGJtd1BQ?=
 =?utf-8?B?eTJpZUx4UjJ0dHZQY1luT21HcDE2Q0xiZHJWZEtreUs4MkF4ajJXMEVQSmda?=
 =?utf-8?B?dVY1VEpKT0R4OVppcGxTeG43L2RXVEN6UzZnVEx6SFN4a3Fkb29pNTFUL0RF?=
 =?utf-8?B?dTI3K1BZczRnWVlsSDVtd21vNzRZS0VUNFVCTVRsVmZkNzYwSE5SdlpXSEky?=
 =?utf-8?B?YnYvOEovV3BKQWtlSTk1aFhLUzkvalowMmV2NXE2RjVsM044VkpIcmNMQXZK?=
 =?utf-8?B?TytzMW1xQVRwMit0bXZzTHNCU2sya21qYUxhejlRVmxUdjdmWFpUcFI5Z1Zy?=
 =?utf-8?B?ckdtK042SjRhM204OWViRzNyN2tLQXgyNmxBT3ZxRVlveW9pU3A5V2hIdCt0?=
 =?utf-8?B?Y2tGNFRXTkNqbDk4RFlwQ25uZ3hKK2pjb0FJRUY2SjEwYVpHc1FSUitUeEhH?=
 =?utf-8?B?WXFFZ0dQZ29ZU2xPSTJCN3hvTWJVeTBLRHNWQzNURzZaamZGOFdIYUpJbU9J?=
 =?utf-8?B?OUFqeUNRODFGUEpXY1pCYnZMOTMzUElkaWxNWlVLOUE5UmtXSkVoRFRXMVgx?=
 =?utf-8?B?Yjl6OTJUUDc5SHhicHJpVWx5RVdJdU1FbkVKd0duUzV5SDJxbG5OdFhOYnp1?=
 =?utf-8?B?M0Q4WEJrdWtJTEZ4UlRQTlQ1T3JEVEpBbkFVeDA2RmZkanpCNnZWeVkza0dj?=
 =?utf-8?Q?7Tg/3baL2NnfEf0onsUexyaWHJpopIu9zgQfb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9717f4de-2890-4ee9-c7b3-08df08e2181f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:05:27.1260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kd7q51XYygtjgASi6/XRf0xLjrOAv55OBTiHxyRnmOmPSDd8tRbpIRda2mQg56ThBRH2szYVtTj5Gezo+YiwsSV9vdWo+QKZeT5rq8eBbL04Bng52V/0ZQl0FBEnsO/S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131

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

