Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4314908C8;
	Mon, 28 Sep 2026 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588122; cv=fail; b=UdfZWwWGNA4phBDM8rRlEfEGrl+/uolg7+tQkXEVAEBIYuwoMEiLABVTGwNUMAb3d+cqDLKhWxKWs5DTzntqbQOuThafZ6MWJ/WSE9RK57/ctZcVn9U8F8oD94F8ptd1BVmRKKrrqRjTQjYdGZbCzqYAqAi7BqWrUzS/h9DsQdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588122; c=relaxed/simple;
	bh=w4uPzDtKfZHZCLXu60zr4KgABKTJTH5K8XCTfPMgTG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKVOOVp3rNQdxEKI7vie5mMyquFSTK7Hx7U3nZzHBTqNkGcmI+9waYT+DUdsswVKI6x0zbjAj6wSS3AGp3q8grY7olYN/zxZnJaseFAlqueR3YHue5LFiM4CNPc+9nEdXC9J0h20aHPBoeP9VY+XyouUSt2xpVn/qLyE7bkcYPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DAP6mUb2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FELvaSsK; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DAP6mUb2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FELvaSsK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S8312w1054943;
	Mon, 28 Sep 2026 04:35:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ISzGnv83d0M3siFawj
	dCpk1gEqpIr25KZnTxuE240CI=; b=DAP6mUb26QNw9nvKuA0tVANkMCAAUyI2W/
	nKhumPiweF8jrZQ+hgdA8EY2KW70oLXCcKcs588QMFyk/Q8Yf+xZH6ubdWDtNX+K
	PO3NiwKRa8a9ajYjnwNkeiVON3jY+LKvfuq8mzPxUPaDY/pmo+WVPw2vSNvdXnjJ
	dKDwr5IF/l1H9YJBljmh/NVVSKEVUGzR4ye06rsOqOyROetwRptuL433+3LOP6BF
	lRErMRKFtelDF9HhZA9gajxesBSZ3WV5pXF+le+ts9CeI2nRkwosXDuPQ34sBlTU
	JjsAWgfokjo89W466MgSS//CP9cICTyLpQCT8rFxHGZ3sVUap/VQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022122.outbound.protection.outlook.com [40.107.200.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gxafj9na8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 04:35:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1EO0inTDt/XBFYd+fcRmFOOINtCxz6lklFh7eTwNKUiefUakq/IELR9lTBgTSx6oKn4Dsx6Z54WQvji00FmkRieCng7XBE+kIsWlKwzjBAP90zsDpZq0PL5TGfN+W5vKwbAzBFi+8DHubMxntwxJlp/3t2zJ1CffmKxjhBoP6PSpNyLV8gOa/qujUxjdyeo0BNV2Aj57tczHi3Bpa0hOW92C8f+5xNGzLJfbEyS61wz4utDg9fwPAU+XXoDTSV8lFn6GohzyGz47m35F5eYFxbOjNKHFEWbAA1rJqAe3T+1xjOaSSpGSxGsXNkdpZ+Upm8AsKv2P8SMO0dEvmzgZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISzGnv83d0M3siFawjdCpk1gEqpIr25KZnTxuE240CI=;
 b=BkFNqOBS+I5rBeDNW3R81IDTAR14uQmKU+ThO15uF8GH4uHjOPq13Ds7GYp+OYMUu7K8rDrQbx1t/m0glzCC8wmevMEeb5yAB9Ba49V7Y//otUCMmqPzP5KT0Vlt6gHUBBuJHguGkvzplC2/l63jCiQm1PILTdHg5EveifyJUStHOzbxI8jX6WwYZALSuKsYBiS+BCEXamJetnPJ+OPr5URqaVDoV3dTDHNhsSOx+1Hmgm5CTIyhbGyjh/Pl1RY7jO/JizSDqRsVLGFselaiTiiGv2G8pMwALooJG3D+QM1MMry5165u+c4Tss72P/Ofw6IRIITrkbEHTJy2SxCwZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISzGnv83d0M3siFawjdCpk1gEqpIr25KZnTxuE240CI=;
 b=FELvaSsKzIzmmNTgimBTAJUSfs5rMyMrSrSNiPGAUPFodlpfbxYgbdPvFD5W765lbePEOcn1JnBPJ7Ohuen07eKQRnR2HEWkAcvD3VmFtogO/BEpsBMsbv9BlV9OmpDRHAv1UOjJeOW5zXmyGl7YiNJJlvGrU14w+G2IrvIx+N8=
Received: from BN0PR04CA0112.namprd04.prod.outlook.com (2603:10b6:408:ec::27)
 by SJ2PR19MB8028.namprd19.prod.outlook.com (2603:10b6:a03:53a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 09:35:03 +0000
Received: from BN1PEPF00018546.namprd05.prod.outlook.com
 (2603:10b6:408:ec:cafe::4e) by BN0PR04CA0112.outlook.office365.com
 (2603:10b6:408:ec::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 09:35:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00018546.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 09:35:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B2149406541;
	Mon, 28 Sep 2026 09:35:01 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A01E582254B;
	Mon, 28 Sep 2026 09:35:01 +0000 (UTC)
Date: Mon, 28 Sep 2026 10:35:00 +0100
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
Subject: Re: [PATCH v5 5/7] ASoC: SDCA: class_function: xlate sound-dai cell
 by entity index
Message-ID: <aro0xJmbDJR+jaii@opensource.cirrus.com>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925161049.758913-6-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925161049.758913-6-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018546:EE_|SJ2PR19MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dddbbbb-93f5-4cd8-e447-08df1d43c5c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|376014|7416014|82310400026|36860700016|10067099003|11063799006|56012099006|4143699003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cKCf9nJhjnazwqgifvjbe2Tc5Q+eU6xAG1FPPnUmLRXgh+WNT0WMgjqvfILBIOXw/zR8h5KcwxE4PDeGY12lXY6ZP0wh6eyrS/anWjwKLYegi3OqIfDBAP4AKSSU6JdC0C395RZ8lvUqe3ma4y4XMBeQMK7trs6boXVgpArGAnIaF/5u5T69QRBDgxflC6DIl45KR/k41NUnIjTsADiPZOx3zdw8bZ+imo1VZjG+92WdIbEiOJ53mlw9+vlyEUKLTIDIr15wkwDM54hNJqvp+sSrMVhF5TG87qHX2gegIy2lTl64xteuInmKSuWvymOomxB4VSkaPBFIuWFh7tthGrFnMql42zrYisMJ0k9Mro3nrdb9pmYsbkPb+InpOO3D+OHZZ890gXlffRAPLa78dEMuJioUlTmlc4Kq8xpages6eJBclqGNlbLH6VBFFb6LikS9IPs9drP5aEUW5x46Jc4o09ZYPY2W6hAN2qenCOwGqzaPhGAeifdMl1QtI3n+aR8H+G5IG0HJIBzCkR3He9ZGhTv20rbA/mpZQliF7/jG94QQksoovSd4MTQ4cHoQXR87IRxNVwYjLOsdrBxGamGYOfFDrfGjgkHpG169vFb+5fXZfWKoO2XxM9iVTzuKOszjer6fyBQNIr+JzfL0WFuJfuVV8DLCJM9jewtj32hXrjlCNpAN9k+LBlTohlX7eNXoOFE9HY6aE4y56zgIKQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(376014)(7416014)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(4143699003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iRZsFV9XJeLSnd6HrnJeYCWlooW5HYPOlitcCyDSdP0i0NDJRQBfnohKuTF4zMQPjqspVBEZETUzp52RFR1LhSZi2jmgBEU8o1KJzL5XsYGz75eeeG/et3o5yJfpsIyHUIlj8mjd7vXbDFfshZPerNGcM73PlTr1UUQ7iU+D3+28EINo+XQ4VgI5tM1AsUltD/vqKD3TFI3UW1ZMCeRTg5mfDK1JAZU6467/sgRnf/pla0FRju0Bx4ZZzwmuCJOLLNYQMLS1OtHStGz1jsDIRFeSmfTEEPzWfrScdcHsrXjUblwfMjbTDBwdVRR8jfwLUuaPDhUy7rzlL7REAXfW1NClqugw09ZwL+7+5MUf5rNMZObuvZzP1nTkEcJZECPEQD9xjq019syXU0O8uDb7/9WvlobNwVLQ3NXTiIi71ageK+NCGmgc9E1TSDt4UDUk
X-Exchange-RoutingPolicyChecked:
	OHcE1YLeaaoUykZQ+sXfOLohvQt9Kn0i44tlYP7HpQJZWz7O16Uby71kn+c43tDDgKcw8EUgW7XGinFgJC3ouL/P6DhkLTK7iH9JLVBET4wYNwF8gTZ40Kbmdr+NWvO0ixUDbPpJ1ydRiqt9W/v50bhLKv5g9fr4op/kwQyV9zp9PH4vWRzAkwqDx0NMcS9I24izWQY9TOKXV3aKKcgo/OATqvVj0c4p9KwtsVSE80b4pbO6WBRWjSSG2iBc0XqmqojDPW5Ly7OErCm39DiKdnBdaCqjeJMRdhKpvjuNvsP4njhcEvxuGp+MX6nD2DoNKnBUDtbb4Jxc3JhCa1ihxw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:35:02.5536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dddbbbb-93f5-4cd8-e447-08df1d43c5c0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00018546.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB8028
X-Authority-Analysis: v=2.4 cv=GtLXaU1C c=1 sm=1 tr=0 ts=6aba34cc cx=c_pps
 a=jsJx5cRpnMcsqjM19+T+dw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=i3qBgx_jpbLcSjbqI3EA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: _hOqHJXot0yn95wsul3LS09lfVoas3O1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX2sh9MFdBRN2I
 evt1cM/Z/f3OZ5af6LMW+zgCEiqSxU/2Ourl+Mvrt7266wY91/d0F3krRD8D+sIG7WTvfxTgMGU
 kBqbL/C1j4nVzvFonmq0oXkURsIKIg/rvT9bJzgTA3JviLHpvV0ptrtlrTV/G82/FgPftfyn5Gd
 OA86yxffIXCD36xC09aGe3ZGA0bYAQtFJBnTXi/7NA/kmUvPWIQdcWMciHuKl61oViJnqqfm9yz
 KH2o9YsrIkdHVJKtuv7lFeu9ZWTWS2ewT4ytLpYGhvfejZ/cUSbma+Kc4MxtPJOn2GHhlWVd2r3
 1SOkL5lS+alfn/v8/ZAdBrioz9bXHo0GlLj2+CSaGyqbmKY+miEsAFyRW/TEHF1FxORVmvr157l
 mvzq1YyE2uxprVUKuvd7mAymlt5FKu5YHabGaIR02e4xAQCKa4kAcTIWv/lB2zz/bP0QtfjAF66
 i/fyyXH4mgqSS2JIZTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX3wk2Q3RhDSxi
 ntnhTaw6FYAjg1VdfVntPlG+8DiWx+4fyo1KhvoHWFYlUErnunwVOBhpECFp21h2M8ygVpDNKFo
 GcOrlpJKQD6UaOkXjTlc+U3aYxbDZHA=
X-Proofpoint-GUID: _hOqHJXot0yn95wsul3LS09lfVoas3O1
X-Proofpoint-Spam-Reason: safe

On Fri, Sep 25, 2026 at 05:10:46PM +0100, Srinivas Kandagatla wrote:
> sdca_asoc_populate_dais() sets each DAI id from the SDCA Function's
> entity array index.  ASoC's default of_xlate_dai_name treats the
> phandle cell as a positional index into the DAI list, so on a Function
> with non-DAI entries between dataport entities a sound-dai phandle
> resolves to the wrong DAI.
> 
> Register a custom of_xlate_dai_name that walks the entity array and
> returns the dataport entity whose array index matches the cell value.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
