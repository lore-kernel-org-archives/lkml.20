Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011024.outbound.protection.outlook.com [40.107.74.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A662547065
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 04:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791433858; cv=fail; b=j19/5e0x4n+BXO/ok7hq95uGLtJfI6HELHslMbvkvENqZEtpPFzjIYejKIblUcB0GX48xqNtkCGoT1GIGuVtiESdjYJEI9up6AiKYaSlAaMEKfc3eS/eoNb/90LoS8O46NrhgUPSkIpw07EYhnrFvwHzrnYPRHzREgMCbVJiqMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791433858; c=relaxed/simple;
	bh=J6sUZA0/ItM/mV5yvWrtmFR3eQDuez5CEPHey34GTyk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F8LXWYdgoZZjWwr+YRcI5SzjziZVsQtS8uAhrtI9OJDJZlDbKcFxz2tqJR+EYCoi1EA64+GPUkauv8zqtsKV4VDKa0o2zjYeZS3aoe/HPlg1P/U9SCbsmYePw0dDXMbzc6ypwM4Pl1laoMzHSjNa/I1JwpIVRuLjFOtwZjjaDW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=PRL+KSAo; arc=fail smtp.client-ip=40.107.74.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="PRL+KSAo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vR80hbC4wn37Ddf7HcTidwvzFw2YJ3qdMUBksfyTZhgtRu7oT49OA2tSidsb6d/wa3BSjAJ6QcPlwHMvVGSkGkIlKQs+8e7a+EI4b1T68S6ChNmQV9GFQHYYdpJ6hZpIi3FJrV0Rj2T9Mk7fTb2lIIsGTgD1GNrVz0bjnIiKy6iwsqATZhxyb9u9nvmFXDbgyU+TR0BQ7naOUgxe2Py0LFgNynCzN229Y6K580JvwSBbmb+473QU6FUHM8j2yhSLIGlKdjNApRDndX5lC6BRRu4ePBY48ZP5xs4tvL/ae02q8ABQPktqeUvZNKdPtcxK5IgWcVGDbOY1tDfS9++vWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1x1tT2C7dcnUZxqDXtNetbkh7Q/xV6PiDmYcoW5QKg=;
 b=v78ALcFoiMXHzodb4rH4aFSDEQVNyHVH5zMEMBl/E0EuaciuLjGCQWaj/V1yXtnQk9JfgeL9/OpYDAR+lCWlJDF3pQ5C5Ak5A2rfakpAnUcggG5IBqEoOR9ApmmEamqcuFV2jJeYt6DZ7q20PsoHCCasHfVyKLxR+C/Ybm26M7JpwU+p0Wv3kMuh7QU8BThQZU9YoAuHa9Nl8Dx3v76XqGnwNzAlVCcSz/bYMI/rr3k5AzQ4/VEI6/yQ2yLMMZ91VhgsC3vT+/o8vF7bMMddSc5hInP0usso14ap1jtLA23BNnm2fXZ4ayPXq8hsKMsYLSYhUYpbWHciwok1OGv2nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1x1tT2C7dcnUZxqDXtNetbkh7Q/xV6PiDmYcoW5QKg=;
 b=PRL+KSAonOK5a2o6A9arGgUBBko5+mdUQxYsBCurnV62fPsZiGJjPsVBBGUrUAR0idbhoqPgBKgAhkfRyEv5uyyfJkNw3UZNr7b+4d9FiApIUdu4fHM29flJYxKF29S+SyCn206iCE+r1MstHk6CNZQUwpGD8roIwtyTZxKdC9Go6UhSpp76Fx7nn5fhFXeVFUhno9JIErwWTfcDTiYxXOOhT2SWMBTH0TdNEwPhV69pHh386xHxHmqA8orIq2jPk2RjFbVLKKZhvx2IuhzGSB251ynj91d+ABcj2CLn00Hfthj3rItbxeYNFfsMbjA2m8qSoh9HqdbFEcQwVUMWKA==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by TYYPR01MB13098.jpnprd01.prod.outlook.com
 (2603:1096:405:1c3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 04:30:54 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 04:30:54 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: "James Morse <james.morse@arm.com>" <james.morse@arm.com>, Zeng Heng
	<zengheng4@huawei.com>, "ben.horgan@arm.com" <ben.horgan@arm.com>,
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>, "reinette.chatre@intel.com"
	<reinette.chatre@intel.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "will@kernel.org" <will@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "bp@alien8.de" <bp@alien8.de>,
	"babu.moger@amd.com" <babu.moger@amd.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"tony.luck@intel.com" <tony.luck@intel.com>, "gshan@redhat.com"
	<gshan@redhat.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>
Subject: Re: Re: [PATCH v8 next 04/10] arm_mpam: Refactor rmid to
 reqPARTID/PMG mapping
Thread-Topic: Re: [PATCH v8 next 04/10] arm_mpam: Refactor rmid to
 reqPARTID/PMG mapping
Thread-Index: AQHc1rtLDSUJd3RIZkOjfouw4AqEwLYN2rSAgObFTnQ=
Date: Thu, 8 Oct 2026 04:30:54 +0000
Message-ID:
 <TY4PR01MB169308CED201FDC318438FAAE8B932@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <2944b506-a462-42f8-95cf-404241fb27f0@arm.com>
In-Reply-To: <2944b506-a462-42f8-95cf-404241fb27f0@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-10-08T04:30:52.478Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|TYYPR01MB13098:EE_
x-ms-office365-filtering-correlation-id: dfd0e023-de01-4176-4dd2-08df24f4f0ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|10067099003|56012099006|11063799006|1580799027|22082099003|18002099003|38070700021|921020;
x-microsoft-antispam-message-info:
 YoLDFlK/PmXWHrz6npgImF5DiDNYKsZXHPsMRGRPQR4xs8M+eQXIpl8zAnKe70haAxLoR3qF3XVbRmpBNvYkxLmMbSag812yLjNn0D+vuA3dB+0XuD/c12LVfgFLv8HkjqUuU//Kxb0/eTIJKk7lXOtn/TlSSKWbsjd7lkUis5QlvFRwSVVevHHzpz87MwyFjfIkVD04YJJd78hVUe9cYJZ30YK1AXd+7bHoyp6g4fXpPDugx/kVanxnNF9V/K0IMucPuNmL1KI+IMZ1jZxnVIBWvmZ0osoyHmGmolS1t2xtcFfK/le3G7dnLZHggziZgazczzI6mBM0dqWVNkBjA4+ehP1Q/vqXPe7UlMcxYhkPPPZZsYT24QTPLkTVRzGI1FaSp/PtO15/OhaoBM5+2D21JdiAl0l5l+xi9u3hJpk5mQSrN0Gms/z5726nlEYD0zGPrc4TocClaKcfiXEhaeUusYJ0i3+KRZb6fwzhOXGAsx8HubZzPaC0gtEmC9+Um2uncNFurNVfDmDSfCodwj2cC3x+Nd46hGnjrK9mVOwaRU2CUFC0LCLeg1+qY41UisRNEjtqJMqOEVt0sXwzy3J56Xzal7ym6hZeOBz5TkBLKomezYeimYPcoWsZ7nIQsI0PZxMR1k4+h9yTSpuTgC63nJX7aLgfYG6sXT6bKeqsIHHxWRrNXG3cL021aVnSvG54Md5mhPCDgyQwiDY/coAVHQhzknF4sk0V50uGaFBOZosIZSdj14hD+6n8gcnmdRcBYgc+xLzWctIjooq7Zw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(1580799027)(22082099003)(18002099003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?UUdITlU0M211dzdqdXJrR0JpTmdUdTBRcFJUZkx0S211WHVVb0ZyeWpL?=
 =?iso-2022-jp?B?RHFSN1ZMUlk4MHI5Z1JmaWZNRWJ5akRhZHFlRjdWNTlwL1JzUGlyMFow?=
 =?iso-2022-jp?B?ejlabWdZMTJNOVdNYmViSHg2VG8xV1lEV1dUK1JPN3hrczh3MHBFWnBZ?=
 =?iso-2022-jp?B?djN0T3I0NXdNNzNGekptTkhCN3I0NlpSUURkdElTUWg0Wi9BaWhxWFJV?=
 =?iso-2022-jp?B?bHdyd21OemZveExBcFRiTVIwTlZJL2lqRW1RM05rWExkbSswY3hQMEJB?=
 =?iso-2022-jp?B?ZWpqazJEZGNmQ2k0T0MyUEpGZDNJcnhnTHM2aVVhNXoyN3BQdTVRdDRF?=
 =?iso-2022-jp?B?YXRHbVBvekE4OEttWXRXRDNyeXphZVR1bXRlM3EvM0ZKMUc5U05BS0Q4?=
 =?iso-2022-jp?B?ZGlIUDBSOVlyR1pPQStxT3ZDbXdXcVpnY25mYzl4OU9hV0FuY29ESXZV?=
 =?iso-2022-jp?B?Tk1sYmpqMVg3NTIyeFZiaFhESUk3K21SMXluTDgvcVhpQzNHUUZnYXhL?=
 =?iso-2022-jp?B?TG5vcit4YTA4VVV6RWl5M1pqYVJKQTA4SW0zaGVkamNqNlM1ZE9Wem5L?=
 =?iso-2022-jp?B?Sy83MWorWWRCcHRHZTJ5emlnK0NscnY5RDBLRUUzZ3BuOFh3ckduaHJ3?=
 =?iso-2022-jp?B?Ryt4U2JYaFFrR3BaZ21sb0d1MytwOURacWJqM0txdXoyWXdoMEhBNE5W?=
 =?iso-2022-jp?B?Ui9Vb1ljaktibGYrZnRRb0ZLUjdLaHlXSUVLcWNidXFGbW9Qc2VYb0Nl?=
 =?iso-2022-jp?B?dDFVRjBucjFHRUJZSlFRUnFYMWNyanZ4UXl4WVY3UklqY1g2M1Q5ZHhw?=
 =?iso-2022-jp?B?WnlLWXR5dDZoMytmQWRxMFNzbmhUUFl1UVJqWmxoZllFdmhjQmNic2FT?=
 =?iso-2022-jp?B?SE5ZYURVaFZUQmQ3TWtVRGdrMVd2MTl4SXRRem4zNENkRHIrZ2hTaHA0?=
 =?iso-2022-jp?B?YXdKVndVWFNtRE4zUWJlcnVmOUFzVEs4V1ptZnEzMjE0WDNQMEdhMnZu?=
 =?iso-2022-jp?B?elRTL2tBb3NYL2NkaDdqSnRrMS9PaVBDOVU3M2VCYlFDRENzZkpXTENr?=
 =?iso-2022-jp?B?aVlxV0JzNEVUQUp0MDRERnY5QXBGZm9zOFVHWnRXck1QREExUHhiS2Q1?=
 =?iso-2022-jp?B?Vlh0M2EvWXZJN0R1SnJIdE1OTHdEVzBJaVgwc3Vjenk5OFl0eVphcnlx?=
 =?iso-2022-jp?B?RGZmazV6VXkwRHFpN25OTFJHNFVxYis1WVBOdDh0M0l0eGVrWVVaTnV6?=
 =?iso-2022-jp?B?eEJkTGVmK04wdG9MbnhCU2hXOStuUGdQcndHS0lTb2c3SGhEU25kVXNX?=
 =?iso-2022-jp?B?N0NMcHVKaGo5TXFhelNLUndVeU0yL1gxQlVYOFB5ZnNqSGpISUQvZzBG?=
 =?iso-2022-jp?B?MTlLT3JjZ3NxKzl6V1hNZlVRSDliTnYzSmdTZ1lST0luU3RoWjBzc2N3?=
 =?iso-2022-jp?B?K3BSbjRnUVZvcVp6eFZUYkM3bFJmVG1qU1pJdDRHZ1d5OWZmSkVHWkp5?=
 =?iso-2022-jp?B?cDFPbFo2bG93VE9VUG5YOUJFUEJIUktFQnRSakNEbVRYK1NaTnN5S3Ar?=
 =?iso-2022-jp?B?ZExpSkRVL0hkTFNnVFB2cCtPcjR5THhhREhpUFVTd01NZUUza25mTDZs?=
 =?iso-2022-jp?B?dGNLa1VSZUszM0Ewb256RnJqV3QyckVpQkxpSWpONk5Sa2VoK01rak1E?=
 =?iso-2022-jp?B?Y2ZES250MzBVN0J3SFU2MXY3MFRIVEtka2FsOUhCeCtFRjhQSEFwTVB2?=
 =?iso-2022-jp?B?cVBaWkhUVkV6cjI3Sm15VDN3UGNrYzA3ZE5qcm5rVStWOTZhMExQeGh3?=
 =?iso-2022-jp?B?RVUrQVd2Q3VxOFhFK3pxdkNvVWJZaWxWUU8zak9uMGlCVnhXeFdyNHlY?=
 =?iso-2022-jp?B?d3prSmkvaHhtcEc2bjdBUFk3MWh0bkdHdXhIN0FaTkE5OE5tVUtsZ0Ju?=
 =?iso-2022-jp?B?eVNwK2YvU1N0RmFhRHN1bGE4RTAxVk5IdlFoWHhDZ09QaFRLMDRhdVJv?=
 =?iso-2022-jp?B?elcyd29hNzh3S3U2ZkxlVVB5a2lCU0VHL3lKVmhUM0RvVVNkbmhUeVdQ?=
 =?iso-2022-jp?B?VXFoenN4UXhQWU5hY2R3Vm5DSjE3NXRwbEV3QVZyVnpMWEgzczJNUXBD?=
 =?iso-2022-jp?B?RHBNczJiRFpuYU14SjN4M09hTlIzVU1NcUlCbFhqL1haM2NLelUvWkRX?=
 =?iso-2022-jp?B?NmdmTEdFZWZwTHhWQUE2dWZrVDcrb1ZyRGU1NXVtYVl0cmVHNWJNZGFN?=
 =?iso-2022-jp?B?aVpNOXlOeEFZWFZzZS91a1NVdzY1VDNNaERCSXV3Szl6T2JKa3FMZWdl?=
 =?iso-2022-jp?B?dEZFTXFoTTZJYXlIZTFFTktoTVdqSGh2U3NHODdoRkZjS1Z6TXM2Y3Qv?=
 =?iso-2022-jp?B?Z0dyRmpGZVI5Nkk4Q0Y1Ym4yd09ITTVvV1NyQUYxT0duRGx5RSs1QW1X?=
 =?iso-2022-jp?B?ZTdLSVMyNjdaRUNpSUpWM1lPTzRITXA4MTRKUmRQdEQzbHpVSTg4NEJx?=
 =?iso-2022-jp?B?QkM5MDZkWVRud0NPQ3RlcTc4amVmOUFLa2JOdz09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	wJZkrAZKm2KAe4RjKTUUQrmfCXjZqEi029cGgma+Z0mgXBApXlQIvqUq81/3qZQe1jKNtHtoUf63oOpQTM296GqExZa83qNbmZQhMIuRUNnx0Aw+Gp+jLg/ET3Oeq9uZT6ChPGsxAWeUOwd2LwJuUX8IdhVkvwLugW2NN0df3YDs6nJcCz4xBkufvf2TZO8MuCn23B6R580pQO82xR6uBNvCtJGXxXqZH2M6ZX7T4gAvtAi8BpsBNPAbAJLUUw8ZUi47RQe5LV9jExLxW6R6bzHKZAZxMBrY3/LqZVw5Fol0hyj9zof++aPC1c6aruM65b1WuxKDT0C2YQ/LqJbB7Q==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd0e023-de01-4176-4dd2-08df24f4f0ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 04:30:54.2693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WG+fiFrxf31lI3ErcSx0w3jAexd1+pvTIzOcQHbFQRs6LBRT6q7DUaz+dBlTDt/McfVbjqSGS3ITaK3LvUvAadtMrgsjTqdj3e2VGd2uCTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13098

Hello Zeng,=0A=
=0A=
> The reason of using base_partid as MPARTID_lo is to keep base_partid=0A=
> contiguous and CLOSIDs are allocated contiguously. This does mean=0A=
> MPARTIDs under the same CPARTID won't be contiguous, but that's=0A=
> inherently difficult to guarantee with dynamic allocation anyway.=0A=
> =0A=
> =0A=
> The control path uses CLOSID alone (CPARTID), and the monitor path uses=
=0A=
> RMID alone (the (MPARTID, PMG) pair). This definition also aligns=0A=
> closely with the native resctrl concepts: CLOSID (Class of Service ID,=0A=
> corresponding to CPARTID) and RMID (Resource Monitor ID, corresponding=0A=
> to the (MPARTID, PMG) pair).=0A=
> =0A=
> =0A=
> In the end, the number of control groups is determined by the number of=
=0A=
> CPARTIDs. Both of these ID translation schemes support multiple control=
=0A=
> groups.=0A=
> =0A=
> Could you please help outline the pros and cons of each approach?=0A=
> This will determine which direction I take for subsequent iterations.=0A=
=0A=
I think the fundamental difference between these two approaches =0A=
lies in whether the  allocation is static or dynamic. =0A=
I proposed a similar idea to James and Dave about two years ago.=0A=
I agree that your proposal for dynamic allocation is excellent=0A=
in terms of flexibility and resource utilization.=0A=
=0A=
However, dynamically assigning MPARTID_hi and MPARTID_lo upon =0A=
the creation or deletion of a control/monitoring group would likely =0A=
require extensive modifications to the resctrl core code.=0A=
In particular, with the integration of PARTID Narrowing occurring =0A=
alongside major changes to the resctrl interface, =0A=
there is a risk that these modifications might interfere with=0A=
each other and lead to complications.=0A=
=0A=
To ensure a smooth and timely merge, would it be better to proceed=0A=
in stages - first implementing static allocation and then =0A=
transitioning to dynamic allocation afterward? =0A=
What do you think?=0A=
=0A=
Best regards,=0A=
Shaopeng TAN =
