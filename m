Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012006.outbound.protection.outlook.com [40.93.195.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEAD3DAAB6;
	Wed,  9 Sep 2026 07:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938042; cv=fail; b=vEQlhHDEV9K/YYJV8gVMH7AuP4TDgi+Qvm+oaUK+C/PQw6SVbi8K4UEmJNRxBZlN0vcT351wSOkjCd0upRHr7+51mQypiXekms+EsMua9qgjwc9uAhkmOBzJ5jgsU6f7Pgj+c0DfgOdmxGzLTMIVIKM4rNcVOk2hU3zFKduL7F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938042; c=relaxed/simple;
	bh=zHn7a7eJCGOq1KdNeVNCd4/ihyKNv0gKfLzO8VbpdFo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G2heIiD4OVs4LiG2Z697z9di0VpFycJ/jtE6FIErAm9fK9ThTUZUW5Z+3MbcWKMgOtkaQkqsfP1WauFcknubsPDYhUIezsAZb42VS6p78ecthBdiK+CR6w6VbDT8UqUzJJoaJBRTscasdFV+rU/Ls4oR9RtV0MxEDT+NCp6i2rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bRcCj7JH; arc=fail smtp.client-ip=40.93.195.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bRcCj7JH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8wqZcB2QEVRV+l/XsC6hXWHzK8M6TQZsY11rgwlRMTVc8+hfypsdR34iQVtDFNwlqaycdVRjM7/TcnwdzQ4u79AwG9hsX8jYaRUbUfvMNEIHIq0e3sH0bcngiN6y9xL7UMxXkl/PZfnB7Lv4Y/CipMEl0fc8b/SRkEE3Jh8EKrWsYzFSQd9FQ2hpuH4jjtsl7s+lNwiLjGVZAdB0zxuiLVW1unUh0DnHFQ+bMo8ZhvangT6WPt6II6EfV7d8tnp1lGFjbzZ692db5LaxE4Swencu0AqL0l7nqIy7E+QbybOChEI3pYCW2gG/cNqh9/7wErkVdpVXObCiIK7tklVHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOlwuV5p4BPHKSD8fKIkf63enlvrzwBPnKqna3qCPGQ=;
 b=yGUGFCE4jcQz5dMCgPWZuZ7yIK4JBU6cRKn1GMmJZR7R/XwO77HIsG3ljF1NoNQg9q3yxAEiC9AF6js3xmUP9U2l7Wl4I0ZxAq/UpiAtE1P6+lbZDH0fSxoPVrDk+QaGMQ/iSSmGS/+7RYkzTRLaQO9GQejzSoBQp5Uuj9ivhvIU6VXjGthWYpV+QjLNUOCF/oOUbiXy6nquhPhfHN97DJJUQ89HdCW6DMA2reH+/0g6rTXh0A6wwjqmI7+Ea212iD3hsWu1+BLy2I0WSyKq9jbNnTZVGQsDFNS6L/30cY8W/jos2f/GVIIC2h2K+D2ecxU26IMpXQGJx3gXfH1r1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOlwuV5p4BPHKSD8fKIkf63enlvrzwBPnKqna3qCPGQ=;
 b=bRcCj7JHq90qc6ghQuFHt7UKDfrmhp2P60UeAT2NhXIPpzUy6yKnMwD1IXQ1WElxi7sleunvQ2J5e7+sEL8n7i+byXsuEtkWc59jbtLFDm1vuZiZl8rRjtdlk+5f1DDcDbNcPL2SQgMC1iZTS5Iq6zPDXo9OvS0AhSErsVq8puw=
Received: from CH2PR16CA0015.namprd16.prod.outlook.com (2603:10b6:610:50::25)
 by LV8PR12MB9418.namprd12.prod.outlook.com (2603:10b6:408:202::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 07:13:53 +0000
Received: from LV8PEPF00000060.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::43) by CH2PR16CA0015.outlook.office365.com
 (2603:10b6:610:50::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Wed, 9
 Sep 2026 07:13:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF00000060.mail.protection.outlook.com (10.167.245.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 07:13:51 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 02:13:51 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 02:13:50 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 02:13:47 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join capability properties
Date: Wed, 9 Sep 2026 12:43:38 +0530
Message-ID: <20260909071340.3649271-2-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909071340.3649271-1-shubhamsanjay.patil@amd.com>
References: <20260909071340.3649271-1-shubhamsanjay.patil@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000060:EE_|LV8PR12MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b8ddf7-a8f2-4912-8c73-08df0e41e6b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|3023799007|18002099003|22082099003|5023799004|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	9wk93HwuZj+IA37HEak9YbBaUWnMZ23RfHQ1LM48fyvifYQiVK3ZQuPtCJaqopAtbrt0XTGq9SexB5xhuIr+z9iqE2t/LOEMoWbWMRa/fHeFQMF2FS5MydZRLxsJvy78RU4GZ0X82xRlkQiX5anar1KGqOyMJP5PiQzkwKkAixELU8x7mC5mBNt9oouhup0PolDX6ux1dGkdCxOUzThbXmeJNoFYdGb1cDZ8bYf+DQguwP9vGXY4AoxcsqK/hECKGzGryeGeq9ccxX4ydxYm3GIsWujjUKk6/eGug3B0JhZT01HgXQu9TGizKvbbNfi/ANZaJXpzjxBh2rzzYk2nLe0p8HE6Q4nuX9cR2z/7qOm1tkedfcfvpWEEadFE7lNHrDtDmeicUX2OIcpdtaQ2td815Mifd+oftYy8SSVTjOoQHGq2suw/9pQLHbdAgLsZYeANj3An3BkrNatxQSsP8y3PvIjZD+vA/I108dvvnJC4xdWiwoFARsmU9uY5l2jE8qNOYEwPSzAd+f9j3SZfQZWr9QYGtP8wMr1gZ16ledBpuE3K9BHLS6nY1HfL3mLEpBYvcYV/Boie3H2SYRWym1mtmYaLE2t08HKlA9tW9OiARViqUa4u5D1qReHUbxyMkl77EnD0UGHWwc+b7Ij1/G354GxLH7UXABsUdBmlKGL4Yfshujuc5+g+oY1leRu7S1Havw4PGX/UA25H2HVNPw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(3023799007)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TL/4jxBxxnJaYk+PExg7XGT6iOWUD77hFzdr48YETaVkqeqMvlQcz6dK4Z8ihkLmbG10GTI2hERksYjzYtTYm74IomKUGt5bqbOqAmBIJc9HWaqf/9XKrdLTUhq3cEztZwZSNOb+qwpGggyzDMLz1rkLTiGyBFVFyQMbMTv7cEl32yb/GqOI9S+p2WX9wR6oUD9Mdlc17yUbiR468Hqzz4XkS2+kgRnC6zGuXDuNclhzDCtOTGPgk0rVagyLgKFyIots05QhGWKDdTEKITN3BnZm4wIn9NQUyOHfJxkSogEACpgK3wIl3vhnRmCaX+Ig59iz7BzuOOjp0MMivbr80IRm/CN2/ABevoklpuhh3NM+6ITT2T0CVBYtpAqQoCZDut6wssZOdgCZ+BKZkKWgcue+84awsX3PCb00sBwiWCo6uBMSQYYVJa9iExjyT3pX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 07:13:51.5667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b8ddf7-a8f2-4912-8c73-08df0e41e6b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF00000060.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9418

In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
IP. Describe them with two boolean properties.

A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
capable design is always IBI capable as well. Both events are reported
through the controller interrupt, which is therefore required whenever
the capability is present.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in V4:
- Restore v2: keep xlnx,in-band-interrupt-capable and
  xlnx,hot-join-capable in the AMD binding. Do not move them into
  i3c.yaml.
- Added Acked-by: Conor Dooley tag.

Changes in V3:
- Move in-band-interrupt-capable and hot-join-capable into the common
  i3c.yaml schema and drop the xlnx, prefix.
- Keep dependencies in the AMD binding.
- Update the commit description accordingly.
- Conor Dooley acked v2 with the xlnx,-prefixed properties in the AMD
  binding [1].
  That Acked-by is not carried here: the names lost the vendor prefix
  and the definitions moved to i3c.yaml after Frank Li's comment.
  [1]:https://lore.kernel.org/all/20260824-tightwad-impose-495476599087@spud/

Changes in V2:
- Rename the properties to "xlnx,in-band-interrupt-capable" and
  "xlnx,hot-join-capable", and expand their descriptions.
- Express the interrupt requirement with dependencies: instead of an
  allOf/if-then clause.
---
 .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
index 2caa245a8656..a04becc07374 100644
--- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
+++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
@@ -32,11 +32,33 @@ properties:
   interrupts:
     maxItems: 1
 
+  xlnx,in-band-interrupt-capable:
+    type: boolean
+    description:
+      The IP is synthesized with In-Band Interrupt support. An In-Band
+      Interrupt lets a target signal the controller over the SDA and SCL
+      pair instead of a dedicated side-band interrupt line, by driving its
+      own dynamic address during bus arbitration. Such requests are
+      reported through the controller interrupt.
+
+  xlnx,hot-join-capable:
+    type: boolean
+    description:
+      The IP is synthesized with Hot-Join support. Hot-Join lets a target
+      attached or powered up after the bus is already running announce
+      itself using the reserved Hot-Join address, so that the controller
+      can assign it a dynamic address. The request is acknowledged by the
+      same machinery as an In-Band Interrupt.
+
 required:
   - compatible
   - reg
   - clocks
 
+dependencies:
+  xlnx,hot-join-capable: ["xlnx,in-band-interrupt-capable"]
+  xlnx,in-band-interrupt-capable: [interrupts]
+
 allOf:
   - $ref: i3c.yaml#
 
@@ -54,5 +76,7 @@ examples:
         interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
         #address-cells = <3>;
         #size-cells = <0>;
+        xlnx,in-band-interrupt-capable;
+        xlnx,hot-join-capable;
     };
 ...
-- 
2.34.1

