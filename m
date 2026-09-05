Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011004.outbound.protection.outlook.com [52.101.57.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898CA29B8E1
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 02:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788576341; cv=fail; b=cV0FsGZ0GQLdFWBfAfG0IAocozKkm7N/Ux8R80UuEr08/XqW7Uy4a+jLVoGnuBDmsJihDf/qw16JtFWLxjizyYQsSKGlHoEtzjbChuk2JiWEoZsNC7ZY1jx6azxOaRx96fqE/Y7lxZtWYXkp6u63Uf2NqeM/xXzZTQqBxa97+50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788576341; c=relaxed/simple;
	bh=1mbeuJS6PhNn214hZaohBZXy61kLdV/fdPQ6vHMzHpE=;
	h=Content-Type:Date:Message-Id:To:From:Subject:Cc:References:
	 In-Reply-To:MIME-Version; b=K9/TyV+XtEjHi7I7ACudpFg88+HJwkNf7VqvtbrxVSOeWGrQ3m/VOLipKeGYMSPV/q+ALcS7kHRwNBNaqX/uL45ORamGwjux66EPNbHV3AyipIajxy6KcP8BsE5D3qnhxFYrfWWPCtUyrwK1QBbgJe7si261CMGSf3nVBstN7NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jEPvfEaQ; arc=fail smtp.client-ip=52.101.57.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jEPvfEaQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gv3sxpwy4gM4DerkA+GD7PO4Ef1Tt1Q7O13CrblR4V3IjA0/s7+6CblcuUF11yS56P2v89kAkXnJfCAMHbw+Qu/XljJAyY06+/UWlhKevyxY9xsEReA9/B6CSf7c8wZP9H8vB6ttG5ToSbrAOtLgJ3t62gedYY5BBWf2z9QnS2KVAWkAi7HkMt30oQnz+KPF+hzR/Sb7ULfykrdLBGF9LibDJCl8/pKns4M9L8mwMpLQiBegn0ZXoTaZxpC4L7sxKTmFVpP6Pb6EpU66SUQfY+HGgrM3VsvfzqnirQ53YZsKudoDW5AvFQQerpuzUeF45oy2aTDlEKvAn6mJ+Mxi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heobK30ngDL/3+HSL6iQ+jib0obrtFWZMtnjYrtlEJQ=;
 b=kJS6wld4Jezjti0An+zFbc69/j/TSibYGlvw0fin1UpCh97QTLEp6tUelQyU59EXNpxhJ5tAEWtGCmFviA2vrkFNRam+jZKVfRicJAr3edZzeGH/DyOYR7DiPR5FmCJcOu4Dgju9xkZYhSrgLkXcyc477LedDvIMKSBGBqwzjJsG9+u6bqBh8jjY0sAUus3WsLl+kd9WuArbK+C3UwRX5bEdJTICKAEdkzbMMToVNBmfbvY9NG0o6uBdVLi34ePcG1uW/rYMBuqxwC+HGEc8Cts2gz38if2FE67crwUGGo9izzSjeL9mhOyiYc3xykbTNhUesCdexyCsqTzf7jt+Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heobK30ngDL/3+HSL6iQ+jib0obrtFWZMtnjYrtlEJQ=;
 b=jEPvfEaQThYDqLtP5fx62ckEj5+rO1ntbhOFLr3KaZ5muS6FfKSWdSk+wkZGZYgRFvi8Ix7xmmd19YvnVa2IrqE9SeWKjgOUywnV6YeLW5aJHXrNA5Lr2GFRnlPXn2ljbhNT/gRmSAWlgrR1AMXmout2dFhOyJSe2woBKUBSZd29DM7sC9TyTSq95ddhpF78WWdYLnCGNPx6TmmpkWfixL0fBQ3z9q8hEql2XzbP86RPzHzUOVlv2eidA4zdFo8ams0JauWyl09JdMC9O5DaVYqP5sn/SjcYde+ulnHkZDWzItbZT0HXn40kVOmbl1Ipqjgf+yTx1sFIq/2eLoAmXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH1PPFE5ACC0FD2.namprd12.prod.outlook.com (2603:10b6:61f:fc00::629) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 02:45:33 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 02:45:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 22:45:32 -0400
Message-Id: <DL71E7XXE91H.2YBVPT4X8V0NM@nvidia.com>
To: "Kiryl Shutsemau" <kirill@shutemov.name>, "Andrew Morton"
 <akpm@linux-foundation.org>, "David Hildenbrand" <david@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH 06/12] mm/collapse: drop the collapse_possible() wrapper
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <kernel-team@meta.com>, "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <liam@infradead.org>, "Nico Pache"
 <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>, "Dev Jain"
 <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance Yang"
 <lance.yang@linux.dev>, "Usama Arif" <usama.arif@linux.dev>, "Vlastimil
 Babka" <vbabka@kernel.org>, "Jann Horn" <jannh@google.com>, "Kiryl
 Shutsemau (Meta)" <kas@kernel.org>
X-Mailer: aerc 0.22.0
References: <cover.1788533997.git.kas@kernel.org>
 <e6780351a3a29fc1a9efb7d2fb2ef6d1466a50dd.1788533997.git.kas@kernel.org>
In-Reply-To: <e6780351a3a29fc1a9efb7d2fb2ef6d1466a50dd.1788533997.git.kas@kernel.org>
X-ClientProxiedBy: MN0PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:208:530::19) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH1PPFE5ACC0FD2:EE_
X-MS-Office365-Filtering-Correlation-Id: e357f15a-a086-4892-c985-08df0af7c1b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|11063799006|10067099003|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	h+W4S0XWuxWJmU9t6OPvlxmltYFbDrT3jm3wGxdFIsVxsxI9evjUffz5rM+yTifaXyyh4VVRSaN8qkqOgb1hc4PD1mNScUzQ2aiCE7x0il93IIoALKEDYq2dccevw7M4n4vMifVh6PHbP0N+ogOhwT1GTB2rJag/I2NIT4kWCBd/mpHSAbnT8xgRVFMuTi99QEWnn4hqCa6fp5GPI2/bc4lfVlh36rp7JlZ1w5ijgPAVm+FGjggcr/Yp5MABko83iDCiGZxMABj4zFEg1K1/zn49co/MTnn5g0iimYQ6NQVrt7vsDaNvQR5fetaNfMglF/d6RsfaJtU2YEE2OtHaZqVUPRXmMwqars//s3oxtTS0dFGis/4Qh1BK41zh29HjhgQ96QzVv9g5u/6XOz3kmPJgrbaNMq5l6kIHNxWL7XskI3svoA9X7w0XBoW8deeOTluVvZmQdm81QiZ5Yi6oSxmfuLgyQPGM5c4ciKPkfOLYcstoSCqWiNyvKm34r0rIcWiZt/mQoPTopXdi9H/JZf05VdwflnLSX25A0eAfmfldDounvSRSUyqPFzRCZGAN816BWOcGUg9r1L5Bz+mJA6u4CZLgjSR4jJ6eHQQL80br0fYzWTq4eFZEFJmYy47GVdKg01pLGuu1lafFZcr/fsE10/PBBgjBJI77d69tALo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmI2c2xTUnRWYzJwWHlhcHF6SUVUdWl3NTdmTmFmU0VkWjVqWWQxZEhGeVNk?=
 =?utf-8?B?VnFEeWxZbk9DYUxqa2w4b1c4dVBqeElmeWtZb1lFRGE3VFlFTk94OGI1c2dD?=
 =?utf-8?B?V1lieDEvMU1xWVpDOXhLa0NSY1BKb1dKZ1NKcGh3YysxUzMveUE0NXkvM3Qr?=
 =?utf-8?B?Tk5IOFFhc0pTM0ZQRzZqeXc4SzRFMkU2OERiV1RIU0VqR0pqdnYyM1QzdWQx?=
 =?utf-8?B?aSsrdmJOb1RzNzBwek9tUnRVTk0yWTVMckNtb0kxVi8yUWNodlVXR2I2WWdX?=
 =?utf-8?B?MUNiWDFOeStQUnkvV056cGJXdUdTNFEraHI0U1E0UXdVdGRmQXBhK2V6cHB1?=
 =?utf-8?B?bVB3Qkx4MThMWXdOM1RGUStFNFZWb00zRllPWk1lNTdNL1J5b2RPbkJqK2VG?=
 =?utf-8?B?aDBmT2lFTXZLNlBPM2l6NWhyTy9PM29RZ0RhcUJZMGZuYTZqdVNhbUhNeGJw?=
 =?utf-8?B?S3ZmUitTamVrY29uUkJKaURHU2duWEkrdjJ0R1pobWE5Q0dxdzkxUjZ6bFhp?=
 =?utf-8?B?eVMxR3VLeDBPbXdXZFdaL2M4VEJDRXVzWHg1RUJ2d2MrNFF6RklBOGNLbEZo?=
 =?utf-8?B?OVBPMnBacWd2QmwwNUJFR0J0eThUK3JiMXNkSGM1TUVyN0VsWEFKOFJsc0hR?=
 =?utf-8?B?eWVnNmVOWnNNUzFPbTI2VnU1MHFXZDVBK3N1ejIwK2Jla3FSQmxjUFlUUFly?=
 =?utf-8?B?R0wwOXJoNTJQVjIxdWd0YXBpR3JyVmdKNWRPUGRDK0xyMTdvZUExNk5QYXBx?=
 =?utf-8?B?RUIvR2F1U0kzZkN6Mk95YVc4d240bWYzNkozQ3QvOWNiS0wwWWVIaHRLcnRs?=
 =?utf-8?B?UHNPdWdQeHovOVIya3V6cTZzcG04QWtTYnNQakFXUHRFcGlxNmg1Ym1LNXps?=
 =?utf-8?B?MXpyMmpMRkR5YlJ4aTdFM3l0T20vSXRNVGZuNmNHMmFGa3dTalV1bWlVN3Jz?=
 =?utf-8?B?T2x0M3RZTzkrZ0gxcDh1ZXJlWUVyd2p2ZmJsSWc3bDFNOXZXalJweGF5Q3RV?=
 =?utf-8?B?V2h5dWJ1bmlpVzREK1grWWtVWnJSM3N1bnhlZzN3MVVweDFObTcyck05NzhE?=
 =?utf-8?B?akhZSnZ2RzJFWGsvTm95dytkUmVzcWFUUXluMG1IV2NwcWNkaG4wTXRJYmJx?=
 =?utf-8?B?T2p3UWRSQlhoVEdqYUliOXZZRFFIV08zdUQ0ZlRZeUUrYUs0NGIva1ZjUHRq?=
 =?utf-8?B?dGxPaEpRV3IzSmNkYzBKZldPR2U3WGVDK0M2YVlpTEhqMU9rN0doQzllODJY?=
 =?utf-8?B?NEZDK0NsaStrcmx6b0dldWZFeFZxa05lKzMwT3o2akhJNDBUaUZwN3hLSy9s?=
 =?utf-8?B?NHowaGRJYnVkVlU4bXFxK2VCa1U4ZEtiSHAxVVd2QUVrUXpUVktFMUsyTzZB?=
 =?utf-8?B?d1kvUnVJOHFUZC9rWll4NDQ0aUo3bncvVW5VTmVOc1B3NElBRWJWcDlnbjAr?=
 =?utf-8?B?V3dUT2wyOHFGMEp5NmZWeDZXczVJR1k4cWl3QURibURCaXJwNXRFUUxmM015?=
 =?utf-8?B?cWNwUURqTWc3cmY4UlJpc3JmRytmU3Z2T2phZGdyRnlKcFNrWTFUTmVmNTQ3?=
 =?utf-8?B?N3JNdjNSakYyZ20zMVFNVTNyV1RnZWFSZnp6K2RoME80ZjBZSExxR25HTktE?=
 =?utf-8?B?VTF3cE9ncFVhZmwxRnJZdG5nR2N1bitZNDArWnlUUkdzbGwzZnhJaDNxbGkw?=
 =?utf-8?B?QU5uSEg3UlM5bFR0ck43ZkFxcDM5VS9NcDh4MFBaWjFJK1RIMHpZT3VkTnRi?=
 =?utf-8?B?UWd6cWtKOFY0dkJQQTNpWnJXYzVySnI3NXVIWlJaZ3FKa3RiVUpHWVpBK3Jt?=
 =?utf-8?B?U0pkV0M4STZFTWlPSThTL3dqT3RSbXlVMXh1MU96dlh3VFBoMmNDRlIrUEhM?=
 =?utf-8?B?VU5iTDZtdzIzYTljQkViN1RiVzhNaWYwNktoNmZJTm9NZ20xTDRNa3pDN1pV?=
 =?utf-8?B?N3krY3phUEpzQ0RlMURIZktoZzRHdTgyaHQzMnhYZ3A5TmJCcHpyeGpPcjhB?=
 =?utf-8?B?Yy8vYXVVSmFqNk5leWVYcWwzWGJkTC9wdCt4NmdqSkFFUDV1bVR4V043a1FH?=
 =?utf-8?B?a1ZaMTF5V2k4SEhENXdJanIxcmhEMkdibUI1YkV2SVgxSUQ4RzMvZDk1VjlT?=
 =?utf-8?B?MG5nRlpXK0VmNy9MekFiOVY5aUZSQnBqUmRJSW9pQ2NKMnZQRG9VL0hURW1u?=
 =?utf-8?B?V2hmTFltakprb0Z0ajNsWTFuN2kzRFplVXlLOG5pSjBmelR1NDhqN1N1T0c1?=
 =?utf-8?B?ZXdPSkxpSkxpa1puMTlHdS8yUWNFV0kvOHdqYlN3cWtOSjRBaVkzSkpWaGpC?=
 =?utf-8?Q?tEpXH1HKjPXO6Wr4CT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e357f15a-a086-4892-c985-08df0af7c1b6
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 02:45:33.4323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NzpMS5NWvtN3/kDi6vVIeJDDVUK5o4LppeALRX+JrIK02Ht3+OajJxwsBLb5ui6Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFE5ACC0FD2

On Fri Sep 4, 2026 at 11:10 AM EDT, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> collapse_possible() only forwards to collapse_possible_orders() and turns
> its mask into a bool.  Its three callers can test the mask themselves.
>
> No functional change.
>
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  mm/khugepaged.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>



--=20
Best Regards,
Yan, Zi

