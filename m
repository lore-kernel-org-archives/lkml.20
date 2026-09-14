Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010066.outbound.protection.outlook.com [52.101.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF5C32B105;
	Mon, 14 Sep 2026 02:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354270; cv=fail; b=EPabnhegS6+PeAb32YGfF3hNFDPrKBYORxMREwN/9/+ZZA/idhy4wlni+r2Q7OIE8J+7fEL808SnVHKtBKvc7C9rrqR2OkHMHLIXpdHAklzZBHEh+M52n3Z4MzgMh+YbpZ66gHpgGfWznaRfL65vH2nYqS7fI+H89M6QfLTPPNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354270; c=relaxed/simple;
	bh=MSHwKldchMimfqvN96MUGN6jfsE8A7ScE8wTyJw2ROk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sBAFKGZ3D5SbzMOxCtVL+Xi9IAavtxGvu3ErR0pa/zlu0WxteI3+EtFkBVGl2G6sU0m9AnMPLoB2bHxarZsktAsWMJ3hY+MBg1oARnj8XxTS+igxGLHLuoIYdINR8rZ3IzmmycaWjU4Eb4IdO/9Ppe+O3xaUKprRbBAUepAlg/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=RiBCvIGo; arc=fail smtp.client-ip=52.101.61.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="RiBCvIGo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCD5l2DHLIQ19wd9zQhB7CpFy13jQ0VvWMJsr6Y6P8KDCypIPu6R+O80z/bssJq1iiFALS0ya+W+QgBcPGwj/WeIvk0L5YA79rEZy/0u/yv5J42DGfrrd0ENgqnN8i5Q+JcVcxxTwEZpx3LWGF29qlItFqgjBk3xvX92L0qcn+8i1BeJ0hMlIq0od9m9HFdfrtHpYk16n7g7Ql3El2GMdCJeWs/KE/at5hf6EPuzJd83mmp2l3VQHAshGD/YXHx7gWGOC3Yf2P8265XubjsHeJJNLFWjdkAl9qYwQgia3swH9+Nv7DMAIoAFL5O2j8Jd098TuIpcFlepX8whUz5xQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVVFPG7EiiE/NV4CZz9IAgMq43K5tY3x1nlSaPpEEEc=;
 b=bfpqNuWxF5zcxr1rAGqL9N/GyDKTBJtefFtLzfcvmUJawmXq4PCHzZ+7TT6lo+roicPoIeYpQwcOFDwWqfHomj6s6zxsoR8tM/1avob3o+DsQQw9fdU5JbBmw+K6KblLexWprrpvs+GNk41vcU2vXTwooTv6VYBgCLUNyFgg2QhAwLR/TBw64g0cRGMBBQgLAPKjRS4Bo33/SRuJUz9G12M0RQ5GuodyaLyFAV6za1QeAP0rbZaddAsqJPF+MAyjBLllGRltne3CbS6V+/woZHe4ayKCuDF4tXBT1tfWENKjhm0R9XedfB3PS3JV+6spU3ZzNXYi5QZBlHyx7uiNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVVFPG7EiiE/NV4CZz9IAgMq43K5tY3x1nlSaPpEEEc=;
 b=RiBCvIGoI1/Tl+sgQRN0TuygUN7UcOklsxW8v1KK6pUVPh2gMkb+nq5CnW9ht91C+hVYEhPY/5bV84PijujBmTrc2pErlDQB+czYjMxMQfTDYT7ejvQRIIImYbkRjhTOPu8KGafjrNeXw7qDMMIfnH2HuG5WwmMuYIgpFsCeLeWA9rqKyFPeuP2t3Ebi47N8ehP4hzbEMhDpXerj3cceC7cVlWUtyxLWiPisrMs1gn8+b4Pf274P+J3YEsGwjAMKTRsbI53yoD3W0HXrzcMcJ5sukVIHDTd1D7PICUyMsp7wAPvwieTXSeYOYvZtekvjr2KCDXccc3LrEChtICn8vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by PH7PR03MB7267.namprd03.prod.outlook.com (2603:10b6:510:24e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 02:51:06 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 02:51:06 +0000
From: genevieve.chan@altera.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Ng Tze Yee <tzeyee.ng@altera.com>,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: altera: add Agilex7F SoCDK multi-QSPI compatible
Date: Mon, 14 Sep 2026 10:50:51 +0800
Message-Id: <20260914025052.14354-2-genevieve.chan@altera.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20260914025052.14354-1-genevieve.chan@altera.com>
References: <20260914025052.14354-1-genevieve.chan@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::16) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|PH7PR03MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 319def66-e57c-4fbb-1635-08df120b057b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|921020|10067099003|56012099006|11063799006|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	zT9Mbm72uBMDOaQkFoPta/ImyJMJXjxxcxPLZ0EQQ0DmgpdmBQhPTOmWg9eZOWlvS9r3qJVXg1yXQW6T9curinDgbmz6lMA/qF1qYHrabhl+1ZiFGGqobEQp5D8jS/W1BBWYwxoLpo2bQ3qAYWKWDZ7BjN8YlOTuNEP2MdnLaSKZUYihe55stcP3kGRWeJWw3Beh5jAjxkyeGCZLZ1jshDQ55DZPBw88o1ZgdALWc8dudnDgdyVvOPjxY2izNCXJcJ7978Qw/FUjL9FVaCH5t4ZVHxW2Vpjf+OMxFasyGHTLhTjAzYhj6omcHfxCJlxptlkOGJE5l4Vo+rGysZRrI++/DD6F590vgaFREksApniAwhJhNgC8rvhkARJbXvSjqlDac3Nz5n68zCbIMyPwdKgdG3wLck/bkJa9KWjGgz710+S8zw0PS0L1dqvo23K0hjXz2f/UvuhOv/AGFPS7nmMIyGWUVTvIpsnqqb8mYQowEwXkWTqcmuFG8EsSTCwPRV/oZFM5LdqsDqOQUF+aAs8I5EJ48FVZsaXygIx4YXwr1i1ovjqtBbPGRrHBsZFr/9zg0aVJQlk5h4sOxozyXvME/fcAokncsYuFAHPM0eHZdI9zWAcZzmtXd3+dW6oW/9txDRpm09OlPx18pTaRZmiMqUtl3U2lWJa0BnlJm+zkJkARkU2HwNAQ8BudpAc7di63Mh41y8kHZt7aUPbfGQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(921020)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qr2w2i1SgfF+Eicr+LXbQHYnoC2f73D2u6EespJoCUCqtO15ogDLfJL3ErCV?=
 =?us-ascii?Q?wq6IoLQh/IHtW7r2qznSZcvVJ9qVWjyY4AhhN0qbrUsGl6YkE9IaxHDZXRHS?=
 =?us-ascii?Q?WzQTAsSM0+K3N8Ud8FdChNFlv60xr3+4+kkph+2l+pahvDYerqy3ZuOlfb/7?=
 =?us-ascii?Q?vOn3QDbiJ/QOsJkfgMXsVwGEfuIrWWZgwgdw2Sqh/iLYMVWWYp80lCd55XHP?=
 =?us-ascii?Q?xy4MYxVHZnyu3YaIaXtr9yuUUtDTVr5giI8If/YZ272yuJk4y1b3y8B3jQfO?=
 =?us-ascii?Q?85XdTz7TcHFodML6jV/XulTdsLA8hlSdaomHC/vduk11hj09n3v46BZ/HsYB?=
 =?us-ascii?Q?TMQvruv2Udtz3mCiPx78J5HZ4rXKPLTQt2L2Efw13a8cNHb5QIOtvKToUFWl?=
 =?us-ascii?Q?rfd5grVphrl9hiAuUlqgG3JwFZqxdQM4aCFe+97oMVfjutlEi5lko6NEK1G9?=
 =?us-ascii?Q?oO5SZNSS4eMDkMKD9Kd8L7Y/4IdGkCFWKAsoWoHQPr1PbZ57pOjR6DdQi4ph?=
 =?us-ascii?Q?890jjDgppVXqIFjhJJkN8MldMydz5gPcZ8fVpgIbalSPFAisqtS+OvBjcTJm?=
 =?us-ascii?Q?A8ubcRZykxPL7olrrmdjZ812pSZWn0F7J2e4jZMGcpK5Llwuy9gTr6k6rRqh?=
 =?us-ascii?Q?OeRq65LOdWOFdLOs03ly0T6FbNYeUg3Bpkn1DMsHS0fTrvkulvoKppruIx4r?=
 =?us-ascii?Q?Zbvm0TysTJn74j5ahMIKNQ3qzSj1byCwB1l0SJG0k0rdH7VzTVStKJWYqWnH?=
 =?us-ascii?Q?ob0XLci2OqRZ5XKzRfW5hJSMEDCADHnowKCEYL67SpDuVMkypRM2g88rWQzZ?=
 =?us-ascii?Q?o10TBlvlcS9YKjXfk7UMzVTexTvLPOWXnElqNp8aQO+TQWcH1CWhTjKO7iaX?=
 =?us-ascii?Q?8WRp5m6+5t0cDhoZ0F/DWEMKDyH8Lr6n3LO4IAKWEywU8azteBna8AI5RezF?=
 =?us-ascii?Q?UsqYsSBjrWvt2RQ0TeyEUEwxjLMmyQhT7iYu0zSkV8VfeNkyjjy76mBvHu9d?=
 =?us-ascii?Q?/yq9tBdPfARKcSWNhYm2mj6/Uf+rl8xjckr417LUmPr1p9lkIjb2T6yrEp46?=
 =?us-ascii?Q?5EqvmdTn9b0XwjGWLsdve89Qjx/8KPNZUAYmHmmI/Ol1OHcHk/BoVkiZ7ZMd?=
 =?us-ascii?Q?0kE3AQ1OyL31Hk0F5T//DQ7uKBOguRZ31BsZzZm57xn5I/+QtXDVCF7YbgYG?=
 =?us-ascii?Q?ZnmEo7ylPbWAGcZQ5c7g2D8WUdaEP1lqFmyI20AVzdf/2BVtGH4mfJMS2KPA?=
 =?us-ascii?Q?stDcs80Y+WcOQvSlgX/Es0GL4taZxxaA6UWauemTbuk0xYJAcoipEjpIgtiY?=
 =?us-ascii?Q?iBmw1wPmEEoVWzc1IdV9PxZ83RR72wf3RhEU1rxpikkeAta8P4Grtez4s+ym?=
 =?us-ascii?Q?8Aw1ciBORNAZBASoSDJ4c9wAE9kMUGxKZSx1DX/uu5b3LTxRiZFk0IWFageD?=
 =?us-ascii?Q?V9mS1tFT8UA+s/cPc8AiL56fUd/Ue5Xv8aGgKqdGOS1NuUZHx/Jm9zCgIewe?=
 =?us-ascii?Q?pNzgwOU0l856vhjB6EGCx1x0Qv/8M01eq1Qhz7cQzERXVQ67SuLnOmOEIXSK?=
 =?us-ascii?Q?g8JuyBgFe17M7KGP3y18gjXJ4uJNemefI6rg7WI++z2cbP4IpaYSXbhqIinJ?=
 =?us-ascii?Q?674rRZBxv8RFo/FwARegX7ThSJLOZSN8j5z9bfRNLm5MX5Fpq3qQRW7am+L7?=
 =?us-ascii?Q?EqeEJ2IN/EFHswvp2oXCzSZ3mIFRWkUwwAHE9ErF2MTbLzTzcszWbzrNA3Pk?=
 =?us-ascii?Q?slE5KRiQuarMwcNGHubU4YstIQMQ0GU=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 319def66-e57c-4fbb-1635-08df120b057b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 02:51:05.9766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdmOa79PQVZh4MQfGrS1sGkX4M05nF+0aIywOfV+y4JrHimoZsFkKoTb+j2w4jikXYndM1LBU7Wug1/xe8HyOrAwfbkrnJ+KUaSzuxnl9cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7267

From: Genevieve Chan <genevieve.chan@altera.com>

Add "intel,socfpga-agilex7f-socdk-multiqspi" for the Agilex7F SoCDK
board variant with multi-QSPI flash support.

Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..2e7fa5e12530 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -97,6 +97,7 @@ properties:
               - intel,socfpga-agilex-n6000
               - intel,socfpga-agilex-socdk
               - intel,socfpga-agilex-socdk-emmc
+              - intel,socfpga-agilex7f-socdk-multiqspi
           - const: intel,socfpga-agilex
 
       - description: Agilex3 boards
-- 
2.43.7

