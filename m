Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013039.outbound.protection.outlook.com [40.93.196.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70243A6B7F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703493; cv=fail; b=ool/MgnQZP5jZZGtbPf1Rq8pXVIa/7STMHTzR1ilP1dGj9ashBFuEgtMIdxr+Np5MlYGSi3BVgTpgWNz0Peplfd0EtCvTmSoZCaSTfwdeiqOLpLjb9xPMKKs06hvVE+efO70TlizsPy5+Jg/Z64FZTxGbQSVCoje1kwBOAnQO+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703493; c=relaxed/simple;
	bh=0KEqfQSuH9yuY5AHgnituavPBs5VrGV5kfXsQJf/BFk=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rbTAm0aAs9oFeWvYFFRCd5E36OSLvk0lWfZutglc0r+FQBLN18so5FWpg3regyEERyvQ8tCS6uRKDlQUHvZdCuJKDCJRn40glzwZcgcA/juN0QHLRSfEl8VQNzEBwWQKWsnMzyL5dCvigzlzt5wwS/Yo+43HhXpf2dREC4oTAuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=citrix.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=V/NLtrCA; arc=fail smtp.client-ip=40.93.196.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="V/NLtrCA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSblU3xq8k7TNafK6LBrLtoOUaX2AG8agqA43UxL/PbyuVlZucFx6wl6AwhcON3ZUvkAdp7hUdA2HCN6ZhTLwOPFBSLnvkaH3P81lVikFkYsiP1XU/6ueD6CBtugHdIYoTM2U/9s2wJcWF3uRF1DKH3BrW4wIAWrPOBmRGdrXxmQlPMdeyI7Yc+zEimg9Vdh6WxqDRND8Mdi+tdiNnxhBGSVg1Ic4c05U0febe8EkV2wieNIO/jgbDcrf0jOTkoQl97QGD7q8JG49g3VzbuHjquxdyG9o6+GkC+jN5TG9x13RVjwSczx0P48ggh2MCyDP9IoGpsovCQV49BKdR1hjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KEqfQSuH9yuY5AHgnituavPBs5VrGV5kfXsQJf/BFk=;
 b=ck20wt5EGe7sLGXtQPuN/1lQXfhIafZTOr1Cp2VTXCFuoT0VLd9NrdrLRLwkA/qymQjkRaDOYQL5jSlMhdjFZ2zgPNEIsnPNy4scsAbfvhxAsU5IaprFlTG7G3Poyo+163uIfDRPNip9w3/HgyzUj+0dZvpayTjGGlf1+yzfv+yceTq5fvzNexl5DPxNVxMHeAyS+vMmts5zmnM+mXzBbNe9NBjmsDAnEPJLc7YhsEZfbhVvAvsYTZI9o86MGa8C+FSnrbPv8N2RJxL+2aX2HbP1W1bTE0zwyM0iTc8Fkvj0TQp2O479WM4wQbbcQKzV/fiatIG8hKZGKDbwXsbdAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KEqfQSuH9yuY5AHgnituavPBs5VrGV5kfXsQJf/BFk=;
 b=V/NLtrCA3KsGwhEE7iI4y+remsjmU07p7JbqAHGPmfKVyNPyMDnT0XjJ0rFN3wObKVnz9ZNc6Qu0Uh8pKWW584GlbPpZQ9vWwv+0WxQ8T+9SXU7v6S8WqvKOcvq3h2hB0NVJrHiz8UpdsdihJHEkHFlJk9xPiGP0qvH6Q3VODPk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5392.namprd03.prod.outlook.com (2603:10b6:a03:286::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Tue, 29 Sep
 2026 17:38:09 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 17:38:09 +0000
Message-ID: <720c9418-6fc6-4090-b56b-c6862063f39d@citrix.com>
Date: Tue, 29 Sep 2026 18:38:05 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Nikolay Borisov <nik.borisov@suse.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/microcode/intel: Refresh old_microcode defines
 with the May 2026 release
To: Dave Hansen <dave.hansen@intel.com>, Sohil Mehta <sohil.mehta@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org
References: <20260928222607.3593973-1-sohil.mehta@intel.com>
 <9c7c9b2b-2d1f-4b51-a411-e0869766e3ab@citrix.com>
 <fdacae40-f4df-43af-9f8f-7c80df5d42f1@intel.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fdacae40-f4df-43af-9f8f-7c80df5d42f1@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0109.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5392:EE_
X-MS-Office365-Filtering-Correlation-Id: cc839bc6-2798-4049-f990-08df1e506d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SXs9X00/WU0+7LvPHKFulDLLjMdYvWLf3L+IT3ody5qqgx0rdy05N4pwCVPvG+ZYLoaqBlUL02w5ceiiTkRP1uwmyQa68hZdxjGuf/KvRozqSvk8W+lcRU1hnmAIXzOLJtaqdMOsdjXfVioJcBEiBCY21BXlVYq122sYJEF2G9DaDb2q6MCl6pwUE9R5j+4k2zAZ7R++yEkELsUVSiClgkLx2yHxKwko+PGMMCpuwA3pNTtH49JfZ9m4opzFBZqacbjvPFfPJQvJ4fn/voCT9srB3XMXgkM2UTcgMs5DeQSL+2rAY3Q2aifGTOj1QgcL2XhhbPDQCove0Y2iQ/gqiNXCwynpPEeNswVP8C4MiujN+tb+JW7aQUI0Cnt5f2v510ebxHXFDm5+4evKbFVndiOemgcEvO5UAa7VYoFlEPlGk88OPU+JbEqIHyMsuTs/FM1FeTr4beehmI3DbiDkMiUEMGEz66+I+vxAoZojVzQfpN0p12uCdD9Yc3g3B2h+8faJcdotNfPWaAGPw9mEPW6HxhNYq9SgcTxtGODylQINCYb7ZyCt3FIiO//whTdp9mAKkNteBQiopNoq1f+V9/xBY6cBHhOGHyvFhzPX1gApCbq81iW7s8xOh7UHMfHkNBTFAeh1LK+M1+CsHYWsvw99ycnXgZXfI2uWlZk96L8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3pZTmJzSEhrd0RWbTBtaXFTOXkyVmlsaHorQ3VhTVNhS1hWS3B4bktBUzZy?=
 =?utf-8?B?OWFhK2JFWnhVMmswYnQ1S1NBdERVeTMrTVpXMm9FbVNNYUp5T2RSOW1PWHJt?=
 =?utf-8?B?S3lGMmtyOFhzQldMYjRJWk85bHNYaXFnU2tVREhMYWM0RnVVZGlrQUZjcVZ2?=
 =?utf-8?B?MlVLOTRrMTFUOG5zbWNaMERiVlpPeW5OODRGV3RlSVJZaHhmczRsRTd1b3oz?=
 =?utf-8?B?d3AwOFBERGZwSHNRTmRyWEcyaHFiUXBRckRWZlkrU1FsUTRjL1JqWWpJV3FW?=
 =?utf-8?B?TEw5WXFKT28zTnVXUG12eTUwbzFIbzR1VHpOaHJVdlNTM1RabmoyemxEZ0Yx?=
 =?utf-8?B?UTYvSG5XaHR6L015U3BJeFJKamh2NE5IRjZ3SFh1SWdOcHI3U09YckRoYkoz?=
 =?utf-8?B?MXZLMG94QnVuTFVPc25VRDRBNWpOeEpuWERKa2NyQXovOHprTVhPUkI1TXZH?=
 =?utf-8?B?OXlkWG1HNit4MXdZN2RNYm11NTg2WjRTWnNFemFncVFzTHR2ai83NVhUVUFx?=
 =?utf-8?B?eXhQUmpReThPMXNKZHRNSm1ZeEhkT1hYVm9VLzhFYTJZeFRRaEg1anFnNU1G?=
 =?utf-8?B?V292ZEd2MDYxZzdOYnp0WW1jbVU3TlJoOVhJSThDK1VlVnR6S3pERFE2bElQ?=
 =?utf-8?B?TFpwcjQ4UXZ4eG9sblFwRmFXdzBtMkQ2VkF5bHllcFlSeTRuRlNnR1lvZVVz?=
 =?utf-8?B?eDJEeldmWkRMWHdxSm9OSXhRT0FEL2NUc1RESWVOekhxTVl3bHZkQVFZVFE3?=
 =?utf-8?B?UWxhdlkrSUU3aUtCQ0YvdXJHY2twUTdpRnpMei9JVnRIWnExeVE2OFBieGNj?=
 =?utf-8?B?c2lwOVdlMnliZGNISFdYL2tKZnlQUTZDRSsvYWxyMUhYWWt4RzFXV0hPY2tB?=
 =?utf-8?B?ejRNbTVyYUFuZWtnU0xXZ3lHcFJhSnZTem9xSSs1OUZ5djFYT3RWR0JNNnkr?=
 =?utf-8?B?ZGU4Ri9hcGxYY1ZDYjdYaXl1U0FCdGhLNlE1akNxZzBSMXhiQitUSU9uam00?=
 =?utf-8?B?STNRYVdKdGtnRkdVZVE3aEF0WVozVEhhVkVGMTk5VGU4Q1pnZkpwcU54bXpw?=
 =?utf-8?B?bVBrWCtzaGVCTnZ2V1FMNFo0MjdIZno2cWVCTkp0TGVQK2dUZVlVY2kxY1cw?=
 =?utf-8?B?TEdhcTROY0lMQUxFY3JKTzlJeTNDdVZWTldxT3MwcnRqZ0o3UHdqVUhYZHpW?=
 =?utf-8?B?d3ZDR1ZVU0c2b05tTWRlajdzR1dqWUdLNS9Gdk82Kzd3cTU3MEtkeWdYNXlD?=
 =?utf-8?B?dXY5T3puMU0ydUdnVzNYUmpsVjRQSFhTS0x6ZkM1SThHWVo4S1JkejJKbUt2?=
 =?utf-8?B?cEFTMmxzVXBRcUlrdy9QMUNpeEh6amhKVEZSUkRsd2J4UjEzbENWSmliSWxN?=
 =?utf-8?B?REVDUFJlbzNRYms5N1pSWW9uYUFiVzJPT0RoRUdvZEVCc0VteHBiNzhieDVH?=
 =?utf-8?B?a0RXTDFmT2pLSkIvcEtqak5JNUxzT29Kd1ZLTkNCYURGNGZ2aFZmTU92QVRN?=
 =?utf-8?B?YXpNZkpPTnlHVVcyQkpiV0Q2RFMwZFF2eWE5NmZqUU5ISWd3Q2MwTmRCOFl2?=
 =?utf-8?B?K2d0MDRKYjg4R0x0WHJDV2xuOGVXU0pJRXlWazVJWHlXQVBXUWZWRXpsaXVa?=
 =?utf-8?B?T3ZyU1Q0Q3JxTHlVTWwrK0Vpa002RHJTSHUrVXRWSU4wY3VqNUJocFgzL2Uz?=
 =?utf-8?B?U2tDZlBmZ0VWRTZOdnJYalpNOWRqQzB6RDQ4TmJFd2VKQWJIaGJPNmsxNldv?=
 =?utf-8?B?dzJyZDVIbkYzbVo2RWdScXZWVU5ma0wzSzhtYTFWQ1JDZFNmclRGdlQ4NEpz?=
 =?utf-8?B?b200ZEZ3djcyMklWdzlncjV0RkM2MnpBSllTbnNJbTQ0bHNBcHJ1MHA3SXo1?=
 =?utf-8?B?MFFEMEtYUXdEaEhLZVdtTmxNZ3JMaldhODlxdUV6NWtFQTZZV1FMZU9JM0ww?=
 =?utf-8?B?NVJKQzdJc3NKR3dneFYwLzJoNEpZWk5yQTBGV21TSzJLTExDNncvWXAvQk4z?=
 =?utf-8?B?WXVHVk54dk1NS1RKZVZrOHJmd3hIWE1NR2phNEdsTlJTZUpzZW1uN3V0OTE3?=
 =?utf-8?B?amZDZzNlVXFEZWx4VDFUYzl4eTBXb01Ddm9OUnd3cVZxb0kvS2s2NmY5c1pT?=
 =?utf-8?B?RnNCU2xwZGdQc3FQRTJJMW43aFB3RC9SUkV4cEo5M3V5dDAvTVhPYXcza1Mx?=
 =?utf-8?B?TXBacjNXUHhtVkhrOFpucnE1QW5Xdng2M0JOVzZLenY1S296STlDdU9CTk84?=
 =?utf-8?B?YWVOeFEvN1NYYThnSElnK0ZoaWI2S3IxOHN5NnhNTUFsL1MvZXBFeVVEVjhC?=
 =?utf-8?B?QW1rcXR3VjEvVGszblhSSGY3R09pU05UazNDMjI2VVdXU3JZVG9aenVkY3dM?=
 =?utf-8?Q?0j/80f6T6ukGo3Lc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc839bc6-2798-4049-f990-08df1e506d77
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 17:38:09.3423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLvd6vW6wdR8oil7sPfgGJBPvdODDeZv4yF/x8wmIXEoby44RKtSdiu8cqGOCb5MyejXE5GuTF4IY5YUvIYOakBhCJaMpKndtV14OqXXb3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5392

On 29/09/2026 2:30 pm, Dave Hansen wrote:
> On 9/29/26 06:08, Andrew Cooper wrote:
>> This a known-buggy SRF ucode.  The only reason there wasn't an explicit
>> retraction of it was because a newer IPU had already been published,
>> with 0x030003b2 being believed to be good again.
> That's good to know, thanks.
>
> But, for now, we've chosen to trail the ucode repo. On some level, the
> kernel is always going to be "wrong" to some degree. In this case, the
> cost of being "wrong" is that we're giving an answer to the old/new
> question that's from May and not August or September.
>
> The only real way to fix this is to be more aggressive about how far we
> trail the official repo. Is this SRF issue a strong enough reason to
> change that temporarily or permanently?

Oh - the error message doesn't print the revision.  Maybe that's ok then.

~Andrew

P.S.  Not that such a system would be alive enough to print the
microcode revision...
