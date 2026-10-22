Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792645991;
	b=clXvXapUL68x7YSQZrEt0gFHWw3h8JUxfsQvHOr7Qn/4CUc8CYD+uYAgszAeVJN3phBe
	 6Ppt7UGoEYYd05Jz1NpWUYb1BMwRD+Izs2eQm3ux3yXo4t4/h/b2xr6sBjHULUaTL37Gr
	 ms53ppRtvntOForYM3jj8Ca2pkfAfp5/weH6+WbTDjpOfTB9EIL6pPfggc3hKokKbEsBN
	 /mRLdAcfgNLTPUM89PN5fULi1zYc/GVwG9pqMPHJYPGuENXP7+DCW8e4f/7ejljLD/RTl
	 1r9yU1qxqUS6nCWf/AblGKFt1FuBG8RWQa0Y7Aht3b1kY+uL1W2wQ4ExjZ/h3NM7o1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792645991;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=4yEfzbxY7pEuduTDHGautYrmKnYUtDFP/GC5LbLiQ2A=;
	b=DJ+iU0n5z21MseSL1ZQ8NETseZpN4zUDJCLa78pF52Z81yWrZ+U7hKUf/7ZhXwf85EOq
	 XIasHWLMrlccJLz2+F7utP1dmoDi7yFrsLHnm1aoSf1+bC7RDQDUPVW7rFtXjvS2VHhF9
	 jAup6OOxttcZFnvGlHcxLZI8b1uzhgLGaCNrRkgXl9ATrPBHTbrRozGyX6RpmqguiNvLn
	 n+gJnfYd7XMCqV90MX4/EuCF74tPLzW0VyHA0uctWz28DCjFmtX13aaJiVU4ZUhSM4Y/8
	 oBdIApX4otqrQhHd7VNNHV9c/8jGH3igSNYq8tQILFnsqYUYe448qZzwQACaCaIjgtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RgH6CGNg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.57
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012057.outbound.protection.outlook.com [40.107.209.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB7A606A319;
	Thu, 22 Oct 2026 05:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB7A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RgH6CGNg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqiIIJK/RzoqWNN5nAY966PE+0J7kfpwayf2RnXkHHSO913DqZ1RVIaRV4AlafaiJ/68K5QwTZAuAR1cGN8d0QDHYuc5je5VgCJU31Xc3nYet1Qqnk5yHrtQsiwK7EusAn/nvD9VHfHGC3//29SVSvANbeZzVJn3WrDOopy+vXDWoNuAMizTtGlkQ6JWj6NZgYHyaw4pdwlSLWKEFrm4VGLLcNDZrcCDvNDO0cJwiGn0hpJHiifrY0+i/B9cM4+GRT0MX8ymh5wsP6EvsgA+uPFgEZrWpJCmq9wHXnw1mXDnRVeZWxa9zTXd1i1qftdrG/HYRRfdzYHpjtmLzshRtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yEfzbxY7pEuduTDHGautYrmKnYUtDFP/GC5LbLiQ2A=;
 b=X4aMMRieZA1OKPs10RVRyyQBBRq6ffLElcrm2W2yi9xd/FfRnuY+5nxSQZHb0YRImWXK9Y9265y6GBWnoPwCPYDBLtjejxWuBvZVsVWqO6R6eqLUuYPmzSldEDj5ldpqbRWPq3wz3YNMwWyuGMjQQm3a/DbJoE4b8Sk54sYKjONUYrBO9shIbEpqsbI9vvondhVRsnAqyvuoG8cMIrKKZvyGslaK2vlX/qn5Hmd2GLQAiHwaltvBHmVtgtrtKsp+ic4SDrRiaN2FK/gHXZ/gUBMhqFIU7bxS059YEzwSTuXYdn5lNUJsWQ4un3vcr2T6kfwv1kybVonvOS23NapIjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yEfzbxY7pEuduTDHGautYrmKnYUtDFP/GC5LbLiQ2A=;
 b=RgH6CGNgeikgu9eAUmT1dit0PE6+ALDAl/apJb6X/juzTLXhoWu0RSWtxLNgy44nMRtvpyRgw5eULfN5z240Hcx2F8daEP1VYrun5wF0etA7Lv+u8eXTzZEkXq8wkELhwUR/8kSorHL/vSnw+GFNTJcesGoIqT6+aKc+d4jWyeI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6942.namprd12.prod.outlook.com (2603:10b6:a03:449::13)
 by DS0PR12MB8561.namprd12.prod.outlook.com (2603:10b6:8:166::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 05:13:05 +0000
Received: from SJ0PR12MB6942.namprd12.prod.outlook.com
 ([fe80::20d8:2aab:1836:8d69]) by SJ0PR12MB6942.namprd12.prod.outlook.com
 ([fe80::20d8:2aab:1836:8d69%4]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 05:13:04 +0000
Message-ID: <f5ba3376-9d96-4d9b-bba8-cd714180405c@amd.com>
Date: Thu, 22 Oct 2026 10:42:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Shubham Patil
 <shubhamsanjay.patil@amd.com>, alexandre.belloni@bootlin.com,
 Frank.Li@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, git@amd.com,
 Michal Simek <michal.simek@amd.com>
References: <20260922-immersion-salvage-00450539f1ce@spud>
 <arKr-oapsl5qzo_E@SMW015318> <20260922-purple-overnight-2cdd2ddd5270@spud>
 <arLKWE1tJrKnzGdp@SMW015318> <20260922-unadvised-stalling-5cbeff8f982a@spud>
 <arL_Zgi1r1IFpNIO@SMW015318> <20260923-overturn-acts-5abc2e4fe6ed@spud>
 <arPlFMhcL7Jxh4wP@SMW015318> <8547c8c6-502f-4dca-a82f-893a5568f7d6@amd.com>
 <c1c4d983-795d-4fba-84f5-7bd62246df02@amd.com> <atjWjd2sRy1P5HmR@SMW015318>
Content-Language: en-US
From: "Patil, Shubham Sanjay" <shubpati@amd.com>
In-Reply-To: <atjWjd2sRy1P5HmR@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0284.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::9) To SJ0PR12MB6942.namprd12.prod.outlook.com
 (2603:10b6:a03:449::13)
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
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6942:EE_|DS0PR12MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f0852d6-cc54-4963-3de7-08df2ffb26a5
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|56012099006|4143699003|5023799004|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	Pwax7swaFS/6HSXGK/nhUVxvl7P52IpOdE2nrhCLrNI2HvVxgzJHO4xrtirI83yMqKJG4qeJ7PDU1kkCoyS3N1hHYOwW8ls7BD+iAJRVoLVKanfY/wHxLtCXEdVaJP3TX9/lOdU4AjDwXUaH+21JM6RtO6N+g8k5zGRjDwmV9Gw3jMPvIUogyr7XZ9exky6yvkj7SBIfqPnSU0IEvVnSYPmYBDpULAOEkSze+OGMLo1NpsxwMho7lZ1NthNN5LJRxeLUxnKfyCSQROER/VxT3wYyeLwFctnrKo5gy8sGlAbkkMjMfXRfJQhn20gIyhXNvgtD6/FQ2fpFMBgTGqpg3TKePk0bxoXrfxhsbikYs9GMcLIbFs3dkN8nn8I2FCm2dcUIpsk8Jejm/hK59TcuejtSm5eU9vBdGU7mkU8H+NONJXa7AW57T7MeM7qcbE9WV6nO9aC7EzR4k3MPU10EfdtWpQ4QX9fK5n5z0jZL8Wjizc9zgzxFG7Cn1iwoVZqgo3vINnhFuIjRt5tlMr+o3moJSuMbjX24obBkp1BkJP07Ce+zs4VE+RGDtBjavNqaPlwJOlJVZRa0yL7yD+PGeL/DTE1boPWM9gV8lnUetqrmF/D9CzD07jQIZh63b41hr74HgKAiMXgvhZWk23L7ipX4HRtpPDWnrSzlAgFggkc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6942.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(4143699003)(5023799004)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cU9KNnRWdytVSzZHQ0lkSnUvaENjbWR5MFhKM2c0UTRnZDFXMUZodXVDUDRS?=
 =?utf-8?B?WTNWd0RCTklKREUwaVRFeDdVUnRtNjhDZ0pBdzFESDJIZjVrOUtlQTZ3Nmkv?=
 =?utf-8?B?ck16cXN2d2srK0Fid0lCYXF0R0dZSDh2Y2ozUHBvMWZnSUMzdCtaMmx6MDk4?=
 =?utf-8?B?eWhnczU2YTczQjZuaUpqQ3NrcmhOZUs1NmduMFBKdXFEMEtzdTFrRnJmUVFR?=
 =?utf-8?B?TnNMT1EvM2FiQUlEQ21TQnU0THFrak5YV2tka2thODJLeFVIMVh0VmpJUnYv?=
 =?utf-8?B?aXNGQVA2TWV1QTlqZEdBVjhTWGRzV1FSTWwrTWh0RjFwU2VSRzl1WTNZZUJU?=
 =?utf-8?B?VWZJR2pWMnh3eUREUzBFY091R1I4QjI3OHRVODFpMnBmaUNqRFI4U09qVUdQ?=
 =?utf-8?B?QmlhTWRPT3BCcEJSaldnWGtxM0xtbFFWMXRkOTNqZkdWbWgrQm5Za1hPaDRs?=
 =?utf-8?B?eGxYUmR0L2UzN1hORU5TM0RDNEp2UlRQTnNTbytsZm5Pc3EvZlVNOHZRVnZy?=
 =?utf-8?B?b2t0dTJObUwzVlpuc3NpQU9iZzY3U2JGMyt5Uld0OEhxOVNQWlh5bnh0Y0JI?=
 =?utf-8?B?RDR4aWdRb1hhclArRkpHWmtQUmJUTTJaT3ZiQ2p0M1dycS8yZytNMEFtM0Ja?=
 =?utf-8?B?VkZ2T1orOXk2cUF6d0NNaDBqaTFvZFZVNUtaUXhoMkR6SXVNMCtxeW5jOHds?=
 =?utf-8?B?WWZVVG91dENWdmROc1NMaVF4SGxLaCs2UHBqNVFlTWx5c1JVVnB5Y2pvdmRj?=
 =?utf-8?B?OFU2dncwU1dTbStsa1I4TlB0K1UvVEpHMFB0OFBZTEU4MlYra0RNM25PemNH?=
 =?utf-8?B?UG9vYlV4NThwMVRYNFN0blVLWG90UlE1TkNhVUliLzUxc0dXRWZZU09HM3Yy?=
 =?utf-8?B?RmJERHFMakh3MzQraVN5UzRtczhwMWE5VTZSckZhU1E0TVVkWDFkdGZ2Y2lm?=
 =?utf-8?B?eGxMQmdpYmhOMmEwQjd4TWtsMFdNbllZWWpBREgxMEpvNWF5Z3FuYmpuN2ww?=
 =?utf-8?B?VjRrT2NnSmwxcGVjbVpVMG1RZTJJOG50MmNQRnhIYVlhUWdSYnAydW56ODlh?=
 =?utf-8?B?dll4TDAxTENOdXNIRm42L3NtTSttNHpLWVFPTDNpNDd0eHZvcE5SRXl0TG16?=
 =?utf-8?B?Ny9hTW9SalI5ZEp1ZEo5TjN2MlN1T2NNZWFVa3hFeUFmWkJFOFNxc2FOSzNx?=
 =?utf-8?B?UlA5dDFIMUxHWk5TL0phVGZraU1ucStYWjMySk01ZlU5djdJRmlLUHRsZmFE?=
 =?utf-8?B?Q1lKQ1pYbWhhUVdkYXk0aTNNenc2SlJwOVAvYnpERWpxRE9lRmJBSXRZWGRS?=
 =?utf-8?B?TFRpSlZOeUdnS0MyclpqTzJzbDhlRTA0QkovbzF5S3FjUlZuV0NYZEtZMnJV?=
 =?utf-8?B?S25ldzlxRk5NUG54c0c1TWJjMkxQUWFnS2VNSFRSYUpWSEV0QVIzTWt2M3c5?=
 =?utf-8?B?VlVRNjRUZjdTTGt6TzhCcnBFZlE5N0Rxdk1CM0haZTVEVWhwL1lSTTVNOG1j?=
 =?utf-8?B?SzExcGFqWU5KbGF2amo3eEQ3VWdWUWRvWkhURWVPaEVpUmNPV0J3bFErUDlL?=
 =?utf-8?B?QlZMQXdpV1Zaa2ZSTlFOS1NxNm4rUDFNR25ONDdFa1BjUVRzU1YwV2hpMjdZ?=
 =?utf-8?B?RDcybU43UHlVLy82c0JnT0hzRytoZEl4UnNFdGtlRXl4T1VEbUgzdG1NWXdh?=
 =?utf-8?B?V0kzSXU1TDhCZWwwMXQwbUlmMDVua0dCVjB2aHQ2OUp3TEhLTEMzdkxvanJD?=
 =?utf-8?B?VElwMUVPTW56ZXVoS2NKSVVPQlN3aWVxNnVEdXZOUytvT1Y1Q0R0elFuOVM3?=
 =?utf-8?B?cWNONUxTcThFL29qUVVvM2FXRGF2KzVSN1BYTGoxemVXUjBRT0dMMzRyZUYy?=
 =?utf-8?B?WWhEQmF5cFg5a3VuaTd1TkYzUjR1VjcydEl1ck1Wa01CbldUSW9mNjZvTEtz?=
 =?utf-8?B?TGpKYW5wdGdTTkkyY1VIcjB2aWJUY0ZBV0c0SGNweEJwSWFvTjN4aTV0c0U1?=
 =?utf-8?B?S0xHaDUvU0J4eXVrYW1HRXJpbFB1UHBzbzhFanU1SmcwWkR2dzU4b3pQWkcx?=
 =?utf-8?B?RWxNdGltYzUrNXBjdTY2c1NFTU94Y1d6M1hqc09ZNnZMN1pKYzdvaS9PeVZ5?=
 =?utf-8?B?Vm43V3paTnhPL1Y0LzlUak9YUGNDUVd3d0FESG5veXNham5YKzNYYkJ3NGwy?=
 =?utf-8?B?L1VOUitCWHB5SkQyQUJVaDV3WXJJVzhQeVYvWG5ITVcyakJPbkFyZFFyRExG?=
 =?utf-8?B?VkQzSXBGazZ6a3lvLzkrd3EwRHMzRURSaDU4cW9hbEdUL1d3d0ppRkp5dHEw?=
 =?utf-8?B?eVcvMjhZejVpTXMrMndPMHBSREtQVXZvVWZiUkh3RWcrUHplTjV5Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0852d6-cc54-4963-3de7-08df2ffb26a5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6942.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 05:13:04.4770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4MtDVaJDt1PBh+X5oChLKr00HSA1OvsDOlfvTGAK03LiHDfNwx3ie9WYeN0XYoLzm6KnWIuQneOMfEi+c/XHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8561

Hi Frank,

On 10/21/2026 8:43 PM, Frank Li wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Wed, Oct 21, 2026 at 09:06:50AM +0200, Michal Simek wrote:
>> Hi Rob,
>>
>> On 10/7/26 08:03, Patil, Shubham Sanjay wrote:
>>> Hi Rob, Just a reminder !
>>
>> <snip>
>>
>>>>>>>> No reason to keep hj because the difference between HJ and IBI is the
>>>>>>>> address when address arbitration. If hardware support IBI, it should support
>>>>>>>> HJ. HJ just use special address 0x2.
>>>>>>>
>>>>>>> For this IP, they appear to be controlled by different configuration time
>>>>>>> parameters, so I don't think conflating the two is the right thing to do
>>>>>>> here:
>>>>>>> https://docs.amd.com/r/en-US/pg439-axi-i3c/Configuration-Tab
>>>>>>> Per this doc, and the original commit, hotjoin configuration is not
>>>>>>> permitted when ibi is not supported but can be enabled and disabled
>>>>>>> separately when it is.
>>>>>>
>>>>>> I am not sure why provide such flexiblity, only difference is that compare
>>>>>> address 2 or other value.
>>>>>
>>>>> It's not unusual for FPGA IPs to provide extreme flexibility so that the
>>>>> consumption of resources can be kept to a minimum, often to the point of
>>>>> excessiveness. E.g. for a ethernet MAC IP each individual statistic might
>>>>> have a configuration option.
>>>>>
>>>>>>
>>>>>> This feature may be quite common for i3c, if other soft IP provider such
>>>>>> flexiblity, still common property is the better than vendor specific one.
>>>>>
>>>>> I'm not at all in favour of speculatively adding properties for
>>>>> configuration properties of FPGA IPs, particularly given the likelihood
>>>>> of abuse by others. Without multiple demonstrated users, things shouldn't
>>>>> be considered for being made common anyway.
>>>>
>>>> Rob:
>>>>           What's your opinion? I predict we will met similar problem when
>>>> I3C become popluar.
>>>>           Do you perfer use vendor property fistly or direct add common
>>>> property?
>>>>           There will be back compatible problem if change vendor property to
>>>> common property.
>>>>
>>>> Frank
>>
>> It looks like this thread is stuck and everybody is waiting for your opinion
>> about it. Can you please take a look when you have time?
> 
> I suggest make a version, which support all enable/disable IBI/HJ. We can
> discuss later. I think less possible to config two difference instance at
> one SoC.
> 
> Frank

My understanding is that the next version should support both enabling 
and disabling In-Band Interrupt, and both enabling and disabling Hot-Join.

For compatible "xlnx,axi-i3c-1.0", both features are enabled by default. 
A device-tree property is needed only to force a feature off on one 
controller instance. I will not use xlnx,in-band-interrupt-capable or 
xlnx,hot-join-capable. The case of two instances on one SoC with 
different synthesis options can be discussed later.

Please correct me if this is not what you meant.

Thanks,
Shubham

> 
>>
>> Thanks,
>> Michal
>>

