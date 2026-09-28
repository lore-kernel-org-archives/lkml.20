Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6E5490BF6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588829; cv=fail; b=lizfjjg0wmRo+lO/tKnzUlZc39Lnw3shdnPHgZc+BVvsOArnM/E5RR/kl31JsxtxfAZDJYvOOt8qTsERivBIrkqipV5PVhxb3JqkAKu3iCIyD0i9igr3N5emWJy20FL70S1+Biiz99lYz0i2VYFJA6ZAloDMlfEaOw0Mfi+rMNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588829; c=relaxed/simple;
	bh=B2hHOXew9e1m1DeB/a2Fzc8t7gOuBx1b2u3yQz4Y6pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rFZGZOAmt/i9DIAB0AfAUSDn/rP9+NmHoKUUuGMuyHmLs34qWFxGfpWbZCLW4jy8TF0KW/r91hIKTbkiJWn6S0FcE6wfAcAz2BnY2DLrASM2rHr8jJAGVFVZUVmcfIbEuNa4AjuKtP4l9ylMUvRp/aFFvpvXB2HCT23Z9RkMF04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=BFChl6t1; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=VgGZhnKY; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="BFChl6t1";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="VgGZhnKY"
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9JDoQ744001;
	Mon, 28 Sep 2026 11:46:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=270620241; bh=lDlvDXAU4++UrbNARKk2Z+oH
	bqI+PeGLb76VdQqkbtQ=; b=BFChl6t1CGuSCbrMtHVv1ubnrQuckgbnGMuS1ngq
	btWsiRPQ6mLQ6V5xZDpsvq0Oo1+JsoDX+8IJJQVZ3AjfTnreQWqZirqPirWXxV8B
	3sf0mjHmUgdclvQHCPr5ezYMQIRFS5VAcmWqYxiYHadKuRMHGOIJ+IoTNNorvjnH
	vAJqS/hAEybcGaH+fuaDJSsL4sKS9yzbnZV6gfgKTpfnv/FAGle/81JKG5VKlFn8
	DbOT/ozq300AgQLaw7xEHFfDUJsB+3ZkxCdUdXNGvLqqMc15zBaL0mTl9uNpxr0i
	YyxDREFcfULppKhTTjmB1m0KJGzB7KuaWXfnmkXO16QehQ==
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11021095.outbound.protection.outlook.com [52.101.65.95])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4gx221sxjh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 11:46:40 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umt7pbGI+ooA11n37pnv0dM5zkC66zlDKKVbIlQr07KOAUDsM4Ta2qhUOlbWBGSWFWAEHZVmuyS3F+V76S5HDZjZUCleSg/r7tsJ4rdxCeik/8AsRZeM3IT8Bn8AhfoSYKf/pZ1ytU5rE1B1UpVbsTfgl8LJgAb9x+q5mbwvvndupfjnzGY1ziXbiFskwKPcxOcntoILw3bccIno8VjNCPPvO4rgpnpyrq3G9ULlHnCYJDfKopDsXJt25kX7tOCV0t0GLC8ZXzz22r/1gEh49rMYHdrN7DJtVBfxCeaH/+G7hhrm0gO24xm7H6zYEpHMy23RqfYz2VtV0BK6q6zujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDlvDXAU4++UrbNARKk2Z+oHbqI+PeGLb76VdQqkbtQ=;
 b=TX7VMm6BX255IwRteXpbb1h63pX8GmqjFrJ9Hv/qctC31dJziDzr63AFPT/+2DSpefx2Oc50hMgGBi8pTvxss/A1W64sODE6vfvraTHPgKLVE/n5GizJhzd7T8Tug2oyqW2gBlCHFwS+a7kdPI9wRMDk9ZyfY2VEM96Bw4cAS4JtrFX4IQfe19o7z16XJJOjSVTgcITFU1mixZORRg71WH7hGE/ZgmMRbV74g0XTDNxaKB/AQGYPPTUAJsYmR58AmKioQC5SISPDP8fPn9XlKmJ1Vms0eLvR5jZYl4lpyo7ix4FPur2wWxU5GeO6nQQX8o58Pd5Q6oWZFAEJmte1Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDlvDXAU4++UrbNARKk2Z+oHbqI+PeGLb76VdQqkbtQ=;
 b=VgGZhnKYCwd3Ypf2z5ojzIjizG36DlCZ1+ltGYateD4aIZkdmc2PQ6sBcfW6Tye8Rn8lVuHnFYuvdffmjbrj0rjgy3ceWEZcwRlo0UJ1nJE5u2lWwl1sloiDtK4EZ8AqyMZjj7tOQxQNDN+Q4GQbyi+ik33A01arJYaVqRX46VQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by PAWP192MB2227.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:35d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 09:46:36 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 09:46:36 +0000
Date: Mon, 28 Sep 2026 11:46:31 +0200
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Jouni Malinen <j@w1.fi>,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        hostap@lists.infradead.org
Subject: Re: ath11k: Question about active scanning of DFS channels
Message-ID: <aro3d5KKTN-Jq2P9@FUE-ALEWI-WINX>
References: <arZ-gEnmv0QyuGI0@FUE-ALEWI-WINX>
 <3ea7e9ab-ed3a-4e6a-9006-b6f6af51c1fd@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ea7e9ab-ed3a-4e6a-9006-b6f6af51c1fd@oss.qualcomm.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: MM0P280CA0057.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::17) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|PAWP192MB2227:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f60b7fd-8708-499a-ad41-08df1d456343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|6133799003|3023799007|18002099003|22082099003|5023799004|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	AI3ORp8wGbSJn0ee904rJDyvKv4aZRNtDWS/fudEl7bCdOFkPtwhfjNRWKbM5rKM1q/OsWuRufSm7UiZUkVPC3q65X0AfTD+7tF8iuiOm5LjM6r+vCIKrg+56x3JR7cgOcY0ta/zw0PH4ERs+FNnCiOl4/gkZ+NqNCiUl7mHdKssABOSAUnr/+LgsYm4AKR+Q+NiLl5Vu6xsHHf4z+oBq1RHkdA+kOkU3uGjJniClr0nqOXzuDwuiS0e8bqvky7N89CO//MNf6tefoGdrI6jbpKJk0fXbAtojo40/U8pavmXBvLhb1WcSvXzlJp/yICDsI6dKjpS8Ic4jBN03gVzq8yzStkCgSV1dDz/SwzQBqISI8V4wTT7FL+/cil1y4V8unnhNVZwnPpkxm3RjdN5vu/i07wIJ5cd8KJkvT6ReYOfjm12Vr39TrkhIythOkbsNIIuInYZHY6js6qBHEPayEz+bWl2l8IKzQmbNy86LMO28O9iCe3Wnpg78ZhzS5Ibc3XEkLBXOkw0D0SPpiJQGlgsMhnrc1HNZkcRmEgC4DUsy3h737b1I1UiyEmSkpKod3kPBDqWgreEAEW5sJ/JRl82yAAHVwdBr/nM6s4DftHZFPuv6Sl5G+XNvPsPe0/yEPyQfFIhDthSmqHIBwUtKJ7ja+0p4a2nJ4hFKXUQa7E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(5023799004)(4143699003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nOb/rmhHX00RloEKuqh7v69wnk9+TNJvQjXRvAF00Y1OHC9AZ0QwoIh24kAm?=
 =?us-ascii?Q?yKk003dLyi/kKlM13R4NdOhLMlqJsXbPDkI14JnOzx5VvXH1Am+f6CQu1kdt?=
 =?us-ascii?Q?rfY6KQMVDSCtzX8zdbVeAHpOLEDIb3AZdeMvEEGaYBwJUaE+uk/cSGU8mF44?=
 =?us-ascii?Q?C0b6QBJfpoMVMxFpqhi78QK5Qg3g386oDtnt02YJaWTqWboaWSnzJ22J6PT6?=
 =?us-ascii?Q?eLeMMI+wCPfNOS5J11SYMnU+hlwDa8aFknd2xTasCYjFBxAsVHfIqKFjttEb?=
 =?us-ascii?Q?lJlhh2AFew3GhK8zXl8DX1mPVpPh2rHiuFufE0lqq8Xyf8KSlG6w1XJUY1oK?=
 =?us-ascii?Q?lK00JtZHL+wVMCNdaxHJe4Je2igYKAEUKA467s0XNdG3vszwMYd9RsBzpIuZ?=
 =?us-ascii?Q?KN2o5ItEtGCmNdniqE+s9+IzYkGj1NB9csosDeIsdEitIM9PH7XxmKJ63OR8?=
 =?us-ascii?Q?VpOTqOEinbCA+13TBCKLvI7NVi402zSwd7WFZnv+2lZG5m0XwA8tc20KaDyv?=
 =?us-ascii?Q?lTtS57KgD2hxqX0nsDkTCdFFfC+3/FqHkAWngL70Wb3NHoQNSI/GO6a4uIgn?=
 =?us-ascii?Q?HkoPiJS4dQo9vj7ELMsjmL+pUu2XYiBti/6KDO3TieI55tqzgJ3Ppd/B3TBo?=
 =?us-ascii?Q?FGB1fs+uyXlTXvnUyoSCPQP8CG7k6PBgoiduJxIXgpsKmqwfHzc61coS6mQY?=
 =?us-ascii?Q?IfDtpgbs2FYuInyMVYgIl4FY/YbbF2Rle0geEzmYBaBjSG7iGmnxuYp5IDLO?=
 =?us-ascii?Q?VJ7SV0phz5C8NmdPuUfbCcCRn3gtQRUu6tOz1srl/VRoy+cYnf3bWKQV9ZZZ?=
 =?us-ascii?Q?yiMDIx+lMh0gudpfmMe+5WWipfAFufdfBjR0oGX20Kub5s8KcLbagFh350jn?=
 =?us-ascii?Q?Y9R+5dzWMLqwXf2ooa0b1FjlD+fYsv+jsICj8/uE9SWBpzXkwTKktAnG0Jxd?=
 =?us-ascii?Q?4JD47X+ZgZ9PBJs+zSXyPcKQfhnLLCz5z81RD69t/zC9rr0DLfKBpQxsVwQ0?=
 =?us-ascii?Q?TMpk4w3h9Vsqyjt55ukZPDcmJ5WKM8xuluC0rbR8UZMMAz9jmzNm8c5srq/B?=
 =?us-ascii?Q?FQGgC+SuJkuM8lITK6b09cMpDqx6zFsgCW5S4X/jgTE0h6kYYYSmSA6Ii2fy?=
 =?us-ascii?Q?XDYiBvHAWWMVvVH7yE6Tf4MJ8I6x03G3cNlT7dSydciNCKZovzjfbR/tCYK/?=
 =?us-ascii?Q?yv9QUrQym1Dxal9ZazLcsoyPxRJC9yjtfTG7t4Am6FO36VMi7Fo5857Y9uxr?=
 =?us-ascii?Q?5r/dyP2gDuERyIPcSWCcPWkwimfuTPxl2o5DkyNhyibEzl+wQ25ZYt37uBdJ?=
 =?us-ascii?Q?z8zJH15S4B9cHuT/O1lnGFkWammSJanP2AheVMmCEVthD5Ja6VFlD5g/BCSl?=
 =?us-ascii?Q?fATpzt03Wuya+VCYIGXB651Of+5Pk7G9vtBdD7KTvG+dHoXEfyBMEPCERfSb?=
 =?us-ascii?Q?W3A0CkTCE7Ccqi9JRW4Bni6eIfOgzr7c4UBLjhx7ko3um6sPok6T/N88lyez?=
 =?us-ascii?Q?TPIEbWnLvMuo08Sy1LWqds5jqppXGYG9rNeTrTVN73y3T1eBgRUmm4fJ3XEP?=
 =?us-ascii?Q?wIHrRAua/V0SR8O1I6+qUlx1XQfloU+8Fzs8l+bhyTfXlbVdkWH/wYEaPeF9?=
 =?us-ascii?Q?YYOyFa6irJ3OnYeJG6nPz5M9JiweR+cuDEKUouk74thm7j3Kf4xR4o/4UE+o?=
 =?us-ascii?Q?EWnpW7aarn5n7Nf9VpRda3G+caSsSemLwyes6C6JeIOSCf7yenV0HyirYwx6?=
 =?us-ascii?Q?20ui6nE8MQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	uyMJpUfomx02EPdvyKqNzqjVijHMdfrUBf2LLSwn7uods2eAouRMdi71DS5EPY8hfRaUzj/KJ7OkFGV5BseKJrnLV/7kxucWYO08/TILI0w2hAspNjygsQ1OLbH8fdQnivNbcR7JhANvuoJlpLPx75vuEH3hAFj6e2jK6tEUoGiNT4NXkfv9l/WFKUehvYdS+aECDQstEKAsVM9xWQlgaw6GfXGA2FusZmI+zLX/i3Uor6ekaMIFqG82hIM5o1lqvehLrmOhE/YFQVacrWY2JDAYd8VENqoebW+Sjp7DkHUz8P0FVKJxfUbRH4ZLtUXF5G6a33k+AsUA3yHpx3pd7A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sC9hiCscycxlSEM+/MqkSTNICRLqXlewPiZpibzLyPcI7Gj6nNA7L2hPJ3F++SWSyjRB3qVyLmi8umt4NPR6bgNjf+Aideq4LnBNxQWPeAN9LEM8AWfUKPheYSz4jAwL2rOb6DUbxEMBGiIpatJzMdmnUo4pCLlUku2TeSoB+49Ikqe06NWNndXMuW2rp7pyz07Uwqx8y+mympiKyjN97A+54uJJhDQsPf5ig6JhQ5T0Rwo1svI3INtGWlV8iVwZPKO92hORR8jfyKClkJz4ABdTf1EexQ2NmJv63YBQZOa5NYbsm6+OfFGasyLmVsxsi0NFxI7yUnVAGpcrCabsfoV/1rck4aSuK33It5/VXfYxyljq8uqGN76Lx9XB4pvnz00dgT9vXztPlaFKPBXVkVzkZKC/KuVgOZDhsNNDZMJE6ypAmIuet+2xQQp1nQA0TrghpOk7puPbtgwRP8PZM+w3dEwaHwylpGvW3ZPInG+S2t2baKR2y4R6khF9evCm73lgG0oF85lyL2bepWzUwGuLNVOAEryYb4DuNJMNgTEw9xEqtV9dmphf8TTTarJLU1KLawxc3A4Omq6ch46Tyo15nHvReUawlAPsBPH4MbeH4pZ9r2is/bzWfL3+ebhK
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f60b7fd-8708-499a-ad41-08df1d456343
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:46:36.6184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5WHPYM8gDKlTgjNKiJ2e5dd86HLihS01D7ALgjHaCwuTzZ02K6Jul05Cr9oq79QHh1YP3G1BXwI20XnP6AJEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP192MB2227
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: PAWP192MB2227.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: jiZRPJ1rM3--CDF9-grZiz2DWMeGnXUy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX3QeIAT+gHjv8
 54XyhioOMFYY/6QsGl6WYc7YeRacOWSLpzA+gu70pbvOG96X9VpvAaF9V3Eukxd6EpwFGhDgZU8
 D7i91JQ+T1XmHHZq/2hBh07EhAhGoas=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX1/4Tv7kFd/TV
 2oxizimyewkdMoD6qRZbOyUkbpxMLbUPkQ0bgv2x+HBvZBoaM3RYqLhYi35M3cft7GBopp5nn1H
 1EoG4G9alD94PGlgS18dkRXaEM0gG2qP5vHmOOyW9Zwg5WSmIdU3Qz81GTtoJSMlpnWKA4x7Zt6
 fxC2M93RLaqZtpabh+3jKdGMV6YZETQelSgjzx0KPZGzTDPXkkcZpYOPn5hgisx6v02OWei/Zjc
 yzvkdXg7s9IJsIfzS0wAtz5wNgGa2i0Ml2w1CiciRRnFO+7ZJSyrolDmukh9sKPNmF6T0+sBmU0
 GhcnYwCxXo3I2swVhxF/vVfImZTajdduQ3mIrLYomteXA+92OQDx/wYNKUaPE3IN4udtmowc2cB
 xT+PRxmRmq8wcswBoe1Qk2vWAXRoYVn0M5eRPEq4B8HEi+zGoKgEzjSjPCBsXHYpz+aRTwF8kgx
 pBUBsnq0i1l6pcuNYpg==
X-Authority-Analysis: v=2.4 cv=HcqB3SE8 c=1 sm=1 tr=0 ts=6aba3780 cx=c_pps
 a=MH8iu8xc9gZ8Vt1Au717Nw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=WQ4YJ39tjzx_Hbm9pN5v:22
 a=_iaupFLGlJWE5yhuUN4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: jiZRPJ1rM3--CDF9-grZiz2DWMeGnXUy

On Fri, Sep 25, 2026 at 08:03:16AM -0700, Jeff Johnson wrote:
> On 9/25/2026 7:00 AM, Alexander Wilhelm wrote:
> > Based on my research, DFS channels cannot be scanned passively, so I used a
> > sniffer to verify that the "directed" probe requests with given SSID were
> > actually being transmitted.
> 
> In general that isn't correct.
> 
> For starters, everything related to DFS is gated by regulatory rules. So the
> operation of the client device first depends upon whether it is configured for
> operation in a given country, or if it is configured for World Mode.
> 
> If configured for World Mode, then initially DFS channels can only be scanned
> passively. A client device in World Mode must not transmit on a DFS channel
> unless under the control of a master device. To do otherwise violates
> regulatory rules in many countries. So the normal process is to perform
> passive scan on DFS channels and process Country elements in Beacon frames in
> order to determine the country in which the client is operating (aka perform
> an 802.11d scan). Then the client can switch from World behavior to
> country-specific behavior.
> 
> But even when operating in country-specific mode, whether by the initial
> configuration or by processing Country elements, a client cannot transmit on a
> DFS channel unless it is under control of a master device. If a client
> receives a beacon on a DFS channel, then that channel is considered to be
> under control of the master device that sent the beacon, and only at that
> point can a client device actively probe/authenticate/associate.
> 
> Further complicating the issue is that some regulatory bodies have rules that
> govern under what conditions Country elements can be used to determine the
> current operating country. In particular, the FCC has rules which require a
> device to maintain all FCC restrictions unless multiple criteria are met (I
> don't remember the exact rules but seem to remember that at a minimum there
> cannot be any master devices sending beacons with US Country elements and
> there must be multiple master devices sending beacons with the same non-US
> Country element before the device can be consider to be located in that non-US
> country.

Hello Jeff,

Thanks for the detailed explanation of the DFS/regulatory background. I think
that part is fine in my setup: the device is in country mode (DE), a beacon is
received on the DFS channel first, and only then the directed probe request is
sent, so the regulatory gating works as you describe.

My actual problem is one step later: the directed probe request is sent and the
hidden AP does answer with a unicast probe response (both confirmed with a
sniffer), but with the ath11k driver defaults (n_probes=0) the AP never shows up
in scan_results.

The only thing that fixed it was retrying the probe in ath11k
(ath11k_wmi_start_scan_init):

    -   arg->repeat_probe_time = 0;
    +   arg->repeat_probe_time = 50;
    +   arg->n_probes = 2;

What made me think this is the relevant difference: ath10k hardcodes
num_probes=3 in the TLV start-scan command (wmi-tlv.c), while ath11k
leaves n_probes=0 by default. So ath10k always sends 3 directed probes
per channel and ath11k sends the minimum.

Is the n_probes=0 default in ath11k intentional? And why is a single
received probe response not turned into a scan_results entry, so that
only a retry makes the hidden AP appear? Is setting n_probes the right
fix here, or is there a preferred wpa_supplicant-side setting?


Best regards
Alexander Wilhelm
