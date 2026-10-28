Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793196034;
	b=uiyJdM9T/dFSSPphH25NOW61LjiKaEBZQtX5mCSUJ9mQtulrK5py68TD0NAt6yFMtoPy
	 kN9QDKN2lWaXu5ikQmX2Er5lMdykl5rD1gY+rEHHemOn+oA9tvRfEk/1PpnEm0ogAkijd
	 cov07oLliLovdTGaDJeZGxsueylrLCbp5Zq+0znuZzCX7MDt3NKdxklwNIMze2WMkY9ur
	 /AYSIZ+Dcai8DMKNkTDeuOWmaCdzixjLFDYfFSBmC9FAq3am2LjJa5HfuhaIhzpuOjAS2
	 0ehMhSljtWbpjIBYM0uiPAZSdPea4e3ZePzcdDHqEacn7i6em1Ckyx0rlNa+ZvBDVGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196034;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:X-Mailer:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-MS-Reactions:X-ClientProxiedBy:
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
	bh=8y9xn6Yu1oRWAftqzyoraLKXUmvic9ds88bl1dOwKR0=;
	b=sFOnudxNS22kDEA1gyfG3pK0TzQXI+choBLstu2GAyxiLKnBrkKJREHV1GaIuCbmPaP4
	 Lz+ziwol+f6BeSn5dGVMQnwx9qF/8WFywLdDilYpcOTPdFNFyHG8vuJVF83Us9pV6V0tm
	 CyTXBIPRuFABhzIbLOXJasfYb8+SrD5bqitKaf7fPNZUdy6XcBR1DeBZyCZlwC7jbbHBn
	 y7xpnrqdvZiq0vH/Ivpn7Fjk1gwVZq5xFRP5v+rCNBPa9pH3zofSNNdFv3383G1NHzjYr
	 ZPKaVIJhBy4ljV9MO9s4slO3x5rzptfezLlE6JhQtb8mQF/+u3j52jpN3E1/qrRchCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nmK2sIs9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.69
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010069.outbound.protection.outlook.com [52.101.193.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965CD606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 965CD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nmK2sIs9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Or2Uj4khw6mAx7NcMFQCG++j5pn+UjQ1uPsTxVbtIB5lgfZYGyUHULWduUvE+ZmzlnNqUnrohfDHRtad7B5MM+PgIkruZ8xcwNa5armM6etRAV/Ny2adTdFyNu6deHrsAp+zbHr4n5f9KO7DLGWUeqb3fnllWkpW1BeoWwLxFMbGBHkFQhufjaR3z9svAZkJQ7blt6+WIwReN51lwJpPRD33laR1Lz2SJQBc3W0oQxPad0Pcdn+JwcE3iDf4tur8ZsJFed8sUsoUXAWCZt8vEGSP8Mjur4lI/752ukCx2V7T5Nm06nUk8yGXBdevsi4SyH+6kBgz/O7pjF4Cx0cGMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8y9xn6Yu1oRWAftqzyoraLKXUmvic9ds88bl1dOwKR0=;
 b=dmhXGdPA5yQhN0AYQO2ztMrhCledxAdfRILgqH8kLcULidISAO/kS25osLJhgD9sG/crJprXuxDJdCZej675W/M1RYZzXX4LZIB3fz5xAnF56rJ2WJslfS05ZwTmPd5YxHM3dPqk58IPsAEDYoNQ0GFpaQg8mUE/9/LHdNjq9y9vwxf4J/FixLQVQQuPFFtkTht0cA3W19+FL/0+zbpHEC1ytVHOhLzGqq0PzqozjnKG39QD17bB8m26QdDarXPXLq6brgfPEtBmcvlvUJQbo2mdvTSbF3eT2bVWLLGmZlEdyd1kT0W4XBoMk5NpXgWjHfLRonM/kNh0NwNUrpzJrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8y9xn6Yu1oRWAftqzyoraLKXUmvic9ds88bl1dOwKR0=;
 b=nmK2sIs9dANX1kIQQe8eRVlEzVe9neJQlylHh93yF0DuZkRvvkIC7CBQUGhxRLAq/04cyZozgVqtyqZc09aCW17Fsvf1d+NPMoV+3WHX/fse+3gw1B+jRYa9G8IGAetdwdx7OkLQR0SrpAwFzk7mK/o3GVds5/efI3th0O3AbRuKYWYNkj36P33MsSD0Nt+hgPYCrskqWQe1e6JUF4cKbL0mnpKuHfJVHhfcXKfCYZq6Oh7W0NLuxS+oVT0iByUc5E95CGdiV4oFgpjqP9ybLmk3Hc8hUDmcCYKHIxhoL06hNhY86yQGJVUk88DVvZOU/qWmlNQxV+ixNliy0e36qA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by LV1PR12MB392019.namprd12.prod.outlook.com (2603:10b6:408:514::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 14:00:29 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 14:00:29 +0000
From: Zi Yan <ziy@nvidia.com>
To: Muchun Song <muchun.song@linux.dev>, Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Frank van der Linden <fvdl@google.com>, Michal Hocko <mhocko@suse.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Chris Down <chris@chrisdown.name>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: Re: [PATCH 2/3] mm/hugetlb: preserve CMA flag when returning folios
 to the pool
Date: Wed, 28 Oct 2026 10:00:26 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <379883F4-4F55-4206-98DD-CB10D5DAF0FA@nvidia.com>
In-Reply-To: <0005A5C9-47ED-45EF-BEA8-2693DAA7C46E@linux.dev>
References: <20261028113319.38544-1-kaitao.cheng@linux.dev>
 <20261028113319.38544-3-kaitao.cheng@linux.dev>
 <0005A5C9-47ED-45EF-BEA8-2693DAA7C46E@linux.dev>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow
X-ClientProxiedBy: MN2PR08CA0007.namprd08.prod.outlook.com
 (2603:10b6:208:239::12) To IA0PR12MB8374.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|LV1PR12MB392019:EE_
X-MS-Office365-Filtering-Correlation-Id: 00893eed-180c-49e0-5202-08df34fbd2cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|7416014|366016|261026140227099003|4143699003|261021121427099003|11063799006|56012099006|261009223027099003|261022105027099003|261021123027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	3cDSln/TE4Xtb7iuTek8vSpu2tm6ET36f5WlQe1daY3zXL7Lwhfs7TwWrvBz+bT9AVwRz6vqCZfuY0rx7bCZqCnLOHaFz7IbYRodrs/mJ2/f10VXJfYdLoPX/WhnDrZXGMKVVRAszapsReouJ/EhDQrFKsihHkvdoDTzx7joIsLMp6/J/HJ3N66tcryM45Hmruh1/cbzVoNxc1j5HWww3KlacgLN0pDQmd26DGvWnHrEFtv4h/UcOkVneSTt8Rumqro0o+EGguoZObJv6yPIlv7xGFjcFaPALzo/y3TeSmNfH840PlM2uN5A5pFrYyTf1HisVbFNy7Jc0eV/WjVCmwHUb8vJz7dGGimYmi1BaL36KWKdnOrMySsCbC2ShW2Mm0mjxS0EpPDPSDBpQ1iUOIadEKzaO36Fclolr6vfnLGfsbpcyBCDW50t8yDvuUg5lOtMWyOFU5RX52asCOSE2Cnif3sEhALwee6sPOoNXLwA9JTNevcvjJEOF2l19vdlIItfi02ZsU3N1tUO4lBEaBfTSTQlHRiak4tjJDdC8qADpCDZSROv1/2IOLSGYv6SRoJepcKQQOmei37T0ctRd4Qi7ktb7iC8P4lhZFx7UG4P0aqqe02pMYpHEuIknVkcWaev+4L9OOprRgYMPikaRhAPFTEjDzQhkTweryfkT+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(7416014)(366016)(261026140227099003)(4143699003)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021123027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zXEFne5c7hFViezA+/eisHTEC79Ya6gzmyNx6s9WoCn5/4QveTAljwSK9ux8?=
 =?us-ascii?Q?4TfVAe8uSF0GRDvhr2TuIIyt9EtXKE8oOOQdOKj3+f3nKgCsQFINJs3cbHti?=
 =?us-ascii?Q?Lro6jwDUhHyb3N8cdepahNTfNqxKkaxSPFfnX/qR0VjneB8X5TFn2EB5ljma?=
 =?us-ascii?Q?SrFUl4iyYwHHBY6Hc03/ei6wNwpCyXtfwwug4T+crrelnp3uy1NYyT96+JEt?=
 =?us-ascii?Q?K/ME20nA0oXTU7dmD7kYRBGDicGmMvfnGQSXMg3a4GWxEFrO6qS8r2IIqb9r?=
 =?us-ascii?Q?WDfzH7PiLqdEnEzp/f1dUIjIz1NDQhMs4M/QvpRRSgv5QIJbvkiUDlSD8ZO7?=
 =?us-ascii?Q?BgBwRLaZE+OQY8KDxiyj3zmlXEN1mwt0nSvtdqJd9DPtKp0SEGignXLz1Rjc?=
 =?us-ascii?Q?bSNdhdRGjRAhK1sDFAKRiYIxIVHodQgpxkChxjTbmz3sv6cMAcL6/GQCCfZx?=
 =?us-ascii?Q?S+BR96tY6DXbkIVBmiFlTabhuCgkI0tJtmMw0+dWQKY6fx45FLy6YzWeg21x?=
 =?us-ascii?Q?IyQBTW0mSK6s9oMAW7S22nVQq4Clih+IaBFZC55COFr1N6fphI533+pXyTHA?=
 =?us-ascii?Q?I3LXHXjINfUFZlPakKG0HnWMLzDPwB6CMkYxajjfJxRSm6ze0MW6ei2dzwsw?=
 =?us-ascii?Q?br6cC0FGXcOciLtJeklsdgrAzJcxspPQmx5j9yg+8rdG1HJQPZfa150GZHT0?=
 =?us-ascii?Q?7UzODhwimjLerE/0dl2Q4da6YKCIiQlsQY0NIL+88YrfFB3d/e/N8oZY+vG9?=
 =?us-ascii?Q?incAyyej2ZvGaUppqlkXVp+HivTjvs9NVnwedc+IY6MirJdZa5uUdl2vL4eR?=
 =?us-ascii?Q?t6VFhLGdpl6MWDNBYWvx9VV6GhRvcjHeOApSOR5Y+4BwYuor7RMTO4V0C4bD?=
 =?us-ascii?Q?5KtNHarC41Mp59cf7ReJ1seQkGXCqsBRfKQxUaadabpalKbLLrr9fcvUPRNU?=
 =?us-ascii?Q?dYx4VUKDs6nxGKm9V1/bHSn9+OW8jqpgCT82Srzi4ByYFgDBuo2IoA2t1boq?=
 =?us-ascii?Q?TO1dD7ScyRrM+hp7+OV1wZqGjhgKtzMJ6jbxyBMcHthurNmhgqs5LQq7UlsB?=
 =?us-ascii?Q?Ek9GzLcO0F145Vc0ItcVNZXearxTZnmuSRm+w69rjKeagXH6U9qHgQFjfyKS?=
 =?us-ascii?Q?705U9o6GsU3Uf+ISRnksGATkFeOxGjh+ifABk+Uj5493rMk+Oz0utEVf4WfJ?=
 =?us-ascii?Q?ZLa/OBk9wl2xMX1bXOo/IMPxmdWkQyFDe5k8L0SdcUkAwWzZgeSR1qWpGqZ9?=
 =?us-ascii?Q?qPbWP0UMZ7IV8Pt0OTNFPpz3DFfBJfHkCxV/rxumhceDLeVPsZ5XXS/DWsRz?=
 =?us-ascii?Q?K/RdMxnEKNpyXACJ4bt0cOh5EaGF0a+RIv7DDs8cKZW/HwBDLv6jf3/ziL8z?=
 =?us-ascii?Q?sBu2WMHGlf7kiFK3HrGsWEx1teAFh/kR6AW1ihmPH8EOs843gYm1xnzLFaOd?=
 =?us-ascii?Q?8QDAOzJ1R3pzPS8V9TZcm5yUupYIA9LbsvoByIqIexA5oD2AHdcM619A2tCG?=
 =?us-ascii?Q?5um0/mv2ZPsfYCEazJOFQpZRVILo2/B9XaDzgEeG+of9AFxq+ydsuMdvmDBg?=
 =?us-ascii?Q?VyfbLELRfNIldCLVytOV3nCBHr/pC0mf5rscnxxhNKBitlZJ3k6x9/cNIWTd?=
 =?us-ascii?Q?XeyCG9TvgbOhNq5xiCEPT6owgmff5NLNYVrRUdusdD7i/xZ9fIy1FG48feuR?=
 =?us-ascii?Q?iS1GmWrz5yGbrnJIGteEOWAmKZ59cywMk3YRJcRqeDZgRJZqnF9nY6JBOgQM?=
 =?us-ascii?Q?MDsJ5aUYWQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00893eed-180c-49e0-5202-08df34fbd2cf
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 14:00:28.9968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wasY80EsDgZuZNXw/uLEFoszTSkrVUsqvCLEhI7sVKXtIL0Wgis2vE5jR5G0g2x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB392019

On 28 Oct 2026, at 9:56, Muchun Song wrote:

>> On Oct 28, 2026, at 19:33, Kaitao Cheng <kaitao.cheng@linux.dev> wrote=
:
>>
>> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>>
>> When vmemmap restoration fails, add_hugetlb_folio() returns the folio
>> to the hugetlb pool. It clears folio->private and restores only
>> HPG_vmemmap_optimized, losing HPG_cma on CMA-allocated folios.
>>
>> A later successful free then bypasses hugetlb_cma_free_frozen_folio()
>> and returns the pages through free_frozen_pages(). The CMA allocation
>> bitmap remains set, so the range is unavailable for future CMA
>> allocations.
>>
>> Save the CMA flag before resetting folio->private and restore it along=

>> with the vmemmap optimization flag.
>
> We already knew this issue. Cc Zi Yan. Seems he hasn't sent a fix.

Thanks. No, I have not formed a proper patch yet.

>
> But we want a different solution. See:
>
> https://lore.kernel.org/linux-mm/A1A14368-7A43-40ED-B2AB-C2EC2C5FFB1D@l=
inux.dev/

Feel free to grab my version from the link and add
VM_WARN_ON_ONCE_FOLIO()s Muchun suggested. You can add
Suggested-by: Zi Yan <ziy@nvidia.com> in your patch.

Thanks.

>
> Thanks,
> Muchun
>
>>
>> Fixes: d2d786714080 ("mm/hugetlb: enable bootmem allocation from CMA a=
reas")
>> Closes: https://sashiko.dev/#/bug/linux-5363eb09-9c3c-4f8b-9f3c-a998a8=
c4b258
>> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
>> ---
>> mm/hugetlb.c | 5 ++++-
>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 4a008afaedf9..8da4bab676c9 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -1437,6 +1437,7 @@ void remove_hugetlb_folio(struct hstate *h, stru=
ct folio *folio,
>> void add_hugetlb_folio(struct hstate *h, struct folio *folio,
>> 		       bool adjust_surplus)
>> {
>> +	bool cma =3D folio_test_hugetlb_cma(folio);
>> 	int nid =3D folio_nid(folio);
>>
>> 	VM_BUG_ON_FOLIO(!folio_test_hugetlb_vmemmap_optimized(folio), folio);=

>> @@ -1453,9 +1454,11 @@ void add_hugetlb_folio(struct hstate *h, struct=
 folio *folio,
>> 	}
>>
>> 	__folio_set_hugetlb(folio);
>> -	/* Clear all folio->private flags except hugetlb_vmemmap_optimized. =
*/
>> +	/* Preserve the vmemmap optimization state and CMA allocation origin=
=2E */
>> 	folio->private =3D NULL;
>> 	folio_set_hugetlb_vmemmap_optimized(folio);
>> +	if (cma)
>> +		folio_set_hugetlb_cma(folio);
>>
>> 	arch_clear_hugetlb_flags(folio);
>> 	enqueue_hugetlb_folio(h, folio);
>> -- =

>> 2.53.0
>>


Best Regards,
Yan, Zi
