Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06A93E49C8;
	Fri, 16 Oct 2026 20:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181541; cv=fail; b=enm1Xzf9pHh26JME7A9c0bEo94NhRHFzxPqEl9Po4N7P5XBPzHCGmIdvPJ3RNBpf/1kf3g7V0GSj5NllgUCYt6aL9iHlBjJ0O0pWjc6lGbRNW5lEvyDpes9ba+37HA+i9GcRdpQ7BXqQI1fE/jd0wEYWrs+53Unt/wZru6fJWDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181541; c=relaxed/simple;
	bh=6/ufD5yjKk+3vyXVRV0xx655XZjDOgdWl+SlouroHjA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nJSqEqWNLvdUFJ5JGwz7Z1eXavVIwaUySLcSYgtSCaad4Fa9FwGMRDYZvpT3eut0vyjPS5N7CuTug8bYyMLnCL6UlZ6yAdXR3kbzDLLsiOpf2IMFwlm4cjegwt5/VRPw+k0qT5zzXmDiXmOXj80FS8cYtQLI4CErJynWnubEWzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mSnxJkHt; arc=fail smtp.client-ip=52.101.72.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mSnxJkHt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULY9Uo5kTaAWpMWQgPpvlrhcIrz/T+CLb9PzDeicUoJO9uRN4ZqvgpHIGfwHWHjICf5Nc4gr7X8B1ehy4r/xufZHR0GVvLiQ7oquqNdivm9pVMeurSEiTsAVeXenhv3s2GjPlPGEAPvaWsfSQMrtt1XBCObbZqv/3Kp8UYbm7EaGdC0MEGc3sQ94XgAgSdCdSV4em4Eo6ooPDqnyP2W5s1ZgVuRTlOMIgp/W4srK0Kx5DfKL6m1o//8KBLnI3zSaXrnTCp2oh2LWn5GIMdrxVH4IkbhmzHUZyp6NyncJUT2ZkRtK8c4rYdpEJ8EwwUsJxlNVExtwA07Ppri6luMEyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30La66OPuxW7xMU758Da+IaBqgwBXspTJk3mXSg0Y7Y=;
 b=bd6U3UbWq4mbBd2Anu8w3LCkXxkf3M7KTZYCnFAa7ifTeoFFK9JYKF2533fNOfPJgEuzB0XTNDJPlgecSZrrpFL0wMScdnzZTP8lakMS864JQenVKEqrErjEwGiMfFKWfkb5myhCnrKySIQ6cU0Apixl4BBdohj8fIvM+XUzhIvTtruXAZ/pLxFG13Ut94ZCCXLaDTzxb1aGz0uHNnhS9P7pY6uWJaWH0ym6TxOqJ2Q8Xcsv0qLpoqzXZxA7DJHnumPlhXtadWRxyr+Lbqrf8cO//I+taNO3N6IlnQBsNLJRSnwPR9xA6sh88pDRDv644Ni5B7JvJknVO2DRtU/MNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30La66OPuxW7xMU758Da+IaBqgwBXspTJk3mXSg0Y7Y=;
 b=mSnxJkHtIEDQw7C53OCawMYektOhyCNfCSqy0SGSlSl+vZ04BnhF14EEteHTJCptIfAwgIK6Ah+DpJIM+je0t4Ul30KHGoudxn3d3nUOKTAf3lY680f1KaF0d0WH2ctmGRuwYriwH4V6MUZxg1moi3PKQMk6rIIKPqxkIP2NbILs2TNoVi1b7iEvOKtDcrUaT7XraNpjgEcR/MVlxCaziK6zKsm5PJFDqxH2CbDTincYbccLeIurMn89L/wedYkcyzrLHyeCPw+1dgdgaDxdITKoPvU5xldEN1oCZ6qMp7XxNhFJXdaqaI7rBWA/c8NU8n0n0mm7dEzMS/8gJPO6HA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 20:11:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:11:54 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 16 Oct 2026 16:10:55 -0400
Subject: [PATCH 12/14] ARM: dts: imx6qdl-sabrelite: fix typo vync-active
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-arm_dts_cleanup2-v1-12-3a0cab9fd784@nxp.com>
References: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
In-Reply-To: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181453; l=988;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=3o+aWHoKchVaLIFXLUwIB3LgNaqi1gGMr3IcKCtCqF4=;
 b=IiSFJ68c8WkGDlBQnLZCQ5loWImCuOmViQhNClNbydR5L1NBMoMCUuTImMheYbWUNu4mXXMCG
 tBETsewgCcjDt3TwrK3uncVZSqr+T4XGKPg9Dcb1wedD2cZ4I4eX1l3
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7P220CA0095.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:25a::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: fc9ed6f7-4e5a-4cdc-2b3a-08df2bc1b8fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|23010399003|10067099003|18002099003|3023799007|22082099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	CHxyCZfEfeWLIjTk+6zAt6Ijwr6NR0ED1UZS3i7agf8KrDHzqMt4NwVDysuiHQm9P/ZOmtDiEM9rMwvFIWNRdlYC0+AfC8YTg3qV9WwL5uzuzGJ2QFeC8EXD85GXP0hSFME6UPcCKEp8u/6U9pISWatEhKpoYRx86hNR29/l1hDM6aNtZRsQptS7/Sg4NPAneDOEEi17KL6ctJlidqPevGPmovSUBJ2cecYYVV99HsnvpvhnxdM/uipbXza5H0F7RaTKAXNW82lLzS9zshFc3SPfjS9Kkfin92rl/INUTqVBfHJKpvjeNMganQCH4YjmZsb/IEygQprnlkAKdsNYgu6yEB9msuR7TQSILnvEq8yX91qAR0jNConCnUtuvRSGr5wLHwUA0eh7aaoWkeebI6dwquzGzKSQz5b1GIqZafEDYu7DutSYK/PRHYVBh0CqVHVMulfKR+K3HxYIxXu3zhFQCLL/p1M9pbo4NuCUWyABY3Eam1M13OvhM54/P307qGUTfl27U3mQ2fsF0KRpZe0NVrOoxE4248vAV1EQXv8FfT3+Ruw6YSfJpcecZwX/gEYhTgrty+64z9fKJwOWhrVqYg9YFAlnhkZ1MLQA5CZUfaa21NnPDQgYZMjvzmUf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(18002099003)(3023799007)(22082099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWk3a3BiUXlMVXdwQldBM054UmI3YkpQK1FlY2ovSlY0RWF1ZE5LaGVReWJz?=
 =?utf-8?B?RXA3MjhhRjNUYUl5VExROXRWNHFiY05zWnI2SSsrWVdtY240Q2Q1c3J4bGdq?=
 =?utf-8?B?c3JQNXRFYzBlNEgrQXR3cFZPMG5YK2NGTzczU2tYcDRHdUs3TnZUTDRLeVVt?=
 =?utf-8?B?RlZ6N1hpT1FzaWdLR29pT29HMEE0L3hDVVZwUnpuZFFsNTh4UHAzUHRnc1dr?=
 =?utf-8?B?RFJ5SzMrQXdSQkl5ZGJCZis1SVphY1BxUFpMNnY3d1E3aEkrQUR3SW9TcmZL?=
 =?utf-8?B?M3o2dU1lOXZ0dlVKK3VBNTZHbjVFbW5RTG5SaitmY3ZsMEtjWGs0WlhTby9Q?=
 =?utf-8?B?UjQxbTZtbXVYZS85cW1Mb0RNam82QmJuMitZYXJvaldXRUJHMHhXVWt4Mklw?=
 =?utf-8?B?ait5ZFlEemVhMzFzbGM2L2JPSkV2bFQzNmpGVXVRY3lGYWQ3a0RWTmRQMmdX?=
 =?utf-8?B?YzJtR1RGTGlubnM1MHUyTTFnVXdiaDl4VWVVb3NwcytGMUI0Smdub2YxZ0hr?=
 =?utf-8?B?eng5cjVIWnorWkpqemFka2hyR2szSGlKelJYN3RMUEYyNDIybW9hUzcrclEv?=
 =?utf-8?B?UkpzNUplZUQwYm9IU2dxY2JDUVNhY2kyMW9vT1owMWNGU09QazRiWUdGcUNx?=
 =?utf-8?B?VVRhRDdkNHdMeUxXOW1QMERPMDFaU1lqNVB1YzF1bGNVQjE0RFY1OU02TFFQ?=
 =?utf-8?B?Ymovcm1hYTJYbEcvK2R2R1o4RWUxbzJRa3hUVmVnQlRGNnVqYjc3a0o0ZFR2?=
 =?utf-8?B?TDZoUDdTWmYwRVJJR3VRa2Rland2am11bkNONzFkcTBPQWVHOFFkRXBSeldl?=
 =?utf-8?B?dUwyRStDS1A1ZTVHY0htVHNrY05ickpEd1cvVWh1cHNsYm1sMkluSnRPMTh0?=
 =?utf-8?B?NTNDYkVpYkhQVXVENlJWbUFod25wOHdORkFWMWd6S1MxQ2R3NHpNRlFVckZo?=
 =?utf-8?B?dGFBSGc2b0ZIRlU1Q0xPTWJEVXFoZy9yYnA5aVNQOEkyNUhoYmp4M0xSVjh3?=
 =?utf-8?B?V0RMc0gxREtxZ2h4S1FqKy9TREJRMjI4S3ViUTJ6NzBQUDFhZTE4dEJGOWlJ?=
 =?utf-8?B?WUxBYnNkVnJhQk5lYWMzcHpkZ0hHRDZ2cDJzT2tKa1VDaVFXdFlpZkIxM3ZX?=
 =?utf-8?B?UFZhN3c1SU5uVDdXekZjTUFqN2pvNXZheXllYndTak9YbUFtYk1XaTEzVzhU?=
 =?utf-8?B?aVQyL0Y4eHl1T01JMEFtZnFtd2lPZmc4eXpVNSszdUFFL1hnSXlSUTJTTXY4?=
 =?utf-8?B?NXdJeDEzVVBEcmRhd1QvaldmcncxaHVKM2hNaTAzcEc4YmZnQ055cUdzYVFn?=
 =?utf-8?B?SVVmNW1GVFBTNWxodHZ4WXB5K2pGQzNWZjRlRmNkcEZZdDBtVXQwS3NKVEtT?=
 =?utf-8?B?cFBFTkdJNUhZVmhrMGRYY1puSlVhRU1WQkd5TVhmRkU3aXZibVhjc0hiQ1po?=
 =?utf-8?B?UXpoemQxSmg4KzVQTWNXNFZNTCt6NCsyMG41blBjUkVwdVQyL0l6Vk9UWUFM?=
 =?utf-8?B?WTdRei93clBqMGRGQlVZN1E1eFBEMlJpTzJWbGg0K2hBSFlkNURKVGQrbStJ?=
 =?utf-8?B?S0hTMXRKVWl1eUhkQVMrQ3VpTGU0NkxDVmhoYStpT1FteERsMU05aWZUU0dm?=
 =?utf-8?B?K2h5amplV2R5OHhsT01paS85L25QL3p2a1ovd2VOY3JSM3MrSjZvYTIvd2xn?=
 =?utf-8?B?eDdKZnhTT1h3QXVZTUNJeEZTV1ZSVHRhOVNLSERvWXZpaldXYjRJUUhmaXdO?=
 =?utf-8?B?VkhrS0xMUkF1QlJmYmlnSmltWG91aFdvRzBqbTBCdTNxM0RUQnpkTjAyRVNK?=
 =?utf-8?B?WkdjSzYwQWFONWlNeVRpaE53Nmtmb0xWeTZXMFpKTjgraG9QeWpEYWp6Z0lm?=
 =?utf-8?B?SnJNY3lRRERlZ1ZOUDg5d29CSVgydWM4cHRIbU1qbWlsMUp3REdlUG9Pa3dW?=
 =?utf-8?B?bXRaM3ZvVllieVlDUVJUR0dTMHMvNmlBVUdUa0hlbEZmdGpETUZ1amtEMlFF?=
 =?utf-8?B?bXVhK1dLSmliWk02a05GUWhTNEhEVGhCL2hmUGxTOEVrT05uMTJYV1U3bkxK?=
 =?utf-8?B?cjYzQnNrdTZ2dUsvR1dxT2FaaFVtVTVXVXViZkJtV2pqd0JOWFRxRGgxM0ZJ?=
 =?utf-8?B?clhXaGRhTkJod1NrRU5MNmZpR0xQblNlQkRDdjhVM0s5ZnI0bk9wdXVOWUxU?=
 =?utf-8?B?MEpndk5RcDQxcHVVbUlncEFWZVp5MTZ0dTIvZ1A1cnBIaHR6aFN1dy80MFA5?=
 =?utf-8?B?YW90d0tLWHNYaGQvWVorTUc4dDlxNXlQdWFRTzl3OW82d2Q2WUQ3c3YyMTF1?=
 =?utf-8?B?Q04zOTBmV24vdW9qZ0RtMXRMWlcxc014RmJNM0FMYU91dHBvR3BGYU10djJM?=
 =?utf-8?Q?bzEXWspUFDoYerprzLvKHsG39c5mXgWdRPCel?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9ed6f7-4e5a-4cdc-2b3a-08df2bc1b8fe
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:11:54.3466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixsh1yKxQ7pX/LxvUA0itKmUnuyvk+Xt5Rk7kQH/y7gS7zA840ilF96JbBFrl8YpL9NxIR2wjPPDpz95NuLD2AHPhZKTy+DHUoPhZgnacdzz2KIsIYBKqIEsSwsiTQ5s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738

From: Frank Li <Frank.Li@nxp.com>

Fix typo vync-active, which should be vsync-active. Fix below CHECK_DTBS
warnings:
  arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dtb: endpoint: vync-active: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
        from schema $id: http://devicetree.org/schemas/dt-core.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
index 3b7d01065e87b..308db8af73719 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
@@ -234,7 +234,7 @@ &ipu1_csi0_from_ipu1_csi0_mux {
 	bus-width = <8>;
 	data-shift = <12>; /* Lines 19:12 used */
 	hsync-active = <1>;
-	vync-active = <1>;
+	vsync-active = <1>;
 };
 
 &ipu1_csi0_mux_from_parallel_sensor {

-- 
2.43.0

