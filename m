Received: from iad-out-008.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-008.esa.us-east-1.outbound.mail-perimeter.amazon.com [34.193.58.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD95830D3E8;
	Thu,  8 Oct 2026 08:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=34.193.58.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447741; cv=fail; b=R4CEXpcscMefUBbBkqDHl0gVTX44gCPrJu/HFKRhpQwG2P4VK124fxnRxYXwt3QN/7mX/bnpZey0aZhaarO4SRKt52PcZn63GHic4Y6PjYKh27TyZvZmc82oJLXLNsd2f+OzKW1hVdUBkzfjyANMBdmD+OdVNEi4QNJaiumBYaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447741; c=relaxed/simple;
	bh=bV7DD1rWy6ZnLKxkrhxsW+sJUD9EwgQzeJjXboTF2dA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FHiGu94odW3AQmIgYGeEk2Vje7tEet8H/+U1pvhMWMR3VuekQkhODOzT5vyVC7qWp33AwyNUpHkgQOqAEkdFPWiQ3Rd6bcWcSmJqbRn5djSGUMsR2K9XqWoQGpuuJLvxZdmXGaSFKy5MrgZuT3IdWZqDnnEuUggAQgpmSnt9Bdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=mjZjJ+E6; arc=fail smtp.client-ip=34.193.58.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="mjZjJ+E6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791447740; x=1822983740;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bV7DD1rWy6ZnLKxkrhxsW+sJUD9EwgQzeJjXboTF2dA=;
  b=mjZjJ+E6aoTMZP41yoSXwsCvm4KD9+2OfWNGiaxAUYu8WP0iuc9ggRId
   /p2csieat6NiIFeW4T01/9r/yKTyNroOHkkoEiE3SiyKhQ3A3uIBEYpWR
   Wo3K0o2B0ULca7sIJAGYu38aIBc4ommqBgU9RMe2l465S15ZP94tHPgYK
   Y1BOAsENOQIxvpbG7UrjTllk76FjA2G43J7szfW5mJ5h5uZZO+dHTXhyP
   1QSk+rmQ1eeK3QiNjv+/hIOnS611PQpyU4WU2g4XvnGyxifaa0oN+cUo6
   XwA5bk1s78bxRgRRaZebjJjeC5B8fPRNx9woPTq5DFpXScN5FuwyZe0sK
   Q==;
X-CSE-ConnectionGUID: f1c7EGsRRKaCjsXswbRayg==
X-CSE-MsgGUID: 9QTD6P1NSm2aQ7KqEhYNLQ==
X-IronPort-AV: E=Sophos;i="6.27,146,1787011200"; 
   d="scan'208";a="28973680"
Received: from ip-10-4-22-235.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.22.235])
  by internal-iad-out-008.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 08:22:19 +0000
Received: from EX19MTAUEC002.ant.amazon.com [72.21.196.66:16490]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.62.25:2525] with esmtp (Farcaster)
 id c8244f70-f7c8-4f08-a1b0-c0eb68d15583; Thu, 8 Oct 2026 08:22:18 +0000 (UTC)
X-Farcaster-Flow-ID: c8244f70-f7c8-4f08-a1b0-c0eb68d15583
Received: from EX19EXOUEB001.ant.amazon.com (10.252.135.46) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Thu, 8 Oct 2026 08:22:18 +0000
Received: from EX19EXOUEA001.ant.amazon.com (10.252.134.47) by
 EX19EXOUEB001.ant.amazon.com (10.252.135.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Thu, 8 Oct 2026 08:22:18 +0000
Received: from BL0PR07CU001.outbound.protection.outlook.com (10.252.135.199)
 by EX19EXOUEA001.ant.amazon.com (10.252.134.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53
 via Frontend Transport; Thu, 8 Oct 2026 08:22:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKajwrV0CBlJLGOloIJN3VbOwCQ0DuqgYnAIzMZdYQ//Bawkpwn55xLm8E+wqad6g8FRf24ZTG6q3V7JuKJ61rtnTdfFrv3yvzsxu2MJNQaJ93IstpFshEjMWLL8b0GS+JoXg1Gre6TrBBTI4ybiFDdNRji1sWKSVbcLh0vjG88vTeCIgS2R4NBGPAQgRPsffJfUJmmJY6kE34+/sbDvDWb2EYYjPxlpUnZLPExrZjnPeKS/e093b0MDHC4junUmrpgZQMywucIuD04P3LjBPhku4RUy2qgV8VkXKdDvQVQDM2KU86Wvi/1Spn75DDEDbCqJHdPvE47tlwusLH4ZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bV7DD1rWy6ZnLKxkrhxsW+sJUD9EwgQzeJjXboTF2dA=;
 b=PsAkjQ5a9mEqqNCFDLsqlauAPBhdL/b4xnoMOFi3+1/4SwZUFTz9T8Sa32+IRKUv8IiC3g+GTJwMXFHwYjNjJLyHe+ifUvljbCkbACMPXGgCq7mMisWVsy8PlMJ3kxE4lygW/SpSt6+VGHzqy1dn1d0ekMJIV+8YsKAAlyxShffYH61OzYJhcYABQDXI2QZMzF340GZAp/SuYkLBIcuGoM2Sa8GNfqSVfM0MM3Rb+HjJ5ab6nYyXnoXtLdwdG3K5JdqFeM9AwX09WnU/u3XdpI2IY5KUIoaPjvxZBsxSQrIlZatIVY7CzwIahcsjn/fA7Fd7cf5YtP2jLc/ZxZ0f4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by DS0PR18MB988691.namprd18.prod.outlook.com (2603:10b6:8:42d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 8 Oct 2026
 08:22:16 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.022; Thu, 8 Oct 2026
 08:22:15 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Radu Rendec <radu@rendec.net>, Thomas Gleixner <tglx@kernel.org>,
	"Shenhar, Talel" <talel@amazon.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 4/8] irqchip/al-fic: switch to shared parent interrupt
Thread-Topic: [PATCH v3 4/8] irqchip/al-fic: switch to shared parent interrupt
Thread-Index: AQHdVv4gIX2Ex1dceUe6xiK2z8ZUcA==
Date: Thu, 8 Oct 2026 08:22:15 +0000
Message-ID: <BY3PR18MB472271B5834992221174F26EC6932@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20261005112458.22291-1-farbere@amazon.com>
	 <20261005112458.22291-5-farbere@amazon.com>
 <6b831f3d973d078a6836aba07d70ac720b59d52f.camel@rendec.net>
In-Reply-To: <6b831f3d973d078a6836aba07d70ac720b59d52f.camel@rendec.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|DS0PR18MB988691:EE_
x-ms-office365-filtering-correlation-id: 7904e08c-e631-4e33-d433-08df25154311
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|10067099003|56012099006|4143699003|11063799006|5023799004|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: kyq8F2yCEEtK6fo4u1OXykBHc9s9UzWudKNCzLUR4ZeyMQWvG2zxnRwPXCfGdp37XxOL1GHmHd81KcN++Ei3jps2A2aErOk3m+ymgYUAFxWQTv5lSDhS95vsErxFAuRAwt3gpM1ONjlc1BfpaAmNKwkmSNgs1t98od9t6g5mJsYTnJ6dnELnEIghml7MItGojU2odfkWa4A59ZM7NXDAvt2z2jU4C8rk13BLSLNQxU/Y0LSzAW2ZYstPTqkyqPQ1yx/JEoj3gW7hdYFmXYd775UFZCe8SUxTJNJjWWj/bn7jCjyRvczoDzd7O/OFK82BNa1UrUSZJ2OEoXZOIRDMP3MGnk2QZokU67FKdvm1baIC3Uh0FjJgggB3m7gY3dIR937xh4+PqIMFKrtI1e3DxED9NBznD7Ay35IT/uX/RruWqYs6EJ3Ja7Q1q2aP4dKsU+BwLFor8jNUS+TUmcepz50yjaCs4x+pkZ5qrFj4a7bhyIvUn5eOHMvK+JiQGl3qP+9iZm2Abt2+POm8uQaWg8lIio1pnRpnXvDEIYsvKyku0Hwyy3/tSmL4m7hDaG36Rx3TvqIsJggDS3uwnehb1aJY22h1dBDqOd1Sa+HO5bAKAo8XLmwqsLR+sP5WnjLPMiF1pyzT4Q6jHzjJLGu1nn58iKa44caLCzdzFzlU08VAsH+DuDe6JQPr2rHll9/SA9S/oqyVNTXJW7omF/e90Pgr6TA6fMagvKVim8U6BE8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDN6Y3NhVG5qam4ybjJSUE1qTHBYYlArcStrOFVFQ25IUzRTQi82ZXo4VWpa?=
 =?utf-8?B?V2VtcXVtanlJTldsZmVOYzVJUm1VUkdVRkI3UHZ5akxJUE5meFo3aEFaY2hj?=
 =?utf-8?B?VTdGSEQ1elp1b1Z1bWFudHpVZTBrSXRUNzQ5eldxRlE1T1IwUHhKYlI3enlC?=
 =?utf-8?B?RnplalNMd1FSTEoxQmFEdFlxY09PNDYwcUg4dTQwVjJ2a0NwWnhvdmRrMlVk?=
 =?utf-8?B?b3A0cC9ZcCt5aHlOQ0dBdEtQZjRNVWNacmJGZVpaZHMxa0pjaG92ZDhSRjNw?=
 =?utf-8?B?SnNQY2k2L1d2TTlyN0c5T1VDTXdBM1hla1V1YWFaek4xNWFLczBzTU8yMFBB?=
 =?utf-8?B?K0pDSStZcW8reEYxOURFamk5NEg4VkdvbkhYMUxxYzVkeXNya1VDRDRReDFN?=
 =?utf-8?B?NjdwMjNSaWhTNzVWU0toSTRYSU9FOGtIaUNoTkk1anh4UUorWW9vN1NJL0J0?=
 =?utf-8?B?c0Zmbk9XUmhRUlg1NytwTmdYNnJ1WmtmMUY2MXRBVmt4ajJUT3dBVjNtR1hH?=
 =?utf-8?B?TSt3c2FKc3g1ckp6ZUtpVVFhSElzTklGTFAzb1Qzb1pRVGVqaWxKRXhmRWlh?=
 =?utf-8?B?V2Q3MVd0MDNFajBvcHoyeFlmVkN1UTlDSGxuNUpwTkJFYUFEdHNuODlvRmR1?=
 =?utf-8?B?YWl3WjJIdjNiR3BMN2xNcWhGTnl4aXFxbW9xL1l5MDl5bmRNSFZLSWYzUjh2?=
 =?utf-8?B?Z0JKN0E3UHVxYkN3U2lwaXlicWdCVzNYamJEbkxkRW9DaTFGTElpSlhWdzhW?=
 =?utf-8?B?N2MrbTFNSTlYdTJ5UFUrS1VENFIycVhDMDVKYkxEMHZQUHdOYlVGVmd2dVlp?=
 =?utf-8?B?eXJpQnBrUGQrWnZ1OFBBak9tWlRCRWhKQnBhNkFiclhiL1c2RE9GWko3eFk4?=
 =?utf-8?B?QzBJem80RDhTcGZndHgrcmxUcUZsb3ZyU0s2ZzM1eVNYZUtzSncrZ25CWW9M?=
 =?utf-8?B?WHlnbVBLbmpVQ2Y0VWcySzYweXRpQklhZGlwbkYyaUtpTW5jMUpwempmYitK?=
 =?utf-8?B?N1k2TmtmUS8zQWdML0ZEZGFhN2duWEl2WXE4WmFCWGNJMmYzdnROZ2p2VzM3?=
 =?utf-8?B?SWFaWFFSMkI0cHcxQ3BsTFFFZ3VzZktFSkFTbjBHemFVcWNpWGExbC9IeHNq?=
 =?utf-8?B?Mkh2TkxzaXZQUkpqUHY1STRZWk5DZWVYbWhmME1EZDJMSlJJNkFHbjVZc2NN?=
 =?utf-8?B?ekMrK0duZm9xeUttY2ZEK1FBOER4eVNHSXBSQW02WU1iRDNxMEN6NkZBUnRv?=
 =?utf-8?B?M3Yxem5ROGRyZHAyamp5ODBBVkdWUTcwZXNBdXBZaTZ5L2tEYWxqQ2xaWENN?=
 =?utf-8?B?N015V3E3WFVWRTJQYUdnaEY4TmZRTlVZUDMyM1M2NXlTZUtkZVlITXJWVFVN?=
 =?utf-8?B?c2ZJN3k5dXgvek5VZUVrU1EvNEtNc2kwaE1ERXN0Y0tGVTBXejZEbUFBUE1l?=
 =?utf-8?B?QnVieFhBdDRQclBGZDlsMTFnQ0xEaDFIemhvTkIrWHRmVHgxLzNPSG5RVUIx?=
 =?utf-8?B?NVFFdVlqNTVXTEdWNTVNMkhDQzVtVm9tS3E3YnhaNTFJckpXblIrZkdlMnlP?=
 =?utf-8?B?SEVqY2hONVgzTklsVU5QZ3FOSWlvR0Q0MHNRd3hSNUk4RUprREFwWWdwY3kv?=
 =?utf-8?B?WWdsWi9MeG9uMkZvSHExNE1PNVZZZG9jeGZ3d1NmVkdTaFZPYmNrZVU3WURm?=
 =?utf-8?B?WTAvY0xvdnZ3SnJmaVpYSkh3NGZPeTVESkdaNGlPU3IxankvMVpzRWJkMmxa?=
 =?utf-8?B?Ylo0b016RGUySitLQkFDK3RoRlFHYmhuVk9ESm5QOEt3eERYM2dmN0Qxa0Jn?=
 =?utf-8?B?cXd4TnlVcitMQXVHY29VQmMyRndKSDd4LzJHeHR3UnhhWWYzSUVuejVoSGl5?=
 =?utf-8?B?R2RoRnM5Q0M4SE5mdWZUeEk5cjR6c1NnUnVEWjFnQlQvWXV6djhmY09rVU01?=
 =?utf-8?B?NDljbnZGRCsxM3RWUTFQR0hhY0NhVFZsTVJ1REhscHlpc0lPeE1hc3B1SlQ5?=
 =?utf-8?B?ZzFFbjFzcE5QQjZHT3k2elJZM28yeXVyd3hsV1R1eGdoSmN0NytWZDBEK3JC?=
 =?utf-8?B?LzhtSzU0cm9SYmFSRkhtVVBveTBoQm8vS2Zac0ltcE55ZjhDc0ROV0JvdzZk?=
 =?utf-8?B?RnhrUWZ0OFRpclZDNGNEaStnSFp6R0NINFZYdU5Bak5Mbi9yWklNVkVxSE53?=
 =?utf-8?B?VDJrQnpoVGt2WTkxbnVkaWtYaERIWjNhdENyS1ZzTGJzS2hkUG4zZjhaMEhD?=
 =?utf-8?B?SjAzdG0yb1Z5cUxpdnl5QkVTSGk0NXh2OHVrNFExSzJpajJOOWt0clV1V1VK?=
 =?utf-8?Q?/OrTofD701NpEQBch3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GG+/8IL64b4kBYH15MhjYyoPCQLUOLll1FjbsTU8XcqfEJoE1LZcBM90JS7DVLcMhHV8cAkMl2RILyTRHvMX1Z/6urQTn749bgMfq0gEd+EuVXzWxt8EG60Hx/S2SMpvtkRBCDn1PEzOWBc344iHXEjVc4UdbOkM/lpylBzg9PsvrDUBWZNsgqd4Zgk5tMSlXQ7U4Y0ufwD3gNXqOH5fKlfknqsqY3NWDU+7Bs7vgJ/eZtXW5mr/eSmQU5YhGmd22Yy1K6JrrOQ62fDhF1H0SJHK0y2Kyx9S4qrNmUbdlr9ZuNA2fSVpVdgCKGmd4SaUFg9qxdrVn1clLyiHoLaPSQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7904e08c-e631-4e33-d433-08df25154311
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 08:22:15.9152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wAF/O7484L6QDdIlBNhSOGWGp1xOfPASB9rJlU/tC6Voz7bJR1qvl1JA/6oLL5Yq+Zk452D/PQ7b5jkZdJCyJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR18MB988691
X-OriginatorOrg: amazon.com

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDAxOjA2ICswMDAwLCBSYWR1IFJlbmRlYyB3cm90ZToNCj4g
UmV2aWV3ZWQtYnk6IFJhZHUgUmVuZGVjIDxyYWR1QHJlbmRlYy5uZXQ+DQoNClRoYW5rcy4gSSBo
YXZlIGRyb3BwZWQgaXQgZnJvbSB0aGlzIHBhdGNoIGluIHY0LCBiZWNhdXNlIHRoZSBwYXRjaCBo
YXMNCmNoYW5nZWQgc2luY2UgeW91IGxvb2tlZCBhdCBpdC4NCg0Kc2FzaGlrby1ib3QgZmxhZ2dl
ZCB0aGUgdjMgcG9zdGluZzogd2l0aCB0aGUgcGFyZW50IG5vdyByZXF1ZXN0ZWQgYXMgYQ0Kc2hh
cmVkIGludGVycnVwdCwgdGhlIGhhbmRsZXIgY2FuIHJlcG9ydCBJUlFfSEFORExFRCBmb3IgYSBs
aW5lIHRoaXMNCmluc3RhbmNlIGRpZCBub3QgZHJpdmUuIElSUV9HQ19JTklUX01BU0tfQ0FDSEUg
c2VlZHMgZ2MtPm1hc2tfY2FjaGUgYnkNCnJlYWRpbmcgdGhlIG1hc2sgcmVnaXN0ZXIsIGJ1dCBv
bmx5IG9uIHRoZSBmaXJzdCBjaGlsZCBtYXBwaW5nIC0gd2hpY2ggaXMNCmFmdGVyIHJlcXVlc3Rf
aXJxKCksIGFuZCBuZXZlciBoYXBwZW5zIGF0IGFsbCBmb3IgYSBncm91cCB0aGF0IGhhcyBubw0K
Y29uc3VtZXIgaW4gdGhlIGRldmljZXRyZWUuIFVudGlsIHRoZW4gdGhlIGNhY2hlIHJlYWRzIDAg
YW5kIGV2ZXJ5IGxhdGNoZWQNCmNhdXNlIGJpdCBwYXNzZXMgdGhlIGhhbmRsZXIncyBmaWx0ZXIu
DQoNCkkgY2hlY2tlZCBpdCBhZ2FpbnN0IHRoZSBjb250cm9sbGVyJ3MgcmVnaXN0ZXIgc3BlY2lm
aWNhdGlvbjogdGhlIG1hc2sNCnJlZ2lzdGVycyBnYXRlIHRoZSBjb250cm9sbGVyJ3Mgb3V0cHV0
LCBub3QgdGhlIGNhdXNlIGxhdGNoLCBzbyBhIG1hc2tlZA0Kc291cmNlIHN0aWxsIGxhdGNoZXMg
aXRzIGJpdC4gVGhlcmUgYXJlIGdyb3VwcyBpbiBvdXIgZGV2aWNldHJlZXMgd2l0aCBubw0KY29u
c3VtZXIgc2hhcmluZyBhIHBhcmVudCB3aXRoIGdyb3VwcyB0aGF0IGhhdmUgb25lLCBzbyBmb3Ig
dGhvc2UgdGhlIGNhY2hlDQp3b3VsZCBzdGF5IDAgZm9yIHRoZSBsaWZldGltZSBvZiB0aGUgc3lz
dGVtLg0KDQpTbyBhbF9maWNfcmVnaXN0ZXIoKSBub3cgc2VlZHMgdGhlIGNhY2hlIGZyb20gdGhl
IHZhbHVlIGFsX2ZpY193aXJlX2luaXQoKQ0KcHJvZ3JhbW1lZCwgYmVmb3JlIHRoZSBwYXJlbnQg
aXMgcmVxdWVzdGVkLCBhbmQgZHJvcHMNCklSUV9HQ19JTklUX01BU0tfQ0FDSEUgLSBub3RoaW5n
IGVsc2Ugd3JpdGVzIHRoZSBtYXNrIHJlZ2lzdGVyIGJlZm9yZSB0aGUNCmZpcnN0IGNoaWxkIGlz
IG1hcHBlZCwgc28gdGhlIHJlYWQgY291bGQgb25seSBldmVyIGhhdmUgcmV0dXJuZWQgdGhhdCBz
YW1lDQp2YWx1ZS4NCg0KVGhhdCBpcyBhIGZ1bmN0aW9uYWwgY2hhbmdlLCBzbyB0aGUgdGFnIGNh
bWUgb2ZmIHJhdGhlciB0aGFuIGJlaW5nIGNhcnJpZWQNCm92ZXIuIFRoZSBmaXggaXMgaW4gdjQs
IHdoaWNoIEkgd2lsbCBwb3N0IHNob3J0bHkuDQoNClRoYW5rcywNCkVsaWF2DQo=
