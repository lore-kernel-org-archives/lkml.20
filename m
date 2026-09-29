Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5B24FE2D4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687455; cv=none; b=IfyANTwfeg19JxnGscWAd9mk5jjAHc3NqjHdPHiAu9vnFeee+pf76WhP3j3OPL8617ZTok/rp2DrlLNGlhxbiNhG7i0wLdhiTVL9r5x0gO1CsHLaTXi8i7q3V3aK5EujVNUoDakT2qYmDj99MjXvREbyWwnHBkcrsPFby29g99k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687455; c=relaxed/simple;
	bh=3IiIfXJtyk2FPxWnJXKW0rHvOYkXxJjw/G0mKQz+Aes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGFAyQkj50fKkeOZEAnhEs26h40UG24qppFWOsgbyNOaj3/X1haVjgEbXCX62yM7AdqAn0U5FlaiFD5+nEkyROSMnDpViLgjTC/7njYfAbCiU1/mSUnxOIXzYO+ILvlEp0Gm/EW/yOvrjY+8wtrHtFSkatPbzSgijduNRwb/w2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B38cCOiJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfBWkHbW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B38cCOiJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfBWkHbW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqncb1477892
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iAn4rx9XwpXXw1tzM/gvOYMp
	G2xmnXsxaLSpoR4YmIg=; b=B38cCOiJbHoUVgfoImjmRex/4zvUdgGwPgkHhJHP
	3UKmxcUBffotjpZtO6ZH+tzoIJfhuX/VuCpp5desXYrUCH8Sf8pfLVit+ddQyJad
	acqYdqGe5dOiyWVDnMicCzj1rSLNyx4WzboKn2UrcQTuZUZYKtH7uyJ30XTbZmst
	HMFq78T4ax0uP2orzRO1ygexHC+kSpeYWyXcgO9BmXKVt/13REjvZlnOkQTebIOx
	BE0YmR2c7rZ6Z9LxSCXUVTPFUEUcqGNdq/+Sm8SMyAgmuAhpknCAjmctcoMc8zzx
	1uiO6UpdsiFAvmq9+1Pl7hGY5p849BFBh4TzLCFgQ1jk3Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03m6a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:53 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7b497a7878cso374771137.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687452; x=1791292252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iAn4rx9XwpXXw1tzM/gvOYMpG2xmnXsxaLSpoR4YmIg=;
        b=KfBWkHbWsyXhNidRfDmF3SZuV16MilVnPJwP4dN7qlfWl9mtEpIQeIFev0cE9zrTbz
         To8byYPp/Y7pyj4N/m0uOpXrurJQ/d3BkDz16JsjHMOiCLtPDWTo/6JvGcf4WwU9Asgj
         5/F2L9e75Bw8zg7cnwejBnI62tkWoWuhT6fS5htsIbBi6G9Y1T9ul+sBLs0UjBTacwrN
         d9HMt+M3ZMBN91wazqyjOP7MAWMXHUqZ36+3EH7GGWvg9HbHmWXROwdMfTUQqnBR23yR
         nKPQQU6vEOu3MzWqVD5gQNLm99jBE2iHcEtDwY3QJFGMchGq7LMZ3p45pxPg2HaF9vIg
         7W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687452; x=1791292252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAn4rx9XwpXXw1tzM/gvOYMpG2xmnXsxaLSpoR4YmIg=;
        b=LkkW6Fk6tZZ24Xabst9SZRZnvbwvI/GNQpkzmlSxV7v28+6ZxHEBrnH+5dD1/T2h27
         NXUFdjMfSDo++Xc1GhWEP6CU8z33mW2pLETB2yfIKx75xbZaAb8F8KcdPv7vOtgafgm9
         Q/N5ZLPvD6cMQbe0zEYzsQygobrfgkGzyBCEmrLue1k/fwlQVXs3BIkzYAiYVI6RUGjU
         jgiiw9HOioDLudARWiXf0Bm4yKu+dfzdXRS4Yg8hOAVnZ2ekVeTbHPTyaTw+WjijcKH3
         rgRe1NZH4bSjPVEEwcKlMyDB+pDzFPLsmYfkO61m0mqkAXCLQPAjjm1sVZQLt7IOo6SW
         Ozlg==
X-Forwarded-Encrypted: i=1; AKwUvBwSXdYWtaqYRlsKiOYQy/KcsqPsbK/6l5OyXiGeZ+/WdR5juj8+PfN7ah5upekWs/OqVusYv0Q0yY1ekX8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwyxwE678exVm+Yybkyjdz0xM+oTyMPrFPI2bD+eoQTHZDgv8b
	JYCpx/1dy3MvW8PN+ZMZpv+457HnW2+61c5lrhUN9BTd/lEtUWolSznC62optvirm9z4byM5Dkv
	TiDj7i/oOOcofbN5HZm4CszmqH1V/MDRbb0EBod9hygbwR/DE3S7SH+/n+3vcoYvT62I=
X-Gm-Gg: AYBFou3dwhG/HEFm4spr43BXm1QP9opSM1Kri4U0GNdljiY6oNQ2D+j7vZHqSxZTIHe
	2kna51rCIekECJ+PEsHPdav1fksknYB7z7QojM6eQ3cH7/K4dENL8nxCwILPVhiLFcbuVVwiDgx
	Am7B9cykvZJN5oFfGfq3tzScC+V4lsXL8bj7tim+oa6WDQJF/fzS33OE7Zx/GhjGighjOn/3OM6
	hw86kIXUctBVRrvHIny09FJ+s9LGCG+2J927k+zkr8qbluRW4mWedocHl4Dsf70OEY3QbBKRJi/
	E1/p1BlDkO2wkmP8JTHods8tEthN0Tn82K0CAY84Zm1k5iiGZb0lNBjduEfGvJGvPI9CavlIwEg
	IX/YoZGIxI/r3pXk=
X-Received: by 2002:a05:6102:a47:b0:7a5:4fe2:b380 with SMTP id ada2fe7eead31-7af1eff6903mr5006505137.26.1790687452146;
        Tue, 29 Sep 2026 06:10:52 -0700 (PDT)
X-Received: by 2002:a05:6102:a47:b0:7a5:4fe2:b380 with SMTP id ada2fe7eead31-7af1eff6903mr5006495137.26.1790687451535;
        Tue, 29 Sep 2026 06:10:51 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013c6f760sm3102825e9.0.2026.09.29.06.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:50 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:10:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra-iqs-som: Correct PM8150 L10
 voltage range
Message-ID: <vqnl4ofgxtxzulzr6xxbgb753vkcgyjwjgj5x5fra22o3zox4x@w3ehixdlzv3j>
References: <20260929-fix_l10_max-v2-1-2fccd87115e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-fix_l10_max-v2-1-2fccd87115e7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX4a1RLDcmadis
 qaSqutYflmjvVfRzT5W9u95asCrtsiKnJ3tiQf+UAzKrpwbkf2AwqeVSPld//k2KoZiFQLcrsMv
 YWefGPsGJSWH7v8rUGbnKqI5Okt2SYg=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abbb8dd cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=NkAsgdMbsgjDGuKY8CEA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX0olAMEvsn5jN
 sb6A0361RMmOc1af83EpxldY7n9BHQYQXz/8mqG7D5bGI3ccmcefYqKHANMA2ARbcvQszOzTFLY
 douSYSMPfdMkBpuHllBGJtQeGRZ8FJAOjzzD2hpRHtVeMGG0oJyUAOjLmlHTNjpQe7QMFBfQOIE
 o9I3YWj11dSjbfkAjAYFS2tkGWUZgI3GspW4fXU42TMVyDKeYU2QhDLfbMkhE6S8RM+dzCM0aRm
 83c8fppo6zf+IDH1fy47vZG7m3+C1HMRMUXarrIFQoLW0ZSSG8l1QertJyuq9rnrl3MmnLWu0hX
 /0aMOJHyEa3Bp90fQVeCkRDtgDmJHZFh7H/Xyr0FBMtCm84gOCpG+KQxKkPe56LXaEAD628AqSO
 V6rutUhiWtCzHAoyb0ISJhYevi/OynfYTYzYbR1SmMgdo4efiJHpEwmc1aMDJMwF2uWDstnnOcE
 XsnlCGoWOqEjdALeFCA==
X-Proofpoint-GUID: e2faXCzbnZHg1Hk12_fvE7zM6HGu8eR9
X-Proofpoint-ORIG-GUID: e2faXCzbnZHg1Hk12_fvE7zM6HGu8eR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

On 26-09-29 14:05:18, Rakesh Kota wrote:
> On Shikra IQS, the L10 rail supplies the SD card's VMMC. Its maximum
> voltage must be limited to 3.3 V because the derived VQMMC voltage on
> L2 supports up to approximately 3.3 V. Allowing VMMC to reach 3.544 V
> can drive VQMMC beyond its supported range, potentially causing SD
> bus bit errors and resulting in the voltage negotiation failure:
> 
> l2: unsupportable voltage range: 3500000-3296000uV
> 
> Reducing L10's maximum voltage to 3.3 V keeps both rails within their
> supported operating ranges.
> 
> Co-developed-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>

No fixes tag?

The rest looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
