Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908593;
	b=HSw3G6vp+u27XVaZ88fyxfa/46jIwYoK/2fCymFSJ34gv84SdzbOBiR5A1V8HpRLeC33
	 CWjCvqLwil6NyT7OfwJ1WXS6MMCWGjusclOeoSzthhyZcsKOd+w3fK3m8Bts/why3eo0e
	 WtxBD0S7UNwgi9sNmM3DPrcG56juzmEqEs9Bmn39QFkAIYr5BUjjlcLuCTfn2x4k48D4X
	 MEirBW8uv6aBGDvxfQBYPD8Wufng3dLc+DNKl/2LQ641IO7TDaMgmpzONqeFMB0CIdVN1
	 PMBIdCQuMzdiKxmeFuj3oxVYnenHasW59qR5WB1ZFZEytC/QuHKhQupPHP/5S2R/+og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908593;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Dddi9Low64SzK3xCjuZ/Mvzy066T/pxr3/2Aa2Ddr0E=;
	b=sIA7UIizGhEW92QACsR1Nx7b3VdlT7jdstk22g7tLD9Y/6cKY5XNEDLtVHpzu3tXonkY
	 6bgoLQvmWIOJC/FlnDdVpbEPp1w4KqrFbiRULzscjDvCO/FCVpHNqqok1M0EVeSZg6xFC
	 mmuilk95kC7sl1RoNjvARBPN7lM+U+FbsAAHdERzG3iXpJKVrdvZs8ZzMd+36gK95xh4b
	 OK6mUJa0SNL35mioqbrAakcbDLxCFpi3tgYtEkSE+tBtGvo/cV4yxVEj93syKmFKfND6z
	 9L7lI+dvCjmomG3euvRoHGy4Rjm7aPyt5BsMyCfFPERwYZNaiWmNA2O3rUGTv2STMvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=q1efBAyV;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=DzOL69TA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1AB606A332;
	Tue, 17 Nov 2026 09:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B1AB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=q1efBAyV;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=DzOL69TA
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8tDsL1792250;
	Tue, 17 Nov 2026 04:42:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=Dddi9Low64SzK3xCjuZ/Mvzy066T/pxr3/2Aa2Ddr0E=; b=q1efBAy
	Vrr2rToEvLGnnpSVR+4aoYv/pnj3oN4ZwifXHXZRx4hxDuOtKjygR0i+33R0BGWI
	ZBWDoGhOItAqBhq2DhjjWqxn5h2qb1qJU6fPP8Zvr3BSHsjYFNNkT2K7GguqGuge
	P4vnoJCIyHBcO8yav10xmM7B+7FeU2SHr/Zqwca3VJWEAr4TR2w9pFiy+lS6HxtV
	XMRqP2HSEcD51aJ4qPOG9tt1PNZZGLzM3SczW6kinPMYXFZx4wDlRH7j7jhEmLD7
	04+vk3zSiAJ5FAXiMZtrD/szFOyoidwBBRawTm2cA11iFIer82Hv+5VjMwGE3dGH
	Rwu7x8uZykcqXBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Dddi9
	Low64SzK3xCjuZ/Mvzy066T/pxr3/2Aa2Ddr0E=; b=DzOL69TAQQYz1REjrHf8V
	z5b8mqCKHR+07bI3aGpFldAOo0VMKRRyMS2xWz8iI2jDNYC+jkg51XQ1HuvP0pcI
	EJPEgIVEKxartf/8LG9Hvp2XKtybxJL5yEqbs5vD4e4a/V0NqCD/HOhi+pHjMa9v
	Bc3MJcazBVcKASPNivTXhQC67E0KkFC79kqHhfbK3LRpPBw4yvqB/cbYQi5C120V
	jJYwQgTGsH+QrGeMgDaME7eAbKppp1GjukOUe7h9Q/15XHbe1xW4EzgpHCcYAC3L
	ujj9gpKZxqCTbCttdoQQnwpuNdeNegkAOjKsQHAZdgugPDNOA3A2DbvAFtt1KPkW
	A==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010005.outbound.protection.outlook.com [40.93.198.5])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j0kubg8hu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 04:42:27 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SLDkob89hXu4TnIHUVEKZJMPq/Er/Qw161bpq1s+F5oZCdGYdPqlEZltyG9UuVSd2B7vcsRdANfO5QgETbL4xLcQ0fTkOrCFrUIrnS1kquY9KUhMpyBByB7qp5EpWeZtQudK8M4eDxBYSS4cH/1kv9U9CdCB+esFOEd71lzlhqE6VYy1OLXqABzE89K+YGBig+CZra7zZamzWL8XJpzQE/5NnwI3AQv+3Ag3RDVhkVQqAayqm+F17jl4c5kkW3u6MdkUivAd/NuRrwf1RzzJ3keApaT8ZLV5qt0lZcrblWg2faQA/oqhJ5c4D11cJ4ryWVM77VfaJ8MMI/ntKQPSkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dddi9Low64SzK3xCjuZ/Mvzy066T/pxr3/2Aa2Ddr0E=;
 b=h4IJrxaawW4mw482jDB6aurlSXwji17Q5aFany0eaA5Ew3ighmQ64zEfMceLU3YVnt+OyvFfLZx+GhXCHuukp0FJbEFQifgdGp9fKVtFdoBUmDpnihqDFI7uOJjCo7sncdHIq3dA9Qgjv0Nm+oCW6/+NTBHOCz2AY+/aKGQJLK1FTyWGqT0hyeIX6qgXQJlSRQPRdjQYxUTJZFncZ7ZLOuviIkcP0dmsBlIE7ystqWCkR6bN6dQ+b2i5EubV2Ak0/IY8zxEblwvDMhfO+j5DNVT/e21NqgG7yBH01e4TZSdFY4gYbG0DmfjKp37xLEurLQT97i4r1nG2a/N29w6qkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by MN2PR03MB5037.namprd03.prod.outlook.com (2603:10b6:208:1aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 09:42:25 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 09:42:25 +0000
Date: Tue, 17 Nov 2026 09:43:44 +0000
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Michael Sikora <michael.sikora@axis.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH] ASoC: adau7118: Advertise support for S32_LE format
Message-ID: <avwhvlIoendZIfnU@nsa>
References: <20261116-adau7118-32b-with-coverletter-v1-1-c66b3c70d228@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261116-adau7118-32b-with-coverletter-v1-1-c66b3c70d228@axis.com>
X-ClientProxiedBy: MR1P264CA0168.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::16) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
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
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|MN2PR03MB5037:EE_
X-MS-Office365-Filtering-Correlation-Id: 776fb874-3c92-4ca6-c73f-08df448f1644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|11063799006|56012099006|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|261009221227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	v7qPqM6Oy0GsQ146FCShwFnpu9RM3SOjl41YTHGZZUgbZzNXOHU7gWVGK2rcuHIUyfqQndcDVNpnbDtoTcRoJfUZT9eq+eeYme/3DVkCCA7dsfqAER8QpxErahqJUt2liB6cKdsEkd/4A5/OA5BjKpUNTXPUlbj5Y9ypSsUF8kCMt2b+ZZe9jPYaZlW1PgoK31j+ZD+H0Ykr9NWiK7zWbK0Qd0H3D3ANFhdtUcZLzfKgrDVw8oBJFcSCin9ZkDXiS3Rj4mcr7hcAuiMzgYi5Xw5HFoWFYdlylD+/j0etVRCswprjMRfYS5of+AGA7s042JkEvljOsXxzyX8eKfBbs6Th6vZIMOEr8y7a4TfQblTenJLVejpmpdBd6ACWlBKQvw79wqNcEtbv15cp0AlcOM5YOwW7GGLraU3tSWD0ktCoJJjPWcI03YwJLaMjjnmVVC3+qw0+fCl46drNebs1qBxHYp6YDinR3LGmxb9GzWOKwuseFMKArFrEg4OEbDXuIrS3Tpph5u8Wme1mJ9lw1wTCsYALbt+ojwabeBMZOF2iqekY/gFY6XSpp5uwZI2m78YDxlomLbQU3DHs4+GhMbVa9gQiMsQa4AEpic31wbvE+nv34FaSQ5owNSOw0I78uRVQ6r6zjaSW+OU75PDY47I1SCef5Yz6kv8bQ/HV0p4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(261009221227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czhHY0E5UWprVDRWWkV0VlR3Y2p2a0loUG5SdmdlRFh3UkYvQnFNd0xLNWRy?=
 =?utf-8?B?TXR4dW5VZkUrUjJTNVJqY0t2WmFweFFxWVQ4RGNhV0s2Tzl6U2pqbVlKVndU?=
 =?utf-8?B?WHhkcWVnTlgweUJIUTZaQlZZclVOZGNiYVZZRDRmZldpYjh0RjNSem0xYTds?=
 =?utf-8?B?UEErYTRId3ZReVBjWHRsVitsejl0enBJTkpCRDdQcHovSm1WeG9KdWZONW0z?=
 =?utf-8?B?MWR2cURIa2laQ3RmdXdRUFR4TVhHUDVrR0oyeHlCT1VVUlNGOHgvbDcxTW1Z?=
 =?utf-8?B?SGpieDBSSFo1YTY3RXExNDNIb3JwZ253RFgzUWp4TVVnNkNUUG0zVUpvcVpq?=
 =?utf-8?B?VjJrekJTU0x4cFNQWmcxNkI5bXpDQjA5eis5QW9JSFJwelg5dlZVMjgydTl4?=
 =?utf-8?B?bEptdXpoN1Q3VS9ETXlqaE5ndmluN3ZnWGpON2Q3NmcxUXNvUE5IUEpDSkV5?=
 =?utf-8?B?N3ZYNWdXaTVsL2lEdnZhRTZoVzhKL25vSW5mV0hDWVRybGo0UVo1NURXbE1o?=
 =?utf-8?B?aStvaUFoYnVqa2lHMEhnYzRkdmpsNVA5bHczMGJaWVJ0a1U0SEkrYlRrbkMv?=
 =?utf-8?B?ZkplNGxsVGMrWGk4Nm1xMkViMUhNVnFVZStTaVdpZFJ0dm1lQUExNTNHRTJR?=
 =?utf-8?B?NHFhenl4UHg4TW0reE9wT1hYbmRyaW5IYmtqSWtGNlpsRFRJZ0pibGk5VTMr?=
 =?utf-8?B?Z2M2aEhOUzEyRFcyUzhmMkxQbnN0R3Q4K0dzOWM4Z3hidzl6OGNKWDZoNTRV?=
 =?utf-8?B?bTREdWpOYS9rWWt5NWR6U1A3WVR0ZU1IUXFaWjJsOU41SDNGSVkwZ2pTbmRk?=
 =?utf-8?B?ajhWZTVpTko1YUVuWEd5NFdVakw2MUcvRTk0dStuY2kyNDBtWGp6UWRmOC9s?=
 =?utf-8?B?SXpoMG5tMVJvWStTRVY1TFowTmpUQnNRWFlhYS9iL1VLQ0pLUEM2eGdHN1Mz?=
 =?utf-8?B?My9PVDRDS3RoSHJFNXVpOStScG5kRURET0lONmkwdXRwMGJyNlpiMUR5aU9Q?=
 =?utf-8?B?KzNCZVFaMHlyZ3V4WjMvVi9CN1UrRzJqR0dNZS83NjQvUjM3WS9UcXNIWHkx?=
 =?utf-8?B?OFZ1eFdjZG94YnA1RG85UlY1UzJUZW9nK1VzSTl1MWhtZG9XdHdIUWxnYnJi?=
 =?utf-8?B?bFVzZG0zem1zVVBBUG5BU1B0NitBY2xDdjd0SldoazJFQnFTWlVwTTFHQzh2?=
 =?utf-8?B?dlFIZzJxTHJiRUVFVkF5ZHlzMkxZemJIam5FK29wTFhzdHJxTkpoRVVabGtE?=
 =?utf-8?B?Q2xWUmEzKysvVitnV2VxNCtHenpSZ090U0ozTm5vWXZVY3N5ZHk4TG00UXNm?=
 =?utf-8?B?Rmd0d1FhN0pZTWFORjdnaFA4NUQ4dkVhQTNsaEwwdXBVa3hZL2JSVjF2cWtG?=
 =?utf-8?B?Tzg1ZktrWHBhOVJLcE5Td3RMaDVwZVVMMW1lKzUzY2VwNU5hNnVaWGRtTHYv?=
 =?utf-8?B?ZGYwelVyUXRtU1V5ZTY5SnY0eFBNRStjcDVZcEl0QmkxQTdEdmozWWZ4WEJp?=
 =?utf-8?B?MnV0NDhkRVV2bGlackpXdm9BU3AzSG5oQWI0NXAzR0xHaGw0RGMrODVjMnZk?=
 =?utf-8?B?QndlYlcxUFUxbjdXdzAzZWIrRE01WEJNdlNsT1VnWjh5NE9IWFI0bjB3YlJ3?=
 =?utf-8?B?THBkY0RpbTRIYXpUZUpVMFdlZnV3ZE1UcXRBNXBFZGFMbVdXWWxxRXdUOS81?=
 =?utf-8?B?VGU4T3BjbUUveVNYMUpuNkVoN1REOUs2WW9LWWZZRlBMRzRxSDAyYzQvbVJh?=
 =?utf-8?B?eFh1cXBoVE0wZy80NGNHdThBUThaeWVTMmkrZ0FZWm5rUEtxQ204Wm5nbUph?=
 =?utf-8?B?Sy9wWWdMNS80T2ZTRUdINWdxeDIrTm1iMks5cXBrNVdEb1hxOWw3a2JCZ29X?=
 =?utf-8?B?ZTBmZlN1SjcyQUl0bzJlc2twT1Bqb3dvSTZjYW43WStkQjhJSHQ3bTFYdzZy?=
 =?utf-8?B?WVoray9XWUFPR0FJUnJPaXB2cHFSNXNLWUVWb2dPRityUFNLeEJheDJ5NVI1?=
 =?utf-8?B?ekhOalZoZEM4cGZKK0NUTHdaU0tOSWt5MU1DN21lQXZsWW43UXBXSkVCY1Vv?=
 =?utf-8?B?eGRUc20wWXl3bThrY09HbGdQcGxVOExHOG1lUmVRWDlDM04zWG1TdWRSRXR2?=
 =?utf-8?B?OFduZ1k1NXQrZERYSXlOazZ6SmwxbHhIOWg3YkRuTXlQam56QTh5ekRBd0xP?=
 =?utf-8?B?a2puWFZUVFkrdVo5NWtyUDJBQzhzS0lTSGgvcTlBQ1QvM2h6TlIwSjR3b2FW?=
 =?utf-8?B?VHY2U0d3S1VsUXVGMVhSL0NXWEpGcy9sRkNJUTNYQmQ4bEVMenFBNzJXSWRl?=
 =?utf-8?B?cE5rc3A0TndXWEhXOTRScnhoOE85VE5zMG0raW9VNHU5VUQ3ZFZ1UT09?=
X-Exchange-RoutingPolicyChecked:
	4ddnWZc91TGN0jvPwfq/vlO21VqBdri7N1KJfaklIGlohA8YyfCIrLZCg6tQUdn4iLtjcT18AwScg7Ylntl0fFbHUrN8L+IbYTJ0gDSLA7J15nmHNZb1ViDm6rmvm+fljrMNJBbiETm+ZQ/9Z4VPMXwg7xP8Uv8wvTy5mRSv7/WzYKOH1FohGjtIHTh6GMQuqbjJpbgI6mvkacS9QwjwEprVfC/1LQsBlhaLpxkUC1XvkErPXdYRSsC9pfij43MpIwW70w52/YQlTZFZo4XcJiqYsRDmDiAjyw2bo6Y4UslFIh160cRyGebEvL1wCHkkiwCERMxSoBlpq8NpUgEEUA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 776fb874-3c92-4ca6-c73f-08df448f1644
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:42:25.5872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ka1xhzvbH0EdQ0aMxpAxUrL2HRh4wFzccvumN/bxpZqNeafXMM0hxo6qXoNwH8SL/fTJGKx3fi2uMO4ADbC5nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5037
X-Proofpoint-GUID: HjJWPh6g5yCyOevNbulL13MB5usmnmjq
X-Proofpoint-ORIG-GUID: HjJWPh6g5yCyOevNbulL13MB5usmnmjq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfX1M8JeLXgz/Mo
 VIdjWQCfzMfYSh1dgC55tQFO086Oltz2AtMiK6ttE+6DLTV0T7VBeRCnE3NIF/9+IOWPCjt9vAm
 /WCSpD1wuSUGKiS3/49qQFDQZshMt2F/D88mr9hCjoDwFqG2hu9W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfX+7/qn18okOKz
 LTwmJkFwTvFZmHVJNqNkcRu6x/neKewWbC55HxotQdx43mfpqQOWXMYzNy1A+8pGrYguMt7ril7
 H697KfLGpcvJ2noAyW9oTTkttrHi2KllUoUglGbpmQ1YnBT9hL89IxiH/v51eHxXM6ICERST1NS
 5K/qMf3BcQjTyYfRCiN6xJvb7X47uVocg5t090plAHSQGa9QTG5VomZBmzkUxxioFona3y4j7ek
 VZIT2lrcVowPhFa9wE+2w1784O8CQxfKjhFLDPpmBdj38dqRmxDZX0WLz4To85KOZkbEWlkdC1O
 W0BHPunrs5HcTR8KEsZneX0gedQpgoi3gypJuGb3InQPGWDXCYxJVlKFh+J1sUzFK1O+0MQfrQ0
 t28npoHlGZdfkPdsZB56I0DaxgEqCXKiOfsK1FaAecWQj8MPg1x8gbHE/kZt1N6CUh8drol6crj
 aMseCLd3Sb9qsfpzuTg==
X-Authority-Analysis: v=2.4 cv=JvxkP84C c=1 sm=1 tr=0 ts=6afc2183 cx=c_pps
 a=bt8r0o3PvT4lvF5YbTRm1A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=3-RhneuVAAAA:8 a=gAnH3GRIAAAA:8 a=-wqbz5mHghZEbz3iV6UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170038

On Mon, Nov 16, 2026 at 10:24:27AM +0100, Michael Sikora wrote:
> The ADAU7118 supports 32-bit TDM slots, with audio data left-justified
> within the slot. Advertise S32_LE as a supported format in the driver.
> 
> Signed-off-by: Michael Sikora <michael.sikora@axis.com>
> ---

Reviewed-by: Nuno Sá <nuno.sa@analog.com>

>  sound/soc/codecs/adau7118.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/adau7118.c b/sound/soc/codecs/adau7118.c
> index 51064b6217d8..befd6f632af9 100644
> --- a/sound/soc/codecs/adau7118.c
> +++ b/sound/soc/codecs/adau7118.c
> @@ -446,7 +446,7 @@ static struct snd_soc_dai_driver adau7118_dai = {
>  		.channels_max = 8,
>  		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |
>  			SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_S24_LE |
> -			SNDRV_PCM_FMTBIT_S24_3LE,
> +			SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE,
>  		.rates = SNDRV_PCM_RATE_CONTINUOUS,
>  		.rate_min = 4000,
>  		.rate_max = 192000,
> 
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> change-id: 20261111-adau7118-32b-with-coverletter-63c9f924ba3d
> 
> Best regards,
> --  
> Michael Sikora <michael.sikora@axis.com>
> 
