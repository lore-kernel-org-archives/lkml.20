Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794252051;
	b=iiQeOYuqF4kt/U9i2EZ65mxKNsAkm4V1sFly8JzBnkMk17FL9MyV5K5ocOGSsQwCJc2C
	 /iuVNIsPCHRCZZ5FN9uk/3By3H9n0+FDBgYzBhjplgFPQB6Lme00mYZtULXqKoodvDhWH
	 Gpq+tjA9+nX0Zu3WKT15yJmj50f7eGDYmgRGF9BMcyQx4APQ0v2Q2YzFWWXW1QmVHtLB+
	 qHDDy/K3HqIXlnfXQ12jvqdgGUnz5BiTlzaTyqItyz3mpg+awISMHtHPP8g1eLgr76gl8
	 hRFCyPa99Q9uP9/2Skq7SsUyxcKdlxLAf3/Q+26LVrvB2GnWFKXPX5xORfZbiVAPBFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252051;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=j3/jrQ0kdXV3qXGIJvNDeIxJSeT+vqLAJATrVCVnDPw=;
	b=kKw+hqTKVwmfN43S/NV4cg4m00/4y8CptlBeeKJ57tiS7r4rh1+Ln2XYwXLaBeIfwbv3
	 Pyv827sTeFyhps1N04ssdF8+i/Cf+2EFOMwcAnOo5uOAbV/Q9FL2Uv1/NcSBA85NUJKzx
	 I8VJCcNF0uiRX0WECI+P1WQr+hTXIxA2kc/R6vUwzSH9cTbpA3Hr1XUmRhRoyXHdL++hK
	 8DL3rQPWN+EusXB5vIC/yqni1w8K3pgJ51wdX/F5hjv+Uq3Q/XUxs8JpHpAYd8afRTqPK
	 BY6LlM3yVbilTjn9wpCEzqqRmqng0M6etFFvtHdbkyrQp5Q/yBxXos8dHqoUy+Wwy6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wwZIxXfu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.28
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538B3606A321;
	Mon,  9 Nov 2026 19:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 538B3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wwZIxXfu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBsbHhgLkd2YewhmirH5Ay23HDmL+4aDDUa8q5IDoAQzMtrgYzuxdEmhRZ250lid10AtEZmSH2WraxR1tHVELbt2VOdB3NRTSugwjU+iw76w6D5Ifih7T/drCi2eM1+ZRj5JicZ25LI1gaS9dRUgpDcfGKvNCIKgpd/L8ltSS+oE5uz7yQLCPye5LWh/YnFIAiiEzIGB3va4qWhx5/mEDsdG1rbfhrlzP3bZvy+c5FBJbjb7nMxTeJxdKFP1yIDUiNYlXLQqsBhgwrK2OsLeiti3/KWSwZm2ipEKH2Ij6WcislCGZssqgUXAZuWJ6Y5vGTCnmnCud/6bY3ZwTgr0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3/jrQ0kdXV3qXGIJvNDeIxJSeT+vqLAJATrVCVnDPw=;
 b=ToCE5Fm1LDqzCLoCzp+nUIHCw50uEs32hYuiHDR2gXIf6pNNpuv+O2rKQyJAZDQoVprum+nFhejq3mYojs833if5KaHqDGZ2VqRilhl11moYf1A/ooB12uoH57F+r92dEY0EKr+zj0O7k57VLvaMMNSL4Zj6EEw2v7BDaCeKNXiHOIrMw4E99CoIkHNQka2c6EUZDccXaRRWlueo25Rd7LYZ5OayGvw18CJy4/h9hKbTAoAkIdrigoQcRVsD0e7yYXbSqOCg1ED8ww06mW1u7z4kiNH3/Nei6JSTosS0/6+qE0yBco/MGnCwgrmdUoDp/EyxQ9bm+0CE1CRBiT2jIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3/jrQ0kdXV3qXGIJvNDeIxJSeT+vqLAJATrVCVnDPw=;
 b=wwZIxXfuuBxd6JCd6MvP1XPcQr/VpEkcgqahBeOu2jDTqrD/36kroocby+iAimb52guz8eEP7Y3Vqip9ToxIkIiINa0hN4tt1VRU3LJFgh90Md0cIhlmb7Yiw/vXUscXWGEn5saQ+BIdCWT25m/saUqjSw6+m4RxUTflrfsXveM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15) by CH2PR12MB4277.namprd12.prod.outlook.com
 (2603:10b6:610:ae::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Mon, 9 Nov
 2026 19:20:44 +0000
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167]) by EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167%4]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 19:20:44 +0000
Date: Mon, 9 Nov 2026 14:20:34 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Zak Brighton Knight <zakbrightonknight@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	linux-edac@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/mce/amd: Don't poll unpopulated SMCA banks
Message-ID: <20261109192034.GA1308963@yaz-khff2.amd.com>
References: <20261107111211.578991-1-zakbrightonknight@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107111211.578991-1-zakbrightonknight@gmail.com>
X-ClientProxiedBy: BN9PR03CA0254.namprd03.prod.outlook.com
 (2603:10b6:408:ff::19) To EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR12MB923140:EE_|CH2PR12MB4277:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f9a878-a6af-4dab-c23e-08df3e968cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|18002099003|22082099003|6133799003|3023799007|5023799004|56012099006|10067099003|11063799006|261102123227099003|261026121527099003|261022075727099003|261021121427099003|261022105027099003|261021123027099003|261022115727099003|261026140227099003|261021135927099003|261009223027099003|261028144727099003|260925022911599003|260925021911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info:
	jEwcuRSLfOLTuNw3Wk2MqxFWHPeOCkUaXGgf+RkCUmc1V7gOHcWC5KkZ/F5l3wRh+nDXlKhKtokY17SW5iX4rGMIx+Ky4qOUfwYPQBbtvzwkhdEhOnE4Y9qBg2BzUeUicOwgB9s/MvR+f69u7XJnSNhiq/qeHvL9qfeZoTupitShuWcIYGaZc+w7jRC0eGJ9LkBGMVoAtI6O8KnAvlXQRcQJmrY757Ub14KFo7671Vz4qfp4dG3DSnlFAyX58PrQ8i5fO0IsRsvVuBhzKmGo58u1EB4Vk/7yFpuM032brhLm13qZrH15huSexYEcui4s1wVMbBl5siwk0JXCzaIXB6YLEiDvBO89UOFnEu8ZeYUfJzgIuWj4T8eCVxHql48mY7aETcKL7nbfFv6E+kbGWUha+1G8/QnL+l/h5kF97Bn3hdJ2j5tncbOLNFhaMEt6MdrC742O9KjUeRkrnWGyy5rCeNCmfnvaNykrokLGk0BWjoRTqHNUCucunreIzAqVV8hHnRYRNP4pZkDNkmmL/NLQx2IY5RZ660/6pf7Ow5JseOA+85pWzFA015XMufwQvXcoBNQ1gcI3NzKH4dWdquSYaYexbfq4pVrpWvOgeyDqBqLP/LNdhqzBYAwN9j7Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EAYPR12MB923140.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(18002099003)(22082099003)(6133799003)(3023799007)(5023799004)(56012099006)(10067099003)(11063799006)(261102123227099003)(261026121527099003)(261022075727099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022115727099003)(261026140227099003)(261021135927099003)(261009223027099003)(261028144727099003)(260925022911599003)(260925021911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pPCNU56q57aQN1yiDG8PmbFlQ4eyBoHhDnugAoj1weB90kbtoDLLWFlV0DX4?=
 =?us-ascii?Q?SDwOolbY1XmVQ5Y/nKjxBaxcz8VJr+edUsnupiRy6PUUPy/v/IFRsRLg8yWs?=
 =?us-ascii?Q?nrE9vUvRxid0jXlPUZtkkenCKVkiaHiG+gW5VPA/fHFkQWgoLFHi1OH7smbn?=
 =?us-ascii?Q?09JndLXP+s0noilBhtERTsb7ANYyh7u6runMI6r9GDf3MWbspYv493aikQ6R?=
 =?us-ascii?Q?k6utmV8EX5Kyx5pvACVIWQrkXQmJmwbxX8xkE9UC62Pzq2vV+cCVVmj8SQJ5?=
 =?us-ascii?Q?xOpToHdpRlPwsV3GCvePAYx2Fm4gD68jfpw09Ms+va/x0OJ/4O2KlB62fzcS?=
 =?us-ascii?Q?zB6jEdLTBYRMLZajBQBIIwbUN+TjrP7bI31ktTGlhD4EoCZy+HhIBrTW8tUL?=
 =?us-ascii?Q?ealfJdK06kbd9pE4qD/q83/DNcPiju5qQEqNxubX6JrxN9w8F9JvkVSIub6d?=
 =?us-ascii?Q?alr/owal0I7J/CvzeUzB3ClaSBrMc6ujg/0+3TrBv9H1vj8nAJqTk4wmJZAT?=
 =?us-ascii?Q?CziTfiKj+OHz33BN6WMHcHzNAnVP/mYO9Nb5lUZm/yNj7eZxuTm2CouKf76i?=
 =?us-ascii?Q?JYeOC5r6xJR1J1Mxvhx0QZAcSz27xKkEkRLYghXIsrkN9txEVzqSSREet/mA?=
 =?us-ascii?Q?0hmOw71wFDKEkY+2Zqwe+vzo9jdYhj47EuCqbi/EztHSxQKqnfz8ZPVXu7WU?=
 =?us-ascii?Q?pnXz9lQYsRmaUoZ8oabwFhCDgjYwd3A9EMfChTzO5qcvIUSge4mKGj7kYKX0?=
 =?us-ascii?Q?4ndGUU/DOyhVhVKME92WoGmuoRxDK9WF0JyzKvAlQMhzIlD7FKHYVBagfxXF?=
 =?us-ascii?Q?qe3B/MaFAH27DOWXxrBnQX/zq/0HuphZSrxAoV33+ZY71BrLoG8WwnCT7mKB?=
 =?us-ascii?Q?vs/f05128YxuioksmlWx9gxHtpTc0NABeAe2ifSXi6IdJu0pyDypz6CH7XkN?=
 =?us-ascii?Q?1Uthy13RtFeafPYht+Wo6WMtvwMu52uh3582LFEKv+1RXNhZ/hbW8OW6GoQw?=
 =?us-ascii?Q?drWQD7fImq6QRym4L/wa513/qyMBSgpieVsDmU6Gb9ZfxrvRY0C4Zourxq6k?=
 =?us-ascii?Q?Co6UNqUEaQKJPKb6JzPGGTFIVyXb2rU48uatgwGqcHRm3CIPz1VUEFyQ9Khj?=
 =?us-ascii?Q?A5hP3XA/hHbFjbZtShoEfjKxege3pcPn1yXc3I3ejan8Rka+b4FQrF2qUqq/?=
 =?us-ascii?Q?iSZUHkDVBcVe4+IOC+++HhFHpdF0bXVYmH6hZeQBZbYw6DHg1mHtdZbOUntP?=
 =?us-ascii?Q?kmLDdUbXTPgN4eFnI9+5fwIMsXcKYk74CEX/cb1no1CIWKwrz/YwVwydjo7o?=
 =?us-ascii?Q?5bOPnNGg9mwfWl1hQB9Ord1giz7DKpalJrqHuFxaJOPQPndG0IVk9HQ1aif6?=
 =?us-ascii?Q?23vw6V+CxEixi+6x+tVD9A3twOKiDIZuC63xErRKC+y3w5YnBvuM4jwaHEvh?=
 =?us-ascii?Q?8FluVYdxYJ7R9ageOFsnyU0EASs8IlZAvsrDzaYV/0XTdFsJ5Ekj8IEPUJYw?=
 =?us-ascii?Q?y8VaB/gLdOF4g5OTiYyU8CTZtuChr1DxqFsS53Hxh8YctndnHe31U/ACmpih?=
 =?us-ascii?Q?AHsd0UDxGhY6fcGrsliJDf9THVEp1019azMs5z+rjovDoIQlW8sJK/pXtm0v?=
 =?us-ascii?Q?sMEFdem5jE2xvgoTM698Q8IbR79LGKoYLisiCc8EsTAjKUsuxI1lENR8Y3i7?=
 =?us-ascii?Q?1k4TrDIa7cE4u+onhAU0LBdYNkcbnsVy4xBNVv8KVBJRYHms?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f9a878-a6af-4dab-c23e-08df3e968cdf
X-MS-Exchange-CrossTenant-AuthSource: EAYPR12MB923140.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 19:20:44.0640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2EyuMYQ5Bt0I+LLxre5VfsmZjGjOnTvIr3cC7DjQtCk1HBay2yTpTlb9T/j8E+l/25+CkNvBr2eqFk/oSRblw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277

On Sat, Nov 07, 2026 at 11:12:11AM +0000, Zak Brighton Knight wrote:

Hi Zak,

Thanks for the patch.

> On a Ryzen 9 5900X (family 19h model 21h) the kernel logs a bogus
> "System Fatal error" every week or two. It always comes from CPU 1 and
> from a bank that CPU doesn't have.
> 
>   mce: [Hardware Error]: Machine check events logged
>   [Hardware Error]: System Fatal error.
>   [Hardware Error]: CPU:1 (19:21:2) MC14_STATUS[Over|UE|MiscV|AddrV|PCC|SyndV|UECC|Deferred|Poison|Scrub]: 0xffffffff8b416928
>   [Hardware Error]: Error Addr: 0x0000000000000000
>   [Hardware Error]: IPID: 0x0000000000000000, Syndrome: 0x0000000000000000
>   [Hardware Error]: Bank 14 is reserved.
>   [Hardware Error]: cache level: RESV, tx: GEN
> 
> On this system only CPU 0 has the shared banks like L3, UMC and PSP. On
> every other CPU banks 4 and 7-27 are unpopulated. Their MCA_IPID reads
> as zero and their MCA_CTL doesn't keep the value written to it. So
> __mcheck_cpu_init_prepare_banks() marks them as not initialized. But
> their ctl stays at the default of all ones. machine_check_poll() still
> reads their MCA_STATUS on every poll and smca_should_log_poll_error()
> reads their MCA_DESTAT.
> 
> On CPU 1 these reads now and then return a non-zero value. The values
> look like memory contents rather than error status. They include kernel
> page table entries (0x8000000100c0d163), x86 instruction bytes
> (0x900000000000841f) and kernel pointers. When bit 63 happens to be set
> the value passes the MCI_STATUS_VAL check. It is then logged as an
> uncorrected error with nearly every status bit set. This machine logged
> 39 of them between July 2025 and October 2026 on kernels 6.15 to 7.2.
> All of them came from CPU 1 and from unpopulated banks. Users of other
> Zen3 desktop parts (5800X, 5800X3D and 5950X) report the same signature.
> For them it also always comes from CPU 1.
> 
> Commit 0422b07bc4c2 ("x86/mce/amd: Filter bogus hardware errors on Zen3
> clients") filters a related signature but only on Cezanne A0.
> 
> An unpopulated bank has no hardware behind it and nothing to poll. In
> smca_configure() clear the ctl of any bank whose MCA_IPID hardware ID
> and MCA type are both zero. machine_check_poll() and __mc_scan_banks()
> then skip it like any other disabled bank.
> 
> An AI coding assistant (Claude by Anthropic) helped find the cause and
> draft this patch.

A lot of the commit message details can go in the notes below the cut.
IIUC, this would include the coding assistant info.

Here's another draft of the commit message:

"""""

By default, the MCE init code will attempt to set MCi_CTL for all MCA
banks on a CPU. This includes unused MCA banks which are read-as-zero
(RAZ) and writes-ignored (WI). The init code will check for this by
reading back the MCi_CTL register. If no bits are set, then the bank is
marked as "not initialized".

However, "not initialized" only applies to the MCE sysfs interface. The
bank's "ctl" value is still set, and this is checked in the MCE polling
functions.

Normally this is benign, since an unused bank would return '0' for
MCi_STATUS. But in some cases, the MCi_STATUS register will have a value
with the "Valid" bit set. And this results in logging bogus errors.
They're determined to be bogus based on the combination of status bits
set. Also, they are logged from MCA banks that have an MCA_IPID value of
'0', i.e. reserved/unused.

Clear a bank's "ctl" value during SMCA init for unused banks. This will
save an unnecessary MSR read during normal operation, and it will avoid
logging bogus error values that may be present on some systems.

"""""

> 
> Signed-off-by: Zak Brighton Knight <zakbrightonknight@gmail.com>
> Cc: stable@vger.kernel.org
> ---
> I tested this on a Ryzen 9 5900X (MSI MAG X570S Tomahawk Max WiFi with
> microcode 0x0a201213). I set check_interval to 1 so the banks are polled
> every second instead of every five minutes. That way the bogus records
> turn up within hours rather than weeks.
> 
>   - Fedora's 7.2.11 on BIOS 1.B0 logged 34 bogus records in 22 hours.
>     All came from CPU 1 and from 16 different unpopulated banks. Nothing
>     else was logged.
>   - Fedora's 7.2.13 with the same change logged none in 8 hours 10
>     minutes on BIOS 1.B0. The unpatched rate predicts about 12.5. The
>     7.2 code around the change still uses the 32-bit MSR helpers but the
>     change itself is the same.
>   - Fedora's 7.2.13 without the change still logged 14 in 21.5 hours
>     after I updated to the latest BIOS (1.D3 with the same microcode).
>     So the firmware update doesn't fix it.
> 
> This version against tip master builds without warnings with W=1. I have
> only booted the 7.2.13 version.
> 
> Reading the unpopulated banks directly through /dev/cpu/*/msr shows the
> same thing. CPU 1 returns a non-zero value about once in 1.6 to 6.8
> million reads. It does so on both BIOS versions and under the patched
> kernel too. No other CPU ever did in over 250 million reads. So the
> clean run is down to the patch and not to quieter hardware.
> 
> One boot of the patched kernel ended after 17 minutes in a hardware
> reset (a data fabric sync flood). The MCE kept across the reset is an EX
> watchdog timeout on CPU 16. Its address most likely points at the WRMSR
> in native_write_msr(). I don't think it's related because the patch only
> changes which banks get read. The next boot of the same kernel ran 13
> hours without trouble. I mention it for completeness.
> 
> There is no Fixes: tag because every bank up to MCG_CAP[Count] has been
> polled since long before SMCA. The closest candidates are two commits.
> d9d73fcc8784 ("x86/mce: Detect and use SMCA-specific msr_ops") started
> polling the SMCA registers. 068b053dca0e ("x86/MCE: Determine MCA banks'
> init state properly") marked these banks as not initialized but kept
> polling them. Happy to add either.
> 
> mce_no_way_out() still reads every bank whatever its ctl. So junk there
> during a real #MC on CPU 1 could still escalate it to a panic. I left
> that alone. It could skip banks with a ctl of 0 too if you prefer.
> 

Yeah, that needs a good look.

> I don't know why only CPU 1 (APIC ID 2) does this on every Zen3 desktop
> part reported so far.
> 
> Other users report the same signature in these threads.
> https://forum.proxmox.com/threads/ryzen-5950x-uncorrected-software-containable-error-events-after-upgrade-to-kernel-7-0-x.184025/
> https://discussion.fedoraproject.org/t/hardware-errors/193072
> https://bbs.archlinux.org/viewtopic.php?id=304584
> https://github.com/8do-abehn/lab/issues/435
> 
> I used Claude Code to help triage and write the patch.
> 
>  arch/x86/kernel/cpu/mce/amd.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.c
> index 1cc20b855..1de43386c 100644
> --- a/arch/x86/kernel/cpu/mce/amd.c
> +++ b/arch/x86/kernel/cpu/mce/amd.c
> @@ -345,6 +345,15 @@ static void smca_configure(unsigned int bank, unsigned int cpu)
>  	hwid_mcatype = HWID_MCATYPE(val.h & MCI_IPID_HWID,
>  				    (val.h & MCI_IPID_MCATYPE) >> 16);
>  
> +	/*
> +	 * An unpopulated bank has no hardware behind it and nothing to
> +	 * poll or scan. Its registers should read as zero. But on some
> +	 * Zen3 parts MCA_STATUS and MCA_DESTAT can return garbage that
> +	 * would then be logged as an error.
> +	 */

I suggest dropping or simplifying this comment.

Something like "Skip init for unused banks"

> +	if (!hwid_mcatype)
> +		this_cpu_ptr(mce_banks_array)[bank].ctl = 0;
> +
>  	for (i = 0; i < ARRAY_SIZE(smca_hwid_mcatypes); i++) {
>  		s_hwid = &smca_hwid_mcatypes[i];
>  
> 
> base-commit: 4f08fc2dfebccc28b7a7645dd81d28a755815e47
> -- 

Besides the commit message and comment, this looks good to me
technically.

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
