Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259791;
	b=3kuParpJoMbFU7fNEwEvvtgjyCol3eKgfWR1D/SRbYgd79Vp82AfJu8pY5pj7L29Rm+n
	 oipAQqVatWSEKlHjr5W0A23weEGtPOuD6sST0hq9vW5tYa6ApMK8ENIDQopDFE20OjZtc
	 nNgjcClNOOOnjeSA+2x6ZPhmw9ZLniXCr2fv33i7MefLKcVnV+ysqbD6FgoEyE9zvvCmQ
	 SdFaF82ahXYIT5eiLezlT2yGPcTNghSZGZLYcMFWU5CydxZDrshsgESf7IbDh+fRg+9m7
	 Jd2h8QMOjJcBsC6XcjJtqvdGEv8tzsWKoKcy0vW+gYOUNhQrbcf2gyUdztcf3B36Stw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259791;
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
	bh=mHHH96gtNOMMf/aQXG172DRpNbt1paOaJR3DXNGY5Lk=;
	b=dHH8M3Jdbn5PJNlwHrP+iU7VR88X6CZzCyOQLV68+1rMEFySNqqDjpvhvQ0tYizqkg3F
	 yW5PabYrQQZSqhcfGfNsO6guJ3W0lgP4G64MOSijXpmnSz2a7aeanVeJVCXMplqD8k9cl
	 lDsTmxqzZEJ00adRfgv56U7b+kJ0me0ZZGyPLrnPrgyg9tVPpp7SLFwZsL7MxA1Tt/OPR
	 AKr4tlJ8pkBnFH5xFIwqLG38iA1m2DwcAO/pPlDjtcLPzOpvtNoPYSl1zWEYg9wvva93M
	 SH3Eooqvh4gsgK98nHjTtBHR6W56o1qI35n6uVS6ktqgO3vwxITjCLUkYzto+EXUrSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gh5a2XlU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.23
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011023.outbound.protection.outlook.com [40.107.208.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B465D60A2601
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B465D60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gh5a2XlU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFH7f8eEFRC5NU48WiNNdnWaVbsq4r/yQjcGVfvvrPyMbQeqdVITJi3UrGCel3zUkgh7IqR5btZFd9NxcsSK6VOC3TDILrHMPlin8FOIm+K/ACyCSG7QEszPFGJDwl8TJ3D+bg11uI0ylBGQNs9VZhxfrzrBM3F1HAanbl5mO72JSIhb1dULKgF03FG4eJtH6TE7c2tyMVJ8C2daIeSPvLqtmK2W/v0Oc2TrwaslV1B8XsbIbPLKcmy/tts3AJSNf0ECvkT98zSQtesO2kfHWocJj8wUZNl+tnq9E20h+12Z7fJGr/+V7QcDGyEOs7JFDCJqi+BRkj1+tzx3wNzL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHHH96gtNOMMf/aQXG172DRpNbt1paOaJR3DXNGY5Lk=;
 b=yHpbAMGxjYlu2P5BxrTQmuccJf2MQICGC06DpJjUrGyRVawbowHkUza7rKc5j6h9jKwlw9wvWj9G3vSlcsb7pJsxtF/GQXw6M6BmD0xZ281aN0qV4ujyUlK6Jk3luR2xATGBy8v6NpacfPsR/ggRvCFIz/Lp9EdFyzpYifeqFvEG1jbberG4wcyhpM+n0E5dv+0qCHy0WcSb3tksloQePPw7HFfa+x7i8hoSoBQfew2qE07P6L++MipxBxYm4d8XrFPcZMCPi3u3dM86T32Ca/yhmXICioAbmSoR0gBp7F3/Hb5xGFeh+ko54G764LvWjpxyxC+h362ltkzfwi7xaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHHH96gtNOMMf/aQXG172DRpNbt1paOaJR3DXNGY5Lk=;
 b=gh5a2XlUYzh4fwe237L+gD7lfKDCgLPgHIyKUOI4VZ6PiFoCskVuB61ogHmh46bCkHyaFpiOm6/8XqqXn4ybY6TrWf1NztBT15N5ee0ZfCoeCk4d43jFgr95Vxpv7rtjisWP81TmQbw3owO1VnFUWoFBSuUfAEDayRe/xEtLleQHQoJ+tzGP4+fw9WuyUhQqermajFPFMbgooeFKKnb2qMnoeTlIkku+5uSFEQP/w1/Sk98kEAztiffbrx9VJy/vEdhG41zZpEwS3D8eW1rGE/jyi2ecNMaqazVHOV54w5Slj9vDo7dU8NhORXiGmvcfDlsCmOBeVCRtKuPYGOG1/Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 21:29:47 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:29:47 +0000
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
Subject: [PATCH RFC v1 3/6] arm_mpam: resctrl: track MBW max hard-limit in config
Date: Mon,  9 Nov 2026 13:29:34 -0800
Message-ID: <20261109212937.1409570-4-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212937.1409570-1-fenghuay@nvidia.com>
References: <20261109212937.1409570-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:254::29) To DM4PR12MB5230.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 7355d0ba-9243-454b-007b-08df3ea893d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|921020|11063799006|261021121427099003|261021123027099003|261009223027099003|261022105027099003|56012099006|261026140227099003|261026121527099003|261102123227099003|261028144727099003|18002099003|22082099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ZHqFLstZBGjlD1IxyYkwUySw1zhqL4NmdBDmJeYh7PrUzH2dl7Rv1t8w5eQLc2tCDUPYuEfujRUEyAXfc/lgZug6YxzPKW1hjnfhuqWZzr2cagDjH+tnTl+wWtdMcP7RU0G/x8IFojh0itQ69bbJY4sRiN2/O8r/iBoIwJWBYZAzE6Ege0lgfmufF/zFq4o27ggWnZPOv5FlO5a31mo+hSPf19Ix2JAqL+L39oTNoThgR1i5c0C+64QPyMbUGCHbaMCDVc6yR9/L6faAy28t+xA5yAnhWawIPvg4jxScvyfPbNNC6JaENAjaJlilQXPoFnjAsWoA1ogvoxejfXttDychiG09fTAjOof+qMU/6Lzy4te8DOY+4FCQdLV1q14F0xN0yciSUGkbda6kWSycGPYpwSO/i/3wPj5hUxLFkpALm7fwN2Ar+et1mgc4Pd5oQPXviQRqIGAZ3fzTmP3p/WDRqN4NBSohQeFVmbCfNAaczWjk1ZKL5u8MDx+A2nBc853gg19QwX13SJwNxArz0FLnOv3uCiQLpXf0EuMyPJ/eo8wVmHQZIDTDZPH/xPdB6zyPjjUS/s6gKOgY5HJrZPgakKkD6Ze4+fyV7bv995C8Mi5p2m6lb+p7m8F46dLZDg2UnOl0FHbYzQzAl2WBe3WFWhBm107IzDBsDMD9G6vaNBb+yD5M37BeguTTvESEHxIl6WdRc21SOfT3gQxl2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(921020)(11063799006)(261021121427099003)(261021123027099003)(261009223027099003)(261022105027099003)(56012099006)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/QD3mKLmfqcthRvcx/kiW9jlgM2zGtQslFX2p685Gk0F68WU0iuN20r90Euv?=
 =?us-ascii?Q?CWlnRpKyrJ8SC6q45C+6KnVr5tZlPJ47GMKx0wWAwboX/nAYFTcaPuQdZFqh?=
 =?us-ascii?Q?InrgwODWE+69baDPCacTYf7Ipz2sR3D5YRK5QD/FOnXzszPlifo9kLERpxpi?=
 =?us-ascii?Q?nZW4N7tR2zyEZgqPglrUD1ehTYdShQrU9K7EqA7Oy9S/LGCP50vTZvX+8nit?=
 =?us-ascii?Q?eFbkhfq22/5NhnuwCq1hVsKWfalUtH4oqA0fBEy+tbI0sghM4jaU1sHicKmE?=
 =?us-ascii?Q?vdIOo8lTZbLbkRkyskQwdgc5gxu1xceXmOh2JB/6wJynboVrWKqbAzyMMIPo?=
 =?us-ascii?Q?FfX9tbFOCD8/7Bx4oXypilQEAZ1pfx3QKkVTuHceM6BjZ0nvVn1/B5KWauDx?=
 =?us-ascii?Q?udZC9Ix+SYI1s3aHv7uRs9mGRbiLPIsBQTo+0Ovsb92UYlVb97w2bIGjLy8Q?=
 =?us-ascii?Q?uS9ILcRR/yQouVRCoV40T/GHkoN06CNQpqYTWNBTWKhwdeFAYwf8OjNaoX2d?=
 =?us-ascii?Q?r4sMWHebN4/Y6cD2jzCqcBx3wGtGf/OVQDDdWuq6wKeGkL+Lh0rBNfXvWK5f?=
 =?us-ascii?Q?ulHENPdAF69rPI9dg2VCk01MYKC3hVv0IpqKOSDWl0qST0L+++Cj/GRVVuz3?=
 =?us-ascii?Q?r8h3C5w44snAtGLS7U2KFPWfX8gbfdS0dkx5kl34fqV5XHyRErSrk0ks3J6f?=
 =?us-ascii?Q?lzoU71nmfhdiSG5TPrPVfBb2JITwlBZcdGSTfaYHm9szLiHBTLHvuy0TtCqD?=
 =?us-ascii?Q?iY2x9RkVqf+OK7PUV+BXyT39GvgSQULByWQIiGBYA3LOcV7F/Lt0+bKfdy7V?=
 =?us-ascii?Q?sQ8+vNRw0lwr5AR9MjnbfeVRQKXYM3YABlX9VjcrhGTEb6UAtc25PTh/lJ7N?=
 =?us-ascii?Q?pGybqbVsqtCHY4ryq67PFoo+EJZMDEPFrd2eBcIuYAykymg26SKIQ+aBXKhC?=
 =?us-ascii?Q?FbgOB0YwAfmseJsR9npe18sKI3tw/WPjJVJDxr1XXxS1Cn/Ex19hqvY45GxM?=
 =?us-ascii?Q?lAa1dFFr+fisBnBJ5cYvmFreH2EI1W7oZjzKLrCvi5MQ/+vbt1fWvgjI9XEt?=
 =?us-ascii?Q?KEeCRhD6X1lFDv/A75WskfOxzTjW7R72rIjV9DC6PCQSBcMwHRct17nr6hAZ?=
 =?us-ascii?Q?gDOxAUJReUFNFEgueGN78TtPbKvx7yCeUEB+AwCLCXTcQLzK1qgvbZAVsDaS?=
 =?us-ascii?Q?j6qmcdwVTKZQv3kdgOHQoCsMAP3QqdK+3CnkLJizTggxMfj4qqaW4feRg1jx?=
 =?us-ascii?Q?+aYbOJ5e07rtzkpnKdpfCjtl6xICQKbicFnDpSxkfhHYINxc8TGoxf48iYbj?=
 =?us-ascii?Q?zAAQMg86Czw3PdJUGVoSqtDumaPczXN8AV9z91nm+RlhQwtoE3j8YzBj3ITV?=
 =?us-ascii?Q?nCNqs6vOh9SDMsqc9exQO4HOWBvcxaw9v/MDPmvK4B+kLNUhn/AwPbQ7oRjS?=
 =?us-ascii?Q?BNMMDXAc3RF4xvjs0Pvyi2ELoRtWitbcvPWr6zIriV0/E6D4V6YtgFr6zjzt?=
 =?us-ascii?Q?UNG6fcYMatI8VxE+qcE/zw0nERQD7KDV3chxv44UCsrmnh2Mq41tWoZf6lfv?=
 =?us-ascii?Q?2UY9hJHQIIU/MJFVRnS36tAvUuusglOlb79cDrhnHDE80AnpGMlQdED2hDtJ?=
 =?us-ascii?Q?UKZh3pfjvz/32r+XPwkDBxCe1gwZhhP9A6R71hdwFa+ZqduMC4bECyCB4ujr?=
 =?us-ascii?Q?tRts671tyg4tjEHqXTjvDsLChrQYkNCXNXQ7t/4kFO3FYGfTpRH8xJmA88Vm?=
 =?us-ascii?Q?9ThlPbSIgQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7355d0ba-9243-454b-007b-08df3ea893d4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:29:46.6990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: se5ziOe1Ub8n40Ode8ughw5Z+RPGMmjJo71zS7NF/SFCPvU/T6CulTxEFkKrkmM7ZmeAjWF81CzIMijigZuI6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031

Once userspace sets MB_MAXHLM schemata, the driver must program the
HARDLIM bit in MPAMCFG_MBW_MAX. Without tracking the per-domain hard-
limit state in mpam_config, bandwidth reprogramming would ignore the
schemata and leave hard limits unchanged in hardware.

Add mbw_max_hardlim to mpam_config and set MPAMCFG_MBW_MAX bit 31
(HARDLIM) when reprogramming MBW_MAX on hardware that supports hard
limiting.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_devices.c  | 27 ++++++++++++++++++++++++---
 drivers/resctrl/mpam_internal.h |  1 +
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 1e56e8f3858e..7dee6617b134 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1664,10 +1664,29 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 	}
 
 	if (mpam_has_feature(mpam_feat_mbw_max, rprops)) {
-		if (mpam_has_feature(mpam_feat_mbw_max, cfg))
-			mpam_write_partsel_reg(msc, MBW_MAX, cfg->mbw_max);
-		else
+		if (mpam_has_feature(mpam_feat_mbw_max, cfg) ||
+		    mpam_has_feature(mpam_feat_mbw_max_hardlim_rw, cfg)) {
+			u32 mbw_val;
+
+			/*
+			 * HARDLIM shares MPAMCFG_MBW_MAX with the bandwidth
+			 * field. A hard-limit update does not program
+			 * bandwidth: the shadow value is not live until an
+			 * MB write, and reset leaves the register at
+			 * MPAMCFG_MBW_MAX_MAX. Keep that programmed value.
+			 */
+			if (mpam_has_feature(mpam_feat_mbw_max, cfg))
+				mbw_val = cfg->mbw_max;
+			else
+				mbw_val = MPAMCFG_MBW_MAX_MAX;
+
+			if (mpam_has_feature(mpam_feat_mbw_max_hardlim_rw, cfg) &&
+			    cfg->mbw_max_hardlim)
+				mbw_val |= MPAMCFG_MBW_MAX_HARDLIM;
+			mpam_write_partsel_reg(msc, MBW_MAX, mbw_val);
+		} else {
 			mpam_write_partsel_reg(msc, MBW_MAX, MPAMCFG_MBW_MAX_MAX);
+		}
 	}
 
 	if (mpam_has_feature(mpam_feat_mbw_prop, rprops))
@@ -2986,6 +3005,8 @@ static bool mpam_update_config(struct mpam_config *cfg,
 	maybe_update_config(cfg, mpam_feat_cpor_part, newcfg, cpbm, has_changes);
 	maybe_update_config(cfg, mpam_feat_mbw_part, newcfg, mbw_pbm, has_changes);
 	maybe_update_config(cfg, mpam_feat_mbw_max, newcfg, mbw_max, has_changes);
+	maybe_update_config(cfg, mpam_feat_mbw_max_hardlim_rw, newcfg,
+			    mbw_max_hardlim, has_changes);
 
 	return has_changes;
 }
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 6be32b2cb0ab..59d04cb663da 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -324,6 +324,7 @@ struct mpam_config {
 	u32	cpbm;
 	u32	mbw_pbm;
 	u16	mbw_max;
+	bool	mbw_max_hardlim;
 
 	struct mpam_garbage	garbage;
 };
-- 
2.53.0

