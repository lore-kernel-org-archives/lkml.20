Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9DA43B6CB;
	Tue,  6 Oct 2026 12:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291416; cv=fail; b=M/szhPZ9sn9GRwQnR9K9tUuUtq3MtsLHx289TVvxjROGxnp6+LV3c8gyUKypvQgzbTic4TtK5HOXK1VwMN6DTTW91Xy8mmyeKd8/QcAFYY3435rYTuMHAtOoAkhwyab3Xj787OH6ej1sW44+vuPWnO0ffHj6vWhoVbBzRBgb448=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291416; c=relaxed/simple;
	bh=eSe+wcjYOD6ZhPMIuPd8C/YBwck3WlUbaPOyDseWS/s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pTXR89aQXLzbZWduyqPpW4M/qM3neB9jtBEFr3BTKFJ5ypMf5xriXVTEMWakcZenW3aY5zNnMJxfWx7qmQYr+am/P/Oq79PjVq9ecDigiAb/TAioevA4EmfJC8KlSkoN92gYu9ihycbO4e4OTnHvMfzwmfViViewB3fGJmBJH4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b=aYW74Od/; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=tWLS5bfC; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b="aYW74Od/";
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="tWLS5bfC"
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696C3Xwi1824717;
	Tue, 6 Oct 2026 08:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=qcn5HGP867kx8/Gx0f/SSuc/1PMJLAagaMoxY77MPRw=; b=aYW74Od
	/4TQCyn8XWkiy8tlmpQrJNfHBI5IstS/hF2HXAkVnNxLRZTPM2eoN17i3sUUNesL
	biVS+6WMe152sNHEWQzt3RgCAC5gyjpd1TZr1ftW38EKM1KWZrunom2Af9pO3vWm
	6IO++7vXsODmSrJVPOFEoUNCXyS0iLfBCbYUjb+J3Jes3ZIxOgU3r5JVoVOUnKQU
	yIxLACX912tLtgab50XQ9YmZa6OZQdHR4nTc5gY1b00V+jhGiig6pKSSnXEZrJjU
	RYkmjZzEi8Sq66B7RsE/mTTxk76HEY1Xb/GpK2fpT8RYLsdtUcQFPEHtzp6Nhpy4
	GWM5JwfAjxmoOgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=qcn5H
	GP867kx8/Gx0f/SSuc/1PMJLAagaMoxY77MPRw=; b=tWLS5bfCOTQbfyMRSmHDm
	7OckdkLDwrVYvQj98iL+pX3B4dYlHaZwmH/V7vBVWVO2IPvfbjTRPTNBIu6jncbz
	YLp39fNmqkA6VNyfSdU1fQ0hA4A+mUss5/7DcyBnZB6VjgUKh0SRjP4GhE4yU+08
	5ToLb64NnuAQsOeMFhMJ7ZouEc7KPk3Awmd4Ilocst46hQgXbngUsv1DL3HD1lwo
	+LR8m5hsao87j8hASkXSrtzBqtwcIGEGLem+W2nmRCxEFXbi1ZbGL9eke8RDGqjl
	0feNsP7KVXbgnOY7rbyxvAGMtDOX2PJGKswIReMRu0jCbIKGy7UoBs+xiyHuBAWk
	Q==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012070.outbound.protection.outlook.com [40.107.209.70])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4h50nmr6nd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 08:56:11 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEMAKyydpH9SkoyyoCs0xRZVUCJ9v8ym2j+mpbTCKDIfG99UOjfJ+/2dDYIASq9tsVuaNZ9x2D/AU7/6f6IV/Wj8qSr3tS1ZnVI7YluNFu6LtVQuHuPAdod7H8CPgUhNl/0mo7tEQn6y9B6lxS7lxH9vyyyBifXj3Mf+/Dr8JTUEJn1OC4xanWoBpCXEm9andmNxzRQMc6E3QW3UxvzgAPtK3Kk8e0b7wjVNQ8YQ3MmoqaOfyGvVWostFXMk2I0Hc2CCjMbgC9GPyEdbapucCqJbuM4F0OpzgCZPvHz4Fxs++emyUnQf7ZaBPO0cawoGSX0LBrLpi5Ds9A+JhzOEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcn5HGP867kx8/Gx0f/SSuc/1PMJLAagaMoxY77MPRw=;
 b=g+dB2AwVqbGYs0v+QhzQ5zoylEDtWBkFTtrrZMjEDQeZ4PHZ3mpVpCCCtFIitHEqIUoYkdYUMZuV0dGSxwS61jeoSWJ8a4XBgifDmuX/3cP1z/h//lU+DFYK45xlx9hzI5pUZy7F2KW0rsA1sxF3CmS2NYOs2FOdwOb7oPaKCgeKo3tHidBv6Kq5+hfCRU/Cmvo5ar6wKWil+iO+/kKvPqkft9jYd7qL32tMKwoyslI6+LN6wBZOs3+oh0L8dVStgFOOzRQN1edNQDTwiT5QL14eUlcGt/jxxWh9Ysd5kEn6TJ8YHIuB8RL7HNfWPQpTug3zf2KGOAeShbJrcepk8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by SA2PR03MB5900.namprd03.prod.outlook.com (2603:10b6:806:11a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Tue, 6 Oct
 2026 12:56:07 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 12:56:06 +0000
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Date: Tue, 06 Oct 2026 14:55:57 +0200
Subject: [PATCH 2/2] ASoC: adau1372: fix invalid default state of output
 ASRC and DAC muxes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261006-asoc-adau1372-fixes-v1-2-599cc17fb5f6@analog.com>
References: <20261006-asoc-adau1372-fixes-v1-0-599cc17fb5f6@analog.com>
In-Reply-To: <20261006-asoc-adau1372-fixes-v1-0-599cc17fb5f6@analog.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MM0P280CA0044.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::12) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|SA2PR03MB5900:EE_
X-MS-Office365-Filtering-Correlation-Id: 97581b9c-0f70-43c9-aa34-08df23a92f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|11063799006|3023799007|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	qBAn7HVJn4wlH8ODA2Ok0p1y5w5arPyaRZxyg0avTCorS9Sn8TebawoLTUlQxFg8kVCZWwNRtBGb8XgVWBgTQMJa2ULaisUSLJ+rXrT+9WMLHH3kTf0UczHbvXDZzukg+ICjk1Ml5lboWRIKyhJg7EFO9hffqZ9k/Orb5a9thXhIb6lgj+M5v9nM2GDnojdF+8pFxHE9mrus49qJP3DLiRYsaE8l6BFX+bDBGrvpnEa4H3ITbeu9p5AJO8f5hytd/JDa26ev0lMf5crG7AZHetzlFI49MQNaT31WiTlS6qoR4lA5BrTAOOd0BipIQqEbC8nztBQO3Vg2ljRBCKeovSn2j3daS/EAZoSUqDYzTVFrzQSx+zhz8Y+RzaTT7Klbh+PkmZ2AGXEYfN5nO2Urmke/GSBNnoYcJ4Fd8rzoCQhhR+ID+7y/PNNgCFa/EkEjTK7UWCo+1euJyA8Awc4oGKKuJjHjzN+iUw5N76EvkwRjK8PHIujROX0LmyVggcZq79L79KPHgcXmKawN5KZmC7BokZQEmOZ0vHbIyusIK+rFP73fI55w3Gvpqr1Akug6+NByTHxR/S3/8ZaBH+UeLHX18v6PbzKfYHCs3Lw3nHw7fY6GQklHzONs1106Ou9LsrA6nY1QYuct9vP4PgaRb1cFNubgHPXVuxr49hnEZzo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(11063799006)(3023799007)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE9jZ0tpSzcwWUphOGo5N0V5TWNzWkxNRE05TzQ1TWNCbDhucHU1djlHcEVI?=
 =?utf-8?B?R052TWZxSFNHMUVoY09xY0R1aUdoSGpBc0tVVkVvNzFxNENaWmtFd2UxVTJw?=
 =?utf-8?B?dVJWQmdFM0VTOS9QTHJPeWVJaEVKSVdRL2FQQk10aHdVblJKLzJFaFlhT0w3?=
 =?utf-8?B?YTBwZUl4UVFKMVdqQ3FNQW4wTG1IT05rZlZHQ3ZvNm1KeUhWUWJ0Z01GeERY?=
 =?utf-8?B?cTRFSkxKbmttb2c1dGdGbkhaSUtxQjAzRjR5SXlvTHJHM0xjV25LR2N5b3Zj?=
 =?utf-8?B?VndadDczN1Z3TkNubFR3U2VvWlVWVkp2eUxNRGp2dkpBcWZ0R21wQnpaRXlR?=
 =?utf-8?B?V0FQU1NHdEJLczFwMFFOZzJTYkpIaE9SbjdyNENSL0tVYkdlZ2tuNzFiRE80?=
 =?utf-8?B?Y2tJWHpCdEkzeVBMbzlyNlRicFdlazk3YkJjM2dsWDduOXZ5blJtaUV0MTdL?=
 =?utf-8?B?dFZoa2I5L3NQVGpnalkrbXNCeHdTVjVheU9XcTBjMWtrSkN5L1M1dHpvRU1S?=
 =?utf-8?B?bi85aWxLZ0FXYUVFUkVRUFkxd0pZZUJTNXpBUlZ2WkNCM1ZMaGZ0T0xXVFI0?=
 =?utf-8?B?MjFUc3d5YW5iN2FPanhRVkFIWkJDRDNXb1p3K01uL013ZWhuVWpRRjE5cTJt?=
 =?utf-8?B?a1FOQnBhRk56b01vR0VYL3BTWkR6VDN3ZHRPY3J2TUFKN2xsY1lrR3d6OFBl?=
 =?utf-8?B?RjVGSWE3c1Q4OGhLUklwZWF5emJYd0dmdzJkV1NvTE40OTFsL3h5aGpkcE9w?=
 =?utf-8?B?c1dOR2IwdCtxa1hRMTNBbk1Ta24xUlRRejlJNFhhbEswSGJDdmlNNkw5dEhp?=
 =?utf-8?B?dWpiaDVkTGZzK1hUeHJCVmQ3U2l3MmZIOHBVb3NyMnFudkRrek53eUcyREpD?=
 =?utf-8?B?L2pkZlFrRkt4NFl0bXBZUHpRR1ZiTW1SdWV4MUF0NTJoWkpSNHJlSDd6YWpa?=
 =?utf-8?B?QTg2QnBYMmtJMWl3aHJLNWZhdWRsd0d4bzBVb1dkaUVCV2pMdDlYLzJvWFdo?=
 =?utf-8?B?Q3hOa21kUDBCSW92YVNhcDFJV0orT1piU1pzY3dQV0NvN2Njb2F0V211M3Ar?=
 =?utf-8?B?UkR0ZnhtMktYNkJkOE9CNkpxQlpmZStuSGMyTk4zaVZjSnJxWkZVR0hwcm1v?=
 =?utf-8?B?di9JSTVSNjI5c25UYUJyNklSNmRnclhpZGpHa01mbmpQTTBoTkhVVmhDaTcw?=
 =?utf-8?B?djdIelZaUEVERzBUQ1NhNFU4bEh0c2ZGWlJYTnc5THJoNFVlYTkxZnVzazY3?=
 =?utf-8?B?ZmNBb2RCV25NVmhXWlMydkVPUWNYb1VxcGlUVklDSHRTZnlGUU5rWVNNdTFx?=
 =?utf-8?B?a213d202eWtHZnRXdVNaRzFoTXR2U3RKV3k0SUlTQnR0WVVyTnhhekNmUXdw?=
 =?utf-8?B?TktaRUxoUnRBcVhpRERWQ3JBcGFTRTJRbDEvck5rVUx2aktmSFlEUE4xb0NC?=
 =?utf-8?B?cXFFYzN2TGovYmZjZ3p6SW50WWhGQUhEWHdTOVB4Y3V1bTBlV0p4YlJWMk9t?=
 =?utf-8?B?UldzTk50Qjl2bXE4TnJqdnkyTndlczROR0JBcXN5UEZaNVJsK1Z1Q0xkaFM1?=
 =?utf-8?B?ajlkbWpHK2U0ZDU1a0FwUWxtMkxJM1JqR3Zrblpac0tkdEpBNFFXZEFuWjA5?=
 =?utf-8?B?TUp4WS9BV28rdjlIdVQzRWIyVDdQNW5zeGU5c05FMDdZb3I2NlRNaWZSTlR1?=
 =?utf-8?B?K0VKRWNnTHI2ZXpJWjdhWDI2eVZMUlcxbm15RldOT2hROUtqMHlwNURTYWkr?=
 =?utf-8?B?cno4bnBjOUNHVERGdWhoaitPTURvdlJWV1IxR0s5eEUvME5xSmNwOGYwemNp?=
 =?utf-8?B?OWt0QTBPMkxvZ29ER0NuSXM1TjFRNjJhOU84NnE4Y0VqQ3ZuY1hlNWZaNnlK?=
 =?utf-8?B?ZDJCRWNsTzZ1ekpXeCthTm5YTklGVi96aU02NDZpRjM3NEVpMTgvSGdEZ2hh?=
 =?utf-8?B?ZXcvTzcyRDNtQmE2S256ZG1yVFdydjRyTHA1MUl4Qm8rZW9jenZuM2JLZ29Y?=
 =?utf-8?B?UmZncnZ0NDRCdWNCU2pjZW5EUGhBdW45dHZmN3FPeFRSRmFUZ1BmUVJOUitG?=
 =?utf-8?B?b2d2aGdLRFoxL1BuY1lCL1NJdUU3VFcwaDNSdVhsYWJ5aGNDd2JWb3M4dzky?=
 =?utf-8?B?ZFF2TmlQcDE4WEdJSjZtRjVhSUpUMUZqMm9HY0FMSjNic3AzSDAvc1VVa09B?=
 =?utf-8?B?aTJQWTRrekMzelhOWXNJNnRaN1RWQ2dBZTZMOWtZVU44OFRxSk96T0Y1d0cy?=
 =?utf-8?B?T0t2bWZRMU85S0lma3RGVGlYTncxWlIrb1FUWmM0ZHZQQXBKeWJPMk5pYU03?=
 =?utf-8?B?Uk5IcVJOamM2UzRqOSt3d3ljUzhhV21seEUvUXU5RUxEdlN3M0hiQT09?=
X-Exchange-RoutingPolicyChecked:
	tcOVGKjRhxm7r7Mp9h+SZkqNUAuzW1Hw4m+wRQzAWblXQ9DUeBMMMHuuRBgkORPseN2BQzjO71Hbvdk1M1iug3txrN5/ZOC1CuFqBhrrCXfX+xojBK8VQFt8kv2vbcAf6326M4g0KlBSAFGefrLP8HNDlAI5VkrPCP6my/iCigjXuqvtBEMzxWuYKfD1OyX2BRZar5Yw9N/y2YDUjg0PuocIpP4g918V3FDo9xSdAcF1epTFmpY9zpyXS2zDcM7Up2XD4FTd6nJEGf1RduLUia+65zGanEWEn7eXI/yi7BfOqcerb6CbdaRTsWOVNhncub5phtVjUJlqZq7YQ1sGJg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97581b9c-0f70-43c9-aa34-08df23a92f7e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:56:06.4293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LX4MNo1CpBvKrShYvRW2bc4NyLpraBN9c53Fp1m+Zyjvbbndh+IPGbwd8xp/OqO5pUN3+1H3Co1EpzgirLpnsaqZEEBBEWZMhZ0wD/uFSHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5900
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1MSBTYWx0ZWRfXw5FXjwYk6C+G
 qeRAstTWAp/eE7CfxRR1aLfPv2beXo+pBzMlTn/KM6TnsgF17A7g4jd7zhDy5Hec2Yv7CMCeMsT
 sO+gr+2a+EkQ+KHIe+zKDlFWfq7luFvVNlGPqE2pzgu+xHvHRwvA
X-Proofpoint-ORIG-GUID: PLf3t03mjmMrAgBk1VtesaPZ9N4Jh6O1
X-Proofpoint-GUID: PLf3t03mjmMrAgBk1VtesaPZ9N4Jh6O1
X-Authority-Analysis: v=2.4 cv=bdf+w+PB c=1 sm=1 tr=0 ts=6ac4efeb cx=c_pps
 a=c7CpAOS9Jb82g9OYW51qCA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ugNRTJOwpmtT476g4l8T:22
 a=gAnH3GRIAAAA:8 a=n3JGn6uzr76JNIm11U8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1MSBTYWx0ZWRfXwqg6UAx20UnE
 44cptalN7BctbqqD0o5JXo73aOgj4BuhSg18naLs892Dgd01olycTlBraMj1NvBXYkvJdRKizLE
 y9O+R643IFHZVO9eEMHR1h2uUVxky1GyfJHkKTy+NEYQVHp3rVBu053RwLn4KpghJy0QXKvMwgv
 aMkVI0rgPOABYz4sC0LlpckYtSyj41lXvstiSZLTLvgzUThbz1njZZgO75j11/h9OcheBcOKtVp
 yTP50jFajrytBSkm6P25aPPQ5ij6b1jIbt1QrzY8wvsfWerq+0a2PTXQmdlk7wmLWRu+2HTCNj3
 pd/wB3LH+tVrTC/Qp5toVN+XDbFxX3AqiLr5jEFNT/E64I8skOvs7xGi29vzhDw1WImg6OMrB/Q
 PKgRbGCPnOvrMkhBvgIMqVyAMEWxdnD/pGpu+xx6itC3qlSpourjygaULNTFwhPqUdiNZAeLCXn
 gMRmxc8bnISJiFZ/ezQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060051

The chip has strange power-on reset values for the registers that
control the output ASRC and DAC source muxes - the values are actually
marked "Reserved" in the datasheet [1]. This means that until the
underlying kcontrols are modified, the codec will not function as
expected.

The registers in question are:

  register / field       reset value       valid values

  ASRCO_SOURCE_0_1       0x10
   ASRC_OUT_SOURCE0      0                 4 .. 16
   ASRC_OUT_SOURCE1      1                 4 .. 16
  ASRCO_SOURCE_2_3       0x10
   ASRC_OUT_SOURCE2      2                 4 .. 16
   ASRC_OUT_SOURCE3      3                 4 .. 16
  DAC_SOURCE_0_1         0x10
   DAC_SOURCE_0          0                 12 .. 13
   DAC_SOURCE_1          1                 12 .. 13

Set some sane defaults during the driver probe:

  ADC Decimator0 -> Output ASRC0
  ADC Decimator1 -> Output ASRC1
  ADC Decimator2 -> Output ASRC2
  ADC Decimator3 -> Output ASRC3
  Input ASRC0 -> DAC0
  Input ASRC1 -> DAC1

With this, the chip will behave as advertised by the default kcontrol
state exposed by the driver.

[1] https://www.analog.com/media/en/technical-documentation/data-sheets/ADAU1372.pdf

Fixes: 6cd4c6459e47 ("ASoC: Add ADAU1372 audio CODEC support")
Signed-off-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
 sound/soc/codecs/adau1372.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index b84495371b0b..c3d3be898ba6 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -1002,6 +1002,17 @@ int adau1372_probe(struct device *dev, struct regmap *regmap,
 
 	regmap_write(regmap, ADAU1372_REG_OP_STAGE_MUTE, 0x0);
 
+	/*
+	 * Set sane default values for the Output ASRC and DAC input muxes,
+	 * since the power-on reset defaults are invalid "Reserved" states.
+	 */
+	regmap_write(regmap, ADAU1372_REG_ASRCO_SOURCE_0_1,
+		     0x54); /* Decimator0, Decimator1 */
+	regmap_write(regmap, ADAU1372_REG_ASRCO_SOURCE_2_3,
+		     0x76); /* Decimator2, Decimator3 */
+	regmap_write(regmap, ADAU1372_REG_DAC_SOURCE,
+		     0xdc); /* Input ASRC0, Input ASRC1 */
+
 	regmap_write(regmap, 0x7, 0x01); /* CLOCK OUT */
 
 	return  devm_snd_soc_register_component(dev, &adau1372_driver, &adau1372_dai_driver, 1);

-- 
2.54.0

