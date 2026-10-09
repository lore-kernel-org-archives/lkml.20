Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013026.outbound.protection.outlook.com [40.107.201.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE2C478E38
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531367; cv=fail; b=U277LJz/dSH5SK1+NXN4xLyHfz34TgpHoNF3uOMWErii1t6Hh5Q7I6xpXRm1Hq0rISz8JOVEPkNZbdDJaHN/lUVHOhn7RcjN9HqTnHFysGrFQ0Kf7XAXD5JnFMlhyDgSN74YX019STbWU1R+oMF2f9b2dttIyUjz8PWKJfNCQ6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531367; c=relaxed/simple;
	bh=y7XGtL0O1qRE4Q3y+YVQDxAA6H0+rOFWwTrWHkvwk68=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D2XWeFZMA3863LDwNiyMB2kBkox7QWJ/q+hYKJFvWcioo/VBbVLS2dfhMvwUw9Le7VPCCn5HjYyCrr0HG61dBmW8iKIO55rP4E7AlH8fmkhJuZxtW4h85/r7uQQjtfG1PKxuR4W6SNR1R3o9pk7Jo0CTyikaWiy9OeNdCcvcc1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=wVeAb54U; arc=fail smtp.client-ip=40.107.201.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="wVeAb54U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9PzcjvZUBHFpqynrPXJedPyFzQYg9ljRs5iDbdjJEV7tM0JCmDxZKbq4OKHyWo1/3W+gOiVgZPcnX1qOrddzi96bzSYESakTg5LwoVRMOHFRr9rwRYEeUmCSTmJAToUcu6TOCay3c6KmESK+LAoNrxN7o0loWONIadex8YqUK5gNUnzVY2iV61dktp3Yzsg35HTmEmqaKbbt0dUyr37pc96IcfureD4+Oj8Bbd7oq0hPbSrV+QzjR3D8sV7mW2aEy+M3V+sfakoSt64fZiFt0UrTdXq1ndlCXTc1CW0/KGi5IZfecujRjzEMHQUoCpKNbOQNBnag37Yo5rNHVeMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkiWqnpToSRkUkylTDICW/AjsKTEAS1gM2GlTHjJdFk=;
 b=rA9kso7DUfTLUqU4P5cNfwsyKPjmyXGktXTMUgA/GJDAOQioy324yetfyN6hfbxPNXJk3d0knqo+GmBadGH32EZzp0nAixNx1hYswPwE6Y/J7sLjoDqY7lsDX3imHrUPyoGD0ixtTOrtWxIwPewPeZ4cVZHkVVmhazxh7XHtSFb1hCrWEbMwfhBgcMfujgulfwPus8YjrD2Yz8+TlqvpQZsbkMOZQJ/wd8UMsFbyzfiFjlgaUWl+y7v5xnTbD0DF+nTOg2S9ZTlKW57S9gHTxOexxlYZJfCcuRpAb9+FKjD12J4NwvA59VVO2CdNLIh+00GEMXCltOLXFqrrP5sTIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkiWqnpToSRkUkylTDICW/AjsKTEAS1gM2GlTHjJdFk=;
 b=wVeAb54UrJ4tMuk4RKSC+Le0BAWphJKlL0P3Q7pSaLX7FpVymJowTcErNmI5PkRRKhHRXux5FNqzIOb2hVk08abp7IxO0ymcHXR0ApxKIXVh5pTqg/79WF3BwhRIMK7B51GL9LfSrZw4dEG0r2/rYrCVAMlDHsjVaPuLYevt8usiznBcYZtE7phetZyooitvG20HDD2lITLaf6RzW6uVOx2w4PAMppZrIgM7YKdifg9wFcYo46VQsZrTNWCnlrTmKAc4NCMjGvC8NZGnwmvh4usfLmuz67Qz5pLyYfypYKLzbrbx7BoQUO9HZtSev+c7VXk88g82n2avKHiGBAmmyQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by EAYPR03MB989279.namprd03.prod.outlook.com (2603:10b6:303:2cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 07:36:03 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 07:36:03 +0000
From: tze.yee.ng@altera.com
To: linux-kernel@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/2] mtd: core: add release hook and removed flag for unbind with open handles
Date: Fri,  9 Oct 2026 15:35:54 +0800
Message-ID: <e4312228d241860b3e3238864d12aae47b721db1.1791512623.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1791512623.git.tze.yee.ng@altera.com>
References: <cover.1791512623.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|EAYPR03MB989279:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f39857d-06f5-44a5-f723-08df25d7f88f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|55112099003|22082099003|10067099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	gNRI0sfcgvqdgN5o5srO08QXvn0L5RT7DPoxNlXPl5jP5GZwAsxN4RM9lgO9+7XmF1HUyZGsq3fEMwhvG0H0gFM6diZmgHgVK/8+cJFgELlIIekQ2t1LZwL1ds0ZulRwVJ0fdN7SrcAWBrVOKkpMEtDE8jDaWJ8CygpgqYrBGQTyCoPuAjdAcOS+ZaEsyEIuTb1YpgW3+hXQgpHWH3PwogZ7Lu4AQYeEGD5T7HbJ3ek+li8jQUSKGoPFnDwR/vXphosusXgTzdXviUARMWCnskLpHJQAeqFm6QJYOjxN45cXKdCV5tbZaooQQm4fpEjCypicouoPEIXpkT1+Z7OTjMYD7w/C66jRV18mJ1n++8n5X2VgQC/FJoCriUu7r0BEtNmBDqcI7bEo5yQjlOwDbHcFqj0F0+tlfB1ebEzabkcgbY6YI9hj6I1dqWR3QYSitYkNc8UZ/LdaMIAbUyoxcnrTK4hYvgnwVZ4fTLqRj8XCVxgJ1q2PEMlfVx/xKDMbM+tW8ftRoHNW98D137pD8ImJc2CGSf7Nq5+Xosa4GmEjmwTGYGjwe+j11DUBnns/7ZJGcy+UBteiMp9lafJj+cM9ZeYXcUK4+P6HlGrlykLjMLLhfRjNaIASeGX6hkbIHLDkZvj2TeLSobzUmuV/lJoKrsauG1+b6z1bahVLO8Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(55112099003)(22082099003)(10067099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWxQMnlvOVA0UU1sWVNiTTBmUis1dXlLZTFlcFBpc0NqdlJPS1hiN2E1d1ZL?=
 =?utf-8?B?ckcrbDJaUHJMTXo5OE55S0JSZmtPdXBuM05XVlozVzZWYy9MLys5SUttRmNy?=
 =?utf-8?B?MTM1aytURlkyQWtWTGdZa1JwWUNoQ1pnVzkyVFlZZFFWVkllMW9pa043L0RZ?=
 =?utf-8?B?N3lGdVgwQnpPakhFc3lQWWtlZzhPVjRZQ2ovQ05kYmtEeFRLZmtMU1lEVmo5?=
 =?utf-8?B?eDJsVWJTTXZqTHBCSFRiRXpra3FFbHRDZTFnd0RZUzZHaHQrZ1h5UmlzMFVN?=
 =?utf-8?B?bVdwV016djE5UTVaVitTZjJYM0RWU0pidTY3MzZaV1VobnM1WEVOYU56ZTE3?=
 =?utf-8?B?NCs0MW9EWkd6OVBGYjA0eHN2NTdINk03ZjNSTnhPcUszSHBJQjQ1dUpiYk1X?=
 =?utf-8?B?Z0dlb3RCSXQwOGE4bTJxazRDMkN0WXE0V3REdXZqZWM1bDVzMGdyUlVLMlJ1?=
 =?utf-8?B?NzI2d2FzQmJlSzZBakNkODBLT0ZZSVNGb2dxaTVLTzVoak05L010cFUwMThE?=
 =?utf-8?B?VmNBRVZ5RGQ2QjI4dEtRSnYrdmVuRUtSUStzUkVzTlo1RDR5SUFhV3Y0VUpU?=
 =?utf-8?B?TzdOZmFZaXBZbWhtWnZGNnJ5Z1ozM0Q4ejhWd3RPdnhLZERPNEQ0eU9Obzl6?=
 =?utf-8?B?YTV6cG9XSm1PTm1RME10V0RWSE9uUFM1TXZFSEY4b29SSzl5MElUQTRYN1Q1?=
 =?utf-8?B?eW4wT1BJV0MwTkxVRFBTOTdvdEJoRjdYZEg1bUJqVGNIRFo1MllCVmUxLzVW?=
 =?utf-8?B?bkQ4WFRPS2RTTTF4NlVrUFpZWGlvdWZsWnI2a2UwSWs2ZythbjFCWFZpNXhF?=
 =?utf-8?B?OG83eXcvbDBRMnJleS9BVHZTRld3ck9id2wzcjQrMGVHTFJpZkRubGxXcVFv?=
 =?utf-8?B?UnkzYXBnZFZma280L2VtYjNtblhjTWlCK0lKT3czVmFxbERzQ2pab2VWcGli?=
 =?utf-8?B?TzY5Z2FzcS9pQVBEOUxvZFlFQ1BwSitQZDBUZFdleGY0VFpuWXpTRWJNOHNy?=
 =?utf-8?B?MGhBOGNuWlFURThCTDRNWGRhcFBWY0RKTGpkVnhCRk9qeU14ZWJBMER6QXpG?=
 =?utf-8?B?MW81WWNCYm9aR2tQMG40RVlkTzB4SFZIZkJ1aUdNajgxenJHNEhSdmUrNlZw?=
 =?utf-8?B?RjdUNzVYcUgwemt2TTZOVEo3VDVnbUVOazBDTVNZVERmWEFodVlDZnFKbHlX?=
 =?utf-8?B?VnlzbVkvem00d1NBaEg1cDhaUGhzSitZTlduUTJIY3pWbWZjMXRDMXBUeExj?=
 =?utf-8?B?MGNPVjZjL2hXNEI2UjZ0VHJPME90RFV0UW41NHlVOVROViswT0ltbVNPY1BP?=
 =?utf-8?B?dndvRXpCMkQ4dFJmUXJXaU0yVVlZQml3NUVDODdaWHFzT3VjNDJUUzZjV3Z3?=
 =?utf-8?B?aDU4R0t4a0ppWXlGeEdjODZsL1ZIOHUxaDUyRmNkbzRLckczTmxwMjFNRzBj?=
 =?utf-8?B?eGM4VjZjVGVFWkdaSlB5SGdSUkZENE9GU3Eza3RaS0ZVajZFbGZlWURIMTY0?=
 =?utf-8?B?RmN3MWpYOUtRQUlzSnhtRmIzaDV3VmJLWG4wSTJ0YWFxbEhmamo3ZGtNY0Rt?=
 =?utf-8?B?MitsbmhkWDBHb3hXZ0FoVmZqTTZNVzdUNWJnMHdXanUzUHIvb2VEMks1SFVi?=
 =?utf-8?B?M3FTMllWUTI5aGVDQ3orWjdOeWhScHdWdzQ0VzFHWFd5eDFjN1pCdFZFMW4w?=
 =?utf-8?B?RE1FSU90UkFheVRFYVl3SXVML3RJNG1jTVBVYkhtV05YRS9UWlhXbFRIOFZw?=
 =?utf-8?B?RUxUVzBjc0RaQlpMNnVXTTRhbDlIcThpcVhQbVBQdit4SzJBTWRCNVFGTTlK?=
 =?utf-8?B?N0xrbEoyRXRzMEJBY1VZTTdsR1FOcCtNV0FuczcvQmhWV3hmck83d3BES3lX?=
 =?utf-8?B?dDc0bzNRV0VxWkhYaFNUWkNGYzNSVTY2YkFhdW4zYXluZFpKQUQ1bWorU3hz?=
 =?utf-8?B?U3JpS0JUNXYyWDB6SzU3OFhUNk9IQkhwL2tYcDZWRklpc1lpNG9HQ09GNEdi?=
 =?utf-8?B?bjJ2RGVYWDdSMXZmaUpXMGgvc25nalhHVERDV3F5eFQ3QWNaS2FlaUNnU0Zp?=
 =?utf-8?B?QXJwWWVrV1JLcEp4WnMzK2x5b09yeFF0YWo3MGdrb0M5bFRZZlljSER0REZE?=
 =?utf-8?B?SjUrVG8xc1c5NEUrSmkvbCtkOW01SUUwclJ4WDd0Y1NQZTJSRUV5UVFkS1l6?=
 =?utf-8?B?WnpqSXJaR2pGSVFpWmtlWFpBSUo0NnZpN0lhZFhna1g1UktUL2xwaHlkcGgz?=
 =?utf-8?B?S1F1UVhaOTRTMkxsZjBJWnA2TWN0WUpGZ2RvUXl3NXlpa1RJZDdJT29heWg5?=
 =?utf-8?B?bXpkUWxvcUUrOGl5UDU5czZDdFJyMG53MWt6UDN2bXpxdmtCYU5qQT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f39857d-06f5-44a5-f723-08df25d7f88f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 07:36:03.5888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tofgw2iLjiP4K5WEc2AvhDG72kw3diUIl4f+LQ6HKsryRiztjnpF++lDC5cJ4OO/TgBQ1C1pISdBRPdJUO8enw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR03MB989279

From: Tze Yee Ng <tze.yee.ng@altera.com>

An open /dev/mtdX can outlive unbind. refcnt defers device teardown, but
the driver-owned object embedding mtd_info (and its bus resources) may
already be gone when remove() returns — UAF for parent-devm allocations.

Add optional core hooks:

- mtd->_free(): called from kref release so the backing object lives until
  the last reference drops
- mtd->removed: set after draining ops; core returns -ENODEV for hw ops,
  new openers, and suspend/resume

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v2:
- New.
- Drop the spi-nor-local kref and nor->removed.
- Add mtd->_free and mtd->removed in the core so the backing
  object outlives unbind and later ops return -ENODEV.
---
 drivers/mtd/mtdcore.c   | 20 ++++++++++++++++++++
 include/linux/mtd/mtd.h | 13 +++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..59133894b5e5 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -118,6 +118,7 @@ static void mtd_device_release(struct kref *kref)
 {
 	struct mtd_info *mtd = container_of(kref, struct mtd_info, refcnt);
 	bool is_partition = mtd_is_partition(mtd);
+	void (*mtd_free)(struct mtd_info *mtd) = mtd->_free;
 
 	debugfs_remove_recursive(mtd->dbg.dfs_dir);
 
@@ -135,6 +136,9 @@ static void mtd_device_release(struct kref *kref)
 		memset(&mtd->dev, 0, sizeof(mtd->dev));
 
 	module_put(THIS_MODULE);
+
+	if (mtd_free)
+		mtd_free(mtd);
 }
 
 #define MTD_DEVICE_ATTR_RO(name) \
@@ -1332,6 +1336,9 @@ int __get_mtd_device(struct mtd_info *mtd)
 	struct mtd_info *master = mtd_get_master(mtd);
 	int err;
 
+	if (master->removed)
+		return -ENODEV;
+
 	if (master->_get_device) {
 		err = master->_get_device(master);
 		if (err)
@@ -1471,6 +1478,9 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 	adjinstr = *instr;
 
+	if (master->removed)
+		return -ENODEV;
+
 	if (!mtd->erasesize || !master->_erase)
 		return -ENOTSUPP;
 
@@ -1792,6 +1802,9 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 
 	ops->retlen = ops->oobretlen = 0;
 
+	if (master->removed)
+		return -ENODEV;
+
 	ret_code = mtd_check_oob_ops(mtd, from, ops);
 	if (ret_code)
 		return ret_code;
@@ -1836,6 +1849,9 @@ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 
 	ops->retlen = ops->oobretlen = 0;
 
+	if (master->removed)
+		return -ENODEV;
+
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
 
@@ -2331,6 +2347,8 @@ int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
 
+	if (master->removed)
+		return -ENODEV;
 	if (!master->_lock)
 		return -EOPNOTSUPP;
 	if (ofs < 0 || ofs >= mtd->size || len > mtd->size - ofs)
@@ -2351,6 +2369,8 @@ int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
 
+	if (master->removed)
+		return -ENODEV;
 	if (!master->_unlock)
 		return -EOPNOTSUPP;
 	if (ofs < 0 || ofs >= mtd->size || len > mtd->size - ofs)
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8d10d9d2e830..28fd98c4193c 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -362,6 +362,9 @@ struct mtd_info {
 	int (*_get_device) (struct mtd_info *mtd);
 	void (*_put_device) (struct mtd_info *mtd);
 
+	/* Optional free of the embedding object; called from kref release. */
+	void (*_free) (struct mtd_info *mtd);
+
 	/*
 	 * flag indicates a panic write, low level drivers can take appropriate
 	 * action if required to ensure writes go through
@@ -380,6 +383,10 @@ struct mtd_info {
 	struct module *owner;
 	struct device dev;
 	struct kref refcnt;
+
+	/* Set on unbind while refs held; core returns -ENODEV for hw ops. */
+	bool removed;
+
 	struct mtd_debug_info dbg;
 	struct nvmem_device *nvmem;
 	struct nvmem_device *otp_user_nvmem;
@@ -548,6 +555,9 @@ static inline int mtd_suspend(struct mtd_info *mtd)
 	struct mtd_info *master = mtd_get_master(mtd);
 	int ret;
 
+	if (master->removed)
+		return 0;
+
 	if (master->master.suspended)
 		return 0;
 
@@ -563,6 +573,9 @@ static inline void mtd_resume(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
 
+	if (master->removed)
+		return;
+
 	if (!master->master.suspended)
 		return;
 
-- 
2.43.7

