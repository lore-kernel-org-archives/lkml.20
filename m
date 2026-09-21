Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011067.outbound.protection.outlook.com [40.93.194.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDFA495500;
	Mon, 21 Sep 2026 14:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999262; cv=fail; b=AKHFxxPp1fZBOOKgMYQvnJeZtkdVdZcQZ0tXkaP3kPn1/DotR4nX9l9FBiUF86n5XA/yB31JvB0QEPGgpJxVTbFs7XVMU9NwYqWj3qxtXFTJN0KyqGyVuOUmKkm5Xe0W2DUF8gKPFVyypX4mbWRGVRH9hC5N3S8Q0QLlDUPonLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999262; c=relaxed/simple;
	bh=i4O0jbkfYJ5kTQd0Z6R42aih43O1INcABKlVVkD3Ewc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LJD1T6DIqBg1hrvRjkHmLiOGwNWZproBJdC4T23JFHzDXzjsXQPIPyaeTwn8T0DtccAfa3/e2HG6bMrn74WXufML29YCg2wnX5Dm1HxtFyCAs0980ECC+qJaLoRoqv9PUik58ouG8Z6j0lWGgKBcOOVR5fxwXQCmFa9+OAelfkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=I9YzCoME; arc=fail smtp.client-ip=40.93.194.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="I9YzCoME"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umBAK3LKHl7g4jnrsnYMBvtAYggEaE+how25rjB5t4H9sR8w64LRZJKsOGwFdTMeBJyWyMpG4HgoCKoGQ/AQMYttCwkGDlW82rTjYW7wdTTFugCBngtaDdymuTO3oe3MKIAgnUBDxZePG6vua3Od4Z9TvuztH7NO8Xt0Y1DTKgk+UeK0WuHCprEx/H7VwilmPv5l2We4FSaxeIA56JL2TGW23Q3YfLFtCZiwyd9nB4dXGPjfLHot5Cs62d8oWEaD7iD0XojwnVMQgIiaWL2fluguQaD9IFDojBq9Zkm2teL/CDjeOKFWT7W94KPrOU0grS2LnB7wbXo8X9blhhTaaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FLfEVmQCY/n5f4V1JvmSrr3EofrKfFalqt7fz5de4M=;
 b=mMotWNq2FUxo+E2X/OJIdEd/wYNRH2FkdLZYmPcnA6S9MDRxJ2psxYAWAMGE+TUe9JLdry5ADNb+gsbOLjKRnciwsUZ6X9TQnbQxODfykUuM4TJdg2+5/QSne4ni0uNhERfz30uLaZulxAqyKNLlNNryKRXtVlFRaquH0QSiwKqR6MbEeUdLL1JRXPL2xO5vtA3uw9ETwyvamti9qh7+eZXT6YdI8AjGDDtMM4C9Jd1rKja4OgSPpYej/bPxBTSXxhXH7YPzIr37zOaSP57NdxdHhrgwUGpk5NnWiHkLnfitmMSQ8RUPhF2fwUTxRjt6q1n32sDsHJ9WlHOdOYQTGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FLfEVmQCY/n5f4V1JvmSrr3EofrKfFalqt7fz5de4M=;
 b=I9YzCoMEzAnLVWVxwEynxu1q4jzYHzYvWIiI3fuQ2I1VQl5hoieDzOXRF/eTGjDyvUENLfpnO1EBR22nqG3TwBymTbOvI1Xt45+ZfNbRJuEgVI7lebfunZ8BAA47qt9wkLg1l9KhLeJgML2P+MoyD3tSlGxg0LrAK0abq+oMWjOxMf4lbkJ4Zz5yoUx0MIg4jYhduNfF4H+GDbC3+rjVEzo1qwnKr22Xjry4qE8cA2SonJrVXsdARwFrWT5lCl1zy/I324SwoQJF2q2HttoXXg4IghtPUBiNye6UkgV6CpBqFEWJPttdRf1Q6qh03IvOIDOgNsBgc2QAjUMcgGeZ0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by MN2PR03MB4973.namprd03.prod.outlook.com (2603:10b6:208:1b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 14:00:56 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%3]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 14:00:56 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v8 0/2] arm64: dts: intel: agilex5: enable USB3.1 on SoCDK
Date: Mon, 21 Sep 2026 22:00:33 +0800
Message-ID: <cover.1789998962.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1789114403.git.adrian.ho.yin.ng@altera.com>
References: <cover.1789114403.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::16) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|MN2PR03MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ce60b4-f703-4c60-fa3e-08df17e8c1d1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|10067099003|6133799003|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	v1twoh65BTwEfyq0nMck5WtrzkObe4CdOjOxeW09JrC2/WiasPJ0z25Q48suyEwjqzpB++DKJQCg2pZfX6ir81cMtSvY4Fd+pps6Eat1XgRM6PUp6/clttDCMNSFQRmYHrRq6u9ypHoz8l+Rlt9LtLGk1A7+QxUQegpnDTMaDwTSqBxrKudVVOrHPFmoVklTyCcuJ+iVtnjfeafchWdIEJoXxswzmCPmMHwg26wWcB8yZY2zM5AcGb9VCdLSdwqFgmRCTiNyMlkGECMUrXbQWyo8Drbrzv4hGT4JDZ+aPZ5y2mGSjLNn+TyrE+dC4X0rGPWjuLCGLbR158LK/IPtOXr6wUhAl3Re4+/YJiswtiMiYDB2BKCHsBED50p3YfBITDB/kqEwzgYzkalop89lAoR5ryiSHkiOkj0B0L1FPosPRBT2CCwBlycXiwjGVnwao/We3JF043sVSdgtJK2iO8YazwKe47aylHQw46g2IpZV808xuCaaykxHwWfjz0BjIMCM2X4n1bVuqhfLjeJH240NCRipAnS7s+DGI1zRiCeiJuiCMF4RBWKl9i1Dg1NJPS41Q2Q3ugZBbJ0xQiSfE/upqJb4N5k/INE/05P2SPU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(6133799003)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gWL2ApgLTm3rw1ZIDEOwdUcK/MWwVsuSWQBTU2LKeR0918PCf8EiugP1f3FF?=
 =?us-ascii?Q?nYVWmT6GDWFzuXYe6oVBlyITFKEE/qRxBSM8fhm5Otuy6EGNIdCiC/rpb6En?=
 =?us-ascii?Q?DytAa27GZxwu+TSW+a5oIi7rCHGbqi1bzSGsZJ5M7I5I/QPTnRVETawn7SrU?=
 =?us-ascii?Q?8UeUZ73RKpY0YY8xUTidcMQ8BBuxxkS4PJ2X0VssbHsLG/LFlMrsIdjX1C7X?=
 =?us-ascii?Q?/xPlGZjAsqxQAZmPc8m/dNpnJev2SFOmgkszKNrg8C0UZ+UGv3uwArdVMP2p?=
 =?us-ascii?Q?vB9bJzDwTKEhH3dKO3QIdyI/7Ahhc4dPEhHUE5cjhW/IDcYHNpM08rCISHFc?=
 =?us-ascii?Q?qH+aEjbyaqEdCL5rPKn0oRwt5aDNY7/+jCCOnKajnS4HEU7z6fmZR4s6eh9a?=
 =?us-ascii?Q?oBLweyH8NH/zzShdA96edCNUnvfMhodUl3E8+7mhptc34Q7jiB7XBvFQlZWj?=
 =?us-ascii?Q?awJ40V+Rj7UC8nlyMEJqNmg5Lyo55H4Jggrj+ipb+bI3eh4VeFDzyd4/2w9H?=
 =?us-ascii?Q?je8J8hV4XoEL91iVoEcvMZpyfrVSwAvOCYFBTEjbd9NoaYuGKMewlM7fI//M?=
 =?us-ascii?Q?t+7QpD7ZdBr5dGSeQQRL3qK1dGyWXcfeXrj8M61TLa5tny5Lwy5nDmVBAA3J?=
 =?us-ascii?Q?5BmaB+Va+TwFCvRjgcrbxcPQqFIGo5O1OvxhhWxIrqR8+f0+UlAB/cS3lx1H?=
 =?us-ascii?Q?VDPdR0o9G8X8HIUuKSUxiT3bb4nVRa23J7NvyIt2jJ9jB/4VK6muLOVe+hvV?=
 =?us-ascii?Q?0fDrZdQlabK2v6mjEvuLQnhzajNwbykhin0lRbEQff/YxWZBZRj0dbR+6O6I?=
 =?us-ascii?Q?kqJP9vT0aW4o/EFkiLriW3T3sY0uZv4TfXQHVdZM9pSW3ccN+4QXNa1FucgW?=
 =?us-ascii?Q?lDVKzcxh6gGCEoJLvQVgfX7ai7v/+eSd3+XHfUhhPlaWcSV1/n1ILes1V00F?=
 =?us-ascii?Q?7j/MM5t66cQ5fMCu3lBoblfuSaO0jgitsLsGGOlBY9zVIgBz6e/XWgEarcjN?=
 =?us-ascii?Q?eilRMWnwIhcvSOOGG1IDeCelUTRIHfatrUkQOqM7fx+xxzLBTxSogEChaY4f?=
 =?us-ascii?Q?gLshSK/01rHb6WqcPVXroT705N53vivLzIu+cBwHn5SkAFwrDszhanNawn1Q?=
 =?us-ascii?Q?xqVsvIyG8M5tJlvRL3Ov4VVFLEKk+ZVZBb0cHfnJMph8w+qZ2GGyvuoYDAjS?=
 =?us-ascii?Q?z82Y2ZSDs0Ewxakhjey9oaNAIUye5ew76eh+qsrDwml+048gvxMTjWM8Vpmd?=
 =?us-ascii?Q?wVct4rYcWhI01kqZawtgul41GWU/xuH0JPT83u5hxwccXvOqzKzoYaDBeaFp?=
 =?us-ascii?Q?vjLdZsgDxxkYjjCiibJTGzkWFmVMJGKtTbVyjbXLm+afaW3enkqm6uCfVugd?=
 =?us-ascii?Q?+41lsWy52qEFX24uDTDOAd8LfI5/t/v3FXsUh47vUHtYPrLN3IYLL7JjN4y4?=
 =?us-ascii?Q?xPGAK0m89arqxdth+GNmaGglB26mnDM1kChee/Iw76JWNGZt2FRLbUPjqfbs?=
 =?us-ascii?Q?4hw3lXvBceSJ7ZRPWW7dlAGn0CfZ/tosfmnb2WCzlcwf7bb/4gg5KQ5T/I+1?=
 =?us-ascii?Q?zVQY9FdxeyllynFj7MCUfGrMrcCzEu4Da3ERY0QavPFO83j4a3tuJDRQcXqZ?=
 =?us-ascii?Q?tQqkFgWvMgtpAIW4aL1t27r3+y+9zho+6kX0d0ONAppCret9qC5V+YEoin4R?=
 =?us-ascii?Q?F2K2tU7FuQkStZ+n4b0u43OpUcvSXNzetjKDmmGjHRdTa2nLX0WsY9fyzlqF?=
 =?us-ascii?Q?FuL5o6//4bdt8wRbR+F3D82T2G8Xoig=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ce60b4-f703-4c60-fa3e-08df17e8c1d1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 14:00:56.5611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8V8TWIhIIIvC1MoHuX27JuCaN0jf3tLCLzUl4GJSkicUPfULWKonTYapxEMx8q/ZN9vy/8Ph2AwlbI11+coyghIDTmKTwugB9WMbHkMADnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4973

Add the Agilex5 USB3.1 DWC3 controller node and enable it in host mode on
the SoCDK board. Place the controller under a simple-bus with a 40-bit
dma-ranges window so the DMA/IOMMU stack respects the interconnect address
width when SMMU is enabled.

The SoCDK daughter card only exposes the USB3.1 interface, so the unused
USB0 (DWC2) board enablement is removed in a follow-up patch.

This DTS series is posted separately from the USB bindings/driver series
("[PATCH v7 0/2] usb: dwc3: add Altera Agilex5 DWC3 support"). Depends on
compatible "altr,agilex5-dwc3" from that series.

---
changelog:
v7->v8:
* Rename simple-bus wrapper node from usb-bus@11000000 to bus@11000000
  (Krzysztof Kozlowski). Use an approved simple-bus node name; do not
  invent usb-bus.

v6->v7:
* Split out of the USB series into a standalone DTS posting.

Previous DTS series (v7):
https://lore.kernel.org/all/cover.1789114403.git.adrian.ho.yin.ng@altera.com/

Previous combined series (v6):
https://lore.kernel.org/all/cover.1788886615.git.adrian.ho.yin.ng@altera.com/
---

Adrian Ng Ho Yin (2):
  arm64: dts: intel: agilex5: add USB3.1 controller node
  arm64: dts: intel: agilex5: remove usb0 in Agilex5 SoCDK

 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 35 +++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex5_socdk.dts  |  4 +--
 2 files changed, 37 insertions(+), 2 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.49.GIT
