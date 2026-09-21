Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C1245041A;
	Mon, 21 Sep 2026 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984262; cv=fail; b=BxTz9KJhxpvedxDUVE4FYjk/fo+JQHzEMrZMgd6kCihqjMgduaJAn4ETwBxFsd9nfcab9nZZ3QRbFSe3JaH2n3oe2bE5MVNU8sDa2ExobG7DokAqNB6Rf1CFxEEkmYh1VBcmF9rwTckeHgZuuPdgbMMnaDKLo/EGEQGzXnWXDFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984262; c=relaxed/simple;
	bh=YpGZ6JWUoOy2+vVjf4mZw1mVISKkEzDed6MkBvpnmpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egabv3tOya5ZsYD3Wlm30qHmMci2zDFy5WM0SSaC3KUwQ/SEbyyjp0D8yjq1n0kyy39qqKTNYXOtMoek2v1W/wCqQUrxUOjy5hHW6qqfJxaQBGGBEP9j67k8ejqTe45KSUVIlmdAmq+fAyH8Ggr1B9D7SvaAtnmKlC0DiJrl70E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DYz2g8EN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QjcO+q8I; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DYz2g8EN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QjcO+q8I"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L5itsE638370;
	Mon, 21 Sep 2026 04:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=6cMWhNK99tReyi3udy
	uAbLMgozXvEToWzVMMYq4k+FQ=; b=DYz2g8ENyo+0A5d5BorVr+JVqv9Q/8cGt+
	kWpLhE8n0BlIXkZA9lonfsBVSBRIygFqIdEGs4vZ5jiOqimnZ+pGynQzJipliN0G
	HD25gHaNvWvUvS8riISIlpENKjU0/Utogwsa6FCcYPFlwzzJ+SikyK+mxv6JcIDv
	9lOef+U7jLTMxxBLYHd6YKmG0T3CK2WNkscWCIGA6B1I59YLlFWy/m5u+ehfloDl
	CyLT50Ab/3ZaakDJ/Kf0wNtPpppDaurRGyQhd/0pCa5M0+Z02DI+2vaalEhraU9z
	Sw+Nz2jjptZZIT9zQkriRFLHLJPSFJLpY6/aHlmymy1RX7ScgTdQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022112.outbound.protection.outlook.com [52.101.53.112])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gsptj1np9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 04:50:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liuFfyAb4TUgCGdW19lkydMVMALocInhQMFRkzG+fOBeq6yL4Hg1hxcK1J4R1+wZf9Yu5h/uIo83/0T7ASttck/8WXU9JjztRC1RH5RlGPGXW5IhJsyWMW87SKNlMch2mm6w5iE/KLQ0PEQn13zQJhK+AaDAj9wYWPQ1Haj7VD/nCDCpXcecIvAN+jmf1MHcEkFVO3agK7m0wCHFLyoC6DkUsKw3lQNhb7fYdAQQwFx2TGk1VfmZCjCd9pIQmcESD9ZpubBvnCRvqIICrsD8ADLkqBwvjXdPGGnZJr/Esjtr7ra8Lvd799AKzNz/LyOEMHeRAUDUb9dLA2loQLVcNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cMWhNK99tReyi3udyuAbLMgozXvEToWzVMMYq4k+FQ=;
 b=d3nqBSj9DGN2giZRRIrhtc7YCXAXXIIIZwdy1L/QTrT3pPDIhDcXLeB9jSCx5hxqJXbnYa58jCybo6/ADJEn795b9MEDPEso9ktguklUoZpWO+Ao2779iZHnKjLGFQ10I/Uh+6+3OezYiQbWLUjx1m85H1+1edyHADSwvZQ5anWL+jApc8JsNnpej7P9yFGpQx712ty5PUwom2IyyHaALhjd2pfXDQ3A56HxSJXxTzSR+5ELeTpgRgGmUzcBgz/SbeDRLvP+RNpA3C5JHGm1yEm5JwSAB6Vphj6h01JmLwuh8u8rfJOHpjFUgKOTLlu9E9uP44tcxqbwan7oXY1NEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cMWhNK99tReyi3udyuAbLMgozXvEToWzVMMYq4k+FQ=;
 b=QjcO+q8IGJXUeOpMCk113vdsNM4nxH0jtRk/WEluR2avmRCttF0wr1NiKP2RFt2IquoYWcjd+0oz2eWyhrPdthUfxMgayrCeV6JRAC89hT8ts6Aebeht2VKMQFZzg5o31qW3M4IFqaMloD1oK+xViHlojc7NAJY3qxbxEd3Il34=
Received: from MW4PR04CA0076.namprd04.prod.outlook.com (2603:10b6:303:6b::21)
 by BY3PR19MB5108.namprd19.prod.outlook.com (2603:10b6:a03:366::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 09:50:38 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::43) by MW4PR04CA0076.outlook.office365.com
 (2603:10b6:303:6b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 09:50:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 09:50:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7FE41406541;
	Mon, 21 Sep 2026 09:50:35 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6907182024B;
	Mon, 21 Sep 2026 09:50:35 +0000 (UTC)
Date: Mon, 21 Sep 2026 10:50:34 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 1/2] ASoC: SDCA: Improve scanning the SWFT during FDL
Message-ID: <arD96rzhl/sCQKFT@opensource.cirrus.com>
References: <20260917103400.2032913-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917103400.2032913-1-mstrozek@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|BY3PR19MB5108:EE_
X-MS-Office365-Filtering-Correlation-Id: 9efb4d30-6130-4a19-0207-08df17c5ca1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|23010399003|36860700016|10067099003|56012099006|11063799006|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	jkI+muqsbYkKJZLlJ3/gChp+x3vlriPum7C4MTal6wn0yPu6j9hBS6WMGuR0LQBHRZdPHhoEi7QgZ40yMmdIieC/aI65Nj5sl5o/sZi048nR5N2t323S2JmN7Sw7RNnNPgFNP37vHd+cssv9rq+QGTYpPEND+mc4QS3w53JoVgSUpI9Uk4b6aGxGbmNq4/26CrvYmGbBxhuCxovBAWTYQuD6J718XDsSum6WWHzHSgh9jQRsDmzSKzpZBgydkd/kvAVQLZUXpIDjxDuSKL7KasoscRxzKMVQ06OyxeJ3SSFlVW2WS8z7EP0K1eRxiNXYrmynHx8OzgvhJ2Z/S0oRF67HYv3SywGXSArJkn6lfvnJU35tGAqY2D+mgRslBk2V/T5qorDDOx2csqwD5kH8FdfpL9uUxPrSBEUO1jIWtEZi15m3P7d5KxRN7YCujbciX+CP7nsG5uIl6igena0mSv0cQ4hQ4hj+F/xFrqORcd19IB2NqXD9toeN8GHZYzlacdgXCtgqhfQaMv5sQKPeNJEGNHQrVJSQYrpVs3JaEr4UKri4vxVo//ukOudVeDL6OPswQJUHCbl+RWNh5PDhzUsmSe4KR/voVKMnEjdspd+I8lALrqZEI+vd8MXGef9ZRGAC00SLu646RKnTUijoNoCxVnVz3FheSG8VxU9wKEX+KN1qF0xlXce3mZ1psy3H/NdlzdUMnRP5pYhAfL+VOQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(23010399003)(36860700016)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UDenYpYldO1iLCE+xFK0uZisTWVKvzI09SyyTsAREjZxoYi+xSRlqtTBv4Nb5g6eUymLzA7b9hftQswY5qe+rcLsMQ6cNWjALqbvPt+6I5sAqvWzjua2wCtm2sqLpdAvr0Dt7xAZHov9VkgnqIQr31PUyZK0cFbGZz/2iLyvNs92u/Byjf30t60m+H0PQXd2yxoGIRXcqWih+xGv4gUmHAz/UFiSXIyzBWJgttElU1+xSmAj7DSP2m57y6mzCOAFPgv1UMbmupKk44xceI74PwKInerKyjM+NTK1dVyNbPqXnTybTGQ+3bgXTtAGqUfk5M92BcpkFgt//p/9HW7VC3uS5EXUINvQwGKmwPs8yG+l/8J70hhPo/9/1p6YAcLdw0643Mm9V/kacJgzyoJ8QzrHiGkK/oRGdAlzitYKZqCiMeI3zY+k2XndTqzpCGiW
X-Exchange-RoutingPolicyChecked:
	Ek+8SKCePuW1wi+8RLQe3PWKAk357IZYW9RtwVaLxNxQy5PYmQs3UPW3t9pNVHci0qGzX1f6hQJG8gAoSnbUoMWQXNfb79/jGH5K2J4RAgh4ShO7zgtU1ObuBnxWGUj0tad7jmdbMMUb9fBYm+dYtPj7EubToI7ebx6mhH2GIig6eqnEwTQWnkGOkX6J1Hpx/AAIAf9Rd5QFuqbe+0gQBJmQCxN75mck7A7FgaU3+q5oDAvC/Tdbpefhl4RS1Q8CaxAmQrgaiwWGB/fvgc1St0HQdFyl3BfR1vcyisvTepzQHsOnTuwkI8VyC5vgCIcGrLAgO23K1HUOQ9g7zbLQdg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 09:50:37.3441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efb4d30-6130-4a19-0207-08df17c5ca1b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5108
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MiBTYWx0ZWRfX9We0F583SHEJ
 RkUgKTWAquojVQk/IL3OHL8dp8J9pjkECNuk5RWNIOwK0MCLGQRF2d7ikzsYRAE4sz1aEdhg52J
 rkYC4YPNbRY3CSmmJjCJQKuCaAMpimM=
X-Authority-Analysis: v=2.4 cv=fuZJ914f c=1 sm=1 tr=0 ts=6ab0fdf1 cx=c_pps
 a=2hvfkwp4b152R1AolHnjyQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_2Fiplr56_ReIZ6nSQ8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=0lgtpPvCYYIA:10
X-Proofpoint-GUID: A4OfWiXqn_-7WdkhoJlEMVxWhk0Ewi6i
X-Proofpoint-ORIG-GUID: A4OfWiXqn_-7WdkhoJlEMVxWhk0Ewi6i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MiBTYWx0ZWRfX1QJ/jOLPxOiY
 mf9NxqupGoB7u6G4ncRPusIdLZsw93FLcFyopShGr7J9MwQPHW4hEFc+CzznqoDgY+MU02rDcqV
 Yht4sNlPeKPHCwLskUCTkYtAZtlShZmcuWhXtLQlHDvPZPp3HxCpoyAXzBWpuOXsuFgyFPMDOCp
 ovKRbw6vx6Cggi81xOu4CnWkH/US8Fsd9H4gD9WHlXdj35eW+J/+FryTKUPKu1fPVA4AK9U4YJy
 xM+qmWpmeM/2pTKzbX6iFLoKeie2SAEjAolss4ppZkUh5fGto5W5lbyWnLR+M10PO8ZlsFKNtzt
 t0g7XYG0EArjvxTjZyNj0eCHaMY5TXaTqh7qDwejLzC7rQNO5WzaevFzLZc6X1v8rBCrVrmSv6z
 h01APIcYTMCPP3gXWVkXA1661sbWMflgf1UfUheJcu5I02mImYCwx6nibP7GfxvuYHsbXMUYFq0
 P+9gUKt2yZ4dRObE9jQ==
X-Proofpoint-Spam-Reason: safe

On Thu, Sep 17, 2026 at 11:33:59AM +0100, Maciej Strozek wrote:
> Walking through SWFT is now improved to verify if it is not reading
> past the end of the table.
> 
> Introduce file length checks that are done for SWFs from disk to files
> from SWFT too.
> 
> Fixes: 71f7990a34cd ("ASoC: SDCA: Add FDL library for XU entities")
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
