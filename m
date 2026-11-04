Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.33.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793826510;
	b=LbO5bM5Rkji1TmidbXsrbolsvl2cEl0UYYRWX/7lyFDTvCHbeXWhVF0A2SF04lZ7O0U2
	 5SSz41WqAhlGopsmGmiOzvv7w2Aijt7pF6kArvHp9wNpC/rTE9ISIHLZMv3LLKUgItLUJ
	 1Ihari5MT+kRddRxJ8PD7gTRilycrVYdvq2Ie8VJi//PWVQ/qABTvCR2eWH3SrCiMnBlN
	 QlyKeAYQhJ8MQSezS7MVKYJ3QUE2DKmBFD/3o3WWFpmjozW43uJ7UlWPfvZ4CqRSdrQVl
	 fDzP1H/s05+gLrV3mJ70XwvmiE6Z1+W7AectdboBwBRTSPpo4y+gBUCXl9ubWQoSQKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826510;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=28u2nKNrpy2twmpX9/yt8jvSA2qk6vQ6x7m5KOFlVDo=;
	b=bBzNPSHdOezOnZfMRp3Xi+2zJx1xqa0+wH/uUIJVn7i8TOXqtgzVB1XJHQiu5nOsUWpv
	 gMuKq6CNW8gYa+fYZIYee2MhB+n076ZEBJ4TT+2KffjDdaYijDohBmovjKf7wGOX4mvaC
	 5PE0Xd/qW/gFMT5dvSCTz9X2kVACHylaEBo1hqip2aejQ0Lj1EKfo7wT9SJjgpZKexDVq
	 4sJo7XX8hy6XUA0lwIHd1B3PB+JnX7jtn2JwqAAUftrtFwRSQ2qAHUMzDOnhMewckSUHD
	 g7ZLjJpjXz8CCk7H0u9+mPT06agFv2x5siFflK4UcPVPhKL2Y/EGqZEVK2PQsIrvyww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=gKQ8pOuG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.33.14
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013014.outbound.protection.outlook.com [52.103.33.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0716070E77;
	Wed,  4 Nov 2026 21:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D0716070E77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=gKQ8pOuG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2IPCoAvYXjMvftn4yFJvP/a4fuHO4d7f7sSNMMRoxDeADt7pPmcithphmLI8f4YkQLd9seLsfiVzo8kFXq+lt8DGstMOmzhXhaI99+IS8/N5J1iRv+2bxIivQgIGBpIO3iGDhHeRoJUZa15xV/meMrz824NHLy40gQi7dRvh5ufM75exq6iKcukjef1UToYXfuBwd+FZw2A3qoEvIazgocWADMJBHl6ABKo38lN/X6eQmDsw0lcR19TzUajhlDRE1u0qWKZ+ARsmioZSs4YlUaPpjyqWOrk69q/1xMf9NcnJJNOPRvpYxShdunAlkCnaomwDuTfoYwYpzEFAbCbvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28u2nKNrpy2twmpX9/yt8jvSA2qk6vQ6x7m5KOFlVDo=;
 b=tAMH25EFcnN7q/YctrNq1Ou2+MtzcOCsoAMctzVQx61Yxc+FBFv/C5hpNdZkEaLqt/Z5Yk4E8pgGjAM3uLL2E6ILjOM5bJlTj8uOSfuEtEoKe12NBGikZvftmjk2qs8LQICiX5TAbuH1iXA9pNoUIyK8cWRMc7BXvhfCaOHOPMheClXL0ppwc05WzL5QPw1eVafwWWFw58krcctvIEQNZ15MWeEeoYaQl2qzjAgc7fJD1ruIUbPuf0anCnrOvTJRcSQKW6YNkvO+RTVxqCouGafrrCl2y2YCXNBvLxZp1/WRmg8HYUZTlAcrv23iRQii9hWfCVbTCWdjDEM8O4mIqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28u2nKNrpy2twmpX9/yt8jvSA2qk6vQ6x7m5KOFlVDo=;
 b=gKQ8pOuG4JG6NbG6+BTOsHgvwFSSoHx/3IjawaPb4PU+YkP7X9PIVWFOQWdDdLNMtjGhYRiEKQMCGpOVKgR3/Ly9Am1hIdszMjMG/gWx4geOQGyBR0fIagNMSWxOHfPkHcLh+Eg/HUPPq5EPWYQ0lPxk0Fv+P3hOZX4lkdUyr5mN9m4BfkH2p5ojWbN5fqttwR2TQtTa0zZArJyYEAIcj7WQecHLgFVUVHRSMXZalLXrbdf+WR+yL3rrJc6w2fHASfeTPLxlqKeIa9tBVn9RrtjmgXch1Jmk18UMt0gEOoPYirCbxgsn2vdjdNWDowLtrGQ5wLzIooHpQ915TOom5g==
Received: from MRVP191MB2786.EURP191.PROD.OUTLOOK.COM (2603:10a6:501:5a::13)
 by FRWP191MB2901.EURP191.PROD.OUTLOOK.COM (2603:10a6:d10:179::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 21:08:27 +0000
Received: from MRVP191MB2786.EURP191.PROD.OUTLOOK.COM
 ([fe80::5bfc:1039:b3d9:e202]) by MRVP191MB2786.EURP191.PROD.OUTLOOK.COM
 ([fe80::5bfc:1039:b3d9:e202%5]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 21:08:27 +0000
Message-ID:
 <MRVP191MB2786834552D57B83800DD4FBEF682@MRVP191MB2786.EURP191.PROD.OUTLOOK.COM>
Date: Wed, 4 Nov 2026 22:08:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: legacy: ether: fix RNDIS for Windows hosts
To: Greg KH <gregkh@linuxfoundation.org>
Cc: nkapron@google.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <MRVP191MB2786AD66C3EAB9F32E5B84F9EF6D2@MRVP191MB2786.EURP191.PROD.OUTLOOK.COM>
 <2026103022-skeptic-deskbound-3471@gregkh>
Content-Language: en-US
From: Amine AYAOU <amine-ayaou@hotmail.com>
In-Reply-To: <2026103022-skeptic-deskbound-3471@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0206.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::19) To MRVP191MB2786.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:501:5a::13)
X-Microsoft-Original-Message-ID:
 <26a2cb18-a7d4-42a7-89d5-64c2b6665c0b@hotmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRVP191MB2786:EE_|FRWP191MB2901:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e2680b2-fc3a-46c3-2281-08df3ab7c549
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|6090799003|24021099003|5072599009|15080799012|51005399006|19110799012|8060799015|25010399006|41001999006|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1dqWGZuN2hVK3FWejJWbTJXUURYTDI2dUZmNXgybXpPa0cxUzE3NHNGS3JQ?=
 =?utf-8?B?bDl6N1BMV2x2a3d1dGgzUVNZQm5OVjdxM1ltQm9OZWNOaWpmWmFtMEdiRWhl?=
 =?utf-8?B?ZEVWVlpXQ3VYbENTSXFVT21pRS81bTFibUpTOWVIZERwQ0x5cmE4SjVQMktU?=
 =?utf-8?B?YkgvL1F1bzNTWDJPbGtoNHlCd0pPZmltWkpMOW84ZXFuK0VGclJhdlBmZXow?=
 =?utf-8?B?TTdFc21WWGxwT0l0Y3VMZHg4a3JkZDEvMU10cVRSNDVESDRiZXN4NEFRWXhE?=
 =?utf-8?B?V2wxQXdJdlo5ZFYrYWJPaWY4VDQzZjNUVS95U3YwekhDU1d4WjFDZjkrd1Vj?=
 =?utf-8?B?VWZZbWZFQ2JQanJ1bE5FWDQ0MDRVdTd1bC9CaElTWXpIRlM4VzlTTG1RSzk4?=
 =?utf-8?B?Wk5odjVOaitTSnZPS0lBdlFGSmJZUHJxdExkUndjZk43RFp3K1d0ZUJXMG15?=
 =?utf-8?B?NWJVYzNic0w2RUVGVUw0VnJnSXlKb0VBeEoxMjF2QUxrU1dYT3pVTUhkOUJa?=
 =?utf-8?B?YVgrRVFOUUJWWTJvSWpVaHBER01oWDhpNHlKZFQxS2c3Q2NWNXgvaEhQZFNL?=
 =?utf-8?B?eTNXamhTcXBWZ0Jqa1pzZ2FkaEpYaXNRMDg1VnRBckNXQm5SU2p3T2c1Y1J3?=
 =?utf-8?B?TkhDc09kVDZBVHVVQkFtWUt1NklFTlFuZm5PTjE4VUxUN3h2a2dhTzAvcUQ4?=
 =?utf-8?B?a1lkb0RHMEZJWSs1bHcyT1k4L3ZpOVBLeEIzK04vOTdyZldFeldxRlZGS0or?=
 =?utf-8?B?Z0h1QThWN3I0ajAybEVIZmZ4enZMem9BbnI3S09DbVpVZGJJN3pTeGd2MUV6?=
 =?utf-8?B?NkhUUmVGMWZZY0ZnS1FZWkFCSlRWZHdHajZMRzE5T1FCY2tDckdJY3hsdXpG?=
 =?utf-8?B?NlBrTzlZbk9ncFd5YjlUR2ptQmc0b2RtdFh3THVKRjlsM3hHeHVxaFNMeWhC?=
 =?utf-8?B?OEpINEIxNHRZalo2SmRNU29RQ1VWUlJOOEVET1BCeW5udEkyWVpuc1lYZ21q?=
 =?utf-8?B?YWZxWlkzZFBtU0JBTWJsOFAyZTZ3YVNyZWpSNm9BbFp1Z3ZidUNhQXVvVGxh?=
 =?utf-8?B?ZVNZWDdiUVlMaUhYZVlmQVZ6c09MYUxLYXhEMXE2blV1WURaQWVFbU9FSmJN?=
 =?utf-8?B?YUtrK0NlYURDQktFVzkvdmUxQnlUWUZ4aHJydmtBMm1oa0U2cFNmYVJsTmJR?=
 =?utf-8?B?YWtZQmkvcVhGZkN0NUw5NUZYb0l0cnpXeEZyM0J1cmZPM3F1UTczZHhQVmdv?=
 =?utf-8?B?WklIakhEOGxLUkNvbko5enZFK3pWVnhLdjB5cTdycVpEeEFmc3pJT2sxYWI2?=
 =?utf-8?Q?3DywgJZmMchfShO0GgRkEOJvVpkKg6n2re?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnNyV0RRSHd3WVl1WkNYeEd4REx5THF3dnJoc1pYZmtlOS9maE50YThobGU3?=
 =?utf-8?B?a3JlbFVIS0l4Z0FwMzZKaFJKUlFiNEFyQU16Q3FoaGMrenJZR1dmT2xJaW9i?=
 =?utf-8?B?dWdFdy9tdFBEU0swZHlYRFd6RGxiN0lTdkVYN1MwWC9BVmdTa1NNTDBDTU00?=
 =?utf-8?B?cUtmZk1abDZiUld0dWtEdStmbkl0ME1jZzNGZE9KMjFFQXQ2TkFxQ0YvOEJR?=
 =?utf-8?B?c3FQanZONzd0elFZbE14bE0vRk94b29hZExHQ25DMHMzL1ZFdXlYZ0dZMDd3?=
 =?utf-8?B?QlU3OWZsa1hYTFMyMUswcE40U1dOSXVtcWUvUDgranFQN1hJU2FxVjdyYUlF?=
 =?utf-8?B?d2RoZ0VKUzdybFJ0WnZtcjYwL0hmR0dBKzNVUEpNU3huTkR2Y28zWURzbkk4?=
 =?utf-8?B?U3hkNEZQQzdVcFE5Rk82YTVHK25adUt6aW5JTWFBUFBsd1dmczBIb0EzTVVE?=
 =?utf-8?B?N01kVUNRYlNZdmJwbHJpdThYbEVlb0N3SGMyVERtbXM3emdDK2dyaWg0M2Rp?=
 =?utf-8?B?ZDM2MzR4aUF5dHpjaytwVWRiU1FaQ05JSmpIQUt4NFNCeSt4WVdCcFVvTW9s?=
 =?utf-8?B?Q0NmYytmRmI2S1I3R2FxLzZCbmw1U1J3TFpxejdnYjNmRnZOWFVnNDllZVVG?=
 =?utf-8?B?ODlyWWlKRC82eVhPbU85NWVzOGU2bzdLc2lGYUJFdDB3NTlnS09jNVJZdGs3?=
 =?utf-8?B?TFBlN2l6QSt0Mkw2bGNrSE04bldmYTZEaStaVVdMd0VOTTduNVpVcWJzZGdl?=
 =?utf-8?B?a0lYdHZCSjI5eUo3cUEydUljUDRQS2ZnWFZUVDNwOXBnSk9Cenp5TytjMzRj?=
 =?utf-8?B?MkF0aUhpK3hweFNWVkp1QXFLRGVxb21WRE5ZdmpONWhJM1VZWERVNkZvUlRX?=
 =?utf-8?B?ZmdkVVo1eXZEVFRpTmxmNW80NnJiWnZKaHRJbDloV3pjd3dZYUR5YmpvT2o2?=
 =?utf-8?B?VlpKS3hjZmNUaGFycHRpaTVReDFzTDdQbjBqb1JYZUZYbkRrSkxzNFBUK3lx?=
 =?utf-8?B?aGduMHpEOW1MOHk1Z3VBcHY1T2cvQnNyZmlGNk5pek82R3UrWG5OdnJnQlh5?=
 =?utf-8?B?UHdkaWZiamZmOFdwamtnaS9NTC81TXdxQWZuK2V0ckFDcEVBSTlmbTZSK1hz?=
 =?utf-8?B?Q1FoR3FWRktGUGZON2JHZ2lTbEVnWVdGVWVuVkpFR25BcjJnZS9ZK2p6OURS?=
 =?utf-8?B?a0pncm5Ud0h2c3NxUWhFNXVSYTh1SXZWTVIxait2c2dJWk5lS3N0U3RVQ3ZM?=
 =?utf-8?B?YzFUdVdNN2xLazBqRWVGaU4vZlhmUC8zZWlTM0picFUwUmVvQVQwOGh4ZmtP?=
 =?utf-8?B?UUZySnBibTlPWGlKbm5WRno1MXYzM1ROQk50MUZyMzdwZ3lSWi9tSXFTSkli?=
 =?utf-8?B?RUFaNGFWMHhUbzA0OERDcUFVTXZ1aGVmcUdrdUxZT0UvOFFxdHRDZ3VEVVow?=
 =?utf-8?B?NE9FRnlVeFd4aUZoUTNYYzB5aXd3eTJ5dzZGUWozS25xV3BNSjFlazNmRG1V?=
 =?utf-8?B?anUvcTYxd1lRbDBzSmdqd21CU25XNDdHN2IvdFlIby9meTJOcXJTbjFrYnpJ?=
 =?utf-8?B?T2k3R2tFcFFlbjRPSU4yYk05UG5WUkZsT0g3LzhNTFpFRFJCeCtGaFJlTGtM?=
 =?utf-8?B?TEFxMUpqS21lUXV1QlFmbHZFa2lCQ3lUMS9RU3puZEovbFQvd2xvYk4rY2NH?=
 =?utf-8?B?bHNPT2pzQjlYUWt2Z0xaMlI4VGVPT2hIWHRod0pHbXRBT0pLNmp4NlF0bHZ2?=
 =?utf-8?B?bUJHMXV1YkJiVFc2UlpYdGhiU3hvSWdJNlBIR2JLaVkvbGpsUStFcFVEWTkx?=
 =?utf-8?B?TkxwMndMZ2hSQW8zRWd3b1hrRFNCcEFId2JjNzVLMkZFeG1xVHBCbXpUeTdK?=
 =?utf-8?B?bVoxNjlNdHFRNytBcktJK2p6RnpUSE5mV1BrV3FIUFFhTVhJNmJHZVpRbHFO?=
 =?utf-8?Q?zxBPmiks3i4BceiaUGZ1bRSfjG2TMn3t?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-061ba.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2680b2-fc3a-46c3-2281-08df3ab7c549
X-MS-Exchange-CrossTenant-AuthSource: MRVP191MB2786.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 21:08:27.5741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP191MB2901

Thank you for the feedback and for taking the time to review the patch.

It is clear for me now that additions to legacy drivers and RNDIS are
to be avoided.
I have no further arguments for this patch and I don't intend to push
for it further.

For my specific use case, using initramfs is possible (boot time is
unimportant).
Using g_ncm is also an option.

I have answered your questions below for context.

On 10/30/2026 12:13 PM, Greg KH wrote:
> RNDIS should NEVER be used, it's not required by any shipping OS that I
> know of these days, do you?
Windows 10. Specifically, any version prior to Windows 10 1903, where
NCM support was first bundled.

> Why do you want this?  And are you really still using the "legacy" USB
> gadget drivers?  If so, why?  What is preventing you from using the
> "new" ones?
When building a minimalist embedded Linux system, I reached for the most
straightforward option to boot with nfsroot, which happened to be the
legacy drivers.

> useful for which side?  What can you do with this "during boot"?  And
> you are connecting to a nfs windows server with it?
My setup is:
BeagleBone Black (BBB) / Linux <=USB=> Windows <=> WSL (nfs server)
The BBB boots using an nfsroot hosted on the WSL side.
Network traffic goes through Windows.

> What hosts exactly are that?  And why would you connect to them?
As mentioned, versions prior to Windows 10 1903. For instance, Windows
10 Enterprise LTSC 2019.
In a previous strict corporate IT environment, the embedded linux team
were handed Windows 10 machines. They had to connect to Linux (WSL)
through their Windows machines.

>>      Tested on BeagleBone Black with a Windows 11 host
>>      (Version 10.0.26200, Build 26200)
>>      RNDIS automatically bound with the patch.
> 
> And did your nfs server on that host work properly?
Yes.
(As mentioned, the nfs server is running on Linux)

Amine Ayaou
