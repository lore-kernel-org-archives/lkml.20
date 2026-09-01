Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E07F30F924
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261781; cv=fail; b=jCAL4kmB+G6+NBRwHAENBVC77P7lRAXHT4auEakDG26gviMqi7Jj1Mg4gThm7meUd/FeM900fYJ2iIR+BTnWTMb7LzlIVgXAkA49HiVbtAlciVIJYJqJLPqTCoX/u0w0kg3VDSd5ZshxcOAje6uHWWQLcc5K3Vs2rdultDb0stc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261781; c=relaxed/simple;
	bh=iTxSRVVgPyO9fv2M7vDu2ZiYynXVS1lPJN6NeF49Tws=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jOOrDmZwjGfe3M/GOHOl1DRdcyi5ydAtHJ4ZWA7YI8X6YH7+h0nBnHAqG5eT8JqDSRjrqT6hWTDfGk2mlmm+xoXUOYhKTXY6WDHlwhm86yJMe2gD8+M+tRUuKaVlMOTHJX4PsWoeFUEvF4FGOyOLroy/o3gLdfrkp6HC2PV2Gsg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nMZscLZE; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nMZscLZE; arc=fail smtp.client-ip=40.107.162.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nMZscLZE";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nMZscLZE"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hamJ8dLw8EUQ5wrrpzmpMKzeaV3vBSPYvGUBOyoC+oEwJB1UHYdOq5DqqktFXfLsFfiDisFyXwu4/YTK4EQRPIVfIv3uabxf3tUgjj6pFVRDaRBhzIdQzLeh+XHU8DoO020N/+WJyLtuGAIR94gOjTgW1MibwHs2qy9iTuw6lgNBP2NwwA4wkg6PjzB+h8llD9PQzbFFg63OPinJaUCWDjKNhlb5QoncMBI5gqgXaUbhW62XOxEgn8WPQF38QvrDYhT+TC1KoBM5FjzLUq7R/Mbg5qcjrcVir//1EMXCHvyD2jN1v2VU3DashJnkcAdeemXJDgCV2SQfdRcd3KGuvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StFAYWQF4wusuPIufLwWXJ29iSTLjcqX+fJORRMjcdY=;
 b=bxfgB0wjzTPJbXi5jTTFbaioxLaftnDr3SUH1/Ts5jlCDRt1lWSk+V5TlumUr5sOMV3x1nAnLPpItRI/Z4c7G5gPreMbJqabCQMM2brM0Xql+DyJ9PShuvLvv0DWAKeMr6FwpqRF964+EfeFo9Z9IUKhOqU9wWS3MU3CoTifboUxUyPIOf/Du15hnSOg1zImSVOL0ZMONoem4ftXRcL12HGKs+kgJHPAYuym6d/WiRwZbarCv+b7d1GXiWKCHKnHrDJfRRYG1x7HfW0Vj42iDWOXHPXfxijh+n/FrRybmi+2x8fHMFcdvUTz0bMGob8TzW/MzWful3JYUIPZBvfB2Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StFAYWQF4wusuPIufLwWXJ29iSTLjcqX+fJORRMjcdY=;
 b=nMZscLZEiKAbxY+VcQSSi7Q4SIgL2v+44YQaPya29ngf2aIJg0U+Aox/+BQdHKtpRv8KjX1krGrOtwwjkxF9CdYMbD5AfLhhtMaw4eP/hnsFvLegLlt0K2YzWBBnnQCSLmUQQBpKyXMMsmadVAD5J7vEGElojpq7Xw6wSHinrVU=
Received: from DU2PR04CA0279.eurprd04.prod.outlook.com (2603:10a6:10:28c::14)
 by VI1PR08MB5519.eurprd08.prod.outlook.com (2603:10a6:803:133::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 11:22:51 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::9f) by DU2PR04CA0279.outlook.office365.com
 (2603:10a6:10:28c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 11:22:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Tue, 1 Sep 2026 11:22:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nlkij7ZFyooLyHSDA9rvokigevIhy0hm5yAmTYRcy/CpTQkOwqSsF5Ts5xK9qnLNEPcVuX2efnnChp6PN4MYsPLZv7kYfH4+/1mtQqFJWL+PDnd1WP9F5pSlLpiGN5dBaI15IP8+LP8F0/JFVft6AcKZdoKKYwShoQqaAw9riAwsqEWxc/4SWDvuyH+JTqGelRQyqgZ+lsAiuYT5V33fen/pCwvmbcUG99x5EawYICUGOhTJbR/TYC2X649mT3yMaLiGRFK4Omx8SD2IeaDMsj6q4DXth7PBqGcUYCNxYiSOhXlAxDHnWBL66L4eZmpEPiZ7EjF0QudHnt6Boz9wGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StFAYWQF4wusuPIufLwWXJ29iSTLjcqX+fJORRMjcdY=;
 b=vqVT2tH1WyxkFE8HwHZFoBuU2Naj1bBcksoGnEfzK2Uix8xqw3D9Cl8NtO907ueQa0M/+9ztIdU3L/NPv/7RpWnht2sNfjEcBL/y0UpAHqmPXNu04NRpoaHy6YLU3mrgtEZI8G4LBKL9nOu5qFwFs9q37Ar+5LxE8/k+ZU5lFZYsgHUaRCmu8cF9Q7nubru7QA8/HJOomnWYi1oAp7nveQlqVNSrw6aFrauaas/wdRYdpDe9r1HTFoDjXIekpJVP+4cb68pjon4Q5iCh8VuzOEs8ZZ8lGJrKVte+PteldFJno8X4UQNP8PBfnBUPBkT/XHLssaYmNBtj8G+eSRzJ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StFAYWQF4wusuPIufLwWXJ29iSTLjcqX+fJORRMjcdY=;
 b=nMZscLZEiKAbxY+VcQSSi7Q4SIgL2v+44YQaPya29ngf2aIJg0U+Aox/+BQdHKtpRv8KjX1krGrOtwwjkxF9CdYMbD5AfLhhtMaw4eP/hnsFvLegLlt0K2YzWBBnnQCSLmUQQBpKyXMMsmadVAD5J7vEGElojpq7Xw6wSHinrVU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by PR3PR08MB5802.eurprd08.prod.outlook.com (2603:10a6:102:8a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 11:22:16 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%6]) with mapi id 15.21.0382.007; Tue, 1 Sep 2026
 11:22:16 +0000
Message-ID: <f2fb4b62-f96a-4df4-915e-eb7130671515@arm.com>
Date: Tue, 1 Sep 2026 16:52:11 +0530
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 1/2] mm/gup_test: prevent overflow in GUP batch
 calculation
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260901083452.115365-1-sarthak.sharma@arm.com>
 <20260901083452.115365-2-sarthak.sharma@arm.com>
 <apaqJk91uAN-zD66@thinkstation>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <apaqJk91uAN-zD66@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0100.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::7) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|PR3PR08MB5802:EE_|DU2PEPF00028CFF:EE_|VI1PR08MB5519:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c47fe3e-1ca6-45cb-aece-08df081b5c1f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 yIJVF0IarOMo+4fEOh7AxnEAxAvpU30P+G1vDi9E1sj7x778doRYSvg8IIyfUih14fLDCwOTzlQflMb2sm1bPhOoGaCa2ocizI+x2sc1f/qC/Lsagg6wUGv/oh7uRxPMAcd+mGps/xDhcLqoHf3s73UyVhY4wb5eAUet8uuDBINGcEsyUeE6V9c9RrhJmVSB5SkulK3h2NqMPt9NbGpmIWNHlTLDcofm3S+XCZOK4XrCmDQuxDy0JZc+u+vPZ/s3clAAGKOpxMQKfSA4CMco4mwDvNeibSTDjT8RBDm+1LybBe5v/rWpxe3mhKq/UrQ/TdWuVnVhmsjk9m/J26Xeuf8MxFuPPifCDmAx/J5gQeyIEMS1qEp8yqUrIqIQ9ULiVTfsr37vwp/6WjGswcVJFMf3g57AXWdE8RUCBt5Y/MET+M6s6LyoZTq5xnazIv6aRTdp+0kuRL7TtdvHnrqLMQdNY2/GUIvrRm5iuIYWLbhY3H3d25Xdmb7GQ3k9wXkU47x9cTwuzfvg30lDLENkI7k/nv5KqlHMcgNduP53UB71VDXuhDGJDOyOpwuHZHoJnGlChmRQPzgn30TErLiu10WO3V4ARzeORAdwcCduL8jLr3oCZF32QsnxYcaYnCGZZRa3Mm7IlWasf4umK6KoJ8oN6ESMY7tvgT2ve4ggcys=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 kzPnIVGSEvBeVs1V9BmvVHMY+AkKqaaeW5n3VI5Nn89UFzC+XaLtfEUHTrqF+STBxvZcw1BI6LtLSNWvk2m50x6HHGOGPG6DT7liGg2RDQGntCQqA+IagN+63Wt0yeHQOFexDE0TbA3yqNR9jmKdHqqoBPhzfNVbE/vUJDQcAqXDXCpdzQFwx+Y+uWMaUw0HPjjXRmkJ7v4+1TRxPYRiT3dKo7uJfUEu1g4OJRWc+OZZzXQlFnHJpeeGZBg92NosGPH95lmR5SjweIaXNquHTPSVXd19cEQantvr4fvmjf2gGLLKcW8w3ggASy1DIMwo8LxKYYjvT+J3YGU3KGvWKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5802
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	453a4968-7753-4267-9894-08df081b4745
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|1800799024|376014|23010399003|36860700016|35042699022|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6tiFDpl9P9N/LMBvbt56IfpxZc3+QOCdbGezbvld7ZeNT+DhmfemfLyCmq/dkUJt0nSSlYYUq6wtcqSj1k0hUNUqMgxq41e3h7+WyRH6GgYupMelxC/3Mo8Zo8x6QZtaj2xCAos9fQiiw9exDr3gbADDHhyhVBOfL/sN95Yu4RMi2J43nydSXr2vhUlyiUPtrxuT/PrQAQkRyQ0F6TGB2BEwp6XHmOD2xs7fwj05e5TB1H9tO16rL23+a3QazGq1q2HrGtFyexWID3zyWpoeokjurD5Et9gqW32mSnVIqOQSAogD2c5mZh6lKFtmO3uU/HFrJCYn2rWtOctN63XMsFbyDWlwi/rMSerud/e+aEdeARIjh6wQtJcqQ27Em+Bk0fuq00QLwY3OiZmqfXlVXMp/TS2pB3qdPnunPEgObhgNbW8C2zBjVY93hrKeI477qiiu5lsAEphJRDNXO87i5rWVE7q3Koi4VLqzS0RkqUf9Gz86REiaRvFGj4i4EGNu8u6zmA41XQdyAfUELeyF5pBLuec+eVm8zwhib6pMKRNuzI9X25BgyZ1GYnGuLdP8xfGsIs+DcuxNULFfONbitG3g7QvEfl3E8+ee0TwyYrg8MXyMk9q32nOzIKyuBVY0L8kxW7Suk6xE7SV03+6M6WVoRDr2gB2GpaMot97Jg7w0SyedMdRQQwoYsszcHQp/WoBCLrfdnWSw0tH+ErvY7Q==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(1800799024)(376014)(23010399003)(36860700016)(35042699022)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UByMnPP8+rfnJK6ll8iscZjLx89UFLBYO3yYWUpPpyMKkaEbuGDLSAYzwnGV7vTmYpl7W/EfVt49hiz6gHgHe5ieSKxdQNXCqZoc+fn7Qc524vTdfi7eYQlQQipMd6G0/8Dbb76h/sh5YTOzbl9hDZvF6dWqsg6aJcbvDiOxVL9xV66bnRF4pQqDk5g4wNZ2reMhsN3ZVLuBE9OhCOEUITEzc4fEeheOl64R8J7g4vENtJxXEnphhN/X+UxJbxcmO6yueKQz/0ZSQJSs0Babt/3I/HdwCBaMSRjE23HWZIlDmCqnHNUCH6K6R83r62sfMF82FBt+jpTbeTtZSeiRQFHwU/k5jaCIlCB2MCQ5unUi/ED6Cu8cckrXeKWnq0xBOx4XYNRq3+E9AdFqHduNtMLWWiJvbNqyL3BmprFq288ZqrJAlu1IyYDy+j2bniwz
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 11:22:51.1606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c47fe3e-1ca6-45cb-aece-08df081b5c1f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5519

Hi Kiryl!

On 9/1/26 4:05 PM, Kiryl Shutsemau wrote:
> On Tue, Sep 01, 2026 at 02:04:51PM +0530, Sarthak Sharma wrote:
>> __gup_test_ioctl() calculates the end of a GUP batch using:
>>
>> next = addr + nr * PAGE_SIZE;
>>
>> If nr is too large, it can cause the next to overflow and wrap around.
>> If it wraps, the next > end check is bypassed and a large value
>> of nr is passed to the gup call, even though the pages array was
>> allocated according to gup->size. This can lead to out of bounds writes.
>>
>> Compare nr with the number of pages remaining before performing
>> the multiplication. Clamp it to remaining range so that next does
>> not overflow or exceed end.
>>
>> Fixes: 64c349f4ae78 ("mm: add infrastructure for get_user_pages_fast() benchmarking")
>> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
>> ---
>>  mm/gup_test.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/gup_test.c b/mm/gup_test.c
>> index 44c1cdfb9c37..910cbef709b4 100644
>> --- a/mm/gup_test.c
>> +++ b/mm/gup_test.c
>> @@ -139,10 +139,11 @@ static int __gup_test_ioctl(unsigned int cmd,
>>  		if (nr != gup->nr_pages_per_call)
>>  			break;
>>  
>> -		next = addr + nr * PAGE_SIZE;
>> -		if (next > end) {
>> +		if (nr > (end - addr) / PAGE_SIZE) {
>>  			next = end;
>>  			nr = (next - addr) / PAGE_SIZE;
>> +		} else {
>> +			next = addr + nr * PAGE_SIZE;
>>  		}
>>  
>>  		switch (cmd) {
> 
> What about this:
> 
>               nr = min(nr, (end - addr) / PAGE_SIZE);
>               next = addr + nr * PAGE_SIZE;
> 
> Seems to be easier to follow, no?

Yup, this would be cleaner. Do you want me to respin with this changed?
