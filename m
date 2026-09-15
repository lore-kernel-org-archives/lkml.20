Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020141.outbound.protection.outlook.com [52.101.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509EB46983A;
	Tue, 15 Sep 2026 09:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463395; cv=fail; b=th6iVX6q9jjMrio4NmAJGa6ETB9ET1RkHYs91S/bI9aPkKiM5u0y9XFjsulUTK9vnFx1ZumChDwNe62CS6ndHQOjMB1pOwjrYlbkWnpGvNpX8TfyF3lUixkyO1GkkJcqOWGuqtCrGCXpMlQrIMNyvh8MIHYhM/vBPx/d0UgyQrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463395; c=relaxed/simple;
	bh=FngB57vM/ltNvskBLBy+rGPLb/ei4r5lnciupQ1CUdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rVUFcVM3eOC6WyRj5FQSTjU4ivMACI6HESY66i321o7A985iNczxyfc+vGZ9zA6wr/FHCzjX/IaNChng4cXYA7BdHbxvEwGmFZw5kw2418C5GuVZG8sKsC562mud0pzpaEaNyTabhH0lwgGuZJuHzkjgqbSCUXDqcgZd8F3Dm2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ie83eUekUNfQLHfKpK1w4TSqN/NDPUfFQLRqR0fzZit/WdWS/eWAIoKXOY5ihUo9H3Nq0rJM42xCclYuX0ZGgvYtSh5cvFGbZ0FzVRl6Lk7kiqIYeDW3DY0ldQEz2Ez1d5mOGLrPegqvVLpLgmzS8vg58mRAKsUckNkAupIER/IGfDcnwEbO9NU5x4+WYcOefIazOhFDvSQusarhG8a+vfq8g55RDK2RtgCsEH6i2/H9hzyfEMd0O2sA5luWreVNUtt6e1iiTwBElhWh95D1nvc7aJLV12FbHBRCbMTdX4pCidY3VTucggzO7oPDPIYKBi0HgT0ZmaLoM5OE8HKr/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FngB57vM/ltNvskBLBy+rGPLb/ei4r5lnciupQ1CUdE=;
 b=SRuocGyZ9Q8sTjyZoygcJ1uUiTU9M5cok9BX5sMKPN9hSyfA8w7qPNuikgc5WRtJrbKXt5k9LuwUgEB+2keXkMQ7zJrVO12MaaKAtovFvI3+SQ9OilQdHwbZFQzmW7prdDm1qnOZ+5DNVcM3gRLe/ESd8Uya4337f3tT2vdGHV8ElLBgd2OB1ZKhm/YdVCs/PY9pHSNHRnuutgFDRe8drZ/s6EIMktnZuZCA53u9a8Jn5zMgXLjVX1hr3P1U0sMUV90hJi0+T5lKzkCPVF0SU3W/2TslyT211GeTmKNeWQ0pEunH5twqVfz1oPW4zDIgVA1BZDDXezt0C/mBY4P4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB5156.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 09:09:52 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 09:09:52 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	linux-media@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com
Subject: Re: [PATCH 4/8] media: qcom: camss: vfe-17x: use the write master matching the RDI line
Date: Tue, 15 Sep 2026 14:38:40 +0530
Message-ID: <20260915090929.1284112-4-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <18b629b6-5944-4a1c-9573-fd0ee4b25cf4@linaro.org>
References: <20260914133416.1030231-1-hitesh@ebytelogic.com> <20260914133416.1030231-5-hitesh@ebytelogic.com> <18b629b6-5944-4a1c-9573-fd0ee4b25cf4@linaro.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0086.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b6::9) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB5156:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a23e263-8b4e-42ac-15f0-08df130919d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|52116014|23010399003|1800799024|376014|10067099003|4143699003|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	lgUepKm6PYSh4idraobQXjezK6rgBBEAtUPsgAiuknCGH1rAdxd+6REFJp9mEN3vEbDXx+U4ILK3R63OtFzMkd8gwbgJTgNMpE26EhNhJauhUqy5waUiU7GkCnCEJy/LaNlQLXicPRDgJkIm3HCSaQT+8e1nC1fD3/EGIeAPNkRnWRt95rmBpXWHOGPJVDCEVb518r6l3xP/CV5Q3iv0l18eP7PqDePY8fz7iOfMvzNfCs8YzPAyF+du4/KPsjDEWx577987MjH2sEHrmL3ihpE5YB16qyR7BgxKYrxLVANEIORWqip46R61CdxpCNDf/bmMPCncCyB+ada6aXz9vrWB1ID0bwmVtTOw5anygF1m2nNKGSRsb2xy13TVfliz5cR0lVSaeQGuoP5MTbvMMXpr1iGqjQa19hRVV7ItPxT9fQ1hvIhoxXwwiyz0wuVaIzUSieQJpvLDYE/RnlG8Fx6XDZEpZniq33Z/KBik4CIrqExf59zstSYWRBDtXaVCBx1WbiGX8a4DM0hQmVObr6kwPPilzDOufK0s+OAH0z8JyHqJMogwnFaGFMm5bl4SD5mq5TqV4yXd5td2nD68yiG7Z9wBPwGfPqEDXs3KaGqsbKs+9DTA8+Uqgz1IaDR9IzfEjpUvk5bevmyc46IbVqu5OGvHo75Jww+QvJXQghg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(52116014)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?trCRVq6Z0tZFCh5U+gp9hof5PXNwsnavGnbTOVJURqQcQgQXtpBrHMyDKP4u?=
 =?us-ascii?Q?qu/KxgiWS4vVPvlgqQc5Rrqfrbo2uqyHG33U1FfzlIGtpxqUDOx1LFAK4WLQ?=
 =?us-ascii?Q?ryDpwYq+vxyflS6aYc+8c8MiPziYVx3otA/t3KlGJt8+G8WjdlxYBTSt6Pgy?=
 =?us-ascii?Q?iQP/ePuCxmzyoJL/crka0Aig7hit7eUE3KUhRUJfluTaKcZMfh9rFKM+Ny24?=
 =?us-ascii?Q?B2Qerr04bh/Zc/NSxMBRDDMrw4IQ2yk6DSYAXsFV4a2tSm9wXGoxYizk3Q1O?=
 =?us-ascii?Q?02WXAIDFcl/ZULFzqwy5UWBLtaxSH1te40ko1F4TTeYYwnbXXmoX5CLZX0+O?=
 =?us-ascii?Q?9tBWbWypt/KPY87q6daG6GDXNftM2rxpDJlScfBTID+eifC/V1bmpkN86/K4?=
 =?us-ascii?Q?GXknGIwo1zttNzfcLQeaf/CuE1rzPgDjmBJb+NcMzQp5in8rjIwTHgmKsILR?=
 =?us-ascii?Q?B6mdSMMp+d2PMdlV4zlZLuzE6RSNJke8g+kswKFnK4NE5D4G3ZDCZt8u2E3b?=
 =?us-ascii?Q?IZGbFSNpIv09A/ULl/lsu6NzdXoFd5b2scUaXoElhrcXlz/s72SaLYfXpAvj?=
 =?us-ascii?Q?5k9BdQdWF2bU6uaDBkrV6//0z04lHu+TmRdzdXAlnoPtJbiaoX0M3h111l15?=
 =?us-ascii?Q?wLLmyez8BtfPFLdJo366G+Euo5iHhXmSRNamR1MGkYKIRX/3u7+BqeX3BVN3?=
 =?us-ascii?Q?+7lHOT9MFEVr7Gkye/yXuqdWI9HnElFborUnhH+qnoI9rdPtHBNhkvVHbEdx?=
 =?us-ascii?Q?GGryyZZ6/WdjXr2qEofzKjoU9euOykUTREhyKKqqkavkqoB28bEofk1l8Cvq?=
 =?us-ascii?Q?UzkbbG5ThNXK4I1fTSe9OegHzx92n3mPkhuRd/w6lH50yX9pYzDoJJKKODCh?=
 =?us-ascii?Q?QkM/G74uGixyGHksCB2s6YUQGomgslSDapUydL83rXqZXndeX7fpMFQ7GAaA?=
 =?us-ascii?Q?XbhwHTxqbe7bVhNADjWMIsItQDLq72sydENi2Z0yzIpqDsUz0CP3xCjrFs4V?=
 =?us-ascii?Q?qEO1PMEEPaGYuemOJbEFpTsH2Yv4AgwH27aiXxF1IchDUYY1ReQdsgYi1gX+?=
 =?us-ascii?Q?5dVSP3ZdjI7S37WsAXucv1dTHInYmzIp/zxdGHZjDun3EtQ4rXkxFMYDxR5C?=
 =?us-ascii?Q?WQBiKFdwpwnIDAgjm/jhjgxeqLTB3uZr9Iz6CXupd+vm6UIxoWkjBjZKXHVG?=
 =?us-ascii?Q?fSuI7TociPYOEcmtmzkfR89T4WhoV50fLNdHdt2VlY76DdVxPgR3R6bFn3wh?=
 =?us-ascii?Q?4UuRNeVLyx2uxEn3CHHUmgIeUqm4bdtBDML5OiwSGytCuyhZNu2IEYBCkEjo?=
 =?us-ascii?Q?/P01Veali50ayKZP4Y/2DVy66nAeNikVE9yll/bi4uEVc0BwTQnYbtbcVBnS?=
 =?us-ascii?Q?+JEvRKu8mat4DnTlsa1xApGzKnNr2/MGCMG+CsuhrgNBsb+R1Ecdm1MUpPIp?=
 =?us-ascii?Q?oMOEfgLOhShWzJgcE7f+87X/v2PNgCiwOg71cFMTO38/kL0XTbH2M9FDRjl0?=
 =?us-ascii?Q?Zgj+WLWgYAF4sE214IYqlYiDjGdw/YZJyC1tgYiiMK9OLYKcqKLQu7AI4hYS?=
 =?us-ascii?Q?VPYHiIfJcRKqheF07zfcOF4bApikEj8glaxpUTSpaL0RZPURguNH++4mbTQD?=
 =?us-ascii?Q?/wfd6VwmMKXYvnKAf1VxQu+Y1x3jp/wKbItkmpchMUZxrGJ+Y6RIRWJ8Rg8p?=
 =?us-ascii?Q?FmMyTOUKe8ozKfNdBqzFxUEM9idbcOfbLyZE8o1fQXk3eCp0Y2JMV/F/gl3S?=
 =?us-ascii?Q?TklA62rrd7mm7apatgYaWd2A/EB1ebe8R3hhT47bFTexxrevse81qn7RRz8W?=
X-MS-Exchange-AntiSpam-MessageData-1: 7Nd/jX4b2PVqgw==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a23e263-8b4e-42ac-15f0-08df130919d4
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:09:52.1203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZAriE4eroNmgNBWM15YmZcqacB/IyT8AYfwJctv1TKwGJJzSsa5ekGjHVl4ubR9e5770Xd7ARmijyn8a6xqiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5156

> I don't get why you are disjuncting on PIX here.
> Also isn't this a problem for ~ every VFE ?

For the other gen2 VFEs (480, 680, gen3) it is already handled: they go
through vfe_get_output_v2(), which maps write master N to line N for
every line. Only vfe-17x kept its own vfe_get_output() with the
first-free-slot reservation. The gen1 VFEs (4-1, 4-7, 4-8) have a bus
crossbar (VFE_0_BUS_XBAR_CFG) so any write master can serve any line
there and vfe_reserve_wm() is correct for them.

So the clean fix is to make vfe-17x use vfe_get_output_v2() like the
other gen2 blocks and delete the duplicate. That drops the PIX
distinction as well. I will do that in v2, with

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")

a "Fix" title, and the fixes ordered first.

Hitesh
