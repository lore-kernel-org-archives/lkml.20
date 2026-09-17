Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902BF40BCB2;
	Thu, 17 Sep 2026 20:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678597; cv=fail; b=iAISP/xigmLkDfXaPGiHB9P2WWsXWrFVPIySDLj7waCIjdAAX3OPx9Wf2I27aGOLw6NVC9UNM1SNJMuWhBdMO1DQwhka01KZG5sZzp09JpG8Qsy67Bo0okBa7to2mqw3Fg3IClKXrXVNzheOgo+DOcW4l/drizb6jdJPIPrKw7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678597; c=relaxed/simple;
	bh=dl8Gc0XTvuu++2s6xk622o0wrCyiyfnJ9VhCyfvrqYo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jXTE0Im+V3KaSSoPnSITzmW9QkPI3fVB5hqpPLbgLyDRlnDMt9VhKkN7FEflbk+gJ4Y8Zk6FTFtZGMDAGhqH4VVe0UBPTedwoQnbLymT8M1oVFq6ISoje+1NDS/hPntg64uDk+TnlinNfJCut83mbwUrM2EJDK2FDLBtfE0i8rM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lUxSSv63; arc=fail smtp.client-ip=52.101.70.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lUxSSv63"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnKTOnoNz0LErOuDCBZRoDRwGRLP+ud/A9lQW4IElNNAQVTWrjMY0EzEEEFHe68CCuxhkveYMySBOu7Y91Cu4d6dauzDHJW4rDZwnFIChiFKUXVtZJgQ8fwP6XGYQjnLQLZHdkKc3qTL47toc/fEW7pybhpcIp8O228ppXQQtK9bllzJpO0k1eiOp0Bnr+U8Zlm5WVdTNzcOP6DYrik4EkcpPw7jFNP4me8kBOOxPPhnkxXWgsi7Y+aHlm2S4TK0Kfly2VPH16HeOi7w7pQU895KmfZOUiR1TG05wfmFExeBrtU3u4ByRMUbcVCIpp8eJN/uPE8ijyIYFhzKvdyWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/5lz8YT1SJwbMKqWTLbkjlkXpluM6MbpXfMaEtHabA=;
 b=ImxI1E/JqAzYdpKYCduNg2XwM3MOHQd8NixwDvykGPC9LOl326Dr5dyD2oeRDC5RvNe5YpQG5rUhiZplMS/I5UF7BWSWAD/kz8vv3MB2MMGRL3CWOqRk3Hd18vix3g9Kn4lOuqTez5V8nn8+G9+wMufhstRCtIhOp6PsTzW7VIeNiMRuCu8fzy5fO8QzHtBFKxUjiFaNQ9yRU80Yti3iwKwHsimeCfx44+QQVTZu16kCADdaKbLYSptu5ZnANP9AQjnhez39sPODunP6NSu56tcWcV864IW1PtNJANiqpCS2Ajgw+mAKUfrFJIJ2FfupASte2QE06fq1KMFc0M8BJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/5lz8YT1SJwbMKqWTLbkjlkXpluM6MbpXfMaEtHabA=;
 b=lUxSSv63HU+7Ku4qNiiei6aCWAc/TqS+QHbbJ20z/VkD51aEKgpquBEeht1IamhbxhE6J8r6HCcz9LAC7GX/4gNEVWpKW9R4vntXERgAAoXsyhvIWfvKRXRiL1sjdfhB2Dh6PT7+I+OjKQx1fcKHuQ9zEjEiG6t2duKvqpnZlMFRmRDSGkr5yE1pfv3xd7WvhQ6L9IUKvt+GTHjwcC8sVaiPt5EJtZ+fY+OAmAsv89Rfti4s49NJ5GbP5OGgcWZR1e7TQOwsvxfVD+0OBsFOGpRhdDRBwo5N9f5kCZrfB+ycWe83yvd2upWct/R6jz2BlOGAyKrDpYgjxwZV5MSYsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by PAWPR04MB11572.eurprd04.prod.outlook.com (2603:10a6:102:50d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 20:56:32 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 20:56:32 +0000
From: Frank.Li@oss.nxp.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org
Subject: [PATCH 1/1] usb: use dmaengine_get_dma_device() instead of chan->device->dev
Date: Thu, 17 Sep 2026 16:56:20 -0400
Message-ID: <20260917205625.1299375-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0075.namprd15.prod.outlook.com
 (2603:10b6:930:18::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|PAWPR04MB11572:EE_
X-MS-Office365-Filtering-Correlation-Id: 74649f19-d0cb-45a3-a0b4-08df14fe2704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|366016|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	2pZr7ZSjb2xmX2R6Pv6BlM9I/rBdELJRXeGcZWx2nICrdmE5maqKZbnZjb3yNXLyg911she3ZgMpFVgpSTXjSvmwR+lz/+h+sK5aeIsvYmW9y2ZZ79cnl382b3MrcQk/eKB5j1MhqRoeYW2a5aj7sSXNegAofZxvAO1w0qqD3g6pbP27209j+NE2OK79okPJwbe/w8tS/ccaYoxBO/RiklyXVvylkqMDy0On+K+YBPh52VEmxmt09qScL6VnBvE/QR23+lc5fCmnPtkf6OgwuUfBuYcK7ScrpFGSjgOumIzJTHnr91NQw1J8baR3YVR+e17E+EQGi3tCErQxfIqHt+Q/qqowS4DQS/PyYJjbE0K/iHIfnWAggzw9DoE3egw2wq861+j3AItg0/qyee8+umfwIXc7tfPr7AE26Lmi9f0BULcisxgtF8aCZ6fhoqwqIzKzHNYZy1ZrJJpKJ9o61EUbz1fCjLpKlGZ/iJmsDyiLRKXVl8ao/wCAvcJjAJrFnV4rKKP99piBV5EGumuDl7fC5iR1RC1oG9dJmYneYwaCE/O8w5YC6jugflMX0ntjpHU4ZcK8VGr9xkZ01gQV9XPj7rHrd41RYw0MekkHfAsKJiAx3Ngw6O/Di7gmWQa64698QkNbx3StBw17M6NrqpP3m9WQluoHKrzgGbohhjw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(366016)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3FLATqYN/UDB7gwtloXW6zhH9wNgBf1LStgOAcSowmaDceM1DR4++s6bMDmM?=
 =?us-ascii?Q?Wk1RY+vgy7Oj4NAAdk1JmvlVujYcccweFxSsOvB9vGlpJ9TraZX9ndmYwLBM?=
 =?us-ascii?Q?NTeCYYFqdTgJbZOSYxrOiD/3mbWmNv6gANE4HQ7U8e3q0dkWF2FOv8tgYMKs?=
 =?us-ascii?Q?M3/Ox9sSERCPx84+GXeWIquU9a8YYENoAzMcomHtD2T4QbSWL7s3JSG8W+11?=
 =?us-ascii?Q?GtPFCbliW54l75iKj3aK4LsG9SHqjuteUh3pwHhpqAOn8VuS856L0xzyRE+u?=
 =?us-ascii?Q?2e0J0hWYrOeyz6nI/XTxoh4mhIhEPmE0/wyw74oQoQ9Ax/huuW0zj3EeqH1K?=
 =?us-ascii?Q?aIDoTW8M6jpoIDijHTpOdPieErxgPz1Hqt64jWIyKv8wAoXf+Dmp2b87Iqgx?=
 =?us-ascii?Q?DKAdTE/r57vojKP2IdSePeYun6dNsEpJQe1jHDgVYG2cMpO+9a04b2Q647pK?=
 =?us-ascii?Q?/Y6D1Sod9M/T8QhJrkf7nOR6BLsQWAjKvFPKovu9vld2Vbdm5phcWukOceY6?=
 =?us-ascii?Q?0CHHdj+GAYSNkClBdF+71dTJnEQ7b7W332uPuDlBy+hKZ+13qw+ekAHeMFdj?=
 =?us-ascii?Q?9A6sXh0shjXag5XPMMKnq1VhVM+NkikyCiEK87EY4j2ckfogSC8bMUDX1cUX?=
 =?us-ascii?Q?KPFfX+9IS1YWtwQeIHCQKgeKi7Qs3fNJcBRZcIDmQCkC7wvYRnPfBKFnc5pG?=
 =?us-ascii?Q?O6nqvvU7y4hlPvK31bjrPDnpjuKg7NOHcNJ+o/6ZQb+BLCDT7rGQDoF4d0dX?=
 =?us-ascii?Q?XWWYbuuOXbwlH0ogF5fCXPkkrnFaqSoJKqns8/Irw+sstEOM5pbDpvUBTfJF?=
 =?us-ascii?Q?SY902TjSsBD7cUGKfPT+tvOaJ9rEqvxzbMhFEa5tTj6GBSgHERDvimWLmcFa?=
 =?us-ascii?Q?wEzZZHsltGM80s5U2aOkYfS8aukJ8V34uphoOJlb96sT25qknehZ5ocdhBIM?=
 =?us-ascii?Q?R7Z4JopfcaZS8qn61OiQQj7RE0BIu5YKbODxe/k0Tvr/udhKNMq6PsJd7512?=
 =?us-ascii?Q?CE/M9GpEGxO8OlxHhirkJRsdGlFsMn3dD300sHYte1reJ5WBKmPVjUlg1vd0?=
 =?us-ascii?Q?2Eef2byJYj7R05i0Zlbi4P8IMbU2zdjAOkFDeIc9I0G+1RrBm8TSroYHZUwq?=
 =?us-ascii?Q?dieS/FhZwe8IoQhcIupXiN+byFEeWMLvB0/992TvjX5Ct5KNZ349wWL15/vD?=
 =?us-ascii?Q?tjVc8+BwKeI8ZyD0oUvWlqFKQgwm6KPCSWQPR7m3JH6w+le3cSwebNkXVFrQ?=
 =?us-ascii?Q?EJ6bD2vypLpmCbDA0aG8bNcsbqDFidOBWCOWgHltUyH2eOOyI9AbhM0ie6k5?=
 =?us-ascii?Q?+yUXBCvTX4l8CDjZ6huC2xH0U7qI8S1ZwsN+e+j3gWvn2mJ3HOBlVHT23T6R?=
 =?us-ascii?Q?ShBXxZfVDfnAcopORAuZMhF2gNPkR7gx45zwfzY0VzjQqPkcC+liQhVhyQG4?=
 =?us-ascii?Q?IOzjgrVsekEu1mkWhCAwf2kh7lt1lQndzIYpdlsygBIh+Ki2EdqAZ7MWC4yr?=
 =?us-ascii?Q?gvxCpLpAjof+eXF1s8S81jyCNTsmLMEe4R+4ISt9yAaasmOc2APN8TixPGo4?=
 =?us-ascii?Q?lwf8JGnLsVfxWypk2vqsyxBZWj/ZSfpxO63VhdG4mnO3HYv68EBzQS6sg/V5?=
 =?us-ascii?Q?+bKEoePmjaDW8wEcL+INFtnSde/P8vJIYC/prswf0U+Y6XTiGEvcF6w0yL4Y?=
 =?us-ascii?Q?buFPpeiab+tQXs3hGQAkGKtSOJ9CEM2QTUC/RKadIFYlldCzBDAll8K5vk8d?=
 =?us-ascii?Q?q0AKsyDT6CvuAEdWrreWwa9IDza7lspJ6CqcJoQQxoSAvypSm6XK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74649f19-d0cb-45a3-a0b4-08df14fe2704
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 20:56:32.6480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tea3jg9JtrIwYCbxfiEiP6k7eMh5OnUH+F5km9s7hIViy3pLkDS7FTiOe7As2NAa3DBtOZFylHZnhzSUufNEA81teFOIJRo1HiKRel2x2xBA7ELyegcA6vZHOU7rhGXl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11572

From: Frank Li <Frank.Li@nxp.com>

Replace direct dma_chan::device::dev access with the proper
dmaengine_get_dma_device() for consumer API.

chan->device->dev is not always the device used for DMA mapping.
Some DMA engines support per-channel IOMMU mappings, so different
channels may use different DMA devices.  dmaengine_get_dma_device()
returns the correct device for each channel.

This also prepares for making the DMA engine provider data structures
private. DMA consumers should not access DMA engine internals directly.

Assisted-by: LLM
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Cc: imx@lists.linux.dev
Cc: vkoul@kernel.org
---
 drivers/usb/renesas_usbhs/fifo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index bac6f8fd0055e..d6fa436112aba 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -810,7 +810,7 @@ static int __usbhsf_dma_map_ctrl(struct usbhs_pkt *pkt, int map)
 	struct usbhs_fifo *fifo = usbhs_pipe_to_fifo(pipe);
 	struct dma_chan *chan = usbhsf_dma_chan_get(fifo, pkt);
 
-	return info->dma_map_ctrl(chan->device->dev, pkt, map);
+	return info->dma_map_ctrl(dmaengine_get_dma_device(chan), pkt, map);
 }
 
 static void usbhsf_dma_complete(void *arg,
-- 
2.43.0

