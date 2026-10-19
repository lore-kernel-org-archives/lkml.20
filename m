Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626FB4CDDF0
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406005; cv=none; b=YssQ+6frUGirh3yqyuDKdwkATDd1LslooylSMnLiPFXQ74V/w5u59JxsUqvsUuX51cjC2sF+hdlEsPHjUCGgKO2HvRYgZ7w6yOqOkOOR7/G3KtAFoy9+UWZ0eG/NFsg2lG8O1ekcRiPi8c4lTgH4RApH6+2kNeO9hc/eHThKI8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406005; c=relaxed/simple;
	bh=Qzb3HHEtxPgHJGqlijd2TCpD+/VFd/BWXBo9naFVqAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmapMhbEgJm48g2GDTlE19Qku9XkjW2OFLJIFc2q3U+ytJTghvNab0QFVZ5OAi43rjgKK5PxQXT4BVVbAKoti9AgqFVv1qLVESCyi6EvY/V5s7BpwEs7SOKdyYU9tIRfOxwA40XfXjh/6BqLkGrd2YkTW38tBZfCaghqYCpdYr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOgTJjEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1cIzuFc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOgTJjEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1cIzuFc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8YhGX2688724
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uYJLay0WDfuP6LrjHm7Y5hKU
	02X1f9DjWzZc3tzDB44=; b=nOgTJjEmKAIJ/toFGoThy2BnuvhlsCchi2Zc/cPp
	26vbNcZ0q+nbwCJu9aJpPs2WrIIWE31MqbiZKgrmJfKSrVjeraDu67VZhXDmcO8F
	gxPsHa7hE4G8lj38Sn4cgfi/zhkVcO7/TeUAOnPaSJAmky96Gh1K+2gxt2NeB8Nv
	UWLbXuCSW3xFz3U8rnneK4JstKIJM6iKekp7z1JIoD1Ilaa3WvPWmdafnbib9dLv
	Fvd3setCOLLxTcQ/f6QixCkdnqYB/nkpDKOgAtIPWuSICKG2TvP0B0wLrNdBgPNQ
	w9P5FyUTB7QlcYGMWod9ExUZrblO2nkJkwclMFKspofzzA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn0evy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:33:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ce7a85f04so404136785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792406003; x=1793010803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uYJLay0WDfuP6LrjHm7Y5hKU02X1f9DjWzZc3tzDB44=;
        b=C1cIzuFcifjA4PxFWzinpfivujRE9mb/sraIa7R9rzC5YBlqXNdPlmosjYd3sz4Rzw
         vQZEX+7mPIb1EO+ZUiLKhsgB2yoG6lZIRhAuOL7zPs9YNXi4qWp9a1wFRQRi4FPGKgoz
         XS+RWzSZEU4PGi6hCxvDiIq9fx9t2ZgP3rAdpFF196+R+RPTuYVDCDlOwvkbW0z2/fcW
         VKp7OnVsm8CvC6py2vrqon3q68IXnISLGaiKXKawDEbOoMwmWhZb3UgEdMGc33YJbarO
         fnUnHYK1YTbGR15+PSoZdf7h0zlIWc7l2hDKDHspq9GZ4MDBhaAwRN/RAYQGj3sxvjtm
         A6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792406003; x=1793010803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYJLay0WDfuP6LrjHm7Y5hKU02X1f9DjWzZc3tzDB44=;
        b=oEgHbqj9Zl43twzy7JI3YPZsHORkD9bg+rRBSOBo5QHlElsoPPFlMu5pvpoO+0+uCP
         LXfN5VSKZCGc/hNHczOXu9lT5h2t3WQXHAUHBLclwhgs56ncMDdOP1Y2pxzVpA2phfIr
         Ff+CgeiixXG7079GlSmg3Kmu5tbo55S8TJCjpBtgR7F0/Gsl+CBJLIIqCddRbKJypcQB
         4n19ZiEkncCEB1nAXrDQ9IOpORChfLCQiAA2d4MCbhNNDRMZgfmECiBjbMDvf+lSEIXd
         NpcQL5buA2a/rRchKDFD0mTc/hPvaodfOIxkbb+t9i9YOCoSSTigxDLUXll5u3lak5vG
         1bHg==
X-Forwarded-Encrypted: i=1; AKwUvBzKxwqrSHQfEXKAkA+/8yUSPZ3oOafSNmKFPP7gnwykeExDU2aRmId98Bopk8eeSfZkQKSYvvFIeXd/Q2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIA+My1kiuUSR/b2ybJOMq9dFgef/iYBMKztLCEzcpGXd1M9Ptf
	tpbGg2YXsQf221kK2nfAp20vuWAPPH1nu8O5uPqiM3rnTYtnjjcyokSTnMzNUQ+icdKIkpvd0Rp
	gnYTnpGg63xsIuhS9OJsRwujOkZe7OYihoNyku8giXXTIrYWNc3aMbdB/aDp9B6pV5nw=
X-Gm-Gg: AYBFou0UZ9fXTGeN0s1cMKQ+Q7N5x0uIw9C9jL8mLtedS4uoHJA5EEz8v7zrEihz72j
	3boedmbcl9Hcuhs8lbm3ZrbgMPGILGr6ucjyGy+Rj4fALg/Qy4Z30Y1GkaFYi8SW3U87W3acdsa
	tiI58hva6jDuHZUxduf0uyzgutDmjnqQ1XbBlwzPLUdKaJQOe7lItDaK+ubPaRfBRwNLGwYX7e+
	JsK9CgIZEfv8SU7C0bHfA+1mmGXrRo0Ue5S5lQnTikPlwJVKScc71vJgIvfTGz+0CXWcQ+FlHqK
	zo9XnQOysmrd9qJUoDkIlSKn0UfI4Tc9P8bLeTvYjMsF3n4F6rvi8xYgWPrr2dlzc6y70qZGnBs
	ozLTaKfNa3dudkeU+
X-Received: by 2002:a05:620a:468f:b0:93f:242c:f4e3 with SMTP id af79cd13be357-93f29d2cea2mr1163420085a.32.1792406002628;
        Mon, 19 Oct 2026 03:33:22 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:93f:242c:f4e3 with SMTP id af79cd13be357-93f29d2cea2mr1163414985a.32.1792406001910;
        Mon, 19 Oct 2026 03:33:21 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5038b8sm22852542f8f.48.2026.10.19.03.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:33:21 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:33:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Haipeng Lin <jimmie.lin@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1-denali: Add PWM backlight for
 LCD
Message-ID: <maiifisui7aqt4xfc3mzulavhbxmjzmvdspy3fzjbjf22fgmir@durcnc3kia7f>
References: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
 <20261017-sp11-lcd-fixes-v1-2-0eb916c01a3d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-sp11-lcd-fixes-v1-2-0eb916c01a3d@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfXx4/9jpub61lN
 l3ta/gaJfbq4C/sm5XllQxuf0SPzlob+uQZ8vWWsJhzYpXwvZ9AToqLQezaz8AT9xcoRXRDOxVo
 H6jfxvHkLn/C98BI49ZEyi41j+1UIeo=
X-Proofpoint-GUID: M62Z-Hf2A491EAKMB50AJruBbM5pw-Ke
X-Proofpoint-ORIG-GUID: M62Z-Hf2A491EAKMB50AJruBbM5pw-Ke
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX8OV58mimk0zy
 Bvi6dbIWIlz3njaBj9A320C057e45a45l5jcYnCWwTvnaLqC1MMX2UPo4CuK+OxFDvhb6JSxH4n
 oFkZTZrIa4NMOz/GQ/vGabaq4izJiLBWvmI3RXaJKptLHoP6M0cmETJQpep/90o/IaWfIRWgFFI
 Cvo1ix4f51mjAt6FratsYcR+Wq4zKletAIwMUetQTb2nDeuIkyeiWBWt5/vB7KPaNTtPhN/hfrS
 vZyClXVWnlGMal05fzL69UWT+SGtLl/T3FWl0x6DRrx3BBWC4R3nCAiwoOVRuMBLw4P/UdXQ8NI
 69yD1uvme7AwXFDMvFTKXs7dbk/iB7dJBRVPbX00c3puUEW+6IFM1ezN9eyKxoFZ9ZpdAKy9Epv
 Cb6fQJwqZ0CBS0o9/azjHh+7xvfErLU0r31Zqe9eJg2kvyoP8Szo2ngMdf0j3REjzxOZ9pTELKm
 FFrDYDgqR7FSiJBU/vw==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad5f1f3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fqw9755z8sLMpkJnvnUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190041

On 26-10-17 18:52:26, Dale Whinham wrote:
> The LCD variant's backlight is PWM from the PMK8550 LPG on gpio5, with
> pmc8380_3 gpio10 enabling the supply and gpio4 the backlight, as on the
> T14s LCD and Surface Laptop 7.
> 
> On OLED gpio4 is the panel enable, so move it and the panel compatible
> out of the common dtsi.
> 
> Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Tested-by: Haipeng Lin <jimmie.lin@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
