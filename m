Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794498416;
	b=OfxNM/M20Oak99fN3DNYJiwokiXS7lYHj8tORcfY87abIe6IiMdLwLMgXDxXR+xiXakm
	 P2mrnnbfL3UVN+AchsKrbs9P4cpdr9Ib08QcQhCFQnZCrQnN96RxYZO9ffbvNQ39vkhty
	 0HWYUMQ/lqknzrZmGJRrtrkAVERjpf6ij3h01r2q827xnfb4A1Fd0wyAb5uHv+lXj6LdZ
	 Hu0sOv3uDs4I7nz+EwjBsyHoGAsWvQf+7dGngMOAa5wQIthxyvtysnGWfz+XoxWIBp9JM
	 P1BGhmXkmKZN9Aov9JLnj9ojQRh8o1jIFTTreIWxDGwV72oehYXYoF8kMrirIa3b0Cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498416;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=G+xi2zq4wifTL3Z27TNx1a7rrb9h+NPDP51Jed5Yo1c=;
	b=csW0HYwI+xLSfeKevkS+mHDAdMyoHf0ro42kOh8arwQKuB/IBI0xr8m+OgJl1dmobpp7
	 HBMhCwicGyNpiK8dNbIZXdwTbF3kRyY15ZUbtDpExERFZ5JeSL7urFKIJSos+B5NIHUMV
	 t0NZfPelSQqge7w1D17Hv9Z0/xm99WJ38aTJQGhIv+t2/H6sjtIuqBj0+ayHOtvAXr5S7
	 EhiE6MOYWIyN0wiVvvkQKqw5mD58c3vaUF0wwy94OiWoFhiMGdmIlSO+lusrTmGWRzz0G
	 5Y2rscYQUwYpZxtSuWp3xKCr3WtEe+jvkRLeEdE4mi7CiKQ33xLOWddXeAvP8wmmUcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherry.de;
	spf=pass smtp.mailfrom=cherry.de;
	dkim=pass header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=J17DgXVJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.17
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EED606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49EED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=J17DgXVJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lt//TMAKQUjh9gc9h++PsfJTBw5m14WyECrnKzvFQz3BBTZ+EABf4Fkgi6wFtpGIsfQ6sgBDEJ33gckMp4ECRxlVzCsm4v3eo1z2ZQAXqqppaezyT9s+ccUXFRQc0bqhaRF/UzMz6zbsoTx2YNnZq5a3TAQ/Jf0MuMf94EsbqM5xmbDu2b2b9FQKnRO4I8wzfJRHriY/HwePdH911XWGP8cwwM29HIsr4k37rh4PzTYplpK1FxBc2I6KH9V2BmS02F3fwyQMvtwJEfIlDQ/0g7BjRQTOTbKxxFUnPTXcgSt8GR3cCRqOz37GOUNxCnHAODjpqPeeQ7t907KMXsjWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+xi2zq4wifTL3Z27TNx1a7rrb9h+NPDP51Jed5Yo1c=;
 b=ib5vKHICxMlHcx2tZDzrZO2WGiD47cSlw9FH6KGcL/mL4ssQKuDhp+NtbHu+SZco+lnSGTj1EAC2MDjXZ7JU34mVa0ICQUIFnyTlO456GlJZBcWqu46H9E/dnPZFKka2Ma+bGcl0ebVovvGxNBBqwUEZRkNThBACZiWHe6dgaG5MpEny/5jyFq+9/Yi5SFyarAEdPwmLV7sA+Hf3iSCQJ153e8bCQvLmU54zywL1FCzuYbcW01i0estqK8YaFTHVnBsB+tuwbA0+pQ5QSOusWrSwRbhsu6gKiEAbYRAWH0XSGkrLr0gydzrAKvtNkxkIpm02Eq0bx0bYxZhmHOQcTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+xi2zq4wifTL3Z27TNx1a7rrb9h+NPDP51Jed5Yo1c=;
 b=J17DgXVJ46diOks99a7YycBjQTm/p/f4h7dgWMr0ROIvUu5q4tkRuKKYoe29JyR6cefZS0fw0y1ZJQITrbJPX8jQf6IboVXgR/8oaIzYmYzIyLKrv0xv+VTB8hNlmdTYQh3IJ0KHkcy80Z2sfAK7AhDzxvxgBAmNreZAUH73xuU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12016.eurprd04.prod.outlook.com (2603:10a6:150:335::6)
 by AM0PR04MB6962.eurprd04.prod.outlook.com (2603:10a6:208:188::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 15:46:49 +0000
Received: from GVXPR04MB12016.eurprd04.prod.outlook.com
 ([fe80::f2d4:9db8:9a4e:b0bd]) by GVXPR04MB12016.eurprd04.prod.outlook.com
 ([fe80::f2d4:9db8:9a4e:b0bd%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 15:46:49 +0000
Message-ID: <ae532396-557b-4a0b-b13c-920a971962b8@cherry.de>
Date: Thu, 12 Nov 2026 16:46:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] phy: rockchip: inno-usb2: ensure PHY is running
 when clock is requested
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 William Wu <william.wu@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com
References: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
Content-Language: en-US
From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
Autocrypt: addr=jakob.unterwurzacher@cherry.de; keydata=
 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
 ldPHIqbIwpfecQ==
In-Reply-To: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0225.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::46) To GVXPR04MB12016.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: GVXPR04MB12016:EE_|AM0PR04MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 75097006-3097-4068-5c27-08df40d429fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|22082099003|18002099003|261009223027099003|11063799006|56012099006|261022075727099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	8jlaGJNI9aequ0mpbH3O637UyMufKy55a6kPxqp30PNAbmvcR++ydOkHEPLVNRbIOSwDfnor8iUPhSO86vPtIr0wJz+d2BLpANEzVVNVa9ZYaLNWo6CLCgRpMVdgHXHTPWopSyxt8QIkA6baQ8fdQWpv/s6RXKDYT7BjxHlIvDPejtMELlZqzyH7eSiqJFRBRCWCyWadUI0E6qclq1sAtN/jW2fOgY0EJkRnwLQb5IGzz7YX++io8mSr4lM0SBUJQU7Uoase/F52l/T7MW3WtPVKvHDiKOO3vbLlX1DdJf0ax8ZcMeebZh09vcHW6gDb9hbgaLid9iXPY3YMPXvVKTTjLVxHXL/B78H1jOpNnJWg5r/cBRWAqJzhOAGz4sq5YyzPp+kglIKW6seHv1k3G7gI0gfGidGuBp8xDbdNU91KgD4Dmvw6+vXu5Gt7xQ7OYmwxNX7O8tX0xCGRLv6LbXno7FXUuTboSmP6B9KWrbdcX5tPZAM87uad5GuP4JDUK0Oy7SHoC1+q+NEk/ezgYqNwj8qVfSyYQmZz6LESp+5mgRG0CFPgxqUkRS7EH1+dJzN0XFxyuVejhHhiHWFsIbGszPGYweEggMnvL4HmVb0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12016.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261022075727099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2xmb0dMc0dNUFNyTHRXUWFPTElOZzM2KzErYnprWWkzTmtUcjRNaXlPbHZ0?=
 =?utf-8?B?TTJtRm00V0tCL3I3YWhTQ093c1IvUDM0WEcvRnVGdXprSnZLK0JqS251Rm1B?=
 =?utf-8?B?b2dBU1FueDFSd1pVdGNMcElWZVY1Y0Z5Z24xeXpkeDdvbkRQSWkyMmpXQ2tZ?=
 =?utf-8?B?OHU2ODNQQmJXdDBFQUZ5YWNoMS9IUTIwTWUxVVZQTVB4aHVweWJDM2QzZmE5?=
 =?utf-8?B?OHNDRXJ1aVlqZGEyK0tjRDFrSFVteEFpcXhWTmtibjBkMUFqTFV5RjRsZS9Y?=
 =?utf-8?B?d3JnQWJsNVNvUlFjWDcvUHJ5M1NOQzhFK1d0cmlGUXRDUTVCWml6dDNUdytI?=
 =?utf-8?B?VXlsVVhnTWpIZWMrNkxIMGQ0NWdPUy8wSE56cFVxbFlRcGtCVnE4V3JBZTd0?=
 =?utf-8?B?WWFXQkdiTTVRK0NmaU9tYUNxcFhiTlZ5WFVicVVNV253Q1VnSzFIb3dVVkpq?=
 =?utf-8?B?NGtWd1pqQlJjSVlYZVZmZlNEdnJ6NVhheDRhVTdtQlI0RDVtQWljRlUraU9Q?=
 =?utf-8?B?Q0tvcTkyWmhGWW9xY2lOMnBjZldWd0xQK1pUM1JEcGY4N0RmckpNamx4Qjdm?=
 =?utf-8?B?WjZoUmp6QkRySmRLR0FoZWFGRFFQb0wxZE84aGxnd2dxRWIxVWpzTDRKVW8z?=
 =?utf-8?B?TXNKbHMzak40VWJmYStEMklINEhSZDNlbDZmbFBEUkQvZnd1Ty90ZzR4SEN5?=
 =?utf-8?B?dWIrTmZoNHNrMUVxZElONXVGeTVsT0ZxWVNSeGZYNEpPdVJZTE5wQjJ3ZHlm?=
 =?utf-8?B?QzViZi9XQlNJcjlMVXdYYlF3QlN3Z0VJVWlHTzJzaDgzZUMvTVBKelhxODVp?=
 =?utf-8?B?ZnlNdTZpOXo3ODlnNFBRZlV2Q0F2dWdNZ2hNVjB1MzRWRGFMQ0FJMXB0alpl?=
 =?utf-8?B?WVdlUHMvMjBSTVZuVEZjbjY5cTY4V3huMEhRT2NEVFBUR2NtbENRd1hpSCt3?=
 =?utf-8?B?Mm1oTG9KSG9yT243bUM4NjVmQWNmODZsL2FoTmMxMG50bDhINHVDYnhPMzhH?=
 =?utf-8?B?WjY2WFhPQXgyb042MklQWndQTTBRc0QvM1AvUWZZejQzZWhGTSt3ZXpZcTcz?=
 =?utf-8?B?R1VDZUZ6TnRkWFA4M3g3alJrdURPVnJqc04wbjlZK2wxU3BlL1BxMDN2RFJY?=
 =?utf-8?B?VTQyRk1maUlITVpTZTdGczdHM1d0M2ZIMHRuaTIrWDdVSHQ3WDBqSUJYOTlY?=
 =?utf-8?B?cUpEWmp5Wi90eFN5SDZlYlNrVndlTUExV2xwZGxYYWVUanNUVTA2OFg1QUhj?=
 =?utf-8?B?cUtMbXlPampBTVFHYWQ0SHJETE9Kb3FTNDdGTk9TdTRYL0VwSWRjYjNoeFBz?=
 =?utf-8?B?dDNudy9zWlIvNFBMK2svdVgwTzc2UlNKZVlFWXVtcHBWN29rRFQrN2hITkti?=
 =?utf-8?B?U01WdXVYSC9HZnc5a0c4K3dPOXZDRjk1bW5YQnp3VExnSC8yODQzQ0kvL21J?=
 =?utf-8?B?YVhIWXhQZGpPVnRncHM5dTdHM1VsM1ZPcUl5L3VUTHBiY1RXa0pMWDgzTlBp?=
 =?utf-8?B?UWpwVTAxK2VnSHhNZCtkZG1xc09Fa2J1VEJSb0NrejA0V05aNnhxaW9WTVlU?=
 =?utf-8?B?VHR3MG1yYVIwRmhGMm1YMXNoRm1sZ1VXMnBJaW1jdkVoV0ZOUzdhOVV0dHpH?=
 =?utf-8?B?amRsV2pQZlh5K2NYMzc5MXowVnhaaWk5RFZhZE1jeWVyR3BIdWxFVmkrYUNl?=
 =?utf-8?B?Z3RVQzduVm5lZTlVS0NLdHFlVjdDdzNQZVgyYjlKVFVGcjFNOVhobmNPZ0JI?=
 =?utf-8?B?bWRDU0RXcHNQZUVVZXlMRjhzV3crUG9ISnd0WWpPaFpNbi8wYktXZnprL2dm?=
 =?utf-8?B?aldQT0ZBR1lVMjBDNXRYdEQwVFZETGhqVmJOV25DZHliallqUlhZRW9sbjRG?=
 =?utf-8?B?eklLQ0dNQ21LMGRPd0podTluSmhoVnlwZDdZY2V5emc1NUVEa2owZ2Q3TmZ2?=
 =?utf-8?B?TzlKNnNzb3VuYm9EdHFRVHJGQkZkdFlZS3lOSnE0a0JKa0J3SE91Qlh4d0RK?=
 =?utf-8?B?TkJGYlEwOE1pbG0ySVVrc3o5eWdTbXM0ZmFsa0h5YVlEU3R2VUZBVVJOelhS?=
 =?utf-8?B?YnZuTDBFcnpuM3p0UlBvTXZMVVFVUFVvT3U2MGlBRFJna25tN2Z6djV4VHRB?=
 =?utf-8?B?cE41eUppcm5kMWZFcXY4MmFsUXlNTzkxa2NsdHVPLy94RnN2V2dhcWFkNWw0?=
 =?utf-8?B?UVd0ZGFVN1c3OHRQd3dsSFBhS0FIQUsxaFl4ZGxwdlBreXNTRlI4MHVSeHpl?=
 =?utf-8?B?R055Rjg5WG5TRDRUWFRnTWUxMHlhRGt3WnVZRWlzc1ZnRUdMbmVDbDFmMzI5?=
 =?utf-8?B?cFJvSTRDZzJVNUs2bDlOZC9tazZGRDRpTGVmL3VLZzhFaXBqYVo5eUg1bWo0?=
 =?utf-8?Q?t3bROUd9ukSI0Ue8=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 75097006-3097-4068-5c27-08df40d429fd
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12016.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 15:46:49.3301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xxh3BUPFM70a4M6PscSWbswdZmdIZv04kDVjyrVmVY6xlSh94phNnXI3tJrxK6cw8qgc/DgnCEghhoFpKWlM603NPMXOCxG0Dymv9CdRTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6962

On 11/10/26 18:19, Sebastian Reichel wrote:
> This was noticed on RK3588 EVB1 when resuming from system suspend. This
> is technically a fix, but its unclear when the bug was introduced and
> system suspend is broken on RK3588 for quite a while and not just due
> to this problem. So I think this fix can be merged the normal way via
> linux-next.
I tested this on a rk3588-tiger and it fixed the usb-related hang I saw 
in suspend/resume!

Thank you!

Just for posterity, this was the hack I had in place before, which I 
could now drop:
https://git.embedded.cherry.de/tiger-linux.git/commit/?id=c6467bf3bec2c70d563e712ac9bd0efe81fe8941

Tested-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

Best regards,
Jakob
