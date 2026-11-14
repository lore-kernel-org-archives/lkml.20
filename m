Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=216.71.131.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794677186;
	b=0WLaMt/8r8Up9KNp/ungsi90v6DFcZAlLzaaHuj+alBp7q8N2iIHL5Hgx20kuT4+vTM4
	 3+/TmhQI+uqhSU2Vzn41l/7qRe4gBr7KroOsHs49WP5+S9F+fUgo2t3ZrHCByqUIyxHuq
	 rZVu0LQ6ral+CFxlautkYpiS+KhtaN7KgedBXVKgXWelgT7WSjqEuOuCukPyOfVI0MGHD
	 Dl2VbIh8aCDtwmjvR2iFpfzxhdldsxVdD3TXXGj5+jjczH6eCl7CRw6sDQdhiEn69Y2yw
	 4FuhA3QHwKPD1H+NhTnhFctNh58yj3r2o8ksWK9O/4QKpWT3EZTUE+nJ7jbkwTDKp8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677186;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-Talos-CUID:X-Talos-MUID:Received:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=pNlkMR1Y+qYvvWpXp8OjQMZBWQMli333/U7YTlBCYQk=;
	b=1jPUXtBSiFhRW4jtxcogEvA4nHGN7ulG+5JfVWxctEEbD6iCI4p+wTi7yNJwirqmEcjz
	 JpuBXG8JzJdmHXdvhr2bg7eaRy+mLN17OU5fPwcHZT2Hav7fX9B5fChqd0M/NZ3FUWlZe
	 +35v1A/uYdxGcnTIH389pVWuNBC1LqdI/uBcIsCRa3hPIX7PXQTkKCErHKZv1zuS+cGem
	 xDzpTo77FRH5o8BV3ShaCuAcMsjrMMQH9RfvJgrLzWNcR3iiqezZ7+2Cra6SO/3mq51cm
	 BpOf9WpD0G5BNrr2SLKJb/zihjj16+lbCRHFD8CQN1FeE7MSzWEI7xB90aRXGnHa0kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uwaterloo.ca;
	spf=pass smtp.mailfrom=uwaterloo.ca;
	dkim=pass header.d=uwaterloo.ca header.i=@uwaterloo.ca header.a=rsa-sha256 header.s=ces2 header.b="B/jodgRe";
	arc=pass header.oldest-pass=0 smtp.remote-ip=216.71.131.47
Received: from esa.hc503-62.ca.iphmx.com (esa.hc503-62.ca.iphmx.com [216.71.131.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9CB606A327;
	Sat, 14 Nov 2026 17:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E9CB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=uwaterloo.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uwaterloo.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uwaterloo.ca header.i=@uwaterloo.ca header.a=rsa-sha256 header.s=ces2 header.b=B/jodgRe
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=uwaterloo.ca; i=@uwaterloo.ca; q=dns/txt; s=ces2;
  t=1794677185; x=1826213185;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vA6ZIZKalp7yRGuem8MPo8M7/9e1wM4CoHAN+g02Tjo=;
  b=B/jodgRe0X4afMckA/VngHYOkwG8BHo5oaURdVITN5nrdHIzd36nZdov
   ak4qNdtzLYOkF78zIIM2ULJZxYUATugZmn3cSw09dSD+lyhlD0AYcEm9x
   gbTGE57RHEyiOJklzyfPfF1Fd+SoPKsphjU7v24UvoHhXInaTfI12Kb9+
   0=;
X-CSE-ConnectionGUID: YYHSK8O8TD++qhln1UNspw==
X-CSE-MsgGUID: 2yWcyG8MTvS+5y/gOJtIEA==
X-Talos-CUID: =?us-ascii?q?9a23=3AA6D9DGuLQtLWj7vnJYOqDayT6IsUQ13m7yf3c3O?=
 =?us-ascii?q?USiVwSLmTEGK247t7xp8=3D?=
X-Talos-MUID: 9a23:MocASQjPLKYUE0xqClmrIMMpbtZX6LWBWGUxj65F5tjDOgtSJxawpWHi
Received: from mail-canadacentralazon11020123.outbound.protection.outlook.com (HELO YT3PR01CU008.outbound.protection.outlook.com) ([52.101.189.123])
  by ob1.hc503-62.ca.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 12:26:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvWWgd8uYdPNmrihYTAzMTgLIvJE/IRd/0ljU2Ka/Rlgb8qJkNoNRC2IGPGleONmwUSv5AFE17Vgrbw6TLPACxpYbNY6cXIQieeBl/CoT4sMK/Eut+y5CIaA1WaJrpaMr+i6emOUKfr97xqvnNXjfcJV5t31Xpu0XoEcUb6M4njRIP4PfW58P7HyiPdzcnnEvxTAzYvcyIjqh8cKlWGW8eKnx7FMeN8rxOxUIYmbEYzLxlZEHyKx6KetruBFFyMi8ZNqDDVr7VBcmJd//ixMwYtUeaorFpyw7dUtCf5OxPN4LfkpDF8sb24f7Gl9Q6pPQmPEhbDKFlA3aQVoODckKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNlkMR1Y+qYvvWpXp8OjQMZBWQMli333/U7YTlBCYQk=;
 b=CbiElb31bsJITwBWYDHA11nOUmGmMgw//KINaNxdvRWO4I9FFsSVvOtYKIeLOGRDooR+KMMmxbWYjW0DlOiuZJL4cV2PvBHSkL0rG6mrMb7HlT7ItZQHj8mziWU5OLmlp3EMnto8TCQourpcVyna+G3o7T7U42cLZM7rA397C9juBRNxnvdu7+lzw7gLsEcFqViNeicAKUEJMPpwEw6OjwqrydhDLpnQImiq/wa4sznk4h3kMHlObH0jMo9bJLaoWTgeIpVZYxx2K1IQdVHKZE54QySZ2Vpubv52PSPJdxiIOHlahAAH7GfaoPs0OppVfQHkb/weWsCiBDI3Q4GGUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=uwaterloo.ca; dmarc=pass action=none header.from=uwaterloo.ca;
 dkim=pass header.d=uwaterloo.ca; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=uwaterloo.ca;
Received: from YT5PR01MB11875.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:17c::24) by YT6PR01MB11070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:13c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sat, 14 Nov
 2026 17:26:09 +0000
Received: from YT5PR01MB11875.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::b6d9:6c24:ae98:688]) by YT5PR01MB11875.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::b6d9:6c24:ae98:688%5]) with mapi id 15.21.0615.012; Sat, 14 Nov 2026
 17:26:09 +0000
Message-ID: <321482ad-e462-4791-b08b-652d66a2452f@uwaterloo.ca>
Date: Sat, 14 Nov 2026 12:26:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: cancel napi->timer after the grace period in
 netif_napi_del()
To: Mani Tofigh <mt4022@columbia.edu>, Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Joe Damato <joe@dama.to>, Dragos Tatulea <dtatulea@nvidia.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Stanislav Fomichev <sdf.kernel@gmail.com>,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Cosmin Ratiu <cratiu@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 Wang Zhan <wang.zhan@smartx.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, tz2294@columbia.edu
References: <20261103-napi-timer-cancel-v1-1-55c631ad5286@columbia.edu>
 <CAL4WiioJuY1L5ji7tVXggp=FDm3eidwekpxqAMdnxWUyiTR3fg@mail.gmail.com>
 <ae3e5838-6985-48be-bd99-fa5a21143942@uwaterloo.ca>
 <06ca7638-85a6-4fb6-9cac-b495d213ac05@columbia.edu>
Content-Language: en-CA, de-DE
From: Martin Karsten <mkarsten@uwaterloo.ca>
In-Reply-To: <06ca7638-85a6-4fb6-9cac-b495d213ac05@columbia.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::22) To YT5PR01MB11875.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:17c::24)
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
X-MS-TrafficTypeDiagnostic: YT5PR01MB11875:EE_|YT6PR01MB11070:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa1c799-f59c-491a-99cd-08df42745f4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|786006|7416014|376014|1800799024|366016|23010399003|11063799006|4143699003|56012099006|261028144727099003|261022105027099003|261022075727099003|10067099003|261026140227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hGTCO8qq6ocgUxf4wmFSVYuk/yE0KesawXYE7LVuN5WdfYYSxTzZRHgFrdiS71S2IuxyCH19ZEJXTZFw2xzt8H/cGLr2B9RWOWrB4iioqhGd1TPcESNxJHtHUNyRrdr7CG9ru1dI8eqraz1m17oWm7vGJa/CGnKHyUg3RABygvTUMhOaWaLg3BGKriJCj2R5ubNNKPtR4rooIiXG4nWLBwdYvUYH503WA0MPMgXBdS5vTAlsajrZaf5Zoi8EXK4Qw0OGLZjYGgaAQ+xJvzR9tJQ7zbLMZ1C6l2nq4Gv0sM7ZRNhCeaIBn3L7IsAY7LeraLHsAbG2li9JDpyk2y8EjOvJBjRhI9kBQ/F4O5LQztozKo/CgQGWvuOlHEo+XNkYtIIDrOz7bjjSOZbAuqOOXXzycRV0kw68V09qJdHIUj2Pq3jkxiFNHLjkIdzcZt5iYOere4HaKBWE+//2mZTNJGnP92yaBLx1JSeORlBmVOC1ygK8hwcO6T/ZgZJ4r2u/VeZMFw3x/nBo/iYEj7/lQGXRPwDv1kgCBZutZgM0mEJlCLR1My2omzoAeyuJg0wyJTs7RSVvI8oOu8HP+fqJ6WNDIICnsoKmUsYjX+Xa6ZBSqQzH1LBquVSy1w7dfbxUdhUHUPjC7XPpgr/91MdH67SIkXc4HypBXmC5m5Mq+24=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT5PR01MB11875.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(786006)(7416014)(376014)(1800799024)(366016)(23010399003)(11063799006)(4143699003)(56012099006)(261028144727099003)(261022105027099003)(261022075727099003)(10067099003)(261026140227099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG50NDBPbXFHaFR4c2xhZGhHMWxRKy9iS2s3R28vVnFWOWwzeWIyTTVSdzJw?=
 =?utf-8?B?MlZsR0VZeURUM1ZXRk1kRUFyWjRTWGEwZ1g2TWJ0eVNJdFFIaHJkWFpoamtq?=
 =?utf-8?B?bVc2QjUrRjR0QVFaVk9WZVk0eFVDMzdyaThoUXRGU2x6QWpDeGVrbTJleVAv?=
 =?utf-8?B?bEcyZEFoc0FGcmU4YkgxR093L25JVFcyWG1tVVEwcHJZaGFIcTh0NGpSUmRt?=
 =?utf-8?B?elpxSGJJenR6MTJyTjVtQjRCSjRyZktRZW1keUVtZ0JXRlRUZkMvRGNET2Ew?=
 =?utf-8?B?RTlsTVgrUU1WNDJxVHJMeTRHYTRjT0JLZmM1TmtGZzBXazUzSFRpTlpTSnhI?=
 =?utf-8?B?aTVZWDJIZ245RVhUdXkxVE1seTUvQUV5a3NOL3pleUZWZ3FjckJ1VmNqT012?=
 =?utf-8?B?UzNsRW9haGpRQ3RVQTFaMDFqT1FRcDZnUklkckJEYm9iSmw0VzF6WlJlVk5x?=
 =?utf-8?B?bndSTEUyU2g3aWdlM0twTWJwcnRYWDBhR3dkWDg3QlZacXBMa3RCWHpmMjJF?=
 =?utf-8?B?aXVHdVZQUTNleWE0enM4K1RtejJFTVVtUklTSTVMSFd2QTZaNUVQMVA4bHJE?=
 =?utf-8?B?dHJMNGxzdU1BancyU205b0lxam5FYTJSRHNwTEwrblBIRWg3ZkwyUGg0U1ZQ?=
 =?utf-8?B?bnhNS3BzUTMwRmxTbCsxYnRHYjJwaE9NVEtvbUlqSjZsVmdMSWkyTDZZcG9o?=
 =?utf-8?B?YWhKbWZqUk1yMkNDRkJibjljemVNenBLQVZndE9XUlRpdE4rTE1LcmY5NUxz?=
 =?utf-8?B?UGVmaWcreFpCSnVrdmRWcUdCcFlmNEMvVGFPWi9VL1hTOUo1M2Z0ejRZRFJS?=
 =?utf-8?B?dnBuQ0g5cFZtOU1qRGErajNrMjJiMTJmamUxMmh2TEtRMnpEbG9nWWozRWdn?=
 =?utf-8?B?VWZKcnFCcGc3cHR2YTNwUUozT0lyd04ram9aMjErOHVCKzM3dVpvL0pCeGcx?=
 =?utf-8?B?U1V0YzJaVklaTVI2V0dIRVdnZ085YzROOC9UREZ4aVR0WGN6TVdMS2MzMVRj?=
 =?utf-8?B?UG9UTDlsUVhwOUp3MzdVS0YrdEdsRjJRV3FmcGJUdkIvbEJpOTlaQmpCemYr?=
 =?utf-8?B?b01NOVpYN1BKYmVybmtGNzNrcnRGSDBmR280dkJTSHk0blNqdUFiTjhaZmNq?=
 =?utf-8?B?eWt2UG9mY3NKTHdNNzh1dVBXUzJVOFV0ZVoySEVPVndKNjR0TjdlWWluMjBu?=
 =?utf-8?B?TUNYcm1Td09ka0crbFhoeUFNdWlnckpBTGlhTTk1cXA4Y2ZJL0JEWXZ1L0pL?=
 =?utf-8?B?QnhJeEdoMnZRT1VlY0I2T1hUMWZXbi8yWWtXOFBRcll3aTlsaDFHYUVrU01Q?=
 =?utf-8?B?YTdqeXRUelgwV0xDeThycStBWTVoVENiSjdGT0U2QWI1VVIwZzZYYVpyWHZu?=
 =?utf-8?B?NmdPQzB5eGVKd2xFdWxXR1Y4ZU5HRkE4M2xPWllrZTdpVXZUbUZKU0dMK1U3?=
 =?utf-8?B?QUFlUjV4bDk3MkRIaVZTQ3BHN29WY1NyejlPV053NXRmUURtblp0YUt2cCt4?=
 =?utf-8?B?ZFlrZHROc0NYeEpsL0xINVFVK2VsdjdZblpEQ2JISTErNi9NT0NQd3JONEJu?=
 =?utf-8?B?YXgvbXpJdG9XR3NoOXdqakd6ekRoaXJUTkNWT3A4OHdLdE9IaEs1ZWFrU2NV?=
 =?utf-8?B?QTBoUmowOU4rNTlUV0llbkFxb1NwdFFjVzQ3UGg4YU1OUktmTHBmaWpMWlRy?=
 =?utf-8?B?dDBtUjdFajErM2hQQXpWWWRqbTk5RUxFNEpSaTV1ZVNoUUxOMXhRQUZNTXln?=
 =?utf-8?B?L0RxWUZwdkVaTzVhZkN2dkhwYWI2dStwdUxGUWNTaDBYZnI0MTRoV2YxWjBq?=
 =?utf-8?B?RW1OdGYvaEVPWFZDWU5SYnhuSitGdmRObHFHMmlMMC9nNzV6R1I1c2J6ZFdH?=
 =?utf-8?B?LzA4ZEZZTzNUVkIxdDNHSDMzWGdEYmJQWitmMElJUXkvNW5SNWY3MXIxNjNK?=
 =?utf-8?B?TFBMbTJXUTBPc1Z2UlViaTdrZzRsTHdvRnNxbWMwUXppTkpNNzA1aUlRV0Ur?=
 =?utf-8?B?bDVCMGxwd1pvMDhKS0ZHWTFKVC9VQ1pGWTJkQ1REUit5TFd1VXFVbG9FRURx?=
 =?utf-8?B?Q05lT2I5ZVpPRWkxZ2VFd3VqSVpCbVJZd1Z0TjB0ejBxUThRS2FGUkd2aUVW?=
 =?utf-8?B?b3ZtMldMWHl2WVZJdlJRWUNxaW51YmpRb09McUUvZVlvUFlMTEhNY2F2Y2ps?=
 =?utf-8?B?b2Q1cFFCemJKME8yRHA3a1ErOGk4U0lxczhGYmx3Wk1zcFJ6dUZuN01OUUF1?=
 =?utf-8?B?N0xUWDNNNW1JQzhvMVVWKzE5b1VlYUxkTlI2Y1lvaW1Cb0JRQWVjTkZUY2s3?=
 =?utf-8?B?akJtNndkWW5vSi82SWwzTkVETXpkREZwb2hkYjd6Q1g1RWdDT1RRUT09?=
X-Exchange-RoutingPolicyChecked:
	YJjqJU1dccyCVOnMR8OiLrFB0hkm3870UPjzVuxqYronQyPQhDmXhaFhxPLdzMYJRPDa8U5Z3hqyp8J+QraOmZnvcYojWdNQiKcC0z2o3HMdi4uidMuf+TMtpLQ+Y9waBK9DaAgdUXQVKr7ewfZEt8DH0eWi+7A1F4ouiK20aSyNyvLQTQJGqRX0AuRzqd4FKY+H0kCgaNC03ietZ/7Sk9DrdIDRrc/mSbT9yLDWVsywqED2l/aARXcPidB8inI1j8TgTXoXPFwz18y4PV/74n47yfZS0gQ0GBBHc7eyxCGWYm39duRB+IzDoONP3S2Czmqpd9xTn3f5Defy12B8gQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mQAPxI7jyO4DCu/Lee/j74ippSEXeGZ2YkVN4YPSZRWmXRmALf51/ngClgYFqE0M9TzNwc9dfPD2AHLSil4wBEcYADxQ7xKwCFCLNLtaLTZYDsVq7QZQXCyYfy24tvBZCypVLNaPORWQL95Vg+5ajSo/QmgI1fJAM/MxJd4q0YtZhrpm/R/WE8uliM5QwAMSp2oKN0gFJGc25Z0433HV8BkO6bIhgGJfgTXpJYQEtEj5C2WkHZ1M9mgGWTlbgG0qqgtWX1acMcYogiloM3Q68mYKiKUM7Y4cmukTUZI3e2aiFRQx/Gfs+D2SehyFFSi1Ut3Iz8hRcqrZ6a343VluD/876XoLIHtWfJTI6woHjtnnxOezX2FjRY5uSJeF1B+zQmQA0LU8GcBndtTXoH8Eu5Xn0Tk4qvFWlssbadh50172l5M1OBzXQDB3aQg56xJr+6bY5bHl8fhvta016uMo+VRFtsJq3VJf7tpmexq4lhXN3NDxw86PA3ntKbnu7B0VUjY7gEcopSPV7kYjk4sIb5TXZBXI8KK+UFCtZIgX2/s9M0nK31SOmxP5eqGQ0ji9dkFz/Z24JA7d3lBuhmOb/50a2wsPt4RrY/QQZIx0h6qaP6p2s3bHXKt/MwfdOrOA
X-OriginatorOrg: uwaterloo.ca
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa1c799-f59c-491a-99cd-08df42745f4f
X-MS-Exchange-CrossTenant-AuthSource: YT5PR01MB11875.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 17:26:09.3443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 723a5a87-f39a-4a22-9247-3fc240c01396
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZUgO/T0Mxwl1MHgwumwiWuyCcoHemsCU2VQnUN2Nx6LgwkFZmTP3JFS/xOPPTf54UBCQEr1p6GKUVLkXXElmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT6PR01MB11070

On 2026-11-05 16:43, Mani Tofigh wrote:
> On 11/3/26 7:55 PM, Martin Karsten wrote:
>>      if (unlikely(napi_is_scheduled(n)))
>>        hrtimer_cancel(&n->timer);
> 
> 
> This worked here too, but I think the cancel could hit a timer that a
> new owner just armed (e.g., a busy poller that clears SCHED and arms
> its own timer right before our check). I'll go with Eric's version.

Thanks, agreed, I missed that. But, could we use the new DISABLED flag 
from commit 8dc87fc5d6a0 ("net: Use a dedicated flag to track disabled 
napi instances") instead of SCHED with the same logic? Just thinking out 
loud here.

Best,
Martin

