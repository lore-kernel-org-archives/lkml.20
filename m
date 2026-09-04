Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022133.outbound.protection.outlook.com [52.101.101.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0090D22157B;
	Fri,  4 Sep 2026 00:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788481852; cv=fail; b=ekGYRSeKftf+oh6eChjvttqf7OmdCk3BF7Qtp/NtWYjQrMtl8GpUqveiHCZ+COPx9TltjQeQw4O3eMF02DNjOvT3j1OnmlGxJw2uxOYnDAa3Le1/38P0aWPuV/qs+K1iQMKun+lYB9o09HXr36/8sJLe4rnGFhtX/yzWplbH4Io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788481852; c=relaxed/simple;
	bh=drxy0jFDYbIIZEPATZZX42nYYmbntzVn/qVJRePr0Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b0v2caVqt1rHJb4KxEgfKJ3S4WlbZFbNmrUHgs/0KiQdB33G41gojg9b8RysaKzBUodm4y+g/iECgEC+/nyn/YvKdnVOETwbUFWhRQVZ8ThMCbewaNm8qhUZsobMqvXbCJ50ADTy2Wqnv0lmThZ8Y3ZqrgVH40eX2Y6pR220C5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBB9vC567khySoPj7TJVRkBy6Rmd/829QNVIYYJCGmXAsczzMJt7dix5epUYmJ6vgZnkVXH5Y0npn9Q2WJFx5543hUu1qLaunPr17t/CJi1h/A+xyWAxLa4EuTQf8LQdDqkrCa6nhvNESaz/QSXkFYG+PtfFcHg80l4yatg9lz00/C7yGpwIGaGdICGNPbkyLlLKPWIxcXBAguaoDbqj9XgTYo2I+py6M7VYu8rddcFfI4sUprAtj3d/eFtfq37WCV3l++erp5fDf9EDSKaDAJvglciTM3k1Emrgq1bYW3mOun8C0Yg7VJI0Nyc9fn1ORu5xgdfA7N9kaVCY+udbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=l038Rv8TWl1h+7nfwAfPrGmtjBSYMCEznB6GVMktpUw=;
 b=Ncf+56Y9GEThD9lIkQjs3miyXBOjeeF2NfWzPaow+DdIDg0Sokw68HBbyuLhJXFapTqtXyoXHT3JkyKyvTd2XUYqNp668u8lmCFz4KUKhs+OEfEWfiRy5AUReRsHX2qkwDE8h/h6r/xyDv8T0wUTB4ayc5KOyaEnj8edJcpz//9KLZSswRUfwTKruNaswsTybQUWCS1LOc2Np31DOwedlqKVsQz5b9BpBdykC75wPeVjgUGLmVIfMPq4/slATEjyVAQcUf17ldBU/d6EKtUzO86VQgdDAJXfjwSnycC8zYLlhOVJzc+JYIBJt48UaEMH3rYJt8TgCPs1nDHWpArg9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CWLP123MB3874.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 4 Sep
 2026 00:30:45 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 00:30:44 +0000
Date: Thu, 3 Sep 2026 20:30:40 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Borislav Petkov <bp@alien8.de>
Cc: tony.luck@intel.com, tglx@kernel.org, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, frederic@kernel.org, 
	marco.crivellari@suse.com, neelx@suse.com, sean@ashe.io, chjohnst@gmail.com, 
	mproche@gmail.com, nick.lange@gmail.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] x86/mce: Fix timer list corruption and avoid
 redundant polling
Message-ID: <3we2xmx4fwgrgj7ixnkeskbht5yxsgzgffy6yn45xxvdnl4nkz@6yktlrqvgwcq>
References: <20260903194130.186096-1-atomlin@atomlin.com>
 <20260903221745.GAapnyCYVOL0qeip6N@fat_crate.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903221745.GAapnyCYVOL0qeip6N@fat_crate.local>
X-ClientProxiedBy: BN0PR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:408:142::9) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CWLP123MB3874:EE_
X-MS-Office365-Filtering-Correlation-Id: cdbd3dc9-7c61-418e-fdea-08df0a1bc1b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ekeQ59ctc51D8+SOBdz7+xILJ8u6oMkZA3ym9RdqAE7zr7+yL81bxbe+kW1Z7HNIiQbHJwXxwFcTopG/DdaBr952BWVgA8/LlCOkfRlwcnT1B/IO4P8jiremtsGBgTXN/GqFM8QFh2Hv65djMI6rm2EkNA9YV1zZpKIrtTc2WG+K5nc/kpg8XciYcju20c/pOIB3mbDf2AscvO03BfGv4kmQ4tqF4G53mDJNw5X0aAXhwRuxMRDBvw7Kpmo32IxJT9hRLkp18eJEGeSkI/oCe+3tGnaaBVNym5Sn2MVYyxvYEuFbMhSJhi0yu78RECxi9F0efSa1BZXWOm13FiY6vuTqesm0sMdI/xEXZQ/WCR02Z79QpgOej+7r7K9Ccd/K/Y2uHlToaxMN+M8Gay3XYoDU+GoLe6/gaDX16+91ZH09nPmVRRgCKCpWZQfMxAR0KvQKxr9Qk5my2ekRMAATJBOqESrVHeu1BE2zIi/XqtAIX7PY4nPYavVvpWE9nAOHXNgCoDFjTBLsjLBxGx7yzeIaW6cCQYbMc3hYD/lrbleq0hTT6SkMIGJn1xKU1FHgmxaqs9v5EnKcl++8rKZgWkFsetbuNpl7fXoO+u0h0fkIAXme96PKOxECCZ23P1PTRCJXC/gIoF/Siraan1Xy9lZdpC+SZb8/bNO5zOx4Kuw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUJzdndqUVlwZVdEeGNpZTVFczQvdHZjZmtwbUszZHNGcmJ5K1B5WG02T0l2?=
 =?utf-8?B?blZ5SFAzZndvczRFZHphTkZVVThqZURKbURibjJ3MURrL1B3OUF1Ry9CRnBY?=
 =?utf-8?B?RU53YlR5Q3YrR3c5UFlsYTZKVW9CMzlDRGlDZjdPVUZ2Vm1wWVFlakxubVFj?=
 =?utf-8?B?OGpBL3B2Zk9tOEhjUVovMUtSTzIwR2NZd2IvdzRENnJybzlkUlp3M2R5Rmsw?=
 =?utf-8?B?OVdDQk9mdHEvMmpWQmNHeVlvbzJmNVlzM0lWNktDb0dTc1BKaEwyRTViV214?=
 =?utf-8?B?b3VYZUJodzhCUXN1K2FIZkM0b1BTVTVZL3p4Z3pvbUZlVXNpT2xJYXlPZGJC?=
 =?utf-8?B?a0NQQW1UaG1sQ3hwOG42VnVOM2I1RXNpTWFlZldrTUlkUk9IdDhkK203VkF0?=
 =?utf-8?B?OFhOYlpocENFZnRNTzdFOUg1dzVEamZBVVN4bmZwSGxFMDdiY0k3V0E2SjZB?=
 =?utf-8?B?SzlicFhRZDVpUVRVd21kN3dIOGJ2a0prK1JndWZGRzZCM2IxTlptTk5yaTZT?=
 =?utf-8?B?eFVmYlJpYm11U25iSDJFcXNteUovRXphM0l1anJ6MVJ0SlBHYUxMY1hBcmx6?=
 =?utf-8?B?OVovL3FQQ1l2NjRuS1lSdXo5bi81eFRhZ3Zxdi9mNExIRnZzZW0rR1NkMHl1?=
 =?utf-8?B?WFdSa0pKcE9OZnU3Q2l2NGgzYjQ3bC9YMFVSNSt4bFJtODBiOU56ZmhMVzds?=
 =?utf-8?B?enJrV08zdUJSUktwK3RaN0xsVkg5YktVYjVmVHNQNG4yOWVCTXNOd1BwcG8y?=
 =?utf-8?B?Qjk5MS9Mak1EK2dXYXgvSmo4QVEwd2k5Uy9ST3h2a0FyOThzREg3S0FxcnBU?=
 =?utf-8?B?QmtpWlVza0VaVlBEc21jN2dXK1FYSkxsZmdTdEVuSXMwK3EwSzRsU1RxLy8r?=
 =?utf-8?B?Rm1Xck94TkNhSUUrUjlwem1WUDV2UlBwTmZXbjBvLzVkdHpSUW81VG1ZRHRC?=
 =?utf-8?B?L05CM1pkTUQ1Tm14bU91eWJzems4dE0zVlJiamFmL2duMWI4QU9yWEM4YUZk?=
 =?utf-8?B?eTBsZzYvU2hmekJBR1RXT2VZZEVwRGdmcmdiL0hRRGZ5dFZoZFd2Y1Y0TFBn?=
 =?utf-8?B?ZEFEb2ZFQlZwTzdybDNWUitWcTFBUTZQYXFJRG5YcnVtVnlnQ29JRE0rNGMx?=
 =?utf-8?B?aEhIZHRWcG1ZU1oxcUdRbFpvNE1aRS9WQWM0SWZKMlFWNFc2VWJnUTQ4QVYx?=
 =?utf-8?B?aEFidUxBMldjeGdFallhMDlVbFZ5M29EWE56WkZtK1J2VXc4azBjSnB6STdx?=
 =?utf-8?B?TmwvV29iYlAxc3YybjZBc084Y1dUZklBWCt5REJ1OWc1Y0I4QXo5VGJ5d0dq?=
 =?utf-8?B?eVp4WFNoTURWcW5CMXZRRkN1Yzd0TitjdGhhWFE3Z1hsWSsveG5lSVBXWUJK?=
 =?utf-8?B?cEptcjh3c2wwU3pYYmYrdGJHNmdmTkgxWXFyVlY2T1NyWXk4dmNub0JIb3B2?=
 =?utf-8?B?NlNMT3ozQjdRTjZ2dWc1QUFtamdWTW1JWU84KzVscDZMdGlCWDJ2RW5BalFP?=
 =?utf-8?B?YyswY05pTVpUbDF4K25vc0NQUEltTGthbHJLUktweWMyWitBeHYvUXRIcmhh?=
 =?utf-8?B?WCtMOFlpbUdKWFRnVDN4SkorbDZGUXBLaDBnSHZ5cGFoZHlTWlhuWDBwZEV5?=
 =?utf-8?B?bSt3cUNMdU5SSC9tcFNRSjd6MFJ5TjNuV29hQWdqWnBOcHBUMUZlay9LMGlp?=
 =?utf-8?B?aHFLNjhWTkJpOWl3TjBROFJmTXI4ZlViZWRlS0pqV3poWWhPZXBlR2kwbnhU?=
 =?utf-8?B?c3h2VzBOSDBLVjNSdlVjamkrN1V2UWpwZDlJcjIzWC82ZldpUTVsbGRlUjB3?=
 =?utf-8?B?UDBUSXZ0QWZqRXFXZUNPTXV0enFlZUxYeVV2ZnNQSHVwemliVUFMVjNUTkZS?=
 =?utf-8?B?M3Awb1hyWFhxUnh5M1N5bXEwcGZCTFp5UmRkY0VrWC9ZbXd4VXNvVE9obXJr?=
 =?utf-8?B?bFpiWFVENG91RWFZU213V1dVY1k0ZVFNYlIrUmliRGJmWEFvZVBpMTMrMGp5?=
 =?utf-8?B?aUwvU1JtSGF4WndlK2U0NWVYWE00dmhJTURPYzhXOW82ckswUVRlemxKN0ti?=
 =?utf-8?B?dG1GeEZabWpOcEZidXMvOEZWZmFCRXFBbU5GSFVOdzNxdG9HekdOZ1ZVRnox?=
 =?utf-8?B?SnJVNVppYm1wRlhTVlIrNkR0eUgxQklrdU9zOXBCT1RTbExoNjlqdXMzbno2?=
 =?utf-8?B?QmRvdWVscEFIM1ZlNzJsclZBbmF4SCtSNjR6OFk2TC9zaDBFL2hVVUh2VDRi?=
 =?utf-8?B?SFkrRkdhOEVjWnd5YkxNMURpUUZPanNrSWpBQjd0Q1JwVGtmb1E0L0NzaW1H?=
 =?utf-8?B?OWVPdmJjekxETTUrWjdzZTVtcHF1cGhxeS8wZUFETXVBQmlpNnRhdz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdbd3dc9-7c61-418e-fdea-08df0a1bc1b9
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 00:30:44.3133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9AviK4xcV186cfQBwDwnQM4JcyyQICFk0sZzHEsd0aDBnC2BY0aeL1J29B9s8XhyoV4bzGeAB2cBK+XZWFxCOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB3874

On Thu, Sep 03, 2026 at 03:17:45PM -0700, Borislav Petkov wrote:
> On Thu, Sep 03, 2026 at 03:41:27PM -0400, Aaron Tomlin wrote:
> > This series addresses two distinct issues within the x86 Machine Check
> > Architecture (MCA) timer subsystem: a race condition during runtime CPU
> > reconfiguration that can corrupt the kernel timer wheel, and redundant
> > periodic software polling of banks that never log corrected errors.
> 
> N T Sep 01              Aaron Tomlin ( :2.6K|) [RFC PATCH] x86/mce: Avoid arming periodic polling timer on isolated CPUs
> N T Sep 01              Aaron Tomlin ( :2.3K|) [PATCH v2 0/2] x86/mce: Fix timer list corruption and avoid redundant polling
> N T Sep 02              Aaron Tomlin ( :3.0K|) [PATCH v3 0/2] x86/mce: Fix timer list corruption and avoid redundant polling
> N T Sep 03              Aaron Tomlin ( :3.1K|) [PATCH v4 0/2] x86/mce: Fix timer list corruption and avoid redundant polling
> N T Sep 03              Aaron Tomlin ( :4.0K|) [PATCH v5 0/3] x86/mce: Fix timer list corruption and avoid redundant polling
> 
> 5 submissions on the same topic in 3 days.

Hi Boris,

Understood, and apologies for the noise on the list.

The rapid cadence was not borne out of impatience, but rather active,
iterative engagement with Tony Luck and Marco Crivellari to incorporate
their direct feedback, alongside addressing pre-existing issues flagged by
Sashiko. Each revision sought to turn around those specific corrections
promptly.

That being said, I appreciate the review backlog this creates and will
ensure subsequent work is given appropriate time to settle before posting
further revisions, unless instructed otherwise.


Kind regards,
-- 
Aaron Tomlin
