Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010064.outbound.protection.outlook.com [40.93.198.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7705F282F1B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792373065; cv=fail; b=caRx78fX/SMd9JD3SwB1APvcP/t1iyoEiJUVvLcNVxJNiBx89cOZUGZZtId3ZOIXY8ce4pkHRdPbs2T3ajxBdcdN+d3L9NFPMNqFLm2Zc5RsrvxlM2W+cxJDPB0b34XSGfhLzp8qT/dD8pE0s0YPWmS28l7rtBJ16EfM24DE56I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792373065; c=relaxed/simple;
	bh=cn4R6o4GNiJNFx0AR2CHAmasy7sCRbvBeJYbzh4IefA=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=DeT07y7WqbbFcmSgqGOhc62YBHMqMc0xltADwTGUQWXsjIGVZXb2gO3QaBvaOYTxKtSmTIHiGVcw46C/DhCy/2SxsMYIAlLRAfxX/Wju3FZPUn9OR+VlhGgnK9vJ/5RB8XXVx/GG+FfPbYMo1a7Q37kEn4MHBPkwcyXHHoe9cus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZdXWcEG4; arc=fail smtp.client-ip=40.93.198.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZdXWcEG4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTEcOs44EvAY+qvMlrgNbYyD5w6wLMpvMTGU80Hsn/CsxQramPW6Iy3+9NMI8zXawdiC9EZ/RASr6qA/NWpkn7v2FEbMh1RolwgmVlVsUrHqQAWTYK4VsDa8ZDQpKZ2wecpT9KcPtVZqvLtt3uolzZkOtk86mVzTXQ0awNylHYcSuLirwbS5odYy2Ss7TYSWmYteO8Gnyx1lH3UoKJYFMTX5ENG9GeQDKPMP4yZ5Xhgxj1tEM8eQa7KUuTHSp9a8c+imwm20Gpk52yxEp24MULK6Fj60N51uSssq2lwpN3PdyvGmxAqzP36A2d9rGNIWn6z8opSMDBQroIscN3j6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/6/Amrf42xW+M1YTbCDFA4+Fzh358sv09e5IRuSijk=;
 b=uqr6cFtgNHRhE066yxr5hgAAnqWCsOtyXhkrtXIXWrHODHj5tKQDlZF0OOY7wBPFtzzCqKjjwMrliCbcGGOiXvK6d2zSRGCTIv3hAkaf5zImhD9Sw96W6cMCWhLdZmIf7CMckG7+GlK6LnGKCnXE4Dakeg9Ryxv5b0rK1us0YDqDzsnCWHiR2BcbJ1TyWt0E5MIuR14933m5dSvgZK+l7Kvz+Jp7kWOmFIMx9IRioSgU3XLi+2VfDCHP2txMGH1hGnXSsCImp6qHIqqZplW9858kAmUEtFRkukwPlpfcgKgdhycBemc1u0GRNCMTxgRLovUHB7Fqwkci77sYjIdcpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/6/Amrf42xW+M1YTbCDFA4+Fzh358sv09e5IRuSijk=;
 b=ZdXWcEG45SowM+GuZssBGbmg7EDDJ4dD/owJrFl1l5UrB6ZoH4hBsiDqN+YbA/t+pNynpJegkw7kHoD5De/0Bw3oqXQr8HzqI4J1VQW3kfqjxrwncEIbu8lSHDtMqRnDfCUKAIhcK/LfuG7DDVcK2ghH5NhOoE8Grva2+B5WYNbAE97kT+ZKvX2l4AymaLWGx0gyLqkZDFrxCsFzbA2hZUF9rNycjmvgTOkW69AzDbvGYLTAEFXsX5lWen6nTTubOqnWNarH7cgfGr9PO8+8QlKhrSjnCZ7pnJMd3eHdJJxVwleXuc+SnMM8ySU1NCQblWv9au/LCfHcusFFj8Ihkg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by SN7PR12MB6887.namprd12.prod.outlook.com (2603:10b6:806:261::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Mon, 19 Oct
 2026 01:24:20 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0496.015; Mon, 19 Oct 2026
 01:24:20 +0000
Date: Sun, 18 Oct 2026 21:24:19 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Shashank Mohan Jain <jain.sm@gmail.com>,
	Yury Norov <ynorov@nvidia.com>, linux-kernel@vger.kernel.org
Cc: yury.norov@gmail.com
Subject: [GIT PULL] bitmap updates for 7.4
Message-ID: <atVxQyCK11nPQsc1@yury>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BN9P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::23) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|SN7PR12MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: c579e345-6f1f-4682-60af-08df2d7fb352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10070799003|6133799003|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	OM4QBNCmVlftqHF/JcW6PnfjdQzb7j5TQ7wKvwXbjzG87DflCiEKVBrcQqmyO66UTryT8pVaKggBMUWFvpF/LKIo6e5MQkLSMweR4etcjMzQAPha5PAWaALcr/2HSY3Na/VQJV05Q2HoC2O23Wp48ACzWbuBXHAU933Ci94JKfEHHXuo7dvYdP6TbHzHhiAerXj4zSj6kJwua+w5aA5YQNh+zDZF4o/mIf04sFgsl2mVztid5pidEIIli24srBmUG1VNiAV3M89MuUMLmyBPvKeTWOrjgTMjy0DYHkt0R5maEkCCMJ3HsDUSXx2lrJ6Cg05WnedbfL5Ybj1+/vzjWwQv/BnZqrdzHdBQhC3610vps1XakUhdQlyPVshMF+1loOz8O3/OKayRnEaxfK8XzqLLhWu4SJpFe5lz5Vb4Fe7nawZkVwav0iXDAXL6X+2gzZR/YIbawTLbt1IPsneDPYgDAMt7Mj+SPy+WYmruBt0wZGJJgh9qn1T/zeHQeawiNN5/zdTOomexLBPekT1j20ip16ndj1LjyHt48blWXr+oSJQmNsJWPcRhUk72CiT4ekUTFLXvoicraQ1kwzugAyNFW0sCnMJzS1RQdqC01/ZcMJYaK932CtJspQAcM/GlW26E5kgaYujM7joZdyvNZY2beto5yOyIhqM6P5NzQII=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10070799003)(6133799003)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R05AST070SFW5e+EPB6QT2ThtgbtomPxUKpp9I1oZEDoMsL+3HbA11Ji9uyk?=
 =?us-ascii?Q?rpdmZ0v52/ZM81vjJ8wN/Te72OGDCkOP/3UgkjoJjWmWIwoQSSy/DgQQReqh?=
 =?us-ascii?Q?yaO3YWDIqP9KIYzem6MAzpv60YftXJsBNSBqJWT0bzjL5QfDJrXPi2njhy1/?=
 =?us-ascii?Q?3Sc7TdIHtnyP/BBjxntJ9BRI8+jXcXnZMudFkkLQRHqU53YAxYfPHPjufdgT?=
 =?us-ascii?Q?ZcY+9YdWnkVdHC4pnudFc+JULzyD2JcE/ReC1LFrOtr+sUzplhfA6BoG6UBa?=
 =?us-ascii?Q?4j2KUejLtAy6htF1w+Pqm/r9U7qPkhtSQuhDXvJVmXFch4Ir9dyT5LpJmBtg?=
 =?us-ascii?Q?GaDDO3MokMe+OcTp1vEmtgzNa4SaU2KYB0z3Gt+lKSO4pOvBcf5c0kj2HT3e?=
 =?us-ascii?Q?7N713q/9z8S6fgxQ6IUX00mTlqpk3RJO5fazZaFcjsdOKKj4amT74aGSmd9F?=
 =?us-ascii?Q?5Jh11X7UqooaI7jaxLWryC2yBhoyvGm7jyX6KwFsBNI/I/LxA4H+LzhnmthX?=
 =?us-ascii?Q?vnRHJIHEiC3saSNqx4EYrjlZ/VbRT/lI0XKjntSSFNkByTxAFuvMlXw5wiQv?=
 =?us-ascii?Q?Fnj5mNuvVQexnWQt+VLDo2NaE4C8wDGv/4RgYxg3Um2sr4oUAUfn1LIowcPV?=
 =?us-ascii?Q?XyNvDH7SF2xKglGYtm7Fp7nNpMk7A6zA74rdmHvocaBz/oMBhU2Ulnmi13kb?=
 =?us-ascii?Q?G2FUZ+Kf3cdFbehyH1DB6qG/orQ+jtzllb9YygTMsUvRh3pn93UpsRIJtO5E?=
 =?us-ascii?Q?u8/X42NAv/8qg6luCmugwtYIMKAjyHqJDS4ePvMgby/1XeCJQIu4S1AtT3le?=
 =?us-ascii?Q?8aRmCE3gxFWFJd6dtcRGb3M1pH1H0BKPGzrnpOCnLEuICWA4EweI0Ms+j/8R?=
 =?us-ascii?Q?M0HIjedkdnwo1Z4JSoARZFM9DOjRdVPY7L1OUd+0ZAurfsjmuUtzird4faIf?=
 =?us-ascii?Q?7lcCvV+Syj5CmIzPALWpkWGR7mkz95pooFZ4KDogx5PgPdQOskx3aYppmJ33?=
 =?us-ascii?Q?iVSmm7UqpCAK+syjeXLcHos6DSv4a6yLJwPjYdUGmvUKXJOPB0HaUYB7cShg?=
 =?us-ascii?Q?dVEYcDhhx0p+n1NEHO9gxoE+5bWSY6NtTNCEO5Wrfm+ElPbsWXrTfFVQuDJI?=
 =?us-ascii?Q?9i0CZfTS8eRNxgeENJl9TuhWh4BjEGNt6gDG18FZlMtP6mHNpHiwLpy0kFmk?=
 =?us-ascii?Q?9aGv2uwd3egMrsll5D2nMN7yeo/rYdxs33IcHBYX5WI2r/cs72ehkVndZZyx?=
 =?us-ascii?Q?3DMs4BrVtROwaD36JmvRqcu73RienJ/nDfduKLiWfdIguTiwGufAd5VhMtBa?=
 =?us-ascii?Q?OTS86jJ8jThe+iN4fALrAQ+tFSjpWd6dt9Ya3t/cM07ppMC56M9+hJa1KDfB?=
 =?us-ascii?Q?HydiPmkDsFm5X2cpE55+DSIWQxZ+U2dXpqwwAO/4ZezH0ZHGl9y0pT3um1nq?=
 =?us-ascii?Q?GBTvM+Vz5ui0be32liVy7HZWNhAXqz9wnvO9E37iKG1LFtEb6PaFESYcTrJ/?=
 =?us-ascii?Q?nwWlpXB/vtUbtx3m3xPTcl56RtFQdXM4AzR9P0rTnT8THXveFQULXrjOGkBg?=
 =?us-ascii?Q?psdiFiTqIHP4lmwSRVNeegPVtVYixdzREcip1OR/XYxUfl8po85SpPthDRCJ?=
 =?us-ascii?Q?wImqtmd3G4GvvSjrAAAKSl0orMnc+YwSW6BRGCVA7LLYwWJQvclu7jOhpiFY?=
 =?us-ascii?Q?4Hc6vDaiXNzOlZpk1mJmNXjjcHc+6UtZXOn/Fvl3VLpLLXdeZbxNJv8F0A7L?=
 =?us-ascii?Q?5QSPDudb9CffnByY15ZNlOW2SPY6ByPCH3cK00HZBJJa3W4wcbx7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c579e345-6f1f-4682-60af-08df2d7fb352
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 01:24:20.4175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAfiC2EjQeI5UBizwYi13IMpNSFn++oc8vIercRPxgX5Y605fUGIFMWLlJCQC02DJW45a/bFRufXzZNDzTKHdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6887

Hi Linus,

Please pull bitmap updates for v7.4. It includes __MAKE_OP() macro
removal from me with the follow-up from Mark, cleanups for bitmaps
parser from Shashank and a couple Rust docs fixes from Georgios.

All patches spent in -next for over a month; applied on top of v7.3
and boot-tested with no issues.

Thanks,
Yury


The following changes since commit 93f51579e7df248780214094418f205253383cc5:

  Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)

are available in the Git repository at:

  https://github.com/norov/linux.git tags/bitmap-for-v7.4-rc1

for you to fetch changes up to a73b4d1fa7d334a5f7de5bb0a14726530f66196e:

  rust: bitmap: document panics in `next_bit` and `next_zero_bit` (2026-10-06 12:15:40 -0400)

----------------------------------------------------------------
bitmap updates for v7.4

 - __MAKE_OP() removal (Yury, Mark);
 - bitmap parsing fixes (Shashank);
 - Rust docs updates (Georgios).

----------------------------------------------------------------
Georgios Androutsopoulos (2):
      rust: id_pool: document panics in `find_unused_id` and `release_id`
      rust: bitmap: document panics in `next_bit` and `next_zero_bit`

Mark Brown (1):
      bitfield: Restore be16_replace_bits()

Shashank Mohan Jain (6):
      bitmap: bitmap_parse(): reject non-hex character before 8 digits
      bitmap: test bitmap_parse() with an illegal character before 8 hex digits
      bitmap: bitmap_parselist(): reject trailing characters after group size
      bitmap: test bitmap_parselist() with text after the group size
      bitmap: bitmap_parselist(): don't wrap around on a huge group size
      bitmap: test bitmap_parselist() with a group size close to UINT_MAX

Yury Norov (1):
      bitfield: get rid of __MAKE_OP machinery

 MAINTAINERS                              |   2 +
 include/linux/bitfield-fix-width.h       | 241 +++++++++++++++++++++++++++++++
 include/linux/bitfield.h                 |  49 +------
 lib/bitmap-str.c                         |  24 ++-
 lib/test_bitmap.c                        |   9 ++
 rust/kernel/bitmap.rs                    |  17 ++-
 rust/kernel/id_pool.rs                   |  15 +-
 tools/include/linux/bitfield-fix-width.h | 236 ++++++++++++++++++++++++++++++
 tools/include/linux/bitfield.h           |  49 +------
 9 files changed, 538 insertions(+), 104 deletions(-)
 create mode 100644 include/linux/bitfield-fix-width.h
 create mode 100644 tools/include/linux/bitfield-fix-width.h
