Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012051.outbound.protection.outlook.com [40.107.209.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E093EEADE;
	Thu, 15 Oct 2026 05:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792042168; cv=fail; b=qKDSOvME/btFTm5FNmf8qxMahrLAeZhPQw+niVNl4IQl3WhTkp/cdLrTyCTXjbb2D1c9vXcaT6qlZZI5N0VT2apTzGEiIUzUIp0RtGMo5h0pPpd/5x68z6DACMTdvSCBSO/CNNCnIw14d7bV7wjBT0S9OZYLvp3F6qNz06W/HSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792042168; c=relaxed/simple;
	bh=o/Z5ii7rma2h8uV4EBmyCdmvjCOo6rUTYDZYIhl22kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Om3VZ72Q/3ONqSk2svvBjv/z/UM2Lw4QPNGJsMhYoG7Hzt1TuHnMy4F2xg4ubRaorcLdkHREwj6rOJMdUt56hu7a7+StaQxISlYtlc8lIabF9e9cQ+9veP1bGbpigS2NPjEbb4TYOO1ncuysdXIdhoHOrX3OSWjgZiywWTJKDfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=iBXn5yGP; arc=fail smtp.client-ip=40.107.209.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="iBXn5yGP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nObr4fpJPK0MCn1hCK/PR4fA97337bL9I38Ii3Iz7cKWy87Mcg0lHSqGkAxCy0nvEB5wPX12iRIR5oPsIwb0aCHx9Hm6XYOkS6wHUw+CFsMC5aTQ1ZgHZMbA0oo2oKCkS5DLZnD21S6JAVYvpZC4tER1BeKrm4E1gk69D/5Uw/Et60fvuceGDvllbMBfKxY3Q6/n+QfTIT+azH+/pF5FzKvE0pXAojQ/R3h6hCCXOGDDdKquzJmWZeowUDvwepczOcqyoWAat5Ym9muwvkKfuA47kwhpa2B34qhC4HkyMvkHbPSLLgnnMvfMY45ltCIN4r+IaQBGmM684Y2+9LIkjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvBfBNfVeQIcsCz8hcAMpBv64I8KCF1rrH9ieRKkyKE=;
 b=tux3n67oYsULO6dPHHquiZWNP5imydzDHiIJLbOm2AOikxUw5K720M45WC1RBjzpXyN6G2DBEjHDkR4DMIy1Iw01KQiggpjzqQzm0B4LMqT4wWHJslI/0x5F+JrA5v0fYnNeWPfbXY19vOdS4MJuvk+lL+G4u/WKCxU91COj9xLLhLXAYePY0eEeILedshgTB97pndTnLfAzub98m6V5+o/GaPR97bcE5uWHpGW2gVpxHGeXuf/T1ORVxgeT1+WQNaOjPrYwBal4fNAKwVZL32gfk9ZJZZWCjsqupI7G0a9wu3e3Qi72hVB4nmhKt5Q0ZjjKq+W0lgWszfeFBAuZkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvBfBNfVeQIcsCz8hcAMpBv64I8KCF1rrH9ieRKkyKE=;
 b=iBXn5yGPp8OFDVMdgEQXq89a7R4UZqKZnOByBCu8rxn5OJNaKvv5tr6bsCu2MkFTJ4lS3Fa6lKP/wzzukKfJUDL0aKafKvzVkNv7UaVMrCN3R196a04VvYBvn/TAwt+CZzxvhKZLhrtr3mzxZCFSoVQDhSBcjZQAbx6rHnCS9aDWMG0CeLqiDHEbRqzknYpEplhXR0WefOVkq9D36kgzNqaSt2VxplXUe+rv7otCNdlAyvhpx1d1y+0Mf5hdPRtYH30C5OFfKEywQOE61USfJ4fR/4YRgu9KJkIAiEHwRqisphq9mYsY6dZ/W8+zdXeWVzBivGf6O0/2BRZASemL8w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DS3PR03MB097838.namprd03.prod.outlook.com (2603:10b6:8:546::7)
 by BLAPR03MB5602.namprd03.prod.outlook.com (2603:10b6:208:284::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 05:29:21 +0000
Received: from DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59]) by DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59%6]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 05:29:21 +0000
From: hang.suan.wang@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Ahsan Atta <ahsan.atta@intel.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Gabriel Whigham <gabewhigham@gmail.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Will Deacon <will@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-doc@vger.kernel.org
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v7 3/3] firmware: socfpga-fcs: add Altera SoCFPGA FCS driver with SDOS
Date: Wed, 14 Oct 2026 22:29:13 -0700
Message-ID: <07bed5dd6a06b6167d53b5bdc213db431fe2724f.1792034130.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1792034130.git.hang.suan.wang@altera.com>
References: <cover.1792034130.git.hang.suan.wang@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::34) To DS3PR03MB097838.namprd03.prod.outlook.com
 (2603:10b6:8:546::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR03MB097838:EE_|BLAPR03MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: bb042d7e-41a1-4c3e-d556-08df2a7d4447
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|6133799003|22082099003|55112099003|10067099003|3023799007|18002099003|921020|261009223027099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	rWZ6AUxuQGglp5WXDU/JglV5NF2kTTO5fHRhTmE/uyfQZXjxM2N7o1dTob2S2rwDtwxLSfRc7wvw+bO1XmebITnwBY/r6gr8mkM7Hp+ry48R2QAuuE3XzZtOnrDoEoyxQhngrt4paQk8W7d5OKPmRXy+GT2rbCGaK7fKttzBPs+7lCjvah2wij2kpXhgXjulHDLUnKwdO9M5E0/OJu8M0+mul7bY1g9Xg7GVTlITOnGlK1qSMBUODZ8TvTDIBi6O9d94thpGAD4E6XagQGpAH2mQLYrIQ2tyeV1pM67/vmNU3gO0DqnuXXBt7MqFUDKht+59EbOPYAfIlhfOixZx3RbPRDBYzIPGq2CU1hCw8kKdwNvt2xWSIygzjXTex3xeFWeI5X0fbdjJgP5MQP85ZPMLADTy0St/+Sl51GrY+FDpHkpsiSun+ThF8ir5S4TbmPVFi8q75Cehny7304OG9WTbk8F/E/Iea6V3/MfKj8KNVBm7tojaNAS5mVHgxHgQCGOUfipFqtt42F21H4SE4OYeBzoaRkWlsWOkr4k6UN9lCXnLIJwdN8otC7iOO0F68xSBjT3ucwqVoysSeQo6sJlrUg9M+kNFnUmF9B5nnsU61D+CVO0iKDtMg82tYDN2hhb/t6iFd98tNBWHShfuFynjsG5TMvDoqVu5zmCzLWcckyQ+t3SMgoajIIVZTUGs2fk7I5XBpVcRRb7KV6OWCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS3PR03MB097838.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(6133799003)(22082099003)(55112099003)(10067099003)(3023799007)(18002099003)(921020)(261009223027099003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzV5Ynp3eEgxaC9pMUlYZlNXVkYvVU02TWhSQnV6RUNYOWJWaFd1WnYzeENO?=
 =?utf-8?B?WWtqL2U1ZTlkdnd6U2lUMFA3RU5qb2ZKWHZnbGZlMXQ0QXFyeWpOT2F0VzVh?=
 =?utf-8?B?NkRaa0JLY2RXd2w3ME53VXl2WkcxTFkrUllMd2puY2t0dUpTQ0dIT2FCL0o4?=
 =?utf-8?B?Zk41TlNXLzd0RXdSOTcyM1UzNnY4R1orc3EzcXF2ejdaSmZLUnhjOW9lQllO?=
 =?utf-8?B?KzhOalE4eFhWWmhkWEtwOEJBeEh5Q2t5dUdpQS9pYWFremkrc3pWMk1uaE85?=
 =?utf-8?B?RU90RGdVVFU5NmtXRnk3WUUxM05OanpCUFF5VXN6Z25JRU1kYXRRbTczdDNJ?=
 =?utf-8?B?S1pUQlFzV21JdnBwbzlUUGltdmRQNUw5VjNaVCtOU2RnRnJhS0s2RlpuM0ow?=
 =?utf-8?B?aWlWYXdJRytEcEhtWklEcHphUmN6TTNnNlJjYzFpTjNSak5SUTR4UTc5OTNT?=
 =?utf-8?B?cEtFMjd6MVNIM2czMG81YWcvMWIyMUtlcWhkSXpxbVNDNUl2ZjBybmlaR1Nu?=
 =?utf-8?B?OXhkN0lTVXd1MXllM0ZUVVUybmlkQm5OQ0dYUmZZa0ZFaWpWUzdjWnZuOFpn?=
 =?utf-8?B?dlo4aGJZVnpSNTlwWDJjTUg0NVlyOTlzdnljZjJPS3hKZmVxajhRMWpCTW1I?=
 =?utf-8?B?bDJPcFhlV1NBMXNkNTNRUC9rTjREb3ZZRWpXVWthNFc4YWhWOE53TmYyOGQx?=
 =?utf-8?B?ck8yTGRQVm5OdjNWUWFNc1Q0aDZsMU1pNmRVZFhYdjFzL3hyU0treTgwWlJi?=
 =?utf-8?B?V043dXhRM0dPVHRzUG1vcUl2UDFjTHR3L0FMQWFxS3FCTjNRNEJvSUxQSDB3?=
 =?utf-8?B?WEIwRlBMVHozQUpTRWk1NlF5eFNOOGlnMGxQYzllMWtSZmdqV3BVVzQ4dEEy?=
 =?utf-8?B?dUtxTngvcDNsanNzaythQ0p0MGhMR29TUHVpQWVBbUo2MTFrVk9sL1lyald2?=
 =?utf-8?B?d0w0a3Jrd3hNSHB3MGUxb0ZrRnZkZUdSd1k3aysveWZSbndiMnUrRVFNVlk2?=
 =?utf-8?B?Nm8vTlJ3dU5tSjdEME5jajdjYmhsYmRTMmJBdjF4eDl1bVJpZE1PcCs4SHlw?=
 =?utf-8?B?QVp1MGEzVlhLOW13Wk9qT1B6VU13cTlyc2cySVJkOHR3UkVFc3UvelFublpL?=
 =?utf-8?B?QjRxSzdJVzVMMzFQaFN3bmNDRml5TVVJY0ZuMzk1Q2hxRXppNGw0am00UUVX?=
 =?utf-8?B?dENhd2pBdWlTWlJrNGVxM0RBSGJrS21SUXM1QWlXckxEOVFiSDdlTjNSRWRk?=
 =?utf-8?B?U3NYZFdkYkJxR0FxeHBUamRybG9tdEdNZUVyUldwMnJiU1JIajRIRCtzZUpz?=
 =?utf-8?B?K2lwUk9pSUR4NFUyK1hVblRsZkFCZ0c2c1FVN3pBMjNYeGJia2FQcEZ1K29G?=
 =?utf-8?B?ZVRrMkw4c2JEaW15cVVoM3VOZTRYRlNOaWpTTFMya0tQWG1TR0V5U0FPQ3pQ?=
 =?utf-8?B?RlVGNmFFMUNYR0IwVWhqYWpFaGxvNkQyQ1F1eWFjSHJTY2x3MFJINVlEeWxw?=
 =?utf-8?B?aExvTGtwWHgzZm1iUlczMFB5RS83QlhqY2hXYUJMaURKQ0p6a1htampQMkEz?=
 =?utf-8?B?M0VqQkV0cVpzUTZ0d2VaYkdLemxhOWRtT0U5NXIrdnZpckpOR1F5ZVhyUlIw?=
 =?utf-8?B?QjUyNytVMlJtMXhFb2lLMkVlUkJ1Z292NEd1ZmwxYnNOWUdqQ00xK1d6Smh2?=
 =?utf-8?B?OVRaalJCRGc2V3NEM0RUQ25LZHhlZndBaVBCWVV1TU1HaWJUNHc2NlNzUjFL?=
 =?utf-8?B?UEVDRnBrZ0gxNVNWWEhYOERGUUF3R29hckcvZWpSalliTStiaG5xanZvZ0tr?=
 =?utf-8?B?MTdQR2xldVJOdmtYQzdjVm00OE1BU25sbXJnTG85TnY3eEVkUzh1d0xyMzJQ?=
 =?utf-8?B?L3JYOWVBMzMyUVlXR0VDZmkrMUFwdERyWHlIcUNseE5HN2ZjZzBUdzlScnRp?=
 =?utf-8?B?Uy9TOHdRUGZqcEtmZmMrUTR2TnhXanF6Z05nTlAwRlFOUE5EZHdPSXlnSlY3?=
 =?utf-8?B?UmJrbzFVbzBEVll6bXhQZGlkbzdRV1JIeHIxeU9BK09FSklja3pTNnJqbTI1?=
 =?utf-8?B?NWVZd3UxMU0xeGRnOUxOV0kwd2hDVnFRcjVOZnR2K3pLQ0J3bUtPTTZCelBu?=
 =?utf-8?B?UEtKSHQ0K0hDcUI3RStidDVYRXBpM0xRK2k5eHdnUURHVmlXMFI5YTd1akZw?=
 =?utf-8?B?aXZQNmFYMU03VzMvblQyNnVGVW12Uk03aFhlSG9SMlRxMDlySmlMNlBNdmVM?=
 =?utf-8?B?OWJKNVVGU3FJTjNBTXlBRFR1bGdtYzBPNFBhSGV2MXd0TDFTUCsvczRGSkRL?=
 =?utf-8?B?RHM0QllrWFN6Q04vQ2xPQ1lXZlNLYUhPc1lINjNSajB4RkVJV0JkVkFUbDJj?=
 =?utf-8?Q?0RPOxVzfvMGY92Lk=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb042d7e-41a1-4c3e-d556-08df2a7d4447
X-MS-Exchange-CrossTenant-AuthSource: DS3PR03MB097838.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 05:29:21.5690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCeXSyIxZAiIwrSln0RxKJDNaoEsEV4xO68kp5+QEnFG5cbMmwagvDLlNEFgMExrAz0uuBV30AxSVEumqtwNE9VmkDy/KlHq8AlJiCkb5/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5602

From: Hang Suan Wang <hang.suan.wang@altera.com>

Add the Altera SoCFPGA Crypto Service (FCS) driver, which exposes the
Secure Data Object Service (SDOS) encrypt/decrypt operation to
non-secure host software.

The SDOS protects data at rest: the SDM encrypts and decrypts using a key
derived from a device-unique SDOS root key plus an SDM-generated IV, so
the host never handles raw key material or IVs. It only submits plaintext
it already owns and receives authenticated ciphertext objects managed by
the SDM. A primary use case is the operational keys are installed without
ever appearing in cleartext.

The driver is a standalone module and describes no hardware of its own.
It binds by name to the "stratix10-fcs" platform device registered by
stratix10-svc, so no device-tree node is required. SDOS requests go to
the SDM through the stratix10-svc asynchronous SIP SMC path using
service-layer memory pool buffers that the SDM can reach via physical or
SMMU-remapped addresses. Userspace talks to /dev/socfpga-fcs via ioctl
and sysfs exposes atf_version.

For encryption the SDM returns a structured object (header, ciphertext,
HMAC). For decryption the SDM validates the HMAC and enforces the 64-bit
owner ID from the object header so only the creator can decrypt it.

Each SDOS request opens an SDM crypto session, runs under priv->lock
(one in-flight transaction), and closes the session afterwards.

Signed-off-by: Hang Suan Wang <hang.suan.wang@altera.com>
---
 Documentation/misc-devices/index.rst          |   1 +
 Documentation/misc-devices/socfpga-fcs.rst    | 140 ++++
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |  10 +
 drivers/firmware/Kconfig                      |  17 +
 drivers/firmware/Makefile                     |   2 +
 drivers/firmware/socfpga-fcs-core.c           | 704 ++++++++++++++++++
 drivers/firmware/socfpga-fcs.c                | 296 ++++++++
 include/linux/firmware/intel/socfpga-fcs.h    | 118 +++
 include/uapi/misc/socfpga-fcs-crypto.h        |  65 ++
 10 files changed, 1354 insertions(+)
 create mode 100644 Documentation/misc-devices/socfpga-fcs.rst
 create mode 100644 drivers/firmware/socfpga-fcs-core.c
 create mode 100644 drivers/firmware/socfpga-fcs.c
 create mode 100644 include/linux/firmware/intel/socfpga-fcs.h
 create mode 100644 include/uapi/misc/socfpga-fcs-crypto.h

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index f911edaecbfa..9cefd8bc15a7 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -24,6 +24,7 @@ fit into other categories.
    mrvl_cn10k_dpi
    oxsemi-tornado
    pci-endpoint-test
+   socfpga-fcs
    spear-pcie-gadget
    tps6594-pfsm
    uacce
diff --git a/Documentation/misc-devices/socfpga-fcs.rst b/Documentation/misc-devices/socfpga-fcs.rst
new file mode 100644
index 000000000000..bede6fe3906b
--- /dev/null
+++ b/Documentation/misc-devices/socfpga-fcs.rst
@@ -0,0 +1,140 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================================
+Altera SoCFPGA Crypto Service (FCS)
+===================================
+
+Overview
+========
+
+The Secure Device Manager (SDM) is the hardware security controller in Altera
+SoCFPGA devices. It offers a runtime cryptographic interface, the FPGA Crypto
+Service (FCS), which the host reaches through the stratix10-svc mailbox using
+Arm Trusted Firmware SIP SMC calls.
+
+This driver exposes one FCS operation: the Secure Data Object Service (SDOS),
+which encrypts and decrypts data at rest. The SDM derives the working key from
+a device-unique SDOS root key that never leaves the secure boundary, so the
+host never handles raw key material. A primary use case is black-key
+provisioning.
+
+The crypto session and the per-request context ID are opened and closed by the
+kernel around each request. Neither is part of the user ABI.
+
+Why a dedicated ioctl
+=====================
+
+SDOS seals and unseals arbitrary application data of up to 32 KiB, not keys of
+a bounded size, so the keyring payload limits of the trusted-keys subsystem do
+not apply to it. The object it produces is a firmware-defined container rather
+than a generic AEAD output, no key is ever set from the host so the crypto API
+has nothing to bind a transform to, and the SDM returns per-operation status
+values that must reach the caller alongside a valid result.
+
+Device node
+===========
+
+The driver registers a misc device::
+
+    /dev/socfpga-fcs
+
+Opening it takes a reference on the driver state. If the driver is unbound
+while the file is open, subsequent operations fail with ``ENODEV`` rather than
+tearing the file descriptor out from under the caller.
+
+Buffer sizes
+============
+
+An SDOS object consists of a 40-byte firmware-defined header, the payload, and
+for an encrypted object a trailing 48-byte HMAC. The payload is between 32 and
+32672 bytes.
+
+==================  ==================  ==============
+``op_mode``         ``src_size`` range  Maximum output
+==================  ==================  ==============
+non-zero (encrypt)  72 .. 32712 bytes   32760 bytes
+zero (decrypt)      120 .. 32760 bytes  32712 bytes
+==================  ==================  ==============
+
+Size the output buffer for the maximum shown above. The SDM reports the exact
+produced length once the operation completes.
+
+Data structures
+===============
+
+.. kernel-doc:: include/uapi/misc/socfpga-fcs-crypto.h
+   :identifiers: fcs_ioc_sdos
+
+Driver IOCTLs
+=============
+
+.. c:macro:: FCS_IOC_SDOS
+.. kernel-doc:: include/uapi/misc/socfpga-fcs-crypto.h
+   :doc: FCS_IOC_SDOS
+
+Return value
+============
+
+On success 0 is returned and the ``__u32`` addressed by ``dst_size`` holds
+the number of bytes the SDM produced. On error -1 is returned and ``errno``
+is set.
+
+=========== ================================================================
+Error       Description
+=========== ================================================================
+EINVAL      ``dst`` or ``dst_size`` was NULL, or ``src_size`` was out of
+            range for ``op_mode``.
+EMSGSIZE    The output did not fit in ``dst``. The operation itself
+            succeeded and ``error_code`` holds the SDM status, but the
+            result is discarded, so ``dst`` must be sized for the maximum
+            output.
+EFAULT      One of the supplied addresses was not accessible.
+EIO         The SDM reported a fatal error. ``error_code`` holds the status.
+ENODEV      The device was unbound while the file descriptor was open.
+ENOMEM      Staging buffers could not be allocated.
+ERESTARTSYS A signal arrived while waiting for another request to finish.
+            Only one SDM transaction is in flight at a time.
+=========== ================================================================
+
+SDM status values
+=================
+
+The ``__s32`` addressed by ``error_code`` carries the firmware status. Two
+decrypt results are successes that carry a warning: the ioctl returns 0 for
+both and the plaintext is in ``dst``.
+
+======= ================================================================
+Status  Description
+======= ================================================================
+0x000   The operation completed successfully.
+0x102   Decryption succeeded; reprovisioning the key is recommended.
+0x103   Decryption succeeded, but not with the latest key.
+======= ================================================================
+
+Any other non-zero status is fatal and the ioctl fails with ``EIO``.
+
+User-space usage
+================
+A sample userspace application demonstrating these ioctls can be found at
+`Git Repository - altera-fpga/libfcs <https://github.com/altera-fpga/libfcs>`_
+
+Decrypting an object::
+
+    __u8 out[32712];                /* maximum decrypt output */
+    __u32 out_len = sizeof(out);
+    __s32 status = 0;
+
+    struct fcs_ioc_sdos arg = {
+            .error_code = (__u64)(uintptr_t)&status,
+            .src        = (__u64)(uintptr_t)in,
+            .src_size   = in_len,
+            .dst        = (__u64)(uintptr_t)out,
+            .dst_size   = (__u64)(uintptr_t)&out_len,
+            .op_mode    = 0,        /* decrypt */
+    };
+
+    if (ioctl(fd, FCS_IOC_SDOS, &arg) == 0)
+            /* out_len bytes of plaintext in out */
+            write(STDOUT_FILENO, out, out_len);
+    else
+            fprintf(stderr, "SDOS failed: %m, SDM status 0x%x\n", status);
diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 2fc53093752d..a1e07f7f6870 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -348,6 +348,7 @@ Code  Seq#    Include File                                             Comments
                                                                        <mailto:luzmaximilian@gmail.com>
 0xA6  00-0F  uapi/linux/alloc_tag.h                                    Memory allocation profiling
                                                                        <mailto:surenb@google.com>
+0xA6  00-1F  uapi/misc/socfpga-fcs-crypto.h                            Altera SoCFPGA FCS (Crypto Service)
 0xAA  00-3F  linux/uapi/linux/userfaultfd.h
 0xAB  00-1F  linux/nbd.h
 0xAC  00-1F  linux/raw.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..683e08ba9a74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -945,6 +945,16 @@ ALPS PS/2 TOUCHPAD DRIVER
 R:	Pali Rohár <pali@kernel.org>
 F:	drivers/input/mouse/alps.*
 
+ALTERA FCS DRIVER
+M:	Hang Suan Wang <hang.suan.wang@altera.com>
+M:	Genevieve Chan <genevieve.chan@altera.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/misc-devices/socfpga-fcs.rst
+F:	drivers/firmware/socfpga-fcs*
+F:	include/linux/firmware/intel/socfpga-fcs*
+F:	include/uapi/misc/socfpga-fcs*
+
 ALTERA MAILBOX DRIVER
 M:	Tien Sung Ang <tiensung.ang@altera.com>
 S:	Maintained
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index b7cc11e4fbfa..15727855fd5f 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -193,6 +193,23 @@ config INTEL_STRATIX10_RSU
 
 	  Say Y here if you want Intel RSU support.
 
+config ALTERA_SOCFPGA_FCS
+	tristate "Altera SoCFPGA Crypto Services (FCS)"
+	depends on INTEL_STRATIX10_SERVICE
+	help
+	  Altera SoCFPGA Crypto Services (FCS) driver gives user space
+	  access to the crypto services of the Secure Device Manager (SDM)
+	  through the Intel Service Layer, with requests forwarded to Arm
+	  Trusted Firmware.
+
+	  The SDM executes or authorizes the requests using device-rooted
+	  security resources. Protected key material stays within the
+	  secure firmware boundary and is never exposed to non-secure host
+	  software.
+
+	  Say Y here to add support for Altera SoCFPGA Crypto Services
+	  (FCS).
+
 config MTK_ADSP_IPC
 	tristate "MTK ADSP IPC Protocol driver"
 	depends on MTK_ADSP_MBOX
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index be46f1e1dc77..b489548ef3b8 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -2,6 +2,8 @@
 #
 # Makefile for the linux kernel.
 #
+obj-$(CONFIG_ALTERA_SOCFPGA_FCS) += altera-fcs.o
+altera-fcs-y := socfpga-fcs.o socfpga-fcs-core.o
 obj-$(CONFIG_ARM_SCPI_PROTOCOL)	+= arm_scpi.o
 obj-$(CONFIG_ARM_SDE_INTERFACE)	+= arm_sdei.o
 obj-$(CONFIG_ARM_SDEI_NMI)	+= arm_sdei_nmi.o
diff --git a/drivers/firmware/socfpga-fcs-core.c b/drivers/firmware/socfpga-fcs-core.c
new file mode 100644
index 000000000000..5c4db92712a9
--- /dev/null
+++ b/drivers/firmware/socfpga-fcs-core.c
@@ -0,0 +1,704 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Altera Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/random.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+#include <linux/firmware/intel/socfpga-fcs.h>
+#include <linux/firmware/intel/stratix10-svc-client.h>
+
+#define OWNER_ID_OFFSET				12
+
+#define SDOS_DECRYPTION_REPROVISION_KEY_WARN	0x102
+#define SDOS_DECRYPTION_NOT_LATEST_KEY_WARN	0x103
+
+#define MSG_RETRY				3
+#define FCS_RETRY_SLEEP_MS			1
+
+struct fcs_cmd_params {
+	const void	*src;
+	void		*dst;
+	u32		src_len;
+	u32		dst_len;
+	u32		op_mode;
+	u64		own;
+};
+
+/**
+ * fcs_atf_version_callback() - service-layer callback for the ATF version query
+ * @client: pointer to the stratix10-svc client
+ * @data: pointer to the service-layer callback data
+ */
+static void fcs_atf_version_callback(struct stratix10_svc_client *client,
+				     struct stratix10_svc_cb_data *data)
+{
+	struct socfpga_fcs_priv *p = client->priv;
+
+	p->status = data->status;
+	if (data->status == BIT(SVC_STATUS_OK)) {
+		p->status = 0;
+		p->atf_version[0] = lower_32_bits(*(unsigned long *)data->kaddr1);
+		p->atf_version[1] = lower_32_bits(*(unsigned long *)data->kaddr2);
+		p->atf_version[2] = lower_32_bits(*(unsigned long *)data->kaddr3);
+		p->atf_version_valid = true;
+	} else if (data->status == BIT(SVC_STATUS_ERROR)) {
+		p->status = lower_32_bits(*(unsigned long *)data->kaddr1);
+		dev_err(client->dev, "mbox_error=0x%x\n", p->status);
+	}
+
+	complete(&p->completion);
+}
+
+/**
+ * fcs_async_callback() - completion callback for an async service request
+ * @ptr: pointer to the completion to signal
+ */
+static void fcs_async_callback(void *ptr)
+{
+	if (ptr)
+		complete(ptr);
+}
+
+/**
+ * fcs_svc_send_sync() - run a command on the synchronous service path
+ * @msg: service-layer message to send
+ * @timeout: time to wait for the response
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_svc_send_sync(struct socfpga_fcs_priv *priv,
+			     struct stratix10_svc_client_msg *msg,
+			     unsigned long timeout)
+{
+	int ret;
+
+	reinit_completion(&priv->completion);
+
+	/*
+	 * receive_cb is only used by the sync send path; leave it set so a
+	 * late response cannot find a NULL callback.
+	 */
+	priv->client.receive_cb = fcs_atf_version_callback;
+
+	ret = stratix10_svc_send(priv->chan, msg);
+	if (ret) {
+		dev_err(priv->client.dev, "failed to send message to service channel\n");
+		priv->client.receive_cb = NULL;
+		return ret;
+	}
+
+	if (!wait_for_completion_timeout(&priv->completion,
+					 msecs_to_jiffies(timeout))) {
+		dev_err(priv->client.dev, "svc timeout to get completed status\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+/**
+ * fcs_svc_send_async() - run a command on the asynchronous mailbox path
+ * @msg: service-layer message to send
+ * @timeout: time to wait for the response
+ *
+ * Return: 0 once the transaction completed, negative errno on transport
+ *         failure or timeout.
+ */
+static int fcs_svc_send_async(struct socfpga_fcs_priv *priv,
+			      struct stratix10_svc_client_msg *msg,
+			      unsigned long timeout)
+{
+	unsigned long deadline = jiffies + msecs_to_jiffies(timeout);
+	struct stratix10_svc_cb_data data;
+	void *handle = NULL;
+	int status, index;
+	int ret;
+
+	/*
+	 * Use priv->completion, not a stack one: on timeout this function
+	 * returns while the svc layer still holds a pointer to it.
+	 */
+	reinit_completion(&priv->completion);
+
+	for (index = 0; index < MSG_RETRY; index++) {
+		status = stratix10_svc_async_send(priv->chan, msg, &handle,
+						  fcs_async_callback,
+						  &priv->completion);
+		if (status == 0)
+			break;
+		msleep(FCS_RETRY_SLEEP_MS);
+	}
+
+	if (status || !handle) {
+		dev_err(priv->client.dev, "Failed to send async message\n");
+		/*
+		 * A NULL handle with a success status would otherwise be
+		 * reported as a completed transaction that never ran.
+		 */
+		return status ? status : -EIO;
+	}
+
+	ret = -ETIMEDOUT;
+	while (!time_after(jiffies, deadline)) {
+		status = stratix10_svc_async_poll(priv->chan, handle, &data);
+
+		if (status == 0) {
+			ret = 0;
+			break;
+		}
+
+		/*
+		 * Keep polling until the deadline. Leaving an in-flight
+		 * transaction orphans the SDM crypto session.
+		 */
+		ret = status;
+		msleep(FCS_RETRY_SLEEP_MS);
+	}
+
+	if (ret) {
+		dev_err(priv->client.dev, "Failed to poll async message\n");
+		goto out;
+	}
+
+	priv->status = data.status;
+
+	/*
+	 * For warnings 0x102/0x103 are success-with-warning (outdated key)
+	 * the plaintext is valid and fcs_sdos_crypt() still returns it.
+	 * Non-zero SDM status is a firmware result, not a transport failure.
+	 */
+	if (data.kaddr1)
+		priv->resp = lower_32_bits(*(unsigned long *)data.kaddr1);
+
+	if (data.status)
+		dev_err(priv->client.dev, "SDM mailbox status 0x%x\n", data.status);
+
+out:
+	stratix10_svc_async_done(priv->chan, handle);
+
+	return ret;
+}
+
+/**
+ * fcs_svc_send_request() - build and send an FCS command to the service layer
+ * @command: FCS command code to dispatch
+ * @timeout: time to wait for completion, in milliseconds
+ * @params: payload and arguments for @command, or NULL for commands that
+ *          carry none
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_svc_send_request(struct socfpga_fcs_priv *priv,
+				enum fcs_command_code command,
+				unsigned long timeout,
+				const struct fcs_cmd_params *params)
+{
+	struct stratix10_svc_client_msg *msg;
+	int ret = 0;
+
+	/*
+	 * The service layer keeps this message alive in its transaction handle
+	 * and still dereferences it from stratix10_svc_async_done(), so it
+	 * cannot live on our stack.
+	 */
+	msg = kzalloc_obj(*msg);
+	if (!msg)
+		return -ENOMEM;
+
+	priv->status = 0;
+	priv->resp = 0;
+
+	switch (command) {
+	case FCS_DEV_CRYPTO_OPEN_SESSION:
+		dev_dbg(priv->client.dev, "Sending command: COMMAND_FCS_CRYPTO_OPEN_SESSION\n");
+		msg->command = COMMAND_FCS_CRYPTO_OPEN_SESSION;
+		break;
+
+	case FCS_DEV_CRYPTO_CLOSE_SESSION:
+		dev_dbg(priv->client.dev, "Sending command: COMMAND_FCS_CRYPTO_CLOSE_SESSION with session_id: 0x%x\n",
+			priv->session_id);
+		msg->arg[0] = priv->session_id;
+		msg->command = COMMAND_FCS_CRYPTO_CLOSE_SESSION;
+		break;
+
+	case FCS_DEV_ATF_VERSION:
+		dev_dbg(priv->client.dev, "Sending command: COMMAND_SMC_ATF_BUILD_VER\n");
+		msg->command = COMMAND_SMC_ATF_BUILD_VER;
+		break;
+
+	case FCS_DEV_SDOS_DATA_EXT:
+		if (!params) {
+			ret = -EINVAL;
+			break;
+		}
+		dev_dbg(priv->client.dev, "Sending command: COMMAND_FCS_SDOS_DATA_EXT with session_id: 0x%x, context_id: 0x%x, op_mode: 0x%x, own: 0x%llx\n",
+			priv->session_id, priv->context_id,
+			params->op_mode, params->own);
+		msg->arg[0] = priv->session_id;
+		msg->arg[1] = priv->context_id;
+		msg->arg[2] = params->op_mode;
+		msg->arg[3] = params->own;
+		msg->payload = (void *)params->src;
+		msg->payload_length = params->src_len;
+		msg->payload_output = params->dst;
+		msg->payload_length_output = params->dst_len;
+		msg->command = COMMAND_FCS_SDOS_DATA_EXT;
+		break;
+
+	default:
+		dev_err(priv->client.dev, "Unknown command: 0x%x\n", command);
+		ret = -EINVAL;
+		break;
+	}
+
+	if (!ret) {
+		if (command == FCS_DEV_ATF_VERSION)
+			/* ATF fast call for simple command */
+			ret = fcs_svc_send_sync(priv, msg, timeout);
+		else
+			ret = fcs_svc_send_async(priv, msg, timeout);
+	}
+
+	kfree(msg);
+
+	return ret;
+}
+
+/**
+ * fcs_open_session_locked() - open a crypto session on the SDM
+ *
+ * Enforce the single-session rule and, on success, record the SDM session
+ * handle in @priv->session_id. The caller must hold @priv->lock.
+ * @priv->status carries the mailbox status.
+ *
+ * Return: 0 on success, -EBUSY if a session is already open, or negative
+ *         errno on transport/mailbox failure.
+ */
+static int fcs_open_session_locked(struct socfpga_fcs_priv *priv)
+{
+	int ret;
+
+	lockdep_assert_held(&priv->lock);
+
+	if (priv->session_id)
+		/* SDM allows one crypto session at a time */
+		return -EBUSY;
+
+	ret = fcs_svc_send_request(priv, FCS_DEV_CRYPTO_OPEN_SESSION,
+				   SVC_FCS_REQUEST_TIMEOUT_MS, NULL);
+	if (ret)
+		return ret;
+
+	if (priv->status)
+		return -EIO;
+
+	priv->session_id = priv->resp;
+
+	return 0;
+}
+
+/**
+ * fcs_close_session_locked() - close the crypto session on the SDM
+ *
+ * Caller must hold @priv->lock. The local session id is cleared even if
+ * close fails, so a stuck session cannot block future opens.
+ *
+ * Return: 0 on success or when no session is open, negative errno otherwise.
+ */
+static int fcs_close_session_locked(struct socfpga_fcs_priv *priv)
+{
+	int ret;
+
+	lockdep_assert_held(&priv->lock);
+
+	if (!priv->session_id)
+		/* nothing to close */
+		return 0;
+
+	ret = fcs_svc_send_request(priv, FCS_DEV_CRYPTO_CLOSE_SESSION,
+				   SVC_FCS_REQUEST_TIMEOUT_MS, NULL);
+
+	priv->session_id = 0;
+
+	if (!ret && priv->status)
+		ret = -EIO;
+
+	return ret;
+}
+
+/**
+ * fcs_ctx_begin() - open a crypto session and start a context on it
+ *
+ * The SDM runs one crypto context at a time and will not start another until
+ * the current one finishes, so the caller must hold @priv->lock for the whole
+ * operation. Every command issued in between then picks up
+ * @priv->context_id.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_ctx_begin(struct socfpga_fcs_priv *priv)
+{
+	int ret;
+
+	lockdep_assert_held(&priv->lock);
+
+	ret = fcs_open_session_locked(priv);
+	if (ret)
+		return ret;
+
+	/*
+	 * SDM requires a non-zero context ID per request. A random value
+	 * also avoids mistaking a late response from a retired context.
+	 */
+	priv->context_id = get_random_u32_above(0);
+
+	return 0;
+}
+
+/**
+ * fcs_ctx_end() - finish the current context and close the session
+ *
+ * Closing the session is what reclaims the SDM context, so this runs on every
+ * exit path of an operation whether it succeeded or not.
+ *
+ * Return: 0 on success, negative errno otherwise.
+ */
+static int fcs_ctx_end(struct socfpga_fcs_priv *priv)
+{
+	lockdep_assert_held(&priv->lock);
+
+	priv->context_id = 0;
+
+	return fcs_close_session_locked(priv);
+}
+
+/**
+ * fcs_get_atf_version() - return the cached Arm Trusted Firmware version
+ * @version: array of three u32 entries to receive the major, minor and patch
+ *           version numbers
+ *
+ * Return: 0 on success, -ENODEV if the driver is not initialised, -ENODATA if
+ *         the probe-time query produced no version.
+ */
+int fcs_get_atf_version(struct socfpga_fcs_priv *priv, u32 *version)
+{
+	if (!priv->atf_version_valid)
+		return -ENODATA;
+
+	memcpy(version, priv->atf_version, sizeof(priv->atf_version));
+
+	return 0;
+}
+
+/**
+ * fcs_sdos_output_size() - validate an SDOS input length and size its output
+ * @op_mode: non-zero to encrypt, zero to decrypt
+ * @src_len: length of the input, including the SDOS header
+ * @out_len: receives the output capacity the SDM may need
+ *
+ * Return: 0 on success, -EINVAL if @src_len is out of range for @op_mode.
+ */
+int fcs_sdos_output_size(u32 op_mode, u32 src_len, u32 *out_len)
+{
+	if (op_mode) {
+		/* encrypt: input is header + plaintext */
+		if (src_len < SDOS_DECRYPTED_MIN_SZ ||
+		    src_len > SDOS_DECRYPTED_MAX_SZ)
+			return -EINVAL;
+
+		*out_len = SDOS_ENCRYPTED_MAX_SZ;
+	} else {
+		/* decrypt: input is header + plaintext + HMAC */
+		if (src_len < SDOS_ENCRYPTED_MIN_SZ ||
+		    src_len > SDOS_ENCRYPTED_MAX_SZ)
+			return -EINVAL;
+
+		*out_len = SDOS_DECRYPTED_MAX_SZ;
+	}
+
+	return 0;
+}
+
+/**
+ * fcs_sdos_crypt() - perform an SDOS encrypt or decrypt operation
+ * @req: request describing the operation, using plain kernel buffers
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int fcs_sdos_crypt(struct socfpga_fcs_priv *priv, struct fcs_sdos_req *req)
+{
+	struct fcs_cmd_params params = { };
+	void *s_buf, *d_buf;
+	u32 output_size;
+	int ret;
+
+	if (!req->src || !req->dst)
+		return -EINVAL;
+
+	ret = fcs_sdos_output_size(req->op_mode, req->src_len, &output_size);
+	if (ret) {
+		dev_err(priv->client.dev, "Invalid SDOS src_size %u\n", req->src_len);
+		return ret;
+	}
+
+	/* The caller must have sized the output buffer for the worst case. */
+	if (req->dst_len < output_size)
+		return -EINVAL;
+
+	/*
+	 * Only one SDM transaction may be in flight. Wait interruptibly so
+	 * a blocked caller remains killable.
+	 */
+	if (mutex_lock_interruptible(&priv->lock))
+		return -ERESTARTSYS;
+
+	/*
+	 * The device may have been removed while this caller held only a file
+	 * reference.
+	 */
+	if (priv->removed) {
+		ret = -ENODEV;
+		goto unlock;
+	}
+
+	/*
+	 * The mailbox buffers belong to the service-layer pool, which the
+	 * parent reclaims once the channel is gone. Allocate and release them
+	 * under the lock that fcs_mark_removed() also takes, so they can
+	 * never outlive priv->chan.
+	 */
+	s_buf = stratix10_svc_allocate_memory(priv->chan, req->src_len);
+	if (IS_ERR(s_buf)) {
+		ret = PTR_ERR(s_buf);
+		goto unlock;
+	}
+
+	d_buf = stratix10_svc_allocate_memory(priv->chan, output_size);
+	if (IS_ERR(d_buf)) {
+		ret = PTR_ERR(d_buf);
+		goto free_sbuf;
+	}
+
+	memcpy(s_buf, req->src, req->src_len);
+
+	params.op_mode = req->op_mode;
+	params.src = s_buf;
+	params.src_len = req->src_len;
+	params.dst = d_buf;
+	params.dst_len = output_size;
+	/* Owner ID is stored little-endian in the SDOS header (offset 12) */
+	params.own = get_unaligned_le64((const u8 *)req->src + OWNER_ID_OFFSET);
+
+	/*
+	 * SDOS is a single-command request: start a context, run the command
+	 * and finish the context before returning.
+	 */
+	ret = fcs_ctx_begin(priv);
+	if (ret) {
+		dev_err(priv->client.dev, "SDOS: failed to start crypto context ret: %d\n", ret);
+		goto free_dbuf;
+	}
+
+	ret = fcs_svc_send_request(priv, FCS_DEV_SDOS_DATA_EXT,
+				   SVC_FCS_REQUEST_TIMEOUT_MS, &params);
+	if (ret) {
+		dev_err(priv->client.dev,
+			"Failed to send the cmd=%d,ret=%d\n", FCS_DEV_SDOS_DATA_EXT, ret);
+		goto end_ctx;
+	}
+
+	req->status = priv->status;
+	req->status_valid = true;
+
+	if (priv->status &&
+	    priv->status != SDOS_DECRYPTION_REPROVISION_KEY_WARN &&
+	    priv->status != SDOS_DECRYPTION_NOT_LATEST_KEY_WARN) {
+		ret = -EIO;
+		dev_err(priv->client.dev,
+			"Failed to perform SDOS operation ret: %d Mailbox Status = 0x%x\n",
+			ret, priv->status);
+		goto end_ctx;
+	}
+
+	if (priv->resp > output_size) {
+		dev_err(priv->client.dev, "SDOS output %u exceeds kernel buffer %u\n",
+			priv->resp, output_size);
+		ret = -EIO;
+		goto end_ctx;
+	}
+
+	memcpy(req->dst, d_buf, priv->resp);
+	req->dst_len = priv->resp;
+
+end_ctx:
+	/* Best-effort; the local session and context state is dropped regardless. */
+	fcs_ctx_end(priv);
+free_dbuf:
+	stratix10_svc_free_memory(priv->chan, d_buf);
+free_sbuf:
+	stratix10_svc_free_memory(priv->chan, s_buf);
+unlock:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+/**
+ * fcs_read_version_from_atf() - query the Arm Trusted Firmware build version
+ * Send the ATF version command to the SDM and cache the result in @priv.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_read_version_from_atf(struct socfpga_fcs_priv *priv)
+{
+	int ret;
+
+	ret = fcs_svc_send_request(priv, FCS_DEV_ATF_VERSION,
+				   SVC_FCS_REQUEST_TIMEOUT_MS, NULL);
+	if (ret) {
+		dev_err(priv->client.dev,
+			"Failed to send the cmd=%d,ret=%d\n",
+			FCS_DEV_ATF_VERSION, ret);
+		goto svc_done;
+	}
+
+	if (priv->status) {
+		ret = -EIO;
+		dev_err(priv->client.dev,
+			"Mailbox error, Failed to read ATF version ret: %d\n", ret);
+	}
+
+svc_done:
+	stratix10_svc_done(priv->chan);
+
+	return ret;
+}
+
+/**
+ * fcs_release() - final teardown, run when the last reference is dropped
+ * @kref: reference counter embedded in the FCS state
+
+ */
+static void fcs_release(struct kref *kref)
+{
+	struct socfpga_fcs_priv *priv =
+		container_of(kref, struct socfpga_fcs_priv, refcount);
+
+	if (priv->chan) {
+		if (priv->session_id) {
+			int ret;
+
+			mutex_lock(&priv->lock);
+			ret = fcs_close_session_locked(priv);
+			mutex_unlock(&priv->lock);
+
+			if (ret)
+				dev_err(priv->client.dev,
+					"Failed to close FCS service session,ret=%d\n", ret);
+		}
+
+		stratix10_svc_remove_async_client(priv->chan);
+		stratix10_svc_free_channel(priv->chan);
+	}
+
+	mutex_destroy(&priv->lock);
+	kfree(priv);
+}
+
+/**
+ * fcs_get() - take a reference on the FCS state
+ * @priv: state returned by fcs_init()
+
+ */
+void fcs_get(struct socfpga_fcs_priv *priv)
+{
+	kref_get(&priv->refcount);
+}
+
+/**
+ * fcs_put() - drop a reference on the FCS state
+ * @priv: state returned by fcs_init()
+ */
+void fcs_put(struct socfpga_fcs_priv *priv)
+{
+	kref_put(&priv->refcount, fcs_release);
+}
+
+/**
+ * fcs_mark_removed() - refuse further operations after the device is gone
+ * @priv: state returned by fcs_init()
+ */
+void fcs_mark_removed(struct socfpga_fcs_priv *priv)
+{
+	mutex_lock(&priv->lock);
+	priv->removed = true;
+
+	if (priv->session_id)
+		fcs_close_session_locked(priv);
+
+	if (priv->chan)	{
+		stratix10_svc_remove_async_client(priv->chan);
+		stratix10_svc_free_channel(priv->chan);
+		priv->chan = NULL;
+	}
+
+	mutex_unlock(&priv->lock);
+}
+
+/**
+ * fcs_init() - allocate and initialise the FCS private state
+ * @dev: pointer to fcs device
+
+ *
+ * Return: the new state, or an ERR_PTR on failure (which may be
+ *         -EPROBE_DEFER from the service layer).
+ */
+struct socfpga_fcs_priv *fcs_init(struct device *dev)
+{
+	struct socfpga_fcs_priv *priv;
+	int ret;
+
+	priv = kzalloc_obj(*priv);
+	if (!priv)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&priv->refcount);
+	mutex_init(&priv->lock);
+
+	/* kzalloc() already cleared client.receive_cb. */
+	priv->client.dev = dev;
+	priv->client.priv = priv;
+
+	priv->chan = stratix10_svc_request_channel_byname(&priv->client,
+							  SVC_CLIENT_FCS);
+	if (IS_ERR(priv->chan)) {
+		dev_err(dev, "couldn't get service channel %s\n", SVC_CLIENT_FCS);
+		ret = PTR_ERR(priv->chan);
+		goto err_free;
+	}
+
+	ret = stratix10_svc_add_async_client(priv->chan, true);
+	if (ret) {
+		dev_err(dev, "Failed to add async client\n");
+		stratix10_svc_free_channel(priv->chan);
+		goto err_free;
+	}
+
+	init_completion(&priv->completion);
+
+	/*
+	 * Version query failure is non-fatal; sysfs reports -ENODATA.
+	 */
+	fcs_read_version_from_atf(priv);
+
+	return priv;
+
+err_free:
+	mutex_destroy(&priv->lock);
+	kfree(priv);
+
+	return ERR_PTR(ret);
+}
diff --git a/drivers/firmware/socfpga-fcs.c b/drivers/firmware/socfpga-fcs.c
new file mode 100644
index 000000000000..976932e70bec
--- /dev/null
+++ b/drivers/firmware/socfpga-fcs.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+
+#include <linux/err.h>
+#include <linux/firmware/intel/socfpga-fcs.h>
+#include <linux/fs.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/uaccess.h>
+#include <linux/util_macros.h>
+#include <uapi/misc/socfpga-fcs-crypto.h>
+
+/**
+ * atf_version_show() - report the Arm Trusted Firmware build version
+ * @dev: pointer to fcs device
+ * @attr: device attribute
+ * @buf: pointer to character buffer to receive the version string
+ *
+ * Return: number of bytes written to @buf.
+ */
+static ssize_t atf_version_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct socfpga_fcs_priv *priv = dev_get_drvdata(dev);
+	u32 version[3];
+	int ret;
+
+	ret = fcs_get_atf_version(priv, version);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u.%u.%u\n", version[0], version[1], version[2]);
+}
+
+/**
+ * fcs_sdos() - perform an SDOS encrypt/decrypt operation
+ * @priv: FCS state of the device this request arrived on
+ * @uarg: user pointer to a struct fcs_ioc_sdos
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static long fcs_sdos(struct socfpga_fcs_priv *priv, void __user *uarg)
+{
+	u32 __user *dst_size_uptr;
+	s32 __user *status_uptr;
+	struct fcs_sdos_req req = { };
+	struct fcs_ioc_sdos u;
+	void *s_buf, *d_buf;
+	u32 output_size;
+	u32 dst_cap;
+	long ret;
+
+	if (copy_from_user(&u, uarg, sizeof(u)))
+		return -EFAULT;
+
+	if (!u.dst || !u.dst_size)
+		return -EINVAL;
+
+	dst_size_uptr = u64_to_user_ptr(u.dst_size);
+	status_uptr = u64_to_user_ptr(u.error_code);
+
+	/* Caller-provided output buffer capacity (in/out parameter) */
+	if (get_user(dst_cap, dst_size_uptr))
+		return -EFAULT;
+
+	ret = fcs_sdos_output_size(u.op_mode, u.src_size, &output_size);
+	if (ret)
+		return ret;
+
+	s_buf = kvmalloc(u.src_size, GFP_KERNEL);
+	if (!s_buf)
+		return -ENOMEM;
+
+	d_buf = kvmalloc(output_size, GFP_KERNEL);
+	if (!d_buf) {
+		ret = -ENOMEM;
+		goto free_sbuf;
+	}
+
+	/*
+	 * Stage the payload in ordinary kernel memory. The engine holds
+	 * priv->lock across the service-layer pool buffers, and a faulting
+	 * user page must not be able to block device removal on that lock.
+	 */
+	if (copy_from_user(s_buf, u64_to_user_ptr(u.src), u.src_size)) {
+		ret = -EFAULT;
+		goto free_dbuf;
+	}
+
+	req.op_mode	= u.op_mode;
+	req.src		= s_buf;
+	req.src_len	= u.src_size;
+	req.dst		= d_buf;
+	req.dst_len	= output_size;
+
+	ret = fcs_sdos_crypt(priv, &req);
+	if (ret)
+		goto relay_status;
+
+	if (req.dst_len > dst_cap) {
+		pr_debug("SDOS output %u exceeds caller buffer %u\n",
+			 req.dst_len, dst_cap);
+		ret = -EMSGSIZE;
+		goto relay_status;
+	}
+
+	if (copy_to_user(u64_to_user_ptr(u.dst), d_buf, req.dst_len)) {
+		ret = -EFAULT;
+		goto relay_status;
+	}
+
+	if (put_user(req.dst_len, dst_size_uptr))
+		ret = -EFAULT;
+
+relay_status:
+	if (req.status_valid && put_user(req.status, status_uptr)) {
+		/* surface the copy failure only if nothing failed earlier */
+		if (!ret)
+			ret = -EFAULT;
+	}
+free_dbuf:
+	kvfree(d_buf);
+free_sbuf:
+	kvfree(s_buf);
+
+	return ret;
+}
+
+/**
+ * fcs_open() - take a reference on the device state for this file
+ * @inode: inode of the FCS misc device
+ * @file: open file being created
+ *
+ * Return: 0 always.
+ */
+static int fcs_open(struct inode *inode, struct file *file)
+{
+	struct miscdevice *miscdev = file->private_data;
+	struct socfpga_fcs_priv *priv =
+		container_of(miscdev, struct socfpga_fcs_priv, miscdev);
+
+	fcs_get(priv);
+	file->private_data = priv;
+
+	return 0;
+}
+
+/**
+ * fcs_release() - drop this file's reference on the device state to
+ * guarantees the crypto session is torn down when its owning fd is closed,
+ * including on process crash/exit
+ * @inode: inode of the FCS misc device
+ * @file: open file being released
+ *
+ * Return: 0 always.
+ */
+static int fcs_release(struct inode *inode, struct file *file)
+{
+	fcs_put(file->private_data);
+
+	return 0;
+}
+
+/**
+ * fcs_ioctl() - dispatch an FCS ioctl command
+ * @file: open file for the FCS misc device
+ * @cmd: ioctl command code
+ * @arg: user pointer to the command-specific argument structure
+ *
+ * Return: 0 on success, -ENOTTY for an unknown command, or a negative errno
+ *         from the handler.
+ */
+static long fcs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct socfpga_fcs_priv *priv = file->private_data;
+	void __user *uarg = (void __user *)arg;
+
+	switch (cmd) {
+	case FCS_IOC_SDOS:
+		return fcs_sdos(priv, uarg);
+	default:
+		return -ENOTTY;
+	}
+}
+
+static const struct file_operations fcs_fops = {
+	.owner		= THIS_MODULE,
+	.open		= fcs_open,
+	.release	= fcs_release,
+	.unlocked_ioctl	= fcs_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
+};
+
+static DEVICE_ATTR_RO(atf_version);
+
+static struct attribute *fcs_attrs[] = {
+	&dev_attr_atf_version.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(fcs);
+
+/**
+ * fcs_driver_probe() - probe the FCS platform device
+ * @pdev: pointer to the FCS platform device
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_driver_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct socfpga_fcs_priv *priv;
+	int ret;
+
+	priv = fcs_init(dev);
+	if (IS_ERR(priv))
+		return dev_err_probe(dev, PTR_ERR(priv),
+				     "Failed to initialize FCS\n");
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->miscdev.minor = MISC_DYNAMIC_MINOR;
+	priv->miscdev.name = "socfpga-fcs";
+	priv->miscdev.fops = &fcs_fops;
+	priv->miscdev.parent = dev;
+
+	ret = misc_register(&priv->miscdev);
+	if (ret) {
+		fcs_put(priv);
+		return dev_err_probe(dev, ret, "Failed to register misc device\n");
+	}
+
+	return 0;
+}
+
+/**
+ * fcs_driver_remove() - remove the FCS platform device
+ * @pdev: pointer to the FCS platform device
+ */
+static void fcs_driver_remove(struct platform_device *pdev)
+{
+	struct socfpga_fcs_priv *priv = platform_get_drvdata(pdev);
+
+	/*
+	 * misc_deregister() does not wait for open files. Tear the svc
+	 * channel down here (parent may free it as soon as remove returns);
+	 */
+	misc_deregister(&priv->miscdev);
+	fcs_mark_removed(priv);
+	fcs_put(priv);
+}
+
+static struct platform_driver fcs_driver = {
+	.probe = fcs_driver_probe,
+	.remove = fcs_driver_remove,
+	.driver = {
+		.name = "stratix10-fcs",
+		.dev_groups = fcs_groups,
+	},
+};
+
+/**
+ * socfpga_fcs_init() - register the FCS platform driver
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int __init socfpga_fcs_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&fcs_driver);
+	if (ret)
+		pr_err("Failed to register platform driver: %d\n", ret);
+
+	return ret;
+}
+
+/**
+ * socfpga_fcs_exit() - unregister the FCS platform driver
+ */
+static void __exit socfpga_fcs_exit(void)
+{
+	platform_driver_unregister(&fcs_driver);
+}
+
+module_init(socfpga_fcs_init);
+module_exit(socfpga_fcs_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Altera SoCFPGA FCS SDOS encrypt/decrypt driver");
+MODULE_AUTHOR("Altera Corporation");
+MODULE_ALIAS("platform:stratix10-fcs");
diff --git a/include/linux/firmware/intel/socfpga-fcs.h b/include/linux/firmware/intel/socfpga-fcs.h
new file mode 100644
index 000000000000..807e5af63f97
--- /dev/null
+++ b/include/linux/firmware/intel/socfpga-fcs.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Altera Corporation
+ *
+ * SDOS-only subset of the SoCFPGA FCS (FPGA Crypto Service) interface,
+ * shared between the driver front-end (socfpga-fcs.c) and the command
+ * engine (socfpga-fcs-core.c).
+ *
+ * The command engine deals in kernel pointers only: front-ends own every
+ * transfer to and from user space. In-kernel consumers can therefore drive
+ * the same engine directly.
+ */
+#ifndef __SOCFPGA_FCS_H
+#define __SOCFPGA_FCS_H
+
+#include <linux/completion.h>
+#include <linux/miscdevice.h>
+#include <linux/firmware/intel/stratix10-svc-client.h>
+
+#define SDOS_HEADER_SZ		40
+#define SDOS_HMAC_SZ		48
+#define SDOS_PLAINDATA_MIN_SZ	32
+#define SDOS_PLAINDATA_MAX_SZ	32672
+#define SDOS_DECRYPTED_MIN_SZ	(SDOS_PLAINDATA_MIN_SZ + SDOS_HEADER_SZ)
+#define SDOS_DECRYPTED_MAX_SZ	(SDOS_PLAINDATA_MAX_SZ + SDOS_HEADER_SZ)
+#define SDOS_ENCRYPTED_MIN_SZ	(SDOS_PLAINDATA_MIN_SZ + SDOS_HEADER_SZ + SDOS_HMAC_SZ)
+#define SDOS_ENCRYPTED_MAX_SZ	(SDOS_PLAINDATA_MAX_SZ + SDOS_HEADER_SZ + SDOS_HMAC_SZ)
+
+/**
+ * struct fcs_sdos_req - parameters for one SDOS encrypt/decrypt operation
+ * @op_mode: non-zero to encrypt, zero to decrypt
+ * @src: input buffer, any kernel address
+ * @src_len: number of valid bytes in @src
+ * @dst: output buffer, any kernel address
+ * @dst_len: on entry the capacity of @dst, on return the number of bytes the
+ *           SDM produced
+ * @status: SDM mailbox status, valid only when @status_valid is set
+ * @status_valid: set by the engine once the mailbox transaction completed,
+ *                whether it succeeded or reported a firmware error. Clear
+ *                after a transport failure, where no firmware status exists.
+ *
+ * Every pointer is a kernel address, so the engine never touches user memory.
+ */
+struct fcs_sdos_req {
+	u32		op_mode;
+	const void	*src;
+	u32		src_len;
+	void		*dst;
+	u32		dst_len;
+	s32		status;
+	bool		status_valid;
+};
+
+/**
+ * Private driver state for the SoCFPGA FCS that holds the SDM/ATF service
+ * channel, the lock serialising command submission, and the latest mailbox
+ * status/response.
+ */
+struct socfpga_fcs_priv {
+	/* Communication channel */
+	struct stratix10_svc_chan *chan;
+	struct stratix10_svc_client client;
+	struct miscdevice miscdev;
+	/*
+	 * Held by the driver and by every open file. An fd may outlive driver
+	 * detach, so this state is not devm-managed: the firmware channel and
+	 * the allocation are released only when the last reference goes.
+	 */
+	struct kref refcount;
+	/* Set on remove(); further operations fail with -ENODEV. */
+	bool removed;
+	struct completion completion;
+	/*
+	 * Serializes FCS command submission: guards the session state and the
+	 * single in-flight mailbox transaction (completion/status/resp) so only
+	 * one SDM request is outstanding at a time. It also covers the whole
+	 * lifetime of the service-layer pool buffers, so they cannot outlive
+	 * @chan; user-space copying happens outside it.
+	 */
+	struct mutex lock;
+	int status;
+	u32 resp;
+	u32 session_id;
+	/* non-zero while a crypto context is active */
+	u32 context_id;
+	u32 atf_version[3];
+	bool atf_version_valid;
+};
+
+enum fcs_command_code {
+	FCS_DEV_CRYPTO_OPEN_SESSION,
+	FCS_DEV_CRYPTO_CLOSE_SESSION,
+	FCS_DEV_SDOS_DATA_EXT,
+	FCS_DEV_ATF_VERSION,
+};
+
+int fcs_sdos_output_size(u32 op_mode, u32 src_len, u32 *out_len);
+
+/*
+ * Allocate the per-device FCS state and set up the service channel; reads the
+ * ATF version. The state is reference counted; release the driver's reference
+ * with fcs_put(). Returns an ERR_PTR on failure.
+ */
+struct socfpga_fcs_priv *fcs_init(struct device *dev);
+
+/* Take/drop a reference; the last put closes the session and frees the state. */
+void fcs_get(struct socfpga_fcs_priv *priv);
+void fcs_put(struct socfpga_fcs_priv *priv);
+
+/* Refuse further operations with -ENODEV; call from the remove path. */
+void fcs_mark_removed(struct socfpga_fcs_priv *priv);
+
+int fcs_get_atf_version(struct socfpga_fcs_priv *priv, u32 *version);
+
+/* Perform an SDOS (Secure Data Object Service) encrypt/decrypt operation. */
+int fcs_sdos_crypt(struct socfpga_fcs_priv *priv, struct fcs_sdos_req *req);
+
+#endif /* SOCFPGA_FCS_H */
diff --git a/include/uapi/misc/socfpga-fcs-crypto.h b/include/uapi/misc/socfpga-fcs-crypto.h
new file mode 100644
index 000000000000..fdb04e3aa7f1
--- /dev/null
+++ b/include/uapi/misc/socfpga-fcs-crypto.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Description:
+ * This driver is developed for the SDM SoCFPGA Crypto Service (FCS). It
+ * provides an ioctl interface for the SDOS (Secure Data Object Service)
+ * encrypt/decrypt operation. The crypto session and the per-request context
+ * ID are managed by the kernel internally, so neither is part of the user
+ * ABI.
+ */
+#ifndef __SOCFPGA_FCS_CRYPTO_H
+#define __SOCFPGA_FCS_CRYPTO_H
+
+/**
+ * struct fcs_ioc_sdos - argument for FCS_IOC_SDOS
+ * @error_code: address of a ``__s32`` that receives the SDM status. Written
+ *		whenever the request reached the SDM, including when the SDM
+ *		reported a failure, and left unchanged otherwise. Initialise
+ *		it to 0 before the call.
+ * @src: address of the input buffer
+ * @dst: address of the output buffer. Must be non-NULL.
+ * @dst_size: address of a ``__u32``. On entry it holds the capacity of @dst
+ *	      in bytes; on success the kernel overwrites it with the number of
+ *	      bytes the SDM produced. Must be non-NULL.
+ * @op_mode: non-zero to encrypt, zero to decrypt
+ * @src_size: number of bytes at @src. For encrypt the input is a 40-byte
+ *	      header followed by 32..32672 bytes of plaintext; for decrypt it
+ *	      additionally carries a trailing 48-byte HMAC.
+ *
+ * The four ``__u64`` members carry user-space addresses as fixed-width
+ * values, so the structure has the same layout for 32-bit and 64-bit callers.
+ *
+ * For an encrypt request the owner ID is read from the caller-supplied header
+ * as a little-endian 64-bit value at offset 12 and is passed to the SDM with
+ * the request.
+ */
+struct fcs_ioc_sdos {
+	__u64 error_code;	/* __user ptr to __s32 (out)              */
+	__u64 src;		/* __user ptr to input buffer (in)        */
+	__u64 dst;		/* __user ptr to output buffer (out)      */
+	__u64 dst_size;		/* __user ptr to __u32 capacity/len (in/out) */
+	__u32 op_mode;		/* (in)  */
+	__u32 src_size;		/* (in)  */
+};
+
+#define FCS_IOC_MAGIC		0xA6
+
+/**
+ * DOC: FCS_IOC_SDOS
+ *
+ * Encrypt or decrypt one SDOS object. Takes a pointer to a
+ * &struct fcs_ioc_sdos.
+ *
+ * The SDM derives the working key from a device-unique SDOS root key that
+ * never leaves the secure boundary, so the host never handles raw key
+ * material. Only one SDM transaction is in flight at a time.
+ *
+ * Return: 0 on success, -1 on failure with ``errno`` set. The SDM status for
+ * the request is written to the ``__s32`` addressed by ``error_code``; some
+ * non-zero statuses indicate success with a warning. See
+ * Documentation/misc-devices/socfpga-fcs.rst for the error codes and the SDM
+ * status values.
+ */
+#define FCS_IOC_SDOS		_IOWR(FCS_IOC_MAGIC, 1, struct fcs_ioc_sdos)
+
+#endif /* __SOCFPGA_FCS_CRYPTO_H */
-- 
2.43.7

