Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386D3254AFF;
	Wed, 14 Oct 2026 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971198; cv=fail; b=qw+1nxP6G6qL59drdisvxM+xzaps/hS+gaMsCDV+DyGrzSOggpfFLY/GyYZErDV/2xm9QXIe0ic4OfoPdg1Yg0XphMt7qAs9LXp0Dyj/uh62BBbg8u2wyAVXXa8PI4RHAMTKaKze3Kv2zePUyGUOLABe4TwVeFAx4GdGvlUuwMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971198; c=relaxed/simple;
	bh=2ADX+dmBZtumztS9/uT8Wrs+h/Iqk5oYDbmeeF0hmTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WktqSKJsPGJ08ZyK261Iw8yEdyggP//fwMaRcq/WU8QAnZLnJqeVOvT+lsO8B20UBdY9RuTNiOihohBD1kzvABET2Mh2sUPXfHVfdx+/1t0SdeUVL70LyaFXjCxfwTeUpH0uDp8FAKWJhuaAYQJMSLElIPFmsOr2scW1UDKnqUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=g9ESjLAz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wT6D5biq; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="g9ESjLAz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wT6D5biq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E4lC321843566;
	Wed, 14 Oct 2026 04:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=VkazZkgblr5vfKyq+C
	EUQQez+CYH8MEqAN/Oaa6Q4iw=; b=g9ESjLAzE+MocO7ARTdNC+sVDk9sdOBgZE
	SdQaJIN1oQqVSruHO6GHbCdilldzlFsg7OrRC0lUb3M9NzD1lbb/7sWAbMuXP33c
	9NuRw0weM2gZizC3GOENzIyFj+6lVVwNQhQEy5om2nwmuSny1T60Z1wqKhkuO3mN
	hxjuEgckO5WLsg1ysPHDnDU+5prpt0glLw2rec9qCdf0VF7ysVGq3pwoMZbZcc+W
	z7y07SjgpymMASQA8AINGwFj6DPpcz461MpLp88c8ycmIDEi7EEJOFqQY+9ZpZhJ
	yFxjRyBH/Cy+quOWgDG1j9vSij2fEc6dCmjB8VSrzvqrcMIk5MuQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020103.outbound.protection.outlook.com [40.93.198.103])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h7hsg5fy8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 04:46:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Za+iYyr+BrCY/SR0eI1pRpf6X/xdyMnwSpRdcfwEAaDHzD7+lrIIgbDcYmwTFw0HR32sPWp6ZJVcvXGYLx13Qgrt2I1Y/u2cOkHRKfkiZOnK6+K76UWmoEgAq2n6lKvO9kqKzibGvoB2rs4O/+71/P5LXNUHb5qdvSrSHlDSY/THJEODjPJ38PGMi4Bcu0WbhrHOIFO2upZKsQiUVbnAcCk3lTT2Uhp7xei+s/fzgFGeVcKglmCKagUzE0iYuQE33QLvXxUpJunnQoCuSQ6eRdk5IdTvXSBFEthOmpqADJp7zsushXlr372qIgrIiDqf/4rkRkt7qweB3m+wEa1nxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkazZkgblr5vfKyq+CEUQQez+CYH8MEqAN/Oaa6Q4iw=;
 b=Df6w9LXMiEZA9HEHRb78TSIaa1qKLzGVp4XcuCswgwUGDOEe37c7hJfMWQVuHpkShQHsnd6MJPL7e/9WsQMaZ1SULWYeb5/37vmDiWsN1XA/yhyqRlg4xnp0lYC2cwtY40hK8XeuzFsAx0Ism5RuyIpmqU6xAYdtl27TNxCaqGULkFmL5SBAOBOyf7DbnJRPiY/l57psSfBImn8ilsd/noOBHAPBYmI7r/b7T8SeaA89R6K7Px0HEGJmra3qkK8ANBi4ODdAceNo+N67rcVTh3eLI+43ynUiIKDoYR5eg6tcxkTylr0HirO7PCkT7eQvkSl1+rdUMN/1HjuWy749jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkazZkgblr5vfKyq+CEUQQez+CYH8MEqAN/Oaa6Q4iw=;
 b=wT6D5biqimOEAqYToDSg/4fujFMZSXCTmuz+1t/VPq6dWuymaXHWZ4tNQ3j8MpJ7y+9zWYGL93OtiUgXa/pxHBnzOobMpSzIrISJKjahkJ39fwdomcjYViL7eoRP5y7xBp1oatZ6GEc4dW/Y/ZTDkWvb+HPpFELyqBXoO7R6oHs=
Received: from CH0PR03CA0266.namprd03.prod.outlook.com (2603:10b6:610:e5::31)
 by DS2PR19MB9412.namprd19.prod.outlook.com (2603:10b6:8:2d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 09:46:29 +0000
Received: from BN2PEPF0000A801.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::14) by CH0PR03CA0266.outlook.office365.com
 (2603:10b6:610:e5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 09:46:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000A801.mail.protection.outlook.com (10.167.245.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Wed, 14 Oct 2026 09:46:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E5675406540;
	Wed, 14 Oct 2026 09:46:27 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CF71D822551;
	Wed, 14 Oct 2026 09:46:27 +0000 (UTC)
Date: Wed, 14 Oct 2026 10:46:26 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/13] ASoC: codecs: wm8994: Fix definition of WM8958
 noise gate hold time controls
Message-ID: <as9PcmWc11DP8pmN@opensource.cirrus.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
 <8acff0f7314eef9eb3d290ca7855a87052d7e706.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8acff0f7314eef9eb3d290ca7855a87052d7e706.1791959026.git.sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A801:EE_|DS2PR19MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: b654f0b3-47cf-41ca-e0ce-08df29d8055e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|61400799027|376014|22082099003|18002099003|16102099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	KdHQcIiLv+yunUY3O/d7gvX/NAY4sKuLJtVjVUxRHpV7GQ/UzjoBU1H0+yRRbCnClYkxLxV8UQFHtXYrMVd0CPBqlEudoUU46XSa8xeFfeA2shnz+sPIiKZ01IidXFFfAFyQC7V/DxF6MfChmS6AiUAD7/701C0G0UuSAc5Lxoj51mYNdDu8DpBvrR2lJlKmdowMDIbpJlKwoGrU/sVF5DmBlDpmP4eur9z9d6kfZkOe71NpKaQ56jRFD6WDViSLZcTT2K6DN+DRqVWxOp8JpsCz5zWtTwhW3p/XHoTwMDl+X95SixgO5/BFm+MMLOklUeCSuVOG9DcE/wH5qRHCmZu8qHvruyOiu7pL32Ku9nAU6e89zyAT67f2RmsQ1VNCdD/5P33mFJtxuYj6yB2FlD54dMO7N2jr6NvTlog8YwgM0An/mO2eO92h14skn8PrBsKh5M16ANIwThtvTnRAZOZSLgfTGlNQCaEo3zwWPz09xeqIRft3EmjJTtBMpPI772Z1dczjLsC1tSdhVRSXPE7Kw6tIqBAaZQFTRGTH1H46fwhae+Czk9XPOClsEC9UnHPUYDnKKCRCDWSIjKEHHCfMWjLghuHhQ+dSbbSxasJriaNP9A1VD8ipVyRgVtzJe0jh9uZ6WHjZTu18K/lQmmI53iMvHe3uy7vgGcV1VfLtFD22pq1vvwGjP9MPKzXEgHX6J7Hl1NLkCBipskdelg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(61400799027)(376014)(22082099003)(18002099003)(16102099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4+DzDpJOCzDxhWhlVl9AMFkLCrbiTzfse09RSCZZgdiH/Q7977+PkJdCrCafw4nSp/VwhQcd+8rqBV1onUqYxpTJkUr7d94S9aFD1ah+FZZXd/NnggPXNmw1AsrrmAW1cv3bOnbm2V6EgUNPCJsVUZNoZLifhvE8ZwqO/zeIzF1W/rUKwi28SqhFPKvN1gZy+O3g18SmVC4ztXrAojQ0q8apXR4Kmu6hhs3V38c+s74k1I4lkTZiGBAWyake3y833DY14kKHErcea8Yqm11lb8ZVlbi9gLCBAbmeNEHseRiihZSB551x+KGKhfKYz4JitQrm2f42iAB5b/br+KrV4Ay2OGcO3bZjcQ+6fZD+jXA4d+h6umoPhaPpe+rP8TRbaZO+eSySgZuh5iX4UYe1SFHafI1OLyb3K03TUtT4gNQ+kYub56iCHk33NV2BoOq4
X-Exchange-RoutingPolicyChecked:
	5G0YDp4SzpAXacsn4I5472DLQV4Z9AwB6QXjh5wv48wHP2ONccyt7j4c9aXfVS71Oo3jrgnn0EOsjMjWZ08BNLy6HXNi+GNca8a/4FtEexRy9oLRCahPIvFkiSNxPor/A8nhshUJPKCu3dQu9UAxTPwQsCjefJ2Z3hnQtNTZJVCZgcoMai7jpwbJYxUDlz99OllWG3Ys1y2OBclyH21j4zlvImUU5Frw6bMN7xyTI0oh5W932oxRC8AebPJB7UsybHTe23kEwXVmSZolyUJ6cS3mAfpOPm+mw168tXCjKZWQAT3wNKVKFCo66f8qqmkzAuGTBcpd/ysl9++dVVSzIg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:46:28.7539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b654f0b3-47cf-41ca-e0ce-08df29d8055e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000A801.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9412
X-Proofpoint-ORIG-GUID: m-J8LUoENx5_LzFR7OK2HxXu7ndBptpM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfX8q2itxzRY/zw
 ru0qxO0j11l0FVn4tlxTeKa6CHXOHK/JW23FAecNpNcuEmXkEdfjZc576PVJp0JI+3MpQj2gh1c
 fLq9rrnJAsQ+G9iFoj+KEiwV7q3/k/U=
X-Proofpoint-GUID: m-J8LUoENx5_LzFR7OK2HxXu7ndBptpM
X-Authority-Analysis: v=2.4 cv=QufLTlyd c=1 sm=1 tr=0 ts=6acf4f79 cx=c_pps
 a=4nRh7bImp0HScQD0nwvrcQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=5BaI5pJLSwOFNK2hHz0A:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfXxgPSt/9G8wB8
 vyOt3eqaT6zdlZM6jlzOHK1+C3K5kuIphsxqlzX1gCYbcwtQvUO3Xx0aDQjw2rajerMQzxFR6F8
 wx9zv+NixIczzLHXhWUmAnJ7HehuXJ3f9NBt4sQMUP3XoPX33WJic28d4JcPMPrUI4Nt5zkZ3Qx
 FmuXQo8pHP2eG5Qw2/nN+8URQqTsVaJ/eKUECxDXLPk5LJnxbVxSyHF3EXc6/2AZqjkKOlOGCfP
 zsAvuOYZwZmxtcezGycz+K6U9qRacN84f+yx/Kxy/KfG0Q5/UtmpjwGeZnXa8BQw4JwgnqIdJVV
 2333YLekZkUQuSAybsTMwvdfaarHHIjsHIIQmcyEL4lbrBb5AFuFxCNxme/jQXsaK2hF58aRUb/
 R/UwHt6Bv5lqACRlN/hpFP361hfu4KI1kZBHbtrosb9W11nDZjykQBYV4j0+6uO9i0tufEG+b0u
 i+nzs+4aQfGmyadOb7A==
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 14, 2026 at 03:32:34PM +0900, HyeongJun An wrote:
> The noise gate hold time (NG_HLD) is at bits 6:5 of each WM8958 DAC
> noise gate register, not at bits 3:1, which hold the threshold
> (NG_THR).
> 
> Fixes: 1ddc07d0f13a ("ASoC: Add WM8958 noise gate support")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
