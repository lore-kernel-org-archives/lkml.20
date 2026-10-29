Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793289354;
	b=zwg1Nu7M/VppJ4aoFz/eJvO3voPTVDkHjCz7QNrkJ+gIryWGyqRmAtk58rOxrgfi7Eim
	 ZqZiy9vv0TQIqrbgbSHsgpNP7m+swmH8FpwBuAgDj6+C+wgk1QuqaNIp7DITqLRonNmv3
	 eKDgiJvi3W9tyCeyl+0k5EG311VO3Ud9SFehpgUN0zM04B4LxVK+UmUpWiD83fjKLpjOP
	 16/AjbALejB+pIMXzBv2fyIIzu4iyeUzYxpLQmefRJXbkmQuQy2QQ39I9T2j/EZbugUBV
	 DdR/6eIXrge8P46Tcs71U0ZEHZz8e1/jyQQb9kbi8GG0CPqa3ApnL97PNE7d4ES+N3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289354;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=3R2FHiRBCi3wdgTZ1mStcznjOTZ+7Dbgh3GCpckO3rk=;
	b=uFHo78OX2GIdljv8W/Lb3HQdX4DlSxzKWasq4B0QnZ8dXuMKvbvzw7o9rxGKJRr7j5Gf
	 8IXus0oVvZvVZ9sn1p7HDkUu0yZzwycoB2SA8BpYrqwbgfqYqLe59aHFBtvQ1kvFChLmt
	 UK3YlgbK+3bg2/8YbJTiJuMnl6Ynjj0l2E/hHwl5uR5YY6XM1oIKTGTb1iZUnDSj2Uz26
	 sGJgmCLPLNYw+EK44/MUFNvAIy8D4w+4jbu73a2JjB6DbU04JjqRnV4QXhLmTRw1BCYZp
	 L7a42snDRyN7c3gTHdqoaITBHU5NT/LYHkxkqkI+d83lATyRmfAeQBDJ+pjnKIrs/4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yxU7VsgD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.62
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012062.outbound.protection.outlook.com [40.107.209.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B402606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B402606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yxU7VsgD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YS5BEGa/q2swSKsJFAbnR6O8hMrond3noFF7eM7sx9RBoprbWc28iQ8PJSO2dZc8HQLEfbDDFfmLpt/fGoSeuP6ok1DBu3BovqswWdXSlX+lhI5DV/bIDQxHdXQROvrRyt+pPACr10nUDtVrFBjwX5Q4RKT5ROwZnsDepIAMda5rTkFaKFXb2jPE0JlJtKDCPYBqrWJbJA4VF++2rejcqKLLY192DzcFjuJ36qHpliJTP5j8HqDI9dLnqCL7TmEZKt6KIq1Zd+drERzfI1CD4mge9RBvtS8PESdqgNRov23iTiLMYyXCAjqiyDvpfIHJxhJtYnodYmk0uf4PlawNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3R2FHiRBCi3wdgTZ1mStcznjOTZ+7Dbgh3GCpckO3rk=;
 b=stPk6uC7aXZk1q3cZdtWzsGbo04dTThDKe+cHhupPr1VAAh8ayyX4rMTTSGmT+Afm+rqukNaGSiV+TMJU3yeQwHzUl5sehqT6+p8D+RqjNzbvrMJ5mVb1cdnanOmcISkigjvQElE2z6TrkASYDyTw145mENBIYu7st9jo0LMb2ujrw/+zUHt+7hhxKXN1IhTgx/QEP66lwJwiEm1hZfTwjflJSgVKnp7QTjSWPYmdexJm14G2JyvXCIlal94ZnjT3/wPM4lB6wxp+qfsyCei+5Ny9CD4Ee9jikIWgsVOuP2AO269eATCQ6NY+BIzy+mD9Iearaf/4mrbHIVAE0EnAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3R2FHiRBCi3wdgTZ1mStcznjOTZ+7Dbgh3GCpckO3rk=;
 b=yxU7VsgDeLTsGmFqxsF202omdDqp4HraHA4i+SGkbqMU4EMJhj57GHsHRTAPyBq/yMGVhbkRmU5tYCrbr/UAY8vbWh76hsTd2oxfghO1fs6dW1hKznzVgAUiNmBi3X2/v2DKbxYfsutgTt3Sy2lBTmwV3nLXrPBqxntoUF0noyQ=
Received: from DS7PR12MB8201.namprd12.prod.outlook.com (2603:10b6:8:ef::13) by
 MW5PR12MB5652.namprd12.prod.outlook.com (2603:10b6:303:1a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 15:55:51 +0000
Received: from DS7PR12MB8201.namprd12.prod.outlook.com
 ([fe80::e5d:5f41:954d:be38]) by DS7PR12MB8201.namprd12.prod.outlook.com
 ([fe80::e5d:5f41:954d:be38%5]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 15:55:51 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Breno Leitao <leitao@debian.org>, Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Josh
 Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H.
 Peter Anvin" <hpa@zytor.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>
Subject: RE: [PATCH] x86/bugs: Keep BHI mitigation when only user->kernel is
 mitigated
Thread-Topic: [PATCH] x86/bugs: Keep BHI mitigation when only user->kernel is
 mitigated
Thread-Index: AQHdZ7Qkszgt57D+UUG4TzmKI/8TO7cUq0kg
Date: Thu, 29 Oct 2026 15:55:51 +0000
Message-ID:
 <DS7PR12MB8201C88727DB6B93346E230B946E2@DS7PR12MB8201.namprd12.prod.outlook.com>
References: <20261029-bhi-attack-vector-v1-1-29cfa697efb6@debian.org>
In-Reply-To: <20261029-bhi-attack-vector-v1-1-29cfa697efb6@debian.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-10-29T15:51:23.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB8201:EE_|MW5PR12MB5652:EE_
x-ms-office365-filtering-correlation-id: 225e7ffe-9a42-4fee-bdd3-08df35d51b40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|921020|38070700021|11063799006|56012099006|261009223027099003|261026121527099003|261026140227099003|261028144727099003|10067099003|261022105027099003|261021123027099003|261021121427099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 RjT3EuwMJbrk2HyU7mTsh28MOB9m4F5QEM3TPlPv2ID//MCdKmYN0LKqQBtQFmYvFe0OxKDqR9yRmXFFRmz28kG+qlHKAyXeA73VLxhUrsjwKn7ojlf3xQDH6Z73HsM6D/UGy0k1R/njnpczylHl7mrrsHxvGdQWvkFsUPpUEhkYKJ3i1C4liZ7Szupe4IvCRAQYKnPJO0MY5cMf/1z/DOHv8Yz4lWJklbMAqNKRrqxR3PTjfvTDg5REZjoG18RreQ/qr+CXlK0j/lTlNJ/KYEovMtRaO1A5TBP/TxMu3r8slSeMe9hEYNtaI4SeWSw3UocEFmkVbjgffiyV0GAKE/9R5lslcIb2TSmr7N+LhTZRMiCsb2oX2afc+N5QornmUmBf0Rx5ilXQw7AQS+0YQpPeRx4KL0eYm6yMMEd8SgDLPceT/I6+tG/JX0w6srDYE1eLxWvMTVPe1YhApnp4r8sAfqSgVQ+6/48c4O+IVvJUL152y5IyC4XLGorZzxrIadh/XbMdImd84hjqSvSqAR8qEtHD5KEfubMXTJKvl7dHWYxg5xtCEZ4VQUXjWo06ok7noMYdObkBKCq/Q4NsjCSc6S7WowcHxU8d00BwKd+MqZAk3e+1In/E76EfwRhUgsLdETc+FaPrIRD4NODr1ZboPhVglQ7alJvKs7gJsqJKUByeCgtN1gbQpy8f5R0VOxyudOAr5E2MFW7D/oj2KLlVtV6Wf0zUQ0QvcARbbjbHsePH5tI8RemmJl6KGNG7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB8201.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(921020)(38070700021)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(261022105027099003)(261021123027099003)(261021121427099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aHZ5ZFdRS241ejRZWklaMjJPZjQ3aks4YjhIRVJZS1RvUENERmFiN2xuZmZm?=
 =?utf-8?B?a2xHMGxQRkJtNXlvUld6UXBQQWFMR1l6b1c2WDd6d2NodnZZaUdkdVJvaUs0?=
 =?utf-8?B?L2JKMGdvOHRVS1NEeHV4UktmSC9EakcyNGExeUpSa2t3Tm9HdHdkNzhoekY2?=
 =?utf-8?B?NlpMYlRRaXRDbWhRYlhGa3FGcEhaanhNcG9xUEdyVDZKY3M1eGdVMmhYUDhI?=
 =?utf-8?B?TTlibXMydUtwYVdHQ0Q5dThVUlpwQWpaVVlmd1FDY09qL243cXJUNUVpaC8v?=
 =?utf-8?B?NDQ2YXUwWHNYditTT0lPT2toNnZCaVYwQW16WXVxcGllQ2R6c2V1blY1em9n?=
 =?utf-8?B?K2pyT2F2VFJLT0ppZ3hYVTY3VkpSSllkMG4wbWpyOGdwTjcrY0w0YU5UNUV2?=
 =?utf-8?B?UHNCa0Jub1MwTG5LTDNzcXg3aUIveS9NSXJHMnBWK1BrcFVlMHBwbjJaVjlU?=
 =?utf-8?B?eXcxa0FnUm94cnpqdHN2Sk85YUUyTUNGZ202bUlhY2xyWmY5TDBuaEdFd0JI?=
 =?utf-8?B?RDBpNUIvZEthTmtGWVppM2VjaWY5dWZ2RUJUeWgxclJxWDZNeml2cjdGTytH?=
 =?utf-8?B?STlQVy9oRUd0WUhGbnNXcytES2hTUmppY3ZzakdNR0s5VkRubVZtS0NiTHFV?=
 =?utf-8?B?REtZK2FaRi8xcXZWbUhnMWRJeldKZWczK3pqdUIxQzZTQ2NsaXJYdm9aUFN3?=
 =?utf-8?B?cTR4clhtY3hwK1VmRitxdVdJeEI5and1ZnRNQXR6M29IY3M1UXFvWjZHcXNI?=
 =?utf-8?B?L1lNQUI1bU1DMDVhWjJoQ3d4U0hiYU53dTdHRDYrblB1c0c4QnVTcEVMazk1?=
 =?utf-8?B?eGVuRllQUXZIenExMWhBODBZMjcyYml6TEw3QVRwQVE0WDdmakxvZlhCaG5N?=
 =?utf-8?B?WTBmRmJkM25WWmVSNGNxdkk1MDlwOXRLdFhXaUMwKzJWTjhiZzJvVnlHOUFD?=
 =?utf-8?B?Mm5oUDAwdTNBOENKbkZEdkdHWjBpakpMZDNKRU1xbGdjcVQvWFZlRXZKd0tm?=
 =?utf-8?B?RUhKMVJ1T3l3cUxHNzU1R2QrN08rZFNBQmxRUUlObk1RUWx2dHJ6SVR1aFpQ?=
 =?utf-8?B?T08yZ0tUMXBEaFNqUHVBTGxDR3lZSDB3cFErL2dWN0FKa1VKWGVqWnZucm5k?=
 =?utf-8?B?OWp5T0NqU1hmSHBuZFVvaGRZUVJZb1hFaG0zTnVqNkN4S1RtV3hCaGowOXUv?=
 =?utf-8?B?dlNNeElFeDN6OEVnREtlV3E5WU03aWNCcTJwQVJEeXZWSHdhVThsdzhaUVNW?=
 =?utf-8?B?OHo4ZFhRNWdqVERjbS9XczRVRDliUXJxUU55TzdhaWp0aU1uaW1JU1ZzckdY?=
 =?utf-8?B?ZFNUeHlEOG0wbXZCcDR4eEs1Z2hrME5FeGZPcnFDV045L0h6R0V1ZS85YldL?=
 =?utf-8?B?d1JxS3hNNGVacFNXT0dSa1F3RGxrZFV1TnFiSlY0VGo1cXpEUEE3dVRuV0Rk?=
 =?utf-8?B?WlBQRXlzZitybDI2NmsvNE1Hemt1blhvMHZCKzFjT3FpSXZVcXVpVWczcjYy?=
 =?utf-8?B?SDBuVThSTGlVL3BXTTdjb2NzdG5tWlgrcjNkOW03SCt1dldHdUpHYjZaTWtI?=
 =?utf-8?B?dVdsS2ZqdjM2TzFndXBtSHp4TlRvMEtRdXlBOXptNlNPMEM1NjdlWldPWWwr?=
 =?utf-8?B?aWFJanZtenZ1QVg4OWZDWm9LL0kyQjJpNnZaUDd1Rm5sazVwNWNUOWJlSDhG?=
 =?utf-8?B?dHFPZnpDTStHMXUyM0t5TlMvdTh1U2U3NlkwNklnY3ExSGppdndCSm5KUDlz?=
 =?utf-8?B?NHFkaU51Y0NnUFhOL091ZlFNU0lVYyt5Y05aVUlWSlcrUW9nOVFMZWJWNWRu?=
 =?utf-8?B?RVp3SVE1VUJhVThqSjNISFRGQ0RuTTkwMXBhVCtva3Bsc1UxTlNIZzNySDdw?=
 =?utf-8?B?ek9ldDMyZEx6MWd4ZlVkRW8wOU1xa280WXYzd3NHM2g4N1hBSm4xbTU2UWFh?=
 =?utf-8?B?SXJ4SkxzSzJmalVmRXRUYnAzak1nSy9LNEI1cll2STVNcHhQL0xMdXd5amNJ?=
 =?utf-8?B?QWZoNUNjOUJhdC9zZnlVblhZLytyV1UySWNjMDNQYkJvd2h1VFBuWlJtYzl5?=
 =?utf-8?B?R29vd01NNWdUcXcrRGJjbnRYNUJoVElIblVGODNnYUNTZU9xejV5OVE1TkNJ?=
 =?utf-8?B?ZjREZ0N5dlNmVyt4Z3loNStSamdNNmEyeG9ERTUwdTR1ZmxkUmtkaEdISDJV?=
 =?utf-8?B?QVZNK3Y1b1NQT200MXhBZXJvVVhSTEJlYVlMZHJUZmUyT1Z1bzdsaXhXREpJ?=
 =?utf-8?B?UDlGMnBOK2ZSUmlaSFViM1R3RDVxWjNZM2NIamREcDRsenNhVnZELzc1dGtO?=
 =?utf-8?Q?C1sp9ce64/EDsxPjhm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8201.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 225e7ffe-9a42-4fee-bdd3-08df35d51b40
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 15:55:51.0998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hfXKk0iD73Bq0UKVlofqmv4HaE5k3+BZvOCbFr5Gef2oIlcsYzs/vEkGR57uysAh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5652

QU1EIEdlbmVyYWwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcmVu
byBMZWl0YW8gPGxlaXRhb0BkZWJpYW4ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAy
OSwgMjAyNiA5OjQ1IEFNDQo+IFRvOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAa2VybmVsLm9yZz47
IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPjsgUGV0ZXINCj4gWmlqbHN0cmEgPHBldGVy
ekBpbmZyYWRlYWQub3JnPjsgSm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9lQGtlcm5lbC5vcmc+Ow0K
PiBQYXdhbiBHdXB0YSA8cGF3YW4ua3VtYXIuZ3VwdGFAbGludXguaW50ZWwuY29tPjsgSW5nbyBN
b2xuYXINCj4gPG1pbmdvQHJlZGhhdC5jb20+OyBEYXZlIEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGlu
dXguaW50ZWwuY29tPjsNCj4geDg2QGtlcm5lbC5vcmc7IEguIFBldGVyIEFudmluIDxocGFAenl0
b3IuY29tPjsgS2FwbGFuLCBEYXZpZA0KPiA8RGF2aWQuS2FwbGFuQGFtZC5jb20+DQo+IENjOiBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBrZXJuZWwtdGVhbUBtZXRhLmNvbTsgQnJlbm8g
TGVpdGFvDQo+IDxsZWl0YW9AZGViaWFuLm9yZz4NCj4gU3ViamVjdDogW1BBVENIXSB4ODYvYnVn
czogS2VlcCBCSEkgbWl0aWdhdGlvbiB3aGVuIG9ubHkgdXNlci0+a2VybmVsIGlzDQo+IG1pdGln
YXRlZA0KPg0KPiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGxlaXRhb0BkZWJpYW4u
b3JnLiBMZWFybiB3aHkgdGhpcyBpcw0KPiBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVh
cm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4NCj4gQ2F1dGlvbjogVGhpcyBtZXNzYWdl
IG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXIgY2F1dGlvbg0K
PiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25kaW5n
Lg0KPg0KPg0KPiBUaGUgQkhJIG1pdGlnYXRpb24gc2VsZWN0aW9uIGlzIGluY29uc2lzdGVudCB3
aXRoIHRoZSBkb2N1bWVudGF0aW9uDQo+IChhdHRhY2tfdmVjdG9yX2NvbnRyb2xzLnJzdCksIHdo
aWNoIGxpc3RzIEJISSB1bmRlciBib3RoIHRoZQ0KPiB1c2VyLT5rZXJuZWwgYW5kIGd1ZXN0LT5o
b3N0IGF0dGFjayB2ZWN0b3JzLiBiaGlfc2VsZWN0X21pdGlnYXRpb24oKQ0KPiBvbmx5IGVuYWJs
ZXMgaXQgd2hlbiBDUFVfTUlUSUdBVEVfR1VFU1RfSE9TVCBpcyBzZXQ7IG90aGVyd2lzZSBpdA0K
PiBzZWxlY3RzIEJISV9NSVRJR0FUSU9OX09GRiwgZXZlbiBpZiBDUFVfTUlUSUdBVEVfVVNFUl9L
RVJORUwgaXMgc2V0Lg0KPg0KPiBBcyBhIHJlc3VsdCwgYSBrZXJuZWwgY29tcGlsZWQgd2l0aCBL
Vk0gZGlzYWJsZWQgZ2V0cyBCSEkgYXV0b21hdGljYWxseQ0KPiBkaXNhYmxlZCwgc2luY2UgQ1BV
X01JVElHQVRFX0dVRVNUX0hPU1QgZGVmYXVsdHMgdG8gb2ZmIHdpdGhvdXQgS1ZNLg0KPiBUaGlz
IGlzIGEgYnVnLCBnaXZlbiB0aGF0IENQVV9NSVRJR0FURV9VU0VSX0tFUk5FTCBzdGlsbCBuZWVk
cyBpdDogb24NCj4gYWZmZWN0ZWQgSW50ZWwgQ1BVcyB0aGVzZSBrZXJuZWxzIGxvc2UgQkhJX0RJ
U19TIG9yIHRoZSBCSEIgY2xlYXJpbmcNCj4gbG9vcCBieSBkZWZhdWx0LiBCb290aW5nIHdpdGgg
bWl0aWdhdGlvbnM9YXV0byxub19ndWVzdF9ob3N0IGhhcyB0aGUNCj4gc2FtZSBlZmZlY3QuDQo+
DQo+IFNlbGVjdCBCSElfTUlUSUdBVElPTl9PTiB3aGVuZXZlciB1c2VyLT5rZXJuZWwgaXMgbWl0
aWdhdGVkLCBhbmQga2VlcA0KPiBCSElfTUlUSUdBVElPTl9WTUVYSVRfT05MWSBmb3IgdGhlIGd1
ZXN0LT5ob3N0LW9ubHkgY2FzZS4NCj4NCj4gRml4ZXM6IGRkY2Q0ZDNjYjM3YyAoIng4Ni9idWdz
OiBBZGQgYXR0YWNrIHZlY3RvciBjb250cm9scyBmb3IgQkhJIikNCj4gQ2M6IERhdmlkIEthcGxh
biA8ZGF2aWQua2FwbGFuQGFtZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEJyZW5vIExlaXRhbyA8
bGVpdGFvQGRlYmlhbi5vcmc+DQo+IC0tLQ0KPiAgYXJjaC94ODYva2VybmVsL2NwdS9idWdzLmMg
fCAxMiArKysrKy0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L2J1Z3Mu
YyBiL2FyY2gveDg2L2tlcm5lbC9jcHUvYnVncy5jDQo+IGluZGV4IDAwMGViZWUyZDI0N2IxLi40
Y2VkMTBjNmJhMGRiOSAxMDA2NDQNCj4gLS0tIGEvYXJjaC94ODYva2VybmVsL2NwdS9idWdzLmMN
Cj4gKysrIGIvYXJjaC94ODYva2VybmVsL2NwdS9idWdzLmMNCj4gQEAgLTIwODgsMTQgKzIwODgs
MTIgQEAgc3RhdGljIHZvaWQgX19pbml0IGJoaV9zZWxlY3RfbWl0aWdhdGlvbih2b2lkKQ0KPiAg
ICAgICAgIGlmIChiaGlfbWl0aWdhdGlvbiAhPSBCSElfTUlUSUdBVElPTl9BVVRPKQ0KPiAgICAg
ICAgICAgICAgICAgcmV0dXJuOw0KPg0KPiAtICAgICAgIGlmIChjcHVfYXR0YWNrX3ZlY3Rvcl9t
aXRpZ2F0ZWQoQ1BVX01JVElHQVRFX0dVRVNUX0hPU1QpKSB7DQo+IC0gICAgICAgICAgICAgICBp
ZiAoY3B1X2F0dGFja192ZWN0b3JfbWl0aWdhdGVkKENQVV9NSVRJR0FURV9VU0VSX0tFUk5FTCkp
DQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGJoaV9taXRpZ2F0aW9uID0gQkhJX01JVElHQVRJ
T05fT047DQo+IC0gICAgICAgICAgICAgICBlbHNlDQo+IC0gICAgICAgICAgICAgICAgICAgICAg
IGJoaV9taXRpZ2F0aW9uID0gQkhJX01JVElHQVRJT05fVk1FWElUX09OTFk7DQo+IC0gICAgICAg
fSBlbHNlIHsNCj4gKyAgICAgICBpZiAoY3B1X2F0dGFja192ZWN0b3JfbWl0aWdhdGVkKENQVV9N
SVRJR0FURV9VU0VSX0tFUk5FTCkpDQo+ICsgICAgICAgICAgICAgICBiaGlfbWl0aWdhdGlvbiA9
IEJISV9NSVRJR0FUSU9OX09OOw0KPiArICAgICAgIGVsc2UgaWYgKGNwdV9hdHRhY2tfdmVjdG9y
X21pdGlnYXRlZChDUFVfTUlUSUdBVEVfR1VFU1RfSE9TVCkpDQo+ICsgICAgICAgICAgICAgICBi
aGlfbWl0aWdhdGlvbiA9IEJISV9NSVRJR0FUSU9OX1ZNRVhJVF9PTkxZOw0KPiArICAgICAgIGVs
c2UNCj4gICAgICAgICAgICAgICAgIGJoaV9taXRpZ2F0aW9uID0gQkhJX01JVElHQVRJT05fT0ZG
Ow0KPiAtICAgICAgIH0NCj4gIH0NCj4NCj4gIHN0YXRpYyB2b2lkIF9faW5pdCBiaGlfdXBkYXRl
X21pdGlnYXRpb24odm9pZCkNCj4NCj4gLS0tDQo+IGJhc2UtY29tbWl0OiA2ZDA5MzNhZTlkNDY2
NzRhNmVhNjNhODdlOWU5YWI0ZTY2MjY3MGM5DQo+IGNoYW5nZS1pZDogMjAyNjEwMjktYmhpLWF0
dGFjay12ZWN0b3ItYzM2ZWE2ODU0OTA0DQo+DQo+IEJlc3QgcmVnYXJkcywNCj4gLS0NCj4gQnJl
bm8gTGVpdGFvIDxsZWl0YW9AZGViaWFuLm9yZz4NCg0KQWNrZWQtYnk6IERhdmlkIEthcGxhbiA8
ZGF2aWQua2FwbGFuQGFtZC5jb20+DQoNCkxvb2tzIGxpa2UgSSBoYWQgZG9uZSB0aGlzIGNvcnJl
Y3RseSB1cCB0aHJvdWdoIHY1IG9mIG15IGF0dGFjayB2ZWN0b3Igc2VyaWVzIGJ1dCB0aGUgZmlu
YWwgdmVyc2lvbiBtZXNzZWQgaXQgdXAgd2hlbiBJIHRyaWVkIHRvIHNpbXBsaWZ5IGl0LiAgRml4
IGxvb2tzIGdvb2QgdG8gbWUuDQoNCi0tRGF2aWQgS2FwbGFuDQo=
