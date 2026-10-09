Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D65F4F7CCB
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570148; cv=none; b=GummddoueddX/d5A7xwELPXaWfNM+7uNRjg2ofHwnRZDNxRxQhSSRITXh96NM7vLMjqsLKJt5EhsJs3ScGKQ7Si9DcbjJrldMugdpLTIEShwFucHkEIJk4bJu3EOVxwRuN5aTPI18vVObqh1zjQrwEgy5bgE7etmooMIFEQYeZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570148; c=relaxed/simple;
	bh=0ziXDbyWvbD5wLwFS0JgJKaNn+1KJ3RxY6KY1Lnt8Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUp8b077M4GWbTfK2xsVwSYmKjqNoLAqGCjnl9GHazs8oXLS9DuKQ751/61Kk5bYwl40XKWyGb66XAe5aJ8tLdMplooQqqXLBJ46muYkL1KQ10SCxhO/LFRzD8cKWEMnjnEtHaW5Y+fCfhsBJLYL0aRRozcvb/1igWvLT1hvVGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JveUUjv+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IrkQugnj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JveUUjv+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IrkQugnj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZt9L1446359
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 18:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rOadhsIj/jKyh1WnNgo5Rfno
	LJnhvQqsGhUpPnfFs9Y=; b=JveUUjv+NuNdQxui9WRh6V4LURKtmXbrSE9xTn8N
	cwYbUWss4JodSRQ2yzl2ByGE43+ekqwqgydRtlu6BlVKIjKQLMSUBAocrlHH1Yum
	TWrQE12jkV46OAeIEGhxZwbqaKLKOIzrcm5IpLfjSfkx2vEVDNLRWM3OUJZ4mbyq
	Sg40gYQ8ezOGM3XyfeNOYlzdLDLJcZZlXKV3OOpilcjATBHjpeBFgpNJ2IeDWke1
	uvHuk+1beIgThZs303D0xqSBjOHjClduKxCgd5Br/57Wv7NCHlIJbKNEBTdYi6Hc
	1md3nUl3/tT3/UDNYo7W2jD/0P5MfdPzrd0A4D/zkYmL0A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74tbg7hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:22:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso1917726d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791570146; x=1792174946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rOadhsIj/jKyh1WnNgo5RfnoLJnhvQqsGhUpPnfFs9Y=;
        b=IrkQugnj4EnakbIIHoVM1h/9pL2SHw6Hwa5QsJF7ibhNqDrpEznOUPfScXiNtrNHsg
         3EoHV9tiNMX2ULiIfLAjfodIXLNiJpnj4avrtFcMXBlQNLjRtHVCUjcBaXZYZvuaDKpR
         hKXN2u4Fj096oHpk+UpLsUPFE61BeFIIIIJGs1jVyLGJHGf8a8bYdRl0UUv0/4pR+VNV
         fkBJrwSKhKV6rAQ95RUlFgkxGpbuOn7fXg6VWswaRE1uuiGv3UFkX22CXh/Ffd7v/Ldu
         ybbKZ9W0f+BeKbc/jozrmGGGKpidFd1jXTvjvECjNP9Lx1envgHyZ2fynShJwTvnEdXi
         wlhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570146; x=1792174946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOadhsIj/jKyh1WnNgo5RfnoLJnhvQqsGhUpPnfFs9Y=;
        b=IId6JKJMz17d/E51xR2RE1NYQyNwQ3Q5q9Ziy5s/MfoDNns2LEaEAEpc46yxLeOTi3
         4PQXwmxLQReGK058snCgPdoWSWnP0QS1CC914SppOw0uAoMz9d+Xe3Tb6jFvQIGXubvu
         YEJsOTjpTc7Nt1yY5hnaKmhu1eikrl+iAuWcQfKyVUwmqFX60WiL1PEs/xr5LRAf5M1m
         b2GtJefOEvvB2fie+Di6qYxq31p8TUGSlNmf4ZduCynKqWEBgwsQwBf6RTPN85hoOcPA
         4UQjx5CPYbPLczODfRzTOErsSMRV9l1KgMaXbAqCs9o7f+uHeMcHDPZHRBwY8piGnsa2
         XoZw==
X-Forwarded-Encrypted: i=1; AKwUvBy7ogoEJeLAEEwJCH1s9LVyr2WKVpChsQ/rnFf8a/Wxm/NyGE7kRv84pUrwKcy8GMvt5qe8qrEtx8hFjDg=@vger.kernel.org
X-Gm-Message-State: AFuF++l2mpojdNS3ELhyVtHiBqXsJqW20mLW4QZuTTDA9mVZf7IMW4Vk
	3uyIQTNi26pzCLPGMvR3szBxn398R5wiS0uy7s2LZMNYUGBr/n0dxw4uAczEVZMuuXA47kFlHO3
	E/I2ldcnWitcHErwozkWgRWksJktJKmdruXSQioPqZl5Ict67EZN0fKuoqH5Gz0LjeJE=
X-Gm-Gg: AYBFou2rHJf2mHa+CcC3Uy7CA1LGJCCaHkpZgqEHRY5SPr+5qVhA0n7gpHrDIcGwM6x
	RG+7F1yaRsxZfgig55gGkaKUIDylZqYSUapkDGY4f+QgpcEWftkB/qd/s+MKyg1QglX1xop8oBY
	edaIoC1ZWdnmD5YZfKPnl9n06S+A+CmAOX6IZGbJKZUkYE/lfm0CGPy1vmuxekXPH6x2fvnvg/z
	gibFpxARu2dwbArbbPJGdXqO9kP76Lwizl6lEll+eVJ4/VBnGSbX9MTWysCrJkpJzin91hPv1XC
	6LfSRuXyU6Db4MmPyGaaQlh86tXd4lgQvmRkEdtYnG1Sx3QjjydKIXbPa/kO3Axcv4SmOZIodsT
	jHKLw1+aB7FNzRxE=
X-Received: by 2002:a05:620a:1a0e:b0:93a:2611:270f with SMTP id af79cd13be357-93ebd20ecaemr446231285a.13.1791570145447;
        Fri, 09 Oct 2026 11:22:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0e:b0:93a:2611:270f with SMTP id af79cd13be357-93ebd20ecaemr446224985a.13.1791570144763;
        Fri, 09 Oct 2026 11:22:24 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e530esm4982802f8f.13.2026.10.09.11.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:22:23 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:22:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: andersson@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, abelvesa@kernel.org,
        bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
        nitin.rawat@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-kaanapali: Enable FORCE_MEM_CORE_ON for
 UFS AXI PHY clock
Message-ID: <npxwalwxeqa7ebesvux6simtuemwx4jg6iqiltbm62hiuh74zt@qjvhinctficf>
References: <20261007143716.2161-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007143716.2161-1-26rote@gmail.com>
X-Authority-Analysis: v=2.4 cv=RcEFmFtv c=1 sm=1 tr=0 ts=6ac930e2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=aXoM4fymnmh6U8e-DTIA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfXyLR/p+LuDeL7
 jIeDwpBqsOBnkUpIFe6YmJ2H/VTJp3HARIaQ31tr2vp1ufYEuiivgaYfkPH3G1Ru2+uO3kW1OCn
 8tbyOb45vX4JLjMY2WDDkBStmzmdpSk5YowLjQjT2A3ZD3XD5zjdjMzmMjAaPWv/XK+fkF36BXv
 tY3zItbQ9d/RIRuhVBacbvBp0emobmS9ZXsG0QQZERsUOEiBMA2aqdYAEbfbVPA3EMgjnWhlGCe
 tgEpnJKFhIzQuJ+CC4n1ojG+PTtbW0Fk+F44NA+pYGCUaSAa5NQrh76gNogrihdRdwN9vtEW2tY
 B31cn18j2exQEaziiO+13yKs4SMkaYWcSnhX1QoIxkCtNPfN0TNS/tzKC1oYOs+6yJoaCQK8kIm
 W9eJgxlruKdyCQJMPr0NWUfVhxjBtMWHEPO2DXiHM8ns8yMdggBnFyQbaIw8MUlYQmeXeErWFvG
 TbEo0f6hbgX88UpBqEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfX4LFbETosqFa/
 X8W8rSSYWSVYQE6GtWy1lEH7ZaCX/HxqXD3LjTznTVRzhUy8fywWT2zwbWu2llNbBsMERxALRYK
 A5VIJA8YXxHDQ9ToYCO4OWvMK7gKOB0=
X-Proofpoint-GUID: mPSZTXhQ-fxeoS3IDbKoYweLm3FGyH0i
X-Proofpoint-ORIG-GUID: mPSZTXhQ-fxeoS3IDbKoYweLm3FGyH0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090073

On 26-10-07 23:37:16, Joonhoe Kim wrote:
> As on SM8650, SM8750 and Eliza, the UFS AXI PHY clock needs
> FORCE_MEM_CORE_ON for the UFS controller in MCQ mode. Without it the MCQ
> configuration is lost over system suspend, and with MCQ enabled every
> resume from s2idle ends in an SMMU fault and a host reset.
> 
> The UFS PHY ICE core clock already has the bit set; set it for the UFS
> PHY AXI clock as well.
> 
> Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
