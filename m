Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793837464;
	b=OMs51wif2jn8aaO9LcYWck3MtNQ9gBLCIWEU0g5IlkbFE9lxprNrg5g2uWcR6QwbiZm+
	 OZnFNmi0ZosOdaa1bAy6BLQU7eVsZlNFW0z+HHt1FUpIaxsfhCX6B4GPZ1hzbUnHjAL/y
	 VA5fvxqzo+4z2W13IW/iibcaWFvzYw1dVsFHhhKoV8kBL8CzFL0Y+tHQzc+84ZrBkSXb2
	 2GmG55UR3goCDR17Ix6/IOkgr/mBjFtJ7PT7Gr5RxZWkPhlyqys0Vz3MrIwGd2+Dm2RTZ
	 sJSn+50A1jxzArUTQp5s8189KNeng9Xcqkn2wgaedatN5ebGle8ij8YDRsioKig5hGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837464;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=GB94P14/wqCPhAGUTw986NqTYnOVCR3Avm/DZe/XXUA=;
	b=zmFip3gGS06ppOUtu+MMDIzjGCAMqZnvvngBlna0T8RVbeqGRvo9U17B+lXHgeEvpNQc
	 aTzcpbfKSrMUzUccCCjpE5tyPH/EhXbmDqGG0fROOBcL2ennXqVfGG844b6iUxdbPPf46
	 UEsUh4p6C15JEe0j4Q7FCapvhtlS3XttYuWIBHu8rydfhvuZbre80kMLRuwG+MQ/vpk7J
	 30U5UWxIFYLH/rj9scdSDwAnTwg61qbW3ehnVO7QmD0vj4kYFNj/ArcN6BvgmZYWzpOyJ
	 J3VTKV5El3lyGphIfyTypqKMd0zITsJPvwDQ/LKs4RPrYIdDRx3T9s9j+ufU7F84nZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=QvEBg8j6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.14
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19012014.outbound.protection.outlook.com [52.103.14.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C03606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C03606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=QvEBg8j6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=om1AypaCPQs7byc6vPE+yNs4OQfVZbrB+kz9eDg6dqko2mtBNS14S4pQGMwScIWUjc3KTv9qUZJv70iRoOTnVL6wNb2kox9dTFVNWc5fu2IwtQxbWZqOjUnD0hYcFPYRVfIzleuw/3Yz5ctKY/wMXxcJqTeRKmkhnbd5acldn8ppvPzcD7aLRLxQZMz6PEKu/q43UA00J68pAsJQ7nv4O4NyjvWNJLE94lQ+bVWnJTHaxepKriG43WpYinOY/PTeIsP+Oy0Wt0hFtGIbxgmiNeE7Og3q3bdMOjDID3IfFZYk97/i3NnBgMDX5Aq+Ve6iI6K4ypqTI9/gxADRoEq0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GB94P14/wqCPhAGUTw986NqTYnOVCR3Avm/DZe/XXUA=;
 b=UWsYZu+Ue/1Hcqd7lSLLqgvcjOjBos8WEWCGIUa2cRCpYHcNfj4eOE10Osq0S13iDBI52bIOBhX9q8NAZHAiN5x20o1Ac1CVvjt4Jsb7buatng0mjW44723yXWmoDhQLgCff3+Soecx/gziZwpJwRpvJNS92lYXtgPkdLa8nug0qebn7CO5+tQl2oyKrh03xlP2ZuJIJFtFBDRSh8fYpXIqFueqGfzAisWXSDrdoSKTF58lEdzgGbuAK+EVvhEOii6n7DZgecLIvxyc3JdkovZefu6Tdby1710FE2T1aWUKNOZ5ZaZ4Gmziuh0LYRd41XwV98IAGAiiQ4T6YOZHy8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GB94P14/wqCPhAGUTw986NqTYnOVCR3Avm/DZe/XXUA=;
 b=QvEBg8j6LAajo5lCYhhfWpBlYtrOatySfhtDxi950Elqsl1QbknbPVXMllkbZRURLZJUBwPONjUhft4MgxaEUBfpBhLGaRpJoKilDiav1fyvQgaJ8OPO4WerkbWJZE9SIG7LiPxMpak6x6PV7crePL+PI9H5xCVVsdzQBnM/2qXssagpuavNI6lvxiN4sG6s8tkmLWOohi5+tv5hbJBNiawxCoDC6+A5/6h29zXgBIYZU3guFmtg4IIkewBCmu+pSHcMb5a9aQH/+838q+sbUDeMeTbi7zJCWp6jyrcjtlaXbYPDxDM3EFMGCbAHbG620MeW7P+fpZ8mm1X7LT7sjQ==
Received: from SN1PR12MB2528.namprd12.prod.outlook.com (2603:10b6:802:28::33)
 by BY5PR12MB4194.namprd12.prod.outlook.com (2603:10b6:a03:210::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 00:10:59 +0000
Received: from SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a]) by SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 00:10:59 +0000
From: Victor Chernyakin <chernyakin.victor.j@outlook.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Victor Chernyakin <chernyakin.victor.j@outlook.com>
Subject: [RFC PATCH 0/2] regmap: add APIs to bypass regmap_field and work with reg_field directly
Date: Wed,  4 Nov 2026 18:09:48 -0600
Message-ID:
 <SN1PR12MB2528754CEF9D8E5103ECAE28A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH5P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1ef::16) To SN1PR12MB2528.namprd12.prod.outlook.com
 (2603:10b6:802:28::33)
X-Microsoft-Original-Message-ID:
 <20261105000957.695605-1-chernyakin.victor.j@outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PR12MB2528:EE_|BY5PR12MB4194:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d6caae1-2c27-42a2-3ac1-08df3ad143cf
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24121999003|22091999003|15080799012|23021999003|5062599005|24021099003|5072599009|8060799015|19110799012|25010399006|260925184616899003|8022599003|19061999003|440099028|4302099013|3412199025|1602099012|10035399007|3071699003|26121999007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7FZK+kqDVJwRnv+2HVVHWGPfGUXn4Y67/xDXZ29am6cBh49Y7W7xs747Wnja?=
 =?us-ascii?Q?/kmDRw36GygW8/KJLXQDXIjNQ39zgXbYQQsXLyM4YqtgV/apgfD2f80oHUUV?=
 =?us-ascii?Q?xCzo+Nf56qKFW2hWDuzu/55kzvCUNdGFCOcEu0dXFv9PoBUgu7Ttd7zhaaMT?=
 =?us-ascii?Q?esHTiQ0OV1Ff8hpRfJpSHXz1ASw7Y6LZA3AfP5Z8uiPmDsjy7UF+ZitbpoNM?=
 =?us-ascii?Q?r5ELYoOB8q8qWlOk5Mh5vJUO2p0lw5yWlOQHCC2UAKUQdzOfMc0L3UJHAKhV?=
 =?us-ascii?Q?X6fIRzgVh1ssiVnjZxaTm/5DxIXmPWo3bf1y9NN+G41OexfIdpV44BarLxJ5?=
 =?us-ascii?Q?wHe8sX/FPe7HBdXGrmyjHPvt9euhi3PAzeUvZl3ugFPR3vd41XaOFvGQybmJ?=
 =?us-ascii?Q?iFKFKYF1TlX7Cn2YiYXvae3SKpixzpn64+Aq6QkRQwg9FrOnNssNmtZOQGpf?=
 =?us-ascii?Q?P/7/FgnoFrPXsPHrsn97OzGgUt3wipYB8GDjtQrC8Arg+8J0X4ZZ/fTZhasY?=
 =?us-ascii?Q?kAXMxFkAC+XCLEIXvvJFyY4EEQF6cXtJYKyXyVW9XUcmiZuIPG1v/5liADTf?=
 =?us-ascii?Q?0TrH1sP2eYW3fk2f766Fu/Nq71O8bkAUTNGr/T9JWJkq2k80fx7D7Y3gAGd8?=
 =?us-ascii?Q?kxLEIxKtcfUgR/vhHRNRvHaFviqzMatb7EdOdp/tuBhTvRh3yTelsQbOFlEu?=
 =?us-ascii?Q?paLFxNb/JQ6JUr9El42Y5kTPg9dC0wsSxLKOsTMV90gNoI1LYVcGNs9bwZ6j?=
 =?us-ascii?Q?ASaNQ9s7VagqQsrpbUglGQqfmv5ZzkcUFQo0VufXXQCKg/H0uPHzkXjXhgWV?=
 =?us-ascii?Q?gF0QmaLhX9d0Tu7fNghV08M5oLFezZP1tMspqVxPp6/Lp+EHgHJB7A1NO+tC?=
 =?us-ascii?Q?2QmUGABeECBgKfBZQjDOAQtxpI2TQbV1HnQcM3bmqDhVqIaeKonhYT1ddWIn?=
 =?us-ascii?Q?HjbF6c5Q7wHjYyPUH2Izav1ggfEu82UP02jYu94phK9vgUVOgQFvX7i/Rqdp?=
 =?us-ascii?Q?CDYT+wpYmk6EeSu1QXHDepHJ3ZRfDs6XxPQgP//ECyCJqfUvoLBqvj6ocOTS?=
 =?us-ascii?Q?KjD03J4VVs8+hrFxBfSCMep9nmNCCH6uDUtr0iedup3mWXDbboPMjOZfX4WZ?=
 =?us-ascii?Q?GU+r1VAK6iIbTQ5u9AMIBVE9O+53YVWFiVeavXSn5uyEuCrrrgMxG4c=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n9vXo8K4X7FrGN1EXM+Xl5Co3Eu/3pBk8cawT3PtvhHeu9RvLVg3istEkwvS?=
 =?us-ascii?Q?mXJLKZ5NdE2ZQ6E9n/OlBTYVtQhhO8p+r0cvoI5J8QTyFZolNSj0eE9YD3eP?=
 =?us-ascii?Q?uxODljp3nlCQ6PHVjn5DF0+oRg8w9tMEWo1s8PAfmsB26njxaGQaeI6rLDc5?=
 =?us-ascii?Q?YB8O8kz3RAexuN0rRXj/R3zBKli4s+/mDYRIQJeJ/EepcZNYyYbdl4BjUX5e?=
 =?us-ascii?Q?nZGcZRSmDy6n8qZ/WX9ZQg7KRZayo/VgPbsw7Zv1bDVNh3jPRUdKcCgUdG9b?=
 =?us-ascii?Q?3ZGOFWixzrOnIZg0Gzpe3KinEsKD7nzBMiQM/wDKTH6R6bzOOEROduvx8pzE?=
 =?us-ascii?Q?40LEdbfFPR/LTsUG+5FqnqYTLpxcr1RNGYfI1XZ5OJshPr7V7Gfnz+Bo0R9N?=
 =?us-ascii?Q?y643JFto7HLHhiUwVYZ/Nzt0Mlqhso9Ag1eQvZvjw6xHOdPkUo/7oI0Jx9tB?=
 =?us-ascii?Q?OPDA4ZFQkk90pdjxgsmXaJDaPLJg9jSfF0Im3WjyfDqpi44sYn/V/eeYL58V?=
 =?us-ascii?Q?b+1HEMa6Ob1iqs2/5WJrPLizHIUdAfs7JubslgltZGsVmUo3foYua6BVIeA0?=
 =?us-ascii?Q?yHkX+FryeQvQErX6kmH72o6+ifd7IUuZppSGqnpV8V86lgItuDNJZpzQmQMS?=
 =?us-ascii?Q?5EBDMGGPcvLZgmpTm3ucsHTksCKlUBOUTnCv7nCi/cV/77YdvUTPGFV8uvB9?=
 =?us-ascii?Q?bVEzykCCoTjuHnVkc/TP6djIjb180XGaMTKDoa2NPTXzWcZQFg3Udh5HkPyr?=
 =?us-ascii?Q?R2cF+bQ515itB6n4iYnSMwTxABuOeCN/57DDXhCainAGsxkm9ptkqgQ042CU?=
 =?us-ascii?Q?GXeJBj+OZ2sOLnsQphgWS2rVPmg6xEz5MMevUrwF/vTFx3lthV/zw9ghXp7r?=
 =?us-ascii?Q?3g7D+sfD1tlDXGHVTlQyc65ykMmnwgIBcD+JkunbO+qr5HBtM5eDk+HOm7Tm?=
 =?us-ascii?Q?35oWr4cYT+do/whudZt/1H8MEqRb8Dl2Oe+JKoORU+pppiVco+EPULb9ydBr?=
 =?us-ascii?Q?T8/tPd92eGLG2/fE9TYHPcr0s5pWsOzWBG5n2H8YgoEAOGqf6D3iae2AgCN9?=
 =?us-ascii?Q?yzkhfuCtpE39kxlyHebrUR/GOOnBum1+Pjp38+Ut/mCzx4heRJMUbtzb8fis?=
 =?us-ascii?Q?6xj93Bv2Wqe0OULuCrUr/Yti5FXfY6xoMxdwcoboIRQYBEJ6UY+uJS21WigH?=
 =?us-ascii?Q?9iDR8nZh/wX0ZpqthX7aUvdbwOugpLzE0TcIvL2sp7DtU6V7ELA5OsCRHHgF?=
 =?us-ascii?Q?lFBlqB/fetGd6yaYyh8zpWDgZfuYBwePmg/lgnNXuymX4sGIenbrnqBe8PC5?=
 =?us-ascii?Q?3YzabRIqzyW19tpQyMEWG7XzeKBkzWIDHNFPaIAEo1oztq9LNRg3LIddqpIo?=
 =?us-ascii?Q?3US9dft7FRHbA9z4X5LtxsZNinA7DKhTpYPmPieyyCz6xQ3VZA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6caae1-2c27-42a2-3ac1-08df3ad143cf
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2528.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 00:10:58.9734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4194

Working with the existing regmap_field_* APIs requires you to define
a reg_field, then use one of the regmap_field_*_alloc functions to turn
it into a dynamically allocated regmap_field. But reg_field and
regmap_field are practically the same struct; all the *_alloc functions do
is shuffle fields around. So this RFC proposes adding functions that
cut out the middleman and take reg_field directly. Patch 1 adds two
of them: regmap_reg_field_read and regmap_reg_field_write.

Patch 2 ports a driver to use these new functions. The result is
shorter and simpler, since all the code to perform the allocations
and manage the resulting regmap_fields goes away. In theory,
there should also be a performance benefit (we're doing fewer allocations
and have less duplicated state), but I haven't benchmarked it, so take that
with a grain of salt.

If we like this approach, I can post a v2 that adds regmap_reg_field_*
analogs for all the regmap_field_* functions, not just the two you see here.


This is not actually a new idea! Both it and the current *_alloc approach
were suggested as alternatives right when the regmap_field_* APIs were
being added [1]. The *_alloc approach was chosen without much
discussion, but I think (and Patch 2 demonstrates, I hope) that
this approach is the cleaner one.

[1] https://lore.kernel.org/20130604210137.GV31367@sirena.org.uk

Victor Chernyakin (2):
  regmap: add regmap_reg_field_* APIs
  iio: accel: msa311: use regmap_reg_field_* functions

 drivers/iio/accel/msa311.c | 297 +++++++++++++------------------------
 include/linux/regmap.h     |  61 ++++++--
 2 files changed, 158 insertions(+), 200 deletions(-)

-- 
2.53.0

