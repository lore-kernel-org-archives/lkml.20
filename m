Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010050.outbound.protection.outlook.com [52.101.85.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0392F42E42F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496296; cv=fail; b=FofvI9fB48BiHec5w/JJh1CGZVf9BbT/7fIP4JHpC4VpWyqSqF5aWQm48EAa7p4zCwWJg6N33XBCPtHFJjfOGayPFWHbQMrnU1CbiXVjvjO/v3nG7PI0LA/C9Rc+SnmIO0K3mOgBub/eBCBiv1fzv/fo2t43FaCv6TRmgWlmPw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496296; c=relaxed/simple;
	bh=DTM0pOqbpRo7MQWS9sZThlPQG7G3ILnjvAhAxF6TLzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jfcy7y9H21XP9lTZo1r6UMkqkjMOlc7PAmQfeg6kTsvDRCVfkXtCXq01Zpa9wXhgX7x3k5KML/vXN7pPWN8inDkJM1Ugv6I+N7MXMh2xgWn6ByuBy9hpJbS3bzo4a5HmuOTbUcknDp67eRDwS1aIBxkiqnv//E4MacLuuLaqNcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CdxMCr3N; arc=fail smtp.client-ip=52.101.85.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CdxMCr3N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqzRfTMnOSq1dRBGNtFzFPcucjAvtRip8v+Yb+YkKqqW5w/DK20Ob2GnJyTtLIZ6DLtIFBaG2LoYHrWuuUE44t/EQvEprF3JPMFbF9KpHcg58EbKRR/2RNx4k3UBCsupAPUoT4wJwGpDlNlKNVun3xTQEm8Nc+1laKMdaWY8XTPrj4C1Pu07uOhI9gVs2BG7eqSmuPUTSRC2K/epTiFPlNDceJRGYrx3O+OtJJ96fqXezucGC1cgThgO5g+nwv7M+cGMpMeAJH4IzjeaJvb49nJ0s+2Ok0NKZqEHDlNijlV7xzed6SaWW7C2mViReooaPY1Tk/ZVEwOyhWGj2yM7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlbsRc5b6ALuv1Mu+j7XrRWpRMdndr8g8ipoaHfCILs=;
 b=d2vyvNf1Ha8BckV3aheirCtyfVw10whwl+JNmter8Iy/4aBuQdK32InzfMRHDWP+pYF+6PwZVRRPIhU7F6N0RTq5pq5ApxAj2j4RzJZAA6/UHXx34eztoKILRgdB4B2F6TNnOQPIJsX9LFyE0ehQfitgUZMSnUFV2/nA2dsfUFODMKxJQdxGC3cg5A5ZHUEGhVO1MsYwOwXW0BAdS+z0XAyYJpW6edUyVu/lP2Sq4PMTz91EuXxSzBvAqrQ8qjCGi/n7+AB6vW1Kal1pEYM/KkxHFjBJC80XokTdMtfSLHEmanQ0YzspMrCLJbu2Y8daMU2gAFqOOsj4cXdmsFFi/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlbsRc5b6ALuv1Mu+j7XrRWpRMdndr8g8ipoaHfCILs=;
 b=CdxMCr3NsekMH52Gp8Y6+WR9tNNgHV1QXCHvgQ4diXjH0xMJcvuViu75NFme6K9id0Wa3IqaQrzOzOqhBfP+0hJu9M9guuvfSldfPYBxQCJ7YSfMVrZT9OsNhWqWyhIabws6rTuCxyFpOYYLrDj2sJ8Ws930PSoryk7toxnus8Ifkb3LJqJ0DRjlM/Cix7HPlXMeKHtWhgL3sP7bQns9fHNHQkNVQ3tb2Y0028MdfB3B56fOCB8cU8s0zbtPIpBvOysCN3vVU1NiS3ErxTnPz+EpWmewqs++Ql5CQxuI8vAFMI2RPOthA+62qTjILtbgDnapVMlZFKiq59SH6z88uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) by
 CH2PR12MB4246.namprd12.prod.outlook.com (2603:10b6:610:a9::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.12; Tue, 15 Sep 2026 18:18:09 +0000
Received: from DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a]) by DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 18:18:09 +0000
From: Zi Yan <ziy@nvidia.com>
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daeho Jeong <daehojeong@google.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 00/16] Remove PG_private by using page/folio->private
 checks instead
Date: Tue, 15 Sep 2026 14:18:09 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <862E7DC4-14D6-48AE-87C8-11664354718C@nvidia.com>
In-Reply-To: <20260913203959.6b46b0b5a052aec818a7f267@linux-foundation.org>
References: <20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com>
 <20260913203959.6b46b0b5a052aec818a7f267@linux-foundation.org>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow
X-ClientProxiedBy: CH5P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::14) To DS7PR12MB8371.namprd12.prod.outlook.com
 (2603:10b6:8:e9::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB8371:EE_|CH2PR12MB4246:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df2b240-d853-40ab-98e2-08df1355b1eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|4143699003|10067099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	5avak+ASL2k070JmJq0qUfFoA+WlI9EefkJ5OVgbng4kM4eP9MRagco4Z97CG5nI/979U1b1N1dMzc3TuSJHErdwtBjya77VUko2PgqI0zPkg+dzZv9oK2rO+qyP/Sw8Aohfn6qcIWbxZmUu5Bd231SzOmDhfUhLYnCvyoB0L8rjRiaCeEnxwEyzGSY0ij3bpVI/iGvwSQ2i3FDk6EYvRPo7YIiMc3Qv9VoCeUdRjmvB3mlqn1YuZoPCq3AQBHEMyNbWBF03T9q9a7Rxp3rXgJ16uQIUJTEikuBGj5S84ZExScjhj7U3SJwY7/9XnvWr2d64wRSWujI0FoVdoWl5YDA4X+gNuBtu9jqGkYVsbwl6+Cldbh35co4IDsImd3vDLMYWxZyeyEbFcOStXjkVwblO6ABpZC7C11yuqG8pW3VoqIpX5lZ6gtfzgjF4xgrjMiOH6UvIzWx0hi8HE30BhBOCsKOnRWvPBnYfoEW3IVv4GUMk3kIPDzTcNPYYckPIUyOEKdKymXnphZMnoEYAmKUXYiCq+rJDTkruD6NTXtn1UKGty4RTeQRx/HeQGGBac3nyjFuF7FYB64fxE1ScQznRSNjOqcfVQvXsZq1xvKX68sXp+IucZt1HjLVALQ0upf7ar0vBXfXrUcq6sOxS9pv3JrVLyNkCmmYDSTd6iO0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB8371.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(4143699003)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cVBAcSGvItFODUzAiu129DNTSg+xIgqVMVGzW0ZfHchyVcPoi2yPaFeLR8qA?=
 =?us-ascii?Q?fwLkJ073BEe4IVWRLGLeryCsEWxY6Y9bSklxa/yl8PX6jfI0dz6j1BesQpkb?=
 =?us-ascii?Q?sJvZckr1PMmWup+v4dD8eYeLDE2UVFLcPFiUAaYdxQRWGbiHTLrH5OsQ6jG4?=
 =?us-ascii?Q?bppJqf5qcgLqKIk44FE2ROd9pu+Qc7zC46b33kH3NRuL79BmPTHQBms4k7Mw?=
 =?us-ascii?Q?QpUHBwO4BMxB2/KI90gPj7KZzNx6cvkp2fEIbKOiXxtCCDbM7u63O1IxmFrg?=
 =?us-ascii?Q?djFs7KgkhOE5ZzuFpNeUSyg/qpwwM12JYyi3zBRi3HrqGXuvtmxmDGjCeEod?=
 =?us-ascii?Q?889fxqq65ixNTH6cL+RRxQwxogVqvQRlL39hQc04aRyLv9cx1gjkW0nn1iy+?=
 =?us-ascii?Q?d1Hsi4V8K27WrPy/d9SnhMSRP7mOkfzo/USSiviUnIZ7+yfy61HG8X05eWUY?=
 =?us-ascii?Q?82sWsiUwczxC1ixEeFPFDab+eGJJq6yqblcYYRF7vWy/PwrKl+7x1mBxIKcV?=
 =?us-ascii?Q?SNTr911khHbxKxhpTwkjg4KvRSHPFaylaOojeq3Dz/VPGOJtQ3rtMrKcpjAM?=
 =?us-ascii?Q?uIiNbIL3lTaA8Uwsgrnf+vKsXIwPPlDdYZlTmWfvJXDWHDbztlzPQY+9g1xo?=
 =?us-ascii?Q?8VUdao3QuDEALNprnxtRxdERTZ6I7ytXJXF1mAGU/O5uuLL1vJvMxS1GTHdp?=
 =?us-ascii?Q?ZSp/0gPcE03NqVPhp7RHyuNt4+yucuEJrCq5XjPJFv31DowlB3KZONDrHCZ2?=
 =?us-ascii?Q?zbSV0h0ZeYzxcfLTf9HnHNO5C/oezFCHAvO4esMEMTHhAV2T+PYtE3E51yZZ?=
 =?us-ascii?Q?CbV91m8XkRaNKhZ1q5y2zE/hMsS5leYwTmOASFevN+/qGWhdyWvjAsn0fTe6?=
 =?us-ascii?Q?zV1Iqr8AlJouXZ87qDVvXIvq3wmreTfdcbt6cliI7e8xNxanAiL0rXdTi+BA?=
 =?us-ascii?Q?OZSfFrqXqRQ/Loh8Oj8pe0xFMAvdK5DRtysdzziKDNL7yve4WFClwvlEsi11?=
 =?us-ascii?Q?D9InIiuj2h5P5wfHk4WPYHMRG9tlskQL9m/lkUF1lgnyidl9Om+IkY12qnPT?=
 =?us-ascii?Q?CnpbzVUVrJPFc0Vd74vG+hFJZL8XWYZEJfoyiNA+MCyj/HwuvdNM0k9QI3wv?=
 =?us-ascii?Q?Nyba8Kxg/G2jNZpaf+wf9d8HIqhp+asTKWrtbZf4Skr1vF5HMQcvXN+qnM+O?=
 =?us-ascii?Q?M9YkSSF5UQaFknHFtRiIEVQjjUpiLTR9I77cxtMyStrntUfWH3ah/viP/MI9?=
 =?us-ascii?Q?bQln01WVopyYnfpaEMeIzaIqXJH3uk7yD5dymU7HebBVwu7dLX9Ul/ByHrB7?=
 =?us-ascii?Q?9OygTNJ+HC3HjhuYLqr4LM16tkXhc79B5cA+Ir+OFTk6teGVwhOyBSR6d2dl?=
 =?us-ascii?Q?vXW/cFaIYfcFlYLAy+T6GBNb7REfPR16ycOLc6PwO62+fktnUYkSgwVmGKlG?=
 =?us-ascii?Q?6wfBDMz12wJeR4+Lr+mWoPAt81wiPCNfFxiVWm9cFkQDBOYAqoU9aYEtcFMD?=
 =?us-ascii?Q?32WYB3NH29f06mki4iHgVd+uLq/6toNtMES6akbBwiNZelQDUmJIhv29XlOd?=
 =?us-ascii?Q?a+Pob7wwvh1iddFjFXnGHczibQNE/DWUNMqY3GS61igANPqjk0WY4+ldpckZ?=
 =?us-ascii?Q?Z9zYOvgvUoSK5SEooYoNtHLw7SE9pCupo3qZP7M3evjwTyBK5bKDqRE4/IfU?=
 =?us-ascii?Q?ImLS4qjthName1UVzcLNhJdlPPWJyWon7qp2olSN8+zrci0H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df2b240-d853-40ab-98e2-08df1355b1eb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8371.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 18:18:08.9937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJV1UOgQ+0f30UuYsU6MjnPU8jzZmf187uIev1uU2f0h2IRiWlR0j08lsaQuq5G/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4246

On 13 Sep 2026, at 23:39, Andrew Morton wrote:

> On Sun, 13 Sep 2026 22:23:58 -0400 Zi Yan <ziy@nvidia.com> wrote:
>
>> This patchset removes PG_private to make space for upcoming PG_folio f=
or
>> identifying pages from a folio (more details in Note below). Instead o=
f
>> checking PG_private, all code is changed to check page/folio->private =
!=3D
>> NULL instead.
>>
>> MM people are cc'd on all patches and subsystem people are cc'd on the=

>> cover letter and corresponding patches.
>>
>> Patch 6 is picked up separately in f2fs tree, but since mm-new does no=
t
>> have it yet, it is sent for MM testing.
>
> AI review claims to have found a pre-existing critical level deadlock
> in f2fs:
>
> 	https://sashiko.dev/#/patchset/20260913-remove-pg_private-v4-0-848550f=
7574e@nvidia.com
>

drop non f2fs people and lists

Hi Chao, Jaegeuk, and Daeho,

I used LLM locally and discovered the deadlock issue in f2fs (sashiko's r=
eport
is overwritten. The fix is below, let me know your thoughts. Thanks.

It applies on top of my other f2fs patches.


=46rom f0c1e94d229a97614738d5c317187bf42a3ff2b2 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Tue, 15 Sep 2026 13:43:35 -0400
Subject: [PATCH] f2fs: fix potential deadlocks in cancel_cluster_writebac=
k()

When f2fs_write_compressed_pages() fails to submit a compressed page, it
calls cancel_cluster_writeback() to end writeback and lock all pages.

cancel_cluster_writeback() relocks unlocked folios in [0, submitted), whi=
le
still holding the locks of the folios in [submitted, cluster_size).
The folio locks are no longer held in order of ascending index, violating=

the requirement of folio_lock().

cancel_cluster_writeback() also ends folio writeback after taking its loc=
k
for folios in [0, submitted). A deadlock can happen if one like
truncate_inode_pages_range() takes the folio lock and is waiting for the
completion of folio writeback forever.

Fix both by ending writeback and dropping all folio locks first, then
retaking them in ascending index order.

Fixes: 2174035a7f11 ("f2fs: clear writeback when compression failed")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Zi Yan <ziy@nvidia.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
To: Daeho Jeong <daehojeong@google.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
---
 fs/f2fs/compress.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 09d9b8d0fdcce..88797dedc96bf 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1062,18 +1062,28 @@ static void cancel_cluster_writeback(struct compr=
ess_ctx *cc,
 			f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
 	}

-	/* Cancel writeback and stay locked. */
+	/*
+	 * Cancel writeback and lock every folio in the cluster.
+	 * Drop the locks on [submitted, cluster_size) before retaking dropped
+	 * locks on [0, submitted) to prevent deadlocks.
+	 */
 	for (i =3D 0; i < cc->cluster_size; i++) {
 		struct folio *folio =3D page_folio(cc->rpages[i]);

-		if (i < submitted) {
+		if (i < submitted)
 			inode_inc_dirty_pages(cc->inode);
-			folio_lock(folio);
-		}
-		folio_clear_f2fs_gcing(folio);
+		else
+			folio_unlock(folio);
 		if (folio_test_writeback(folio))
 			folio_end_writeback(folio);
 	}
+	/* Retake all folio locks in ascending order */
+	for (i =3D 0; i < cc->cluster_size; i++) {
+		struct folio *folio =3D page_folio(cc->rpages[i]);
+
+		folio_lock(folio);
+		folio_clear_f2fs_gcing(folio);
+	}
 }

 static void set_cluster_dirty(struct compress_ctx *cc)
-- =

2.53.0



Best Regards,
Yan, Zi
