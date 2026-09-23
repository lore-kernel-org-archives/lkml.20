Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDA8490BF5;
	Wed, 23 Sep 2026 10:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159748; cv=fail; b=Maw3UM1uAQalaWIjtX/MvHbdFCebxc7ur8/+z3UHWuaotqvcx2ML6U/GcRq8geMLMcvK3RB4l+pLkFuMM3BbFrtDB7zrU/2Ve7tJzZrVnMpVoV4eVEvAQPhwDgVthHJC0ppdqHLhdE8n7lQ7ahS+O2e1CsqaGraz2pjTz8g7MXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159748; c=relaxed/simple;
	bh=WWn6WTQvqp9cEzUNdCcHd5pp8U5Gwz7Yl4Amo0m9Nv8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=LGIx0DPpgJYtCfd/CWhgvwUDjknrKMxw00L9qZKJhFmXYn8rAZfONL1YI/xj0idfzU4U08m6OCPDRr3/qrYkNOMRq1wxpBQg4pRzO+u3EfKMq/KAYWAX+BXth9nVA+hOF5s25NUuYTCYBbq988xX/7nADi1xViFiIW0nZWwb69Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IXnzgISP; arc=fail smtp.client-ip=52.101.72.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IXnzgISP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=un4X8GoVx44HL4neV4o7mS6LQlNPBoLq+RK9kQqWKo5ybWjk2tNZfmr3eG774A6JRx5rUNEE70NfXR6rjde7LKpu/Qs3SHVyqT653GdR0RnT0yyWhp6fVwWv2ITBihKMwb0vH97WADsRS4odhv3zxW8fSbhCCIR9D1gQi/10qnAYbGwDpHNTbyYnr8BcFIICyLcPtHl9hLlIWTvUIcoNaPv+s4XQkNJMhX4gctAQEIZMmiPjKbmQmG5qImJdp+P4Nytk6TYmeSwB5rhHL29rm+mlnHeS7CUfD2BLGcxpjxBU2SdprAiBmfuNCVzwtY4i6ziHSb7BHQMo6wkvLxkodQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4gV0PUvdWuTAvTqFLp+Ltao33dDUHboHyQiptpIOpc=;
 b=Ykjv5Hwr9q3k3vVZzpK4CqFcehK1ADYNzHF2UYlE4j/eXKIfR4Bn9MbvpGM+DIu7H/7z1+LaWvKM8YWdxOkhbv1ofCOr0PJaEZhWRIJFOcNTcPL/NMIjfRsgnbUPcKQJAjM1x2v/Sacinsdcr8LJyYui5v2zuNXb31FKiLxnpAE33ieEACNqUVo3UdV0k+87M8RE6mxYamtfZP7nGas/16bIgrJma7kXFU6ofXzrx0S9gnLEkMxkxYqWwpfJyNxCO73nAd8K5rBJYiLxwlCF44Fzo8DGeO+jsvFy5cyssWlJcK4rlrwb8JYvBOFKN3uq9S54tt0irhBG447XcgUrjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4gV0PUvdWuTAvTqFLp+Ltao33dDUHboHyQiptpIOpc=;
 b=IXnzgISPjBfIFEEh9UgztNwFqj3MdXL7X7h3V6lad2YT8moeI1lRf1fb7sshnlpB0a1LADhmWfmoFvjTkARaB6i5a19KNUa8A9fyHHAwtt7QI5f6fl+X1wKWZijn6HSS92Z6zJbnoJkRV4diGWNVnpqp9DsmwDF1hCajyxRcsXmm6NHogmzweMid5fXXmhgnHW5T4XZp/BiXuxicDhcY+TZCa6yzUprb2DNhLGCpTaPuxC66UcSuylqqwlRNhr6x4thV7lvl93jkY+9SAWGApDwXIYI/hPrmG1Fl7Sz6Sjz3xAwtt3MF/J0zheQcXbSykMiYU4zRUCUVLBVTobBIJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8643.eurprd04.prod.outlook.com (2603:10a6:20b:42a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 10:35:23 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:35:23 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Subject: [PATCH v2 0/2] usb: gadget: uvc: fix resource leak on
 video->async_wq and video->kworker
Date: Wed, 23 Sep 2026 18:39:43 +0800
Message-Id: <20260923-usb-uvc-fixes-v2-0-844e04a4a4b7@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+ss2oC/12NzQ6CMBCEX4Xs2TXdIr8n38NwgLJKTQTShQZDe
 HcLevL4ZWa+WUHYWRYooxUceyt26APoUwSmq/sHo20Dg1Y6VTkVOEuDszd4twsLxpSlVCSGLnk
 NYTM6PoIwuVVflrl5spl2yd7orEyDex+Hnvbez63pz+0JFeaKU9ZZkei4vfbLeDbDC6pt2z7H7
 P+bugAAAA==
X-Change-ID: 20260819-usb-uvc-fixes-3176195c148a
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kai Aizen <kai.aizen.dev@gmail.com>, Michael Grzeschik <mgr@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Xu Yang <xu.yang_2@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159986; l=1141;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=WWn6WTQvqp9cEzUNdCcHd5pp8U5Gwz7Yl4Amo0m9Nv8=;
 b=3ypLjFoLczT7vSkTxWVi2GOViPaxhlHlxI9JdFswAbUUevOywH/EGGAHjbUD+rZeFV9bC33cJ
 bjtLOSWcLk6A0LR2I8e+BmyK1mg+KZ2cqUMlVNgkT36yQ78YXMbz+dd
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8643:EE_
X-MS-Office365-Filtering-Correlation-Id: 64824180-55aa-4936-dc71-08df195e5f8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|56012099006|11063799006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	4suv4yZAa0fNUdpMU3MCg5aVO3EYv/t1EgLrERNYKemhwc+swN57vZfnFW7NNRW+VujkLeoDr6VkxwXG0cOArAvHYFBOOpul1A0H/CQ6BTI/pKrQC3vO/J/+PDG+mYIw1+yoBLN5pa8zbBy4ixcJHaKFdieZr9ALlE/HyiKJB6+pR79AcrCzRXWLoucr7VMVOg3IvDqmoUbAe5vt1HON3zyRe1H+GjLiOPxiAIVoQLf+f9y1heSymKcefv7pQLuYU2bAKI0lnHLSDyiyzoo1QuBC1mdCv5VP7CBZ0WS1mqjHfJGUevio2G1GYJK0IFM17GbiOqB1ZrbNUHxe+x0tiIDgbGIbIiYwAOrCwo0df2L9IVGSKfAcDvzaH7P04tycfvx0nMifKqvvp2uWOSBzIwtzLKmdxvs2VZj6Zq4lg5C1XzadIOgTIZZWNf3N5LiU0j/CeWTcHnBuuK079JCa3W74x4cddimtSQfOvxaDqF3JmUScVTg3R+W4aXqOJDQ70FE8fsJ7U8YEOLfH9aeQyf+8N0eNxd7QOFrXfDb9rQE69sM9uaLAuHPJiuR26t/OS1A/ewrYbXwMA2owbEjDeaCe7M3qSIwOXmdMezd1Jng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M09QL3ZEdTV6MHNOOVd0THMwekZHYXZMRlZ4UExiTWgwQkNRSklmNktVbjFy?=
 =?utf-8?B?dFpQM3RyZU1uUTBRa04yTVZGUWp6RlZpWWNDa1d1eW5VUG1PZTRBaUU1RkJh?=
 =?utf-8?B?Y2c5dGt3VjQ4UERCQ0pnYllJT0MyVzhiSk5HZWw3K1JQTDJ0Q2ZUZVNkS2Rq?=
 =?utf-8?B?QWtWbExObWEzNEhjZXNHVzJ3UTYyUjNTQ2Jya1dERitWWElJek1KYXFudkh5?=
 =?utf-8?B?dE5NU1JOMmg3cEdDSUhKZVhySlg5bkpOSDc2WWZOWGFjakZFNERCMGUzZHdk?=
 =?utf-8?B?ZTdGRmZFL1lKUTN3K2F1SERYc1JhY1dCM2tTTWxaQUVaeURkODRMSUw3cFgy?=
 =?utf-8?B?SlRHQjFCaWY5eTU5bGhkanl1RjNGSHR0bExKVWtWalErQ3ozNHZGeGZ1akFq?=
 =?utf-8?B?Tlowd1QzdVErZHJ3MlFLVjc3eHZCbWh3RXJZcEE0QWFWb1ZYTjNJbWo0VU5i?=
 =?utf-8?B?TEhoMTV3ZXFGU0VsSFo5MG12czR2U1NlSW94Yi9lcXl2dVI5SHEwbnE5RmJM?=
 =?utf-8?B?dXljUlE0a2V4UmdBdE9yN2IvREgvVWREZ3JpRkxUemZpWksyN215dzVCM3BR?=
 =?utf-8?B?UmJmYkNCbE1ZTVpPYUR2S3JDS1dNZGdqRVBjK3dkY0I3WG84dEQ2Y1VmV0lw?=
 =?utf-8?B?Sk4wTllnclprbm9jUWdFMTFCNnJDZHdDWkRNbjBYTTlpbjdkVzZVTkVMNnU3?=
 =?utf-8?B?RVZLSWFyRzE1Mk1lQUxlUi90VXAzaXdtYVRNTG1xS3ZzOTVHbEJXRy8zMUFm?=
 =?utf-8?B?K2hMdDg3Uk9lSWdEaDF4dmRWR2JQRE01QXdOY28xKys3SVJHQjk1dktjekdo?=
 =?utf-8?B?TXBUQndJM000VGNReExVTHpQRExKR29WZnBvN1lPNTdiYTFWNzBIQVEzN0dZ?=
 =?utf-8?B?QzRZNUEyV1ZQL0tRNGpIbFA0VHhTS0JqY2Nqd2xwU0lzVU5zNUtqQnpOZ1Fz?=
 =?utf-8?B?QmxBZWdpQWZiQU4wYUdBTWFJS1E4SmtWelEvcFhPenpna1AyYW84bkplZzA3?=
 =?utf-8?B?UWUyMUNPWGVJRUd2OG5tUXZyTk0yRmtFZmtlZWZybFNSYnFNdmRoUEhTR3M2?=
 =?utf-8?B?K0RsaENjdjMvSTBMNUZDWi9pTWt3M04xSVBzeGdxWWpHSlZSR3pUUVlRQWxp?=
 =?utf-8?B?cEJzM2RPNWdXRHBOYmg3T1pWRFFKN3c1NGhLbEdEZ3lBenIwcUtIUHg0R28v?=
 =?utf-8?B?b3JZcWk2aHZaYWlQNXFKV04wZ0VuV0NyTXZuYiswT1lFMFVsQnBoVEgyVzRU?=
 =?utf-8?B?d3RmZHF3ancrRFhkbmJGNU1MYjl3dlFKeVkxekN2MEhBNTJOTHQ5S2hQajZG?=
 =?utf-8?B?ZTd4V1lYMS9RZXc0QjFINU0vN1RYOVN1MTMxaFJ1Y2Y3T1NuR0hHZ1BIT00y?=
 =?utf-8?B?QjlBS3VWcWEzNkE0QmRETlpUa3NYRUJ1ODdrV2NoSnpTSkJTUm5tWi9qWS9s?=
 =?utf-8?B?a1VZR2VHNTVTU2hrb1EvNTZUdEF4NFo1ZFM3aWFDeW01SW9GVzQxbE01Q1hu?=
 =?utf-8?B?MnN1bFBKWFpGV1pTSmtuS2VxOWNDSDRtVjc3Z1d1bjc2T3RhcCtBWEVXNFRX?=
 =?utf-8?B?ZVpKYkx0ZCs2d05FTU1BVzdxQXZGZTlDOFZrZEFIN0dPVzI4SXMrdkZqRzRX?=
 =?utf-8?B?ZmNxcXJXaTY4RWZjQisxRWNtUFZuSlFHWFYvekxTZWpjUG5iNy9kMjJ2bFJl?=
 =?utf-8?B?TGxhQVdnODY5aVpGS1BSeDk4ZXJCNzRVQ0o4QWpEdkEzM3YrN01EemozUFIw?=
 =?utf-8?B?clA3N2ZSb1BkOVo5NVZwNk9POGlheVJBL0h2OEVOSHR5N3VyZ0xtclBYUnlu?=
 =?utf-8?B?RjJjeDRybGdLb3VHUHNZNENwdVQ5TENlSUh4SEJMTkV6Z3NFSTFwaEdpNVl5?=
 =?utf-8?B?Q2xKbnI3Z3lmcStKU0RRRzhpaDY5SHRtZ05QaGdVTlZweG9OV2hPOElQTnJh?=
 =?utf-8?B?Q2huekVWdTRodURjWGh6L3lpVFc5TnRwVUZxdjN3bjkycFVLTUwvVjB3Nlo2?=
 =?utf-8?B?T3p3SG1uenB6VG5vbXZXV0N0V0l5c21wVU9qSUhDQk84dDR5eDkvUEM2T21a?=
 =?utf-8?B?SGwvSkRWdng3OU4vcmEwY0FoVXRONTdPakhoL1MrYjlzQ24vWitLbkVrS1BR?=
 =?utf-8?B?YWpFWG4wY1c1bXlJd2RBQ0FmUGo0SDNZS2hKTTVLcVFERVVtd2dMQ3NNUDlU?=
 =?utf-8?B?NForTTh1M29sNVFQSGxEc0FTU0taTjB1RitRL0Q0WDRLaysxdFJrcURyZGRl?=
 =?utf-8?B?b3gybWQxd1VEdnNDVTExRWhMdmN6Z0RyK3phc240Q0NSQk82Q0VUWnBHbUxi?=
 =?utf-8?B?eXBSQmx2MlFoSTNhVHdBQlYxZUxGZGdzTFg1T1E5SlMrZDJDalFZcG5OR3RS?=
 =?utf-8?Q?IcPV6pawy8mnLTUTAC+nYs9MpGTcoq+RBJWr4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64824180-55aa-4936-dc71-08df195e5f8a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:35:23.4682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3TiH/K/IyE/RyicqosHLHUJ76l5BDQDerIhyAtAnujIXsvcO34fNIbz01KkwNIAmAeSLEpxGS8NUuwl9SOr6Fwi8kM6dtny1Kbnte7JDNTyZhiNVkkxTulh5zToj9Bo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8643

This patchset fixes the resource leak issue on uvc_function_bind() error
handling path and uvc_function_unbind(). For the former, video->async_wq
and video->kworker may never be destroyed. For the latter, video->kworker
needs to be destroyed.

Besides, patch#1 also fixes incorrect goto labels that could clean up
resources not yet initialized.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
Changes in v2:
- rebase to latest usb-testing
- add sob tags
- Link to v1: https://patch.msgid.link/20260821-usb-uvc-fixes-v1-0-80e6e279523d@nxp.com

---
Xu Yang (2):
      usb: gadget: uvc: replace mutex lock/unlock with scoped_guard in uvc_function_bind()
      usb: gadget: uvc: refactor video cleanup into uvcg_video_deinit()

 drivers/usb/gadget/function/f_uvc.c     | 87 ++++++++++++++-------------------
 drivers/usb/gadget/function/uvc_video.c | 15 ++++++
 drivers/usb/gadget/function/uvc_video.h |  1 +
 3 files changed, 54 insertions(+), 49 deletions(-)
---
base-commit: d58dffe9ee2c8883193959ff4ef995ec07932874
change-id: 20260819-usb-uvc-fixes-3176195c148a

Best regards,
--  
Xu Yang <xu.yang_2@nxp.com>

