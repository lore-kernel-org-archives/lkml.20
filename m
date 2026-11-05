Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793873237;
	b=Y0EPiLOnvrzWTAZy4+D0+9fXCyMzm7RkNI820Br4TOQ7G1YAHk97ii3As7t5PqKJiDP7
	 PRh5YxmJYFwIM89bnyc5/uSbNGTkrCJMRzKMFIPmm8jOYaXM1DYW5SmORGb/Awyan4Xkl
	 eRm/reST7nxJWlX65pTUbb5dLfBZYPAMjk1D6g1arxFpP0XRb32p5qckNtleBesl91cFM
	 AwUauaMNnaJiiNHtbmiNYRlxS5dz3shXbcO1D/YMyVzZiIJB5MHo5MvFwiwnLjrjLmCKS
	 FSvJ+VFX6TYlGXqkGbRCUbKb9OlLkZ+zQZVX77/Lkg7+MPMzyLKPdgFM64rgdR0Eqyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873237;
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
	bh=+UL/2etCOwskJuW8f9sQMCSKPam0VrvJOQdi/TDH0f0=;
	b=YDYyiNiRLQbzn9xPnKNFVh4wgmtd6S/bCmZN2JRaZK0yy9P/TVU0JpwcQNVJxUC3k5rH
	 z3Dg6L9FpaH/Frz2ZUR3wNahuDWfnGpNzp6zNGZAA/2he9ozA8+DkHDsReZ+MYqfIsJmN
	 9z2W+LkKZOtsXFgxt5Kz2/lOBuhGLS+exOFWTFtdPT9PZnC7xN4Hs+fGup6t5L0sE9pHf
	 ZZxK72/arOM/kMEhcWPmOu7RzukIQkyxqwIiRNnb5VEZj+j1ntkl3HaPar0aYza7D5j6M
	 R5FVV9aCL1vEvaYvERnN8oLpvE6HlSmWNRPx2fUX+lE+YYsJBn92ycaQqhgPUhwRanA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Q6lLe8pn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.27
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011027.outbound.protection.outlook.com [40.107.130.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD81F606D82F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD81F606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Q6lLe8pn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gucy5ki7a6IWHV/7TLiLtWSmFEmBTU10GNTyEqa+GmMhQd7CigrqdXIEx5Nl2jE17xXh7S5ywYFop85kqHiPFYrm7Winn6IdfdcetGAT8INg48NOX3iKBoVyGmFJJ6vSfBM7FZ/8j7tRpX8945agfH7JYCOEsmjvfTtMrLMkChmm1HJC88C3/nq6OItkButS3zQhAKzUGTWE8XXeJ6aAWcDhO/J7UTxWLtjrKWUs59ukGYTkHIhKY7qHgiSDQAw3Pv4SNyNWBm0VOAc18ffW3T3wmGpuqOQo+TCqwD0lMJQjsIX+jyhkvl1HbjpIF5TeliY8AXf7on6oooBXkKxkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UL/2etCOwskJuW8f9sQMCSKPam0VrvJOQdi/TDH0f0=;
 b=ybMccfjeuAM29Gq1ppxRqg30IOiYK0cqA1FeyO+NOUdBL3uLfCpe1stAu8xAfc4TFtR3ambMUo8F9O49W6a37Jd7I93dy0wslRVOOvCAGAMnCiHg4nF3CsoJYtYXfM3SKF2G7loCJFxCNmysSBDAfWJvSW7Tf3FLo2eVG6sLsw93Yiq3w+j30wkxYsJtbYCSen1FAsHDaPwgo3lNgsL87MfJsCYtd52lpguY1PrnpA2GBB228bxhoccWg+aPRArCjWxB4kgtzTceE043QC9rKzYk0eFNxmTKucWLKSXkw17hyc4cVDAIA+DIuZ2Z4ogmwSxPDofBYFaXFo/FaS9KDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UL/2etCOwskJuW8f9sQMCSKPam0VrvJOQdi/TDH0f0=;
 b=Q6lLe8pnEBaG8kajlHgUxkFR7ioF4fyBRAjP4ZpSuF+VY+i/apbM1VAFpk4nDNq5HNMzUfDWhOxDMiAX2Pui5DQTXfyhrwMaDBKc5uRJpdIe5AHv6piuvlt2AIe0Ttzmd1xj08KdOk6Su1Rb+HiExokYHHUWcbFaR5UBFOKqcQQJVLX1obcRLXtLoRnZrgrEYo1pSMEvdzBH8uHH855GfOL2ai4TSHJXMHGBBRULK4GglIeF80kcatgn9P+5D+CwzwKDrmHS9qpWE3xL7+kJcwSA69EhRrNUEr5mv+5hTtuEgVmEsuD+JnUQb4WIBoJNCrwHPmPG2SqIDz5ptve9qQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4474.eurprd04.prod.outlook.com (2603:10a6:5:3c::17) by
 PAWPR04MB9986.eurprd04.prod.outlook.com (2603:10a6:102:380::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 10:07:11 +0000
Received: from DB7PR04MB4474.eurprd04.prod.outlook.com
 ([fe80::c22a:1b5e:12e7:8b3e]) by DB7PR04MB4474.eurprd04.prod.outlook.com
 ([fe80::c22a:1b5e:12e7:8b3e%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 10:07:11 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: han.xu@nxp.com,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	daniel.baluta@nxp.com,
	vigneshr@ti.com,
	imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Ghetu <stefan.ghetu@nxp.com>
Subject: [PATCH] mtd: rawnand: gpmi: Fix unintentional integer overflow
Date: Thu,  5 Nov 2026 11:59:35 +0200
Message-Id: <20261105095935.159650-1-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::11) To DB7PR04MB4474.eurprd04.prod.outlook.com
 (2603:10a6:5:3c::17)
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
X-MS-TrafficTypeDiagnostic: DB7PR04MB4474:EE_|PAWPR04MB9986:EE_
X-MS-Office365-Filtering-Correlation-Id: fa56c6e1-66ee-4afb-2761-08df3b248f11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|18002099003|10067099003|56012099006|11063799006|261026121527099003|261009223027099003|261102123227099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	fsJYPe+jnI5fJGsLoZONx3T1jNmcmwhYVUwqRcCfuQqM+QxdL373SJYh4+F3Ggfb+6NsJ2ryMBo7kWdMfsqddTt4DL6bam69tCOpJ13JiotZrTgSKp8/rOkdy4ENHKCZs8QNh+BQIgP1DtBcNiKjEX0/SOc9gQA9sRoIjFAse9p0+0OubRLW2gNHO0Pw5T0Lc/Ff4WYW1LNd6BGEg0mwhaiXIwlHTeJovALsf+LUBb1cf3HBn6p0l9c3QlqLJ+qSFSj9fk+dvVBXbbSzKueE0nX0N3n2lyL4BT1KYPbFiadxdK+EDWMp49G7aENTgTd8v2IDPBwL350VRD42CauN3W/ZlxtylTPp3CbY61PLM8ZQTfNDMM0l24WzRK5yPQzSFzug5n7OO8V7baAoTPZuZiKZalArDSV0eAhita/Bcf7qFFW+2DPbzGinqlmZsu6TvYTelSgZ331UybEgc5U6zlts71ugIEtW0WHmnfAVVvI6ESZg8rPaPapFDv3iuV41CmeGXaH4LLJP8a1Ic0z/1NEm5epbXlTp9Tx8caSYo50rg0f6kOvB5WdcJ2pWHOOmhKJZhtovhwf9DDjScf13Q+Eaul1qb8/33wWQ2wh4yYa2eeNstB2CpJipXZYDWnE+D0CwiYLoWliQxwkvSZ6EPP45ArhHn14RCnZwXx6YesY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4474.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(18002099003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261009223027099003)(261102123227099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ukr6Kh/rs5SdggqMselky1jJo7R7Yh1eO/jVkucNq5aCbK8RNu5DoIOpIIoE?=
 =?us-ascii?Q?qklyTkG7uxwoXLdiqZvpABRDr4XiuIYUwnzDENXrq6oFTIoqje+jA1fCpB2r?=
 =?us-ascii?Q?wYftg4XfTHSCHaSUdAflMiCSDv9rWNIujHRmBeeV5ULEQRAHiiGTNtX0DyzD?=
 =?us-ascii?Q?JJe34QMqCiWS09Ow5PfYlYA2uaeTHIJqynzrfVoq5AM7xFY6B+LHMEv92Bib?=
 =?us-ascii?Q?lhbFCwN40Zyr9y+EXiOzE3Ylf5rrB+pgDBsAg4i21Kgvh3IYxotUzfx9baXP?=
 =?us-ascii?Q?7YWUZEP8WspTrfnpoeqRH8UIy5mVunbcOFR+jvdAoUN/ztVzArN/wwIxTEPH?=
 =?us-ascii?Q?AmWqt2O89ai7NKqwP2yyC3tE0cQG4F1jwNLcCwoYbb0eGXuNcuKZlbemP23O?=
 =?us-ascii?Q?Lh46wp95KTOAoCuKE2K4IFyvMhP4Bpq+sGRiVm58wnFaICX3+FgqJ4pGvcK7?=
 =?us-ascii?Q?GIzM0kcZ76XcbiKOWEDx7DTReh8J1lEYGhoo1/PMffQyILT6Isro85wparur?=
 =?us-ascii?Q?donRfVwad1o8l+3xMHLCPAkTYnwDi8MEYITXaX0CMH6t2NJgoYNYUhVkWTan?=
 =?us-ascii?Q?Aq8IibADPCr6PEpV9XYq3WGU0m0uU0T8X1NcMH9TEx7WWFP6gWk3GRD4Geyb?=
 =?us-ascii?Q?8xF/R0w3iRHw1D4+FFapjrxuhfaJAF65Sv9BjydEH8CKvPwgpJ3J906ct0zl?=
 =?us-ascii?Q?6aui1eMRtEe3jmbbuTTsMxOUHXHPBWnkjJS6gNavHjsLGWM90Hta/1Mv10x7?=
 =?us-ascii?Q?m7dmIYYacV2dR60BTbn1xThXl0wrPiibt7d9zLofnaqFBbvawV3JhcAtCLpA?=
 =?us-ascii?Q?+PnOvXahcFmo1bkQGhrng0GxOrJDF0PwQAaWhmFsucM6G3SPe5frqXNpb9KD?=
 =?us-ascii?Q?jNCl2cbf/26ymh5qHChObsW2UsqaiYz+H9/hQZcdeHoqjw4zd/xCCC8Mv33N?=
 =?us-ascii?Q?zDDjOKn07IhwcV0Eq+gEnly3uBwRgE5+cjGQdowuoN9hhal7IAznO/YhUpYZ?=
 =?us-ascii?Q?5eWb16j6FUdwLlNsA92sw/G5lHwO7QStFKr6gDg+8OtyeU9Vb3+2kIhHnEiZ?=
 =?us-ascii?Q?6dF4UUCV4Ww49SW6IV/L06p8QcYgCuNePCrVHpvo+C9FOIFtmkbhGfJfi3Eo?=
 =?us-ascii?Q?lKpxLELus+L3n1fqMsyFyVv6ILsnrsDdESG+Bgtr+DoDtSWHIO99oOVtvsa5?=
 =?us-ascii?Q?+t0E+kTJAZWmv3paXBaduo4CrqYtQmc//SjUg743KicLOp1hZ8SGxiprH6sc?=
 =?us-ascii?Q?8XeRNRIHtRMwisSu68rX9fTCweNksEzLgJ5nud+A/MIDlmViN26qjtat39zb?=
 =?us-ascii?Q?w3o35T27ywlzWZuP9W5k6KndnxsOx2De6MqxvBuTvWWKQcBq+ue6EFWImovY?=
 =?us-ascii?Q?Ih7TZcjwCY6WgjRMg2WbhWWCX91CldEs0txBNctJ2SynNWQWjPuAIsr7hUjV?=
 =?us-ascii?Q?O5r5W46tKun/SY0kd7dsk3jO8lLOtg3DAEwWignEtW8u2k6uGWWc062Xkyz6?=
 =?us-ascii?Q?lX3AIrtB345+OQLatEW21FqMUWcECpFGObOn/J3G7JtDHODDqv/+AqEPNVxn?=
 =?us-ascii?Q?qsH4xliPAMAX18lBxsQ2HxDkAlJZkLz+2uY8tFukkWsW1L+Yl0J37nRfBkAe?=
 =?us-ascii?Q?Kit0NqO/CN/AV1nFkvoi53pWT3/WWRR0Mna2WUyatzW8iPqkLBrQ1XvSf6lX?=
 =?us-ascii?Q?0KhSfNZNeneXP9oKMbP/1TxFuS2NevuM2l+LlXf9O6+VrdF3G3XIPsjSYVT0?=
 =?us-ascii?Q?GJ3SMlCc1A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa56c6e1-66ee-4afb-2761-08df3b248f11
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4474.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 10:07:11.6587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKm2m0k0GK0qNetM27vWgfv04/oSmg4iyOb2a59DmE/Z7DJS+JMg0z8xQi5/gaoyqK4oFiULe52fC44Wh1IDBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9986

From: Han Xu <han.xu@nxp.com>

Cast block to loff_t before shifting, so that the shift is done in
64-bit arithmetic and the potential integer overflow is avoided.
Reported by Coverity.

Fixes: 10a2bcae9926 ("mtd: add the common code for GPMI-NAND controller driver")
Signed-off-by: Han Xu <han.xu@nxp.com>
Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 0f1528710a6a..e21e407f86c0 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2236,7 +2236,7 @@ static int mx23_boot_init(struct gpmi_nand_data  *this)
 		 */
 		chipnr = block >> (chip->chip_shift - chip->phys_erase_shift);
 		page = block << (chip->phys_erase_shift - chip->page_shift);
-		byte = block <<  chip->phys_erase_shift;
+		byte = (loff_t)block <<  chip->phys_erase_shift;
 
 		/* Send the command to read the conventional block mark. */
 		nand_select_target(chip, chipnr);
-- 
2.34.1

