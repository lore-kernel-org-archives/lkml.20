Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011009.outbound.protection.outlook.com [40.107.130.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93841382F15;
	Wed,  2 Sep 2026 06:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331145; cv=fail; b=a7C3E89QAKiPLarPM5rPl+PRfllhYyuA1PShCoEOJM9Lu+RHKQx0bxCWUTyFIfLE9FA8aTaRg1CHJD6gNc3lTfyIzRRORPGzUkIPOWBsE7WJwVdiSN3urKo3S4KOxyGIopcdRb64kItZdRReT8YcI16aqFa2eLcK/XTybeCw36U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331145; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=czDvg/vLUH0a0ZFFJxUXZEcMpPskEO3w044ytxSLU3BtroQ1Fua0BjQYC4yx5UFl4sSof8jFs1aLv4DXk/pq2t51LnGnL9lb+zT8IfZX4zhxFolk0GEn0Co7xsEYRjpCfagLc+gHLn8G3T0m7w56zHfvYANzF4vhlmx8uMHosA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=szHrv6MR; arc=fail smtp.client-ip=40.107.130.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="szHrv6MR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rC15jx670J1P2Lgottb/mK+e2yAp6KA2PXqAiHw2Q2zN1JKFJ47eRQvITYLwwIuziwl7H7uMF7L+MGJkUcwz+5P+N+fDv6F7D+HXJhS2kPDHWd3GZO04bQqPmss9AqzcEZ477kTZDgmF3jdf8mGt/sqFTCRXmU1Q8p7n3KjHAlaTPZPmua8tMjbiLTZGbbV86eg7LqHiRSTt0wY2SdpwRc+ci78sfKgI4+N/UULfnMSnVNuQplg8lXPIoIXD4GMj10YLEFRtzVIb5xHn6w9S072A5u+FswdGiJs5zC+FrGXlGATJpMste/Wo5Z9WlckxGHPTtCnidStpTY0LYM7beA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=yyhTE6xjB5oABdRivThe1AhSV8C1T5msE6GD8PY5CCGBtg3Eau7QaJkBoNd+7DgX7od3HDZQR0MMZknSr43IozjRMagWN0lmMA3a8NPTLACEHcsUaeYzWEfkAnbE0x/m5hUvqwTGH5oj84FpIRMKFLj4y9rqnB7ptSvUnKnKWlhoaSkeOczGydhDUpxCD6cO7T1n19dFq0TUbQ9dCa4+OmLj2PRjGcn/P2q7hgtV4cqL5bInsN5eyyZHg+ynbFmCLQykutSt1QA8vAd2a7WKsu35nRprBZe58WbYb618sVjf+KqlOXhX+KMUHHYXhFAh2M7ZU//jYNwzXZByb5djkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=szHrv6MR7od1UCx8ByqWogUPuaEGlyz56EtO1Bxj3SMkIQYTYiKJO+jBT9i3mjD0feqjSe+0zSM+2A+CegT0XDIAtTSsxGECeNArB89aOY6fHKJEJ4or82k7BsHhF8p6fPkbjeZcHVws+wDF55TzdXRt5acTfZ6YqRBcKQxjNFiihmvLz2ZLfnqwjwWSjZ+e4izxJJFwq50X55u3UYX3GIqxtqp+Opw479oi41M6ahEEIWKJQHromdr6Zh3imRELGwvw9Kmzk5cX5r1pDC+z2IK9/5lTXoCoX53yQqOzFEiR8gJCBi4fN0I7ayG6GSXCe4vJUlQDjpKRM+sQwrghYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM7PR04MB6840.eurprd04.prod.outlook.com (2603:10a6:20b:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 06:38:57 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 06:38:57 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 02 Sep 2026 17:38:53 +0530
Subject: [PATCH v44 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-imx-se-if-v44-1-104658bf941a@nxp.com>
References: <20260902-imx-se-if-v44-0-104658bf941a@nxp.com>
In-Reply-To: <20260902-imx-se-if-v44-0-104658bf941a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788350933; l=7403;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=qk1bs214z0q6DqppM8FvYIyZtD0o7MvOhTVq/hOuznOGhhfUoL+BE8MBRHzoP/aenPfgEYjgQ
 w71UVV7VhKTDvF0gY7/PQaIL23yRrONzKNUFu4m0Rm+myPglyU5Hx7H
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI3PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:295::8) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM7PR04MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: c784ee17-c9fd-463e-175c-08df08bcdd59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|23010399003|366016|56012099006|11063799006|6133799003|10067099003|3023799007|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	Ql7yiCksLzyoUBHi6jA28lpu8MdpH6I0Dz42yw0nITEczepa6b7ugTZYs9VdlWn/gyKy52d2nbqQt+zNl9HK5pGmzpPSNXH1W7lBhBZ1myzaB7cogiGRMdO+gKKt8A6cYS6GX10uQ7MXky9o9QNJwde1Bnd4TPfJATcU3XR7WA7AD7t/+K5yT+X9EW2Hanz1T8ds6pJkzMUxAuo72AwCEOqN3RDGEIKWf+RBEkTaoRVZHR99U88NfzdLOXCt0SsGu3IJQbLdEV9s4qAuBFSFnbQIq/6XtFRZepW02c9oK7pL8AuhjG4pWYMS8zcYuqbT0Cxhc1xjVqwtMf/4P0OykNGrIvRdkmzTO+AEo1UN4PXIGOqjNvi4NM5/mYf1rrjzr3F18hjpooe5byjjIpBEdHpkH/vHOk4snwvaH80xxME8PnIwTDa6HTj8ssF4vl8hM+K9z1brrWRnI9mj2hDwYqHTzNqA0RHUkI1Gjkoj22b9+P7B1NOD5Jebi2PnSzUdro92/qLfbACOdquzXZkCsHWXn4HIbKqRmmBeN7za+HY27tDTuUEdzjjh/+MQp4OlnX5AGNEcDOZYSJo+fjL6VA0lROi4nENioBy7S+7uIAHBowtAcO2jdCWxgi/QNg/GNKn6RpO+NEaVZvN9C0H0xu6EwJG1pkwO7lNbBpVtBGN9U6k9qt8XRBAOSk+5lm21vecZymTt9474eSZl+ILW8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(23010399003)(366016)(56012099006)(11063799006)(6133799003)(10067099003)(3023799007)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDNwTGFrUkN6SG42eWdlTTdnb1RlNG9BTWZmMEZSRFdRZnFxTkc3UG43cDJH?=
 =?utf-8?B?YVh3RXFWUXE2cmlUcEVhQ1loVzNqKzJRZW12VVhlUnIwUmxKMEVPWXNqZGg2?=
 =?utf-8?B?SktmNXJjczFKOVJzTXVNVjNVSXR3WGxJQmduWGgybU04ZW1lM2NsT0FCaEU1?=
 =?utf-8?B?aVpOL1dlUDVraTdlSFZzUDdYenRmVUMwV1puTGxIaTVieUN4SjM4QTdwdXE0?=
 =?utf-8?B?ZmtPNXd3Q3gweHo5Sksrb3NyNWJhTTJmSFl4NnpUVXgxS1oxZGlGbUJUWDJi?=
 =?utf-8?B?amNnUXZ6dVBkeUcrVzlCaVJJdTk1eGZrL3EvYTNEUmdOSDE1MGRWTXozVjRM?=
 =?utf-8?B?WWdjYXczL3pXc3NBQ2E4MlFaYzZEU0w4THU0SHBBN2t3dlduOStFRjVzb0o5?=
 =?utf-8?B?elZkRDFCekRLWUxOcGY2bituenJ3S2g2Nmo2akxndWNUb0dLTXN4bzVoWEgz?=
 =?utf-8?B?ZjBBZVdtZktmcStJdlBKOWtJVnVUcnJtU2RBSU95YlhJN0NweHNwMERyMFZ0?=
 =?utf-8?B?ZGJyUWQyRmZYajRXY0YyVkFiMFIzNzlWWlY2V3JGMS9GSGQ0dXovRGdmSWZW?=
 =?utf-8?B?R241NC9wMHNMcHRDeVRSdUtpY0RxclFZaGxTeTUrTWVWQTNOZEMwVm50a3o0?=
 =?utf-8?B?NkdCQllXVTZpMXFPc2dRREYxSWNUcHhFRHpuZEllUkl0ZWRCT1Z4S2lwdVZq?=
 =?utf-8?B?VGIxY0twd3U2cGJtcEVrcnhyQmJDNXBhTldTTXVVUFFZeEZEdkt4cVdReE1q?=
 =?utf-8?B?QmVOaXFvakxJVkJpRlYyM2plTUhzMVpxQWo3cXlPdFUrRFgrMlVQb3pHdC8w?=
 =?utf-8?B?OFd1VEtKSUx6aSt1OExaRklYYk53b0h3QnArd1hPNk9FQ09nZklFR0Z1TFdY?=
 =?utf-8?B?VHpkbFdqUmRpd203d3BoM2RZQ3lWWDUxMmVHbmsxYU9yZVlkQWFqMVVGN21u?=
 =?utf-8?B?RndXZUFWdm5HcjJ2NFZ6T0x4TVMvUzQ4WTY1ZlA5U0FyNkJtNHpuWjRYMTN2?=
 =?utf-8?B?R3BpR0JkNzNrY0tmNWg4ZVlLSXU5bGhVRFQxSm5ra1dnZkRLb3ZDVUREUno5?=
 =?utf-8?B?OXdqczE5RGwwcXRBMVNoMlFtMkNwREp3WU90bm5sckVMQVhlZG85a1dOZUky?=
 =?utf-8?B?Q1c0WUtVaUU5dXArMjcvcmxQOW9YbzJPU0o1TnlkVUtzM3ZDNkVCNllvTXho?=
 =?utf-8?B?eThpQXR0VExCcC9XWUkwc1ltT21UWEhmQzh3UnNoUFdCY1pmVFlCeGxiTUNT?=
 =?utf-8?B?ZWR4eFBIcWNOT2hpZ01lRlBvZ2N4NVd6QStqNEQ1d01aekNhdkhHaGR4bkRD?=
 =?utf-8?B?Sk1GRDRWQ3pnMlZJbHRUSytKcTFlMEJTWlJIVVlSNk5Va3N4ZTZjU1VmOHpR?=
 =?utf-8?B?dVl3M3d1d2pRbko2V3g3YURUbm8wZ2dpSVdDK0t1dXZTTGxtS2tYTENPRGZv?=
 =?utf-8?B?YmNYcUV1TExDdlcxQ0J6b29YZ1ZLL0xhY2ZEaFNzWkUxams2WGtRcXFoWGx6?=
 =?utf-8?B?emwrQkhjL0s2bUJCcjJmY1Q0Y0daV0dDbU1MNU50RVcycTV1TlVoSnFxSTMw?=
 =?utf-8?B?Vml0R2RUcTZZREdmQ1MxMmxEemFZQVFmRXM4Y24zdkNUd3FsZkNlRDZoVnhi?=
 =?utf-8?B?QU04YWRYSGtOZmxETkhENzhvYy9mR291aUpsb01sYStOeVVtK1Irem9ZU3FP?=
 =?utf-8?B?QXV2K3NZNUg2TUNRRWE3MHhVYkRpS2VFQmhxK0crZ0xOYi9QTis4bkQ3aEc3?=
 =?utf-8?B?b3plT2liaEJBV3dyRmlRaEVrZUFZbzFtY1ZWU3p1OTJoeDRtNmYzSXdxbVdF?=
 =?utf-8?B?a2xzRHNwdXhSMU05R0pac0doeWxkSlRZT05VM3VneGNUa3drQ0EwNy80dnRQ?=
 =?utf-8?B?NkwrV3IwbDNsOXBlS0pFV21qa24wcndnWGp6OGo5VkY1YTQ2WEdrWE5xUWly?=
 =?utf-8?B?eHNhbGl6K0FMZ3R6aWlLQ3RUQW5LdGcrUi9rcVl5M01YU2Zwc3dlK0dKVkxS?=
 =?utf-8?B?Qm9lb3A2WUJOaGVVc1hRYksrTVZFS3BUNEphYXA2S3hzTGZNM2ZGdGxjS0cz?=
 =?utf-8?B?SG1YRk91ak1EYmkxWWZuN1ZiYmtxS2hsbGZJb25PbFZReVdxeFAwVXNPc2pZ?=
 =?utf-8?B?RG1oRHpENU85ai9IQUVucmM3TzY2T2l5Y0UxZVljeUMxcjRUN3I5VzZrUGtX?=
 =?utf-8?B?SksvNTJqRE1Cd2wybHc0dHN1M0VrNkRJYU1mYkY5SW1YME5sYUtKaEZDTGp4?=
 =?utf-8?B?UXFsNHE4VDl2OTkzY0R2OUg4bHRGNDlVZ2xxbnNpUk1Id1MvNjJKZlZ3WkxX?=
 =?utf-8?B?VGFORGJoNEZMRkxocWhQbVBQWVo0Zm5sV0ZXZ2FGUU9hS3pESEdnajk5TTRa?=
 =?utf-8?Q?Ojumbb7ZqZuBEJmT6jibzGDunNw0HQHE4HTSI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c784ee17-c9fd-463e-175c-08df08bcdd59
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 06:38:57.3005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVlXFk1UjipvRfBrVXYflNymR4jDIcsrrQDJvMq0oIiSkevbuj4/Pj0LS7NEiHHtp0PH6nCwzFWOXyHNDFSUdovlmt93TzwJwaQRT9JU3esNlmMDyWrZXOeW+3Tb7ISi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6840

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..6c6fa9a0ba1d 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,136 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like:
+
+- Hardware Security Module (HSM)
+- Security Hardware Extension (SHE)
+- Vehicular to Anything (V2X)
+
+Each of the above features is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in the form of
+a command/response mechanism. Each client could expose a specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose a specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+MU(s) is/are not shared between SE(s). But for an SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE, all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprises two layers:
+
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+
+  - Serializing the messages to be sent over an MU.
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+   kernel space +------+      +------+     +------+      |
+                                                         |
+   +---------------------------------------------------- |
+                    |             |           |          |
+   userspace   /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management over a Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0

