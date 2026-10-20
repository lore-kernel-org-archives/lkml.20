Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792489010;
	b=D305KR2yM5GGkvmAm9M0MNJQT/hAivvbAFYCE88L57v5/rRrGkRJ/QOR+NkYb0Zof8HF
	 0l865FzudcYcUyCdG1/UERxbRsVZ+88m/ZvrvfVtS5lyu87TnAmKYzeR4Nr1NXAKUnra9
	 TM5e7DJ4ogZvvApqlFTgZnvOYhSB8cazwFR2wzHLJLhh18gZkGeRroijB78ajgVZmVDsE
	 m+f4N1MMqxy0d9Ele97TEL0ofeWZ13SoGxYLwfEnbBQYjbHPBzb0E3lH/4hTlJMGxcCgJ
	 jikfH9Va27nDNhBzt2GhCq4t23ZttX5iitVgk6+d454+xXZRasXglWIg/sV+TY4VjcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489010;
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
	bh=LRx8UvWVm9ikAdxF4Wgsmj+ch4zzS3+JSv2XCIzVAzQ=;
	b=l1PqhnN+lGpaVPY1v9AZrAczmjAuk2Q011fXN9RBLK/Rk6JxMwxKGbNuNs07/KJbgqID
	 LP5fE63TLIswLxt0x8D6X6OpRkjJBlED02FG6rYagcfRH3hQLAEH4lbbydwJZXOxFu8m6
	 pKRpAX5l2jR4pcYJPvemDEZzaMouh7HC7Y4+0EaoPvi7lCzzqxD9WUSRjQwnIsvrq+Vb2
	 vx0miSrG6CnjILzoyV8pe80aiBZsburE8xH0Lvy8rqtKgXLHIXFfiDZO3NadH6iVAa7dZ
	 DTFwvFZkw2eHdXruG7ruicnV7qMucsjQ3re1DyRuSpjzfFP3LcUi+XmERmuBcESbfog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=jqRThY4Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.17
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010017.outbound.protection.outlook.com [52.101.228.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444C7606A319;
	Tue, 20 Oct 2026 09:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 444C7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=jqRThY4Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDcfETciTc3C/pc3q/jbyxT3Ve8+2Ls0Yql1g6G+48ZYFqxUkLffiPM0cM9AVtilaLb858weE9XRA8mZALt03F+zL6ZTuUJq8WEjoJ7kr6NkBvpVSVzC++hPDlvZtczHKexSZ6DQ4yS6wWMyY1iHgyFY7/cRyQkWTvOkErZU3lm98LlazvbExPhaFz/OiUA09AMJo8GneLmyFyW6ZkV/OB1Lm5owV82Nn27cVkju459FmFCgPC8qDewfIlmV6GNwMffaO+w9BasXREJvoK29imTg2+yaZ/CZ7exW+8XpZ8w5ofu83vEu4VvHvLAVNeqlh0ORHcWyQshUKq/kGeLCKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRx8UvWVm9ikAdxF4Wgsmj+ch4zzS3+JSv2XCIzVAzQ=;
 b=Xm5eqCTnTa952bnS8Ouy3TQuFOmPFmf7yn5lBJIq1groa5DiYga5DL9hA4xq53o1trZpC4DN7tp/Ga6ofWOZZwqFlFKDNYMU2UrYsiwwEByUALkf+yMjmAyt/KFxP3fTWgknYejJdY/WEnCjpkIf5+VMxK3q+BYUtvXTpRV74Ibmvqa9e+yCqBg97H/6jga6CN5IQCdP5QlgqjApYfWIXTPABwNj2EgSndrVCIqQVZgWvY4OteLoIJHbpit1MJU/iRuLCr52W+lcbeN70bfu2VuN+MrxmK1TBCtxm8JSF/GiLORc1pTJTUiPVN6BP1guG19JeLv6LhkzT3T/FakdTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRx8UvWVm9ikAdxF4Wgsmj+ch4zzS3+JSv2XCIzVAzQ=;
 b=jqRThY4Zi2v9VE84aH45TH55N/GqKqUYC+03XtxxtXLbrjJCnPGY4i3Ju4zGMmcrnGNzqjjix5Njcc0HMLEO087WYWrk3VelWuv1mukjHCX3JKdWf/uOtuT3tq0AT/O9Lyrtgo/JDWnjIckC7ApegcPSmQmOb0DALKpTqQAli7U=
Received: from OS0P286CA0060.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:9f::11)
 by TYCPR01MB9643.jpnprd01.prod.outlook.com (2603:1096:400:197::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:36:44 +0000
Received: from OS3PEPF0000003C.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9f:cafe::11) by OS0P286CA0060.outlook.office365.com
 (2603:1096:604:9f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 09:36:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003C.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 09:36:43 +0000
Received: from [192.168.1.82] (unknown [10.226.92.108])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 3F93C3000250;
	Tue, 20 Oct 2026 18:36:37 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Tue, 20 Oct 2026 10:36:26 +0100
Subject: [PATCH 1/3] dt-bindings: i3c: renesas,i3c: Document analog noise
 filter control
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
Message-Id: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-b7ad60cde650@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792488992; l=2002;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=OsDiHkQl0rNMt1LGCUhEbRtyt6e5VPNbctXsKp+X02o=;
 b=smyVoJdPHfqph2Te6ToODkhqHxct1+T59mAwriNOr/NvP30fwZSXcKEw3n2tX7/8pP9/tpipR
 CT9bBXmu+TqBr6igJHpXRoNUfTf08PZ+nz8RkEViKIGC84KTJNvRETd
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003C:EE_|TYCPR01MB9643:EE_
X-MS-Office365-Filtering-Correlation-Id: ace5554f-392b-4ae5-3c40-08df2e8da6ac
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|23010399003|18002099003|10067099003|20046099003|22082099003|3023799007|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	1FG+xykS+7yhynU8TARs2XiR5G4hU0kTaM1AsBl8ClOB955Y/5tpdmOKT0IvHSgoyrtkz8lfoSTgr9RXXI42TexW0lg1zw274+T0ORKZLKArKm8T8JT2n/9I+ZrheWCIn9sfV50vcoBKMh9AC2lJzLWBH48vO/93iwAcSvX2ltOTMAsiGVpW46kajNNxrgas4nM1ehYWold2oA5DQeksmpoODC6SRmbG4nNoT5Y7ARb1HbQffRgPamMlZP+Bk3iN8P1b/muJHSbNwIgjV/c/qnl2/R/V6mR1jFUGehd8UzwpTr7kCZIaYBh+DbWYbE568fX0zwkXLD1IRh+oHoTkL8dV87bgHawLEMnhoCc6+x4JHVmeToPDFzONmzMDRKezaKM4GZIpkAbtr/MSB4gZMw5+kpYGZrLG4Xf3kgM2FUzoDd2LHsVlDuBATSE3H9+/bIeRZMzKV1beUZ2xZE+aO0vSwJ9v+4xNEbzaAdpmZHoOUVb2sPMd/eqckYH4l/+aEuqBXTfFxwDySgUHiFyI59RuJLm2+Kvre2vwu9XVjPfE1aI/8AYyvvfpmDKGgDacR5aMABgjsXn+Nqu96ZlPaT2Qz89G/vcn4eosuZKwko6ixqjXZxP4PyWMw0PlsP2siceHNT8SHjCNjBdq/eP3qj1+4KqcbpTMiU3Ai/NRVlHnZOR6YPiW2Ts87oJkGVZ+xwIPKF5edZkqh2QVYYL1/Q==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(23010399003)(18002099003)(10067099003)(20046099003)(22082099003)(3023799007)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CrhPPnB6us3SQOtDPQr+jVd0oVTr5xkRUY4RLlvxCzw4mhnemnKvNksZCnz1SpJIjtNaZnCGV9yPmFkTLqNpHyoQvwohvofjLu3/rZaASrSdpxyUuRvQ5SlPbUdu9AgQbzr60Cxa0eHvrXJfCeTlsmO3H0rgnPc5oWSU1u25YLP/JKqkWOszWEnsFWvkq2/28jdTvb2i53PLtFjKxQkqnHSmrK3mF6rNSHcYiEsCZl4QFr9qGxJ+p9nP0EInDlSYw1KfrjlKq1d8dMjxjx3cO4VI2kHTIH4ptT5SaPQ/XD9AtsUmI7dHHsyjVnw33ku0NK6pKIPCrNd+Kt86OPEvdTMUfLOjBzFaiOcXaAAaWFHbuP3B43y2E2+HLz8VbJnsYew6YdGiWUHweGP+trzsgMN0J9jwvPztrscCLXbXcMUiWU7guvKvEFRvgu59xW23
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:36:43.0850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ace5554f-392b-4ae5-3c40-08df2e8da6ac
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003C.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9643

The analog noise filter for the input terminals (I3C_SDA, I3C_SCL) of
the Renesas I3C controller is controlled through the SYS_I3C_CFG
register of the system controller. Document the
renesas,analog-noise-filter property, which references the system
controller together with the offset of the SYS_I3C_CFG register and
the state of the filter: 1 enables the filter and 0 bypasses it.

The property is optional: device trees not providing it keep the
filter at its reset value.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
 .../devicetree/bindings/i3c/renesas,i3c.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
index 08fcea89a015..381807844351 100644
--- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
@@ -96,6 +96,25 @@ properties:
       - const: presetn
       - const: tresetn
 
+  renesas,analog-noise-filter:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Analog noise filter for the I3C input signals (I3C_SDA, I3C_SCL),
+      controlled through the SYS_I3C_CFG register of the system
+      controller (SYSC). Three entries specifying the system controller,
+      the offset of the SYS_I3C_CFG register and the state of the filter.
+      If not present, the filter keeps its reset state.
+    items:
+      - items:
+          - description: phandle to the system controller node
+          - description: offset of the SYS_I3C_CFG register within the SYSC
+          - enum: [0, 1]
+            description: |
+              state of the analog noise filter:
+               - 1: enable the filter, performing noise reduction on the
+                 I3C_SDA and I3C_SCL input signals
+               - 0: bypass the filter
+
 required:
   - compatible
   - reg

-- 
2.56.0

