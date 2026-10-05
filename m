Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B10728033B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 01:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791162377; cv=none; b=JfWTCSeF1u2UB1Fi8DfV4Vy2cbLtZPjvn9bIlKN8FfNkpEd8SsdvpJvBNYOWcus2sy/Kl1Rqpbnd0ADx5H8FTO/CNNOIigjMlMWS/51YZ62vdODDYZw/tytCRNme4zl7fo+q/lD2Olmnr3eqV5u6hlIACk/sb+Jmqk555qobdPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791162377; c=relaxed/simple;
	bh=pdeXZ1cEruzDL+CWGUpzxxXCMKVZYF/YnvDigSi07po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DU7hDl/oWhEWg44atjBXxCnPQOMNGOTr2hmFqRTBhlhXdQBCYUpClYCi7ODD0ctquvbdTFrACT7ydKChDhz4f3q2CmlPwaF0otUmYi7ChfEhBITZHF4roGGGvj/CdSrStqCYbmrB3lnpeOxPoyNiueffPzBmbS/wrNxUtKoCpmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PvoqzNZd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ddk7zG5E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PvoqzNZd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ddk7zG5E"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510Xam093925
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 01:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=57RP371wUSCZPw6u6uxhcm1e
	ciD0zGPP4tFb3PYgbLI=; b=PvoqzNZd5o6PSmM8Cn2262wbRN5h7S1ueXgX376k
	QilApoBgoEFeAXV3zA0jlxlL7dLP8ORCvzcPLb1MVuEa6ZaLbF4axqleA5yth53p
	mcTrxzaPcuAl6u28Q4+Xx2QW/XCBouMxcUaespB3fkj2WV6hpka7K3AFI+8J1UF3
	Q9Zp4Pm76GjAZ6D/KUv+GyMzGE43parIPH836FLbZq9F3Zn3251ALSXUvdWeAdct
	ml5L5mYgOTD2yolt/1+mZ7IQBxWHyxgc6JTWnfGLkQASDXfC24qq6BP7mKawD7Q2
	txc+Ssrz3o6TrxlizeHBDh5FXBxBTgfVfCC+nl7T8iE9ig==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu435k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 01:06:15 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9829a8b46a7so8003241.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 18:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791162374; x=1791767174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=57RP371wUSCZPw6u6uxhcm1eciD0zGPP4tFb3PYgbLI=;
        b=ddk7zG5E+t30euQyOWbE6nmaSM/Y0UuU7TRwVJ+azmactcy4XLLkWFwdPVJNhW5NLa
         2v/OfT3UXSz/tRINY0BoVpL/Uep/acNhFkI4yP5S+LeZo/9gPnTxDI7SsNmPTRecWRds
         6G6ErLotkHUohkbyYLG5Ut/x1WjI9MySo4bnXZjdPw1rlGZaEHIAO4/OSwoOFrc+Z4Iz
         0QHrvgtVnuZEisMtdA45L5DBZmSs4lbsovdrllP8rH76qKPXI/k5Vaj0qRFH1PvojxWT
         v+br9hmvGMwD6Ve+F2gX/ktvuA5TXLxVNcrLsdupHBHw/Px4RnDyM7k22cTFr1avEx1T
         xQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791162374; x=1791767174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=57RP371wUSCZPw6u6uxhcm1eciD0zGPP4tFb3PYgbLI=;
        b=E34huUq4twRGS6xio6vSgImPEc89zEfE069wyfRjULTRrhLfrNNctB/bYPWB5RceDt
         9PDWSxIlZHdK0dsXk31dcA/yJEDal1YP9zoPsZJJbaeuMJEbCyyrZ5iPTJgCZMbjO4Nc
         lAx9HuUx6dz6BSMPo45v93OiF88OPcy57erlEwlzUBrKn8vyfrodmfXbe2F5jWjx4MXx
         CB7pCOyaV/ux3N0D3OAUHixFNtFaZ6yRrOIUGN5TNPvetScheAokOBtGUovU5AT8hK90
         k1UrfYwLmRKKFJ9ASQjT4bxlXD1m5GcFAyvZocOv58veWkRxCjpMavrttYDKUhS6xw+w
         9vug==
X-Forwarded-Encrypted: i=1; AKwUvBzQRo7MYcKiW0/fE4XMBl/NG6ICyMc/ybiOqwfWr1/L3qIpbj0iTzJDYOPHhcxYagiRsFU/h5zE75x7o60=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvFKXuQ4XIwbIRPZq5UfF0EocIE79qjddEpL/Gpl4dl98IuuNF
	zedsgvuRuX4mKV3lC2DdlX3scmMZiqLJLGb37Db+0TQ1TKrS+LBV294z75pOM6q8H7zYeQQQNBj
	Z6zVy2eEGlEAnjvdhSCY4vjzV/YKU7Vl2kE8MZW5apu4pTxAD70bFmbY27u/GCrk81iE=
X-Gm-Gg: AYBFou3R5Ey5Khzx4IKOfifqrMt7JKsI3D+WD2/Ce82FztADmMQOI9JM0sW+MKeYm0k
	Y26L9rSnymHiQusXNNCB5A1Q+EYtgp3XMlebT6o7WPmszAn6Kvr/MgkMQtHwrLfNqQurgZ5Tfd3
	e4CsUsqCSeJk/GRxJYeFjlsJlEB+kDYAH/tkq2agsn13Dd3hBiqt2aVrPYlDqdOSVfdSuH5DIks
	2iaK6Jnd75F5KSAKuToldhYV41xHdqDeqr+Noqjlm8aMFVqmziC/QrcsmTOT7eY8V65QhWbrDdT
	8J+OQB8y8j+ED8HZGt1cLo7GZ8HbHIHxCj7zYzUb5csqsUBelPimzXGj8Uk6/nfxd77f+FwfCgd
	A9liMz8KK5rNgLidGB0IdQvi55mp3Wdl8Y6mp4fHkoKOK/eZGYUQ3zCZQaOufntik2GxDZsnads
	3d8z0XRERH0bRU
X-Received: by 2002:a05:6102:449a:b0:7c3:9464:efaa with SMTP id ada2fe7eead31-7c39464f65fmr744662137.2.1791162374526;
        Sun, 04 Oct 2026 18:06:14 -0700 (PDT)
X-Received: by 2002:a05:6102:449a:b0:7c3:9464:efaa with SMTP id ada2fe7eead31-7c39464f65fmr744633137.2.1791162373891;
        Sun, 04 Oct 2026 18:06:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303896sm35500531fa.19.2026.10.04.18.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 18:06:12 -0700 (PDT)
Date: Mon, 5 Oct 2026 04:06:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
Message-ID: <epga5fcyf2d3esucs5ulht4s7ixwpwlb35iygz63aqeefruc2m@mwmmkaw2z5r2>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAwNCBTYWx0ZWRfX2MLhNxRFUzcj
 19aPtQfCOjCjOGHpI4jfzsGk2d2QLmTL67cZaECmYI3bR2d8m1rP0iMr88ZknZ1L/+xODSrWEGJ
 qkYZ1vosT9GhhHR+7SbhC80K5orW839A6urTzin5ZEui0kEEksSqU4Ia7ZaDkRoJtas/LMPt0uv
 cgIA8LJW+HITMGRBB1YURtkDOZ4nX+OtVlIcgMTEqrxFXZTeDVsX3cThck9+qWCSTRluHUOFHbH
 80S5aq1+ULsW3gzujQ3ulbbnjbwOguK6uGNfJ6fQPe+UNaOvjoONHkOK6qLsxTyBCXvGKwLuLKh
 q9BQcJHs6sAQktcV5M2sI0HgQHC9mrh2G8Y7b6LnbIoWcM7akzqrjuYz1triTs37dvz+lHW0qNb
 lfjK2eWd2rFFZOzAp7E6zlRPzs1kAinBUWMydnRL8OzaBtbRb3Jl+zmS6wwP8ra22OkUDQeiuP2
 +9GIHg3KrSxCbhiJUhw==
X-Proofpoint-ORIG-GUID: jZZ3wR1vbh94nohIlMSaFvioVaIBLI0u
X-Proofpoint-GUID: jZZ3wR1vbh94nohIlMSaFvioVaIBLI0u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAwNCBTYWx0ZWRfX27E+PXeWZhjt
 0SvuHqFjJXtT0Zb9JAFb1xRscsBuZZq9iCr/q1jj1bLb3MGW1Hz/H1dXEXJYXNU2I9gS4tnyM3L
 61u3IrEvje11heGs+N7LTydUld4RtbM=
X-Authority-Analysis: v=2.4 cv=XPSl2ghE c=1 sm=1 tr=0 ts=6ac2f807 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ES-ZHpzwIs2e-kRI9IwA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050004

On Tue, Sep 15, 2026 at 05:27:50PM +0800, Yongxing Mou wrote:
> The INT2 GDSC on Kaanapali (SM8850) powers a subset of the DPU
> source pipes (VIG2/VIG3/DMA5). Add it as a second power domain of
> the display-controller (DPU) node, alongside the existing MMCX
> performance-state power domain.
> 
> The MDSS node's CORE_GDSC is unaffected, since it continues to power
> the rest of the MDSS hardware on its own.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index ace19b8b12d7..b3e3cd1d311c 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -3619,7 +3619,9 @@ mdss_mdp: display-controller@9801000 {
>  
>  				operating-points-v2 = <&mdp_opp_table>;
>  
> -				power-domains = <&rpmhpd RPMHPD_MMCX>;
> +				power-domains = <&rpmhpd RPMHPD_MMCX>,

Should it continue to be RPMHPD_MMCX or should it become
DISP_CC_MDSS_CORE_GDSC?

> +						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
> +				power-domain-names = "mmcx", "int2";
>  
>  				ports {
>  					#address-cells = <1>;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
