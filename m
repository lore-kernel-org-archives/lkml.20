Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021098.outbound.protection.outlook.com [52.101.65.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFA5449992
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787918487; cv=fail; b=LWtiA2N5mU+gruBnlvbR6nz4GyOYzRyjeudjXbttJLJ38qeypPE4eJ3Rdwu2veT844hbwJT4JnTWnPIvJwmofPLS2Lh1pMTU+JelVmfOAgpiqDd1zqVlqj9JtwD8vjQtTBL49I0v1Z5Hc5Sak4xnTI+vr2D+soAjnxcRbRIelMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787918487; c=relaxed/simple;
	bh=9lwEYdjfskUnTFNloOYJqI+A4Ex4+sRCpKRie67GPBg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H63XBClL/S1P/MEAaQoJ7GTL2QMNKBXsLB0DoW5T26ADwEo54pNYnzwthcJay7eZWrW/Sru3E1Km5EFVeilU8q1PgFRgVeFU0yg651R52vKz9zZWReuk65iGnc6VgxjCdUnZgn8uQ4ICoEO8n1ofg77G7COoNpy9MGTQ9zHmL+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu; spf=pass smtp.mailfrom=sch.bme.hu; dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b=lzHYa13u; arc=fail smtp.client-ip=52.101.65.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sch.bme.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b="lzHYa13u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mn5UAkf16ZU6Sg2MUd+c68yigvLwRMMQptiebGg+/vWVPz1ZnMefS9RmCpWUPrRNhsTEMrYYzwrx0MRhgzkIPkSvoDZxN3BfxgV1Ygvp1aSPiDjL3WS/Y+30P9XuCZobU/MsxAK5avb+60FEUctStLCc4OEce52wVkp91UI3w1djhv8ING1B5svtt+auRq+97afY/RfUYSple0UAxnJnJZQ2mdOmDKSg9/ClcsFzPOB5tmELMg/haEHboQ9PAx47zTxDsi7sRL3Bf1RVp+WGv/W9jZgQz7ZKYGa5WlbInPNURtJwHtF3sblqw/7zIj68gYjIryXiuW8xxU6fGc8RSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uv4qgWMqemoM/CjDKBOfdeVzILXmbwZk4VOghzxQViU=;
 b=H2SgpbvkFfSXFbWK1fo0AyGkPH6Vt9L05hZcTVdnjL6XfavRvsz/eIIP8+l9UicURm6wBD1UPVZ4SV4DDTlQjOXPOkkv9pIs5SsPMDuwwJVdidh/gYKTBQPNQq41Q2ObFo2anLkyglfDeZlYYA7vT/hgCysVSqaEeslWbPwGFvjdjshWWVcYMpz63h80Q02HHGWucaxVK7qT/ZmplXq/9uZaUQdMaWT0cOq5d18lHdeDQSMkZvaA9EsT2seIOeBpaCWRE/kRW/1cCmkekLtAqO/9ph335hnsMeDvSHdCLmtyloUijs6nzjDr9IUV8e3OFcXa5NFgYv61LcDklS6jwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sch.bme.hu; dmarc=pass action=none header.from=sch.bme.hu;
 dkim=pass header.d=sch.bme.hu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sch.bme.hu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uv4qgWMqemoM/CjDKBOfdeVzILXmbwZk4VOghzxQViU=;
 b=lzHYa13uQilHK252veDn5QwECKV0Ls3ZPli3RL6IhMZBws7PKlPMnMDBU3DJy6RjfEDvkHClCJL078a3A2PYJ35haWjjOBNFkr+ohPUdyZnLzggbn5euihALH/qMf89IAzasglQnbb3o59NDvB2HYZ0vf6YQ0M2fsHbnZIY8oY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sch.bme.hu;
Received: from PR3PR04MB7260.eurprd04.prod.outlook.com (2603:10a6:102:8c::15)
 by AM0PR04MB11853.eurprd04.prod.outlook.com (2603:10a6:20b:6f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 12:01:05 +0000
Received: from PR3PR04MB7260.eurprd04.prod.outlook.com
 ([fe80::bc60:c1f6:2fb5:8cf8]) by PR3PR04MB7260.eurprd04.prod.outlook.com
 ([fe80::bc60:c1f6:2fb5:8cf8%7]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 12:01:05 +0000
Message-ID: <34dbdcd5-ef13-4ebe-a6f0-e38e95a476de@sch.bme.hu>
Date: Fri, 28 Aug 2026 14:01:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: remove quotes around names that have email
 addresses
To: Hans Schou <hans.schou@gmail.com>, linux-kernel@vger.kernel.org
Cc: Hans Schou <hans@schou.dk>
References: <20260426091302.310300-1-hans.schou@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
In-Reply-To: <20260426091302.310300-1-hans.schou@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0068.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::11) To PR3PR04MB7260.eurprd04.prod.outlook.com
 (2603:10a6:102:8c::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7260:EE_|AM0PR04MB11853:EE_
X-MS-Office365-Filtering-Correlation-Id: 5807abcc-5495-433b-197f-08df04fc09f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|786006|23010399003|19092799006|366016|1800799024|10070799003|41320700013|376014|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	eTqb/EzeHFcDGmbm7s+pMovBZz7d2nl/iDVhypXgN5pN/N4oPQz8CVkGD2kLeKIE21qFqODx8OdjTwFPrDC7rGWSfFJ/+dIo4RfEKwoHq8IS+hejSbp+vethtiCqH5YshOe+1ow5t7gSFJBFGGYzAyqXR3Ljo5I06l8S6hXfgZY9NEhEL+KYbtxt/9Avhb4awBQ8fc8bDCc2qfh7UoW5FMPqNrGJdA/sHLO/q4WhmDuULOMlJxXNzCuscSZSq2ZBaV3Hn0PkTpZ9k0rVlm6suTWm7MU+0XnqfKSV4rET+rSrXN16SfI1IP2a4vL+lPqyEtQis80YQM1BzXCajvUBgNmY9P12CvfihFh2v8u5ZJhxVEYJMjhBL6rUG91EGfSaHXNvTJDWMQcIiSUxB8f00E9mwHmVeuXC0ZRZ3+uF4fIdXd2Bef9yLbOd0GRJNwGGdWMTWs9hVKilj58NpWhxRXWe2I8ljpgwt9OPy5F98eWqGa15KW7RmbRtX1+MlRCFCAY1CLVIDr43gZuKOd/U3Hii8F9orOEi9yJtKPi8GbdJzKJYs9f7/WqOqBhE+8hUwn2nlGJ19Hy5KE672xXGFtsFOQmuEOBBzBNoRPkHLr+5c7+1iJ3BumvDZR0QM5HNwz1HD3Cn0ahKdEfxsqwJiV2J6X7uB/Czsnu0F2riA/I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7260.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(786006)(23010399003)(19092799006)(366016)(1800799024)(10070799003)(41320700013)(376014)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVZ2Q1RVd0pxNWxkaVROd01ZNmIxbG9jdVNiTGRodTNOaUFCNi9NUk81Q3hG?=
 =?utf-8?B?SFNjSGVXa0pmdFhaaDdZWXcwV0V2YlpRWVptK3UvSUlhNktJUW9MbE1SajYw?=
 =?utf-8?B?MVRtWjNEL0p3ZGdaTm1JRlR0YVBzbVJweUp2Lzh3ci9mejR6N25iWFJwMVlP?=
 =?utf-8?B?SVZSdmYyKzBjMTFneWExamY4RkdCY1pMeE80M0haOWdtR1dGeXErSjE5YjFU?=
 =?utf-8?B?MDBhWGFOdElVTzhKVmhKUW9RK3p1TWRsbUx0dlBCZEFCbHdqZ1FkbC82WjZz?=
 =?utf-8?B?cUdydy8zc1FOcFRGeVNmVzZUQzBZNVoyWWVJckcrQ1FPY2c1TWZLS1A2K3VI?=
 =?utf-8?B?ZzFjS1E0UERiVHdJSVNONzRCK1IxbWw3a3hraHJpdmtVQ25XQklJa1JUNnVn?=
 =?utf-8?B?aTBmQUdOaVVMTUxiK1pSNXlGcnR5cWxkL2RGM2lMMkNyOFR5R3hNY0lScXhG?=
 =?utf-8?B?ZEU0QkJlWVU3UWI2dDV2cFBTNjdOL2xTMUNVbFBBd0dMejNTYVFQQU9VbWlP?=
 =?utf-8?B?ZjV2eDBuR2NPUDhhRmVZUEdTNnBqbkg0Z0dCVEpNTXRpQWZrRFEzdExqUG5z?=
 =?utf-8?B?aWpVUitReFdEcUZ6dmxnZzFTbHVSQktVMzBrcFdmcjlrTFpSWmc1ekdBUW05?=
 =?utf-8?B?UmdSQmVjUlVSR3NXYXRNTWxNT05seHI1dGtGcFdGSG9kZHMvK1huZFhhSXY2?=
 =?utf-8?B?YzY4WWpnb0VLTEkwWkE4UVFGZEVZR3ZzWGZqYk8yV3FZSDFGR1EvMENic1Iw?=
 =?utf-8?B?RGdXc2RnQmFRc0g0aEFXWW9DZ2xDK2UyaFFvakNqR1JpVWUvaktaN1JGbTho?=
 =?utf-8?B?NEN2ODNXUnVOYjJoQm1TbnRzU003MUl2S21UVTNaQzFUVXoxTWVQc01XWW5S?=
 =?utf-8?B?ZjdZOUYwYlR0R3hPZUg5Qlc3bWw0ZHphODhnN0NlSHJ4ZFZUV2d6WUVlMVM5?=
 =?utf-8?B?b0kwUDlVRFpIcmRiRkJORHBMZHhvMGZxbkxiRThCK0E2cEFkV1BCMmwzN3R5?=
 =?utf-8?B?MTZ1WGxYa1Jua2NuVEh6dG04VkFXQktVVUFaS20rQk1LUFRRVS9uQVV3TkNl?=
 =?utf-8?B?cE1uRkRyWW5Fdjk5d2lJSnlyQlpoOWRuK2tqYWk4cEFrVUVyYlE3dzZuNlhG?=
 =?utf-8?B?aGMzMlZlSnFSWUJMQlVPOTVVUHFwcTgwZDhPWHlUWXhUa29CS3J5WWorL2lp?=
 =?utf-8?B?Y3JQSmdCM3lYVDBVbjFNQktQTmhFdnNOeksyNWtpQlZVMVdCcXhvZDRkMEVQ?=
 =?utf-8?B?VlJ0MlhrbzBGb2ZJVHFUZHpMVndxZzNmdkw5MTE3bnRkZTZDUXdNc0ZRcjZK?=
 =?utf-8?B?ZVFBSUEvTVdJcHJxVTZxVG1zVlhXMDUzUGkvdUt6VGQ5QmZKUGZBYk90SEMv?=
 =?utf-8?B?QVhPQktXaTNsVXBhbTZoV2R0b1JzbHZxMUlLdmdaTk5NTDNpVVVOMDRtekpK?=
 =?utf-8?B?L2Z0SWNDSHJNcjN4anpsVXRTeHY2Y1FpZjZQSmlQeW9nNVp4UWFTWG04RlA2?=
 =?utf-8?B?aGdESnVjVlViUFQ1MUFOaE0yQkx2SHRkSmdndnV3TFYySDJ6L0s5S3UzK1c2?=
 =?utf-8?B?a1lJeFo4SktOWjhlYTBScGMrT3ZJc2ZBQWNITGpaU09QNEJ2bEkyeEtDOEli?=
 =?utf-8?B?RDVCLytWaHFKMUFVQjN3cS9aTE0wMDUwOWRCR2dJbzRGTHZ1MUhtUUJ6dGpY?=
 =?utf-8?B?MjJnSGliZXVvbVFqR0FkSU5nK3N6VitCdUY0aEJyRzM0Tk5TS3k4TEx5czVi?=
 =?utf-8?B?RU5VU3B1cm9Rc0owT1lFRThVM2NmNXhaU3BCSUtpSmo4MjJMMlBSTFVsZ0pR?=
 =?utf-8?B?WjBsNmtTaEJmR29HZndjeElYaDlwa0djSStBakVIL0xOd1d6MGJIWHZlZXJu?=
 =?utf-8?B?NWNuVSs5VkFkYzhWcDJOZDZIY2QzaUlUd3JJSjhoRGhPWnJFbnRna3N5L0Zn?=
 =?utf-8?B?SmRJbU8wdUNSci9acjBybFlIYTFNQTRQanNTMWkxLzZNN2tjYmc1b3BBeVAw?=
 =?utf-8?B?dDhqODRoNEdZNkxKaGV4bmc5cG9xdk96MWwxbDRLRUNDK1JSeTF5TEtLSnUx?=
 =?utf-8?B?TGIvaWxWdFBReUNhajRtazNmZGRzK1lMenphUVZlVk1BNUxGRDZLaTRsS0FT?=
 =?utf-8?B?L1NMay9BWE14b3F4Y2paekxDcmFUU0ZRSmlKV3dZNkFTTXZHcWxpSDR2ZExY?=
 =?utf-8?B?Vko1L0hTRU9wU0FSTk0yeUx2SnVHY2VETkNPMTZ6UGtpQzVmYU5RSFZjYnBJ?=
 =?utf-8?B?THB0c1YyWGsvZkNnUzdwdjNrdDJ1SDN5bmkxcEJ5cFhKSHgwY0dvajdWcENP?=
 =?utf-8?B?eXdoY3A3VkxML3NPN1FnZGZXaU44aDFqRm1YeWN4YnRFOU5CZmUrMVJGMHFV?=
 =?utf-8?Q?hWePFDyCd38w0k89yP39C3oydJKyksxLTOE8taEimaTa2?=
X-MS-Exchange-AntiSpam-MessageData-1: 3qUBssyMoKwnEg==
X-OriginatorOrg: sch.bme.hu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5807abcc-5495-433b-197f-08df04fc09f6
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7260.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 12:01:05.6519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 79f0ae63-ef51-49f5-9f51-78a3346e1507
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnLsg5ig08ZeuBIJ4H3dXDx6ImP1+bH8G8y391ON4qKZGILLfpvxCcOPhdl9SKPMQkw2So0fUcBeARO9Ky/jnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11853

Hi,

On 4/26/26 11:13, Hans Schou wrote:
> From: Hans Schou <hans@schou.dk>
> 
> Several entries in MAINTAINERS use quotes around the name when an
> email address is present:
> 
>      M:  "Name" <mail>
> 
> while most entries use the unquoted form:
> 
>      M:  Name <mail>
> 
> This is a purely mechanical cleanup to make the file consistent and
> easier to read and process.
> 
> No functional change.
> 
> Change applied with the sed command:
>      sed -i '/".*</ s/"//g' MAINTAINERS
> 
> Signed-off-by: Hans Schou <hans.schou@gmail.com>
This is called RFC 822 quoted-string. Display names which have 
non-alphanumeric characters such as dots, commas, brackets, double 
quotes, will be subjected to this encoding to make them safe to use by 
Git and other email tooling. I suggest reading Git source code, 
particularly `sub sanitize_address` inside git-send-email.perl.

Bence
