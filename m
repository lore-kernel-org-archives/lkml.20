Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.134
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793345852;
	b=Tlib0ehQLyiYmvRKFs3gBL2q2fefRKSeyyDebllIdAr6h30u6TF3zuZRwvdU8Xwb6xKg
	 4UTRFkG8JPaTdDtXjuTrKU+7PBDQf5IMGntlO0rqE2+cpjZXwvVyuMlQm0QoKFKm8TzTN
	 KYStpu3xtrE5Ohzi3MN//yrxHa1DskZavAbA5mJ1N4DIp/KFU/wPmh38267epLFnHTQRx
	 h/12wuOQVohtEtW5aA4dJIrEiT7btzYYhaqGXmvVe9fyVojIV3vNVL0JYUZs5YQrr/gUh
	 ehgx1mjkyTZFuflzVMyv605OmRH2XejYY/Eo8mVJFcTd0cB8AIqu5LPQB5k3mjQG80Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345852;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=SA3s5MwBVhHPw9ISTjG7ED/6MQcIz2iFZTysTtlmr4c=;
	b=Gz3QRjl7rRuYVeWKqT44+UcirQbPwn5fQP+u6JFddrvM5W7P8q9H1aK780PQs3JvdwPa
	 PCE8XrNRAg0kkr+tN89cQbHIj3C2tBxxrimMJaPhrJrH2Kd5lm2XhBkNjcdnN01kXISJ5
	 Bm4VZRYSrKtHo5KX9ukwBrqgjVIR2mfRXFtxdcfzqQSbSnvCfXtKMJILOZYcVTDQLMEPj
	 TW+Gy2axyFLxFPkX+2ooAdD0pUPTRAzaUJAq40TYl4Q3utTyjbXfB1ubjIN/dfWiThIAZ
	 lKz62T8dMUHLi6V1Yzf2ieeBumzkiKCBdAU5M8/Z81haTjNJkeaDkQhFze8Qh0mFljw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=iopsys.eu;
	spf=pass smtp.mailfrom=genexis.eu;
	dkim=pass header.d=iopsys.eu header.i=@iopsys.eu header.a=rsa-sha256 header.s=selector1 header.b=KsVPvnLp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.134
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023134.outbound.protection.outlook.com [52.101.83.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1B0606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E1B0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=iopsys.eu header.i=@iopsys.eu header.a=rsa-sha256 header.s=selector1 header.b=KsVPvnLp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qArhELU68HJ4J2kGquP1xUGB5yXhAQCkAz7MmxAMVp9pix2soCqokH+2YAeRMB4JEeoM/YCX1hiO2wVazYvszssYLCWww76Ya/Jot3hRd1fy7Uryfqj6cGvgzfv14+PUnf83X7uRaF/rHfvMpe82MZczyrtCH+c6y3PeUj702w5eW0t/WoV3zgDy8fKHaBvYJXE33W0jM2/OePeRjPrBoqbt3mnzQEa0M5gKXiTN2Ly/69/vM9Ofa28Bf0Oyqlz8sz8gd4tBZeII5YUADHtBlhU0V4d08qz4kRNUPph3MhyatXl0n0HTwBLI/YxbQud641wsi0IIs33J24w0W2whDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SA3s5MwBVhHPw9ISTjG7ED/6MQcIz2iFZTysTtlmr4c=;
 b=L2frvLjMDHmw9l2sJC1lMxQowM9+sYjlP//2mfky+Qhnk1NwT/VLkEEqS0KAVxOjct7Y4Hg7wD4lN5DmceM8YEn78bf/0drik845sLt1susVfmmMPZB4135EXPlD8JiKfoMOAMgpc3O/eSa0vOLAUDKRX8bkWZhIJ4yoSDE4aXCQT9nP+i0VFHkYuHA5zalswXaqsbq9NFz3LNpBF9sfi6ZSx5Cz3aVDdkE4zYGcY4RSMsVD0W7HCTThNVRFU/27Gn7qvCFu1A0gZSWnU7bzo0pvRf9BWVkHXLJjVt/c63EJqHKJBCpaKUzhr6WgJh/8Ofg+z4SVbcz/0yrqCeeQ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SA3s5MwBVhHPw9ISTjG7ED/6MQcIz2iFZTysTtlmr4c=;
 b=KsVPvnLp6qK0nmSFhhvdPcaeJBzgZsWKZtGQGemcbht4VhiGiUTlVHFubRx1pj7ENyiiBbdmKqLtRKWO6vIY8fpazZkC45lKgJvIvTefOcpT4qIJ4wTaMlr7J3krQXh+L5exr+yTcJnwVB5Ya3ePsvSw1iw3y20LQi8OYQDiGUlxiIZ5A99YdVuZppL4b8g4G/WIyF9NIsAFDcUyP28+6yB7maFAXfp9cafgURmtMtR0gIeb9Yi4bNHXGTgHNMC1dVfxFl5IkspkcHH7PBOKb7tyQGV6Ulw5yGG95SC9OOmwXnt7YB0gXqI1c4+E5Js7Jx8mkcsxJB02zS4mzXyPNQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DB9PR08MB7510.eurprd08.prod.outlook.com (2603:10a6:10:301::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Fri, 30 Oct
 2026 07:37:27 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%3]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 07:37:27 +0000
Message-ID: <73cc1302-d1fa-4c32-b6ed-4c44cd48ad39@iopsys.eu>
Date: Fri, 30 Oct 2026 10:37:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 3/3] mtd: spinand: repeat reading in regular
 mode if continuous reading fails
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Martin Kurbanov <mmkurbanov@salutedevices.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20250917215401.19132-1-mikhail.kshevetskiy@iopsys.eu>
 <20250917215401.19132-4-mikhail.kshevetskiy@iopsys.eu>
 <87mrrwebxh.fsf@bootlin.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <87mrrwebxh.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA3PEPF0000051B.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::676) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DB9PR08MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: fe4f12ad-d5e6-47cb-ea75-08df3658a5af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|10067099003|6133799003|4143699003|11063799006|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pTz9J9DnB9w7yVlVIVSng4VTW16TwzHrz4UK1lk+6/FXQrwwy6S8gELLUjKN2L0sdE5IzRbAFs/uk5VqXS3fY0JWIAHKi8w9IHVACLQxVqBGtWhJYgR16m23hRY/YgAmBleLs3mlq5AFp2Sy2iMhdAkUsoyfN9xYWU2riZftUqDqJ6drFknR6Oe8eTpUVyL8aMzeckgpCGfwDX+LinSpmhzFmbggeUdrMPPPYp1os4Nj9IYxStiARHfmLnvGCM6QUEv+tZaKkgtyDoiw9cAeblu840sOlhtzcbD7HkZa66JB/xHiJTaEyD+c3fDijnjNh8GZ3KSpK8iJ8nI5LV9R5Gf0u5VTcpzR+b+Z9ssuTpvO2uL1WJD36SSApwS8rVIRwczH1kfFd5pi5KFxhZ9qqcLFyg65aMcoxsGeUwU/CxX9voh6J3FDIwm8QE5P4+aLChV8xDm+VUDmbVsmicuRynGiNjYho73DdEUHfVuK1r+utwQzsnTI/WGqQOT8MW4Nm4zN6M3w15k8NyOCTUfbrlFzdC6airRy2Yo1A98Jlsb8BK3vIy1rZMoBQoTQ6/AQ1XD3qz8Jem8LU+nWr+ub5vZxrrDkXc3OntmLJWx4/+KEik127WHfmnJ3P+y1CNeB3ViLguDnQFqi2quQlrIKYoGRuKRQ7JPRddRa5spdYDs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003)(6133799003)(4143699003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVdXM3p5SUducEZMMitSZkQ4Zktva05zSk16TXNzcW5xZm9WRVJrUG1jSGJK?=
 =?utf-8?B?WkhsYjZpS0QxbFhwNHI1bjVWdHFwclF4d1hEZDZjODdabnR4bG1NV0NoZXE0?=
 =?utf-8?B?SHZtYThGOU9HS0RiQm8yRmk1RkdqYWpudWtOMzlMaHI4cjlVcWNOZUROZDdJ?=
 =?utf-8?B?bHpONlNmV2JGczJBa2lYWDYwWUpycHVaY3c5YVpwNGNRMVAyYkZtbDFDends?=
 =?utf-8?B?bGRtTU1LVmk0VmJLOGVQQWhpQm1IWjdWZDIrNlpGUVVLLzZQRmdOcGZLc0xH?=
 =?utf-8?B?azRpM0NqbDhxWi9RdGRuaGVWS1BvUzdWd2h2cW5xNEpJeHd2YnplU1BLUXNE?=
 =?utf-8?B?d3kzbjlraXFvTjZvZ2lZblVIU3pWaVM0K21aL2VsTER2S3VXN0ZkWXBqeUZj?=
 =?utf-8?B?OUNCUDhrRy91eGp6eDNvK00rZDNGcEFaSU1Xd1FUN3RnSHhSWDZLMGRQdTMr?=
 =?utf-8?B?RUhCM0JMY3Zxdm4zejQ0YmhjL2thL1FDaC9QbzZMQ1ZKb3RWNEpydisyOWRa?=
 =?utf-8?B?bmJjWldKa043VUJkcXdUcVhCUGVZZi9IRzREWlpNeFFrMG1iRGs0bHZDNW8y?=
 =?utf-8?B?M3VXYnpZV3orajNsWmlieC8wY3dVZXFIZzNPQVFXMXluczdsZzlGWmluR1cy?=
 =?utf-8?B?NFBsR3BHSWcxMUN6UFJNT0FSRFdZNi84NitpcmhMQWt6aGl1cnBYREtuQzhs?=
 =?utf-8?B?MFZ1MGxxWDBuQkJ2NUcxTTAxaUVpVWw1OEhNN0Z2SEpnUlEyYVdaRmtFNEkr?=
 =?utf-8?B?d1oyOEMvekZRbGdudisrMmpITkNTeEs0THlybVZaS0dwTkQrMWJtU01DZWVQ?=
 =?utf-8?B?Tmh4NnlCZnNDZWxLcWNqYTg3eTJYQmZ6TnBBc1ZwdlpjSzk2blZiOW9YSEdr?=
 =?utf-8?B?NUFLOVZJSXhDYjBVNzF0dFNTemdDbm1GUzZJdDVWb1FhZCs5aUhXSTIzUUlE?=
 =?utf-8?B?dnozbUpjUU9RYXBFU2lqU3RBREFkV3gwQ0JYZmd2bnZmMGJjSGpJMlFXY0Yv?=
 =?utf-8?B?aDFoMUhIbXI5WkdhbkMwYTVoVmU4SGh5azBtRUtqcDUxQlJpZ2E2Sjd1dkFo?=
 =?utf-8?B?WU10QWlINmhJaXdmdTlVaW9RZ1Y1cVdkNVBNTmtlbm1QTmhMT2FTUEpiOXc3?=
 =?utf-8?B?UUtPVW52YzNQN0RqVzdnRVJhb2xmMW1vQUtJUktYUk42QkVpS1h2aUtHV2lI?=
 =?utf-8?B?R2pjWnh6K0ZIMG9vajUvSlNyQVdkbG03Q2F2YlBxRUJUTjN2SHhaSDkyTDYv?=
 =?utf-8?B?ZnpLMUJ4Nm41b3RMRllCcmpNeUczbnBoNzF0YjF0MXJTbWxBVW1MNHRlKzRz?=
 =?utf-8?B?SFN5ck5mVmlqYURvQXQzRXBoWktnZVZJcWw1WHJpNUZtQmdnS3lUaUh4MUVD?=
 =?utf-8?B?akhyWlJ0TjNlQTJ3bllySlVpUFJTeWJJeWZuZmVsOEZlS2VqNWY5VW9KQWlr?=
 =?utf-8?B?eXZnOEhWUzhXSkUwMStXKzRwN2ZTYlNEYVFMWDVQUWJMMjRLOXNkWnFCM0xi?=
 =?utf-8?B?emdFbEthRzhBa0Zub0hveFFrSXN3TVBZa0hDZUJNUVU4bktoMDlFU2FHMW5u?=
 =?utf-8?B?bG50U3lvTnV0WFZxTkIxWEFWekhkb2NVWDhMQnV4d0Nxa0F2TUhROW1seTNE?=
 =?utf-8?B?WmRlZzl1Ky9UbmZveTg0ZmRsTzVwVUhnS0k4N2NlV1FtdXJCWEN6Q1E1S3ph?=
 =?utf-8?B?US9CVEx1c0xhTEhaSnBZSnA2Q1MwR0VpMGpmRlpYS1J6K2RkQlVJOVRoTGFx?=
 =?utf-8?B?S0JUdEhhNVNPYXlVUlAydXlzUlRiT2duVHpGUGdOMWdnVTdwODVEZkNIU0pD?=
 =?utf-8?B?ZUp5bkUwbm16QW5OZWhLckRmdkJxRjhiV0xURlVzOG1RbVpYYk1PSUd3R0o3?=
 =?utf-8?B?cnlzNnN0dkN2SzdZdk56eVRWUmFZdHRUaHNwZ2Frb1ZlbzY3alFMYkhBZEh6?=
 =?utf-8?B?bERaM3IyME0rL2g2WS9aWmJFWEhMNTJHZGxwZXhNeUFDNjBVdjB5bkZmSUlF?=
 =?utf-8?B?djloSHBqcTNLc2s5L0dydVNNK1FLVVQrZFdGeit1bS9KbjNYaGpYZk5hd2Zh?=
 =?utf-8?B?dTQvWGtBUEkwYUxXRWUxSnl6YkFTZWwwR3E0b0JQcDk3Vi9BZW9HZTVsTFlN?=
 =?utf-8?B?U0pITytSVEwranVSOFRNMW43L0JCc2ozSTNIMC82VWlIVHpwcTlyRC91MXFX?=
 =?utf-8?B?YVNmcnUxZmFDVHB5RFlLbHNDWFplc1p2SlQyOE40alhJbWI5L1BzTkVwcnpo?=
 =?utf-8?B?citiVDErMXBGS3VyaEpRejJOc3hzVkNKVnlkbnU3dGc4ZjFGVzZZVkxUVnUx?=
 =?utf-8?B?cmtPOHM2bmk2K3l4WGtocUg2N3pjK2hEbERzbm9JdWJNVlFPeHdrU3ppUEZO?=
 =?utf-8?Q?z4s3EKxyiyWIWVZ8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4f12ad-d5e6-47cb-ea75-08df3658a5af
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 07:37:27.6228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iwT2yNsC0TjO53LQsLhNqqPQnr+w4mBmTm2D4K0yVyIqSp6RbVhAEAITHGxeUjkaxVp25EwSkGX2jbixQC48sALtsbe/KSCZehyEVc5xKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7510

Hi Miquel,
I think spi-mem capability for continuous read support is the best
solution.

On 10/29/26 18:58, Miquel Raynal wrote:
> Hi Mikhail,
>
> On 18/09/2025 at 00:54:01 +03, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu> wrote:
>
>> Continuous reading may result in multiple flash pages reading in one
>> operation. Unfortunately, not all spinand controllers support such
>> large reading. They will read less data. Unfortunately, the operation
>> can't be continued.
>>
>> In this case:
>>  * disable continuous reading on this (not good enough) spi controller
>>  * repeat reading in regular mode.
>>
>> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> This patch unfortunately breaks continuous reads on my boards without
> dirmap support. The fact that they do not have dirmap support does not
> mean they are not capable of keeping CS asserted, these are two
> orthogonal hardware capabilities and it seems that we cannot easily
> discover it at run time.
>
> I recently had a similar issue with a "powerful" controller
> (cadence-qspi) with dirmap support. The fact that controllers will or
> will not spuriously assert their chip select is not discoverable
> either. As a result I created a spi-mem capability to flag this
> impossibility, which disables continuous reads. I will send a patch to
> revert this commit (keeping the previous ones) and another one to flag
> the Airoha controller as not having full control over its CS.
>
> Thanks,
> Miquèl
