Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FC94B44A8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659681; cv=none; b=Af/Vn60IERmG1bhGxFLxhT6vmzlHAEudAgWdiUUqkhhrv77ri7SWCzUFLPgSGNVO85/Bl3zjRsi8aRIOOd9zh8/yYEyPXwUFBjaN1SdUCV6T2v97ir7UOi8jR83ayGIjE+yKaijQFbK6skSE17qRV15OM4HlX8jDFaY/ugZscqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659681; c=relaxed/simple;
	bh=niHJvKcGc3sXIxEu8fC5t1ndvGH1g95O/YBiVkFfwJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHFuQ5w93LXWl/lDOWV52k9PhoSGuAnfVcVSqBp2ehitXlKKNkqCQq7lv7B8aw6qtataUUQsX8zz4KiQ8IRgE2io95eDpcZHBiLNLEplIV/3dypr/Rt+pdv0PeCdlGvbji/uCv9ZdrJziW5V74D0HAf5XI+IZkOjbsFSHnInNvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGKB7onL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BWBQRiiM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGKB7onL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BWBQRiiM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiRcW2265064
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kv+f2O5HtP2UyzQFqxgl0Ck7
	X1yB8VDtNQPrqEOFNsU=; b=KGKB7onLVmzH2nA9sBMm60L5L8sxKuiGItypEMRi
	mIBVtN6RcDV71YuJ3n9O56uxKryNptHQN7FmDKTrDePq4VI+GVvEBAcubco4eDcj
	h3mMQXaFEQ61IUTZalhGat6QW8GVeALeNR2L3vsc+umk8EmhCs0Ez/mRClKEVRJU
	oQ1gj0G3tBSWWR7EL1/cuRHsHQjH6BERl6WsF25FxUrvJqia3bBWFWMyNSOk1GGV
	O3gMVtlUBChNqh/07gLFswwJi0VvNUvSCaPyITb+Jv6eNRiog8podyT0Ie5gt4U7
	tKzqyFNElAqLPR8s0gJdtmgfsDauX29PQ3UbcnW47j0t7w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfpph32s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:41:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso155142185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789659666; x=1790264466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kv+f2O5HtP2UyzQFqxgl0Ck7X1yB8VDtNQPrqEOFNsU=;
        b=BWBQRiiMXhF1HwFET0v43wpLH/xcy5Ohq8pzXEtLCQKgeEktcAIRGOiTOObaci8hjG
         /TTLWAiqWDwc/HzUAfGmSQuNNmTN2H0+6gfzsuU3doV5wy8bIlaexq5e6aOJK6kj1JWS
         yMQPbbC6E07ufG82hh9jVWtABp14Xh9xjoKeHv5ovfSXGhnb6oyFWKOJOITc20+TIYax
         YpFllMbo4dTN3B1x9i87aMDyTLrDBoASI9lq/SZEU9pZNT6BFqvpef27PSZhAGjaSBe3
         +ARpy1Tohm7v2xSr5VVGqvPEnt60wcG1mLwarFed9N1CJnUyHAoWYRVpmJQocOl1aur4
         AGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659666; x=1790264466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kv+f2O5HtP2UyzQFqxgl0Ck7X1yB8VDtNQPrqEOFNsU=;
        b=Op6U64QgqTvs7nCC0pggQsaVCoH25APVkwwGc+3HbUOI/TomiXXNWEqhZc8zPdw1dV
         Js00NwMyD9b0NcCqpace+wCWAIYO6t7U8hZ6dTyjsmcquWjRS+US/dyZPfnMfniMZnST
         9BlcR3ZpT3WmS8r+4qYQCIkgYXMCALbWr7VDVbMEHE7Mditn1XxlzTQFF2cNJ9+kwTPU
         DNrPSWAend5Cc6efMZHpdFBgW/P8ceTjDHE3Go9L7RpTKRbLTCZPv1uEMTJu/DaJkJh9
         pz0PpqjBMIWjJiLOLgmiq2bld2kk6XbfWyD/8o2M2CWhtrO20/v+Ssu4Khic1AXb6Fg/
         XIZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEZqn3ZfoneAngGnclk5ZupD0SbO424zCADPp/1RLwuxzRivniultX58lx0dSg54gH/+ehycH1Ky+LZ64=@vger.kernel.org
X-Gm-Message-State: AFuF++miTcxkCfJZxFVcD8/v54oEuPmgcrl+wvBkKxvX93+GeJTZvfhg
	uuBLLW4oUSe4K5fTnECF7Oaj687yqYHhgTZfLhjDPBoT7LFj0uNHty5xTul1wler3Tx+W4hiZcJ
	i4UD1PnFl6AcshLWqPxFxh8djJnTZr0X5vNpXCHa9rFyq8y1LRwxfg2T1zWMWDL2gvmg=
X-Gm-Gg: AYBFou0NN95XnIxYZ5+CAckMFr4AfUPV9+aCUO0Kj1K7TZ76sUpK4zaB4hVjRkb62V9
	ADp248Duf1PyUs6WfQt6R/HMgwTItMoasDBITRGtKCsDlCXxCkbxNaBgdDHOfp4ZECPOw+73ztD
	qTZbsT1e3BkOiaGv8lgyo55dTbPYCMoP26GpqDGhlmDmDRl6zSkVC4DcHI2yFKRC6yqrBLI9bMQ
	mpqUj2QA/Ng+AoQ3/aXrlY+OHm2lHLB6e1NAAzLIS0edclVLlAma5SZ9Mqi5zBq84fTuzJHw1k2
	X+QYRKd8+ct9eMR5htWhvRV3uTrSr4RfzjWV+VsybtF7gKK/5abc8d4//E874XMrV94+Jad8YDS
	Fpo2bPac4Ele6uQ==
X-Received: by 2002:a05:620a:4621:b0:939:deae:8ca1 with SMTP id af79cd13be357-93bb793775cmr1229080285a.44.1789659666298;
        Thu, 17 Sep 2026 08:41:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4621:b0:939:deae:8ca1 with SMTP id af79cd13be357-93bb793775cmr1229075285a.44.1789659665701;
        Thu, 17 Sep 2026 08:41:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24034esm101548365e9.15.2026.09.17.08.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:04 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:41:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, sboyd@kernel.org, dlechner@baylibre.com,
        nuno.sa@analog.com, andy@kernel.org, arnd@arndb.de,
        gregkh@linuxfoundation.org, srini@kernel.org, vkoul@kernel.org,
        neil.armstrong@linaro.org, sre@kernel.org, krzk@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_wcheng@quicinc.com,
        melody.olvera@oss.qualcomm.com, quic_nsekar@quicinc.com,
        ivo.ivanov.ivanov1@gmail.com, abelvesa@kernel.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
        mitltlatltl@gmail.com, krishna.kurapati@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pm@vger.kernel.org, kernel@collabora.com,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v13 04/12] spmi: Remove unneeded goto in
 spmi_device_add() error path
Message-ID: <7xf6fvsmcpqjpkto33g6o63ejagcbyitoaetvxww6pdijirbkn@etvrh2weic3p>
References: <20260721093626.96264-1-angelogioacchino.delregno@collabora.com>
 <20260721093626.96264-5-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721093626.96264-5-angelogioacchino.delregno@collabora.com>
X-Proofpoint-GUID: gpjF7OyRo6RC_6KJhiI1j2h-9nhFqMLI
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aac0a13 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=RPqXdwRs98PbUg5oA2AA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: gpjF7OyRo6RC_6KJhiI1j2h-9nhFqMLI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMiBTYWx0ZWRfX7z1s4szMwhKY
 vqX35sSwn8oKA+mNjrcsNCyZUDSihv39/H+5+ChECRvTjjds5HJEL6Ro5dhfHOx500IQCoFYqkL
 gAYxwaXbcVsRaYSMFburpl94DdRHgG1ZzObOBONirY3GE598cRcJ2in7wcPt5Oknx4uhPAZorGJ
 O13n/CRN66hwTGK2OyC5Lv1MFNr+CTHG60EkZJJMlUII9/oS1xTDBoe5DTt8IzMw139PHKoE8Y8
 RzaKuR8ddRmVUlnlpk2SFAFIsUx9L+Ayq7V8pLFdvd3/ugN7T+BshvqZZ0L3I+hzuqDoI9iV6Ws
 /HZ9bGGZsBdCsQ+Jy0Km4/+HL6Mu/4BUFzNg/TaQQyKvwXwrFa+UzdDa/KSORvB8dXCnGrMJO8Q
 bDUvpT9qk/6a6+uURbZQby2u5xgmPW3V/b/tuJVGj/fpgTeNZyRP4LWF54s1TeYBL7OQl90TTdX
 taOPb+1eUaPDlWxij8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMiBTYWx0ZWRfXz4plEAUYqrTg
 S/5jfo8ChF67uph+3wgUh4zMoJnwUiB6yOwrRxHfLaxmfgTT6DyK51ChnQp01zu7XSRb4mFbNGq
 OnajNJZhslOFMAsj8fj27pxMEkGJTCY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170222

On 26-07-21 11:36:18, AngeloGioacchino Del Regno wrote:
> If any error happens during device_add() just return inside of the
> conditional, as the goto path doesn't do anything else if not just
> returning.
> 
> While at it, to improve readability, also change this function to
> explicitly return 0 (for success) at the end.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
