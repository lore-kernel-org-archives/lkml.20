Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259794;
	b=dTMX8FAaGWmwO1mKhp91ubV8UFdGeddVnPouWIiTBAYSbL7epW34gUjCzWWdLBEoALTL
	 HSy3fcWwytaKP7zGPNbQel+ER1dkbpw108B6Y4RKL8YtqbFVQlXOCKD8LY1bOWvewLCxQ
	 A8r/Ki7+x5NMDxWynW8fCuVgd/3FbLTh+EpX2iIquXEN7SDmWJbi/zQWfcvmflQ2D18Hr
	 Sg07nrqva/wiIN6Mto+WoccH5zpqddzZJfsBpRx/ekLbHIq9Fip1aG18q4F2iZ4THxGiK
	 imcHDP6T4Oz688w1nKHazDVRf8Ug+yFbt4LEPXSj0UspdVEtlYQP/GnzZL3P+WMEr6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259794;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=80Eyd2z2n9yGsjSD8Imtd4uFi09imSp7YDD8qp/LTJg=;
	b=gdQqXrhgUNKmFYq9s/L34FJWicMWXWBoCA+0KjvPe3ZoD2Y4g1H6DN4heOKGRmCpp9iL
	 kQf9RZHStdDOojElFNMK/dfroJfwMYmf3biFfDGVCSiMNoPDTpxtTPsmtOVeePiqqWVV2
	 HgDqvRSYQb12iEtHb9HfKsYHscbKz9Lwtn0JWWga7OxoDJKXmKWCGykKOEhzuQ4mFDJfS
	 sin+FK619ry2vzxR6hnj8XmXmEV3m6VYgpXhXwdJ0RU+Infc16dLmtzAdd8pV5QmtOwf5
	 BIcxtlcg3O5IMs8tOYsSixtQKD/j1Zys+k6b4zK1kQOosYxLDxEJqjeMqf1hitnagNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PlAiH1hy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.24
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012024.outbound.protection.outlook.com [52.101.53.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5C4606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C5C4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PlAiH1hy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1FPXcnIH97ELqwymETTQcG2PpOGBxkAwKSSCi8+93qEbntFnNllhGqsd98CgUwoXBpymIWD4ezatKQaUUUk/Nd37yyBdhvygHz5Hd5dmFX3rp776+hSC0idyKsC2aj4PSkZZlXGsanfglusOb5VRJ4XkbVR4pPhT9PjAKomPBIO0itYwwkwvy//ZkAfDKEoHznpxFrREtwE1roF5C4D+WqdlSPYbgDIgvwTXpWQ77W2ENvUip9MUnmaSg6p6l89xtRISOAJpDzWnfwgVenfGLs25Jw9SDCKDlt6ZD6rtKCRsClgL6gcC3CcRtjkMICFFZAZtC7GJECRYWh6uvmFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80Eyd2z2n9yGsjSD8Imtd4uFi09imSp7YDD8qp/LTJg=;
 b=RSD/vsHvGpYmESHMghhHE62FcWh90zgtc3yU1rAHAgyS+ecdf5+mwBb5eOh0K6RwnAaB/UNkRsuhRIBbYRgiM2yYF0LQI8/w7rLaJiSFgkVNghEwtfx1xvTFRZIxD5mKTIPmaWPLBdL+vDFzzBX7oKY/yk9yb25+VbHGb7FXPQoT/xiRoDNM5BJnv1FNhl/SJq/Cn+09irIvC1TMKLC2x1DEh8Rg9xZFwX//bfQNIlzGaOe5Gi5j88nKzcsDJ4jFVwDl0SISb9mgDRFPVibB+fqktwBDaqS4XarHEO0O4TL38rFC/acMnjoH/BvtEwltN2QV6whviVQ1cXVAJvcFsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80Eyd2z2n9yGsjSD8Imtd4uFi09imSp7YDD8qp/LTJg=;
 b=PlAiH1hy2H90QZyh5tauZ7RTbumI1HKkUK8EJM3bfs48aSnLJZovffBJKMTH0RFrH4e92jqELcQ6AchzRFPIkY/zer8/PyD2odbdn+TrytNzfIj/d3YDmnORFjAwILDwhRiS7QL+wBAtsnAA6AHZtY7nG38/+OaOiK1/qQTIhww/AskMVC7g4OdQonfDwRSV1fBekpCSUWa0lQ/iRpVX9w6uqSOCq6+ErhtXMox5zz/hwgT3eIFavGjoDcAW/hJTuwsqiMF2TGx5UZngxLW3IkxWsP98xmrY0ufHwH8h7FLFZWpAxLr8NG2PECj301yYEd8W4pNlPtnTjOMZ6vilJw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by CH3PR12MB8880.namprd12.prod.outlook.com (2603:10b6:610:17b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 21:29:45 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:29:45 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH RFC v1 2/6] arm_mpam: resctrl: probe MPAMF_MBW_IDR MAX_LIM and hardlim_rw
Date: Mon,  9 Nov 2026 13:29:33 -0800
Message-ID: <20261109212937.1409570-3-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212937.1409570-1-fenghuay@nvidia.com>
References: <20261109212937.1409570-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::12) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|CH3PR12MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 152181d2-fdfb-4e6f-9b54-08df3ea8931f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|921020|11063799006|56012099006|261026121527099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	1roi0Z71ks+6xmyKRB4DAhziN33Gf+JVaHktxJ8lj5JY0soS9dv3PtiaVdOW3UZKIql3HJupbU+lAAQD4151WPlCZ6thr5vYnhTSAehti3KPacrquhcUBFmrkWu1lVL6QoKDDgs/7cRVXOFHG+743L6sQY/f5HfXM091zAcW38CbvCNtG5bH6iA2bLu1er+TqzKkx6Wxc1QTlceSpk7HWL+x8Jxp77W/n5GKuak4kYKK6JnYpMSc1RGJA8xvs1dFIAudUviSR5X8gVhx5QMl1+xeNMcAcQMdywCKCjvhRJI28jIZBlznl4dCBre53W2/4AfwJYbgDTo7hGkXQG+/zhETaz/LD73B9uyqzn6nxAyRqZdzQYOZVgIOIof/Ad+RXp6YrKQsLy/uyQMTAjWz2DNIgLqI2PWyVIAHUAK2GO5qvFkhDFFSEZ+qd2eyqMRtIZv45TnQkrQRdyA7PdQngy+PIe0JSW8rtk9WHXfcopeK2exCgUyirspoE3XDExs17bz5G8Bck5lVDkAy8XkjFcGVek/A2gj42PmrxzafFG+VrhY+a6A0K4pDBUNxnjPnApTzGZAdfIa5klcrVboirD+vjHYglQaN3DOGMc2XddVk2j4oDFSDKE2OHPfGUex+Q9phvfcWcgcS8Bv0wt/3DkDwCfPG4wGL9Hpp6gADpKgRPiLtzDu3d6O0UusPe829IgFsNdjO3ZTl44OsxBvO3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(921020)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UlJuJNPBOG9Nu1EqC76sLqBLEE+Xdp7B7dlMBznqFEzyjB9YmJkn1wBpOd9b?=
 =?us-ascii?Q?pngwU1FHUasv9zpfMCiYBBqVI9Pf2EpQ668GNp2lN+/KMBMBm7Xv19vfrrrG?=
 =?us-ascii?Q?op1m5fFd2QiMlNfD+4F1QZ9EyWjcEf+Y6H67EFrvpoUUL5oQqEXfLX+eu+2W?=
 =?us-ascii?Q?QyqvyplPKaH11WD+T2pdZmndBvqUWq5EY5O8hb2YOpt1U9GkrRrA9lUP0y1r?=
 =?us-ascii?Q?v2NXZNmHEpZfQf4+PGWS6mALDLONCjP/oIIoPk1sLvzM00zrtZZVjpeSrcUK?=
 =?us-ascii?Q?6mVrNyL6gZ1FcoNP7q69iiS6P2EfTb5TKeRBFozsR1yGLxZY5S5ixt39ijV2?=
 =?us-ascii?Q?nWgsXw6VNHeus09ydC3o3uPz5ooZJ8PBLLwE07MAXcS/+tge1UKaeS+Gc7RA?=
 =?us-ascii?Q?hxSgYfrkwgGcs3ZixAx2hWWtMM7X0V19mz+fjHpjcTEDQyU1PYe8jKqtw9dX?=
 =?us-ascii?Q?EoDw3Rv8juH1EzkjDVj//g5qRkPa5JK22Khi8QEFLuUnAonLUeU5x0rd0pSZ?=
 =?us-ascii?Q?lFanhy3v5cbMNuhu45sRBycHK1xm9zE5H6EIfHQyQ2Skpz31A3TSvF1nhMDp?=
 =?us-ascii?Q?AnnNYAGEPgC9Xt8ccW80PeNvOk9TVu+F+v+JGGOtFbx3XT/vj7prWWJZ8N71?=
 =?us-ascii?Q?7fK18j/h9OuMIN/Sh6PAL7JTEiPRso+jN/J2gJH8JQtU/xR8OPVxqT1uBLTp?=
 =?us-ascii?Q?aeiJRjWROxD6KW2rELiA6qwHv8aFuN+HANbpPA8q9Yzh451FTq8QbRfDj5eX?=
 =?us-ascii?Q?I9Mj3nsEQO+pLQvNLERcYeMs+fMQ2f124x1r+B9tf4/VOH767QJVPZek6frA?=
 =?us-ascii?Q?lOlpVgs2U9dCd2smWNkaNQkGuWfnQQzNRswHa+u9PdsWPUisf/noQbvYDhL8?=
 =?us-ascii?Q?9Nf7cIBLr1JrDVHOKZhBppmDcJCcdsx9clVwZ29jZirOWqUocjvoa5syqD1T?=
 =?us-ascii?Q?LhEYdrDNvmvz45cIowloNEFu9NPQspYgQPviuY3WVFyrwYRisuxWbALQoZoB?=
 =?us-ascii?Q?IerxLDySUx5IbR0pOcfFVZZE8m+S1ribrtLvKiZvHze5XhHTcQOF+mAeyTl/?=
 =?us-ascii?Q?dpdQ7pNv5d3a4k2dZRjqveyD/MqzBIzuZSuRtJ0rDQJFnz/CbA0O+NXnQOfO?=
 =?us-ascii?Q?zSATLaQN8BFvDC6PiPh3/VFzdVEhqgeUegHckj9jOtly/njC1syxtOEwcKND?=
 =?us-ascii?Q?UHhXMd4WC4CMAg+cfv/2+J4MlFU7JQHqkqc3SZQ/NKc0BiT6feiMAi/obP1z?=
 =?us-ascii?Q?xGTGE0RNEHq9YmLcQGlxZRkkTUMZ9ydEBl7BwMMmrjnfGVK1WW6Hdgzr/Ujx?=
 =?us-ascii?Q?fd6NWNyjzCz8JHRM+pmvMcsvFEWz2I9pwlVdoZFWDcnCf7licXo/COz2jRDb?=
 =?us-ascii?Q?y4H6Z5AP2QHp22fzc/RqJi2QwCMzO8IFLP35/i+ejM+HtH8Yfkv/BYmS+ppy?=
 =?us-ascii?Q?uWD5ggMtiND6XWciJHABf18NSNu6yhVue61S3drSOnERd5FMucdT4AqpuuLJ?=
 =?us-ascii?Q?6pewRlgG2csQ5tOZnuFwhubO0YWHlS6aqp7QS6RReG1NRK/05VeZXB6o5BaA?=
 =?us-ascii?Q?0xeuGhQ6Z5LgqnAg49A/RZSbLHlXNraTvGN6NwF2DfRZQ+eZLQhPIyeB/NTl?=
 =?us-ascii?Q?QndURg/gV27TBjYVltWws21tzEnEm01Dzw+xaphheqM7KiVYhR3OgI2iNm6E?=
 =?us-ascii?Q?lIWxBXwv+iV3Si0DCqbfn/efWn9FdSms4gXN2KCbGqiVppC2hOqDBRZZj+SX?=
 =?us-ascii?Q?veyD9VgLRQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 152181d2-fdfb-4e6f-9b54-08df3ea8931f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:29:45.4629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBzGPMnJ42axyB4ApHOp0Y0fbDCu1OcvmjGCO7Fblm1qI+SMvhEDdPUN+W3eOAmnE0XJApj5xzDcfLbshrKBiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8880

Before resctrl can expose MB_MAXHLM, the driver must discover
whether the platform supports HARDLIM read/write and what
MPAMF_MBW_IDR.MAX_LIM reports. MSCs on the same system may differ;
inconsistent merge would expose controls on hardware that cannot honour
them.

Read mbw_max_lim from MPAMF_MBW_IDR when MBW_MAX is present, derive
mpam_feat_mbw_max_hardlim_rw when soft and hard limiting are both
supported, merge capability across MSCs, and keep the merged view in
sync via mpam_props_sync_mbw_max_hardlim_rw().

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_devices.c  | 40 ++++++++++++++++++++++++++++++++-
 drivers/resctrl/mpam_internal.h |  7 ++++++
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index cb6096e9d2cf..1e56e8f3858e 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -830,6 +830,19 @@ static bool mpam_ris_hw_probe_csu_nrdy(struct mpam_msc_ris *ris)
 	return (!can_set || !can_clear);
 }
 
+/* Align mpam_feat_mbw_max_hardlim_rw with MPAMF_MBW_IDR.MAX_LIM and mbw_max. */
+static void mpam_props_sync_mbw_max_hardlim_rw(struct mpam_props *props)
+{
+	if (!mpam_has_feature(mpam_feat_mbw_max, props)) {
+		mpam_clear_feature(mpam_feat_mbw_max_hardlim_rw, props);
+		return;
+	}
+	if (props->mbw_max_lim == 0)
+		mpam_set_feature(mpam_feat_mbw_max_hardlim_rw, props);
+	else
+		mpam_clear_feature(mpam_feat_mbw_max_hardlim_rw, props);
+}
+
 static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 {
 	int err;
@@ -877,6 +890,8 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 	if (FIELD_GET(MPAMF_IDR_HAS_MBW_PART, ris->idr)) {
 		u32 mbw_features = mpam_read_partsel_reg(msc, MBW_IDR);
 
+		props->mbw_max_lim = 0;
+
 		/* portion bitmap resolution */
 		props->mbw_pbm_bits = FIELD_GET(MPAMF_MBW_IDR_BWPBM_WD, mbw_features);
 		if (props->mbw_pbm_bits &&
@@ -891,14 +906,18 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 		 */
 		props->bwa_wd = min(props->bwa_wd, 16);
 
-		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features))
+		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features)) {
 			mpam_set_feature(mpam_feat_mbw_max, props);
+			props->mbw_max_lim = FIELD_GET(MPAMF_MBW_IDR_MAX_LIM, mbw_features);
+		}
 
 		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MIN, mbw_features))
 			mpam_set_feature(mpam_feat_mbw_min, props);
 
 		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_PROP, mbw_features))
 			mpam_set_feature(mpam_feat_mbw_prop, props);
+
+		mpam_props_sync_mbw_max_hardlim_rw(props);
 	}
 
 	/* Priority partitioning */
@@ -2252,12 +2271,31 @@ static void __props_mismatch(struct mpam_props *parent,
 	if (alias && !mpam_has_bwa_wd_feature(parent) &&
 	    mpam_has_bwa_wd_feature(child)) {
 		parent->bwa_wd = child->bwa_wd;
+		parent->mbw_max_lim = child->mbw_max_lim;
+		if (mpam_has_feature(mpam_feat_mbw_max_hardlim_rw, child))
+			mpam_set_feature(mpam_feat_mbw_max_hardlim_rw, parent);
+		else
+			mpam_clear_feature(mpam_feat_mbw_max_hardlim_rw, parent);
 	} else if (MISMATCHED_HELPER(parent, child, mpam_has_bwa_wd_feature,
 				     bwa_wd, alias)) {
 		pr_debug("took the min bwa_wd\n");
 		parent->bwa_wd = min(parent->bwa_wd, child->bwa_wd);
 	}
 
+	if (CAN_MERGE_FEAT(parent, child, mpam_feat_mbw_max, alias)) {
+		parent->mbw_max_lim = child->mbw_max_lim;
+		if (mpam_has_feature(mpam_feat_mbw_max_hardlim_rw, child))
+			mpam_set_feature(mpam_feat_mbw_max_hardlim_rw, parent);
+		else
+			mpam_clear_feature(mpam_feat_mbw_max_hardlim_rw, parent);
+	} else if (MISMATCHED_FEAT(parent, child, mpam_feat_mbw_max,
+				   mbw_max_lim, alias)) {
+		pr_debug("%s mbw_max_lim mismatch, clearing mbw_max\n", __func__);
+		mpam_clear_feature(mpam_feat_mbw_max, parent);
+		parent->mbw_max_lim = 0;
+		mpam_props_sync_mbw_max_hardlim_rw(parent);
+	}
+
 	if (alias && !mpam_has_cmax_wd_feature(parent) && mpam_has_cmax_wd_feature(child)) {
 		parent->cmax_wd = child->cmax_wd;
 	} else if (MISMATCHED_HELPER(parent, child, mpam_has_cmax_wd_feature,
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1c9e0e8b78a9..6be32b2cb0ab 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -172,6 +172,7 @@ enum mpam_device_features {
 	mpam_feat_mbw_part,
 	mpam_feat_mbw_min,
 	mpam_feat_mbw_max,
+	mpam_feat_mbw_max_hardlim_rw,
 	mpam_feat_mbw_prop,
 	mpam_feat_intpri_part,
 	mpam_feat_intpri_part_0_low,
@@ -203,6 +204,11 @@ struct mpam_props {
 	u16			dspri_wd;
 	u16			num_csu_mon;
 	u16			num_mbwu_mon;
+	/*
+	 * MPAMF_MBW_IDR.MAX_LIM [1:0] when mpam_feat_mbw_max; else 0.
+	 * 0 = soft+hard, 1 = soft only, 2 = hard only, 3 = reserved.
+	 */
+	u8			mbw_max_lim;
 
 /*
  * Kunit tests use memset() to set up feature combinations that should be
@@ -585,6 +591,7 @@ static inline void mpam_resctrl_teardown_class(struct mpam_class *class) { }
 
 /* MPAMF_MBW_IDR - MPAM features memory bandwidth partitioning ID register */
 #define MPAMF_MBW_IDR_BWA_WD		GENMASK(5, 0)
+#define MPAMF_MBW_IDR_MAX_LIM		GENMASK(9, 8)
 #define MPAMF_MBW_IDR_HAS_MIN		BIT(10)
 #define MPAMF_MBW_IDR_HAS_MAX		BIT(11)
 #define MPAMF_MBW_IDR_HAS_PBM		BIT(12)
-- 
2.53.0

