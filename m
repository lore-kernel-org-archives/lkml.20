Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C0342CB14;
	Tue,  6 Oct 2026 12:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291411; cv=fail; b=cjIx4/Ad6six5MsAds1FSv7vw6JC5sEF8u4HWT3jkvbZ0o1uL3RMbzKgu61XVXCzWGDeoATDu3d1eSKE6/GU4LPVYcSqCBJlPqNOCdUzcXLTQUCDYJ+uKMf4PVABum6JTT5CkfxrALKNl4LlIYUArfMyvJpmTsDphFu3sY3W9Z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291411; c=relaxed/simple;
	bh=xCIKQRhEjxJGZIjf/62bySE2I754uyBVQDh4bdgsL0k=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=kjP/xrlLt1cMIMcliJj+sQiflkw9IVeNY1P7fv7GnTbQJznBKcYF58CN50JgvWSf5F/ORyW7vXR4kRj+ehtiCl1hFB4g4uM7S22ZI4IFm/2sQwlcPQBQiW3UUZynOE51EHUObrHlYjHJrCUwqsIi/nIX4Yl8/2bJCrNFuEN1F5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b=VER9P2CU; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=sqeQbQbm; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b="VER9P2CU";
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="sqeQbQbm"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BT6jQ1418510;
	Tue, 6 Oct 2026 08:56:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=ZiCyXVXOiB2M32ls
	QlV3lTT0jTkj9inEfjPN0Hqj/QM=; b=VER9P2CUAegpoms/3ythIbzUlr08TUW6
	p05IsWJzzvzg6JglxuolPIlRFdiDWS8K5WPeVeSkKolrVIi8pF2fcqoktiDHLXRY
	6ie2QO1KhzkoaJqOSphDldGotDZ9NdhhOVP7gP2vmhsDbFNtmgCMyuruCPpGOotL
	NNkqRZ6M1VL55tTGvLi1bMzl0M1AWXjXDrhhOXwEZbwRI713YJDO4bt1HQK4RGjD
	glsYI1VtOXSlvw5sGhh49HxA098qM4wLr9/fvYFhQatnsLENlJLR9cwhVEgqcCXg
	15Vm/AhHJLzDCtkgf63/hMiVJPezBlJRT9+WKIGPRltO2HhxRwC3Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=ZiCyXVXOiB2M32lsQlV3lTT0jTk
	j9inEfjPN0Hqj/QM=; b=sqeQbQbmKgqVaDjv5O7LXDlYJrwBbxwE8Ij9JKrODF8
	Hyw06j7ZtotuYEUchXdl0+DUFM4KX5iQAiXqcAg7vwa2FleFf/ygk8Npmi0XQTXr
	54H2M6FHWjGnKGwOBYqN0hV5ukBcJzl1lrJeQaV3YJrKyqv6mJrNXnhmZmAtWbmg
	cwEZnEwT/s3Btrp3unv0FhqHIqWQp6Et+1Per0lSlEJanb99bAU4Z5ml0jhqMLgn
	MbrgVvBnps2Aq8vYTxzegvNKoib8alqrn8jVXmMrTMm38flnIJwt3Wl2quslT6Zq
	44B/fhljcGXYslQ35deccjgDa3TzoXJ7JXTKHCjGSMA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011006.outbound.protection.outlook.com [40.107.208.6])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4h4en5djua-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 08:56:03 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygUKdAx7y9JXFwI6fGJd+awoMKGuGKCtKWu6o4XoM7FfFdHtGjo1MDTLvqdwXbjHFqYR8PanHggoibwaEAfiOxZfgE84uiNPGpEpTJ2tXW3N6hA5bI3YzFylWmAZwqYck1ULwKjcdNFLa8tdIhFW6Z5M57N/BgiZqjMfMMJTYWlqZNiGJRuqdrwbVazWgUpBs+vuzX23VTw9YzMhUCW27usAHavMnqxIgxd9N6HddWbb/JpUtJbgHyYL4TKhIaWB8FNb/Z/eWm5noa+HkNZUIDMcnKxljLourG79EJr70xEDlZ6d8XhocCrLX/l0zjnIwDAz3+21EzBdcKpXWc/Tuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiCyXVXOiB2M32lsQlV3lTT0jTkj9inEfjPN0Hqj/QM=;
 b=GFedXrL3a0NvOpsvsxBoakN5kf74Z6NQcpnCzfsF8IpNIWHLB5SJDb1Myrp5mYsjlXwBgbzEjtN8FlqzxKi2+7qbpwwbuOaqJCtJmPLySuiK4R8i8tJHxqkUsUs29vNuDqlkuGO7Y1bNwBQaiMOR10cR+2JQaPk0O3zBT6/MHhS0CsY8KljFQj7ToRmllLtcGlYT59dGWmbb/sWczFyx5Nh7SeQSPdCvE898x3JxubrcNbd8iRryXz43/SNN2DibQZwqeG8wSgL80FYC70Jk0AJk+JF7e5vYK5d14VZ9IfhOVucp9kEzpO0utNDh9W6kWQ2ZZtXg0N2n6MZbRGf5Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by MW4PR03MB6667.namprd03.prod.outlook.com (2603:10b6:303:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 12:55:59 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 12:55:59 +0000
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Subject: [PATCH 0/2] ASoC: adau1372: two small bugfixes for the codec
Date: Tue, 06 Oct 2026 14:55:55 +0200
Message-Id: <20261006-asoc-adau1372-fixes-v1-0-599cc17fb5f6@analog.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANvvxGoC/yXMwQqDMBCE4VeRPbuQpJJiX0U8JHHabg8q2SoF8
 d2N9fgx/LORIguUHtVGGauoTGOBrStK7zC+wDIUkzPOW2M8B50ShyEs9nZ3/JQflFMDH9vWOkR
 QKeeM/1DCrr+sS/wgfc8r2vcD36Orj3cAAAA=
X-Change-ID: 20261006-asoc-adau1372-fixes-c4e6b9912ebe
To: Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: CPBP307CA0014.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:2::8)
 To DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|MW4PR03MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: de64dc6f-d7bc-47d3-4cf6-08df23a92b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|3023799007|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	B4S2rXRP03bOl3cNw2HvFrv+lrzAYw2UPuT1uyXGPGnHadTVY16XM/oQEmzO9qIQmwMwNZ/7DY3zJXno4AlDxKMJo4gIuQ3XA0WWSOIM+8N+MK6pxgUFvo6ViXtJ8O6plMWLA2V/RPP3ZO233AgUpvzcvfmVU3nJm3nLhq+uZoITnzZ83Y16HwKRYOiScBiZzln1wjlsInWKYV5aEV4V8Nv1pZ3PDVAAE22K4nXUVyMAi9sRiTwD8H6k4yKRce0HLYdS7a6ySrlJALiABogLPnxrp2PEi3x5D4lFsi1eekCRoAW9tg1cz9XE2IID2HZkEZXtsnfilrkF82+fiaKV5BXSJ+xfcLsOE4C5UClejT7HwirxHgO/UehPJFKdZxDAwjUcs6qmumIf0jvmxc0nsuM0eD6KGHou2wsjo4U4Szrc1kpAjj9WspJGFiyLMGi0mF0wE2gSPalhOWeqqOGzgHxCKry7e8V4sX5tiHaRKbiP7r3/dE1l2wut1smIqgISYO4og34qyLfTZ4djUhlirhuk1nCrrhU9zOjyoqNP8vY+E+2cd10Bp8iYnJVln0G41U0cRlQO0x32asYKwjLeY1OQlm9viX/yKtZOMLJTOVo80U1x2pbfxGVFpkVM6+GvhA0uPliB/UagVPo4siZL/cVzU1yH0xznzBX8i5LlBME=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(3023799007)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RENIaWFlK1lXYVdKMGdWQ3F3dXFNT0Y0aUl3Z1owc3R2M3VITHp3czY5K1RH?=
 =?utf-8?B?NnhTcU5ORldTaTA3ZG5Cejhjd0pidGxJMVUvYnNMMm54SEdHd2Y2Rzd1VkF4?=
 =?utf-8?B?NHZ0RlBBcFNzUGV1UVRSeEpaYnJMY3lBcVVTUitJV29EUGh0RzVVWlBXZ29Z?=
 =?utf-8?B?QXNLay9MRnFscXBNQVZmZTEwcXhQUG9qbTdpbjlpVWNaNnhVY2VOWTd2RU1k?=
 =?utf-8?B?ei9yLzA3RTF1WmorQkpZbDM0WDVJOEFURVZkTm44aThTbDZTandiU1lvZ2M1?=
 =?utf-8?B?WHRTc1lSR1NTTTMxeE9FT2FlcTBQaHJvQ0ZCRTk1TzVEY1d0a3ZTWUVWQnBa?=
 =?utf-8?B?c1BYMzNKQmpOTUtsL1BBSWZsV1N4UGlqb1h3SWo0N0ZyQkxIQVZCTDFzVTVN?=
 =?utf-8?B?REFwdUV3VWtFSU5JaE9ITFR2ZHNMaVhaMm9NWFIrY1ptek1kdll0cEljYjZ6?=
 =?utf-8?B?K3ZLRjVOTFVoSkN4YVp5RU9vWURBZlFYNlprZWlLZlJaTXZDWjVrcGJINEYv?=
 =?utf-8?B?T3VGTmQ0NFpjK3lIblNWS0sxbVFZMkRlR242NGhxK1ozWHp3d2R3RzR0dDVF?=
 =?utf-8?B?M21SU1gxakdnbnEyYVE2TVFTVkZmSlFwNS9OcFNJMitMcVlZMklkdEs4YkVR?=
 =?utf-8?B?RzJIWGtseUN1NjZTMWVLY1ptQ1YvUVdSSHJZNTFVVUVIUURJR0JPR0pXTyt2?=
 =?utf-8?B?dDZNMzl3SU92WkVBYlJ4YjFtbUF1OTRiOE03UlU0OEZMWW81QTJoOGYvc3ZW?=
 =?utf-8?B?VEtyOU9wak9UaklMTEJZVUpZcmcxTlJ3dXFyclU1eHZNUXJlTW1WU1c2Ukg3?=
 =?utf-8?B?NUd5OTJVR3Rsclp0VFZaNWsyenIxNFlqaDBaaEhXeklIaTNtWmdyakoxZjRC?=
 =?utf-8?B?cjFBVlhoazlHMzB0M28wMEJwTFB1SDQzdXVIZkxNbjQzMEtiR1ZFUjljWTlj?=
 =?utf-8?B?Sm9UUnZ1QmJoZHYxUWl5WkZRREtYTHhXY3ZnSWZrYkdleEtaaWpHemNQbUtr?=
 =?utf-8?B?Vmlwd25tR0lLK0lxZGlHMnZoc1pONXVIMUJwVjF5MWF5c3VUekNTVWlMSm12?=
 =?utf-8?B?NEtMTzVOanN0elhBMGFmTE1sVlFvRm9mQ29odWFCMnNsTVdhNWlEWVV0V0J0?=
 =?utf-8?B?TTNIZXQrS1NSVWVBS0MrbUhrdXQ5WUx2MnZpdUVSZ0VyMkc0UGxLMGQyaWN3?=
 =?utf-8?B?bVBsOWNNcUtQdVRPVU9MaUtaSGhWZVBwYlZvcVEvTUc3bzFoMFljRWFMQ0p6?=
 =?utf-8?B?NnE1d0JIby9zUHIzSmtjRCtXdVlzaVFsVkZEbUtFa1A5MDM2a2hzc2F3VnI0?=
 =?utf-8?B?emVtamZzZ1UyZGVjNktTQk5pSEJqMmZxZURhaDJ0eVV1RUwxcVgwZThNd0xU?=
 =?utf-8?B?UTRFa3B3VU1acW14VWxrZVA3WTB4TGVacGJEYmJWeUE4VlFNZjB2Q2pBRk9j?=
 =?utf-8?B?bS83dVpZZVVlWE11bHhZZDZRT2E2RjFnWDBLQ3ZQKzBhdWd5RkJTeWFmY3VG?=
 =?utf-8?B?WXU0QzMxeVNqZ0pzZjdtNlptNWRoNitCZ1M3V0d4VHBGTmVHRXVMU21IaGlo?=
 =?utf-8?B?ZFJ5bGljWUtybjloZ0VraDBhbXRLM0cyb3J0am5Dd0ZCNGt3SUF3U2ZPb1RC?=
 =?utf-8?B?LzBUWHJ3a1ZzU2tVU0RzOGg4aGNVTFd3WExyN2UrbGdCSXRBK3VGS3hlalZU?=
 =?utf-8?B?bndXS2N5QzJERjBvMVVVdC9OR29WcThlejkySFhCa2xHWkRRQW8wNnIxNml6?=
 =?utf-8?B?WFdEeHcrMytYNlYwcUtCclZ3MFhUWnNZcmVCd1hNazdhUVZiTEJSVmFJUkhT?=
 =?utf-8?B?a0ZhVEIxUmVkN1hCcWJZeTNqNDZld0JOdWF4a0oxS0l1MzdCcTFweWdHWGhu?=
 =?utf-8?B?cDk3YWx4Z1RnRjlKajN3ZkN2UERKWFY0VXVvYWVMakhsMlJrWmk5azFUVlpY?=
 =?utf-8?B?OEc0UkdWTG01R2NRUjNSQi9McHRWVzRyR01LcGtSWHVkRk1VOE1xbjl1NVB4?=
 =?utf-8?B?MlNEUDVVVHNDalhycW1ZbVNxTUc2VU9FL2RHc3BDSHFrbWx6SEttYUN5NjJy?=
 =?utf-8?B?QmV2bDVNTURzMkxCZHhINDVwZCtneE5sSjVJcnpsY3JyTWZVMHdPRkxlUUhS?=
 =?utf-8?B?eG1MRU13K01WdTF5dU85UFY0WmtIWUJrQmNVRERkNWp6VHhCWjBsMTh1Um8v?=
 =?utf-8?B?aFdmeG0vdVdvKzNWOUdlREw2OC8xeERCQm5zbGhZMG02T2ZjTXJjSFVnSTE5?=
 =?utf-8?B?TEZwZjJKU0x2eU5rWFlBN0w2T094V0FLN3lsN0E0TzhqbnJCN2pHZFBSTEY3?=
 =?utf-8?B?eEQwcXZ5T3QxaE9RanhxeW5IN2hsVGlJYVZGWXZncUxrQ0ZKU0dWQT09?=
X-Exchange-RoutingPolicyChecked:
	tMTDGS9lJnqG8Rxy6GRU+qc6W74xpQ+0DWCDbvYHXnDJHU4eFqGVEIaHouakDxYO5F0jyBjz5/eDZkywMMhT+0VGNdB8M7Qjo2KOINpVp7NMl3ThsTg5Yx3/F77D1fRoDkB2fgfpRouoOzWmgeOoyv2YIMIyMBu1XIADNxa0sy0uKMHokGQjZXhyaT0TSecXlM1bOMmmthI2qY5ohcFBA1RLkE7X8V6ijKR/v/ptcM/+LxJ3PtoYbaJ00YMzyzzOIpOFyiIpUdIIt5Kzu5Pe9OxLN0tIifORgRCoiKPLGLQR4AQWLPtiK9wsl4miyQl1p+rDRII8gYB5lMdjojS66A==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de64dc6f-d7bc-47d3-4cf6-08df23a92b7a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:55:59.6817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZR1TQ680Ca/0pJ0btJ/MhbooPvLfKC1g7tsTV1Xjzl1Q9N28+/r1RDJ8pfCGVcBT9R+D6jXdhjsgagH7jHl0M9GxrM87irmcvZLNr7X9PQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6667
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1MSBTYWx0ZWRfX0kz1S2j9pulo
 WUIAOu9vBAaU/89jgVvTMUgXRa03tsghBkU7HDXFU2/QxnN5qYpi340QNNC337fhNv0tNfoUvjt
 UupDoWqSxC1rvfs3TlAnMBN69tYFdSQNEYDli+AoHUsFFSnBPPwW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1MSBTYWx0ZWRfX9MOJ+ghvPmo1
 o6dKfneJ5STTZZvzu5luEIVGCr5TF+cc5C97gRLviwds8w6yrJYT6AX1msGJJge2o+F4YGwG244
 dVC+A+KBT8SnNi2JNElAh2tEv/kzGaI1IH24u4toA2S/9kopG3c9aXu9C6MqKRRNG0+xYNcrEYa
 ej1DVvAKZkiQzDKgvSGIUqNrGC91rGV3XIEB3Jj5InFWAAE3bz+fr/0hnx6wt3s8vKmWcivYxq7
 bCpCu0Tlhz2H0cUR0IRWP6EZSV5XHx7XQ77gVXG1T/z8tkASVy+rx/70WFCMLEAGMgcQ8EKdJv3
 8qxh7GdnC4uJGBfr8X2mMWgc4mcg7A2XQ7Zl44J+7EhmUA0f0wqSSYlfBozPAvyfRqdWOsuJf/i
 P1GXFP1VjGklHt3UFNQb12wG8fRoler6FhAfnMkqs8PatHGcWddG0qAYAWWe4iYv1dlWPdRByqA
 ptSfPY9jyVlyu1P0YDg==
X-Proofpoint-GUID: fmg992lVrKC95nYCeeR4AilpqEpJdoPp
X-Authority-Analysis: v=2.4 cv=DdCCOftW c=1 sm=1 tr=0 ts=6ac4efe3 cx=c_pps
 a=HPJBkY93y09GhBhYB2jcmw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=gAnH3GRIAAAA:8 a=EJU5dPNH-GNFN87FI5AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: fmg992lVrKC95nYCeeR4AilpqEpJdoPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060051

Signed-off-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
Alvin Šipraga (2):
      ASoC: adau1372: allow sleepy powerdown GPIOs
      ASoC: adau1372: fix invalid default state of output ASRC and DAC muxes

 sound/soc/codecs/adau1372.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)
---
base-commit: d0cb7a7b2a490c381ad97f53155d02a748b60dea
change-id: 20261006-asoc-adau1372-fixes-c4e6b9912ebe

Best regards,
--  
Alvin Šipraga <alvin.sipraga@analog.com>

