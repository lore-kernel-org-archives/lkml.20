Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FD2539792;
	Wed, 14 Oct 2026 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995404; cv=fail; b=GDXPsievwtODbQyBD0L7FDOJJdnFJ1L0BI2z5kktff/djStn4WKMS65oN+7r1p1p+VVgegu3bYIeNUGRFMTs0J4UHePDpv5nlGUSxGl9uN2nDGWJegda9waKV7EXsnE102Cse4wDH9LY88pnkmr7GiErTQZzVnfxCd6wBubpegc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995404; c=relaxed/simple;
	bh=Kb7RKRPM//2U6rRSczORCN7XUBdIAj/OFDyrAWCrZ/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbuOeZiPxHlTmK6B/OCj5vaKNx7qUUxo/cXAHUPFfg/yfbf4QvWmE20bei+IWjS1xEnoYgXpHYyfysISJJHxOGz4e9MQzm/WFtaRWE0XAGQMxFqiXCqAx39Sky/9g0N86XYArcAX4khodgkY1t0+l07O+4eXP8z8aE2lAsiJ6tU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cIjOoERw; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GFRrPYYc; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cIjOoERw";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GFRrPYYc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EG8qvh1005303;
	Wed, 14 Oct 2026 11:29:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=xyENg5219+7s+IZTSz
	MwWVHn54Quk3V1Cqd8AJofNxU=; b=cIjOoERwCEPJ43cHhio+dah97ePsJt20l9
	hrlXZHSpvml/mEv0pS0beiQCdeO59S6I9lq45bvxm2Q35ZZQ8TckGRvoi3FCeOvW
	XD/y1cwOfaO4WYnRUBVHV6dGtnLm1zSrCxmUqzUU9Ta93UM6Y9YYovvVIsrfZM2s
	C/82dZJJu8xBU0R9N/RDKfqsVNzDd2y5FnkKmN6nVmhrL+MDZccmOGHd7tDREM7O
	fKppd/HtMxlejA9z5TeEEg4o5E+QL0bTG1Ny6RIXjkdNFAlqWfcQBeQ+nuNO0OFO
	HYaDpZ36TKqBhE52gOex5Kit/H0DL03+bVhMYX5E528fgl6KmYMA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022091.outbound.protection.outlook.com [52.101.43.91])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4haanq0a7w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 11:29:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqZXHf+cdNBDOrwtQ8TNbDnSNyoYlRmxTEVFKHnrDYtYd5B8AxNLN6hXVcbU3HKde2nxCvn5m5Q/eRSN6YKtcYUlEk6CUjgGbcaXmMFBaGauSFjVteM85j4OyTsLlDlLUHqZG3ktLaKmogEul2MktRgQdSh8MWSati9gjo55pcXXk6qCjYZpTJvtEqIBBI7QXLDzm26KbtdLGQNGoXq7425d5Ei7PSlqHKrRDQC9M4TfktujguuyFEBMKuQvFUz5aPROwBNxCq2vsfWpMbOzD2TkMp6A0Be70YIE2X05fjBlL0fDHwg2uJ1clc9CkdA3smV5vZN2wDe/fAEgDXBH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyENg5219+7s+IZTSzMwWVHn54Quk3V1Cqd8AJofNxU=;
 b=hyXsolk/0sVYdGyAQhrNhM/f3aygeoMdRczawuW34Tj3yvb42Le3K1jOKR5WrMgAZJU/rJuiFynAGJgfKND9wPC3NMdqXRuCTF1f8OL/Y0RKuUttURhH7OqRfoXkCu1YZPy2gK5v9mOGvFe1EqATvNYZGYaNf8RQFvxrMqU/Sp/3GkDflWAafm22P6DFYSc+6xkNT8ja/thOTtyzpMVPpCHbPNWvsFHvzHChKEqDL6OQ9kLUw8HyHNHjcm5l5dQcMZkVtOJJdSslPssao2hfWbvq9Y4j0JVk6V769jyRBzI8IVj94nXOUKsMrvncCmn2W6aTY7CdSLPASTS6zabzVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyENg5219+7s+IZTSzMwWVHn54Quk3V1Cqd8AJofNxU=;
 b=GFRrPYYchVv6IH30v8tIrBQjJBU/AD77CJlw98Okw/ihyqbPdsJ7drwvxxFNrvH7ayyRA7YVvphJBfEc8O9bqR4VCOuYrOkP3prxsaQjsnifX3SlhuUb2cHl0VzszZovmm+d4TXYbX+KKu9puvrs8R94E9tjymmU2NXCf26KUmw=
Received: from PH7P221CA0081.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::33)
 by CH2PR19MB3847.namprd19.prod.outlook.com (2603:10b6:610:a3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 16:27:45 +0000
Received: from CY8PEPF0000005A.namprd21.prod.outlook.com
 (2603:10b6:510:328:cafe::34) by PH7P221CA0081.outlook.office365.com
 (2603:10b6:510:328::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 14 Oct 2026 16:27:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY8PEPF0000005A.mail.protection.outlook.com (10.167.247.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.0
 via Frontend Transport; Wed, 14 Oct 2026 16:27:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0AC8B406540;
	Wed, 14 Oct 2026 16:27:43 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E5B5E82024C;
	Wed, 14 Oct 2026 16:27:42 +0000 (UTC)
Date: Wed, 14 Oct 2026 17:27:41 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Allow SoundWire devices to communicate during
 remove
Message-ID: <as+tfcouMGOL9cZ1@opensource.cirrus.com>
References: <20261012105540.1686405-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012105540.1686405-1-ckeepax@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF0000005A:EE_|CH2PR19MB3847:EE_
X-MS-Office365-Filtering-Correlation-Id: d368bd41-0aeb-4d70-8b4e-08df2a1013b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|23010399003|376014|82310400026|56012099006|11063799006|18002099003|16102099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4XhBeG9jLkK1qq41OP76lXG7bvHJptrk3WaaSU569gaCZFtLgcVuVL+IwHDGnJXSb81dcaiYIAJt/bvtG0YmgUcsY41lRJV2hCCcTAVNtBy+5p5qMLglLEa31mMnTJWv8bdBp9EY2cLX+uWFPWS9DqKPMPjdfrw08R0c8dkgQVr1CGr335UanccszoEC622N8EdEVuuURLJWKhvQ8IgxQ7l58mrW16K7FcFHMNcfWtHPV9yk58fRsD2/PouoZNS8iWQjpTihGsLy6CTP0zwVaAckabr87BTYUKF4rwypy7zWOF/8mEaq5HInTmjH0EBOrU3iPfnNJQb8ng5njEhvUl/ZELMxM8uYHH9MupiAaT2/85j2S4mPrH+AgvPpPuxjERyga+Xuzl3TMk86/hMSGD5Vk3RXYy38wu/k8Xr1cyKZClVg6IonGR+SsDkHB7d6m+0LyITsNVYMnllJ0ahkfUeiczpFW92C4gsVBxG3cfp0gBWPwVbEzPDW5C1jguMr/+Y6rMQbKeRGX0Q/WW9F0KQu4lNi/GaS5Cc8RCYuFmZ7vkqEmo81RLEB/7413D78TwhmzFTNVg+v1qRSS4aWyN9ZrKi9567nxdcx4Lwg0lFOLxxHC3J3TXz2/12TD36mIQKDkC606T1Ee7FS3m+nMvsuGoM0eiuNdzGYG8jBVlqx2tWDG34H5PuCyGX1HABMCPMLPjDISo4pXFi2J/PaDA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(23010399003)(376014)(82310400026)(56012099006)(11063799006)(18002099003)(16102099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oak9/g8+I+OPkG2PDwLkQtVYKbrmPF6BI+ED1V78uP1H9erd+pvR7RoxT5/xqM239ifU7PIQ22K/mEsPgJuIJ5Lerqf05evqhYSTsxIqCSaK0htmh0kRyl/zGFvoeH/d9xVfCcGgKsTPV2wDjtsEAzyI54rpbNamn0GAXwd+Jr11O+WMjdPEuH6LLC+Wa2Obmfj2BhaNel4EL2g54sOEMABE+Lb4h5zR5ISSOXKh1LzNAad8wqk3iLI4Gm7BEFWS4W73BhIcd3hwNMHO0ytnzmq6JDkFyHX9IuZPmvzPBVhtdtIdzeKRa1N2JztsDK0NHGv9V+diEKPDK+Qut16AOISrozDaor4XKJP+AQaeDzt45IYKX/tNjtWcnU0RC//EmRfulRZWli8jBqRKSY1rn0EtXzAeEs9IQnUBQbV6wSFeRSF+IO72DQTujTNuAmjV
X-Exchange-RoutingPolicyChecked:
	i6/dVGIPyT3Y68NjOz0qYHJeWqieigLWRWnRH9OzXfwBzzBhxQKCAKa9j6fFVV3tzVjZWBPaEu94hA9X9qcNcpK+O70DxHE5ZaqHeJ0rjqJQPI7Iysz6MEyIEyLArebh6ZYGv7Y357N+Z88VVExR2ZF0x6fy1TsRDIKbN5Ed6+xiD/qpKPFkLk9x42Fexx5QYrMG6zzcanGtZKbfqrucDeHoPSHcL2BwixXSEyzaHFDV/qbT/Igwi1BigkCF0zjYR/Pr4gBeWrlU5Lnrpg/6ExOXgb7g/Ztr7xU+0ZZkCq5jCXt22VO/QGPajKb2+dSo2bLsaqmSCfSD799QNMzegw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 16:27:44.5646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d368bd41-0aeb-4d70-8b4e-08df2a1013b6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY8PEPF0000005A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3847
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NSBTYWx0ZWRfX8B/h7naabuvt
 5wMxcGUL56Rn8dWSBU2ECGfVRbumIRsy/9MWlpKPjnqVpqjYLu2sYoQ8PmJK4oKAanxcQurfF64
 D4uSGdZ6a40G+KcBwhULZ5qS5Vc/cmftr/580jlJpkEvEP5dvfx4MDWTuCcQ72ByGAqFtF0/88l
 LzfjHwdxgw0xNMaIi7HcGvZVzjgRJ4pKvunJpmnKdV4WoslDVPujmSu/pZiCwNKeQhE/gPMNLmr
 HVzB9iX+345s3DodzYr/5M4juwwyuQFVCztdZhRLosixLW/Rd8qdLMGjDhCob2coD9CWRurW75U
 K1HNAbHzdBWSdicOVyGruhQyheIavfbGmjk42KRHtTGoQ/g/Mc5Q/66C6MaQQRKlHj5P9lbb/84
 sbUhJGtdNiXph9/8HtXtZ/Y+EmndaJZZaVe2uJZfggaXulrdo2IGdmEZKcKPCYlLW+LD387PYVp
 BXM7NgUsiMPNdqQeBvQ==
X-Authority-Analysis: v=2.4 cv=cKh1IVeN c=1 sm=1 tr=0 ts=6acfae04 cx=c_pps
 a=Dm0nEerhk2+Yr7xs+kkSBA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=uqGfhXZwpJ8KL_Jya50A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NSBTYWx0ZWRfX3X6hYsFpNPdz
 BcxQuA0gJdsUgUMyw1V8o8u2JIkOPaiLKy3vzNJECJLdNU685WwkWHN+JelxZYRGPoG6ILQtJEX
 Wngloli9QZdPPUO7ZQ256dpSnQQOd8c=
X-Proofpoint-ORIG-GUID: jx3hrxg3lScBQkW_ae8FygmmehATyOb6
X-Proofpoint-GUID: jx3hrxg3lScBQkW_ae8FygmmehATyOb6
X-Proofpoint-Spam-Reason: safe

On Mon, Oct 12, 2026 at 11:55:37AM +0100, Charles Keepax wrote:
> Currently on Intel systems SoundWire drivers can't communicate with the
> device during driver removal. This is primarily because the IRQs are
> disabled before the driver remove callback is run. The result of this is
> such transactions timeout causing a) a lot of errors in the log and b)
> driver remove to take a very long time.
> 
> This issue affects cs42l43 and cs42l45, primarily due to both using
> regmap IRQ.
> 
>  soundwire_intel soundwire_intel.link.0: IO transfer timed out, cmd 3 device 6 addr 5d len 1
>  soundwire sdw-master-0-0: trf on Slave 6 failed:-110 write addr 5d count 0
>  sdca_class sdw:0:0:01fa:4245:01: Failed to sync masks in 5d
> 
> As regmap IRQ is torn down it will mask the interrupts that are
> removed. However, there are many valid reasons a driver might want
> communicate with the device during removal, others would include
> disabling jack detection, putting the device into the lowest possible
> power state to save power, etc.
> 
> This patch set attempts to address this problem trying to locate the
> reason interrupts are disabled, fixing that and then leaving the IRQs
> enabled for the remove callback.

Apologies, but I might have come up with a slightly better fix
here. Please don't merge this version and I will report back in a
few days.

Thanks,
Charles
