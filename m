Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEDB3BB674;
	Mon, 31 Aug 2026 06:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158911; cv=fail; b=Evj/GckE2Mb1NdibAU9P+HRsVAILmnSPHQn3sX4iivTaN8VGFiCVPMXkXBxEaO8UQGRXqNI93+A+wKeGabbEYqep8vyFemdjQdy8CqP82oFEvPrQpKuUwb0vKT1aYH2cY7sVJEhr5qQvsBDecC2G8Szl9Pyt1aj4oHWknKhpzcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158911; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JwPK1nZlsCU360JBZsLCk/1jwvAPYfxJzPmTj5OS7elXJwBuzsN93V5IUNGEpqHVb19FvAg9BK8g2wsPvqMafzLBHpJoIunQXXpqdQJYRgMVx6lTZPk1CZ5Np/mUJ9POtF23rZKm/nATs2TrykaS2gGM8zRoIyL+1DKlIGsCJbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RjIRoTLo; arc=fail smtp.client-ip=40.107.162.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RjIRoTLo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jT4vxfJx8FqmFygwa7lyz3JKIh0GSWS0wRbyI2etTteh2S7fBnMeWjNvjBNZsn9jrZ4JtI9D5uaSW3C/TdNeqRvd5qnydBtSgD6SolCPVdg0vgwnL7vq4lnmP18hzzrEt2Q3ze+knQGXUdp/1ib9Ln144B+Q4h+AHdO9gLTF5zDy1SZyCPF+ba2xQRIColJco4JfEaANFcAJ6b9KQctnJT0qwIz7JqrQOeGulkI26J77XTh/pbb8pXqGslpoVMJOX9z7KYMPGrbMu0rXntiHALv8ZBqyivBDdvdRsZD6G43NOlZCxqoLKKwKfzGxhmtDbz9CSOJFBUpAqJWs3D10pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=xvYzrtCCpt9LppxgqcG5CWJT9ZA9n/bhHcq7XDK5rBCHgzbe5Rnlevo3QJ9LodyJCjrkUmav1/yaBDqx5q0MuKAxMuZf+Kun2YEso30gJ65QqMu9bSuWVYFDpO6SeOtUIL3TfdF5tT8QAjxdgSyP91aBhSEjBCMbwzEx54EsKlgwcSwewR6HQwlXoVkVWFxG8t5xTS1Oo2t+RWJyX/nYyE16pPDuu3NPasRItgFRgFfwTX8n3JjUng19ysgIs40a2M/W/oEJjyTHq8D97koSoFMs097YeACKSRX2n+zVrMvJtHKc9DenFNEtLPS7dEj9dHZ2M2E1m81aJycVf8hj7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=RjIRoTLowhVZUVGj+Zr6h51duGl8u3wzNGlVgI53ZH5nspv0h+X2SzmNhRZOiIsrnYZr9BPqymW8/hTgGvGvZ49dJsuaBm4+b+EdaPodGu5vl9EvfUVn6BdybVJ6olgkIb4h7XVxrhdVsNkcKNgGCx/4o6PWHm3qM4bgv95X+4GqpwtY+Dd8SxtLJnDt3gLqyKXKktKnV6JteO0F/JsQ9opt0sRYhGfsxl0LFndUeiXfvtjmxi79JSTFE8qtwpbas7UGj1lts9eLPgI0KcgHrxz3UhDTcLGB1wOKhrsACm6IYNzM7XKNnub/9ui/KhqAwTfVLr6kzgZpJ0fAXh5lVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by DBBPR04MB7705.eurprd04.prod.outlook.com (2603:10a6:10:209::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:48:26 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:48:26 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 31 Aug 2026 17:48:22 +0530
Subject: [PATCH v43 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-imx-se-if-v43-1-a3deadbda4ef@nxp.com>
References: <20260831-imx-se-if-v43-0-a3deadbda4ef@nxp.com>
In-Reply-To: <20260831-imx-se-if-v43-0-a3deadbda4ef@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788178704; l=7403;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=vWb8/TRb9S9kQcv+glXcVwnb9UvtvF2lnCnPeXFFMxG0dvpp6Mr3jOsmZ29v7IsvciQpGhDYx
 Lt20R3ad8p2D+OOJf7PLZavHqb199ZWpmNeDS4nxJtB3RXBaTrXzZQp
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|DBBPR04MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 7736b64e-8b3a-4cea-5977-08df072bdb4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|23010399003|10067099003|3023799007|6133799003|22082099003|18002099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	FOXU+qrcwcwgv8SVW12GQS3zJCLGjihmvEpii4C3RS70JsVaBxIrjWu5YbIWXkQBeDxswoZ5QGnjb+D2O1JC9ZTsI7LVvvsZGcFOCCYNGSOOezyDDeF00vkf9dU4IucdTGx2IAcBK87SeA1+OUol6YdLsNQaoGl22nQStEU0VLk7IGvYCBLo8KasyOsBLIRjNMYIRe7NzsojAgbxmglcdg5NN3wohfppZm2+5c1iPIm5P4bORw/rL6XbLQWHmlMm+ToD4QCg4utNSzYYeR8OxtAH5+ywwmg1aDmbv1amQnBxKvDCCvOzcwgU9XrJaqJygbM7R6qCdW7ggj0dhVp8Pi5vxU5NUIfZsLzzXBxZ8ut3K1pFozaaMmaggUNFrYgxqnPk3aiuOe+amlwCr8IqLl3mQ+J8bwQOv1HjEegHbbltqxPtknJabCjhZVJw8S1tXzMMC6VZiOXAUSAS+DUlJdcFOqDM0RsQvG2urx/tUI1xFd7pTqqGQLrkPJOqcZEO80m929ArXy2BUMqg5ZElBH/oijIpNWVLMfOanIQE/U4sc9Hyqdc9QbsYU8jfzt2DLagfRX/K30019lBp8OpAnvFFUrc3JOd1EbjQDB2wCmz2PItX6nfUvf6cAV0Z0peAbxqU1xeVp6DyOeYLa5RXgVmBTBttephVlVpTQaWZeUM8TlOWo34nLMQ4EOB/HRVc0lTVegid4kJwZnGAG1yBJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(23010399003)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekZVeHprWmswTGRiUSt5eFU2VGo3UG8xNEJuSVQwdDlzakNCcEJSK1d6cklC?=
 =?utf-8?B?TFpldmlmWkxZTDZWdTZOSVc0d0tkeUtuSDBrRTFtQ0xYTDg1NDUxSHUxRUgv?=
 =?utf-8?B?RWpQeHU2dkh2RGwwZFpRb0xYWjF1K3V3RG1CR3FuVFB3cFRtQ2FTV283Slpl?=
 =?utf-8?B?VVp0QVh3Sm8xcUtoMTBUeTgvejlyOUttTVJMbVphNnZNNm93SHllZ0RlYlN4?=
 =?utf-8?B?bHRFL01Ebks2cWxmMVpRaG81VmVJMWVwNDFPK2RST3BsV3BKY2ZNZEMzU1Iy?=
 =?utf-8?B?N3RRMCtxTUN2eTdUREdkdUx2NlpHSjdCR0ZEdTIrRUhEWUoxeVFWSFgrd3pB?=
 =?utf-8?B?bTJ2N2podGtSV0hjMmc3MzU4SHlpU3FFaEFMaTh3YWJLZFNNNjFib3BhRzdm?=
 =?utf-8?B?Wmt4MGxwNExGaThGRFQzR0lpbkRvelVJRGhncEcxcjNEc0FYREZFNVIwNGdn?=
 =?utf-8?B?UTdyWG9MZHZOZHhKZEh4ZjVBWHhGcHVadVVqN0I0ZmVYeFdiRndhSzZrWkJ6?=
 =?utf-8?B?bjJEbXhCN2p3ZWVxUW5vdFlsQXV0VHhKYldoOTZHS2NaTit1dmFXNDNWR0hl?=
 =?utf-8?B?aEM2dmpQcGZvU21ubFZTTE92V1dRL3lvbGlqTkhRNU9ac3R4OGhweFJ0bWxJ?=
 =?utf-8?B?N3lleG9sd3I0Zjk3RVR1bFZYVUI3UWZBNHoyUEpZbmhHQTlFN0FkRnFyUlJ5?=
 =?utf-8?B?ek1PeHhvQnpHQzE0WlNvL0pCaDN3eWxOVkdXdStVZklvMW0ramFPUlQzYTJv?=
 =?utf-8?B?WWxaaUgxM1Zwc2xJUXZTaVQyTFduL2w5VldTSWVCVysxU0IrMUZLaG1hdktH?=
 =?utf-8?B?UmRlNEZ1WWI0eGdzeDFXQm5BSnFlUHo2b1ExbStuMWpveCswNitKVkxTTTBX?=
 =?utf-8?B?UWlxeFVwNE9taS96YmlLKzdsWUEzWFdiekFXdm9jR0ZWKzFXcG9RcHdTSEdw?=
 =?utf-8?B?Rk5zajdJYXAwRlJTU2NEYWtRN1orb29PZ3hZY043cTVnVldjRUtUOCtNWmJt?=
 =?utf-8?B?Vnl3MUdIUFgwZ2h2Rk1JVlJDL3dicTAzc1VqWEF3ZG0vMTBmclQzYkpKZEVs?=
 =?utf-8?B?Tm0rOC9ZbGJPbUYrY0pNM25hWDBveEZiVlhZWDg0UVE5RDBVbDRVS1VGbjBG?=
 =?utf-8?B?ZlNYV2FnOE1jcm1KVHNOTzBlMU5KcWF0ektRVTdWOGY5UE5QZWdySDN2dUtV?=
 =?utf-8?B?eHVrTysxNFlLTVhUVXhXMVE2SzBTRnpEMlRXeUZ1UG1qZGdTbjJ6UklydjhL?=
 =?utf-8?B?bjhQL09pcnF1YitVbXd5M2d4R3dBZEdFelgvWkcvWEpEL25BTWlrSStQY21T?=
 =?utf-8?B?aCtYTWlnYWJGdlpTU2FkcnpsUmhLOVdaUi9KWWRrZytkS2tNemFPVHZRNG9p?=
 =?utf-8?B?Rm5vZ0VVbFpBUTAyTFUrZWZCZ1lURVdTR1FBOVRsbFQ3cnphWGhIaUZaVlho?=
 =?utf-8?B?N29UTEFLVmlFT0QzVTR0Yng5QVZQOEcrd3ozbTVTbkc4QlNNYmt0WjlLZC91?=
 =?utf-8?B?d1NnVlRMc29NM0IyZHNUVk5kUlFVYXFHejRFM3Njd0RzdU56VVdZL0pjUVdp?=
 =?utf-8?B?Um9ybHVOUlNNYnFLci96MTlDbHFxL3pWZ1E2S1VWL002bHBJUTN1d2RUMmMr?=
 =?utf-8?B?WVdqdFNvaWRkdFhPcjZxQkh3SGp1VVl5NXJad2QzNVU0cG5rTG5TbVNmTkNR?=
 =?utf-8?B?anVFNG0zdUhtSXFSNzI4WURkZklLQ1FTeEcrQzdCQ0ZBbWpRNC9oZWltalRU?=
 =?utf-8?B?NXJPYmw5bXd2c2Y4VWZaS1NtUjhSY1ZPcWRDSCt0clBhMFJIZ2FwajhtSHZI?=
 =?utf-8?B?OVl5bWpacXpQRFFWaWNyMDhHUmdwam8vVGpKYlN3SmJ5SGhGRGlHUjk0a3kw?=
 =?utf-8?B?K3ZWWEY2QmhHUW1ucVJPWW5Mc1JnMU5xa3JjSFMzcFZHSmdudW11aStMYnRu?=
 =?utf-8?B?dHFiUWIyOXcyOEdieElWSUttU0ROVFljeUJudWtXZ3RZQldYdHh6ZW4vczMv?=
 =?utf-8?B?N0VRVVZtblM0Z0QvMnYyZ2NDZnMzZ3AySlNoa1FnVmtGKzE0cUNkSGhtTE5E?=
 =?utf-8?B?RnBabzRZV1BmRHJwWG96WWFuUzNqSkhlUjNPV25zU3JLZUJsZmZGblAzZ2My?=
 =?utf-8?B?Z3p5RDZ0aU5YUGtiaFRYbXU0UjNVREtaRDltQjVYRDRYVkJBVGp4VjR5UEhD?=
 =?utf-8?B?eXpFQTBpb3pzWFY3b0NZbGhLTXRITDQxZWdDemVBK0VOdlJWMEhhb1VFZ2l4?=
 =?utf-8?B?S0NLZDV0ZEpHTStSQzd6cDBhM3MzTXBqK0dHS2IxZXBnT1diNUZ0RlNZb0V5?=
 =?utf-8?B?dlNuOEV6andpODFKV3R2Q1E5Y1hNRTc1VTdoL240TUFscVprcVQvM3VWMkZa?=
 =?utf-8?Q?QmS8sQtF+rEV2X2eVLq6nOtBuGjh5stHxOyid?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7736b64e-8b3a-4cea-5977-08df072bdb4f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:48:26.1026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NY00NBQO8d14Ms6ec+aCe7/knw7SNtMDkfTGrvAirt489xF+vCWDFpW6R0pq1bMD956uTZ7d4UVvVU0Q9hYV+K8zpv0c7kqpQdkIS3gUgZoqB5UjOHgCyV7H3G6bcmMB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7705

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..6c6fa9a0ba1d 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,136 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like:
+
+- Hardware Security Module (HSM)
+- Security Hardware Extension (SHE)
+- Vehicular to Anything (V2X)
+
+Each of the above features is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in the form of
+a command/response mechanism. Each client could expose a specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose a specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+MU(s) is/are not shared between SE(s). But for an SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE, all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprises two layers:
+
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+
+  - Serializing the messages to be sent over an MU.
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+   kernel space +------+      +------+     +------+      |
+                                                         |
+   +---------------------------------------------------- |
+                    |             |           |          |
+   userspace   /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management over a Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0

