Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FE24C224C;
	Tue, 29 Sep 2026 08:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671758; cv=fail; b=VOHWHPJaLkOMWQdXRSLlP+rtqBkqy4J/USKQtZKjbt4aqkjFATdXwCJAH8w3gYzBqlh9gLVrd7MzkAvx0XWrM9isW/dYK82rlpfehpgvfEYq09vbQ2Fjq+TmvUy9GNH/g3xezVSURjI6ZqM/Kl+XQgl+3pAYEutgv+Z9dIjFYHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671758; c=relaxed/simple;
	bh=hM7YNo+QahG2i8+Ibiv45XBkWtXGy+XAQaAAxvA2TIE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kSIhA8MJbwEUa58RJq5vBHJDR485utHoIamKmKeAOum4Ea7hGjjlV0ynvX+zahrwM15SIDrtPIJJz1Qv1JW+79+UmF9Pgdcw1Ub5TkqBmlwDZNyjcQwquuRyf2T4wFGP7RhUqRzFkWnkewx6HXDdnU7lwJXQMcrGoQdtrA/lSNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CEVpMxXl; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CEVpMxXl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ve0Ra+emuvDO36jS7tOMswX7D+I1d+4du2GKljSAIvMLmmJ4LNizNDcfzmfMLwvLFo6/13qA16/FAf4xIqHArnyYLlCvbReBJPNnlzqiZxpeXakaNpivUf7Hh5XH0OPyjwe+y61kzl+JAmiFg69JrLgmwHX5FxbB0DKWX+ANaK/KnBFdkZaw/197eXeu+3fj2zBXXgv20iUYPkdbb8B8+8uAcDCkN7gLNzT1mgHIGcH+iILh/977chKfsLxjXq0RJdllhTufkJI8WrW7icTFWUc7roCza1APIXVca1h8nCTVlSFv5DOk4MP3SY/c90WClhR8+IkPdKyrlr+naKZrLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVgCD/g+vxKKIKywtDNm/X1sosQg2B5HwQgIkq+yIYI=;
 b=mHBleMliqhtLC7EXQsbHgH/4aO+09zVx5waWhVA1kAWFPjuYczJ3VBOfJmsvi+5ndnxHl5tcZMjbdccLME9iHlWLbczCPzuqb8FgO9aWNhXXAQCA5TEltzrFf29VA4vJ0ipkiW1SZ9njavdiq57PelURQiTmvmKchaUOB8ZSThBspGRR06aowdibYsRV26s9qpOEoLNfTdYNyMxdRTFSBqaxD5BI4XXtmkCiRVUKZi2JZfsZOmVVnHUCr+aUSwVmkmVwv8rL+8dmrlOQfvNoymNJ87A8V3l1PvMKFatj1B8VItg6vnlsY4f34PjaFO0bCdQ0uUZclmiiDIItTbQDkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVgCD/g+vxKKIKywtDNm/X1sosQg2B5HwQgIkq+yIYI=;
 b=CEVpMxXl4dzzjUkf0FmGlCcadAy2echMWDTjMK73TRYpguvMw+Zxk+SRmSltgMjv9ER3Xrnz8HJcnq+2Jq16wpEdM0ZOjZyl5DDu98PH6ENqmzshBrPNpvG0Dq0HuLHtMe1g/uXXxHm7WMeUZuzhZjF8MhOqWC6/mx/ZLyzSQsgq+R0Z2X9E6mxm1wb+iYgeXKYDZBIVUNuyQIcET8gATWxL8J8fviIC2PemkZQOz/WDyjqICNkeLBhjfaijc0fz85uX2QZhWPqOv03srrCaxWuBd094GEtPBjZ3b6RLQO1h1XLqUlEA6o/zgsfWAVcCNvips1c7RNy6DJwW5dMb0g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:49:03 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 08:49:03 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 29 Sep 2026 16:52:30 +0800
Subject: [PATCH v4 09/11] media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI
 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-isi_imx952-v4-9-e69f89c7c651@oss.nxp.com>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
In-Reply-To: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790671948; l=1620;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=hM7YNo+QahG2i8+Ibiv45XBkWtXGy+XAQaAAxvA2TIE=;
 b=Zb5PI8uBQ1Cdnmr7Newmq/m4Ogi80tCBAL0Z+DHCyZ2oGOsYTnKjtxGZaLqWVLeABrbxTvwHd
 ThvhFYg2gW1Dp96wu2Cn3yj0QpoMxFvILtxH8jGRNgw4IXrqKT8OwZg
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2P153CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096::27) To
 DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|AS8PR04MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0bac58-c796-4a33-e70c-08df1e068377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|10067099003|11063799006|56012099006|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WdFl2XG6SKTkH5IpdFMsyzfxAMnvXm2eS/TnH/FLQcuKIIA2p5P6rxm1Pq1IoZqmMiZxA+ivT0evq7i4liOIxnhQRfVBnIicGNMmL0VnGcPPJ9xsuI1Wmcui4L+C/xypdR++nm3pnnNJmUDNwhOFzJiY1O3+F7whFYmiq0pVqrPTntT+saMasxtE9hHtIvwRPAQqK/c836i6LpLb6rbAl9KNiGjS5OKR6RMcwHdcMhKzoXwl5WVPrm1k2hFSo8X+mZnsR8Xi04d1xNNGX2VduubodZfIlSVg8cT/JbIY6EBGs+G5zIU21p4ctPRBS6EX9rDlp74o8+vGgeLcAx308VXSX4TmoalJs6UKk6KUKdIVbJQmiNkOw+uDQRRJUH9O0PNTjFBjIA1HxU+vq0/z0/jbSuJEnb1fvXD49+p1K/T6oiGJ63lHHGkN7Ja9f/yRp/yFiBSXFd0m5XnQikJBTGcplvktA7cnnK1Rfdvk6R6WY43UdNbRJK+PkOSwQTF+i2eDmRpUeP7ZekpSYYY5TwOjoVdXCEb4e9PUsP88xnOSdq1efJfYmUoeT7BOIqnCw/yJYNJryytng877KuMxycUCxABTw9YnRtRe2bbBabxlWNOr7P/3wsUPIQUzOfHcD+U6Q0Qd9btBmT7ieooy3iK+dSBZu4YzClLE7X44g8Pk6WMdWPzNsTu/oCud96Qr1/CPVkihFIR0QMMcqGOF0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(10067099003)(11063799006)(56012099006)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHpJTHg4ZEV6elR1TU9tSjdpVjdYSDN4Vy9rcHZKeEE0TEN3b25UZUZ4OHZh?=
 =?utf-8?B?VENxMjdTeEhvUllEdlBuQ0pOLzRLdnVESkZ5MjZpaTlIWjdCNkUvOU1wK2h5?=
 =?utf-8?B?LzVnR3ZhYjliaTdSaEJMak82ZTVzUFpIOE9SUGRqRmhqTXFGdEMrTTkvbndG?=
 =?utf-8?B?VUNJRlZLbWZncmt0MS9yeVN6N0lKSERHRjBzZ1hmZXYxelF6b0tsVng0Q2lq?=
 =?utf-8?B?UWprMnhxbEh4a215b3ROR0RUZ21OeThTMEZPZFJSK0ZreDRtYmk1RVVhVFR5?=
 =?utf-8?B?ZmJtcWh3VDZPWnRxZER2eWNQeXd6VGY2WklrcndMalJvWFcvRFZGNm05OEo1?=
 =?utf-8?B?R2tRemFVRVp4SXJPVG5hcUd2TXRNb3ByY3VhU1FTS3RQeXdnRkZidzlPNmRL?=
 =?utf-8?B?L3ZzUUZFcld4U2M4L2hDUHp2OVVMWEM3aUtpdGU0ZnB2OXNuOFFtV0lBMTFY?=
 =?utf-8?B?SFg3OFo1bld6MWFnYnVROVVVYkt5UktrYUZXKzJZbHlPUzdIeW9HN2RKbzZr?=
 =?utf-8?B?ZFM1NE9UQk9pVUc3NVhqb0hWb240aW9VYmRVOHRyWG1FaVlRSUNYWjdWWkV6?=
 =?utf-8?B?bUhzVEZZSUJKQmN5OWNxakRNeXFIbDREKzBCRk1EL1N5UlB3ampUcWR3Nmk5?=
 =?utf-8?B?VDY2dVIvMGhnRTdhemhDOXF4L05nRUdXaHN2ZWlidThWd2t5a2E3YmQrdG1Z?=
 =?utf-8?B?TENoa21ZdmMzZHBGY3c1TzVmZEM4L1NUdk41dzAwMFFCUm9EUkliVS91ODJO?=
 =?utf-8?B?dVhOdTFZL1pOTTd0eEFVMnNtNmFZOWw5MXZyVnEyS2QvdmFZeCs2bGtITHpB?=
 =?utf-8?B?cUMvRk0wQy9yWS9rN1g3K2FBZE4zNG5EU0ZLdWovUlBqVi9nNGI2M3dGb2hz?=
 =?utf-8?B?cDAzblE3bFFJM3EvS0FEaWNETHE3YUVGaC9aWE5mclpmQ2dGMzB1Misxay9W?=
 =?utf-8?B?WmZGa1ZhTDAxOUFlTG9tWE1rVEFPYzlPTWFrYU9vM1ErWjAzcTcycGN6dUVu?=
 =?utf-8?B?WU81YjMwL05YWm0yQ2ZadHJuOWpWVkwycHhPbjJXSGh2bW9JT09mOG9QaUhC?=
 =?utf-8?B?Zm1FWnFDdS9Vd2xRVE93YVQrQ29HS1d3U2g0UkZZRnBWc0dmSWdmQWhsenVS?=
 =?utf-8?B?SENsUkExaU80TSttenZxdkpqWlpXY0svZy9WaUdBbWtkQ01YbzhlYWVoUjYz?=
 =?utf-8?B?Uk5ZVTZCM0psSTdTQjRZN3lSRGJVcysxeFdXWmdXVlJQeUxvZ1ZNd0I2OXJo?=
 =?utf-8?B?OU5wUzB4Vy8vanJTVWxzeS9lUkRFcHAxRHphYm5acHl1OEFhSkdVQzR4QVVU?=
 =?utf-8?B?MWZab2Z2TkszY0x0MVdIRUtFVlNmdTJoOVpMQzZZMkF2bE9XN0lmWDJUdDlu?=
 =?utf-8?B?ZVNLWWtlV0hqMzZ4K0R4dG9jK3FRNW4wMDUxWkVCTUF1cml1SCtmTVZDVzFR?=
 =?utf-8?B?UTlibFZ5NkxoU0YySldHMFhZZmw5a25RWmFQT2haaTc3NkFUUVJyUFI2V1hy?=
 =?utf-8?B?T0hYWE9MQS80eWR6YnJVN1pqY2lJS05yallRb3FJblJ0dGVpa2dlZCt5TzNX?=
 =?utf-8?B?N3oycWZTbkE2U2F5WjVPTEx6NnVsblhTL3d4OGcwTjk3ZGUvcG4wcWFOb0hF?=
 =?utf-8?B?Q0ZRREt6OWVpY2svWlo0enZUOFRXSXMrd3Q5NnNPZlZTZy91cWdEOEdDdSti?=
 =?utf-8?B?R2N3N2FwdlVDMmFkeXduZEZCOUxQZUsrNlUwa2U3Y09nVStzOWhqdlhhdm9O?=
 =?utf-8?B?WklBWXB6czBhRVpuOHlONkh5L0lCVWFoMlE4eVRJcXVKSHByWW1lckMzU2Iw?=
 =?utf-8?B?QzVDK1ZseWdYYlg1M1FMTGJONk5PS0pIT2hhNmUwSm02ekcyZlV0R1I5ZHpU?=
 =?utf-8?B?Tmh4V1R4TkRRejhPVVBuUElKU0NLWHd2MHJVTFYzb1lVSEwzK3R4NnBqQnVk?=
 =?utf-8?B?MVNwQzJ3Wit4YlBodVdpKzVTTWpjekJ5Z3lWMndGc09haG9oUDZtQnhnVkZL?=
 =?utf-8?B?SmN1ZjkvVXFtQVRKUHpTOFI5QUVmQm13dURldEh6cVJMVXhOSU1CYnFNWmN3?=
 =?utf-8?B?VTVqNmtkZk9lb3BQRm1iSzFMeHRIcmlvT0Rqb01xTXNGenJ3K2d4U0NKUVNE?=
 =?utf-8?B?bmowZ0JNRERTY0txdUVOK0RVUlNSYVVBWmgzckFJZWFIcDIrV3BaamYxTzZB?=
 =?utf-8?B?OCtCeWpTNWpwLyszVWN5eXZWbHJEZHhNZHE5WXJTK04rc1dvWjRJcjdSK1Fr?=
 =?utf-8?B?WmVOQXVEZ1pGYmdLaCtxMWFzbE9wSXZqUVNWck95dE9OL09IaEZlckhOaTU4?=
 =?utf-8?B?Mk91Q0J4MWhsaGgwK0RtR0E2NXdiR01tVHltQzQyU1hBcDNJOERrWHJ0VUx6?=
 =?utf-8?Q?IaCDjEu1eJwAyzGqQv+0AdxFQh4MsKgP0rfXC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0bac58-c796-4a33-e70c-08df1e068377
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:49:03.7378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtmhYXBlp2a0G4/iRcCsYWfBFLy946jkB2bG4BIFfUBbYRaIa31ekr8xX1zV+rrg8zYMTOUW8Mqi2UK2ToJnKubyvbwEspUhGsmugeeJ1xx7JCry8TEMMYTgvt9547eV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815

The i.MX952 ISI is a minor silicon revision of the i.MX95 ISI,
primarily addressing RAW data alignment. The core functionality
remains identical, so the i.MX952 ISI uses a fallback compatible
string to fsl,imx95-isi.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Add Reviewed-by/Acked-by tag from Frank, Laurent and Dooley

Changes in v2:
- Use fallback compatible fsl,imx95-isi for imx952 (Frank, Conor Dooley)
---
 .../devicetree/bindings/media/nxp,imx8-isi.yaml        | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
index 279c9cd3034a..d0a99f00a45e 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -18,13 +18,17 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8mn-isi
-      - fsl,imx8mp-isi
-      - fsl,imx8ulp-isi
-      - fsl,imx91-isi
-      - fsl,imx93-isi
-      - fsl,imx95-isi
+    oneOf:
+      - enum:
+          - fsl,imx8mn-isi
+          - fsl,imx8mp-isi
+          - fsl,imx8ulp-isi
+          - fsl,imx91-isi
+          - fsl,imx93-isi
+          - fsl,imx95-isi
+      - items:
+          - const: fsl,imx952-isi
+          - const: fsl,imx95-isi
 
   reg:
     maxItems: 1

-- 
2.34.1

