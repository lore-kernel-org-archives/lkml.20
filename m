Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013058.outbound.protection.outlook.com [40.107.201.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28D451C34C;
	Tue,  8 Sep 2026 09:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860605; cv=fail; b=ftVBp6sKQ+2Zn/FtAnDxdIwWiFHfBIyslE1nMJ6V8dMxi8FIeSSnaUcmJgG87w199gYG8uQL5wmebbtai2B1XH2GnCwxOwJF+aK3L8qMQMYALgszGBJdgnsz1liIEs67EyPstuqtZIOY2JGwRS/oFEMfsjHOpvLk0lgjrFBnnaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860605; c=relaxed/simple;
	bh=UmEHNH821REoxQqdB7TniwI2HP2EEORRPpUHFiScbzA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dfzKLaY3RmyMJiu7y23eeSzsU7oYSI3D2uChegsxClSSdl3SK7krqLLz0aQgjHZDN6AWtRL0EFY/jDzQwrBTl/XxxWq6TSKOVyd9UnIhEQkCuhuok06PkezXumzeQyZnXCcBuLdft2zVRsVAEZO5cUCHbBvan767XQHnDWLncps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kk0KRo0z; arc=fail smtp.client-ip=40.107.201.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kk0KRo0z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sj87TWojT0yLOoub6rMzF5MGqqi7enpszQwWR7iaBGmUKXfD4BdjWMQ+Ew/bOFAx0fXy5eMHZ05cmjOeYq2xNA77Abn9XRrcLGQesxLFr75lG8fyZdHCZIjsJolcu+SMCEH85khWeB/sguU4F4usLvRd2MqJyyQbqQ7wazJzsPC0npjabYl5Pbg6tF8oczyn5v8wblqyl1RtFPQCMS6ts+tu+j5BFve2sjGVMnDw6VuLMrS/Mg+H8hj1K8iRoPRUdoOkKRxe+gyZZTQNfrHlVZiD4pYo1tP0jPfM84RheQc7HIB/kS+AexklN1G3/htyy2aPwf/qUxA3Y3c7CPBhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ptp2yyYHbK9rkGN25INB5RZK/LbEgV5IOWRTzZFuF3o=;
 b=spMcTZdK0yubKEsYEI0RPrrTFGwnEM0c5WEYFFpp9lJYzsMqbnT+IYtsr8i/UGNk5Vv86XDEBOq/pcVgxhmjnr4zoMJZOzT+sfkjo/Htrl2dQDtHoaz5I45FNl3MQjhdSmPzigBPKlaLSnoQ5BFGwZ2+1WMrj2qnH3/HDcj4oSA+Hn3p+yuEs8mhSUlHZ45jUdSgUs2M4KqN1rbrJNAfpmtJ1qqG6Z3opH5vbRBpo8SCVn6RsgyqypSdrP+UjfrP078WlM9FwdAGTIWn/Xue5sNiI5oA7eku3gIQFqHx+K2PxwlW2n8FrK4XqkfxZlNDp5pZdlq2CjUwYsmcAkb2Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ptp2yyYHbK9rkGN25INB5RZK/LbEgV5IOWRTzZFuF3o=;
 b=kk0KRo0zQWPZ8EA2DIhTgVHT+q3f9nKz176vJmGjZjpGObX4AT+ReA/mhzky7ZDe8rOro4rvlIu4KIL6dKqyLA2R1PabOtAvsEk7IYOSS6dk8oGad5pYooJ1krzaDu74vvuoYodbXQslZ8cYeFWYJizz5A/LpMal/jRhf6cbWwA=
Received: from MW4PR03CA0258.namprd03.prod.outlook.com (2603:10b6:303:b4::23)
 by BY1PR12MB8447.namprd12.prod.outlook.com (2603:10b6:a03:525::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 09:43:19 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:303:b4:cafe::a8) by MW4PR03CA0258.outlook.office365.com
 (2603:10b6:303:b4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Tue, 8
 Sep 2026 09:43:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 09:43:17 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 04:43:10 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 04:43:07 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join capability properties
Date: Tue, 8 Sep 2026 15:12:55 +0530
Message-ID: <20260908094257.3196120-2-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
References: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|BY1PR12MB8447:EE_
X-MS-Office365-Filtering-Correlation-Id: d068b1c0-6919-42e0-a675-08df0d8d9cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|56012099006|11063799006|5023799004|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	AUzd9yImmw31pSZBkaGKy8OKd3yY1Ba2KZ7+7ld1D26VRs/m9HAcDEp0Suq3ZDThD1dJuP9TxjpiIhLIlL5KkZXfLYGHzwLaTpzOg3vF8v+uclGZ8oL+xn9G17Rv3bWXiQYMhLJE7rmOvyblkW+D+DrIB6gwVgrtysFkIdgJ62kwd0EgZKa5QF3kxWlEfxOm8pDfaulmc9wn16wABCjIFwRpNe/0T4eETuXHfKEbWHSj/Gy8SxzkySgv2iNLLu1BZLNPEw6mxJCv6IYDkKyVNrG1G41fA6+qvn1UQYfeiJgRIenbZ3iRxhZr/JX1jJXeHl/cADU3GIlH6fsyR99RMNEO2OhaP9lfKP9DVlR1JycViWLJhlgmj8rWM9TfXz0M5QtnJQLu7JEhmxEqoESNmXQ1p43VdVLMiUf621fdJ5Kvad+WRN2Hu+8MaxIjHwKPsvY2UKPucSQmeHQOFdSb3iuwTEjpV8qamKeYviDWrW1cYlBqufFbX8VOjPvzybCg99y4RPW43I1NshG7JlPLcDPdwyjg4Al/HcBbi3kgoZH4WBfqN8s5/EcqoVVhOmSow5l+hJ+Pb+V65R8/8nxKYReUva4YAdnQYNCBlTjeH5y2ZOvg5RU4ty4ceiicSRXodIsT1RA0fwqbE/l2AF4ZYuCFK1SRjSNhFbxo86iYVEzODMpToieWPnsAZisQZBVTRZVFpGJKQ07t5zMf2LPUBQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(5023799004)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x8HigtpTDItquTp2CAP6Djx6gt4aqPEHQ/s7kU0zAJs5JWuylHOlxJl6QEE5tlW53BQETBELQyHUOOV8700CUy4/hQMqrkk0uOA/wer84u5+vff1pSUn/wapDL06nsC0p+UvP2Ig6gfnmyjnWHmGUC+v/HCwamIjKedkhIkhCe1Iayq6bmKvYax18oJMZNbXT0Vp+Iexho3l2uqE4GMrXi6dVqvIQYyInGNUsex31fP5I+u+NCxwtckpDLKIYcypDBshGTbtypVsTHIkbMhCWcXfZJ40SvNY8S8mDyoQsZjwjezuEcXfTmgtYqUCU2wnJlHBCZCqwSliMSyHGwp0RnixCsP49oF+4N4mnlMdZCB+n8NDNmI7ZCiSwT3DusV5x+enGqy/GTGZ/V0oVOMVurO0PH0S7qUlB+CAZc6x4UW9lBK7dhYwq0cUu59Hi35z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 09:43:17.9111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d068b1c0-6919-42e0-a675-08df0d8d9cae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8447

In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
IP. Describe them with two boolean properties.

A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
capable design is always IBI capable as well. Both events are reported
through the controller interrupt, which is therefore required whenever
the capability is present.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
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
 Documentation/devicetree/bindings/i3c/i3c.yaml    | 15 +++++++++++++++
 .../devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml |  6 ++++++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
index e25fa72fd7857..7430394cc6b9b 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
@@ -61,6 +61,21 @@ properties:
       Indicates that the system is accessible via this bus as an endpoint for
       MCTP over I3C transport.
 
+  in-band-interrupt-capable:
+    type: boolean
+    description:
+      The controller supports In-Band Interrupts. A target can request
+      attention on SDA/SCL by driving its dynamic address during bus
+      arbitration, instead of using a dedicated side-band interrupt line.
+
+  hot-join-capable:
+    type: boolean
+    description:
+      The controller supports Hot-Join. A target attached or powered up
+      after the bus is already running can announce itself using the
+      reserved Hot-Join address so the controller can assign it a dynamic
+      address.
+
 required:
   - "#address-cells"
   - "#size-cells"
diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
index 2caa245a86568..9480de3fe8e1d 100644
--- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
+++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
@@ -37,6 +37,10 @@ required:
   - reg
   - clocks
 
+dependentRequired:
+  hot-join-capable: [ in-band-interrupt-capable ]
+  in-band-interrupt-capable: [ interrupts ]
+
 allOf:
   - $ref: i3c.yaml#
 
@@ -54,5 +58,7 @@ examples:
         interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
         #address-cells = <3>;
         #size-cells = <0>;
+        hot-join-capable;
+        in-band-interrupt-capable;
     };
 ...
-- 
2.34.1

