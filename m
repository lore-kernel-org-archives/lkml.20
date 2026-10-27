Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793077163;
	b=gwA5WJtkxcEzCPBQl3ZhE9x2qEv9Mb7y7JKqVpMlVszgO6rURL6yOlQd2d96930aXTXF
	 4mOfEIzom1zxj9i9Vj5yTCfg5LdbT2R6cCwqybEnbLVWa6rAoqlMs8GI1N9TTj2awpP95
	 43F5bEXoVyG81XkRlNyUHeKTdGdCY7HYuzWFtobIPypllg4SLRU+NAJ3woTVvv1Oqtajg
	 mc0wiHQG20VaQHqj/xPVDPR/JYFAitbD4j1xzrNK8+9FCworVvfPhnpOqKqMwYMn6R+XV
	 a5NW7P4EoztXt5j3vXZ3uJQdG5mP44bCdpBqJHrCwpl/40qMbjEsqt8JbzAHHhMHA2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793077163;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=2Fbaj3X8scwdZCuRwIAFzkc+9sucg4a4sjgKZ0jBFxk=;
	b=cdLxNYm8EIKMG6Bagg4nGq/MjP/RESVJfmITy36760LBncK2oCM4ruyAFIHdTHijKis3
	 qTWoj9i/ECQy3ckK6FlUb3hTaZTPHSjT47weRQaJWvt62kIGhnlY/+Q3ksdJhdBQ3F/vI
	 KSIgAQcoIdDZPWkhGTm8QhczGIlI8wVNJGlaXtNoCk3TiXeXCxbGZnxQBJZdlZ7bbkgwl
	 R4VrLCahn0N+CgtJLbv8IncVc5Aof2mVdKPrmbbM8hBDdm/tGvX5Nga44AMIE0upSRhwS
	 eqhvSfVdw/MSxjpE17NQ5oLdp8D6n8jOzUtdtk/SvnXAiwSMMweGV+Vs9qZWAeaMQEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=q4v6wpxv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.14
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010014.outbound.protection.outlook.com [52.101.201.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4B8606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB4B8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=q4v6wpxv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHj0obLuDHbnhA31Qxc2AvP3UyRyCwavvRF6dqBFqBhfIaQx1a0Zy7LgGHW3fAauMEH6zmM0/uiHvEP0ny+UHIEmH9JHHMV88JPch+5nPxmUtaRWRxnGCGyrKW3T5KXJd0cZqGwDsMd0eHYYfD9MfvyGV/j/ODI3epnR3oxPxJULuQmjRvYVsKWaHr4Qsfw9DX3Mni6Aje1iUOIvO23J6V8l5FDW8fRVPET3gkyPGqds+sAh6dQTjAcktcnReSQhTmunFNGhlxV+6bemRefHu9N8QYbTqPz1VNrP2EZXaK3qifMDQGQbKYlwkXEXVWAB53QwnEJkPQPtjEaDOJXKmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Fbaj3X8scwdZCuRwIAFzkc+9sucg4a4sjgKZ0jBFxk=;
 b=kTEtJVvZxawG8ucNIrysbJja08i1R1sIpuhJLB4th9/yPOFWHCraR5tUA15NTbZCH07RkocBrII4rJkibezZdNQ5ToGLc/w5LBB0ZZOolV/oJuHYKOSwvofvNwHSEVtL/XfpoqpRxn5qjQM25BBnlR6f69P+raaNfRcB6Ln6oR1/8rHacHGWxcD1yNWol6wfZlgapPfXlVSQwq+YHZwrPcUfKmPyuLVT+RMKzHI2NCqrkjNDGBqlDs+Y0M3ac3i7gKQS1t3ZUEfn6yE2YiPDv6L4CahTE4u4EtANLU0lvE6zhSnwayoojUVlTaABhhqJe7ujY7Za5JjmLSbHHdWLkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Fbaj3X8scwdZCuRwIAFzkc+9sucg4a4sjgKZ0jBFxk=;
 b=q4v6wpxvUTr/7JXXp0ERsY681ZEwGpmiZIAJfYaHF49hfCKahBN+E2VY9IKpwHNvmZ1RBzxc2+jTxmeJ0PEJbyZAU4rD50suY2VnI+zxavLh6v6x7w0bimn9xl6KPgVtpUA4B3TJ0iK+7MTdzc3LTKs7SRTP75RZX/1gM8EmAMg=
Received: from BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17)
 by MW4PR12MB7438.namprd12.prod.outlook.com (2603:10b6:303:219::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 04:59:19 +0000
Received: from BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed]) by BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed%2]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 04:59:18 +0000
From: "Garg, Shivank" <shivankg@amd.com>
To: "david@kernel.org" <david@kernel.org>, "ridong.chen@linux.dev"
	<ridong.chen@linux.dev>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>
CC: "chenridong@xiaomi.com" <chenridong@xiaomi.com>, "shakeel.butt@linux.dev"
	<shakeel.butt@linux.dev>, "apopple@nvidia.com" <apopple@nvidia.com>,
	"ziy@nvidia.com" <ziy@nvidia.com>, "gourry@gourry.net" <gourry@gourry.net>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "matthew.brost@intel.com"
	<matthew.brost@intel.com>, "joshua.hahnjy@gmail.com"
	<joshua.hahnjy@gmail.com>, "ying.huang@linux.alibaba.com"
	<ying.huang@linux.alibaba.com>, "boris@bur.io" <boris@bur.io>,
	"byungchul@sk.com" <byungchul@sk.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH mm-new] mm/migrate: move NR_KERNEL_FILE_PAGES on
 cross-node migration
Thread-Topic: [PATCH mm-new] mm/migrate: move NR_KERNEL_FILE_PAGES on
 cross-node migration
Thread-Index: AQHdZcwxcpEEJW+FnEustUMCt1bcYbcQ1DwA
Date: Tue, 27 Oct 2026 04:59:17 +0000
Message-ID: <078697d386bf99cc75571a4db4e25c8c9c5e4aca.camel@amd.com>
References: <20261027043214.2248986-1-ridong.chen@linux.dev>
In-Reply-To: <20261027043214.2248986-1-ridong.chen@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5259:EE_|MW4PR12MB7438:EE_
x-ms-office365-filtering-correlation-id: c5bbb1e3-5093-41ec-322b-08df33e70e4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|18002099003|22082099003|261026121527099003|56012099006|11063799006|261022075727099003|261009223027099003|261022105027099003|261021121427099003|10067099003|261026140227099003|38070700021;
x-microsoft-antispam-message-info:
 YCefD5tPHS6iD4cI3rCw5S+tOr6DAhH8gxQG6NGoViDe3s398XPXNWRwwhlvi1dNk68Fkg+9qmTg/zqo/5H+NZ3ftOXvGCLpAN+JbFnuxybWXHJg0yTbZrlsNhTRhb7UVJbmL/cuXhyOfB/tg8wZvCEoGUPeUdhqhALED5ue/q1NUdIPBukwrxo93l1FLLK3Rqd2alIg3WFzO72irCYNFQLQ73d03L4/XBu9yd7fEWSx+7dzKeXpaNthiBM0zKp7XnZ74n725x83IBNi11VdAVbnRyOLwMOOurmkMFvnqes150nCzsmJhxJj7z+6ohMjSRuGFFBgLJUd2zC40Q6XYCxMNx8ZN4szzXW/seD06Qd8YxEZ6bC8gl/kjE7rbLv2vMmhuQ76ImgT/pjJPwYlR3hst5J90a/WE29dPqJ3cbrCff4tYFYV86l2OVLOV18Y6jpd6Ysdewt6SK5NdYK4eGvAH7ljNrpKVThcOjEz6DtLmzN0/rU/ninR5fgS5uilsLkJgx+zsv1s+A7TWNQS/F1aBDtLX9Vm3ihiBBYR56RRBn+ZKWrKafS1wCBkrbNXK8nnvvMo73P6+RecSHnCrxxsHO48ortzevn0Vt756059oV69MdlHhTrsPdEAQiGFe4oMWX8CCtBtM9K1BYqZPJ8rsFp8ewrJab30HFK2BBForoxs9QSTcUdN9XFT1bnG2aLLl7MGPNY+S0/p5aN/kmQL8e2uOTRlhgoSQ/RWXFg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5259.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(261026121527099003)(56012099006)(11063799006)(261022075727099003)(261009223027099003)(261022105027099003)(261021121427099003)(10067099003)(261026140227099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eXRjek52OFNZL3JVSjNiTG1UdHZCTFZ4TGVWRU5yMjd1aGcxMFVOSmlxT05Z?=
 =?utf-8?B?MXhROG55eE1PelkrRHF0ZC9aQlJ5TXBFbVpkblNpS1l1UlhjdU1VUnE5Nzl5?=
 =?utf-8?B?SjkzeVcyR2pBVXBxQlA3U1NNdnE3Q0VkeVdaM0FEWkxUUktzcHYzK016Nnlt?=
 =?utf-8?B?S2ZBc281bkF1dGhFMzdPWGNqT1FpNXJDVSthYWdISTFOYXRjTm9icFZLTHVT?=
 =?utf-8?B?RmhzZVRsV2lOSVEzOXQ2N3VRWXVnTStVbmJMQ3lmMHhTOGlVNVNVT0w2dndm?=
 =?utf-8?B?K2V3RjFMWDdwNjFnMlRTdmpIcEdEdTEyUUQ1ZXgzY2lDRXZiTW1FUFIxeXdv?=
 =?utf-8?B?NWdjUG4zRE4rcmNyZHNGQldDUE1jNkRhcG9sRXBSdkcrcVZ6U0NsNXpWemtP?=
 =?utf-8?B?MnFlMGtrWGlJYTJiaGhkUFdJMitkK2xFeW1xTGVGdVM5Vk0vUGQ2cGRmUith?=
 =?utf-8?B?YTdXbUlmZi9hNUpqeUpCQmpTbnZGQXhhREg5VEl3Uis5MU91NmhEWjlYUlRV?=
 =?utf-8?B?U3FUcXJ2UlhWQlMvWnU2UWhwbXVPanZMOUtNUmVuN0ZGQjRsazdZUWVLWkFU?=
 =?utf-8?B?eVNCekM0UGR1OUdFUkJqY1Z4MVdDWUNYaCtqd2xxdzBUNEVjN0RkOWdYbEQ3?=
 =?utf-8?B?emxGOWNLMjFrQkxtRmNOM2xRQ0pTMXZOSTJ2ZGpOWDVwMVBUUFUyalc1Ulll?=
 =?utf-8?B?SW05RmV3QkEwTEVZVEVDSDlpU25KTTVVRE9yY2d4NERJbUVQOVd2VVRJUmJD?=
 =?utf-8?B?QkVrUGd3UkRScHI0N2pJSUJFMURMTEQrc0pLUTRWMXpaMGF5S0RDdkhnWS9Z?=
 =?utf-8?B?eUZ1T3hMQXNCQVQvMHFPSDFqWk1ZeUxVOVFvOUhXT0FFT29KWGszVXE4em10?=
 =?utf-8?B?TjJ2ZEhhVFBVK2VHR21zVEpSeWJjYzVtQ2wwZWx6cVNnSHh6MGptbUVYUGwz?=
 =?utf-8?B?QkpJUTdwb2FVTElWZXdzL3kwaE54VGpvUWxteDdTVW5uUThEUElkQWwxTUs2?=
 =?utf-8?B?TU9USVZielBpR2NNRFpoRWpwT1gwSEFsWTVDWXJyOWF0ejd2aW9jUHdRbk9V?=
 =?utf-8?B?eTY4SE8wUVQxL0QrbkVDbmpwYkcvMzlQOHpna3JwSDRGZ1FiV0t1NEVlL3gr?=
 =?utf-8?B?dCtMNU1KUzZFSjlTWXNDZTJPdURtTmVJc2MyRlMxWlh3Ky9SUmxxSWkySjJh?=
 =?utf-8?B?ZlJsRSsxdVBhU3ZmZGpKb3MvbWVjUk5jWFZiMkVYeVF3NmUvYWptS3NNL1J5?=
 =?utf-8?B?Q3B0T09HbHdYWnBzYmtOOGRKN3FvMnJMTmdDV1RJSzdqelBLRDhVdHlBRWM1?=
 =?utf-8?B?Q2ZPRHFFV0FnUkZXajlnMStxRVVWTTFkcm5sK1pkQndjYitDZU8za29Ha0Y5?=
 =?utf-8?B?MFVNbGhiNzltRVFoRUdUUUhadUJITzl3citGZVpXWkJycGpzV1Z3OFgxVjl0?=
 =?utf-8?B?WGtyMFhwTFE4dm03OFpoQUtwazRCaWE2QmtSZ0UvR0N6UzBtMU9PSHpCcmpj?=
 =?utf-8?B?QWlybTFHbFBTNlRGL0w2dzlQV2o4a1VEV2ozZk5VOGNMY1ZoUVIrM25WYmdJ?=
 =?utf-8?B?WmlaZ0s0ZDc5a083Q3N6dGhiRm1Kc1BUcFdVb0lzbXcxSEFIODhqdXJEWXlu?=
 =?utf-8?B?TlJ0c0xDS0dMOE02eTZpTzR6a1B4RlFIMEt4aVdUVE1NWmU1d1NQWnlDOE83?=
 =?utf-8?B?RTA3RGx6NUk0QzZzT05IbFVyZTQzWFN5YytmWG1qODQraHA5WE5oVW1mWHEw?=
 =?utf-8?B?eUlwTDhGUDI3VVNWVk44Y0tVTGtTTFJHVFBWeWlFUkIyQkVVK0ZOVzVKam01?=
 =?utf-8?B?c2NYb1B0cUIvWTZQZGdLTjJjQ1Vic0lJL0hEVXp6cGZUd3dqN050Qk1lZzlQ?=
 =?utf-8?B?Ti8xcEJ1My9kcnlwQUxqZTRMalVWWDQ4VnEya1ZFY1BoRWZoRUpSZDl6Mnhj?=
 =?utf-8?B?eUpjdHoyMHc4c2U1NzlRTkl3eVdCblR3VExNTTBtUzk5bVNZV05ud1VQazRB?=
 =?utf-8?B?d2c3NCsyMjFiN25QYWEvdnU2U0h5bi9Rb01HanRiSkRFTXFDaFBRZGx3bnUy?=
 =?utf-8?B?cUJURi9CU1ZtRmVnQjZISitJOHd0SCtBbG5XVVZrMVcrVkpXL2JRYVdqSVVP?=
 =?utf-8?B?UE16QXJ3QlJGOFZWaG5TMlQ2ZzY3MWN0OWd5dU5XdUJoUHQyOWFGU0phbVpD?=
 =?utf-8?B?a25DZjJJeWpiSU9ZRmdGWHYzSWdDTE5WVHI4KzhhcEM4bXQwU3h0ZFhrdWY0?=
 =?utf-8?B?Z0xPMkU5bWdBZTVXZFhaeEM3K0I1UkZ0WWxCb3dVQmdyOHpOQ010eXU5NXdR?=
 =?utf-8?B?OHBFRUZhT05QZTNDQVgyVzlmNDV3VXYxS1ZlUlBwR0NueGxEUm5HQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2595A14626AA84459BE5F2E5FD7499DE@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5259.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5bbb1e3-5093-41ec-322b-08df33e70e4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 04:59:17.9894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CjLfXPVCHpxcE9Qw66re4/1MTz0F/CNwSPP7VNkcWk6zjf+KC1OTdUC445F7PfMDbXo4gQkGhyR4MeBIAPUmbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7438

T24gVHVlLCAyMDI2LTEwLTI3IGF0IDEyOjMyICswODAwLCBSaWRvbmcgQ2hlbiB3cm90ZToNCj4g
RnJvbTogUmlkb25nIENoZW4gPGNoZW5yaWRvbmdAeGlhb21pLmNvbT4NCj4gDQo+IE5SX0tFUk5F
TF9GSUxFX1BBR0VTIGNvdW50cyBwYWdlIGNhY2hlIGZvbGlvcyBvZiBtYXBwaW5ncyBmbGFnZ2Vk
DQo+IEFTX0tFUk5FTF9GSUxFIChjdXJyZW50bHkgdGhlIGJ0cmZzIGJ0cmVlIGlub2RlKS4gIEl0
IGlzIGEgcGVyLW5vZGUNCj4gY291bnRlcjogZmlsZW1hcF9hZGRfZm9saW8oKSBhZGRzIHRvIGZv
bGlvX3BnZGF0KCkgb2YgdGhlIG5ldyBmb2xpbyBhbmQNCj4gZmlsZW1hcF91bmFjY291bnRfZm9s
aW8oKSBzdWJ0cmFjdHMgZnJvbSBmb2xpb19wZ2RhdCgpIG9mIHRoZSBmb2xpbw0KPiBiZWluZyBy
ZW1vdmVkLg0KPiANCj4gX19mb2xpb19taWdyYXRlX21hcHBpbmcoKSBkb2VzIG5vdCBtb3ZlIGl0
IHdoZW4gc3VjaCBhIGZvbGlvIGlzDQo+IG1pZ3JhdGVkIHRvIGFub3RoZXIgbm9kZSwgc28gdGhl
IHNvdXJjZSBub2RlIGtlZXBzIHRoZSBjb3VudCBmb3JldmVyDQo+IGFuZCB0aGUgZGVzdGluYXRp
b24gbm9kZSB1bmRlcmZsb3dzIG9uY2UgdGhlIGZvbGlvIGlzIGZyZWVkLiAgYnRyZWUNCj4gZm9s
aW9zIGFyZSBtaWdyYXRhYmxlIHRocm91Z2ggYnRyZWVfbWlncmF0ZV9mb2xpbygpLCBzbyBkZW1v
dGlvbiwNCj4gREFNT04tYmFzZWQgbWlncmF0aW9uIChEQU1PU19NSUdSQVRFX3tIT1QsQ09MRH0p
IG9yIG1lbW9yeSBvZmZsaW5pbmcNCj4gYWxsIGhpdCB0aGlzLg0KPiANCj4gUmVwcm9kdWNlciwg
b24gYSBRRU1VIGd1ZXN0IHdpdGggdHdvIG1lbW9yeSB0aWVycyAobm9kZTAgaXMgRFJBTSB3aXRo
DQo+IGFsbCBDUFVzLCBub2RlMSBpcyBhIENQVS1sZXNzIHNsb3dlciBub2RlIGRlc2NyaWJlZCB2
aWEgSE1BVCkgYW5kDQo+IC9zeXMva2VybmVsL21tL251bWEvZGVtb3Rpb25fZW5hYmxlZCBzZXQ6
DQo+IA0KPiAgIDEuIG1vdW50IGEgYnRyZnMgYW5kIGNyZWF0ZSAyMDAwMCBlbXB0eSBmaWxlcywg
c28gdGhhdCBidHJlZSBmb2xpb3MNCj4gICAgICBhcmUgY2FjaGVkIG9uIG5vZGUwOw0KPiAgIDIu
IGVjaG8gMkcgPiAvc3lzL2RldmljZXMvc3lzdGVtL25vZGUvbm9kZTAvcmVjbGFpbSwgd2hpY2gg
ZGVtb3Rlcw0KPiAgICAgIHRoZW0gdG8gbm9kZTE7DQo+ICAgMy4gdW1vdW50IGFuZCBkcm9wIGNh
Y2hlcy4NCj4gDQo+IG5yX2tlcm5lbF9maWxlX3BhZ2VzIGluIC9zeXMvZGV2aWNlcy9zeXN0ZW0v
bm9kZS9ub2RlTi92bXN0YXQgYWZ0ZXINCj4gZWFjaCBzdGVwOg0KPiANCj4gICAgICAgICAgICAg
ICAgICAgd2l0aG91dCB0aGlzIHBhdGNoICAgICB3aXRoIHRoaXMgcGF0Y2gNCj4gICAgICAgICAg
ICAgICAgICAgIG5vZGUwICAgICBub2RlMSAgICAgICBub2RlMCAgICAgbm9kZTENCj4gICAxLiBj
YWNoZWQgICAgICAgICAxODY4ICAgICAgICAgMCAgICAgICAgMTg2OCAgICAgICAgIDANCj4gICAy
LiBkZW1vdGVkICAgICAgICAxODY4ICAgICAgICAgMCAgICAgICAgICAzNiAgICAgIDE4MzINCj4g
ICAzLiBkcm9wcGVkICAgICAgICAxODMyICAgICAgICAgMCAoKikgICAgICAgMCAgICAgICAgIDAN
Cj4gDQo+ICAgKCopIHRoZSBjb3VudGVyIGhhcyB1bmRlcmZsb3dlZCB0byAtMTgzMjsgbmVnYXRp
dmUgdmFsdWVzIHJlYWQgYXMgMC4NCj4gDQo+IFRoZSBnbG9iYWwgdmFsdWUgaW4gL3Byb2Mvdm1z
dGF0IGlzIDAgYWZ0ZXIgc3RlcCAzIGluIGJvdGggY2FzZXMuDQo+IA0KPiBNb3ZlIGl0IHRvZ2V0
aGVyIHdpdGggdGhlIG90aGVyIG5vZGUta2V5ZWQgcGFnZSBjYWNoZSBjb3VudGVycy4gIEl0IGlz
DQo+IGEgbm9kZS1vbmx5IGNvdW50ZXIsIHNvIHVzZSB0aGUgbm9kZSBhY2Nlc3NvciwgbWF0Y2hp
bmcgaG93IGl0IGlzDQo+IGFjY291bnRlZCBlbHNld2hlcmUuICBJbnRlcnJ1cHRzIGFyZSBkaXNh
YmxlZCBoZXJlLCBhcyBmb3IgdGhlIHpvbmUNCj4gY291bnRlcnMgYmVsb3cuDQo+IA0KPiBUaGlz
IHdhcyBwb2ludGVkIG91dCBieSBTaGl2YW5rIHdoaWxlIHJldmlld2luZyB0aGUgTlJfRklMRV9U
SFBTIGZpeA0KPiBmb3IgdGhlIHNhbWUgZnVuY3Rpb24uDQo+IA0KPiBGaXhlczogZTNhOWFjNGU4
NjZlICgibW06IGFkZCB2bXN0YXQgZm9yIGtlcm5lbF9maWxlIHBhZ2VzIikNCj4gU3VnZ2VzdGVk
LWJ5OiBTaGl2YW5rIEdhcmcgPHNoaXZhbmtnQGFtZC5jb20+DQo+IEFzc2lzdGVkLWJ5OiBMTE0N
Cj4gU2lnbmVkLW9mZi1ieTogUmlkb25nIENoZW4gPGNoZW5yaWRvbmdAeGlhb21pLmNvbT4NCj4g
LS0tDQo+ICBtbS9taWdyYXRlLmMgfCA2ICsrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21tL21pZ3JhdGUuYyBiL21tL21pZ3JhdGUu
Yw0KPiBpbmRleCA5OWUzMDI2ZTMxMjYuLmY4MjljNTAxN2M5NiAxMDA2NDQNCj4gLS0tIGEvbW0v
bWlncmF0ZS5jDQo+ICsrKyBiL21tL21pZ3JhdGUuYw0KPiBAQCAtNzA1LDYgKzcwNSwxMiBAQCBz
dGF0aWMgaW50IF9fZm9saW9fbWlncmF0ZV9tYXBwaW5nKHN0cnVjdCBhZGRyZXNzX3NwYWNlICpt
YXBwaW5nLA0KPiAgCQkJbW9kX2xydXZlY19zdGF0ZShvbGRfbHJ1dmVjLCBOUl9GSUxFX1RIUFMs
IC1ucik7DQo+ICAJCQltb2RfbHJ1dmVjX3N0YXRlKG5ld19scnV2ZWMsIE5SX0ZJTEVfVEhQUywg
bnIpOw0KPiAgCQl9DQo+ICsJCWlmICh0ZXN0X2JpdChBU19LRVJORUxfRklMRSwgJm1hcHBpbmct
PmZsYWdzKSkgew0KPiArCQkJX19tb2Rfbm9kZV9wYWdlX3N0YXRlKG9sZHpvbmUtPnpvbmVfcGdk
YXQsDQo+ICsJCQkJCSAgICAgIE5SX0tFUk5FTF9GSUxFX1BBR0VTLCAtbnIpOw0KPiArCQkJX19t
b2Rfbm9kZV9wYWdlX3N0YXRlKG5ld3pvbmUtPnpvbmVfcGdkYXQsDQo+ICsJCQkJCSAgICAgIE5S
X0tFUk5FTF9GSUxFX1BBR0VTLCBucik7DQo+ICsJCX0NCj4gICNpZmRlZiBDT05GSUdfU1dBUA0K
PiAgCQlpZiAoZm9saW9fdGVzdF9zd2FwY2FjaGUoZm9saW8pKSB7DQo+ICAJCQltb2RfbHJ1dmVj
X3N0YXRlKG9sZF9scnV2ZWMsIE5SX1NXQVBDQUNIRSwgLW5yKTsNCg0KTEdUTQ0KDQpSZXZpZXdl
ZC1ieTogU2hpdmFuayBHYXJnIDxzaGl2YW5rZ0BhbWQuY29tPg0KDQpUaGFua3MsDQpTaGl2YW5r
DQo=
