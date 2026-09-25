Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013042.outbound.protection.outlook.com [40.93.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1AB303C97
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790304293; cv=fail; b=mCGc0KHiD+HocDhJwjzCFGkM25ha9LpfENRi4t6830/zpGgrKWv3M5zFmF5xjR4yjJKY7l8uAGHFeymXg+FcRcusXyPTdWU9/mf5oc1+CxZcx1XsLmgOWxQrWxWBCbF4bnOHp4HhUz0X3Gdt8LRClSH6h0vb+j0+LZaf58sWMOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790304293; c=relaxed/simple;
	bh=gsGvYcZOY37UE0Z8R4VQoxRJFw0dAo4RDe+NqoUH7X4=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To:MIME-Version; b=XqxSdO+Yk7Thb3uM0bDPV1glGUXev/p4dmLuuEmyrTzTfET7ERYIJ4kDGQaFPAoQndsf/FpMQJqEXqIItbGte1dUcaKgvLo9UxZHS/1PLkczic4wCdTAyx+z8u2nqsvIwrGXGqhWw+Q2VkzQC9Vk9LtzP2tBZFLc+OtlT0tkQ84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=op358lV3; arc=fail smtp.client-ip=40.93.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="op358lV3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zm93Iy6ZYVvOojVlG3wrqDeeJ1z/9Kor3oXJSe+x9vFaxwSrKr8jTE3BlDgxY8jwbO0STLvruCHD15FS+sM1SVHS42F6yPHHH63lJDZ/k6HaGBCGaLxdv82DEunTrPKu5YzY7gyTnK41Khg7ZZCpvnPpuFC1c23OeiXHPd+W6NZiziyOLNM0hxGGWVmgukWXd2IExmLj+AqzYBeKA9Sqw/5KNSBjfR1McF78fcGUE56DdFXV5PdK9uRgvvenh7j6P/WIEEJD83P6Tbd7NiBQ6NpGPbh2vCpX3m42J17V8x5jrdl60Mrg+L2Yp3qtII4vjhX5SLU3xSwFDe3xEWp1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oD/ac/D6J0+BKIbZE7nTIglrsiPdFdiGbDxN5UoC+G4=;
 b=mwy2SkYfjk1k3Vb35PPj4/+PO87sRv9mD5ADrDweQhD/6vj95O+5oYoEe+j5JRqnETH7l1FDW8PbxwnF0kuCfE7hL1I7gp0NwvZuT+KkV3FTUU5+nxx0kpVZKJO/1wqcc7T5noUrakaHFMlmDZCtpUfR9N1lY3zAgGpMjIiHc+n6xDIQP0h8s99JNG4KaakNZzS/1ZqO8w14Db5ZLMHCDFySVuuMU84yBgATLixOdQMlr/tfBVbVuUpwBpfYkr5DbiEvsqDUAvDI3cukp10EHu36MQtQxIMXVhUpt4YiPZ5DDEs/I+9+nC4kjV9X/dh0SjWRNKe7Y1z4f4jt0eSaxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oD/ac/D6J0+BKIbZE7nTIglrsiPdFdiGbDxN5UoC+G4=;
 b=op358lV3Pvjy8NKL2jt+NyUJgrn7oK7xJKkpfSGdTxhi6z/s3YGZRc++iqTG8DcVnxWv5TS9QuOSEqNiyN/2faZbgunhhfIZMChDw/d9yAKV4rU5ouTWpVE6GcD/w9gkxle2XKsRPMV+GAVtE327J/Bt8DQ4j+0OlhaqPyPBN/6nu4Sm2nEAPttc03EmKmlGmNFoVEjSGgfia21FIgdqtZ/ZjoZ5EWF4Ax2VxJTNvF+8sJTBTNl1PnZ+XuGBJTU/eSFDGzss1igG5h6uq6ZO2dC+SmirSTjEkIEHpDJhpY5esVHPzD9bH+CgJqI+Q/Ais7mkZ6TKY35fdXbRZsM/OQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 02:44:47 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 02:44:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 22:44:44 -0400
Message-Id: <DLO1WIACYFWF.3N01DXYFJLMD0@nvidia.com>
Cc: "Ilya Gladyshev" <ilya.gladyshev@linux.dev>,
 <akpm@linux-foundation.org>, <andrew+netdev@lunn.ch>, <apopple@nvidia.com>,
 <artem.kuzin@huawei.com>, <baolin.wang@linux.alibaba.com>,
 <Liam.Howlett@oracle.com>, <edumazet@google.com>, <harry.yoo@oracle.com>,
 <hramamurthy@google.com>, <ivgorbunov@me.com>, <joshwash@google.com>,
 <kirill@shutemov.name>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <lorenzo.stoakes@oracle.com>, <mhocko@suse.com>,
 <muchun.song@linux.dev>, <pfalcato@suse.de>, <rppt@kernel.org>,
 <surenb@google.com>, <vbabka@suse.cz>, <willy@infradead.org>,
 <yuzhao@google.com>
To: "Linus Torvalds" <torvalds@linuxfoundation.org>, "David Hildenbrand
 (Arm)" <david@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v6 3/3] mm: implement page refcount locking via
 dedicated bit
X-Mailer: aerc 0.22.0
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
 <ebd6540ad89a4bb80e2a62d00901b5c827315b66.1789239015.git.ilya.gladyshev@linux.dev> <DLFJL5U9DI6F.3QJP9YP0KX636@nvidia.com> <56e036665dbeb0a8f51d697220d5ed84f210994c@linux.dev> <570cf649-a8bf-4073-be71-207fbb2bef40@kernel.org> <CAHk-=wh3LLDV2AMZn1PZcU1o3Na-BNcQtP=LPXouLKPZWaiRdQ@mail.gmail.com>
In-Reply-To: <CAHk-=wh3LLDV2AMZn1PZcU1o3Na-BNcQtP=LPXouLKPZWaiRdQ@mail.gmail.com>
X-ClientProxiedBy: YQZPR01CA0157.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::6) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH8PR12MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: bd19f3fe-3509-4fec-1398-08df1aaef645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|6133799003|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8GfHS+fRMZ28I7JjQ0QzXnSqG49l8ieGDA5m2mxSmao/qfwJ7P1J8VpaIXIF9oiLWgVy0iF+FyuLODshWbFKzK0L13ULUPnPsGZLGo8CWEZXrazAPQoNHkEX3piaZAxqBmnbu7v/iCzLk1Tq5nW/QuW1BDZNl5x6Igfzm2MFY4J4UAI2S054nszsLtkTajdHf8AQ7lWxm2y2qtW497ffKtPTpu0aqiCmSkgIf1roiNWxrmoIA1SaDr9Uez5K260m22jLo8hKPvQQrRWNNKQR8807o0m1uHOrPcaUV6N4wG90Zbwf9bWv6SoBuEp6icJav8O1mc5aUGW2niYlh3pzu30KxLvgOVH/N1iKUCupzxDbiUQFmSsEGTtu9jTjCvammikFh4alUXY+Jo7i5jrhZOkpn0PLG7ZsJ/My79rQjtsTITRwrtVzxyw7TEiuTdFMgC37T4yJ87Wv4Gnuq6txGXpflvvdTkC6yfseZUmfanoo8AnIl7zXopKbCtvyT2vQVszQ0GREdEatNHYKpNwo+59dgUsWpoWyVEz41L5MAlDhh69Cb0xCzj34lOFphBBjQXTyta2swzmJNHVdEcCW4oTgYK3jj2HaYoSPnWxfc6zLhnqZs34nuFUqJF08+mymS+HL9GtoJR6R3AYJmt2wEpNk7Xb8cVKCQrhVe+tbN1Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(6133799003)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWN2SjJkb0VVaGlMVldaamNFWUdPa0hFTFpsR0NQSVpHc3BmN3NLZkhRS0wr?=
 =?utf-8?B?eFJnSDlMRmVpM1lGY1g3TTY1SklxV3JCdE01L0NtcCszbzQrUmJtWUduc1Ew?=
 =?utf-8?B?SnlZRWErNStaamhrNHRqZXhDeENlTU81S0ZQeUdqSkZubmhnMVdGcmdnMDZN?=
 =?utf-8?B?eU1IcEZLa05DK2FWOWcwcUJVekEveXNYSXA4aDNwcFRsMkJXaCtyRWJMNFNl?=
 =?utf-8?B?STB2ZExqcFhhb1ZyNjZVTTFLbjRtVEZoa3dtV0E2VjFQRkdGWDlKc0MvUWlS?=
 =?utf-8?B?QS91UzBTZHZzeWwxYy83ZHk3Qk5GRlN2cUNZNkh3OG1JR25EMGo4QU41WEJm?=
 =?utf-8?B?Mko3Z2ZlWDF4YjRNbmFPSWoyeEl6TFBlVFJVRG1sRWhhVXZrUE4wbXY2TUJR?=
 =?utf-8?B?Sk5SYXBVdnNkWWtCd1dNWTRNR1E4eWIwc0dDR0lBTDgwMHpzMm9aNHRzU3Nx?=
 =?utf-8?B?NzA4UEpEOUp2NnhaamVTRThWVURkMHNwZmdHMlpKQ2tPNm5hdHpCVTI2bTln?=
 =?utf-8?B?L3pXS05xZ0w5QUxyUElzZ01HTE8valJjY2pTQkRMZnlvd0lnay9VNDRaR080?=
 =?utf-8?B?TGluNHFBZXBLVjZBUHRuK2I3SjZFRktLaVZxZ0NEZ2toaE5oYXRTTTl3TzJY?=
 =?utf-8?B?cWl6eVJOTE9xSHVUVk56MHlzNlExRWlCbW9KT1hvOVZ6dlA1R2plUUlYRFVp?=
 =?utf-8?B?V283M2w2elBHZlcweTQ5Zms5em43WGp1eTVpS3FPZ0p0ckxSaFk4alZnN2ZV?=
 =?utf-8?B?S0N6OUFYWnlBRGZGY296eCsyd0lhVUhFTVFrWE5vVktiR2NJb242YktKVzRN?=
 =?utf-8?B?L0Z4VVo5dktrRmZQb04zekVYVHVMNjBGOE1nVmRhWlAxM1k2VjZVaXpGT0p2?=
 =?utf-8?B?bUljZzBIS3hmUjJOdnBEYmhLczcrQ3JSUkl5bkJDSmNJV2xEdDRCbWpOWmpE?=
 =?utf-8?B?TG5Bd04zK0dxdVllRGJoaHl3c2g0UEt4T3prdy9WMGZoaytOaW8zQmsxTHdQ?=
 =?utf-8?B?dVFKQ1pscnBia1ZiTWRvdlFjaXZmL0UzdUFSSENUbStpdnBWQWZwRzdXd2k3?=
 =?utf-8?B?L3VzUHdldGtndVJHbkZtQzdQVGpBN0xuU3l3UzhrZGE0VUx4L0dzUGU1dUhF?=
 =?utf-8?B?aFJEWXhwSFZKemF3b01NVzZjSmY5V2syNVVhT1NiUXhpc0VaV3lEWU5tYXlh?=
 =?utf-8?B?L24wUWVOYnNqVjM4L01HZ0llMkliUlF3NXBrQUFpT0NwZ0oxM1U1L0VJVmJ0?=
 =?utf-8?B?SjkrUUNQOEpVY0R0SCsxYzdEcGxCQS9seThQeGk0L0swenMwYnhWM1JYcDNa?=
 =?utf-8?B?SC9IV3poNkJzMExWcDFqLzh6Z1JJUVZua29FcjVkWE9pUVp6UmpRMWF4dVJl?=
 =?utf-8?B?dTc0bHFyZjR2bWxUQW9DN3ZwNkFtamxUWHBWZk0zNVRQZmprM21BZ2hBdnpq?=
 =?utf-8?B?d1BQeDlVVktIN0c4aU8zRkFsY3V1TlR6bTlNeXlZcjhJbkgvTFJ5V2hxM0cr?=
 =?utf-8?B?Wk1jOTVaMmRXV2FkWklyYjdLL05Pd2pLMXFZVU94Ui91MlRGSzMvckVjS0R2?=
 =?utf-8?B?alZpY1czbklWeS9QR09pS092Mk9HWGRKUmtiQnlZZjlmMVVlKzA2SnpkanVZ?=
 =?utf-8?B?SitLa2x0S3F5TDJHZmd6ZWtkbVpYK25zNjVDcnJ0ZjJiVUVlUGt4YTcrQXNx?=
 =?utf-8?B?N1VtRVBuNHpaaFFXR0hlZ2ZSUExYdjMxUlhZbEhBbFRLUzNNVTJRUUc0ZnUy?=
 =?utf-8?B?cGpSYU5sckcveGpWRHZ6MmhZckdibnpFZVk4YnprZEl2MnB2cCt5bDJzeUtI?=
 =?utf-8?B?R045aUFjVy80M3dRdHNsY2FuTllhVmp2UVc2azh2cjBmQVZaanNtUTVlN1hL?=
 =?utf-8?B?T05hOGJmcUhqSHlJLzZMQzcxTGY4VnhKTkM3Q0tUU1V1N1RoY2c3cjdEaWhu?=
 =?utf-8?B?Y05SSElpQzEvVmVwMVpGS1BPVHY0a24vTGwyOWFXTWlZNit2NFJRcjZIcE1E?=
 =?utf-8?B?NXRpbnNXdFZVZVVmZHpmM21HcDV5RHkvdEtGbUMrYXZ2N0ZqTVhlaGI5VitI?=
 =?utf-8?B?a245SU9WOE83TW5qazE1djR6cDZWTHowTFVIQmVWeG5ZODZyZjZDeFEzWXds?=
 =?utf-8?B?SFdRZUhDNnQzbUNIUUVEcXd0MDAxWndBdWZNSDRPdndqdjhUeVJGaEQzWFFP?=
 =?utf-8?B?aWxLZ3pvMFFvK0tMTlF4N2RlSGlFa0lDZURXQmxhVHp5QXRKcldRTWllWTdE?=
 =?utf-8?B?YXNHciszVnN1OE5KQ2lFOGJieHFnMFJwUlpOOHZhcGdKcU94NTV4bHFWSTZF?=
 =?utf-8?Q?hxAKFIr7QwDG0muVPg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd19f3fe-3509-4fec-1398-08df1aaef645
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 02:44:47.0521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAI96qAGOIjYW/aJWvxpG9cKiRMwbt+5QCEnfsmy0UsS04K69TcOhOB/nlRvitj1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6914

On Thu Sep 24, 2026 at 4:06 PM EDT, Linus Torvalds wrote:
> On Thu, 24 Sept 2026 at 11:52, David Hildenbrand (Arm) <david@kernel.org>=
 wrote:
>>
>> There needs to be a common page freeing function that dipatches stuff.
>
> I think this all needs to be entirely generic to all pages. Agreed.
> Everybody needs to do it right.

It assumes all callers of page_ref_dec_and_test() are free page
functions, but there are two exceptions:

1. compaction_free() uses folio_put_testzero(), which calls
page_ref_dec_and_test() to put not used migration dst page back to
isolated freelist instead of freeing them.

2. virtio_mem_fake_offline_going_offline() drops the last reference of
fake-offline pages, so that they can be offline.

They will need to be converted to not use page_ref_dec_and_test() in
addition to a common page freeing function. And any such future use
needs to be banned.

>
> But I think that in the scenario that Ilya mentioned:
>
>   Refcount operations as follows (FR =3D FROZEN):
>
>   A: DEC 1 -> 0  [ page_ref_dec_and_test() ]
>   B: INC 0 -> 1  [ folio_try_get() ] =3D> success
>   B: DEC 1 -> 0  [ page_ref_dec_and_test() ]
>   B: CAS 0 -> FR [ page_ref_dec_and_test() ]
>   B: * deallocates via __folio_put() *
>
>   C: * re-allocates page *
>   C: DEC 1 -> 0  [ page_ref_dec_and_test() ]
>   A: CAS 0 -> FR [ page_ref_dec_and_test() ] =3D> success
>   A: * deallocates directly via free_frozen_pages() * =3D> BUG
>
> the big here is that the de-allocation was done not from the state of
> the *page*, but from the state of who finished it off.
>
> So that
>
>   A: CAS 0 -> FR [ page_ref_dec_and_test() ] =3D> success
>
> is not a problem per se. It's a fine case of "we had one single unique
> final free".
>
> The failure is that A then goes on to do that
>
>  "deallocates directly via free_frozen_pages"
>
> because A mis-judged the page as having the old stale state that it
> had  when *A* was using it.
>
> IOW, I think the soluition is either:
>
>  (a) every user of put_page_testzero(page) agrees tro do exactly the
> same thing and there is no difference between how that final
> "0->FROZEN" is dealt with, so it doesn't matter that A is freeing a
> page that C allocated for something else
>
> or
>
>  (b) the CAS 0 -> FR state sequence always looks at the *page* to
> decide what to do, never at the caller state (ie A will look at
> whatever C wrote when it allocated the page to know how to do that
> final free).
>
> Hmm?
>

Just wonder if we could make 1 -> FROZEN atomic to get rid of the gap.

--=20
Best Regards,
Yan, Zi

