Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794799432;
	b=jeaRN6w0bb4EVofqTG/QwCR1Ld9DwWhlGSeSfyWNRT2YoaWpzofu8IhRksyfZJ9aq8rR
	 DDHr20BtQIm9LhcqLZ3KZ2FoEhCFBzVJSRTYcC8ZoMmsYvEY/g+KsbVc7uEw1gCmU7E53
	 6x6eO0Xc4xQ1LPGIhorNtj5i8JrQmgHbLHmKo0V+oxsam4X6Zwfwy/ruyioF7XGBxFcL3
	 7ta629hpXuraf+Ni25M40AfJAUdaaWHthretC/Igx2GS9/qTN3Y6ZFkM+IdxGic5JHx9U
	 4D9N7gkPdTELUw6EhsAVHcENybKemMdC7PC+kWe7bZ2PTJfoOsJtzVdyDuxeaOVp9hA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799432;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=oGzHd1jWfuiKhF6uPg8U43D2UcgcKVDRsyZgqKHGsLs=;
	b=UEt0GhC63ove4g3I9/l9vzTfE4j1fyKil/yFyeMZdgJ9whpp8QbGVRs1vXHlsfG9DjfN
	 sHwoYQ4hV5DOOKtRz6htBhirqX8Y5LW78PvCbYCgMKafpr3md9VdQKgfvFEgJVoplQrUy
	 AE9SmKdRMh6KzsppXIrYsWwAjRNPJVyAr3gWzqINUBns5ow/KclLWe1D9yogDqVLFGcuj
	 U4RM3KGKV3XrACVx+c0kvPnf60cl4jjTMpeT4xctAkYE1ngN8gVW8jHyakbA9yndCzOck
	 y0RGUZTvc39IeG0XIphWEQDnNMyzZv7V5szz5Vd5c08nmHmSTHdY6NwjXvdvgDzl78w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kD485yG8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.8
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12602606A323;
	Mon, 16 Nov 2026 03:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12602606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kD485yG8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITwyCrCE1bfftkBcy7BH0AW//83LcMB3A7KfRlaWUGEV86HsgsIzK1rlmjQbhir1QyId797NBOH0hJrIZylyoTtU2mKPJrb5cAu8/GCpo7T9Cr4D6sa97u0nvsvK98y21Eg0VVOHYFWYo1J7iO5b2FBf0ojxgamnsQ1XgmD2V9uS5TarA8s8qqcYtsaF6PE586r1SUK8dgToE8AtHrb63oXsg1Rh51UXRAjuR8xklRYNQcR2RgOkNeOi+EPVCxiRduzHRXcFL3if+EK08kP9VdUCGWHYPMJCbfY58ynyLLytNl91AJZBZ1a296IsEmqGHQwDH8cb0U4Hq+uyDWi5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGzHd1jWfuiKhF6uPg8U43D2UcgcKVDRsyZgqKHGsLs=;
 b=tgH+cPVGi9RPg21/+Z2TUfku5dkH3V9VbrNI2g3W28RlOl7hEFXsqLwYB96hDE6ldtyJcSu3puAVpef8WHISoBqRu3HmSeCN/EsWozS4/tQj576FwQTHZqyNQow28sqK3239KcqGm6cYcI/rGTceY2VaiGnbkLD/JxMbO80TtOPdXuh4bsmFeAgt8lNHa7/BStlrrP9dhs9PpPojq4w4sG5nAG7HUEvW0jBjjZMGYEp2RjMnvrxUvt/9UVM7vx5YIfEEedOgbA6cypUhIv2COM4gXa5GH+DpZsuJtahyDVHJgTbpuR0rBi+15RyC68H7CanlgjKF1uCQ4IGyijkcdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGzHd1jWfuiKhF6uPg8U43D2UcgcKVDRsyZgqKHGsLs=;
 b=kD485yG8yibkf25M+cTmuUPyx6JMz7nxHarAsf/4HKmZc56gV9zehlBdivFz+Gq+AWSbfMzcnw7Jn35ty5GSdrpf9cGYj6o2+tT4Ls4qdopXxI2LTsoGFi+s+xxV3IFf5OdURRZHQ3bZkmhbm6K5Ae9dNdRnchkjXvgS3yDK4+Xa2GuGjxISjrhJfNIVNiKkMRZPPg37V5nYIkFtoah2NZ7+kGEikTpBxmNZKLLiZcr5447776gU5phHaX8PAwHlFWWsKsv1XWz1y5iLVASLWjgl5P0AScTkASYOenhRrRyigJzV3wKI6nygVdoetzc3VkUEiI164ixx1E69niIjwg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by BESPR04MB035703.eurprd04.prod.outlook.com (2603:10a6:b10:118::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:23:48 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 03:23:48 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 16 Nov 2026 11:28:22 +0800
Subject: [PATCH v5 04/11] media: imx8-isi: Reuse mxc_isi_format_enum() in
 capture format enumeration
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-isi_imx952-v5-4-46de1d24efd4@oss.nxp.com>
References: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
In-Reply-To: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794799700; l=1752;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=d0AB9jp5072jrGQx5HtV+vlRQSYGC7tdDcb8Dg1cjcE=;
 b=ycKN5TQN42F/YS5vDO/ilF0JLKxKlt2lMvEX16OjSykeh2IwLzRULWQ4gK3jZHjAjiYK5cWtz
 lMMSkXpdE+sCgJFlVNNKqGkzr9jmT+6V3vkR48/UzGm97/JZ629b/1V
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|BESPR04MB035703:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3042f1-a3cf-4d5b-dcc9-08df4391075b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|921020|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	BM/kzKK5zA+qBWPuy20+BRZFokIpzfiJ1DWYx19MslQNykc3N2dmzRS9VucQ8vtkJIJcC677tXrjZ9893k/8Onsxr4wE5/gdRH1DGdCSf6FGhdsCi0OnSyPVg4wqt0irbuZ2wsVVJQftoS0tAixbmmtBuSEbSfET7WB19+NkRBlLredlcs4Ga5Hw4cr071mHkyg7M9QrdBr2bJaf+h5HxRldeM2siECd4pfDYfAwzNBWm+n3yKSp3w/I8GuqJXhQ6P6kpev7bWO0gUwdxt1yEs27zU0cCN3qGUSjJnONeM7Q2ZoqMf2OrAvyukzqlu9kzsXd8HyXmtGnZmm6r8XsIAKo/+YJd7qzGF46no4HXfpjWBIVgzmLkd+lqIGmlFe2bRpMl7qCwh098XNSyx8AkrA3SrRFJDUgU/AlqI5hSygOf+vrMjMxZ0dLb8MxcKqUXSL2cKKrAgJ24ADMCM24+MDcOv7jqKeRrCAMnCshbFLtAAXjMZEB7zdG7Hp2TIHDQ7m1H9KKJuAJOBLXElyHd5tcT4WBqhL+mzeMhfyljCErir8rQP5e+C7yT1SC7wPNS8vw6fI6Z2+SzDL79W1dB0Jvx5T54RZEVdvdnFfxxbPRhnSNWhSkZdNdb6i4vc0hfCYuWrDrsXd8xXmC3X99+9Q+xfZDP39TXZL/k0DTW11eOvJ7LK4EOnzK8b988b4mcEWfJ8uucW9MR5SgJCHH2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(921020)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXJ4WFBraTJSQlpiZW1aRE15UUZPdGprVDltVkt5RG5TOGtFSS9XMUowQkNI?=
 =?utf-8?B?Y3dFNk8rTEVKNmtWRytTYjR4NzdSYXBXa2hFSEZpbEZLKzJrakFmVmwxRE8w?=
 =?utf-8?B?aTFmUFluL0pTdmVtUWd2UHl3NG9EOGVoV2FVRExsK3VzY3dERFEzeXcrUVBF?=
 =?utf-8?B?NzZFc3cyVmFDY1BVMTdXamVhTmxGRVZWVjg1NFMrZFNjZHhOL082UHhNVkpy?=
 =?utf-8?B?MUdPcWUzWkU4TDJ6U3JDSmVCZklXdmJsU01rSFpnM1laOHIybGkxWE5lUlQ2?=
 =?utf-8?B?TGtNKzA4VjFDWERPM3lVVDdEOEdOcHRkcFF1VlNxUEZnQ242N05xVWhxb2Yy?=
 =?utf-8?B?U3pxNmRObXpYZWtEdi9oUUhHZzVud3B0UVFvZHZEMjdpWWFjdWJxU2pwU1RY?=
 =?utf-8?B?YXRTTUpNcEYvWFRwSmZKWDBFdlFlQVNmRU9JUm9BSWsyY0RaMVdSdXhEd0g4?=
 =?utf-8?B?VlVIV0RUdnhBZWF4WCtaMXFDcW5POEp4eFNoOHg2TzJTZGhxUTQ5VDdpM2Nj?=
 =?utf-8?B?YlZPQ1ZXTmFKRzQxSU0yVENqRGZWN2FkdEtiRld5QlBhVlR4d3lIZmxuNTRt?=
 =?utf-8?B?MWVncU1KVnIwcFpiSU5DWThLZlZXbDhNaHp5TUk4YVU2VUtjUlZqUXpaZVJO?=
 =?utf-8?B?K0IvbERESHVNakdieU9Zdkp1a2RDbjhGeTRidU9IZVdHU2l0bGZKeHkxdGRo?=
 =?utf-8?B?SHZoaTlWY0RGNEJNRFBCa0pOVXZpMncyK1liMlExNWRsMkx1S3hUZFpZcXNr?=
 =?utf-8?B?MWVWZmY4djN5b0ZnUGRBS2gvTTFBdXMwZU5VOTRBMmZ0cGRiVjhnU2FmZk5x?=
 =?utf-8?B?RDBOeFN3WFVqdDZJVENub3FQRGZDTGF2TC9QanhkdVIvbU9JQmJoUGxCR21x?=
 =?utf-8?B?ZUllZW1hcTd6dVh5clVTT3dRckd2ZEZ3WEdJeXhjM3l3TXJRVjd0eExWTjhq?=
 =?utf-8?B?Z2VUTjI1VFNQUHJjYnFyT3VrKzViamFwaHRLQkJkRXQ2bStmazN0VTRLTDha?=
 =?utf-8?B?TEJ4czhPZ0NMa0FHZzF3ejBNc21VT3NwajVQQVNtZTRDdWVjRG5hS0VxMHRi?=
 =?utf-8?B?NU1HalcvOVpKTnVvNlJ4akpmU3hEUXoxcGhtczFTOVMrMm1aUHFWTiswL29D?=
 =?utf-8?B?RHdydlVyNmhrZ2JCbnNrNzNjSkZiZFBaZVI0ZVZWaFBFRng2U0NVV1BNQWFK?=
 =?utf-8?B?ZGhZVzVQcEdWN1hpa3dWY3poUXlja045SFg3R2Q2VGpCM0JFSGZXblNoMVNq?=
 =?utf-8?B?Slp4UXpzZjdOWVlJdDRRZDl5QVUwVFdJNUt2OUxsejQ4K21DWlBhRWhsY1dN?=
 =?utf-8?B?L2QwY1BMc2gzVjhxOEwwRHgxTEl3VU1ZK2NSME5wTFJJS0N3cVJqMUdkTnRi?=
 =?utf-8?B?cUxRdjF4d3BPZDExcVRvaUR1QnhyMHJocjAzZzd3L0V5Q29QOTdnVnJDNUxk?=
 =?utf-8?B?MzNMcTd4aVpVK1c1R2pVUVNPTTBJNTVrTVNtM2dpMFJ4SEZGV1JhM1lXVEtS?=
 =?utf-8?B?aHAyN1lRWVJMaS9GWWUyVk5YUkhYK3ZWR3AyRGxqZW5RRHdiMk9DbkxXOUVy?=
 =?utf-8?B?Zm5UelhrdmVtZ3VQV0ZOTDZQNk15VVBGZHRKR3UzQUR3MzQ3NExuOXBFa0U3?=
 =?utf-8?B?MXJyMDBnS0tVdzh6Tkpzb1ZVU2o2aEY2VmlBZGFDTlBHUWIzc1FxTFBrcjlW?=
 =?utf-8?B?UTRjM205VG92YUtxc3BxYUovdzUvQ29MSXFPY0Z0K2haVVY3QzJzTDFQbHVK?=
 =?utf-8?B?UjJreFBYOFcwZ0d2Y3R6eTZOQUh6RVlPQk55WmlNMUtaVnNZUHlKT2djSVJr?=
 =?utf-8?B?bjZpaW9FdHlkNW8zVm9VL1lRUjVxQzdNa05zSnVDVVpudlROd0NXWWJTMW9y?=
 =?utf-8?B?U2Y0ZWNpVmloanBQSklYSmw4M2F5b1hQSlZIY1UzTGZodW8xMktYT1JNSkJL?=
 =?utf-8?B?Rmk5NkdENlNSRkc3Mk0vSUVYM3N6TzZoQ3RmZXcxclhrUWRDVFc2TDR2anFs?=
 =?utf-8?B?bGFvQ2R1UzBaVmVzLytQZnRkWXB3MkdOb3IwdUF1Ung3enQyTVVuUWw0VFlw?=
 =?utf-8?B?UnpOd1VlUExuTElRVi8xeHZocVlKK2lldzdPN0RJdUZ0MGZIUzBUUklDN1RD?=
 =?utf-8?B?a1NacDM2dEpXemttcjNpdUJYelVteFpXOXpBaldGNjFkRTA0a1BNWklKdFZH?=
 =?utf-8?B?eExTZW5SdGlvY05QZHVnVk5HeGN4d0NJK2lkQkNSMFRNY0ZzWUpoS1pIUXVL?=
 =?utf-8?B?dHdVaTROc0FqajJlUXRnM3FMTG1VanJnZnJselNwdFdrd0djKzlnK3ltbStu?=
 =?utf-8?B?ZGNmL255VGZkUTNlR29xMTJTTU1GN3lQall0TlBCU3lyM2lGUWNnT3dpaUdP?=
 =?utf-8?Q?0rQw6mVFVl5cYYIP8m6NEyuKwCHh0mJztfYNV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3042f1-a3cf-4d5b-dcc9-08df4391075b
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 03:23:48.5735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbYwrktrbzxFImW3xMONMDSBdsPBGGl9wA4IQIOWWbbRXySQhp8ZTgCfmCIQPyu4tng0+cT4ueoTh1fpdRpXj/kYYZvcA/n5HbeH5/ay+NL/2WCpS7jDixai5kCK+kT8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB035703

Simplify mxc_isi_video_enum_fmt() by reusing mxc_isi_format_enum()
instead of open-coding the same format table traversal.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- New patch
---
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 30 +++-------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index a904cd2739ea..af91bd65b2c1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -1231,34 +1231,10 @@ static int mxc_isi_video_enum_fmt(struct file *file, void *priv,
 				  struct v4l2_fmtdesc *f)
 {
 	const struct mxc_isi_format_info *fmt;
-	unsigned int index = f->index;
-	unsigned int i;
-
-	if (f->mbus_code) {
-		/*
-		 * If a media bus code is specified, only enumerate formats
-		 * compatible with it.
-		 */
-		for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
-			fmt = &mxc_isi_formats[i];
-			if (fmt->mbus_code != f->mbus_code)
-				continue;
-
-			if (index == 0)
-				break;
-
-			index--;
-		}
 
-		if (i == ARRAY_SIZE(mxc_isi_formats))
-			return -EINVAL;
-	} else {
-		/* Otherwise, enumerate all formatS. */
-		if (f->index >= ARRAY_SIZE(mxc_isi_formats))
-			return -EINVAL;
-
-		fmt = &mxc_isi_formats[f->index];
-	}
+	fmt = mxc_isi_format_enum(f, MXC_ISI_VIDEO_CAP);
+	if (!fmt)
+		return -EINVAL;
 
 	f->pixelformat = fmt->fourcc;
 	f->flags |= V4L2_FMT_FLAG_CSC_COLORSPACE | V4L2_FMT_FLAG_CSC_YCBCR_ENC

-- 
2.34.1

