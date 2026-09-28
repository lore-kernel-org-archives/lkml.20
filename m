Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021105.outbound.protection.outlook.com [40.107.51.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9CA49A3AD;
	Mon, 28 Sep 2026 10:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590981; cv=fail; b=THtrEpYB7WAAHzIPAvGxrAtd3hq+iiSQ1KkYgSogRYUGYpRW4cgWsmd265NeOwW26jAgg8Eeh6iztre6CBYmUk7rqkOUE5mmt/JdcOTe/pnbZ52xnG1jIWF6tDk0w4pE603cMPI6NFXAjddgq3sntrf+9Whz7wzVkLx1fXL0Hbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590981; c=relaxed/simple;
	bh=3svBSxxjsMPhEjH116BAuGCR5z658dtMMst5o8e6xxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H6vBKb3x8jTd9yYwMt0JQxA2LQVZEkvuOBwZOUrJA7mTJ2RgNmY6bwY1rRFXDGsMb0y0IZsmTUeWkwychXxEPyzhTCkm5RWgSQhvLeROasgy7PFi1LFHxYzchZfmTtXupKOFr1UyM++zEVXVb79wahqotMumfanxwL27gc2sKu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQZn96RQEHV4BccxmKi2eoTEiUFi5oemi7UzAZtF9TrvOHgi3Jiu3DAdjFrXof86CJ5lRwf2dKa6vvNtEictDj7ZNcybtAvsn63neIbxsDE19XJ2YHyMscQ4/Y3nohrlZvNs5ytWQrDT1DL+I+ScjxbPn79I3mlqv+LGgCqtjGzlj3NHov2OY3gT+1/tYUQBEnOvB2LHc2yLbopnKIXNlzc8f9StsxAsXJnd+b6RrwKQcjUgzk8e0sfXafzgg4FiwyGCk62JOUekBTwOrDAryKH1AdePyGnGArKW1bUsFV/5saF/nvHJsvurH3sqtMWkRlK77U5/kJcZim9x90wTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyZ/17TlucPAHE0LTypb6I5uKAf/HjSzjgRipFTY5qo=;
 b=yjQ4npAVGZ3EPMTH1EKLGC6nuL1Ax/LhP6X2TZOpMxe347UInD4FJR73hgCjs+hM1Gbkb4EJfvS80kfwCy6UZe1gx3eKfkDitLdpagj7Lvo1amF8lFSa5U7+eIOY/lqcrSN8jmj3OHIIdVdLgZYp9wZ9Lid4TqBa1iufx5yzYKeVdC5FI335FqXaSuf9gmB7RKOdipezbwW/R818VIRcEPcK6ZX82gPGXoGp8WpU/R7mr0NIMNcRXxvIcZsVaC4gdaKJFV5gQgbWNKIJPtstabIZaWN0FOhAb94g56NwFEhcE91mXbqgiCthlqwT7rfXeRb4jgjRjV9AMS/h8ZQzEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB6171.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:226::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 10:22:55 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 10:22:55 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v4 2/5] media: qcom: camss: vfe-17x: Fix write master selection for RDI lines
Date: Mon, 28 Sep 2026 15:52:34 +0530
Message-ID: <20260928102237.533341-3-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928102237.533341-1-hitesh@ebytelogic.com>
References: <20260928102237.533341-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0060.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::6) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: 831a1b21-7014-45a5-8e98-08df1d4a75a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|10070799003|23010399003|1800799024|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XyG8rJuqS8pIJU84AYDKCPNPpJh+lw1ijrJSQFLHpZdvK0dTZHw9sgw8ngGpxcy7aAeKXGgXQyCCBvLKaVrz77cACR6ZD164rjbv5Kc1cbw6AZ2lNRbz/xhpcbbaZs/qxjf1XeX/aPkfcc83HT9NXB3zWvZ84a/4CGvMtALxNqH/EwDUhrH2j8fL9p9aYH9uUrRcqeNFMBTj2KlDCab7VvXujGLCzA5dtZ/gf4brBeenwS+/JKtNYkrp2c5n0frjFoCrG9D8MNJ449yYfiVWsS8maRGrQLuxUXiTBoWabBe9GHGA0z9aPdYoZYR7UUGmv9viGi/klkpl/CnDK3wzIKQyIVfkMeOi6JNLxo7uERQj5zYkz/3i1FPWnrBV1R0afKpwFMNYGvst3qWt9kuo0F8TaWIb7Q2LbFWbp9+SxWeM7W4WXhEnUSSdkWY1lMR2Uq4su3nTchHVtSzt2Hwb/Gm9iiHjpdz5rMOeOlT/MD3GSkdvt/TpYEUuawoitbRn9ZpGoIIxi1hWCiw5xo7Z1ADQAdWtrZLk/R/eTmHHOuGLl5gUnF+vrXry0YCY1oMovb2BYkPJNtBMWJ7BdwAbIseTO6Y0kZyg1lWaUDLJUtpjtLJ4oqk33Yt2421VAuY2yMztGIE5LHFqht0iGgDqko74Zpnfe7gKB8oWinhRQIc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(10070799003)(23010399003)(1800799024)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pngYxuPOTosuDSWSlLskIo1l36PGitKByn0uMMl4mDlo6U6nNfArEmauacqR?=
 =?us-ascii?Q?+sQKqtXAHhRZ/jsGGRRy+xc84hrQZQlu3MsL6q16l1G7h4kiYmrBToovTW0D?=
 =?us-ascii?Q?y8jtGm0Jn05XppDqSTpf2Bv5/mdkUdubm6d0y+ovRpt4XsSXfSJYB1xK56kp?=
 =?us-ascii?Q?K4t5DHMlI/fWwWTsv5SOTQypqXkUW7brlFnOTA9FOd7c1iiuDslrbZFVa4gI?=
 =?us-ascii?Q?mviaBJp91GR8gejo82qQXRI+zbMcxZMiscMt7l9gXG/slupyLrtz9viab7jj?=
 =?us-ascii?Q?X0cVbX8G2sybPvdBVpO1QUROOGwguvZ1BdOt7vG/mDst4OM8YLMvk0tYQht0?=
 =?us-ascii?Q?ZRnSSu+5tLPYa7BM0qUbXMtX+JbA7Ddqy0eWCEjdDWdiRBe59axAKUDHZ4zb?=
 =?us-ascii?Q?HiFWuH37PzLGNaKV5l42hPQoCAwkZrDxQ3rXjyVT3oub6M6R/0FMf6+/TXCV?=
 =?us-ascii?Q?78XE+8SbERAfC+SOttY6eSd+R1WxMM9yAWd1UY4lfiNw0P/3EiG3vY9NKgSE?=
 =?us-ascii?Q?OMfrNQo2emRTXi+evII9ys7XtIq3lZQi+dmUBzrqx/WNCg8rIeJ4zelAewQf?=
 =?us-ascii?Q?t3O+hLB0q2iDCzD5Yju7lEQLGnQn8iWY4oCMuIIioTqBc0CVP5RbaLxjWjor?=
 =?us-ascii?Q?/yiO2zlGo2SWOV6Z5ZStsb8lijAKOLI/YcWWfHwUDSvXJwFLVGRr5UGcwqb+?=
 =?us-ascii?Q?Pa5w+8XHK7Rn1ogbLHncYJANlknybVGzmKUNR5q6tMgRC8Yi2qFFmf/FM1BQ?=
 =?us-ascii?Q?EQ2oIc2FDspp8SiXThQNXJkE//8Ev2MhbzcsDgKmxT6vluEyMLRgryqE1QXA?=
 =?us-ascii?Q?u3746IzKsL4goZZMRlc1h+eq83YA5AKtdjne4qlmIv6pFh3XBZUlTIlQAcw+?=
 =?us-ascii?Q?GOzcbvbu5fMnuwO3r/iDTxvk6ZkTi3tJjy8PwZh9SuZMPe9dQfKEEyVAycwR?=
 =?us-ascii?Q?Ls9eHCQI3sE3QQNyGIgaEZ84UyQ8oelkKxfe1By4YG0D4DUfDYgy94tirc3k?=
 =?us-ascii?Q?16NhnxEvPV9fnKebqQYJcLW86R1FsyNaVmBus2XsJGgjc31IwgvjNTH9PdJM?=
 =?us-ascii?Q?vNVBZa+VT0y7uMK6U7F0phh1F0jrE7ht6XTJJOubJ2V0vfZyij4DpJRsyadP?=
 =?us-ascii?Q?vl5B4NgI/En88+47RzFm8wuHrgRsAHMxFVRS4cpzcaF9urITreZL3oEziZ2x?=
 =?us-ascii?Q?96h+OmhXhLSUFJsSGgtyAMTnNiOMYW2I40CwDCgMSkCgttzB84TBJjYEfT9M?=
 =?us-ascii?Q?+ltY0adW7u0QgKIeZfUqbcwJ1ahfqYefciGXS8Jd76f5you8hVWbou6dhcJF?=
 =?us-ascii?Q?vQeGd9mYwRb2mAW3Y28ael94G/iBqXRQ3lclla6NrFD2+0IJzYi5h0zMIBhN?=
 =?us-ascii?Q?aatRHEO7JDGvEoP34TCFbWQ79+LKkjaOVJ5NEkNbDyjJi2WUuUI5nsKTT/PY?=
 =?us-ascii?Q?70gdrBuXp8xAQ5ZOIqS3A63cFiVSSxjcoxb/F5a1sY+UFzQOeR9W3gH76CWE?=
 =?us-ascii?Q?h6Aj/L4crGDvcw2ml2QAnlBAwdWjleT8Kyik5qfkTbTyNBiCk/65wVhHPDdz?=
 =?us-ascii?Q?je/qxx1wAB9NNapdxt2XxgPXRFhSgkqNMWeBEoDMmW4Zt9CcFitW/LeEV7+N?=
 =?us-ascii?Q?GkVCxgEgRiBbj8u3M8ZmQLL+35KIE73aK61XO3kHjkrty6t0HnHRnVqQ0n9D?=
 =?us-ascii?Q?SGG9jUWuMBvFxsc9UMAol6yVQWaB/967+ErLQBLzhWAWD6KSnnB2SItPE1pz?=
 =?us-ascii?Q?pkJ6cs+MbUIq+kRv5RGMDv3xObqc3dh+alCmSxkvOYFECjBlEQk0RvNT01mX?=
X-MS-Exchange-AntiSpam-MessageData-1: zK6PESohnCHTYg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831a1b21-7014-45a5-8e98-08df1d4a75a8
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:22:55.1442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6l2CVs2981VhzVpUE9Zf/+QK8jrjVQfH0DCE0uT5NP7mG3KSKHsYa6wtb+JybR4rCbdzqdDJtWeCLoN8GcTwoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB6171

On the gen2 VFE bus there is no crossbar between the RDI paths and
the bus write masters: RDI n is served by write master n. The common
vfe_get_output_v2() reflects this by mapping line->id to write master
line->id, and every gen2 VFE except 17x uses it.

The 17x code kept its own vfe_get_output(), which reserves whichever
write master is free first. That happens to be the right one as long
as a single line streams and it is RDI0. As soon as two lines of the
same VFE stream, for instance two virtual channels demultiplexed by
the CSID to RDI0 and RDI1, the second line to start is given the
write master of the other RDI. Both write masters are then programmed
with the buffer address and frame size of the wrong line. The frames
are truncated to the smaller of the two buffers and the SMMU faults
on the larger one.

Use vfe_get_output_v2() on 17x like the other gen2 VFEs and drop the
duplicate. This also removes an error path that released
output->wm_idx[0] before it had been assigned.

The gen1 VFEs are not affected: they have a bus crossbar and any write
master can serve any line, so vfe_reserve_wm() is correct there.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 .../media/platform/qcom/camss/camss-vfe-17x.c | 41 +------------------
 1 file changed, 1 insertion(+), 40 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index c011f64f63..62c2405359 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -382,45 +382,6 @@ static int vfe_halt(struct vfe_device *vfe)
 	return 0;
 }
 
-static int vfe_get_output(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output;
-	unsigned long flags;
-	int wm_idx;
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	output = &line->output;
-	if (output->state > VFE_OUTPUT_RESERVED) {
-		dev_err(vfe->camss->dev, "Output is running\n");
-		goto error;
-	}
-
-	output->wm_num = 1;
-
-	wm_idx = vfe_reserve_wm(vfe, line->id);
-	if (wm_idx < 0) {
-		dev_err(vfe->camss->dev, "Can not reserve wm\n");
-		goto error_get_wm;
-	}
-	output->wm_idx[0] = wm_idx;
-
-	output->drop_update_idx = 0;
-
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return 0;
-
-error_get_wm:
-	vfe_release_wm(vfe, output->wm_idx[0]);
-	output->state = VFE_OUTPUT_OFF;
-error:
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return -EINVAL;
-}
-
 /*
  * vfe_enable - Enable streaming on VFE line
  * @line: VFE line
@@ -441,7 +402,7 @@ static int vfe_enable(struct vfe_line *line)
 
 	mutex_unlock(&vfe->stream_lock);
 
-	ret = vfe_get_output(line);
+	ret = vfe_get_output_v2(line);
 	if (ret < 0)
 		goto error_get_output;
 
-- 
2.43.0

