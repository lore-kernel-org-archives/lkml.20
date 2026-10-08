Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010004.outbound.protection.outlook.com [52.101.201.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C48D42E8F0;
	Thu,  8 Oct 2026 08:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447032; cv=fail; b=Up9l3cPS3pzILLQPjgMdeRuj5u0xxmCObU5wg8f4eFmgXixrUOH0jG9BRt61vbgPAWb6Ya8mcfderR4wAr5O5oOQgFvq5it+AYjXozY8AAfJaZhn07AvqnvuWvwzEy5Fo+KlecTfvfBt7kejTWI0IZnsIUUnsh4pUhSM0xktpIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447032; c=relaxed/simple;
	bh=WE3J4pQDgjwWbJ2kq28aDyT/xWSy5U0kP7VpY9pM6Ww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FXgaNUiRif1u01nyOrIKA+FvSD60JQVgGpjXXq0hj7jwEZQPyA8INOMN5jpYmEKho29WRJiZVCDLTwGrHOSywjqxCnr5dI/3JAK/zR7aswCx+5zpz4CeFojqiVYMICfPpR1zUn2T3h5Z9XgaUjlCXEtNe6Rwmq/CFVlvxqkrV1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=se9bWhwd; arc=fail smtp.client-ip=52.101.201.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="se9bWhwd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iR/dzx8CP03dWZCI1sBKNEO091KxS1V33eQPy6KrvCOlYdisk3EpRcyZ/gcunurWdu0gwDxd8jmqYTo3aijTAARo1J8Jo/wayFXPG6lrZIoHJYZ3L8hnRsM3HS/nhQsrmAxUBd6uq6uO8tHrcMHlhJkoZ/6LWdYVfyFfdJFotVk95AiDjNoYiCXdmSobZxENVtW1eJSmv1LOlNCH2CRT11EX1JXJqm3oilQenuSuIa2U2r6gDffg7FsEbCwXijAo7kaotS175weQ8FC4xG2Z57aXwtoxl64hi5xC+AXMcXgdhQLUMLrVH2dIGtOZSOFAnPwQqT5bLwjSdFaSyo9ukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jTrhAWnMNCQFyyVxpcdIMg7a4uoMCl6uHtk8YJB4rQ=;
 b=ao8ZtK6/lNK1CkdigvwrwA8grhw4rQ7xeoGkKrYz5nMlcFg4kGUUXHAwsXy8agx78F1xlMqCX6Zau2dUgseNZQrifyVi8oM5bRaLp4khAz+rFf4Ti7yD+YVxg2rDmcQ4JrRs5KfvD0F5qEY91YNiCD1jdb6KXowoawf0bxxIdufoyCHqGIxVPDsvo8h/cJpq6y/gr0ehecFis3VoV6f0eM/E2Bv7b4VSyhdKE8M9tF1neiQyV4mLbOd7k/merHQeqhcA/UkZlYXn4E7Ur5B3QIiuf0BX6MWr43rTs8ySu3bV1fwIZjtvpAanZn/6LL9hikU3CT6oAZZF4VcDFIDMyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jTrhAWnMNCQFyyVxpcdIMg7a4uoMCl6uHtk8YJB4rQ=;
 b=se9bWhwdXF+df9XwnRpKicI/KpXw95IRrn2sxScUBErrN4N/iIGgSExz2Ij7KqPvBaKau5Hmbj3ALBXIaGKngf/dF3zGSyqqxhQ6S3vLyO1BXPdERQQMSdxUQGMWyUFgMlWcWo2E/itZ8TKRtemDpCRLgolUIKpvDgadEcp6ixu4+NbxIXwYW0ghTbo3LnsG2rTmqbKwNl/QIgkChlMqi/l9My0YkiJ68vfiaq4A4npWDemeB+fbYKpa4Od2BvIN0zAdyO251NiDwC1BD22JVM7eNMIEMdivoR+EicUMMm8v9mE4hbLptOyGp57f/t0GV2K3hWdsG4ON19aUUIZrkQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by CH4PR03MB7745.namprd03.prod.outlook.com (2603:10b6:610:243::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 08:10:24 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 08:10:24 +0000
From: genevieve.chan@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: altera: add Agilex SoCDK multi-QSPI board
Date: Thu,  8 Oct 2026 16:10:13 +0800
Message-Id: <20261008081014.35006-2-genevieve.chan@altera.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20261008081014.35006-1-genevieve.chan@altera.com>
References: <20261008081014.35006-1-genevieve.chan@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::7) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|CH4PR03MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad50194-88ee-402c-887e-08df25139b19
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|10067099003|18002099003|55112099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uIOUgNCF2aDWnOISga/wGNibMYCg5spRCUFqWEJQ+vZmNVWmt3WqbBtPujFdEF+8cPM9N2n4Wm7AtBTsXIWktneiFu+A0MKLEPPp6qbmjkg88BLT9UvDpalz8/OTLzAZw8nFlIS78ckdNadI1m29jSYGtpgg9qZuINvygU5sLqnB/c3j618tRoaObJMnZzcev8BvUPZHXLTX0R2L2Alz6KgHl9hxNySv/E2OaVlvxP2dVORvjD30/FAy93CsHthuqW1V4FkzpYsk/4oCmA98yG3NY1w88saEgNUM1hdyy0TuuE9nayGZxH2U210N0AsJslsvCI0j+zkKpGAIbnv35K8fJ0KtMji99V2+oruHOEFCqcVIDE4mPUZRe9RT9xpQMjOEZmNdm1IfqHmBH/lXyY+9HND8FdFvD6DE9obZnYNaUnq9MwtWMuXjGzKsz56KMfupUa53a1lgKOb6qbQfF/LQUQx7Asxsd/z1eke7mqnemAU9NSY/y4B852Ut+CsfVgu6MOrG9HD/xCCe6AJNHfXvrcbiqeHbNy6TLc09v4Ap4/zDZQdIAMAecpZmTXFqk8qlXkrMVu6hkOgYt41w3TJCG/WsX0/y8mwzmDQoiSMfU62Y5wjzP3tjQWNqROK5QCK4sHmaKSkO2B0nxvoCcntYO5wm+wjv63NWVf0IfCU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(55112099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SFygU7vzxBMTvjEwaF1T49WvEhlClelMjax0obRXXFQi0EM0iRGoLZbF8aoM?=
 =?us-ascii?Q?J2PRQCu2LNHtxcZI1twtqiiOumobztO8SJaDw5ekSSQu/TV21Zf+ZdrFgKqo?=
 =?us-ascii?Q?vDzQWBRvapyV09I+Qrq9oh0kIqXIb6Ducc57QbDG/sOtSUq93wCR5yfPN2X0?=
 =?us-ascii?Q?kCy5ou1shV1pR9QScFFPAEdbxosmmUDDLhETjtB9fkBXA1GBMSLIGfuSaypk?=
 =?us-ascii?Q?BRNQ6NU68HmtamDWt7o7AamQ9Aa7sMOtJRa6SseH/6DjVwtqiPZlxwZBfhvM?=
 =?us-ascii?Q?Co4I5zHWbAi3zNN5BG9gev24DKQb24hqqi0kj54mwtOUHquf/Bx+f4t1DSAo?=
 =?us-ascii?Q?+0/SF0l0vb+l7mWA0QxwKs0+MqNX+WF4TFjjzj6dACdbmWOsfY5hOnvc++/d?=
 =?us-ascii?Q?cVjSu9Or5SXgvyZ8RxmH67HkJP4S2/CHd0v6PFUu78MgoAPFyTqAdJGmDeqZ?=
 =?us-ascii?Q?XAXYDWxFu/AaMYggp0OoP5N5hEFHnzxwwZ/a3fyDgYDsgF2wJSQlKjlaOqcj?=
 =?us-ascii?Q?07oSQDW5/p2PR2p6ItWjvFW8KnRM+MNL3fjRimglFMKzD0KZdHkziPpjeg0C?=
 =?us-ascii?Q?l5LxmE8hGkLM1Ke1KIVAtWs8LDCD8zi42hPBZzl4NEqEYxyeX3MN1n6qzaiq?=
 =?us-ascii?Q?SJusMFTql13IB+P2bjiEttjtrjbiBsP5nj5BRaq9/V5zjhdLy/e36mhKglIX?=
 =?us-ascii?Q?ZqfOtDWtFw8BICCEPbJdraHXlh0S0Rl5CsMVxK7rQACZH39iP2SNi8GV1Jir?=
 =?us-ascii?Q?T9CanNQtfBYhEfx7RMXmoWuJW6HIiLYCSOA6iXjRZFgJGyO/c0yG8exaTJNv?=
 =?us-ascii?Q?Y/cT7zXlQKIqxyyGjDOxO/hpiNZSQM1x6O/fJZQopDVdMb6cpYJgK1xqknv/?=
 =?us-ascii?Q?C2z1YHRmuc+Q7b/IWL/G0xFZmMSKsx8ZfvCuNgtlM8SWCiZnOen8iXtxAdy6?=
 =?us-ascii?Q?ivwRrO5TW7Gq1P9qSc3EuTo0BF+Ne10lEuP4xp/XLFl1jg/spN4hQa84CaE4?=
 =?us-ascii?Q?AAQbBWkzVtJtd1HjV6CSSsBWWsmsz4TLSn1po0pfCjqIzOb38r47vz/4xwP8?=
 =?us-ascii?Q?pd+olhK7if1ejvJuPjJ3TSDQY20sDh2sfhVj5Hj3E6aqo9JC9xHGxDXvGyAr?=
 =?us-ascii?Q?EDihsYeyZj9VBTsi4hDKgXRrnJrxW1wCtjbDe1/LcA0gWBhupXD/sq0NXOsY?=
 =?us-ascii?Q?pgB8p0Egp55jTXpwiWzw4fe+boe69ubPvZD+jKGFUxKuNh/fVEG0+8xBj20M?=
 =?us-ascii?Q?qDnMjqqSB9DK90rGROCF+LeinRhH4IDfq4OqIXo2d6/vLKX5a/4hrgCF7+/c?=
 =?us-ascii?Q?RhSTPoUeEyC3xKxN2vS8hdI0X2lgWR9t1chmHBPWupZEpnc6y01PlvbxvyEB?=
 =?us-ascii?Q?W3cfy165DQt6PFBmnA+lC2JGsn4fNa9y6QeNPNE8pFZo1fGEKTqTSU7BnBjG?=
 =?us-ascii?Q?ujUxpZajThzVDoNMDGSqwxrc90+uU7fEHhdOgW+ScWrinPF61dcAnBUXP9DH?=
 =?us-ascii?Q?1C6UIEBbupWEkfMR62akn0fIOGYhFOK1BRxAn0ogjBKI07cpwbpBMMrn58q/?=
 =?us-ascii?Q?UOrDnAdLsYF1uwicn3yVGE6B/0ZPjR7UxShrHh7O4+50nkxoCEAcLTHm8wh6?=
 =?us-ascii?Q?O47iW1+3NEoAraekcyxVzsvQNeuwF9DSTzauVYrfzgUcn+OtFwqH692hvs5S?=
 =?us-ascii?Q?7Y92JSg/Dk8vElqrLeZxfqbxZb22oumdP4MWUOdeHI4/U3X2T8fqJ/U9XF8E?=
 =?us-ascii?Q?+EySBih62L2c0ZwY4uMt0k8P4juQNPQ=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad50194-88ee-402c-887e-08df25139b19
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 08:10:24.7511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Jicbk1GZCUX6+BWuTsCRvNXzWPvQBm+FaobBWAYv0lnFaELUtdaxdaqvkdnrsGh3QeA2XGTq5reUdmySYZJ5T66lkspoeVgBogwexZ/dPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7745

From: Genevieve Chan <genevieve.chan@altera.com>

The Agilex SoCDK can be fitted with a multi-QSPI daughter card in
place of the default single-flash QSPI card. The multi-QSPI card
carries four Micron MT25QU02G flashes connected to the HPS QSPI
controller on chip selects 0-3.

The different flash population requires a separate board DTS, hence, add
a board compatible for it, following the existing SoCDK variants.
The board uses the Agilex SoC (marketed as Agilex 7 F-Series), so it
falls back to "intel,socfpga-agilex".

Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
- Add Conor's Acked-by.

Changes in v2:
- Rename compatible from intel,socfpga-agilex7f-socdk-multiqspi to
  intel,socfpga-agilex-socdk-multiqspi.
- Describe the hardware difference in the commit message.

 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 5fce1161210e..01f6323b9a6b 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -97,6 +97,7 @@ properties:
               - intel,socfpga-agilex-n6000
               - intel,socfpga-agilex-socdk
               - intel,socfpga-agilex-socdk-emmc
+              - intel,socfpga-agilex-socdk-multiqspi
           - const: intel,socfpga-agilex
 
       - description: Agilex3 boards
-- 
2.43.7

