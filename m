Received: from fra-out-006.esa.eu-central-1.outbound.mail-perimeter.amazon.com (fra-out-006.esa.eu-central-1.outbound.mail-perimeter.amazon.com [18.197.217.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1C636D9EE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.197.217.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100297; cv=fail; b=Ecr3L15QHeVcf4PMCeLuFI5AZ18aHAHQKiDlL7Gd1hunEGNcWdPuO0hXqMS4ILhXDrPQPzrysqVt7mRIQI05prri+57xpwiqyr+U7v9MC7C3Fbf8nkk25udsElDVc/1IxK1HNYe3GvVOOK0gPXD8yCH2oTTgbtXJcig8uWCq7RI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100297; c=relaxed/simple;
	bh=F6xUY2g3Zdw0OpFQhuuCWgrYBHLiwkfiFT3qvQCE2eY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J5rcWkXBmSWiWBTnY2DTp4ZlHqbjRQI7Q2TVzGuzAGOFpL30RZgsoAT9hlHfjPadhawvj4r+WdsA9uxCJfcpK0slya6a68u1B3pvl8b1efpPICGOndys5TChdVQiDZCuwm2LVmpQMVeGZ5wG1Tt7JUC+UZ4ToSuLrfKpzYi34es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=NOoZvAsR; arc=fail smtp.client-ip=18.197.217.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="NOoZvAsR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1792100296; x=1823636296;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=F6xUY2g3Zdw0OpFQhuuCWgrYBHLiwkfiFT3qvQCE2eY=;
  b=NOoZvAsRKgLRdUB7jYGlcJIJUM+STdj4pbP2AsJvp2jncSb984TT573q
   W0JZyaFIPjrpFtNa+dCeacMajAnrydc0suDAnV57nWlfOUSHlWHWATgP7
   ++yjnlNgsd4tB2MT9mcZ3ep8snGYMKjwYRCFs24MSP/gVr1RPCpJoXAlB
   mUTt60RrNFifz4ssY8e1DeIDRSF1OehTaQeHyDJxoNdStpQteitwftepb
   unuh2sSyLp7cLjonMHWaar/+k3STbooGdUtjeM/HLwlcwdZR/jtIeu+30
   BSJ0u4aWjHOYe4ul6poI+YkA32XN+nO+IRLiS3/frhmdT1Nurw7aCTJMB
   w==;
X-CSE-ConnectionGUID: C7ORb4OZRw+P98JF1mFINw==
X-CSE-MsgGUID: eqzM5dUCRtSbvnv7Y56KNA==
X-IronPort-AV: E=Sophos;i="6.27,160,1787011200"; 
   d="scan'208";a="21206748"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-006.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 21:38:12 +0000
Received: from EX19MTAEUB002.ant.amazon.com [54.240.197.224:10077]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.10.24:2525] with esmtp (Farcaster)
 id ebe579d1-dd6a-43cc-b76c-e480c4d4eb40; Thu, 15 Oct 2026 21:38:11 +0000 (UTC)
X-Farcaster-Flow-ID: ebe579d1-dd6a-43cc-b76c-e480c4d4eb40
Received: from EX19EXOEUA002.ant.amazon.com (10.252.50.139) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.79) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Thu, 15 Oct 2026 21:38:11 +0000
Received: from EX19EXOEUC002.ant.amazon.com (10.252.51.145) by
 EX19EXOEUA002.ant.amazon.com (10.252.50.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Thu, 15 Oct 2026 21:38:11 +0000
Received: from BEUP281CU002.outbound.protection.outlook.com (10.252.51.94) by
 EX19EXOEUC002.ant.amazon.com (10.252.51.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53
 via Frontend Transport; Thu, 15 Oct 2026 21:38:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xb6d1S6DXIbEuy75hqnphD0fe2eddaKWRSwRKBGF2FkYsmXhLabt3mgaS/3Rmc73VwWA9sA3S5iHpezJCIko+ytj95qkBRYhIUfSDh/4tPspsFUVewInDeNNTRc1CQPcU5ElwaiZzAweFqkIPWQn93LeeFHR3BkV7CCedZB57kDq6Dkt2Aq4DRkOok0SYudAK4mS7SmB04X6mMuR4CZq8Vv1YwcbS/EZWZ9ErbqfAfQxjctc5K3TA/6bVb/Lm8O1Ui57IoGw3x4alolfvwREpE5j+KyqKH20XVjs9m+Gk81fOuJ+OoS7cXKv44aI8YzLl4EI2ZTd94tPh9bRxj6Kuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6xUY2g3Zdw0OpFQhuuCWgrYBHLiwkfiFT3qvQCE2eY=;
 b=ghDps+lSdCjG6nOZwawo4slkvYIT80jaGsG0Rs4FVn8+OkMjVbHtwIeRf0tx9q3r5UxMlXxUmzx+DcKEu1tk8mVslxhuAE5IYvYrgA0t6mGi+mOxtrawKnYXqy0h7qTKq28xlK73wIfRmCgvLk+o6JOocB2kylE90E6FfuRi7OI5Scqyyxaz/V+qY2MLnmE1TGDlLJtcaUh+qtYlYaNQWa3hB6Kz+Dq/avmFxYxcromDarrYfyT54t5tl05vqxmymJQekJzoWT7dUU1QcNb7N2op0L4pIBwIvc27wqfmtf+rXb8wJ3oPtYgRbGp50rGpKn86Fwg2YLFYoTbPkrnFMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.de; dmarc=pass action=none header.from=amazon.de;
 dkim=pass header.d=amazon.de; arc=none
Received: from FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:20d::13) by BEZP281MB1957.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:46::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 21:38:06 +0000
Received: from FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7b1c:7a5d:c405:6c4d]) by FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7b1c:7a5d:c405:6c4d%5]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 21:38:05 +0000
From: "Graf (AWS), Alexander" <graf@amazon.de>
To: "Luck, Tony" <tony.luck@intel.com>
CC: Reinette Chatre <reinette.chatre@intel.com>, Dave Martin
	<Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, Babu Moger
	<babu.moger@amd.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
	"x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "nh-open-source@amazon.com"
	<nh-open-source@amazon.com>, "Elshahed, Ibrahim" <lshahed@amazon.de>, "Wise,
 Jasper" <jaspwise@amazon.co.uk>
Subject: Re: [PATCH] x86/resctrl: Require force for L3 CAT on early Skylake-X
Thread-Topic: [PATCH] x86/resctrl: Require force for L3 CAT on early Skylake-X
Thread-Index: AQHdXO12qgaCGpBqRUm0KwE84FKXCQ==
Date: Thu, 15 Oct 2026 21:38:05 +0000
Message-ID: <0115c4f1-bc65-49e9-ab5f-9c044e9cfcf6@amazon.de>
References: <20261014083637.65430-1-graf@amazon.com>
 <4bc68d06-a45f-45cc-80a4-f72806d5c976@intel.com>
 <841a8030-f639-423e-9bd4-c4d4566450d2@amazon.com>
 <atEJRr6iJhZv9lvU@agluck-desk3>
In-Reply-To: <atEJRr6iJhZv9lvU@agluck-desk3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRVP281MB744463:EE_|BEZP281MB1957:EE_
x-ms-office365-filtering-correlation-id: 5d6fb5ec-fc1d-4005-f210-08df2b04992c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|18002099003|22082099003|10067099003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: 9xYv7ETpSmqMZF9eh5m6u8ICxREYPh9Z59aGZ6fzCkgq4qyrQcrBdTJyV5pUQ0HXLRfjjzILMBiwHlvYZdKd302pJ+8K/98XTdD1OyV68MdCFyNbCNDpF+/7D637/gm3K/6D22mUG5TyPo1VV/Ekcrmkws9T70ENP1Y6t91Vbw7CrMB8pUrSpni+un3FGuxhPvcuAkkj8ClkQVzhfI/4cYJoous3bfJCxivqdfk472TbKcHOWiN2RLP4MGXAII3dDY6nrzEkvD80XgpPRlW9lEpRvuHBaIhEsTsGNtRXieZRtxNsB3GMdfweSfqtr9SKyker0Cfk7L1i+EtjdvQ9NZlXj/MElTQSFV1yvJ5W+mTzXig6ZFNk9kkPWrL+a7BqVebOgoOm8EizZ4Cm+IARrzIHtzoY0uRH7he71ch6G1SwZOe/e9nUjseKAqBTYGy8cyRVGjKKCNVUrPaCjBCVOrDTVVA3IpRqd8RpcUFg5uQQMdGuVPMFPRxhtwbKQTISPPtORHGlhIbARlZnobs1YMOAJlIESujOp6KmDnKxgutfWdbNimcRXQG8ThFQAaQEGsVNfdHhBoGZQagNGtmjYNI3+mihg0kfVk8I6cOheL/ptw7EcSd5NwykB0kFUOev3c13nNg2p4PqiFTqY4JYjA6ZyXM6QE9XydaadPxCvaz2QV3U1N6BO3LyNKkgyAoJjr4Sy0cHOOedRLIFTazkW+s2A1DGp/PUHhOcNWdmn+A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(18002099003)(22082099003)(10067099003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXViVEhZWW82N0xNK1dpWE9NbE4ybEcrUUcyUHZIZEVDb0cxMUFKbk1JejZG?=
 =?utf-8?B?T0QyOFFQOFFaUEdpRFl2bG9UQlcreXQzTU45WjFxbU9QQWw2SkZZcXVOTzRm?=
 =?utf-8?B?WjkweUNXTFJ1c0tETVNSSjBFeVpKZGF2SzU2blpzMGFvSDNBWVZZTE8zR1JW?=
 =?utf-8?B?M2hpTHo1R1pFR01QUUIrWmxtS3JhbHZqamdBSmExSlI3Zk10aVBlTUtjYUVH?=
 =?utf-8?B?VWwwM1lQaFlKSmYrT0VtS3FnMGVPSDlEVU4vV3MzZElkeVJUMWtPeE9DTzFa?=
 =?utf-8?B?bnR2WmFSVjlNVWdmRW41U3ZMZmpYeVl3T25MelFnSWo1VWtpWjhXKytTT095?=
 =?utf-8?B?aTdWWC9ncy9LajBjVUEveWp4Y3JwbU96eWQ1US90V1ZnRm53NjQwU2NJTlN3?=
 =?utf-8?B?L3NtblhkNHhjNFFCdjBGSW5LY1hmc3ZhU3Y3elZibEdFdnIvYjhBUlZiQStk?=
 =?utf-8?B?TVdZUHBXT3hEbVhmalpIOXRleUd6ZnlNem05OXhCMy91ayt3NGpKNFdDaVQw?=
 =?utf-8?B?d1VVby9VblQ3c3UzbUlvd1cwcW1od2VuaCtFaHNlRk5ILzloenI0cGV2V0Jt?=
 =?utf-8?B?Y3BrOHdhZFlDNmkvcXkwWGwvSjRSU0pMQzdGVFZCUDdKL3BhSkJlN3plU0Uy?=
 =?utf-8?B?MUVYakRHTTh1eEp2RVltcVNpejRBckRYcjhkcmFyQzJnYWdpc3ptSU5Fd0pJ?=
 =?utf-8?B?eGRFMFA5ZUFSd2tCNHdiNXd1aGVpKzl5NEJ0L2RUeEphMk56a2dURUdqa3FL?=
 =?utf-8?B?ODlWM2ZTZzJLSWdXS3NjSFc3T0Z2OG1DWU5MZWRIVmtOakpaYU5hcis1TWJi?=
 =?utf-8?B?RUI0OGoyVENtUzhoZndjbXlPb0N0MGp4SEVsekl3V01JZmV4b1pwSUE2emhD?=
 =?utf-8?B?Ymx1MXNtQzNROWtGUGxzNHNMZ00yY1oxbGZ6ODk4RUNRcmNrRWRFRlA4c3li?=
 =?utf-8?B?N284cVpEQklkbXV3cnA1YTkvQ0xGbzg3ZUY3YzhnOW9QWHQrZ3NQL0FSTk5S?=
 =?utf-8?B?aUYvZlJNbG14SldoU283UzgyZXYwWS9YUnRHK2pNZ0xuVWU4MS9SRzU1SzBx?=
 =?utf-8?B?ZE5QUXB1WlFUOXpkTFhtamFGZ3RmTmpka0ZmclFUc3NlbmR2MDdWaXdaak8x?=
 =?utf-8?B?RTMyQ1lLU1dMNVVLZ1owbTE5aXgxL0VyRlg1eExzOE1ER1RjbksweEN2YXhJ?=
 =?utf-8?B?Q3AxN0paZWtKR2lSVkhUM1FNWW5HbWZtZDhkM2xSU1JFVXN0TGVMZ3lxQTVl?=
 =?utf-8?B?S2E4czF1SjdFeFpaQnRMOGRpdjB2ZFdSUXFRckxiMVJ3aEdqRi93ZFlSWVp0?=
 =?utf-8?B?eXNCWmVNZis3YUd4Nzl3R2IzTUxaYTBKSXVFWllHOWFpVHozb0I0c0RPTXFx?=
 =?utf-8?B?TmZCK2FCb0diczZpTEFrcWpVMTMzMlB6OHBhT3dOUTZqbXZDUnlUK0xkTlEv?=
 =?utf-8?B?cDVNNzVXMUdvbXRuWm5NdHM1b1poTUNicG5UVmc0R280K0pDdUJQS0dEaC9W?=
 =?utf-8?B?b3lkOEVLUXc4bDV5RTc1U2RvNHJrY3RuaEZwOWZwd3o5aWgxVTE2VHlWb3NJ?=
 =?utf-8?B?dUJtb2d1L2NjWDlVUDZQUk9ROUhsNS9Nb2xCL1NHVmo5UlpDY0p1QlJwQUli?=
 =?utf-8?B?bnZpZlJQek1XYy82aGRxcnhnRGxnREw2ZVBsNWh1WnZ6NmZJTW4zZExqT1RB?=
 =?utf-8?B?SHNYeUxLM2htVmtHQTZsR01SRmorVksxc0R2S0trVmNBYUJ2L2kvQUg0UzU3?=
 =?utf-8?B?VGl0dXV1YkFKSjJ2S3prN250bjBFbzY2L1Fncm9ZQkdrQnc1THBidC9pV3JW?=
 =?utf-8?B?Y3hSVzlKcGRtT3pxTG45RWp1L2pQRGd5RmFhK0ZwekVGdzRpMncwRWFJeFhJ?=
 =?utf-8?B?YjNPYkMzYi9IdC84cllpZ1F4NG1Bd3Azb2c2eUx4eERZMWlQQWtjckM4cWJW?=
 =?utf-8?B?SFV3TC9kVnpjNitBVncxZUM0MGFzVFVZTDFRVjFnNkNJRVJKSHp4RDdWQWsz?=
 =?utf-8?B?cloxTWU2UmdVZ3Y1dkZSeEIzZmo5c3JsZmJadS9ocmRJZStEbTNuemV5czUz?=
 =?utf-8?B?YlhmMDJjc1dEWU1OV3hKNHJjUmdxTWlGV3VlL3ZRU1hUWE5BeXFiaVZvY1pP?=
 =?utf-8?B?eEhWMis5MzJoLzBLaTkzeVBnM3ZmL2F0YWgwQXQ1QXRrWFQ0cHVMb3R5NGZW?=
 =?utf-8?B?VVJnSXJKVVhEa3JpdDBDSWpzSUhLK1I2a1NaWkhhUjcxOUR0MlRDYXJ3eXpC?=
 =?utf-8?B?NDJmS2RLcDFaeFIrS25LTzQzeU5KRm1KZXhwSHY5ZWJBOUliOXdLRWE4U0VM?=
 =?utf-8?Q?z8pBxlnHbFKXizaFcI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C2441BBEAEF5D48AF9B161B62E4684D@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Oi2WvR7v8UbYoTA1xvx0SFt4pHwoQyeT+1UXW4MuWOW2ni+X/vv1rT+fjLb2Mz2nQBNUL5MiCLHHEP31u0RM5FomHFiq/Jy+mmeCnHRhuGdEmSgFIRdv5KXBVdqmPnj8VW0EQTBTS/72WweF3Bj4Hxh9t0g/FuVDE9vYajCjj/3PLC/Qf6b+o3O9pV+z6XlMNnWsFGqR6c+hHp4AdfB1784R3aD1reLUsDTDIwebqM7hgC0i63Xdc0Yjao1OCTtiQmNzETnZCCJMne4OFb/R0jqDwS3X8DUG8Oyk4UbvlLNqLBAnLtu8Za78AA9EKsvoaaccjcipoLHFUWixRUEf2Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6fb5ec-fc1d-4005-f210-08df2b04992c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 21:38:05.9289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eewnh/oico4J6j6IZ9h1hTlWfdolpw+pbbHtaiulWYbqcoHCpe7GbnIjNkESOwTG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB1957
X-OriginatorOrg: amazon.de

SGkgVG9ueSwNCg0KT24gMTUuMTAuMjYgMTk6MTEsIEx1Y2ssIFRvbnkgd3JvdGU6DQo+IE9uIFRo
dSwgT2N0IDE1LCAyMDI2IGF0IDA0OjU4OjQ2UE0gKzAwMDAsIEdyYWYgKEFXUyksIEFsZXhhbmRl
ciB3cm90ZToNCj4+IEkgcmFuIGEgZmV3IG1vcmUgZXhwZXJpbWVudHMuIFRoaXMgc2VlbXMgdW4t
IG9yIGlmIGFueXRoaW5nIG9ubHkgbWlsZGx5DQo+PiByZWxhdGVkIHRvIGtleGVjLiBUaGUgcmVh
bCBjdWxwcml0IGlzIHRoZSBtaWNyb2NvZGUgdmVyc2lvbi4gSW4gbXkNCj4+IGVudmlyb25tZW50
LCB3ZSBib290IHdpdGggb2xkZXIgbWljcm9jb2RlICgweDEwMDAxNTkpLCB0aGVuIGhvdCBsb2Fk
IHRoZQ0KPj4gbGF0ZXN0IG1pY3JvY29kZSAoMHgxMDAwMTkxKSBhbmQgdGhlbiBrZXhlYy4gSW4g
dGhhdCBmbG93LCBhbnkgd3JpdGUgdG8NCj4+IElBMzJfTDNfUU9TX01BU0tfbiBzdGFsbHMgdGhl
IHNvY2tldCB0aGF0IHdyaXRlIGhhcHBlbnMgb24uIEknbQ0KPj4gY29sbGVjdGluZyBhIGJpdCBt
b3JlIGRhdGEgLSBpbmNsdWRpbmcgbWljcm9jb2RlIHZlcnNpb24gYmlzZWN0cywgZWFybHkNCj4+
IGxvYWQsIGV0YyAtIGFuZCBnaXZlIHlvdSBhIGZ1bGwgcnVuZG93biB0b21vcnJvdyBvciBvbiBN
b25kYXksIGRlcGVuZGluZw0KPj4gb24gaG93IHF1aWNrbHkgaXQgZmluaXNoZXMuDQo+IEFsZXhh
bmRlciwNCj4NCj4gSSBkb24ndCB0aGluayB0aGF0IGFuIHVwc3RyZWFtIGdlbmVyaWMga2VybmVs
IHNvbHV0aW9uIGlzIHRoZSByaWdodA0KPiBwYXRoIGZvciB5b3VyIHZlcnkgc3lzdGVtLXNwZWNp
ZmljIGlzc3VlLg0KPg0KPiBDYW4ndCB5b3UgZml4IHlvdXIgZGVwbG95bWVudCBzY3JpcHRzIHRv
IGxvb2sgYXQgc3lzdGVtIHN0ZXBwaW5nIGFuZA0KPiB1c2UgdGhhdCB0byBjaG9vc2UgdGhlIGtl
cm5lbCBib290IG9wdGlvbnM/IEkgcHJlc3VtZSB0aGF0IHlvdSBhbHJlYWR5DQo+IGhhdmUgY2hl
Y2tzIGZvciBDUFUgbW9kZWwgbnVtYmVyIHNpbmNlIHRoZXJlIGFyZSBsb3RzIG9mIGRpZmZlcmVu
dA0KPiBvcHRpb25zIGFwcHJvcHJpYXRlIG9uIGEgcGVyLW1vZGVsIGJhc2lzLiBTbyBhZGRpbmcg
YSBzdGVwcGluZyBjaGVjaw0KPiBtYXkgYmUgZWFzaWVyIHRoYW4gYmF0dGxpbmcgdXBzdHJlYW0g
TGludXggc3VibWlzc2lvbiBwcm9jZXNzLg0KDQoNCkkgY2FuIGhhY2sgYXJvdW5kIGl0IGZvciBt
eSBzcGVjaWZpYyBlbnZpcm9ubWVudC4gVGhlIHJlYXNvbiBJJ20gDQpzdWJtaXR0aW5nIHRoaXMg
aXMgYmVjYXVzZSBJIGV4cGVjdCB0aGF0IEkgd29uJ3QgYmUgdGhlIG9ubHkgcGVyc29uIA0KZmFs
bGluZyBpbnRvIHRoYXQgcGl0ZmFsbC4gSSBleHBlY3QgdGhhdCBlYXJseSBtaWNyb2NvZGUgbG9h
ZGluZyAod2hpY2ggDQppcyBkaXN0cm8gZGVmYXVsdCkgd291bGQgc2hvdyB0aGUgc2FtZSBmYWls
dXJlIHdpdGhvdXQga2V4ZWMuIEkgd2FudCB0byANCnNhdmUgdGhlIG5leHQgcGVyc29uIHRoYXQg
cnVucyBpbnRvIGl0IHRoZSBzYW1lIHBhaW5mdWwgZGVidWdnaW5nIA0KZXhlcmNpc2UgOikuDQoN
Cg0KQWxleA0K
