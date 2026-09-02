Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010034.outbound.protection.outlook.com [52.101.84.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B8C36F438;
	Wed,  2 Sep 2026 18:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374564; cv=fail; b=g/H1kGHQ38Pe2+ye+jTXvXTXBuAxmCsYlNZU2mD5BRJ8QkZPLy5j8q8akYvtxlhcPfEd8G2ODw4sDX/W1YoHAPUPDwirnS5Nf6Gt4B8xLpJJQNz0gpbm1vXuq0qflaxm5Hb7bthAtS2IbG5spUdcPnJb9bZPka9LHKUMuuwg444=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374564; c=relaxed/simple;
	bh=X5kZDo4kcwJLgsl41nYcGZjqFvj+36+j6N+rdkRy7UU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ptnpml3ev6hiqgeZQX5CEcqtjoJ06n9ZXrvA/ljjqTdYncbdl/VNngNMwioFECbekUqf6qDsz5RB05c7NbXcFQE9R/ykvS1RyZ8ThMBqEk0dDdFzEaUBYWzVCQI9AHtcQ1bp8Hx9uDh/+gwjhbXEAi/qG0eIL15EC27JJJ2T4Vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XqbUf6wh; arc=fail smtp.client-ip=52.101.84.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XqbUf6wh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAXdKR+ja7YIFsftACmQzBMq8ChnothK9Hufi7jy0j+2IiVGIwImPP2M83LkhAGUOFfEqjwo7xYOk8sUwfft+kMvlh6XSsuvJgR469Ja7Z2T/NrFnsckLNUdhOPC4hCOCxvk/3zkwJaQdHlkcnKy2N/5MZ1mca/ny360Hjfq8soXNTncMyZhbH1HIrMf6q4CTcrUsy8BRxxWHVeRInOVyP38dCWHT9230r755aNRW8/tVF2mGa2DbY0gBMl+0DOfv75O9OdWY2tyowZk94YW060AAYNduUNSw+NmItT33hJtowjLPh8pOOUa7cDbAcG40V9V+9VWXjM4J+gWJY42Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AxKRJ976rnY9y389//E4Lfcx3DtH9zicjDAgXU7mrg=;
 b=WO5Vic2zhwRsJrJk7otwwyTZLIvxVPRMWA1vn48TDm6grxUBqkg/C4Fs0/UoRWqrXCUIcUv0vR/rwGt1znoQYBX0Il3b83sLUQ4XCaWlZ/tjoG74AXdvuIsT1WUeneHz7xypi3xDhVCFl+m4Csv/It36muhge+HDfcsfCvp4msyMuPzD6hvZKuJ/Fukgwhv+a94n1fDpZhVF/9UExlwFeI9BzUwH2WY5cdVwqfE+wJ5zR4iitIWpghURIFWJ03CKwJvPxR4MUowjTLLdQ/ScwGgj5euKe8MJfcyWT38nuTxOmOqOGmAQAD/syHMH0ZSrbg8gl0HqSWxwO0DHMB2x/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AxKRJ976rnY9y389//E4Lfcx3DtH9zicjDAgXU7mrg=;
 b=XqbUf6wh5WHV0WKq69MiPKWhEu/1yIY7tcKsQXvRKOScV9qFpVNIkLL8G0tQxK+8zgnJ/qobR0NbP7VomC+q+3L2bN0DtRE2qVlHEti0gEWgTcIExRDn628/pmtbB7aalJ26PclFZzY+m1xDXWu2dXlt4Ef2+Kd0aoVFLZgeJ2CyRABhICkcoQM4Lw1lMDl8nqRVUMEJkrviDN/IbLBN/i6aFdxvRZ/IODZy2yfBFP4DJaIW6yjJ8jrIPhl6v+y2OznflUvd5JWTyKYYQqjaH6A2q2mZ/27ZOa7G6u3ldDs2h7B1OcbvxLv6+/TRIB3x/NXeS7EiCMqr759MWC/F2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 18:42:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 18:42:39 +0000
From: Frank.Li@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	hongxing.zhu@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH v2 0/3] arm64: dts: imx9x: Fix PCIe memory window overlap with System RAM
Date: Wed,  2 Sep 2026 14:42:28 -0400
Message-ID: <178837449498.2056904.10575566728674151756.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821054334.1277088-1-hongxing.zhu@oss.nxp.com>
References: <20260821054334.1277088-1-hongxing.zhu@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:510:5::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 029fa718-0a25-4232-dd0f-08df0921f68d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|19092799006|1800799024|18002099003|22082099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gUBc+xkqALyJjlPk/P1al+oEJkX5QqDooOn6EXJ4BtP0j7sUcif1KPx/BvJBf6keY9OEQ+TOt1ijM0JGoQUL+KJhJZAQToVLXLuBdg2fQgCvtcDXJuojK3Z8nzBC9KoFhRBQm9j50odoRpW2rhDn3DEN/UT3N1tcAmrw/fY3kMGZBkvtKuu4bYadYuBDHkJIpgMqt3tiWaKS5/4GBW4NNrTG66UWloRM40eIVytedPky4+mj/mJ1SdGoRJ5NNfIrGSCZzenAXfyXEDNrtr9czG5iTvBynzSXh/O3fiP8OJiK2gvEYdxKaGA3lSnf6f/+/12Z2JMhbm05ak1ZEismANquPhYogv5gBiKx9JkOTDfCTfQ74uCm8af7pCgOkBFxStc5OfEdE9P7lk9SxLoRpYMVYPIsy7IogEQWx0zDMAAyNJvkI4w/wtUkTuE/QiaT/soJ9P6EQtcOLMTZ2jnt6ngPnMUdESWWu2g54JjPfP8QVdqb6AARLygWGFZ8xx5/bu9R15GZ1Zi+qIr/hQE2MLCtlMaROzIKGqReEdp7Wc+a0zL3p9kWy7W3alnNVCyABRs93HOeXuvqm+rxauvRpB2w5IkDLwhNRRd6niPpQ4Hv0cbm6l5wQ4IfBmIsfdyOsIKL7XItC2y6wwIUi0npaHqT6CSn3jIZMOmvAeKeriA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(19092799006)(1800799024)(18002099003)(22082099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1R4QUJBam1xakVBaGFNeG9oSk9Cd2dTektjeXpYbG1Mc2doeUtXUjhWV2k5?=
 =?utf-8?B?RWVjQkhsNmFyeXJqczd5ZzdnUkFyK2J0WWpDWVdyUlZXRmJDVmJSei9EZ0sy?=
 =?utf-8?B?Y0R5bXkvMGxlOXorYmVYTVFlSVNieS9kRGh2dE10dWRVdm9zZzhWcHZSN0Zq?=
 =?utf-8?B?NjFVVkxLVG0wS2pEWm1MdER2bWREZC82eVQ3dXp1OHpMRHg0S2JMd09xR1U5?=
 =?utf-8?B?ZTZqRWtvc08vSi9ydU9YZzRTZHdRQ3dxWEdVT0VEUlR0WEd5Q1k2VFlaNHJN?=
 =?utf-8?B?S2RYc0dDQ0xRZ2ppbUp0QjdiQjhRWjloUi9HYkdPcWdOaldoZE9qMHgzdnNQ?=
 =?utf-8?B?T3hSMUtVT1BDZ21aZHN1elFkejJrc3NnL09BVnJveFNqT2JMbHBHQnpMRzBX?=
 =?utf-8?B?ZG1XRFRRaDU1UDk4OXQxcnNNVmtpbVhYd2Y5NDBmb0xlejFBeEMycU9UaDZj?=
 =?utf-8?B?dk82YUE4SDJaL010aDZqMlIrOWptZXRSUXVqaFlWcHVTdHhZaHZOZEh5ZG8x?=
 =?utf-8?B?ZERveVNmSG9DTWcvUDI1MEk2YUNUTk5EZEJoNjlvTmV4WWtrSnMxT21hczhY?=
 =?utf-8?B?RVZRTnptZmJEcXlCcDRJNXJrUGlVUDRwVnkvQURHUEFpTlpsMTNtWG5pK3pP?=
 =?utf-8?B?a0YxYy94VGRhWDdlR3pZUW5sWDRxcm9abDNidFI5WnoydXB2d3FWN3gwOVVP?=
 =?utf-8?B?M0h6ZkZnZURmK0w1TFJTZ3ZGdURpY1Y0QndHZGZlVlNWOHo5aTBuK05mN0VG?=
 =?utf-8?B?WHliazgraiszQ01oNEFLcEErdGdob2VHMytINVZMbi9NUE1rdWdzK2hGcnBq?=
 =?utf-8?B?UTJPK2hKYkx5d3lCamwxTG10YnJRNW5WUlc2Z2RLUUVDblZYdnd2cHowcVRW?=
 =?utf-8?B?bklBT2JKM2c3YmtMeHF4N3ZQM1I0ZXNwMnI5TklNV0o0MlRYM2pSLy9Lejg4?=
 =?utf-8?B?NC9vczhNemwwZUxXQmlNU3kzeXUwVzhjdnlGclMrdjNBSjZ1dHhJYVJkNDVK?=
 =?utf-8?B?cXR1bnJ3WVI1U05kWFJGa2l2SzNKRlJYRzhiOGZRazBJOEUwN2pBNi9qejJj?=
 =?utf-8?B?WFA4cGdnb3NvS1BueGIzT01sb3BCTVMySmk1K1d2RUlaWEpDbVlKcTVUc2p2?=
 =?utf-8?B?V21LSE9Lbnh0UmpMMytoVDh5UVpFbGtTRGV0QjBmd1k5WEVSTzY4WHlFdy95?=
 =?utf-8?B?SnB3YUtHK1lrYnYvdkNwYitXZVA2Znpva1lEWEZpdW9STS9Gc0V2cXM0V0tS?=
 =?utf-8?B?QWMyWEo1K1hibGNaYm8yTTFqUkRHN3o3alNqbGNPckxLay9jcWRQa1haNTNO?=
 =?utf-8?B?bWR1MkNDQ0t4UEhXaUQvbnkyYnBZbjRwbHplUzlscmFaSVRoWnkwS3FYODJi?=
 =?utf-8?B?c3V2dzAyTXdNUlQrT09lc0MzbVUxaW5lMmxWODVLSnphQWJ5NmVWK3hTT3ZB?=
 =?utf-8?B?T2M1RW5vbVBvalk4TnBqUU42NDk1NVJ5cjNlb1NWelNCNkJtd0tVeVFXUHho?=
 =?utf-8?B?bVR0dzhaVFF1a2ltdmZFZjN1NnNrSWFFWUw1a1N1alRINzN5WDY1b1lxay9o?=
 =?utf-8?B?dEFJeStRckRNMWhvNGdxdnhGZ3pGQmdSNHljL0c0aGt4djd4VnZJRFlPeHVZ?=
 =?utf-8?B?VkhwbXRZdVdVT3hZQVNSczMvaVFaMXpxZnFCQWViQkU0alpDcFozNGJ4TzY0?=
 =?utf-8?B?UXhFa2FTd3l6VmErNm54dUdPbGQySkovV2RWVHdHYnljS3BSanBSNDRpRXdW?=
 =?utf-8?B?V1JkaEJxV05PZkxBdit2bkpXSmVVbHVDclhzV1k3RTE1eDEyTTRhWFNKNDQ1?=
 =?utf-8?B?c2R1YmxZTWx2YmdDZlduOUduY0J2eHh3WmVWeHZxRk5kUkhKM25vTGo0Umlr?=
 =?utf-8?B?eXFyQkh2Z2ZMYWVaOGR5ZkhRSXZPN1M4N2xyRlppeFBLNytXRzVTUkVDWlB4?=
 =?utf-8?B?dDFFZzdDM0pPVVR0V3d5VFEwazlSanRWeTVObTNjaGtMSkJVTW9WVnJRQlN5?=
 =?utf-8?B?dS9jTEx0a1RydVJoYk82Ny9wNVRSclcvY1hzT1dMdldBbzA5dFI3N2laMFZR?=
 =?utf-8?B?OExTNG55T1Y5dWFsWUF4R3ZhR0RhaG4zV1ZEQ2FORWFSMHFXYWpieFZXUkxD?=
 =?utf-8?B?QXBpUlFUYXcyL3ZkeGwyMTZIV1dIa1RzVnJTdGNWektidGhJdDQ4a09vTDNS?=
 =?utf-8?B?eUpzR2o1V04vMU9HT0xpZFRBYkFwQ3k0ZVFGTG5OZUFWazNpcExkZC83T2Vj?=
 =?utf-8?B?aExHWkVFRDF2NnRqVDlCRk9Uajc3cWFhSHI5NzdUOWZsM2N4R0w2Zm8xYmtj?=
 =?utf-8?B?cU9PYkROa0N2TE1SbzNVVlRRWklnM0V0bVVkaGZaZmhlUkw3UW5YcitPOE5U?=
 =?utf-8?Q?JvVDy7d3hV18EM2UfgefxDpDqpQL20fGwQliz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029fa718-0a25-4232-dd0f-08df0921f68d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 18:42:38.8634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXAeOviwmvA8XUKl0M/CyXV4geIyCM+HTOTMMsWD9rtIsmYMte6JT3WCULFlSM0bs9mN0WxooFfyDo19lIaATrGEnHTE3SDxfFFeVl5YXieUDsAOpoo2cMJxOh0PAOIu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8040

From: Frank Li <Frank.Li@nxp.com>


On Fri, 21 Aug 2026 13:43:31 +0800, hongxing.zhu@oss.nxp.com wrote:
> This patch series fix PCIe non-prefetchable memory window overlap with
> system DRAM on i.MX9 series SoCs (imx95, imx94, and imx943).
>
> The current address 0xe0000000 conflicts with DRAM regions. Sashiko
> reports the potential issue in previous review:
>
> The fix relocates the PCI bus address to 0x10000000, a reserved and safe
> range. The other PCI bus address and window size remain unchanged.
>
> [...]

Applied, thanks!

[1/3] arm64: dts: imx95: Avoid 32-bit PCIe window System RAM overlap
      commit: 9094eb07b3e236233dbaac61ed30cc65be9e9c6c
[2/3] arm64: dts: imx94: Avoid 32-bit PCIe window System RAM overlap
      commit: 775ebd246092294432895f8e9bd48e3f0a56714a
[3/3] arm64: dts: imx943: Avoid 32-bit PCIe window System RAM overlap
      commit: fff67007ad5403966092006867fe9926aaedda0d

Commit message add discuss link and "Avoid hit this as a P2P transfer[1]."

Best regards,
--
Frank Li <Frank.Li@nxp.com>
