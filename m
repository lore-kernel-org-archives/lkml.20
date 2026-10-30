Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793355671;
	b=T44QmbUhGwWb4OTMCeiA1sXItSgFDbv8ggk7svgUbJraFYA9g8VkqxhCuVKSdHpylGTe
	 dX9gMuBadb+t16nDv2XtUpdbCijvwdd48xPQ8csHOS5YwUQ4jNzuySnX/R9IlIERZLo3H
	 o8Vh/VS5akUBmzYC7yrPwzVOGX5LT5+lcn643mAxlJArKRGtRrAXOK1cIJbMUY+HikBFD
	 WcKpcJt46jHY+YuxhGKk+S0YpqKhViq3vHS1AwFWX4hMJGskFLCzHrTmxcQTBarkE8Nii
	 QcvZd0V4mfxwAUiOlEXaZEPlqY/dbK24qU4z76gpSLk7nZUtzxnZu1gnmIA9nhCtjzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355671;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Content-Language:To:Cc:From:Subject:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=J7+lDYMCLsen34T/bpY25rXwXiqDbkD7nQcG7lS5jOA=;
	b=zdxXRBB7fTlhxig6tbguPu6AfshGi/jJiaxfutQ/hurQYhSDsfsS6v48GkW07ZWG8SS1
	 YalUbrQ+hvtEJLA8BimZAcqpJVtGXlX1t08yrSYFz1aV6/R1FEQucWWbejm0meS5KJ9Nl
	 vug1nSBZ88va1tsSd+mez791EiQozYg7Utd2ml+aE6u8HCi2UxWWZU4SaWM57lDxin7TH
	 4FC/nAp2ROzCg2E88KvsQyriw5m+qnW//o2CCkijqNOKIILbsnw3yjLJzNKBZ6DM82sWy
	 S+HlyvuJoQsTBXqp92AhJKeokQXPMyJWmKy6Z2QV9Y8iIKikRUt5+tnj6+AlmM4tVlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherry.de;
	spf=pass smtp.mailfrom=cherry.de;
	dkim=pass header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=XSA095ji;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.29
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA08606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FA08606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=XSA095ji
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3hxQZP9UaYyBY0tE/xOBn3JZUeaY55jB9YfVA2jMOt9AYA+WcPQ9z1rJ9kRvx84VTVEYA3ZWybvHpTIEWwLBYkKFOMTEGPjlpmS/+UjJQv4EICzZg1h+o4KPinYTK8fouJBVw9o/wKyCI/r+rNnjCy0feNmXJCR2UBYUJE3BGOHyxqDQznX5XXPEmnmIzK2owaVNWeekNdarjSl9aP5BxdyQGIChF5rlmap/y7YyGnV/VxZVldAgG/b+kdhMoahCY8pbvW3hJNp8u7kreJBfIXM6gtIB3/A63Zrw6t+28Dyxucfa43urLGPAMMRKUr05bUiYCviMNVInHO6BcG2xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7+lDYMCLsen34T/bpY25rXwXiqDbkD7nQcG7lS5jOA=;
 b=q2To5IDP202MjqK9v7G7fYkTzyIeqx/uqVTqnoGuRth2vo4wYklYXuBzMgDoxaYD8UMzZJ+Th75HmAOFy89jpPfej+9Y+fQ0v78ptbfvycXEGe94sWzBXr0tb6sJYwRtvFsjlnR7J2e3n8C/SIz8xMzr2edWAHTJwOwCtBWB5J1ZNbpcK7qFHBgsaBC1L1CkrsO3Tj+ZYJXOuRViIQ5ZwlNcN5DpPrRVXgdtsNNblbkvb0JpFoV9eNbm+4d9DOHjX4CEWavHAVyG93z8+xHaOBLjJNeDAE8PPamgweZ49OKm1Jj3g4v13gGHY518GlH3q4wow0F7ZRXAlwWmfKSviA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7+lDYMCLsen34T/bpY25rXwXiqDbkD7nQcG7lS5jOA=;
 b=XSA095ji1PwXzvHwCF9HRAdJ7kN0WEGXdKhX3zvCmfqgdo2YjpshBajHRwlnSEaRMVcczBVNqETnPVuqHicF+AmqWHLK6QuaxliMNnfiL1nsRcq1P7I5Nll9Ce8I56uOfKo86IZR2kaQqqBC4SU+1ZuiTPHiCWdMYddD1SnW8a0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12016.eurprd04.prod.outlook.com (2603:10a6:150:335::6)
 by GV2PR04MB11884.eurprd04.prod.outlook.com (2603:10a6:150:2f0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:21:01 +0000
Received: from GVXPR04MB12016.eurprd04.prod.outlook.com
 ([fe80::f2d4:9db8:9a4e:b0bd]) by GVXPR04MB12016.eurprd04.prod.outlook.com
 ([fe80::f2d4:9db8:9a4e:b0bd%4]) with mapi id 15.21.0546.021; Fri, 30 Oct 2026
 10:21:01 +0000
Message-ID: <a37b228f-0d12-4c26-b29b-51ad59bc6d1a@cherry.de>
Date: Fri, 30 Oct 2026 11:20:59 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
Subject: "checkpatch.pl --mailback" broken?
Autocrypt: addr=jakob.unterwurzacher@cherry.de; keydata=
 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
 ldPHIqbIwpfecQ==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0089.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35c::11) To GVXPR04MB12016.eurprd04.prod.outlook.com
 (2603:10a6:150:335::6)
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
X-MS-TrafficTypeDiagnostic: GVXPR04MB12016:EE_|GV2PR04MB11884:EE_
X-MS-Office365-Filtering-Correlation-Id: ead1d37e-0310-4bf7-0aae-08df366f7f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|3023799007|11063799006|56012099006|261022075727099003|261022105027099003|261021121427099003|10067099003|261009223027099003|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	/UzETJb4RfTUbFidHFRUTjDMEyTYqcmwktQ1bX3ezZRda8D+MZaeM8cUn08V4HgTH0SXbf+IJl3cpk1/xwdy/YzlxA6LQKyuVhR51Mw6+xDr2OonnMYvCF5zxvIRyBm7TYIr40bGW/MCXXxSFw79w3B+YZvk4WkLflXbr2UcgUaBDMJBVEQWAILUt6DffPby2nJUxNoBlvFgTrdYodigRfyLLQA3mMX6fcbypNclGSKXzTg1WmOA2sXaJozPuTHtJirR2Mm+K9HdhaHYMmyXe0JngX8uXv0s3hf3M2EMVwYCj1ZXATwF1wGRKm4/+EM1x7menPIkR6RykEatfY0X0SPAne9atH7Qv8FuzykCkVxECdPk17Yl3FGqHfnKJ0181E3EIlcrScN4AHPh1eQafEcHCYtC/jqtsolG6kmugapAHD99qcQAWE8itvBUId7GE4sN7zJ1LBY8QIGAhSZpQHZnzDaMgz28CZheGoCBZR34GBTpmM0WxqfBwdbE3if93ztwmIVlb70bgGSJJ9aoQktiGfoHIN5m7skNy/QTMD1ivLUTZMtI5eBR75Mr7O2vF8ZHM5N4bdNDUspBvmZztXQM/8Pb97VVR1zhlztZbUJHj2CHERVMJ+v3fy8rfvsT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12016.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(3023799007)(11063799006)(56012099006)(261022075727099003)(261022105027099003)(261021121427099003)(10067099003)(261009223027099003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1JIbU1WNnAxMUlDNjBKUzV1cGljMzQ3V3lKSjVxMTNEVVJaS3FrUWZvZ2V2?=
 =?utf-8?B?YzJlb1NRZ1dkMk1OY2tjWmtCZlRLdkNTa3dyWDFjaUVxS251RHhwSG1MSmU4?=
 =?utf-8?B?UTZvNldQZ0lEb0duMktzUlpNeGdyNHVGNm9GTlh4Z3VUL3VLQ2NhRm5BWmN3?=
 =?utf-8?B?ZitOYmE3ZnBkeUI4NTR2QnFlem5RUnJLL0ZkV0tqaExidk5JSXpNZm51M2Jv?=
 =?utf-8?B?d2E3bEdjcDVNK2l0dkFSWWttUVVzQktDRnVoSlhhaGpPZGFDRmw0a2xNd1VZ?=
 =?utf-8?B?WnA2NjBnZ1BIU2h3Z2hiVTdDRGcxVlQ1em5mbUZOeTVETE5Fb0xYejBRR1Zk?=
 =?utf-8?B?eVZteHdJQ2lXTWdoTlVodnh6cE9IMmhwaTRNNkQrUEZMelM0enFtOTRHbVlZ?=
 =?utf-8?B?L2dQUDN1dDhWb0QyaS9CczRsdUZUaXAzclZtc3dTdWNIdnI0L1lteWJscTlq?=
 =?utf-8?B?ZlA4NVJiSTRqOUxMVk40YXM4ajlDbW1DWDUzdmZTTUVNeGNkN1Vld0pjdmFs?=
 =?utf-8?B?VE51endMT0ptaFJVaVJlTk0rOUZ2dlR0SEJuOENWUTBmS0RrL1NVOGwxTTNZ?=
 =?utf-8?B?cGo1cVE0N0lKbnJXOFNnNTlUYmcvbWQyQnlUS2dJZU16QmdmaGt4T0N5YWlW?=
 =?utf-8?B?aThPT0V2OXJJT0xiK1pydE1icHpWdStyVG0walE4OVNETnlUZUw1TVlYRWUw?=
 =?utf-8?B?WFEwK2NVMmI0ME02Mi9Ic0ErYURvU002ZHplMERNZDVPZVZ6QWlqVGFDVkVu?=
 =?utf-8?B?c2dhVjdUamZZOGpZdzVHT2FCSWlXSy9ZcjBSRno0eFFrazB5bWVyRUdvaGMx?=
 =?utf-8?B?emlVNHE4ZG5LRFpSOGMyczQ1enAyWnJBK2c5emdlTmNRSDEyaU1uOHlWaWMw?=
 =?utf-8?B?QzRZTmxNMUJNdnZoL3AwK3U5bEZYa3BqQnVib0NTUS9jVnBESHZseUNiaUNH?=
 =?utf-8?B?Q3loVUtTcDRrTVpsRHRXZHZkMlNHVWZ1K05IVGFYbWVtR1c3R0JmWjVNT0ZV?=
 =?utf-8?B?dzl3NS9XcWV3b0hmWms3dTN3RldST0dWeXdaSFY3RHoxZXgwMnJPMnRNMEVz?=
 =?utf-8?B?S251WDd3TnVFSWNtamFaaEJTeTU0RUNLbTh4cFdJMHJIQzRaTGUydllWK3Jt?=
 =?utf-8?B?SEkrdjBpYVBheGhjUkRKSDF4YnZNdnJJbG1hVHlMQ2JFZ2NEdDYrR2xrOW9K?=
 =?utf-8?B?WWtlS2ozeUt0S1hsMmpxQkVtcEU1dm5WY2tzMitBWXpQSzZXTzIrREN5VFE3?=
 =?utf-8?B?NmVTR1FSbTJiRndvUEg1Q2l5SllyL2FMRHh1Nmg2VGJoRmZXcnpuQjd1SXE5?=
 =?utf-8?B?SHduOS9PZEZxcUVIU2ZobU1Qbjg2WHFhUUR4bVFKWXdLVjJiemdXZzdvYWh5?=
 =?utf-8?B?am1kV010d1ZsYVpBTHlEOVFRTDZiK2V6c2kvUWdPQi8vaTVzTGtvM1NXNmFC?=
 =?utf-8?B?bnRBL2x3ZFhTOE5Ea2xsMjUrcWNDcXJzMjF5cEsreTllNjkwb0JxR2RRRDc2?=
 =?utf-8?B?R0l2dnY2ZGtIQ1BpampzNHlRZld2RzlSQzkvVml4aEFFZEs2RXFhY1JDM0d3?=
 =?utf-8?B?YzQ5QXBmYS9nL25EY0JFYTVNdDNSNEIralErSEJBRzl0dzhHQytabk5CeHJQ?=
 =?utf-8?B?YTB0OFp2UlExcnl1cDBnanRPRzRmSFcveEp4ajJIM2xacXExQkdEUjZ4dTg3?=
 =?utf-8?B?c2VFb0d5Qkp6ZFg2QS9GTGZxSWk3SUJQa3ZrRUUxbnZVbk1DVFppNE9vS0RB?=
 =?utf-8?B?Nk9xbHhVUlA5TTl6bEpPSERMK3BwbExLN3AzeGpvUnJlM2xvejl4RTFpVlNl?=
 =?utf-8?B?YmxsTERxNmxMSkNxTXNJQTVHZ2F2WWR6bXFvQVJmd1VkcFhZdDRDeFEvNlZi?=
 =?utf-8?B?YndpWjhhZkhmRTh3ZWZRd1Nqd2dWQStKK3RwRFdRVis5a2g4OS9KUUx1VFg5?=
 =?utf-8?B?VmdEL29hVlRiSzJiaDNlcVRtSXJJUjdFMjY4TzN6MkoxY1cwdHdRWWtXTFNC?=
 =?utf-8?B?a0l6ODc0NGFyKy9YS2RMb0dYSnlYb1djbFlpVDNmVXBXcEkvRnhvNS9JaVh3?=
 =?utf-8?B?RmZOV1c2VmtjeVZkUGI3SEdiNGhlVDVibmhBWGp4SlZ0b280Rkk0MkR1NlBL?=
 =?utf-8?B?UkM2c1k2U2g0aWk0K0d1dWRkcVhnc3kvUmJSVFFENVRsdHJSM25nNDUxQklU?=
 =?utf-8?B?VkVRQ3FRRUE2aW53cnJHRjhDUi96YUtoSVBqcERQSXlXSkhGQllTdjY5Ylc5?=
 =?utf-8?B?di9YWng2ZXpqRkdpcGNsMGtRL3JaQVpxVmdSRU44cFY1dXp2SkpFcXc3dWp4?=
 =?utf-8?B?c0IyMXV3WWtET2NGUmR3LzI1VHZteVVNTXpXaUF6dmFMSmlzRTN4RjgwYkxy?=
 =?utf-8?Q?zKEyyusz3B+i+8vM=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ead1d37e-0310-4bf7-0aae-08df366f7f05
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12016.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:21:01.1691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5WkV8Lu4sN5/K2RwIP7WRKbnOB/xhgjlyIlAl43i+IztWswRTdm703fhTuEMILXhRFKTu4qquOh979fkkkTL+e/klTTraeOqVDbMWCZxIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11884

Hi there,

looks like I recently hit [1] an interesting corner-case in 
checkpatch.pl . When passing "--mailback", it seems to exit early with 
success, despite having errors in the patches. In my case, it was 
missing Signed-off-by.

Here's what happened:

$ b4 --version
0.16.0
$ b4 prep --check
Checking patches using:
  
/home/junterwurzacher/tiger/linux-tiger-v7.4-pre-tiger-suspend/scripts/checkpatch.pl 
-q --terse --no-summary --mailback --showfile
---
● efd1aef7f361: Input: rk805-pwrkey - enable the wakeup interrupt during 
system suspend
[...]
---
Success: 4, Warning: 0, Error: 0

Calling checkpatch.pl manually with the same command line:

$ ./scripts/checkpatch.pl -q --terse --no-summary --mailback --showfile 
0001-arm64-dts-rockchip-put-the-PMIC-into-sleep-mode-in-s.patch
(no output, exit code 0)

Dropping "--mailback" gives the expected ERROR.

$ ./scripts/checkpatch.pl -q --terse --no-summary --showfile 
0001-arm64-dts-rockchip-put-the-PMIC-into-sleep-mode-in-s.patch
arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi:501: ERROR: Missing 
Signed-off-by: line(s)

I have not analyzed it further yet.

Thanks,
Jakob


[1] 
https://lore.kernel.org/all/a220ebd0-a28d-44cc-9a80-62382018348c@cherry.de/
