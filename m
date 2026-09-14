Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9EF3E1204;
	Mon, 14 Sep 2026 06:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367383; cv=fail; b=BIxshDkjZN3oF8dnSmVvZ9hH3rG8LFnDqnMtMUXWRtQQAl+OkPnAtkKnKoZo/twzVIQcCS+/q33FIGzXP0SOXbhZVgT4sm/Fy6PCIW09yNn1U9avNhX9DxJbllLW7PO6MZmDDOmFYEyeKvxSaPwCTAXgWUqZDmPw2wSof4VSRts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367383; c=relaxed/simple;
	bh=jRlCmWPBaL5OwWFVUlNvRBmGc1/FDTS7DaPq2oGRIMU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c+smF/MNB29XprkcTqDWTdsM8nlYbxT5eTX25e5vg1WZCkWgB3fKWALwP8wk3S+P4WLPJMStL5aKPaxbvND/gQwiiJrFYpSxaCQSuF6HLtqP1TAfiJe5AOZIMqMPqLHLFl0kMyrb0uJ71UPZDU+GWkZFbPKSC2sLUg0PmJzLoa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=C/EMTcZ6; arc=fail smtp.client-ip=52.101.48.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="C/EMTcZ6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9GvqiWrUoD5aDBNAEyFYdre1UgebPto7EwsmfdL1vf5Crz6cNuvIfXiEr8f1G0rG4YzNrNsyYbsNEIcwHIiWmL970DQW0T3aaYxf0iCywVReDthtnekW6ADXpp1QREuZspDW0Kvtf3tHQ3r0RPYPk786FzA+N3MRoejsP5SigsfKXc4zEzA2GeH2mq3ieT3+UIVzHyrKU/A8pvxNhGQa9fL8BGxBTWq3mS0sSCMM7F6PN67oTHQgwSK2ajz0dHE6WyrqyQWQ54t8UaL1R+LOhSS9Gkqx/H+rr5bb6hXM2MwfUDltqapQSm9o4dXZEDp4gldjtA5d0330zcVIDX+lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KH2Tf3aUslS0snnm+NLM6WjJeD7VQIapw0oy+Iq9Uh0=;
 b=OXRtmdb2BR8G5xNPlLOuOrjpdtsUBpRlt0QFkjcNTQ8bZV8mlXqa2HzABFol9Cye3KSOSrqr0ar+uyziJw2iCLwZpsXv3Cmhz2rzmfQ4ITbAHVgk0OXIScqIJcGbOSTsqPMTuAK4CUWJ9U2CeLOTA8rrvx/tqEei1PyXmQTfOeDbMqGBjvN2QoXgdYuwGvkgFJr3nakCCsWJzp7GuF6ZfycF53W+BlzXIA6V+tmZrZmDY4f9mFIERicYALe0C4Mss36rgqzQGAHFqxNKJgoL3suRSP5Xj+/iP6QC2oB8vYMga+leRgC2MV8qOQltH/mrNBsfxG39kdZjZw2O27tM6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KH2Tf3aUslS0snnm+NLM6WjJeD7VQIapw0oy+Iq9Uh0=;
 b=C/EMTcZ6FITQFOY7xb9N9IyKUuUDqcVn0nJDqTUa1jMftcJMjaYr75TDgTwpdSS+4Y+DDq7vN9924n00jz23bqW6sUT98xF6aIzEfYP1s2F9Pne7nbAK/6929K2ZvRZ4m46DcVa1ywT1WjcUgtDjvUzUFJMFqzZ/pMnj0LwSfa0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SJ5PPF816B88375.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Mon, 14 Sep
 2026 06:29:40 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 06:29:35 +0000
Message-ID: <656ae6e2-608a-4839-bcfe-941dfffdca11@amd.com>
Date: Mon, 14 Sep 2026 08:29:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP
 VHIP6 EvalBoard
To: Marek Vasut <marex@nabladev.com>, linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909182641.165383-1-marex@nabladev.com>
 <082df9b0-0517-4580-8ba8-cf6f4d3e0713@amd.com>
 <1c39be54-c931-40a2-a806-fa963b2188ec@nabladev.com>
 <e305b607-76ca-489c-b27f-bf45b6fdb59c@amd.com>
 <7b957072-df73-4fab-91ba-9835285ff8c5@nabladev.com>
 <a0d23fc9-6f7b-4c19-9f6f-9cc0c7cce3f5@amd.com>
 <f80845ae-9ab8-474e-89b2-80ac3fbd184c@nabladev.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <f80845ae-9ab8-474e-89b2-80ac3fbd184c@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:254::10) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SJ5PPF816B88375:EE_
X-MS-Office365-Filtering-Correlation-Id: ff8c9db3-2903-478a-d883-08df12298b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|4143699003|11063799006|5023799004|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dfcVZ4k4/s2mZNXofc9Gjx6R3htBD7VGOsvnuRC6m1wkQqpQeJrrXcnxfxcRYbbTderni+Ggi9XLW+d+Eww2RYAsu0t6wwHAxpPbPJFM24S+Q7vJTjWqkmRx2iMUSmQsMJbS6eT+NRkavuTlHQvLG3SduJsf01j30qoX/SfGto0he4QBymgadnCwQckr213Rg+bVvMRoi8pb6f02QMLfCZStuiAM5MCM18H76DyQA3T3lsreIfyEvf3Dprw9b1vNfTVJgc7vwpABk4vJ7an0knkpm1WBTpDPUXQndBfjO9pNf9jOHjyQYKF6MYM8cuP+y5Vf/Ei+3JCp67270VUPtRzk7gejInitd6kz9a3SJucY6Icgze2ZS4vHk09P1iCer6UtUuYxPGKwnOVUSJWPAuQwswfquGbMxNzAFDby71gzr1h8DEsFIUqhAv62qYCBiC6PMPnaVwtRSdf0Whb3yk1E2Qpu41SffSgIaGhSlThGQMn6LM8tfoy0D7fBmtKTyrwr9y5TshZARhviM0DPUmzeoQHnySCfMR9qB7PRK5cnwtD7bqkB8sI2iiGzvFfKnN6kUoEOrlSRa+OfQYLGV6SO637qA/NCMU4V3v99SlFWTsKS7bxjlfGm4hFgDUanRmSqClIjGuEk5ITvYSOfNsBr8BXNWsU8Z6rdPejOwX4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(11063799006)(5023799004)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck1kSTRybTh6bVltL0xObmxmRWVTOGNXRkVYYzc4Rll4R1FEbmVjWVV1WlNv?=
 =?utf-8?B?UEkySFY5YkV0OHY3WU15R3lUdXFFNU1oV2dMUmtMdlRobmozNzRvcUNnVHNx?=
 =?utf-8?B?YmVYdjloU2VzRGtudU5jWlVSZlVWTEVaU200QXlwbWYySmJtZjZFSjEzODFJ?=
 =?utf-8?B?UkxZSVE2cytMc2h5Y3JFU3VBTWNUWjZjRi9YUGFlcVdyWFVJdHdBSXZ1VzQr?=
 =?utf-8?B?SVZ6aERQTkVpdHFTYmVmZWQzNjd3SGNyeGNvR2ZqSGZLWXZPQ0xGcVlWdy9R?=
 =?utf-8?B?a1UyQ1hxMjZkYlVvcUlVaURlUCtEUDB5bHRFTnMxems5VDM4a2FCNUpiVkhO?=
 =?utf-8?B?dXdER0RxK281L1RaYk9VZklBcC9Ya2dJcTZjdU1QeUx6cHM5bDFRYm92Tktn?=
 =?utf-8?B?bTFJcjMxV0MyVE5GMXBpQlhHZkFRMlJDdkdoYTZ0WTdyQUNNUWRZVEUwTUdn?=
 =?utf-8?B?NmhvS3R3K2xDMkdocEpIMU43UnZWK0YzM0FyZnlsZE9ja1hMODBPNktNR3Bt?=
 =?utf-8?B?OG0vVmlYRDFQV1U2TFFQemN5blQvaCtBNDN6YXJ2UWZpdWhGbkd4UUlQa0Mw?=
 =?utf-8?B?bE5jY21oQjJuNGp0ZWdhekdFTWtQKzdLTHYxK28vNHk1VU9sTC9hbzBpM0VI?=
 =?utf-8?B?bVZMR3ZDUUl0Y2FZMCtTemh0WUFpdHlvZk9vMUV6aGFONkxHUW1LWXZ1UXc4?=
 =?utf-8?B?Q2Q5N1BNTmVyUlJjT2Ixd3BUNnRxTFREcEVKSXpVY0paaVY5ZDY2VFhFNzg4?=
 =?utf-8?B?Z2dZNFV5YmdnQThGNzFLdGd1RlBaU05uQ0pyM21GZGM5clVvN0YydHlEVzg4?=
 =?utf-8?B?bEo4WVpldFBHTUR2Snp6ZmVEdjhJZ01ZSkJzS1FMd2VkRnZONnhmMHpzUk84?=
 =?utf-8?B?amlvUUtBb1ZRZVN3dk0zNkxOc20zN0FMTmI5azEwN3J3YjVoMStVdG1uZFpt?=
 =?utf-8?B?ZmM2b1Uza2NGeHBnTFpzUzNTMmU5ZU1rbEsvUzR3SUtkWGdpb1QzL3FScEpt?=
 =?utf-8?B?djVtdDh6aG8rSVBiTWVPVllIQmJQc3ZpOER6WUJLS01ZZnYxR0UxaHBHYzFy?=
 =?utf-8?B?RW53bjRUYStwZnhBNnBZV21Id2xMaEZxTGdhRGhjbXZNRTZvcExQTEpkbTRX?=
 =?utf-8?B?cTIwNUlhTE1PWU1zZ3FNWXhZTG14Sk9ZL3FrZXRJVm5qWExma2ZYVFhpT200?=
 =?utf-8?B?QThENlFRc2ZhUW1YNC8wYUl0S3R1eGZpQXFnVXY5dDNTNEhjVnVXaXBCMm1F?=
 =?utf-8?B?QkRUUlRPZXFoQklFRkZhWWhJWk1rQi9DNU56OTVtdVB1bm1JMDlLNnhEbXRN?=
 =?utf-8?B?dUdxTmFIUEJEQ29VNmpqN2VtTUFkMldkNE9nK2N5MTFZaExWTUZSOTVZY3I2?=
 =?utf-8?B?YnJodWRzTzJBSUF1cDJzWVo4cEZOTHg5Z3I4Skdqd3NlVDQvbkNzWmZlZlR3?=
 =?utf-8?B?bzdOeUpVTnVTaEhRbjMyNlM5N28rVnRRZ2pQbjY4OUU0enNLamEzcjB4YWFh?=
 =?utf-8?B?ZTJhdk1xUkdXZTg4L0VvWTIraWx0TUEvMThYRUFsN3dCVm9xYnF1dDRQWk5a?=
 =?utf-8?B?VmxFTGYzT0t2WU9sU201RXNibEFVRE5JaHVRRjFQQXZtN1ZDOFNRM1BiNjNt?=
 =?utf-8?B?enZMY1oyOHpMdE5mTFgvQkV4RE1jTW1LaVBSL05YYzZ5bGo3b3lQWmxZeHVz?=
 =?utf-8?B?R1QvRkNPWTBhK2NsL2ZNTE83bzJ6Zm9LNmVvNzRzbStRZi8wd3plM0V2bUs2?=
 =?utf-8?B?d25WWUNWdFRZblpOalZaR2RoRFh5T1lwdEdlSUJiK08rc2oxK0tDbDBkNDdj?=
 =?utf-8?B?aUo0MnA0NDdmR09ONUJYTlFCUUhhdCtnYjNtTFpXRUh0MDUzMnpLUHMrcmdN?=
 =?utf-8?B?SkQ1U0pHcmt0LzRwZGo5Zk9rM1UreDI4L2E4ZTFGSGhoblMxaG42YXZ3czMv?=
 =?utf-8?B?U1BjY3hoY2w0T3JUTzlPUk5DelB0L3lkSGNpbHVFM2VUdXB6UytQZWtKWWZU?=
 =?utf-8?B?cE4wY2ttdlB3c0l6azNLcW05SUxja3E0YndNR0N4a1JndmNJS2daZ1BnR3Fv?=
 =?utf-8?B?bkl1aENZOWMrN0YzM0dQZGwrY2R5cXZnbk1RN1dKL3ZYWjlOZ2xWcjdTWFV0?=
 =?utf-8?B?V2RsaTExWDFCY2J4S3g2V3JBR3h0b2RETTRnSEhjdWVpaEIraUQ5QXZwR1V0?=
 =?utf-8?B?TkMzVlFQSXpGa2NkZ2ZxU1ZWRmw0Vm1aRmFNdzFHMklqdS9DZVhpWWV3SzBl?=
 =?utf-8?B?RVB0VnRtS3ovOUNnZTZlbmtJbjZjMkh6Sm0rVmh3WEdLN1Y5dCtMUzQxYjlV?=
 =?utf-8?Q?W7K8bsisVsaMom8gpi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8c9db3-2903-478a-d883-08df12298b49
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 06:29:35.1101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLQdOf06qz0CtdATesCLmjofJl4ZnUn9Co0vrXlpzBmV5LZzBZllazU6AyXnqC3R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF816B88375



On 9/11/26 17:54, Marek Vasut wrote:
> On 9/11/26 10:38 AM, Michal Simek wrote:
>>
>>
>> On 9/11/26 01:39, Marek Vasut wrote:
>>> On 9/10/26 9:17 AM, Michal Simek wrote:
>>>
>>>>>>> +++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>>>>>>> @@ -44,6 +44,11 @@ properties:
>>>>>>>             - const: xlnx,zynq-zed
>>>>>>>             - const: xlnx,zynq-7000
>>>>>>> +      - items:
>>>>>>> +          - const: ifm,zynqmp-vhip6-evalboard
>>>>>>> +          - const: ifm,zynqmp-vhip6
>>>>>>> +          - const: xlnx,zynqmp
>>>>>>> +
>>>>>>>         - items:
>>>>>>>             - enum:
>>>>>>>                 - xlnx,zynqmp-zc1751
>>>>>>
>>>>>> Can you please provide any link to public documentation about this board?
>>>>>> I wasn't able to find anything through google..
>>>>>
>>>>> I do not know whether there is any, it is an internal board from which 
>>>>> other boards get derived.
>>>>>
>>>>> What would you like to know ?
>>>>
>>>> I would like to know value for me to maintain it. Why should I care about 
>>>> board which don't have any public documentation and none can buy? 
>>>
>>> I think because the users of this board actually do benefit from having the 
>>> support upstream, instead of having to lug around random downstream patches 
>>> in assorted state of decay.
>>>
>>>> There will be thousands of similar boards out there and I am definitely not 
>>>> going to have all of them in the tree.
>>> Why not ? There are users who benefit from having their board support 
>>> upstream. This is what other SoC vendors do as well, it does not seem to be a 
>>> problem, rather it is a good indicator that the SoC has users who care about 
>>> it and about upstream.
>>
>> If there is public documentation about it I don't have any problem with it.
> 
> I do not think there is, but no public documentation is the case with many 
> boards/DTs that are upstream, and it does not diminish their usefulness to their 
> users.
> 
> What do you need to know ?

All these SOC based boards are created not because of hard block (PS part) but 
because of programmable logic which is not described in any upstream project DT. 
It means no matter what manufacturer has to maintain PL description separately.

I don't really mind if other maintainers are fine with dealing with these kind 
of boards without any public documentation. There is no way to check if even 
your description is correct.
I am not going to take any responsibility for maintaining them.

Thanks,
Michal
