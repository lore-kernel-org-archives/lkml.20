Received: from iad-out-002.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-002.esa.us-east-1.outbound.mail-perimeter.amazon.com [13.216.54.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511513A9627;
	Wed, 16 Sep 2026 18:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=13.216.54.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583151; cv=fail; b=NCHmnoqWaN1LzjSmyDaEzgYULcpzhHEHmwV1n6VgQkg7nsHUpxd9AGc+BtexB6dn4EWvQj4wgtboJQfT6wU0wob7qxIuQVwD8cUWkEQpNLivULgEl1yG0NB35nE3P2xZvKQznd9Rf9ppCLm6dQmHRnY+vvA2cykK1Fs7rQkxON8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583151; c=relaxed/simple;
	bh=y2MNqQwIsQRgZkX7xxHyrd3grZcIAeWvMT6O7xtYPHY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RilHn0hI7H2wOQYht5BhpiArJPwcjPJt3bo6EELYBhCMvshRKxkvs7+vDn6GPCst5es/HHi0P/crepuCdXWgMTwbZ9F13qvli17rF6NtLIsJSLD314hTQPeucP4z4yFYL28UPqpkXwo8SvOeATQKBbyNSfA/DERmtdBf7SQ7ql0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=tjwILsQk; arc=fail smtp.client-ip=13.216.54.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="tjwILsQk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789583130; x=1821119130;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=y2MNqQwIsQRgZkX7xxHyrd3grZcIAeWvMT6O7xtYPHY=;
  b=tjwILsQki//oI0bIUOvuAURLZsO9dvH6/96qpj9BhWpX0ZmCbkSX+ndU
   HgsdgXYKOs6GRMwt8t7eh5C6JcTQxh8jnlhR9XFKByj0p/Jf4UDXM15jV
   50CivK9PS2U9H3TlC+41S019PsnS8vXeMewI1fU7ddxXfaCdzffHXIZGk
   JlQT7jFYU26NE7y2NBrhs6SFvPYq+IUipzPpIvYUX+djZ8AgWzL2BwX+Z
   983Q58eU+DFiz3DogL31YSuyr5Io2lIAu73XBgHGSk1vS1E03EJuPGkU7
   d2hFvduN31TOLCsGzKaXFoKqpMKYTtpccLUio5M1+2RHHSsbAq9dUqUHC
   Q==;
X-CSE-ConnectionGUID: 2kaxpTu0TK62IO7Y9wGqsA==
X-CSE-MsgGUID: 1yM54PhpQs6NaTPqtZhaZw==
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="27515736"
Received: from ip-10-4-13-79.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.13.79])
  by internal-iad-out-002.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 18:25:23 +0000
Received: from EX19MTAUEC001.ant.amazon.com [72.21.198.66:4786]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.34.106:2525] with esmtp (Farcaster)
 id 3e4c379b-aa11-4ac1-b0eb-594cf0a91297; Wed, 16 Sep 2026 18:25:23 +0000 (UTC)
X-Farcaster-Flow-ID: 3e4c379b-aa11-4ac1-b0eb-594cf0a91297
Received: from EX19EXOUEB001.ant.amazon.com (10.252.135.46) by
 EX19MTAUEC001.ant.amazon.com (10.252.135.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Wed, 16 Sep 2026 18:25:22 +0000
Received: from EX19EXOUEB002.ant.amazon.com (10.252.135.74) by
 EX19EXOUEB001.ant.amazon.com (10.252.135.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Wed, 16 Sep 2026 18:25:22 +0000
Received: from DM2PR0701CU001.outbound.protection.outlook.com (10.252.135.42)
 by EX19EXOUEB002.ant.amazon.com (10.252.135.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46
 via Frontend Transport; Wed, 16 Sep 2026 18:25:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ae5PbYHBx9ULDS4pFY2gccq2DqMkuhsIePukadlLEOo82gorRXN4q//6fHnu3feI7qQ9tqDEiYMqD6/kVNWqO/wY5++c0DjCB9DS8nlZXaYlFslA7xq8GtdEOuB7A7Ap3GbEMJgvvXISQYcUFedhtILYZkjH0LAanF2Mq6dtQJzAJt/H8JYe+1kkzG4UPnmANmMjK3r6OeZ3b/i4zKM7f4IofsJOKupt8nBwt0JvzHCXWrKSvIpL/G5ESp76JAAMBmasFXYjE9aO8NsJtlVqsQ8ojsqh51jys9M8t+sqMBumQ1nY9Vk7xACn2S1QCtGOZM38hwU2Y4ubRBTtkz0fPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2MNqQwIsQRgZkX7xxHyrd3grZcIAeWvMT6O7xtYPHY=;
 b=InIpkUc0W/5S0PCkPUCx4tcmViSaD9f5SKJKbhuT2d4gnsWQ4XF/RreolcmtfXkk+FMKlrwlRKja4BnDvAF5JiKQR9OmPq1K3eGFz2RXtKOsD/ZFH5jQlzl9lsm+s5owwP8ke5S40A2o3UWzymhvdOQdGWPowUJeTbSKNTXFGUijuj447Bh5cGhyNpNOxM9jLgWTWsDj0m3EaJonpSBtoroagA8pPRF6qhWAIF5HiF7KhuRFY2ZIbntVowCljiMtBgi08SxD24OmnFD+Ud9qZEwASVSi7OsnCTd1YBdG+/Iy5A9fwmmIGW7GR0tqC0qulNu5x2hcBChmM9cf6vZBtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by IA3PR18MB6356.namprd18.prod.outlook.com (2603:10b6:208:51b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 18:25:19 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 18:25:17 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/2] pps-gpio: restore pin mux on unbind and shutdown
Thread-Topic: [PATCH 0/2] pps-gpio: restore pin mux on unbind and shutdown
Thread-Index: AQHdRgi5HKO32J4rP0uW5LlaxQ81Bg==
Date: Wed, 16 Sep 2026 18:25:16 +0000
Message-ID: <BY3PR18MB472265F743C3751BDB1C3A61C6B92@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260916134744.46354-1-farbere@amazon.com>
 <f44a5cc5-d6f3-4871-b86a-1693cbfc1bec@enneenne.com>
In-Reply-To: <f44a5cc5-d6f3-4871-b86a-1693cbfc1bec@enneenne.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|IA3PR18MB6356:EE_
x-ms-office365-filtering-correlation-id: beb97335-d797-4f2a-12a9-08df141fdb8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|5023799004|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: e/Q3WQkKNXpUP0jN7F6dMIGooCueU6G9202X05ZNN540etcszckmMps0orbpM3UPxNBUZOu6+UXNCAIU0k6YIXGg9iKOQRPTSkVekosQ1fV1OnAqIE7tm+V4rXmbR1WJcSscDrniwYXwWXd1wAxceZUy6o2HmJp580CM3uv+CBJfTzDA2kvEZOCuyVvplSgCir5h4uP95fNvyKc3nMscuOsNd9c9ctxZj6TcHEnCHz3TzmG0C/qZzjiq/dHWUiFWqYOUxwRzBXDL3Zfb//BNottZHfieFdeIvQPQD8y5IlPLrGDhbJXY/SNcf4oEvGDvI8esXT4Sd+/0nHx1mt46T0IIp8IO4OAyJ2QPtSiPgRgLP8+7MeF3C3Yo75jJBM2ycTWDKbsSh+KN2bSNiMPLzRNKqa+TSJQCzbDHr/ykxEVb+5cpywOWymVF2Wi/1dLjNtnBD0iFavPEMhODoGgMmWBo3WgCQLHnqaVXG494oof0pkoEl4sSN+Fwa14ScQ6I0o782Tjl88C6s6IA2KbLGH3B3c+N0NznnsFAf/lwDUT5Jl8Iz24jSB7pjG+IBPZfIGUVeGdRtE0VjFf32tjOKS8KzI66FNU053/+cVpAQeOlpOl+8JJ4hrLt5NRCqFWfRxUMj8XIiGOCgMNx3hcOxxYwVDdV21q4d+PYbWW/r+MMs4Jbtf42O0K4BB/hxHHRgEjBmpWiAzEUzT2JHJSHnES9B6vua/1S9SM8L6dfljg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(5023799004)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUVYdTNNQ1RnRG1vL3dzejFUK2lrdEpPYlhVZVR5azhzcVF4dkJmbHI2Q2RL?=
 =?utf-8?B?YlFHVGZuUXQxVnlZR0VqTWl2Yi9lU21Salh1QnNnVVhEWTdHTmdVOHVPMzBU?=
 =?utf-8?B?MUxZdElKY1Q3ZVVEWmJ0N1AxZ0pzeGVUMEhUVHNUbGNmcEs0aE1ubkxIY2Zv?=
 =?utf-8?B?MUNNSDNsdHVFTlZ3RkF2d1hPeTZJbFJvZFZ5RE1hcnA5THIrU0VnUW5TSkpK?=
 =?utf-8?B?MzlEOVAwd2pzdjlNaEdVNEVBY3N0cTd4TDNDQ051dVZNTnpUc3dqclBEdjRM?=
 =?utf-8?B?K2tsYWZFSDMwdVBaVEppdGZqUk9iTXhlVmplSVRkK3J0VEpNQi81dndVcGdq?=
 =?utf-8?B?YmNaNEVteWQ0eUp6QjZEQWZ1RlVjMFZJclZtNy9SQzY5NmU0eWpPWFh4aXk0?=
 =?utf-8?B?OWlBRTlGWE90ZFJUNjh1UmgwcW5oWkhTWWdYNXpxK2ZoKysyb1pDcVRJZTBr?=
 =?utf-8?B?WkFvNXMxdXZ1WG1yNm1ya2tCekNuL2FuL1hvcFBMRnhBQ1hmN3ZRMkM3NDAr?=
 =?utf-8?B?T200ZU5xQWp6eUxxZHQ2L3N5dk85azRqdHhqU3BwK3JrUFROWWJybWEyVGtI?=
 =?utf-8?B?VzJ5cWV6ZTBkY1MwNUQ2clVrS1FOUUZiaDBza0dNNUtjMDhtM0FKWDhHcHdR?=
 =?utf-8?B?d0h1YVRNaVFBd0N4WGdJZUhsRW9RSytHNWFHdzVSYVUzU3llOEpyWkVnWlRj?=
 =?utf-8?B?c056bUg0NGhKOW5lSit4WUFIZkxRRDA3WDRVb0c5Y2UxNWJub3RNd000MW1l?=
 =?utf-8?B?N2NXSCs4Mk12SzNnVWFqaFZENXROa0duaGxBRnpXQW5xdDRualFPQmdvNmsv?=
 =?utf-8?B?QmduQm02cGdXazNZUVNlNC9iRy9sUDc1RUFPQkFPM2JJYzVTYTIvNlFyWkp5?=
 =?utf-8?B?Nldkc3BlbmxHR1JQRlB1enY0NUN0MHovZzYrU0ZqaVNJSnpxZG1rdmZObzJo?=
 =?utf-8?B?ZXR5Y1BzdUxiR3IraWtFM0dpS1BEVzBRenFsa3dFRlNqcjBUNnVicmVuanhP?=
 =?utf-8?B?Nk5IU01KRWd4STB5eFIxeExGQ3dZYm05SHVpR0pRcEtzdjl3TjNRR01KNzhw?=
 =?utf-8?B?SzBQdkIyRjhTWEhkdDY1YW5ISi9xOTA4dEpNOEszNWpxNmRhVEhySk1sZm12?=
 =?utf-8?B?OFdiSTB1MmZ2bU1xb092Y2VjMFE0T2Vnajk5d2ZrcUcyZjFJbnc3ekYva1Nz?=
 =?utf-8?B?Ti9YVktDUk1LTURaZ2YwdXF0UEY4THQ0MktnVFo4NUNHMStYMVJ2Z2I1aDdX?=
 =?utf-8?B?b0RmZWQyQzhNdWJRK3U5STk2SXI1MnFTei9kaTk4dzJJMDRQYnR1Tlh5ZG1i?=
 =?utf-8?B?cno4UVVQN2pjQm9mQWo5TlN2RWY5dHl5TkVvNU1oSENKN1BiNnQzY3phUjJ0?=
 =?utf-8?B?bE1FY1A5TnJma2M2YWw4R215ZVJsQXoxSkVRSEc1QjdvQmk1cXUvTE4vS1Bq?=
 =?utf-8?B?Z3Z6UUZEbFlCTnZvTEgvZjIxWTdTL05kQWcrTkdMa24xa3RzMFJGUEYraUQ4?=
 =?utf-8?B?RHgyNXlJWks2QUtsMERlRmF1cm53bWhEcjVmR2tHSVd6eS9WZTNQUFJNSVRk?=
 =?utf-8?B?RHhVNXBhT2huZEo1UlNtcTIvUytTS1dEY0pVV2pFdFAwd3VQeTVHK0Uvbklj?=
 =?utf-8?B?VW50ZUcxbkNwTFhuMjMvdW54OUV3ZG5ab012dk4xUTJYM2RsNzNteWdWWXBW?=
 =?utf-8?B?VERsakhyamVXcnpxYlg0RU0vVGNudmozRFNBcHR2aGFjTC96VWwrU1VEcjU0?=
 =?utf-8?B?dUxVV296aUdidXFObkhvcCtlLzFyOFdaeFRUNnNsUHVoY1RRZkFMWjJFLy9N?=
 =?utf-8?B?TmV2d0JTM2VtQ0xzNWhEMnBXNWthUHNRZWNXL1B2QjBidzBCd3NBSGxNcEFX?=
 =?utf-8?B?bUY5L2p2bzVJWTloWmt2S1JDNzdVSlNkM05HZDFHMFV2TWxsMDg1MURWQkRk?=
 =?utf-8?B?cEp6cDlkbjJZbFkrTDlrVnpEQTJFeG5RcW1BV0VCcHFRbnVKWU1LT0RRM1ZF?=
 =?utf-8?B?cm5QOEc5UjdsamJrSWl1eHNnZHZEQXh4ejZEdEdaV0w1eGVDelhuSisrbXhw?=
 =?utf-8?B?S2h1SndwaUliTXdFRFVWRjlYU0ViTmNKNlJET3ZLK2paMTlReUJXZ2ZTZkhk?=
 =?utf-8?B?ZE9XVThocmNLRlZYb3BPVXRzNlJLWEltVisydUVtbUFIVnRPbmpHaUJVRmxz?=
 =?utf-8?B?RnZrVGJqUkl3WEJtb3pocGpsdzI4bGNUVDRFUFFjRGI5cngwMHRTNlZqZ0ll?=
 =?utf-8?B?dVFuTGxRT2s3dVl2U1p1N05wTjdCK1BialUrR3lrbFRJNnpaQUVPc3lwNFZ1?=
 =?utf-8?Q?jOADAaD0BWsrly15G/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: My6Dnil1NAHfYd6KBI93053IRpOzeevx2IME+/SRKa8pb5KrzFVnQMgeDzyvAylYlfIWUaREZQParMTyvQ+ss4z5wcktD46z6lgmHLy2iTB/DdowXM4IdsD87tR+gTnF1aUqjAt9Yk5nkL91v8t9N+/HrK25Dr5OLt8I3zG8SA3Zhor+vxQ/p8jssmeyn9re11ah1NptOihGQizKHuM7Ih4+EmZUcL5Ksw3hi5+wVgMZ/mVjP3y0gNqaRu4kY4qLrw5X7r/Jrx/euVefGMZ8tgjcLepIvu0vWXN8Rj5WND/sbFN7a0pnuTSNSVqHbYUDGD3X33JFx1dSKuDllOaE5w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb97335-d797-4f2a-12a9-08df141fdb8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 18:25:16.9485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vEjELEVB1AQ5htEVe4YR+IdqKg63ybSH7k8OtxlWIGIokFY9ce645GK/d7Z+Py8iHYayZVc+4iBUQUF96mzK+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR18MB6356
X-OriginatorOrg: amazon.com

PiBPbiAxNi8wOS8yMDI2IDE2OjQ4LCBSb2RvbGZvIEdpb21ldHRpIHdyb3RlOg0KPiBCdXQgImlk
bGUiIGRvZXMgbm90IG1lYW4gIm5vdCBib3VuZCIsIHNvIGFyZSB5b3Ugc3VyZSB0aGlzIGlzIHRo
ZQ0KPiByaWdodC10aGluZyhUTSkgdG8gZG8/IHBpbmN0cmwtc3RhdGUuaCBkb2N1bWVudHMgaXQg
YXMgdGhlIHJ1bnRpbWUgUE0NCj4gc3RhdGUgYW5kLCBBRkFJSywgdGhhdCBpcyBob3cgdGhlIHJl
c3Qgb2YgdGhlIHRyZWUgdXNlcyBpdC4gSWYgcHBzLWdwaW8NCj4gZXZlciBncm93cyBhIHJlYWwg
cnVudGltZSBQTSBvciBhIC5zdXNwZW5kKCksICJpZGxlIiBpcyBhbHJlYWR5IHRha2VuDQo+IHdp
dGggYW5vdGhlciBtZWFuaW5nIC0tIGFuZCAxLzIgdHVybnMgdGhhdCBjaG9pY2UgaW50byBBQkku
DQoNClJpZ2h0LiBSZW5hbWVkIHRvICJpbmFjdGl2ZSIgaW4gdjIuDQoNCj4gU2FtZSBxdWVzdGlv
biBmb3IgdGhlIENPTkZJR19QTSBkZXBlbmRlbmN5OiB3aHkgc2hvdWxkIGEgQ09ORklHX1BNPW4N
Cj4ga2VybmVsIG5vdCBnZXQgdGhpcz8gQSBQUFMgYm94IGJ1aWx0IHdpdGhvdXQgUE0gaXMgbm90
IGFuIG9kZA0KPiBjb25maWd1cmF0aW9uLCBhbmQgdGhlcmUgdGhlIGJvYXJkIGRlc2NyaWJlcyBh
biAiaWRsZSIgc3RhdGUgYW5kIG5vdGhpbmcNCj4gaGFwcGVucywgc2lsZW50bHkuDQo+DQo+IFdv
dWxkbid0IGxvb2tpbmcgdGhlIHN0YXRlIHVwIGluIHRoZSBkcml2ZXIgKGRldm1fcGluY3RybF9n
ZXQoKSArDQo+IHBpbmN0cmxfbG9va3VwX3N0YXRlKCkgKyBwaW5jdHJsX3NlbGVjdF9zdGF0ZSgp
KSBhdm9pZCBib3RoLCBhbmQgbGVhdmUNCj4geW91IGZyZWUgdG8gcGljayBhIG5hbWUgdGhhdCBz
YXlzIHdoYXQgaXQgbWVhbnM/DQoNCkRvbmUuIHYyIGxvb2tzIHRoZSBzdGF0ZSB1cCBpbiB0aGUg
ZHJpdmVyIGFuZCBzZWxlY3RzIGl0IHdpdGgNCnBpbmN0cmxfc2VsZWN0X3N0YXRlKCksIGRyb3Bw
aW5nIHRoZSBDT05GSUdfUE0gZGVwZW5kZW5jeS4NCg0KdjIgYWxzbyByZXF1aXJlcyAiZGVmYXVs
dCIgd2hlbiAiaW5hY3RpdmUiIGlzIHByZXNlbnQgYW5kIHJlamVjdHMgdGhlDQptaXNtYXRjaCBh
dCBwcm9iZS4NCg0KPiBPbmUgdGhpbmcgdGhhdCBkb2VzIG5vdCBkZXBlbmQgb24gYW55IG9mIHRo
ZSBhYm92ZTogeW91ciBzaHV0ZG93bigpDQo+IGNoYW5nZXMgdGhlIG11eCBidXQgc2h1dHMgbm90
aGluZyBkb3duLiBUaGUgSVJRIGlzIHN0aWxsIHJlcXVlc3RlZA0KPiAocmVxdWVzdF9pcnEoKSBo
ZXJlIGlzIG5vdCBkZXZtLW1hbmFnZWQpIGFuZCB0aGUgZWNobyB0aW1lciBtYXkgc3RpbGwgYmUN
Cj4gYXJtZWQsIHNvIGEgdGltZXIgY2FsbGJhY2sgY2FuIHN0aWxsIHBva2UgYSBwaW4gdGhhdCBi
eSB0aGVuIGJlbG9uZ3MgdG8NCj4gc29tZWJvZHkgZWxzZSwgYW5kIHRoZSBQUFMgaGFuZGxlciBz
dGF5cyBhdHRhY2hlZCB0byBhIGxpbmUgdGhhdCBvdGhlcg0KPiBmdW5jdGlvbiBpcyBub3cgZHJp
dmluZy4gQW5kIGRldmljZV9zaHV0ZG93bigpIGlzIG5vdCB0aGUgZW5kIG9mIHRoZQ0KPiByb2Fk
OiB0aGUga2VybmVsIGtlZXBzIHJ1bm5pbmcgdG8gbG9hZCBhbmQgc3RhcnQgdGhlIGtleGVjIGlt
YWdlLCB3aGljaA0KPiBpcyB0aGUgY2FzZSB5b3UgYXJlIGFmdGVyLiBTaG91bGRuJ3QgaXQgdGVh
ciBkb3duIGluIHRoZSBzYW1lIG9yZGVyDQo+IHJlbW92ZSgpIGRvZXMsIGZyZWVfaXJxKCkgYW5k
IHRpbWVyX2RlbGV0ZV9zeW5jKCkgZmlyc3QgYW5kIHRoZSBtdXgNCj4gY2hhbmdlIGxhc3Q/DQoN
CkZpeGVkLiBzaHV0ZG93bigpIG5vdyBkb2VzIGZyZWVfaXJxKCkgYW5kIHRpbWVyX2RlbGV0ZV9z
eW5jKCkgZmlyc3QsIG11eA0KY2hhbmdlIGxhc3QuIEl0IGRvZXMgbm90IGNhbGwgcHBzX3VucmVn
aXN0ZXJfc291cmNlKCkgLS0gdGhhdCBpcyBhDQpyZW1vdmUtdGltZSBjb25jZXJuLCBub3QgbmVl
ZGVkIHRvIHF1aWVzY2UgdGhlIGhhcmR3YXJlIGZvciBrZXhlYy4gU2F5IGlmDQp5b3Ugd2FudCBp
dCB0aGVyZSBhbnl3YXkuDQoNClRoYW5rcywNCkVsaWF2DQo=
