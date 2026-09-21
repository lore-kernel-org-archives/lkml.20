Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5AF51CF40;
	Mon, 21 Sep 2026 22:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029619; cv=fail; b=hKcbzXrx2vO3waR3+AnoESGVA39pxD1tq1PTFknpMwtRjkGeh8J0KZviOS6yus1N01bfdWUoIA/NjYQsXpWyrHiOJNmFKvzmfK/I4JdlkK8nM2AhkAYM8Al+bbfMBI174pnqeer1L1ezW9P7Ww566oVV7UGyPbRlXqX9kWPz80g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029619; c=relaxed/simple;
	bh=CIh3em6J6AckYwFE39FSXVXs3v6LlRhndsucuW7KND8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n+5P8oiDAr9Ulmst404tY9TffL7mcL5YZI0TCNURNAAO8fMR1CI+uwbrw3DcnEbjWvocw3EIj4bGN6hnyKhEXKQkLURNts74/a8Ox56xjdOU8bRh5Le28buGSjHm2czLHcGyRLQU5KPeXvX2n1Genx165RiKuE1STMuvTU9+2/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vqi3jG8r; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vqi3jG8r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMcKZRVs/DLBLX3SFeCJmBHbkFHRXS7ZZT5aQDKsBhI1/eeKMaryzD/pUqeRLaFkRfDOx6oEkhRkTggZXVrCy+66avV4ulQBYaI5Mj7Xgzo4zHhSjj4soFwCYPrypTuBN7doUZ5e/DkulEqkQrCAZvbVhd9M6tq9bUeZUM//tZKwmFQscEIX7+G4QrDHeMhXFbWhW93XdySMyyxjmXpZJhZOQ51VQSrb9KRvDUzIUzEiuwhv0EyXn1Sbx7O4y4TLzJQs87607YlF1HuaL9n13PoJDN83lEclTG0H3VJUjwfZRhyh6v0jUhY75IgC0jOOslR7yM2mmORAZQtTcvbmiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bRJoKKHco6mqa6gkczSqnGILKTVUZsPTxcce6ky9wU=;
 b=xHHhBUGxrliduaimJQEpqV7T/yNNrlYxUA0d1RzygMAfs0ERJJuRmB63RW8abRjQT1aLsXo2WgvJ56/d42L1y3l6+GCtRYT2QPytBefrQEmRUiWClAN3Vl7/O/WQgMcw/Bhp9dmsX44K9tUU/ko3zgYaV4cZdwuACuR2NiPQfKH4Jp6S+Ws/22g5bI4209VruxQDpaQB47sfc9mu6GMFgNOPgMJ/mAn9HQT8BvZwqZvsjBr1vwXSEDH8GJ6yGd4X/EdRe2aMEGm6Abp+SkALq9WDyCzA3cjGEO17n9jAne/IFcr56LTiVx/VDkiRjL39PiqtpAXbjJMGX93L/s/DcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bRJoKKHco6mqa6gkczSqnGILKTVUZsPTxcce6ky9wU=;
 b=vqi3jG8rd2qFttFsL5siNNUaP7T/2gEoUpf6hTitb6pgqtprKrASmGjXgtSpJuyu6foh7c9Xmkz0YEmFBur4xpaR9Z9+V7jznPQHL2fEpXyw2yYuXXOFzn7p0+yLj/BH9Dr/dR81kri4Q6QrgLEptZxQyh8VEYQPbTApvMp81Xc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB9927.jpnprd01.prod.outlook.com (2603:1096:400:20a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 22:26:55 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 22:26:54 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] arm64: dts: renesas: r9a08g046: Add USB2.0 placeholder nodes
Date: Tue, 22 Sep 2026 00:26:23 +0200
Message-ID: <15cfcb44c2d6b6e03b5c3d0d5af8ed997c4d179a.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::8) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: 4930a4ab-24d7-407d-6f21-08df182f70a5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|38350700014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1Nai6EtK9qGpRZKrxW1tNPhLImtwMTA0VOwf4WsrTjrKZWFmNoZNO2Xf+Gq/qqXQmk58sjZfgWOWU7r6PjoddQ27aRCz05E/l05zoflS9mo6eqUuJyiARuP1409SOzOHSi+ENpjLdqG1LMz+hY3Ke3WGSgsg74zFgH6hZKrzToTijhPPyyz233mIwBH2FABhkXd/3FtG4shi4F329KltjSE5YmxEOV20/woc+fN2boSKSx+XbUNph1stytCWxpbAjlnDt/jMZHc2SKZ30fGyzL6t0vE7pQCNIh0tVxr0RoZ35Vq+KucdX14sNHbzg+xSKCecaq5qbfTd6WrsgJDcpxWVOk3CI2lYWDNeo6vlDbCsrwx2bwAKAstnY8GF0oDcmKTVXtczdZ1Q9PLVuNYReDI70FRY7EeYSuEVUBYsfQSIPGl5vqWxB5Iqqwze4pkfDyj1T8sm6a1cbmIydNV6dWtcgtBMnOdlO4eDtRExYohqy2ybiU0srbFCmIZ4Z4AKPCrdOo/0EyC0xzYIO7EG+SuFYDNz25PQSTIsjOHmHUfLAP4gJXr1fK8ZV0H8aGeTQOlAbjdWExTeerPBdOMMxjlvY0U0KxWOdbwDSpa1xiXK5HRxjD3J/ft4csuOBX6pocuOY6bzORcpSXAKg93VqUGLWTSDjPvxfGAWjWxXkLE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(38350700014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4CKpzp38xANEdjaz4TVJKWRE/3ZULva7V1hcyMC0uzPavzJxIaG+YrzZ2ukY?=
 =?us-ascii?Q?tF0LEUGjUpELJgeOT4u87EScjKFsbQpkUYXEg0u6gDZpyjFy8QtqDCpCVdWY?=
 =?us-ascii?Q?kKVIOhJbgM5rGKeB3n8oQ8/kNpqL0Tk6JbGZuCJMlmYo4fMuHSIAhQMCVTZI?=
 =?us-ascii?Q?dV92AUOQ3IGlOnSsUDdSM82B1dEwDECvOR8+N4OMksN+6Z6iuP0+b9nPKosV?=
 =?us-ascii?Q?/acu2V/l0hR6KXkyuBzN/kQgiYXEMcKtQIVhLMiLCE+ZSav6WtBOECT8y/8w?=
 =?us-ascii?Q?SzW+UqlgqSROr80vgNxEknPjVYEYmQJ1oKMVEAmtujaxUVhFpvj37DiMk8Jh?=
 =?us-ascii?Q?H48xQcUXmIyfjjRoMhH73OfiP0T9cgZY1vCuf3A6yfXattRyGQjtnc0V76Hs?=
 =?us-ascii?Q?60Bmvfi2LSShKRFXqyDzafde+kOEKZHH2iVIPv7zC4YvwM4mnBvLB3asHIim?=
 =?us-ascii?Q?h2SPX4secgXQjJXU7MwDuw8u8UXxTS5L/Ar32AyyGmjUukmL7B14UBytzhbn?=
 =?us-ascii?Q?+KkrG1oAf8EamLVMcbAwZSE6ugn/iQZzuLsFrPuJB5dxIlLqqGPULMvvr/1R?=
 =?us-ascii?Q?G35f5qAeGpFegzrTZd/5tp3QucJXpo7y6y8vdpkckMKDlNMK0ycFF7N41siG?=
 =?us-ascii?Q?K0lbiQwT8rzif4fKDwE2n0w7V2AdcMhuiSINTRsfrQ19bi5sr1/7TfG7L4ZP?=
 =?us-ascii?Q?DvZaSZC5RjK0QCrLygmvDm480jeHZeKptUdpcn8MpTg6mMq6FGQUU84rmuzT?=
 =?us-ascii?Q?BJgjA7MJYcaCvbXUvq9YFYdX2BEMw8/qkOHzr6DaqYawEti91uGKTE0nZywz?=
 =?us-ascii?Q?4svQxoT6xS0iqc358UlRYsHCr//b5ElbmkZkntMiwNfX5uu7Mt152vwmcPxi?=
 =?us-ascii?Q?jGjl5p12aFt305xsy7SNiQGzn8AtSXWrJ5ePTPDxemjgLFZirGxy0BPHrpYH?=
 =?us-ascii?Q?QiSx7WmsoEM52Mvnhr6VWBeSKh4NIZKyXJFzW1Brh4jp8vHRaSAriiADzMQj?=
 =?us-ascii?Q?iHe4BegGA59hD43XG440E8O1HHvtSaIWJdFr7TWvg4JHN9Xi70/ydYQBBF9S?=
 =?us-ascii?Q?MtV7y1QSboEnmCDod5TDa6WPwMR/55HPhnffjo4e1peDeNCBDDzya7CgGEML?=
 =?us-ascii?Q?q64rLT3lNxvFLikv4O8mQ30ZFxXIwXp3SGPb7XbsLX8FNXJil/QQrrU/17Ob?=
 =?us-ascii?Q?DrKsOIQE5h9N9kGsldR+g5uVz87WzZiZV1QrsDdgzo4LY5fq0Jw8RqPsHT/T?=
 =?us-ascii?Q?LeiS3UkkVMTI6PW6E4PU7deI7/5yZt2hzEHEZPF0E/pFdqwS6gvWC7JHWiPL?=
 =?us-ascii?Q?hr6UTMWq4fBZbNL0ZcLkmQXILqfhEaFCej27BaTnXfPydr7fj/vwi8hxttTB?=
 =?us-ascii?Q?vv4bvF02SKR6FSE2+A6JHp5HAXvYRTb0ay2PvFPRPKcWgkzHn77k7cEYfOWr?=
 =?us-ascii?Q?NlsKXNGQw0Yg4SnBkRG+cdX3qVcRsZITTBwMV6PHd5cwMk/YqccxombiWBAD?=
 =?us-ascii?Q?85/lcf3RBsOUscCWFysxJtsczEfHkdyc5xetsjantVgl+8lgWhoHtKVTQiKT?=
 =?us-ascii?Q?cLEDrXCSEWkCgjMpq7mhLwA6S7eOVidexRUSBJSwhb0Ch6ktco7dGPAS/Aa+?=
 =?us-ascii?Q?K21EOf2657asi89fjnerMr2GmrMqcgIpn4HTWSpO/lJyRIOujupg2OEU8W9F?=
 =?us-ascii?Q?vgOCUMJtZPPhNflYxEVbK8HSTRuG/AoxfJjD+Aw4VeXZFYxXAXV+3rWdLhmj?=
 =?us-ascii?Q?/PGWW9QAjQXui8U1VrMF/t03D0VfDArh3O0Yc36scIH7Be/JJdg5?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4930a4ab-24d7-407d-6f21-08df182f70a5
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 22:26:54.5678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ueEyK6lVrIqDcXNPIpgvITLCccB6/PI4fNZlipMOXh7jkj5CGDERwFZCTS6PtS4TI29mcVD+3yR3nyoO5KLs7Af9mb5AL+b6556N3YDvUqkRk5/CgcFopkJjL+M/nrZp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9927

The USB2.0 wiring on the RZ SMARC Carrier-II board is the same for the
RZ/G3E and RZ/G3L SoMs, so the nodes belong in the shared
renesas-smarc2.dtsi. Enabling them there breaks the RZ/G3L SMARC EVK
build, as the r9a08g046 (RZ/G3L) SoC DTSI describes neither the USB2.0
host (OHCI/EHCI) nor function (HSUSB) instances:

Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:94.1-7 Label or path ehci0 not found
Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:99.1-7 Label or path ehci1 not found
Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:104.1-8 Label or path hsusb0 not found
Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:114.1-7 Label or path ohci0 not found
Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:119.1-7 Label or path ohci1 not found

Add minimal placeholder nodes carrying only the reg property.
The remaining properties will be filled in once USB2.0 support for
RZ/G3L is complete.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - No change, re-sent from v1.
 - Link to v1: https://lore.kernel.org/all/aec1fce5558c6c88725fe710a2f9e4b1eb9e8d64.1787062965.git.tommaso.merciai.xr@bp.renesas.com/

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 98424a97f169..29a5de27852e 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1266,6 +1266,31 @@ queue3 {
 			};
 		};
 
+		ohci0: usb@11e10000 {
+			reg = <0 0x11e10000 0 0x100>;
+			/* placeholder */
+		};
+
+		ohci1: usb@11e90000 {
+			reg = <0 0x11e90000 0 0x100>;
+			/* placeholder */
+		};
+
+		ehci0: usb@11e10100 {
+			reg = <0 0x11e10100 0 0x100>;
+			/* placeholder */
+		};
+
+		ehci1: usb@11e90100 {
+			reg = <0 0x11e90100 0 0x100>;
+			/* placeholder */
+		};
+
+		hsusb0: usb@11e30000 {
+			reg = <0 0x11e30000 0 0x10000>;
+			/* placeholder */
+		};
+
 		pcie: pcie@11e40000 {
 			reg = <0 0x11e40000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
-- 
2.54.0

