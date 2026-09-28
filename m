Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE804E50B3;
	Mon, 28 Sep 2026 19:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623433; cv=fail; b=joyWa7akU0hMUvKqJAjRIDCS+nUJf4+YvVCjFmhgnfiL8wjwRwAbzpl7vESs2qBuzNdsGfAi+knQfYOg1C8/QYA62nuGgakKvg0xgD/KW+JyquaKjBnPW82xZTI2oOVqM0P1o1Lbmhyys/53lnot5L6HB2e0RvJpphLTN/D7Djw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623433; c=relaxed/simple;
	bh=9wR3hvLy9pzsdCAsk5snaz+B4TBPsSz3YZzjF0sjWv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F90LbBw13QcOnQ7bNsvACjtvYsk9RCf9FF6xM4klSRwhikOVr/Ea8n51kE+1tqriL8LS0MJIsdjWkOI597jJJYl+ECGjH/Y+dau3vRpwmYsA8oL5e7lKhaDEQ7eP6hgKrm5otFaX2DitWAHNT+0xvYpjFp/vFs6RGibvkkH2QYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Fo0P7cqZ; arc=fail smtp.client-ip=52.101.72.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Fo0P7cqZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9I434QUn2U1ATOxYJ5w/FxPt1ECMDl9mJMhcFSZWmIN/2W6xdAp1rscS9pdcOTpG1V/FhpKCeleqqrVuvtNxHD98OfJAj1xZynseCO57qx189IeHs6wCYQVATU4K59RPSnWvxxnSo3R5kid/X1QWjcp8oHxN4xlUu8apZQ9Zr1Wo+7zlzwbb6ODWyckIKAIbCM0KSS9zMnBBZbOjk32SpLBA6ryeJgjvCPu/+h88LGs/6gORypf0Ja8/ObfJrpcSi/tPpNpeMwnhlVpXeMHvPQbqFi7cDmFhKpAeg97iI9fqOrr72hPBu43g1iKLaR9+N6tahBDPDMlTMHvGksNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L11TLl2TvjxybJT8vloUetULa8VJltQOt8ul5YlfkBU=;
 b=f216/yM7Ef+icfnooohGyyuxyYofHuf9Filu7uwFkAmzshy9pIpEluUxZyeUc2Nkvg2tswJXWaJnPMw5uekxVHLkrHvTh/FLlbrOOPBZ/0UCoVn48xZCkOXYhmWOJLK0nDOy4KvtNkcWg0fKybhNQRQqhbzX475/OnLKzKVL56mfYtei7UOtLDfdXMacTtrO7wJ7V6jkXfRcgGZt/QgGvo2TTGaPBXzwaSepdr/EoTJX/5MG8zDBUwQfHf8J867Gv1UZdiZRcyV96wnLMGTryQlDVA219hckW6YZnrvuSuUlmbTX+igo4oVjQr7/VFPEljsyxOKCdPQ429uMpZ0eAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L11TLl2TvjxybJT8vloUetULa8VJltQOt8ul5YlfkBU=;
 b=Fo0P7cqZRAdK4QsLedJ/Jr0ICpIFVWcf+8S22XC3NY72frp7fCqRRBw/eJZP4KZYYei7T90r83YJMn1ry/3j8HHLKZE3n1qnQQ37FPS9XES+jSt/ju7GzmKa56JqN3pLxqJk9XMEIdZTA3C17QEnAKnkUj44TZBZwuKyWqUiZ4I0HXAmsp7yBdmtRuGnkaF8ef736Galkn4xq481yA/FTLredmpCUdA5ICLdYyxx81qqjFIkaqAECjmmGqIixaAgxmjj97eJaI/R7kZND4dsOsR1AK+ltXuRlmZcF+QULEAhDKsjLiW+Cit7P7AHs1px4pON5N355wwC8Xx4yHvjEA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10646.eurprd04.prod.outlook.com (2603:10a6:10:58e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 19:23:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 19:23:48 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Valla <francesco@valla.it>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: Re: [PATCH v2 00/12] arm64: dts: freescale: fix reserved memory node names for remoteproc
Date: Mon, 28 Sep 2026 15:23:40 -0400
Message-ID: <179062340328.2034721.4978380395273133051.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:510:23d::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10646:EE_
X-MS-Office365-Filtering-Correlation-Id: 741ecc22-db02-41b3-cbe7-08df1d960532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|19092799006|7416014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iDKI0YMBW2O5db+VfiEAOj6/yPD3VoOnGIPbIrNJNW8haUGeUnKbNSZu65Xoc0ZKmzvy5ZnBedtof235oeVRJGGqOgKPlkpOUmTSIXJncrPGW+LNG+DElDaDbs7ilwn9YgZjYDkpuisaJJkIefc8UhbNUG0QTv9BroD7h5PgyiZ8IIKRnf8zdpVlA9xJMg67tb71qcNDi3ntQPwFA4MMUtUevogSw/U02LfFLRuZX7Yc99StFuYIwvTD7zwi/At8Hta04dwOTviTXdsSET78lYM4lGkzuY8E+Kh787uct6GtUiZtot6iLTA1R/28TRFKBn92wsyoaVdgdTO1RTNylsbJ6Bl5r3UJYNntAl1w3E+9hXVZU6m60rQdxNSjzggaQhR83NqyLXoNk7r9d8puyB0asv8igV4H9SuIrith6dk21sQK/+38RxZQ5IqVP/8xWZ91VZPiQaNwrq/3Qqe8fZpV/nFbODsZi6tmj7mnjSYkkELwsA8thSRcH50KCyX/Xg1yXn/2hw+ufYC6kKKbebPOmXnKPJYg9IAY9K8lQN4UkOIsRaOZwkRwkCub6bEk4jDymiND1OJNPbg7lq1zpTna5V5/g9tieZY7/w1iYF/0Dy5cVjfLytqpbPDRUnzKDow3vA/c1UkcJsErExBueGn9AdswnhuodWuBhe8WCcI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(19092799006)(7416014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGVCdCtGdGJkbUkwWGg4ZWdwS3hQakFVRStHSkhsNEsvT1NxUmhsVTRWQktz?=
 =?utf-8?B?Q202U2lZdlhnVVVqOGtjT0lrencvYy93azhDRFkzbG1uS1FHNnJFbUtPQTlF?=
 =?utf-8?B?ZUFNMjZCS2VoRGtkRXhOd1ZZcW9MMU5xczVCZVJLcTV2a1c2TUQ3TkY5Y1d3?=
 =?utf-8?B?dE5oVW5UUm5UTWVNRnR2Q2NrSU40NjJDTDRYOFJwNFE0NGY2YWtHUDd3VUZo?=
 =?utf-8?B?cEdNQ0xRZlk0WmN5bk53VncxK2JIeDVwK2NZMjR2Um4rb3RXOWY0UnhNYzVO?=
 =?utf-8?B?U3dzdHRmZFo2UTBiK0cwUDA5VlJUazFtZmZNZGk2RVVSV0d0Q1JVdnhqZUdM?=
 =?utf-8?B?anY4Zi91ZE9HVTdpKzNhcElrMitBb092VHhXeXJQcjlKMmZ3N3hvOGFSUm83?=
 =?utf-8?B?Zy9xdHpla0g1RzYwMlp2QWoza1dXMWc5YnM1dWk4eVA5MU1ZQytSRTNOK2M1?=
 =?utf-8?B?Zy9mN3Q2Z1FuY2NlcEFabjE5Y2FETXJZMU9WNWlaOG1vRWh5aFBoOCtVVVJ3?=
 =?utf-8?B?OGR6dUNCR3RaSHFSbEgzcDZXQWRPWExIaUhqNy9JUC9BeERBU1BvS0k1NS81?=
 =?utf-8?B?ZzFGV04xZHVXMjNMbG1hR3F5bjJMOTliUkVON3ZGVWpobGxIRkJMQ0kxaCtm?=
 =?utf-8?B?ckJtWkJEdVN0OTBKTUhEbUZEMHlkQ2JaUGFVNUhoZ2FPVkFLTGRtNnB0L05W?=
 =?utf-8?B?NW1PL1dwVDlGNFRSZDZsSmlQSndjSTVsc3JiSlJPaW5ncUw1YnF6SUVUVTVN?=
 =?utf-8?B?eDdtZlhCSW9iUHJnZDVza212MkpyenhhWWhqYmt6bEpXdkZZZmRKWVVDODZV?=
 =?utf-8?B?TVR5YVhkVHlWVGp5OUIwMUt0OVhBVlAxbmtFSTlyd3lPQmEzOGRDRy9mOXZS?=
 =?utf-8?B?UXF3SVVGQlNxUXJ5SlNFZG1FMXhTM1lmTDhSVlF3QlZ6NTVrRjVxWVZXc25j?=
 =?utf-8?B?dFVwTzg0VWdpU0hnY3ltK2Y3d2dodTBySFFxYUJ3WGRMWCt4OS9rbFBidkNi?=
 =?utf-8?B?RnIrVkg1NzcwcGZIcEtwTU1uWDAvMXZETTNmT3ZENVFEV2JLVFEvVHMrZm5t?=
 =?utf-8?B?MlY1NDRYZWRsZEx1b0VNUFFEWkNMWTNldTB3MVJnY0pjZ1NvVzdzQlZ0VVh4?=
 =?utf-8?B?bUJSbC80blVpOWZYaGF3Mm42bEpKSU9rZlg4Z0thTTczQzU5ejh1QmN0T21u?=
 =?utf-8?B?dytwVmhjcHNhQUhlcncrMkNhZFQzbFNPUGN4SUdHWUVXYlFncjFwUGZ4LzhV?=
 =?utf-8?B?N1NhaVB0QmZ4OEFJc0x1WG4ycG9ZWmxyRktoYlVCam5CNlQrVzlaNjExaytW?=
 =?utf-8?B?Y3hBS25kbWdUUmtRb3F3N1JERFdlZjBUY2VWSUd4Z2NmUUpZaFNHLzhscDRY?=
 =?utf-8?B?a21KWmhOZy9vSXRBYW10eDUzNGpGZHBuU3VrUEhkTmkrR01IOXNGcmY5QmJ6?=
 =?utf-8?B?NEYvb0FUN2ZMZ3FZaFgxUzBRQzlKT2JPYVlQU1BiRllIK0V5djFQc0I2aUgw?=
 =?utf-8?B?MHZhVXBXTnplZUcvZ3BhTG9yR0lCRWhpdFNmOWhyUXE2WVRRYTNZTTVxSzVv?=
 =?utf-8?B?UmNwcUswVFp0UGg3R3lucmZMSlI0b3p3VjI4QURkN24xNm5Iemhma3FPcHZp?=
 =?utf-8?B?Q3JrSFRrVXphVzFWQ2xtclMxQjJWZ3ZjdXUzUHhtVkdkMjVEeHF5OWI2dU9p?=
 =?utf-8?B?ZTN6YXZwLzVsT3BCeXovT1YzMWlDV3Jhbk5rSGk5N1ROY0E0OTZKSEFMUWdU?=
 =?utf-8?B?Z2VDcDNFcHc3NkpjT05Bem9DMjJqZ0FoYjRZbzVIcXZ3MUphbko0dXFtMVVz?=
 =?utf-8?B?MS83RXdpVExpZG9qaFhvM1pEQ25NRVZtdXhUWmVXNjhLaGlyN2pWS1VWSEFE?=
 =?utf-8?B?cnExUVpFRndWd0lWSjJZMDZacGhpbVYxWjlGclg1eVdDTy9SNVZPVmdTRGx5?=
 =?utf-8?B?OWpjbExUUFkrVlhrQk9EQkhBeDhNeGxVYnBpTkNIZVFCajZnVHFjTzEraW93?=
 =?utf-8?B?M0NraFM2ZjhUczZyNE84WmRSYkl1M0Z2aCtGcy81aGJmaWhHSDIvY0xPUjA4?=
 =?utf-8?B?S3B2bktJSTFlYzRBZGRBbGFocXoydW44eTlnUVliTzdEREdqYi81bjVGT0F0?=
 =?utf-8?B?bXFiSEhreVMvM0dLeWhjZU0zWGVwb2FLNDMzcFFuc3p5MkZhTGwzQnlnOU5w?=
 =?utf-8?B?TVFMQzJhaE80ekx2NHZCZ29qMDcyMEdiVnhPQjI3WVp1S285QWRFdFE3eGRO?=
 =?utf-8?B?OUhtUmlybXpNd3BPTEtnazZUM3duSEp2TElEckN1djJCT0U3aGJ5Mm00WUlD?=
 =?utf-8?B?amhlRnJyTlpjWlViUEdWcUxNbzE5V0xNMjhqdTNBcUUvY2RuWkhLaVMvMldz?=
 =?utf-8?Q?d9M8joNcxdeqtivmZHR0pFuel3MKcoBDHao+Q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741ecc22-db02-41b3-cbe7-08df1d960532
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 19:23:48.1242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xg6nBkp5W9dHAcAQRK0/r3zPv0cydR3cYY/r73aTNOWNeY635KFDO23WJUrpmSXx0hGVawBisQDm8VDToDM99O//ZRAnnSHchiVhAk8hkyvdL+7A6j46WSAjkA7u5HCa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10646

From: Frank Li <Frank.Li@nxp.com>


On Wed, 29 Jul 2026 21:07:56 +0800, Peng Fan (OSS) wrote:
> The imx_rproc driver uses node names to identify reserved memory regions.
> It checks for "vdev0buffer" to skip mapping, "rsc-table" to locate the
> resource table, and "vdev" prefix to filter vdev regions. Several i.MX
> board dts files used incorrect node names (e.g. "vdevbuffer",
> "memory-rsc-table", "memory@..."), causing the driver to fail these
> checks.
> 
> [...]

Applied, thanks!

[01/12] arm64: dts: imx8dxl-evk: fix reserved memory node names for remoteproc
        commit: c4e5f1a143799651aba2c4f66860b63b56786306
[02/12] arm64: dts: imx8qm-mek: fix reserved memory node names for remoteproc
        commit: c712a46c10d38ce7869a9d81d7986e844a4e9f24
[03/12] arm64: dts: imx8qm-mek: fix dsp reserved memory node names for remoteproc
        commit: 2cd565bde7e872409fa468fb9410e539fb5969e4
[04/12] arm64: dts: imx8qxp-mek: fix reserved memory node names for remoteproc
        commit: a9f3cf4354022ca0b4a0d12eab7af9858f71c9f7
[05/12] arm64: dts: imx8qxp-mek: fix dsp reserved memory node names for remoteproc
        commit: 715f8f8877d03025a2af98b4128c83441617eb74
[06/12] arm64: dts: imx8ulp-evk: fix reserved memory node names for remoteproc
        commit: f55e49b75c65c3e38e7bbe1d735f79128a50126e
[07/12] arm64: dts: imx93-11x11-frdm: fix reserved memory node names for remoteproc
        commit: ab6fc27a020a18a765e17bc445b64ee18b6244de
[08/12] arm64: dts: imx93-14x14-evk: fix reserved memory node names for remoteproc
        commit: e62f7ef5320d05361ee7f665568d05361b0c59d9
[09/12] arm64: dts: imx93-9x9-qsb: fix reserved memory node names for remoteproc
        commit: 475a58b82921cc89805b31e0bc1df91681124a3d
[10/12] arm64: dts: imx8dxl-sr-som: fix reserved memory node names for remoteproc
        commit: d8aa7355f91ed71502f588d33200a211f24f58ef
[11/12] arm64: dts: imx93-11x11-evk: fix reserved memory node names for remoteproc
        commit: 7e92e62246c472418230b48c05e9296835b26b07
[12/12] arm64: dts: imx95-15x15-frdm: fix reserved memory node names for remoteproc
        commit: 5cae743b988da033a709bfa10739b1d34fe57e71

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
