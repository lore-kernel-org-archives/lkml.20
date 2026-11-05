Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793899047;
	b=3Nj9/YfJDzqJXkFgwPxZRusBjwYNUwcehO9Lk1vvmjfZMjCw1JsihKEM9PfQsPr+R34a
	 mTgoAqe0xfdbqDYkPLuuqd9WTBOECy8G0r2tggwBJ2J8urIXkfFUoDVwKWvuXOwikjta/
	 kisoem9JG5pOWLfXnauqOM+dMVokbgNjhNb78r3oyjvACetGSR/SieXSqLDj1mBxiOWh7
	 4AcZuYguhJT3O3wQ6rU4AjYLGCRwB51HGhQo6RXd7z91O7NeDCxmQOrndvCEUk2CkO0aB
	 Fb5LRznNSWkW3/l1EqRLde20mUKoZx/0joymkXWWxZJAjc3ihgL6GNV3d36Mv/TEemw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899047;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-AtpMessageProperties:X-MS-Exchange-SenderADCheck:
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
	bh=HLANh9UP2Pajq5CMTMRlXVMrspNGCyMjghQmIgfdmRM=;
	b=JerXAEUm6hmzb4tT9reT9tHfXNHcdFR9Tqs17/IrrXzYYxX6HU+0zSLLtjA9QGzRdvGM
	 /B2I+aRvrySuAs061RiFXMhRWATWxF+SFxm5SDCUpwvatW+wfhEu1Wljcm7CsnExMjG1m
	 iGzZtejlhVeodtkF4QoTjEwi1SR30gK0p4VS1a+MHdKqLy3sbAFxVm+NsPVyiOV0DR/3n
	 0O0IicTs6G47lELXbChCBWfYlm2/iJYZYtZFU1hZYnx6oNC4kWNmjQbHHenH5fLqgpwH9
	 qB1bq6wcv05jiu9p4YO41Ma0OvbsQZVV6R6hJodYfj/CmQM4vtckFXl8TiiN+/6Gs8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=altera.com;
	spf=pass smtp.mailfrom=altera.com;
	dkim=pass header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=jGS90qxG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.30
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2518606EE81;
	Thu,  5 Nov 2026 17:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2518606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=jGS90qxG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDU98SQpJbsBV+E9yjOzUjFgK0w8LNyeFcfI2ogWY8T+5c+lJZ99Os4zdg4/FTg4sLeXxQoqE5QsPa58gTLuml8Y/RM5HF67ApSwZh5eK15qbKQvbC6fGvyFY9Y3iAWL1xz7q7VXDbinMUw0U8tDNfeFx0RMRlDxW6uzLbF1oHQT1FtYJU5l3EHQPO4XgSi/dUa1Wmb2TSBUum956tgedih5s56FSM0uyzWWleK2Si5vgvedb2thbhhtvtfWVkzD/cnXzk8ISaczWc2XIE2/Ge+jXz9/60blYtPiei3aUSd28fLB0eeAU+HpiN1dWni47+aMlsn/17iWVgkduHXvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLANh9UP2Pajq5CMTMRlXVMrspNGCyMjghQmIgfdmRM=;
 b=n4IYPKLRrMC+ODfHP/YAa0bMskb/5UWbZS63ZQ6mVxq8M4bf8H8YWLEGnWAoFsH2BeHXdnHLXLJdjfrITDHgDZ52Eg9+6CdIcknMNI9lePZUjYXuHy46lxFRncsn5vGZN/NTcU33n/0cGFgPrRVPwKu754kArOO0GqfufA4uBFDWuSnpuri/OqX7FidFXBAngIt4y8m4zeTblWmrhlRmq+ouV0A0HVrXLzvZx8x687QuydPtG+AVQIddhJo4KfUNSJpbQMMsn2gYjnqzpMXv4TKXK9vDbcaL7DlQ1U5InCySVR70ESPkk+nqL5fFuE+x8Byy3tWdDIy28inlvH+J6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLANh9UP2Pajq5CMTMRlXVMrspNGCyMjghQmIgfdmRM=;
 b=jGS90qxGaEDe28Tdtlww0GjX/CL5H3tXJ8fSuq4jETl0X+fh0EO6AWCjfB77y/VJKCIJaIIuz/6BkIJnYjAmggsod0ZeHyK8kapbCD1sXOBFIF/ANbFSA6e6n+GVYvm0yw5QMM3A1GT+Zssk4170MiuVYQUQsbaGyqj/f6N450LCwt6Kz+RLN8+o8kCpbFPD1MDq2l0axOHkOrr3DXlWtvhqiOXNXSn0y8MZQmX7EuDk4nGDe5DdtBj29p0VNlb81Tn9xmwyN9lu8yMUg6Chnylh2BtETTAKqybKh7NNFacwvSLNVgeQUWobuj9FqKUxCCiEWNuXk91ddobdvstOWA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DS3PR03MB097838.namprd03.prod.outlook.com (2603:10b6:8:546::7)
 by CH2PR03MB5205.namprd03.prod.outlook.com (2603:10b6:610:9b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 5 Nov
 2026 17:17:20 +0000
Received: from DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59]) by DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 17:17:20 +0000
From: hang.suan.wang@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Gabriel Whigham <gabewhigham@gmail.com>,
	Will Deacon <will@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-doc@vger.kernel.org
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v9 3/3] firmware: socfpga-fcs: add Altera SoCFPGA FCS driver with SDOS feature
Date: Thu,  5 Nov 2026 09:17:12 -0800
Message-ID: <7974314e0e372059edf21b4494df2a793a033f2d.1793895850.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1793895849.git.hang.suan.wang@altera.com>
References: <cover.1793895849.git.hang.suan.wang@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::17) To DS3PR03MB097838.namprd03.prod.outlook.com
 (2603:10b6:8:546::7)
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
X-MS-TrafficTypeDiagnostic: DS3PR03MB097838:EE_|CH2PR03MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: 668f153a-ead2-412a-e6fc-08df3b60a668
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|261026121527099003|261102123227099003|5023799004|11063799006|921020|261021123027099003|10067099003|261026135527099003|261021121427099003|3023799007|261009223027099003|261022075727099003|261026140227099003|261022113327099003|261021135927099003|261021133027099003|261022115727099003|261021130227099003|261022105027099003|6133799003|18002099003|22082099003|261028144727099003|261026130827099003|56012099006|55112099003|261102124527099003;
X-Microsoft-Antispam-Message-Info:
	B8YDq+mULFku/jsssk0am4ad6ufpCkwYBEbvksuI2bfQpJqUVhgu08H3vixynZVzDMohjIUdrqYIe3K1jiR362F0FdWBhhjAaOQdb06aPp8ZiHxYNefKDCGjKQjX3tlud9LHSN32rXgXOYXC+UmkSdQI4JSk3WFkyNxnGEiWsJvzP4IvwUFPSxewnEI4eo8xBhRwtjH/VbMm9p+asDG2R+Z9jAqhJ7W1FHezv7/gtU44WiFMPclRCpPfHuRW964e23cGKOdn/X+ynwxexnX/UPIZQCUnYMnVol03RskRo8A8ayjpW8SuMYZtTBEz4JDH+BL15H7h8QgozcdBkqq7J7zIkxUgEU5AYHv83s+KdYXGhmwl/kU9TFo9yd20JfmDg9NRzM235PMikFrQ/guhHuxztKcsUFlu4pW62m1EBFY+25+KMaXd+c+Wd01zxkquakpOkom9XHzOt6E3+nOUa+WmysOy0pdYlTXKevA1BLJLXrA8Rb3I84GXGsR1o2Gc2QVAyJecRT8gp3P5ILM6vTXMCxaM8Q3rrpHDlO0nueWD3paExi1+T+nmO/qJdtbeiEUN3TKBZuQmOTMbWOPJCVDY8dUcHAaxYMj2QV2n9J+AeON6IbQTj6dVxFd3y4QTCGNp8cyafOm1Ed7CZA5FJeZuEO2tPvyeEMozwl3t0W2KbFRkw7IUqBtS/kP40+gg/9xOUbtCSGdsoAGHaremaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS3PR03MB097838.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(261026121527099003)(261102123227099003)(5023799004)(11063799006)(921020)(261021123027099003)(10067099003)(261026135527099003)(261021121427099003)(3023799007)(261009223027099003)(261022075727099003)(261026140227099003)(261022113327099003)(261021135927099003)(261021133027099003)(261022115727099003)(261021130227099003)(261022105027099003)(6133799003)(18002099003)(22082099003)(261028144727099003)(261026130827099003)(56012099006)(55112099003)(261102124527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE9kd2JpVmV5YTNpakduZFdKZ3UwL0VNb01QbHRZMklLc0NSK3FnZmR0Y3M5?=
 =?utf-8?B?S2FMQ2ZZL3hkRHJqdGtPV3RKd3RTV2xNbFVRUCs4SEZXN1hnd0RkbGR4Y2Nq?=
 =?utf-8?B?M0huQ2ZsSCtyVDBKVnlVUFZLQVpHUHliUkJOQ29yb1RxSjVla0V5dkFFSkxk?=
 =?utf-8?B?VXN6aGRNOEYwa2xwY2l3dDVnbGR1RWtzK0U3c1V6SGRWYXFBRTBUWC9DWGVr?=
 =?utf-8?B?clNsb1dUYTlqM1NJQXFxbzFCcVRGQjFXc2lmNVhJVmVhc011YnJzV1JSL0Zn?=
 =?utf-8?B?cVppTFRaZllGcW0rZDliRnFWV1ZNTVkvRGd0NjFyUFA5RWxQK1kvNkhxRUY2?=
 =?utf-8?B?aWlISXExN2JUUTRPVExCZWdLclNuTUJjUk9XdEZjblEyc0g3MEovMEhrTTZT?=
 =?utf-8?B?aUdFNllaR0FSNER5RnQrbFo0ai9EdStFVUtVTmluN3diZG4ybFVWc055dmF3?=
 =?utf-8?B?ZkpId2hramhkQzVMaFlmWlN1SXlBWmQrRFVZSndlSmpKVm9XQjZqYytGeitn?=
 =?utf-8?B?RGRMLy9XNlA4YitlcEFONi9SN2l1K3o4UzhwaUFXRVFXZExRN3BiQ05vWUhC?=
 =?utf-8?B?a0hiSWIwY1ozS1doRTZkTHlYTnRNWEpmdUhjaUJBaENPMWxhRWxlclFLRWow?=
 =?utf-8?B?ODlNUmllUUI1YldMS0JncW5ERVdCaVlrd3FUN2UraGhoaW5JQm5aK1pUQWk0?=
 =?utf-8?B?eHQ4d3V5YWtiSE5pY0hOVkVXQ01IencwaTJ2MzU1MUp4aEYxd2RGSXNWbHhh?=
 =?utf-8?B?QmNHVitGaFF6c1JCU2dYRzBrazVpVWNYeWRqQzdsbGdZd2RZeGl3cTF3bmth?=
 =?utf-8?B?SkZKY09mbkZBenQ4cXQvcHhhZUJ6Z1RzVWhvK1NuWDNmVStqWHRPWmRWRjV4?=
 =?utf-8?B?emhnRWlBQk9HK01kUFRjdUFCNmxmRFZYako0RC9oRWZLVzdqWmtkQmJveGZW?=
 =?utf-8?B?ZTVTTVlVenA0OW1XVzNiQWJ3elBOc3E1ZnBRZEs1anRFZjNrOUJtSVk0SHNk?=
 =?utf-8?B?UmNISk1KWjVoMFVRUmlsRVFTUFFNMHVKMmJQYXZ6L1l4aDdNb2pGaWRRRkxz?=
 =?utf-8?B?N1prTnNiMGkrMm9JRTF3ZndCUzVKWStOT0RMRk1jOUUvQWdsUjhMSWtSV1lk?=
 =?utf-8?B?MGZBaDlXelE4V1BxQk0yUXE3bmovMU5TRkdDV3g4KzBIcCtlT2FvclZKeDRQ?=
 =?utf-8?B?Vm9hbkJOVjBYSThnY0dYZkZaUWNycGVrYUdKcW9Od25remRSNDl6YWtCbm1W?=
 =?utf-8?B?R1lTMnYzUTZaSitaZkM0a3JZdFFQNmdJN0piR3BwRWpCWnljY09qa0JId0tp?=
 =?utf-8?B?RFNqL0FFRFRQb0p3S01hRnNzaDg1VXErbkpxM1AxdnlBVTFPWHB1bDd3ZDJR?=
 =?utf-8?B?Ky9BZDJQSlRzQ3R1TWxoMDRnbGpvMXoyR2VtenBvNkpiS1pONjI3ZFJHRE84?=
 =?utf-8?B?Y1BoZWQrTXkvbmhjb1AwTFBheFcvbWF4R1kwcGdrRVZZSUZUaVBGSXIwbXlO?=
 =?utf-8?B?Q1dhaXNXc3ZQM1B0OTdMd2pIL0tINXdLUGtCUEhPdCs3ci9TZk8vQ3NoNEk5?=
 =?utf-8?B?eU8yT3YwSWw2YkdLMGtMZUMyZ1hVWUs5UVFjZ3QrZHprcTczSmtZNS9hSGNF?=
 =?utf-8?B?dUFoOWVYVEhIY2F0ZTJRQVpkY3lkL2NGdFUzOUpsbG5EeDNuRjF4Smx3OEo3?=
 =?utf-8?B?b2wxenFQVXBJYklRc0NHS0RGNEEybHVoYW9aR0d1NHNtc1RtN0U0Mm9yZGEz?=
 =?utf-8?B?eXJkMU1ZRVBxK1UvdU90UkcrYlFVM2dQR3NhY3E4eXZkQndpcFRXSWtUTXcw?=
 =?utf-8?B?RXNCaUhWbXByT1ZiYXRUUU8rdWZwT0JGeXBMaTdtWGUrVElpS0ZEZUxmWHda?=
 =?utf-8?B?RXZlcG5KbDF1Tkl6Z01zckRtdEVhRUlzUElCUVJxQjZ4ekVxdlBVMEE0bnFG?=
 =?utf-8?B?MEg0enVLQ3FuYk1mUmR3Y3AzZGptZDBDamF6dWNwaVkxRG96VXlNV3RaSndv?=
 =?utf-8?B?dzlXK2syRmVOYWxSS3V2a3BaOWIrUXdBU2dXT2thM3ViYjhTYmhMdXZrV0hD?=
 =?utf-8?B?eU0wcUVTNUkxUElEd2tJMFFmWWFicG5pYU9PZDhwOEdieGVPQWhDckZ5bVgy?=
 =?utf-8?B?aHcwSis2TGcxdXlPTFlWQjNRaHRqNS92bi9VTnV5NWc5a095VTZyTjc1bDRx?=
 =?utf-8?B?c0JqUFNKVkVzY0Fzc2tBOXEwSG93bGFGSFZKdzFNUTd3dXlrelZadHNkbnFx?=
 =?utf-8?B?OXBLOGZ0QzlBRU5BV0d2enFpWmw4Y3NhT2FMN3N6TVVTK2taWG04RGlEVDE2?=
 =?utf-8?B?ZlA4WlJIWUgrVlZKZ2d5alZkZ08rNTdWMldOZG9RQlNPSmZ2RjhWdz09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668f153a-ead2-412a-e6fc-08df3b60a668
X-MS-Exchange-CrossTenant-AuthSource: DS3PR03MB097838.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:17:20.5498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ra85HGH5V5a8vjwr762xdXZdLrqSravIUEDv+kTMmq3oWrM6u1lL2zLNqys/AY/ztePgVnBXQNnQTBoT81XQAVVArYr5JNVu3OWBZy1E/3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5205

From: Hang Suan Wang <hang.suan.wang@altera.com>

The Secure Device Manager (SDM) is a hardware security manager in Altera
SoCFPGA. It provides the Secure Data Object Store (SDOS), a service for
encrypting and decrypting data.

This patch adds the Altera SoCFPGA Crypto Service (FCS) driver, allowing
non-secure Linux software to request SDOS operations. Requests pass through
the SoCFPGA service layer (svc) to ARM Trusted Firmware (ATF), which
forwards permitted requests to the SDM.

The SDOS protects data at rest: the SDM encrypts and decrypts using a key
derived from a device-unique SDOS root key plus an SDM-generated IV, so
the host never handles raw key material or IVs. It only submits plaintext
it already owns and receives authenticated ciphertext objects managed by
the SDM. A primary use case is installing operational keys without ever
appearing in cleartext.

The driver is a standalone module and describes no hardware of its own.
It binds by name to the "stratix10-fcs" platform device registered by
stratix10-svc, so no device-tree node is required. SDOS requests go to
the SDM through the stratix10-svc asynchronous SIP SMC path using
service-layer memory pool buffers that the SDM can reach via physical or
SMMU-remapped addresses. Userspace talks to /dev/socfpga-fcs via ioctl
and sysfs exposes atf_version.

For encryption the SDM returns a structured object (header, ciphertext,
HMAC). For decryption the SDM validates the HMAC and enforces the 64-bit
owner ID from the object header so only the creator can decrypt it.

The user opens one SDM crypto session, sends one or more commands such
as SDOS, and closes the session when finished. The session stays open
across those commands. Each command takes priv->lock, so only one
request is in flight at a time. If the file that owns the session is
closed, including on process exit, the driver closes the session.

Signed-off-by: Hang Suan Wang <hang.suan.wang@altera.com>
---
 .../sysfs-devices-platform-stratix10-fcs      |  21 +
 Documentation/misc-devices/index.rst          |   1 +
 Documentation/misc-devices/socfpga-fcs.rst    | 231 +++++
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |  11 +
 drivers/firmware/Kconfig                      |  17 +
 drivers/firmware/Makefile                     |   2 +
 drivers/firmware/socfpga-fcs-core.c           | 856 ++++++++++++++++++
 drivers/firmware/socfpga-fcs.c                | 297 ++++++
 include/linux/firmware/intel/socfpga-fcs.h    | 168 ++++
 include/uapi/misc/socfpga-fcs-crypto.h        | 136 +++
 11 files changed, 1742 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-stratix10-fcs
 create mode 100644 Documentation/misc-devices/socfpga-fcs.rst
 create mode 100644 drivers/firmware/socfpga-fcs-core.c
 create mode 100644 drivers/firmware/socfpga-fcs.c
 create mode 100644 include/linux/firmware/intel/socfpga-fcs.h
 create mode 100644 include/uapi/misc/socfpga-fcs-crypto.h

diff --git a/Documentation/ABI/testing/sysfs-devices-platform-stratix10-fcs b/Documentation/ABI/testing/sysfs-devices-platform-stratix10-fcs
new file mode 100644
index 000000000000..1b23db16331e
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-platform-stratix10-fcs
@@ -0,0 +1,21 @@
+	Intel Stratix10 / Altera Agilex FPGA Crypto Service (FCS) device
+	attributes
+
+What:		/sys/devices/platform/stratix10-fcs.0/atf_version
+Date:		October 2026
+KernelVersion:	7.3
+Contact:	Hang Suan Wang <hang.suan.wang@altera.com>
+Contact:	Genevieve Chan <genevieve.chan@altera.com>
+Description:
+		(RO) Arm Trusted Firmware build version. The driver queries
+		it once through the stratix10-svc service layer while
+		probing, and every read returns that cached result.
+
+		The file contains three unsigned decimal numbers, the major,
+		minor and patch version, separated by dots and terminated by
+		a newline::
+
+			%u.%u.%u
+
+		A read fails with ENODATA when that probe-time query produced
+		no version.
diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index f911edaecbfa..9cefd8bc15a7 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -24,6 +24,7 @@ fit into other categories.
    mrvl_cn10k_dpi
    oxsemi-tornado
    pci-endpoint-test
+   socfpga-fcs
    spear-pcie-gadget
    tps6594-pfsm
    uacce
diff --git a/Documentation/misc-devices/socfpga-fcs.rst b/Documentation/misc-devices/socfpga-fcs.rst
new file mode 100644
index 000000000000..97c66421aba4
--- /dev/null
+++ b/Documentation/misc-devices/socfpga-fcs.rst
@@ -0,0 +1,231 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================================
+Altera SoCFPGA Crypto Service (FCS)
+===================================
+
+Overview
+========
+
+The Secure Device Manager (SDM) is the hardware security controller in Altera
+SoCFPGA devices. It offers a runtime cryptographic interface, the FPGA Crypto
+Service (FCS), which the host reaches through the stratix10-svc mailbox using
+Arm Trusted Firmware SIP SMC calls.
+
+The caller owns the crypto session lifecycle: open it once with
+``FCS_IOC_OPEN_SESSION`` and close it with ``FCS_IOC_CLOSE_SESSION`` (also
+performed automatically when the file descriptor is closed, including on
+process exit). Only one session may be open at a time across the whole
+device, and it belongs to the file description that opened it: other files
+cannot run commands on it or close it. Opens from other files fail with
+``EBUSY`` until the session is closed. A descriptor shared through ``fork()``
+or ``dup()`` refers to the same file description and therefore shares the
+session. The per-request context ID is managed by the kernel internally
+and is not part of the user ABI.
+
+This driver exposes one FCS operation: the Secure Data Object Service (SDOS),
+which encrypts and decrypts data at rest. The SDM derives the working key from
+a device-unique SDOS root key that never leaves the secure boundary, so the
+host never handles raw key material. A primary use case is black-key
+provisioning.
+
+
+Why a dedicated ioctl
+=====================
+
+SDOS seals and unseals arbitrary application data of up to 32 KiB, not keys of
+a bounded size, so the keyring payload limits of the trusted-keys subsystem do
+not apply to it. The object it produces is a firmware-defined container rather
+than a generic AEAD output, no key is ever set from the host so the crypto API
+has nothing to bind a transform to, and the SDM returns per-operation status
+values that must reach the caller alongside a valid result.
+
+Device node
+===========
+
+The driver registers a misc device::
+
+    /dev/socfpga-fcs
+
+Opening it takes a reference on the driver state. If the driver is unbound
+while the file is open, ``FCS_IOC_OPEN_SESSION`` and ``FCS_IOC_SDOS`` fail
+with ``ENODEV`` rather than tearing the file descriptor out from under the
+caller. ``FCS_IOC_CLOSE_SESSION`` does not return ``ENODEV``.
+
+Buffer sizes
+============
+
+An SDOS object consists of a 40-byte firmware-defined header, the payload, and
+for an encrypted object a trailing 48-byte HMAC. The payload is between 32 and
+32672 bytes.
+
+==================  ==================  ==============
+``op_mode``         ``src_size`` range  Maximum output
+==================  ==================  ==============
+``1`` (encrypt)     72 .. 32712 bytes   32760 bytes
+``0`` (decrypt)     120 .. 32760 bytes   32712 bytes
+==================  ==================  ==============
+
+Size the output buffer for the maximum shown above. On success the kernel
+writes the exact produced length to ``dst_size``. On failure ``dst_size`` is
+left unchanged.
+
+Data structures
+===============
+
+.. kernel-doc:: include/uapi/misc/socfpga-fcs-crypto.h
+   :identifiers: fcs_ioc_sdos
+
+Driver ioctls
+=============
+
+FCS_IOC_OPEN_SESSION
+---------------------
+
+.. c:macro:: FCS_IOC_OPEN_SESSION
+
+.. kernel-doc:: include/uapi/misc/socfpga-fcs-crypto.h
+   :doc: FCS_IOC_OPEN_SESSION
+
+FCS_IOC_CLOSE_SESSION
+----------------------
+
+.. c:macro:: FCS_IOC_CLOSE_SESSION
+
+.. kernel-doc:: include/uapi/misc/socfpga-fcs-crypto.h
+   :doc: FCS_IOC_CLOSE_SESSION
+
+FCS_IOC_SDOS
+-------------
+
+.. c:macro:: FCS_IOC_SDOS
+
+.. kernel-doc:: include/uapi/misc/socfpga-fcs-crypto.h
+   :doc: FCS_IOC_SDOS
+
+Return value
+============
+
+On success 0 is returned and, for ``FCS_IOC_SDOS``, ``dst_size`` holds the
+number of bytes the SDM produced. On error -1 is returned, ``errno`` is set,
+and ``dst_size`` is left unchanged.
+
+``src`` and ``dst`` are input addresses. The kernel writes back only
+``dst_size`` and ``error_code``. Set ``error_code`` to 0 before the call, and
+set ``flags`` and ``reserved`` to 0. The kernel overwrites ``error_code`` when
+the request reached the SDM, including when the SDM reported a failure, and
+leaves it unchanged otherwise.
+
+=========== ================================================================
+Error       Description
+=========== ================================================================
+EINVAL      ``dst`` was NULL, or ``src_size`` was out of range for
+            ``op_mode``, or ``op_mode`` was other than ``0`` or ``1``,
+            or ``flags`` or ``reserved`` was not zero.
+EMSGSIZE    The output did not fit in ``dst``. The operation itself
+            succeeded and ``error_code`` holds the SDM status, but the
+            result is discarded and ``dst_size`` is left unchanged.
+            Size ``dst`` for the maximum output.
+EFAULT      One of the supplied addresses was not accessible.
+EIO         The SDM reported a fatal error after the request reached it.
+            For ``FCS_IOC_SDOS``, ``error_code`` holds the status; a
+            transport failure that never reaches the SDM leaves it
+            unchanged instead.
+ETIMEDOUT   The SDM did not complete the request within the service
+            request timeout. For ``FCS_IOC_SDOS``, ``error_code`` is
+            left unchanged because no SDM status was reported.
+ENODEV      The device was unbound while the file descriptor was open.
+            Returned by ``FCS_IOC_OPEN_SESSION`` and ``FCS_IOC_SDOS``;
+            ``FCS_IOC_CLOSE_SESSION`` is unaffected.
+ENOMEM      Staging buffers could not be allocated.
+ENOTCONN    ``FCS_IOC_SDOS`` was issued with no crypto session open. Open
+            one first with ``FCS_IOC_OPEN_SESSION``.
+EBUSY       ``FCS_IOC_OPEN_SESSION`` was issued while a session was already
+            open. Retry once that session is closed.
+EPERM       ``FCS_IOC_SDOS`` or ``FCS_IOC_CLOSE_SESSION`` was issued on a
+            session owned by another file.
+EINTR       A signal arrived while waiting for another request to finish.
+            Only one SDM transaction is in flight at a time.
+ENOTTY      ``cmd`` was not one of the ioctls documented here.
+=========== ================================================================
+
+SDM status values
+=================
+
+The ``error_code`` member carries the firmware status. Set it to 0 before
+the call. The kernel writes it when the request reached the SDM and leaves
+it unchanged otherwise. Two decrypt results are successes that carry a
+warning: the ioctl returns 0 for both, ``dst_size`` is the produced length,
+and the plaintext is in ``dst``.
+
+======= ================================================================
+Status  Description
+======= ================================================================
+0x000   The operation completed successfully.
+0x102   Decryption succeeded; reprovisioning the key is recommended.
+0x103   Decryption succeeded, but not with the latest key.
+======= ================================================================
+
+Any other non-zero status is fatal and the ioctl fails with ``EIO``.
+
+Userspace usage
+===============
+
+A sample userspace application demonstrating these ioctls can be found at
+`Git Repository - altera-fpga/libfcs <https://github.com/altera-fpga/libfcs>`_
+
+Decrypting an object:
+
+.. code-block:: c
+
+    #include <fcntl.h>
+    #include <stdint.h>
+    #include <stdio.h>
+    #include <unistd.h>
+    #include <sys/ioctl.h>
+    #include <misc/socfpga-fcs-crypto.h>
+
+    int decrypt_object(const void *in, __u32 in_len)
+    {
+            __u8 out[32712];                /* maximum decrypt output */
+            int ret = 0;
+            int fd;
+
+            struct fcs_ioc_sdos arg = {
+                    .src        = (__u64)(uintptr_t)in,
+                    .src_size   = in_len,
+                    .dst        = (__u64)(uintptr_t)out,
+                    .dst_size   = sizeof(out),
+                    .op_mode    = 0,        /* decrypt */
+                    .error_code = 0,        /* set to 0; kernel writes the SDM status */
+                    .flags      = 0,
+                    .reserved   = 0,
+            };
+
+            fd = open("/dev/socfpga-fcs", O_RDWR);
+            if (fd < 0) {
+                    fprintf(stderr, "open failed: %m\n");
+                    return -1;
+            }
+
+            if (ioctl(fd, FCS_IOC_OPEN_SESSION, NULL) != 0) {
+                    fprintf(stderr, "open session failed: %m\n");
+                    ret = -1;
+                    goto done;
+            }
+
+            if (ioctl(fd, FCS_IOC_SDOS, &arg) == 0)
+                    /* arg.dst_size bytes of plaintext in out */
+                    write(STDOUT_FILENO, out, arg.dst_size);
+            else {
+                    fprintf(stderr, "SDOS failed: %m, SDM status 0x%x\n",
+                            arg.error_code);
+                    ret = -1;
+            }
+
+            ioctl(fd, FCS_IOC_CLOSE_SESSION, NULL);
+
+    done:
+            close(fd);
+            return ret;
+    }
diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 2fc53093752d..2bf78a38f266 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -348,6 +348,8 @@ Code  Seq#    Include File                                             Comments
                                                                        <mailto:luzmaximilian@gmail.com>
 0xA6  00-0F  uapi/linux/alloc_tag.h                                    Memory allocation profiling
                                                                        <mailto:surenb@google.com>
+0xA7  00-1F  uapi/misc/socfpga-fcs-crypto.h                            Altera SoCFPGA FCS (Crypto Service)
+                                                                       <mailto:hang.suan.wang@altera.com>
 0xAA  00-3F  linux/uapi/linux/userfaultfd.h
 0xAB  00-1F  linux/nbd.h
 0xAC  00-1F  linux/raw.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..e1367d1c4631 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -945,6 +945,17 @@ ALPS PS/2 TOUCHPAD DRIVER
 R:	Pali Rohár <pali@kernel.org>
 F:	drivers/input/mouse/alps.*
 
+ALTERA FCS DRIVER
+M:	Hang Suan Wang <hang.suan.wang@altera.com>
+M:	Genevieve Chan <genevieve.chan@altera.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-devices-platform-stratix10-fcs
+F:	Documentation/misc-devices/socfpga-fcs.rst
+F:	drivers/firmware/socfpga-fcs*
+F:	include/linux/firmware/intel/socfpga-fcs*
+F:	include/uapi/misc/socfpga-fcs*
+
 ALTERA MAILBOX DRIVER
 M:	Tien Sung Ang <tiensung.ang@altera.com>
 S:	Maintained
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index b7cc11e4fbfa..15727855fd5f 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -193,6 +193,23 @@ config INTEL_STRATIX10_RSU
 
 	  Say Y here if you want Intel RSU support.
 
+config ALTERA_SOCFPGA_FCS
+	tristate "Altera SoCFPGA Crypto Services (FCS)"
+	depends on INTEL_STRATIX10_SERVICE
+	help
+	  Altera SoCFPGA Crypto Services (FCS) driver gives user space
+	  access to the crypto services of the Secure Device Manager (SDM)
+	  through the Intel Service Layer, with requests forwarded to Arm
+	  Trusted Firmware.
+
+	  The SDM executes or authorizes the requests using device-rooted
+	  security resources. Protected key material stays within the
+	  secure firmware boundary and is never exposed to non-secure host
+	  software.
+
+	  Say Y here to add support for Altera SoCFPGA Crypto Services
+	  (FCS).
+
 config MTK_ADSP_IPC
 	tristate "MTK ADSP IPC Protocol driver"
 	depends on MTK_ADSP_MBOX
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index be46f1e1dc77..b489548ef3b8 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -2,6 +2,8 @@
 #
 # Makefile for the linux kernel.
 #
+obj-$(CONFIG_ALTERA_SOCFPGA_FCS) += altera-fcs.o
+altera-fcs-y := socfpga-fcs.o socfpga-fcs-core.o
 obj-$(CONFIG_ARM_SCPI_PROTOCOL)	+= arm_scpi.o
 obj-$(CONFIG_ARM_SDE_INTERFACE)	+= arm_sdei.o
 obj-$(CONFIG_ARM_SDEI_NMI)	+= arm_sdei_nmi.o
diff --git a/drivers/firmware/socfpga-fcs-core.c b/drivers/firmware/socfpga-fcs-core.c
new file mode 100644
index 000000000000..365cafb46545
--- /dev/null
+++ b/drivers/firmware/socfpga-fcs-core.c
@@ -0,0 +1,856 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Altera Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/lockdep.h>
+#include <linux/random.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+#include <linux/firmware/intel/socfpga-fcs.h>
+#include <linux/firmware/intel/stratix10-svc-client.h>
+
+#define OWNER_ID_OFFSET				12
+
+#define SDOS_DECRYPTION_REPROVISION_KEY_WARN	0x102
+#define SDOS_DECRYPTION_NOT_LATEST_KEY_WARN	0x103
+
+#define MSG_RETRY				3
+#define FCS_RETRY_SLEEP_MS			1
+
+/**
+ * fcs_atf_version_callback() - service-layer callback for the ATF version query
+ * @client: pointer to the stratix10-svc client
+ * @data: pointer to the service-layer callback data
+ */
+static void fcs_atf_version_callback(struct stratix10_svc_client *client,
+				     struct stratix10_svc_cb_data *data)
+{
+	struct socfpga_fcs_priv *p = client->priv;
+
+	p->status = data->status;
+
+	/* Prevent missing payload pointer */
+	if (!data->kaddr1 || !data->kaddr2 || !data->kaddr3) {
+		dev_err(client->dev, "ATF version is not valid\n");
+		p->status = -EIO;
+		p->atf_version_valid = false;
+		goto complete;
+	}
+
+	if (data->status == BIT(SVC_STATUS_OK)) {
+		p->status = 0;
+		p->atf_version[0] = lower_32_bits(*(unsigned long *)data->kaddr1);
+		p->atf_version[1] = lower_32_bits(*(unsigned long *)data->kaddr2);
+		p->atf_version[2] = lower_32_bits(*(unsigned long *)data->kaddr3);
+		p->atf_version_valid = true;
+	} else if (data->status == BIT(SVC_STATUS_ERROR)) {
+		p->status = lower_32_bits(*(unsigned long *)data->kaddr1);
+		dev_err(client->dev, "mbox_error=0x%x\n", p->status);
+	}
+
+complete:
+	complete(&p->completion);
+}
+
+/**
+ * fcs_svc_send_sync() - run a command on the synchronous service path
+ * @priv: FCS private state
+ * @msg: service-layer message to send
+ * @timeout: time to wait for the response
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_svc_send_sync(struct socfpga_fcs_priv *priv,
+			     struct stratix10_svc_client_msg *msg,
+			     unsigned long timeout)
+{
+	int ret;
+
+	reinit_completion(&priv->completion);
+
+	/*
+	 * receive_cb is only used by the sync send path; leave it set so a
+	 * late response cannot find a NULL callback.
+	 */
+	priv->client.receive_cb = fcs_atf_version_callback;
+
+	ret = stratix10_svc_send(priv->chan, msg);
+	if (ret) {
+		dev_err(priv->client.dev, "failed to send message to service channel\n");
+		priv->client.receive_cb = NULL;
+		return ret;
+	}
+
+	if (!wait_for_completion_timeout(&priv->completion,
+					 msecs_to_jiffies(timeout))) {
+		dev_err(priv->client.dev, "svc timeout to get completed status\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+/**
+ * fcs_svc_send_async() - run a command on the asynchronous mailbox path
+ * @priv: FCS private state
+ * @msg: service-layer message to send
+ * @timeout: time to wait for the response
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_svc_send_async(struct socfpga_fcs_priv *priv,
+			      struct stratix10_svc_client_msg *msg,
+			      unsigned long timeout)
+{
+	unsigned long deadline = jiffies + msecs_to_jiffies(timeout);
+	struct stratix10_svc_cb_data data;
+	void *handle = NULL;
+	int status, index;
+	int ret;
+
+	for (index = 0; index < MSG_RETRY; index++) {
+		status = stratix10_svc_async_send(priv->chan, msg, &handle,
+						  NULL, NULL);
+		if (status == 0)
+			break;
+		msleep(FCS_RETRY_SLEEP_MS);
+	}
+
+	if (status || !handle) {
+		dev_err(priv->client.dev, "Failed to send async message\n");
+		/*
+		 * A NULL handle with a success status would otherwise be
+		 * reported as a completed transaction that never ran.
+		 */
+		return status ? status : -EIO;
+	}
+
+	ret = -ETIMEDOUT;
+	while (!time_after(jiffies, deadline)) {
+		status = stratix10_svc_async_poll(priv->chan, handle, &data);
+
+		if (status == -EAGAIN) {
+		/*
+		 * Keep polling until the deadline. Leaving an in-flight
+		 * transaction orphans the SDM crypto session.
+		 */
+		} else if (status < 0) {
+			ret = status;
+			break;
+		} else if (status == 0) {
+			ret = 0;
+			break;
+		}
+		msleep(FCS_RETRY_SLEEP_MS);
+	}
+
+	if (ret) {
+		dev_err(priv->client.dev, "Failed to poll async message\n");
+		goto out;
+	}
+
+	priv->status = data.status;
+
+	/*
+	 * For warnings 0x102/0x103 are success-with-warning (outdated key)
+	 * the plaintext is valid and fcs_sdos_crypt() still returns it.
+	 * Non-zero SDM status is a firmware result, not a transport failure.
+	 */
+	if (data.kaddr1)
+		priv->resp = lower_32_bits(*(unsigned long *)data.kaddr1);
+
+	if (data.status)
+		dev_err(priv->client.dev, "SDM mailbox status 0x%x\n", data.status);
+
+out:
+	stratix10_svc_async_done(priv->chan, handle);
+
+	return ret;
+}
+
+/**
+ * fcs_svc_send_request() - build and send an FCS command to the service layer
+ * @priv: FCS private state
+ * @command: FCS command code to dispatch
+ * @timeout: time to wait for completion, in milliseconds
+ * @params: payload and arguments for @command, or NULL for commands that
+ *          carry none
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_svc_send_request(struct socfpga_fcs_priv *priv,
+				enum fcs_command_code command,
+				unsigned long timeout,
+				const struct fcs_cmd_params *params)
+{
+	struct stratix10_svc_client_msg *msg;
+	int ret = 0;
+
+	/*
+	 * The service layer keeps this message alive in its transaction handle
+	 * and still dereferences it from stratix10_svc_async_done(), so it
+	 * cannot live on our stack.
+	 */
+	msg = kzalloc_obj(*msg);
+	if (!msg)
+		return -ENOMEM;
+
+	priv->status = 0;
+	priv->resp = 0;
+
+	switch (command) {
+	case FCS_DEV_CRYPTO_OPEN_SESSION:
+		dev_dbg(priv->client.dev, "Sending command: COMMAND_FCS_CRYPTO_OPEN_SESSION\n");
+		msg->command = COMMAND_FCS_CRYPTO_OPEN_SESSION;
+		break;
+
+	case FCS_DEV_CRYPTO_CLOSE_SESSION:
+		dev_dbg(priv->client.dev, "Sending command: COMMAND_FCS_CRYPTO_CLOSE_SESSION with session_id: 0x%x\n",
+			priv->session_id);
+		msg->arg[0] = priv->session_id;
+		msg->command = COMMAND_FCS_CRYPTO_CLOSE_SESSION;
+		break;
+
+	case FCS_DEV_ATF_VERSION:
+		dev_dbg(priv->client.dev, "Sending command: COMMAND_SMC_ATF_BUILD_VER\n");
+		msg->command = COMMAND_SMC_ATF_BUILD_VER;
+		break;
+
+	case FCS_DEV_SDOS_DATA_EXT:
+		if (!params) {
+			ret = -EINVAL;
+			break;
+		}
+		dev_dbg(priv->client.dev, "Sending command: COMMAND_FCS_SDOS_DATA_EXT with session_id: 0x%x, context_id: 0x%x, op_mode: 0x%llx, own: 0x%llx\n",
+			priv->session_id, params->context_id,
+			params->arg[0], params->arg[1]);
+		msg->arg[0] = priv->session_id;
+		msg->arg[1] = params->context_id;
+		msg->arg[2] = params->arg[0];
+		msg->arg[3] = params->arg[1];
+		msg->payload = (void *)params->src;
+		msg->payload_length = params->src_len;
+		msg->payload_output = params->dst;
+		msg->payload_length_output = params->dst_len;
+		msg->command = COMMAND_FCS_SDOS_DATA_EXT;
+		break;
+
+	default:
+		dev_err(priv->client.dev, "Unknown command: 0x%x\n", command);
+		ret = -EINVAL;
+		break;
+	}
+
+	if (!ret) {
+		if (command == FCS_DEV_ATF_VERSION)
+			/* ATF fast call for simple command */
+			ret = fcs_svc_send_sync(priv, msg, timeout);
+		else
+			ret = fcs_svc_send_async(priv, msg, timeout);
+	}
+
+	kfree(msg);
+
+	return ret;
+}
+
+/*
+ * fcs_seq_begin() - start a serialized FCS request
+ *
+ * Takes @priv->lock and checks the device is present, a session is
+ * open and @owner owns it.
+ *
+ * Return: 0 on success, with @priv->lock held; negative errno on
+ * failure, with the lock dropped.
+ */
+static int fcs_seq_begin(struct socfpga_fcs_priv *priv,
+			 const void *owner, bool wait)
+{
+	int ret;
+
+	if (wait) {
+		if (mutex_lock_interruptible(&priv->lock))
+			return -ERESTARTSYS;
+	} else if (!mutex_trylock(&priv->lock)) {
+		return -EAGAIN;
+	}
+
+	if (priv->removed) {
+		ret = -ENODEV;
+		goto unlock;
+	}
+
+	if (!priv->session_opened) {
+		ret = -ENOTCONN;
+		goto unlock;
+	}
+
+	if (priv->session_owner != owner) {
+		ret = -EPERM;
+		goto unlock;
+	}
+
+	return 0;
+
+unlock:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
+static void fcs_seq_end(struct socfpga_fcs_priv *priv)
+{
+	mutex_unlock(&priv->lock);
+}
+
+/*
+ * fcs_engine_step_locked() - run one FCS command
+ *
+ * Caller must hold @priv->lock. Sends the command and copies the
+ * output back; the SDM status is stored in @params.
+ *
+ * Return: 0 if the transaction completed, negative errno otherwise.
+ */
+static int fcs_engine_step_locked(struct socfpga_fcs_priv *priv,
+				  enum fcs_command_code command,
+				  struct fcs_cmd_params *params)
+{
+	struct fcs_cmd_params svc = *params;
+	void *s_buf = NULL, *d_buf = NULL;
+	u32 out_cap = params->dst_len;
+	int ret;
+
+	lockdep_assert_held(&priv->lock);
+
+	if (!params->context_id)
+		return -EINVAL;
+
+	/*
+	 * Copy-out below treats the firmware response value as a byte
+	 * count, which is only defined for SDOS. Reject
+	 * an output buffer for any other command instead of silently
+	 * misinterpreting that value.
+	 */
+	if (params->dst && command != FCS_DEV_SDOS_DATA_EXT) {
+		dev_err(priv->client.dev,
+			"copy-out not supported for command %d\n", command);
+		return -EINVAL;
+	}
+
+	params->status = 0;
+	params->status_valid = false;
+
+	if (params->src) {
+		s_buf = stratix10_svc_allocate_memory(priv->chan,
+						      params->src_len);
+		if (IS_ERR(s_buf)) {
+			ret = PTR_ERR(s_buf);
+			goto out;
+		}
+		memcpy(s_buf, params->src, params->src_len);
+		svc.src = s_buf;
+	}
+
+	if (params->dst) {
+		d_buf = stratix10_svc_allocate_memory(priv->chan, out_cap);
+		if (IS_ERR(d_buf)) {
+			ret = PTR_ERR(d_buf);
+			goto out;
+		}
+		svc.dst = d_buf;
+	}
+
+	ret = fcs_svc_send_request(priv, command,
+				   SVC_FCS_REQUEST_TIMEOUT_MS, &svc);
+	if (ret)
+		goto out;
+
+	params->status = priv->status;
+	params->status_valid = true;
+
+	if (params->dst) {
+		if (priv->resp > out_cap) {
+			dev_err(priv->client.dev,
+				"FCS output %u exceeds kernel buffer %u\n",
+				priv->resp, out_cap);
+			ret = -EIO;
+			goto out;
+		}
+		memcpy(params->dst, d_buf, priv->resp);
+		params->dst_len = priv->resp;
+	}
+
+out:
+	if (d_buf)
+		stratix10_svc_free_memory(priv->chan, d_buf);
+	if (s_buf)
+		stratix10_svc_free_memory(priv->chan, s_buf);
+	return ret;
+}
+
+/**
+ * socfpga_fcs_core_engine() - run one FCS command
+ * @priv: state returned by fcs_init()
+ * @owner: token passed to fcs_ctx_begin() when the session was opened
+ * @command: FCS command code to send
+ * @params: command parameters, with a caller-generated context ID
+ * @wait: true to wait for the lock, false to return -EAGAIN if busy
+ *
+ * Takes @priv->lock, checks the session, sends the command and copies
+ * the output back. The SDM status is stored in @params->status, valid
+ * only when @params->status_valid is set.
+ *
+ * Return: 0 if the transaction completed, negative errno otherwise.
+ */
+int socfpga_fcs_core_engine(struct socfpga_fcs_priv *priv, const void *owner,
+			    enum fcs_command_code command,
+			    struct fcs_cmd_params *params, bool wait)
+{
+	int ret;
+
+	ret = fcs_seq_begin(priv, owner, wait);
+	if (ret)
+		return ret;
+
+	ret = fcs_engine_step_locked(priv, command, params);
+	fcs_seq_end(priv);
+
+	return ret;
+}
+
+/**
+ * fcs_open_session_locked() - open a crypto session on the SDM
+ * @priv: FCS private state
+ * @owner: opaque token recorded as the session owner
+ *
+ * Caller must hold @priv->lock. Only one session may be open.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_open_session_locked(struct socfpga_fcs_priv *priv,
+				   const void *owner)
+{
+	int ret;
+
+	lockdep_assert_held(&priv->lock);
+
+	if (priv->session_opened) {
+		/* SDM allows one crypto session at a time; caller-triggerable */
+		dev_dbg(priv->client.dev, "FCS: crypto session already opened\n");
+		return -EBUSY;
+	}
+
+	ret = fcs_svc_send_request(priv, FCS_DEV_CRYPTO_OPEN_SESSION,
+				   SVC_FCS_REQUEST_TIMEOUT_MS, NULL);
+	if (ret)
+		return ret;
+
+	if (priv->status)
+		return -EIO;
+
+	priv->session_id = priv->resp;
+	priv->session_opened = true;
+	priv->session_owner = owner;
+
+	return 0;
+}
+
+/**
+ * fcs_close_session_locked() - close the crypto session on the SDM
+ * @priv: FCS private state
+ *
+ * Caller must hold @priv->lock. Local session state is cleared even
+ * if the close fails. The owner check is in fcs_ctx_end(); teardown
+ * callers may close any session.
+ *
+ * Return: 0 on success or when no session is open, negative errno
+ * otherwise.
+ */
+static int fcs_close_session_locked(struct socfpga_fcs_priv *priv)
+{
+	int ret;
+
+	lockdep_assert_held(&priv->lock);
+
+	if (!priv->session_opened)
+		/* nothing to close */
+		return 0;
+
+	ret = fcs_svc_send_request(priv, FCS_DEV_CRYPTO_CLOSE_SESSION,
+				   SVC_FCS_REQUEST_TIMEOUT_MS, NULL);
+
+	priv->session_id = 0;
+	priv->session_opened = false;
+	priv->session_owner = NULL;
+
+	if (!ret && priv->status)
+		ret = -EIO;
+
+	return ret;
+}
+
+/**
+ * fcs_ctx_begin() - open a crypto session
+ * @priv: state returned by fcs_init()
+ * @owner: opaque token identifying the session owner
+ *
+ * Opens a session and records @owner as its owner. The session stays
+ * open after return.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int fcs_ctx_begin(struct socfpga_fcs_priv *priv, const void *owner)
+{
+	int ret;
+
+	/* Only a real owner token can own a session. */
+	if (!owner)
+		return -EINVAL;
+
+	if (mutex_lock_interruptible(&priv->lock))
+		return -ERESTARTSYS;
+
+	if (priv->removed) {
+		ret = -ENODEV;
+		goto unlock;
+	}
+
+	ret = fcs_open_session_locked(priv, owner);
+
+unlock:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+/**
+ * fcs_ctx_end() - finish the current context and close the session
+ * @priv: state returned by fcs_init()
+ * @owner: token passed to fcs_ctx_begin()
+ *
+ * Closes the session if @owner owns it. Also called from file
+ * release, so it waits for the lock.
+ *
+ * Return: 0 on success or when no session is open, negative errno
+ * otherwise.
+ */
+int fcs_ctx_end(struct socfpga_fcs_priv *priv, const void *owner)
+{
+	int ret;
+
+	if (!owner)
+		return -EINVAL;
+
+	mutex_lock(&priv->lock);
+
+	if (!priv->session_opened) {
+		ret = 0;
+		goto unlock;
+	}
+
+	if (priv->session_owner != owner) {
+		ret = -EPERM;
+		goto unlock;
+	}
+
+	ret = fcs_close_session_locked(priv);
+
+unlock:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+/**
+ * fcs_get_atf_version() - return the cached Arm Trusted Firmware version
+ * @priv: state returned by fcs_init()
+ * @version: three u32 entries for major, minor and patch
+ *
+ * Return: 0 on success, -ENODATA if no version was obtained.
+ */
+int fcs_get_atf_version(struct socfpga_fcs_priv *priv, u32 *version)
+{
+	if (!priv->atf_version_valid)
+		return -ENODATA;
+
+	memcpy(version, priv->atf_version, sizeof(priv->atf_version));
+
+	return 0;
+}
+
+/**
+ * fcs_sdos_output_size() - validate an SDOS input length and size its output
+ * @op_mode: value 1 for encrypt, value 0 for decrypt
+ *	      Any other value is rejected with ``EINVAL``.
+ * @src_len: length of the input, including the SDOS header
+ * @out_len: receives the output capacity the SDM may need
+ *
+ * Return: 0 on success, -EINVAL on a bad @op_mode or @src_len.
+ */
+int fcs_sdos_output_size(u32 op_mode, u32 src_len, u32 *out_len)
+{
+	if (op_mode > 1)
+		return -EINVAL;
+
+	if (op_mode) {
+		/* encrypt: input is header + plaintext */
+		if (src_len < SDOS_DECRYPTED_MIN_SZ ||
+		    src_len > SDOS_DECRYPTED_MAX_SZ)
+			return -EINVAL;
+
+		*out_len = SDOS_ENCRYPTED_MAX_SZ;
+	} else {
+		/* decrypt: input is header + plaintext + HMAC */
+		if (src_len < SDOS_ENCRYPTED_MIN_SZ ||
+		    src_len > SDOS_ENCRYPTED_MAX_SZ)
+			return -EINVAL;
+
+		*out_len = SDOS_DECRYPTED_MAX_SZ;
+	}
+
+	return 0;
+}
+
+/**
+ * fcs_sdos_crypt() - perform an SDOS encrypt or decrypt operation
+ * @priv: state returned by fcs_init()
+ * @owner: token passed to fcs_ctx_begin() when the session was opened
+ * @req: request describing the operation, using plain kernel buffers
+ *
+ * On return, @req->status and @req->status_valid carry the SDM status
+ * if the transaction completed, even if the call failed.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int fcs_sdos_crypt(struct socfpga_fcs_priv *priv, const void *owner,
+		   struct fcs_sdos_req *req)
+{
+	struct fcs_cmd_params params = { };
+	u32 output_size;
+	int ret;
+
+	if (!owner || !req->src || !req->dst)
+		return -EINVAL;
+
+	ret = fcs_sdos_output_size(req->op_mode, req->src_len, &output_size);
+	if (ret) {
+		dev_dbg(priv->client.dev, "Invalid SDOS src_size %u\n", req->src_len);
+		return ret;
+	}
+
+	/* The caller must have sized the output buffer for the worst case. */
+	if (req->dst_len < output_size)
+		return -EINVAL;
+
+	/*
+	 * SDM requires a non-zero context ID per request. A fresh random
+	 * value per call, not per session, also keeps a late response to a
+	 * timed-out request from being mistaken for the reply to the next
+	 * one on the same session. The engine never generates it.
+	 */
+	params.context_id = get_random_u32_above(0);
+	params.src = req->src;
+	params.src_len = req->src_len;
+	params.dst = req->dst;
+	params.dst_len = output_size;
+	params.arg[0] = req->op_mode;
+	/* Owner ID is stored little-endian in the SDOS header (offset 12) */
+	params.arg[1] = get_unaligned_le64((const u8 *)req->src + OWNER_ID_OFFSET);
+
+	/*
+	 * The session is never closed here on failure, for any reason
+	 * (transport failure, a fatal SDM status or a bad response size):
+	 * the caller is in charge of the session lifecycle, so a failed
+	 * request is reported and the session is left exactly as it was.
+	 * The caller decides whether to retry on the same session or close
+	 * it with FCS_IOC_CLOSE_SESSION.
+	 */
+	ret = socfpga_fcs_core_engine(priv, owner, FCS_DEV_SDOS_DATA_EXT,
+				      &params, true);
+
+	/*
+	 * Relay the SDM status whenever the mailbox transaction completed,
+	 * even if the engine then rejected the result (e.g. an output
+	 * larger than the buffer): the front-end writes it to error_code.
+	 * On a transport failure status_valid is clear and nothing is
+	 * relayed.
+	 */
+	req->status = params.status;
+	req->status_valid = params.status_valid;
+
+	if (ret) {
+		dev_err(priv->client.dev,
+			"Failed to send the cmd=%d,ret=%d\n", FCS_DEV_SDOS_DATA_EXT, ret);
+		return ret;
+	}
+
+	if (params.status &&
+	    params.status != SDOS_DECRYPTION_REPROVISION_KEY_WARN &&
+	    params.status != SDOS_DECRYPTION_NOT_LATEST_KEY_WARN) {
+		dev_err(priv->client.dev,
+			"Failed to perform SDOS operation Mailbox Status = 0x%x\n",
+			params.status);
+		return -EIO;
+	}
+
+	req->dst_len = params.dst_len;
+
+	return 0;
+}
+
+/**
+ * fcs_read_version_from_atf() - query the Arm Trusted Firmware build version
+ * @priv: FCS private state
+ *
+ * Send the ATF version command to the SDM and cache the result in @priv.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_read_version_from_atf(struct socfpga_fcs_priv *priv)
+{
+	int ret;
+
+	ret = fcs_svc_send_request(priv, FCS_DEV_ATF_VERSION,
+				   SVC_FCS_REQUEST_TIMEOUT_MS, NULL);
+	if (ret) {
+		dev_err(priv->client.dev,
+			"Failed to send the cmd=%d,ret=%d\n",
+			FCS_DEV_ATF_VERSION, ret);
+		goto svc_done;
+	}
+
+	if (priv->status) {
+		ret = -EIO;
+		dev_err(priv->client.dev,
+			"Mailbox error, Failed to read ATF version ret: %d\n", ret);
+	}
+
+svc_done:
+	stratix10_svc_done(priv->chan);
+
+	return ret;
+}
+
+/**
+ * fcs_kref_release() - free the FCS state when the last reference is dropped
+ * @kref: reference counter embedded in the FCS state
+ */
+static void fcs_kref_release(struct kref *kref)
+{
+	struct socfpga_fcs_priv *priv =
+		container_of(kref, struct socfpga_fcs_priv, refcount);
+
+	if (priv->chan) {
+		if (priv->session_opened) {
+			int ret;
+
+			mutex_lock(&priv->lock);
+			ret = fcs_close_session_locked(priv);
+			mutex_unlock(&priv->lock);
+
+			if (ret)
+				dev_err(priv->client.dev,
+					"Failed to close FCS service session,ret=%d\n", ret);
+		}
+
+		stratix10_svc_remove_async_client(priv->chan);
+		stratix10_svc_free_channel(priv->chan);
+	}
+
+	mutex_destroy(&priv->lock);
+	kfree(priv);
+}
+
+/**
+ * socfpga_fcs_get() - take a reference on the FCS state
+ * @priv: state returned by fcs_init()
+ */
+void socfpga_fcs_get(struct socfpga_fcs_priv *priv)
+{
+	kref_get(&priv->refcount);
+}
+
+/**
+ * socfpga_fcs_put() - drop a reference on the FCS state
+ * @priv: state returned by fcs_init()
+ */
+void socfpga_fcs_put(struct socfpga_fcs_priv *priv)
+{
+	kref_put(&priv->refcount, fcs_kref_release);
+}
+
+/**
+ * fcs_mark_removed() - refuse further operations after the device is gone
+ * @priv: state returned by fcs_init()
+ */
+void fcs_mark_removed(struct socfpga_fcs_priv *priv)
+{
+	mutex_lock(&priv->lock);
+	priv->removed = true;
+
+	if (priv->session_opened)
+		fcs_close_session_locked(priv);
+
+	if (priv->chan)	{
+		stratix10_svc_remove_async_client(priv->chan);
+		stratix10_svc_free_channel(priv->chan);
+		priv->chan = NULL;
+	}
+
+	mutex_unlock(&priv->lock);
+}
+
+/**
+ * fcs_init() - allocate and initialise the FCS private state
+ * @dev: pointer to fcs device
+ *
+ * Return: the new state, or an ERR_PTR on failure.
+ */
+struct socfpga_fcs_priv *fcs_init(struct device *dev)
+{
+	struct socfpga_fcs_priv *priv;
+	int ret;
+
+	priv = kzalloc_obj(*priv);
+	if (!priv)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&priv->refcount);
+	mutex_init(&priv->lock);
+
+	/* kzalloc() already cleared client.receive_cb. */
+	priv->client.dev = dev;
+	priv->client.priv = priv;
+
+	priv->chan = stratix10_svc_request_channel_byname(&priv->client,
+							  SVC_CLIENT_FCS);
+	if (IS_ERR(priv->chan)) {
+		dev_err(dev, "couldn't get service channel %s\n", SVC_CLIENT_FCS);
+		ret = PTR_ERR(priv->chan);
+		goto err_free;
+	}
+
+	ret = stratix10_svc_add_async_client(priv->chan, true);
+	if (ret) {
+		dev_err(dev, "Failed to add async client\n");
+		stratix10_svc_free_channel(priv->chan);
+		goto err_free;
+	}
+
+	init_completion(&priv->completion);
+
+	/*
+	 * Version query failure is non-fatal; sysfs reports -ENODATA.
+	 */
+	fcs_read_version_from_atf(priv);
+
+	return priv;
+
+err_free:
+	mutex_destroy(&priv->lock);
+	kfree(priv);
+
+	return ERR_PTR(ret);
+}
diff --git a/drivers/firmware/socfpga-fcs.c b/drivers/firmware/socfpga-fcs.c
new file mode 100644
index 000000000000..c4a0c96ccca9
--- /dev/null
+++ b/drivers/firmware/socfpga-fcs.c
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+
+#include <linux/err.h>
+#include <linux/firmware/intel/socfpga-fcs.h>
+#include <linux/fs.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/uaccess.h>
+#include <uapi/misc/socfpga-fcs-crypto.h>
+
+/**
+ * atf_version_show() - report the Arm Trusted Firmware build version
+ * @dev: pointer to fcs device
+ * @attr: device attribute
+ * @buf: pointer to character buffer to receive the version string
+ *
+ * Return: bytes written to @buf, or -ENODATA if no version.
+ */
+static ssize_t atf_version_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct socfpga_fcs_priv *priv = dev_get_drvdata(dev);
+	u32 version[3];
+	int ret;
+
+	ret = fcs_get_atf_version(priv, version);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u.%u.%u\n", version[0], version[1], version[2]);
+}
+
+/**
+ * fcs_sdos() - perform an SDOS encrypt/decrypt operation
+ * @priv: FCS state of the device this request arrived on
+ * @file: open file the request arrived on; must own the session
+ * @uarg: user pointer to a struct fcs_ioc_sdos
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static long fcs_sdos(struct socfpga_fcs_priv *priv, struct file *file,
+		     void __user *uarg)
+{
+	struct fcs_ioc_sdos __user *uioc = uarg;
+	struct fcs_sdos_req req = { };
+	struct fcs_ioc_sdos u;
+	void *s_buf, *d_buf;
+	u32 output_size;
+	long ret;
+
+	if (copy_from_user(&u, uarg, sizeof(u)))
+		return -EFAULT;
+
+	/* Reserved for extensions: reject what this kernel does not know. */
+	if (u.flags || u.reserved)
+		return -EINVAL;
+
+	if (!u.dst)
+		return -EINVAL;
+
+	ret = fcs_sdos_output_size(u.op_mode, u.src_size, &output_size);
+	if (ret)
+		return ret;
+
+	s_buf = kvmalloc(u.src_size, GFP_KERNEL);
+	if (!s_buf)
+		return -ENOMEM;
+
+	d_buf = kvmalloc(output_size, GFP_KERNEL);
+	if (!d_buf) {
+		ret = -ENOMEM;
+		goto free_sbuf;
+	}
+
+	/*
+	 * Stage the payload in ordinary kernel memory. The engine holds
+	 * priv->lock across the service-layer pool buffers, and a faulting
+	 * user page must not be able to block device removal on that lock.
+	 */
+	if (copy_from_user(s_buf, u64_to_user_ptr(u.src), u.src_size)) {
+		ret = -EFAULT;
+		goto free_dbuf;
+	}
+
+	req.op_mode	= u.op_mode;
+	req.src		= s_buf;
+	req.src_len	= u.src_size;
+	req.dst		= d_buf;
+	req.dst_len	= output_size;
+
+	ret = fcs_sdos_crypt(priv, file, &req);
+	if (ret)
+		goto relay_status;
+
+	if (req.dst_len > u.dst_size) {
+		pr_debug("SDOS output %u exceeds caller buffer %u\n",
+			 req.dst_len, u.dst_size);
+		ret = -EMSGSIZE;
+		goto relay_status;
+	}
+
+	if (copy_to_user(u64_to_user_ptr(u.dst), d_buf, req.dst_len)) {
+		ret = -EFAULT;
+		goto relay_status;
+	}
+
+	if (put_user(req.dst_len, &uioc->dst_size))
+		ret = -EFAULT;
+
+relay_status:
+	if (req.status_valid && put_user(req.status, &uioc->error_code)) {
+		/* surface the copy failure only if nothing failed earlier */
+		if (!ret)
+			ret = -EFAULT;
+	}
+free_dbuf:
+	kvfree(d_buf);
+free_sbuf:
+	kvfree(s_buf);
+
+	return ret;
+}
+
+/**
+ * fcs_open() - take a reference on the device state for this file
+ * @inode: inode of the FCS misc device
+ * @file: open file being created
+ *
+ * Return: 0 always.
+ */
+static int fcs_open(struct inode *inode, struct file *file)
+{
+	struct miscdevice *miscdev = file->private_data;
+	struct socfpga_fcs_priv *priv =
+		container_of(miscdev, struct socfpga_fcs_priv, miscdev);
+
+	socfpga_fcs_get(priv);
+	file->private_data = priv;
+
+	return 0;
+}
+
+/**
+ * fcs_release() - close the file's session and drop its device reference
+ * @inode: inode of the FCS misc device
+ * @file: open file being released
+ *
+ * Closes the session if this file owns it.
+ *
+ * Return: 0 always.
+ */
+static int fcs_release(struct inode *inode, struct file *file)
+{
+	/* close the crypto session if this file owns it */
+	fcs_ctx_end(file->private_data, file);
+	socfpga_fcs_put(file->private_data);
+
+	return 0;
+}
+
+/**
+ * fcs_ioctl() - dispatch an FCS ioctl command
+ * @file: open file for the FCS misc device
+ * @cmd: ioctl command code
+ * @arg: user pointer to the command-specific argument structure
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static long fcs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct socfpga_fcs_priv *priv = file->private_data;
+	void __user *uarg = (void __user *)arg;
+
+	switch (cmd) {
+	case FCS_IOC_OPEN_SESSION:
+		return fcs_ctx_begin(priv, file);
+	case FCS_IOC_CLOSE_SESSION:
+		return fcs_ctx_end(priv, file);
+	case FCS_IOC_SDOS:
+		return fcs_sdos(priv, file, uarg);
+	default:
+		return -ENOTTY;
+	}
+}
+
+static const struct file_operations fcs_fops = {
+	.owner		= THIS_MODULE,
+	.open		= fcs_open,
+	.release	= fcs_release,
+	.unlocked_ioctl	= fcs_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
+};
+
+static DEVICE_ATTR_RO(atf_version);
+
+static struct attribute *fcs_attrs[] = {
+	&dev_attr_atf_version.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(fcs);
+
+/**
+ * fcs_driver_probe() - probe the FCS platform device
+ * @pdev: pointer to the FCS platform device
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_driver_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct socfpga_fcs_priv *priv;
+	int ret;
+
+	priv = fcs_init(dev);
+	if (IS_ERR(priv))
+		return dev_err_probe(dev, PTR_ERR(priv),
+				     "Failed to initialize FCS\n");
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->miscdev.minor = MISC_DYNAMIC_MINOR;
+	priv->miscdev.name = "socfpga-fcs";
+	priv->miscdev.fops = &fcs_fops;
+	priv->miscdev.parent = dev;
+
+	ret = misc_register(&priv->miscdev);
+	if (ret) {
+		socfpga_fcs_put(priv);
+		return dev_err_probe(dev, ret, "Failed to register misc device\n");
+	}
+
+	return 0;
+}
+
+/**
+ * fcs_driver_remove() - remove the FCS platform device
+ * @pdev: pointer to the FCS platform device
+ */
+static void fcs_driver_remove(struct platform_device *pdev)
+{
+	struct socfpga_fcs_priv *priv = platform_get_drvdata(pdev);
+
+	/*
+	 * misc_deregister() does not wait for open files. Tear the svc
+	 * channel down here (parent may free it as soon as remove returns);
+	 */
+	misc_deregister(&priv->miscdev);
+	fcs_mark_removed(priv);
+	socfpga_fcs_put(priv);
+}
+
+static struct platform_driver fcs_driver = {
+	.probe = fcs_driver_probe,
+	.remove = fcs_driver_remove,
+	.driver = {
+		.name = "stratix10-fcs",
+		.dev_groups = fcs_groups,
+	},
+};
+
+/**
+ * socfpga_fcs_init() - register the FCS platform driver
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int __init socfpga_fcs_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&fcs_driver);
+	if (ret)
+		pr_err("Failed to register platform driver: %d\n", ret);
+
+	return ret;
+}
+
+/**
+ * socfpga_fcs_exit() - unregister the FCS platform driver
+ */
+static void __exit socfpga_fcs_exit(void)
+{
+	platform_driver_unregister(&fcs_driver);
+}
+
+module_init(socfpga_fcs_init);
+module_exit(socfpga_fcs_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Altera SoCFPGA FCS SDOS encrypt/decrypt driver");
+MODULE_AUTHOR("Altera Corporation");
+MODULE_ALIAS("platform:stratix10-fcs");
diff --git a/include/linux/firmware/intel/socfpga-fcs.h b/include/linux/firmware/intel/socfpga-fcs.h
new file mode 100644
index 000000000000..4d2d9f538b16
--- /dev/null
+++ b/include/linux/firmware/intel/socfpga-fcs.h
@@ -0,0 +1,168 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Altera Corporation
+ *
+ * SDOS-only subset of the SoCFPGA FCS (FPGA Crypto Service) interface,
+ * shared between the driver front-end (socfpga-fcs.c) and the command
+ * engine (socfpga-fcs-core.c).
+ *
+ * The command engine deals in kernel pointers only: front-ends own every
+ * transfer to and from user space.
+ */
+#ifndef __SOCFPGA_FCS_H
+#define __SOCFPGA_FCS_H
+
+#include <linux/completion.h>
+#include <linux/kref.h>
+#include <linux/miscdevice.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/firmware/intel/stratix10-svc-client.h>
+
+#define SDOS_HEADER_SZ		40
+#define SDOS_HMAC_SZ		48
+#define SDOS_PLAINDATA_MIN_SZ	32
+#define SDOS_PLAINDATA_MAX_SZ	32672
+#define SDOS_DECRYPTED_MIN_SZ	(SDOS_PLAINDATA_MIN_SZ + SDOS_HEADER_SZ)
+#define SDOS_DECRYPTED_MAX_SZ	(SDOS_PLAINDATA_MAX_SZ + SDOS_HEADER_SZ)
+#define SDOS_ENCRYPTED_MIN_SZ	(SDOS_PLAINDATA_MIN_SZ + SDOS_HEADER_SZ + SDOS_HMAC_SZ)
+#define SDOS_ENCRYPTED_MAX_SZ	(SDOS_PLAINDATA_MAX_SZ + SDOS_HEADER_SZ + SDOS_HMAC_SZ)
+
+/**
+ * struct fcs_sdos_req - parameters for one SDOS encrypt/decrypt operation
+ * @op_mode: value 1 for encrypt, value 0 for decrypt
+ *	      Any other value is rejected with ``EINVAL``.
+ * @src: input buffer, any kernel address
+ * @src_len: number of valid bytes in @src
+ * @dst: output buffer, any kernel address
+ * @dst_len: on entry the capacity of @dst, on return the number of bytes the
+ *           SDM produced
+ * @status: SDM mailbox status, valid only when @status_valid is set
+ * @status_valid: set once the transaction completed
+ *
+ * All pointers are kernel addresses.
+ */
+struct fcs_sdos_req {
+	u32		op_mode;
+	const void	*src;
+	u32		src_len;
+	void		*dst;
+	u32		dst_len;
+	s32		status;
+	bool		status_valid;
+};
+
+/**
+ * struct fcs_cmd_params - parameters for one FCS command, for
+ *                         socfpga_fcs_core_engine()
+ * @src: kernel input buffer, or NULL for output-only commands
+ * @src_len: bytes in @src
+ * @dst: kernel output buffer, or NULL for input-only commands; only
+ *       FCS_DEV_SDOS_DATA_EXT supports one in this series
+ * @dst_len: on entry the capacity of @dst, on return the bytes produced
+ * @context_id: SDM context ID, generated by the caller
+ * @arg: per-command scalars, passed as message arg[2]/arg[3]
+ *       (SDOS: arg[0] = op_mode, arg[1] = owner ID)
+ * @status: SDM mailbox status, valid only when @status_valid is set
+ * @status_valid: set once the transaction completed
+ *
+ * All pointers are kernel addresses.
+ */
+struct fcs_cmd_params {
+	const void	*src;
+	void		*dst;
+	u32		src_len;
+	u32		dst_len;
+	u32		context_id;
+	u64		arg[2];
+	s32		status;
+	bool		status_valid;
+};
+
+/* Private driver state: service channel, lock and session state. */
+struct socfpga_fcs_priv {
+	/* Communication channel */
+	struct stratix10_svc_chan *chan;
+	struct stratix10_svc_client client;
+	struct miscdevice miscdev;
+	/*
+	 * Held by the driver and by every open file. An fd may outlive
+	 * driver detach, so this state is not devm-managed: the firmware
+	 * channel and the allocation are released only when the last
+	 * reference goes.
+	 */
+	struct kref refcount;
+	/* Set on remove(); further operations fail with -ENODEV. */
+	bool removed;
+	struct completion completion;
+	/*
+	 * Serializes FCS command submission: guards the session state and the
+	 * single in-flight mailbox transaction (completion/status/resp) so only
+	 * one SDM request is outstanding at a time. It also covers the whole
+	 * lifetime of the service-layer pool buffers, so they cannot outlive
+	 * @chan; user-space copying happens outside it.
+	 */
+	struct mutex lock;
+	int status;
+	u32 resp;
+	u32 session_id;
+	/*
+	 * True while an SDM session is open. Guarded by @lock. Commands that
+	 * need a session check this flag, not session_id: the SDM may return
+	 * session id 0, which looks the same as "no session".
+	 */
+	bool session_opened;
+	/*
+	 * Opaque token of whoever opened the session (the struct file for
+	 * the ioctl front end); guarded by @lock. Only the owner may run
+	 * commands on the session or close it. Compared, never dereferenced.
+	 */
+	const void *session_owner;
+	u32 atf_version[3];
+	bool atf_version_valid;
+};
+
+enum fcs_command_code {
+	FCS_DEV_CRYPTO_OPEN_SESSION,
+	FCS_DEV_CRYPTO_CLOSE_SESSION,
+	FCS_DEV_SDOS_DATA_EXT,
+	FCS_DEV_ATF_VERSION,
+};
+
+int fcs_sdos_output_size(u32 op_mode, u32 src_len, u32 *out_len);
+
+/* Allocate the FCS state; release it with socfpga_fcs_put(). */
+struct socfpga_fcs_priv *fcs_init(struct device *dev);
+
+/* Take/drop a reference; the last put closes the session and frees the state. */
+void socfpga_fcs_get(struct socfpga_fcs_priv *priv);
+void socfpga_fcs_put(struct socfpga_fcs_priv *priv);
+
+/* Close session and drop channel; later operations fail with -ENODEV. */
+void fcs_mark_removed(struct socfpga_fcs_priv *priv);
+
+int fcs_get_atf_version(struct socfpga_fcs_priv *priv, u32 *version);
+
+/*
+ * Open/close a session. Only one session may be open, and only its
+ * owner may use or close it. Each takes @priv->lock itself.
+ */
+int fcs_ctx_begin(struct socfpga_fcs_priv *priv, const void *owner);
+int fcs_ctx_end(struct socfpga_fcs_priv *priv, const void *owner);
+
+/*
+ * Run one FCS command on the core engine. @owner must be the session
+ * owner; see the kernel-doc in socfpga-fcs-core.c.
+ */
+int socfpga_fcs_core_engine(struct socfpga_fcs_priv *priv, const void *owner,
+			    enum fcs_command_code command,
+			    struct fcs_cmd_params *params, bool wait);
+
+/*
+ * Perform an SDOS (Secure Data Object Service) encrypt/decrypt operation on
+ * the session opened by @owner.
+ */
+int fcs_sdos_crypt(struct socfpga_fcs_priv *priv, const void *owner,
+		   struct fcs_sdos_req *req);
+
+#endif /* __SOCFPGA_FCS_H */
diff --git a/include/uapi/misc/socfpga-fcs-crypto.h b/include/uapi/misc/socfpga-fcs-crypto.h
new file mode 100644
index 000000000000..1bfeaeac1bc6
--- /dev/null
+++ b/include/uapi/misc/socfpga-fcs-crypto.h
@@ -0,0 +1,136 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Description:
+ * This driver is developed for the SDM SoCFPGA Crypto Service (FCS). The
+ * caller must call FCS_IOC_OPEN_SESSION and close it with
+ * FCS_IOC_CLOSE_SESSION (also done automatically on fd close) in order to
+ * use the SDM crypto services. The caller owns the crypto session lifecycle
+ * once it opens it.
+ * Only one session may be open at a time across the whole device. The
+ * per-request context ID is managed by the kernel internally and is not
+ * part of the user ABI.
+ * The driver also provides an ioctl interface for the SDOS
+ * (Secure Data Object Service) for encrypt/decrypt operation using SDOS
+ * service root key certificate.
+ */
+#ifndef __SOCFPGA_FCS_CRYPTO_H
+#define __SOCFPGA_FCS_CRYPTO_H
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+
+/**
+ * struct fcs_ioc_sdos - argument for FCS_IOC_SDOS
+ * @src: address of the input buffer. The owner ID is a little-endian 64-bit
+ *	 value at offset 12 of this buffer and is passed to the SDM with the
+ *	 request.
+ * @dst: address of the output buffer. This address is an input and must be
+ *	 non-NULL; NULL is rejected with ``EINVAL``. The kernel does not
+ *	 write a new address back.
+ * @src_size: number of bytes at @src. For encrypt the input is a 40-byte
+ *	      header followed by 32..32672 bytes of plaintext; for decrypt it
+ *	      additionally carries a trailing 48-byte HMAC.
+ * @dst_size: on entry, the capacity of @dst in bytes. On success the kernel
+ *	      overwrites it with the number of bytes the SDM produced. On
+ *	      failure it is left unchanged.
+ * @op_mode: value 1 for encrypt, value 0 for decrypt. Any other value is
+ *	     rejected with ``EINVAL``.
+ * @error_code: SDM status. Set it to 0 before the call. The kernel writes it
+ *		whenever the request reached the SDM, including when the SDM
+ *		reported a failure, and leaves it unchanged otherwise.
+ * @flags: must be 0. Reserved for future extensions; any other value is
+ *	   rejected with ``EINVAL``.
+ * @reserved: must be 0. Any other value is rejected with ``EINVAL``.
+ *
+ * ``src`` and ``dst`` are user-space addresses stored in ``__u64``, so the
+ * structure has the same layout for 32-bit and 64-bit callers and contains
+ * no implicit padding. The kernel writes back only ``dst_size`` and
+ * ``error_code``.
+ */
+struct fcs_ioc_sdos {
+	__u64 src;		/* __user ptr to input buffer (in) */
+	__u64 dst;		/* __user ptr to output buffer (in) */
+	__u32 src_size;		/* bytes at src (in) */
+	__u32 dst_size;		/* capacity (in), bytes produced (out) */
+	__u32 op_mode;		/* 1 encrypt, 0 decrypt (in) */
+	__s32 error_code;	/* SDM status (out); set to 0 before the call */
+	__u32 flags;		/* must be 0 (in) */
+	__u32 reserved;		/* must be 0 (in) */
+};
+
+#define FCS_IOC_MAGIC		0xA7
+
+/**
+ * DOC: FCS_IOC_OPEN_SESSION
+ *
+ * Open a crypto session on the SDM. Only one session may be open at a time
+ * for the whole device, and it belongs to the file description that opened
+ * it: only that file may run commands on it or close it. A second open fails
+ * with ``EBUSY`` until the first is closed.
+ *
+ * Return: 0 on success, -1 on failure with ``errno`` set.
+ *
+ * ===========  =======================================================
+ * Error        Description
+ * ===========  =======================================================
+ * EBUSY        A session is already open.
+ * ENODEV       The device was unbound while the file descriptor was
+ *              open.
+ * EIO          The SDM reported a fatal error opening the session.
+ * ETIMEDOUT    The SDM did not complete the request within the
+ *              service request timeout.
+ * EINTR        A signal arrived while waiting for another request.
+ * ===========  =======================================================
+ */
+#define FCS_IOC_OPEN_SESSION		_IO(FCS_IOC_MAGIC, 1)
+
+/**
+ * DOC: FCS_IOC_CLOSE_SESSION
+ *
+ * Close the crypto session on the SDM. A no-op, returning 0, if no session
+ * is open. Also performed automatically when the owning file is closed.
+ *
+ * Return: 0 on success, -1 on failure with ``errno`` set.
+ *
+ * ==========  ========================================================
+ * Error       Description
+ * ==========  ========================================================
+ * EPERM       The session was opened through a different file.
+ * EIO         The SDM reported a fatal error closing the session.
+ *             The local session state is dropped regardless, so a
+ *             future open is not blocked.
+ * ETIMEDOUT   The SDM did not complete the request within the
+ *             service request timeout. The local session state is
+ *             dropped regardless, as for ``EIO``.
+ * ==========  ========================================================
+ */
+#define FCS_IOC_CLOSE_SESSION		_IO(FCS_IOC_MAGIC, 2)
+
+/**
+ * DOC: FCS_IOC_SDOS
+ *
+ * Encrypt or decrypt one SDOS object. Takes a pointer to a
+ * &struct fcs_ioc_sdos. Requires a crypto session opened beforehand with
+ * FCS_IOC_OPEN_SESSION on the same file; fails with ``ENOTCONN`` if no
+ * session is open and ``EPERM`` if another file owns it.
+ *
+ * The SDM derives the working key from a device-unique SDOS root key that
+ * never leaves the secure boundary, so the host never handles raw key
+ * material. Only one SDM transaction is in flight at a time.
+ *
+ * A failed request, for any reason, never closes the session: it is left
+ * open for the caller to retry or to close explicitly with
+ * FCS_IOC_CLOSE_SESSION.
+ *
+ * Return: 0 on success, -1 on failure with ``errno`` set. On success
+ * ``dst_size`` holds the number of bytes produced; on failure it is left
+ * unchanged. The SDM status is written to ``error_code`` whenever the
+ * request reached the SDM. Set ``error_code`` to 0 before the call: a
+ * failure that never reaches the SDM leaves it unchanged. Some non-zero
+ * statuses indicate success with a warning. See
+ * Documentation/misc-devices/socfpga-fcs.rst for the error codes and the SDM
+ * status values.
+ */
+#define FCS_IOC_SDOS		_IOWR(FCS_IOC_MAGIC, 3, struct fcs_ioc_sdos)
+
+#endif /* __SOCFPGA_FCS_CRYPTO_H */
-- 
2.43.7

