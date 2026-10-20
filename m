Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792489020;
	b=eJ4/CAMYRKavy4/A/x+X2kaloQiKmHvNUZpCvecrJfMNxbmmpeEEX4UaCY/iSjr6O5sC
	 7pYC+yvpRRamkgLRKQ1oZ32V8TSm9RBZjmAMO90QLp7scPbezmratwQtZyJabzAQ8+w1l
	 RPG846vXo6+Lf+7LQJJY6+CyWijve2vlTZVK4unRVouY+N3Fe2Hy6UIJpnR1WM9opdFl0
	 YoqwymVGuX74YDdHITPjq5M/a9Rz7xCEk4AP7aye/GXBXR0Z3LI53CKb1xIryjHOW2QvD
	 l5e7gYORWCxOWuGxNCOUye48WCh5P2sgPNL9WZ8TllpS0HScf9F1dBp2KRbPh0kRdtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489020;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=NN07oYTNHpgrWHpr4dT00mwXmigBoQA2gSJgLQQ5k1Q=;
	b=uwfAo+Uz+r2EPCRa5w80gq98JckPDI64K2LdMUXv5LNYqLlLa6RFoVnFrLEsTd14rIym
	 1/VmRYxtKpqufEyYxuI1cO9mE6PynL4R7F50EKJZqIyL9jhoB8jgZTHW71eE8AvribOCT
	 V5IoqAdyT6qMT2q3VknPIar8JfQxIPetIn3Bb7OFTXdwaQkUDvKaVtLfX0Mq4PZD62VPf
	 kFIkbr9KWn528jHQma81Z2frwCw5CsiFyl2TzLOQLVoM159sbzlOwdNkVOBFNeM6kc+WS
	 08tkthWMU3eLmh4PvfMgsrzgZ9Yk/Imq6la7yWqQD6nwfWmFzIz5MlEKvpXITL3EFxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=mqD+cVm0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.58
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011058.outbound.protection.outlook.com [52.101.125.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF23606A326;
	Tue, 20 Oct 2026 09:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AF23606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=mqD+cVm0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMDguOLJGyGRwCpUsatXF0OUNdHGHOz5vFqjvSHCtPum6Nr9q1n5XTI1S8v9e/XYxr7Od/HxVVjD5W/1w5Ea/A8Xj3s65tJ1unYEzs9qnVbIzShYnd0jZSDKnuv8U4R1WP0eJaZLUaavAA+JHqgUUScgqjLxh9IFif7iGcZ/EDYw0jxFn0UXbOhZPROZqvEQq69C0IxT7UQIwhG/xMxgXazfWgkedp3XaCB2GI0u4qAH5cSbaY5TW2Ui3fE7Y5NEk9ePS0ISfVIy1AHOcHcl8YPTtUfxNzzy7uKC1OeY0ZVw6jRZtfkrqCcP1BnXUuUsnIRLMW0n0ghn6CBZCR4TjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN07oYTNHpgrWHpr4dT00mwXmigBoQA2gSJgLQQ5k1Q=;
 b=L1f+poFfwbdZtuO3AB7Zni9Si5RPSi4Vgr+jmbq1H0ZjwboYA0QGauS4NQnzwCCAJ+mXc9cmcWapogVKIC4MowQr79nDIhIMuvrJLgH+RsRP4yDqOjLUTFY9ron0bRTP2fVRCp8X/VKiyX3iD40vo/IfForakrmsbi/pqDqyUoLVUW75ekM37WZPEqmBfAiYq9KAFsgfhwunlrdtuc2SEsyk6x6gMuIPnTY8a3SED7886np9t4I55Uo5wP76P1rrSi19zOgFeI8LYomC0Fn0OoxtVBkAb8Gw4lMZ+MssWpaK7+QCk5qPNGQOJ7TylV15WqYk5VJ9kJfoCNd+BVqgdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NN07oYTNHpgrWHpr4dT00mwXmigBoQA2gSJgLQQ5k1Q=;
 b=mqD+cVm0vrOiZ1E/eZ5WAJBnGrjAzGh0gCrsgqUabnpSzoLO8JKLUAuvSxZ36DV9sAhvOPDgqL7p205dJ6nl7bqEXyQFC27JKpf5DKkAFZDfKLRHVnzLdKZHVEJ7zP9R5iOMxKRGhpxQHgjl2PpwBJydVI8ePfYNnnFFEO0xNKM=
Received: from OSTP286CA0117.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:225::7)
 by TYRPR01MB15089.jpnprd01.prod.outlook.com (2603:1096:405:224::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:36:55 +0000
Received: from OS1PEPF0000D216.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:225:cafe::af) by OSTP286CA0117.outlook.office365.com
 (2603:1096:604:225::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.18 via Frontend Transport; Tue,
 20 Oct 2026 09:36:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D216.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 09:36:53 +0000
Received: from [192.168.1.82] (unknown [10.226.92.108])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 044F8300024F;
	Tue, 20 Oct 2026 18:36:48 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Tue, 20 Oct 2026 10:36:28 +0100
Subject: [PATCH 3/3] arm64: dts: renesas: r9a08g046: Enable I3C analog
 noise filter
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-3-b7ad60cde650@renesas.com>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Diogo Ivo <diogo.ivo.sx@renesas.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792488992; l=924;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=NKF6tbMMjmvGOAeEsWBOVON2VPeVy4ixWhxfv4jHvFU=;
 b=IeOFsqRLeRP/iDAKA8KgUcr9Yy4VIZkX0zIAGbMv+zD74Owma/YRo/SUj/Snv+0tTLGYpZPuS
 rdXGtjOCJpQC9Z7/689TU5Cd9RtoRz+bHzWN5acWp54zoXsRFs0XR7a
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D216:EE_|TYRPR01MB15089:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e80432-e730-4888-7e4c-08df2e8dad0c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|7416014|18002099003|22082099003|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	8oSZEn7kKB6TJfjLqbl0ZY2zOkqVs1/mb7OP0HwZyDjs8DNzf1959+Df2H3L5uh6noEx+6YFLD1+a8H6jWGoyl+8as/U6+LWy6ti4yovEEU6CR5nfwMrvYed9uYIOaYd328wQS2HcAgydqkhjQe6+44BzazqXTNX72vjcVb8bhcAzDczhTE/xIc3Em4YSlUKSVZe/4E7TAkWeQz7C3moDVUhJjqXEf1C9KjknrPShGEt6GwSSolKnykHjGZWzrB2rIxlyUwPuUAamWp4skXt+VxeWJpGeAlA1PYgYy6puuhYiS757CiOCDLAz7aRt8untCYDopOqtbPlEjVRBAECDwiAs97EY5Pece0gy07uOtBxQeG/LhqOEM0NHAOb3T3fMywBhaTbRT7TwDCZ+LYohWYpL6yGwSELvmrDy9rP+iXwJRNwNmKfrsC+sXMAB4NdxUB0AJp5YFBNcqdAEzjHjc0exTdNCtpZdD0BPsL6dxYZp8+i2EDXIEqmd35GWK0Ciiml8GByV5WFlQWpj47XxUkdzAIALuLg1bKe7wbNBAh7h86PSHjKFACUn6vNESQxnev8v0JmzQ8pNtI1kyx2D+RAZdM6hXDEcZA7loI+RIOTkQM123N/Hx1SXBGewNF2uwxzPOtWZAVT6kshjGr6Zu3+5WNFlq/AbuvtawWiKxTJeT6r/p4trXgVAOhqreKGAwq4Q+Sz2fb2U/28SlCjuA==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(7416014)(18002099003)(22082099003)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZTC7AejI75TN87JJIRNAVlZX1FLRQOAPmF2UstdM+301SZh0wbfdTEb9f0a4LOIW1abNadwFn3zv4/iwN+i/OqKBI2GLT2FSZjwVJf0f5NBgx/33ePPO3P+I7YmYM3+3VUWTe2hficiHvfn9TNcpq5845tzkFHLoD133WRVR27EXpT7x6bdF3wbVAMOdg5tw6TGbgDBpYnKNt3SqWz1lV8bZpF13pVcn/2xjTMtePmR5gw+ReqOleeY/eyu5MSy8Pdn4kmxTFuJqrFuy5UplGYuzSbSgMZDSUbyPeYSxOMlqUFIBvSBQt6BWiJmwyZpoIwyIL9dwRBulG60+CiLane889JZIMCZs3KqmXnqnJ27D3JyW1Z2RL6oI8C6LnNbPJTuR1oadrGimS6tVWWfiQ6fce80Zw3RUtpNan53XLaCBsaHDwv7PXvlBjV4Sye07
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:36:53.7821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e80432-e730-4888-7e4c-08df2e8dad0c
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D216.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15089

The input terminals of the I3C controller on the RZ/G3L SoC have an
analog filter for noise removal, controlled through the SYS_I3C_CFG
register of the system controller. Enable the filter through the
renesas,analog-noise-filter property.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 1b0b95b12ef8..1968e18fa587 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -650,6 +650,7 @@ i3c: i3c@100e0000 {
 				 <&cpg R9A08G046_I3C_TRESETN>;
 			reset-names = "presetn", "tresetn";
 			power-domains = <&cpg>;
+			renesas,analog-noise-filter = <&sysc 0x440 1>;
 			#address-cells = <3>;
 			#size-cells = <0>;
 			status = "disabled";

-- 
2.56.0

