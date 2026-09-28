Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B86F48F838;
	Mon, 28 Sep 2026 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588087; cv=fail; b=H4M5d/PzoVVyaM74/L6XfabgvExT3PefMR3sNIt8PPvr9e+KvxfywathCus/OXipHOZh8nDelQEs0UorVEQk7oYoNgYj2DuXAds5gwLm5S3FPYUYZYhBQpHVM0pFmSXOrkwtY/qY4+EdQIyaKJAKaQ0oVwLIdp3L46QULIi58tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588087; c=relaxed/simple;
	bh=wp9NTA3NsRAPRdCUkGDKdbkrRsb0k1LkaHG5ke8Wdgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZXeH7/QlgomTX0v065L8wNlkgQ8j9IdC6vxkhoWVx4QOv3AgQ2uzhiByaB7qblqxRgRQ8Dsw3Wodi1EKvg99BlyKHq3ioK3fjKOfJRee5QxNd97NDY+W48tXWBQtjZs6n5JfspEZWaFTedJ4k2FTdQE8WoSQVd//buH1geNWls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nXVBUj1z; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SiJGH25F; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nXVBUj1z";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SiJGH25F"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S82QHv477138;
	Mon, 28 Sep 2026 04:34:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=DYAG0LAOq0WclLKSM8
	sCYVRmUMHZVyHRrqEgJEfQx6A=; b=nXVBUj1zSxDWvknL/6Hd94Ebbz9lJJuiHC
	oTC0kxCYIPcq4h7MdLYq2AFXbRwR3kcfbApv5W+MHU8ZILp1wVHRn3COaLtiNnQV
	5MD6vAiUK24jKSS2+WcjZVi8MnIOKnUs4bn6GnJ8F4EqLQewzhQ5nvlKdesT82Of
	BNkrrKk0+A49tLiMDsvsX2cgQlEbGiQc3gX2jlkb8e0kPsc92GCxbo88W8/Tb86/
	o8l5he5vrhqgQlhrwVMJ/XsZk22bfmMGhjR3/Iw/YzjAkVVZ9e2O/E0z+naIXMDJ
	ft8jDPCFgEYD0u03Py7UeyqqDpYP/ngpUrnPWcd9WK35gyJJ6ODQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022092.outbound.protection.outlook.com [52.101.53.92])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gxbf0hth2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 04:34:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDaFxjNdNKdH7xF1XhuNnxylbqCPCDWMfclVfU2o7ZTXLKkot4XD25hu6UY4F6SYIxM293G/zFRkSBNh9iguG2n0nVPvJ5XC65KePE4Hmt3ftygAexDlDpBKG0LzrMVqRE+YaLuDytV+Zghz6TYYzITE5q0sHBOea6Dp8z+cErzscWAJpTSOCfQ22E0nk41uE6CNGDcKpqQz0GVci32us0nFqA6PMrhFIprtlQ+rnp+6oQkomW8zZospl3bjSlcEKgNJjxM5/GIh3zVGgS7vc/ZGE7MVjDf5WH5BhRA1AA0xUdXxyGWHBsfgQHLp0MdBBFrSpsY8VLng7/N3g5o9Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYAG0LAOq0WclLKSM8sCYVRmUMHZVyHRrqEgJEfQx6A=;
 b=XYlGoICqx2GX7XwYIg/OLaWzHt476nqWXqmW/HU50amNaCbnjE2xiF3Gf/O+YMnnQ4dbIPMzJJN+xqS3S/N01ToIjkJrt3740n+PHsCT4R1tN5d2aWpDZOTEuhC9193OPVQcrG9QN8+PxAODXhJJLrgC2smSHu4ByOj7c3vh8WaiUB5cBipQSY2p/tJ9jdF6qsokSqj6PukkAs2IjzjSeQptt3h/1mlp5zMIeeHRJnb9G7Y4478umpH3MLTT10n4sdlVeKMMJjA+q1qI4D4VJq51pNzZpJX9YC7AOFYXTfGwRBzpehzoBRqBPOxWJBa0+PJM4aQVPL0AXPq8vof1PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYAG0LAOq0WclLKSM8sCYVRmUMHZVyHRrqEgJEfQx6A=;
 b=SiJGH25FXEEYpbltK9Sfivlg6ZfsQkRx4H09AiYMli8kVH+r53YVWNsQuHJhDpt67ENdEhe0zUjxEgtyOTSggcPcQ2+cnoS5rrwqIlYkCUWpP0oR+WMU+TRw8OPqc1scC+fH/d1GSa163AKXfYj5h+4MGo55xi75Kz2jrGAYpIE=
Received: from BN0PR04CA0056.namprd04.prod.outlook.com (2603:10b6:408:e8::31)
 by SABPR19MB997500.namprd19.prod.outlook.com (2603:10b6:806:4f0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 09:34:30 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:e8:cafe::52) by BN0PR04CA0056.outlook.office365.com
 (2603:10b6:408:e8::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 09:34:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 09:34:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D2F1A406540;
	Mon, 28 Sep 2026 09:34:27 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C1C7682254B;
	Mon, 28 Sep 2026 09:34:27 +0000 (UTC)
Date: Mon, 28 Sep 2026 10:34:26 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v5 3/7] ASoC: SDCA: expose class SoundWire probe/remove
 as library
Message-ID: <aro0ok5heOSLSELl@opensource.cirrus.com>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925161049.758913-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925161049.758913-4-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|SABPR19MB997500:EE_
X-MS-Office365-Filtering-Correlation-Id: 806065c6-4a74-4054-f560-08df1d43b1dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|7416014|376014|82310400026|36860700016|6133799003|10067099003|56012099006|4143699003|11063799006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sC0E7pASn+gFgbIu2e4wBEAz2PclwFrJMpxgKs3JogoXHxGFW5dLDf6QuSnCqkmqgKpmNe5JxwiOu7cSs4X6VqqMgjfCCnys3z2/kV/roN+7KT1B90jH5lL4pOYv7A7JdTwNYVRUduLbq0tnr4gstqTIFwgN5bp+5i4m2CBHZFcjHjnz8UQBIJuR2dXK02p1FWeZVczcFKukN5EA/rl8EFPmBFg0KlWm1Ni+MCDRdnv67D+sk5UBjcbaJmy3Z43bMopfxVO+JRoE8/Ux7+7fRCr/52R1X99IGhac/lOLugoUnaDpyg2+wHduxK3W0eh40EPy+3mWOiHjQXLrYJSAexRrDmpan8mbvzJYP7fDWeWOrHN88FOQ11K8yUE5mBj2JfelewJCWelntCqrGMf+kHNG0K7rNPyc9/p08g03vC71kNWFf1HV1BhJdK4PkFterGmRyEonYhaayPlf9tDkfQZ1Rcf5m8Nf1/Rax9sL3BkIyCRjcZK/btOoMs/zaHahOoJdU2SueofhrT1NO9V42Bcrq29R5Bu6GpTAtTqTOFR+bc8IsQnOrXD+igKWJFrIlS/O2EGcGNVNGQztww0x4YY2yShwiX/80NqHD7NX6YwOi0NZaSkZrad+tyM7SbH9D3/tkTwoZF2htszXZoWCM0ECs6Ls5Hk8TWoyyrLJc6TWAqGQKFF61x48GNG3Dg1KDNyeiu9JcPxTlPHLocEZRQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(7416014)(376014)(82310400026)(36860700016)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IZF6GSDHJiqB3/mhoNu38evXAntlyWGPUrf4b7fAkom3bSm9IFx09YMDLa1DcK67SUewqkY1OEMXkNLpn5RvTEbf+yuLd3Mz2wFCGhu+3y52zCT/nFUqN9f78elL3eNYSr/yEbyPoDQqYJWMGU9LfkpuBUbIyJYaFmorkJYZUAIn/fQR8EKfS5MZL1rqing25SOMIZiFn2z0WqDUZHCksFhw0oMn7rpqrPj76zmNC0eONGbe8OlAlv4IsBrH/hRZSrtMj8uMshsJ6Bq5Xs7NsIDF6ywEXRZ3bPRbSop5tsVs3KBchRQtKat8UrdbQQIK0inO674MOGyeddx2faq7Lr/s2Gk6JzvmKrVeB+W8UB7ILuWm8TU6dq8w0rGwFb4J/nzUdZGP4sXdKZBFjGL3jRN7+IwLgBx82/tWQQV3ylN0AXgcoIJmh4YI5hNlPgyj
X-Exchange-RoutingPolicyChecked:
	Alv+hoci9lSK+nkDkAbq//iIe+ZaMCf1kZ7IyRIkl0+dm41oUYw/XlkGGS0eSkVK/dkgIwHYRwJR4ZOrDN79w5XYjo63r/rWZ42DIh9Kq8vQ7asDkzuNGgjrTfmR8fcHv3v+1VXZMTC66E6bT9BC2M7L9smH5xBLb8SFSnywOY0phAN1N6wawlMj1nIJQRqc5EgFpDEYIA8YK4aM0QWXQZ5VWDt8GTVgRrbM4/hU7mqJjmmW1ImnWL4RIY9s4ObWCwjSZc63J4gsoVnq4w3HQL8QTd7mUzGh/VA7Tp/e6j9xdayUm+UW6fdZdhR24hg0DApX9Cs9g+h1uIiuDmYNUA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:34:29.1828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 806065c6-4a74-4054-f560-08df1d43b1dc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR19MB997500
X-Authority-Analysis: v=2.4 cv=GvLXaU1C c=1 sm=1 tr=0 ts=6aba34a9 cx=c_pps
 a=KO6HEfrki8vYvSjcdf85Eg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=8AU8TKaNByK07v0HRYQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: KU14qOv8uatChvRWyDb4xU6XHxTu1ebS
X-Proofpoint-ORIG-GUID: KU14qOv8uatChvRWyDb4xU6XHxTu1ebS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNyBTYWx0ZWRfX2gR5MHk1clok
 ezrmffTURcfXEHojfZl9YBYaAeRAsBXrfSlW75+BKt9Nst6fWWY/Dm8hljZ4/jL7lPEXF96gIBN
 8aHqeG/Q/sgeYxvGskxJbhYTE/DCtBs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNyBTYWx0ZWRfX2RUszdw+641T
 ruduKxwHt9lD0YIW0hkPZ7SNzuqiY6YEjGUYkrWNAixyum2Q4j1hQR5Ph+wATh2k6ZCwLawGm+R
 mnJ7EIK4wcXAslD3yjMVU60vHHGXW4sDGhDYTajbkTBiSjAzoXd+S/Om/U3KvcfcwQ3bVvhaiaP
 g/f6FL+eljZ5sZBGLEkgrr1ApMUAMMblmpi2EGZvcBvT9eWqEBkyt+guGAXuRarR5b59SaHuFyW
 qOMgkvXcYjJAKNv5sJLmRQ73rXjVoVDCVwuGtV/gVdcujRfE1fC4HU0UcJjGoMb223KhdYjZs0c
 GE5yyr6vKB/vDHcyQhREgDhD7t63pJEfoYU7EV1DboIWYNlNLRz2+Bhu692sJ4amDWfo3CneTrK
 x7RFNmnpp8eXMt4G6Ln772Kifg1ifh/0MrrKr3O54TO4aBA0KV+z1ooA66pp4H085JsCl0A4nUR
 3G0jtXeLRcCEPFRQWKA==
X-Proofpoint-Spam-Reason: safe

On Fri, Sep 25, 2026 at 05:10:44PM +0100, Srinivas Kandagatla wrote:
> Split the internal class_sdw_probe/class_sdw_remove functions into
> caller-friendly library helpers:
> 
>   sdca_class_probe(sdw, drv)
>   sdca_class_remove(drv)
> 
> The class_sdw_probe/class_sdw_remove callbacks of the built-in
> class_sdw_driver are now thin wrappers that allocate a bare
> sdca_class_drv, stash it in drvdata, and defer to the exported
> helpers.
> 
> The exported sdca_class_probe() takes a caller-owned struct
> sdca_class_drv * so codec-specific SoundWire drivers can embed the
> class state in their own priv struct, own dev_set_drvdata() themselves,
> and avoid a second allocation.  No functional change for the built-in
> driver.
> 
> This lays the groundwork for codec-specific SDCA SoundWire drivers
> that want to compose the class-side probe with their own quirks; the
> next patches add the class_ops mechanism on top.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
