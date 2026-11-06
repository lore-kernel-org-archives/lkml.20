Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793963724;
	b=HwZjURJBVkQivMSRhF1BuMMsY+uxQ+LxkqFtXnti5U26uCWQf6qqBi+Yx9kIUqX9Bvvv
	 58EmjbvNWAw1kN4qm9+YGGU89raSyhGfjMHJ9eMcGz9ehGWY71vR1wqXDxAiP6yUTtfei
	 ECA2ISeK+ZGn8QVvtYwOymnjAi9g/4Wz87+v+/Hk3PoiOBX6AxRxwW50GzLa5QGKuwAOD
	 jqhMMAeJLlIt3u22PssN5JN3pFEW/35aXfHG73YVPYJF9QMpPpk8IpknhbyJFGa2td+DL
	 jHOWdwNZVAbXhEX74LUGjn5l4BXa2mF1HeF5GzgALHHooLaYYGFfmTH2DVyEKpEpM3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963724;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
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
	bh=800eXqC+o8xtqEVAHX7pVkp40O7MHcE0wW7T5n+JMdg=;
	b=RFaydvyxVtBvNjVMKYLQJ1SHrhskqknN7zFe4mHOnvkPiMil5nuIn3bYu6ZMO01fJNNG
	 AdPBXz6hxdkvV6ZPGA0G/v1sf0yUH1/9i19S9F/U1XCmjC6WZCvvU/csGBAnwDYIujwsb
	 Fv4XrTBE76o3wkA+wexGtcYTJ8eWM9p6zgEZhR7pjj4oK1SsWljirC2nK/skgCpUWsiSl
	 Xn07vf7rzrNRKI76FfYN4sthDZF3Qzx0O8gpqRCT6T2J4G5IShtJYBzBiYztmW5FGjb6L
	 HgDL0UUIsp4uabcFqlOphNYY/+Y8GUH8xRpFqqoFc9sgaaPMth3JlbNd9YlLiY66qIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gku9t9eH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.30
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012030.outbound.protection.outlook.com [52.101.66.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C268760A263D;
	Fri,  6 Nov 2026 11:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C268760A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gku9t9eH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjhkIgXYzEdXbeh6CLCth1S827JD/4SyMM5AO7mPCCRV7nPiNrn2mYEqxa1Urqf+gDZghaVJRNF8cT39wH9T34k9KmnZqKz5e/F19KfDjCrhnnsuy/IRZojN7wVlFOO5HM8p2PRe/XRTI8SIUyw/WXhTt+23fQT1SJf+tGsW0sKbxF8NXSA3djF7gNwFyuNFQkSku0bQNWz+RJ0jocZy6prLFh9ZZVBa97h0Hy5IPiD4pdiVFScnDP0n4qXkXpdJfzvJUgNCXLRxXEZd8RC2Ij4ZVdnxjHimPK1iY5LcotZ+BDotp5frAIGMXAwea/3Fy48n11WOyWEE09CEZDDyog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=800eXqC+o8xtqEVAHX7pVkp40O7MHcE0wW7T5n+JMdg=;
 b=R0e8h2xv+SjqkQHjw4ly2TAKL+vFvniNMjZYpSC/YIviID+lyh8OSu25mWABUVHKnpk2cKBeh2avG6BDSXZHe6l1cgtJjwkMgmjxMaXCF4e7dsSndYi0yWh0f7OCyiPOFy8NpVhKXihj8v+u6WiFPi4l9UtMj4m609iRbrTM3/gknPH+U83SGQMujtM9PK8rsmy3vkceuQ//w4y5Exu7CqR7xORLOp8YnDEu9/K5ygEVYtZdrPwUYo1BjWeMumcFIJZj1FyxCYNBaYpbF58QvTr6EvPEMnF6wNJKq5qURpz2ayR9szgNknwHDyupEA7RokCA8jfHUBNGKl03mwqvsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=800eXqC+o8xtqEVAHX7pVkp40O7MHcE0wW7T5n+JMdg=;
 b=gku9t9eHpKiOaiYQ5TDY9ElqVlS+5RZAsDmf8OU5BIO5Zxjl6lcvlQokGGGGYQqmSdm3Xn7VhbNdF5aEboe7Mx1xh50ppB8Mu1NxazLn1XE2HLE7WW4YgfvTJBGYjaTIcmHnWXlB1jQXjiXWesfgDFHi7RiZnCkktwipz3W/n2K2ZaafpbHjuwOSv+kKyaELWC/6ZpP7Q8a7cqvoF4CgB8i4oZPtO2MzaDx+wehNbUTCIzELJdW49MMhEH8+kT73FfpH4Xeik9gmkN9XdfRRBpwz3JGYSt+8rLDpjlCE0hnKqIsTyeilV9By//PCUVJ788vXj6a/LITXOW362aZ8Tw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8231.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 11:15:19 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 11:15:18 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH 0/2] usb: dwc3: recover USB3 link after controller power loss
Date: Fri,  6 Nov 2026 19:19:41 +0800
Message-Id: <20261106111943.2868733-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb68c68-39d0-42b3-f62b-08df3bf73d9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|19092799006|11063799006|56012099006|261021121427099003|261022105027099003|261022075727099003|261021123027099003|261009223027099003|261102123227099003|261026121527099003|261028144727099003|261026140227099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qS3L8IDPAJf9ubXXTgqOGjafP/ZwY8jriqFn4WeB9QcZrliBba7UqAMc00gFfyVmvdP6dfZSE2C0CZtjyoL7HCcCP0jrxLO7JostrY7fKo0uXrFTB408cZAVCxfefSOOWpJqSv15TCXAshRR1fMLUZio8l47vTNjy2tOFzMkfB8W3n5E5qSFGpRWHs7wO4IXtzdak1ELuzTOyFm6IryjJB+EtgiOwA0E0UiwtNT80cXDii2JwG0ZXG/6V/b3LhonfpEamMi7MENhiDAHHycDSFOJyB0ifmEKjBYX2bCY1j79wloJb+NVDTlYt60FSoXVHPNwWI1mJTqQfIKOKEWhzPk97xzafHQacRbVKg+LASmkQdj8aIO+2soTfHeAZW4v43Bp74QnCymmK8VjIoQEHR90PK4G7qnx0gzk2KtZ1BypSU6WC2ogcFnOoFwZ5wVSVvRZDmVEN5k8aYGrNY6QR1fty13mHI3RLTHE5LJxr06JLwkuB7wA+vwy5Ow3PTrjWKfO/SbVk6Hpk74Fh3jroF2kVplbFkHHI+qW5ukQVFjoM1k+y02YrMScrg/7Za8b36ukuI5E04FJ7vgzrsZVaVHvF3CzJQOTdiJHDUZUe4bakaipmol/lfF9ar5qEi9pmeCG9mNjQLRmwwuHyfzDiEKNVRC5xwkLvlnFNJ4lHwo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(19092799006)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v8weV36lwVAwRO+t21/RzRLGoL8MtojZGArf+TINCvhFUMOL2rx6UVQJVbpk?=
 =?us-ascii?Q?xJxR7XKSH9A4g9FDSLz2D9SjWWXVMcw+xUuNhsGOYh9XUmEIDi0jU+ZQfWlU?=
 =?us-ascii?Q?j7eLIn05ONRHYVQFDlbdHGISGc5ChlCjXr/xkeOv7GdvWIeGcYq7AozCA8f8?=
 =?us-ascii?Q?iZRttuHVaE/k7BYU2E/KREgmjRMB0IzI25DeEGMd00vrFfbgkiIi1ngavhZ9?=
 =?us-ascii?Q?JEm1jukvklZeV/CldkgyDa719O97W3Xqy2whiKsoIMdyBVFJobTj74DCyMLf?=
 =?us-ascii?Q?wwQvyaclC8/AQJx8CXFIuqjgCXgD37Cuto27ZoCHi3N4YtanikeQzD8skTTy?=
 =?us-ascii?Q?h7aLa41S9inF0s7Far2djOpSP9zp64RDJGu6X/VpNhgN1bBAwrZKUe4LfOPH?=
 =?us-ascii?Q?TcaCExhfksvy5aCokh9+WG9b1wLj/UkFJMIflWS5oSK5QjPsO6z9Ye2iFhHM?=
 =?us-ascii?Q?XH60KqC0SFv/B9llVngZ5LDTwkcEDKaEsCENU3rVsWoIB2J9rPpoVA427elm?=
 =?us-ascii?Q?nMNqAukNxulhDgRqrDbbbdDt2Q7yasYr9TMW2rSukGyuGvf2Dq6oYkte7hAR?=
 =?us-ascii?Q?2sNpoaiSYdtnJHEFkvqgorD5BrRzXGpDqujjtZbVDUAqB0YuIUkBuK1cI0Yo?=
 =?us-ascii?Q?LRy12+qEBW7//n4hLJsVZLikUiAJCjT4mmIC/0GD3NqrukPgoCPU2YOhqBSp?=
 =?us-ascii?Q?f1/qsBWDefAUljsaKpxOGAFaOJy8T+JCHyFXJc4+DY6q6JnNIo+Y7p6Lp/Q0?=
 =?us-ascii?Q?8/1TXDzHDV98xNt9x0ctoo985oQMvJk7Xupbv9zRtJ9T7z/ypkWyfx5zlNCo?=
 =?us-ascii?Q?Wk9ESmHbZYeDf7mn2xZNsn39ls3y2wwrbDvw87AZMMhrylAF4KNuUrxNBq9H?=
 =?us-ascii?Q?1Rt71LlAlcB2FEJ/dK4Pa9GdFhlqoMCOfDu9XWbBmKprNWi71r2HS+jJsh71?=
 =?us-ascii?Q?XLFOicY47XT6L/BlESoby4duV8ZCR+eKevhxrDwCC0aD/z3WJOkw7Jpme/B8?=
 =?us-ascii?Q?59U+dIEaYtzhRJkAbysjLEL1i2bMBBVVSRIdUP5QRPu4GV4Zp/2c0q+5IL4G?=
 =?us-ascii?Q?ERhFEMgP/eaW/eL51r/t4/GHl79KJPEuTnzBjObYbOmXU5mCshBhzBl/o9PA?=
 =?us-ascii?Q?i7AHZoqHW0n724W3imCUyiGy+uYDTWZl2Nvl9Qbcx91s76oyFI1lGCzRk6xv?=
 =?us-ascii?Q?Fl3kF6ToRSEgLw532KGkMXU115EjZe4aP46NIk8pCmlX3cafngQShjnF+yBh?=
 =?us-ascii?Q?41+1DWBMQfLjw2nmuIGcdX+BH3Z8NNxYuUbLFqze7ZaMiTcVrSFA+0MSX+2o?=
 =?us-ascii?Q?TOUPJ9vBOMs4sG6MmkippJuNBZ4xYA4aeszt0NGAEspUVOfyLU90ZrV/FHLD?=
 =?us-ascii?Q?Y0wUv+q8pRSpjQSD6sKf/+V4f4XBcUEsEmjZpsXn0vGEyxDxx2LPXqBeX62/?=
 =?us-ascii?Q?8jyU8Syj1wuEs/CKHY5xe/jx6CrMERfa36nWRlxRU9SVvGnf47BtMCJb2qGE?=
 =?us-ascii?Q?CBKy/HHEMN9x3bzD/y6zDmhZCQ4oBXdVXTFQn2F//maemqY1kX+65jzgmPKi?=
 =?us-ascii?Q?5LgaT9r/6tkn0ZltaLYxR4f9vOSIhSj/gDFf1kW0XRGveQ+JLR5b3mxlxghp?=
 =?us-ascii?Q?R/jfD0+GaQY46rrXY2/hYJKczMMBMvnnnYCdl9qovA73iqXEX7Ire94T/RRb?=
 =?us-ascii?Q?Pai1ydSkvauRjvPnpfyQbjzv26fpd8FpygwkbynG7ffPj0z0hixHbSJm15jy?=
 =?us-ascii?Q?wZPe3f3BKDWxLXh3FKreKF51YYavAigQVMOI/u73DxRvtVi0/PP5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb68c68-39d0-42b3-f62b-08df3bf73d9c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 11:15:18.8681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQ6xkNR2EI2d1ao3I5Ue/aGjEnsmGaehED7kj0/a5QGU4M7Opg6ZSFCKxxvgi1GmugUWnugr4Bn3jgexbuPtZ0kc85l8ZG1/PVtUY++VDoX0kCWjlVNNdKZHZuobDDAR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8231

From: Xu Yang <xu.yang_2@nxp.com>

This series fixes a USB3 link recovery failure observed on an i.MX SoC
when the DWC3 host controller loses power during system suspend.

After power is restored, the USB3 port starts in the Disconnected
(RxDetect) state instead of retaining its previous Enabled (U3) state.
Testing on the i.MX SoC shows that the port takes about 2 ms after host
mode is restored to leave RxDetect and enter Polling.

If xHCI is reset while the port is still in RxDetect, the port does not
issue a Warm Reset. Since the USB3 device may still be in U3, the
subsequent LFPS.Polling attempts time out and the controller eventually
reports the device as disconnected.

The first patch adds a DWC3 xHCI resume quirk that waits for the port to
leave RxDetect before xHCI is reset. The second patch enables this quirk
for the affected i.MX8MP platform by setting needs_full_reinit.

With this delay, xHCI is reset after the port can enter Polling, allowing
a Warm Reset to be issued and the USB3 link to recover normally.

Xu Yang (2):
  usb: dwc3: wait for the port to leave RxDetect before xHCI reset
  usb: dwc3: imx8mp: set needs_full_reinit as true

 drivers/usb/dwc3/dwc3-imx8mp.c |  1 +
 drivers/usb/dwc3/host.c        | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

-- 
2.34.1

