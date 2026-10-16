Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013048.outbound.protection.outlook.com [52.101.83.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD1A3B9956;
	Fri, 16 Oct 2026 20:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181462; cv=fail; b=MuzczcAzGNx2pqgdNx4Stt6p9ZB6iTC4qfOaZx7WUb29BjAQXMSJXPH3grPu1PuKkf86+clBjbR95jJaeil42XauzxiME0fihz7gdVH6AWT5m1GeSW/wJ3pRtrRGEX24HjdBhoPpLHIzuyLS8pivvGag99LDvBUGLl/klCWVvlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181462; c=relaxed/simple;
	bh=7kyEt+x3FibI8kXVWw4vklP/8LL8GJfp4LS5GwmVeIg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=EIhZXAaV+srUuAGOx/7Ya0h0587NYsKRhEzhxt6NxqRdEmZ3NogfM38Y/W7Ckzq2cITe8mWaYfouYtoj22zRbmkPnXSJkKhO0wtuPNCgez4nM7qDCcwUDW1rh68qKZ75lObddtGMUf+jBJ7LO3CqBGmjsfh7PVJRuFfeWRDA9ZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=H/dhsPgl; arc=fail smtp.client-ip=52.101.83.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="H/dhsPgl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTLbQHJ9p6MU+HZKEA/gf3/iEVBR0HQVrUc+5zb8Q+V7EPheiUWPdKt+bbxkKsNyYhL8A+XErpWiCqgs74wGmhx9yWml2zRHJbvxMLb5tBwKUeXfwiIzKmER9y4By0e4QxBlhMYLiTXNrlhM53YgBgvsgdzQSAt+QHI6Lj55w+Bt2r0seguyqpsP96bmeYr0repXnFXK6W+oiEUk1NmVVki63+yQImGNx0iV+c5Z7SiGTJs1gE9osiIgLuILHZPV7543RkgeHGIWeBqRgnMUck1R5BJK5aO09Sp6GhjVo5Vcgvqaz3I7linb/oPJpV3J9zKTACYOP91ts2H16bRAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nVjIYPzPdLpAOIRneQpbNthiZTejgwuC/Rw8UbYaK8=;
 b=nVS8Uy2Z63dN16aMq+CGSEU5K0LHscjg1Xdr8kxIkBPyvpivOVInJMscLrp+FKfZDIGVGBxyojxg+/l8vwdjun+PPyz/ihL+6RkFnKNE1fRD0Mylt7REq3YsDL7+rvudJbbPGIldhup0Ypw57H2+zeCp+uEY5N4Fwfw+WSiW8zdsjXATTdp6Dp+C6ZpMU9/tS9iCW+eLpLaVbi2RwsDOFJatPSJFSX/xT0QW+TZBqAfii3DZC8PpDvO1GLvGR+aUl/5du6qXKKVa8/am1jEsJrMBkHrHACLPGtFP5WldhhKmOkjOW/3tkoBnRtu0qxqG7pDrYEO3WuxtfkWwS8rsRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nVjIYPzPdLpAOIRneQpbNthiZTejgwuC/Rw8UbYaK8=;
 b=H/dhsPglAPDN8vbrfDV4zrCSwxe/vSgHWqJ2GXqvcBIXwBynOYYwjzWQVTHqM26Jm5lJ7cM3YLCasvuYk5/ORzzBwTSPmYefVoul/o9Gb8c/Hmi6wi0gYo6cbYF5PLUbKCbu+T5jkwjNYG5RrdUhRVq0m3qK0qNFkPWxqH/JZAfuSYlAhzkW6BdCCs7F7kb/V5kpIOZw2TXupSz1yKlOtrw9g1VXYXpqfeguX0UYjyYRUq4TrxR2Vj6dTdjjo667zKp370eXWTvjrrV+t+NviP5owD+QwOxgYW9yQIuzN1HaexGm/R9XbkelDEIVcLJU1XEE5dyfN0e4JV7BQbveMA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11400.eurprd04.prod.outlook.com (2603:10a6:150:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 20:10:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:10:57 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH 00/14] ARM: dts: imx: cleanup some CHECK_DTBS warnings
Date: Fri, 16 Oct 2026 16:10:43 -0400
Message-Id: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMOE0moC/yXMQQrCMBBA0auUWTeQDBjEqxQp02SiIzWWTCtCy
 d2NdvkW/++gXIQVLt0Ohd+i8soNru8g3Cnf2EhsBrTonXXeUHmOcdUxzEx5W9BwimdPmOiEEVq
 2FE7y+S+H62HdpgeH9feBWr/kVM7HdAAAAA==
X-Change-ID: 20261016-arm_dts_cleanup2-efd86a2fa52d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181452; l=2225;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=7kyEt+x3FibI8kXVWw4vklP/8LL8GJfp4LS5GwmVeIg=;
 b=fGotnrb+lcaV3HAUxU3njq/MwV/ejus53WlWQNersk6mr//F3ybmaGcPLhjYeKLOuzskUYAfx
 OarQ7eO9OzJC60RZXSzWN2/CbXs4xI4Pya1QqKfL85ej3+zIqRvYFQV
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS1PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:8:44f::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11400:EE_
X-MS-Office365-Filtering-Correlation-Id: ef155be9-5f1c-499e-5c92-08df2bc19700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|56012099006|11063799006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MHrL6+BVRPzJS4gNSfhSs9rz0yXPuYjgKIJBKooFrMjPq5Zel+oa1Rsc/CLjAP5V/js3HDBi/CRzhNL88sJ7jJ5u3BEK9QSSRNMP8ZomVQUaZqtzlCB0yKzsqUAzE6/NcMoOTsWMyu/viFiFdLFUln4g2I0BzDTgt6gFQ8oz9NkmAaKj8fLs/lYFUfQ/W/J1qS4dJm/w7N6Tbzx1ZC2kFtvVpRecngehv05E1stHEz5TNrAb2u5rNimJ8sm48dcikJRMstWXVEu6pnDBkCz0c7QqCFG6cXfr8Fs9+jPFO2IQ/OgTrH3C1bPkrAGA/1LokgmrwrTNzGK4N/q97Cj3HLJIga47Rf1emz0WdrsOh+YtnX8ZSCx7VAOr1+b1NTsRfPCwNXBovU/+R8pcoZu2s94ZoqWA5dYQ1qRiXvhOdGozGvOE1b7YPG3RLVZUAWcL1w6USZ9DAQPE/SOLOwcC8ZujH19uTkOBvThZeIg40mf8+CYB8jA2fgbi9PAx72iZKQQDK4ha3GPug0DCkulkdUR7gv3YpCS3VH0RWN2uU/o5RdgkheImlMchm4c4WaGgj0GFvEJxt98KzqEl2teCF4lUv+mDnuhEE/QKgpb2yKCipti8IA5nyKgkAYNMfqE6r5CcIKAT6A7cHjjYdG9D1NVGXYnmz8K5DcqNr0CA3CI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3NPZ25BZjMwSWRVbG44UWtBRS9ocktVdGpsU2VRNnZ2Zm4vbFRhWHUzYXhv?=
 =?utf-8?B?VG8vK0N3blBiNHJpR3ZtZ2JPUmYzcHJvcUNsRUZlVExTTXlrOUNTanJaUm8x?=
 =?utf-8?B?a3JQTFFXdTRxSitpYWZneGovV0t1TXB5RUR5U2taakh5d1VLVU5WSkh5Ty9n?=
 =?utf-8?B?UzNIUGlnZC91bE5VWTNCRnJubUt2bGg0dmNxWHlCSzZUaWZ3SkhwTVBSeFhv?=
 =?utf-8?B?QXJuUktORDE0b2VESkd4VnNrM3JvR3lROEZjcVMwWmYwb2ZNMUV5R3ZWaUxR?=
 =?utf-8?B?M1dXVHM0WmhBTEpwMi9WVG9uTkNPQ1BTcTAvNHd5djQvREw5OEYyN0htbDc5?=
 =?utf-8?B?TVdUeWJQb3ljRTRQay9jTHUxckdsM295MDBSbEpTUUlkck9CWHM0VkRrdGs5?=
 =?utf-8?B?KzEyWUJDRktBM0lBek1uV1MvRHo3bkI1OUpMYnU3N3ZmcWlzQTJ1TzNRaTUz?=
 =?utf-8?B?emg1YXhzbkovYlBmWjQ2VXB0WXV4Nkw3dTB5MmZXV0NNQmE4RFBSYnA4ZHVO?=
 =?utf-8?B?cVlXRzVrQWVybFNCeTNwa2ZEU2lMZHhhK1VERXN4NXlrT2NTNFAyUHZBUHpV?=
 =?utf-8?B?cTJIcEJsZUl3RnI5aUZ0dXJ2SDRCVkd3T0xXZEUwMTRDY3phc2I1QW1KY0Mz?=
 =?utf-8?B?amE3YjhoQ09VYW45MHNoQ3dhK0UyNmUyYzlQQlNzbFN4ZkxtTGtSRFFTd2Nx?=
 =?utf-8?B?NHU3Y2hqRnJUZ2hFQzNDQ0lNSnVQYUZ3MDBnek5PenEzWVVIKytDUjhyZGxO?=
 =?utf-8?B?emU2dlYvWXlGYmd2K002RFFldkVSUVVQbzhkU1poOHczd0o0UUxmRnI1WUo5?=
 =?utf-8?B?eDd1ZFdkKzBESGNtblQ5Y2p0UXFHcWtWZnNra09IaTZuOVdQQ1BlZjFaLzFv?=
 =?utf-8?B?SUZWOWJYbmVFWXYxaDE1VlY4QjFVbWdXaUVldEVVa29GZi9VL0s3VnBFK2Vs?=
 =?utf-8?B?NXRlbzZFV2FSN1Q1RUV2ZkNmUkRQazRxYmJocUN2eEltODJvYUp2ZXdGdEsx?=
 =?utf-8?B?NEFPQk9GaVRsZTVoK3lvNjFYQU5NWWdwd250Z1RITjg2THJKbVFVTmVDMktr?=
 =?utf-8?B?OURCajFJanN4TmdBdm1Cak1VWDI2TEhKQTFHV1l0ZFZxZTZWdG9meTErTHNl?=
 =?utf-8?B?SmhhNmZ6MC9EeERTaWhvK3RyckRGdzRjenQ4TFQrQWgydUZUUzZ3VGQxVEhX?=
 =?utf-8?B?Q0ZTbitxY0ZOamlqYk5MbVZuSDU2TWlmQ0k0dXZSMDJyVk8zTzVBVytJL0NP?=
 =?utf-8?B?Vy84ZmV6RklzWlpOTXNUWFIrdnM1K0MzTTY5bDlna0MwQ21oc2Jib0drUEtk?=
 =?utf-8?B?RTg0bG9ockd3VUdwajI2aFhsWkdTQTExV1dRSW1HUTkvVkh2Zm1xYXNiL0tn?=
 =?utf-8?B?OGFGYkUvR2tOOTF3K1ZSelJBUUNFbTdmZm5uQU9DbzFYZ2o5aGQzMkxid2tM?=
 =?utf-8?B?REhuK1hFaklqSjRMVFVHbk95N20vck42K3hpVkJ2Yk9IdGc3WEU3ZElnYStZ?=
 =?utf-8?B?MmE4ZlNicU1ac20vWUdKR0J0VWQ0OVg0NERtSXV1RW9ZU2paZDZWek1qZnR3?=
 =?utf-8?B?Q3U0Z3hJLzFJM0JxOTZ5enNyQVh3L1EraytUVHhuaWFiRlVjU3BYV0sxL3VF?=
 =?utf-8?B?akc3RTdhelk5ZFBmbmdMaHYvOENYTXZFWDVRbndvZ2lBRXFYSzBsWjBWSjhX?=
 =?utf-8?B?NWdROVZBQUhXaFNtSzF0eWZZQk0yQXQ2RlBLdStvNEprMjhtSzNScjBzOHgr?=
 =?utf-8?B?emNPb0t3NjArTHoyVEdzM1Q4clp0ZFJhVGZXZ0ZtM2pZLytmVlFGL2NwUldn?=
 =?utf-8?B?Tk1tUmtmai85aWdyTDYrWURRR2hkdkpLRE12MjJjTWcrdGNWTHl3ckszRmNm?=
 =?utf-8?B?THl6YmE0aXd3WklCMTE2TFVYT2RHS0hFU0hxRUtjSlFrN3ZjME12aEd1Nmsr?=
 =?utf-8?B?Q1ZPYjlvd1pjVGVuTWtTYWJCQmxJdnpraDZYc3BUaHY5RHI0WkFqd3dueE9q?=
 =?utf-8?B?WEN5L1M1bEV6OGRXSTZYSTVybStLbjVQVFJzKzlmall0aG5ReC9HaUlIRlJD?=
 =?utf-8?B?Uk1MRGZvNENHTk1YbnVhTjBaSHVvUDZ3bkswb1ZlWHp1MmxqSDNIMEx1M2o4?=
 =?utf-8?B?THE2UVFaMGR3Y3UrVFFHWVNNSlNTR1h0bW9CY2xiQklrNVBuQURXWUdXTmll?=
 =?utf-8?B?MElCcnJyc3ZNWU5CU2pTRW5HTW5Rc3lIUytKOHlWeHJ4OWlGWUxrL0YxZnlX?=
 =?utf-8?B?ekoyZ3YxV0o4MG8zNmFMWUV0ZTgzemZDN2tOUUYrZElBaEkxamdIQVU3WSs4?=
 =?utf-8?B?TVZyM2Z2VEdUY0NiRHgvcEdRdDlDWk9OYWwreTVTY3JKVzNrNVUxeWlwWmZi?=
 =?utf-8?Q?bJ/ftWKZzW+gaB4PA9Ut35V+k27gf4OyCvt2F?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef155be9-5f1c-499e-5c92-08df2bc19700
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:10:57.3455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVFr81Q0MbHDrpX5uIOsc71To4sKsas2SsKYkOnQVedf63PjFn1YmE6p/qPER4F/68SP/QV0k1F/jYcD25cMDXUZ03K7qq0Yt3MbF4ONamgmCXzRW9DMkHvdE1SrXRiU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11400

cleanup more CHECK_DTBS warnings.
less than 90 line warns left, from 267 line.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (14):
      ARM: dts: imx6q-dms-ba16: remove undocumented property fsl,receive-dpll-mode
      ARM: dts: imx50-amazon-yoshi: remove undocument property min-frequency
      ARM: dts: imx6dl-b155v2: add touchscreen size properties
      ARM: dts: imx6q-gw5400-a: fix SPI NOR flash vendor prefix
      ARM: dts: imx6dl-prtmvt: remove redundant panel compatible fallback
      ARM: dts: imx53-smd: change compatible string to dlg,da9053-aa
      ARM: dts: imx6qdl-savageboard: remove undocument avic,tm097tdh02
      ARM: dts: imx6qdl-apalis: remove disabled node "panel-lvds"
      ARM: dts: imx6ul-tx6ul: remove front compatible string karo,imx6ul-tx6ul-sgtl5000
      ARM: dts: imx6qdl-tx6-mb7: remove redundant pixelclk-active for simple panel
      ARM: dts: imx6q-h100: rename port to port@0 for mipi_csi
      ARM: dts: imx6qdl-sabrelite: fix typo vync-active
      ARM: dts: imx6q-novena: use interrupts replace irq-gpio
      ARM: dts: imx6sx-sdb-mqs: remove empty pinctrl-0

 arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts   |  1 -
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts            |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts        |  2 ++
 arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts       |  1 -
 arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts       |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-h100.dts           |  4 +++-
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts         |  3 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      | 16 ----------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-savageboard.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi     |  3 ---
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts       |  1 -
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        |  3 +--
 14 files changed, 13 insertions(+), 31 deletions(-)
---
base-commit: 24a13508d0bbe0120c15212a3bcdfceef1941a6c
change-id: 20261016-arm_dts_cleanup2-efd86a2fa52d

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

