Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013033.outbound.protection.outlook.com [40.107.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7782F28FF;
	Mon,  5 Oct 2026 05:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791179050; cv=fail; b=D2+hR/bGE5pJjTAiiTiKbX60jcAn94pdRr5VKsQuOUrePkSiuOFS0vvD0qDWjWeFKQNfWn4I9/ZQO00gCU593tH0Lwcqd6ClRf7+zXo6ohR4qLlIS3g4CzkXDeu5JswzvN0MkUQwzMXzIslzIj5Kz5WmRp88jYDqhW6IihauK/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791179050; c=relaxed/simple;
	bh=x2hw6U7+OYKnT7+nU5X1dO+ZSqbZhQKCsGJZdZmhX3M=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jS6ZzolwZuUZF2aqAR6c5P3SX7S92eR+upezTrvPd08x082XYpt9tbkB7RUiN63XSxBTnW6eqImmQYXvvH6OQKmWftpgjhvrkWciga1MtXZNyJ9/ka8n0Tba1pRXw0ztAZMfpZtAoopBQ/MytMRRRChEiYQZRDvlRK7pu7dIU+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=hy0q+XO8; arc=fail smtp.client-ip=40.107.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="hy0q+XO8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzKV85vkW724uv7wKt3oUCq/ePoHKV2RkwUfcaDcZEZLSof3FgmI4NDSAOMR+32bfIhodIEqcam/4UGrUOsXMoS7Kgj46gNohA04bh+Uo3SmEvqfj8HhsHqQlH9bHMrsorHp6Qq0w/+KIY2NrFq3DiaF1bOzhd6EffNJc25SOx7ninqrgJ27M3W869BvcQM44eizbmHeNQ7vWRxcZr1Ar6yIej3BztjUJ0YRJso80M+W/45mVRelQOQXvnDrc3Jy+kHPm3cIUgSp2a4IseGjPFaCwhJxGPbPY5sl6zL31t5L+IOXyDRCQUuHnrsWz3cMKXZojhenhytIGqXMr+dZYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2hw6U7+OYKnT7+nU5X1dO+ZSqbZhQKCsGJZdZmhX3M=;
 b=LJBfY7OwvaeJDgh1jQmpGNHDU1oHT45DYptgW5JRSsYJu4gCQtDW/5EKsrq9rQ6lBt9RBAWM+E5SGrwkO9LE26alRd4QNPJxVFMJq+6Gmxpco9Ew2Al6L0npFv+Hebo+Gr8oeT9V8Rgt1iveMlxC2w0eYGDJ+fAiCm+I/qM3m+1+yhdqLWiLV5MHs9BcGMQP6d1rE3ZetljIbNYdWOds18IKdq5n5HkI89evqSiIpsCDemQgK5SzyNnrIbPnjskERcgQConFCKYY+GVYVOtQfGZ8mMubMqaxppLOOTHGGVnAIrV0V5I6b296qBZf4oE7/Um4mIIg5f+XW2NCPP/rRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2hw6U7+OYKnT7+nU5X1dO+ZSqbZhQKCsGJZdZmhX3M=;
 b=hy0q+XO8DyzUFeeqm44iRN5hsOUdjm0gTcRO7ieMHwZ9fJlcC8pbgmabYJuFAc3TiZB0nHXWk669cS6omSo/M/I4+5KdBY9tJmgDyYLWld3ge6TDHXPjoNhouEIi4FmZvNlMVWYNaK+Ba7Dyh0TtA6FZ3/DBzaJdKg202uOKc1M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by SEYPR01MB5598.apcprd01.prod.exchangelabs.com
 (2603:1096:101:139::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 5 Oct
 2026 05:44:05 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 05:44:05 +0000
Date: Mon, 5 Oct 2026 13:43:04 +0800
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	FangpingFP.Cheng@moxa.com, Epson.Chiang@moxa.com,
	EddieSY.Lin@moxa.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] USB: serial: mxuport: add MUX50U support and
 updates
Message-ID: <asM46PTPs_8C3q4v@moxa-ThinkCentre-M90t>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqKpM7QaTyKzmqSe@hovoldconsulting.com>
X-ClientProxiedBy: TP0P295CA0055.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::11) To PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|SEYPR01MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d11664-b94c-45f1-86c7-08df22a3aa6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iZLiD+nHcCdd/ctL58khjoB9bsCerzkUD3WxTSrkAfMKzkhONTl+BrnWj1KM+R3LKY0Hr0j3QAs4B5N23Scee4H5CyYxkIjdTrQJKt6yBfseTofiHN1RTD7dYsCaKQfU68I4zLW3wMSva+/s5Yg0286dWfBejYGkvvVyEGHgZgn/3lmtt0lXjPDYdb77ACMBd/kSC6TkKVuGj4pqbP6lYWWwLeEDUGvpLN6IgnYPbuTX8a9lMnTqSHdub9DL6P2ZGZdLsh6TMdtfhThpQrW/r6j+znlBvSAt8e+UwTV9+dhrOM52u6bRsB0g+Ag7gJCFHhHcTz1rHnWePfGuiXow7i/VLxeej0Vy2YvhUiHto4GUULEV5Tp/pBtC/qisbFrXOhDfmSo9E6j0qie8thFfGp5AjOQdGjwwnz2pkUVndvvLTvHFNJDpqqHoglShimON8QxJ+pLf4VyDGpWXXBlDZkCloXY4kMblE/DqV5GDL0hucDGVfMjerD+oMCj8DcHSSwpAcYfw/+E7IzVkzoaWG1RgllsllSWs/oKAIiiJAaCaugPsQVkkssDe4toYq4w6uYtaYECwO5A+GfTs3JaFTZEjZSXzuEq1FCRgOjnd92tCU3C7fW6QeMQCuTrCf/kd2nt6gIxwn9Rg4D4UFJxyJB6cyF79nwxsdwp5+hpj6SDj1lmfZ1fWC/cjYhQ6VPJ2ujTRgDXKe3AYX0/ZlEbCUfTGQ11t2p3gL7f0IixeCLQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/1xJ0SH9c8WZR1qi/bf/qrNeg55FbYJ7YFRXHxP4R6dhgH2ItOqRERiHoyJu?=
 =?us-ascii?Q?NEdTPLOCia4fuhELIkCW2KzJ3QWSwAK81sGaCTBKQ/zbX7msKvs/9vPHEON9?=
 =?us-ascii?Q?bO01gQekBYcKjG2/TEWYorSR3xDVDTdiTs3xAfPEiotPNEolQB8v32mnfUFF?=
 =?us-ascii?Q?QDx0DqlDJ244bjOwTlcfTTDELYXj1ccvtONRu1KXAcN5P6iQVLckilkd+Do2?=
 =?us-ascii?Q?toTzPj7TJyAvbJqit9b5nPI+1dAbF+Ja27n8hp3JqYoy0u23WqXMU+VsvE9X?=
 =?us-ascii?Q?uPJTIMRHItwaBR6moMGArj8+0czhWSzAr20o/esVuukFl8gpJJxkWd27xBab?=
 =?us-ascii?Q?haBhvcTrRmGWj3S+N304VAuYli+NDyPtPp0Hg7x2tnrDChw2B8FsJGBR7Iq2?=
 =?us-ascii?Q?OwdDwdGKETh0rkL4KyW5VfmFlzixBh+5fzYaRsIYU9Cqu1ugAhXeXpHvuMFE?=
 =?us-ascii?Q?fswpEZQFcBf+11q2Ig/lDYYeEXikxLg/wH0qyh5Y9JAw6sMjrzC6z3ipMZpA?=
 =?us-ascii?Q?ZJYpfyKSx767wPG7sz+DNkwXL0RGOvTnDlvZbArHqHmZ928OJzdd0Xh9j2lJ?=
 =?us-ascii?Q?Xn/YmMcgQCEBv1xi5g0E8f/6rNCtHpUmXJ4TQ9mxlyAPIi0kEr9lWQBhKKwm?=
 =?us-ascii?Q?cP1IcRsrW4gc1vwpQtBNet/oeMSoFY7js7vzzfM34R2haFKj31AZmj/6r6DL?=
 =?us-ascii?Q?qOftWz9HG+M1flYznAJTWzfHVJV/O+8p+rHZO7AqyX/Dvu8Cy3+KhpMNp/e0?=
 =?us-ascii?Q?G0MUiMnSrwv7yBNoSWsIT3TvntQnuocHSMNyGvflc//b8G3rPwvp8K75CO7i?=
 =?us-ascii?Q?Bnm7gCXz1V0kQCf99zN/T2BxCnsY5J6nPystYOSxYB8Ld2jx5ylxw4osMA1T?=
 =?us-ascii?Q?nc9AueYztDSqo1iaGGdF4nJZVJb+ykTlNTIDUqnI1ZPhMC93rE50qJzxOT09?=
 =?us-ascii?Q?Jq6hmiWpj7fL6E/hmYGp4vP6b3hH4lj0CwNU6nOPbhal/vIGtlxzIfhfKuW6?=
 =?us-ascii?Q?gglVDoj4vcTs/v35/ehbjpRCVh3PQTPKsuOK7RixgAx77/p1OPKQLg+56Bh3?=
 =?us-ascii?Q?85rU7vk4IppNcjd5uh7ARSuKpGeQugu3FV9zfhzRm2vxcTWYBHzoasGOgNxw?=
 =?us-ascii?Q?NapFWhHIPohKarQx5gCtizdMV36tdFenGb8PrMMJiSPNELmwNoHv1f0NJV6S?=
 =?us-ascii?Q?Fjr8C9mwu7Hedny1PDwSAd8OfG17HmvRgnNbmvttwCHDJddAq3t6jYpjlpeW?=
 =?us-ascii?Q?b3L2AP5o4MyLgWj/N4Z/9uXZOQDQGSTgtJInbiErKDfrE8by/pNGcp033OXA?=
 =?us-ascii?Q?sFdjwcdalqI1WTnxTMIB4843sLTUJm6XV8eLlb+xtVw/tDZt+zgh2X4TGmXx?=
 =?us-ascii?Q?4VBFL21mnwJX2iwi85zWEF0jo3xqQVSz0yb7qC2LgW6gNN1hUp0BNUIHeEGm?=
 =?us-ascii?Q?8TpsVqKXQaJy3XSlafpMDG8Pi0Viwfgh5atPR/Xxf/7nsRLMyUwlK0WrUXQR?=
 =?us-ascii?Q?1qMppPbqKSlFZv2PWzWqtmopJCiLVqwwskMmvsdOQzRWaG96ewVvSy9ZwtiY?=
 =?us-ascii?Q?ZevEvVZhP6Ocv9YavEWsbhYtV3BW+fPvyUsOai1BMcwgpVT1uEEfS5CX0zgI?=
 =?us-ascii?Q?4pkLtCLY6fJtvBZrznY++l94J9qu9z7nYbOL7Y6FoESLAsQ91d2qf0AEEhmV?=
 =?us-ascii?Q?hF8HoGV1i0SGWYW9eu1TpLqQFKLie+t7ynIkRXbdzCGlHzZrx27TV6HezfZU?=
 =?us-ascii?Q?5jIZ6xaeaJoM5qq5sAVR3ipQ+QQnDuc=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d11664-b94c-45f1-86c7-08df22a3aa6b
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 05:44:05.1768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cN0cG3smvCSwYEfij9cDTgqbqmKcpuHINwQV8kpxzedV75e/fAzNbDS4NiMnnko8sfNLLnRjCg9vmaaI4kl9DTH8Q0z37Zc/Bz1tohJ9bUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR01MB5598

Hi Johan,

Just a gentle follow-up on this series, which was posted nearly two
months ago. I understand that it is still in your queue. Please let me
know if there is anything I can do to help with the review.

--
Thanks,
Crescent Hsieh
