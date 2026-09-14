Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1320538645E;
	Mon, 14 Sep 2026 18:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412287; cv=fail; b=QNDK+OKHBi3YqSFVF5XbffF/olPepaVaL4sRh9PPKvxELjijjGYG9mARJKfSDJG0u7f8kj+xZcehAM4VvwJCCp6N6Vl3CP4gaIYX5hqEK7W8HoNjAPerCrSJO2pO9RPs8mgd3zLbSmvipZUdophy/zPmeHFdsBFdP73IstonnPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412287; c=relaxed/simple;
	bh=UP5t7b4E/F+h1NCGtOMS6jdGHwGRwyBz348aabzbq0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XgNv4mz0pC8o0uz80oa9bd7CtnwBnVRkuMFOTp295+qL0C8FmHt6Z8nvOfJEv49tFWa0Vb5Gd0ZVJHg1jzjfUJBteE5giGZBThZPVn4hEPvf3Kqp4BBlxdZ0z8W7xHX7ugh0jIsv4tLx/C8pTQeIhLElBvfykx62WAJUznedquo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QdXbVtQk; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QdXbVtQk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+wCS3AKyO72WaV+Qw6ptFD3jINCSAXBces99dZqzUEHg7jk7tr5jb35I5Cl5YvS907JzX2UtzLn+yvusu36ao20Ii9gAe2oVOkGNzmnyJ+8zMOhvO1XfJWgCNZK7zT6zXQ28G5dtiYz023Zr4wSE8fK+h2bP3QWC0LQkwvVovfHBRQvC9XTdNprAFeT574BSmzBf1r5sJRdZnGxMWZey0PVjXv5kjrYjeK9RVZZu1vGiteazG+y30v1tfwOsAHt6FI8qlnUw7NHUuTBNm7zXSg31kJIOvKY+wT539XlbmjtfoYd+kCu/rGMvsNmLoyUK+38DdLDVLmFXaF2FlOQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSkEsoJFDegBrjk1J1sGKN9x7UYhAzIepM6m/JHeNds=;
 b=hiRa4Ne7o6Tej62HUv37aRvLIWKJriheD7v8W+xl4f0wpK8+aFr2eXjt9KjDNud5+oAC1jqa7eqOPr2fBMCEq+LgSt9s5OBBeMFW8jDYkIMF83NJhKfwqi4XteCtvB/lEqSU2KUM5QdmQVmvZpCT1iJJ/ygqeQSYTxX/U6bASv6Byz+sH+UYhCHHkyVKLNWAUOlvNESz9BTbedGSKDmRbi/U1YEe5/uL8186E/Co255Zd+0FJTuJsDKYKu/YiQftBoZbpPnOfl3viHpl7mC2NXfr9Sgsl/8feo4uQYWu3l/2p/hr2FXG2AFXc+8POnBs/g8yzMFCPLqY4j1ul5yKCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSkEsoJFDegBrjk1J1sGKN9x7UYhAzIepM6m/JHeNds=;
 b=QdXbVtQkdjahh7Z0+7tgTcXCkTfy8zGw97My94XT9JUnoGI279QO7w3T5UlLhlBnhdUJYaMahGJs50OR7NGa/F1BPlQ5zvZQans4wctr4DY1KYnRxu5KgsP1A8+saUWdVaeMc6Vraa8s/MP4dEDyVK7nEIHeUybx88eqIcwwqHNJE1menxTaCUyqhOL3zsJ2S8NPj+jP67WKaZSQYjyIRgZc8mkQOgy0llOyZCM4i8ecKhfcxCRinFACDCYcXfDjV8iRFf1t/SdjFNQnF999S2CiaN8rmIdBNCclY6nfcue3UzueaEb2AP7o/nAoWGRTyscsSjSb7YHu6ss2I9c/3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8426.eurprd04.prod.outlook.com (2603:10a6:102:1ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 18:58:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 18:58:02 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] ARM: dts: imx: cleanup some dtb check warnings
Date: Mon, 14 Sep 2026 14:57:54 -0400
Message-ID: <178941226247.1796804.5468877600268749945.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901-arm_dts_clean1-v1-0-db741f37a1f4@nxp.com>
References: <20260901-arm_dts_clean1-v1-0-db741f37a1f4@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P223CA0009.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b737364-27fe-421b-3130-08df129219e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|19092799006|1800799024|7416014|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	UovhPEKhR3OTO5fxUl/n5Kgp0DSzqKQLifYmqbuMDu6F68UzrpCMGTIF3bhj6se66iS6MkLNNr5p6HUBIGxNpkq4UFekKKJQci+GF6BO6RycpK28DsrNNUN+zl0LAHXzKS9eNT/rR3rpKh5Jmf2n895ecO/MiHoqlWIrDmpwENHrpqS1LhgxDtvokYMrKKdzRGgYq++BK3a/nY8yJyj2tnnZQcCFOhSSO2j/M9s1GYC0KHRlX6UVH5H8CxbnZS8x6meQVC0XUJXFnbJFQ2APU6ZzwyOtVmBDOlUzUtQCzOjli1F4hS4ajFNUBNU5LuTLZrQzJA30kzp9S5vPBG+W2eeXpfDOYWSX91Ag8ejjsrSy8N++B0q51NDRyQOmUTh6U8abvYC2A+AMdPjfqWssIQiUY8lAIheDmt+lncHs4NslIdTlilZQte0Z0SVGguGnfjMEAwxFvyxBCNgkE1mRMFGGjgajqtWibpWFUsxSk9bw55hFZaG5upnpDT+g2IqlmPv94fiSWlzLQeluJcsBDqILcmH11VPDQN0eVkDpzpp0XxaRVC8hvWFoS7oTIb6LR7Zjnq4nu0B+NCqe6wxRIxWLsyR1HbXf+uV1yU/gkwu6nL6htezkjQO6Lh+w/hWRzaZNFBf/XRoj8xDEhTWXQStsrKCBrJL0IinifRFFu4I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(19092799006)(1800799024)(7416014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZSs0eTdCU1RpeXhmNGhmUTNUYzk1QUpzbXhEU0tGRGVxK3AzVkRZcGhlRWl5?=
 =?utf-8?B?TkFDbFhoSld4OGp0Z0RXTFlkanY2a29hYkE1bzJORGQwZlJwQnUwK1V0U1FI?=
 =?utf-8?B?MGwxVi95dXBueEVjdnVMU3hudWR2TEk0a0h2a3A5aS95SmdJSGJJbEVsNWZs?=
 =?utf-8?B?RDVEcFJKMVRnUGVGYUxob2wyZXVWRnlEUmJtcDFWRmxpZEEvU1kzb3BtS3U4?=
 =?utf-8?B?ZXJWRERBMGdUNnlqdmV0Ri90MG9ha2NTOG9vcURRRFkwK1pOZXE0dVZ1eURC?=
 =?utf-8?B?Rjgxek5FcENaTWw2ODhDSCt3MWlrRk5Sa2pzY25CUU4rVGZvekEwcUlubm9m?=
 =?utf-8?B?bmpZY2xwQjEvTDhXY1FubUlTOEhqSnpuSitaU1Y4S0pLd0F1TC8yNm1ROXZK?=
 =?utf-8?B?TE5uV2xKTWRQbU1POUNlbDdQWllJeC9PN0d6WGhTODFIS0U0MmUydGlKMWMw?=
 =?utf-8?B?YXM2Tm1kcWl2M015Uk1ocTNhR21TNENpMkp0N045S0p3Q0taZVBseHF2MGpG?=
 =?utf-8?B?Y0FsQURBY3ZkU2E5T3VlUkpnOGx6M0p6Si95bUNVVlNZMVVDeEYza0pCOXV3?=
 =?utf-8?B?S1pFdzI5Mkw3cTVWTzI4NXFEZXlpL29ieXQrdWVoYjRBQTRXRjE3RHJRZ3pI?=
 =?utf-8?B?MHYvTzYxZHcwWk9LZXkwVS9VRXE3OHpxaWEyZzk2dGdNOHY3ZTdkVXM4V3hM?=
 =?utf-8?B?QUZiclZSQnVMTUxWS3hhTzNYNENXc0lGQVd4aExXazRjNTRQS0Y4a0NFVzlS?=
 =?utf-8?B?WFdTcGp0UEkwRVNKbjZUd2JrbjJKZHN6ai8rZHdMTHA3ekx4RjgvWGkvQlNL?=
 =?utf-8?B?TmY2bU9GK3FOZ2VyekxkQS9iaEltRS9FaHVXUlVPQWZmUDlIb20wOTVYZHpG?=
 =?utf-8?B?Zjllb3I4eTBpVjhDcGZGU3ZCZjl2R1pxcm0rSFcrdlNmZ1pwMDdSQ054SDlJ?=
 =?utf-8?B?UklpNkg5aFZyN1RGWXlNcWZMVzZQeVAyQkJOZjRzbnhhakE3VHhHb0drM1Bn?=
 =?utf-8?B?YzJCZWFoOG1IWTUzSlBQamloQ3o1NVNMazRCS2M5cGp6aVc2UXVickFGOW9i?=
 =?utf-8?B?TFVmc2t6a2JLbDk3anhvbVdjT1phaWZQYzhxeFNpWElTRm9wNTdKcDE5dFR0?=
 =?utf-8?B?Vms5dW1vUk84aWwxWkhxRisyU3JSQjBnR3NUL1BMTVp1Zk9BU0t6SmFWVTMv?=
 =?utf-8?B?eUE3YlA4N2tMdnhzOFo3M2VseEg0Y1RwVHJSdTdCbzRBTi9mNUlSK0RhNkRu?=
 =?utf-8?B?bnAydEtQUGdBSWJvM3BrbEtIZ3JhcDhYT2hTdUFiMUl6SU5vWC9OaXB1amNr?=
 =?utf-8?B?aURtR1Mwb2FUenBRWVlqU0VCZEdJbmtwc1ptUGIzZ1VSZkNKT0NwVjNpYmJr?=
 =?utf-8?B?eWdOR2c4VUQ3UUkyREZuQkQyRUU3UlVSakdjWlE4VitSdUpyMHNCNTBLeXc3?=
 =?utf-8?B?Sk9hWm5jbFBkQS84Mndrc1BrMllSWXc3YmVEeUJpMW9zQmd0OXo0MDAwY3FS?=
 =?utf-8?B?MVRYWHdDNU9xcGVtMzgvYk12OTg4VzhrRXlka3M3TW5ldGcvaVNFZ0xKN3NZ?=
 =?utf-8?B?S0ZXVWYwYm92QlVjMEh2SGZvVGZ2ZzRPY291eUlaU3ZEOTEwcEYzWmk5dm1a?=
 =?utf-8?B?TE5sRC8wdmRJNmNJQjFpOFlTaHVLUkhXOWVwSFpyQ0g4QmlMalhxNys1S3lp?=
 =?utf-8?B?c211ZVdZMWFnUHpXNXJjN2I0RmRrTE9ESFlMb1IwQmtvb0FlazEyMXdvN0lm?=
 =?utf-8?B?ZmVqdFJoZkJZMmhVWkhiOGRSUm5sbzNpTXRGQzZBdDZkbjk5WisxYTZPeUIw?=
 =?utf-8?B?UU1Rc3RHUzdvTlIyaHhrbG5TNHFMZXNPTVkxbWdZR3NwN2dDTVN4SHQxOXdX?=
 =?utf-8?B?VjRaN1dvYkhOaDNzUFZvbUJ5VjFUazJIcjJvZGFXQi9QOGU1dzE1S3VkWWYr?=
 =?utf-8?B?eWhiNWFoZDBrNi9aaUxiTVEwWmkxQkN4NkRDb0lEajgwN205ZGd5dk04KzdJ?=
 =?utf-8?B?TUNvc0JibjljVVFiZU9aWHVxUUpwSG5aS1NjamJzQ1FvejJyNXlMeFBiWmEw?=
 =?utf-8?B?TmZ2NkVKMmJBRUlwS1psK0JpZ012bGltTEVPbnB5Z2gyUGFDVi9BMXlKYVhE?=
 =?utf-8?B?akwyRWgzbWJsTkZ0UER6Q2hUb0NVeUYrTmU1eXR1NDBGM1AyWTQ0dWptaDBs?=
 =?utf-8?B?NXFQQXdRSmdhQU9MYVBiQXc0cXNvVFFNSTRMeTl0UWVaQVB2d1VkOVl3YVNy?=
 =?utf-8?B?a3hnN0RuOWtwSlV3OEtLdlJiZ2tlb0xCUExUWHBDODI2K0hvSkp0TFllZ1c0?=
 =?utf-8?B?ZEVXRVJwTjEza0tMTUs0b2dCUW5ERy9mQy8zNEZkZkEza1JEZjN3Q1pmWEYx?=
 =?utf-8?Q?8M3ZjK+KvhRW3Z16uwm7eXXLWTqIbWBPRmrac?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b737364-27fe-421b-3130-08df129219e9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 18:58:02.0733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUQG5YMD//HPGbBeFa8ltJ36VUTaiHgIMcHIbWm6B1FbAfj648sAcBhTozBCVX9do7byZ0LuVO+3b17sL6CcCAAdTUfDPbUV2Liw3QDB8jz8St0ZyOkf1ZAnUM7zmfJ9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8426

From: Frank Li <Frank.Li@nxp.com>


On Tue, 01 Sep 2026 18:25:34 -0400, Frank.Li@oss.nxp.com wrote:
> Cleanup some simple dtb check warnings

Applied, thanks!

[1/8] ARM: dts: imx51-zii-rdu1: rename node name i2c-gpio to i2c-0
      commit: 3d0c54a7634f7a27527da4b83985509ce9d7619e
[2/8] ARM: dts: imx6qdl-emcon: Remove unrecognized disable-gpio PCIe property
      commit: a89327ced267f3bddd39bfef55697042ba24e4fb
[3/8] ARM: dts: imx7d-nitrogen7: drop unsupported wakeup-gpios from tsc2004
      commit: 5c2b3c0be9de935e232380f301a6b0ccc2e1654e
[4/8] ARM: dts: imx7d-meerkat96: disable lcdif node
      commit: 8fdbfe040d08ed7d7c5e2dde2c16328ff29f086b
[5/8] ARM: dts: imx50-kobo-aura: convert sd2_vmmc to regulator-fixed
      commit: 4ca5ffee7500c3ce78fc821fa4eedfcb28e445a4
[6/8] ARM: dts: imx6dl-b125v2: add touchscreen-size-x/y to exc80h60 node
      commit: c9608f889d2e94888e980148ec04b77614448737
[7/8] ARM: dts: imx6sll: remove unused node csi@20e8000
      commit: 5e863f9f2c7f66a0ff902189c389d142bfdc0805
[8/8] ARM: dts: imx6ul-14x14-evk: remove reduntant bus-type under csi node
      commit: 12f17efd282d8a66d5570098e12c1642efe2910a

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
