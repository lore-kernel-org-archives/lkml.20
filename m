Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792431188;
	b=G/kBG929TayU+H8/xa7ouClkqsFrO4TmmdFhVhoxfFzyrDc+trhrFXomuB+berrS4L9B
	 kVOWZECFUJ8QXNUSoXzfjeml5v6ARxjsVTGLAnmEAONn8UZkT2Pd0TJ3zRFVgU4g/taEg
	 WZM80iCJD8oX6v/Xt+0VkZZEXSNCpyEMPGMlqB72eEYKpDQtdo3DpnMZ5CG4iGFsrl6SR
	 RRVuJ0BiZpQGXEXpobxwEtEfxv6OwIKchtlD8LSTdGcS7N3KE+hew8+fTGnUoEch43ydo
	 Wj0CBA3q2UlCs1hCAP2caR7jXHcMVivxk+j37WLwtFPHxrHyIY196YcYae7Dx79dZZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431188;
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
	bh=6QtrI64eOMrx/8dAY2aTSP8/4qMpRO/bnOOrK5OW9Rg=;
	b=Al71AV0bvQjtG7quL6Xqps4cN2YgqJNQrGmjOSyfRu9WXoOr7SrruVuNb0t2i/o9luDf
	 lR3xX+ebQoJZoYEetjm3Jqsrx2TCzR5NBicN4qlQlgasYyZKrpjpZobm3UY0CO+C2B7QV
	 ZkZPPSQQNahOdLmxJv0k6ZlYDFDwRUhzQm93cr9OEDY8Wv+wXbuZfwOayp81CyvfY41En
	 VZKDQi86eL0gIrMIQbr3QJ4Z6EtEyNCRsgvzyl+2r9RA8qMmhL9yyXToJ+OsM+nM9qUe9
	 f4gH2q72zWIRMeMvBzlOJEYOKMBWcq9jkOXx9XI5/MNhH+GhLqiSwY6IMkexwQtgFcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mC5cjnnb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.1
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010001.outbound.protection.outlook.com [52.101.61.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3992B606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3992B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mC5cjnnb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRQ7qLfsGXitj3myGHJWNpDPMNQKLVKFgLhb/4itv62CRyh2ZF41Ot7ZUm7ZONQdhbf7+I/5ccDxntKMJb8dxYIKkZMUQRhQkKsgntZM/ghSMuwPMdJeQJ7PuqStcZwFX133dlHBul2MAIwEMQKnA6z9dMWu0PmHWaEMJ4z9c8rDZWLXO2+QRWUHi6sshlVIE7F7OHYk9b37jc6VLhl8sbrHuKEVOQTMBxcr+6kwJEuYxjtOWT/RfxYDXWG0C2qX4OIJ5Nshm8YfGevAXgR6lOPKktwzSCPQu+OeOXWjfzSgYwN6bIBa3NNn2Rg509Vp/T4CFekzcVQDhrMMCHlxSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QtrI64eOMrx/8dAY2aTSP8/4qMpRO/bnOOrK5OW9Rg=;
 b=eIyPxPhpD4uyYPSSAyuUvj+GqNI4HIZY3w42G8p1kmnZBDpTcukm6oZfB45RVnExk7e08mRNEiXQeigabOj2YCQH+9CtHZ/tgHrOcNPHLpLugxgGP0x7bTIk1ovv+D9oArS0R1k7Bc+v6TOuKNzpY/L0MccBKw7U0aj713onwJgL22JE232CwMVJyPjjJtcVyZVKO2ZO7nLdc5p58jIWRB4uAdtllVVeO5+ZV7esqTZjljhGWaJhLZMTj+oxnBb9za/MyGEds+iy8EU4eKL1ywT//soJFIAzzWCwXYwHp1Uy7LM9B2e9PjQO5+gcUETHMXxdX6g299Xi0h9HHsG15Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QtrI64eOMrx/8dAY2aTSP8/4qMpRO/bnOOrK5OW9Rg=;
 b=mC5cjnnboaNjtt6SaWw+EcfA6eAb0v5JAaphxTozr6uU5I1hTTsYej+DIDA8D9rlxeuQBgRTwp2rDDY13WotEOmstHhrndzNclwcPBnv6gx976VFfUCRqkVHDCd4FgWw49kmbnSk6yvh9kI50UhAtULMiQd4OOUGwwxK5nMGwLw=
Received: from BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17)
 by SN7PR12MB8026.namprd12.prod.outlook.com (2603:10b6:806:34b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 17:32:45 +0000
Received: from BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed]) by BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed%2]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 17:32:45 +0000
From: "Garg, Shivank" <shivankg@amd.com>
To: "david@kernel.org" <david@kernel.org>, "pfalcato@suse.de"
	<pfalcato@suse.de>
CC: "tejavojjala@google.com" <tejavojjala@google.com>, "Rao, Bharata Bhasker"
	<bharata@amd.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"david.laight.linux@gmail.com" <david.laight.linux@gmail.com>,
	"ankur.a.arora@oracle.com" <ankur.a.arora@oracle.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"vbabka@kernel.org" <vbabka@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"surenb@google.com" <surenb@google.com>, "Salunke, Hrushikesh"
	<Hrushikesh.Salunke@amd.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"liam@infradead.org" <liam@infradead.org>, "nhuhuan@google.com"
	<nhuhuan@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "bp@alien8.de"
	<bp@alien8.de>, "ljs@kernel.org" <ljs@kernel.org>, "rientjes@google.com"
	<rientjes@google.com>, "torvalds@linuxfoundation.org"
	<torvalds@linuxfoundation.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH RFC v2] mm: introduce copy_mc_highpages() and batch copy
 in folio_mc_copy()
Thread-Topic: [PATCH RFC v2] mm: introduce copy_mc_highpages() and batch copy
 in folio_mc_copy()
Thread-Index: AQHdX7GhnuOfO5oRrU+HnM1hVhc+T7cEtTAAgAAUroCAAA0WgIAAE9SAgAA1hoA=
Date: Mon, 19 Oct 2026 17:32:45 +0000
Message-ID: <a15bbeb33d1c6e6d2cf4922f65cbde43b5784837.camel@amd.com>
References: <20261019-batpagecopy-v2-1-d75e7d0dfaae@amd.com>
	 <atX3lpXQBHH1JPhW@pedro-suse.tail5790ac.ts.net>
	 <ad34dd6d-f106-42b1-b8b6-a4487822285f@kernel.org>
	 <0346e29faa551efb6a4e21a920d344f5f9b918e5.camel@amd.com>
	 <046e3eef-aae6-4361-821e-06cadf250d49@kernel.org>
In-Reply-To: <046e3eef-aae6-4361-821e-06cadf250d49@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5259:EE_|SN7PR12MB8026:EE_
x-ms-office365-filtering-correlation-id: 6a06ff71-dc11-427b-2cf1-08df2e06fcbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|10067099003|261009223027099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 clWkcTDRcZLlWaZJIcD1Xo70B1IVYFHFA+mTsT881DB1+bFXR8tvs8izWaxkA45lkjEVvHWA303NfyPYmJBrYKUxbXbpgj5xqdgdNs7hVjABXbKtYa/A4UJfV8zsRjYdxhdlbWUKKlANdlb33fLO4yxYgdZCn0Vctf2RL5FVfM4fwzF0kl9vg7cN56kS8cGenWLye0VTHyIo51qDu5VjcmD84yYRCf9AS1atxgld0kEVymzxJniqSWePKpql55K7qYdDFgdrCOVmq4ik92wRXtQcOjUo7LaiKBMawsND2yhOQ2AtSyytjCqOhyZjeopw0TOXMrUoYj+4JR765RK7Pu3v5OOBU81o1IPJ/dBVD8nqYyl8BO6HSqEcrBebq6R4y3gVlPGUG+wmE3GR546+Rc3zrw+/Lhb20qSUBbb7m9isgIRRBmMUk9SRyViG/kECHly4C+WCzoa9Vg7yuUUeK+bFQ/bmg92xTIYtRDoHygz56hTzNsqJX4kH63E4/6NmWnGaHQxpefVlyMSikR822dDOTVQUbQqqKUMB6P9tInX7/PJ491GbE+58fRz8MyukfM1LdkD8KqeKM5xDpLRQDPfePW2uUX3Bo2VwcLmdnuquZ3KVubCjLgRkydeW0tnZH/uJLi3v3kQNMKeuER8w5gcBpZ7JIHaZFw6DXl5ix9JtnwDZW+vLHgv2rk2sAQt2PVROQpsGE+Q7UXPwHrGvzs6icel5sZb3oapce5eJb3Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5259.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFgxVWgwT212MDhtbGlSQk10OCtyZ1crcE0rZjdkVjJiNFB0WkozTFJzS0Ex?=
 =?utf-8?B?ajRmUXBCR3ZldEhNQU9hNEl4ckRoenh4dWdpdTcrcnhRWEJ0a24rbUR2Vksy?=
 =?utf-8?B?eWZNekJ6OGQ2V3Z6R3J4WUZweTZuaXpya05QV1BLTEZ6UGgrR2lHNDkrWkc1?=
 =?utf-8?B?L2R6WitZVDVuVzJmTExsQTBobStBamJWcEw0bndRSHlJY0tENjRsdmw3NVRY?=
 =?utf-8?B?UEo1NFo1b2Z1eGhTQXJjeHpZa0piWlN0Z2xIdDhlUStxalN0VzNpY3N1aEow?=
 =?utf-8?B?R1QzM25rMGJ1MGg0cjAyUUk2c2phb01CRFdCMGNzamhFem5YWUpuUUdtcVYy?=
 =?utf-8?B?VVpJdHgvdndRNWsvVzRZUk4vU2tKb0pMM1Nxb0RQZlRlMWNIekVMeUZRMHEy?=
 =?utf-8?B?TFZKbDlXTWFldHdsMmY0c1RtR3FQRUx0dmpSWXRJTDRhRmZSVVVyVHlsTDdx?=
 =?utf-8?B?eEdkRnlsYjhkTDM4dUo4SWhDeWNBUWo5anlZRlZSNWpYNUhaNEl5WTJ3R1V4?=
 =?utf-8?B?QjdiT2dZd1BSRllHUGYveW9majlGeFRJZXVyMTlwRDZMYXZhUE1WT0FLazlC?=
 =?utf-8?B?Q0hDbUhUaUtxbFVtbFltc2VmUUF4MTBkRHVuZllCRTdob3VFQVp5UGtVaWxo?=
 =?utf-8?B?ZllEZHVnMHBEek9wVTV3d0hwVjYwT0RaV2RIR2w0TXp5UHEvM1hHKzIyeXQw?=
 =?utf-8?B?K0YzWU03MTVGWkZYVHJxeWgyNVZzY3JBU3RZVW1HZkhPc3VjQ2k2L3VxMDZ5?=
 =?utf-8?B?VDM1aW9UV1FRc2FhK0UxRmRxanFFOWdKYno5RktEMDVNeFpEY0xjaDJlMUtu?=
 =?utf-8?B?ekJXNUJ5SkJtdHJFM1JCbGZ0Ry9EWTRZbzI1bERrdkZ1MnpFdmU4clhQR0lW?=
 =?utf-8?B?NHBPUWVZVzIyYkltVVVaUnFweFhjcTR5TUk2Zk5yMGZTUWR3ZGIyek1zUUd5?=
 =?utf-8?B?aE8vOGdPRXIxVi9JQXU0dW1yMmkrRStSUXNYNU41USs2ejI2UU5mNnR0c1Z2?=
 =?utf-8?B?WTJmbkdIa3lVWGMyMVhwTjUxV0dGTUtnVXc2Ull6UURsZTltdVJ5U2lOTnJk?=
 =?utf-8?B?UlY4VHFHZEMxcURBc3FlZ013M3Q3dUtYamJHTGJlMXBtR0NqS0dPdzVHbmlV?=
 =?utf-8?B?S0NEblJ3cndwVGJRamVSdmRjU2lnNTlSWWVYNnk5ODZHRGtTNjRHellmWS93?=
 =?utf-8?B?SFdPWFVFYU8xR09rcWJMUWp1V05mZHI2LzlKTlJkY2FIcm1ybnBySFpvUUlG?=
 =?utf-8?B?UEhBZU00UnBJOFZGMUMxZmZIYXAxNTlFMk03NWNvalBmNkkzNVJJencyejhH?=
 =?utf-8?B?Wk9PcFFxamo1WHZyNXZrV1NuRjVteHRjV1FOMUxyUUJ4cnduRjcxSlZVa1JS?=
 =?utf-8?B?QUdEdmdEcVdwSDRNeGRQSEx3RDBtL29ldXBoR3Rsc2ZscTFhS0ZKV0kwQ3FC?=
 =?utf-8?B?b2lpU0NXaDNuZGowODhiOUhNYzVBM0ExS2NTa0Nuckhwc0dVeGEvc1BUR2tU?=
 =?utf-8?B?WkFNc2EvYWQ5TXpGUXVjMGxhNnE0Rnk1bXFKR3VHMEFwZFF1eGxiL25yM3Jn?=
 =?utf-8?B?RElPZzJuSjVFTXpianJLRDkrYW4wbzA3UUhQbzFlVDJYTVYyZldoQzh5bjNU?=
 =?utf-8?B?Ynhjdnl0dUFXcWFPelZPWDZkeC9XYzc0RlhFbWk1SjF5UW1lYWFQMDFsMEpt?=
 =?utf-8?B?K2NHeHdQYXFCMDB6Y3d0a3I4SXlCc29uekZlU2ttMTlDdnJXVkMyKzM3cHhT?=
 =?utf-8?B?OXFNWnhSRHlieUNlR3RHV2xFZXh1bWhMYnZlZ0l0VG10NTcxdDBJekR5V3dQ?=
 =?utf-8?B?SjdRUFBoZkh1bUZTZStrWmRlb3VGdTNETFg0S3F1aVBUSUxjeDZWWkpkSFFj?=
 =?utf-8?B?VmFRVktoUjBaRFVXcEFNYm4rMjlLOFphTDMyeUx2UXVEZnlWTExUZnFXYm81?=
 =?utf-8?B?bXJMU251cERVQVkyYlFSK0UrUHNDdlpDWHU4WnYyR2lmQ2lqekN4ZXNxYlNU?=
 =?utf-8?B?WXFNSFlyV254dGp0a0RPSHA4c251UFJDNFc1MEk5b1djNVlXTm90S0lXT3pR?=
 =?utf-8?B?Z3VoQndSOWxVWHFqRUlRd1M0dGdSQmttcjVVT1VYaGhGdEJrT25QSkkzWlB3?=
 =?utf-8?B?UlZMZVJpUmdOMnNoalcrelFjSlhmTytCZDlHRVNCUEZDTFByMG8waTFURnBx?=
 =?utf-8?B?RkNRZHVRLzdPemRXUkZHdzhvMHdBYXNrN25tT1Q3YndvWEpYcit6aS9OS1VC?=
 =?utf-8?B?NzhEN21GcHZQTkQ5Z2IrY3NKb2tXVENuOFd3MHJrb3V0RXlmYTg1cjM0b0ky?=
 =?utf-8?B?aTZRb3ovRGZBc0NEWERwMlIrVkljTXdtY0RhbUVteWlFQ1dMTUVKUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <723F7F5139E4AF4B9D448FCEC67AC5BD@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a06ff71-dc11-427b-2cf1-08df2e06fcbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 17:32:45.4846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MZQRlmAQsdeH4OUmtwY/XMx3+L3/r9zhqi2GqLlw9TDH5HdMxeWQtgm8DPnglFdFxB7l5xwve/dMlrtuGKvpDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8026

T24gTW9uLCAyMDI2LTEwLTE5IGF0IDE2OjIxICswMjAwLCBEYXZpZCBIaWxkZW5icmFuZCAoQXJt
KSB3cm90ZToNCj4gT24gMTAvMTkvMjYgMTU6MTAsIEdhcmcsIFNoaXZhbmsgd3JvdGU6DQo+ID4g
T24gTW9uLCAyMDI2LTEwLTE5IGF0IDE0OjIzICswMjAwLCBEYXZpZCBIaWxkZW5icmFuZCAoQXJt
KSB3cm90ZToNCj4gPiA+ID4gDQo+ID4gPiA+IEkgd291bGQgc3VnZ2VzdCB0aGF0IHBlcmhhcHMg
dGhpcyBzaG91bGQgYmUgdGhlIGZhbGxiYWNrIGZvciBub24tcHJlZW1wdGlibGUNCj4gPiA+ID4g
bW9kZWxzLiBCdXQgaXQgZ2V0cyBhIGxpdHRsZSB3ZWlyZCB3aXRoIFBSRUVNUFRfRFlOQU1JQyBJ
IHRoaW5rPw0KPiA+ID4gDQo+ID4gPiBXaHkgY2FuJ3Qgd2UganVzdCB1c2UgUFJPQ0VTU19QQUdF
U19OT05fUFJFRU1QVF9CQVRDSCB3aGVyZSB3ZSBoYXZlIHNpbWlsYXINCj4gPiA+IGhhbmRsaW5n
IGFscmVhZHk/DQo+ID4gPiANCj4gPiA+ID4gDQo+ID4gDQo+ID4gSSBkaWQgbm90IHJldXNlIFBS
T0NFU1NfUEFHRVNfTk9OX1BSRUVNUFRfQkFUQ0ggYmVjYXVzZSBpdCBkZXBlbmRzIG9uDQo+ID4g
d2hldGhlciBjbGVhcl9wYWdlcyBpcyBkZWZpbmVkLiBXaGlsZSBDT1BZX01DX1BBR0VTX05PTl9Q
UkVFTVBUX0JBVENIDQo+ID4gZGVwZW5kcyBvbiBjb3B5X21jX3RvX2tlcm5lbCBhbmQgb3RoZXIg
Y29uc3RyYWludHMuIFNvLCB1c2luZyBhIHNpbmdsZQ0KPiA+IHBhcmFtIGZvciBib3RoIHdvdWxk
IG1ha2UgaXQgbW9yZSBtZXNzeS4NCj4gDQo+IElmIGl0IHdvdWxkIHN0YXkgaXQgd291bGQgYWxs
IGhhdmUgdG8gYmUgY2xlYW5lZCB1cCB0byBlbmQgdXAgd2l0aCBhIHNpbmdsZSBvbmUuDQoNCkFn
cmVlZC4NCg0KPiANCj4gPiANCj4gPiBIb3dldmVyIGFzIFBlZHJvIHBvaW50ZWQsIG1vc3QgYXJj
aGl0ZWN0dXJlcyBhcmUgZnVsbCBwcmVlbXB0L3ByZWVtcHQgbGF6eSwNCj4gPiBhbmQgd2l0aCB0
aGlzIGNvbW1pdCA3ZGFkZWFhNmU4NTEgKCJzY2hlZDogRnVydGhlciByZXN0cmljdCB0aGUNCj4g
PiBwcmVlbXB0aW9uIG1vZGVzIiksIGZvciBQUkVFTVBUX0RZTkFNSUMsIHByZWVtcHQ9bm9uZSBh
bmQgcHJlZW1wdD12b2x1bnRhcnkNCj4gPiBhcmUgcmVqZWN0ZWQgYXQgYm9vdC4gcHJlZW1wdF9t
b2RlbF9wcmVlbXB0aWJsZSgpIGlzIHRoZXJlZm9yZSBhbHdheXMNCj4gPiB0cnVlIGZvciB0aGlz
IGNhc2UuDQo+ID4gDQo+ID4gU28sIHRoaXMgY2FuIGJlIHNpbXBsZmllZCB0byBkcm9wIHRoZSBD
T1BZX01DX1BBR0VTX05PTl9QUkVFTVBUX0JBVENILg0KPiANCj4gQ2FuIHdlIHNpbXBsaWZ5IHRo
ZSB6ZXJvaW5nIHBhcnQgYXMgd2VsbD8NCg0KWWVzLCBJIHRoaW5rIHNvIHRoYXQgaXQgY2FuIGJl
IHNpbXBsaWZpZWQgc2ltaWxhcmx5LiBJJ2xsIGFkZCBhIFJGQyBwYXRjaA0Kb24gbmV4dCB2ZXJz
aW9uLg0KDQpUaGFua3MsDQpTaGl2YW5rDQo=
