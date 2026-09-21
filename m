Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011050.outbound.protection.outlook.com [52.101.125.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7F14A1DF9;
	Mon, 21 Sep 2026 13:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998313; cv=fail; b=YheD1RLtfnCOHl8Jpg5eHMM8h3TgM25hCpmGMiUR7jaIKsSO+7wyyFh+DpJrHMbWWY+y78lw+EOs2ZxOc4JQi7V+Oar13P7XE1BzucZhnYLKf9IkSFE3XvMr01FBX4A89oa24lowTTCBEwV17fKQHzoR+1TD1iiUnSc3m5IYt78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998313; c=relaxed/simple;
	bh=oUZY5UN2kIyjlsPNr29W7vlS9R+0JQ1AXZR5oK+F/Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eRG916nFX11Lh3EcqqmBS3QHbaPrZ+/SQCHzDQ6mCfvmtSnLOSSy3jJTjAlQ54VON4jC4MPsII1MFLlJ85MS5iQT0BYCQMirWZeV0jOimAxgWVSI4FumLfaz2ZhaiRm/nhBRYlTzmuOiuPozawsUUag7CqItiPnlMOiF+9dQovk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Imh943hQ; arc=fail smtp.client-ip=52.101.125.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Imh943hQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9psAa9B/FhRgCWdoP/SxqvxpqmEMXzq/j4YMV/IiqJFy/SNVVKxtRijVWXvF1WHqJxhYaYaSBWnq6giv9JmJ04nl2SmB9Up4E5u+ESGt2IcND0TkcKlwVN2qBhWmCiw7uJM/tzPXNIzGvCZwhdxkDzVWfjT5BFftbs032vhccyeBkL4k+BXJfEWxB4Dko2LTzCl+S3Gnu4UmlmuHuRc5xZ/U41jK1BuRf7OTzwAj+7Fuo2577KbToIkGD56M4hVx0Qpq3pPvzPM+wyVDCEX1HmfxaUZKnN1HchqY4WzpN+7SZwh8jdeAsMWB4T8Ox1HufwzqqM2NpxOKGL5rWcaiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3t0wWP0PexvqpcPH+WMXa6qIbU21dkrKNMKoqb5afms=;
 b=efbEyZ9X+vAUMLXr2Vu3/rHIfBZBxTA4CEIptgxsJaLd3qAJYdaE4BzsnGhWRwtv1/KnKNMbB8v7FHtIQ8w9JoWCXAEJWa/dnesnbr9q6+YK4GgBLnrSAAE8GrEfcSNpUDD1q/PyFfTHF614dQzkc5MeaJWc+9aGQKI092KQcY3PZyHrTImWot3Tp0hqmAkCXEbRH3wFH4hjwrAMUP6cAXI4B7Y91W3QNjC95nX6jNfY4A+ZSphL0TPpGaAA0tVWgj1Hen97+pgJ+QFDlyoUDLZt3UYXNz0QpCwq3AycU8OltmTK2jjSZ6qPFrBty2QFh8+ppmNhP7VQd3QwkOpbCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3t0wWP0PexvqpcPH+WMXa6qIbU21dkrKNMKoqb5afms=;
 b=Imh943hQS8UcxBxVRCiX1VV/gudkInJmguIGMGDGjPcZPEQzudvyQDw3vPHJBHSSDS9i6/mF7J9EkNmUvy3GJ9QMk7crozUJbPIcf3AqIpJ03TPgWf3KkO80QUPek4utr0Hj64nPq7wrMYF3sQelxfscnv914S0siToXBiJAdHQ=
Received: from TYCP286CA0275.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c9::17)
 by TYWPR01MB10868.jpnprd01.prod.outlook.com (2603:1096:400:2a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 13:45:05 +0000
Received: from TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9:cafe::62) by TYCP286CA0275.outlook.office365.com
 (2603:1096:400:3c9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 13:45:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005622.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 13:45:05 +0000
Received: from laptop.adwin.renesas.com (GBR-5CG34119KX.adwin.renesas.com [10.226.37.103])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id E4FCD300025F;
	Mon, 21 Sep 2026 22:45:00 +0900 (JST)
From: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/9] dt-bindings: power: renesas,rcar-sysc: Document vendor-prefixed header paths
Date: Mon, 21 Sep 2026 13:44:21 +0000
Message-ID: <20260921134432.50338-2-ayman.chaudhry.kc@renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005622:EE_|TYWPR01MB10868:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e2d70342-6ca7-4ce1-c107-08df17e68b04
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|36860700016|82310400026|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	NAfjKyxNTWXCRGhoCS4gUXka5Nipha7GGZvTgvrt3VthM4GGNW/qpZw2RU+sPGpCw9lKIyIKc1ssdVe3DaFn8Fs2GlVFGV4Tn3j7zarfWzA5WMKsiXeha7Ov12gFcr0D4FJYMUOkpt2SF5hhOAB+4LZZirJTz28OoG6MokkQ2jbNvAUzwio78jGpvmXduYRuxqjf0PuvaTFSK6fx74MyZfD8n48WoYe1pjwonYfQ3NBcSCRY6WoSCUWcKQ/DEoJtGTpSyv2B4CbgufOgSwuh45Wb8BGb7J297miQaE8C5rEdS0lsoxt/T1IEsTQY5XbTFx3YPvNA15qJEeJ+hfstQPz/3x5e2Qd+F6AM/rfGQtFBtmpmgoganVWhRI72CSlNcIvV0sd8jHeSATqF761OrKFEeQ1mUm/6HYHwK3Ku5goqy0U7/6H0+kwwKp6yvaHix5LisLv2SwfnqZIETnwqTaSwE1Z9x88HewkRp1fRx0LZdSVoI2ZrQLHWnG9xMvyfpHl+61ObPYOjCVyTt0fI/F/Rq+198rrLkK5X+GDQKZmMuIkm+3njXX0T/P2DKAVvE3TF0wRfNsE4RjcswRUKIVOHm7OTv4QTDuuzCvumrDmRZshAk6wN7l3V2VbmoE3Ymrsf2TAZxx5o4B6nYKTsuyRLo9ZZZ30ZCh5RsBKK7vtUbrTV42bRNhv9l2d7j9lOMO9VAscuPVXtEICzhZUtYQ==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(36860700016)(82310400026)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9/0/J9Iz5ajqPYLa4EADjZQ/RD5e+N6mI2+VVmDdTsfVn3/kfDBtTg5jez25KNvGFEfak7UajzhWP+ocgs9KGnhmmF4pvoedVgtTZKVJYoDXXHaKrszHwTzNVyOjDf6taLPnPbwzKqRJYOCxWOmWgDD0MKK769rUUrIXTN+JghPVwjuFDRdUgS3ncGA2tcHrexSKY2fBOQKNp7Nt87HrfWSv1NrzTpigVgIqfOpdB01RHHlcFIxWdIidLm9mRo54eRu/D0bgklWR1+ur7y1lmmzqudgTlAkGp5DHnqJXFJg9O+iM3UTBPkKnI1cE88mbz5+J/lC/C49l/GMw3kxFRtO1ijftV0im1+xWVsDnS9RsGXBlYR1g1B8zq+AXVcjKU1y8Bj3V8M36e4exoRAK9cY/fRxiSr9+2zu9oRXcoYSZZmg/nV3ipxIHpcGtb4LX
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:45:05.1660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d70342-6ca7-4ce1-c107-08df17e68b04
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10868

Update the top-level description to also explicitly mention
vendor-prefixed header paths and what the asterisk wildcard represents.

Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
---
v1->v2:
- New patch

 .../devicetree/bindings/power/renesas,rcar-sysc.yaml       | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
index b67aa170b2c1..68b4696d7c59 100644
--- a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
+++ b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
@@ -13,8 +13,11 @@ maintainers:
 description: |
   The R-Car (RZ/G) System Controller provides power management for the CPU
   cores and various coprocessors.
-  The power domain IDs for consumers are defined in header files:
-  include/dt-bindings/power/r8*-sysc.h
+  The power domain IDs for consumers are defined in the below header files
+  (where the asterisk serves as a wildcard matching the specific SoC
+  identifier):
+  include/dt-bindings/power/r8*-sysc.h or
+  include/dt-bindings/power/renesas,r8*-sysc.h
 
 properties:
   compatible:
-- 
2.34.1

