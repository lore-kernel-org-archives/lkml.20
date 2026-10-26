Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.196.125
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793039263;
	b=Bjo6bx3TJeu8qzRwwuExqy+lL1NNlwin9nZvNZEBdAhZQKeIzEFCbWJmP+5YzihBBpxT
	 BKgco6y1PKwUC7Rm38T/FoF9a2tPgEyEIICkAHiMEaOJlxlreAJzcr9CKR5/Uj1FETtjt
	 H0oYFamKPdadXukLypOKe5YtWVMOwpySrB4qutiAOIO7hmZpqcY6lueQUkYg7lLbriJDn
	 nLf4JxssDSxprx0ohZXfalPDJSqNKJlDbxqzRkG5eAtEL9Q5AfoWjxMB1CSu6f3v4PcCD
	 pYWXLDDSnPeg/c1b1YbMZ7gCBbNJqlPfYyqZWlhaxLgNWYQlBItZdLC18pX11/TJabQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039263;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=snPWrfTkbxaT+yrvl151FreP5OW8Mvr6zqwIU0OTOvk=;
	b=JnQeFxjTZ5k5dhEiWN9fogDfPP0APyXkeVT+QgY2DTjSxlrtSMEEch7dy8ijMV1oQurQ
	 isR8ZxY4WUs1ZHZ/ml5EGFzMAQiHEo3R4D14k21FX4CzkOFcMERO1DJOIS+HqowI/u82h
	 rSGcWn7LWIGdVxlrnVm2C2vLGloUB9goZnhqvgrZA2X7xlMZi6mPSSi80T536td2gykJc
	 a4CSP9tWAkvzagj2qGCg0Nfks+gKVGxoFM9PJithGSA1a9uv7DoBj0J48XvbS5KhSE7Tt
	 bS/Gcc4UmRRxVXuI7U70sNLDjz4/D/tByZut9SoG7zlfatljNgPyVvs1wkjZUqVp0ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.196.125
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020125.outbound.protection.outlook.com [52.101.196.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1774606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1774606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A72DExI8XFauBlVayIt+ob4W+t6YErtMhPzv92jhPI8V2BIiZXPdyEukhZygawltv7igf2tHYv3HLm+sOWdJ1OfKg5yjpLnuD2YLVr9oLgnFZfIvSEbyAhObVxY278IHJuRJdyxHNSOjCBpJJgyzcdRbtGv1KwtyO+CeLq4/YMYAfU1bQP+42u+uLc7O6Vk84vAODkzTKvKRbivrrY5LYc1vBhDVN+Ydcuyb39RLfFy+xaESTRpZA1+Fni5nEGtHM21Hj98MILqJD0XEpCVy9bYm2aqnK9kgbcHreplyED7ik6yfDHq0NfwV6ZDLEntBKXwzAb5XeUAKo6/BUXhJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=snPWrfTkbxaT+yrvl151FreP5OW8Mvr6zqwIU0OTOvk=;
 b=jvYi08AMHdEeavI/yr4XHw/YeXsDM6u5QGB3was5Dxl2FlWAp1HfV7y9dfh3A3bf0aQWHcGD2G6YEWlDM6MQZUPB/CkPo3kuZMytFyANzTtiRTuAdv2Zf5JmMIipgSux49LQHYg6GbsgXd3rW9rIGKgsbdzKSsRF9mCnez8cNW3KX+MES1l5fJiTxbGZ/EIOsOTqDay7Gcu3V2Zb3MarBgJIA7gMDmxCVqEcfO5XgvP1RjffPN38qlDdinffZ/pTvOemGUBa9B+dUOPEfE8Tem0BFDQ07Eq9Syf6W9KB9OgjJThPT+V/U+5o3lTXFev2kFmuxWhGRG/kh4pXVzjKZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO2P123MB3951.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:143::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 18:27:39 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 18:27:37 +0000
Date: Mon, 26 Oct 2026 14:27:33 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Tejun Heo <tj@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] tools/workqueue/wq_dump.py: Add busy worker
 inspection and BH pool states
Message-ID: <6fip5yk2rc3tpqdstuc7lsojpgxul74f3bz6gdqrafffxmxn6h@mkpabjyz4raa>
References: <20261026155037.557670-1-atomlin@atomlin.com>
 <b2a7765f41d7ae72347ca49ecbfd238d@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b2a7765f41d7ae72347ca49ecbfd238d@kernel.org>
X-ClientProxiedBy: MN0PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:208:52d::29) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
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
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO2P123MB3951:EE_
X-MS-Office365-Filtering-Correlation-Id: c761c105-b7db-47b2-3f9a-08df338ecfe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7OtMEQdbRQfINjIaVtBfHOsqNnjIcZqsj/34yHYgVTLzex5wqlUsb38ADnrlBzICoT+TtRyBKlb8mQzVWSq4uqpiwSTY6BdcWyCPPYc/4+lQO6ZvsI+4W5Q0vz+zpxb0eRGGvqVF+VTykHimhorP67W7i9935FUVCl9+Mu85BqQlaPfm6j44Bgo3OnERKNM8mVIuINBBnTvB3vtnyHW97bsbdpdeemXDBmQaXXAqxc6qAH4FX7No0go+lMSsfohRXXfAUU4zAHc0GSnk8zKUZ+ohskoOBXBfGZwcKRhEEo+mY4v1GqFtqh9CF7OnSv6gNUH/3JdGhDbGsu7QuOFKB2/MZa+uGSN7YwcWP8jNd1H1Mg0NjGE9Da7OJIcqZ6VIC0vDrmfEvVKwxr56PnY9LQF3UTDxnEnz0+PWCftNu28nyQ1x/3eToXu39O+nRESGwM6FESrgbaqCfSJE9cmiYDNkmSwER5WMcv8XvdMSnhZrD0nGV7corK/wSoQT/ZXE28t3asStSRP7nVPR4eHDHC8P9CpatO/5oHBJtYTsgBYNCNKmMseeCDOIq53OHnG//GEh2jQkdEYdzdlgYQ6wNpmQjbwaF9wNnW6ART2B7a1YUMRBwfNA0Tn0TpUBijva6QnKlbRUHzViYTWElLbdjvXYqEmXMy6SJcqszkV8tzk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUZLeFBZTlhwcUJ5UkxNQnY5NU15eDlpZWN2aVNaQkV0RHlZL0hsMlFFT1dk?=
 =?utf-8?B?Ym81RW9RZnUrWnB6RTBaZ1drQjR3TEk0VWRvRTM2VUxzZXcxM1VNamxYZHR1?=
 =?utf-8?B?ZlpqQXpGZkxnNWR1bGlqL3IrM0JDdk9KWDFjeUxpSi84ZXArTkZRSWRCQlRH?=
 =?utf-8?B?VE8rbHRyb2wrRCsxcVVxL1ptU1hvTHRLN0orZmVJaE93YzUzZVJiL211VEF1?=
 =?utf-8?B?TUhxQ3Z1bnJpWGxqTlRRSEx0M2xSNE11VUI2OWtpdm9iWlRpcHRzczRxNml0?=
 =?utf-8?B?Qm5SdWk3S0t2aUM5NlZjYUdWeXFKZG1nTEdocG9LbFA4TXdNUUJvMmduYlla?=
 =?utf-8?B?aUFRWElaNjVmN05ldGxaNlZscjd4TDZuWGdJbWdTRlMwNitQZHhKb2ZCNmJL?=
 =?utf-8?B?SVZ5c3lpRllycUkzY0gvQ3o2Q0hjdkRnZi9NWmlTRmhOUXFRNHd1SzNlL1RL?=
 =?utf-8?B?bHNKSkp6TnpRamtOb2RwS01pQjkwUkwrUnZpQWFPbDEwS2kvZERGdVVldWpC?=
 =?utf-8?B?TVBzOFZjOE4xMDF3bi9mRGZLWUh4d0VlMU9hcG4wTUdIK2xpMGtYNXVON0RM?=
 =?utf-8?B?Z3R2dTlPVmJlZytBeEpZMlF2QjlDbldmVGxrVjhuUjkyQ29zN0FKcUZEWWE4?=
 =?utf-8?B?dDIydUxiNy8yYVNCcWxNZ240bmhxWFVXUUQwSTlLekF6SU0zK3d2aEE0Vmp5?=
 =?utf-8?B?ZG9WZmQ4dFBqUlBmN2ZnSzhldk5yUmJBTnd1cmVNdzd5blpTK1M0VmNVaUxG?=
 =?utf-8?B?T2Zxc05WQlJuWTgrRDQrZlVYZlVmN0dFdzNsNGlXdVNienIzK1lWVnNUTFh5?=
 =?utf-8?B?SDlmczYrUTF1allVMk5ObnkxcmZUY3Q4cDFNcFR2TlcySVRFUVk4cnRMdkxO?=
 =?utf-8?B?V21oR3VrVzZrU0x6NXJ4S1hQcGd6QVZtcmVNcjBlU3hjNGhOMzk0TEtMalk3?=
 =?utf-8?B?S2s2bVlKa0tpYVZFUkZYUnk2QnMzUTdLNGl4RXFndk1aOE9UbUdSckI1QjA3?=
 =?utf-8?B?aUNpNzdOTGkzWDNKODNVQkRsYWFwQXh3YUJJdFJic2hjS2RhcWlKcVRkMFFn?=
 =?utf-8?B?eXpnUGdHVktnYm12RzEzYUIvQmFIVll2WEdsKzdkTXNkZnEvaTZCTS9PNTFS?=
 =?utf-8?B?VVRabGlwY3Y5dk9DQXNKV1hNVWJQV2QrMjFnaW9YQTIyeis2bXZiY0djVnhG?=
 =?utf-8?B?VERzN2J3Wk1PeU9LOHMwbkE4NXBLZVhjcWM4VnJraXh1T1Y3TUZsMExmMjVI?=
 =?utf-8?B?bUErbmZoUkNKeVR1aWRrbnVQREc4bmlscWN2RThMQjhaS0dXZWREN21WVGcv?=
 =?utf-8?B?K1hqY3o1VjVZMEJUK0JaMkd6dk9qaUE5K0dlUU5CRThkMVRwZ2d4ZjZpekdP?=
 =?utf-8?B?Q2FqRUdMbjdTam9GL2FLSU1IZDU2ME91N2V5K1lMQnAyRzZBM0g3OEthMmVJ?=
 =?utf-8?B?YzBmOTlIVUVEKzNaVFgzQW10VkVYTVJxY0ErTitNKzNNdlJReTRHVHArSXpT?=
 =?utf-8?B?N01RNDc3Rmh5MmNyNUtabTQrTm5CTWIwcXNYZm1qK3ZwbkdNejhYWVhXRUkw?=
 =?utf-8?B?SE9GL0xObGhON2t6Q3FHaTVBQzEwZHpKMFUyM2JDZ0VaM24xWm1xYnVCbExK?=
 =?utf-8?B?a3p4NE5UVW9xUm4rSytXWEs3dVQ4WjNTYkFDQmpoY3lvYjZUOGVSQ1YrQU5y?=
 =?utf-8?B?WWxPem53WlRvQmNnSTFtVk1LZGRDS29DN2xaSUFpMjRHd0xZazJXOGNzeXRH?=
 =?utf-8?B?MVViRG5OdzIzbUF5LzlQUCtHUDREaTJiTDhSZXo4Y0RSeU5weHVXWXlZb1Z4?=
 =?utf-8?B?N0prU0NjU1h3UTI4SHZXcW40WkUzYlpGVmVmc2RTdE12N01kSGY5USt0MEo0?=
 =?utf-8?B?emp4SWtlN20rRE9aTnMzUHpwK3czZnQzTkZrU0dwVis0aXQzU2hNZGNjdEdO?=
 =?utf-8?B?dnZQZDkwV0NrU0xJU3RzY1pDNFAzZyt6Y25Mb2VVNlF6QnNKQ2F1dkxlZ1Bv?=
 =?utf-8?B?bFplSWloa1VrRkdaUmNVOTk2RElOZDBBc3ZwREFJTk5UZVhqQUZpeCs5VXhw?=
 =?utf-8?B?bUZHSUNwdnhlSmxCeG95YTRjMmhEd091MGF3MytZUUVJSFpsbnd1OHZyWFdx?=
 =?utf-8?B?cEdNUEY1cm44YXVjNnd0OVdsZUROS2NHejVDTlhkNTVCYUgybHZreXpwYkpX?=
 =?utf-8?B?bGFrdmxuNXJJYUkyMVhSVENua2hUWFFNYm9BTEtrdVpOOFB0bG02Njhucmkv?=
 =?utf-8?B?bUZxU2JvT2loaGhwQU9JVk9RZnRiUUMwZHNGa2tBMGpZSENUQkhnbjhvOUFB?=
 =?utf-8?B?dzB4b0IrbmluK2t2cTRBT1JROEZjalBWUU1DUDNuOTV6aElLZEF6UT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c761c105-b7db-47b2-3f9a-08df338ecfe8
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 18:27:37.7520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pi/b/6fWe27Lth4EziXAiHzCAZO2NLsSdHjSUeP1lUkpw/IakAtIqNCQ5dj9zdqcgw2wVC3V4WgLiHsBfogWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB3951

On Mon, Oct 26, 2026 at 08:26:04AM -1000, Tejun Heo wrote:
> Applied to wq/for-7.5.
> 
> Thanks.

Hi Tejun,

Thank you.
-- 
Aaron Tomlin
