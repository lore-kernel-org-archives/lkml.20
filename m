Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFFE3A5435;
	Mon, 31 Aug 2026 03:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788147194; cv=fail; b=LrZI1lLsRWX13+kNfcuNZuKbVJp4aF0TxvZM6rMGCdzRvJ0VwzgxKAV6ILFW2ksp6gb3polgpz9Gi1mdmHJ5UGO+5bc576gwQJIey7P1AMY5YHAzw1Cfgfh0mVLj82FksIlbg/oIQ+hibQRYcwV039AvGBsfcw8srmKlr+jEIsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788147194; c=relaxed/simple;
	bh=Kg6/6bNgnsYC4EGxUFGbYB0xClJNiXgUO9SoBIHDv08=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=gSS+GUU5EGWLajZjRVzemn7QZM3qUWNE3xuvccj558A4D+pjlujfcBUl26bDsFM6SH/asq2OyuRJtKAeZXVk1GGxsTPi81rLYCErp0bWbDbLOqjIxMg4kdK+8WAbgcOhSnQGxMW5Qu4QSFd1T/lErBQcf5UISgyEoAn3or+WuQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aw5asJVI; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aw5asJVI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYNqvPkSvVloJbuBO7qb+VJ+elloXVRZ++8IPMtJb5IVmMqw0eh+eytiocy0sAz4HSXKkzJzm3s8jUz1AfEU3gv6cbpaBL8RolAlpqsTm7thKFJaDKPMGDn5Rrt3PWl2/D4lOBXzi9gvVTxYeNPLang0p6juh+Z6cgANw7/0jkVf19EshnxmM/JraV/eeP1Ue+K25lRb7VKdOQOjBl628u402w7HEpKxa3nVuH9S/chOOQJVq+7JOcnhSYHpwMdpxnqrPC2Vsm3o3d4yyBu1ZQasMCy0g+C5d0+g7XXMInllF/4sdNj5OIKwr1NBOq1eKnGVtdAmenhcLYA9cWKxjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHdasebPq0ClLhskzXScsQwP7mRGPZNs2sheenbR6N0=;
 b=QiYfThQhMn1uUIfOZWrtUvcHlHWlG0mfcOWfpveNN6ZpEtlDkPagflLtuDPLca6PJhbenqQSIEVtB7dHvsZlDgqmbOLc3Lz9MKl6WGCUUMFscjwJtpgTCraEaaMWX6+8GVOMFGy56x5VERwRWfkO09ROsuk8zqTvSaR99A6pD6qAYlRrGujJuRahDZd0Ftwon8BbZlLj5vGRaI5ur7nts9bJUrvw4zpIe/1uMCqpTMuJXzSIIvx2IYOc4lvn1qEwQSZHAeR7SxzE3BfnP54LgP/GlDRPavS7RE2nNz6RMA5jqWsZfrkNjZYJPZDIMTpPeq6K65eYsXCb46h1ojWrBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHdasebPq0ClLhskzXScsQwP7mRGPZNs2sheenbR6N0=;
 b=aw5asJVI3RAxXrT1Dv3OifNJToEWxwyPPwehuuqr/gnUS90oA6z7NvHnqYD1Ihq9expJXlW7dL0RBIGBKVUlWlpyVToraFNiLR9Ncl2TJIjW98NqQzKtG0tND+ctxQm+4VXt0jFJBfAQf1SQZkUO7am3FdFiMU9Dm/uw227xKQBQjejvEzVZl4fP8Bbmq1rVIXezmYk1+wovl0hku6H6ZCApzvChqM3A1Z4RA5o3/OKFFkqAos+u8URYFqXRFEG2wnrjkEIH6HqlBb9KP0l8BSXug5PcWbA0KSwgW+0VPnBW0MqdE0QhIOXUlq4GJabdWM0/yLeL91MnkuEsjYkkDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS8PR04MB8772.eurprd04.prod.outlook.com (2603:10a6:20b:42f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 03:32:56 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 03:32:56 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v2 0/6] media: imx8-isi: Add i.MX952 ISI support
Date: Mon, 31 Aug 2026 11:36:55 +0800
Message-Id: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANf2lGoC/02MQQ7CIBREr9L8tTRAU2xdeQ/TGIpg/6LQ8A3BN
 NxdbFw4uzeZeTuQjWgJLs0O0SYkDL6CPDVgFu2fluGjMkguFR/EmdXFHdc89pIpZbTq3TirboB
 62KJ1mA/Zbaq8IL1CfB/uJL7tTyPVvyYJxpmZnda6c7zmGohan7fWhBWmUsoHK8PtZaYAAAA=
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
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788147422; l=2574;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=Kg6/6bNgnsYC4EGxUFGbYB0xClJNiXgUO9SoBIHDv08=;
 b=GGaEsPw9t0GwPWW7XRvYqj1soZm7rhLrUzpYMS5D7pVoUOTQMN470h5fJthR1yv4YfOspm9Fj
 XCbni5ibl95C3bACiBwJjG8fTubFh/eGAUJRm0DzOmMfVMIzSLAGko7
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS8PR04MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c23c14-5374-4dcb-f504-08df07108c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|18002099003|56012099006|3023799007|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	JLv+zy+1FW21TKiecVCEWixnpIIRfCd03N8KkUIp4FyWDUL9+ZaltblDnAy3JrcrqGSEEE+gvGK5rTCHl/XgmQtk/cCFEF/iuHbX1k/9Hdj1ZNi4R3dssc9KKBhAnR2dAsl/7LY5OuaobAxT6aJR6a++f1BRsQ60S/yfCABg86UjKMfOsmDVLZ3Row2ectQci0/KtjaUSf6wKZy+l0qxiEwi1I/XblsT3UQbWu9/4sWasXaIk6KzyNcnVstStK2eyDdrLuvVONVJvsbnr1iYs/CAzbcmzugq4yR39blKFjGJTLos6I3vI1yfQrruDkmTL8gMuJXeavvQKnYFen5COqOztgzZ6qWaV5U2BYhs+XCnQdcpiJPby1g5E9jtYt5cOkmqUuR+/lcD8euxNcW+VbtTm1lxzAo32Jvy5afYUq1tE6POTJZdnRtIB2FbmU2d85oTgK+nJg3qGt1S88C8MZQR+ZLKhlTMMgUHskS8IlY1WNlT/WGyo/yFU5qAVVuEZUsCzainqLBFUY9Kld7uN0RwGH/CK0r001q/wlo1H2RYEqvTOr46JsWpJylJ6+zBVCYDHRdBOok2K2qJRDLD3utOyBGOLNoI5A6aide4ksXTRg0TcxCccoU5lSGIDqBgOhWWyNYUD34EqQY9nM7PhBfGw4y5VJiWt1A0pH4CI4cPabikIRBV0G1Vy/prNxLTaQQSPVa+UQGydQb0THHvkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(18002099003)(56012099006)(3023799007)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzFONnduUy9zZkpxaGpWc2F5L3VQck5xWldQdUNCL1ZReUE4aGUyOVgraENq?=
 =?utf-8?B?RWlNMHY3YVo5MTVWMjlrNXFrdUJSTnVqczFDb1JFT1NFK3NTUzlhNklWckc0?=
 =?utf-8?B?U2JoQ2o5TVkxUTAyVm84TkxBRmk2N04zL21ESTI1UjFJVStldUlMNUxCazl4?=
 =?utf-8?B?N21scnZuMjNtWTZYZTFXMFpIT2FmcCtTcWoxV2k2TDFUY1ZLWS9Id2lQK1c4?=
 =?utf-8?B?WXBEVGcxUnBEaVdoR0J5Y2o2SEFiWm13SlY3QWc1aDNoejVYcUxZSU1vOEVz?=
 =?utf-8?B?Smd5UEg4YWtGSTBVbS9ZSDh3WDFIYUU3b1c1eVl6cFptcVluSGo4b1Rtd1px?=
 =?utf-8?B?VnEwbUxMK0swMDl0NVNUYTBCZTlxY1gzKzJDYVNUaisxNWlWaVBGL0lzTGdM?=
 =?utf-8?B?a3hza2VRS3o2N0MzRTFYVVpqT2g2bERYVHQ5SlRxZUxCemUxYVRaaXcxc3J4?=
 =?utf-8?B?M2RnU211ZkxPUURxN3RCM3dHWEoxaG9rcEJNRXV2SGNvMEJhMmVUZTdRUktR?=
 =?utf-8?B?YVRqbXptRXBjako2cnFDbGlvOVFxamlKL1UrUGtaenhMQXo2VTFpY2I0djBN?=
 =?utf-8?B?c1FBRkpCUllWOHpaUlk0d3NKcWJpR0RWSWF2TzBqbVpGNlZkUkdhSEVTY1Qx?=
 =?utf-8?B?MFdXU0lhRjB4LzJZQm9GZU1nbVZHNDR2UEpObWZIbk9OTytlbmc1M0s2YnlP?=
 =?utf-8?B?VGRnY1BLZDBrZUgzc202cnJKV2NkZnNxRzhNd3E1RlIrb2d4YVhobzlwSDBx?=
 =?utf-8?B?S3dRam9naHJ1OFBzSG5pdHhqMWorMlpXem0xZ0RpNDBIVTBVYjJ5Q1VwdlhZ?=
 =?utf-8?B?M1haYllmTStHeTRvUGkvd1d4Z0Ercm9pZTVMZHg5ZE1lRW9zbXJpVS8zejcz?=
 =?utf-8?B?cVpjR1RjbFhqOFpEaW54QnFpUnJlUnk2MGVBSUVsejhXR1dpczlZYU5hZzZz?=
 =?utf-8?B?RFVMQ1lDR3lWV2VJeURtNi90VnpWVDZPVVVxeHc0TDUyanNpbkU4MkNvMUlD?=
 =?utf-8?B?d0NqK2VtUWxzREpUZUR3TlNlaXV3QWFsemw2TmNVS3EzWVQ5TW9OczlkS0V4?=
 =?utf-8?B?N2lFK3N0YlhZSWhhdG45Vm9QRXROclF0RGU5ZXM3dzF3Nk5YMFh5OFd3K1B1?=
 =?utf-8?B?cnB5dUNzYVlOajd6bDJYS3p3dE9wSE0zMXYzcWZ0THY5RkFjQ1VTa2R4aWdR?=
 =?utf-8?B?ZHZYVjBHS3ljSVFVVUkwNlFjZlhod3o3V1FpanFaeXQzUm5EMEFsNUVDa2la?=
 =?utf-8?B?dGh1ZmFxaFBKV0pQcHdScU8rWlVBSXExMzNPeUlqZjF2TUZkTzg4VFBoYlZl?=
 =?utf-8?B?dEFUMmNSaHVqQzNMMzV4UzB1WlRrZWdSTm1tS01Cd25zcWpwcXg2RXp1U1N3?=
 =?utf-8?B?UG5kbVp0a3BheFROYS92aUR4RFRLa3Y0OVgwakp4Wnl3YXN2Tkl4OXUrNG1J?=
 =?utf-8?B?VHZ3c0N2RnVER3F1UWVXT2VuRXVZUkxpd1Q2bDN6VUlGNnVtQUtXTFBZSUR5?=
 =?utf-8?B?eHNyRmt4aTN4Yy9reEhWSUVhL2cyYzlvWm80b0tnblpCWmRJeDc3Y3BoNXdw?=
 =?utf-8?B?Rk1RVVVsTnZkeXI3SEdmeFBZd1JVTVJKUlNEaFp2bkFyY05xdnFVOXRXU2VP?=
 =?utf-8?B?TGYvUGJqNWxubUE4WXk3WkZoY1JCS01vbGx4TWlNWm1rTFFOSkxBQnM5aEpu?=
 =?utf-8?B?OEs1OE55RSsxN1ZISUpHV0FtZmhQZ2VUREFzZXdOa0p0Mnp4Rjhickt1cDUy?=
 =?utf-8?B?TFNvdGNDbTdVNEMxUVV3bmVSQU1ZaWJTZmVWUStYRG9WUXI1Y0NjTWVmYlc0?=
 =?utf-8?B?dGk4bndFN3pMaU0wM2NZMW85MVZoMGtTYlNJcWpmZWphOUNWT3JoaWdRK010?=
 =?utf-8?B?dGlVbW1tcHRhaDBzQ3lJdkRzdHRTTUtCWkdRWVV1aTFnQVJ0amlNWWsvL1hp?=
 =?utf-8?B?cktWNmNkT3pjeVZGd2FHWlUyQTFZTWdWOU1HdXpnK05FSkd3Wi92T1k0TW9O?=
 =?utf-8?B?U1hJcExnSytjOHhBUnZnMEhWQ1g2QlYvazRQS2ZjNFZkL2xkOXBoMkxENGJq?=
 =?utf-8?B?aG5GUGU2SS8rZys2Y1ZaQTh0dXdIOGUwdEd1a1NTYThmWnhaYjZQVXFNajlm?=
 =?utf-8?B?dTJzanVCM3F2T3lZMXp4UXlvWEhpUzJJU3VCaGVkOFQvZXpqdHR1d1VEQjZP?=
 =?utf-8?B?NWw2VG9rL3R1SDRlR3dpUllXb0JIdXl3UGlFSjF3OTVSdmNscjZqT2wrK3NN?=
 =?utf-8?B?U0FWVE1UdGk3OVFHNllPMXFIcXdoRkhkbUNwaG1neWN2dE0wV3lWRmFHRWxH?=
 =?utf-8?B?YlF4V0VhbTdKc1Fsb0hRTit2WFlDQURVaVNWdG80ZnphQWk2SXVFaUV4cDR4?=
 =?utf-8?Q?Aci5Lnk5NFEL/CYuWfu1jeIMfWSZK8kMVMR2k?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c23c14-5374-4dcb-f504-08df07108c19
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 03:32:56.4979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZOzbk7JXMC1ZpcBLgBlOxvDxeLtGQxNjh8jE8ydVYlqw4ef8ILSpuY+rnlI+jhm/ARiDw7iGK/B4B7gBHnI0h/eLKs0TK8aR0HqKRqtimqkJj80avlFBKfwfISEmUJ6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8772

The series adds support for the i.MX952 Image Sensing Interface (ISI),
which is a minor silicon revision of the i.MX95 ISI.

The i.MX952 ISI reuses the i.MX95 ISI core with the same 8-channel
pipeline and 4 pixel link inputs. The key hardware improvement is the
addition of RAW10/12/14 output LSB alignment, which allows the ISI to
output right-aligned RAW data directly, matching the V4L2 format
requirement without the RAW16 workaround needed on earlier platforms.

The series is organized as follows:

  1. Reorder mxc_imx95_data definition to follow mxc_imx93_data,
     matching the order in the of_match array.
  2. Use per-platform format_mask for the output format field to
     match the hardware register width: 6-bit for i.MX8 series,
     7-bit for i.MX8ULP and i.MX9 series.
  3. Remove unused model field from platform data.
  4. Add the i.MX952 compatible string to the DT binding, using
     fallback compatible fsl,imx95-isi.
  5. Add the i.MX952 platform data and of_match entry.
  6. Enable RAW10/12/14 output LSB alignment on platforms that
     support it, removing the RAW16 workaround for i.MX952.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Use fallback compatible fsl,imx95-isi for imx952 (Frank)
- Remove unused model field from platform data (Frank)
- Add Reviewed-by tag from Frank Li for patch 1/6 and 2/6
- Link to v1: https://lore.kernel.org/r/20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com

---
Guoniu Zhou (6):
      media: imx8-isi: Reorder mxc_imx95_data to follow mxc_imx93_data
      media: imx8-isi: Use per-platform format_mask for output format field
      media: imx8-isi: Remove unused model field from platform data
      media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI compatible string
      media: nxp: imx8-isi: Add i.MX952 ISI support
      media: imx8-isi: Enable ISI RAW10/12/14 output LSB alignment

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 18 +++++---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 52 ++++++++++++++--------
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    | 14 +-----
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 42 ++++++++++++++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  6 ++-
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 40 ++++++++---------
 6 files changed, 110 insertions(+), 62 deletions(-)
---
base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
change-id: 20260817-isi_imx952-66ca65f9b638

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

