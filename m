Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A5E45A2A1;
	Mon, 14 Sep 2026 12:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388374; cv=fail; b=OPBKrVqrQ36lkTE7IIoiWoyiW+jrrP06mGlDmxOdY9RzWjB2ElCRRmG8b1ZmFCdIsL2tcoqsXQAj/lWN8lWEkWoGM+7cCDYNwV9km27UmnD1noV/EojYNcaVGhykJwEUsj226BY+vnx7BvMheyVqFbdXC71BfXBw5ACpE1zDJyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388374; c=relaxed/simple;
	bh=8+qr+vwdnYuq81SIvEncbRPJbIgW0CoSN/5cb9TAisM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rywek5MYlbtl8wLR/G1CM4+bHqUbjjBj3UNop/C6QkAqkkhU+dPMxOajWQaahoe7zC8FuC6JQ5qhJnmQTj0rlSipmSIdIdGor3GDsrYnIjXbGrS7tHOasxvW2d+9V6p3thfT68u02fV8PyKi1iQoFwVOJxCp+5QT6cfTYL4TN3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=kV8ytkid; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="kV8ytkid"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9o2eD2313551;
	Mon, 14 Sep 2026 08:19:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=X3fU0
	YvVseOkQaIxZ2Bbgpec/FHHk6S+pZ2vHIlTu6E=; b=kV8ytkidHn//1rguMQtVk
	CWLir2+K8gCl+/6DQNDBy0qzuOiGb0X74TFI2g0yStrhm35sOw+wgRFc0r1MySLk
	hPC7tfaZJw6QDoX025IZJouNdCVH3NA7ZFVHJ1kzMoZWvyav0RgB3c+lezDXSgZr
	f5EVWKDU/qArW46eOhIjQS6N1AadsyaLZ5Rroa17NXz1iajziu26cyL6YVUwUPpP
	hjhcfw2iltZRAdz5KalU9uq7B+BUV7DNkN6mdhrRLcS7LC5zSzdQSxXUEdvITjyU
	hLWoSCgEzBlkedRrZ41ZtgZaRz99y/UH2dKPPbIYk73MMChHl52RLCCnU4r00HW1
	w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011031.outbound.protection.outlook.com [40.107.208.31])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gn0jy8nmv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 08:19:04 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgeZODN9nxRBlnilfezLkPKrEEXfX8JJdHPD1StMQexoQb2xgRv3w9swMrATseVrUSzzYB9b8KIvaT+GVorUhe6T3J/sJPUHdCm0afcCzxyYfes+v2HoYZhVQC2KO7L42lbDqK3xZLdErR3pBO8Ez/Huy8OME9vbckmfQUeWvRoDU5YHPLBle15alpkhnuYYtHaWVycZgsly5KsxcGOFVu4ZqN7L/epIsZI/h+SjRGP2WDs+MdU/BpEsWZNjSJyONcLUM5BZStsuBumJcvXCJ77UV1bhzjcrDSsJREZK9RktZ+f7amheanxTTRlzFjxstElz21DnRLzdZIgYAVlXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3fU0YvVseOkQaIxZ2Bbgpec/FHHk6S+pZ2vHIlTu6E=;
 b=wTMpVmoJdAOf1cia7bYnCdOrZH91AK1Y9RTyWiH7gt7Tw5BjqENutc9cP9IQOF8tXFHNJjzDGAF5krpzBMoPYZvti4Rg9V6QnqgetEuIsMQduIIxXF6UKqmIs2Im6O1Zh7bY3CqiS0mPjUlpbSQdE0ab8z22WbqJMO82gyo70SC+cLMCquZ6TIJ+25TaGxROm7mNixFVin0qBuIwvh96kCeDAZlU4otUZU4CnMwmG81R0OvTBTsI6pJonsVjfL3jbXixXiFGDf5DlujjmG7I8C+y3/Ks6+bC+GUSfjlChS8GYeWAb4SPZFg+YevGbL2KFETxv+LJSSbzwFbOReXwLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by SJ0PR03MB7077.namprd03.prod.outlook.com (2603:10b6:a03:4d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Mon, 14 Sep
 2026 12:19:01 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 12:19:01 +0000
Date: Mon, 14 Sep 2026 13:20:16 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: adau1977: small fixes to make the driver more
 usable
Message-ID: <aqfmQfkW3M3Uqmjn@nsa>
References: <20260914-asoc-adau1977-fixes-v1-0-aa2f0cabd728@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914-asoc-adau1977-fixes-v1-0-aa2f0cabd728@analog.com>
X-ClientProxiedBy: MR1P264CA0137.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::21) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|SJ0PR03MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b99ea7-4e84-4e65-d5c4-08df125a5bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hg0kieedGctLfmlD3Te91n1vwoHcqqHTUQYVdVQia8iVfbMcpP9fWO3Lt6bBdiGyaFK39i2ISNMoT0l4np+hmS0KPlG3ZqVKeKR7O3ws+m5DMExXjW3AcOrIiCYPmyfY34Oh2UpCRJfXwq96bHd9h2HVEKQuxtz5QHFXTxmrYG9RIQvThOguVbIslqPHBfyQyu+zL4nOtuwFpF3VC7A1Qe4AwsVhKymofiEghhs+QCAAuiGEHytkrp1Q09zYZ+8ijdbAONkvRgBuO9OlD/Fy1bICLEVdiXENtXClW4ZbexLGtDv1XNXf60aL/iNvCaB8Q0Fjb47UxvhQwZ6Z2Zd0LhHRVbSJB+vxLbib2Zee7ng7cNGuU520nwk2imo6PB9hACQKZgxJ/qCi63wLIIywQrkd+dX69cDhllzDL4yGb03+gr2vayDn3xT6BhRaWuFOXhabsT7vu+S8rN+yNkcTJo4djAzkg9+fdjhvyTkjzerNaxCs0VVUEqXan7jrRQUUi7qXUpHqiThOEBAx42+bUAjzb7DURZ+eWM+C+XmUY2vAhiCUzX0cKhc0T7+EwKjJ6XmOt7H7fUMfYUrJdlXfsCRudIGQoosHxjOMj+3kV9H/TiW4mW/vmNg2+uIt/sD541bwcINp9AilVlIGbiAcdAo3MNGmOS1yRnKvKeJEd20=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnBXWFB2b2ZCYlFWYU15bUxlK0d4NG9DcU11bWN5YzMwZ0x5cnVUbndGRVlo?=
 =?utf-8?B?aU1LRzZmSklGS2d3MDdVZkFBQkdZMURuYXBOZ1RQSGgvNXJHSFVRdnROTWN0?=
 =?utf-8?B?WldMWmV0ZmN5WWhOMDNTQnoveWd1VDlrUTJ6L3BZMHlYMFNEeDdkUFpXa3JU?=
 =?utf-8?B?NFRrUlpJYmxxVGgyaEFPZm9ON3drOTJzTnF5TWJUVlVvVmIxaHRJZVE0b2tE?=
 =?utf-8?B?aTkrYnF1blArQzI5Z1g2YldFR1krN2xWOEhLYy9uTUlPNGFNVWw3UzVSNVJK?=
 =?utf-8?B?cmRmL09KZG9YblZqdnBUSXo4OUVUdVJ1aGJ2SGRLU1FjUUlGRXRxQ3NlZ1o5?=
 =?utf-8?B?amRKYWJ4THpyRmJjZ043SHBvTi84M0E0cUp0bEtmZmxKWFUwQkhRQ0dGTUlr?=
 =?utf-8?B?ZlJkbzRlMU9SKzhZRTc1RlNGZUZvQ3lOamVmckRLVzhZWFd4U1VQTi9qOFBM?=
 =?utf-8?B?ckkxWUZINzJ1K2NrNExZTStnZnUwc1dhdU02ckU3Y2w1TjM4ZmQ3Qkt3eVc0?=
 =?utf-8?B?N2lkbFd1L0I2Rk1nMzNMaExVb0RXckN1MFVoU2ZIamVPOG9tWm5nWmpITGVH?=
 =?utf-8?B?cERVaXM2VlA5UnBKbm1PSzV6dU44cCsrV0xIOEhVdkRjZEw3TzV3M0dmSXNn?=
 =?utf-8?B?bkh3M0IrNjkramVvRU1ZancwdjRoWFJhaE9PelRKaElOajF5UjQ5cUFKRHNP?=
 =?utf-8?B?WnpHaHF1UVY0YXhCdC9FNFU0SkkvSUJTTFZqRWZra2xObndlUHNqc3ZkcytM?=
 =?utf-8?B?QXFSZ2QwWm5zbmhYZUhDRzYwemxzUyt1VzlnRExPbHZ5cUxGekJDMmJVMTJh?=
 =?utf-8?B?QkhwdEdaM09qWVFZYmhJMEx3eFM2TFVLMWlBcmRwRVk5NmJLRlVBejNWcEIz?=
 =?utf-8?B?TTBOV3YyWW5wQzhLNzdTRVNzbmpRUjdqdlc5VmtNK0llbVpYYlB5U3ZoZWg4?=
 =?utf-8?B?T1duUGtCTEwxY3pRbGI3NkJ0Vm1RMWxtQzRoYWNlU2JFaklrajJ0aEZTbVdT?=
 =?utf-8?B?cXA1Q0IzREExbzM4UHM1MUQ3L0R1dVdqRlUwQ01JZkIwejdabXhIZmcwdkxk?=
 =?utf-8?B?S2hLT3h4cmJxcWY0V3Q3eExvTEZHNGZGd0d5RVUvK21sZHFOV0VSUmhLdWRp?=
 =?utf-8?B?dzFTL0V4NmFmUzZrNFhRa0MrMWNNKzRBWVBRbm1VTVgwOUxjeVh0alNHK3hF?=
 =?utf-8?B?UVMvTG5qVmVnV25heHpzYjVJZSt1U0dWVlVkU05TbC83azB2WUxITUE1RGlJ?=
 =?utf-8?B?cE94UFc4Rmd3WU5DSmRpMEpBWWVZMDVvb1BNMWJ0MTVZZmliTFhPOHBzU2o2?=
 =?utf-8?B?bWFteWJRdmJXYjVwRzl3S1BZWjBZRE1jWWQ3SDdtSUx1SytZbFUvOFNMYi84?=
 =?utf-8?B?czRyRUQ4Z2RXcXk2R1FGOWtYRlptZ3ZtdFlWZmsrbmtpMVNlam5jZjE5YTJ4?=
 =?utf-8?B?dWFjaDU3ZFF3V3AyNUpTSjhBbG56ekpuQ1NjT1RvS21RTVdMSTBaV2tVR2Nt?=
 =?utf-8?B?SHhWUDhTaWZ2bm9EWk1LYzVzTXVRdVZLcUZ0a3dOYXpxbzNOU0FadU9vS21F?=
 =?utf-8?B?UVg3T05GWHd0UFNTZlJYRFEwQUU0c3RVSDZGZUQ4dTVCTXV4OTJVTmV5eEN2?=
 =?utf-8?B?NFZNWUVEZ3YyTUJvZllOdUMwcTRXSUpnWHU4ZndqNUlaMURMR0xiMFBkZ0J6?=
 =?utf-8?B?Tms2L1lBc0E2SXdGVkxRbnNEWEpCMFFKVjFDaFd6N01qcElXS1ZhOFhXaVhU?=
 =?utf-8?B?S1I1c0lnUmlPbXlmSzJ4TGQwRy9iSUw2RFZ1TTI5Y05VdGhQREt3OGI0NmhV?=
 =?utf-8?B?WExNdlBmZUZpd2JHbDE1WitJUkhhMDN6VHUzcWJ1T2FhbzZzUjV2eHc0Wk4y?=
 =?utf-8?B?V3FJbDA0V2FWcEd6WGRKenNUMFZzSERLdTJHeUJ5bTBYWUtXZ0dXOVhRdTBy?=
 =?utf-8?B?ZWQwZWdQTzhtQ2xKcE54YmtvS3FMYVNQNEowMHJvdDlzaisrYTJjSzZxeDZM?=
 =?utf-8?B?TXpZUHBDS0FMNDZCaXNHYk9mY0RTWWt5N1pqWCtTVXhqa0d1M25QUjNXdDho?=
 =?utf-8?B?QjlYVXV2anJrSDlBRTRGOGNFRVMva2lBWHdvbHUyc2xxM2FiRzE4aElhbnlM?=
 =?utf-8?B?eklncmc3YnhoN0hqZ2E3YTBsWVVRMTNLVjNGbkxBOUhiVmN3dVZ2eDRRcllr?=
 =?utf-8?B?c0FqRERMMklkTWdCdW1XbmZCZkk1ZnZ0TmszSExHMU1POUVQY2phcXI5TEI0?=
 =?utf-8?B?ekRTZ2E2am80YzE2VEhLVVMvSkJBTm53OWlBWFFwU0lrM0NYb2pBRlF5bW53?=
 =?utf-8?B?bGRqZ3d6eE1OaTNQcHN4L3dFcGtqdU9ZK2ZCQ1hoZ1ZMOU1razV2QT09?=
X-Exchange-RoutingPolicyChecked:
	UO4ckrxjvUCims+YtoA8bIfQXCjChg8hO9xtDNnsvKY0UsKBjtc4eFwrgie89iX+KeEwKdi6gZ7KnueAzvjHpUZLqM3F9Ovh7KrRnFkYD7hj1qUxt86lD5uK0gFiNtFS3hb6nNEsI2dJYDKZZfzQAVYlh8jlamqUayLrfwHJbZDH4CPZdkv4yvVjDY8B1FY7GYozwA3IqaOljKA4oEqLQLgH2KqKQLd27HphTy23jhfUPYaYADUS+tSfK/8q9EaojOBJzlev5eWFKXgNzvlk8WlmX3OnvAeD/OcZjzz4W4cfwsImNJw4svZBP5q4aLLCKaa3nVo9MnDE12SAd1XusQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b99ea7-4e84-4e65-d5c4-08df125a5bee
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 12:19:00.9735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yoeaT4W0Dt9gMug0UJ7Fovy9rnkePiTZhZ/lLIw0V26/YXil/bR5pFDkAUJkNOhKhPV95BqyLWh55T+PiIJBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7077
X-Proofpoint-GUID: mR_2qZDioeX6tUo6daVMOzgDUiqm3akl
X-Proofpoint-ORIG-GUID: mR_2qZDioeX6tUo6daVMOzgDUiqm3akl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NSBTYWx0ZWRfX6iQQ1yZs4EWj
 p4MXRO7z5KoZyl/SFa6/0vtYxPsfwXpposHroakAKFtVe+xJW5K7pMsJX+vL3Sdvcmb2juRaWJh
 oiKiyQYszAp+Lu8S6wVDxGdhm5Y8YcZTM6c0eV1f9CGmMAFZxmxd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NSBTYWx0ZWRfXwH1UMrRs8Blc
 2EB4rRNqA0GpQWbx6M/ugJBI0g559noU9NLi1wLJ5F+9p43QaVIjEI2BxCIarBvFiGHRWyMw3iY
 XdFZbvEM9Rt7LcGqlPMbUj2/r70dUfe+3h585BOGVY3N2zyCvLtTY3jiY/0tinThXLgdoKDV4zh
 C1054F6E73G363N134oMYpEUIJLO3x+2viEI570K+qvAZ+gMPtix+I+9j5SLImQIjVh9iKY1MqC
 QKVC2yUEsM9zjLu0bSCR8aFhXAw8uNw2ZnL5tTFTW58QDxChstVN2lW7HCu57GU6zAfsDk4f5Sm
 JY3P/ZWb22g63YluPJC5SmAYyWrKaxO4jDwKTo0TDUZzZqVyx5WaKZN4cCWWt8CjHTXBvSHJc0P
 9TCsMPEf7VkNmR+luIxSUdVXL9fd+iww5tTECi/THavXLYKhBxjQo20QXvQh6W4O+AgXU+fgae+
 qQUAUutlK99uBM43Nxw==
X-Authority-Analysis: v=2.4 cv=WI/qzXsR c=1 sm=1 tr=0 ts=6aa7e638 cx=c_pps
 a=cMqFfNUV/FaVxlb8CdtUVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22
 a=gAnH3GRIAAAA:8 a=B9o4KTmKlQnMzAmxqXsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140175

On Mon, Sep 14, 2026 at 12:12:34PM +0200, Alvin Šipraga wrote:
> Here's a few fixes I encountered were needed in order to use this driver
> as a module together with the simple audio card.
> 
> Signed-off-by: Alvin Šipraga <alvin.sipraga@analog.com>
> ---
> Alvin Šipraga (3):
>       ASoC: adau1977: make the Kconfig symbols user selectable
>       ASoC: adau1977-spi: drop __maybe_unused and of_match_ptr()
>       ASoC: adau1977-i2c: add OF match table for I2C
> 
>  sound/soc/codecs/Kconfig        |  4 ++--
>  sound/soc/codecs/adau1977-i2c.c |  9 +++++++++
>  sound/soc/codecs/adau1977-spi.c | 12 ++++++------
>  3 files changed, 17 insertions(+), 8 deletions(-)
> ---

Small nit from me but nevertheless:

Reviewed-by: Nuno Sá <nuno.sa@analog.com>

> base-commit: 7e125889f1705fc6326679a3db3b4159f7a8c87e
> change-id: 20260914-asoc-adau1977-fixes-86cde36468a6
> 
> Best regards,
> --  
> Alvin Šipraga <alvin.sipraga@analog.com>
> 
