Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E0C2FD1B3;
	Mon, 28 Sep 2026 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588115; cv=fail; b=QUcrqoj0t0Btg1rO9/OvkjfMGM99BhFZgieIXf3wzO0ZCBxMqnQ7P14wAc7BwjwWxqJAJ+wOro8RJ001RS9sBEe/1CYFbcf8hqcd/iR7qQf2O0xjmfqnnsI5Oak0w3TH0+3S27Dx2S0qzXvOQOPOiCd+SZE7dm9j6e4J39esf6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588115; c=relaxed/simple;
	bh=WFJNE6NnhonHASAzVNwOYm4PcGkR62UMp27tyhfh6hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W81Y6xMJz5fFWa7ruCYCuCxCkom111VSs/VZlMIN3M9nBuE3PAwDMgGWeLI/dlZw2RV9sV64ZVauO4ppEwn8M2tPqxeVhmcE0whhlAIhH1klExluEpP5Hst9CjJrP9UnxZnTZjRaxlecjo9LQbBMnJDkK9G4+EbC6zZgoHm2fCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UvpTKFzj; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DrZCR0oP; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UvpTKFzj";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DrZCR0oP"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S82GOs1054048;
	Mon, 28 Sep 2026 04:34:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=EPIv/Y0t4hJDOS3D9y
	dgf/qPNKP6pXi0K451N9z9uj4=; b=UvpTKFzja6EeJlqB/j0akIJ8/HY41uNduq
	krLouPUIU+tKmvILjucQUf8KU7iQov0INa5Qooxj4b0gYPlJJEzLuEMGA0QgpQhM
	oWtlDaG3GFb8DaFpY5ZtAiR4Vkdn6P2BFIKnisl1/3eqW1Lkqsdzje9B1KX2mc2C
	3ljEwwLK4Aft3sSRKsiqhykc+ugGt1vqG8y6iF2NCAjAmkjzv2GKkLJ/nMGmAfto
	WPpCIjC0KoBQjS5xDx3bYmJVr5wZHMgBcALbYNBkLOUk62ie/yP8xPHsNV0Jn5fZ
	XbzxifxFLR1ouOjrugEv34fK0SMCi6IXVdanxlMG2BlX31a/FUKw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021107.outbound.protection.outlook.com [52.101.52.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gxafj9n9x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 04:34:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n51srGgy36jxtDR/OgA9+0D+dYuYSNqeCP5ogkcPRRmG0dWFx2ihMlNVpXyUuPepyzkSBuYbmRekaXdIun78Z4jBF/zOG9XwuqpgKteiZe1ZvsxmGpPPZqj5xYMuiR9ZJ9Gpapd5Tvnie5zifphrwYF0ptogahSlsEgRsAgITSKG8NG9uyWxXGaUNoUR6QpnYAgnPO8dRK3ZkMVbQ6vCOuE64FLyE96CVn/JA2HG5LF5jbIJ0siuqMqbYtoKApnQ4a3xJNr28zntOAFVwDr3LIT5kuEjPEhAcsttDdUmhEzwbMyBXpkkCCH58IT3Xen1YPraGmDg4NNOvnZmgv5MHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPIv/Y0t4hJDOS3D9ydgf/qPNKP6pXi0K451N9z9uj4=;
 b=jObpkYI/41NTOjd1l1h1XBei15X+9ofFnxMbVYX6SI+5fwGSDtsup0wWCITipxlV07rICkhivo4SpCqr8eOqKkfaTgY8+yE7m5uF1xyCTyeZ+KhxdYz8qMBSdr1BbzVa05Akkp+qR3xyDcrG9EZgiSRFwkxGjDrnpkqsQZDob4QIShUSZSu7mb1Yeh+u8XHbwjp9oy6WMKCuygtQaQz0gB2eG77gbDDVfKamqpda/xNu/KCbt45k+F6gGbiNIT6hoaZtXKbrxqKKaV7edSF+DdE/Pr9WxQc7u2WQL08eDUr87eCGwSnVyn0yKdn4KeIYAsjv3SkbYa6xbzZIAUdb6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPIv/Y0t4hJDOS3D9ydgf/qPNKP6pXi0K451N9z9uj4=;
 b=DrZCR0oPNIYvZ5FUP+voj/8j8WMoGodIDXMYE/pb8Ie41SZV39hK193rjSggWI7lF/NRTyFOaN/+OUZn/gIWCrAY8FqDG9FkYYyrAjwVDHntZZad3Hxo1UA3dgNlYQAjq4oEO1LDBP1DIKsYCLiSY+OR2gd4NVMt3ai5X8qABAI=
Received: from SN7PR04CA0165.namprd04.prod.outlook.com (2603:10b6:806:125::20)
 by SJ0PR19MB5611.namprd19.prod.outlook.com (2603:10b6:a03:42b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 09:34:48 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:125:cafe::54) by SN7PR04CA0165.outlook.office365.com
 (2603:10b6:806:125::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 09:34:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 09:34:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 656F7406540;
	Mon, 28 Sep 2026 09:34:46 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 54ADC82254B;
	Mon, 28 Sep 2026 09:34:46 +0000 (UTC)
Date: Mon, 28 Sep 2026 10:34:45 +0100
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
Subject: Re: [PATCH v5 4/7] ASoC: SDCA: add class_ops with populate_function
Message-ID: <aro0teZqdsNTvHS6@opensource.cirrus.com>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925161049.758913-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925161049.758913-5-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|SJ0PR19MB5611:EE_
X-MS-Office365-Filtering-Correlation-Id: 585e2b55-07fe-4c10-dc13-08df1d43bccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|23010399003|376014|36860700016|61400799027|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	4t8P3Lt9+DJmezSssOScSYr+YDauVfA9a+vRdKhZTOkY+EDVxFDcoSJUOemlsmgrYjRRvmrSp/suqCs0Ey41dD4TjMhySVIbRN0ueiMyVzSZdMf9WBtwAtJx0OlANMeaXuBLWw0yS/eMny3Cj6XHnQHXD7dbvEPdLyaMhXN3TcBj6wQeoqPRcB4Lcu8Pfat+YiRUUzD5jdEcOaCJ0T/HpqQWq4C/ojrbRda6PsvjkKZ3JM43gD9EFOnvbI7DNd+VUooFJDEqkvj2yHg6kppMSgsJ95Lu2KkDSlUvwtiAxRjytN07pzbL3606ZuLryt+xQsUipDx6b211GGQ2hQXJxWOktOmhSZYYGfC9CeLQQCMNGjulBRUOeGq8d0l8Eqy1TBf+KW4bPQOVuDjX2vtnLppFAK+SSYAbwK0x1FiFe8l40dPCwkHmTkn7XdDOS5p2L5ZXU8NQNxDjocpK3WwDy5egtFChAW07cJrmyI64xmSB9oVil6e6KhKQpZB74ux2jVDOpDuBLP9/NOft4NkO55tGuwG7iB73TJRrdGmh+6buSYmGe3K3dXWCv6M7o4BASYGXq0tl7K1R4Qrcj65s9Zux49K24Hdb6kvSc/CuVL2X4Eo0IIqTk74ZyeJtF4eRqTdENSbn763Cce5zVa8Ils1Kvuo5VtLe15556OoAxTRpef0hL3rwrLClBHVQw5mlPrCsxE0YZzqSd74m0gMNcQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(23010399003)(376014)(36860700016)(61400799027)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6AMr9eHRQJl6oUKsYRG+HxkPO8iaRwxswM5Rij7JaMlSEzYX1PSQDqglnrcssDJSJUKEqO6rfRNcjeKhwpw6cPqyf524pzhQ2eu3kNx/IGfnPgpACScTk0emBrWl4tJqBXdT0/sk0/2G5ODV3rKbUN6OJQiR+s6U9s9a50rmhjIQzztiJE0Dn3eaNMXszianaq4F3GaMl64tgGoCE5uRJpKj9PzSrUN/B4bQSdjQKkK+AgHvYYwGqFQIj03ZfH8Q0za9glN1kLYDJwCNUywbZ96YGK3FKWYgS3R7Az0m+QOk+p1A1hHn8U/dCd/hiTerK+olIa0iEEPXi+R4xfnv8oZZuBjxD49tnnI1VyUGruNvgT27E7sVZBSNp+Ae5vWELk1XjVHsdcb9hCNPZgNuztKdmuBOeTRF0moLm6ir0pfh5luWrynqaqIHZdQyd3Oy
X-Exchange-RoutingPolicyChecked:
	0GxGjYtf2sT9zWJ6MHFi5iDI9IY6XutpM11BeJX1wuUWMAmFPTBXJ+elHrVmq3yCeZ64Eju4NZHpAC08B4jmqIPUcVx2fawwonQ/QkqqLhaOoEVNGokxMN30HScRorvfYeVCB9qH+gqy1X88bIzMQ4gvLuRF6IUPXK3GkumMH4deQX9lSw8IuLuwscUahTM+ep2U+aDOKaTCPFUcv6utDYGO2e3PoIbgbDzDa1Y+Bd0Ax9haEsuj9JVZIhBI9p2oPj3optEbHO5t9NLSksz5JOH2X5IS7Ejx9fWBSkoa0vLdLycjIZPQMA88ATSd0D2MpiKqTOw+Pl4gsYTJgwgJ2w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:34:47.4686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 585e2b55-07fe-4c10-dc13-08df1d43bccc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5611
X-Authority-Analysis: v=2.4 cv=GtLXaU1C c=1 sm=1 tr=0 ts=6aba34be cx=c_pps
 a=xX5bFixAAzgdQQ8ihQiE1w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=pB80b_qWtbF5VLgjRo4A:9 a=CjuIK1q_8ugA:10
 a=O8hF6Hzn-FEA:10
X-Proofpoint-ORIG-GUID: a-Q6az8ttsSBBnQnEvOHXjZD4TKF-wrU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNyBTYWx0ZWRfX5wrKlFKwzqW3
 mfmDFtO2xcmpOr+V7FFTWV146LGIOiz9vaGg551i9SjNhOVOArjN+GWNyqfVnyDaaEorjD7nc75
 2iQPKKph441vgVQSUpNMV24E2M4SBrUNA46i1CGrkddlvhQQo4dOzfziqnphscjF3QsrrVDee31
 mAbWjRJMC/Uh3jN8KxnB28Ss01LGZiDmEZpiRtofyhNWobWM3uhMovOZUJda1gJCJQE/oi5fGJN
 NrGTjiO1gwiM+zFJZrEyE7oMXDy8Mrh2oJbbAPFNewYyqrQgWRnbqUsVKIm8+N0PD3DqvBMwoPi
 YRthAvQjbr5I4iN3Zzuml8pw3rYR2plyg/eopLYaKDzYfrT6VrT3yMGcF7fCTY9UnvabbUhqPd4
 WYdCbl5h/gzxXgmkQnLUIFQzr64PVZQWafbisQjsR3i1F6Gf1Gju/YJhD1Hybgeiz4qhxZeo36R
 ip9HdTIpnUIQ4b8OweQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNyBTYWx0ZWRfX4IPSiLIvjXqM
 VsjGtT94n77vznu0Yc9u/n6mXeYWdKBhq0hyZw27MMxh1J4ZQO4xdpibJW5NbmdSaLl6xSgkJxQ
 B/cT8BaxbcjtYppzHrYUTeFdG4m23DU=
X-Proofpoint-GUID: a-Q6az8ttsSBBnQnEvOHXjZD4TKF-wrU
X-Proofpoint-Spam-Reason: safe

On Fri, Sep 25, 2026 at 05:10:45PM +0100, Srinivas Kandagatla wrote:
> Add struct sdca_class_ops with a populate_function callback that lets
> codec drivers supply the SDCA topology (entities, clusters,
> init_table, ...) from static tables in place of sdca_parse_function()
> on DT/non-DisCo platforms.  The callback is a pure data source and
> performs no bus I/O.
> 
> Codec drivers embed sdca_class_drv in their own priv and register
> their populate_function through class_ops passed to
> sdca_class_probe().
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
