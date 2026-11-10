Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794280169;
	b=bo/S7Lte4CXgKOuKr1kLN4B2ttOtEqehHJFMxFDVjjDknz/c2yYi7PpPghvJVGywRC5Z
	 Xi49n/3xvkHhDVNlpUtk1ruchCQfUZYOf0HuEQB7t8hEDcO13K0mRBnEtQUtzghtwT4zp
	 ne65d/4DvsoJoHVmeSTAOeV35kQZTrkROg17DyF3lH2XH5J/x8fpeQc59wIJ8FoyoNvp7
	 kFoN5vkpWWSsMMBhagdu/bBBe396gQBhNKfcT1YRTLm5h0/O2FIeOaT3sXVHSOPOqzqnc
	 KsfO03jXjh3RXkwYCUshHWbOHpArrIDQJcER1cHABqjmymCDN/H8X9M3s2kopuwg5Fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280169;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=9vvfr6gbLyZykWn/1TujmRhg2mHrVp+i+RVwFc8etp0=;
	b=xyoEN+CYOdkwQg4WSa1/ULa6umuCXkA3xOZBiKD6RGd3evKkiVnXUYprMMd5c1OaKGz5
	 kfNGOWjN3QWlxD8iYjFqGEyH23+qH0AXMoOHnioRDAEB3RKg0VV8FVBBvLkY1s3QJihQp
	 3pLvlBDw9pF2tTUktSLVMkWVvPcPk2wl8NB0elzf9x67UCffApBqKEPAWJz0WK2snrlUy
	 RVzkC+34CeUuqo5R9nCJ4frzHmR1ilHelYolNtCMoEsrgX6bPJXCXnrBBQ65Td0StVtVE
	 tHYXc6J+gZ50+nRN6p7BRRPH/Kwq+xT4/c2ypOthhdQkwsQ+AuM2HJNIkeo4cY0VL6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=s2fH7TAs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.17
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011017.outbound.protection.outlook.com [52.101.52.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BCF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7BCF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=s2fH7TAs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/m/iufYPA2qBTwHO4bsYFiM7z+7UXO2Hc3CdsgL1QGAgpuXvTdqYQzu9APxZQNn455sM5W11Frmj/FXKAklEpPdgNRiuwYPaTAs7xIUZXaRGNf+pXWF9KZiqTWUn5SpvRAcYWI2idBIQ5Hs9jL7NmimH8GxoraRtDScuO9piNUNm7VSzCHI36ecivqc62SO5xTWNsdib9VgcvgXQB8IEcsXuNK6EQ1sEWUZFvGI2jPO7zJx0PF58GpTvKh1KY4uPk0ATbfo1Z0AFBQqz3IG4Uif6InDky1h2hfx7CAD3nCNj9gGHE1qdeYMG4C8NSdg1wyX8W42TvbkcWiN1EL8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vvfr6gbLyZykWn/1TujmRhg2mHrVp+i+RVwFc8etp0=;
 b=oAtFF8RIsVCaETLkTvLHGYIOmtIaUBEj9AIGOk/BQ4Yj0YxxY5jLT8djRQgft8dpZ4PdfgQtR2WhwtCptn+DtJpV+4os+KOFMDmML/vS2pjSn8lg/eRiQ8hfgrHbmF+pRHr1/NCwb5HG/Bwjat08Ajn3IJOTMB+2L6cG0IbstMwlEyOAvsZ1cTf9mlWXxCPgxJ/g54KxYjtycidI8GZNgkiB7Gg6H3HW0Ce2UQx0RnvPTWNdZMwC+u6MxU3hGc6QLYOU1DXK+0f5IgLyty38LEgSY28MFMEd59CefFbONYsYZ3Fiop1UcU7AbIs5RZRXqEkPLniOAXH+ohoVe4ZvUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vvfr6gbLyZykWn/1TujmRhg2mHrVp+i+RVwFc8etp0=;
 b=s2fH7TAsdoYldfjCFWM+YE9v6MN8dJh68Vh0srj4QvUbpy7t4rAEKWRA7C6LA7R9eJ4UoBRWKJHcBfn5jC8vSa6kfBK+xiPqa2lksAjRKqMVAFj0CLjJo5KRtCm7jm206Ks6VUgB2BTQ+fRGqg8uLZvLkUi46ULV/sGwznlcqBBBZ0xev2IqhxVNUaL0L7Oc3OmTKNmAage6RS32ScwfFZ0nQdsdM36YJrDBavhzAiBvUKyuBjIEXnbFxThKi4vfaVWZpZgn6c/B2aQ4oCn1Q6lKJSp2vJCn1+JT6pIyJfGo0MgopSqW6cJ3gQT3vPz7aFUtcUme1398JuEY3DpcCw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by FT1PR12MB924478.namprd12.prod.outlook.com (2603:10b6:170:21::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 03:09:24 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 03:09:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 22:09:23 -0500
Message-Id: <DMR78FJXMD8M.QC57KT5GIPX1@nvidia.com>
Cc: <matthew.brost@intel.com>, <joshua.hahnjy@gmail.com>,
 <byungchul@sk.com>, <gourry@gourry.net>, <ying.huang@linux.alibaba.com>,
 <apopple@nvidia.com>, <willy@infradead.org>, <shivankg@amd.com>,
 <ridong.chen@linux.dev>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
To: "Song Hu" <husong@kylinos.cn>, <akpm@linux-foundation.org>,
 <david@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH] mm/migrate: don't move memcg NR_FILE_PAGES for
 swapcache
X-Mailer: aerc 0.22.0
References: <20261104044313.2099309-1-husong@kylinos.cn>
In-Reply-To: <20261104044313.2099309-1-husong@kylinos.cn>
X-ClientProxiedBy: YQBP288CA0048.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::18) To IA0PR12MB8374.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|FT1PR12MB924478:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b1e2b6f-2def-40cf-7eee-08df3ed805f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|11063799006|56012099006|261021121427099003|261022105027099003|261021123027099003|261022075727099003|261026140227099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	W1eAOLVz08WlTN9RSQZrVQcbwVZoS+liAjGyknM7TNfGtwfEwFIpLnLn+kyaIIlZZzUTLrch0/oUSk7YRD4wTpTwBwPjmx6xC+87GBq+CYHIaggOidsnkUtiHIdAWWy+geMxgggPhDwhVztS1c2M9+Y9LKIa9DLr+YGQEXISj+/WRgFvvu3M0dcVR/+7iS+xfP6ofMFLtsBXT4JJWsdIHtxLOr3rgYjFmHhmIiImHXkY7NXq5p6yfIaMg/DV9/hqrsrJ3LeX8SN2NzDwjgw/i/mS6fpqJ9m63jMzZ2hUI1t2yA3cXIdIq00fyT/2bBIS+zZwEd3yIFxIerTlnCOmleAVtYJn01w+4mckOe5sAYGZen3zuVFa5T9y4v2lzGVZYUC1m+hukhoN7KCJB/AKFaUJdBWoNelUKTjbDyO1nB6iNv/6ACoH3WIoWN1dduexWck5kO8Br8/56lnOIDK3slkcctHHcnQ3djrlz1T0Q/7QZcXxksjhRNGAA1WTriQzzKVfru2QDM07GaZeGyGpO4cpSsXrSKmalqKN6lqbiACQkKBpfATUfNOKCHtjN2XU0hZzH/OcgMTuYontDu928z7o6YR+IhRJCjDeCm7jXxACCeBYknaS8dtuO0fTnGZUD3diG4ARrYpbO9/0LvSARflMwsvErxuxwg24M5zI8VY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFZ6K1JHWGtZQkQ3RFc1SzRVZVJCUjV6N2NuT2NzT1J2WnRoZkhWeGkxUFpq?=
 =?utf-8?B?QlRQdnpKV2tubXh2a1VIZnRVcnBzdjhSRkdBbXovb2RSc0RFZDRnc285RzFs?=
 =?utf-8?B?UXU2ZWxPTmdwM1pRYkg3OGZFZVcxaXA1ckFOU1ozT3drRUpZTHVmUC9HUVRt?=
 =?utf-8?B?UUlUa0N1V1JPbXA2dDBobWw3dEZDNnl2NGNGNXRGekRFYmRTS0F1SUwzblVv?=
 =?utf-8?B?YStZTU9mSnBMU0V4Y3Z5Y2orbmZGOTFGalFXQ3pkVGV4TkFEdUprWjJscndY?=
 =?utf-8?B?Zm5DSUR2aTA0eWRZMmhIY0tVVnIzN2UxaDQ1dHZDTmcyaDdHeFVWMnNNQThC?=
 =?utf-8?B?UGhOWlF3MWo5dEZFczE5V2dXMW9wNk13V3duTXhraDhRck04cTF3dHc3UFhu?=
 =?utf-8?B?dlhPaWVUSlFKdW42OStNRk40M0xaLzl0TkNENTR0RGZ6a3pVaHRHb2tpbHEy?=
 =?utf-8?B?aHAzSFFldWk3d3ZyalB3cm5idU1KQ2p1bjVuMDJOcDQ2cDd3NnZzaFRTdVB5?=
 =?utf-8?B?dVpmaGJFQmNCd2FjRnlJZUZnTUJEcVR3b1dmSG5OOFNxRXY4SVFlam96M3Js?=
 =?utf-8?B?WmpnVkFzV1g1TWpaamMxQisrV2oxOEVHVW5IcUZmdlFsUXBoaTNkUWwydHpr?=
 =?utf-8?B?enA1aS9Nb1pVYXZocXBmZlVkaGVjVmtNWGxSSzhPNzJiTG4rb09QWmw3VFNz?=
 =?utf-8?B?VXp6RFNWT0VlZHVJQ3ZobGEvcFFjcmZhWXRrdGU0NVpGOEpGajdsa056S01Q?=
 =?utf-8?B?V0tVK0lTY1QybkFwU3V1em5pRG1xczNET0Rwb1NEYzVKRnFHS0w3U05IQldQ?=
 =?utf-8?B?ZUprWGxmb082T1Z2dk1rU1c1SjhJY1hNZkg0aDM0a1hVaEwxaHBORXU4eGMx?=
 =?utf-8?B?eldJQVQweXNDWmxsNzBlZG15TFFJNTl4eXJOR3c0TFQ1U2ZPOEFWQTJZa05P?=
 =?utf-8?B?VkxSY0NyWm5uVE1BUEZEZjhuM1RORmcrczJlMTN4M2Z1VEJhc05oRnJHL2JN?=
 =?utf-8?B?K285T0lRVG9zR0wrU3BiSW9vaXFvRFZ4U0Jja3grVHJGTDFnTWhjTzNRcDhL?=
 =?utf-8?B?UHRoamt4blp6Vmk4VFlFaVI3ejNSQXRvUklxL0tCbGZhUEpIeVAySCtJV0ZL?=
 =?utf-8?B?Y09xU3FmN0sxdk13Z0UwOUxocU1wWHpmdzlFbm4rMU5aZWY2b01iNEFXQnoy?=
 =?utf-8?B?eXpySWJIL2ZNb2pkUGllTHBRT0hSak41OGhzNitoTHFjbjNTM0dIZEpsWks0?=
 =?utf-8?B?MERCeTFKOEUzSnV4UTFFTE1Qcy9rOFFUS0NoRnE0NWo3aGJqV0R2RlgyTmov?=
 =?utf-8?B?ZTVwUTFFdlVuLzQyNlBFczZMZy82aWFFR09KZVMyWGhyZDVxb0VUb1Z3OTZK?=
 =?utf-8?B?Y0RKeWdDN01ZRXhNcVZBVkxuV1FDM1kvV240dWc2QllHcWhmaUk1SEllZ2oy?=
 =?utf-8?B?TFJmQzh3VW9NMmliNXN0WEZFbjlQaGNNdFZOd3ZGbmkyUlZrK1RkdVRYNHFP?=
 =?utf-8?B?bVR0OFdwR1FDcUNpZ3JnSkp1THFlQzZRc3IyTi96UjEySW4wYURYZysxTmVp?=
 =?utf-8?B?QmpaZkZ0M1oxZ05melhLeHpUaFJHRWxaRHNDMTFGaXZXK3JjSUZlalRoa01E?=
 =?utf-8?B?ZlJDVnBmeW1HUGg4ZWM4R21aN2w3UVNkUUY3cmN6QXJkNXhDaXVWSDBQRnpw?=
 =?utf-8?B?OWk5dTlaK3V5SG90SW5BRHlCTVFNb0g5NTBva1VyMDBqZ2NneUJ0cmF0OFNz?=
 =?utf-8?B?eGE3b013ZExuMU5QVXVDWjYvbEFjQ1JBOEJUT3RNbVVpdmw5eVJsUlF0YmFQ?=
 =?utf-8?B?L3NCOVVCVnNveStjRnJadkdjQUdVNXU5Ly9QWWFka2dQcDhXUU16bG9KL0V5?=
 =?utf-8?B?S05oNTFQbzF2WENEQ1ZxSE5QRnRVTmdBZm9ubWNia0RpNXRKQ2ZTSnp1ck94?=
 =?utf-8?B?d1lScGd4ZTFpZ0luc0Q2SEkwM1dTSkNnRDYzUVJ4SnZHLzJNMCtYNUk2QkhB?=
 =?utf-8?B?a1M5NzhtK3VQaGlNellEMDNTOTFQMW1hTVdJSmt4S2J4ckZyd0dlZDBrelVZ?=
 =?utf-8?B?MlFRNHRFaXlVMlhKTnVNQjJTeEpHbWJPaXJLRjdCcmFaSFlNZW5IbmVyNi9D?=
 =?utf-8?B?eUZwRVFKeUdKNVdsVmxpZ0Y1di9Wai9sS3BOSmdKYk1RM3RTQXArZ3A0NTlI?=
 =?utf-8?B?dWpZNjhpNFMwWHdSNXVaWEVNczdkWEE3R05kb1VkRWhSczNZMC8vWWorc29L?=
 =?utf-8?B?NW1rNHcrS0VoR0Jza0tIclVVRzNWUE85aWdZb3RrK3g3cUtXVFpRYlRrTkti?=
 =?utf-8?Q?PenWGvOtLuZYhlrz40?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1e2b6f-2def-40cf-7eee-08df3ed805f5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 03:09:24.4851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGRy8E4tAD2uJGrFQESNHb3nve+LniV0UjU+6IYf0WHbTrQjuia34kFAJRfW2X44
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR12MB924478

On Tue Nov 3, 2026 at 11:43 PM EST, Song Hu wrote:
> NR_FILE_PAGES lives on both the node and the memcg plane for page
> cache folios: filemap_add_folio() and filemap_unaccount_folio() charge
> it to the folio's node and memcg, while __swap_cache_add_folio() and
> __swap_cache_del_folio() maintain the node plane of NR_FILE_PAGES and
> the memcg plane of NR_SWAPCACHE.  A folio in the swap cache therefore
> carries no per-memcg NR_FILE_PAGES count: shmem folios drop their
> memcg file accounting when swapped out, and anon folios never had any.
>
> The cross-zone arm of __folio_migrate_mapping() moves NR_FILE_PAGES on
> both planes unconditionally.  For swapcache folios the memcg plane is
> empty, so migrating one misaccounts it: the destination accrues
> nr_pages that were never accounted there while the source counter
> underflows.  The wrong counts persist until the memcg is destroyed,
> but the aggregate in memory.stat stays correct, so the drift is easy
> to miss.  NUMA balancing, migratepages, compaction and memory hotplug
> can all migrate such folios.

It would be better to simplify the above like Joshua suggested.

>
> Reproducer, on a 2-node QEMU guest with cgroup v2:
>
>   1. create a cgroup with memory.max =3D 50M and swap enabled;
>   2. memset 128M of anonymous memory in it, so reclaim swaps most of
>      it out;
>   3. fork to raise the swap entry refcount, then fault the memory
>      back in, so the resident folios are swapcache ones;
>   4. migrate_pages(pid, node0 -> node1).
>
> "file" row of memory.numa_stat (bytes) after step 4:
>
>                     without this patch      with this patch
>                       N0          N1          N0          N1
>                      0 (*)  51691520         0           0
>
>   (*) the source counter has gone negative; negative values read as 0.
>
> Keep moving the node plane via mod_node_page_state() and skip only
> the empty memcg plane, mirroring the swapcache exclusion the NR_SHMEM
> handling in the same block already applies.  It accompanies
> commit 4eef27af2932 ("mm/migrate: move NR_FILE_THPS on cross-node migrati=
on")
> and commit c5eef2e03618 ("mm/migrate: move NR_KERNEL_FILE_PAGES on cross-=
node migration").
>
> Fixes: 0d1c20722ab3 ("mm: memcontrol: switch to native NR_FILE_PAGES and =
NR_SHMEM counters")
> Signed-off-by: Song Hu <husong@kylinos.cn>
> ---
>  mm/migrate.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 28a8d7734735..bc60f6587d1b 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -690,8 +690,20 @@ static int __folio_migrate_mapping(struct address_sp=
ace *mapping,
>  		old_lruvec =3D mem_cgroup_lruvec(memcg, oldzone->zone_pgdat);
>  		new_lruvec =3D mem_cgroup_lruvec(memcg, newzone->zone_pgdat);
> =20
> -		mod_lruvec_state(old_lruvec, NR_FILE_PAGES, -nr);
> -		mod_lruvec_state(new_lruvec, NR_FILE_PAGES, nr);
> +		/*
> +		 * Swapcache folios carry NR_FILE_PAGES on the node plane
> +		 * only (their memcg footprint is NR_SWAPCACHE, see
> +		 * swap_state.c), so move only the node plane for them.
> +		 */
> +		if (folio_test_swapcache(folio)) {
> +			mod_node_page_state(oldzone->zone_pgdat, NR_FILE_PAGES,
> +					    -nr);
> +			mod_node_page_state(newzone->zone_pgdat, NR_FILE_PAGES,
> +					    nr);
> +		} else {
> +			mod_lruvec_state(old_lruvec, NR_FILE_PAGES, -nr);
> +			mod_lruvec_state(new_lruvec, NR_FILE_PAGES, nr);
> +		}

Like Joshua said in another email, it will be more readable if
NR_SWAPCACHE updates can be moved into the then branch above.

>  		if (folio_test_swapbacked(folio) && !folio_test_swapcache(folio)) {
>  			mod_lruvec_state(old_lruvec, NR_SHMEM, -nr);
>  			mod_lruvec_state(new_lruvec, NR_SHMEM, nr);

Anyway,

Acked-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi

