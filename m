Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020141.outbound.protection.outlook.com [52.101.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFE846AA80;
	Tue, 15 Sep 2026 09:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463393; cv=fail; b=sfNQTgjby0DczM8aRjUYFt2kY6fOsZqOnBuP8he7Qnye6Q8cHniet811memwjPP5fGXIGfTHgPV1Cam0oI03vKVGeqnA9TrOPMIgCn3qq8KyhsMomwA9FHTxq6jvVb28J+AAD+NVO/XMtupYW4EWLzIcwWHvSH3ejFMHRFiTQes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463393; c=relaxed/simple;
	bh=vs2TKLC4D9tP1Jj7ywDtbeGLLKWYC6ix//TBCU+wcHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mZimI50gqQQgtB9IUHf3dhbK1s6pDYVvqlHaqdpFLP2FEjMNb4n6BmjDzooYnEGenKyLyoAJEj7IoS1EvT23Y0lIoCe+Qe5EHQtEvH8DRhq1PodYl7je56j8292jTszScZixHGfZqy5Jzd8ArN8qsBPshT2omo+bT657pjCuOEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlBZdfp4W90C+BWeacSeYOkL9tdilGHy9e239Af1L/Q90csDM/8tl3lqblKnlZkoTUCrwcS/w0MdiA7yLMHzUiEcWHLIqO502E3uHug3LvjerJVoMGCcoc1VUIzJlKT4kw8O1wZfVpVmy2A/H+7nlhaB8PLcWtiTfAcEhrpVPCkqVzE5VwYrC/r6+Bdk46dEEkB2jrqwYOQbnaUcClxnqIaO4UCMRL6zsEpgPki75LvoLHyOqtyLCa8uFHqrq+K8gwCKFSpVVKLoKVHLikUrYndIsXKYAe3Uy6/BWY6BBO8TMgqYFyab55Q4rHd9q6arG73PWwI3bDSwaQLTqgcsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vs2TKLC4D9tP1Jj7ywDtbeGLLKWYC6ix//TBCU+wcHk=;
 b=XZUQuz7oHmtzx4cdR8kdqk82ZFqe2DKqNoEB5Ju9bYih3MVS1XFFTbcEJCBPGqbcPzMUCr1WIWXXBIBw5p0rARtF5fGKm4zQWn6mV9oDbww+9wee7P5WblTeWgxUq2ef+JbgI//pcfLl7ef0VDwY0ikmHsRXp6iqFL/ZhLIJqVDKYhuTqZPdIWFx5YP6vyp6b2cw98h8a7BE2eTvJSvkUlYNCDk0wcKVhwbzTb08DoEPyoBSV81QOnftFc2EdnhyoltIanQ/F7SLXfoSbhyFRugWoBLgyCNaLrbG2Ep42BGRILMXgdBuph77NxWytyUTimAeh9OWc7hhMgEeYq+xvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB5156.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 09:09:49 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 09:09:49 +0000
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
Subject: Re: [PATCH 3/8] media: qcom: camss: vfe-17x: do not gate write master done on IRQ_STATUS_0
Date: Tue, 15 Sep 2026 14:38:39 +0530
Message-ID: <20260915090929.1284112-3-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aba32d74-74d1-4571-be60-d9639a4fc04a@linaro.org>
References: <20260914133416.1030231-1-hitesh@ebytelogic.com> <20260914133416.1030231-4-hitesh@ebytelogic.com> <aba32d74-74d1-4571-be60-d9639a4fc04a@linaro.org>
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
X-MS-Office365-Filtering-Correlation-Id: 415edd67-a867-486a-0f38-08df13091859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|52116014|23010399003|1800799024|376014|10067099003|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	FyQW2cloZbm491HdEMclXCLVih+zSDydq49eA2COcfrRd3a8HQ67QVc/Vzwecrq6ZCsrrHt0uFsoJAO1EzyKEqQ6lHDXc5WKTAxHIfAgocl7e+R766A50Ns2WYjjcXrUUcIlvPrEmx8xHGnUqFYKRuFvIXqd8TnTE7wMtnaGGpEEjOT5tH7MLf4HWkjjLWa8qpCjAWR6A6dX0uT90P+WZLvxRC8ZDFnSoc3bmhGoxhKTd3pj2SOqyL7oKyUXh/8GCn7e/7kDlyGRGtcm84dpt1Y/gppBHLVbwDzLsIYeYYYDAhUGrvCEEsoVk1boHSA1mhXbqYxuUrVydL6XgS+eVsVDtuiCCVpGasTEvPmMcYyLlO2npxyt8VQlYez3g4kF3IkQrF0NhVyd1Txhn2qlryX2j+ARNmP4q6fC3gk9pc8Oa/pKRQ7ki4PNuoT9ZJNPh2W1JHfwqIlvdp84lj0be6u25cNbnOQJE1yX2iRAa8wrh8WFH5fcLN08bmb15RDjEk4PryI8ye0DVaaj/qP33HMNi+ioAalOshhiQDnZLVgWGwXq8BV6K+Lv5bTqZnvCfpRoaoakbb172Yb3X57jCqJWeXFb2cCbSNozdsTWltRBIGNxyXAqdqJUwoPMe75RetAyXfvqUhLkc1jHbuqzjl1ncNL64gzEytioWT+XLXo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(52116014)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ru7PcIgtnG9EYJbtkeCo+ZUlJ4KSx6WbZ1cWgbBr+66puoWCElpXLtrUftpT?=
 =?us-ascii?Q?n4zrEoj2uDxogx1dTtU9eMSZHNGylwMmiaPEyaC8QOqe1P/WOUhKcVTJBJAt?=
 =?us-ascii?Q?DATDoNsG2yAOwWlHP7FyWN9NKqVhWSEW7NMssezUkR0WXJqsu3D7zWo4MwyM?=
 =?us-ascii?Q?Y/MDzsyMGk1jB5CkZaVdikTQf53amxm5pHwH5F3XLi2g6fY/J4VJUhMohyx0?=
 =?us-ascii?Q?fDY//8eAqPJcY2hjqBPIy3XzsNWoOJHV/8huJMAnEY89Nc2B4mxXunTusEqT?=
 =?us-ascii?Q?/lgELDtFKihTMfW+75GFFfVKEX0WytQ/YLCoyQQUruKvW/fGIFbK1lkiZYdY?=
 =?us-ascii?Q?CGOIXeb2pqJKjXPRp+a95UJx/EGYPmuUUmocXP4MLlRfrbzyL1/M1NHIDmwT?=
 =?us-ascii?Q?jD2bg1yzQeBMkENro9xRUxcIBMqY/1RltW5B5HunAmylUklbsJpTcZqFSeQk?=
 =?us-ascii?Q?GU0Upnwn02xQxpaddy1XSFFMfNDMzUBGEKSaVvdeDdOyvPl27dNvv1FO8TcO?=
 =?us-ascii?Q?hoK6SDxz93FvhlJPE/pXI2bkXcaL6wxOQRBt1i//ILVQeEqp+r7dBJxIkfvq?=
 =?us-ascii?Q?LxZh4neALAfibBI6m5dqlbd5GTCpDKhOgYuRdoABUL+A6uluCPCk2xcTpZxu?=
 =?us-ascii?Q?3pZMhR1p3f1wtgKslKiAMXaFoNYQxnf31I+LiOR/5iP3f6baQtt2Ju74Jly+?=
 =?us-ascii?Q?BW/A9LLXtTJ9PU3RJf94OSXw+XTSq0+pZhMaDtFWNqN9MmL/ANahjmoLwaH2?=
 =?us-ascii?Q?DGQRvJzGFNpu7UETZwNYi/oxbkGfFbpHdhC+UPhC5feab87pusS+ebtRHL5u?=
 =?us-ascii?Q?ctXIwsnuDLA/waoVExivVecuLqSmgxMFVPh2+AESGMGYm3U7q/BILnzBC117?=
 =?us-ascii?Q?pivxdtkgSEmH7khNvN6Y9kdRWobwYeWTK+J4dCZvNVBlk98nlvMUTsSfcxil?=
 =?us-ascii?Q?cNfity0psoq6HCJJhepraWapg8PRe2+uGf9IUhCrh07XE911w9QSjeQzWkGT?=
 =?us-ascii?Q?vFFGYoeA71zruzCjQFr0nsovf4eGcwP9nElAMYGQ5eYtmmV1/mRku1kKbgpr?=
 =?us-ascii?Q?VLmdGQAvrRv5cWPjuhVfksAEMl3CR/Y6NSP+BUzA4rYRKtJOB6xLi2QwhPWY?=
 =?us-ascii?Q?dxNzDkvrlBANK1jiFP0och+dCZPWxl2M6Cbv6PTa5c2esDq+oN07sfKaw2oj?=
 =?us-ascii?Q?hQ1NkiOBgqD1R4GUlGX2SWuiYPrEUmr5e338cca5Cxwh+pxuCuF9q7SLcjpQ?=
 =?us-ascii?Q?UoZp8N6FSW32CwI6N79HzVRaDolzs/iGUp3xtgywgDxr9yXeNiaLabhtHGYh?=
 =?us-ascii?Q?hxfZdtdq7vRT28W5hcJhL++oJVmkjp9DcQgQL4hcNpWMSbFaHIVjLypVcIuD?=
 =?us-ascii?Q?MpjMRrCx75hbJ16wljHZr6/HJs8fGEbnw19hz1GhRfDiagoIS04Sq7LOvpuw?=
 =?us-ascii?Q?47e0R70XcUkjNcb3pfYJHhu4FSts3OXOqozhnH+vFAWALy2p/L+rGAOHqwhj?=
 =?us-ascii?Q?vbXgnJlTp7zCZi8nNgeCoGydVpI5EkL4Z85rhl0Qa9BJmlPhg6BYgd+htM5P?=
 =?us-ascii?Q?M371RI0GXH690EwbUCKImHDfQKG4waFcZRI2RkmAZdWPhj+YvuIUUsOEE2Oi?=
 =?us-ascii?Q?4ODX359JXCLTqM1RDlgLeNHs/MBCtd/Gsb4YRfARSswHbYzNHg8LBfR7EKJx?=
 =?us-ascii?Q?VWr9zstheJ+Z+R6dGf/UiqMACipySw6byFpGJkLKINSdYkLZd28Qf0CAaucT?=
 =?us-ascii?Q?46NvjlNCuqK6KEgLyAEq6LdpIEWPmRqDmDkMjpLzXexHHg1gSkke1vNSBGYP?=
X-MS-Exchange-AntiSpam-MessageData-1: 9i4b87k8KrBnqA==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415edd67-a867-486a-0f38-08df13091859
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:09:49.5962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9INhFObpdtMiKmGvtv5K7GZbhkoLF+nhl0fzgAOXxn/bSBsJAH5pYp5r/zPPfD3LctC8Hr167ejFirT1E0CyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5156

> Please rewrite this whole commit log in your own language.
> Also since your are describing a bug this needs
> 1. Fixes:
> 2. A patch title starting with Fix
> 3. All fixes in a serious should prefix functionality changes.

Will do. The gate was there from the start of the VFE 170 support, so:

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")

and v2 will have the three fixes (this one, the write master one and the
VFE reset one) first.

> Drop this workaround for pix. We will fix PIX a different way instead
> of for local specific stuff like this.

OK, dropped. For the record the reason it was there: vfe_isr_comp_done()
already calls wm_done() for the write master mapped to the PIX line, so
without the gate a PIX buffer is completed from both places. Happy to
leave PIX to a separate fix.

> OK then this becomes a one-liner to not disjunction BIT(9)

Yes, v2 is just the removal of the BIT(9) test.

Hitesh
