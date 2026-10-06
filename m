Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11022081.outbound.protection.outlook.com [52.101.48.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1F21F192E;
	Tue,  6 Oct 2026 01:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791251461; cv=fail; b=RUIYktOnziQakmdTF5k9oyNwb8mK4Z/n2YWUwZfxynBdODK2eQQtus/yeGHTc5H7S2XsvQdfRN3Iv9Xg0/iG6FSHkBpKxp1evr2k2fdAdmBE0qO13ojUQL4Q5qMR09wdzF421Ow//vyPq5ATJNFGguCVS1CVV1vCQ9QrLVvYPyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791251461; c=relaxed/simple;
	bh=X2HPCuZJiP0c5ZvHLLHrR7SuwxZLqKe7x6DaM7ptUnc=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mhnGO6yCgV06sQxGKvgicVFu1bWOP0s0zVyj0rRDmFlRX6KAQIy69kMwqNMWX0LqOXlgQ0KGHJqN4uWk6FrQ6lPe4OhyseF+dL7h3ywIhDX45n5AXwJPB7bTGaZTEjcEadcEnprz7+GPqZO4vgoZbDDtU2pISONgNeCtAn/xgVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=qon3Wz/u; arc=fail smtp.client-ip=52.101.48.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="qon3Wz/u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ViAHByB7dkCErHGNrdSNufMwfSp0c6O9JkIjao345N4IXy6Vm1cdoXw2NEpiOoj1CyqaJ4Nm4uHrTE7Y0kfarc1Wmb22B7sPGXMnPa+BESiLLRSoKUh+B79/wI+fI3tqgpU+gWJt5Vc1/38cUgAp2QdzGr3Q/0Z9ZXmTQlA+oYi9mt9087y11rN6qGDQ2tEPmMPy10J7Z+3uqq1G6/p4r1sVm9koqAj1503UcCYSQ5lTlAo/RFSQtR+XP648g4RP3qnFLx8D8iVd60EyLXI7WhmeKK5dEITTq6Oewouin2BoIoidXUBWA03GJATsSUeVlwM8jmrVau7D/3KBwPsoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2HPCuZJiP0c5ZvHLLHrR7SuwxZLqKe7x6DaM7ptUnc=;
 b=shwr+7e0x556kP0jODoeHIl8fNHliZAsIPVqk/Ybc4VFX0w/W7l+BdIPST0w9n5P0lqLe3SMlogAtZyGGksnjAl/rG1UknDymZMNMUwJiUW+73x1IQyGw3bhfcpYUEjjNwBL6xpWm55vVb5ZR4yL6wQ+K+nZpXFYzp5CYXNMyIT7jcHzcX5w2iOkD0PW0eYY+VMiNJHravyHcNxIUWpKZHppJ5a4lFaYYpqutNFR6azh7oG86/EVvnjSrIYVpPO9CVReJc8gu5mqrJgHnKNiAcIq60kyeaWHZWuq43qvx4vlE0XXvchBDoMiSbJhQsavpo+v2RqU+8eWXOo6bTIXDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2HPCuZJiP0c5ZvHLLHrR7SuwxZLqKe7x6DaM7ptUnc=;
 b=qon3Wz/u5gVbb+NxqlSsVB2AIGNbtjqTx+tZPWv4ECNJIx3Ldiv8cwKiB7T/vbrNYy1HelamSR7hJusvyvPTYe43ARLUj88G7vNFhUOPp7sra0VUyXnR2sl4R+wkrhWvtFqGuyDi9BYy57bh/Pqj6CIMtv/OUVvFjg34ia5fobxzpsZEtPzmznxK145ltfNvPUMGn6lhXdy16oz99c4VKWqeGQbiZsimSqEJctQytRiX2EVhDTg4neUAyJ/U1vH8N4HJvpXzAP0CfQiWh4fAQNA0KWqBxsijy4kjY8IhKHOijsFzVkpL0C2RSIO75Cd2fInE/z6hxzBoaSlZGoKOrg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from BL1PPF1B62FD55C.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::d8c) by IA5PR18MB988800.namprd18.prod.outlook.com
 (2603:10b6:208:604::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 01:50:57 +0000
Received: from BL1PPF1B62FD55C.namprd18.prod.outlook.com
 ([fe80::89bc:34fe:3f82:b3f2]) by BL1PPF1B62FD55C.namprd18.prod.outlook.com
 ([fe80::89bc:34fe:3f82:b3f2%4]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 01:50:57 +0000
Message-ID: <2712d7d1-f647-4fc1-b1ed-9433cd998d87@axiado.com>
Date: Tue, 6 Oct 2026 09:50:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: usb: generic-xhci: add Axiado AX3005 xHCI
 variant
From: Swark Yang <syang@axiado.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260805-upstrea-ax3005-usb-v4-v4-1-796af97bfce4@axiado.com>
 <663465d3-7756-406c-9e8b-64bfbcd50859@axiado.com>
Content-Language: en-US
In-Reply-To: <663465d3-7756-406c-9e8b-64bfbcd50859@axiado.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0050.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::6)
 To BL1PPF1B62FD55C.namprd18.prod.outlook.com (2603:10b6:20f:fc04::d8c)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PPF1B62FD55C:EE_|IA5PR18MB988800:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da43d2e-fa57-400b-543a-08df234c43c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	GG94S/2Z6FyYHXTal6mEtYqECBaPUCpRgHADbQzFzeWj5AtAhErLhCIZSrhep3CoYcNyHhw4pEIFXo0hq4lfuhbDq2Q3xEH2JC0RzWeK4xZYZbdZsiUIhjmG+9Zlkb6j2Tmbhy4gBtjRUc6YX6Qmmw9BQApuHHzxDQFPsGGEuCrEuzPuYYIVm4GSEoxbw6Y9Ri2pJFL02rwRuh/5LtiftWYQPDjBUgcCZVsJi9PZrrLAPMu+CnaZS+1/vnc6hjrJb/vzpCGtsnOrUXwe2W0UjCRMdFYjRCI2fyJXGQMi0nBU8EQzjHHKYVlc09N7eX3MwmmoaDZZj1qSU4Q5E1OHS2vGNyIkCky/TzZhS7pjMWeOC5x/KzKqRIAioUxbTqmr6qXfQzK9VCwebaNC5FDGl+4C/x76ejIKwPMEmixZ0v0H+tpGcy9jll9MkkAOpEn/9ulQeOCnUJQeNqA+HjcYhDFXTuSZB1zum8pEhBP7wpRlm4gdhaU8LUWPvzY8D1SCUg3MSwz1ynNG0sdUtJjnPKhN0YFBPmFU3INsHklYuU2cSGgUU+aHIVp4ALSmKglNintKoQJuD4DtSIrp7rC/7GaMuMu31IO3BKb5NYE0etPTURoqSG2Zr5ITPBgXu6lf5CIJ2XhaAEl7jVxK6O78PA1jwSuN75SUcdCtqyjWuMU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PPF1B62FD55C.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTZJY1ltVnRIQ1NZYW9WTStYRzZWM1RlUEk2RjMxdlpqUzljcWVlUnd1YUcx?=
 =?utf-8?B?cUcwK2k5L0o3Rk9wN0MwYlduNjlscnBuQWd4Q1pCUFpnVkZ0cEYzd3NGQmhq?=
 =?utf-8?B?QzcxZTREQ2dGb0RNMEtqcFRzRUhZellMNnZqdzQ4OUJ4NjVoQysrWnljNGJl?=
 =?utf-8?B?czlwZStzTGZveXVvSEhVY0lTbHJoSG1PNDZadTVqUHBjN1FWMzUzZ3YrVU1a?=
 =?utf-8?B?RExsUEJQNXVjUWZvL05PdFhwbVdxU2laUGhZZllDUSsvTDdZcVJJeGxVQm5C?=
 =?utf-8?B?bGdxQllrMmk1Y3RZRHNPTGJwekdYTWp0em1FL3hHTXJHNjRtWDlZNjJuU01r?=
 =?utf-8?B?NW5NT3pmdkJrcFdIT0I1L0hiZWFQaG80Y2xOamFHNFVuRDd4cFB5NGR5RzZ2?=
 =?utf-8?B?cTFVczhDTDZXSldFaDhwaE11d0lsWk9vLytuNWV6UUdLSm1VNmFMMVdrdHNh?=
 =?utf-8?B?RmxXL2pjdktNL0QwdFdPWWRwRDhYSlVtQktLcVMwcUwzaWRaMzV6bEg3NFUz?=
 =?utf-8?B?c2F1VHZIT0tjN0VIQ0MwY2E0Zk5FcHRJSnA0dFI4aUt2ZDFISTdNUTc5MXRH?=
 =?utf-8?B?Qk9sa2FkTko0TGhyNjZ0bnVka3Vhc05tQ0loamNxMFZTWnVjSlBRYTlLdHVo?=
 =?utf-8?B?NFV6aElXTmxSNGI0VFljc1VqclZ3S3NpeTB0dkZiUkxyU3gwUHQreTBocjk5?=
 =?utf-8?B?NmY3dXZSSXZ3Z0tONWo3ZFpORm5vMWhvRzJaeTJmMmpWWUFTRWZ4c25nNUln?=
 =?utf-8?B?RlJvQy9HRlllQXdMZ21vTmNNUEw0dGxrN0VXQ1Zlc2J4SEx3YnRNWTVpelU3?=
 =?utf-8?B?a1UrRXZGaVlFa0dnNWhjck5aUnl6ZTB0NThmQ01rU0VnOUlMWmxiZG1BTUZm?=
 =?utf-8?B?K2xxNko1V1MyVm1hbXpEbWhJVSsxeHlpOUoyRlU0WFhnNHE2aEhOQXJxSHdp?=
 =?utf-8?B?cXhYazR1RmV4b2EwUDI5b1MvZU15ZVJqeDhLUUJtdmJMK1BWT3I2OWFGbXFi?=
 =?utf-8?B?b2NzVDVOZ0xGSXUvLytleU0yeFZEcDRqVGxQdHRzNElOeFhDd2dOU1I4VVMr?=
 =?utf-8?B?YW5OVlliQ0R1WjVpZGVBMlVib1c1a2RyNUZFVWdLdEhxVHJvaWZxQkhLVVU0?=
 =?utf-8?B?clJqSFVMY3ZlZElPbkhyN0krN3FJcGw5S09mUFJLK0lRTUJ5cCtRL0NxTkd1?=
 =?utf-8?B?V0tNdW5WM2RWeVovcW1MM1FZN3EyaCt5TVRRUE9iTnJrbSswc28rdTY1T24z?=
 =?utf-8?B?eUpUNXlSa1pFc0lJQzdqVDFEeWJLeXM5ZmFoMFJ6OVIrODcxM3pPVy9YSVJh?=
 =?utf-8?B?Y0I0N2tCcmJXSHFMVUlwS2xrSWVjVTB1NWdicjBUdnpYd2d2eENTa2FjT0Jt?=
 =?utf-8?B?cUp5dkhtZnUxcGcyMlplUWxLQzBvcjdXOWdsSytkZFhCckxLdStlZGx2Q3FX?=
 =?utf-8?B?VTNCT0Y4QWQ3bE8vcGszMWFDUEJjOGFJZkpWMTROcSt1bS9NQWVaZ3REeXpx?=
 =?utf-8?B?K3kxblA0SlVUaXFXbndRYzVEbk5xdENZNjBxOGkyc1AyS0FYdkJOSXZpKzUv?=
 =?utf-8?B?cFhJTGJ3NEhoQWZWZFdIaGduVUxqL2ozcGR4Yk5WTUFxVWRsSmJzZGU2Qzhi?=
 =?utf-8?B?UVQrWGVidlJYTEM1YlZrSnIwOWF4NitMQWRoMXZoRC9MLzVESHkvakVVYUh6?=
 =?utf-8?B?YlNkeFZvYUpTZDZlc1ZCSnZ3NDcvT0lSMUxDcjV5SjY1aC9oZk9EcDJaQWw0?=
 =?utf-8?B?SVNZNVlBR1hxTjNURjBZOEtZemFCWHNrVWFzekNrSEtER3Z6d0JQVTBEL1p1?=
 =?utf-8?B?c2FsSTZpenBZUUR0N2ZYSTlPUEJOd3locUMyanIrSGF3ZWIySSs0YTgvb2Qv?=
 =?utf-8?B?aC8wbkM3VUZGRW10MXJSaENLUTB3bi9BZDVKS1NCVnJkOVZldFZqNHlJU3Bm?=
 =?utf-8?B?WWZIYTA0T0hMd3JpK0YzZlBBZnBxT0I3YXl0RzN4d0ZXSDY5bGxXL01CNHlL?=
 =?utf-8?B?eXlXZmhVajF1Z0QwZjJjL1F0Q3ZrcHA4U1I0OCtlcnRWWHpRUlJIblFncWFi?=
 =?utf-8?B?WkNXMi9xaUFrbWphaU80K1FKNTh6cFhucGVva0tZZlVVL0FyL0NtYmV6VDZh?=
 =?utf-8?B?SG04VmVzT2VpWmQrNWc2eWRNbmdTcmxNbDNSenFybzM5azBVS01xeUNsWHBs?=
 =?utf-8?B?bmp6a1MvckE5MFVQK0FzNzVEOUlGUGRRNjBiQWJ1b0pHeUk5SDVGYUx6c1Fu?=
 =?utf-8?B?ck1KZHJHUS9QUXNpRGxiTjlYR3FLODBBckNVMndJL3BVSnp0bllha25rYWsx?=
 =?utf-8?Q?4WP3BmLAT5Kg3s/eTC?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da43d2e-fa57-400b-543a-08df234c43c7
X-MS-Exchange-CrossTenant-AuthSource: BL1PPF1B62FD55C.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 01:50:57.4135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdDkVqJJAkiYBhKTNlalHMvBKUP3VMZA/D4iY7Wd0slbgsnhSIjTB19FbeAm7bVYcTh6jYE3FXa4NhgO9hqX3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR18MB988800

> On 8/6/2026 1:09 PM, Swark Yang wrote:
>> The Axiado AX3005 xHCI controller is software-compatible with the
>> generic xHCI programming interface and uses "generic-xhci" as its
>> fallback, as do the Marvell Armada 37xx/8k controllers.
>>

Hi,

Gentle ping on this patch.

It has already received a Reviewed-by tag, and I wanted to check whether

there is any update on this patch, or if a resend/rebase is needed from

my side.

Please let me know if there is anything else I should update.

Best regards,
Swark
