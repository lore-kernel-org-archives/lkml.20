Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021109.outbound.protection.outlook.com [40.107.51.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F254377A9B;
	Mon, 28 Sep 2026 06:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577841; cv=fail; b=ilKqoxI2fk7NS3isrydWDkSu2RJZVi1tlcSBwMRgu5zUM6BXMO6TDJvACAwpZkTmqVljLzsQm/Kr64vP+fMmRJoLGQT3zdicE3LDNkLNQZnlOlllbeug1w2a5dxQ6cofbXwvDa5vxSFTYFTmk7zO7lk9kMtn1w5nhI5gZcGJhXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577841; c=relaxed/simple;
	bh=p03EBwb6RBTuAWGxuQdRYJPMyxsAFZnl6sFuo/tIYgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a/6QiP5gpknqvUH5dP/GCZfH3YKBysjvuVj398UbpOOjipNH4/mVmo72nLAArUG+Xf2i9XVojnwCTUvvHSxnF8FyuIuTPJ5m168rUM1pcxPWrbb4bN0nUwqxtbpybZA1ZnEGoKSDi1kJHUkj8eMuFl5sybFHfhFWkjAUPxkB5HM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MY3aUx8HtvMOSWMJEVmLFR8zxwc3TyjTFJb+sLq4z5ViBOl2Kg3xj9ZVdAAQ99eOlsXpe3dwi2GJfTCTH0W77h8q9DwjAL/rLLP8WuWeWpO2gLs/rK7opN0xQUZQ2JmbR2H2xUGVOeKB+2QC3P5ZboHqM3gCu0DKNt+0EpRvhuviK5fOq2pcLNTU6TjKS0/Y7zhHKn+FvHSBbK5AMe19zORvyJgOwX2Hxx/yYLIzpPJAVCaZCtgRchOe/KAAU/YTpOnbrAJgD46E8+kE7mnKFp6qzsHgp26sexOQ1/IDinx5/FQLc6cZtnoOPQDtHBEZSEZ9BNftjQ6EU8GWbjRRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuWTbuVBT/gRUYV1h8YHwqHXtiMtZYHZm5/9r+//N7I=;
 b=LV0PKD7AkUJMNEz7oT9hJv5TM8SsK6bRC6t0MQAR1PPyx5RUUG0W9iKpkF4/ywm7AmInJMBBs85o/5Berqwz85S+LxAkAAmvDP75iXb3YJiHNIvW6POKc0tm+9X1fouWzSdMP+ha91fmZQ951b02oE1HAJCEIsh0HCBPUeu4zTCe1N/l2wxyFsPBdOiWb5T5C251v+IFsxnTRiZTmuxGBiD/d1GmiC4q9t2OpmV2nsFeP5m7qssOpFWcpBtHuw3IOvz0k6IQNa+Bfl0A7Oljyue/eR7hGijn5ApjQgA8zjAXwupXTozkvdhZNhef4B02dyAisLGgDfaviS4Dk4vcAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN0P287MB0963.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:147::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 06:43:54 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 06:43:54 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v3 3/5] media: qcom: camss: vfe: Fix VFE reset while another line is streaming
Date: Mon, 28 Sep 2026 12:13:34 +0530
Message-ID: <20260928064336.272659-4-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928064336.272659-1-hitesh@ebytelogic.com>
References: <20260928064336.272659-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0048.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::19) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PN0P287MB0963:EE_
X-MS-Office365-Filtering-Correlation-Id: f1cec557-ca02-47bd-4ff8-08df1d2bdcf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|1800799024|376014|52116014|5023799004|56012099006|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	IKRqVW6TVO2Z2s4CIBYKfHtCoxzC2uVnA3vXdNC2oC13kfxsMUpqWkf3qnqhIp7WRlMYj1s0wVRSNZBpKBMZ8N5ieLjmU6/5QnFLhxHy/roDjYdCI84Gr8hbCMyZdjOatOGjLChhEf5XWFGPfXAOqSUnqYZibmqJsDS1vSaT+wGIaV5+enRXchs8WHd2E6gdf1TlNEmuQBYT5GyVqbUjejlHjyiHWF9Ezx8O685sgwHSC/0MzdOoRhMYrctxRbG1NCCvb7dEesORFVUf0Azzo77PUz3dzOpaOzljfxhIhLgm73pu4iAMMMysqyJMdfy49Kxg12qZgeHS5rUqE7xbNh5TALsSnq1PQPd9MFBfomOVuHfzAIVf/2orsjTD3lsNDGb2NEYq7tzHgaxzO36XFc/ac9cvGmqJFd48/aqmHhcTVWtoshVD0nd5QZVf9P3JSVMiL0o9BRCb1JFQPkiqAbE0bd8e0HW6QnviRe6ZFSPkMIT/LTpqlzDfqTEdd3cp4IQVbCd5OPQBYTKlivfLsySRKId9VUVhZhOrT62DZyq8qC47BirP9ulPwWl/vyghFCcVyIbwmDBRN9w9nZyU5CjESYYGVfYDcg+dhyVkwYTJBTvLnJMsYqGjlXhkoxaDDeb30D77N8JGiyjVWplUe6eR+19rYpDsNUpvYHcaYF4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(1800799024)(376014)(52116014)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JBZq4sddnEtcoTDIgiBQGZan7XRVhSocP3FoDdtdBxp7z0DsGukF4pQG4BOL?=
 =?us-ascii?Q?5cidj1oU7gYwUhPffa3vP0cNBy/ffctRUGCmlfw8WzJa7+UcqNYXkekerXDP?=
 =?us-ascii?Q?pzmoJsnUInSRwY6lEs5pQ2/0KDvgHcxOhumIfJ0JEp89aStCvlKuXJJI8+gU?=
 =?us-ascii?Q?a56fPlM4YvhCctGjb+Kg4hioZvaAS9QrW1a/j2BjfPW+Z2XzFk7HCY16Hc83?=
 =?us-ascii?Q?nFl+37pmRx9Xg7Qj8StzDIm5tRE7+PN0mIuVLENQx2HN97fexN/tFBxZn3cK?=
 =?us-ascii?Q?KAdpMWmGjIg4yQrBWlcrahlfDALNP1K2AOVC9MFzmfyIwQYhDplWgcdC7I+E?=
 =?us-ascii?Q?s9VWnULxuLGlSJ006AHkAoSFoqkaMdA4tU7EwCkk8Sskd5PjzFGoq57Rfszx?=
 =?us-ascii?Q?1ee/C70iT1GQgMw0GRaPp7T7vAa6XghG1eYDXaepXji6SdfP+3+oh7d2Gpm1?=
 =?us-ascii?Q?xMn156RJtqSzGEIZ1svZWZqdRPiONPlcHrZkyghW00FOQ94ggm4mmhNAKqgc?=
 =?us-ascii?Q?CCssJVzIEWojWzlHTzsOAkjZXh/r3Vsp9iX8VwP3piMD8p6GqsGcElrbE7RZ?=
 =?us-ascii?Q?Huxe1orN+b9GSQ0Kk4AkR+e7sjdyv9G2NY6aZOME3WBNJl84UnwXSHAzyFfB?=
 =?us-ascii?Q?ID4zvdFT+zjzDHzbs8tVaMr0no6GonibXLrHQrkTdHLUM5GuQ1j4532qF5ul?=
 =?us-ascii?Q?MDff/xFfBdPBIeoExLNyPUvL8iEtjg7Rn8uQJQNT8fbVim0k4wCqRD4UEqhV?=
 =?us-ascii?Q?gun+wV3UFziViKazQEmzSocmHMtVH2HVsJeKq9nGSeNFgwgjcwZJbA1izrlH?=
 =?us-ascii?Q?6BBl7fK6koGOil2NlTidZdTZi2SpkJgyxd5g0/0g9ImKM8jFhG6kxwblGzjj?=
 =?us-ascii?Q?fYcg/FeuFVPQIjNMeUESM5tJQMNaGd3ORdd2h+0NaroLyQLdKfstYsQ5prea?=
 =?us-ascii?Q?uLyelF/N9UFxTLOfaFHQVo+oA29NxVQXFs5OXD3SqwYYKaHn6lxjY67UMHAs?=
 =?us-ascii?Q?bBpwRb/sAfauYpzGrUzsxJ/eK+ycamVbSlah1Fipm2YKtDlvIUaEbqlofQM9?=
 =?us-ascii?Q?wYLU9kfV32j2HgYUnZ2WA05KsxRiTBHi3+OyNuMR7Uype9OA+ciM7fvVhf07?=
 =?us-ascii?Q?CFzGgPzVgS1oxnS1jpWyxZrB2bRqq6wQ5FmHx6IdOdzcuu4bFLvVS67Udggk?=
 =?us-ascii?Q?U/GyS5ygKrWcfjkahGgQzrs21TCuH7T8Ua1w06mMfYy2izCQO5mXleiY1saq?=
 =?us-ascii?Q?OK4zRZ7ukBKNPlNtJo1hJFQwPs7Mc7IiBQiQopKI1yR4Pj/xsoDKryalvVlD?=
 =?us-ascii?Q?Tv4Upt510leNPJ4CGLb9vG0zGmtfJxMrHbjwVnXAFrl3aljOqzuLT6jdwe+t?=
 =?us-ascii?Q?su2INh4GUBsz8Y/DVO5sDL7UgknnmhQWO4kDVrrYjOgMJe9jABlrehSJoiQ1?=
 =?us-ascii?Q?sgAaCJYDdXXW/aTGf/Lt8xMqrEQPaAGCPjRI5bnAG3I6fBnqJrfogk59Obe/?=
 =?us-ascii?Q?zFtuPk3I3wJ3n8R5iaqPjedtYTpBSbi5PncXE205O8M9CUJlFQq1CfLend2M?=
 =?us-ascii?Q?SqdGzfEvUcXbYWHpUF+sJeWvUDlTrvNU1lA0uSRDMaeQqMPdbhMMhV8yz9zv?=
 =?us-ascii?Q?RfZEUBWBLJLW1Cp8zr3AR6jOjjFI08cHSJEy//WSGlkoCe0GDbUEkXFNN3L+?=
 =?us-ascii?Q?I+1Tn0H6wH1hYXuptUYSJCizCm6GqbL+h2hLDBLhgqFczotfcLfe/MCbjrK7?=
 =?us-ascii?Q?UW6a6lpZE3qa/bQhg1SLRyjwP6a0ehnOY4/RnJ/JsO+ArmTtEPIXq3A7/QdW?=
X-MS-Exchange-AntiSpam-MessageData-1: ywt5NBAnG4tu5g==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1cec557-ca02-47bd-4ff8-08df1d2bdcf8
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 06:43:53.9875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gROH/FNZuXLpuohhejqASxkZdzUG1Ffevw+eBPwpV8zFmumJe68J1b0yZ5iAxMGnNN8diO07ORynG0HcZ7EYBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0963

vfe_disable_output() stops the write masters of the line being
disabled and then resets the whole VFE. The reset is not limited to
that line.

When two lines of one VFE stream at the same time, which is the case
whenever a CSID demultiplexes several virtual channels to different
RDIs, stopping the first line resets the VFE underneath the second
line. The second line's write master configuration is wiped, the
buffers it had in flight are never completed, and the VFE is left in
a state in which the next global reset is not acknowledged. Stopping
or restarting the second line then fails with:

  VFE reset timeout

Only reset the VFE when the line being disabled is the last one
streaming, which vfe->stream_count already tracks. Stopping the
line's write masters is enough to quiesce that line on its own. With
a single line streaming, the reset happens exactly as before.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index c14d97a131..3442dacc80 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -814,6 +814,7 @@ static int vfe_disable_output(struct vfe_line *line)
 	struct vfe_output *output = &line->output;
 	unsigned long flags;
 	unsigned int i;
+	bool last;
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 	for (i = 0; i < output->wm_num; i++)
@@ -821,6 +822,13 @@ static int vfe_disable_output(struct vfe_line *line)
 	output->gen2.active_num = 0;
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
+	mutex_lock(&vfe->stream_lock);
+	last = vfe->stream_count == 1;
+	mutex_unlock(&vfe->stream_lock);
+
+	if (!last)
+		return 0;
+
 	return vfe_reset(vfe);
 }
 
-- 
2.43.0

