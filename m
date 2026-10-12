Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020076.outbound.protection.outlook.com [52.101.227.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDDF3AAF5F;
	Mon, 12 Oct 2026 10:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799215; cv=fail; b=Kp5hkw/5Sjxd7JSV6HIrKxPQtRgtY/SqfB/SExZMcUXCrcJy5mLR6/itBS9mQEWLYWKOwQwKjnfZENUtj+M0+i63t+K7e7DNc3zi22h9scHxktrvL0Qx8VUzXKNed0izry9f7EvLpwufv+30F+c2eGDRVaQV9igUeh/4nZMCDrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799215; c=relaxed/simple;
	bh=iQDQn81bCnDzno1sZLrFmD16NN1sw6zigo5MVSU3EkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N3HKyTTkEbLFjDkDfveeIUBIGTr+J5TLsDiDaVLv+4YrITh5cpFH1YSs98KX6mJGzkEKkCDVMXfYxp8vy/Ke5oalr4eSr4W+1+PsTRezc13G40UW/d5LJY2NyVe8GGHFFypTih+uMSMcEMK1F4bcJ4kAMw/c7LSq2xaYXkqP0mU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.227.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mAZSM/6VG9sW++tt1i+J857BOnZal0QJuvBAoMDtyEoBf8x2LCjg4qyobzTIx3KljkByeDGRrLgLER6dWsAsR0HemvSEmVdwwtZmzOWRz6zBOp/lDYk2PI8hATcnhgGhfMl2xGnF/fkVLvAz1AGlfyHhuYFkWjzPeYdLR42PtKvrxuzKGq5qRhToMWO4CVVjjd+iJ76ftJTg1VcPSxmrNDudafndIaluZo9Dwp2fDRwqlhf2Ga3S9hOQ0dyDSw8HykSXT9QnCdjh/AkUtepYElipxCuOVTFtiRbaa43VbrEAUDzS/DCrYQ0jk/SKjkpTY3xHpgI8rpOcO+32xAZnhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=za61V/DRrxDmSGTY2Lln46O9gnL9bGPevp19n6QWdps=;
 b=Jh7dGnaf/tgPLQU5YM15IYENXKHZPyMtVEvQgk4yXjg+kxEsNRcqKU3rojFZAp+2SMES47mS4CRG8YjYTJ5Kuz9Mp86u/ikYHwV0b35Kgvg4QMIlJhrq9sJInvyG5Np7QJW3OC5LZ5YuOAt9USILNwsukVii55oJRi/neYFpqb7Ak+iZnrHqrXHteAT4+ZMnLCZ9s0wITWTX+iNV0vySVQTPdHaraBxq8OKaS1Mx5q5Om36rzuCiT3f6BJU/4JNIJpbFW8XLPG7pPIAtSjW9OO+85QbmV0LdmEG+0nQQzwOWO9yZyS7hpUNfqF7zJdIFNn8ywrB16xch2J2y2jCR9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN2P287MB0256.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 10:00:09 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 10:00:08 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com
Subject: Re: [PATCH v5 0/6] media: qcom: camss: fixes for several cameras behind a CSI-2 bridge
Date: Mon, 12 Oct 2026 15:30:00 +0530
Message-ID: <20261012100000.316917-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928121508.1404808-1-hitesh@ebytelogic.com>
References: <20260928121508.1404808-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0118.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b3::16) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PN2P287MB0256:EE_
X-MS-Office365-Filtering-Correlation-Id: 54065a3c-0103-4bda-ae78-08df284798b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|1800799024|52116014|376014|366016|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	0q2nVUAP/pPw+eZrEPbsKHGLiyverUWnicksqscjqHFazjlC1pLLX3pA6aodOKg0ZSDiMc3QdL3HfA5eWmZIb4i3ihJb2qcRaKbeBw3b8DCCtDMRYsMUmyE1NT/qbBdcP9qGIU7yR7nT1mD3GZA45shClZDXpOjk5e5FtjB4P42aaYf7YDfwTgLhE8XoFCPMk9VsgtOXrMi25+kEch8LBA/L9WQbolF8/WrnmBR++rlzBRHXBiEa9FggM+1o3IJirDQv5z1mD4ak4OJKgaWWnfkC220ma4zL4UTB+4FdnZh9e2mtYCBtYdqcTt7FMCmXmFqZJmKqWh1IET/2Q5pOTvoHWOG+gDZnPzqqMGPS0PgO9BnDv7mRhlM0L49jTrCfH1f1lK3al2xBQ2kYirm9OdkQlEvuxC06nd5miE/2WrpvMwo4PjtJFkpa7tfPnjE6hoh+ugHUXym27dmM6/1WOcOJpxMymcDJWxHSgB2OucJ8fRuj8f5ugY8zBqd0lQjk01vBUqFrgXqFamXh8LhYkzwdUmoM7ZkwdbtvqQgEajKJ+vsXW4E1OUvSp67kGzZQsFUVlP5nthEuYfbfL3GWe4LVZw74zSz3lytv3+AFWaYbdEdNt3jbcpuFplV66lLXW35tC7Xjl2c4zcbMJQNSmFRiI9IX9pcuDdNr5JnosiQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(52116014)(376014)(366016)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j0AK7JBmg+WMRkn999epVOjAg2QVQ9DbOsdb4uFdea8DTi+2zoQsXDXPjild?=
 =?us-ascii?Q?SKoUjBa0s3Tg/Vb2m7iLqhdAY2R+WbPbKlJB2QVnTdwAmw/AFd1arOwSR/WE?=
 =?us-ascii?Q?kZo32e13kbbCXEpqg/zpkpbfPEJpSom9ZK8nBsnzSRGD1qXFCv+4okkTLc8b?=
 =?us-ascii?Q?epHim5bJEeUE7ZnTMiNKJ/EIyMgUiZMpdT2ElxOCVQphF0X88YjDUJRwnwRz?=
 =?us-ascii?Q?SdzxQnUqWyLBgLClgqoReJa4/02iRQlSeiZ27/3hp141CdBpbWsHBU09zqEW?=
 =?us-ascii?Q?Mv7RqRfEnDED19VEQHvEuaekMvLeh6KYvSyTXJjliBdNNa/5wQiLvFp0kWKS?=
 =?us-ascii?Q?80phZKGymfAgRKn3F31O0mT48PMUr79nDmAi6/OLKFF5U8U9D6Jk0qS+t2ym?=
 =?us-ascii?Q?stM0fJQEqa5mfyf45RawoUe9GqC3WwY0b+jdMfRQDyqUWp8S15GEl4GaM2ZV?=
 =?us-ascii?Q?1DNYpsjD1K3+vRBh8uWNjDp+Dy8rzo+4EMkerDxBBmXBPJV/e3zCgo7t9dnB?=
 =?us-ascii?Q?rMTOmkE4FbCoCBLf0dnyn7KY8GhB6FyWyo7TCLRQpmkVYQGxxqnrhcri1Jxt?=
 =?us-ascii?Q?5HRqUEtr6i6zTWAmastugSGD6glPwLP0W0G4LiqDJahYNR71pyUwOV7A4cFx?=
 =?us-ascii?Q?DA0Xy2Dyaogek+EauHEmoaysp3KZTrUuj1f/AnASsLWlxqxgqYLusSOPjYiy?=
 =?us-ascii?Q?Y4qXyPC59idsJx238E4mXzbkKNwJsc0Q6nTXo+4NaOoNb5YM7Tp7ez08n8QY?=
 =?us-ascii?Q?I0Tzgb44lbDX1rUfyOwd2+DxjWDPod2Q7tcqheV5GZm2fzwdQCmCQiTuDBxw?=
 =?us-ascii?Q?psLNud9txV2pK9Csd6tVQ+ImX9iLd/TBnTKeA5gJOqmipn8LX7h6CQ4P/HF1?=
 =?us-ascii?Q?MYWyn8wCg/l1B2XppcyPbbBC4rGytC3cEeWuheo64H+nRevTwG5IF8rXNiiV?=
 =?us-ascii?Q?iF2fzbwfiT7730iyzV/e5ldof9xPwD5dNWj1H+a8HjaWAsUutL+aYLfZAWX9?=
 =?us-ascii?Q?LoOh+FJvO3lPPYJI7eaXYSqATXQiC9lrm4fEbYaWlxfH70RxWF97XTTAaGF9?=
 =?us-ascii?Q?s2HY7V/udXlpEpQ/NW53rY/KKwOnp3QYjnXCR60hCFL4kXHPo6OGJLw35MQC?=
 =?us-ascii?Q?EwoijJIdCjdhF/uIPxyi1n0GrxdWGwcNgEe5IZQHP0wzqmgChgEBFL8XcUh9?=
 =?us-ascii?Q?wRRpHWS4+BGDRDfwDhZYtMbmCvx6ZzIYu7xw2X78w7RR0dLHN5rrSeXjbclS?=
 =?us-ascii?Q?hjCC5NMQAhgQSJiiNMu6n/gIQUh5kkXXtbkPJix1aIB2bh7UmCVOhZIywHp+?=
 =?us-ascii?Q?sodztZqXBTtTKAjTzPANmtrOcxI2t2MlVK3DIZC1Mi1iowHbEJ4xmhZbnAUf?=
 =?us-ascii?Q?a/bu7Y/Xhzdar6VYtQe980RqsY2wDJSLj1cKqSBjJxoUwGRJ2Q8oiYke+2Jt?=
 =?us-ascii?Q?5m8zpzYr7WKlyN9tqaN1K1sZHvWjM4A2l/EIlr2MmLMzDis4YmGCqhqtGZxm?=
 =?us-ascii?Q?Th+wvaOHpbM+K6xhx0WjhMcFG7A6KDvxCmeWbgRwLVj9MX0zNs2fsHA5Ec+2?=
 =?us-ascii?Q?ObBAKeiXYD/WAJztNXyvE8KEw5kP2ku0pfIquyatBjhyLWlOP1Tz9JcKvHUk?=
 =?us-ascii?Q?zQ9/asu88WS7j6Fl4apexsXX9Mh/YpfiizAnvUug8dREWN2pMWulZ3ApAzXT?=
 =?us-ascii?Q?x0dArUU0XdoAJpWQ2bgQuu/JdIsfnJCC1XIGwoRpmxxz9iIuBzlU88gWWhIw?=
 =?us-ascii?Q?15c4vmtrrI4dpAsoT6D9GOsV9Ef+LyIfvHLoat7ibaE50wWxd7MFsCrRSdCk?=
X-MS-Exchange-AntiSpam-MessageData-1: Y0g8X9Y4RWHb1A==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54065a3c-0103-4bda-ae78-08df284798b3
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 10:00:08.2525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNTbIazyaDCL+4gPAjZ5sci7ovbkhOiCn/jdj0VvJFBZBiT8MU2QUgCJ2hR/dT5pjpnXT3j1zVRnCaNr4Co2JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0256

Hi Bryan,

Thanks for picking up 1/6, 2/6 and 3/6 - I can see all three in
next-20261009, and the VFE reset fix is behaving as expected on the board.

A gentle ping on the remaining three, which are still at under-review in
patchwork with no outstanding comments against them:

  4/6 media: qcom: camss: vfe: Remove unused frame-skip
  5/6 media: qcom: camss: Take the link frequency from the CSI-2 transmitter
  6/6 media: qcom: camss: Create the source to CSIPHY link per endpoint

4/6 is Loic's own cleanup that I carried into the series, so it should be
uncontroversial. If 5/6 or 6/6 need rework I am happy to respin them - I
would just like to be sure they are not waiting on me for something.

All three still apply to next-20261009 and I can re-test on RB3 Gen2
whenever that is useful.

---
Hitesh
