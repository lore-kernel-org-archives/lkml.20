Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F9748592A;
	Mon, 21 Sep 2026 10:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988395; cv=fail; b=UsDMW1hxl6V7Hri5Ser7NbAz9FtDfJosXftPD3CM60kHl0vjqZVVxEXtZJFyS5JrPLStV8Ldi4FMwI5+Zt4NSITXdJDCBD9+R9VaptNoIB8/xKiYeFFvZYEhQMS2V6/nDuNaEWJwKdgOSTi0LdDRydS+BgHWS2b/+19JluFDNKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988395; c=relaxed/simple;
	bh=PlVLeYruBRJgaOJ81jq4WhD8rx0PD7AD1SZtr3dJNgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhSsgmUsMer2G2aokA/x8KwNe62TamENnDqUoYCIfHpfl03ymNn7eo0NHA4vRND6Hgo9bwfNz5MkrYT+sOg2vj9JKwXHC6pJFTqgoHN6KnYmL4+kLiGhlZRVnFBsjdyv0icWvbsDmOaXpHLD+Spkc6WrYMQj+6qv+VoPY1V51nQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=n9JcVpx/; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=t1OqVxT1; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="n9JcVpx/";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="t1OqVxT1"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L4bLts528308;
	Mon, 21 Sep 2026 05:58:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=U4nkAv/OQxw7IH1wrf
	69MZbmdF01pNrEdDLcYwzyCgA=; b=n9JcVpx/Tjj09z9FH6fPbIZDq7Ydl0r8bS
	dnbUvgD1vK3+LmcTtPzMb4igq1onTn/jxKpjHrIhFRrxOSLAjA9sinfhxs/Vao2X
	bn/0SaXzBN0USZXFzt5Sch6HhR6yLwcUzzgVIQX00UYqcB95LIVXfBeapT/t4TNF
	IzIUXK+tMZcV9lllr3GfCppMQqI/X6dqDJ9t4p8/B2e/HkSJ8JNs3eQSZnSMBcTI
	RqcVFFxMKSGpeNoqzB6zaJrtWwu4eG2gHDJWMd8gopNuz/vx+Psx3byt45t129x/
	V7hyECM4qq+le7apGXIH0QbjVBOaH3M0Ivjq2aMMqgsSYtZDi3MA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022139.outbound.protection.outlook.com [40.107.200.139])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gsqt09vhb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 05:58:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRZABeJ4PAE6/RNTtciw/jgqu8mT1LTBqeaTttdskw/Vxho+5Nh4o0ay7nQagigfaezJLsyJ+JpjwwmYM9MiqGcQei84qvN4UvOMHQrnW6ERflmOoCyy130UURWlBPX2UsMdG286XjIxvQSiizH/bpE1ksQgExmznl7v7xO/ajSzrNJOEJZolH94c+E8IMuYFc6iyf5dicwAbjN5bB3RvoHB2n75gb+mOWH/+8VfYs513A4DMOidNNONveStYwVm8/XiB1rXLDq2Gq7H59mm4rxbYMovFGy7CAYKaMHn6TRGvb/VagrmH8m6DYzmXXKqYTHahvMPppx5HDE8uQmvLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4nkAv/OQxw7IH1wrf69MZbmdF01pNrEdDLcYwzyCgA=;
 b=Bdb58979EwFXiAKUg6qAwcenutrVNS/T13CqXUkvKmA1Oc3B6pIUd/RwxQFg4G9EoEwOZb7snqgSNkWxGW6DKd0GbMUY5v8672NP2vNyC1MfSUxR8P5cVRisy2VB/yYUOsOxxFq1XOe0BA6rthrFSZ9r/QZ+kmFx1WR2yr+lFjjcj4JyGPUz0DoYFD3rKRz5VaTYGPJVEMkee7n+NRaUbKylWcrUnVQZW0eFSHG11wncI1R9cfvYMZmgQohSJP9B+mM1ZHc3LMbtZe3qlrRkvTFmGtIp52KDymm6Uhj02z8lCNmu3BdJygTotcEaoe+tReLXzH3xDcMzxArtpdEgCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4nkAv/OQxw7IH1wrf69MZbmdF01pNrEdDLcYwzyCgA=;
 b=t1OqVxT1EqF0+XqVn99mi6Re5LCZSvIxhKJ2L+7G5CY8xRt8iy9eB6D+hPZNSS+m8d+9pUVs/aAmFtwWFIKlMMH18OlhyKEPxHoIaOmkXFFfrdQeCdqVGxC6gZe/BVJjCFzzmISwYYx90mluKhc8W0OQIbL8gq8OcPn8zHrsn0Q=
Received: from PH0PR07CA0072.namprd07.prod.outlook.com (2603:10b6:510:f::17)
 by LV2PR19MB519303.namprd19.prod.outlook.com (2603:10b6:408:414::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 10:58:42 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:510:f:cafe::2c) by PH0PR07CA0072.outlook.office365.com
 (2603:10b6:510:f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 10:58:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 10:58:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 207B8406540;
	Mon, 21 Sep 2026 10:58:40 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0A73A820247;
	Mon, 21 Sep 2026 10:58:40 +0000 (UTC)
Date: Mon, 21 Sep 2026 11:58:38 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Support Opensource <support.opensource@diasemi.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 16/21] ASoC: wm8955: Move regulator acquisition to the
 i2c probe
Message-ID: <arEN3gmxqxc3G0oA@opensource.cirrus.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
 <20260921104640.1941554-17-chancel.liu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921104640.1941554-17-chancel.liu@oss.nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|LV2PR19MB519303:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c9345d7-db2f-4f3d-f324-08df17cf4c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|23010399003|30052699003|36860700016|82310400026|11063799006|56012099006|4143699003|10067099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yMR19ipBgWrNbvb2TnkYFRp6+qXLBPOjI+prLMyMFuh9FEiBLeNTmxuDWwC1QVfpZNy7gaY/BlxBmSEfqeivLkZR7SuM+bal1n0mdK4EVBq9zYq43e3FNZz3uRrgqaP8rVcYeEV35kx/01D3Zk00vIWuAVAG4bUKuUP9l+kBht6wC3btfW/blwAXAljZR4jnTs4DqslTWMCSDIFJ1cmfuHxa9XNFCxrkMNLQNr5u/VhL7E5jYs0kVMmsgqGqV/fqktZ4uqJ0FJtzZ9sSghH2lfnRqaXxk3ohm7jdgkAS4/jBDqk0FQHRTUDg1k6w0VgcnFQzGcyy6eqXzU3GokM80VNTOnXn4KGm8q94bolK2zZWyDEgoMyLM3+OOrwEBErIE8KqmIsWjTRikf61BIPY2OAjIZdXCDy40e7Sua6+D/1WWgT/PMRW5GMImQzZwGfOwLTQOWxD4c4JjlMTDXTmaxwpyrhr6Ame5R22Udh0374tXvkvvGx+M8iGDGLVUJa4c8AQGHXP0Lig8hrhs8bflByne/Srdpwe5oFAxkVSKyy25oXJ0hW/cSvJgSRToXfzkOro0tDTwEOTV4J0qF9enRyVp0mPQVSAJFIyjw9dh+QPsavN4XM43G9SJp0MiMbv5C/FaRAx49x9nFJBwkOYei+COJNFYG4UwbmU2jYUAxis7j9962GbdmTV7h1kGsvqYQcrMm8WRf8zxl3wb6JbpQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(23010399003)(30052699003)(36860700016)(82310400026)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m65VoVE9E4cClwo8Lh3JAL61nkMCKk7tOmpdkDyXumMkXlFqS9L4bHvLrLl2EuSqOuiTRiWWOHyrLew2iWXxdlgAuy5ZRgbBr9xZ4iorK0mGU/JVkxR2tvDVDj5kMuKDEtbplcPtQCISj0j+FNRKPmjkqdzdlUedSvNGI2jZkSJfLIatDtxKL7IAXRAGOKemgmINK53PJbWgoVkA4Sswj8qdKHFuFbT+5y9wAdiz2yerVeYk9xwFIB5CmrbeWN0NJgA4DgDje9dSHVdqeNf976qbE14x9eDLsbdKoeD1VsAduuI2ds/p8VJN0QEGm45diloPIDWr5juQKz5rXDjThZYc2BeGnEXEreaPPDm/qREsQpCfK4uRKSBdy0bKYJTGgVbbZ3QCUN4L36SlF83wsWDHX8Lxp1EQI9d1LODkmWBKrskF/EYtK+mJNKZFawcQ
X-Exchange-RoutingPolicyChecked:
	sC6z1GD0rpdWQKyCJXu/MHBlbHKYtZ6V0Rsg1oyA81lfr+RgkvzWpPVFJXzkbgbtLPrESWhj3tLjulCHBJb1Yf27ai5sWMQAzoTBv56MzmB++m0xkUmePmfJXLa4VtqeSB6GnlOY9Q2DhbqEU1Gj4FFdxbasAaUFiUoemoAkocP5hY65wM0Nx4uelpbUt5jOIGt95V3m9/7SJ41ZWqDeqdH/GRiWNFG/otcgTx/4AK8W8hShg8uG9tMkXA5U2F1ZMw0G32kSGlchCObJNKaGLt5Xthae1yPSWkpxFNtEQrivTvps8TRR9WUhRtF74IZ7k4daGY7tLIDxieQUsGzP/Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:58:41.4324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9345d7-db2f-4f3d-f324-08df17cf4c69
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB519303
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1OCBTYWx0ZWRfXzSE7BHcD+ab1
 BPEf/WXK/4OQdq/gra+sAFTOC6e9DwSqxVs+ZjbJsRd3qQtc+DrFMwxbdn5RImWYJU91E2deoAi
 B40/H9J7rydEPhBZmetl4WOqzeG0o4NlT/g7BShPSitxRSmXb1VdyXlUyHOYdFMWACDKVH8JZH8
 cw02nJbmNuQDCiF5si23LzVP/ljdbA3/UfZsdhj40/CsE+1omb0dDa/uBGFhJQ5tKwwuMSOBULN
 XnYEVRLFGd8cQoaAC17AlWeQCiYwB0Wtu6OtNHpgoDQCpcGeKelw3UV5z22cbS3hxe3CuY9Jv6J
 Bz4xtXDfznchL2uCXsBMrYcU4BOv9djcF2VrUGCzU2rwuV4q+smQv+TLdVoXM1NLoRnxl8xveQw
 kyT4lZdAsn5avOhAEX4yjLKx1KxrqktCDq3dlo+mmCnnpEV6paC4PCoucQh5RfewFmHvjwAHVaQ
 1O9rgsylJcVLK1Roatg==
X-Authority-Analysis: v=2.4 cv=TPTQ2Fla c=1 sm=1 tr=0 ts=6ab10de6 cx=c_pps
 a=3IUGx84TntR8WEbolwO0nA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=8AirrxEcAAAA:8 a=w1d2syhTAAAA:8 a=vDDHL8stx0t2f8X2AoEA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: sEF9v4VDjwa-9ni7tEpDdv3c9YP6Blxj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1OCBTYWx0ZWRfX2ZuO0i+v2i7S
 d78grql26naUoEV1LJlyFaYp4zuoKezlq1bPC4tzG5A1//+0Vg5f2+Pm4C4aIEbPTdzHa/BIdlO
 tQwxvUwxord0WvSDD0nccKW0Hn1lbVA=
X-Proofpoint-GUID: sEF9v4VDjwa-9ni7tEpDdv3c9YP6Blxj
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 21, 2026 at 07:46:35PM +0900, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> component->dev is the underlying i2c device whose devres is only
> released on physical device removal, not on ASoC card unbind.  Getting
> the regulator supplies with devm_regulator_bulk_get(component->dev, ...)
> in the component probe therefore leaks the regulator references on every
> card bind/unbind cycle.
> 
> Move the devm_regulator_bulk_get() to the i2c probe so the supplies are
> tied to the physical device lifetime.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
