Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036DE37882B;
	Wed, 14 Oct 2026 09:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970385; cv=fail; b=AoqOierNUsebfzF1GYpGRhBfu14C2l5jmZqzAUPAEOZ5+E84ooKFd/FBps33tH9yL5qK+IcG/0TfNTVNnWBRa1Ab7A4riWSnIcXi1g6kVM4oRlf7KfblyNTOtky3s05K4/1txLOT6WmbRDbag139ysZ6riXiWf3JmqpmdE1RxpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970385; c=relaxed/simple;
	bh=GzR3gctOBabEoS8NfRPQGFNqiHW0DQR2lva4L0fxwlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYJepWlB1mHwEU6awRvJmHBYYTIcHip1pe3oWQ4YPfaCnj9rwCx1uuIZqveE6xuuON0Q5fyNwo1hftIhAiqR7T/DezfClLPpo+5RPhtl23y99G+tVK7PuUdbbBsd5vQFTkFfDwgRmsdEJQv2jgy7b2K62OVlVvFCq/xS3J1uCB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FRjBh/1n; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fo2HrRBE; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FRjBh/1n";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="fo2HrRBE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9H3eG334589;
	Wed, 14 Oct 2026 04:33:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=fJcnPDfzwe8fBun+Jf
	YEgSEkagRHbNxV4cuc/hgvj0w=; b=FRjBh/1n3fpNx8chq6w4SWzBejX854d7HK
	LGGqP/2RTT3u43XBiItNrK3Wb3IGcDpwvVc2CTPO6eUGO0mBTg7Ut0mmK9PxoWQr
	QUcXygcO8cmLjRF/ppaGWopURZbmDl3sFCrhRkR7TK5dAH/hCs/QWna9db+y8yQ/
	qMrYojZxyAaZSGtGh6sLqhxx0Y2Kf11O76jzGb9HbOqx9uZNdPfXfoOGsNKOJJBU
	irGIq6aqrJ23hwAQJIy61W43Zofvze2QBMOOMjwBEGjbUTkJdLQ7cC0GTI1+2fmZ
	TzZzioBiPNBg2JsRgqW+uACaciGlSEbzrhmmVYR6gj4EMeFIzzCQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022096.outbound.protection.outlook.com [40.93.195.96])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h7jrxdc3x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 04:33:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Os/v8zg6nuuKHjZiq9GFZOBqKe8k3boSsZjzBpZWWfA5kfrqJmokB7v35+wt5coXY6K0P9MNTFCYOeEXdNWHzChoiSdveHEhgrrCGEyHbbNHFgGg7viNvFQ57h25yU6Fq+JDAv28aUCCqtQyU15jUPvRhp2IfpepoHPDt1lzdXi7aGMP+oaMakwuQg42omMv9dsYsZ9V9/rPJhT7Gor4snipcjO3TSQz++9UnkijWBbZmgRXvIZdscSEPFjuHJHgQdBEJhLNMF7rDGJTIMmoStMZW/RDV2JV6JdMbDdWWXtYSUHBS8+8ELy0oJ80MYIxHZhETEMKSlJckKYuibG8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJcnPDfzwe8fBun+JfYEgSEkagRHbNxV4cuc/hgvj0w=;
 b=QZ7nS4S25kUVjqMNp28n4GzxqeYT9UCpNUBBWF2aMT7I564XJpfC5tZzFQHBxP9J2itSpytGg5TMVTw+cJpgiHIWaxzQW4N4E5ahNSrG96u8DhyhFEXcZ0L94pvCTMIIQd2ZdxTBGNxKIk9rX7Zmma2/iTmLng9i+QoxUPFe5um0NNPMmMb9mJVbhpZ+18T9nxTIkSGu2tsQ4tcddao74LPG9H5iLqjCb/1GN/Pe0DNt92VdnJ7R/zog368XB+eRgYXYdSCU242swiYdyKQbAt1yRLLYzoGywmGnCcTOa6A6b2RJGvjJV4Gx1RR0ac5TTaT0UgOwKQyZgrnpqbAt/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJcnPDfzwe8fBun+JfYEgSEkagRHbNxV4cuc/hgvj0w=;
 b=fo2HrRBE3wvDYknCI8diYIkLtDcvVyo6vAn6pt7SkeMr80OY1ZoeFcuGBgosRug7hgwwBzVO5fyd04Xlqs2sca6Yd6GyOtmUlC/fZ9pbVMeomMkS2Zz0KWpr40RLuA/EiMZiXjleJdP42VAGF3dDjv5nVporfx9NxLQRldU54KU=
Received: from BN0PR04CA0110.namprd04.prod.outlook.com (2603:10b6:408:ec::25)
 by IA1PR19MB7687.namprd19.prod.outlook.com (2603:10b6:208:3fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.19; Wed, 14 Oct
 2026 09:32:53 +0000
Received: from MN7PEPF0000014A.namprd04.prod.outlook.com
 (2603:10b6:408:ec:cafe::80) by BN0PR04CA0110.outlook.office365.com
 (2603:10b6:408:ec::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 09:32:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN7PEPF0000014A.mail.protection.outlook.com (10.167.254.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Wed, 14 Oct 2026 09:32:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 41DF8406540;
	Wed, 14 Oct 2026 09:32:51 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 320E7822551;
	Wed, 14 Oct 2026 09:32:51 +0000 (UTC)
Date: Wed, 14 Oct 2026 10:32:50 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/13] ASoC: codecs: wm8990: Fix definition of LOMIX
 AINLMUX Bypass Volume control
Message-ID: <as9MQtj+keLEu49L@opensource.cirrus.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
 <87b3bfa7711b61d89c21044d02fb3242dd934385.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87b3bfa7711b61d89c21044d02fb3242dd934385.1791959026.git.sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN7PEPF0000014A:EE_|IA1PR19MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a83a5b-4117-4152-a670-08df29d61e98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|61400799027|376014|82310400026|11063799006|56012099006|4143699003|16102099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	u2huBccw4yGdP4qM+9HqFeloS/pY9pGOi/SeDnIhuhbfjVGp6NP8hP2xC2QP5kV+gC2TmDDZ9XDzuWsjAhaPMxTZXDU9apX47oViPcVPtpCbChonW8Yrgbgzo5ByxZ0vErhzBQ3ORozKIoDLIhdNdporA1zTENJEbRrW3XumRsn22UPGcFEjZ0EF770ZABNlOBXTAB+DWirv1BB3wlmegsqT4k/oU1kDN9bLOMIBUmRmDHaSb7PpHpaYn6NJycdUda7l9exZrLqvTapJmCUssDgbhvNI/RjheUR/oYUltGiWJJC1U5fJR8Avydw8gOTAYULjbjbIWO6349Q1pSV3OHE53okn6amWsFZ0yd7x+wZoyur5whN2SZ4cy2Pu8gK4DKEJhe2UMipaWOsnSIaj6WtMu94Wri+EyAdihFbePDSZWZ1NuSSBuPEz+/IVHdVlQjCkoPKzoUFqFahFXrdG7lbeRxDtmuw4W6foc48aNBXSnQV1kQbrsnwnTxopBf36oiVNokG6sTJMJnI0tRlL16ArIaNQh3Ei0qAutbDchZVX9lWeWuOLj3oNmptW06wN7Oa0gKv8KWGtp/IJEoz4cU3koKeG5uiRedqsKsIb71Jam3Oy1Tkqm1C9uuOjQXRvo8+eZBhmt2EifwAhe5Kagib096OrXosJbssQXncsZQNM/4SoDPJ1Xv3npMOu8QQzQIpEyL1YmVz1c5whohAlxQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(61400799027)(376014)(82310400026)(11063799006)(56012099006)(4143699003)(16102099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W4ZJypTU2jK7576QwDsNqDgneLsl79reN3ROpZBewFg8rHSiu3JiRspxyBw0VBOUD6W4KipZ8oXv1bJ/NeNRdY2p8CQ9JhVzsT6dKFkLVF2FzEBSpA/Llcg5BZ1r5oB3xEdQMEh/r711mUOmTSITK/rU1oDRM04rn8ZkYOSXHgn5GSh2Oq9XeyrJYKC373ybMmljWAtDG6NXQpg/iXFmM5SgfxaawqvXxddVXaLAAD7SLgcYsUcgBOqtzNmQu5VtO0C2SLTP3cxlIRAqbjqArdhYz0eY1OUn8SQmJca6Y9ZDr6M39vUfO5OKKqVDjWvmQdkj01mK2ccbOydrF60o6Ep0T00Gm/g1Vmud8b1onbLxAedzRXwoKhT30sKvOB5Ym9DuNmnGLXEBsm2y3fbcKoGDeNcNILJiBCACkakJGDvdiVCGOlNupE3DUEi15M8z
X-Exchange-RoutingPolicyChecked:
	oILl2onaFVnNo2NKmmmiYxWqylUeTzTdKGsZNPr18d+gRtaZCCyGNa+x111104ZsttrQEKuDyWCWZ+SUSpeKrS+nJG3Jd15Tz7EApgq/OA0U9ZzKHF5APlqEXwShxha8f6mvNxpR/yTxMfVQtREtfYSps3dR08ozk+FZPc8rKtT1NiYESTYTAcCxsJLuH+IWFbpKVDzEADYkzo4rgwx6njAzu2NsU6cKpgmxVSnX89P51dIIxjg4HxhCkt1+RpA4DNV279v1J8o6VEh4Xkw/TrCFkLRAoW+81orG+kYD1W5Vvrr/79LT0UzCFvLMDO/wSyA/9xgOYBRhpUbt105zHA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:32:52.0888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a83a5b-4117-4152-a670-08df29d61e98
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN7PEPF0000014A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7687
X-Authority-Analysis: v=2.4 cv=A/n5rKWG c=1 sm=1 tr=0 ts=6acf4c4c cx=c_pps
 a=DKZP5JzZ8AWO9Vvd/xN3Jg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=5BaI5pJLSwOFNK2hHz0A:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10
X-Proofpoint-GUID: 4KvSNKs1wTsX-mXrCWT0PglTmNGYt-Qo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNyBTYWx0ZWRfX1wfbZT2eg2DA
 UqnON3ylilqtywHhhJyD8dacjCyjpHAAQEZJuysBRA0mnHygWxKH0IIFoA1ERQ3dk7U3c1b+vNz
 9Ch05QcQXxOg1VQVaiba2mcWnNvCbRc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNyBTYWx0ZWRfXw+XHRWopQquX
 B2lnZnaqSecglJNm3MtdqjV5/BwNi03P6MZHgKBwgDzGqyzsE0N5D82LCGKSeUQNApBrzKcDF4g
 zM9zyWrj9+MWH4Jl8CHRbLiTSfZFUDIOGysmZNBcNF+/VBTBnikjQhIWtR+uLlbQ4rW19Jz4Rg2
 ATgWQvOhZyKoRHZt31isqmP+o1j4Orj0IACd1/17I42CcvJQyaMZlmLS6b8o1SO0vq1oPLg6QLx
 0J6WejiYwW6CVY9qDzYHym4jY0zWfjgI7boDpkSVtnTZD1mtmS3vfdIbBCERsciikkCIfgvIZQM
 hAnvZCCdldxvOXt8DT4uOn4YSBWAD+biey8/TJ6t4u6QIqhUVJvEVRCsQNxAxIvje6smOPrwLox
 nEieOtGHEab+ejjlfJVVgvROo1EiJvQFOCX1JKOd2yfFLR20STnGn340g48lScH4v31Hy3FkGwp
 7ypsE+MAdedzBgjJu4A==
X-Proofpoint-ORIG-GUID: 4KvSNKs1wTsX-mXrCWT0PglTmNGYt-Qo
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 14, 2026 at 03:32:29PM +0900, HyeongJun An wrote:
> The LOMIX AINLMUX bypass volume (LLBLOVOL) is at bits 2:0 of Output
> Mixer5, not at bits 5:3, which hold the AINRMUX bypass volume
> (LRBLOVOL).
> 
> Fixes: f10485e79882 ("[ALSA] ASoC: Add WM8990 driver")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
