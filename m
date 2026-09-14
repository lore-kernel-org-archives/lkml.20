Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905B647DF8B;
	Mon, 14 Sep 2026 14:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395114; cv=fail; b=F8vS8SvIcvoeT6trUeSFeu5bKO1276eHGREubJQsq8trw3/7tSxKEmEd1TmOjXoOvtPkiXHv9Ol9T9FrsqDNTWK7gIbj/ubguf+z3xhj5Wzp/eJIgdznQZy552t2i6DSn76CiYTRaBL+BVvUBA55wOTXk0ckNVxCBDc6qU7Wgpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395114; c=relaxed/simple;
	bh=luBpkiF6jrbfu2H/RAjLjQQu8stbN8WYKR7uzSzrF2Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=p8Htq0HqG6f4VaUu8aCvXBdTtLHvOscDmbj0ZOR4ulxDxVYZ8Wrdd9lgFgQ+wkCNJU4YfXNxB/B3KZpyyuYkaVYy81xA0tlA4ZN3SWPD3602zmQbZ/kDrYoG9bZc8z11OUpHJ4y+jUyREqTJXc/koaD9shSNw0LxqG/mGH1Ming=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=E1j2aMwb; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="E1j2aMwb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/VCkgm3bZzc5+NgFCczrVmwJjRo9uTKSIcEvIOoIw2dNSnyGpzN+EW/Q4cX4c+NBZYnCZQrqn4PiM9dRHWZhimitkP0NFuYwM+txJGxQDFNqzAggODQ8tA7p0rSm7ERbeYdbSkzPDcCj6qoGtaBf4GIxsdIXLnOOpl1vyOTU+yUXmYiF5TaAoMjXGV7FGOa/zNNnnLsOxwr7vMD0H6ox/KtQ+ICU4z9HWchAG3b9yNnq/n3Q9lq1oylGuaX3S4yh5YA8xaUvXOS8m/SAvb44XHVo4HqniIfoJ8D19MBpPNrdnr6gCrkjMLtGJp3+w/KKj4exGmF+aX0kAr6VOrIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=XtrWRhDQ3nN0aG4aIA0izdOpQ88pPQuwItMDb9r9sP18bZll4Y44YHki5I2W92k5tjPyo4tweTb0iosI28d7BirGJ7SfmajoBzEVwl4t7eIfRjwewjMabSVRYMT+GrbbwBDxSVYYh2FNrr9BhFdYCSOZ9h9cQkwMravy5ZlGFeovrQW5/SQ+qpavA7QOa92zpj2sq2gaBP52i8tW64g65BK4PJ2gx5/0ot4bUMlYwCUPbfyF12vp2w/X6mDHHU+IuqMvwDZwwzeORnHs96kC9JioCExVJ10EfPnQSJ5DSu6TjLz6FJ1ZktYaoJIEvhYqrN4u3Z5VrN4zId1bzpDoCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=E1j2aMwbjzwRZcBsO48Fu/xXFvpJYehDVHU2k9od/7eUE36rK20J+34WtTTKFCCr9Bj+UBjMsU4EcDq5Xn4CZS2xgnUo9r1ujimz6vWpvWx2PLZoXV8ftr6lXQALXCmE32Gdxdh45kO/jT0B6u+KjUWOYqp3VwMiFqPSxay+pWLUifZanKAHQnfUQoqMUwiPxP2WKJcZ+C9Z0k1YoI5J5Rj1b5aM3lKTTnPJJrp2/WDGSxL1NbW4sJ0CYy1iXKh2QJ8B2OaIVlsakIfbX97Kv0Yz4uKRc/Cctaw9VHQTqZQw8efXX4/ky5HB3ny3TqXsXbDoKQyQoiAelaLhuglTUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM9PR04MB8618.eurprd04.prod.outlook.com (2603:10a6:20b:439::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 14:11:14 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 14:11:14 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 15 Sep 2026 01:10:03 +0530
Subject: [PATCH v51 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-imx-se-if-v51-6-4a7dac612cb5@nxp.com>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
In-Reply-To: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789414820; l=1533;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=QsUadQeiO4ZJutxpy979OhbHSldPNXSAnx420m3jX1Q=;
 b=697HYdvg3F9BHAr0zixKG+VMYgnHeMDSyCZm0DGnixCQXmWfd//7RsJZmVYxQRr/GW//LitzC
 atmjDBXU+FnA4NDt+iJQPITgWxQVjLyw+zIIesXyCKlC4Ek8lOM2ZA1
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5P287CA0093.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::19) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM9PR04MB8618:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ec9f1d-c64d-4e6a-760d-08df126a094b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|19092799006|921020|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	PFK6yByF8RxNpivbWheVhbyMDmkrP1USVryCiL/rKfCP72Ugo4dx/vff/uxSxkZF8/79/6F8ODj61Lkl1Ktv4qLDP4uTQjdYyp1+LDvjzxGV4IqRF0tGIMK4vvMb5hyZ9ULxB7sKrHhcok0G7PVmqvqpQkZxTzVnWGQnphqnCsMSAlA0xz3IK0ESR+KxuB30IfM6qAP/s21cgRUDUD0v9TKofsQU8T3djA4HVr9FSLKI+zg/zg89dm8NTFU4sV/2okSfTRsZ1eOvbvsCQTHJK7SAPepOq/VljSIDKSLo0egr6l4Hfx43yRkg0aHPpm2gC7MpwC5Jh4m7/1kV996aT4YiOX2DdlRA0OWuFrQaiszVE/9tviTgbIqZa3FB6insFFNBxqP5idoz5PfmMwBiKMVJpsIx3dAZIGW0GO/o0g/EQVOxivYxksUodU1beHbpeIpUMVojSWhNW8stxbXFRsb7w/vTIt5ENgRY4bRpuGbzGhI2EhuSdHnkiFqUiXFsGumSs+CtYDkpaxrVzbqTSy2/sWXtqJzHmAoK3qQA0gDTb0lu+Qb1W8ctNbYp5TO5JBEtP3QsTDTNeb+b0HbAZCqOeOvs+iGYSa4B0Q1TDtkVLceNkWJfYW0q1Xf/MPbT7HyJvkuKzTiMs9oP7z4x1r0T2E5ASdHe8wYvu0pQK+J7wZClJjB5L2a+AgpkHO5Pe0dq4+R+ATkQ7IENm06F9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(19092799006)(921020)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXJNOEo5cjJRZGVaSnJYTkV1ODFmUlVMaFE3ZDNzMWw5bngxWVViZ0Yzemd1?=
 =?utf-8?B?d2phZWxCbW9xbnlxZ016Q1oxOU5pQm1BYVZFU1J5SjVTSkEvRS9hWDllV084?=
 =?utf-8?B?K1dESkswcGRyeE5HQWhOWGx5d0hqcHBCc1N6TDlJR1RDTlpQMTdidlE0VUt6?=
 =?utf-8?B?Uktnc0w4MTl6R1A1RHFCWUxmSXRvV2RUVkhmVFdwRE9neXBDQTF4QVpIUEJ2?=
 =?utf-8?B?VG5aUmp0YmlhMEErSnVNc014M0ZZVHlBVnQvZVdxYjFoazlIYjZxN1lRVVNs?=
 =?utf-8?B?bTRLcG1qTVRVU05xTlhCdGFXSVdzMnRoK0lFSDdtck9DM3pta00wRjRMdXF1?=
 =?utf-8?B?TGhaeUpYcDRWWDVHdGRySVpRYiszSDh2YU96QnFSMTZHOUkraFNEa3cyUmx5?=
 =?utf-8?B?RTg3T3JtenYvamlaOUdHSXB6VkZ4ZWJNUTI3US9HVHFYYkpMMlpGUk5CQ00r?=
 =?utf-8?B?ejVIVWxQZFZ6ZUZRUVRoN1g2am5la2ZJaWdsTEliTzhzYmx5ZnJrVHlTMmcy?=
 =?utf-8?B?alRjWmRNdW1UaGVCWEpFNFZGdE8yYnR5UnpKWFdYQlVtSUFkZ1Rsc2NMUlQ5?=
 =?utf-8?B?c2luMVl0b09uVHRYSVNIU0hqcklvdzMwNjdpbXR2cm5SN3BOa2JYVGx3djVu?=
 =?utf-8?B?bWMxOXd5MW9TQ0tWcHlvVE1sWmswQXhWVWs5OTBQMWpjZm1CSUZoQlM1NnN5?=
 =?utf-8?B?TDIzS1krQ1YzcXBBSTgrQjQ1RFJHU2xwT3dGYkFiU0N5a2VLNEkyUlE4L0tT?=
 =?utf-8?B?YVRKUVY3K3FUN1JvaTRUZlo3OThYOWdNTCtWeVJsZmdZOCtXRzMwUmgxeEJ3?=
 =?utf-8?B?MHExekRxaWQrSTN2T0tHTkZHd0tnN3JyRzgvdkppNmhxVTd5c3BkMW0vMlFu?=
 =?utf-8?B?Qkp5dFRCU0s5WDNyUmtrQTRMOFM2WE5KRHRLL0psMEJwSzJoZ05HQ3F2Q1lQ?=
 =?utf-8?B?Z3dVZFZoaGR4N0JqeTVvNUxqL1pTaUtNY003QzE5UFRmeWlmbm1OVFgvWHNz?=
 =?utf-8?B?TEp4ZDMvL1pVZjZhaHo5ZDlSVU9KVlhYRUFRVktBRnFNYm5scmhTWHBGNm5m?=
 =?utf-8?B?ZUQ3czd6NUtUemtaL2pTclhzNFBvMWFhNkxlaGxZKy8rYXYxK2xycVg1eEUw?=
 =?utf-8?B?cEk0SVhLODEwUVUyTnJiQ1RaR3o3WWh6N3dOZXI2SmZrUnBhQWdSb2p0cXJP?=
 =?utf-8?B?VzZPS2hUcjh0VXVrSHlpbmxHTUk4UU9XR2xScmhPZC96bmFSZFBaS2kzK1Rp?=
 =?utf-8?B?VkN4cjVWcTg2eEtxOWNaTXVxU1VxMFZGRkRZNUIzb2oyRk1sQ1NyYnBuWU1J?=
 =?utf-8?B?YzNmdHFVYS9IVnY0MVNaeVRLSitmZCtPU3p5bC9xTGFOTUhEaitOMFVrUUF3?=
 =?utf-8?B?cU9JS3ZIbXYrWURPaGRQY1hjK3BJcXlGbTZlaWVPckVrczN6YlNnRDdWU2Rx?=
 =?utf-8?B?azNYYk5EaTEwZEc2MEptalBzSXFhRS9SenJONVl6RTZBU01jWTFUNU14N1FU?=
 =?utf-8?B?aXR4cHo1TWZuOERHRWVLdktad0twN3VKMmI5R3VxMHExaHJObU1jMWpKYWsy?=
 =?utf-8?B?VFF6dUh6VVE5TkFiVytHZmtiT0k0UEtnY0RhWm9CYmczT3hOek5ISHZmekhC?=
 =?utf-8?B?TndIaTh0SE9rb3FSb0JJbUJlaGIzUXdCZVVpNEdPRXlwa3FnU0pBbzVtdnd5?=
 =?utf-8?B?M3Bxb2hpcThUdldRZERFZDIvK0M4bG5hMzVPQldIazN0ZmV3dDI5VE1xMXd6?=
 =?utf-8?B?czZ3VEZtdGlHengyY0NCalhML0NnZkhpNjBlUi9RVjZzVVhmMzBMZG1SSWx5?=
 =?utf-8?B?ZTNoQnJiV1puZTYveGFRRUhqWkJUVXBSWDlTZEN2Szl6MWdRR2U2WW9LK09B?=
 =?utf-8?B?RDNRVnBnN21WemhwNnJEWS9tNGlJSndJVU9nRmZIUWU0TE5BZUU4YWJ6Q3ky?=
 =?utf-8?B?ZjJOREpGb1BSTGc1OGZmb3hFVldKSlFzOStSUkFRa3dZd3pjTk0rSjBwRzh1?=
 =?utf-8?B?eHByQld6azBvU3J0SHVteDl4QVhGZmgzWkdkdWZpZXVscVNmanBmZ1VUWmRv?=
 =?utf-8?B?dEZ6L0tsNklMUzdHbitoZHo4eVRHQ3BzTDVTZXhOY3hNN0pCci8vSUxtZ1V1?=
 =?utf-8?B?dWxqaDNteG9FQkZQYnpJWnBBdzVTS2FZSUVOWHVQd3VnNXpwakpOVDRIMk1V?=
 =?utf-8?B?RHNxMzB3RHdOT0pDWGFRRkZvOG1vbzBNU0svZGNuTlF2WkJtVWQrWDRlMzJo?=
 =?utf-8?B?bjdSNFNxaVBxa25VS1VCZmdzUDBVaUFlVjIvR0pEQldGdWlaMHRVYWx0dHFw?=
 =?utf-8?B?UFFLcmJCcFB1L2Z3RE80Y2JzcGw0ZUs3NWhRMzdKL3NMQVJ6ZU4vSWN4Njln?=
 =?utf-8?Q?OFSbFYtPnMuAFZxOWXTngSGeJjIB4CkxKXRWc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ec9f1d-c64d-4e6a-760d-08df126a094b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:11:14.4033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kb4MQiGAO1ZGU6tn5IvYw/By/c7rZ2PWan2jouLThqwnq7omeRNWwSq+9QS1IFAs5gtEyLRNeKf/CzP+tijJmdi1AS1CKdiwLW4YfaB8ax13WkvLirPa5Eep+PdVs4Oe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8618

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 777b89ed6849..ac8293f81c6b 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@22010000 {
+	sram0: sram@22010000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x22010000 0x0 0x10000>;
 
@@ -186,6 +186,14 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+			status = "disabled";
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

