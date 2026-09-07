Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E35E3FE359
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765563; cv=none; b=GL/cBQka77jDcJWkiao1J77jQIckqr/7EDb4IwurdKJOvmY34VKzN97xspXui31VupLjOjklqrAJf5WYCif//PFDq2Oc1XUVB+6/MIR5vDU7Y2k2fjPnOv11v3Q4bgeTPPM+AdTwL584t2j4+MVpfBcL1JRgDkp4/u+mPA4xqas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765563; c=relaxed/simple;
	bh=kHVzJ7vH4IaBM6bpbMKYeCejcLsqEBIymh0k0HQO1/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RkMFRnLJhKxyktQTRSjSxkX9UhD8cgvXzMP+cKPGhY5HbjxM9EztXjkTu4cbAjcGUBYUIAME0mTu7Q3cLMrymljMA6ymzn9kKZ/5pUwRT7/gQ5ruGutj2/CUItV+9DmXf8LXdW/uv0/XGaHX1eQ7yj1ivHWCF3xd0HZ9nB55cAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1FtYQwJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jne5dtXR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1FtYQwJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jne5dtXR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777Wp72724133
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 07:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MczioktT2PkcMlW43w38/l6v
	2hwArrm8QA1Vi1m0mUk=; b=T1FtYQwJRWlZfriyQbeU8FgJAk+IchDhDAzNvw8W
	ga/sueq3A6tM2HqVgeVVkPXpInASUOHkJz4ikiF0Ma4NCsG3JWOI7kQn6JMslwe3
	hUhC8sx0bZBONq4mZctDYoj8tPI3TaYmv2SpIRCnXmTmG0U+3CYhfNuCU/fr8x0f
	rbyFv/xseauVhwO0qtCsNhlhDojtpFYE/9ktc1wWnnrJNNC06ieNV4yHaoV+4xyN
	4zTtnaON7qRb5Fvxppf0V7XqnES/BNdZx8JkMbh1x+d7XanIGUt64kypL8+B1PfZ
	WCJqZul7q2/4ulEsY/5hz1X8MfjwO4799JxRJHYMZDoBmA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxksban-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:19:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbee162355fso520288a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788765560; x=1789370360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MczioktT2PkcMlW43w38/l6v2hwArrm8QA1Vi1m0mUk=;
        b=jne5dtXR16bYMBJXVEH6UcUiCQHkaEBTFPU0O+CBiWF3FyFb1VDpm14r4oLpJVPNEf
         SVYX7k9YYeqmkxrxd5fZBJ6QQ3kiQcAkB9kKIyHJTXrbiB6EDOu1qYdnDV4rOafjchY3
         KG9HAsRLtojRvXYvEgvY683jzIPxC4M9nX4sCa+kRIwwadHVqqssROLHQyLpmlmgo+tq
         SAvpps9tlNEYsckv+fvE6eYGN9x5mjJEHUe2xo81KPoXP03/BgAaEWYTQB0T8yQAPKK1
         RQH5KcMS3zfLvgIrS1UEDQoHlwoFOzxvWYdD6pPCTAv+l9xcB/P6/xV0QIFMuU8VTC5r
         bNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765560; x=1789370360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MczioktT2PkcMlW43w38/l6v2hwArrm8QA1Vi1m0mUk=;
        b=RHDysLxrLDuI2QH5lsXeBMZjGxQ132hIPV0WaAv9s8WZcPX+EDpIxEVh4tgUvLiCau
         5G3ba14rl93dYoC4nAAb6JbwIRiW+WParnN6T6pBa1jG92YHSZjL4imVIvMzF3noxRkj
         Y0gFecHGCul59kyP/Z6e7k+e81wKkKZQz1bAlJRmat7geP1YGOmVX6kSIwXGcLenH+eq
         8s9qsZ+3wimxdRqecVi6sXscrVWrcODhBbRqVKiwNesY4lJ5YWE1ZcCErJgtdozcE3ER
         ey49W/v61b5h2BLmHt8kLMLnwrxS3gOcYmrmqCGDW/X0VOIaNjC5/rdO7NK74zK1JxC1
         v9ww==
X-Gm-Message-State: AFuF++n4pPJeP6AXj/EVDb/PTHTk+geL2WJq3nlVpTMPvKVll1Vvq2gK
	BckLLnziEs0x8SAgAYU7IUE3jn5i2nSbGPt676mtkBRNHVEa8BotgcuNB1K5l60ginF+uYU68Ai
	gLJ9XMW75Ye1rY0Zq8z3fpRl0G8eVWqQ8Gzufh/HBOVQG9aBe2wKcpfU12Spie5UBPq4=
X-Gm-Gg: AYBFou2+pt+sIyCu7CG+fl9m9zJXTODmG3ro3f/21lsPXbvzddvTU681MYtF0gtqxGu
	U3ym44F+L+Dgr0mb0W+zl6O3JCSD8O/j5cITHTflsxHmLIc0ccmxHjOOb5zMPjDaL44Cyv2fk5P
	Vxvk71kmv4NOJK8iJMW6JkDb+NrDb8RcOVIlAG7HCpT7iwIc+8V22a6AQ8FDH8LdyIQYXlxioMz
	c57mtMPVixb7o0fm+MpcwOUaoGCwSooiWvUs1O4mMf3mNhtv+MeIseY5kHC4K7KFRUisPzZKpyX
	FZrKO0RT8AY3I6p2/esFwDBWtMkNo82Fvl2DwbSROqNGfGHNhN3f/x3yMBndBfuqD/7WzSXe5Ve
	zDiXiI3r5YwxUskQSjmPqUqJ4BX23IkXT+SfvyRXWuH9raUXLxlzRcUD24napdJL1CkJ2Jw62lB
	rYfRzEpz1SLYz0TkLkLDxa
X-Received: by 2002:a17:90b:164c:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-39b3d83a8e0mr14222496a91.4.1788765560145;
        Mon, 07 Sep 2026 00:19:20 -0700 (PDT)
X-Received: by 2002:a17:90b:164c:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-39b3d83a8e0mr14222469a91.4.1788765559635;
        Mon, 07 Sep 2026 00:19:19 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm23147341c88.14.2026.09.07.00.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:19:19 -0700 (PDT)
Date: Mon, 7 Sep 2026 12:49:14 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Lontium LT9211 driver
Message-ID: <ap5lco52KX6CuZG5@hu-vishsain-blr.qualcomm.com>
References: <20260904-for-next-lt9211-defconfig-v1-1-97221f0109d7@oss.qualcomm.com>
 <c0d47fa1-1f6f-484d-93ce-7838e9aa9e52@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0d47fa1-1f6f-484d-93ce-7838e9aa9e52@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3NyBTYWx0ZWRfXxX6ZZiy4dSaL
 yz0oUdlVdYv02r1bVxMwjwBZqLYV2o0NsqGokyA1E84jyoYHf2slJGphC/BX6ngj42f7fe6w28G
 pMuUHwPDg43Rizam0laoQUcrgsdHTxZckLy1GTCo8pEHmz6OBr6rgtOIUey5dRjas9OxFETkNyD
 WWdLfGtTRwcQV8FACd+cFvN4jlHenLGE1vPYRQ7Gh9Yfj2jipA4uxuRPuhFFn5Qop5EeVU66IXC
 epqPZt1MuLgHfUNjCIwFWaILK4p+UD40jJN8U5EFcNbFMYDyC/GjvIiaiDRp5m+oF5bOOwOQCgO
 x8/teQnqSd7DeROJIZQy3bVaZsb+MZRUesuqHCytYGbt/aIZPr3Kxw2po/KiyLqgc8z6FGOc1jz
 j3oW6ytQZ09pXJBKqNPxKfQ7aiX9r17DXORuITK4khr97MlMLMdwUDPhU17KEJbnB4BcTXoVV4c
 gZN2KJVYPV/WwejEpbw==
X-Proofpoint-GUID: E8T7_YboL0NlVeEhwdWpO8VTu_WNSo04
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3NyBTYWx0ZWRfX2oiMCs35zc0N
 KtxUswcBUO1LtrZI+O4TvngwVoemN4VwtWJyFh1WC1K0hg0uXe94/scc996fEu1HHux4iGP7XxO
 NCCBF2iysBUivfx7dnPd0xXFNE9yIkE=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e6579 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QUQKkuwRe-5_lZdaMRYA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: E8T7_YboL0NlVeEhwdWpO8VTu_WNSo04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070077

On Sat, Sep 05, 2026 at 09:25:47AM +0200, Krzysztof Kozlowski wrote:
> On 04/09/2026 19:48, Vishnu Saini wrote:
> > Lontium LT9211 driver is extended to support LT9211C bridge
> > which is used on Qualcomm lemans/monaco/kodiak platforms.
> 
> Lemans, Monaco and Kodiak are SoCs and they do not have this chip.
> 
> 
> You could have just look at history how this could be written.
> 
> Or lore:
> https://lore.kernel.org/all/20260130-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v2-2-a98714fa1531@oss.qualcomm.com/
Thank you, will correct the commit msg
 
> Best regards,
> Krzysztof
