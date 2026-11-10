Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794312472;
	b=gKU56mYIrqmDXtmGpWYeJm6BN9DYjALhjZlYEplrBSySgmnNhyB2U3Ea2DHcUDb/hBbX
	 eS83ZkeIbHj4RJ8TLQ8MmAhy9o8RJoXCPmNbVjNy5pBn3k17axzatBvwIvjiVYS9/ACli
	 NZKcYVEbUk8DuOmeo725fDQ1ptX1hKtBea2ZIxMOMvufEi+EqjtrZ4ZqUR86phJEyXcjT
	 GEVjybLblflkqCjgCVHP1kSZhkpyQreTcjgYU6EwayMlB/sdw8YpExXFAqBFEpo6CynMy
	 tvKLZrmk+TPUHK4vNar+u0WKeEzp/JBW/sU+Q1j0kOnjhW8SqGXJzYZojgwSqqN3zHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312472;
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
	bh=L9BDAmKDm6+rN3ClNskIkdLiVDtW4yfZGmFhqdyf3AE=;
	b=HBkThS2xRljQo/0Jdudk/eRPPNs6DM4okpQup8e+djM3tqdjyBbSoDfHZwLcxZ4Q/Ifq
	 gwZUl5Kyd7gVsoPYiVBT82grjtip5uaeNIaQ7tR3CihuK5yQPgl1OYVeSBnTMG/y8CKAu
	 CNDJijsAAkpJF/DmSpNgawF/9Qnk7yPTiiB+962Ut+xUbbhBCL/S26QumrVelqCVVuhf4
	 pL70PgwMnP9piqKrS6LoKSTfckyX3aiW0ToKCUdH6ZK/dp/UMkKNH9v0qmtSSHb9pk69s
	 zYThyiV1iMIGpK8lrVWNXDC7VwlcATqUvah+pjjvmDM0fXa8K1fDKlg1rzsWY/pICIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Wi3ZFcQp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.29
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013029.outbound.protection.outlook.com [40.107.162.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB89C606A321;
	Tue, 10 Nov 2026 12:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB89C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Wi3ZFcQp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VW1AHC8jtcHdI8SSbqKdTVhLvGTrVxym1DQdDMsaLNst+yOPmP5fYNDIfc66nTc79Rp/qa+i81Q9HYoYGxciQw9ztRoGevo88tawJpk4L9mqvsOG/DzJ0Gk3DxZQa/sgZVlxumexw4GFU3nfAy/6MnN0XynxyiBbRWmY9DC6WTDxALgCqoHPjfyh0B8DRd3b8SnstmXW+WhoN68TvArzS3Utx2JkJ/B/oOGSqwAde2HIVpDr6dJcROnFQa5jlcjGz8j9czOZYi2UxYzhKw3xl6qXfzb4+QAhTO1pJzPMATj86IgccdbDV0I/R+JdupvZKLgr7HqBQ67jQqKf0XYjrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9BDAmKDm6+rN3ClNskIkdLiVDtW4yfZGmFhqdyf3AE=;
 b=qjIdILLGcuIqpu2ezHLQf8jIimx+ug67O2O3nQdYBHKmObMvywgUoWvVHWsnAQ5Mq4oTsxrs2IrcDh28h5FATcxZQ8dmZey86lYFIzdxcScyYWiKcySWJQk5gA/C9WfmIDfTWmehle0k4uZLCjr8lKKUpx06G64kyCkgK79WZBE3jjBdE9q7mthTyj3kFqzqzO/+CLQAV4dJJPS8E88M5E9iXSyQfP+/lkbZUCdeK/ztE7W/1bQm19/pqCjR2cypEihQuFgE0dzqvH0cptYs0h3ULHqjszlI0m2wLoazzjD1aF727X6sJ1E417QV8vONVH+ySCpeLdE8fDqAIvYCkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9BDAmKDm6+rN3ClNskIkdLiVDtW4yfZGmFhqdyf3AE=;
 b=Wi3ZFcQprM6ohcGBSulxf+iCfjCk+djN+y4yE7EYAv9uzWnnLiQWbpLCTgmWEDiIqnb8PhmHRA5sIQGOFg6oalHfhSyvpawsYuNXAGvTsteCmydOadoFNbg1t3pAWyeEz10Jne4qYnZAgQTWzYWLNGQf0L9JzwtxWySYJAfeSib2prbyOOJTON4H9HdLRZyXMyEVus29q/3af1UCgDeEPcYFSh4LaKOW9xRbDfeua2ELJTM2M11ho/0kMUV8OJ0MlT1i9/PC6cOpv5XqBPJ+7N6U8MS7hF/rJ/dxlbAzdFT0LrjdUTCEhG+BwVzPxYK12RYw352LG4ZrOuy46+QVyw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com (2603:10a6:20b:23::20)
 by VI3PR04MB572389.eurprd04.prod.outlook.com (2603:10a6:800:377::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 12:07:48 +0000
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0]) by AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 12:07:48 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	Stefan Ghetu <stefan.ghetu@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] ASoC: fsl_asrc/fsl_easrc: fix memory safety issues
Date: Tue, 10 Nov 2026 14:07:38 +0200
Message-Id: <20261110120743.6301-1-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0419.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::18) To AM6PR04MB4472.eurprd04.prod.outlook.com
 (2603:10a6:20b:23::20)
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
X-MS-TrafficTypeDiagnostic: AM6PR04MB4472:EE_|VI3PR04MB572389:EE_
X-MS-Office365-Filtering-Correlation-Id: f4cec6d0-342b-4e65-a281-08df3f233c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|23010399003|7416014|6133799003|18002099003|3023799007|261026140227099003|56012099006|11063799006|261022105027099003|261028144727099003|261021121427099003|261009221727099003|261009221227099003|261102123227099003|261009223327099003|261009220027099003|261021123027099003|261009223027099003|10067099003|261022075727099003|261026121527099003|260925021311599003|260925021911599003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	v9c7VHR7Q5V5tVMHptlsHqaM+rta3f0ElYJoKxjOuQ0JYw+VhVBPxFwCC+QU2U8bOd0Ki/klAkybBtfPK7Z9sHg15ElTKRMO88mcc9kEQFgIJMbIuv7gKvXIBDJLAM25hZMAC2wa4UeMYlq9IXLKiOw6W7hbgw9HtBBjSi8frIwOENpkxHR5L5sixCg9bpsuxrva+8rk/OtcyG8dq9Q0aORsVsM8kQBDPiHHbrwWXveOG05X5U5IaxqP4o/f3oSblmimN0uXvS1993qcwEJvI2ujN6cWgQWsyL1Bbxr8eg7F/ZGGgdnOZ8DpCkf/o9FsD0pKDjeNcWjkB4AySuk76qNKynHD0QYXCwxWnEFFVB8+gs5+KbNA4gmez50cdN45egqMYTc0N84GDWBvgz86NBCWELNdiTFpdC+dvLkHVHZRdrFy2l5sLt06NeX41YwMVEQB6Bsbq7wkpTnmHAE7UixjD1CNoamHyx6vSdLieZXSg4LzBiQ2cdeitrDecVZW5DxCWSfWIk5GfO4NgTFyYyV52XDJm3tN1b157bIiwrzzYm9EEqR6Wal7Qq+mYyaxgJDR8402wi8duABPUAK1MsISvVMNjh2QWY1PmYXUmeO1B3YzqEPg56tMKGuABHHyrEAl1nyENr1f5Rxp5QdP8GUST566vml0EOun82laj3g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4472.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(23010399003)(7416014)(6133799003)(18002099003)(3023799007)(261026140227099003)(56012099006)(11063799006)(261022105027099003)(261028144727099003)(261021121427099003)(261009221727099003)(261009221227099003)(261102123227099003)(261009223327099003)(261009220027099003)(261021123027099003)(261009223027099003)(10067099003)(261022075727099003)(261026121527099003)(260925021311599003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zj0JGTjDN3VHn5xvT0Dnigqw72mgPOz8lTF53jA60Wxg2AWjI0C28+d/icgW?=
 =?us-ascii?Q?Ps49+goC4SNXPIn0smEv8TLolRwGuJGFN+tUUXkLtdib5sPOCMjgcGZkXvh3?=
 =?us-ascii?Q?F2UwH6R6vmp1VIxSbuKeYuiInuSC3kbKvogrRlas49rbgOP1g7uh2Y0M4fag?=
 =?us-ascii?Q?hunXtcbakE9UFc4bi7lK6HIoXHvd+Ml7RsfZpSk3ikWEHVemwiHURJ+QsECI?=
 =?us-ascii?Q?P03lHLlNQtd20Uw5eDBJJin7CD1mJ8pK3XJqkjN/gGw6Ql5AIHrHzg+tH4N4?=
 =?us-ascii?Q?1brIbgvBMrvu4YtigtK6AirT549LKp9VHs/Z8gM8tjbmWwJvrzJ4ZT1MbP5P?=
 =?us-ascii?Q?qf35sECVLs/LDVgN7bi6TZsC0BSBC9nV+MS/Z1liFULqyITA/w6jBHEXwHsT?=
 =?us-ascii?Q?VvhYsMxxbrV/ym3dLZgLOZzHaDuFjaQZKhRlLdzCKQl35Jkls7nInfucDO8z?=
 =?us-ascii?Q?6vdMvcbDqKJNuCUrN2dQWtc+viYaCU8W/JaoKsofrAWvEN/ud0Gztje+6yCX?=
 =?us-ascii?Q?41M565w3ryu8IICI1qiYTZxobr1hWvxQJ1tfjD6ASXtGll8Y2KoCWl7HvR8F?=
 =?us-ascii?Q?96mj1hPHajHsTWc0bG0iE3eeXWGauiSh+6Z2dYGAofqYSBgKl05w+tytMy9V?=
 =?us-ascii?Q?/eVjz7sR/5RHhN6f0UDTbS8EBrRWmF8B+db0ms4ZtewYmrDJgf+olYYcngNw?=
 =?us-ascii?Q?qk1YiDU2im96I5Xe2sfjpckIgX0mj7oQlelclpzawgDIlS+Q0yhGMNPCR6yu?=
 =?us-ascii?Q?YtpD9TtFkgmdkHWqgY+HlCnO5GrMd0gsM5AeMx4fVt7WAYNANuy/xR7oUuXJ?=
 =?us-ascii?Q?NM5n0yrVRCEBqHXBFUPwimRv6xuDyJO/4nXX7SCwNQj2jai+PThX6AQ1K9ZK?=
 =?us-ascii?Q?RxPGlH5dMqYgfB/SCDeuEDlFi1YrFEeuF+1T6WrI6NDjO1KwbTbtom4HBdUT?=
 =?us-ascii?Q?PfwiqJ+lNcqyc7qPsv+rlbGfbZC8BMlXT6N5XxDu1AVxD7n2K9r3lSI8PaEx?=
 =?us-ascii?Q?ZboyViypuYMmzSBxGHC0Gj0DPRlxgnKaSRSrbAcbTuxjTX/EQq6kiUylc+aJ?=
 =?us-ascii?Q?bJQyYifhaP5vcm7UYSSfV0QSiz0WVQTJBzeKVzM9o74iEyB5oHK3wk6k+nR6?=
 =?us-ascii?Q?70HrfD9cId9pP42yYbRQfbmx58QCR7T+nOXs8lxBjNTOa0UhLMYcYOagzgo9?=
 =?us-ascii?Q?VgFWftQsX60eZcTUD9MJ5Y9Ed9vz8a+f6nlTGHw/6z5OAnAgR3jj/No/Cs4o?=
 =?us-ascii?Q?Zr9+6U4idM3TlTtWhavUqTXMbCHjbiWvktnX+11kMB7AR6vf6yZtHSBZbzTq?=
 =?us-ascii?Q?5DgDEokt/RQ3OjltSaJTewp+fpFt5dJnIf04MCwlXxtHwbqned83cdfM4ecM?=
 =?us-ascii?Q?atqkPtGNcLEBO3cq6fmTEtuNIdKnbaBvP6PogRGjZBXspwZORMcSrjVopZsk?=
 =?us-ascii?Q?BrqnJHwOCnIHHi6GJJgjy950Q2UHuPNlp9Qy4c9IGNbB31SJWAPVMlu+4cPL?=
 =?us-ascii?Q?m/1b4j5AjabpJekRFwPbTuGgzzVBAUDaHmdA2M0hUbsXGz8gCxfxkdiAP2x5?=
 =?us-ascii?Q?mMGYXXVYTkog3Y1Ps9P28QFEaE4t5IriD4AzSZAHioubHvr2vI2SEpGNad5b?=
 =?us-ascii?Q?jD4o7LltQrUy13bioe5QZJuVWtdciFCJ0Qbbq0nj9Ao6RguKpl3xYij0OOJZ?=
 =?us-ascii?Q?tAfkeYtmcpI0J7XFZFuLjmlGUrwogZUz132f9YBYd/YO1giXI7rF6yEGXlyo?=
 =?us-ascii?Q?Kys7QWeSvA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cec6d0-342b-4e65-a281-08df3f233c6a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4472.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 12:07:48.1270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lxF4XOT7UTo5Ydyk92N37EnXgyptI58u0grBnFLasBfHBfth35WQnNHsKWeeDGrrafqRMLhEPskH0XcqEyjFew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI3PR04MB572389

This series fixes memory safety issues in the ASRC and EASRC drivers
that can be triggered by a user with access to their PCM or compress
devices:

1. fsl_asrc_m2m: the output FIFO drain can write past the end of the
   output buffer.
2. fsl_asrc: a repeated hw_params() leaves a stale asrc->pair[] entry
   that points to freed memory after close, and hw_free() after a
   failed hw_params() can release the pair of another stream.
3. fsl_asrc_dma: DMA channels are leaked on a repeated hw_params(), and
   released twice after a Back-End configuration error.
4. fsl_easrc: the same repeated hw_params() issue for EASRC contexts.
5. fsl_asrc_m2m: more than one task per compress stream leads to double
   DMA channel release and a stale pair entry.

Patches 2 and 4 make the pair/context release ownership-checked; patch
5 relies on them. Please apply in order.

Validated on i.MX8MP (EASRC) and i.MX8QM (ASRC).

Stefan Ghetu (5):
  ASoC: fsl_asrc_m2m: fix out-of-bounds write when draining the output
    FIFO
  ASoC: fsl_asrc: fix pair ownership on repeated or failed hw_params
  ASoC: fsl_asrc_dma: release DMA channels on repeated hw_params
  ASoC: fsl_easrc: fix context ownership on repeated hw_params
  ASoC: fsl_asrc_m2m: allow only one task at a time per stream

 sound/soc/fsl/fsl_asrc.c     | 22 ++++++++++++++++++++++
 sound/soc/fsl/fsl_asrc_dma.c | 27 ++++++++++++++++++---------
 sound/soc/fsl/fsl_asrc_m2m.c | 25 +++++++++++++++++--------
 sound/soc/fsl/fsl_easrc.c    | 10 ++++++++++
 4 files changed, 67 insertions(+), 17 deletions(-)


base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
-- 
2.53.0

