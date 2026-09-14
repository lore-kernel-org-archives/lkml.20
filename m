Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA147C0E1;
	Mon, 14 Sep 2026 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395092; cv=fail; b=s1pT6IMwQMup+DircsmXvU1LCLxKleJX2Oz1VTaCfpp4jU77rt1S+lmoleBQzOsTnhAE8HtviyGXc0+W2LqPujW1YFStPDfJtvfKEpRVpCYTD3vwTU5BTajBDQpeGqh70lodzoj1+F22aH0rahg6rnVggfcgXyVSEMlx5sC6hdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395092; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LXX6DQkFQ1aEjTionGM8QiDSXdpG2U685z96cvgjw+Av5LVMNW+kf0ZGT3SDtouDGzOlBjraOIWE9X8QwaYKIz3F17oCPHwQmTQHOF0QGipQ6PFQm2hXDvzJ/KSEDjqkCpZsaKun3gG7bPCTQffW4xuG13VaqqCNBaCTgGlJy/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=faS7jBVP; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="faS7jBVP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f758OR9UgB7GBelluaXvCJWhS3ZTJpyUOWYBysmDDwOmTFiqvtXHdcmyZ7O/pNG3HNi58aa7DGN7XnmrA9uETzUaUlyRBIQP4hAy5mrdvhAA7WaT/nwNprcDkcXrJ5ce42vA95vGNuYnvsAodAFdj5EEDxc8ueDp+MhtjD2lbvR9ly5xODe14QwhrMTv71vDkW720rph/JLIgJwT0HigrwY5hGqvEnLzNeFhJHzJ1A73ppvyJzwYlPKx26yXB5+s2xqvDU4Sex4/RUCqYi4fpwLC4yweVhSks3IwfBroAKAuLkGn4TFct3lTQYS7IE7ePRYZYqid9vzV8tDRqZU9tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=fCgMcrCBllFeaQPkx/PFE37/xd2sD+NMxOKsmBKNDQE4Y3uspkW45r+uuN+sWUl0ZtC6PJ7HQiJ2ROYM9EbOy8TQzaJYkCLFBbXccWxWc1Y6OFe7iygMTbxXIYncQsKnAL2xUbxeklrUwWblQr4dUlidhkzcuaGiGImaWqGlkothI/mVRsb5JkkPzuhljY2+NP8bP4qAz9Fl8Kenk6Ys52NkFdfHibpZjn9EYcJ6z4m5YQ3eBQPxufF5Tr9t+pV6UKiizy63zBD2gdRolJDuQFa3HulcId1aZ0UE2g449Q3ZEnnVD3seXt7AIu7wAawd2B/jdzuZ/BksaOhtfvHn5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=faS7jBVP+mz5gLncZnKZ3Pu8vblGqjQPoJj0UftAwuDb9Pkyu8KUlaV2PW5nFmrOUHTGakxdUAUNCtiC//zRMieOv6fLVsSFJtVQTW1YSPJj48HE7S5jEy2UCKZEPKhal+fLSA+Cp/8Fy0W2m28eIfvuRyFKyNBvUIYgfyBJNUo777uMvNzw7yUkYxkAt8UzXBCH6DpzpDPBgKfORHa+CkP/C5tqhCcbHSpXvQfDOW/dBQnQ0mT1boSjND5FvW0fATUHaNNAjOisC84IkRWSR0cN6EWaNAViRSoWuRdnhiXWI+xP6Q64BPiCeZhArhjkWKYugJWoLPkX/Fz+GLe5Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM9PR04MB8618.eurprd04.prod.outlook.com (2603:10a6:20b:439::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 14:10:54 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 14:10:54 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 15 Sep 2026 01:09:59 +0530
Subject: [PATCH v51 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-imx-se-if-v51-2-4a7dac612cb5@nxp.com>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
In-Reply-To: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789414820; l=3245;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=ntpnFNSdfkZxbWv/bxpngLPj/2j9D6mPK2Oz2/03XIhlkbIcgf9n6DZmGjMl5W6JStfDVdAHK
 HQK0fzA905JC+hWUmEW77j4ar1wIHm1yaItmmddR8w1D5T7j1Y2AtX6
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA0PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::20) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM9PR04MB8618:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da139f2-4135-4458-c2b6-08df1269fd7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|19092799006|921020|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Cm8fJnSCGqoyEdMalAt1u9dOhbq4WjkGGNZmwc7lNxSyB2tzMEiganfzOI9+sRc8w6IemO7y02kPlDcK68hYrULOZCEyRvTDZwfcEXjaXNYQiJ2Gh7RWHimmsZzfOdaLZISF30r0+PgWD04gvX5rfCjj3axel7KovtXyaHlVHi/QhfZLFsG6zP16/suR03P8TxzKUvc44EwSyxzAgAzUnhamHI7nwtMyROcnRzKKlXDQL+C8cejylj7x6jO7e2N6hy2bu9SD42IgxspnrH4k8O5Y1cfOAH1rWhwUL+zeT/NDe0X7WFja/ZrqEl0kRq6OqaKsl+tzb2hIRqAYqVSwnt9CQjnVVWC/euheLcAL+zQWSYCdpkg2v949TZZsoDyH7mGhZCKtgt64OW4YhWA1Xor9QeSI4eRWMo2Kdrv2EQduDTOtf97jJ7scsIfJxt07VCsd/IMS19flk3eDkBqDf5HNrd9toR/HS5MesAq039bU0wUlH4HdPQvjm7iPycUE2plQWvJ6aC/woaIR2YoTiQJNXFfJReUxjFIMLfv4d1kKeLpoLvf9EL5BQ+4ahyDjF3ycayslKiCU+Nectl4aqMG3ri27lyxBCklOSaf6zghpJokn/e+5ruhdClj9qAUyCBGoAQigTy+y3nSoiACog/oFpDSzdAyWgxn0i5/SpNw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(19092799006)(921020)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emtZSmtoL1lPdlFxUTB2NDBsWlQwUmt1K1paQ2RRbUw0Uy81Q0lHZDZsVjdW?=
 =?utf-8?B?ZlhKV2pCUnVkemRMOHIzTkg1T3JiOUNVKzZJYXZMbS8xOTBpZVpPM0dYN2ZP?=
 =?utf-8?B?QXA1VGkzN1R1ODVsTnFkQTZBazJGRXhxdU1PY3ZtRUhzM0NpUWt2Tk50Rk9C?=
 =?utf-8?B?ZFBnZUV5QTVZRWEwUkVEVzQzajRXMk84VnQ0aXpsZ2Y2aUlKcUk2dm5zbHZV?=
 =?utf-8?B?VXJoaWNCTHo5bE1KSlVROXdpQVNVb0Q0VmtBQ2diUlpzcWU5RUFZdVUrdjht?=
 =?utf-8?B?Q0ZOa3RWRlBoVmRoTDNXS2szWWVpUDRrOHZiT2pQNEwraWt5UjF4cHFBNzRu?=
 =?utf-8?B?V0hsamlNZzlOUUNvQ2dXeEJsTm5Rdm1rNUNlVlM2TWJwUG1MTzdGL0ZNMThR?=
 =?utf-8?B?T2ovckt5SUNUdnA2MVFmd2hYbGI3L2FPSWxyYyt0Sm9ZRG5Vdm9rTUc5UUxG?=
 =?utf-8?B?ajFnaTJoK25Ta0pkS21OUmVpYWdMZkJMcXloTkFESGV6RFNaKzdHWEw4NXJW?=
 =?utf-8?B?SGNFbkFLc1lCd1hxYkVmTnIvLythMy9sQ0FXcXVWRjczVG9tRDhrclF1MHdx?=
 =?utf-8?B?U2RUNW9wRXhJRWwyMVlFYUQ1Y1Q0MjdWOTZKQWxqeFZTa3JIV3BMM3N1OWZO?=
 =?utf-8?B?WGZJTXd4YkN4Mlh3d0MzamM2MlM2cVB6THRKdkhnVnBHNHNzTTdyTmhTK0NI?=
 =?utf-8?B?Q1JlTlFYQzh1bmVCTG51WkdacXFzcllPNGlvV2NHN1pIaXF6dHFtWEV4VVVh?=
 =?utf-8?B?ODVIT2syZDU1dGptUVloNm11Z2NVUzlKd3Y3eGlyTGtkRXJ1NmtNZEVPK2p5?=
 =?utf-8?B?QVU5K3FmREgyQUk1aHQwQUdTZHU1Q2ZKejZ6QTlBQlZqS2kwZ3YxNUVzTVdD?=
 =?utf-8?B?TWNKM3dKek1UZk5XekZVbGZLV0RxVnRkNjNnUllkZTdKQjZFMGVrb2hSUCt3?=
 =?utf-8?B?eVdDTk93UnpzamR1enNTT3FHa2VKSkM4Qjc5VHR2dzBhTzRaVHFMS3RoUkpG?=
 =?utf-8?B?MGVMbVJsMXZ0QVBUeUJqYWJyVWRFTG4vVUs5bXdhdXBuZytNUUdDMzQrT2N6?=
 =?utf-8?B?ZUh1SE9iSWR5Q2d0TVRRUFFVZFZ0bXcyODFaUlhJcnFwOVVlRzhWU1lFclBr?=
 =?utf-8?B?SkJVOUdHQ0cxNGpDbHZkTGt0TWdtOVVPMGxndERhT0UvR2ZKSnd2ZkRvRnd5?=
 =?utf-8?B?dGZiT3R0UzMzUzh3NGt0UmNPZ2N4OVMyQkZISUlxUHptOWZxbmFTZy8xVXVq?=
 =?utf-8?B?MTdCeG1jVDBCbXgyZm5WRm9wY3l4dE9lSUVOZmxMeDBZWm5ORzVTRjBlYjd6?=
 =?utf-8?B?cG44SjJYd0xHMm9jTjRVUHhVYmhHUnJZZWpzaElPMyt2RDJ4WGIvTDFqMkNF?=
 =?utf-8?B?d29sV2VxVURQL3hZNlAyMXoxTGRabHM2NU4wTG9nTVdMemNQYjZiODdXTjVm?=
 =?utf-8?B?UUxxSzJkYXJDRFNiWUlHcFJPY3pkYVlIWlR2NlIrSjYyTUxyUHdHeWNSY014?=
 =?utf-8?B?eHR2UGRSZkFnMHBYZENiZ0sxb3VxS0JQV0ZCcmdqV0dIcG95Q3JZNkdDbXlw?=
 =?utf-8?B?UUhNaXpYSDdXSmJwN2U4TE5KQzNySVdRUGpPbEQrQTdCWFpHTEd6OWJLNlV5?=
 =?utf-8?B?elNxeFdCZUh0UklUVlBmM3VkNTZzTG9kRmZCM3IycGcwa3d5dlNhaWxwaGUz?=
 =?utf-8?B?K0xSa1E0eUVobUxyYWJTTjdMZlJFbVpkYnY2QWZ3cDFGZFZFQ2ZxZU1EdlVD?=
 =?utf-8?B?NzlXUjFNOHkyTGZqa1pweGdVcHNNOW8vS2tBRVUzMXkwMjIxdWRiQjZPYU9B?=
 =?utf-8?B?REVHTjI4QkR5djhPMEtZTkd5bmNiNURQUVUxckpMMFZQeFZqSUQwcU5EbytB?=
 =?utf-8?B?YTRhcEFSNGNYL0ZWRWxtRDNPRWJROFlwZDBRZSs4bnovTlB3dnVKbTZGWS9H?=
 =?utf-8?B?bHcwTEFUbHZPb3ZaVHk0L3RQbWs2N2M0R1h2K1kxaTQxaUFvTHRwYUNib1FE?=
 =?utf-8?B?d0kyaTA3VWJHVkJMVG1EM3c3dURNajZmdlVWSFFrMDlSdUlQbTFESk1UQTFr?=
 =?utf-8?B?N2ljdkJmMWZ1c2d0YjhqaGpJUHJPaForVlBxUW9GUW91ek5RRGordkNWOXJZ?=
 =?utf-8?B?UytXTUN4djVnNG13bmJqTTRkb3BRdXVvK01PckNKYWtsV0NRMEZ6N0ZXMHJV?=
 =?utf-8?B?V1V3bFdCUGNLSXhGMElYQ1JpandiQjlMSGJkdlFCZUMvUjNsb0YwSFAxVU9u?=
 =?utf-8?B?RXdpS21vTzBCcVl1eCt0SUE1TlgwdEgzWGpsNGhpaXBMYnpoMnEwYzdkcCs0?=
 =?utf-8?B?UzlDdFoxSVQxazNXaFZWVVl5WkZjZGxuZE5iU1VBNFpDV01rYjY5dGdPRC9V?=
 =?utf-8?Q?J1A8Wdr2YPangJ0vdaANOOw/PWd7l8uR5EMaC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da139f2-4135-4458-c2b6-08df1269fd7c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:10:54.5872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNW+DS5KfMiVi9fesT4YXLDvlBaS5dYDVs2yTnGMyKJS98Ptl3D5imFcHmd9kekwG1Dy4ckfpjTzldCYqWU9jX7YpFY2Iu86xBFgZ22DBV5WNe6S1fKrxjutkJUVWHHu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8618

From: Pankaj Gupta <pankaj.gupta@nxp.com>

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0

