Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860784E06EA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957121; cv=none; b=HHcVPifJXn5Qy3LJioOp/T4ZYJcDfDPjAVFMdP8AV/LgDM+pAXx8etCkZFO8ViWRWzmgo9FhmtL5ZSDaK+M1CdlywDko0Iv8+acw3CJGHtag/Ei3o6FcN/wE2GWivyp33zUYBBd/WMjyXh18v08iLxbkn4HXGlxzwfBZ7piAkzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957121; c=relaxed/simple;
	bh=yN0Eni9Kg2efdRJajeGIiBF+LcseoG/mwMmZb88k97Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWSFVQ/WKTkyKcG13061cDWCwVAjWIwa/aV7pWQzu3i4AHaqS7VE1z6Wjg0xHwJ5CWkrkd3EpqtETnpZa/nxtRq5jvmYCVlH2+DJtLxJe2OrfIf+XwLn/PTkvwFZ5kTQJRogkyDaPbR4EFEENUdWVFNp0RGe3bPfyS0PzjnefHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f28IOkX0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1djh95G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f28IOkX0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1djh95G"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGc5g1042843
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 16:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q9r5w+GpWf4gN47am+35rMxi
	gCSGjr21fClI28eL45A=; b=f28IOkX0NMivWOlFrM5h2LD84mzH5dS2zzRCXJeG
	cNl6Yu1uurWycyU8Vv28IJ7qHOBql33dhZF28ZGzvzk031rdZh1yjpeyYThTD8Dc
	tjFc+3vW/2477pm8nwG9okxyoCB+PKbRlq2BuyOpyykQUZJK06fYWEenbYGZqFyd
	lm+w+QiFXnBLRbJ38ShJQPQ4ZjRKK1tE7KcjFr9aehzNcEQztD8WXW0lFdQQfT7M
	BBLrQoZRrxsfpKugqh5Nf3J30QBSPdRwoWXDlHd2JlljjIE9zjC+dvUStmXLNINW
	E9CHLOk0wcUBKgGBj1zETnJBZQE9rDGf6ueVUdQG1oGZFw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2dxdgjrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:05:19 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c124d17880so210200137.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790957118; x=1791561918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q9r5w+GpWf4gN47am+35rMxigCSGjr21fClI28eL45A=;
        b=i1djh95GqyKmUX/3ZGVWw9DKqIX4zzqieCNQW4yxLY7miZIW/+AKGcUH2VMfIHqUXJ
         1YDOaIeNSRs/9a80ul/iFuunuxlM7rbOqKwKIAQ6aJ4IYXclvEszDFyf4pjHBf+AC2CR
         v8PWU7cSnj6zI6AC03M7F2hH4q3p7xVXh4sLmOantuvSmgOIh0WQ9wK+qjE88lvS6wmj
         m3IF4NkRzdK40pLkfnXcSrKFfJXEJy/fuyXXZFqQhU8M2uBLiLwJLLEdQRDHtz2H8BAY
         h10NdvEo4X+Unj6rKXPN/7Xk48UlpGi0fFxN/lzzsQUnXDE6D7KKINccGNcJEryktc8Q
         QuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957118; x=1791561918;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9r5w+GpWf4gN47am+35rMxigCSGjr21fClI28eL45A=;
        b=ktZd3fxXOC+xT5VQTCbKgf2acyRj5EJSkXFEecWkvcK6BlsQnfNEcAHn6rc5XlrXyP
         D6uET80OAn8GNxHSUI74ivxaTT0qGapNGU9Bs0Vf1t9pDWjMb2jejMw/12GlSbq0zK6r
         MKQ0C5eezU1wC63SDZT9ntXraqgWCvEmdHw0vgJ+y31P0Ch+GthUelxBJwB6hchxvy7S
         0DZL1PJx4VU7vRemJNdzvB7y9b0j2zefQLaaZO5ndMcIZ/tkWiQhoBeQnUF2aoS7E4UK
         aUyfC1PXSGXtd/T6DDnpXcop0YSpxFH09W5WWclXU+scXnwnT91YQWxfm1H8idoPfKFB
         GqlQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1933ej0fAC7xd00RmO7DRNZrzrAAJC9kotdqZaevmZZGBZkY6V8K348rLjAWOTWI/iM4VFbPvtu12iHY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKmj7mGwjUtSn9VlWs0V8UL1WLTX7Xh00riJjm/soI9PvhKy+F
	++adLZM1xtkZrKQFg0CQXdShMmp6YGIx8WQA3jaRpInKXeETHxmwfYAURXABmdNrEj2P9SoWlia
	2p/3noQINxQnLNePKkb6C15Yt7PUrJ49PGwqn0MbtM/bu1XTIthdU9GErOv5yi7Zrbdc=
X-Gm-Gg: AYBFou3bsd9+zE21G4v9XdMR7HKGfxuwAn5/zlg8NdCE/xxn6+QmICO/THqkw0iNGDt
	A9yeNuyP6PvQ2hXr9VW85bAblwggUQ9jqZnbxny+VfH31j/Vosl+zzT/KfGmg1LB/msW2sFHjbN
	9fA7SKQE77O+pBhdo9YHwivnFjCLCJF0c9HUhkNEtbpsspS/HU6PYMwdxt45kQAcCeqIYIJAb/W
	eels6BhgM3jvNMqRD3QrNP+ecv0dAIs/9r6clvYRHSiLjM+9h3OYR5LT0vl/XRPl5DYrhdzxSW9
	/cAq/bjiR8fzOwwN+nBihzow4GkJYEReeX0gmvLbzDu9rrtL++A5OyFliBbvrDrgWX+AehsW0hn
	cFnX61ERMwF+4YiD7TQ9T8CnVMr61ZZG7aiAI9QO9X9ublZKkA1PXYsxaj1khxzOSSLyMPgR8ei
	BBVyzArnW5AtHs
X-Received: by 2002:a05:6102:8519:20b0:7c1:3b2f:d275 with SMTP id ada2fe7eead31-7c13b2fe0d6mr302676137.24.1790957118513;
        Fri, 02 Oct 2026 09:05:18 -0700 (PDT)
X-Received: by 2002:a05:6102:8519:20b0:7c1:3b2f:d275 with SMTP id ada2fe7eead31-7c13b2fe0d6mr302662137.24.1790957117997;
        Fri, 02 Oct 2026 09:05:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e3030ebsm10982661fa.16.2026.10.02.09.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:05:16 -0700 (PDT)
Date: Fri, 2 Oct 2026 19:05:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Michal Simek <michal.simek@amd.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] ARM: dts: qcom: apq8064: Drop PCLK from static
 replicator
Message-ID: <umknnkfjevejagydaktpq6zgh4l2uuxy4k2f5l7v2ypr2xb57q@obtxdmeihisp>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-5-c3edca1c480b@arm.com>
 <z2bu73w3xcl4ofbp4td3rj7wazzoth5gq35obiqkrfhhfxufcq@hrfvij5jnb55>
 <20261002153328.GE1208404@e132581.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002153328.GE1208404@e132581.arm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2NCBTYWx0ZWRfX2ar3uaBFtgUj
 rOM0t+d/zLn0Jz42WrHmzhaTwBFuC65Yb2TVG6j4CW0thZfStOVd9+2SHeex7gid5wBb5u6+r+Y
 +w6KK9mNXr2PjeJ+4XfIRMbXV6I66s4=
X-Authority-Analysis: v=2.4 cv=Ko/YSmWN c=1 sm=1 tr=0 ts=6abfd63f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=8NyxROJaIBheOw5Anm0A:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: jesNtx11OIErgkCM2IDRr8sPj9yFMPM6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2NCBTYWx0ZWRfX80P2r3VdZR6c
 o/9i8p9+rrsv9OpyJCbMmpP1YcQ+7MI8x6wjXOHmrnD+iWCmKWosWcrJYAyKknQEL9Jj8gUSdgr
 Gt7ZWnPI8aF4xbCiuG4A4ty6JZaQ6eNhmr2qZMWgkBKrMaZyGnO+3VL93qbTy5QCxVDdgFvqCrV
 vkqAUi49wDj36aePXmQ60IpoVnBQHMD/BFeJ4fOzWZEgiB7xI5jcw6HtbsT7L2bVOnF3or/dr40
 bdEYk0Bi2cp/IwTjYKq2cMR067CBrzGjD+Zckw1cUjuDjuZzX/MaKtfqAq6sbXMiIEZ+EYFKyD2
 rd0aNmn5jzcTOBHvzKusb65rWp/LhDjl2mt7uyko4cerh/JMecLBkz/bFHw+rM9PhWsetHlaULm
 46s9LQ7jDKNa4OmKouWZnxP3eXvlzWCZHW+feWtvQeAkTn7sjHfWno0DsQ1ovCGb06d5EwzV/m/
 tC+RT7s4BARNMr+DTsA==
X-Proofpoint-GUID: jesNtx11OIErgkCM2IDRr8sPj9yFMPM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020064

On Fri, Oct 02, 2026 at 04:33:28PM +0100, Leo Yan wrote:
> On Fri, Oct 02, 2026 at 06:21:36PM +0300, Dmitry Baryshkov wrote:
> > On Fri, Oct 02, 2026 at 04:07:24PM +0100, Leo Yan wrote:
> > > The APQ8064 static replicator has no registers to program, so it
> > > does not need an APB clock. Remove its RPM_QDSS_CLK reference.
> > > Other programmable CoreSight devices keep their clock references.
> > 
> > QDSS clock is not actually the APB one, it's required for the coresight
> > (or to access some of the regs) if I remember correctly.
> 
> If so, it might be atclk for clocking the module rather than the
> register interface. Could you confirm this?
> 
> The replicator is just a middle component on the data path. I read
> that it shares the same clock with other CoreSight components, so it
> should still be safe to remove the clock from the replicator node,
> as other components on the path will ensure that the clock is enabled.

Unfortunately it might be hard to find info for this platform nowadays. 

-- 
With best wishes
Dmitry
