Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793720318;
	b=x8tkt+3KblvEc/KcGwYXZ5qjRZx8+YB273uW1sZp6Rbyq0eSAMKfs72sqMDP2ZjOVoxM
	 nBzYi8TG23mB0qhrj7JJZGaSXv9Sx8/DmnlXmq+8Wln/zeMVGTkDJtPVhqMrrL6lTflff
	 c+lC7kooGiTalOlCMJXTsS1MX8buXQSm6uCdtv5ZdoITbzIOKIKa2ik1vy2CRnWL3z4wg
	 TNyPW+uZTcg46YYaxLKZxjCH9FsdFFfCxZGkPuEtv1p7Z6QuViRBYWSTLUvYcai7OCDSm
	 L/cQKgAgkdVKYVMlqOHgrEXK+wL+HBN5BD+NBfMD9Y5GnzfNVR2P+VXdS8A+hgRqtog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720318;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=fi+ZX/fDu9taVC5Nhi4FJ4CN9NtdhQg8Kdi9aqx8BOM=;
	b=PD/7iRVzFGQxx/EzqHmc3jaMTXrLJD9PcbCFb5LAIgawqjlWNvlLcZTkuS7d5s/B1NOk
	 KHlfa7Q9U251QoijVD3vCNygsQTmQ4m2fxv6Nnj5gtdMjBJMd9ylnGPV6viTscDEiS17j
	 TVL0BkjA+Cah6DxHia8+K/E4aVcQrnuOMNgZ3ZCVcp8FDFfFvWMUHoaCvdaNAlUTalPTi
	 HzWsOQ2tDA5wXxu2sDm9jZCiOU7UylIoWsrfXC2POip0whbzRFchYu92Da0wRJwOeSDLU
	 mUzRiTNKw6e9fTzjy1YsQwtynr5KmRQyjDNANitbHABxppWlyHdycsTegVsM1MjHDVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SmcsE22s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.69
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013069.outbound.protection.outlook.com [40.107.162.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CE8606A33F;
	Tue,  3 Nov 2026 15:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22CE8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SmcsE22s
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lc4z/qSrc754LyGJGzAu19fivAgZ3tolZfIpkuOHRZk9Q0oGZOdFZNh6ssWTJqwEx3Qem+FnmUyVOUxRps6k7e4m5JXmGKURuR6tKKDVTgNMH6BIXw8S/Ya0rNY0G04uf7v/fjcQaADsOCUbrQrmCgQOdCVnro4UNasKU5hN7OaPETQq3rxd2X066U/iewKyJRrikcWpAEQki7Po8hvtGk8aCwZX9VKk33fkMb/wZPBrxBEJG21kwkq8YzKSH3RMf1DLRd8gL46tT0dNMDX6Er0j263fClctX2tCIrygMHt8eEsxsPiJyY3AJanno7CEX7u5/yeb9w69URJCcJHdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fi+ZX/fDu9taVC5Nhi4FJ4CN9NtdhQg8Kdi9aqx8BOM=;
 b=cSdhDFpUqNwOOdQH7w8fKa01Ju+zwYo5Yr798N0JGVsKAzbEuz+tVP+UNeAy/Afpo6easYlNWYJJhDadOu92+4L4Zbb6l6DUIISWOws6fhU+W+55mt3j29B4S5+R2oEpepdx7gVyzDgMxDDC1cDsoHSCfthjkXUUXHPSbdzq2jhBZs8y8zd64HP7wDQOd3SEU4S4UBAlm/wBgPGwCpntTXiG4cAzRcTRaRrEQUKZAGzST8nOPm4XUXVqbdVu7+1C7+lHhKDhBrIMjYYdg5im3A43x6MvIqs7LJBhIR/YKxkFGmfIPhOr/qj4yx1w3i5iJTCZZQwCiv4iKWZkQ8JrhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fi+ZX/fDu9taVC5Nhi4FJ4CN9NtdhQg8Kdi9aqx8BOM=;
 b=SmcsE22sAagc8B+4/nl6nKt36a2YFFeoayy3AAywCppQSYXKlpqi89CQRjFCfiqsh7jHtdMI7pD6kuzfk9NpptrPh01pq/N3tDZDv0DsGh3ubRsRJcAuG8MaKSoU28fxIYr4EBzSh3WJ4cNXK86FgxrPBA2mhbGONw0oQ0moqwAoNJjVCPv5uA9NDyIuuDblZoX8a7lUgRejmGjPzLYVqWnCmsvl7dl1JYrJlIkk9ilAOWd21MVoTRsd/eCj9jzcfwRZXetVLqZxGhioN78EX+QaOC7GvLopUJ7qXlGgAxrb9tfoVc/RgCTxIl46gSBxSx4dT56AXqMfIkmnj4yiyw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MMZPR04MB291581.eurprd04.prod.outlook.com (2603:10a6:190:51::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 15:38:35 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:38:35 +0000
From: Frank.Li@oss.nxp.com
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-media@vger.kernel.org (open list:XILINX VIDEO IP CORES),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 8/9] media: xilinx: use dmaengine_desc_set_callback()
Date: Tue,  3 Nov 2026 10:37:08 -0500
Message-ID: <20261103153721.1232488-8-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
References: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR20CA0016.namprd20.prod.outlook.com
 (2603:10b6:510:23c::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MMZPR04MB291581:EE_
X-MS-Office365-Filtering-Correlation-Id: 05105950-a882-4261-fa74-08df39c085b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|19092799006|261022105027099003|11063799006|56012099006|261009223027099003|261102123227099003|261028144727099003|261021123027099003|261026121527099003|261026140227099003|261021121427099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xGwTur5mYTyh0meKjGwBm2xUjFrHZabPoV6W+xa8b6z8YlcZzVT9ebphQS0WFQFZ7tZ6XRNY4u5dPei44h5mo11703wqWTCm6v/uTP1uQdqZiKkLSI9s6tNS10IUIx5B+m7XW4RR0sw7Ta+LTIojVhLpSzelWAzA0KIRhApGX3kBYe+wLYSUr37AULJappnBnxYbTDCJ6PpccBzLbO57pf70zHH0u1jsU9tLRZlzUdJ2u/MJCpwK+zvwhoCkfX5FqDJ9nOdi5B5s8Z8XptNZi1R/wi3TvoQAqbKSQOwZ9fhhIJ/o19+47x83Z+hYOMsqGOuPJIsRtZPUsLMZZS5dUYtOV8DAYCQF55v304m0ULbHxBPpSk9d4wylGHo398Y3lFwSR/ER3OqpAcwVrItdD/sPtBd+ti7A1IxIAaOp0B71mKtkQXuq0DSIIHdovR6bWQF4/f3Hg2aAc6/FFJML2BCaqPF6Yn9bc5jWithQEdvntEk45jGfqh1vzqZWtgTviCAEVMOzcdbNRjhmdNCLR1PdHq61ac4Da3r0xlRK1l3lcUnzBoYqPYtXiEG3wCb0coKHKioxJ5xNscOhRxzxCB85jgFwgLtKrlyLXnNtN3+aqPDHLC/zLsPJ7aQGjuls
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(19092799006)(261022105027099003)(11063799006)(56012099006)(261009223027099003)(261102123227099003)(261028144727099003)(261021123027099003)(261026121527099003)(261026140227099003)(261021121427099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sYHr9QTszTdBli1gJGh1G7hvXbanzs8o8gQrNSvak3HKggOIqZh71WjTrjLZ?=
 =?us-ascii?Q?u+UbSW9Plo9TBqqXnklPdMwX1U4QqEEtuzIohBz9LPyX6KQ0CSmjNVIMT3jk?=
 =?us-ascii?Q?dBc1IgkQk9buEU+Y2ARig+tinzqJTH3gSNLnlVZ0OJ8vm84QDQ0g+cryJcQA?=
 =?us-ascii?Q?/SFIpvYVnV+Ael9L6VRt+nqTv/hp5KHMd8QDPInj55HwGzkIC6bZGuzvQ8VC?=
 =?us-ascii?Q?00o+5SJ63XuDPGm9L80g2x2fgxXnEUOYFwiyBYqReM6VyT+s1sdpM3GCItyu?=
 =?us-ascii?Q?n2QHtQ1cOhZhrVdsmS4eUGlg6c8WgVCcZ4fafWWyrvYXNShcOkUh91QR3S17?=
 =?us-ascii?Q?OIBtOSU3s28iwYpwz6jclhEERPa8DsEPqtVCE8kZT2MY5bFTdjQOQf6A+1WF?=
 =?us-ascii?Q?h+m60i7ziAm78mWa5IZjiDzkK3zTtzpVpfLeZ+c/EU91Rrb4B3RwvPAud+EX?=
 =?us-ascii?Q?BP3ROIHs5R5kY5X+rQxQuNABRySIdwF9WnrDBaP7Si/3EA0SflzalzC5+UU5?=
 =?us-ascii?Q?wSMjo4StXMZMr5iX91WOUnP4Muc6RlzBYxDn6CcrCrSiQjAfE5iUBJ+1kNjZ?=
 =?us-ascii?Q?lnkMqL5q+9XHAykW8Eplb2HglDkR51rpmogFifQl86ZiM330UTO+9txZUebu?=
 =?us-ascii?Q?vQQsvSFHapKODNueLHAJMbsUHlc8PUC5WaNzJne/u6EWvlrhGiDRVthYuGzc?=
 =?us-ascii?Q?ZEkFcwQN4kcP59dWCpFTBe5CsWb/F+xP7eg+EFyTSp5uV/vfEHgHnoY+twHk?=
 =?us-ascii?Q?OdaCZZM+4cunrIex0sXypXyIlB7EJOJZRelqDPLM5FjyrzgjCw5NobzX6/I8?=
 =?us-ascii?Q?5m9WmygIRVLnhnwESnS3eHysE/MFjlfZHCt64UYziTHYZ2rEAHYz3thysM6L?=
 =?us-ascii?Q?r5wAB7KsQ8Q76yBHmdP4TnDx6ammDVFleeUJ6sq5gRbmA2T8GG7N1q6GJJ1A?=
 =?us-ascii?Q?oObWXBey5vX37xZ2zerOITv8XYVyj9AVkAs1P2hUIKncyoOQp3MPp9WOdzMI?=
 =?us-ascii?Q?NT5hgdTsApoRvbtxQuVW6vXqO9u1HjIMOIdt9JJgL8Q0AgX6AnpnkLRSNIUB?=
 =?us-ascii?Q?nLIwe2avnwa9rRzs20hWn9iR1gfXDY2e6a5CtlV9ezt5i6UJw7QOV9N0G7/J?=
 =?us-ascii?Q?MQEKGKsBvyGp+BxuKnQCc8FY+RwlPG0+gNDRCtgznUCrVGjqinaFnI/UU+7V?=
 =?us-ascii?Q?kbpnSO5nkp/S0JYzOCE+8BYxZmmHH2CMj1nOuxlf6dPyCPhvwMG8bwI2UN9j?=
 =?us-ascii?Q?LcvBeNujQNOg9TnAtT1x67/HJwDQLRrb7JNLqjg8jdfM31PobVkplb5X+6rl?=
 =?us-ascii?Q?DB9GZ2R5cKz1OklVj6nzg6KThATILNTfADohHFenAVVKBjjBMZmhd7KjKxXe?=
 =?us-ascii?Q?GCCUIXlgzKhylL4X1bk+Jv/7+3vQ3djpfVgS/KXw/htFrbvQrh5KXn/k+YpB?=
 =?us-ascii?Q?t/7VmwKU8+T2qMFRaL7Fgn9FsND3gcUhCnOuYVYEmcHOPGqEnRSIcUXmOqP5?=
 =?us-ascii?Q?6rnvP3a5Erm5PacX0vN8qpCYJuTZLmC5H5KIzBPXEd7D31ULNLfdvq9KFn7q?=
 =?us-ascii?Q?ICI7yvQ/SYEbH6Qb/P4ksVtsoDzUqhwImM5akSkBv14JdWkZG05iLaxSBYQV?=
 =?us-ascii?Q?S5zvZDWPfqgJpIOq7yvgKuG6Qu9u1ykD8d3U1RJ4M7dNwpWHg2XpgVpXEfIN?=
 =?us-ascii?Q?Jj313HwKn1LadL0jX9Hzb2OUrUNaA1Meu+QbqlmEMVTrKzSlcWmX/rVEgOYt?=
 =?us-ascii?Q?blPnB2OPm1AWdaLAQclqsGqRj8pvWs73zrMdzO7vM1CoTQWlsXfI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05105950-a882-4261-fa74-08df39c085b1
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:38:35.0080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkUQCxhKLojAm0hIadF8PI+z2gRmkc/GbFtogjKjz8cL2mwX/wbN+/d2YFToRFoRJLW3qcrd71gQiYtxsrTZYCiA/m08JwlNylUg7HrUS4MP5XKclgzdGV6i6dENkhWu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB291581

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded assignments to callback and callback_param fields
of struct dma_async_tx_descriptor with calls to the
dmaengine_desc_set_callback() helper.

No functional change intended. Prepare to make struct
dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
  split to simple patch
https://lore.kernel.org/imx/38f6a9abf37b06318bb6429ac04807941ca8d558.camel@collabora.com/
---
 drivers/media/platform/xilinx/xilinx-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index fcfe0883aba5f..ece2116639fc0 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -358,8 +358,7 @@ static void xvip_dma_buffer_queue(struct vb2_buffer *vb)
 		vb2_buffer_done(&buf->buf.vb2_buf, VB2_BUF_STATE_ERROR);
 		return;
 	}
-	desc->callback = xvip_dma_complete;
-	desc->callback_param = buf;
+	dmaengine_desc_set_callback(desc, xvip_dma_complete, NULL, buf);
 
 	spin_lock_irq(&dma->queued_lock);
 	list_add_tail(&buf->queue, &dma->queued_bufs);
-- 
2.43.0

