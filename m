Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F3F45FFAC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778050; cv=none; b=HO3fY1yNSbE43cJfMS+AW9i3LX87NWAwix1Tq+DJ4dVPWxvxFwm7KxL48azaZvb0TCCs2qwaRHIe9f2zgSdxtG7UheMk1cIjaBsCkNI7Bks9Iu2VXb5Mk1IforazORF/ifVXENTLwuWqBM4/WXPlQdAqDye1Bwtd5fY+mhlZbmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778050; c=relaxed/simple;
	bh=9NTlxl/KRT7a+u6DdwxgUgjC8syCrwSE+8g5XIKqIco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsPFVo45qQjZNuwHJIteKbkucNWXOnXo+s9MTlgf0isjEF410dJXwg0k1tLK78RbnNdeLa1clhmOCJyGt2OKqOLZwmeGANVZPF0Lfj2ygKqz97hck+6I2FJ/ANXGwiPjaDvggBgwsToL5lVyjN+9150cxfwNHtZi/jvDz6+LOmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AddXTiFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIqLCCeS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AddXTiFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EIqLCCeS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bZUe319035
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=joXVJ+ek92ipV8BX41gQLKXS
	+sH6pDp8t54BpG2WTHE=; b=AddXTiFjvwJrOezmyQAiedNUl5AaULxa4s6ZUpNQ
	jlCEn3vBr52VEpai2I9Gh8nyffiCUQz6V0vvhVHV7bhDI8SDtu6XPUgfOJuoczeY
	w4T4FsZ9YUzv0PhDAcHMgHSjt3/7Smsym0UtKAkOh1tfpfj5QVI8CYId0VQR7QoN
	4Zc+7yh+r+YaedGbOFAs4LfuNwQv+JllbmHTLlM6w1b65OFOc+h1wLhhAtjrXrjt
	c38wEVNj4ZfvxdIzLQbw2NRTCGfRSBa+3AVF7IDfavq64uo7FX61H4mMiZ3Yz6Sj
	F/zsiTRhrhnqvlbGX3jqkJ4zYIYuZVoS2LSEvy9V1mvTKw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjjass-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:47:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93915f50a5cso884547985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778047; x=1789382847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=joXVJ+ek92ipV8BX41gQLKXS+sH6pDp8t54BpG2WTHE=;
        b=EIqLCCeSjsmzdRtRiEYxusBEQG8GFHbUxDR0VMZ4l1O92MMsnoLgtWxREtXXuaxR94
         BgK3CQ18SIGWIU3eFDy6CNvlzgqKFTyCUCRxl/EDkyuNF8lKvIT9SmBYC7ZbkA6YjKqZ
         BDGeUkJiiUSL/f71/RtimMm8nLcGbb8nu3ZreCwNsed/H7blxzANfWnCD6xQCmRyFrvE
         UTMXMwzuL+jD868dBs5HzoD0AsNlH1eIL3nnHNnESmZERq8qdONcdNFb/x/GducEK8Hl
         +8wroSk1wR589m+52sirsDbso/F/iTZEPS2R5Pt2SMalwCjSYPZxwFExkgdGk/TEWTeQ
         H7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778047; x=1789382847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joXVJ+ek92ipV8BX41gQLKXS+sH6pDp8t54BpG2WTHE=;
        b=pSyr8yMLi1uksoiAy44n28U4Tw6vfOh25KFESypreMu8ubaDhaI9i1S4eD/UZ+mDhc
         wt3q2Rc3sN2GJn0OS4CpO8iCrixIov92yeIbxz1LNMZubB58yAb2tms8JB434nleH0z4
         dKbwM1ta990aIIpW6LqEDd7iI/axJdcIbZTuPzx1o7Yc4RgAS1SEtQwGN8cXHAq6iGwx
         8szhC7I05zst3AQM4k+/BstmZs662SQL6wY69Lh5zs5QYOeL7UdoOjMsMyVk0uuNbET4
         9YwWvuDmUzMsLD6VRJUSB6zo3NXZA7Iv+nr2is9LUkvh/i8w+MDoNsr8y5/1fpmcCUFM
         1MSQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9WgcOw/3SqEu5nrsoT6mFbo3z1zU6J89L5BhqLNvFx4VCuH1a0L38DBTi8oUcs29PNX5EWsD8RKZaSX4=@vger.kernel.org
X-Gm-Message-State: AFuF++lKna9m6MhsLRPt0psobAbKjtOgnNrner9IdH6K1fq7igRBc7Oh
	/XOsL8dXdCgsrWwLu3yLcOUA+sAoXDncW/LLWrEuBiaDuZWdtwv1Xdu5k5G+byGhlYZMCsQQEPy
	lTHwfaRSIY3c/yBd57gudIwulDWSj7cnE8NzVT3ri9Vf/DUGpxGXdjjajJxTlmmVWdo9sMBxhCR
	c=
X-Gm-Gg: AYBFou3sB2Uy6h/lBmDFkhOt3Qxu6Dz9UuiXbuB02KrdM98OhfGoUnivT3nRgHf7V60
	vClVRr1lTb60WU5z1h9SPwPHCQTc69dUhvEriboE6hGTFBpU1al2NAt5O/P0Md99wG719sFkILZ
	kWVhUSCoOQuwjHxHHqAWL5tbircV50NI88LG/RKz95Vw76x3E502E9os48blUpzvQzVad4bkht6
	F4AVZwmttqN2ywQIowNJjiOP50d3j5UgHLbKixVcWcyr6+xhf7YqVu+HvC4yDegdfMcdjMUpFNM
	P0bFu9uiyNH5R4fcgnosR5Bx1rAK/O7EsCK13eeMVhrfnsrO6rq+wvp/fddo1OQHEBn1w2/EFZn
	mqVmeFkTeVFyT
X-Received: by 2002:a05:620a:d8b:b0:939:b783:1748 with SMTP id af79cd13be357-939b7831bedmr22464885a.7.1788778046598;
        Mon, 07 Sep 2026 03:47:26 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:939:b783:1748 with SMTP id af79cd13be357-939b7831bedmr22462885a.7.1788778046123;
        Mon, 07 Sep 2026 03:47:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm423348425e9.1.2026.09.07.03.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:47:25 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:47:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] arm64: dts: qcom: glymur: Add camera MCLK pinctrl
Message-ID: <5unqbyuzs5sglugv7kbtvjqmsokjxm44ldgpxatfvcksntmzdw@qe4faliho5ur>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
 <20260907-glymur_camss_dts-v1-3-6c2ced5ea5f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-glymur_camss_dts-v1-3-6c2ced5ea5f9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX1Dk2N2GpT9+J
 RL3njMFvWV9jhGPTp/PPceHEDijCA9D0IueKtmDP5qTXdYeSRsVSuV4Z2E1ChlsyZo8lyoDgWp2
 fJ923636cnTO9Bs3SPRP6NM5Mav3wDE=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e963f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=x3DTJP6EMlRaZ7yyrLMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7sA2Qk8Uj2CbXlYvgTc2WaWUITfG6UHM
X-Proofpoint-ORIG-GUID: 7sA2Qk8Uj2CbXlYvgTc2WaWUITfG6UHM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfXxpQU+HS5lsrp
 z5gv+fDFeHhBwdbwiB0bPcUOuDQafsk8ROx3HUu1UBjk4eDPYbZlaGPGKsrC7m8IVn5o8H8MU+f
 sSYdjtPKPfld1dgvUL+jc980JoZkjsmXCzexEKNlkAvayG4Q0hQjC1TCQ+VKViltTJs/gQEPQfk
 Spm0qzL50jsYVFxUoV4DWKmfbBB1bPG6F6bDP9b+9UTppewmglNLI4xFsebpV8KG1wf1KPQvqu2
 0/WGTj16sLOeQbcoZnf3bKWZI9WOHU8ZzD5mgcV7ARUDfnaztRF/PQIEyfPhGbhtBx2HfvB+AjE
 AI0sMHDGV3DQ0jc0r5QbutYNqCZbZWGnDo6dwnS4Dm885qPaHDKmKxTv7PLma76KbOxt/OKWwRm
 BmblWCM/iCQJD7gY9dP11cQRhNtoXP1Mq7/CdG3mVTJOVt7MkWxEX2gqTk1zAKoDfLskmQIEXCC
 31G+5+nrJTA1f9Cl0lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070117

On 26-09-07 15:37:46, Nihal Kumar Gupta wrote:
> Add pinctrl definitions for camera master clock pins on Glymur.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
