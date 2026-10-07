Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DAD47252C;
	Wed,  7 Oct 2026 14:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383077; cv=fail; b=qd5ZU8zHA/tuXAvYd2nL8WnpldDWEbAvSyGaubVPEUpy2gAI9MKIK94BRVXF7G26ITN5LBc0xR2bkWh/H8lONTU16w/09/VLYs7ogkxO3jtDdnBblzjQtN9XUKcH7yefs7tvqSGxDwyTFjkVJc88DuFsJZuXNOgxHsiIdZpxdd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383077; c=relaxed/simple;
	bh=taKDVMgYEje/n0JXqpnX0yXVD6sC0Glp6qIihyeZGLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMbrXBmQjAEUB0J3/eUyA+bS8IjMF+VP04QhZTH16fLj6sdGsXBEmRDoV42pMoO46+2Xhu09uAlFPAKX1jENiuCKLpq6TNTgaO66jE/aM6dYKVQamr+U1zzwFKEhRBTe2N4dFrffyemECCorPJVAd/Y9QVuj4jQjNgHi1SzEEdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Bs/zF2Ka; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dr8ajU5p; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Bs/zF2Ka";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dr8ajU5p"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697CoLUh2398219;
	Wed, 7 Oct 2026 09:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=6Faa6YUyXq+pnrQ5HT+FC1I+shDJgaDiAddmHkErmWw=; b=
	Bs/zF2KagLRPyMMPSJEbHW6V1/BS22LsOhU3tjiyitfbBJn1eLBVZcVOD6EQsT6B
	smB+c4C1V6/+oqb3LU2joUyoMQYMl2TlXPyr813wYRVfg2gf/9gfJPzaDU5e76FS
	0VvxdzqAPOgXUjuV+grJikkV39gyFZCn0wHZWDq02NFLEj/sC/rYbHQbTsAeSjJE
	UfISmrBLOI64H8gMHweQ/PdezLds+Xf6tWeEvTpSenMJjhmkz1PgZy9wo88rCoJC
	6N4QA3RzWFnbUc30dO1dn4vmE+1KPN/SwQzxritY9hiAnF0gNjtB9IfTLstMGrhv
	eKmzFItZ+tO0wvqzmJlnkw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022093.outbound.protection.outlook.com [52.101.48.93])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h2x4hded6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 09:23:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTc+GWOkAkRAUnTagDhD8l2F0GxQ9eAvY+t7xTjO3tL4unDkqiTOoekbs1wxnsnvtjkkMGoEgu5oBUTVb24cg97T5RVdFsqwuKq+6WypbP6r0DM6JyRuAMruogVK8HsxBFFp5ERJBbXwR6+Nu9sDMzl5WR8pjf9hecKF9fSMvFPOP4+9fq438a3zXcR+09VO5Xlx6AJLH7IbiYRIv8id3X063NlJ6pqpIXfaj5rfy4BJIiX1nS3IjDlhOaICkKZydqbDdtXo06KFHGVfblFmMLhBBgVTxUTwHTSDtHxEUEk22CdMafCJKNahVLkv1Un27pMWtFs/98oq+sXpO/ZQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Faa6YUyXq+pnrQ5HT+FC1I+shDJgaDiAddmHkErmWw=;
 b=PjbiEnsmg6NiBb8576jaBRmaQCW9uPL9iZ4wxrsofMrJAJJ0mISrp7iZ1+PnPTHCiCEe4X7mq7VB69BXnn45RM6M+0Z5DFCn7AmC3iMNWetkLsemn1obDSk6snys4cJS4E3ILbCEAzpGkFQw5E9RUZ9BZkFkgq6bFQRKRkPOf/Z4Dy5Qgo9m9ZfRtBFJvhMxFNig4ddKzDf2tX8niiQKNMRNf/2mkvZKj++cC5UIVYhNLXC/NoD9Je875x78453Pl+hmgp/ampDdhH0eEN5gqn4bOC13CrAukx+WS448WVG1LLNZ3HQo7F8fZ09W1RIPuIzoovPDWJlinZVmlMRoig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Faa6YUyXq+pnrQ5HT+FC1I+shDJgaDiAddmHkErmWw=;
 b=dr8ajU5poWR90ajLZfYfePI0E2itadGODl8xA53WZpJTkxUPVPIkhcInU1u2+Hi9l+D1d6DUCBEJ0jrlTrtKIGeWYr3NhFmMuFJ4bbWtQSXxFAq0CQ7TPe5XhWApFrxPB1vQz+Bw1pUpY9Qb35/gTGNpbEVSIGz1Vrg1Rl80sK0=
Received: from BLAPR03CA0102.namprd03.prod.outlook.com (2603:10b6:208:32a::17)
 by CO6PR19MB4739.namprd19.prod.outlook.com (2603:10b6:5:347::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 7 Oct
 2026 14:23:45 +0000
Received: from BN2PEPF0000A98D.namprd04.prod.outlook.com
 (2603:10b6:208:32a:cafe::5d) by BLAPR03CA0102.outlook.office365.com
 (2603:10b6:208:32a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 14:23:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000A98D.mail.protection.outlook.com (10.167.248.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.14
 via Frontend Transport; Wed, 7 Oct 2026 14:23:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 43D9F406544;
	Wed,  7 Oct 2026 14:23:44 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 283FF82024C;
	Wed,  7 Oct 2026 14:23:44 +0000 (UTC)
Date: Wed, 7 Oct 2026 15:23:42 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 08/21] ASoC: card: Let 'fixup_controls' return errors
Message-ID: <asZV7oBh7jQ6wk/g@opensource.cirrus.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-8-7b47ed6335a8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261004-macaudio-v2-8-7b47ed6335a8@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A98D:EE_|CO6PR19MB4739:EE_
X-MS-Office365-Filtering-Correlation-Id: f42c41f5-93ee-49c5-b1e3-08df247e988a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|23010399003|7416014|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	owyP5CetnvCblmJhgtDF+/GSvHj4++Cz3zdL+Ohr6NTM11634kK2EBIS9p6W+zmPMXzpFyEgkk3/gIrY0iJgpld/JdkKTbNQS8V3EYiTraExhExm14/tqm3t9r6HhJaeTFGJN8f95sPoT+Nc9ky0z3tKJMLycGu+y/81EuD5SadkUYKh2PmMCAlmFwaxXJrQyJXmkJqstxT5oSGwOjnqfA0+Y/m9+y9Rfx83ro9RTOjHqV9X1Wi4zP/lJALBs2GeD2r3A95S0LFPusssyUok5A7jGKwKcEQHE+8wO4Zvv5X2h4MMbAEqufRwKkM33MrecXVQssA4Mhe+mVR/6U9LngNDbzbxd2WiGwgdXwnyvjAyH710GiV65iRvEDoccW2sv/GXAqtaH4GIlVy3r8bVh76+q3fO/yf6Grlv4yDhU0L0fH+CvbPrCSGI+onWl5TaeQCbVW/1CrH4JhU7rcVxbfWGD9v1ssUbkiDwlzNUDJK1+WYXbfW+OYPH5+ZfFByUkIWkfwEuEPcDOz/RZHfwLIwJPGfh9TuW2ud1qLJRWZ8SgD7B5vVQ0fbi30hPeR6iaHmK2wyLdH/naA7FtHExzpaDH7pLwVPtYpVDxYqXu2Dd0Y5J9iyX8DvcQK1e8dyEbgyLmmyDent0ead4yDbhs9XxO7HeHYAp46iFrJCYo4NmgggYevI6AFuY0qCPbG/f22iAcqsVkjnr9mvfs4fFRQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(23010399003)(7416014)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ic6UJq6y5yyr9Hg0xI/jgsvkjpx3fo5plglbCkCGem1zy9NjtwpiQfnS5oeaDZnou2Y4eFgxML006I3uZph9M+7iDByV7yPY0SzFpfp2IPGaTYlVRZaMQlpk81MvkFOi2r5d8+ozzCkubG2+wjYFpoaV5uMAx3+MiUx/ZNGiXcze1Fl9uhOz/lbWJM1hq/XPisYIOHOiAtwo4qOWUiuwbz/jcQ8wqFwSo5PzbUp4kyy0khB/iKHpSFWRPRT6kpY6kp63mHJOHxtu6ayhyZ8YlkGEYn/NXHkTMGR1JsqtzsSVluskDiP5M69Q8kn6vmakmfGTR4KGUQsXxycombmovlXtUiKMsDhLyfHTVmuN97vugErdMAhHChzhYGyoZ3bqaxz8Ds2EGrehU/s2FR/wN7wlHa0VbGg+DLkJRlfPkdpTGUFfNoCtVTXFHxsPILRP
X-Exchange-RoutingPolicyChecked:
	UIXRT2PTQg9n3W63CLBYZ7A1bk/nHHPS9KbJT3fnIqdrSAgfoFqPB5Wk17lkxPZQskCRVV/xNkqjt/sNN260TekRD9s+0tbO89UNKDf03GNMcdMVxKQJhY59YtEosiSjiL5bQAQRqevn4oun96Jro/Ic4u+Fe9cmw6Y9NHDOnN669ejPCLLu/R6gi/xFvP7B8iSpZqGsjDuzSoQgnxz0q3XcEbZUM3cNiezxRuQYoVGx/lLj34JB+VqaZCUrH6ounPd4akAlGYmjLxBD1zhvch8lIHkClsWg5ye7nxC5xeU6bJ5kYu96W9K5BNhvedP6/66QjnzNAG8gLYnToK4pxQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 14:23:45.1469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f42c41f5-93ee-49c5-b1e3-08df247e988a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000A98D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB4739
X-Authority-Analysis: v=2.4 cv=DuLDa2/+ c=1 sm=1 tr=0 ts=6ac655f5 cx=c_pps
 a=9VIIl2UxNuoJMDRiX/J/iA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=NwbpVL58AAAA:8 a=pGLkceISAAAA:8 a=XBVY-aag_y0Ah50fz88A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=tNWvAHffTtQgx3ZTRG8Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1NyBTYWx0ZWRfX9YHDzlg7QNWT
 d4I0KTQexbcGL1xNFXA/9ij58vIdQUZ19J4ZiA/hOVFX9y1/SzNU7IRNJvLndzPji5tAY9cYJmM
 xzEX69X+hg/NcjOLDItDenNK5nISe4bSxN7XZZ9mZoNGzKYEYZlGXQ5vfEd14oe4hLJvIh+hu9X
 72mQ0yb5rLEfswNdnUpy277M7ebaIjMAShxrjYBjbqpBGqnTWG99jqPdHVUwBDwPXNs6gZ43kKM
 2tN2PTltBjchIyiEb4O2LuMZfU7PFtNcTPMtrZFgi2D81zAg6Ag5UOpkgWFOKBPAHrvtSr+qBWg
 5WT+iuQVTYsK+wg8hvzEP9XrREhfJ8ZAlzRx9V9/R2+IJQLWaaqld6wCSvV2auXEOUMT+gmq4Mg
 7UFy/8qtlqOxCiRnB/95tZ1Nn4lrOPyfqKbKPIE9cVE6vu+Chsvb5lXA9wKZhFElKQp6JnZDqwQ
 uJdc7W72898rngbnWcQ==
X-Proofpoint-ORIG-GUID: KJCXY8_g7A9Ocx1CQO_JX0pHQGpG-bLM
X-Proofpoint-GUID: KJCXY8_g7A9Ocx1CQO_JX0pHQGpG-bLM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1NyBTYWx0ZWRfX1oMak7kooLJr
 YKFu+46X+agAFo7teGWz4PogUHG9x6FEfqMYnYnb1Q0SD/roGV6ZMmPlD/8QEUg0ifvuc8UL03f
 2j85LQm9i/s2X6BhPyRa668M02j8zuU=
X-Proofpoint-Spam-Reason: safe

On Sun, Oct 04, 2026 at 04:03:35PM +1000, James Calligeros wrote:
> From: Martin Povišer <povik+lin@cutebit.org>
> 
> Let the 'fixup_controls' card method return error values which will roll
> back the half-done binding of the card.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  include/sound/soc-card.h                 |  2 +-
>  include/sound/soc.h                      |  2 +-
>  .../soc/mediatek/mt8188/mt8188-mt6359.c  |  4 +++-
>  sound/soc/soc-card.c                     | 12 +++++++++---
>  sound/soc/soc-core.c                     |  5 ++++-

Fixup is missing here for sound/soc/sdca/sdca_class_function.c

Thanks,
Charles
