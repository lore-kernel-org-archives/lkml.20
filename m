Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0653EF66B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339704; cv=none; b=iY+wV43Cv7kQPKgiVA2ZpBgn+jBWPmG6CUw6mrYNrwEUGtWnwDSnYobJNhboTQktLoE2OLyTTxFafnHoxs7pXuia0W2sHDIQIduPXyztckHKgs/LI2m37rXgQvCCPfKQoVF/Y1GnEqe5uYiKqtSpeNm2ii/R7CqJP/4d7z4AZgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339704; c=relaxed/simple;
	bh=eB/Bh653xAWzA4PtfQ6Jt/DwbaWdTnThPhgF8M4tAvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1zLCpmiAK9t90wS0wA5njH+0cwcBJzPDcg/PHaZLwmAIL84ZjdK9c32nd48ZR5pJniJXBZBoz2g26cYoWTNevQFlcJR9uYYg48iMe1F2tiDJMvOpAXHciamaq5wekR5gi6RwSOyHqtPLPRH2EYs96L5kGve/hh8P7xXLBD3jHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzuAVyeh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARZSB6HV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzuAVyeh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARZSB6HV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VViq079075
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 09:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bg7g3Rb4CxJ6KDsirvNiFlqw
	jHr1Y19jqJWdobxDWFc=; b=UzuAVyehZgQf6psj7mtIXh6yzPkgopoyRJJAXrdS
	ZXkOZ8QeVVcxUo91qKnBGLiELpvpjXvjIhgfeyDY6Jk7uYsjUEZW9fQCU3x5hitc
	WRwJPhTmXNyHcPQpkiZ3mNizsr+yls4bMPWPhQt7ubVA0RnZ7RGnmQ4/FI3Lmq4H
	dM/f+CWm9XEX3wW4X0h9Ycs24X2mgJ3mBOTIerRy3wFXoad/GyXXVHFymzMT+tik
	cI5ZNorHP2N4wq33sNsaIGU4HGLESfoODxleY5Hs6sLTw6BecVLxDR6bPwuh3dPN
	1fPLK41NNhssIrk87QRA38rgWY6u5PSn4rWr7+kW5nubCQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge35k33wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:01:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93917f4ccb4so127417085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339701; x=1788944501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bg7g3Rb4CxJ6KDsirvNiFlqwjHr1Y19jqJWdobxDWFc=;
        b=ARZSB6HVrkQq0+2uxG27ukpsBn39YlSK03d2DQDxj1PTtsDVmVG+cn969aKJDPSf01
         dLWGrdpVZBVsGuFlp8qGiXZatTfpeG7ICzTzmW+fwZBP3/nlQBU0CqodB4PFE+hEYB0h
         h1jIMDULIKsb9JvtKsS233CGONhDJA2V2Vcd+yJuznBy3UQiFHuOgH4pYvqvFnVXOPJr
         3kRLquC+A1uP24PPhO1ogoOQyJF0svnJc/dVO6URkNZNQ5Hk6JDFzHFqkQRBkaFvE48g
         coQQGEuLYJAsPpF9aMhrIp/h998kwq3ldqwU43gMfKAiqPwdUtLbUI4kITzn+0HTEjqa
         hoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339701; x=1788944501;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bg7g3Rb4CxJ6KDsirvNiFlqwjHr1Y19jqJWdobxDWFc=;
        b=NfjJs1wPx+crl6p8/U9Ngg8b1AeBg4EOddD7PLqxBnexDB6JyjIAWdzvcyGh4C0FJ/
         zxhBbIhA5JYzhOTn6G5tulbhvVOCogUzV3x5MxkWX4qFkSLGw3Sr5hSEWB/9+MbmQdYe
         Af/jnZEYa/I0Gg9cOQ8zM2mgGjxKSbfCKZsIMdtpNOUf8sj6kDpfBpyNV9naD/oZKKnh
         YxZyvpYuzf+mqnDTd0s0PKgVokIFfJNUXFsu89UnPlj42aa94s7wmVcUa0KSmE3bfUnJ
         AomI7arFe6bvfmJtysRg0MjlWkqWEkyHdoKKU3GdFyuV/lhKpl5FBg5cgOw7nxoUlwxf
         0GMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHaP4S21unuCV4h8narslIyjLmrA/4oFnksx5GNjvHjC7mDRAmyRjzGh5yyjpu0Vb33gRClmSUhZOEVyo=@vger.kernel.org
X-Gm-Message-State: AFuF++lSSVu27tYLoGioI5gQycojiYXbbGuqXi8kMlG8txgTRu2ZnLma
	6a48nCfQa/GBZ9U9IP/WEcZUAFAnlWGbI7vE1IajOnJdlL1aHStjVng8T7DShVlNfhlmlr1Xwfg
	c+F/YclytqJP4cVMuHQp7d17OBAW/9ROMrQumEKIMkWVIAZeHwccx5y0x/WtO+c2YC00=
X-Gm-Gg: AR+sD12pIo9ZVsjs9GaYHSjfoWGV6RrZlDRy4wJoyVCX7Q6SPr2t1lLK4JIklfQMXEa
	aki4Rd9G9+eUjXNQ7kKyzpRBUCOIS2n3muQA/ebq7VzriNDoX6aduEpX+MST07l6CHu75+g+dWE
	Sp43BpuskjkNJXrDnz3RUoe0JhyccdxdzyBfI/gZS5dcfyqFHxPTpGuQUQLilqXf3RxgAMZcqQV
	F8o4CRkCE3eBM4i+6vZzqjbakvcgdI55jrUZWVK/N6g7W6QOeItq9Mcbawtq9gGUhlhxrLQT2+g
	UQ4nyWNZR27oUmSGY8pXcmyhGrKU+ILrKeWBBXlwmsbdvFF/6/XJ6rj82Twcw4OAGyA9TxZ+urX
	2SdUD1eMaKHoUxwU=
X-Received: by 2002:a05:620a:17a8:b0:939:c45:80ea with SMTP id af79cd13be357-93960f86129mr358425785a.29.1788339701148;
        Wed, 02 Sep 2026 02:01:41 -0700 (PDT)
X-Received: by 2002:a05:620a:17a8:b0:939:c45:80ea with SMTP id af79cd13be357-93960f86129mr358416285a.29.1788339700561;
        Wed, 02 Sep 2026 02:01:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea468sm5188150f8f.26.2026.09.02.02.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:01:39 -0700 (PDT)
Date: Wed, 2 Sep 2026 12:01:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] regulator: qcom-rpmh: Add missing regulators in
 PM6350
Message-ID: <pbaoeou4eqcqmkz3bopkrzdcr63zb2pkg7hqw4yyg3yph3dztx@lathmqh3p54x>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-3-68288ab70aee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-fp4-regulator-supply-v1-3-68288ab70aee@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OSBTYWx0ZWRfX00ZY8y3PQbpk
 sWBg8eWit5wZUKue3aAo1HjHUiATJxWWMgvMON0hnxam1i1PKUxFMx4GYQuo5tGxQURcEaPK2XD
 /C6zB8+zHW7i3BG/iEM5v5DFXfmBtoKyVF2lBVL65rcoCSbPWWYHmjlEIAcbQdAxK9XBaIJoSVv
 C9OfdzGRMiUMl+4UDi7EIqQl/cZNy7aFl41Ap9xVd6TaQJpm7HBxPAn12UhYP0COWEF6KiUgtmQ
 TksygUzFuun5iVE4qyGrQT+DbvLD+JLF3/hho/ksAoACSQTQFIY25qX4XUIfOjBTn0ZxamD5F/+
 4vPjfOwf6b0n5gN3I8ZRo6IBLSWRIRXL8xHShs8sS9kA+/EoKBqK4gHhok4cGUw4K4E7pNFXnBw
 igXQ9qvTRsRc+fzbrfMFPE9h0nXENDvDwFExu6x2Y6ZQnhonImGqORMw7+aKoGPBocQj5gPsrud
 NWL3tCrC/fntaW4XJPQ==
X-Proofpoint-GUID: pni6OcNUduwEXyhkaSR78klGJi91_HBb
X-Proofpoint-ORIG-GUID: pni6OcNUduwEXyhkaSR78klGJi91_HBb
X-Authority-Analysis: v=2.4 cv=VLrtWdPX c=1 sm=1 tr=0 ts=6a97e5f6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OSBTYWx0ZWRfXwrtatcTi4X5m
 diOzikOwP82WMwyiKdhsEFPlBLnWN63z3yVA/JXAL3mrKvTKkMQY0WxrONWgqHiNLG6cKJBQWY+
 KAXepZ1j/Cz9vqHkGnsRKiC46u+gdZQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020079

On 26-09-01 10:58:58, Luca Weiss wrote:
> Add the missing smps3-6 and ldo17 definitions. While smps3/5 and ldo17
> are not used from the rpmh regulator driver on SM6350, the regulators do
> exist, so add them with the types based on the datasheet.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
