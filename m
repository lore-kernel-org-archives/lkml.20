Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDC04E0B9D;
	Wed, 14 Oct 2026 10:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972111; cv=fail; b=Qlw3dQ+tCrJR9e65QsHFPqocPUxYqYE6bEa3nQ0siKAeBXnioc/HhHKWye1QOuCnN6d7to643sH6azrrtA9IVMK2efJrc1n3U2dA+kgOM/UPsPKiyE32BoH3Nl6/oMB+equQ7hUD3sOmw9yup33Z2In6RiWPYk/ucfdD2D7y1sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972111; c=relaxed/simple;
	bh=3iom7o1C2pPMhcu/Dib59ZcHv+EdRqCMWPKp3IQX12w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RT7jazr51s7uym6goN+gqf46F9nUdUD+3B3PDLAazsF4O0oz+7RWibWRedqhHatZVDUKNzdB6lQ2Tdg5d9jwL///izK4tRKBzUEH7nGt3zdJIlmn6cgcmDqi58oUoPEHHXlASp7bMucRup1vh1/v8httQvoULyo6WZZY8VmwrWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ja6fmgoy; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PqwHEnPn; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ja6fmgoy";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="PqwHEnPn"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9ounJ388619;
	Wed, 14 Oct 2026 05:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Bo/C+8E/U/0urGYkk4
	935M0fmIE6vCXVwtPxQ+QNoL4=; b=ja6fmgoySI1SRn2xujR0pdeS3G/hNuYYmL
	tnRd6hS8d8kvoD73Ke7XSK9/g5pYexT5TAfzhQUiAFDIwkgI7dcYsd+320fZVdKQ
	RLGOnGyaVb/RzJMwqqOgLonflHYOKyb+EIINwS4uCYuDNu7hnnygm9wRJY/2xJTi
	ydlnPT/udk1nCmKL8FVsl6l5wVbNUiEcAG+axvX61WKCgAMp35qTK7CPEel6HrmR
	MIwc9ehhPnOwgLyQnI/nzan4Id4a4iBnXOrKGC9Q1h449fy2s3/mqi1dl8euWRuv
	rj6o3K1LcjRRv/LjkMKM00VCr64Y/qizVlRKH3LJM1aV9ClpphGw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023077.outbound.protection.outlook.com [40.93.201.77])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h7jrxdd50-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 05:01:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0YFdLSN7mHutTkjWg+wwTbIokSOtQcc5bmoi+Zk8HMhIHgGmdkOUjIprbiPjWB6PdQMYuqCWj5H0KeObPT9OJgJ0L8oTSQbZQQ4YRPEBO8YHRMW6kJQ1ezcgeQych3xoramPGsCBx3YqolL2aJn+f7kKa3bNVbNyhB5YiRb4YPESdBAAPbHvPGcc7sBruhqkKKPV43ln4iJ6DHaIfl+zGXZOiBJOcoLKNgj1oJcNd6vsu26Tcn9ol321e8HTE5S6L058TQsGIbSDKjiZhf1GvrkXtk1StdaL0rF1bLGS8EptemIMTbYync4m3nDJaqajhKqnG8y45YzdC8dFBsQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bo/C+8E/U/0urGYkk4935M0fmIE6vCXVwtPxQ+QNoL4=;
 b=ALJwR+hApIHG7iNJePd4wTMnf/gfXsw6yVW/iCoM9oC3f9hHJGmf/+WkfcHcBcdAxTbLHsfogfrV4TtbPLqFCB5no9MhkMdcE8PZh9j6SLGc1qhOkikTKeFEqyA9bB44bbE30C6lZR1ADC6ixlqO1V1j2W61s7M8aDSE4shicnQMz6Zz20UwTZzlA4d5yc2HIcJRO2gFsEF8O054qMkCNHX8UJ2t/3AXRS0kUWEaV3gm3fT0QL15OGcWWUt79PNJFArfxnpxRgimJ2NhRei9M+s+nr0i8p1Mb6kz5WXnASqaicLnVGQI4wiElIGHLiwkgjJyEmLHpzfklJ92H5ByZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bo/C+8E/U/0urGYkk4935M0fmIE6vCXVwtPxQ+QNoL4=;
 b=PqwHEnPnPbxfjC4B2sXd2LLh4wp3g5c1oUMjqT0yWVTNXttIR5efa3VYnqS4fFTOhZ6f3z3Y4lBnQqj7nF3qmyPjEEG28GoYwFWdHF5QYs/231NlP7BgCKyrEvUR7B8suKlYjsrf0iQXkzesGsOc7LAiOB0A0uPiP1icHsABx4U=
Received: from CH2PR08CA0009.namprd08.prod.outlook.com (2603:10b6:610:5a::19)
 by CYXPR19MB8487.namprd19.prod.outlook.com (2603:10b6:930:db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 10:01:40 +0000
Received: from BN2PEPF0000A802.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::32) by CH2PR08CA0009.outlook.office365.com
 (2603:10b6:610:5a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 10:01:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000A802.mail.protection.outlook.com (10.167.245.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Wed, 14 Oct 2026 10:01:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3F910406540;
	Wed, 14 Oct 2026 10:01:38 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 296CD822551;
	Wed, 14 Oct 2026 10:01:38 +0000 (UTC)
Date: Wed, 14 Oct 2026 11:01:37 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/13] ASoC: codecs: wm8750: Fix definition of ALC
 Capture NG Type control
Message-ID: <as9TASfYqaaQu2td@opensource.cirrus.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
 <ce530dfb932d9e8def75059ab9d669360adc76e8.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce530dfb932d9e8def75059ab9d669360adc76e8.1791959026.git.sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A802:EE_|CYXPR19MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: a14ccea7-288a-41a7-c23a-08df29da2447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|61400799027|23010399003|22082099003|16102099003|10067099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	pqg4gkfOyPzyicAtnzALNI96lHQ4Jqy+ykqGHliZNo+CDQNs8EFPp4wbLgqy+TKPdkafIrkBPA5CCOTNRUQQta7BeZZJInpOKttO/G4MzEHwrBc0gMm6I4drPu3tqXe8qTqQGQna7q7hhswu/lGghWcdDgug8I9ngZQPY5QlQ99dQk7udK1n2SRXWhnWXDvevZFdEMr9d3zkI0DpEKfKTbiZdx2bGU4afMvOHvFt0y66KfmCzrKJWHVxzLU2KRjNhvIf2yZYf9wvBn24oz134aQS86zFUGM2yOMuB8dZX3Pt6Z+xPwXfgHDPadFUx6Gs86a3BkhtvFe5N/eUkrKjEhwbjodz3BcJFFQp3rIS5d2su8mhfTfDuk73cz3ysGocvOiVX/mMMEQHlNSbw1a3IXWkNQzXe58DPqndQnqJ/3F1zoyMlCRCcYnWFLZDtAn7SUzzYcTgKzuMz9wn4Xwnjyw96R/a47axbu1VedPE1l0Vifhu2pnF1L/ARDkr377e771RKwBV7X//Wz5DFe+tdtbTw5O2DZUgTal8Aa2VZoaM1p10g+LPJSAk2YHFC50dHslbpRteXD2+1ZN//5ZFehLNirOoEd6V4Vr3echS93K2JNYKx1vekehGlmSKtWwhXPUCfytHOB+J+waYuxYSI9iTIjuOn8mHAc5tyQT50bf+8KODJmwS7b+ODj57BN9snqnpmZjYfzxo38xaa643xw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(61400799027)(23010399003)(22082099003)(16102099003)(10067099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lIfvZIakxVePjW/25U2EIvz022bOiMsEbLpaQ5IXKlIY0JD2CfUcGNqrvXmtYCI1OiAgzupNRn8GOrquecaMEVFezFIs0QAeMMWEyzZ4kLGHrlXPz1cmXNu7hk44ynS+P3BnUhpK+iUyZLQJ2oDoLy8X7Ln2GLB7VsmtE1GxVIq88VkPyNVlPIvPQTiLa78rUf+U9QbOc6wS6Whst+Mop3pGjY6gzkvz/5aoAskIqd4xgeLZnk5K7/cbVt9XPkbPATkZntmcCqnR6v3vLKSjU2evoV/NGgefI+i5rV6d8FMGg/l5qGmR+nNPC3ZBZvoq/z1LC2/ZROdDsHuTx0PQRDZ24e2HOz3FOz//Vk+ZW2F/Ysm0RAbjBgXVLaMg0DddFYRuMACUTQWdUlv5LVp9IUDQ4MGqwCgwOGU8bOLDNQDFVYoPHn4Q5hSX+KingThp
X-Exchange-RoutingPolicyChecked:
	WE76u3VkHpE+QFCyR9JU1nBqNDtt/KKkt+M9fWy6ZQpTyQi1AG6UXPLpnYK/V+jiheug47Abpf5pVgkt21tt7Sv+Wcwk9e+pETrAp8Y1/5T8+I5wgD+Yb9aTNspZ0jJYnLF2D1kuzTz9q//tpA0qV3vVf1uBb7UU9RIqrvVmJtnyyD76V2GzOL963FhTFTtYw3BjftkDQuZyq8Em+R95L6YBBu0SbYuHlEwXR94OQaoSqs3oeU5Fqyc67M65oPBrpaXEl+Q0Y3e2CuTbqis+qCB63jQYZQ2uzUME0bT8+Khgh6oYZwQULTaMQ3wgVCUAeQhqK1kFQWBj+LOgxOfe9A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:01:39.6056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a14ccea7-288a-41a7-c23a-08df29da2447
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000A802.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR19MB8487
X-Authority-Analysis: v=2.4 cv=A/n5rKWG c=1 sm=1 tr=0 ts=6acf530b cx=c_pps
 a=YgmEgYFPUO0vKsAsXG+6iA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=8bf0Nuo0qvq4LgIR4qsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: D_Tn61MDYGPjp8WqnShgD5q1UZe9F6BR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfXyLxpvzoAnoJl
 4SPrT2MUL56r/KfBv3gqOqqlDa8piB/EqPYcX6//9Zoi0oKf+H0p0UatdxiWHR54qA51jnRBxTe
 ewlnj0mcuno+m+um5RJe6n084tmhirs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX5nmdEKHQyNHU
 lR41O3h//gG9wnwlCUYKnOT0MESjMhkkMeVlWJGPSC0Sg/0T9RLXUyyMpBI0LwnKKW5T5yMAefk
 GbbYlV1VzeNusw5i5FpGdktYze55uqWLtP3Y4+7BY8/Es3ZBvT5fIO2+Ck6NsetwbFu7kZYZXCA
 re6GTE3wbkAtuMunTawCUeIEy0dJEyEr6Fvge8jvM/c8iyCAOe2ugHweuFKTdmIjtcyxPow+Vt5
 uWdyDWqsrLnnlKedKSFt/+HbcVVsDw402SM8513Q4Dkuyzg1MABJ8xiksi4HyKASe2Mf4enJPSX
 kFp5Pm2GH+91OOAFGrDbktssH7eXi13swBqhi/3NbVYHCFc3CI6sJC7vip8iyFx+wsHnyBYCPw9
 4r9AGkapkk+QiHN8PR5Z8ZjeQuzhlH1pKq47Q2H+RapjnImEqA3mEyLk5QWvQvyQE9FXZO2SfW2
 DNKRfGvdjiG2aiUszqQ==
X-Proofpoint-ORIG-GUID: D_Tn61MDYGPjp8WqnShgD5q1UZe9F6BR
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 14, 2026 at 03:32:39PM +0900, HyeongJun An wrote:
> The noise gate type is wm8750_enum[7], bit 1 of WM8750_NGATE, not
> wm8750_enum[4], which is the 3D upper cut-off.
> 
> Fixes: abadfc928a27 ("[ALSA] ASoC codecs: WM8750 support")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
