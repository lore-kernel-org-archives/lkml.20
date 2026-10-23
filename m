Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792786998;
	b=MpbU7OOBy88mOCMHxICfU9eQi5etCWG9//OmuwyWDAYv/0e7K+nxS0TpzM8Ax+Ec1uhZ
	 oLz1qEM9T06ijoSUt5wS44ul4IV51oNY/dTp/WWkJlj5sY4qktqnIciQvdyQl9uLq8LI5
	 vyQaotJ9k8CPHaKzSHn4SToZ9kr00yRVjVm7chpayYkUwtk72Vla7KJRcsRpEZo7SA7SW
	 lP9IyF2Y5cO2ffnTXIpgTyZ/iZ6C7ptZRYDCt5dDiyFdtcOOaffSOjvYjZPXjhjUoj5Lh
	 u1/Cu9OSwJTM9dWhkCjhUfki1MI3d5E+QzRgHroe6AjkzZSzngP7KZVz83lf+XZN2rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792786998;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:X-Mailer:Message-ID:In-Reply-To:References:Content-Type:
	 X-MS-Reactions:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=l+XlcwQI34F3dMA2xFT8NS5TelcWVIyw8mEMoNZQjSI=;
	b=gHSdZ3NptWUSp6Hkz1REa8A26/A9Oepapy97wvaJHWq6bThBFTWPkYDsRP0NKWX3iw9y
	 mqy4CwXzpGKRnZAuzV6nKl9YU36LfsMx05fchN3YK9gn/YaeHG4WylSkf1oBbyjcbSFor
	 pUZSO3XSg+wZgYKFe6XzPzIzIDKuDZfbwCh8zsTk+NmrcSwgBXnvN8D+YaAHPTWzn56ib
	 Z15Mk/qlAnTTi5265J0+OpkIbsXgw9n/0xAcXLwTfeGOcDfoFMMJTPFqHTdYFaaHAdygT
	 PCCFoWVocdIAdY8lDxP1NMddDx8vlpTUFcuAem8zzKH647D138LiIhOAkBK0MbRQusA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="Qbu/vPW+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.8
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013008.outbound.protection.outlook.com [40.107.201.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE09606A328
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCE09606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Qbu/vPW+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPS+ac07ovRiANrJwk1/OwS6sjvF4QYbBPk6z0MOFFos4hMojeQHIwyNy6XyoVRbE25c6cJdMXzg9XQPTqqhQXag2HasdjvyzgTIT9pca2st63m+kefksVZkBAA+hBkHAhxmNE5PFeaG5OzakqJfpOJiTmFy6PVlGawcdN3qW0kHTbFXhrmbg10zDUjp/kh8+uW460d1s3DgdlcGNUbGU4Jo5Km2QbiREgHgsqdyCDGytEd17IEWzckL5yZSCUjtcutfafvAOHxPwTBqmA6+KzyXOZl/IZ8HVjpp1JHyKEGeSesKngl/J2FEFm3b+gaDfjOeDep013DKNkecrStElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+XlcwQI34F3dMA2xFT8NS5TelcWVIyw8mEMoNZQjSI=;
 b=MrEYzeRA8DAJdnMMqkY9OXDFMS6loRu3AMVFRFAoGa93XM2DYQ0iQABXchwOq4Oz9XSFSrz/ffS3lmlrZaJ7UlWNxlJnygVr3a/y+HH0VjPTiiog8KOM4OKoyP1rBnnsUAb45P9h0TDeUkCbDpJWoPy8Dc2Ag47wbz7MQsnYej7GnxBnsC7I9OcjZNySUk54gl0YmsU/PEBzzTLTLw9E8q7d3Ui7cl0kQ1QEhZsROk9E20KN15HWiiierqTccs4ZvXJyxZ5o+OgfwB2NvF1x0ZM+CV4M2mwBMN7cpcrmcC26yIxfebhR6lT+eTrh4jf0WS+NMpq8TloHRfATey8+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+XlcwQI34F3dMA2xFT8NS5TelcWVIyw8mEMoNZQjSI=;
 b=Qbu/vPW+R7oXg6ngO6mS7MS47cCvG+KQxg6LAPYqhqlCoomh3OjjxDbxv71pTCdH/3UoHVYYJb6q5jZjUzL5Qsz0SB89bNUVlBemhCQRTu5RQk606+302tGpNtZcAhzPHD/wM2SSUvw2YjzraFCWQEtlsYRBoUUyvyNrMggGMFKZyxtqpgc2E6G4aLm5y9divWozzXExoruQqlVuOjBYDF/BIqVq7J6ypDTlGk61JiWJAIZ3BrU+3dnSh9QT1YQFtNAzJrlRID9TrALfuYpz4qhzIdbCruKw5SXGLQOsK1SGpYflqNt9Bhin0y3FWxAkqq/EYZ6LeNOZgppNhD4Wag==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by MN0PR12MB5859.namprd12.prod.outlook.com (2603:10b6:208:37a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 20:23:13 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0522.017; Fri, 23 Oct 2026
 20:23:12 +0000
From: Zi Yan <ziy@nvidia.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Gregory Price <gourry@gourry.net>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Rakie Kim <rakie.kim@sk.com>,
 Ying Huang <ying.huang@linux.alibaba.com>
Subject: Re: [PATCH] mm/mempolicy: remove unused mpol_is_preferred_many()
Date: Fri, 23 Oct 2026 16:23:10 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <AF9A10AA-E27E-4677-B14C-7C1B4EF7EB6A@nvidia.com>
In-Reply-To: <20261023161003.59086-1-ekffu200098@gmail.com>
References: <20261023161003.59086-1-ekffu200098@gmail.com>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BN0PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:408:e6::7) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|MN0PR12MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: a081c194-db6f-4e71-46e8-08df31437622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|18002099003|22082099003|10067099003|261009223027099003|261021123027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	pIhv9sL75OnysT8PZlHggM1TqcBlGaiQbb2G5obeBENoCGDrWtUSfqhbKTwyuBHf3suOVB0GFkUUVcsDtAl/vWFe1Q4nXtZdY+kCeqvnqeGpy7EYyyAnROpoJnk4cs4z8YMCIJ18rtbqttzLcQ8fO70oCxc3X57Ey19fRahgn0Wy0JeD7GdfBBqIGUYOeQLXlG4Szc2GiABe1fQDlzy96IQyfwwUmm9AFhRNpkfpBZRo2/+NW2s4O3g/KD7FE6NMlTXy2ah1kwbImJfgpKzjGO0ljDHEXgIwjUx4Tbcmg6E7/45XAjl1DhqWzM1oLrv5cbODKFIEs5InaujbAsv61Vg+9h/wE5DGj4d00aMfW0iqLoHsS8W2hEutty3djgANhinD9gML7HKw4I4bTKdy2zO8ATWPfKD6zpPBk54IDe5QfZxn2Yjxz3LHvQ5hNN/EYssfC7/hH6PpLFW8HOyIu0ezg6p8k3f8LOEmX8OIKdOTSZbcvSNi7O6xL2Vksxr3UxZR4X0fSseyWxtAc7zEwFm9np72LAxW7WZ7IYJJHbUkOiiI//gdbE+KU94vv8Oh6Irser4poBttJdxx2PcR4vssVL14sTle5eWhNZZHweFgMKqIUIQBV0Ul9XTLEy97zmzRDpCT/UKRpEQe3KVB1np59ApmdDudVqWXQ83pbU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(261009223027099003)(261021123027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KFhIM6BDlNYYvwzgZKB2/LQqFNty5RDkBBagsxt05SwU7CbvgxaX5btQ/1nG?=
 =?us-ascii?Q?HllScMDB/AhB6DRK+LqGpD0ZXs5VXmX5rUFhpu7deut+Ti/uajK4jq/iNHXT?=
 =?us-ascii?Q?6IRh2i+XSjLFlL9pUauWLOtcMPmYK6WUcXFChrMoLe3/S5De+Y7VEorJbsrO?=
 =?us-ascii?Q?v8q3YT/ecBOy1nEPr8AZgQta1EabWizrUQI9HDcVHAXWkmLqL3A0LtabBjWD?=
 =?us-ascii?Q?Gl63Rqdo6uaI/gT6f/eZ+KKeSu3ZokNxEELky6pdpu3j0k89dlqtoH1meTgy?=
 =?us-ascii?Q?2t7iwSU/VK2+islhTU+Oj6unGdZp2J0RLPx+WNRfnqhDktvgRO7CGWggyEGX?=
 =?us-ascii?Q?Yys/lj4VwIgvkwBTlIVjlsxZSEby8s67breD1HuaDKKF37m0vt7nFOCesvU1?=
 =?us-ascii?Q?7aYULNRsrtUqwJvoS5YQT3p6IKk2wc3ZiO2lNPJ8mOQK8pC4qaqcGbf5wPys?=
 =?us-ascii?Q?41ElI2ySFXdcELFrdkZDTv3t4Q3y3cT4s48Y5Ovr/TgREime7ph6PprsTOOm?=
 =?us-ascii?Q?dv3g/5G/sY6mHF0MB9LIu8Aki8ZV+er3nKSij7XXvIWeXRHhYx+cDdNCBkar?=
 =?us-ascii?Q?bDcCJsWcOP6HhucKo7ihlxhYxe337PkuZdjSkGgZV2bq73zayGs/mJGyP/Ry?=
 =?us-ascii?Q?9yg4YNrSHl7JR8rrxzFt4bB6vuZlj+hv3nt8FQjZziXpd+11Uc8HoB/mBjf1?=
 =?us-ascii?Q?Qv67jI28RD3XgUhybXWrJuMZppBDltk/14f+tOYSt1aEpgN8MXtn2gzSTQXd?=
 =?us-ascii?Q?aFKqXDLzekowxK+vn2nsxeWCHnlWy/krWGoSwS+/s/QhSiMp4EeP5CtgkErJ?=
 =?us-ascii?Q?4Mcy7tMNLMGgn3jIuXnVkhSkEMKLJD/GoGaPx+Y1tBFCsnib49K19PDPldKu?=
 =?us-ascii?Q?fgQtOvfcHZ4doZWmARUKx5q/N6Xk7UM35iS3wSwyqpBqzs/wDsJGljks8EUs?=
 =?us-ascii?Q?yWkCiOLgtyvYUVBLgAYiCpE7YlVVU9lFEcfXXKiZwOazzvY/tRcUruclkhph?=
 =?us-ascii?Q?YxlLpy26rkfvyNay+LaKBIWS7uhy7eDa5VadRbGv6TxiPkZdEfWT5DwC+tgh?=
 =?us-ascii?Q?8ppbo3RemJuolHnhrZdOWTFGURuhNFJJmZersszFhNCvheowi4RiglZEBYC9?=
 =?us-ascii?Q?vReezqsOd4XVKLhUDtJZbJ89n0Ph5wCY8cbumjt1LXQgZc8o1ncrYQU4mxSH?=
 =?us-ascii?Q?tK1IVJf+dqT57kzOJuuReNq6z1UYxSfNzLnc5MgHT57BWXvJbTxOoYX0wu+V?=
 =?us-ascii?Q?ZWxORJF8IO0E8HzAkmQ+7SuS3LuVcHOD4dhUzVkccsSrItI0c4tlBQqZRQKy?=
 =?us-ascii?Q?drVOZ5+My8BBkAt9fnY5dbDyLGGrsjX3VyJ/QxxOcSAzQ1HDu6FqK2Uz/v75?=
 =?us-ascii?Q?ns4EAcM9SrvgZB2KjwoRbVCgJj75KqScMvG4CvN7v31jkoJzh366dUb7IvnC?=
 =?us-ascii?Q?cJ6vG30tlCFDu5yKvh0Vn+ssviPaoV9Tk0z+wWN/a4moJKZ2vKFNrQc8pkrI?=
 =?us-ascii?Q?YvjxRXYyBuq4ZAC4I86o/BepL3sK3zH/vKmr8bSReb/QTkzobUNm+hdeJeT1?=
 =?us-ascii?Q?0QHrvFg7IBtiku4Z0vHIKMnQVYqlmg3jtTDjvx10Xo7lriXlcJujAF5Rm0q6?=
 =?us-ascii?Q?Shpk0ZFACJeg8FzxLzCmSohipClCJiWEAlQCfT0ii6gOn7+INn0gl3y/Z13U?=
 =?us-ascii?Q?Z5vGdaAhPg2iy++jvDwnb0+rd9fCYjsonF9AZBiQJva7lJkn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a081c194-db6f-4e71-46e8-08df31437622
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 20:23:12.6638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NE4p4Y+TtifH4g7PsOtZ5U5rpu9MT7k7AQX1c1AqwzhLWXMqxfaItlS5tLc/Kdev
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5859

On 23 Oct 2026, at 12:10, Sang-Heon Jeon wrote:

> Since commit a492abe28bec ("mm: hugetlb: move mpol interpretation out of
> dequeue_hugetlb_folio_vma()"), mpol_is_preferred_many() has no callers.
>
> So remove it.
>
> No functional change.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  include/linux/mempolicy.h | 10 ----------
>  1 file changed, 10 deletions(-)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
