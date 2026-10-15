Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C152D3C1D42;
	Thu, 15 Oct 2026 16:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081045; cv=fail; b=iLXC25zmISDD47jJ/LVCLRxCUwh7AUvkrVz6FSzxbaRSJjNc2njb+LPAcDmQ9GGn1jzQAhyCjDIn2/I8PY8iRL66BQn6+xQNRsRsiN8Qb/3KG0L4ExzedO4IM0sl8Vw23B9jRi2KV+AGgg8EmBdT/yu3qCuXkDlJZS/4ycHtJZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081045; c=relaxed/simple;
	bh=BhErwhm/zmXfYTqeXkKD9EK1GjsE9PuXC427R9ao4rg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nyQVqfsk0ZjwnPT1NdSK0iEuSx+K4f+Q7nv8m2f3qyKa7mBsrfYKZ0A+qNqeLdT5u10r7SvaM7V35TnBHyVgDZ2++Uz44hrT1+F6Gz7Azj6PVeX83e1LwXa29+nnDMJlbsNlm8KCfQ3egRrBPR+qyjsKjrg6FF83WC43pI3UhEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dPBYtxYa; arc=fail smtp.client-ip=52.101.62.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dPBYtxYa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLQqJwKVOyVe+r+ApbdgL3uwDK8sS+eY8tqRJNSpskuJJAuzAnkmDvdaWiY295LlTuva1tOCsm1v5oMnAkdFWl8jqg/d8rReeTF/itloks2AFEQVuJLg54fUXSWlQk7J9ReWNOyrg+ASRL3oNgcLRkTbI6Fs6u8XHdY9x4RFAsuU2qD/i1Z9iku1V0WTUPBzXxmEAF7OJm/LgmiO6WV6GWjt3XQyvCVpniopeskFE45LvhTqQW3px67ai7VMuy3aRZDtzCdqK/5oxZq2INc9ft/4p6qHy1Yw9SodRy8prxJ7oMncDMTT6nJJbzp8mQycI4thUhFDzSuWGl4g3JG5hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3Cv6fGJH6C2oyCtrbYwZiDSqVG8tvi8cbhrQxFM4Jk=;
 b=vdxqgyRnt3P7jmM2X7H1IPx7aEQnvN2snYbaE8q2fgQk+VBAhSqtgiM/II5dgI+cIHJbQ67Zsy+gLtkN+4Kx8W/xQStsBwRhEdYFX7CwLRPPdixTTU4gTsqWpCI8mAsVY1vGp06LUPtWEYFQLyb7VWgyU7Zf9hNygIu5a/FG1YUZvXdWL+Wts2+/P7zdHBPp3n5XVv3OJAD89M4fjepL8J/8/Tlapm3NhJ+ofPD49bZ4acsXd/WN/CJsFMtao/ulal1ICzB+e0UQQULCUfbhQNVm870PMgekvCbtd2YPsSo+eHYwonVZtMelNjhtUBOP/aZoYdTLrCy7RdrH4Vnl8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3Cv6fGJH6C2oyCtrbYwZiDSqVG8tvi8cbhrQxFM4Jk=;
 b=dPBYtxYa6VYmezjMsKXzrxjiZloMv4eTLFxQrtKiG8+TgxiXo1OrmSJeF6ew5xbFS5JVN8WBVXIFVKfUybHPKub/zLd8ZQRv7FQpKZ6KSEB+bQREokfzJpTxlLCtBYssk5Wcg6PY4zqTBm8oQj550ri4yZDYXBLo7RkpanYhZqN9Pa/q0vEbEnXrqtVMVJpGjjklL7TpRhKNQlEVlFcNyFKo3WNwYbne0p7Ghb2z9i5LEaDT1yZCqsMrx9P1Od49KdGbVF/Nt8+jQMeFbLyzbNNlkYGE9icazc8nvoAdLWXeH1ArvPq4bkzrpaiUdfqBLId3IpX/jWHPRUHRVG57MA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6802.namprd12.prod.outlook.com (2603:10b6:303:20f::19)
 by DS4PR12MB9681.namprd12.prod.outlook.com (2603:10b6:8:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 16:16:49 +0000
Received: from MW4PR12MB6802.namprd12.prod.outlook.com
 ([fe80::51f4:a3d9:b44e:9587]) by MW4PR12MB6802.namprd12.prod.outlook.com
 ([fe80::51f4:a3d9:b44e:9587%4]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 16:16:49 +0000
Message-ID: <26103c38-7b22-4176-8bc3-63e4b8fc6bbb@nvidia.com>
Date: Thu, 15 Oct 2026 19:16:40 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: stop recalculating min_free_kbytes once set by
 userspace
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Brendan Jackman
 <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>,
 David Laight <david.laight.linux@gmail.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261014140859.1006967-1-noren@nvidia.com>
 <20261014144823.8c89da26c547fa95936a2fe5@linux-foundation.org>
Content-Language: en-US
From: Nimrod Oren <noren@nvidia.com>
In-Reply-To: <20261014144823.8c89da26c547fa95936a2fe5@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::22) To MW4PR12MB6802.namprd12.prod.outlook.com
 (2603:10b6:303:20f::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6802:EE_|DS4PR12MB9681:EE_
X-MS-Office365-Filtering-Correlation-Id: 382cadd2-8808-4c69-b472-08df2ad7b6c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	lbYbm+7HMKbjUvPIETxkCYOFReqfmX1Slx/Veod4b80ax6tCMhzu2LBhDQWCJ8z6oYdxQ3PrCb2A0sqJvZG8Tg6BSnn/QIWbe3N5ovW3VIWsLwz7C0UFoVecKqrP6fovpliz0adn/ZP0rU/CI0hNJTyADhRl4lymZ7e29XuxCMFtZf9M6B+xsUvcHwI/pa0aVA1mFbfXOTs2pdpCGwy7nbTAFKWMKCVOpCN+lFtUiL7xULRm6OrwCRJ5UqDt/vfDzxnUKVOzvEGwhuhm1KtVGACJtKwoEyPLcbeLADlMqSMWX8aBgSrrJILPrmuoKXixennFgkWC+zE8bzGMtW+XO6eUNaGOP6x0wYTBiD1FYBwZS6DvXf4s+NAiuVcYHiOu4scfTz3dkwwInRhWK/05lCw1GtX8jJ+w3x2DO3jZMU5PAK0Mlw3yC/RPUMeuepMXQxHJ9gGvrQtH2s3m+lOgjC2XHdg0W4smWid43ULJgndlBU4aIuq4NkHLMVDnzAVy7thLlQEa5Ma8BxzGOKLQPLEqAw/Gl4tMw/5VPx3fDLap5WbAmbyPgzfPYZs5TupCAecKDHYZb/VSxK6sqHU0BZ9efwQ+RktIyaMgFjPJvxopsa/X+J1zAz7Z9qzdTA1wJVYWFQC8DpHGiQLqmBH1GcMSvYZv9nn6oa9eV8DkRdY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6802.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGJsNkpTdU1pZElieU9TVzVqY3MzWitWdlhabWdnc2JSZlZqMmZuUVpXVXF5?=
 =?utf-8?B?QnNuZHVmVy8wNExYZ1Bnc0FjcjBkVmk1QkZJS3dMZ3ArdW5IVmlHdHFreFJO?=
 =?utf-8?B?VmxlT25pQ2RGVG1SeWF1V1h2SHVZTU5HMEQrVExkN0VXd0JFNTZOUWhVYW1U?=
 =?utf-8?B?c0ZDNDkreUEzTFJKSW9ZVmpLVDNMVmxSZEQ3RGdCajF1MHFOcmM3VVAxZTdx?=
 =?utf-8?B?RTlwS1lyeWpTbVhPU0JyNzFwanJERTI1aGN2bjVkMUllMk5OK2pwTTlSUG5O?=
 =?utf-8?B?Mkt3NFRXZnJxUlVSUWhFVElwdGR5emRtQUY4aVVpQjJSYURsVXBidWdzUEJh?=
 =?utf-8?B?T01OTGFXOUNqR1hqVE1tb2JNTkEyMlFDK3Z1QW0wTzJmV3lOMXJZVWlhcUdQ?=
 =?utf-8?B?VDhzSDlCdUFpemtmOTRJcWdndmRoWFkyN3RLUGJJaGFEUEFWLy82eThueGUv?=
 =?utf-8?B?czNDQm9vbkU2S0ZZalE1bzl6SlRZYnFXMTlEeDBDNnN5U1M2enE1V3JRc2Ro?=
 =?utf-8?B?bjczYlA5UHBHYWNqOFYyVjhlQXVLUnJzQTM4ZjJ6Y3N0bjFGa2JRblRzdnJP?=
 =?utf-8?B?Z3RnU3l2R2VuVDdnWUR3TzBUUEVVTFFjT05pMTFRYm5NdVpqcFN0YmdOaUVa?=
 =?utf-8?B?RnA4ekJPbXB3Y2pXb2tVTUthOVdPTy8vMEpwVGtMekVpVnRaOTIzZEFCNjlG?=
 =?utf-8?B?ZGNYZU5aU3hYejJGOTZiTGxRRUJzRkVKU1VFSi9DbDk1U3NYeWY4bE1xaXRR?=
 =?utf-8?B?Z3dnTE5IM21KN2Z3NStlbVM3eWFvaHQ2aFRGcUtOMFpZcTN5UmlIcjRTNyt5?=
 =?utf-8?B?QTNCeWxaT1oyTjF6a1JGV2Z3NWZpcUt4ZlI5L2pQcEpZWEEyb0xoOXlXL2RP?=
 =?utf-8?B?Q0J1YVhxWkVlUjJnL0FITU0xeHlQYzJ5MC9CUXc1WEJEUUlYdHBCREVnMjNz?=
 =?utf-8?B?TVBiNm1leDA4S0JlQnZ0eVNoa3hiNWxubFR0N0liOUlZeVVxVS9SdWQxSW85?=
 =?utf-8?B?emw0bFkzamRCNmZDTmh1RVBXWFI3Q2RWbFYvTTExRVJPNzcyRFJDVVVzVnZh?=
 =?utf-8?B?eStJT3dzZkFHc09YdlRQM0tpbGlTUkY0RTFtQXVRQWp5U251Z1FFaDNPYkhH?=
 =?utf-8?B?UlNqOE45eWRkeWlMdm11V0IzWG5VVWd2NXlCQ1ZrZ0lWeUJTVmNOYjlMVUhC?=
 =?utf-8?B?dXgrMjRrbUVSMkhidTY4SlZ6YldOSnpRdlFTc05Cd28zUkJRa1NvQkkzVG4r?=
 =?utf-8?B?WUtmNnVtV3k4c08rK3l0Y2N1dlh2V2ZjUG9mT2NHUE9EU09NUklRd08rYVpM?=
 =?utf-8?B?ODNOVjhlYm5LaVRTdGNScmlveHJxemhNWTRLUmVHdWlnbnhOcU5kZTJrVVJt?=
 =?utf-8?B?Z0Jib1lHMFNldC9yOGtsLytNSzdDSGxaeDRqTGJWQnFQK1NONEtQSkNhQ3l5?=
 =?utf-8?B?L2ZQMG9Jd0UwVi8wNEI4akYyTUpZcHdGRExPaHpBK3VNZzRMNXM5eWRKK3pu?=
 =?utf-8?B?L1pZYXVHeHlTRlhvdG1aQ0NTNWR5WGpOUGI5MnVMS3FZc3dNaTg3T1lvQ2Y1?=
 =?utf-8?B?bkdoTE9wbmcxYmVLNEVDb1RqNzZReERsMGw3VG14MnN3Z210RTJnRGV1VFdR?=
 =?utf-8?B?VGVDMWZXWG9sL0J2eDJyU0YrRjhneGE1Mi8xdVYxWHR5RzhUZ0ViTFB3aGp4?=
 =?utf-8?B?YWlUOUR2bmZNMkMxSEVudjFzMnhWUWgvZm5DZURXek41YUlQYUlBWFY0SlFl?=
 =?utf-8?B?aW4zZ01XRXZHK1ZoeUtMTXh0TXoySUZPN295ZTh4VXRJZmtzYUs2YkFpdXZo?=
 =?utf-8?B?L2ZiZUVGYW1xMzg4TEdMcHRYeVRHV1YyQWVjRTZDME9EZUJVQlhodS9WZ2Zr?=
 =?utf-8?B?eWxqQ1FNSFVnaGVsSW9mRmdJcXJFVnkvd2hEQzZEd2VsRm1Rc2lEWTZiVnB1?=
 =?utf-8?B?LzNBMmxPd0x3bDhIRG8xS0tVbGxsUjJCcWxUYXZYQW5YanlvdnJlc3hKYmtT?=
 =?utf-8?B?OThRRGRVaFhPaTVFS08xMnE5YktsR1ZRTU9HWDYzVUZYVFZqVENRYkpncmEy?=
 =?utf-8?B?VFdjQ1c5M21MZHpya1NqZ0l5cElHa01VeHp5b2UvWThKYjBSN2h6b0dZYkJF?=
 =?utf-8?B?cy9xdkFvckFXa3pUM0FZMEV5UjFBMWUvZVpEbnhLNFQyYWxTbkFMSlBlY1N0?=
 =?utf-8?B?anVLSE01WThFVThlbGpMUmhJcUlrenNMWjU4dzVCQ2lqakhZTDQ3bHhhRXcw?=
 =?utf-8?B?ZGNXd2hDTkl4b0RpVFQ5RnZEcXlHWkk4QkxBd3pXZHlyVGxPVlo0cCt2VzV4?=
 =?utf-8?Q?mFoIcE6Cd9z5VPEB3V?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382cadd2-8808-4c69-b472-08df2ad7b6c6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 16:16:48.7872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6gPbgzDWd6W/x+rBhjpHUDpF/7nOqfDE9PhgykMWCM93vyVCBX+sNkDKyfd5fpZYk+LMvMaBGQ6H2oFivFnqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9681

On 15/10/2026 0:48, Andrew Morton wrote:
> On Wed, 14 Oct 2026 17:08:59 +0300 Nimrod Oren <noren@nvidia.com> wrote:
> 
>> min_free_kbytes is recalculated on memory hotplug and on THP sysfs
>> writes. The new value comes from calculate_min_free_kbytes() or, while
>> THP is enabled, from set_recommended_min_free_kbytes(). A value written
>> to the vm.min_free_kbytes sysctl is replaced whenever the new value is
>> higher, so a lower value does not stick. This matters most when THP is
>> enabled on configurations with large pageblocks, where the new value
>> can be excessive [1].
>>
>> Stop recalculating min_free_kbytes once a value has been written to the
>> sysctl. Systems where the sysctl is never written keep the current
>> behavior.
> 
> This problem lies somewhere in the range of "minor annoyance" to
> "catastrophically horrible", but it isn't clear where in that range it
> falls.
> 
> So can we please can we have a paragraph which explains the real-world
> userspace-visible runtime effects of this problem?

Sure. Can we add the following after the first paragraph?

  For example, with default arm64 pageblock sizes, the THP
  recommendation can reach 5.5 GiB per eligible zone with 64 KiB
  pages vs 22 MiB with 4 KiB pages. This keeps a significant amount
  of memory free, reducing what applications can use and triggering
  reclaim much earlier. Users can lower vm.min_free_kbytes to avoid
  this, but the lower value only sticks until the next recalculation.

Thanks

