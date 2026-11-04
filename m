Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793833336;
	b=2UTQRivyfujrPwmT4d8gZdVXyAlShN5tXgIVTE/AVYTxtX7evQJfFAy8PzvA9j0R9Pl3
	 4OiF3ntI0LRg3tvM/8CzhLo6NGzaPcnM4Q1Lm4NCR/3wehZyNCnMZlIGdxgljra7XkEne
	 pBJy6vGbFzRnXm1zdH0EZLoIM1MiNoggEEyDW2BYhvQcvlNwM12+nxlG7e5lxx6EGAnVo
	 LSg29cSTzqJ0RSPfpMGM08SIuN+kzukJYBVQvLi/symXd8u2ixF5ABEWP0euOZC7w/zBN
	 0pkU3O80zsCIa726lZt2AVjuWbuh7bsmEjr7y9ZGJtl6Fpkd+qwrjOcF6MgEq4yrVZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833336;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
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
	bh=ScB+1RNNN7nrFc24z/jDL9Wx6H4VUx2SuocMwTMSEps=;
	b=oWVCH3v3jjSfAf3APfdYP5IpCd+C3hPZxKA3e6SZzRhHRm8O/efQfP+CK/Qcj++xshiE
	 qddjeQlMSJxgmiMrZ33QyXAtW4WFwar8Mi5nncRZ1M6so3DOo5viDVdL1Wsux+aUcJvOz
	 uKonjFgXo0FBBDFrrcdSFzpGrZAXlKwdf1PKSZMPrpOn3A8oDmxXXOmEgeZ0s0p2Der8/
	 aTCSgfHEn+dWhgLQDCRrkgQ0wOBSDUyUpywVXZuRxENartE29p1pnUp2pHykRWV4ss3nT
	 i+C+5YOUfibvln3o6DpT6lJQh3GL/bumdrYYqgFcEX4vqUEo2IJTqOqjHKis5CvXAqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Iq+PXbvP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.48
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012048.outbound.protection.outlook.com [52.101.53.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8133606A31B;
	Wed,  4 Nov 2026 23:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8133606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Iq+PXbvP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfZCV5IvCAcL0qHg5YIBCsAdTapUf74IeJaLcO+9fxwzqanLk1Vrbtlaoq+H7FTvyIQ8tr/aiJJ5FO5AINVBeoufT+DS0788bWZKxBm1pY+tx2e0IZpV3QGzF3GOC1A1F49AI7Gg1Tm8UeX4orfLa3WSAbCFlO8ctI4L2mUTlEcXYqvC0I5XBikdLGQKWN5D8vXwcAnKPbdTxjXyjnVpYwyaTyxajgMjP/SYwDxL7sIug31EK9pIqmeciyamSFLxanetoVziOv4ejKqvH7sJLK+e4z7kIvAn1fgshd7DHD9Ah0mbUQq4O32Axnnwc0eY/3t4cd+P1EsahefhMhoUag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScB+1RNNN7nrFc24z/jDL9Wx6H4VUx2SuocMwTMSEps=;
 b=UlJ1kL9PHQxvw5YmqwsUL5XGsdE/xfcCSUaj3ijsTsJaGZ0CZaQT0OWBvlSITdnZDPSlWjC8QMe/os/1n/7Bv84q9+2MWjTyn5g+sTdU4MlhqnBYtGwLPer58p7fQWeoyaZjM9GShUjRPJHS0jfBu3tbsTJUqp3v4gdo4P+th1Gd652xUunUiNXEYBLn35vswhHyU9FJb5YPrBe2Yzu7wvN3hyrXqi4E/SCVeJmKXgxtWtTM6nXbIwAzxdIiJaIGvYyWoDxN1y+HNQg6HVYuiM0UEiXnell02w7C7T0ZCC36a5Dk8vwJdClJOTqTaYLcUbRGYDZfqGVE7G3oN4b3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScB+1RNNN7nrFc24z/jDL9Wx6H4VUx2SuocMwTMSEps=;
 b=Iq+PXbvPi64pXU2YRfsc4s5Wg9TDURj2sxvi0MMvZIFdEcJHdlpSF+dFGuK3YZHg7rhFdPNxlXsW5Yh/ogPUSa3k7eQ8eFAmQan1yxLLe2ZgGUvcYjlWiuqwk3goqH/DFsDgdUarU8eWF8rN8hnVU58RAnwkD9e+71pjrK8EjfEP6rA3K2zd65dLplUVu2eMXKNg7anTT/Pm8rD0XFSl3E1qmG48YSmJBpxuzMpPwBVq4U5tRYbWOD3sQYsKH4kYK3ComBOf0My7oJ5R+bKVln8QnCp5mkW+7dOUFh5Eyt8vKwceZPbNPNhc0LHMsCicSSIDOO4hiJgnKTNTR42GyQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11)
 by SJ0PR12MB6928.namprd12.prod.outlook.com (2603:10b6:a03:47a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 23:02:11 +0000
Received: from IA1PR12MB7687.namprd12.prod.outlook.com
 ([fe80::44bd:3118:a52:69d8]) by IA1PR12MB7687.namprd12.prod.outlook.com
 ([fe80::44bd:3118:a52:69d8%4]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 23:02:10 +0000
Message-ID: <e5fb0b57-0304-4989-94af-9432115c7cb6@nvidia.com>
Date: Wed, 4 Nov 2026 15:02:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 3/6] firmware: smccc: lfa: Register ACPI
 notification
Content-Language: en-US
To: Nirmoy Das <nirmoyd@nvidia.com>, Andre Przywara <andre.przywara@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: Salman Nabi <salman.nabi@arm.com>,
 Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, vsethi@nvidia.com,
 Varun Wadekar <vwadekar@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20261102165421.3651202-1-andre.przywara@arm.com>
 <20261102165421.3651202-4-andre.przywara@arm.com>
 <c9f66683-7902-4b5c-9f76-c55b1894ce9c@nvidia.com>
From: Vedashree Vidwans <vvidwans@nvidia.com>
In-Reply-To: <c9f66683-7902-4b5c-9f76-c55b1894ce9c@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:303:dc::19) To IA1PR12MB7687.namprd12.prod.outlook.com
 (2603:10b6:208:421::11)
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
X-MS-TrafficTypeDiagnostic: IA1PR12MB7687:EE_|SJ0PR12MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: fea5c068-1d55-437a-5770-08df3ac7a832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|22082099003|18002099003|4143699003|261022115727099003|56012099006|11063799006|3023799007|261022075727099003|261026140227099003|261026121527099003|261009223027099003|261028144727099003|261102123227099003|261022105027099003|261021121427099003|261021123027099003|10067099003|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	y6P7tRrkFBDKEUs10OaKmjU9PrwH6IVGoIFGaRr2BQBohGc7luRXrUkgF/0EDXujWb64+jYBePr7JFNLG9i9x6XWw4T6hNTOX++Oc6pvTxi/2N1bVJsSH+df+2h1ABATBo8dedK2Ursn3pjVcEbij2CWctpkMTN+SmMzy89qm+M6VoU2Jjps/iN+K1rN/rg3zsE0F5a2vPZvqcp6UoXUpHpoKFUzqZf7OcYfcMPx1DYbLf3MO7/Xsg86Hd1v8WLJlZi5qow4nA4EcH285rIN8k3hDQxoP0+wjEFaWvBQd9XwPSNkOUNgkjz3HpT8tDQnI2xU42ddyOs2sw8xToXuh8W5VDaE5GA1cpPxrxHhyrmiccfNPdwnfHiUvAjxMvsbFaxgRuIT3LXdoQwQYDnxtmbdjolkkn7rjDm8IrbFJVNOlOEr5vneJGatvrmJpO0u/EEZwL2Vcmd/uVOGJ1V4JVampVn4Ke+M28y4vN7kKBqAfGntYmR/6xe+LtAPBu6fKkG43iBqiere9FaBHz0SYojLQgaOmYk/gmQ4rjA6lcOufVqiVFi3+s3LzM6Haj/tjFdatQDLoG64Hk8TjsOMRgJASiY73k3cHxTnLTTExTAyy/bKnz0bCfNVBBr0kAnRIRDfqs71t8b2nUz9hTD0gfz7dQniO+RWP3l8lCPjoiI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB7687.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(22082099003)(18002099003)(4143699003)(261022115727099003)(56012099006)(11063799006)(3023799007)(261022075727099003)(261026140227099003)(261026121527099003)(261009223027099003)(261028144727099003)(261102123227099003)(261022105027099003)(261021121427099003)(261021123027099003)(10067099003)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHhOV2tKQ1FIOXVTSTB1ME13c0J5azJ4VXI0Q1dKUy9RYnFSankveURTZWx5?=
 =?utf-8?B?VHY4UkdlZXpBcFR6UkVjaTNUWkNMelB5VkE0V2YzbzJneGRUQ3ZZK3h5YkFQ?=
 =?utf-8?B?QXJyaG1WbkVBaWJ4a2ZXT29kaXpTK2tGMkVxaWNDQ01LMG1BVUJmeGZ4Vjkz?=
 =?utf-8?B?SFd4dytZSUE5V0w3MDBKVEt3cVQrNW1aWVBsTTZhdE1taGh6Wk9XbGZIVW1x?=
 =?utf-8?B?TTBTMkYveGljZWZMWXExdklWUm13SDRsUE5iZmp2UkdvelpJZ0gycnNQdU9h?=
 =?utf-8?B?UEFDWFdRT0k1OEdyaUUwdUsreGJIeWxBdHQrN2lmUXdFMHdCanZ6eTN4aGdJ?=
 =?utf-8?B?Q1VydWFBTTlOSmRmTExmaThlaGtNcHNzYjhxQlJFR3h6VTJEMG9zZGNEOUl4?=
 =?utf-8?B?MlQ5Ry9zQzlEeTNRc1BKc3Qvd3pQQ095aStuUUgwZnU1TEFoajl1TVNUVmh1?=
 =?utf-8?B?UDMzUkR0R2ZLc0crbTZORVVwdTBQMXhkbzhhL2dCQ05vUVRNS3czU0lMMjhG?=
 =?utf-8?B?bmVjRmZrYk1iMFphcGt4QnlpRGhhR3ovenFUYUxXMitRcW5MdGF5aWlad1Jj?=
 =?utf-8?B?UFMyZDJWTG5GZG5NclpnMTN2MVpLdjNaUnNYOEJYMlJXUXYzN2JxcFhhSTVZ?=
 =?utf-8?B?dU52Nk9xQ3B6emFTVGlUbGl0UGh4R2VwSmZ5NmFONm5kcnlIdVZsV2tpTTZx?=
 =?utf-8?B?Yjg0M3dKcEYzbnNockdtdzVqWFdpeWJ1TkdKSzFHSzBNTmJiV3UxQ2xLQTBy?=
 =?utf-8?B?clQ0a3Jya0VxOHh4WE1PR0k0ZlFJby9jb3oyaE5wekZ5UTloTW1yQVpoRkt6?=
 =?utf-8?B?cDMzOWhFazBCN2ZZUjFrMHRsVm4ycm50VEpDTTFhRUNVTmtDUU9hZ3ZpSzhO?=
 =?utf-8?B?N1dKSTdQemIrQ1BWNWRLbXZNOHV5RVdrcmZGK1NGR2RUS0JGaFhOakJGbUdD?=
 =?utf-8?B?OWdzTXNCZkxBeThaL05YVnJoelQ0aUtvOW85MXpQS3hYaHlKZHZKU2RXTFNh?=
 =?utf-8?B?VHJHTDRHTmRMazJyMFNZWWRBSWd3T2o0Tnp1b0ZXZ0VFUEd1ZEUrRG9OQi85?=
 =?utf-8?B?VFJteEJDRWd6MWJIMjgzOVUzSU5JUURiWW83SCtVb0Z6OHpuOXJVZllDUDgx?=
 =?utf-8?B?VFBaWEVuM0NXbWp4REYxT3BoZnBzeGFJbTBrOFN0eFFWbXpBQTNHU1ZsVlE4?=
 =?utf-8?B?eFZSdyt0VDhEWW9EbzR0ZmpqeDMxN3hvY2NPR2pjZDE2SEkwVFMzenVIUGRT?=
 =?utf-8?B?bnFBSEFoQm5yMldtNG1MK0VVZ3VKMUpsZGJqaVZOb0M5RzJwRjNMVnM1UHVa?=
 =?utf-8?B?Si9vTVBkSUNMUTN5RlBTY0tLNGRZNUllVlhwdnR6dnRmVFpGMVBZU3c3Mk0v?=
 =?utf-8?B?ZnMvM1JBTzZ3SGRkQWpCUjBFdTBzNDhTRGVsV3F1OTJQSFdrWXhiOXBQTWJi?=
 =?utf-8?B?ZzAzTnNHYTNSeHg5TC9ldmdIZkUrN1A4c3VXTzJmRXVKOEQ5YzhNWWpSajlo?=
 =?utf-8?B?ZTJCSDE4VnA5QWdkQm50UjNYVjhPVHFZSmovcGlkeWpremZkYU5TdlVXaXNS?=
 =?utf-8?B?bEhZWEJYeDNYbVVxRlErNk5MaC9WcjhnM3J2Tm1Bc2hjTVo3MHFKZFZwaHpY?=
 =?utf-8?B?MWNLSWU1MjdSMnYrZEhSUlp3L1luMWxIUGQvNk8wVVZJWTM2ckVYR21Ha3dm?=
 =?utf-8?B?cVB3SFZMTmlxMGdSb2NkZUs2MXA2T2toYjB1YmRXUUJNNjFkeDJoQ0FvVldL?=
 =?utf-8?B?ODI2VFBFdVRUbnVYU3ltbEdBaTBqZUpoNXQ5ZDUxbEEwVXVIZHpLSUl2dFdT?=
 =?utf-8?B?ZXZ4bGgvS3VTVExyb1k5a2lNcGxhTmQwOFF6NDN4bUtUVzd4c2FUYmpIbHJE?=
 =?utf-8?B?eG9nSnZzS2RyeUNVNVFoY1JwMlRKLzVsM2YxTjdCTitFYlFERDlWcHh0Tldi?=
 =?utf-8?B?NmZKSk9OZnVDcDJYMEJzek5wRUx3a3Z2QW1GRGxVYkpQQ3hjUGdjYnhiQjF0?=
 =?utf-8?B?U29ZK0xRNlp3ZG5McmJ2aWtkVHpRclpwMHc5c3hpeFhXeVV0cDdCVHNPTlVW?=
 =?utf-8?B?NFY5a1djRCtHZ25rUVZYa3U4WHFjSUFVUUZuYXg5VXdUeW9ycWhMVUtJY3c1?=
 =?utf-8?B?RnF4NW1lVG9EeVNxSHJuRzlLcUVteGl1RWdYcDZHTDU5SkVMMlQwTU9rcnVP?=
 =?utf-8?B?dFhMYktiajVwOHc1dlEyMHNSSkFSMVVZalJuS25JbWpPQmQ2Y2hjb0kraDF3?=
 =?utf-8?B?aEYzb0lSZ2VvRGZZZ2daVWRlM2MwY1BTZEVkMU5YaWV6MFdwaGxSTldPOGZQ?=
 =?utf-8?B?MVU4ZXJTbzFwWjl3SjFmWHU1cTEzT3FOSVRNQ29HaEVINktyNU9LQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea5c068-1d55-437a-5770-08df3ac7a832
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7687.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 23:02:10.7651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dJPBs9IzwVHoL0EZg6NS31QvTB4eeJWEX6hnu+4gfjVWygsM1qflt0K/+eBPD+TXerMGp6RylvTHAMP7YHuHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6928

Hi Andre

On 11/4/26 12:03, Nirmoy Das wrote:
> Hi Andre
>
> On 02.11.26 17:54, Andre Przywara wrote:
>> From: Vedashree Vidwans <vvidwans@nvidia.com>
>>
>> The Arm LFA spec describes an ACPI notification mechanism, where the
>> platform (firmware) can notify an LFA client about newly available
>> firmware imag updates ("pending images" in LFA terms).
>>
>> Add a faux device after discovering the existence of an LFA agent via
>> the SMCCC discovery mechnism, and use that device to check for the ACPI
>> notification description. Register this when one is provided.
>>
>> The notification just conveys the fact that at least one firmware image
>> has now a pending update, it doesn't say which, also there could be more
>> than one pending. Loop through all images to find every which needs to
>> be activated, and trigger the activation. We need to do this is a loop,
>> since an activation might change the number and the status of available
>> images.
>>
>> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
>> [Andre: convert from platform driver to smccc bus]
>> Signed-off-by: Andre Przywara <andre.przywar@arm.com>
>> ---
>>   drivers/firmware/smccc/lfa_fw.c | 154 +++++++++++++++++++++++++++++++-
>>   1 file changed, 153 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/smccc/lfa_fw.c 
>> b/drivers/firmware/smccc/lfa_fw.c
>> index db2a7fe344d5d..4b4daf79611bb 100644
>> --- a/drivers/firmware/smccc/lfa_fw.c
>> +++ b/drivers/firmware/smccc/lfa_fw.c
>> @@ -33,12 +33,14 @@
>>    * skipped by setting the force_cpu_rendezvous sysfs file to false.
>>    */
>>   +#include <linux/acpi.h>
>>   #include <linux/arm-smccc.h>
>>   #include <linux/arm-smccc-bus.h>
>>   #include <linux/array_size.h>
>>   #include <linux/delay.h>
>>   #include <linux/fs.h>
>>   #include <linux/init.h>
>> +#include <linux/kernel.h>
>>   #include <linux/kobject.h>
>>   #include <linux/ktime.h>
>>   #include <linux/list.h>
>> @@ -49,11 +51,13 @@
>>   #include <linux/stop_machine.h>
>>   #include <linux/string.h>
>>   #include <linux/sysfs.h>
>> +#include <linux/types.h>
>>   #include <linux/uuid.h>
>>   #include <linux/workqueue.h>
>>     #include <uapi/linux/psci.h>
>>   +#define DRIVER_NAME    "ARM_LFA"
>>   #undef pr_fmt
>>   #define pr_fmt(fmt) "Arm LFA: " fmt
>>   @@ -753,6 +757,135 @@ static void clean_fw_components_tree(void)
>>       }
>>   }
>>   +/*
>> + * Iterate over all FW components and trigger activation of all 
>> activatible and
>> + * pending components.
>> + * Since we would need to re-enumerate the list of all components 
>> after a
>> + * successful activation, and this could trigger infinite loops if a 
>> firmware
>> + * component still appears as pending, we create an array of update 
>> candidates
>> + * first, then activate each one of them.
>> + */
>> +static void activate_pending_components(void)
>> +{
>> +    struct fw_component **all_comps;
>> +    struct fw_component *comp;
>> +    struct kobject *kobj;
>> +    int nr_comps = 0;
>> +    int ret, i;
>> +
>> +    down_read(&smc_lock);
>> +    spin_lock(&lfa_kset->list_lock);
>> +    all_comps = kmalloc_array(list_count_nodes(&lfa_kset->list),
>> +                  sizeof(*all_comps), GFP_NOWAIT);
>> +    if (!all_comps) {
>> +        spin_unlock(&lfa_kset->list_lock);
>> +        up_read(&smc_lock);
>> +        pr_warn("LFA: automatic activation failed: -ENOMEM\n");
>> +        return;
>> +    }
>> +
>> +    list_for_each_entry(kobj, &lfa_kset->list, entry) {
>> +        comp = kobj_to_fw_component(kobj);
>> +
>> +        if (comp->fw_seq_id == -1)
>> +            continue; /* Invalid FW component */
>> +
>> +        _update_fw_component_pending(comp);
>> +        if (comp->activation_capable && comp->activation_pending) {
>> +            kobject_get(&comp->kobj);
>> +            all_comps[nr_comps++] = comp;
>> +        }
>> +    }
>> +    spin_unlock(&lfa_kset->list_lock);
>> +    up_read(&smc_lock);
>> +
>> +    for (i = 0; i < nr_comps; i++) {
>> +        comp = all_comps[i];
>> +
>> +        ret = prime_fw_component(comp);
The kobject references protect the snapshot objects from being freed, 
but do not guarantee that the components remain in the firmware inventory.

For example, the snapshot can contain A and B, and activating A can 
remove B from the refreshed inventory. The reference keeps B allocated, 
but its sequence ID becomes `-1`. The subsequent PRIME call does not 
reject that invalid ID before issuing the SMC.

Could candidates be revalidated under `smc_lock` before issuing 
component operations? The check needs to cover activation retries too, 
since inventory can change between calls.
>> +        if (ret) {
>> +            pr_warn("LFA: LFA_PRIME failed for component %s\n",
>> +                kobject_name(&comp->kobj));
>> +            kobject_put(&comp->kobj);
>> +            continue;
>> +        }
>> +
>> +        ret = activate_fw_component(comp);
>> +        if (ret) {
>> +            pr_warn("LFA: LFA_ACTIVATE failed for component %s\n",
>> +                kobject_name(&comp->kobj));
>> +            kobject_put(&comp->kobj);
>> +            continue;
>> +        }
>> +
>> +        pr_info("%s: automatic activation succeeded\n",
>> +            kobject_name(&comp->kobj));
>> +        kobject_put(&comp->kobj);
>> +    }
>> +
>> +    kfree(all_comps);
>> +}
>> +
>> +#ifdef CONFIG_ACPI
>> +static void lfa_acpi_notify_handler(acpi_handle handle, u32 event, 
>> void *data)
>> +{
>> +    /* The spec explicitly mentions 0x80 only for the update event. */
>> +    if (event != 0x80)
>> +        return;
>> +
>> +    activate_pending_components();
>> +}
>> +
>> +static int lfa_register_acpi(struct device *dev)
>> +{
>> +    struct acpi_device *acpi_dev;
>> +    acpi_handle handle;
>> +    acpi_status status;
>> +
>> +    acpi_dev = acpi_dev_get_first_match_dev("ARML0003", NULL, -1);
>> +    if (!acpi_dev)
>> +        return -ENODEV;
>> +    handle = acpi_device_handle(acpi_dev);
>> +    if (!handle) {
>> +        acpi_dev_put(acpi_dev);
>> +        return -ENODEV;
>> +    }
>> +
>> +    /* Register notify handler that indicates LFA updates are 
>> available */
>> +    status = acpi_install_notify_handler(handle, ACPI_DEVICE_NOTIFY,
>> +                         lfa_acpi_notify_handler, NULL);
>> +    if (ACPI_FAILURE(status)) {
>> +        acpi_dev_put(acpi_dev);
>> +        return -EIO;
>> +    }
>> +
>> +    ACPI_COMPANION_SET(dev, acpi_dev);
>> +
>> +    return 0;
>> +}
>> +
>> +static void lfa_remove_acpi(struct device *dev)
>> +{
>> +    struct acpi_device *acpi_dev = ACPI_COMPANION(dev);
>> +    acpi_handle handle = acpi_device_handle(acpi_dev);
>> +
>> +    if (handle)
>> +        acpi_remove_notify_handler(handle,
>> +                       ACPI_DEVICE_NOTIFY,
>> +                       lfa_acpi_notify_handler);
>> +    acpi_dev_put(acpi_dev);
>> +}
>> +#else    /* !CONFIG_ACPI */
>> +static int lfa_register_acpi(struct device *dev)
>> +{
>> +    return -ENODEV;
>> +}
>> +
>> +static void lfa_remove_acpi(struct device *dev)
>> +{
>> +}
>> +#endif
>> +
>>   static bool lfa_smccc_has_all_functions(void)
>>   {
>>       struct arm_smccc_1_2_regs regs = { 0 }, res;
>> @@ -813,13 +946,32 @@ static int lfa_smccc_probe(struct 
>> arm_smccc_device *sdev)
>>       if (err != 0) {
>>           kset_unregister(lfa_kset);
>>           destroy_workqueue(fw_comps_update_wq);
>> +        return err;
>> +    }
>> +
>> +    if (!acpi_disabled) {
>> +        err = lfa_register_acpi(&sdev->dev);
>> +        if (!err)
>> +            pr_info("registered LFA ACPI notification\n");
>> +    }
>> +
>> +    /*
>> +     * An ACPI notification or an interrupt are optional, but we must
>> +     * handle errors that occurred during their setup.
>> +     */
>> +    if (err != -ENODEV) {
>
> On successful registration, err is zero, so this condition still 
> unregisters the inventory and destroys the workqueue before returning 
> success. Should it be:
>
> if (err && err != -ENODEV) {
>
>
> Regards,
>
> Nirmoy
>
>> +        kset_unregister(lfa_kset);
>> +        destroy_workqueue(fw_comps_update_wq);
>> +        return err;
>>       }
>>   -    return err;
>> +    return 0;
>>   }
>>     static void lfa_smccc_remove(struct arm_smccc_device *sdev)
>>   {
>> +    if (!acpi_disabled)
>> +        lfa_remove_acpi(&sdev->dev);
>>       clean_fw_components_tree();
>>       flush_workqueue(fw_comps_update_wq);
>>       destroy_workqueue(fw_comps_update_wq);

Regards,

Veda

