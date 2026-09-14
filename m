Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D639448F03C;
	Mon, 14 Sep 2026 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390201; cv=fail; b=stoDIqKw19Uy0rwOotek7vKsdDuWwXjMTMANk5dlyUKU1W65wJFtZfRdUJKJoB9WL3UDwUkv4yooEQaClgQw0ouaOmBTjkjwV8c0rLVxrSo1Q6VRd8ewF1Iohrnm9MOs8sP5wdP7Pi7TM/0Oj1BUBVgeD+3oxphzqwhW+VWG2hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390201; c=relaxed/simple;
	bh=CCCL5VIiJuLb3uhx8DINpkBYutDJvQ5HZV9eYmuTp5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h77UriAogl1OvTqduk8sRfjztdLpEWxDwIAunkIJROINvnjVJdt2gzFThUe+YWwQCpwYKqT29S/PQe0HWAUNsguHJDoWrmxHsVHRmFUGncWUSZyuCcmQLxCOXKK0uFVmooVwNGKSeteicoNnevU27Kg5349ZEmTPR3UTfEMhNec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GLJQclu7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jyJi6QOy; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GLJQclu7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jyJi6QOy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E4lR79849027;
	Mon, 14 Sep 2026 07:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Adz6pQXLZJ3+LhvKZ7
	veoi+39aeI6cqyknerQB3l1sA=; b=GLJQclu7pGsRR4pSlMcNWif149eXHHXNCL
	61XJ6mSD8godsOpqx04GOnxNiuSyYCS2t8O0yAOvFQr8AQBXsjX/eNrk8Ouolybx
	5Ku2uhiTeiUsQJ0aXbYhoOkLDDrGJb+V9CWrDqB+Koh/rx4hTSvKFRvOazsBGHTr
	v1Z5G8xKRTzkCUGCmDMtYrP2QvRW9wiTkIymFwVeShgL08O9jsUoy7FA5+8m75YI
	d/xGov/vVA3kLCjCOt+y17ykS+1S4zjkzqkPPPtxiw/vBPfQYW55Ec3z90HiC+bM
	CmNQOEyLbXb0IKONiKPKrIkR8klNif0rSqf3tSxLvoAR2xq7Cdxw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020072.outbound.protection.outlook.com [52.101.85.72])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gn44w9tsx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 07:49:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8xm+0MCZWCDmtROjbQO+36mhw40rAUSZ3LJpX3qLh9pzzWBGQrdazzoLIMHVSfWqOYNw59CbFfN7iYlxiWAYw9tQAoER7BCVGxwaJwZVTmeEL3UplMJc7kqR4dU44CD32bWjOnGb5ZzHv/DRpMO2AqCn0jqzrCNDyvYu7XN51kctrWCQnToiUeLuposPyu0bU41QAMA4SYqms9GJvtQ4LqQUdegnusGsbB9OLpdHBTobla5y2FBGnbSmelsUfCTkMSVCGkInX7N9rpDEu1htRFnCsWnfeisFD+yzJuP1ceEN4opYBuOhVSJPSHfBeQDWZ7kFYqezAN41AFyfWjIKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Adz6pQXLZJ3+LhvKZ7veoi+39aeI6cqyknerQB3l1sA=;
 b=DWwOGThFQLQSaULdH7rcY2JyWAykDhHLRReZCs23d6KOOjLmpe18dEQUuFEM2wNEajctDVmDVnK2i/AEIXpnXiyzLoWUyseQf+hw6xLRrCBx9xfKMz+DqwQzlMkz11R2JdsyX77oRm+0IwK4zJK2qJLJqgmEKfLhkbc8ePQWUURINeWzhhZHVlfeqlimIB2kZ4udwfADTeJg4K5y96rBYeO+4XU+9He0rTg8kLMK4CvTX5eahIoHxRCFcWtSjKcv8QPYE+PCf8z9s6DFB69GTP4kwGBSusGAKTpfoECSk0Kp03+SGQGcE3E5wkopqksDzTbRUiJsql1t0v29EZ6obQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Adz6pQXLZJ3+LhvKZ7veoi+39aeI6cqyknerQB3l1sA=;
 b=jyJi6QOyXA4XUQ0e9b+AgesA1gVALm0EgPqVpXcpQ9CsVvRCqPUbFIJF4yxiyBsShrvUqraVumca8+FyxvKIpmogfsDWrPL6JfaGNmnb+H8u21dMEuCkYugt3WmRwk723T5FfWswOt3MYRRDS6WbrkWSf3hZoXKQkL3sth+k4dU=
Received: from BN0PR08CA0012.namprd08.prod.outlook.com (2603:10b6:408:142::34)
 by PH9PR19MB076788.namprd19.prod.outlook.com (2603:10b6:510:426::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 12:49:37 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::2d) by BN0PR08CA0012.outlook.office365.com
 (2603:10b6:408:142::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 12:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 12:49:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C084B40655E;
	Mon, 14 Sep 2026 12:49:34 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A8347820244;
	Mon, 14 Sep 2026 12:49:34 +0000 (UTC)
Date: Mon, 14 Sep 2026 13:49:33 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] ASoC: wm8995: Register regulator notifiers from the
 bus probe
Message-ID: <aqftXSqnbrdM2lFE@opensource.cirrus.com>
References: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
 <20260913101531.2787654-3-chancel.liu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913101531.2787654-3-chancel.liu@oss.nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|PH9PR19MB076788:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba780e7-2517-44b0-5979-08df125ea1ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|82310400026|36860700016|376014|7416014|10067099003|4143699003|18002099003|16102099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	j2UGOhpGLAUcq6nO2odh5rj95k8+iaa1C5qgURbpwLXCBbzZEQ4CO3Zn1my64xFVu0C0bq8KlAd4+GnHr83gwJvEuXDIm+s8WXMCnMCYABA4oFATEUYGGfqkp2nwZZIwt0Wq95mheJoZ+XXQNZ6eJ0qLx7WUGATE745Ou7Fmx+N9LBKQ8Vnw11BfkXEu1rbEMoBeoI665g107NQ2Nk2UiEaIM1HyWNIIzmVgX4Kxk2uIx3zZB74GW1PnglQ/7atRAaLP3nw0i8lx0HDxqar/+oWslIkYF/tuEQZSaSLMXXpwL/5aeGNh+nnzxzbcbmB/2QrR9NzQYJ+OAjxDQeFpQZzDhjvpJyod7gFvfV0N1pcmwgnkLwOVh17w9wbhXaf/Rpa+Utj4kd+JYTBj//bbmLwaIn3KN724FbPK00UfKdewbzjZdKqkAUkMTo86TmYtfmDpuMTojxcXjXxq+Op+6hm4GGMc+bDXo1OcP+cNtoPrSgwuUtKgiKmMVWcGrqZnpD3Iml9xeON8DhxACAGgb/lfItFgWfN9wY+OsgRJv40xSsmspntNcOzNVTtj+dnOv8xO521ATUI3hv9twjT6knRzaS+gDSAPnOforYlZkA2Nu/pptjU2Phvv+IjGaet0APc9PupmBBKDuStCZE9jlr5xot9sv8RZQrRBmnr3iinECPX6AulNTj5urSFbxQH7TnphrY/rq0fbtdaAD41amg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(82310400026)(36860700016)(376014)(7416014)(10067099003)(4143699003)(18002099003)(16102099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NfdkcCo93krNtUT8+RRwldvJd0D68T8f/nzG9tDYRaRB6ibtqTArAzyyyGrgRh+ZbosFL6swMfNnCrkRqN33HEch/UITfi36n8OjlQ/kyvnFhp86LhTTLY4andxQF8Vb+Qpr0II7yT3zO77YsqZjsJiYIUYjCNeofVFJWU/fr1o7+m6cYb4ENNEkuwnGbAm8sn6o+EtasnL+pEYLUd+aSw2a+KJ9nlWmYCOQkuCMCGpRWXl3FU3SX42Pa93rB/j2YvOj2lzJoKEAgdLnDsFRtGYbWpFSWKZjVOsxVo3zWeeC8jU+D1xyUWNFOgkNJpl6z+2EFhSnt1i0LgepQES2Tw7R6kVTdbOt1XQArgwiYkQUAheIc5x7mdYj3beoRxgWGJhcJydMoNZu/6H5spmxP5+aKZVTJGLjhQDXrJs4643aOuXhdN2Y793jD7IPbLD/
X-Exchange-RoutingPolicyChecked:
	xm5CzDWWHut5o40skxwpangCh2hPVvc/kP8xa+xC9ftK2BxIDC/q0a+yn7xy6IMjy5NmvnvbPz31g3pbCTL+71gbX0+0xG7YyBmAHmqmR2oWv6sUEXornPR+UXeNzeeZ+xyUNz7jaMO/SyU47XMvPgF31PGHUTZ93xz5AUPwFsWE7JwE+hA7eYxh8q0+700WK6SE8sR+a/dJHBvNmMcHccuyyeaRRkEqbDuXJ3eEofi/3PoxE83Z2LUFghfKk05hCHkCafCMPhzY8M7+kfMXZppDBCTZyxaf/jLOA2dCD57SKaxNCmz8tGbltlese+vIwdY+gw352CO+Xt7ho1P9fQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 12:49:36.0483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba780e7-2517-44b0-5979-08df125ea1ea
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR19MB076788
X-Authority-Analysis: v=2.4 cv=A+T5rKWG c=1 sm=1 tr=0 ts=6aa7ed65 cx=c_pps
 a=mDKNUizQ5y4JSpmwThTN4w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=8AirrxEcAAAA:8 a=w1d2syhTAAAA:8 a=N8TxWDmV0AHAd7azCSUA:9 a=CjuIK1q_8ugA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXzG1spXDLwS0T
 5r2QIa+TE+sRdAhFqG8j+KBcIfF6ZtR4y/cKY6i9EsMfQiK5xHnsK5sug97IQawDySeYR3R+JP4
 EEYm02iRVG+abmq2G2QnIEA6Bt7yWHHwY8qlC30qqip/yXgY7jPlVNOeyfdkV/e2TvdM9rFuJhM
 csVCjl9mYRQK+Q3odgqkGtjof/NR4U7C4pmNoiB8Tkv9ZYyhFi5a6Hm/9f237QpuKaRuyZL9b+H
 LwlB2jNi+vMedZhEGlqIJttjEi8oHXwPHPpppJDFyn8zfxd8vUWNcFu4g19oTqRdz/jzLHav0OG
 81RIL1xNVS9JK3Msp2g4YYFp/CYZ3rYwID/zdUQlk+4x1ymw+w9+0hx5K0FjSf4ZvJ2ucU3cMZu
 u/oqndL17viuqa4IdeavEV9lAjibzEkfn209Vvna8Ki107pXWTvaTW2ahw1THxgXfzwA3rX3Uop
 6P1KwiCXdCpGDwPvj1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXxSqKiqGsuPM5
 y9ZbpV7/IpBJCzs966uGzSNtS3whVN56wcfEYDMQkLaGKCDbgoya02C6JXTQgqNnp+TgbGJPGJF
 wsLz663hxyQ3jSDfqzP7EgSiOpiyzSk=
X-Proofpoint-ORIG-GUID: KKIs_xnAahBtcT1y1KktD9Ui47to7U0G
X-Proofpoint-GUID: KKIs_xnAahBtcT1y1KktD9Ui47to7U0G
X-Proofpoint-Spam-Reason: safe

On Sun, Sep 13, 2026 at 07:15:27PM +0900, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> wm8995 requests its regulator supplies and registers the regulator
> disable notifiers from the ASoC component probe, but the associated
> devres cleanup is tied to the underlying I2C/SPI device.
> 
> These resources are only mishandled when the sound card is unregistered
> and re-registered while the bus device stays bound. On that path the
> component probe runs again and re-registers the same notifier_block on
> the still-registered regulator notifier chain and corrupts the chain.
> 
> Move the supply request and notifier registration into a helper,
> wm8995_hw_init(), and call it from wm8995_i2c_probe() and
> wm8995_spi_probe() so they run once per bus device bind. The regulator
> enable and the register accesses that need the component stay in
> wm8995_probe().
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
