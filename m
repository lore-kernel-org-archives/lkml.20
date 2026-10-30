Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.118
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793361121;
	b=d2CT23c33Ewbrrj2gNC6S0G7pxPaAXsJ8zKeIqtE0UFf16xg49h4MdPCRcaydRBp/EXR
	 vaddd6jgIdpzFLqqUNrviTMfi8o5kvoMjgajNVZXd+ukp9uS7Ribe1t/vm0QHYMyqNjWK
	 y4Oed6M5jgNMRas8+ysgkT6Dcj6H29i1lbUH9PO08AiL1zCa3KkDTAaoPRBKX/jmkSVwW
	 8+6mDyhBSKo4rzOuICEmHBTbwxukWBLImKGf48nSBHLR09dDH/EsyZMFCZc6NSVGdabru
	 Dl5Dat1nAtxaxVAPnBowr+SWOQTfOjSC34XCVZhAReCBvqslOX0wkGe83gQXCPCTO0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361121;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
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
	bh=q8rIqYblFeV99dG9PhVoW2Snw3SxhMyVdgIeh/eqj20=;
	b=nzDvE3kjTGomgGLNj+b50xVY7iyLbyJvQD0QjdqWIyTE7QH68EhKyik+SxYaPqyPXnY0
	 asyHF9uSF8FBopKIYowAmGEAT5+mMfhFtJiiPLQcSvWorXg5WGZ0dU2YGhrzyKniquPaH
	 S09pTVXriO8TPjGd5in6K3wqXg5qSQ7iUjsqib9eYfwelbaN4XP/r7xK4n100Drhh8+xf
	 ztY3gOmKRywbbW0rirQKfguizxZYwghQG4w3v9YuQSt/j8Bmu1Exp4QzEMN4GIl2WNcIh
	 GPjIlBUlzn7+L9IEHS+68nZr9p34BBMiWNmtpwLGkLUpfz4qbVKkts5EKd3VLzbNqQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=pKP4IGB8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.118
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022118.outbound.protection.outlook.com [52.101.126.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9D0606A321;
	Fri, 30 Oct 2026 11:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C9D0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=pKP4IGB8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqOLAhsfjnK+dKl5XJqkHEjd92xcfbtlI4lF9GnangWN40O6bEySPdIFrqRkCM5RwKVwMMXBSp/ozFrKry6Y9NzWkJzg3Y0HM5Q9mzi8JWTCLA6QEG3t9E3dqF6da8lETY39CioDo60iK5G+LGsdlneryfacZiHo8pElxaOCiVObvi+ekloMwP/S7y2f/Hj1MlGZB0uzhXf8KuYm9h/OARzjLb1B7pdJ7uNbhAHiNFwNbpXmNB2oskk6jpuCEjAH5oIDpSwIX1xkdSH2LzXLXO8Ng+ZHhv/5uEpoHOJhInwtznqPi0PIFXuojl1+6Os6qAiNB0yQ74pEOv/De9cdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8rIqYblFeV99dG9PhVoW2Snw3SxhMyVdgIeh/eqj20=;
 b=IDTy+WJHeLy72Xm5i0mBJOvKciZsZYxLQe7m9ZhToakuH0A1nxnCckyeoCFrqdCQA+NtlIuhsfo8lZ0RTY/CffgMJOfpKrzgxfF7mAM4IzaT6t9iothC+cdNB6H6EVjIVe5uHpovt2qcCEvPTWptDsV9AqzA+pusm0gwZD2pR0SLw7Fg1R1Z1OniahrFktNPqJY+BZ447oS7rT5owyCvFiPmJxJcZ4T/Hw450mL44zK/wmy2uYgh3Ek547dqAncXGa8VgGPsZNF8Yf9P5KIcYsVMMsU17QAcXywXU6UQE2GLBftrqr42HCk5v5iHOrJ0Zo+wUL8eny1qCstaAmWVPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8rIqYblFeV99dG9PhVoW2Snw3SxhMyVdgIeh/eqj20=;
 b=pKP4IGB8VcbNu0TaQqg2NQ53RXdMiyYxkrTRmwRvPYJ+9e7bOc/LFUhd2fTpj2eLOvALUmwh+c8nTvdN91VfLjYGUonczAQKEtuCt3T+isjEJB7vyE18Rgqqd13Ql0NmGGjjNIe+u6mu5UHrqHJy/1m5pjBQNHLLJJKOqenRVdQbbqdNEaCUj8KcpFxVnd0hw6FlNTJkJtS7zx1/ehDjcSO+tPG95kkHtMmcKsWHRg7pms1o/tzozAjUuL+KSRrw1ecLQSZH+BJFx6KrIzPafi3uAY1Iy9+VhJsAf7Ohs58XbiLyy3zM+UrvBLOTnQTcNdk7BGLkjA6Ksh5BgmYJjQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SI3PR03MB10031.apcprd03.prod.outlook.com (2603:1096:4:2a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 11:51:58 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 11:51:58 +0000
Message-ID: <d9086d80-229d-45bc-8681-24b9d98b4aa4@amlogic.com>
Date: Fri, 30 Oct 2026 19:51:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/6] decoder: Add V4L2 stateless H.264 decoder driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <20261022-b4-s4-vdec-upstream-v12-4-616240978792@amlogic.com>
 <e7b3c2b2-8d0e-46cc-b245-a22f6aa7e69f@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <e7b3c2b2-8d0e-46cc-b245-a22f6aa7e69f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI3PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::11) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
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
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SI3PR03MB10031:EE_
X-MS-Office365-Filtering-Correlation-Id: b23517d5-9619-415d-48da-08df367c3382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|921020|11063799006|4143699003|56012099006|261009223027099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	fDia0P+k2YUOiMQDqr2ao4pzQVuqf7669OAATfZqwvRN5U7rKoipsJm8s8QUB+0GFnRcoNmHgAGldXrwIayeIFRVsnQQk1SjC0ywIDDjLqNBZ9MTa0odLjoHdGpdiJ1e/v9gttJSms59qfokMp7XNYmRv/RlEmV8bHgQSTIg7GyyI9jJ/h7b2gB8wibiRp9zdKu4d5WF0fNNGd9pJfGT+ST7NJlY7Q31/4kOOPIRE4XH+hcQmsiD6uI3ePf/S1cmc+znDXW0ZgdlslSjBziWT2g/mVvmx1wDQ1DSAwwvAfIZyq2Rh41R4Jy4G2XYQ7piYstGYyKYUFOIUuBMCo0tfnpapWs+DqNq7ys41sZt7I2O01Nv6bKUDQIWBi8nv+Xzr8f9W61OCuRetBHKr51ONZt4HycB3wGcHV3mtdMoQaBMn0NkqZnMl1yz5LGXhh085ZLlUZ0Ki3NgbCpu4dDMD3LMG4L3i87yPzb97edRxX3KM3n8DItX8H2ePUV29clHoDgsOE1YdAoXXvuI2iZR4tX/+EcZ2scSmW0OkpD97v5i9I+ZMFvxQyQCXYERZX1QfzXmJX68j+aKQMTd7XRJAT4PdXo538R8+wLJu2P03KWtunpJmFIVxwy/3G0Vcl05QVewUxRSKRKwRf85KUcl0RlwGh+dIBpb6rQcaqMffbw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(921020)(11063799006)(4143699003)(56012099006)(261009223027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MENoRXBNNkphZTFlZlA3VmRNbkVBOHhSamIyb1U1eWZqYUZ3ZGoxYzdKSE5p?=
 =?utf-8?B?a3JxWExhTzFhL0xvTmV5cHpvZkErSXFKWnhyL3RWOTg0bmgwTHJ6aEJ1MFpN?=
 =?utf-8?B?bjltM2I1Z3p3emhxdGNLT3BWZXMrY20vVHNaYzE1RzdWM2F2TmFQeXhIcnRJ?=
 =?utf-8?B?d0VsanRuZzRVTXZLOUp4L1VNM3lwd09PY0poTVR6UlRDY2MzR3N2b0FJVWw4?=
 =?utf-8?B?N25IQ2lhUm9JMU9qSHNwdHdhSFVnZ016YXg1M3d0QXVNaGtXL3hGRFhMT2FF?=
 =?utf-8?B?eThta2JhLy9RQ2dzVUJZZGdoNjFPNG5LeUZ3bS9Bcng4N2R6V0ZBZ3B0T01K?=
 =?utf-8?B?V2RnUTF4WXBXL1RmT0lrVnpUNEplU3F1MGIrVnBWVE1NN1ZnYlovUjVQMExB?=
 =?utf-8?B?UGp2R28zR3RsMnI1NUFEWGNRVVhpNTY5ZWlmOCttTU5jTUpVSFVKMHNDSjdi?=
 =?utf-8?B?eGEvQlNxVWEySS9KazhZYnV4L2lSU044aDlDbEIyUmFiN2xzUzJJVzhkU0Fh?=
 =?utf-8?B?Y3FGWC9yQk4zS21JVEgyNWJ1bEwrbWJuYUFHcHRTQ1FmcWZLQUZpRGxQRTNS?=
 =?utf-8?B?RmloeGJ0TjZValI5b2hZTUFoc3ZPM0FkeWwweXBUbTM4T2hDamkvaDFyREEy?=
 =?utf-8?B?YnA1Z3BmWXJicGRrMVpwRlpCVVNnaThEMW92cUN1aXkxK3daQVFMUHZWN0I4?=
 =?utf-8?B?UW9WT1JMK2F6dWxhcXVmandUMHlqVzNncG92UUtmZ1I4ai8raVE4QW5HK2or?=
 =?utf-8?B?cFNRQlZWNFBPOG1HMFNJbWdjSWJuNHRQMVUzc2Q1QWVHeENYdjZMR0xrakh4?=
 =?utf-8?B?SU9yMFM0U211ZEM1R1MxUE5IdjIyalppcU9tNVFpVTJXb005OXFRU21YTGNO?=
 =?utf-8?B?cGdBeVQ1TGxtQ0I1SHlPNi85NWhmVnVFaXpLM1FIRHZiZm5JRHg4V2k0OTJr?=
 =?utf-8?B?MzRUQytJbW03RkZIUU5aQmFKYS9JMyswdFY5dGt1Y1V2RzgwWTlMZWUxTFd6?=
 =?utf-8?B?VmRGUGZ1SzYxUjIwY21wVVNsVTRwUUNObHBVRXRiZHhKd3FBakdMUUcxcGtU?=
 =?utf-8?B?Qng0cWplczkyVENaOEZIZDRsZ1gyLy8ydGVqZEpqWHhyd3ZoZzVFYUhETWJm?=
 =?utf-8?B?d0tFS1B2bU5OUkZpdkNNTklUd2dpYzlBTDRnaGtFU1gwNFBPWjVETllWaEw4?=
 =?utf-8?B?bmdkaWlsdGhMSXJSQnExY1NEdW55MlB6ejd4dlp5VnkwR25UWUdhQ0IvajMw?=
 =?utf-8?B?aEdXQlY5L1l4YjFVdWJBc3Z3Sk11SW1EVWxLV1d0V3I0WERCUkFlc0JkaTJI?=
 =?utf-8?B?QXNUWlcwYkJaMlQwMURwRldpSmx3VEIzUmNFK2lOUVlqcHhXWTlRWVhKQlFx?=
 =?utf-8?B?R3hHOTh2K2xPaFJzMDBud1d4N2hveThRYVlLS0F3TmRvSHZMNnRKZ1Ivb0h0?=
 =?utf-8?B?eTZYbHAyektpcm9oNGRkNTljMlIyRUErQ2lmK1pXNEZNSk42NlY3cmkwNUlY?=
 =?utf-8?B?UzY1ZXJIUkJOdGJNUG9mRlNKb201cmVxTWh4UjRkU2FCZ1hhd1d2OTBMcU1D?=
 =?utf-8?B?YnlvNW5xZ1Y1ZUhRQS91TW16b2kvQXlBRjFxWkR1S3FTeVc3cjNLUnozVkpT?=
 =?utf-8?B?M2pFVnN2N1RqQWRaSWh3bjZyRlhGc3pkZmNDTVVkNVBpdFFIalg3MjQ3dFE5?=
 =?utf-8?B?Y0lzajI3ejB4a0Y1YzFwNzcvWTY2RzAvNjRDRWl5bXgzRElyeHJJR2dHS3Zn?=
 =?utf-8?B?SmhCS04yY2I2MXlJWkNtTURKWUp2UWVId3p1Q2M4OG5qWDYyNkFBZ3FvVysy?=
 =?utf-8?B?QjlpcWg3cUpCMmFycUw3QkUwZXF0NlB6enlLQ1ovMXA0V2liVlVuMUcyNDRX?=
 =?utf-8?B?SEw3dCtrSEVoRTFjNzMzdDVXR1hiblFaNjBmalRoU01ZS0wwQXZrUWVDUmI3?=
 =?utf-8?B?b3h4VmVuZkIxc0hXaXZkd1lTUjVqeGZtelUrSzhhT0N3TFRxaVBXSWpXdTRZ?=
 =?utf-8?B?UHdoQU55SFQvOXJ0UkJxbjdQbStteFpyQmtjelAwQm1BVCtWS2FMVUtuYkV5?=
 =?utf-8?B?MFJmK1BBd21JZFhHMSsxdEJMMDJWVlpYYUFvZTVjY21Xc0FnYXprdnRDcWtR?=
 =?utf-8?B?cE9acnFFMGIzNTkrdWhrS2FyWCs3UFMwR0RadTJ0NTE2VVN0cklWaHdscEYv?=
 =?utf-8?B?b0pSdkVGRDA1VmRjTDdpSjlvdEE3UitURm5Qd2hlb2Z6Mk5YK3JyTkZwcFIw?=
 =?utf-8?B?Z0tYQjFVZ3VYMmwxNVRBbE5tZE5CQ0Q2bFBYT2VEZmR0a01KWG45R0dGbG9r?=
 =?utf-8?B?QlJVZFZnaXJLa2EwdzdYK1ZCdHhWY3ZCcXJ1b2hoL1lVVm5lcFFydz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23517d5-9619-415d-48da-08df367c3382
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 11:51:57.9313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3t0cNg67Qyztk1sPMOLNGK/pdhrMs/UbWj0jKbqHrnYa6z4+RJkH+xXB0IKKFC00XaHka9UGKEicqegCGDuPRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR03MB10031

Hi Krzysztof,

> On 22/10/2026 07:27, Zhentao Guo via B4 Relay wrote:
>> From: Zhentao Guo <zhentao.guo@amlogic.com>
>>
>> Add initial support for V4L2 stateless video decoder
>> driver on Amlogic S4(S805X2) platform. In phase 1,
>> it supports 8bit H.264 bitstreams decoding. Currently
>> only progressive streams are supported.
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>
> You already received this comment, no?
Thanks for pointing out again, I'll check carefully here as well as in 
other places.
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> Anyway, several issues were reported here in separate threading.
>
> Best regards,
> Krzysztof

Best regards,

Zhentao

