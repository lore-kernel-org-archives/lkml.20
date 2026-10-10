Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D497D30DD22;
	Sat, 10 Oct 2026 19:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791659136; cv=fail; b=OgeAU76GtqwjhjpGQnFUUN1te+tO1sKkRamZgJKdltNdhJsY2R8/KeIYlF8Dl9iU5MeJtop6lmJ1t6yPo3Xg4/AsHmUGBP57rc3NW2wq5KNRwA+YfN2Eh6SGvMFyZ4ilz3l2zcL0fh1v5xfzHbxQU5C6+eUErq7B2+aUCg7m30A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791659136; c=relaxed/simple;
	bh=zBMfZLjRL7NuFRM6veD62mEHHGGJQ9d9kfh07euXsE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JVsfOJXV7VYDEnaL+xZ2cE+Xf1i1mwMKGZ2ylwS8bPstg4ZgdCVtLnBWOXrqXJFvd9YOQvy5Is3OiKIRcPBoVCQtCPIY8N4GKT2vsDGW2oCmkAwsxhQdePYMWXMYG8ttSV/n4O5CaMMSC5LAbWTU2U1RkQRQBRda2uY/ZlBQizE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b=KY4kdGZR; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=tKdkcc+Q; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b="KY4kdGZR";
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="tKdkcc+Q"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AIhKFc1442284;
	Sat, 10 Oct 2026 15:05:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=GwbQJSCj27RGFWB5GPEN9kZj6S6XA
	/PJFBCM3xqN6mM=; b=KY4kdGZR9g1YxkiVrKm6KAOuItebJvBiKYhzeyvqGqMI0
	swVwGPKIdlmBmBnIRcH/TP1EwbA4stik7Y2kBpSwerGwbtfXjlijvB/fuj1V73Bz
	AVo1tm0gE5MMZNKer9a3llPYjbLs4QeVubihFjvFKqo08pSBAvzB31nBpfNo3F/4
	ejQ3xdCz2rFYmhJBXVEGRThTgyE8Rpaqj3yqiOGVpS21BJFOrR5dnRDHbCa2L6KN
	SI6XgMWv6i9WHxc1WGj7mi0mlzqcxPYkTBl9Z+Ri/WzoYWIizr+TdTNRJb6li39U
	tTmHqtQOBEt1MoV6CXC56mI/ehGeNeTE5cRTS8+JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=GwbQJSCj27RGFWB5GPEN9kZj6S6XA
	/PJFBCM3xqN6mM=; b=tKdkcc+QsJO/lNTZ94iG8XIjNo2G8nkoDb2A2NnHigLeO
	xVeTbOMwvU2OCVgZqlUJt6ezTNntl3y2M3MnUiAFbcTyl4yD7nequZX0iaenmG1q
	Gw11AS5LdH7F7k8j7U0vH+5jXtmy86664WHsULe2SgF9fB9co70zDdazhwr2iayi
	1OnPRR0neU72uJWfiCSOTPGPNIpIBw1WscY/AwQifVWalbDkzX/K+85ds8CeyrHQ
	G/jb7xSlXugjSjUPmJArkQatvr9YR6UAbXLnzIS2cpNyNHpq/6mrmVebIG2cLJRp
	CGmRyuP7eth9cw8XF++jFGZM7AQw/hCJ8fmdIAYCA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4h7j92jbdw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 10 Oct 2026 15:05:02 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRmnjSC8/DJXV+s5hLf0Pyw231QuWWZC4WRuRUjXC0o1UHq+s+je4kNbUSOJ/57QgXTGYZxLNF8yIws+l5uI2h9pa5eNNWK7tlWLHxAJdKpSvQg+KR+2bV+MblrV1lS3h05xghv4z1WbbK/AyWaWVv0h8K+WZJSBOFBn4rdS7AsGATfvFRknAwgfiDb5/MYFBaJiaSYM3WYTPy9s2UYIYtCK3iemKMO4KxBdGowHH3bC87VyEVtrfsxEJwwpG0e82AYETVxv97e8qBB37uhMq9CkV7imEA0uHoR52y4N48fipXVLciQ7UTe9bEf02ZKWZvqiiUve3JKKzl9dzwvSHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwbQJSCj27RGFWB5GPEN9kZj6S6XA/PJFBCM3xqN6mM=;
 b=Dx98pCDPWEKRFPSPnnnuVwWo00/+ScIEbozWHWjaLrVzbIv03sVKzTxMNEJ+hNLitu2oJRehUIoo/T6yNpu7adbTq4TBhOi1k7+KxbcAjvjryAH1hYzxSxd1x1px0zAuLJ8wifdNBOC7sTRXLZmUqfd7S/UnDUON13NdrMJ3yiDc/TTR/Ci3yPmDiuAE+kW6MS5DqtLwy4R9lQbUHtR9NkrfJ3rX3rlER5uH5ELW4f3r8TidE0ZYPcs3GC/mCL7AfYLtvk2f97xYpLsV5tYJ+hGwu36w+5ARpixmxTsEB2UgiELktzdySDMOdgGGe8vteTCRusXZrOzuf3VzhEujhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by PH7PR03MB7047.namprd03.prod.outlook.com (2603:10b6:510:2b0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Sat, 10 Oct
 2026 19:03:59 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0496.018; Sat, 10 Oct 2026
 19:03:59 +0000
Date: Sat, 10 Oct 2026 21:03:54 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: shengjiu.wang@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        p.zabel@pengutronix.de, kuninori.morimoto.gx@renesas.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: ak4458: Check reset status after deassert
Message-ID: <asqIvOi1iQrIkB3w@analog.com>
References: <20261010084058.2365291-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261010084058.2365291-1-shengjiu.wang@oss.nxp.com>
X-ClientProxiedBy: FR2P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::10) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|PH7PR03MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: 3635e443-1bf5-451f-f3fb-08df27013cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	lbwMkOyIHEPXgoWBDB+n7elyL6TSFlQiBHf2YLaaWK7poxZ12KHfYYgYp7XlA113l36SSKO/EzjUO5rFjHjQkWcwfwWS97NqvQwA1ViGpCifiNygz7eYPAVwSJ230KORQWbxR2/g8jqvw24AnCINKoXzcMZfnqSeRUYJTvRxxtVEImSW8m8ySsyDPqGcdD6ObewCggRzf3qjTsqmZyhw8pXqMy2gtEMu5ivmrikTKVedqOmyVwW+UFCe34G/PaJh52WsxeHkWYCxd9fducrfkRijX0f8gEbtXQsaAZKN2CafwpG3FARg7ZOLaYZsMmQEXsTmfE2sonUoMaYdTlKSNMl0wJYsLJ014yi7B1pYpcY/j5naaX1fmEEMS+N3n5LJS+rd1dmNidMiNU9TxGfnUomgad6WdK4LFvjP5C2rah00fOx11wLYVRP93doqiJrC7oK2JH2JwspytWc7b/xK4zvnZq/9i1KQienED4wNg2XjH8vf1sj4fg4vjRYP0P5PLoLtt5lgFKgVrua7IEqDX91H7AFtuflLx6CN1yxS1jzeCzL6H6fCiBWEVsXfjal98pnziY45g4nd0EFoFKbYvg1fHtkAiGKZKQjQ8LdN7/OXxD8rovS41eZDWAHs4tm6kQ59+FsVqXywfSzTEoKOKw7EJC8HJC+WivtYabizsXU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUJOUFAyTmtubEhaK2wwZ2FVZUxCUElrbGFicDVVK20rT1JDOUxrVmk5RG9K?=
 =?utf-8?B?Rk5JTHl0M2JxbFJVMkdIcHlTekdxRDI5SHNUVXJHWmFDUlMwdW4wcWZNb0Uv?=
 =?utf-8?B?Q05QYWpYekROWDhoYTZlbkszdngwbmRYUGhhMXlLdWMwRFBWVncxSm04SWx2?=
 =?utf-8?B?bHFidEFNaE1vd210R0VwVHQ5Y3pFelZQazZHbnEralFGKzRKb0tLZmQyOWcz?=
 =?utf-8?B?R0tPMmlacllEYmpFWExCc0hFQ01BeFVta2lsLzc0MXRJR2c2dzViYzdzVCta?=
 =?utf-8?B?V0g1U09UankzbGFLQ2tlZ2creVduYjNNbXVxOU1ERFZCWjNucmRkYzJpZmt6?=
 =?utf-8?B?Q2ZScjFzWTVwek9EK294UCtiSnpDeFhuMUFNTUhScVlxMUs5Qm9xYklEcFNs?=
 =?utf-8?B?NjM2bS9ybHo5aGVJUVZUd3E2WnhKVHVVNUtDT0dWRitmMmV6VUYyOXJPOVhv?=
 =?utf-8?B?VDV5cTNlTXN1SzErZk9ZMDZ4cVFwUFZrUG9VR3JqcmdDZEtKNklRdm9sRENy?=
 =?utf-8?B?MklKSzgwSER5SVRxVHE5c3JreTNIeGcybEhzYlpQSS96Skc1UTBTSmFDc0hn?=
 =?utf-8?B?VUpqaVBIQ3FWM2RTZU5hU0h1RWd4enJOOFVBSExydWFxbTdvZXhpNXJoVEx1?=
 =?utf-8?B?WWNaeWJtWS82bnp5TWtyVkxBZ2htN3FDRTlUVElaSWRrcmVETElLdVp1Y1p5?=
 =?utf-8?B?SEh5UmFxQi9QaGpNSjUrdkluNm1KL1YzR1BycXZjNlZ4dFdSZEcya1FCd1RG?=
 =?utf-8?B?aFplOFIxUXFwQmdLdkRlQXh6MWsxNHRlVEhwbmV0UjNJeTFZeFRXVUIzNzZp?=
 =?utf-8?B?YTlsMWZrNzVJMlhzT3cxU0U0eFQ2NlVJak4wbFlMMWt3cXhnWHY5QmpPNzZr?=
 =?utf-8?B?WENvSlE1WGZYeW1sK2wzK1JWQ3J1TUVCYVFhVmpxM1FjemhZd2pkQnUvWGlj?=
 =?utf-8?B?a1BEcGhxcnFqbUw5WlZOOGNnMGFtbnlSUTlISG9PMWt4djBGSzhpU09scVJL?=
 =?utf-8?B?QVFlMnphMGRNaUVCS1hiZjhuTjNJZDIwb1lDRTd0UmZGeVFSWGEwM084dVI3?=
 =?utf-8?B?U2FGMFJKUXBKRUtiTlVwWDFGMmhuUjI0end4YXgyQXBoMzNqeUFPSGpoTUc0?=
 =?utf-8?B?UEo3MXBiTE5ES0VEeTYzeGRSYTN6eC9ybEVJczlpazg2UG1qQTdSYU9PY2NP?=
 =?utf-8?B?YTIrV0hYZSthZXZraGlnY09CLzlRbFAxQW5tNjZqZHVqWGd1ZXQvL29kczlY?=
 =?utf-8?B?aFBOdkEwclNTcDNEL1YvV0N2S2pmSm01b2tiNCtPQ3A4a0tvWUZQT1FYMy9K?=
 =?utf-8?B?MXRzN1J5Vjg0MGttci9UV3Izb0lFeTF4Y2xiWnVjdGVZRFRBZkNzMnUzaGZP?=
 =?utf-8?B?ajJsbnVGaERtdk9OQjcwc0pNVXh0cVpvTE9CZ0FxN0YxT2I2QWtWem8xZE50?=
 =?utf-8?B?SUhtRHh5M2owZkVmOU5uZHhKZ2JMakdLTkJlVHd2ZEcxT0hDL0NSS3loMHdm?=
 =?utf-8?B?SnBkNDBYTElYc3czOGNsTmhzN3BIeHdIZ3ZmWC9aQk5vMUhyeTFKbFRoakwr?=
 =?utf-8?B?MGtYMXVLNFRYcnJ4R2VSYkNhbVBTbXg4dXY0cFRVVy9IbXk4akRtNjhTcGJE?=
 =?utf-8?B?L3JKbGNFT1VQWVU5U0hHZmZEbHNaY0NIbW12Uk9SbnNNaHVpSWdsVFJLWTg0?=
 =?utf-8?B?RkFlT1BRQ09GeG5NTHVScFFmajdNbm1XVDNlM1ZsaC9vWWJIWnFNK3BBUlgy?=
 =?utf-8?B?WnI2eEZUUjJxeDhCQ1hwL3BPSlR3MUJSRWpoeWkzWkFCMTBUTUMxYVc2WDhj?=
 =?utf-8?B?NHk1SEJFdTUwSGhqaDlYTGF3dTc3U1VIY20ySFliZzl4QVhqUktLN2RKMDh3?=
 =?utf-8?B?Tzl4dEh6TldxOWdVdjVOeE9wZU41WkgrUmV1djREYjQzZU1IblpISVhhSXVt?=
 =?utf-8?B?aVJMb1MwV3BlUG5KMmcrcHBCZTBCTWtibHMrUXN5QzVkZ255ZXA3WmtFeWJF?=
 =?utf-8?B?ZzlFbXZOTkg5L2NxclRjcGdiVTN5dFh4Mk5RdDV5SnNGbmU3dVViY2orM3Vr?=
 =?utf-8?B?Nmk3b0dRTlJvQWt0SWVhem1rQTNNdjZpZ2l2ZXNPeXlFc0VWa0pUYjM2ZVlP?=
 =?utf-8?B?cUExNFg3aHdOQ3VOWmxBNG5IZjFpZkNzWHM1YWllbUgxeEVlcVFPNE9QNGdH?=
 =?utf-8?B?UjVwVVo2bTZQeWVySTBIYVhuNjcwWWs4N0pHajh6YWpCd1NESDdGV1YxWlp1?=
 =?utf-8?B?YndkNXpWU3d6Q3lCcUN5My9WZ1VCLzF1cWxQYUI3b2JhaG15MXF0SmFXTExC?=
 =?utf-8?B?aVZxZ0VydjZEZTgvUnVHcXVERmFkZkpVRWRMcVVZTjdzdG5tb29oQT09?=
X-Exchange-RoutingPolicyChecked:
	u3VPxYILXhHBiY1rvftavjtDDadmteOW8r2CAx8G9w2PrxI40afUTi4PeKeTaWvNzCD6L434JcvpevNV+OnKG77uoXxBIwJq+nMB2r40GF3SGvQ8P1Qc4yHl1WJThHdhO5Mbo7Zv/Wkoj51wo7YzvoLfq3V5/iNVaIKersjZfn2VZe4jHK+INlG1Lhu7KH2ru9Y/iF4AFVVrDzeJCCO3fY4lP8PXk3DUxghB45vq73Ux6oBfk2RqyzzaVY81uboMxHtSsKVecxfP62XcyLULpnjmH2PnF6AetA6w+aYJ+BECLOZpRzTGgxwcCZ6WdEze6piVZafQVM441ORt/C84Rw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3635e443-1bf5-451f-f3fb-08df27013cbe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 19:03:59.1729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GBkJbWKiYpwT4oNb66CK3Owewi29ORw4wZ2wC0kZ6DoCy2ABnG3pAG/w+xyfkOE8ogjV8X+w2ueJ9fSYdK1pHXczAulbT1sQurQeHwUxRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7047
X-Proofpoint-GUID: PvWpzZ7i-Ku9RTnwf_o_t8dy4rlYA06B
X-Proofpoint-ORIG-GUID: PvWpzZ7i-Ku9RTnwf_o_t8dy4rlYA06B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA3NSBTYWx0ZWRfX8RyDTBiltrGd
 PsmtsIIpRc6Jkl857TrdHdP8lXAPLajSoPM9FsYCEEQz6VsWMGUOaaYE3azd+ZRtZB6jh4sdP+i
 BeuU/C9BBtOAbAaF8Ha5q61lZHSiPy3/iggcu7V1KcCB/vx9NN+y
X-Authority-Analysis: v=2.4 cv=R9eWitRX c=1 sm=1 tr=0 ts=6aca8c5e cx=c_pps
 a=+kBkz34/1DjdJIz+AnMsKg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=8AirrxEcAAAA:8 a=hLaThcydWDM4CuMEj6UA:9 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA3NSBTYWx0ZWRfX0iaCaClAY8a4
 aeilpLLRFQwRwOpS5mKYfWT9uNk1ig5RVUYkMnmh/0EvvHl97an7mizyU7vvOr7mJ4olBdxB9TI
 ZyoDg4sPDoZUgjhEpnZEx2dLH4KAsw023s9K7bGqb24oY9+B16shLogrUO3TSSooBxXpcExcJ0q
 FmRIZyzY89QWmkVBPM8ug31AOsWibcCXYMIBMWCy72ESYFIKi30othIOZ0Q9YBWvs/3a5Mfk8dj
 oO6ZrxOKuhPkh9K0C9VFNMrED4GGfkmiN3HSRUsHFfn/NIpYu8nkzplzpJxToNO9AhvXKKEDHrd
 RQqdNNjr20CoZRjc+He0kx36MUNaGgQnnSE6EKR0e3+/wpKF6/oHp7DqRCpJKTQ5l9YmOMzKMaX
 xLOaIzOy/k+rC6GAeA+H2Po04iWgUbQWG5BWjxp/lVtlso98qJ1VoBQLn5g9KSrCqdalTXRijH8
 VKbd+OHMUxWltWYlkLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100075

On Sat, Oct 10, 2026 at 04:40:58PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The reset line of the ak4458 can be shared, for example when two ak4458
> devices use the same reset GPIO. In that case the two codecs may call
> reset_control_deassert() concurrently from their runtime resume paths.
> 
> Only the first caller performs the actual hardware deassert, which may
> sleep (for example a GPIO-expander based reset controller). A second
> caller merely increments the shared deassert count and returns
> immediately, so it can continue while the first caller's .deassert() has
> not finished releasing the line yet, leaving the device still in reset.

This seems like something that should be fixed in the reset controller
framework. In fact the issue you describe seems to contradict the
documentation of reset_control_deassert():

/**
 * reset_control_deassert - deasserts the reset line
 * @rstc: reset controller
 *
 * After calling this function, the reset is guaranteed to be deasserted.

^ (1) seems not to be the case as you have found

 * Consumers must not use reset_control_reset on shared reset lines when
 * reset_control_(de)assert has been used.

^ (2) isn't this rule also being broken in the suspend/resume path of
      this driver?

 *
 * If rstc is NULL it is an optional reset and the function will just
 * return 0.
 */
int reset_control_deassert(struct reset_control *rstc)
...


(1) being fixed in the framework would solve your problem.

But (2) seems a bit more intractable. Shared reset GPIOs have always
been a pain... I wonder if there is a better approach?

Kind regards,
Alvin
