Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793290502;
	b=oOlV1v5KvIQbBzI/N8MvnFcRGfMbqrjiTcMNv97YQkVGDAFkSr4GsGLh75cM6B+KPpua
	 bcMvtUi1bUpf4yjhqw0SRAOOfTi6/00SubsVWf5yMPWp6f7DAMTMuxsPJ5Bo6gfuqtXrs
	 Je7Ew8HgJwwcakyS4z3yKVz5e4DFV4qYVL3BI4kGt9R4H/m6UBt0i8c7K2t3cB/5YioLj
	 lvcUOtOvAE4J9AYOcUQJghlNp5vOaAJvglJtSBzL0LtDhbj3/iUYsFAU75r/3K+Vakwse
	 +fXwlGMKNTK/SFXZrYHQLxqw2FIJ6+9qKcQpIamBlqSXAebC21Ysq8GDu9joM5K/P5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290502;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=s9W+jvfnZOlYdg/gFXFpxmbzAKNHwscHOKO+rG/SGYY=;
	b=c6uvyMFoThC9bilJhBQMW9lOKi/Ii0zwyUWEe2dw1rKiD7sL6vy6JrZARViQ93hK05uU
	 AWX2f2znojwaPmpGS3iN/P8oz7vOMB016Esdi+r+0j+vIYgIiUqZMmTW1hKUC5XItDqCQ
	 Xa9lFEe3Q8rkDYxK4pH7F+KM5G777fKD4bkpXi6z9S5fIsE8GrANZ3UTqqgMf1+JByKvI
	 QJ9fY4Iiqs7/koidmBSv7nXU7LpnnHCjS5vpGbtbCKG5DlpvhxwaRohVhrE4YoMKmITFh
	 FLr0uCjSZwii1Vdjld034tZol3NYowC0IM7JDotTOz2wHVEdPtXzfDpK0VrLiuQSvJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=g0j9I9xe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.19
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010019.outbound.protection.outlook.com [52.101.46.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B448606A31A;
	Thu, 29 Oct 2026 16:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B448606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=g0j9I9xe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHdil5t7PX47zR3MnRNx6AVzrgtamszuRbHLcOGG1m8DGV1IWdKQoF0VxF3gx6o6Zjngxlg/rqVcur/HiL21pusJZsbmxuNGqSa4NdR3MBD0FEw3hNpL65z1u8MxcTFNHNrgOKB28uCCx6OoFc3rSMw8r12N4K7NQpshgSexU3b2NDiwKe5x8sKVfGmgsjOiZFdq9G9OIt1/BfOy/ScLvzPiuGtektyMpRJQQhqQbYVoPoOSjtVu8fiv2OZIiN0mgy3bLMUt4gbKfU2CMP850t/SrJDEcH7Ty1hoPBwI6jHb2oRdUOHApuuMwBIN6IEICW84ILRl1ayB2eosRfcCow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9W+jvfnZOlYdg/gFXFpxmbzAKNHwscHOKO+rG/SGYY=;
 b=S5NSaTZ3QUB0YJ4kysEg3euVNO61OLKf4WakoOntDTqQGpP6gbyjJYLUDQz3YJoGfFzieS0kIr3ALkGkPaR12/em9pns6wWhQQcPMZyYlAHhggxK7RL81YuKmsnC1czeGgwEIaDWvrgM2auXs1l5mG0Is8JWqnDCYkoo+0ANj8XrVvn4f2NXqGP/903XVgcOGFy1VXgfonGWzDVVBDC1gy8i/amw6gCdO563efNvDwh5npMXqWod141vZphckIdfIVLJw0ysaGpZoKLLGbWeTe64/XLvOg3RWQQLd4yP46+DV/MgbieH9O/A5G7di7jQkaLXPDcvOJIl5qpLrtGG/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9W+jvfnZOlYdg/gFXFpxmbzAKNHwscHOKO+rG/SGYY=;
 b=g0j9I9xejOBc8cHP5ItPPJ9MPU+njzaUYrhxRg2KGKoUN3zVf2teXI//KElGQP0A2KAl6xdefkwHYhqTH80sfleygPCUB0D5t/c7VywCePBW5AWaejjoHYtgfH6FLvJMUqjKE1EHU7RlJF1EMlyJ39HB0pOcvKVZ4IaJJRHT+aw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by IA0PPF84D37DD5C.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 16:12:56 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 16:12:55 +0000
Message-ID: <9dd48bd6-70ce-49f1-b3cc-7cf8f49e995b@amd.com>
Date: Thu, 29 Oct 2026 17:12:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: edac: xlnx,versal-ddrmc: Add
 xlnx,versal-xilsem compatible
To: Borislav Petkov <bp@alien8.de>
Cc: "Veggalam, Rama Devi" <rama.devi.veggalam@amd.com>,
 "Ghannam, Yazen" <Yazen.Ghannam@amd.com>, Rob Herring <robh@kernel.org>,
 "tony.luck@intel.com" <tony.luck@intel.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "rric@kernel.org"
 <rric@kernel.org>, "git (AMD-Xilinx)" <git@amd.com>
References: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
 <1792587442-2794880-2-git-send-email-rama.devi.veggalam@amd.com>
 <20261022143730.GA1287910-robh@kernel.org>
 <20261026203920.GA696395@yaz-khff2.amd.com>
 <PH0PR12MB8125B27A7814A3818739C4B9CE6F2@PH0PR12MB8125.namprd12.prod.outlook.com>
 <b683fcbd-ae5b-416c-96e1-7b0d7146c468@amd.com>
 <20261029152549.GBauNlfeOlTwktwjYs@fat_crate.local>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261029152549.GBauNlfeOlTwktwjYs@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI4PEPF00000164.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::873) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
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
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|IA0PPF84D37DD5C:EE_
X-MS-Office365-Filtering-Correlation-Id: a86a77b5-5177-4e49-0772-08df35d77dd8
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|11063799006|56012099006|261021121427099003|4143699003|261022115727099003|261026140227099003|261021135927099003|261026121527099003|10067099003|261009223027099003|261022105027099003|261022075727099003|261021123027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	89jhA8xEdCuNT67qKXsuqsQgjxzoe74uL5HXdUl5DWDVe0y4zhUNzFJI7NY7GbYyXi85LGqidqWEMikiZ/eg5U+AMq/jrtWLsCmmQhS8KtdSiWxo1XKODSE6zMncuO8zIk+pQv+dfwG2iCfPfR5HIc+NMg8Sddct0rx2a9tvoqqYRLUCi0INJbypji/UG7gaSYog60VIkMqv0FM61lvJ2ekcwV3kZCGBWQktqHTgbnDuviyW4VaWmDeRgPRWGXh+2JLAYtpW/7lwDcEbJMF/gFKN0T5ZXnGXo4Ax4kTebTsZ1jfoRYJgigwwKTg1tQIzTdOsdTq4RVd5VReIzGeSbIDgHTPN+0GxYq4fQ9kEbHioE31mCqdfMA9edjppue8/Xo+3wMTwkELTFzjJMqLa/jFbU+8oZfRRAFQvoWpj2rh8d3onZ5s0fyMQWU3SwHzRHSKoU75oAh2G0pLMfZFe1BFglIAYAi8iVqO6bPbGcqmT+d0/nIjDZ7Durlv59k3VpSE2SXZM7NK47a25NXIGbrLVE97ZL9MzJ7/Z+o83bywLQkNl1/5UZBLH8lCp0NinGPoGyVdRY7gCFNnBONBjfQVF2+4Qo/SKEAQ1x9j5XBQ4KO1T6Fl4pMFeFOa9oz0Q9p13MzKQHhpraie4Hox+GaYRFyekj8G/mHKBcZZ6pUw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(261021121427099003)(4143699003)(261022115727099003)(261026140227099003)(261021135927099003)(261026121527099003)(10067099003)(261009223027099003)(261022105027099003)(261022075727099003)(261021123027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnR4Z1BmVnp4eHBzdHpOdU5Ia2w2d0NHYmh1SllhcERyRWFhRkl6bWcxenkv?=
 =?utf-8?B?ZlV2bEdudHBxekI3bElvYTBkWHBrSURhTGpqR2Z4dW5nUENsV1ZXdituZ29W?=
 =?utf-8?B?SGxrTGRPR3MzemUxbWM0TUpOKzFlZkx5UUI2dUlvR0hmM2hpWjRiMDNzT0E3?=
 =?utf-8?B?cGZGb0hmZGxPK0tPd2ZLQzZqR3ZZNmJnY3NaQjQ0MEIyS1ZMQ0xKc1o1MVc0?=
 =?utf-8?B?VmpJbi95SjlkckFWVFpmdUdGTXNnMkZjRFZzMDNKS2g0WW0wcFBGT2tVVEpp?=
 =?utf-8?B?WXhTZUpEUm9yMU9Fb3oxYW9XNDR4UWNPTEtrOWF6Yjl1Vmdub0Vvb29QeUpG?=
 =?utf-8?B?c01Xa1psNXlsTC9oRHhRZFRkZXJIWUdLTGNmVmtwQkVFQTl4L3dNWFFWcjlV?=
 =?utf-8?B?bVVScmFoT0dzZzRMVzZWV1BOUnNEemo0WGpvdDdYU08zd25TYmxFL2ZnQlpK?=
 =?utf-8?B?Sit4UHhrZmE5QklmbW9UaDZCS29XS0p0VVhTUkFkZUo4MERjeGdDS29OWUJ1?=
 =?utf-8?B?aUZCem9oa2xTV0N1UnFQb3owV09vQ3RBclBkQS9jeGNYQklmdzBwQ3U0Nkds?=
 =?utf-8?B?eUd2VURYSU1nOU5WZ292Y0liYmV5dkh2MUZJLzUwd1EyUENicVRkejFNSXMw?=
 =?utf-8?B?R3JBS2JjN2JUSW9IVE1BeStQbkhoN0FOeVc2RDcrcHU0Z2paVzUyL2hzZFVG?=
 =?utf-8?B?enBUaVVkOVYySHRONHJYNWoxOWdtOWZsWjA0SGxuZVJWcENzS3YwTmkvQTlq?=
 =?utf-8?B?emZ0cWtlUFVwWTRwRUx1UlZMVDZ4WmVrZ0c3VDZkTzBkcWJJMlRUWHhQYlFM?=
 =?utf-8?B?YzJtY1RVbTg3NVl6YzZhWkpuTlBqcUs5N1VIcnJQbmdRWDhpSE9zcm1mUVo4?=
 =?utf-8?B?MDhoYjdtdmNyejJId3MrdU01ZGhvZ0xyVlpTUWtZbDcyWmQxMnNQeXBka1cy?=
 =?utf-8?B?TGppUXV1VTRrZDBlMm1zbDVKcDBGajJqVWpNcFRzZnRKNVRuRHAxc2o4Z0hp?=
 =?utf-8?B?ODZnbERVK204U2RDSEdZVHB2VjNOQ0wxMko0dEtkSlp0WFlOMW0yS1ZwL0cy?=
 =?utf-8?B?c1VQcDFwMmE0Q3BoV2NLSTZaYm13azZ5V3JVTSs5U0ZpMHZGYUFZNlljeW01?=
 =?utf-8?B?VUJ1MGlDNjkwbGxSeTNQSEkwRCtwTytjTHR5VnFSSjAxVXA0N2RyTXhScGJZ?=
 =?utf-8?B?MUU4L2FqcEl1cjByWW1qdTRQODdISXQvWUJteHRzS0hEYmhaS1FmM3k1cEh1?=
 =?utf-8?B?M3E4Tms0ditjK0dJNkJQc2paZis2d21qSDdpTlhTd2FmR2hXQjVhK2kwdGZM?=
 =?utf-8?B?dGRRUWNiVHR6NUMySmE4bmY3clFIZXdGUFgyS25KZC9RWHBLcmxpR2ROWG4z?=
 =?utf-8?B?YkdrclVjNU5IRnZzMG5KZkpuNVBpckNneG52UkRtL3U1QWQwRHlEZVlXTXN5?=
 =?utf-8?B?ZzVVeTlUemFTVkp3eitac0dWT1UvVUlVUGp0elVxeVBHVEFnOTBic2NmbnNT?=
 =?utf-8?B?bTFwaWVOUXVOaHpvL3A4TGlvK1plU29yYVVvam51ZGtKMy96K3FJbDVMOVhR?=
 =?utf-8?B?QnZrckppZ09OUTYyeXRmZ0J0SmczNGYrVlNoRDJFOUJwWHpsTHJGOGdoZkRD?=
 =?utf-8?B?OU5sdHFuakh2eHprVzkxNEVEYWpxc2JBczdqTTUwYS9jNERhMFZsK0FmcE9w?=
 =?utf-8?B?YjRjTTZsQi9nZ00vSU81RlE3MUtuMDQ3QjBtOGpsbTh3dDRCZXhic203RThp?=
 =?utf-8?B?V2dIZzg5aXQ4WkU3blZJUnZDOHNwa2krTkZjY2JiM2JmdTE0S2YyVTh5MWZZ?=
 =?utf-8?B?elNLcXYzREkwWjhTNnpuaGs5RmpyZjJ1YkxHRnRDYWx2dnF0cCtyUEtCSDFV?=
 =?utf-8?B?SjZmWEZnUW9aY1RCd0tlM0hzVVRpTlBLRUo2K1d3Q3kyWEFiaG9zZTVLZExD?=
 =?utf-8?B?RG5Oc0ljdjNsc2JXK1JRTFA4cDFlTEdQdmRGQXpjc3BQQnlycFNWRklJUy82?=
 =?utf-8?B?clZFTmFZbHg4ZUJ3U1NVS2xqTjYrUmYweCtGOEZkeUtMNkNnY2RrTnQzQ2dV?=
 =?utf-8?B?RGhLS3RQaUVoQXlTVDlxekRaTFFzODA0b2s5R2lSZkM0dEljK04vNmsxenh0?=
 =?utf-8?B?S2c5b3F4dmFPbXRJZVphdHRtdVlyVXg1RGsxTkRuVFFjYXlFZytpN3lQUTJi?=
 =?utf-8?B?NkhnV1hiZ2FpWEdlZnNNeTdmS0ovMld6VkduTDhHdDlrQXFPQURBVVNLT3Bn?=
 =?utf-8?B?ckdsRmVHQnp0RkIwK2lMMTZ5WldFMUJvUmtlVWRweUp4YXFIalJJV0VtVkp0?=
 =?utf-8?B?bUdEb3JJNTNxdUx1ZmdTdWp5V0hPSlhETldnTHhSUXcrOGRoUHE5Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86a77b5-5177-4e49-0772-08df35d77dd8
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 16:12:55.8826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0vk9Z38cc8W4YWHlIBrttzMOFtdapOO8y+lcivRAZWffwbCkWhXH5Uaz8nNa0+n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF84D37DD5C



On 10/29/26 16:25, Borislav Petkov wrote:
> On Thu, Oct 29, 2026 at 03:52:35PM +0100, Michal Simek wrote:
>> Let me jump to it and start that discussion again
> 
> Sure, but pls trim your reply. I almost missed it from the gazillion pages of
> quoted text.

sorry about it.

> 
>> Please correct me if I am wrong but today edac core only checks that there
>> should be only one MC edac but there could be multiple EDAC devices.
> 
> An EDAC driver contains controls for all the RAS functionality in a platform.
> 
>> XILSEM edac device is present on Versal and Versal NET SOCs.
>> https://docs.amd.com/r/en-US/oslib_rm/Tool-Configuration-for-XilSEM
>> (Actually also on Versal Gen 2 but firmware interface is going to be different).
>>
>> I don't think we should try to integrate EDAC memory controller with EDAC
>> device because their usage is independent of each other.
> 
> Are you saying that you will have this XILSEM hw in different platforms?

yes. We have it on Versal SOC family (a72s) also on Versal NET family (a78s 16 
cores) and it is also present in Versal Gen 2 family (a78s 8cores or 4cores).

> 
> IOW, you will have a Versal or Versalnet thing and then something else, and
> then XILSEM will be in all of them?

yes hw is on all of them.

> 
> Then perhaps it is better to have it as a separate EDAC "driver". In air
> quotes because this is not really a driver but simply a wrapper so that it can
> be called an EDAC driver.
> 
> It all depends on what hw configurations will be built.
> 
> But if you have XILSEM *only* with Versal, then I don't want a separate EDAC,
> hm, driver.
> 
> I don't want to maintain a zoo of "EDAC drivers", each for the RAS
> functionality in a hw functional unit. IOW, I don't want to have:
> 
> AMD64_EDAC_L1
> AMD64_EDAC_L2
> AMD64_EDAC_L3
> AMD64_EDAC_DRAM
> AMD64_EDAC_SB
> ...
> 
> and whatever else hw blocks you can imagine which have RAS capability.
> 
> Makes sense?
I understand your intention but just trying to wrap my head around in connection 
to FPGAs.
If you look at Versal family based on a72. There is already EDAC device driver 
drivers/edac/a72_edac.c for L1/L2 from arm64 point of view via sysregs.

Then we have drivers/edac/versal_edac.c for memory controller.

Then this one for XILSEM for FPGA configuration memory and interconnect.

Then I can imagine that anybody can put another soft IP memory controller to 
programmable logic. And there could be more/different.

Not sure if HBM has own/different memory controller too.

It means with fpga it is already zoo of EDAC drivers already. It would be nice 
to have only one driver for all but it is hard to do with different MMIO access 
and complicated separate configurations.

With Versal Gen 2 which is still under development I can imagine that we can 
design it in a way that we say that we won't allow any MMIO interface and only 
firmware interface will be used and firmware itself will integrate all edacs in 
the system and export it via the same API. Then we will have only one single 
driver for the whole platform and it depends only on firmware which 
functionality is going to be exported to Linux. Which is IMHO model which you 
would like to see.

Obviously if there is a78 edac for L1/L2 which is using sysregs we can't do much 
about it.

Thanks,
Michal
