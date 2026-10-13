Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942C84EF13A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892263; cv=fail; b=fxSU0ERvv5fAmtOLlwY/A2uzq5jJvECgeEEDpejvVnbVCkRRBpskzyy7yL93e6xstEWmrXTZV1pWinFpGABhaSZsO8W3gSR6eAo4U43Ejl3BibOQzr1nxL+tKppXNvxGFWn9F69U2sM9Tf6nnG5XQOkygufZ3eTB9zm6mQQ1qJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892263; c=relaxed/simple;
	bh=OtHHT8sjzK1B8FqywnOFSUJvoiem3LKdA+qy9f4Ae6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZUifYEfhpe2oI4+f+53wRMgvxSjl/NrIRtJP7tWDBqhRh/jnDVO08Yojpona0VAgOukh2HIxtP5w1qwCIdTD0Hpgj7nkbyCyIgYuECgSml0XpnP/2jYB4sxA0roP9wnpTRvRY3EBHjbZJ5aYdQLiySmpinDjVCjrV1roeI2JLy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b=nGOkrYi4; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=PrSLcxjQ; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b="nGOkrYi4";
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="PrSLcxjQ"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DAxGBD371475;
	Tue, 13 Oct 2026 07:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=c/BmSj6mwBVh8O1AntvLrg70WkucEHJtdjIQNywpZBo=; b=nGOkrYi
	4uJjj8o5JrM1VzT/0d8y9ew8epDlBd2YdGZ4+BmyDsNH4fqyUig5wbQi8TUScjb8
	p+BL5Hoo//yn7tqLhnJj4KuyrjyBOOodX+ADq/iZY9f6jkU0JqjhMUkW9JUdUaxI
	zrShU/R85kbApNVH6Q7oF9kFe0ljpb0rUguyvsYhdDPO0woaWfej3nRpkrsqQYw8
	3aGLFAvZQ8B+nIQFab9MhVQI2SzRb6ITJY6by/l4xtLw4oI0IDThsNaoq11I7rEu
	DOU3jaaYybV44CXEBrSIvhvIsEgLII+/k2/sFUow+dLiFKm/6TXZyrbT9P44weyz
	WixPhdzFAGA4qvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=c/BmS
	j6mwBVh8O1AntvLrg70WkucEHJtdjIQNywpZBo=; b=PrSLcxjQdZYf1E9w+8TJu
	wrS+LuBJHQNj/zI5rYpON4Wrh/mWySC10kYzh8BZ31426HC07/KoUUwfXUQkw7wC
	FVZL2gHfPxgxbjrVpa2JQRLSFI+MZCpalRBRyj+cEE+tnA4tBg8ld0j7AkKetXj7
	09CVCoZ4c2UyXPfOOCkCRk1Ii2eKLcUAfqLTMCGv2UExZXIKDKLySRtc6BZr1rsg
	aEJVq1tMZepwa/XmOBFRvcfBjOGr2As5vb0Ct0GE00bvaQSO4C5KByHHflGrk/Fy
	tDmFrvisoDvckA7DF5W9wFmdFyFKFKP36fEPxq2YXqKqbxo+1Zpwn0w8ZhyauhzP
	w==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010029.outbound.protection.outlook.com [40.93.198.29])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4h95uwmnva-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 07:50:41 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bilp54Wbrjrb3DfqApiBtk1JMxvIM1MLswikv+BJfcDEV5Q41s9V3iRCASFpnXa+uf3jTFAiwA34i4TeZxwdledrEJYIWAVEYjLSd5gtYm4Q4UupnqP8IZ/0zVcutyKiYuGOUT1ypj4QaoJ8HeaxXK/TSM2UKbxs5KENlMbCsyVZxo6jk1mw3Fe5sYJ143Wtuz7s/nPYJJ9Kz0FE14I9FdZBssz12xk0PK5+UYrsXQN6CPjhcwUYVvLClmqvZHUsYCdQnCvyJk3pudHkzJ63r9jyZsco7/695AbQpfB3ke9SNTttl1VZDB6XGC4qmtJt+ftmin7hUIYuz8ki5LVAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/BmSj6mwBVh8O1AntvLrg70WkucEHJtdjIQNywpZBo=;
 b=cscQqclvXLA2jG4YtAXr4doygRS6zFHBQiBQ8AlB1y2ElJprXe6W59ea+axANXmTrE5PWFBwzkny9Au0thUDoBN0sR31zLl1jqDGAyhdGaHVgfzqFMTudhndMg1Xw+xHJOW/QXTG1au/SLYQ3l8HBSVrpZOHBDRbpy9jPbhfvXK7csecOM17Bg32XELlGAb4Ye4tj2LnJn5GgzGsBPIUZLeGNA3fDIpfVoOIPaGYlERU7BBkdoj7O6C6W6UkXxdfOUjDUSpOptwxHPpxF7IqzxIhnglkx5/+hxXC6mw8JPDlghxIeEWB5HrTtERrY5uQiKBxKEiZyNlHk/hfkOxL7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by SJ0PR03MB7152.namprd03.prod.outlook.com (2603:10b6:a03:4d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 11:50:37 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 11:50:36 +0000
Date: Tue, 13 Oct 2026 13:50:33 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: shengjiu.wang@oss.nxp.com
Cc: p.zabel@pengutronix.de, hansg@kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org
Subject: Re: [PATCH] reset: core: Serialize concurrent assert/deassert/reset
 of shared resets
Message-ID: <as4aMMUtzZez4b49@analog.com>
References: <20261013101947.2478989-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013101947.2478989-1-shengjiu.wang@oss.nxp.com>
X-ClientProxiedBy: CPBP307CA0018.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:2::15) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|SJ0PR03MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 092f4929-add0-4555-13fe-08df292031dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|261009223027099003|11063799006|5023799004|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	0yzgUX5++LseIV/M28AypPNz1psUZ8ogCZZSHBmChHI8wJWk4VZ2iWWFZ7L2TH3V08tEQ4pGCOjVPVjv8mNMJb9n003EkJq2r1j77gs2T45nogZA5ehOh6BfvSvXfOjVmtmrC5gGwWNdMPHZcjV4jYS6tm2p21pdRkkRgziD8TQX7YTDMFtm8Nboz6v98zycDc4rplNRfuLAAZGQo/OijJwVCFpdiPTYxaLsa4F0mH4PFAc0uqX6J8v5UWmd9Y81OklMaY8ezeBylZEAPulA0tO5bbKYXzG64PAY40sgMCfZoj0bGYQUdmfMxgKaYqi3pk6MAMxCltTgHEKKhnMuxb325vjnVfHZF9rEllJ9w1Q6o+RmIvOJwTBCXnBcP3Kth/Pki60i8ngWE+k8Go0Hy2CjwI3KpF9rD8FxKnMHDjK59ImLJB6HFdvCnbEnbqjss6SMrVWl/ZTDeaaGXS371m/DsbnbHHSizfLEhvGwdISnPV2OE6Ybe8vGw4v9If8zxlqEMhFewJa84K1Oy4+VfuhVrP9MnWzXzWeX5p8APs86XyRAHPAXJBHwKOso4b+15aL4mgKl4Z9BXrOiYHYimCvp6+DEYSKLMkpeNnZNMORDhysyt7CEZkDKfjgzH+je
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(261009223027099003)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHdjcW9HRHQxUnRYRUZzUkZNa0UzcmF3ZWF5blpST2JzYml4WUQ4SFZsVkhP?=
 =?utf-8?B?VkdIdGs2bkJWeXpaNjhRc1M1TGFha0hXenhyOXQvQXRjc3VadkJqRlNsK1ZO?=
 =?utf-8?B?RU9UTVUyTkpiQXBiUFNDc0RaaXAwb2dJcndRR0pJREwrUG4yVy8rUC82YlBr?=
 =?utf-8?B?L1JPUU02N085L3pKbmNYS3RkL1k2ZDBiNVd4SEFaQnBqMHgwZnhTK3c2NG45?=
 =?utf-8?B?czBqd2lCM1NiWDJuRzMyL0w1Y0ZUNGJCOFRVUkYxOUh6cEk2WXBHYXhWRnZK?=
 =?utf-8?B?TGdCeFE2RnFGMy9pM214OHB0YWpVRDVOajJ0d2E3TTQ4a2dUc3lBUkJ6RlE2?=
 =?utf-8?B?cEQ1WVJDQ1BTdndVNkkwY1IwSHpuM2Y4YndrNDd3WXNYYzRqQUtZSlpRbG8z?=
 =?utf-8?B?SzFicFlBR1JmV0xKU0laMTg2ajV1WURjTWN5Qm1tNDhIbmpRd0xHUUxzQ1hG?=
 =?utf-8?B?UlhaUjNWNFZNdlFGOU9sdGRmQlh1blZMYmkrWU5jSUJ2bmFUR25BNUxTekpD?=
 =?utf-8?B?WHNZVmdmUDNuSFlwb3lKSjNJYjlGVWZlZUdXbm9yaUJ0aGlqZm5GWFhlQm9r?=
 =?utf-8?B?dE84WjNDaTg3YU9lTTRlR3p3ci80dS9ZSHREY21NYU16R2VHNXJ0OHZsclRE?=
 =?utf-8?B?eC9kQVY5QmlSTUM4bHpTTkkrdWh5MlhTcFY5M0dsM3BzUHB5dU9qaGx2QXNJ?=
 =?utf-8?B?Q09JUnpRVk9YaWdRd0dsd2xONGptMmJFZDJXVUhiM2NPRmdibDI2WFBhREpi?=
 =?utf-8?B?R0JwcmtpeTFHQmhwTGsyQnlHNnRwaW4vTjRrSlFsb0dNQWxZRVV2RGtjbU5z?=
 =?utf-8?B?L1Z0YjYyRFBmTzhCOVo3bUd0RXJpUWlXbEpobjA2cFBrOGZOOUZXTGZmdnZx?=
 =?utf-8?B?SWE4SXJEeXdvZzNvQlFKakpSWnFNSnJwL0JOaFJ5K1dIVlRhS1FPQmxQVGsz?=
 =?utf-8?B?TUxpd1pxWG9hUUlKdGIxQW1scGcyUDNqVHR0WElLbGRsQUs0amF1UkVYSEp3?=
 =?utf-8?B?TC9STzQ5dzczSUduSEJhbjdKaVVjclNZMHlvMzNIK0VrS0RGbXl3OVBuNkRy?=
 =?utf-8?B?c3Bvd0xhWEVBQlUvMGNuOCt5RjZWcVBvaGNTUmV2eTRFQ1BVSTB6YmRuNERK?=
 =?utf-8?B?aDNmaENYS1dqZW82ZzRsNXhpOEtLZmZMUVdZRW9NZDFUbnBPN0dDVHU2QURS?=
 =?utf-8?B?K3h6MExCQmRjU3R4VDVoRHc2REFMRXB0MUZTaDIrYVlvamsrdFNVZEJCOFli?=
 =?utf-8?B?TU1wb1A3amJLeXFaekE3QktPbXRwQmZobWhHTzlNc0pEOU1yNTVwU0VvZFFY?=
 =?utf-8?B?RVl2SGxpdGJLcjIyVUl3VzZwT2J2TmpqUVJiRExuM2FUUkcyaEJtRU1TMmF0?=
 =?utf-8?B?WU04NU5xRUN2MzIyK0x0UTN1MnF5WlJxZG5EdC9IOFhKYkR5dFhzYjZjSUdl?=
 =?utf-8?B?RSt4aTBOWXJzVHhHU24zVnJlNTRlZGRuUlZxRnA4a3k2VU16WS9MMkExblcw?=
 =?utf-8?B?clBKTHdpRm0wc0h6dExucE9DOEY5dG5HWnIvK2V5T0FkbS9wTGxISC9XSGxD?=
 =?utf-8?B?aGVhek84U1Z0RDh3bWI4d1ZsLzJwQm5GVkREM3JZdklHNTg0K1A1dTlQQkd4?=
 =?utf-8?B?c3VMRVk4aG9WTTh5dkVLUkJvWVIxMW9LWTVJRjRHT2VrcjdERHhrRVJ4eWg0?=
 =?utf-8?B?TXZERUx0SkRHclhpb2RlcmxRYWlzdEp0RFBNemNBN05LMlJmd2JDckxkRlli?=
 =?utf-8?B?KzRuZ2kvN1dHRUxESUllU2VwTXM2Yk9QVHB4b01UdDVnQXo5RXMyVDkxdHFi?=
 =?utf-8?B?VHd0KzJ5WUpodVIxeDdBdmxpNUFhc1NpTzNDa1JDajhhSzdFNGhvMXF6THBn?=
 =?utf-8?B?MXMrUHptd1RWelVBR29EUVJsbVlvZDd6bXJsSlBLN0t6VEUxQ3ovT29LTEVZ?=
 =?utf-8?B?cFRXVkJFb2YySDl3NTk5YXg4d1I1UnZ2NEFGcUNZUzR1NUppRzIxbk96K3k5?=
 =?utf-8?B?TWc1RWN1NHVFYmtxd1RUeGVCSzdvbDFZUC9icGQxNEViUm5RZDA5ckpIQWtL?=
 =?utf-8?B?Ymp2WkRJTHVNbFQ4eEp4VUR5R29tUmI4MDNCSGxNdlFhVmJReWRBMExkUWFn?=
 =?utf-8?B?QmdTRjJoVklYZGt2ODduRmdtamk1SFhIbElTT1lnRURwTGVlYTk0S1F0RnVE?=
 =?utf-8?B?akhRTFZnU3hYazkwNFlRd3Uxd09JQXJ4UVExdGx1MFdYOW1sZUFMZVJoU1Vz?=
 =?utf-8?B?aEdVcC9rMDRTYWlFVVZibWFhL3BEakpqQ0thRGJkcmMzdkRDR3VxSCtON2tE?=
 =?utf-8?B?UXZsOFpTbStHOURkK0xDZ0J3d1Nxcm13b29qbWZpSmU1MzJTSm0xUT09?=
X-Exchange-RoutingPolicyChecked:
	30CyXE5dCeiIc3Y9yo6r2KJ8Df0QZEvjtKe44Udo24v7WpJirVNINv85UYBvPceBkS4i6lPzzG2b3Sg09ozsCpsrHLlJEhjV8Nd+Z1IN2aXF/R6W51DDOfJ19NeHHTi9IxvsK6Ta5Vhy+zAnT6EhguEPHfrlS3P2+ldEqMH7gqAO7JShgyQoI7KUfaK9/tM/VqLTHF/A5P1j8duMYdwm7KbGodj7QHY+t5DBlnGeJ3ZMYGZxgDKEdpTWHZdDzZb60XgmV/YrXPd5Yg4PaeMPTrxqmQP0MfKtJfoDIIRqaANFXVscFU/SkdvfYyJ7Rza3MIFGc1hqjsGzJ9YDN17m7g==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092f4929-add0-4555-13fe-08df292031dd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 11:50:36.5284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zerH8ADIUcDc1r9uEBCEhUAC2R/05ESkP80YrG+F4yrHNKB0kIy5L4w6yU/HA7DFuxo5xWDczt41HksIpiwt9x7SMRB6CJzW6uzvzgjQVQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7152
X-Proofpoint-GUID: 9_xonoqxt-1LtN-t_lpJOjVUw9mj4Mbi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NiBTYWx0ZWRfXxPzEACXLOKMb
 +1v3givUR4zjfpx+MtP+gBNRP5WgxshYAqo/hZ20jh7KarDi0WThzha1z908I7i56cv5f6HauhV
 lfNeSeSCd/7ibQ7KzRRcvwT3O/n5MGHgtnPNem9gwq8eEI6O7ouh
X-Authority-Analysis: v=2.4 cv=ZPxCCn7b c=1 sm=1 tr=0 ts=6ace1b11 cx=c_pps
 a=KMP5/9L46olBb+slh8+hsQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=8AirrxEcAAAA:8 a=czEU0A4e7VA8ZEEKSUQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 9_xonoqxt-1LtN-t_lpJOjVUw9mj4Mbi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NiBTYWx0ZWRfX2tuazHZBucQL
 oEBJrjMi+ATzuwZMBDjW3P7xv8Yk2oIK3ypwys/xri3nWqytImU3mVLN++3f+hzSnF9Ee8UKqJE
 5XTW+GkBgJptwtm2lzvLKYOFEIe+Mck3gBMd/myKeu2AbzHy13FUS8cVDPuS/4eYPvyMp+ur0I8
 W2f7/rwBuWE0shaJ5UTvGh5EsOfINBb5l4A4igPV7N5ISxoiO9h9l4NMTRjkhu9W9+T2mJSfVGu
 iXzCaaEJw7mPyJDQmE1xhI0/qzrnrx/3kH9xq74zCc1A0nFUqRbO4sG3yAUvqQBSSWVRNCbegy0
 KmUiRkrcoz4C7n/pmSbLqoY7L0ZERO3+aodFch8i/2XyXsnKJ+DBeW3bhSwlUtKurAn/tmxYLoc
 nPZTf7VvqugDJ1Hga7At8bjadMvVMxPBMYZOMfcK9hzr+58duE/Tjp7FjZYZL22gkuBvda0szqf
 vDUg8yTuwIgciBEgutw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130046

On Tue, Oct 13, 2026 at 06:19:47PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> reset_control_deassert() is documented to guarantee that the reset is
> deasserted after the call returns. For a shared reset control only the
> first caller runs the hardware .deassert(); all later callers just
> increment deassert_count and return immediately:
> 
> 	if (atomic_inc_return(&rstc->deassert_count) != 1)
> 		return 0;
> 
> When two consumers of the same shared reset (for example two codecs that
> share one reset GPIO) call reset_control_deassert() concurrently, the
> second caller can return before the first caller's .deassert() - which
> may sleep, e.g. for a GPIO-expander based controller - has actually
> released the line. The second consumer then proceeds while the device is
> still in reset, contradicting the documented guarantee. The assert and
> reset paths have the same problem: only the first shared caller performs
> the hardware operation while concurrent callers return early.
> 
> Serialize the shared refcount update and the hardware .assert()/
> .deassert()/.reset() under the existing per-control rstc->lock so that a
> second concurrent caller waits for the first caller's hardware operation
> to complete. The lock is taken before the SRCU read section, matching the
> ordering already used by reset_control_acquire(). These paths do not take
> rcdev->lock, so no new lock-ordering inversion is introduced.
> 
> Fixes: 0b52297f2288 ("reset: Add support for shared reset controls")
> Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

Minor remark about the comments added below.

> ---
>  drivers/reset/core.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 38e189d04d09..7536b61cc5df 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -51,7 +51,8 @@ static DEFINE_IDA(reset_gpio_ida);
>   * @triggered_count: Number of times this reset line has been reset. Currently
>   *                   only used for shared resets, which means that the value
>   *                   will be either 0 or 1.
> - * @lock: serializes the internals of reset_control_acquire()
> + * @lock: serializes the internals of reset_control_acquire() and the
> + *        assert/deassert/reset of shared reset controls
>   */
>  struct reset_control {
>  	struct reset_controller_dev __rcu *rcdev;
> @@ -382,6 +383,12 @@ int reset_control_reset(struct reset_control *rstc)
>  	if (reset_control_is_array(rstc))
>  		return reset_control_array_reset(rstc_to_array(rstc));
>  
> +	/*
> +	 * Hold the lock across the shared refcount update and the hardware
> +	 * reset so that a concurrent caller does not continue before this
> +	 * caller's not-yet-finished reset pulse has been issued.
> +	 */
> +	guard(mutex)(&rstc->lock);
>  	guard(srcu)(&rstc->srcu);
>  
>  	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
> @@ -503,6 +510,12 @@ int reset_control_assert(struct reset_control *rstc)
>  	if (reset_control_is_array(rstc))
>  		return reset_control_array_assert(rstc_to_array(rstc));
>  
> +	/*
> +	 * Hold the lock across the shared refcount update and the hardware
> +	 * assert so that a concurrent caller does not observe the line as
> +	 * released while this caller is still driving it.
> +	 */

This comment is a little hard to interpret (what is meant by
"driving"/"released" here?).

But given the kdoc string update for reset_control::lock, IMO you could
drop all the inline comments in this patch.

> +	guard(mutex)(&rstc->lock);
>  	guard(srcu)(&rstc->srcu);
>  
>  	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
> @@ -599,6 +612,12 @@ int reset_control_deassert(struct reset_control *rstc)
>  	if (reset_control_is_array(rstc))
>  		return reset_control_array_deassert(rstc_to_array(rstc));
>  
> +	/*
> +	 * Hold the lock across the shared refcount update and the hardware
> +	 * deassert so that a concurrent caller does not continue while the
> +	 * line is still asserted by this caller's not-yet-finished deassert.
> +	 */
> +	guard(mutex)(&rstc->lock);
>  	guard(srcu)(&rstc->srcu);
>  
>  	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
> -- 
> 2.34.1
> 
