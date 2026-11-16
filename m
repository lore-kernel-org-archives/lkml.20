Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794823740;
	b=vzbWWXBQMCfTCmQ/lf0mNtoczeYWZ5ECAdQ+O748LGiFX4RMCkVAnq+856/tyh9zWfcf
	 /s1QcspA1ErCB3TljFAzbhLPTipfKbS78DWiR20tYjgPiwlMi2s3Ef0QKRoBD2O+DK3UA
	 HSGIbp81YwWz7RGjF8yp0FJuqr11Zsz7T7vBCoxIyrW25SHHThBy5u20c2STcigUykoil
	 La+UouP0FC/UbE5k5buAIHETPGdbgtqdTPzGIwok72zCXiDsfo8m2KW0W5OB2jC0XY/J4
	 sbHSn5D1CwFWhI1l8ygDnM+8EqHZCd/eGelmhitY+yAc06wAJ/unMtveN95tjQCEqJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=ixcBwtmlk6h68fHcFX9ZKK5u4DD9h1A7UsG801r9/dU=;
	b=opX3BmYdRQLcG40g7O5A2LgHDGcwQ4E8Iy32BqQ5HmJGM6+8ZPxNKwr/nNDVnlBCg2S2
	 4CsIDpL+tPzQRTgic01rMyc27bvDXhbms5PhBUIL1K6/E8Ims/f6IWfITHoHp56Bl35rl
	 gUU3zzSjln55h3QwTlKpISSBOjaaP5Uc3KuTG10H7u7QR0IhLqC5JwdyU0zFrCTMf3dKi
	 jnPUy3EDi/A1+p5dSUmmxYj9ht3O/q5ZYtaxfEZ8Sdn/7h2/W4A7ZSUp3y2+aQT6mTNvS
	 lmoPJJUehdkpi8izF3TwO4yYbaV2H56TPmFlZoPynl+7avF87dY/SZ6vVSuL7L1UL1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=GUfPL6T8;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=uVYQ7YNi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F27606A323;
	Mon, 16 Nov 2026 10:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05F27606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=GUfPL6T8;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=uVYQ7YNi
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG8VWZd2903548;
	Mon, 16 Nov 2026 04:08:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ixcBwtmlk6h68fHcFX
	9ZKK5u4DD9h1A7UsG801r9/dU=; b=GUfPL6T83dvrRmLeoQgO6JZ1dDSOnnBODO
	dpCuNbZpbGNjdHDiftd79tyFAETzoqFC0lhmHYP2TeuR5HsGC4uB3UH8jQgjgzLb
	1B6WoxYZvgpOy5TneIToGZuB0goYjw6uy2mRxLcafaZuxlYk3aQW/RsNNadrHBK6
	SoUM2fOlAK3ry3KakG7GCueNfWcLWZxmikYOfZXiFsMPna0d8sKZ1oj6i17t8Y+Z
	Nd7jXqsqfn5thgCqArkD5WZpJMBTC4vMToQed4gXyxTleEiocO/aVoImiEgYqafR
	QjDq5CxCjoi+a15rZ+IjoRgafjJ54mBDIgroEhwNkbr7t6zS7fDw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021099.outbound.protection.outlook.com [52.101.52.99])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hxmxs234m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 04:08:40 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBCRXUO0GQYftf8C3p9saCZgtC6+s38Uqg6nrz1GOOdShCmNZ8CyQwdHg4JPe9h7owRin5tzvED7RwrQb17gWBG0+TDXIMRXxsLXSakV/DuT3IA1JXfv7N9/PsW9HpIwxbIk6u75vtApq+58z3rBoqmr6EAb9YUF/WfQ+0QLlI2VKEFL58X2MKj8PBpT0venheqHfTrZ9FmmfiA6iUGby1b8nVmiXPVTD2krIT4F2c/8vJlSJdq1VXOxXlobYDk5HjTtd51iwdHCEe4z7vUdx+GEMbfkd1L+bY892iQgn9mT5va6V+I53ABd4bDD/CmQ2z5T97spHTqWNl0ljB2Rlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixcBwtmlk6h68fHcFX9ZKK5u4DD9h1A7UsG801r9/dU=;
 b=nt9Yxa8BlSdvAbnvL3O95oeL7rNRDq7sC29osqVg9wqYK/CsihMUy8pqx8AY4S1XXEYHkKN+4R1UjHqdG6xwiNy+ZGiIAmZ/z87lrsgma7P0cHw/SABeqP39+SRfcbx1uYu60I4yDAWnli27D5Zfks3El2Cdzk9ynrk0VadPqBzsMIcvVksCyTNV4t/Gdc9UAYIMl61mOC3o5Cqf6lmql+SBfbfFt6CHsQS5CcmTQqbQGRjrqiW4gpq2enBED+PKcik8yCN1SNJPvTJczOhRypkqTIC0CW09kU5jv+KxvmseMRVGfzKHGBMAqNO/U7aF2+JLDWiOSrBuFmsBM41KHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixcBwtmlk6h68fHcFX9ZKK5u4DD9h1A7UsG801r9/dU=;
 b=uVYQ7YNiTmiua6L3sluDvYrEXLFuTPOgwdoN1tPBwRjZJBgM29iK8yajxxp818qc28xiK/K1mx+GIFkT1XrJGAKOTH5/rR0jd5r5AYw8u0MSSRmLq9zQkLbHAdesDYPAY5YoIywx5nPCrE0HrNca00M9o3aV+5rRg/mjV2jXwPY=
Received: from PH5P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::13)
 by CH2PR19MB3752.namprd19.prod.outlook.com (2603:10b6:610:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 10:07:32 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:34b:cafe::46) by PH5P222CA0007.outlook.office365.com
 (2603:10b6:510:34b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 10:07:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 16 Nov 2026 10:07:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1A06E406541;
	Mon, 16 Nov 2026 10:07:29 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ECE79820273;
	Mon, 16 Nov 2026 10:07:28 +0000 (UTC)
Date: Mon, 16 Nov 2026 10:07:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 RESEND 2/2] mfd: cs42l43: Move to core detach helper
Message-ID: <avrV3wz5jISM9Fne@opensource.cirrus.com>
References: <20261102164157.4010002-1-ckeepax@opensource.cirrus.com>
 <20261102164157.4010002-3-ckeepax@opensource.cirrus.com>
 <179370028929.793788.4070701675472724398@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179370028929.793788.4070701675472724398@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|CH2PR19MB3752:EE_
X-MS-Office365-Filtering-Correlation-Id: ddaf3886-d043-4964-1b9e-08df43c96d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|23010399003|36860700016|82310400026|10067099003|4143699003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	y916uNT9jlsTvhehMbGTKe+m5mJ6EDnmIdtTpT6iuQqlqkGLvG/e199KerQIA1UfbpSNbWuxH2Lze9p/4zeHqPysw5advMVfmUf+5XjO8f5vwIySd3TUF7RORWj3DD9iqu2lwjDMqBdworRduS9ebODlbotomqIA/dv51tWNEPesVNjYklHMR1weBKxIsz4twjARyY7UOUO3wY7LfF9wPQruYDSsMGSY15/5ekfTvaB4jNtqGhL9iaQGBrAyWM5b/yhc6QQehlqSCcA9JZfMK1kW+oG679xxsv3txPKhxRKt85CeCAx79X9TE70UXhkM3Nz/XAoV1asZjk5OeoKvf8cuH/vR74llbkH6eT8ppd/enxRK5WRuErUgHleDOPBKwXQ3C6vwkSzyWvW60nBqM98qhjEtamAsJe9vIKn8uNcik+OGEpjRI+NfAb4JTrbtpA0I3In21/YMnz8l4z7Ftcj17qH5tn4AgPSlL7mQkG2fvJe8/BThqxhypOHeFuTWDzWK6ER4mkft+WvvCUKVWvdJvUEUtf5a1F1N9VQ2IoMGzASlHPVWqWooykgEJW26SqnRdmfCbjsLUZ9xSXRQPRHt/QAjw5LnIx6Mf52i27deUnvpSsjAvZmOTCx06bJABmsGGHFEvmTi4lB/oBNQ4D+vdb7ONUtgdczsilLsYOjB5jzIYt4MITXT+4VNyCN4
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ya1W4XLuPztygvSZb0OU6iQBi/jFsKcIVsBBOJbNkyw89xpugGcJ2oOAzWO18Bf+UxLtq7ZvdfbqzoNd7zkyCZaCHKx2SnRBIvAGphZYz8I6aZWQnaSSH3pOfkKYwQ9EDtC2KCkDXDLTAMNMrW3iiKoAVU5mkQzu3VHx+8m2YW6fEhClvmu3F5gAo54q4ifubRFd3xem5Ns0l0cTck7mYohiVDrECju68Mplri3RnmXRz1z18WHBgpwFaq1OXfkDGtdvqTXA9xl+ix4GcP39ifJsGKpq+T23pz6hdBHzE7lRONrEmZ/cH43ccEs/2/oP0+twc2Bviq6PYSDzg2WnmNdfBYhsRdIW7ROfy6ngnT8Y+hZf3Kja9nRn8gP/ZmSMqY82mkDF37CQ4bA4D2gMHSIXyqbeYD/NQOW9sdz6NXFOItv9+9iMlowFzAFWAMxD
X-Exchange-RoutingPolicyChecked:
	f4gcg9/DjqPHXtyRb3AXZPJ+PzBQJVp5Xwl1/IiUJRNnZUEwLIcGRIvns2rtDJM1f2pBrHaeU8QNabPc6iCEcMF1ZLJEaOh8z93FelyXYJHKRv5yCQ+fdz0oR48sVqoy760Rz9wR+zTVzvmg4r8THM8XGkF+mfmBLNuf3nhEU9mQBcpo1VEifHn7kVOkBKTOxkvlPASOrTOwQ3DmmvAfFKcve4RrNTwBusMDgbp8Cs60U6bggBmi0MMj3WuOqOSx0LQ8D142QyjjoRxrY9f5VpdSoPYoIpKGpTU28I94VhFubbkItZ+kaYDqbqkbVDqFZMQBwaTxiYNiipPfuFqomA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:07:30.6950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddaf3886-d043-4964-1b9e-08df43c96d38
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3752
X-Authority-Analysis: v=2.4 cv=bbX+w+PB c=1 sm=1 tr=0 ts=6afad629 cx=c_pps
 a=TH3AoTo+Q7UfKdNiR0rSsw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_HRWddgdQaYcXc59OkkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MCBTYWx0ZWRfX3GOoM3Hu8gmD
 sZiZSYKKy9Sm/yw75YkTPzBGQqRvABnNPzVCNZR2U9PasZlb0jPiep/rVZ2qkDqT5LcBjoAaE7z
 I2cYF7bcfCBARxPMheCEvbHdRX6Qqfg=
X-Proofpoint-ORIG-GUID: y4zvaj93Bp7--tJn6RYyAQ2m1Z1xR6cT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MCBTYWx0ZWRfX9Dk7hb3hC08E
 A2jm4nJwrfK8ylC8Cz9BGnERtV5EmeaEiMUoUdaG8ElYcBZgM41PTkHCYl+RjwIierctzQxdtxL
 BOSzdwnvZyde1Kr5MOMblGEzw//RjbpS42hgkHcU7HOps2w8zU7sgmTz5aBnZHeF8Lwv2NB2fOL
 AFkRAhk4GBYxbJe4OeenHjQ1otUXijf9XqgizKnkT9hDGauz5uHXo5qUfPchBNlRM1c6A14YVyX
 AVbTZ89f/jcaYv97+2wwOBK7bamD4jmiicgv6S0GVsv6u/XFzinHqJUhO2hCYz9viQurIc6vCnO
 pQkyHEiY/H3TEGZ4uqEARp0bRhKTKA2POFMSXSIiJPtIizeFfNCEABR6on9/VB9DXKt1ti3kp9z
 F7akcqw0Gfa3gEB5gRtgNGz2PEyCLfs588D2oGJqEII2OK2HJ0f0GhredbZuinv8Q3U7bvmqNUO
 JYKSqWkEjm1OkgexfZA==
X-Proofpoint-GUID: y4zvaj93Bp7--tJn6RYyAQ2m1Z1xR6cT
X-Proofpoint-Spam-Reason: safe

On Fri, Nov 13, 2026 at 07:30:29PM +0000, Lee Jones wrote:
> On Mon, 02 Nov 2026, Charles Keepax wrote:
> 
> > Now the core has a helper to signal a device will detach from
> > the SoundWire bus, there is no need for the cs42l43 driver code
> > to separately track that. Switch to using the new core helper.
> >
> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> > -	reinit_completion(&cs42l43->device_detach);
> > +	sdw_slave_signal_unattach(cs42l43->sdw);
> 
> Isn't 'cs42l43->sdw' NULL when the device is connected via I2C?

Yup but still safe.

+static inline void sdw_slave_signal_unattach(struct sdw_slave
*slave)
+{
+       if (!slave)
+               return;

> Also, doesn't the comment in cs42l43_soft_reset() still claim that this
> function waits for the device to detach from the bus?

Yeah that is a fair point I will update the comment and do a
spin.

Thanks,
Charles
