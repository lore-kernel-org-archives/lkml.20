Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020137.outbound.protection.outlook.com [52.101.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C5B4B1295;
	Tue, 15 Sep 2026 12:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474573; cv=fail; b=X1RAR9BdLu1f8mZWYhXaROB1gxgtwrHxCZJUG4ER5Wi91jEkSPkBfAHHGUIp+MJXmxxVkiEAXhe26PS/9dA6NravCJcJc3JsBuDB4m3L4a5EYCHIx5xt7eg1qN5mXgGF4Xkaw8kEOwWrBEFexjw914QUlfK/eEa6Py5R+DCz15Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474573; c=relaxed/simple;
	bh=QjpjWW/2C1YL+uway5ZUXspwvgsIxFAGq1BrGGt3+Yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iRv9BmBuNkd81+o6daCirTlFGX/51EuikfKrJ8oWZNgDf8HznSwTdXisNr2ewxIOBP87F9FjoP+9JXtc9dv43I+sWOOSu3dGMu8s35aYygVkmr5k0n9NTpy79kNp4ncR3AEQUIldhhh2LqDKMbLTxA6CuAbn/E53WctvTPyLb1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uT1xjkI4GrXKUPIgE34TvpOx27jvsJ5HMaq5V4h9jQ+XdbIwdoKhXEvzkc8q4Zdw2rMEiSqythDL9GvDzhPV6mI93swuUTCpbRSATmT2DQ8DhCsF93EVVpmqR+1ikNeZOBrrX9Q6sisX6fVRrR4fmjNIy8q6SzqLkjJJrLyd5gmbnPc+A84nSONI4HwNXHSqzqzV5yoHHXwW9lw95uUXEVUj0G4n4exs7rFX1aw5BcX17Tn4kJbSaH1DLW4CopJ33TmcQNfGSVQ++d8mvZ+Afg+igOGnWf0n6Hl1d863XNTJCyuTIZfCUuEeWaGCXnYIIjVUUuQEXW4tb5Jsxbs7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGOzZ7G/Y9kVLYYGQts4Dr4auTQ6HFf9F5WS7m12lKY=;
 b=GXCAQkp8kPHqNrIYtdelYyl3G5jPEEWb8+UB2IC5xhiju06IKiigsP55o+z2JOZNluRkNnkLPYE4ejAliGi7+39oVKXatAiz6dQffuNyrVTSattKtUlolWkX9PXoRrEAD3FmggRPoP1r5E33PAmKPebCPzGeQDuNwfTaiRVmem/0llCw0ieSLe7eOasVUqOPDAOV2jfJiBM52DfyQzxN8nOHsufrLJh9WXPHRgso4PAeayrToNWpslhLuRnkgygR4br3VX/TTnANn9GpETxXmDM63fwa2fUF1aUWMLpIAc5Ki9EtafDoV2WGgDzKfNLWBYo6jDk3dbCfoK7ow1ilvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB4525.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:18c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 12:16:09 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 12:16:09 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v2 1/5] media: qcom: camss: vfe-17x: Fix write master buffer done being dropped
Date: Tue, 15 Sep 2026 17:45:53 +0530
Message-ID: <20260915121557.20910-2-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915121557.20910-1-hitesh@ebytelogic.com>
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260915121557.20910-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5P287CA0038.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::10) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 714a4880-ed62-444f-4ce7-08df13231fcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|376014|52116014|1800799024|56012099006|5023799004|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fSjLnE4+KU6eigu3Ow2uKop+BRbR4VvpjGJkbDd5m+Z49+T2JmWa/j1kB5FP7+Gd+1MVCizar9UcMTEmgJ7XKuI9Scg1rl8EeKTVABLLCV6RCdoqwq05EReI5wST10mDmdfKpKs8yziorJRZzJQaeo3q/gV11u10S8JdWvXGdZ4FTa2egpmFetVUwfBmCarAmQqkJUrftc97KqPZ0LjFqlh4OzQq8rbqVwH5kXijJV2dBFJTHCYooXdrWuOY8Nsq1M0mXPOgkG1Dt27Cj+6Zw+sHjkS641DDkabTsgRZrudy6P4fr5Ps+X11FtrmYX0Ub8l8DlLKb/dh8jSeT/h9XUcAuXr9dRaNX9CW7sdw1L+XuO8j9WDGbmpfPWqBxL5OEMXvAO2lt3tJzIGeOEg1ekoC4WlhvVZ+zKkCyHULBJUzMO7fFrNixneYKIPhHstoLPnuSUCS5K0J/WxQ7J6+vdnzP7TF7/UCJnzX+qjrcQMDVniRjqudg3CRQFeV+ccPw3sO8hAL0DhoI+Z7fbPAIXY3KbHFz0XM1mZXPP5ChdclEdhzItPS8BE9GrzfX2sRFnSpWsnRhwsuYXHTOiEwM33xRRUUQ88jv9H7q80+FDDPKqY7lot5ZO7RV99BVrAPUw8D2PLbcbRA6jJrhpB+fUvo3c7UVWGbjgNzLAMt7w8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(376014)(52116014)(1800799024)(56012099006)(5023799004)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hJejqKtHEN+uTPyg8rj+HVgRQ+XGsbqMnKxRXPNQhDbKmfBLzT/zz5uE/YaC?=
 =?us-ascii?Q?wXcIVLZ4D7E9Mk4RWPK0gXfzul1Yr+JqSH6sU63rmGKBchxH3a3BD7fCsFim?=
 =?us-ascii?Q?7WPMkpHyh+BQmv6l84haN8BfCGX3CM83CW+BcpfEnuD7HcADe6fv2CKX3pfZ?=
 =?us-ascii?Q?Zd/xWbyprj744kgOzh6GAZkE10pdCJTFBT1ArgtTwtuBGhQXMPMfuIR6uQ7Q?=
 =?us-ascii?Q?lNptyS9dOMNDrxg7FVNr0O2kx83tgTXpc96c2Z5LiTdkWJbQZ0+XWyxQRabD?=
 =?us-ascii?Q?+LQIu59LFw0NPBUTtUPKtw30k9lOF21GhUAkzL61PuzDmmzIcVTkLWMdlsK7?=
 =?us-ascii?Q?qlRLbNer3MorHw3g/P6ldCR1sXbAxfa3Nli6FWi4PTyfxCmhpk9KnC2kNaBC?=
 =?us-ascii?Q?qq8lv3TvNjEZRqt466WieiatW3eyeFBpZ5NjjQKyFoIvkQqyXe0wGoJrxeOb?=
 =?us-ascii?Q?vXG8jS+6chRQcXy3Mfka1BGt1jBy9M/BglaRdwjgYe7niPofubjMWZo8yXrr?=
 =?us-ascii?Q?Hii5OXxXhapynVyfto2/fxGezZ2r0LEeL3Jg5uB3o593rHR+9mvkJRXn94LB?=
 =?us-ascii?Q?s2+l+esajAfLiW+QCmESJOGEHjX0mwW/RAUw+WfOWHDuGQuTysFuGryjIbq8?=
 =?us-ascii?Q?f/1MofUfI/giFgSeWtMu156z8Cvt37tt3i7nFvS1XwH8vqDnNPMSaB9ULcy8?=
 =?us-ascii?Q?DRkXdTN4eF5jyB3qUNw5BSOMJdEQf4kiTuk3McFjKeJ5c4VrrHaGjASYCW4z?=
 =?us-ascii?Q?r6/Swyn7IxZEeHPwvXo7Te64ltApqty2zCGwiLhmmNgFMk7ryHoNghB1iIW7?=
 =?us-ascii?Q?rKm+90HQshqLTs/KUVv5u5YQ0DPX9WjfavycW0jGZFqCfolpmSxvBK37xwiM?=
 =?us-ascii?Q?FLvGRAYECf7oblVELwQP1TxC/c+4Pe4TpY1q+EIvIXD7tEWlSA5C17QVqTVO?=
 =?us-ascii?Q?JnRyXqIEX5wFBIQK1dpa85lSGv2vJUeZ23V4xKheJfKsX/tvfzpwWrWDwLdV?=
 =?us-ascii?Q?NrR/PgWyTWV2Mw6v3UtjY9AHh3589Mtsxa4RZFvDNgekF1eJqMTvCI3YKKd2?=
 =?us-ascii?Q?rX7vd9+sOeYjrz72ucxclhMLbl3GHAklNnnbOIXYdXBEQO/BmtRSg1laRLbs?=
 =?us-ascii?Q?Msv8+6HOZxN5O2ElOqH/Dr3XtJX0GVmvEHsdukYmrkwsPyUmxQAgK2uEh5hd?=
 =?us-ascii?Q?AgoLQ1uJqpTdEOl87O8RicJMQBSNwcvJfKu5tfpeXkbn9kuLqxo3iID+udYb?=
 =?us-ascii?Q?jERX8ltrYTk+vxOeoy0yENfB7v85uFOla+qpC9cCbBMkChF99hgnaCauICVE?=
 =?us-ascii?Q?q7uI16DO2FtejYu2DTQxvM4HfbX3H0tV2NLaYA8xWZftiIGY9W86vDy34oMV?=
 =?us-ascii?Q?sg8uu9X044sHifuVrn1cC40ziPI1GSRlTGbvvQ2M8rQktr8w0/zaZ5kskQKO?=
 =?us-ascii?Q?mScDsZmbxIbp4a4JDuWy6syQenAmBpqrCW7dhKz1BS0CbzKy+BWvEODK2dBJ?=
 =?us-ascii?Q?3Esoa7mtgpqgey5Lx3w1CHZ52V8SAoUsa6YP07yK1vu3KLGx8TjivxaYnlYq?=
 =?us-ascii?Q?FMpVLryDBSNdGiPMXPRcX7yf2gaxA7ZEKAa+2N1Z/5C42SivQUqoxQX5uiq/?=
 =?us-ascii?Q?kC3pZRuDTBXA2SsHn95qabGpYTH41RQ3S7Ud5YExm0GX8J1if0/7VPjk+AeP?=
 =?us-ascii?Q?l8xcI0oiO8qxuLNWMY12kUfvGX3+/BkRvSWVa5Qmyo0VGotf/7rYVa7xhaWp?=
 =?us-ascii?Q?sXsRnv1ak70No3AhTKsiv4UyoQYOUbFwofdi+1x2crzUOq3rfkLz0Sv+TGzV?=
X-MS-Exchange-AntiSpam-MessageData-1: enaCIes8j9xvsw==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714a4880-ed62-444f-4ce7-08df13231fcc
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:16:08.9353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gD7aMrTm9DkpEtVsoYcLvGX5YTNAAMviYJtchsqbooPgonDn4MxJ0OvBETtSg5MMDIafFi4RhwoRxjxMwFghJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4525

The VFE 17x interrupt handler reads and clears the bus status
registers on every interrupt, but only acts on the per write master
BUF_DONE bits when bit 9 of IRQ_STATUS_0 is set as well. Bit 9 is the
ping-pong flag of image master 1. It has nothing to do with the other
write masters, and it is not guaranteed to be set in the same
interrupt in which a write master reports a completed buffer.

The bus status is read-to-clear. When a buffer done arrives while bit
9 is not set, the handler clears the status and never calls
wm_done() for it. The buffer stays queued in the driver and the video
node never receives that frame.

With one RDI streaming this is rare. With two RDIs streaming on the
same VFE, for instance two virtual channels demultiplexed by the CSID,
the interrupt rate doubles and one of the two lines loses buffer done
events continuously.

Act on the bus status alone, as the other gen2 VFE handlers do.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-17x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index e5ee7e717..c011f64f6 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -364,9 +364,8 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 			vfe->isr_ops.comp_done(vfe, i);
 
 	for (wm = 0; wm < MSM_VFE_IMAGE_MASTERS_NUM; wm++)
-		if (status0 & BIT(9))
-			if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
-				vfe->isr_ops.wm_done(vfe, wm);
+		if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
+			vfe->isr_ops.wm_done(vfe, wm);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0

