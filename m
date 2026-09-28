Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157573B8BBF;
	Mon, 28 Sep 2026 13:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600690; cv=fail; b=r1P9ugjl2O56E8L2l+Nfto6eFaHpwGz3IS/UCC0Vh/Z/B1yYMlmFcI++rYQWwet85lK6msHPfYC2MDt2gW3X9DA12LwxhHXkut9G/wHMK5LOVCYT2/M9SGYQ9sUaV0kU6omViTnflRm/XY6Oq3BXu2G451+LLUmSxt9VJvwfhio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600690; c=relaxed/simple;
	bh=fhK7VwchluoqK0wbG6ZT11WIpklC/6KsPhp81h+ekMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcNJxd3Dnl3RpzwMCrfUz/kVqnL6UKJkFxJrZ1ZLjnzoqPjkxzrUE0776azxTzOw3Dse6MRfz9hH+OcJ2WMrC6M/7YaWjzeoE/kG0Eku4KOD0cWxrliZDbAJrBmxwi81/RXmCQZxNbfu5zQIX0Cbr1Qg4jm1NLJGIQE0lNC0WEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PGVfXBmZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PEHTHdtz; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PGVfXBmZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="PEHTHdtz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SCtx9E958173;
	Mon, 28 Sep 2026 08:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=0YrxRxEmmsMkKJaMsG
	A39g+hNm3yeDUV10RLmEUpOqU=; b=PGVfXBmZ+CCtig3rt91JDdThNkRbFHtxXG
	Fc2I9H4aTvh00F9Zl8FXu7zT0bwww0mlzCy4iZdZYGfkdQUrwx1kupQRfFtARAo8
	MMeboByZ6WcZqBzDyBENYs/+y8ksachh3Kj2C1y6yE6fVSd5PbnL/K/yVocsI0tQ
	zB2/Ka/THA3bUyH+1LlVSC4vmUOyMnVRfW7NetCy6eQBM1wDiIu72VlVpdx0IZHd
	M7Gvrcec5a253DEFkKJUP8thuynMcTG47BoZDyPfabsRdUhWMhiFQhSDNRHOmuX5
	pO0i1o+HeNykTHs3hcVfsK0Ap8Rd/vsl6NUyokV4crKoXezPnvdA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020092.outbound.protection.outlook.com [52.101.56.92])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gxbf0j1vd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 08:04:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+wWZ5kBu94kKvLY2WR8q/aySDBKPKe2i3HNTn0oTq1DJuqktxCjxggPIpIiHN64JFGId7oOf+Nx0da0Zj4c0yrgWCOHgtxz2h1kJZ0kH5qWNbFMhCIOh/rGxGOahmR/srPUd5tDwfjzftDwrWJ4Jc3cjirnoF2MRUfIpd6ke9vymrbMPc7jq/69eO9gjXHA3LzI98n9/f+1vgFbJm3G/VGjS77ZHXI0Lq2D0fkBfA8IJZsvlLMn+HGa8doTiHL2t+AdDQD7F2MituruCyRHJZZhMSzU1WxaerSgaDdhNXPtAroxZuULvZw+daKuO8iXHhav00EqrrjM2VNCPF/ywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YrxRxEmmsMkKJaMsGA39g+hNm3yeDUV10RLmEUpOqU=;
 b=yN4xNjWPV/6W7leMkmJold5F4I8NoB7V0VymzTDdx0ft+dT+JPsHTfL4zEwIcZow1aVyDMFlNbLzcG6v4KgzdF/qh7FF1DHmCvhz89c6MhZhy+5nkf0HOkb3xLkme+WXHHMGACSZ2plivwbqZE/o6XPI+Cf1ivi9Z4KU2HS9QjPWhNrGAm4IMJ7l5w2oFM+EU8iP03AQk3CsuJ1rufKDNGroA+bgKdEvCtEEJ653piICprPuzdf9hCGU//NSlROXkBxbSX3ao3MDARVkGF0vYcrmVTaGawCe72PNMCM26j16OZa1wTYFeKLIkW5vur4PX3QHObTXuodJ4U4lJztAPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=intel.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YrxRxEmmsMkKJaMsGA39g+hNm3yeDUV10RLmEUpOqU=;
 b=PEHTHdtzCPdM4aDHmSEpEXfl96mXQGV+XancrcEJ7nr8FdoJlqWs/8Xe06a9tf4mJAKL37RqipntOrPY7k/lw5xCUXVZjGcfzD1chCvmqOztigDBQHy5gdMWonrLaYxxcK3JJhQYOFdRGoM2vZQolPxOBjLDGkegEd3UEsFacfU=
Received: from BN9PR03CA0693.namprd03.prod.outlook.com (2603:10b6:408:ef::8)
 by DS7PR19MB5711.namprd19.prod.outlook.com (2603:10b6:8:72::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 13:04:32 +0000
Received: from BN1PEPF00018071.namprd04.prod.outlook.com
 (2603:10b6:408:ef:cafe::4c) by BN9PR03CA0693.outlook.office365.com
 (2603:10b6:408:ef::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 13:04:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00018071.mail.protection.outlook.com (10.167.245.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 13:04:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F38BC406540;
	Mon, 28 Sep 2026 13:04:29 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D536782254B;
	Mon, 28 Sep 2026 13:04:29 +0000 (UTC)
Date: Mon, 28 Sep 2026 14:04:28 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, vkoul@kernel.org, vinod.koul@linaro.org,
        linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, bard.liao@intel.com
Subject: Re: [PATCH 2/2] soundwire: dmi-quirks: Disable ghost rt711 on Lenovo
 Yoga Slim 7
Message-ID: <arpl3AAqva1hcCaT@opensource.cirrus.com>
References: <20260928105640.3014318-1-yung-chuan.liao@linux.intel.com>
 <20260928105640.3014318-3-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928105640.3014318-3-yung-chuan.liao@linux.intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018071:EE_|DS7PR19MB5711:EE_
X-MS-Office365-Filtering-Correlation-Id: de28c35e-d11d-4eed-2ad7-08df1d610972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|23010399003|376014|10067099003|11063799006|16102099003|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	1LRj0hsQGs3eYiCwmzHhl+0P7InS6AYRrfMQhKqOtbe3lPwSBY26QFuTIPHL0M1YiZx+vlUU15y3T//iIinTUXIXYlTSWku/IHl1nfcrjMXkmYMgGMZs2QTIXfln5kKX9JCwGvIfcQ7JwOUew2dSGW+QmIJLpX4TYpJj2iYMbwycwzWzreQdLJ6MCqziQQZ9658N/RFybb73isLPJ32w5jHO4NFKjnDSHNfoXv5lAlkiCU2gkpBi402+Hf5YX2AKo5Z63rrLI//WekLEoF9QophgH4NTwfsS3T2uE2tMk5L0e4QRHlXvWWC4x2uUb+GAdyiEHePlU6BHOVOiuJfgZHPYtTaQXotApqUqOpNj1ATti7tIGAJFhnUWUroz3KFBiW95uePB3vF0R9gz7BhosSQSQR1rDSQU3XgJLEZZCE7S9KjMxfiiBEVj9RdnFMlMMD+/61EKZ7ymchLH1eaSTY9Tvuc+3vXPysKvAk/TyzS5hz9j9At0uo+mtQzmEVr/e1AhuN3d6YiauZqJ0iLym9IjqLZNpLQVVbO6nwhFmQUVQYz8TxswjT4IsBjHCuewWTpw7pO0eU/iF9McRtAO1hVeI7e8v1/UNZlyW+2avWFFTp0lC2ErBhLJG75Ky90uWnY7y76v9CIjRJTmwJyrgPJ5nuEglezQqWNlub9KrCOEel1pUJDoV8a5n0cDjkOYMdZvlytreheSGS1HtsLvlg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(23010399003)(376014)(10067099003)(11063799006)(16102099003)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gNwlWsvoQ41rzyrwtZE6uCvNN0g8xnKPRfSc0LhB9FPeKZ2cyH87s6m3apvmxQdg3/RfKIzLLjHcDHyU5DghU/HToxRl3Q5cA/MkOvlhmZgqTg2ifNn9THG4ng1YP7pc+NUgNUd/fJyt3t8im/vr6K3j54QHum315PJWpoE+dMTAj9NhY5USkXL54gO0tJOkRDW1WUhVmQxJCynmFLaGJFNgMuyUINgommCtpvVSF+ZbOTflpYm/Rb4JyO6mBvLa0I6ScHgZUqO3kKIafzJtT/pprG3BhJLjkyGu3xGd9+tKp9NZc0dn3Nl1VFFhWiI4sxmJwJibuRzCDz7n7+8CLYdcVaxh+I+CX0k3SHnyk0JWarTBnSo4wHTnoImutOXcFh7XDhYTPfXk49/PYY281kGw4ytqS5hcWhE3acGBecOMcmtPkwZ6IQuWiHjjlbjP
X-Exchange-RoutingPolicyChecked:
	GA5B8JK1I+/oQ+aFA5BiKGNJV/eJsgyXozkuARqsjClnI6B2DvFuemISU35yzrQ23uPnHvyU+4OxpJOG5V8WpYIUbFK3OS7Ix8DxsQISQRsjfvFRNKAF2ewXCUSr35pVC8CHQpQkdvlzDaCSSsr83JoLqgBhJ/Rn4RkVbb8s/RL0uQ5KE//00yD8pQki8F9Y7myK3A+MZBnhjOvLmar+ipRvfrFGl7HLd+7dP3n2JHgQH6Bke9XdmRnLtSrKFMuJ/x1jOa67e0Nl8PHTMWVebijXJTIIsgay+ftpLlaxNd5xI8bi4/+S2Ch6FCamV9dgpYfrQJYilecSmHUJnwtfzQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 13:04:31.5263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de28c35e-d11d-4eed-2ad7-08df1d610972
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00018071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB5711
X-Authority-Analysis: v=2.4 cv=GvLXaU1C c=1 sm=1 tr=0 ts=6aba65e8 cx=c_pps
 a=Bu43dWwcgNc33qm5GBDoZg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=qSZF0RsY-m2-FE8DCjsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: ydzJB_5TGiMM4YM7asUdpTmUmYPo7TSj
X-Proofpoint-ORIG-GUID: ydzJB_5TGiMM4YM7asUdpTmUmYPo7TSj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1MSBTYWx0ZWRfX1G7mENlI6Yi5
 bBgWGGSpKSF0iO3GutShB5ardnpqTuJ+YMGSmT39ayYuTXaFsnBfTHxqbCR9xjYBWeBOxfkV6mm
 WuBkuAKF0edjc7ht4GTbp1OGU++cKGg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1MSBTYWx0ZWRfX7aqIgR91URrB
 fVuzox3IEL1iR5WCZqP9dWhu4yurPS48Qxb5LEH8m1XvKQWmq30nv8IDH51JcncKDQiV2kd19Lq
 uDMq9J5uzTum9ConYDW67WMqg/V+6hOocEre+IS+i7MlAhNEC+PK+iHQXaFFy634/MGzL0u3rAm
 8xRGJeh36B1lUnNgoo7bv/3cSi3YMyUfmvt2qOv5qQLIE3nc9bFbHioMQRKdtf52O90REdk95nC
 4FSpw7U4vHzWbZnDVJ/Ch0vVAeepumgq4R7bxv8yUctbEqSjcgqrJZP/VdZ4rMBYddHy79jzvAE
 QeJembpJZ7z1GdraALGjf62nYhGAKRWlHSlCpaMidXsnCisRWzC05rjUVfGXPFZfsBH+7FpZFL5
 Q3w4klBtuWcpOZ6cYvah/Ribv1VC+1fXG18AW12JqNNyyWJ2WDUDgFjhHEZDZGakhCJo5ZwwZ+/
 rxkQd/tT4gbe3Pm31tg==
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 28, 2026 at 06:56:40PM +0800, Bard Liao wrote:
> The device reports both cs42l43 and rt711. But the rt711 codec does not
> physically exist. Adding a quirk to disable the ghost device.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
