Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B903ECBF5;
	Wed, 14 Oct 2026 09:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971254; cv=fail; b=Cz0VzT7oTYYG4nAGpyLoZS1gfTvoK2KWkYNTN4Q6OD1eFoUiDOTHduQzeHF8h6crf6cO88qZfvdv1LCcT3T3YxV6DZa7z2gIUDsWO06WK9xkOkskMI70G2GcYIa2OA3M+L/u4DWRReUFgI4H6T4xeczfq8vhIQpBG4CNXg8N1z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971254; c=relaxed/simple;
	bh=66FfO1DYxTNcE0SlyJxCR9fK4XEgZEtUO1MFZxIP7ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tu44hL29gPD2Jwe0eGJt34/EGe6A+UzKWoUmP9PVXWKqVYPDdyzo2m13RB3ILQTpAqHpTvG57NfEMwuoJy+oWyXeEWppLzb/PhIn59wq0M6D/Pz8XERWpkmjsNt2lBYmsixLUd5DIyRtFdAkAsDVcXNdx51Pgkygw6hQWyqw9bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=I+BbHjOg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dPnBlEHE; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="I+BbHjOg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dPnBlEHE"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHvdP9745857;
	Wed, 14 Oct 2026 04:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ggdIn8fljfPiy3yjqL
	oL9Gs8KdUi5XeF4gsncmUlPyk=; b=I+BbHjOgHbTcziuQAr5wJVauRbqGWjG/jC
	4gZ3v7aannn80FlEikD771NwrmTedisNko104jojVfiPacYk1LRcr0nNIyyvnhXH
	p4NnEFzHXWwVO4T0Tnn/okFaTRcpNAy4K2a8qgBCNwnPBuv9vH05Fydvbz053Jtp
	oxErJ7pPR3zJs9DecLI9xQDwJ8xkTTto0hjx8W/5eP8zsNcUrME16711WACgpya5
	dA9xrDFcFbjLSLIe4D+vD+KfUzICd3CyXzO1vWC8K31WF3XeaRIrZ8ptlEdg0WEZ
	DXkTls1wNti0Fn5NjeUu0eIQnW+dg9w51+6xwBWBBlI771zBXdAA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022120.outbound.protection.outlook.com [52.101.43.120])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h7hsg5fj2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 04:32:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTvkGVEljuWlifVMfamTyswpXk0QErpikja84WTOb6zrj4IWAh153CvXyKWfBREDIt6CcErjTl//xWexgEu1HpX3dOBeJ/YohOcKOq2Kx5xL7C7UD61ygCLW7rkzQo1fScoXHo1pxcpyPWZYmIQzOvTQSxmlXCcTZOllbkbjBKPPq7esTfccP9Ng4GlBgZq9MbyVq6ozjFS1pUHq4hVwgUqOaGRzBT/1OhdMeOfyjw4lm4tl1YlY+1Ai5AN7SL4xKb17vz18TYg9x+mNjY468EDLXmJ48h0ABUp28nqIIRRNUIFMj0c4vbWtBL8cLUkSPrRE9QjB7ISMFvYLk414cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggdIn8fljfPiy3yjqLoL9Gs8KdUi5XeF4gsncmUlPyk=;
 b=WkWKFESqU4gou6YofpKdl+3Dj4LdyFnrDnJ0LhGYA/OX+kewXMUe4Z9657d07iWWemBhHjSD0ubCQCDAzxgszFSjYJ3YbUKu3dZyO5Cqs5ZWfjaf9CtznL64/FLoC/54rKBLzUxdrN/0/pa6a5/ROl3FzW/BDG7pG7PmrGJOk2t2c0bA3p5RKR2kFIWjqyuJ3lvOTM14ZmzJsRDSbjL5w2HViX0PWMXohObATypojl8r+5Rl5zQsmCz/LG6Z2hvNFy8j908Vu228la1Evlj/gQfsyVfvYqwmHduJ/bPXRV42d0cOYLcyvZjfO1y24LHhQykpf+/b0DMv3c3o9Mi9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggdIn8fljfPiy3yjqLoL9Gs8KdUi5XeF4gsncmUlPyk=;
 b=dPnBlEHEczoVLNlENQxXgFPkm4wfPdjVgMicx78M94urrEx6MR80H9EIoKNGIff4yx1YouP4QcYM7PjDg9M0C3tj6tOuYk2mWIenO/OwMvpuKSfrj4281YbSHJSOABnOOqmXGmv2vA/+rKISO6Gak723TvWN4EOr/CDRAOdsSCY=
Received: from BL1PR13CA0354.namprd13.prod.outlook.com (2603:10b6:208:2c6::29)
 by SN4PR19MB5392.namprd19.prod.outlook.com (2603:10b6:806:20b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 09:32:18 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:208:2c6:cafe::7d) by BL1PR13CA0354.outlook.office365.com
 (2603:10b6:208:2c6::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7 via Frontend Transport; Wed, 14
 Oct 2026 09:32:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Wed, 14 Oct 2026 09:32:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DF0BC406540;
	Wed, 14 Oct 2026 09:32:16 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C6D48822551;
	Wed, 14 Oct 2026 09:32:16 +0000 (UTC)
Date: Wed, 14 Oct 2026 10:32:15 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/13] ASoC: codecs: wm8990: Fix definition of right
 input PGA controls
Message-ID: <as9MH0oYUqXZP1Df@opensource.cirrus.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
 <818cf8d7ae81fa46c67cd5b4d01291a63f44c9a1.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <818cf8d7ae81fa46c67cd5b4d01291a63f44c9a1.1791959026.git.sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|SN4PR19MB5392:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df6734b-638a-4aac-ce78-08df29d60a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|23010399003|376014|10067099003|16102099003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	hNQSYEQ6zNPi3lzOjbycsWbwyC4WiVw38r+fIq77Ogr546VkLErWfOWf2eLpA5kKFa62dpaIPpoIdtE4GECxhvQtnMPB+u5WDyvJnPqh/IjMFl5oKFVloQXonJ35J8rRsEt9wVtrTiqH5Zz9aoUVZ8BYS0w2izEr6xvvG+DKSHtV/ztTwrg6yhCE1Ra6XJoYzy/bcBGCQA558yebysjXKS+paErytTJvQnBYWFoiIuy4Umc7DvMgIOPhXhbQysdxUaU2RRU4T/ywXTZgpPR0JWlUXRnSRMB9HpmK/3WRH7javaKufwHZxrJeLCSM7F5qDemMR93m7ZAMuBSswQy5qYwsDUDf9mYoKeAolXwhk5TYSGUVACx/ZxRJgX6P3eMI7L4x3mEYZQsE6jeWpwqyEhmw/AIHDeW9KIrI0mLg+5E04caCl9IpE6ue46fs07tNfRpB20rKO0nS1bjqptAHc2HePtUo+lpK8Q97nCDQURZ7fE+cRWk0WiOQhFiWxdn/hNUhxtN4Y2splSGDY3sq5PJ1n1Qx0Ppkhk8J4OLAlrW/GZuwGqFopOQA0XnLG7h2qT+1Y6/DGDVsz44q9izoCjmIHpKaICcKRqnvN2rsfh6lT99I6TVLrq9RoW6OvPtN+aW+pKhlXVg301o+uoUkzL6sTYkAFfO2mj+WUM2msbbkhSiHdwSwq5uWH07xotLpOMEbGKOdWQLm4Au2WyLFYw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(23010399003)(376014)(10067099003)(16102099003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L9Ixn+ehwJJ2QVbQLzvXm7HJ5WzvId0GoDFdh36K3cXSjJ01H7IB/xohre6XkoH3k66PZ1WCPzbhTFduyvXy9TcfiDRVa4AQTnBGYix/hRdeJyLZA+QTFkQpjOnwxPJEZKjEEij52ZLJ2b668nkafnFdBGI5kyANWGr2XulfLXZJ5mBAe4E6DXnaXlSRzMV21myXsyZfkEDK7D2BsvryqjEzoPrKAGLDxOPWkSpiDbcA+ij8050M/kzwQcBaWNJwYTNI4YdAY6/XJ7wF8vfCey1ujftwDGz5I2hc6EzolJ9s1osH2Y033merzykw+j531pG8Uz2ZfZhJDvAUf4bAjVwaocK/IQzfzJYVc9xQMBiYpiDwv/8EEHPhPkAod75HAZtwc9A26QhsRWgLKfHlEU6xfmYsbqcmwlKQJHOjBILzzj/QKTkIsHKOmPwPccjS
X-Exchange-RoutingPolicyChecked:
	1oeEFrTG2uaz08SXZDYpcX5vHiPV7gDpz6+sOEHs4rqx7B7PhuCaBYXxmgC7vGfY/yN3tMD19aofBUlGdDnrvGRLu2L8krGmUE69bExuBnMSt+8nY1rhAlIHUNqpOJdmxqwnzq+oxFEcRndFoq2gYUb+0w3/BF0fdTQ46ezhHpLmdKvdOioB2Nzvzb0QIisJxII63qwoS0uQCP5lYNufjIfm4oiZBRDHEOmjqPxeAqbQcXRagtewtngA1Xw8aUfqWZVgCT1WTnGEkPbpBs7QZ1cd3AqAUZ3wKyVfL9kCcgX3t95M9iNbeaMwLnkolDr4AvaVuz6oWS4kwZscQSGmIA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:32:17.7681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df6734b-638a-4aac-ce78-08df29d60a25
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR19MB5392
X-Proofpoint-ORIG-GUID: D1rvgi95qIfqL9ZT6-w8ejt1e5REueAb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNyBTYWx0ZWRfX7l0P/hGyotA5
 c0+nDclNBMcj8JCWK/6GP31ih7J818UXuASXiM8D3RAv2+ffADBmPFaOF/Gv9HzOPwYfVzTbkZk
 34tOihvZXp/VQqXyz7e4femO7e3XkUY=
X-Proofpoint-GUID: D1rvgi95qIfqL9ZT6-w8ejt1e5REueAb
X-Authority-Analysis: v=2.4 cv=QufLTlyd c=1 sm=1 tr=0 ts=6acf4c26 cx=c_pps
 a=lYPjzR6fd3Dugfv94BBcLQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=jlZpQnmUusKwRLR8YW8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNyBTYWx0ZWRfX7ur/mDRHyu/W
 Zx85xkEHCG1x1BU9Z2kV8qXAlaSlue5XFX5e4sIdXc48gWWwWe0JUdyCIIxG3tIyLNXxWZ9ZRcL
 y1XW90ZV/iS0KW7mb7SYvaSOHw7b/jqsf8Yn5nBh8Yxse8++yLXcKaOlFCnXa6z0lBDs2d+LJky
 u8oxzyGnomunsqI8Z4SPs/m4E6dbM7iXgXgMvlrbyfiV4zn9j8spexL5c1A1zsDV58QkYLd+lIP
 yny3w6+WD0B5tASmlDVBQR5ezOPIb2kiEiPWMHp8Zsa9TLqw3zChy4H41/Ani3wcRU3eOznfyUy
 luCXImRrPj9SLmLgB1u0PoZ6qyCR4eY8iK5FRNbCVCgBGDJg9RBngMamb72lAVWtl29mGmmTYVh
 UjGkAYLbog2Rps/M4ldACJpzCN8rmrStgia2x9TIblk8jevlnr+D5bNs7e2jtvFpgGKzm2CJxhJ
 nSoaafhNojlErF9CW/A==
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 14, 2026 at 03:32:28PM +0900, HyeongJun An wrote:
> The right input PGA boost (R12MNBST, R34MNBST) and routing (R12MNB,
> R34MNB) bits are in Input Mixer4 (R42), not in Input Mixer3 (R41),
> where these controls write the left channel bits.
> 
> Fixes: f10485e79882 ("[ALSA] ASoC: Add WM8990 driver")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Worth noting we don't seem to still have the datasheet for this
part internally, but this looks correct as per the header file
for the part.

Thanks,
Charles
