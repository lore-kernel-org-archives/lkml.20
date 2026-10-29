Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793301691;
	b=BbZ2xnJbMdk22YxginMknAeUPyraSjQ+JdGCNVF65feeLm6+M13VFvqhcbT4kv5sfo0/
	 yaDTvtDMfhBjSEs0P1gVOBPVlrt3WRihGKUDSBTxvHpiRK1JjkmLMuBXJXJsTNbEd3Cik
	 ZQ9sYHOcBXxvyAOcB17AXfUr4kp/ucrr3WfskS4X7eDvoIqbdtR9CZk5/4OfqBMYV/MDE
	 f0Rh/ZegWE9aH89dMzykJ5IqJlfiOQFreKD4SWU9HMbImmR7Et0nmrZJJ3LA+5kOOTVSp
	 UU0HP1KPFoCZp1tWrKrOVbZp/9DNDDF8oGALYEXzrAw6SMCOhbD1OcrLOsXg7NazbcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793301691;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=e3KauSxe0cVad1CEngZA5RYDo+LbI5zLXrOE30ZOEUw=;
	b=Jpg5PyY0/ABn4pwmMl5yfXJn71eeApiAAOeSuAkiQfVBt9wSIfQk7ajVnH8arIlju1mr
	 ukpOmK5ttIZFkTZrRt2KnlpsNrH8YX1C7RTSbPTyM7YDvIuQWu7oNUgtWaaOSD2qgOV6d
	 bPIY+R1G4VBpYF2CHCIGuw6iA9FjSiCvI2i3mh/VSg7nZF49aHUugn/KwJv6JFVaEanVy
	 heGzl6rKVFhtcrUH2cVVCaZAt5hrQ7xDKRpXAFk1sJydWDKWWn7IuMpM7dlUYX+rRaRBt
	 CMusVvoydp77A20AkxZyneb6ExkERmcZzvltGdjeADNXFghjr5IBwKyGQl6gorLq81A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UCc+8kpQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.39
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013039.outbound.protection.outlook.com [40.107.201.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CAC606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35CAC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UCc+8kpQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzyINXUWKOp/oIvDhrQOLKM4QSIQ9jCQhBp99CtsBdMo+mP7ya/B9OZa6pfk5YJvYfEgJJG0r/FG9WghyxOvz3fLDzvfS3n80dKKUtdkJg1vG/5D7Qj2Ny7R4+D3khVLN0kDAmvfknGmzhRxOorsPXIa5KqYqfbppw+MbNArQyBzDnZ+cAqJDKLEotfIg4yrHbWfeDuNUKUZRFLJC9aNYH/ULJFDThyCFcIt0LWSvlwz6eoUaTcSuy0nIm0lUmNixb1YAai8Jy5Az6Q7cklwxgn2WxpMfJJNsLo3k2imioPWEMHKisxuqtgUgmFONXK2tyTdrmG20V+KWVI+H97VEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3KauSxe0cVad1CEngZA5RYDo+LbI5zLXrOE30ZOEUw=;
 b=d5H8/N2ubHysb5WdTpu3jEtskcrdN3YbM95cl/GxEWJ4r7F2TBUkYEDHuElCXveWKGgjKab2VrNB+IRt/DSqHfJphWlDxwaD7m+nAj5kR4MhLmlNEryo9YumzNiSh01xUTdPnCfGvEdqDxO1kwFowtWinWjt+Pr6Dwi0CgDJpDhP4RzKjRcJYHTeTEJye423k6EyV1MV9SThgde7Icar9jGOYfDnpHHUXvWct7ne15hhSUZy9c/w2uOQlGBR5IT4e2lHXp5A51vEdjB5yw/kWCU/u8FWFXlObiI/lJB2BUtdMBCzuSRqPcoVlj3qnKtoA9HCNYjLOIAbbNesvZUfcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3KauSxe0cVad1CEngZA5RYDo+LbI5zLXrOE30ZOEUw=;
 b=UCc+8kpQYLx5wSCmLTIxDKc2lwRPfZJzU/Plz81VNn3NlFPTQsOEHyKw2qE+D0iJLmT/LfNTQvGD3UsmZx7j9W5AVqDwYBG0kgYmaxGeVfn5jdNVW2uJQZU41+X/MOuYm/Y7gVXnDWbTwuXsRwV6GCPgoe8rDL9nqqnt5GHtnQOlKDpJEUzok3BgDVRr8r6mVHPR3+tk058nu/dFG3AYQNtOFgDp7hAjlPJKHhZ5/wYsFNTQ2zIYnWY5LY8zUCuaaWBqG2YtNLOzelZ10L7flwZMAmdRizOH2QVuCaJ4wq73+V+RQpL7lPXCifRbwH1DH61pQ9jRpBoEP9m0m2gHrQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by MW6PR12MB7085.namprd12.prod.outlook.com (2603:10b6:303:238::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 19:19:18 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 19:19:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 15:19:09 -0400
Message-Id: <DMHKCEKNMA64.3B6O5X5918GWI@nvidia.com>
Subject: Re: [PATCH] mm/huge_memory: use READ_ONCE() when cloning folio
 flags during split
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Dev Jain" <dev.jain@arm.com>, "Lance Yang" <lance.yang@linux.dev>, "Usama
 Arif" <usama.arif@linux.dev>, "Kiryl Shutsemau" <kas@kernel.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, "Ye Liu"
 <liuye@kylinos.cn>
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Barry Song"
 <baohua@kernel.org>, "Ye Liu" <ye.liu@linux.dev>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20261029-data_race_huge_mem-v1-1-112e331291c1@linux.dev>
 <CAGsJ_4wndM+uFwhX+7wdkm2Q8AkgVcw_4wgpObfw0DAZ1w+sVQ@mail.gmail.com>
 <b5dccfe1-3209-471a-a34e-f77fffdee797@kernel.org>
 <DMHE8BEEER1H.2BIY52NXATPIA@nvidia.com>
 <d44e0aef-ac50-4048-952b-50a0307a41cb@kernel.org>
In-Reply-To: <d44e0aef-ac50-4048-952b-50a0307a41cb@kernel.org>
X-ClientProxiedBy: YQBPR0101CA0242.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::25) To IA0PR12MB8374.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|MW6PR12MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: 229194a3-0d1b-499e-64a5-08df35f182c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|11063799006|4143699003|56012099006|261009223027099003|261026121527099003|261026140227099003|10067099003|261028144727099003|261022105027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jaT72JaDTR3R2mtx/4dSjgE+uHzB2uwTaF2O8EtiegMB1lxjUcUP0Z/WV3S4eduKLaEi/AwsoznlL0vLNet/4QZ/DreF/uTIiSaftY2E1Uf3VlGpZzEr2J7WROLbn9IigLoRSOOWZX6re+JSLEx1INPhwDcrGTKuxXz+xc0WdPiIcvnps02tKQuiIDvpM3+yVZos8kpArIOibPGeIC/kHkN5vqaA1a2Dx8nWBUd1yJDPVcSDIiSduJabAUVLtiJ6KXAnY3aat6ZI+LDr0QSu6WCFaBYAULl7kNC6tDln5O+5YXm1XQfu1h5IVU8Sauwof0o1sVxzNE0Lye2noPbvhUiQp7hOznFc+wjkeWPll9uG8bB5Xy5Tn/xo3sDRXjlvqHgSsuBQExoq8dZScC3FOdvODR+A3fwdq6wlP5nVPISFhYlpfJZDiLgF8QjYgkYgFOu+YctnBUVRE96WNzDtHZwRZ4ayZT0PCgji9oqiolbrVgkaLEeaSYvH+cXscpEgx4/dpafUMmLj0PSJmnVYQDhsP4UFfSoDzhbqfopZbUnBAmVT3aTmcWGDTa+3wZbSLjW/TkgaNlihD58+FbimGPEXMOvtTxwgx95OZ4v4/UAH5mYVlpNKL6ZQCVOa/buiFdrbMiSYdH5u3BGatAezI37+P2B8qYxTtMXpwCrlF2Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003)(261028144727099003)(261022105027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTFVeHJ1K0NlZUYrZWFKMFRoQTRuM2g1VlpiUXJZTEVsMkMvMTEvS3hmRThy?=
 =?utf-8?B?dlZVOFIzT0JpNGc0cm55bm9TeHZjRWdxVWZFS1IrdnNsT0lkS3ZkVDJRSGFS?=
 =?utf-8?B?ZE9QMm53RkpqcndhWmJhMTF2VWdhdDJlTmtQcTRkQTdWTGhPWjF5VUpZTE96?=
 =?utf-8?B?aDVpaUxLVW1hOCtLNW4wU2h2UE5xejVtajZtdE1iMEE4akVzZGlIZUlCdy84?=
 =?utf-8?B?c3VjcWtXSkhlMW40TEFzWU1SUm9zYTNIdkFqeU9jOGNKL2VNdDgzZEhLUHd6?=
 =?utf-8?B?aUVLZU94L2UwNXZjeFZOeWdENFJIZmt0cTgrdVQ3WDJGR0RUaDcveW9SM0xG?=
 =?utf-8?B?NndYRFZWMlpJQUQzaXFOMXVYVXJPdnFrR2RJQXlNUUloamFHMElHR0wyYVhj?=
 =?utf-8?B?SGNhWFh2ZjVVWERUcFlXaVV6T2xNcUgxU0krMlFVRk5XQmVCd01idlB0ZmF2?=
 =?utf-8?B?TER4RG14MVZ0dFRTMFBoMEpiN0N2ZVh1Z2FUdG1OVS9hZCtiKzBsNXB6MFQv?=
 =?utf-8?B?TVJxOHZOd1RhSGdxOXpQL093VHRxK2RZQ21ZdVAwN1VHdjlReFJZNlpaTUQ0?=
 =?utf-8?B?K25mNVdHN1pwZ2V3U0NBWFF6Sk1kUzlzak56ZUZOdmtJVVNuYXFTWldLSG9M?=
 =?utf-8?B?NmIwNWIrUFg2QkZBS1gwdkRpNnRneFVhb255TlFTeXJhZEFpd1VCbE5SNUNU?=
 =?utf-8?B?akhDdzUwU2J6aFB3YkRUa0Jqd3hBWE1WT2kyUlZXSHM0UXI4RDM3Y2QyQ0xN?=
 =?utf-8?B?anNYS05YRWkxdXdrL2Nsb1cxT29BdUp3dlZiTTBrOTJQNlN6RjgvK2FOeFZy?=
 =?utf-8?B?bmIwdlhEWDM5RWtIUFJCeUFyQUhRSWJqbk9GcElnN01zMWowejhHeHE5dFZp?=
 =?utf-8?B?YWtwdUdEVktlSzJMV1A5T0tEQmIrRTlSSmk5YVZzcmw5ekw4alhBYXJHQnYw?=
 =?utf-8?B?Rm9HOTQ3aTBsUWdaN3dOaFo1OFRMN2NlV3BsMHdQWmRVYVkzdG9Qbm4wdWlL?=
 =?utf-8?B?OFkrV0NjUjJyVUNNenBHaUt3eTJ6MjlSTHdWT05tMXRhbktOdlNBVWRtN3Z2?=
 =?utf-8?B?Q1BvdkJwaXpMeXhBUVJJN2FlMjZkeDRNMldNTGpCTEZuR0FmbTVYMDZiZWQz?=
 =?utf-8?B?dDh0TnpwZTRINC8vKzdpVzRHL0NGNGJ3SXRyQXkxUmIycHhZYzRNMTVFbG0x?=
 =?utf-8?B?d1Z6WlZRdStvREQ1cFZ6OE4xeWdCSzRheVRZQmJjUitVYitzdmFQbmcxcDhw?=
 =?utf-8?B?WHV1T0VhMzA1R3JQY0I1YjJ4M01NVkpGU1Baam9YdjE5U0gzVUVWSFlNUG8x?=
 =?utf-8?B?LzNJdHBFUU9OSHl5K29ZeG5KQ1NTeXhYOEhCcVdYSkQxV2xxM1c4aUdyM1lX?=
 =?utf-8?B?bjJ3a2tjQUlya1ZrWkFKQ1Q0OFdhMkk0MnZ1cVRLYm90akNpRzdFamNHRFFO?=
 =?utf-8?B?UlRNM0lPT1ZEZGdEMFFVSFZoODN5WEs1eWFjMUVkU1dtakRLRitmWHFPeEdu?=
 =?utf-8?B?MkE4RXpYT3Q4aFhzV0V2cEdKeHYxUWpHNCtZNTd1cnN5MFZkdE1TNGNUN3hF?=
 =?utf-8?B?bkxyTEZTUSt1eTdydy9kdXkvcDhneUtxRDZ0bXllKzRnMnptRmo0VzRUOFRO?=
 =?utf-8?B?KzhpeURaeWdJaTFCYVVhbm96MkQrOFpHbGdGTHF5YlpuK0pkQWVidWFkR1Fi?=
 =?utf-8?B?b1QyZndYRXNJUWlxaVM2d0hOcENxa2ZwblZScmZkcFNFNkl4cU9UU1hORG5C?=
 =?utf-8?B?R2paV0dmbVg5Z3h2Z2xmclBJUllNQlNrdEFSeXFuZnF4dDdLdVE4K0NpZ1pE?=
 =?utf-8?B?ZVpLVUkzU1VYMTA3VHBpMU1BbmQzRDBmRHU2aHFBZHJhbHFWYnJzTmhjdzZR?=
 =?utf-8?B?UHRxM3Fsa1ExalUwVjEzV3hzN3lzV2c4ME1rQVlxYTlyaGt4YVJmaGlVYlNj?=
 =?utf-8?B?WnFwbVZQRGdZRmkwQ1ROcitHdEtlall1QXp0WVJIWlFUKzZwbnlmWUJoeFlv?=
 =?utf-8?B?ODNkaVMrZk5oV2FadGFUS2h5VTlmdERYeFd6ZlVmOUZBY1pIUGRSNjFLREVC?=
 =?utf-8?B?SDFFZkFBQkN0cnZpbmlpZEhlRGtHaWpOY1I0eDhMdlk4eElZdGJpOGlseDNp?=
 =?utf-8?B?dHE0SytiMlRuTEdYNlhZbSt1Zm01R0JNK0JlMXJlcnRxNGtKSDQ5R01CcW9k?=
 =?utf-8?B?cUZjNkFwMDBPQnVQb2pYQmErdVg1d2YyOUZ2K0k4cVF4aDc3WjdNaGlyN2VS?=
 =?utf-8?B?Q2FtYzBlS3VZa21YaWhBdW4vSTJSbGRINXM2a2hxVFdhS0IxZnhrL1pIM1Zj?=
 =?utf-8?Q?7tHwqkcTDcGKHdsfm7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 229194a3-0d1b-499e-64a5-08df35f182c8
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 19:19:10.8708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5YviBbwITII7A7rcP3fcnNvQO4Fq1HZRvFAMR/1fk1fRYYn1uo15YDV3cwRDjXW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7085

On Thu Oct 29, 2026 at 10:54 AM EDT, David Hildenbrand (Arm) wrote:
> On 10/29/26 15:31, Zi Yan wrote:
>> On Thu Oct 29, 2026 at 6:47 AM EDT, David Hildenbrand (Arm) wrote:
>>> On 10/29/26 10:08, Barry Song wrote:
>>>>
>>>> I assume the race is harmless, but silencing KCSAN is still worthwhile=
.
>>=20
>> data_race() would work too.
>>=20
>>>
>>> Isn't there a way we could lose the PG_waiters flag?
>>=20
>> The PG_waiters on the original folio/the original head page is not lost,
>
> Ah, so it's not on arbitrary tail pages, just the old head.
>
>> but there is a chance PG_waiters is lost in the new head, because
>> prep_compound_page() uses __SetPageHead() and can ignore the atomic set
>> of PG_waiters.
>
> Fun.
> ...>
>> Solutions can be:
>>=20
>> 1. Use atomic SetPageHead() in prep_compound_page().
>
> That sounds like the right thing to do?

Yes, simpler, but the atomic op can be costly at compound page init
time. My plan is to add prep_compound_page_atomic() for
__split_folio_to_order() and the atomic version SetPageHead().

Fixes: c010d47f107f6 ("mm: thp: split huge page to any lower order pages").

Will send a patch soon.

--=20
Best Regards,
Yan, Zi

