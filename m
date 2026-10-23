Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792724007;
	b=vAyBYRw5fPg1Cr5VI8TC4zdXC1H0RFW0N4yHRe2EACmKSpDK1CAtGXUIsrdZm5Zmkead
	 lPn5upmPbuARvDV9cPwKyr/YPhH4Hy+LhzA4x4Q1SjJNxyfjfqkcnU2SLQzrEWKWNgTiq
	 ExdZ231LYTyUhk+0EsuyZf0LcWdp6AYk5obJqPuK6Ddttq6lgNBq7HhTDBrvurjMm0oIt
	 Qq/wYzc9b+CEErDQjXv/08AHnEdkkqc1s8L/V/ZrXkEP9kHzoTIc7KzwDDXOmHUIwiMQq
	 YYPeCQ/C0VqKC1INCXtB81S2MSDZO/8pXCRqJFRw/Tic1LOXSyvq2s1bKMPvh5gMXDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792724007;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=zgBT7FYYDUnQ/hzXSOiMaAcLoXt+BKDRDds2CEQ9+0I=;
	b=EJE+15xEPZWP0mccOkwz9UrmTzIOFWj/kGPbejoQDTnNbYwmx8E0zY/cmm1ucxwUSjpq
	 U0cVZpaGoysZkLwX6CiGq1P9/3sBXqlpqXOmf7rE3DQdc77vwpFhVJVadnosklO/Ni8iD
	 qkfq2IYufbFotFntSr4j2BEqOgEbLA+Ki+rdmgJswSas0unOuvG5Pvqa67xVi32rlIKR9
	 IHTKytvy5z0Tly+J166GqACn9paCBmYyhrpH15UnkAHXlPrN7Kzb2cjc7zaRWi9R336aM
	 9PWIIxMnqjwJ7MMO/tjxI2hTKlHJ6szbQwQ/3UAIUsnKB0Kes6aMMzjhwRKrUEy5O9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fujitsu.com;
	spf=pass smtp.mailfrom=fujitsu.com;
	dkim=pass header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=selector1 header.b=WCP+Gexm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.23
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010023.outbound.protection.outlook.com [52.101.229.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F517606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F517606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=selector1 header.b=WCP+Gexm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1jl9q5nbwUxBSOVAMJHmentvVK42bTNxpClKba8pcAhqQPcOnHWNchXSbT9wuoLgV5IWaGOQT1fTB4bVK8Px+h0dxc0JQ0fs2B2AYr3rGygODWIjwK3p5qiSxaXt788tIdj7dADk7FVeDFnDJGd5iAnX+n9K2YYBi5l1YZYvMSbMbw9tThOxPkGfEoiG+boscjXupQe9K7XB3CLG2gMOwMjkCRQCU4vuNxSP9xfOeEG29XPoTf7EmjFhqVflbOG/3lZZ52FeVCuAuvoDeim55YK2g+qlRCFSjR9v556qYnqyiggPuITcpgEADEb8FPjEmQbUN9QfPgKjyzn+21HLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgBT7FYYDUnQ/hzXSOiMaAcLoXt+BKDRDds2CEQ9+0I=;
 b=sVNCLxZD6X5fTVIVeqqCZwukteCK+2JZMlcc4J6CdFOUaHwbtzV4wLBFFHuTGNa8pVG6EtLAcgPxhO0aF5PhKRZKBIJ+zDgGdnIvcDTLUoUutvCPe6ugj/+7fs6sM4N+VM2zx+YtQANlVSnOnL6tSe4ufznMAh/Uwxg+7O1up2p2TNdRCdSI8+kaBdXNdyOBIldrY/MSGVowDUEUfbbkAE6LasZ0b1gyixK/6+gLTBo1dfuvoQmXxlUgbhIs/vUte0P4ysEOecJFw09/8bOkzySO/EUJPg3NvYUkqEvdWXcy2uctpaZIGv02eB7mO4WcdjzVRR0nodjvgpqn9EY3Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgBT7FYYDUnQ/hzXSOiMaAcLoXt+BKDRDds2CEQ9+0I=;
 b=WCP+GexmsYrox8Fla7PkVSvCbNh/D6FqrmgGqG9o/Yo7K6WtdeymUdyZ4vCAnY5olNrw+gn/WOWNbdJbHI0ZsdtBooAR4l8/ZzgXiSsID9+TS9iFgQJNr2OsYgcXDQxwqdvWqgN4sRKlwc9y4EtAbGggs0+7IMSq0q/rmw0GEa++gJOW1uM/MKA3RV49kbDN+vc7ngEV6q0111iC/SsjxK6OnN/fud/9rFBiYTUajtLRhqmBNthNqoZkFsRgK7yMeOQgyiMf8bK+vjUSerKAIHXnaXWR8VWbQJV63WBIJ203kbK9q/XnbNn4alRupRe75honEZbQjF2h+YFxkVP/Pw==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by TY1PR01MB10706.jpnprd01.prod.outlook.com
 (2603:1096:400:31d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 02:53:25 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 02:53:24 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: Zeng Heng <zengheng@picoheart.com>, "Jinjie Ruan <ruanjinjie@huawei.com>"
	<ruanjinjie@huawei.com>, "tony.luck@intel.com" <tony.luck@intel.com>,
	"reinette.chatre@intel.com" <reinette.chatre@intel.com>,
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>, "james.morse@arm.com"
	<james.morse@arm.com>, "babu.moger@amd.com" <babu.moger@amd.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"ben.horgan@arm.com" <ben.horgan@arm.com>, "fenghuay@nvidia.com"
	<fenghuay@nvidia.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 0/9] arm_mpam: Introduce Narrow-PARTID feature
Thread-Topic: [PATCH v9 0/9] arm_mpam: Introduce Narrow-PARTID feature
Thread-Index: AQHdYaoTFl99kBy38EazIQLq1qR3Q7cIq2QCgADhdYCAAN6ebg==
Date: Fri, 23 Oct 2026 02:53:24 +0000
Message-ID:
 <TY4PR01MB16930C19CEFB050B742F74AF68B642@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <20261012082337.822258-1-ruanjinjie@huawei.com>
 <TY4PR01MB16930CE9AD3B1D0AF7BEE6C208B662@TY4PR01MB16930.jpnprd01.prod.outlook.com>
 <88c6c8cd-5da7-4c28-8d5c-7d6489e5913f@picoheart.com>
In-Reply-To: <88c6c8cd-5da7-4c28-8d5c-7d6489e5913f@picoheart.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-10-23T02:53:10.062Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|TY1PR01MB10706:EE_
x-ms-office365-filtering-correlation-id: c4328dda-aa4e-4b62-da21-08df30b0cea3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|261009223027099003|261021121427099003|261022105027099003|261022075727099003|10067099003|56012099006|6133799003|1580799027|18002099003|22082099003|11063799006|4143699003|921020|38070700021;
x-microsoft-antispam-message-info:
 5aw/QKrqe48OeTc2x3+lNRPmMlD6eg+ftK35Wnm5iTuai7yXQhE9qrh5b4Z/H4Ik8T/reWI+pKg1x342zFFmeQ6ApH4nw+srlHBHijFYVclG0PEC+M3EG7L2jWDazZEC5und4Wvsdav0vH+9XG4lbUgIqYEfUyYaWBfjIOeCo05laC0UF65A9lrpUPjShWRY39py+OSPkd/ol/ujTgO8pWEOY0t7CXtvvqIUs7vFbWMqC/TTiaKwUvQ+TvDLocme+QS8lcuJRe3CGUr8x3o8gfKH/xAUJyG3ClocRwpYUmTGWIZhN7gGXtHH5vWtwIJSw+8uC2LQePP42q0o/3Y7jVJOLD+DMfxI9MC+2Tv+TBVYC3lChoCD8cZSfstI9d5UUKNaVvq2wJzoQsWGRAq9FdVmEc7lQTFvdIcJ7OEY8bPP6M19yB8a2m4EHo1YYnzthXe9yAEXgNkN537nn/m+c3sxZUyia95WXmCm9v9UlGjvgUFDsRkAt3+XhKxosPW0mjxi5X3fSief5vokSaBn0/X87mE3mTf7zkTvcU1cmQqFmWSWcoTS50WQpcPwm0wQFfSeNtQCjLRki+rbjmdJZv464BziDiEvBK1qzQ1TCfqKF+4Cnf9CwbABjTS3IjYSYElQoZAkBLlcKpxN8whzrwO+P3TDUPffTomzo6KvTlrO3wEjHlzHTvxW5gxmuWoefaxDVwGd8zlqGRFMTxCL9TCpDBSwHaqSNBBd7yFzDBw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(261009223027099003)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(6133799003)(1580799027)(18002099003)(22082099003)(11063799006)(4143699003)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?UWZ5NlB4d1Rjc25WWGcyR0FjT21pL3JodjVuU0psY2RZb1hIUW4zM1Za?=
 =?iso-2022-jp?B?TWFkb3Bvb2xibSt0MlBBRWF3TUJQRDIwMzRrd2tGemt1MFh0VElVTFNO?=
 =?iso-2022-jp?B?S3AvMlA2M1hscXNZRy9LS1pjR0xuUVdXdUV0TFRDY1lGSjhNd0V3a0E2?=
 =?iso-2022-jp?B?ZDJhSjg1dWlWdHdaODFTNVZhWHZwVWRhYjVaTzhZdVZ5V0Uvb0h4N3Vp?=
 =?iso-2022-jp?B?STMwWlhIZWkyalRySGJrczFxT1N1cHQ0M21wdGRhaW5xWlVQVUlCamFH?=
 =?iso-2022-jp?B?dnVFSEE0U3J1Mmg2MCsyQkJrclVlVVpoaWQyanJtRDlMMGtaOW5ZUTk5?=
 =?iso-2022-jp?B?bEVjLzF2ZU01NUhkWHpjc2hUN0p0TkFxVlUyZEp2ZWhmQUFtek5vRXU0?=
 =?iso-2022-jp?B?QnBLWkJwc05mcTFrM0M5MDFJR0Y2YTdRdFNGNmdxM3U2aGlLUVp3SlZi?=
 =?iso-2022-jp?B?MHhVNHdRRExtTXpCanNwODJkSTZoK2xEUk9tWnhzeFlHdlg3ODVoRFFw?=
 =?iso-2022-jp?B?VzMzeXNYc0ZhVVV2ZnVoeVZiUnY1cGJ6ZXhVZ09YbS9DRWQra2NYV1Er?=
 =?iso-2022-jp?B?MTBjRGFaL1JCWFN4c1VKSjh2VDhjU0lkUnlxSkpFelR0OHB0dDdJbkF6?=
 =?iso-2022-jp?B?ZTlqQUE0MmVuTzg2S0N4dEtFbXgybDh4NENDbC9aQW9aUmZ5YjF6NVlP?=
 =?iso-2022-jp?B?WVkvTTdXMk1rcXFaTlBsVzR6dTVORGpadHlLWHJjdW5KUzVPTFIwam5l?=
 =?iso-2022-jp?B?dGR2NGt5ZjBRL3FOc3NNTUdocldudlJvaXl2Q0N2cE8xdUtLTVRvRGpa?=
 =?iso-2022-jp?B?L0ZaRDVlVXN2dWt5TGd4cVlTOXNLSkpHTW1CTmo5SDRDTEVPejcwOWIz?=
 =?iso-2022-jp?B?K0pPRkdmdjlJZE4yZmtNUys3Sitlc2JFTEYycmhDR0VObU85a2JaRU9T?=
 =?iso-2022-jp?B?QWpzV0lKVWx1eDRMQ1ZGM1hwNzNsT1d2SzZ6QkxCV1VaaGlldnNWZHBl?=
 =?iso-2022-jp?B?UlV6NVBheHh4MEZtMU9vN0ZrUVBNTWFtM1JKSnRUajgvNkZVakdFcVMy?=
 =?iso-2022-jp?B?dm9ob01lVjlQVk5qZ0c3YXZpOENId1N3eHBwTktpUC9oK2Y1WExhWERu?=
 =?iso-2022-jp?B?ci8zWGpIbk1EMm13eGNtUzdnWVlDc25DWnV0Qy9OS0FxeFhUcmdqam1B?=
 =?iso-2022-jp?B?eDZoY3N4ZFNRR3ZQaGd5dDA1ZGxFT2YwNmtFS1dWbC9CRUFFYkFzdDdp?=
 =?iso-2022-jp?B?V005aXJaQ1FQb3l0SEx6UE5FUC8rQzlIZWdJNDgvS0VBdzZXdm40TXg0?=
 =?iso-2022-jp?B?QURRL29wK3JMU3BCZ3dQUkMvVDFJNnAwSmNWZExNSGdDQisvRzB0NUJn?=
 =?iso-2022-jp?B?bVNIWm53T003OWtSQmJ3L0x5L2p0T04vbVJxZkZhOFQ2enFWWTQva2xv?=
 =?iso-2022-jp?B?ZFUxQlo0WUpLa0N0OHNlR2diVlR3MUx0QUpZcm94SVhPUDVHNG5iZ2NO?=
 =?iso-2022-jp?B?QU9oc0pBUFVIUWVjaHJXaURCcGFTN01CME5xQ1ZtTDJrc2tnbC9YTXhB?=
 =?iso-2022-jp?B?RFp0dFVITmVPK1ZQVHZIRTdkaVEwN0pOUk9ZTnVOWEZLSHVsUCtDejd1?=
 =?iso-2022-jp?B?V0dmeWxNTW1jMVJoSm5VSzlrZ0ZldnJoaE8rZ2wzdlRSbms3cUhyY3M5?=
 =?iso-2022-jp?B?NjBvbE1mWmo1Wjc5SE1obzVvb0E4bzhIWm1zUEFNTHo0bVZDQkViblFj?=
 =?iso-2022-jp?B?Uk84UVJNREFDaEoyaW1mREMwNGh2cGFlaGJzWkx3SDIxbnVlVU5LWUdN?=
 =?iso-2022-jp?B?YWJXUC9CSkp5b09pUlU0Tktrek1YdE1qOXl3bW8yNFlWbzNNUGIzOXFl?=
 =?iso-2022-jp?B?bzhaY1RCMWY5d1huT1ZlNndnMWx4ZUJ4dGwrKzM3RTJjVllXSmZqc3RM?=
 =?iso-2022-jp?B?WDZiVVExWUFHZzBoR2RSOUJYbTY1ZzJtTmx5cHNmc2ZwRHljK2s4WHVY?=
 =?iso-2022-jp?B?L3ZpaWFKMWJReGZjdHBJOTl0SHRjS25MYllZaUJubnIzeWRKdjJEL3k0?=
 =?iso-2022-jp?B?YmJrbmpoSXg1MXRhNmVEM0VpYzBDY2tlbi9WNStHYWxVYW9Kd2ppaDcz?=
 =?iso-2022-jp?B?Q3l2QXpYckpMNnNvSm9Xb2pWRmdoM0RzU1RQbFJTbnRIS2FSaHlCQ3c1?=
 =?iso-2022-jp?B?dzNJMUFUWVE5VmpwYU5qd1MvdTlRaHc4c1JhRTg1M2pPanJpSWdBd0hi?=
 =?iso-2022-jp?B?L1JWL0xmVmFrNGI5d2lQcXlJdXBQT2hsTUwxTXIyWERHZEg1VENBbi9L?=
 =?iso-2022-jp?B?Ymd0RTRkQTdmYzVoVExRSnR3YjdVcHl4RjY0WnFvQnJvWS9welNrVlpR?=
 =?iso-2022-jp?B?UWhwRFJrS0VVaXYrSkZvSVlscU15SmVnZURKWTlJTnFUeGNSK2lFbGpu?=
 =?iso-2022-jp?B?dXY3TFoxcXZ3NXdQdjFKVHdWeGFvbW4vR2ttS0w1QVF4NTJBNXU2UnpJ?=
 =?iso-2022-jp?B?TE5CMDB3SDljRTA4SjBtNkZKQUVpQytCVzlxUT09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Dpyvwyqj77ICZff6ail/E94XrsqDiyIIX0BP8dpAFCE5elCLO9lePk6jsPGXuIj96zMNNPlWEwR2H2MGgGwI9ywF1guigGzSfQOqQBg4hTwSsdqD/U/mAj0lR19hoxWji1jbrWCw5fMi4MbIJyBcLc/a7fMTg5HgZv3UI1hDX8+hJwFnlStB3Bwkz9Jk2tJmE25JoZjqZRfN6gC3ZJNPfE+ceCx2eXb0uiru7sBevT4POpzJxjaBaHHfkRxlTJZGvTtweefXQF60ybkNAZoSHOVex36lTNGcMWL6KikBQK+9h/I4HAVc/WTaHtuJ4cPi3ptT53px84TD0EjKqq3WXw==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4328dda-aa4e-4b62-da21-08df30b0cea3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 02:53:24.8565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B5LN8zBJmPf1g1/QECjyBUtK3/SWcNdqE7+X5ZSN0QIGtwCKsfzifQGK9mjdQ85+/Cueuei7aRmBzInIxWr4HO4aj4t/HPSzyhO/cgxUhe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10706

Hello Jinjie, ZengHeng,=0A=
=0A=
=0A=
> >=0A=
> > I would like to confirm the following points.=0A=
> >=0A=
> >  - Is the number of reqPARTIDs per intPARTID dependent on the total num=
ber of intPARTIDs and reqPARTIDs?=0A=
> =0A=
> Hi Shaopeng,=0A=
> =0A=
> You are right,=0A=
> =0A=
> reqPARTID % mpam_num_closid(the total number of intPARTIDs) -> intPARTID=
=0A=
> =0A=
> so reqPARTIDs per intPARTID =3D Total number of reqPARTIDs / Total number=
=0A=
> of intPARTIDs=0A=
> =0A=
> >  - Given that requirements for the number of control and monitoring gro=
ups vary by user,=0A=
> >    would dynamic configuration of the mapping ratio between intPARTID a=
nd reqPARTID be a more suitable approach?=0A=
> =0A=
> No, in v8 James has suggested "static first" and avoid exposing user ABI=
=0A=
> in multiple places below:=0A=
> =0A=
> "I think we should leave anything dynamic here for the further future,=0A=
>  lets get static partitioning working first"=0A=
> =0A=
> "I'd prefer we get the static grouping working first, before we work out=
=0A=
> what needs changing in resctrl to do it dynamically"=0A=
> =0A=
> "I'd like to avoid exposing user ABI to control this until we get it=0A=
> working, then we can talk about whether to try making the grouping=0A=
> dynamically managed by resctrl."=0A=
> =0A=
> Link:=0A=
> https://lore.kernel.org/all/2944b506-a462-42f8-95cf-404241fb27f0@arm.com/=
=0A=
> Link:=0A=
> https://lore.kernel.org/all/ec8bc617-9e74-4749-ab33-39d1079415cc@arm.com/=
=0A=
> =0A=
> =0A=
> >  - Regarding the mapping logic, some reqPARTIDs may remain unused. Is t=
his the expected behavior?=0A=
> =0A=
> As mentioned above, we are implementing the static solution first, so it=
=0A=
> is expected behavior that some of the reqpartids are not used.=0A=
> =0A=
> >  - Considering that Arm has previously implemented this,=0A=
> >    are there any gaps between their implementation and Huawei=1B$B!G=1B=
(Bs requirements?=0A=
> >    https://lore.kernel.org/linux-arm-kernel/20241212154000.330467-1-Dav=
e.Martin@arm.com/=0A=
> =0A=
> I haven't looked at the ARM implementation yet (I'll refer to it later),=
=0A=
> but currently the code is being gradually aligned with the maintainer's=
=0A=
> review comments.=0A=
=0A=
=0A=
My understanding is that if hardware supports PARTID Narrowing, =0A=
the feature is automatically enabled in the current driver implementation. =
=0A=
This implies that users cannot disable it even if they wish to do so.=0A=
Could you please confirm if my understanding is correct?=0A=
=0A=
If so, I believe we need a mechanism to explicitly enable or disable this f=
eature. In Dave Martin's proposal, =0A=
a partid_per_closid switch was introduced, where partid_per_closid =3D 1 ef=
fectively disables the feature, =0A=
while setting it to `N` allows for customization to meet individual user re=
quirements.=0A=
=0A=
It would be ideal if we could configure the partid_per_closid value during =
the MPAM driver load time, =0A=
avoiding the need for dynamic changes while the driver is in use. What are =
your thoughts on this approach?=0A=
=0A=
Additionally, could you please let me know which branch this patch series i=
s based on?=0A=
=0A=
=0A=
Best regards,=0A=
Shaopeng TAN=
