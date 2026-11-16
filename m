Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794863030;
	b=yKnY4ikapUQ8i2autWczz17U1PYRNkG/AJwaLVNTicSv6rPPuRUodvKHbj/kBvSLxVzr
	 0o3xJFcDfkDkr+76C9OrkGFP5jgICh+TcexCIfWmsr6tMxnJQcbCevUAy4gZo3BfVQvFU
	 PxOXr28a2+SPlXob/M4I6iY0Hb//4VY5k89cXOUO1fEGMBVZEApMmRhCtf5T1Kkyg4VjZ
	 6FL+FFOJ98UU7sPUi2EWrh5HwuW6lQuRDPEAP45wFrZK25KzY/Hzb+V6tbkH2ZItNY2OT
	 /DNyHN8N1Qkl5UhbzipyHPqROvSiGz7mANXNRSyYOnEWcGzoo50yDMWiVuFb7m0yJvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863030;
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
	bh=TIdmbcXm8kig9BCoGj4YJjAO/KqZpQJUTWFpV4mC3Ig=;
	b=VhislfoirZFgg/8Q+7tX21RRdH5ZvC2+ovFdT4Qdu43kdzLTGLffpAYbfVKlBupG+PLz
	 dbBXibHfyX6WuFhVdj3UrmnppyZOD5a5fAylHD/SOGOBXDCvqZYNfhXFJf3H/5qaBjmmR
	 zzuzbCosIEcaYfQq+d33a2gWIPaMcViQIIRRfqikLDY2d8e9Z0Vb5o0YLgwOtrYEYqkRI
	 UsX2vaFa2SFFrXmRK4MwUyAHMaqF3ekWnnbChNkDjlFGBEB1sONZRSn7WuKJMKuA9r24x
	 hBmdPwi+v3rD1RnzvVxBlGfbejlfojtEvihhBxkaiYX1bY29ihe7rmntNeCXiWwCzBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gDgnTWOq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.68
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011068.outbound.protection.outlook.com [52.101.57.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABE2606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ABE2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gDgnTWOq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIL5knOnnLcKZmTU0WNuz82wjuZIuvO374gtjUrQzJfJMrOPfPNfyOF6dSXJOw4r2FB6G3Z4ccc4ktAKlI2M6qFBbzrmFEwt8meOg49G2Mq+btUlw07ZjkKy9k3/e63rx+ObUXSrOcW7fqXiCcNKwzGx+3Gw/zXv3Y55Ba8qN3yFhOr1VRvSJgzn0SbsJ8Rqbnn1oD80l260zFPVoaU6icLx589+cA4Sv8m1ZvzA4S2i5ey1c9BCLEf4Td4j5H3RQ3nj1pDES+Pf2a/kQPacjZTIAGkLwqyip4jUvEMCxUp6w1X0+HmPb/fEnyb86Vujr4rkRLOaK6hlhUjZnSf1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIdmbcXm8kig9BCoGj4YJjAO/KqZpQJUTWFpV4mC3Ig=;
 b=b3kKKLgJrsIS3x8TCKhpafMgyMxKVgwwX/oYWhdZHEAZeHDu2CT5pdx7TwgDnGKa7Fl7n2VZo9ShVAsKBVk+y6N3xPnRgdYGorC8heP5FzmTYw+ZkMfotZ4Sx4jf5sxm/bS/vsEDeQnykXRIpn9nBaltIRebNClSBcOWFDkDVVbFi7VTeArMwVVfBiPyGx61+mdfhIs3skFpkd8LjD44nP9O4EyQHA0WL5GpwAnxFFCDqyT0JOInKZlB3TEMlALpS6vC627n8KFbpkAbriJsMw1kcDfwAr0YvGRFVsaNd4NM4wuNs26oo14qbJI7Rr8jBboSJD/okTrQT/zGeLVxOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIdmbcXm8kig9BCoGj4YJjAO/KqZpQJUTWFpV4mC3Ig=;
 b=gDgnTWOqaljBI4PzWsQB0+DUSYGuhWNOkT9gGvAhWGd2wGMwl8uFxwGByQ4FfqRUj/916Ifeg3ojkiwxbzcxOtMFxGG32vQpivH7l5JByKTn17IIQiikzVcoETcepjIX2pm2qszl8Y0Z6jVLWHXy49EZkOT0Kzj0mwNOY/hlZJuhqKv/qngBFxLbI+O23GqUdeNWpeyg+VdtLCg6SlvYvUOicrnTaEvdNgHAx45Ck47za0gTiWJaKspyRvFYMFzLIgit6MXV/qhNFMoecAYe0kG5pPFLBPD84VWvQK/E37vGV7rJQhsKqekCckw499JcYBoVYjD2hy10B+JuHnUrIA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DSVPR12MB999147.namprd12.prod.outlook.com (2603:10b6:8:38b::11)
 by DM4PR12MB6087.namprd12.prod.outlook.com (2603:10b6:8:b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 21:03:42 +0000
Received: from DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445]) by DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 21:03:41 +0000
Date: Mon, 16 Nov 2026 15:03:39 -0600
From: Lucas De Marchi <ldemarchi@nvidia.com>
To: Alexander Moch <mail@alexmoch.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	demarchi@kernel.org
Subject: Re: [PATCH] objtool: Use AT_MINSIGSTKSZ to size the sigaltstack
Message-ID: <3c2lpv75qz67rkcirawgfcd63pazgur6tw6qp7m6z5tdfimeeh@v2em57j4ix6e>
References: <20260920143815.32426-1-mail@alexmoch.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260920143815.32426-1-mail@alexmoch.com>
X-ClientProxiedBy: SA1PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::18) To DSVPR12MB999147.namprd12.prod.outlook.com
 (2603:10b6:8:38b::11)
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
X-MS-TrafficTypeDiagnostic: DSVPR12MB999147:EE_|DM4PR12MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b8700d-98be-4d7f-833d-08df442517fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|6133799003|261009221727099003|261009220027099003|261009223327099003|261009223027099003|261009221227099003|11063799006|261028144727099003|56012099006|261102123227099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	0sN3P5TJxFZO1myoj9TQdEde9tE1l0BMVxynuqwKDPd3N1Yt8l7uwuocj4bTAL4RGHv9SU6wFgK3ZFKiDcEN2jcblG2zpsqt4EMQQQNp1Hidbsu+gVIeDh4sqXycj0tQxQgNz7VGLSCULhb0Jbp1cxWxbrtiLI2LIBawBEPc+0XXW6hcshCZ7M0khYUGrb3xH8F04Zt0fJBhnPTHGxbck9b0pZcrRH+Ex8jIn/fRKojccoSq23rwdzKHkHHwiYCn6F/BT3TsGVfrQW244A+tqGQ8O2w8IJqdhYgd9c9VMMp1/OSWydf4+Fbq+/FkdqsWrf/fbmM8Xt18+MtEzxe1otNa6Nux55Ur6brio7qCXqgGwZm/MQ51DL/Dc0Rm6jWcXCR2rIZ7rd6Aeh61MzonRfbp1pUCxR+EYuOa8Y+VoGkDu5zV9bnBJuy5Jx02HQ894Y9TKUjO8+Um8YRWN9JHSRe1/R5/qVHcnR72sN2i7t6pGQQW76UaYNczHRSbOsWNSlvHJG4ASOuYYmTiZn4lQCSbvMkcZoXxuw5IwxExYGYrKfXeTxELLnalB/2lqXyHM8wIcwKAB6ViPZ91YmbK9VFb/mlEXELuLm5CYoOjaZkNf4fJ4NT7lGK7mi70mx7TAAUxRwzgvVd4d12gEaM2BZYEhHYkhK96GgZwbnIed78=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR12MB999147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(261009221727099003)(261009220027099003)(261009223327099003)(261009223027099003)(261009221227099003)(11063799006)(261028144727099003)(56012099006)(261102123227099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yaqn2f6i9CPJTKuwZRqrhZL0m0fD5Up6kpAbH6xcEnn9RHrO1qOQZEKqy2Ur?=
 =?us-ascii?Q?X4+6vS9iM41r+vrX/uR+0l16CcRkkdJOf+1Cr95kK5UdnQqaqyd+3egfGoyb?=
 =?us-ascii?Q?6UdljJn2fOxAjHpCYKL8IO41Q/aWglA3T5TH0LqO95ZPPyPkDdWiT9z9OvIq?=
 =?us-ascii?Q?dVC5SkiwmCaGHGGN+u9PMDdnZAnugovYrKw4U2TnL5YJltvbpBCZeoC+ffw8?=
 =?us-ascii?Q?IDtkQW05G765URL7Ro6mhuW0OfcVoFNAz/RfBjbgAQ1kVur685AlDVvMFs7w?=
 =?us-ascii?Q?rTt0i6StO4OgsPKLC+oaZqTTBaeVIY2PVn2qWzYFuDiuA2K060GZOx6jmfGx?=
 =?us-ascii?Q?zFr1DuzRNCSWnJ6ykgcnl/kRaDALEj7TWDOz/lY5lzktpZWJG9SgpD+Avzp/?=
 =?us-ascii?Q?kBiCpnxbt6cNDBTW6CS2Y7xmSj6ovJLdlvmMTsMIVmKZr73PUwFaxUBtEbfu?=
 =?us-ascii?Q?kBl+CSGxu006XDwzp6Atq82qnSa8S34OZMbrH9eTiezUjiXYkB/94FM8NElt?=
 =?us-ascii?Q?4/w4tHEFAKIO2I7fT+++qr6KHP6/xzBK0CkXLEfI1L6hfd4j7pDy9ZD7YZDs?=
 =?us-ascii?Q?H3dWocBEa1HalzqrmBy5/mfhCk8QaSC6AWiQpJfQW9dBybyPENEJhRl441Gn?=
 =?us-ascii?Q?81OJPgMy4dLo6JL6BAx4hxVHgU0Aa6rYS81RcHKizaqp0LiKn/p1JUSl/tJS?=
 =?us-ascii?Q?jDd2p+oxZrQujGsjixmsxdPObUdNx51fDC65krHOL2T53p3RdxY+PhZ6emNg?=
 =?us-ascii?Q?d3B9HgViFgPAs+BYu10Z17zllQjF278hW4jx0hMxVLlg1ATNlada9/rmexET?=
 =?us-ascii?Q?+NWrgpQnOUolBickG6fk6ZBe0goQ+yeXgeM7FHUJWdIV7xNmpl/XmFkc1I83?=
 =?us-ascii?Q?IP5/zPjL2miufCj+yj1i/qZLQh1QfttHDL0NBpEurXRXuc1QCBngRMBFzIQn?=
 =?us-ascii?Q?xTMAQee7lTQmxz1ux19Yh9DZ6xgerk55TREZeEWv4WIstfLS39R/s5/CncMS?=
 =?us-ascii?Q?+oahKsixNFs1/gj1kTomW4qc4pHP2hnrxrqWUNCYTzJRInvcgmsO8uzelM1z?=
 =?us-ascii?Q?YO4LT8wJQwCGBXdS8hVPzhJz14YWhd2Hvg5X3+lzpsZWucSeNdBIQ+hCRxLm?=
 =?us-ascii?Q?WtSEeuSP9RSSZD0OzOovdPCQmpriCIoApFYatmVMDBSZGX1YtfMXt35ugrOd?=
 =?us-ascii?Q?O6jki8iOR+Lz0p1pO0g1qm/9WgYNVge2FlTWO8jd1DiQURXBHumWhOrXRi8T?=
 =?us-ascii?Q?wfcGTTEUqfAnZena0gkaLkDdQd4eH8g2jcEDPasHeOHZThJI3tembl28mCaf?=
 =?us-ascii?Q?ro0MgQOyrQ/q6Fkms1+30M3SDr8g1Bc3Lyvcgxu2JYfdLP4S1DKaihkYEN9W?=
 =?us-ascii?Q?uUtL1GvVAmg25r8ZY0enJTc5ZVgFnq6LDffMWYmE5YqvOat1CHcn5y2/G6RB?=
 =?us-ascii?Q?dIkp/Ev2kdvN82w9TGKZ+3iGlSsmMj5GumNPFW+4h7XXdaa+SZW2+cxooyyb?=
 =?us-ascii?Q?DJ5yGI6koQsZFBkQe85N4wiWmP0cEFiaVDVBDj7rzAGLFerzKkxRWaNZLgE7?=
 =?us-ascii?Q?8mGiVP2mXvqZNd0917e23QopDKX7RUPiN2v5tJgp/ItRjZOJY3msRINJKTKV?=
 =?us-ascii?Q?SFn2JY38oesoX3toxipDvNxF20IfEyehwIO/qLsU4Lya391+MLkPtMt9YSKE?=
 =?us-ascii?Q?NHYWMPZS0eDkOGT3C7tv41X0BxC/SjrEqYcMivO9RCHQgreGf7ZuR61qqlLo?=
 =?us-ascii?Q?Z+N8UUOltA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b8700d-98be-4d7f-833d-08df442517fa
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB999147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 21:03:41.8627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55SE0idMk61623num77aj5GS1KRaFddDt8augN35GEonPDAnJVLJxkFhsQPSzfedwVKQionc6xAqKGUMtm0C/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6087

Hi,

On Sun, Sep 20, 2026 at 04:38:15PM +0200, Alexander Moch wrote:
>init_signal_handler() allocates its alternate signal stack with SIGSTKSZ.
>Built against musl on x86-64 that is a compile-time 8192, whatever the CPU
>it ends up running on turns out to need.
>
>The C library refuses a stack below its own minimum, and that minimum
>follows the kernel: musl's sigaltstack() rejects anything smaller than
>sysconf(_SC_MINSIGSTKSZ), which it derives from AT_MINSIGSTKSZ, and the
>kernel grows that figure with the xsave area.  On a machine with AMX it is
>11952, so the 8192 objtool asks for is refused and objtool exits before
>doing any work:
>
>  error: objtool [signal.c:118]: init_signal_handler: sigaltstack failed: Out of memory
>
>Ask the kernel instead of assuming.  It publishes the size a signal frame
>needs as AT_MINSIGSTKSZ, and the handler still has to run in what is left
>above that, so add SIGSTKSZ on top, which is what
>tools/testing/selftests/x86/sigaltstack.c already does.  Where the auxv
>entry is absent, before v5.14, getauxval() returns 0 and the result is
>SIGSTKSZ, as today.
>
>Fixes: 799647ddb4c0 ("objtool: Add more robust signal error handling, detect and warn about stack overflows")
>Signed-off-by: Alexander Moch <mail@alexmoch.com>
>---
>Found on an Alpine Linux (musl) runner in the OpenZFS CI on GitHub Actions,
>where configure reported CONFIG_MODULES as unset on a kernel that has it
>set to y.
>
>I have no AMX hardware, so to confirm the fix I ran a separate experiment
>on GitHub Actions, one that builds no OpenZFS at all: forty runners each
>fetched this tree, built objtool twice -- once unmodified, once with this
>patch -- and ran both.  Four of them reported an AT_MINSIGSTKSZ of 11952,
>on three Intel Xeon 6973P-C and one Platinum 8573C under Linux 6.18.35.  On
>every one of those four the unmodified binary failed where the patched one
>started:
>
>Unpatched:
>  error: objtool [signal.c:118]: init_signal_handler: sigaltstack failed: Out of memory

I had this same issue in kmod CI[1]:

   [2/3] Generating testsuite/build-module-playground with a custom command
   make: Entering directory '/__w/kmod/kmod/builddir-gcc-64/testsuite/module-playground'
   make -C /lib/modules/7.1.5-0-stable/build M=$PWD CONFIG_DEBUG_INFO_BTF_MODULES= modules
   make[1]: Entering directory '/usr/src/linux-headers-7.1.5-0-stable'
   make[2]: Entering directory '/__w/kmod/kmod/builddir-gcc-64/testsuite/module-playground'
     CC [M]  mod-simple.o
   error: objtool [signal.c:118]: init_signal_handler: sigaltstack failed: Out of memory
   make[4]: *** [/usr/src/linux-headers-7.1.5-0-stable/scripts/Makefile.build:289: mod-simple.o] Error 255

[1] https://github.com/kmod-project/kmod/actions/runs/43823295036/job/133151159412#step:8:85

>
>Patched:
>   Usage: objtool <actions> [<options>] file.o
>
>There the patch asks for 11952 + 8192 = 20144 bytes, and that is accepted.
>The other thirty-six runners reported an AT_MINSIGSTKSZ of 1776, 3376 or
>3632, each below the 8192 objtool asks for unpatched, so both binaries ran
>on those.  The model name does not decide which you get: three further
>Platinum 8573C runners in the same batch reported 3632, so an affected
>fleet can fail a build and pass the retry.  Built with objtool's own
>-Werror -Wall -Wextra.
>
> tools/objtool/signal.c | 18 ++++++++++++++++--
> 1 file changed, 16 insertions(+), 2 deletions(-)
>
>diff --git a/tools/objtool/signal.c b/tools/objtool/signal.c
>index af5c65c0fb2d..8f86c79adbfb 100644
>--- a/tools/objtool/signal.c
>+++ b/tools/objtool/signal.c
>@@ -9,11 +9,16 @@
> #include <signal.h>
> #include <unistd.h>
> #include <sys/resource.h>
>+#include <sys/auxv.h>
> #include <string.h>
>
> #include <objtool/objtool.h>
> #include <objtool/warn.h>
>
>+#ifndef AT_MINSIGSTKSZ
>+#define AT_MINSIGSTKSZ	51
>+#endif
>+
> static unsigned long stack_limit;
>
> static bool is_stack_overflow(void *fault_addr)
>@@ -101,17 +106,26 @@ int init_signal_handler(void)
> {
> 	int signals[] = {SIGSEGV, SIGBUS, SIGILL, SIGABRT};
> 	struct sigaction sa;
>+	long stack_size;

unsigned long?

I had a slightly different patch making it similar to the
selftests/x86/sigaltstack.c, but this is simpler and should
work as well.

Reviewed-by: Lucas De Marchi <ldemarchi@nvidia.com>

thanks
Lucas De Marchi

> 	stack_t ss;
>
> 	if (read_stack_limit())
> 		return -1;
>
>-	ss.ss_sp = malloc(SIGSTKSZ);
>+	/*
>+	 * SIGSTKSZ is a compile-time constant here and can be smaller
>+	 * than the signal frame on the running CPU.  Ask the kernel how
>+	 * big that frame is, and leave SIGSTKSZ on top of it for the
>+	 * handler.  Before v5.14 getauxval() returns 0, leaving SIGSTKSZ.
>+	 */
>+	stack_size = getauxval(AT_MINSIGSTKSZ) + SIGSTKSZ;
>+
>+	ss.ss_sp = malloc(stack_size);
> 	if (!ss.ss_sp) {
> 		ERROR_GLIBC("malloc");
> 		return -1;
> 	}
>-	ss.ss_size = SIGSTKSZ;
>+	ss.ss_size = stack_size;
> 	ss.ss_flags = 0;
>
> 	if (sigaltstack(&ss, NULL) == -1) {
>
>base-commit: 73ae59e975966d24e32926247ddb45a537ebe184
>-- 
>2.55.0
>
>
