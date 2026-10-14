Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013565427E1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987558; cv=none; b=dmARtdj3pBBbl+EIniVaIG/H+8JShoiQbiP5vuFmICTfutly+EyCNLFCKo6d2aL7IjMue0nI7eQNZA/McQVZcWq6e9dp4DYn7RRxQkAOhpw7HOFe50BiHokOUc91PV1wcB3M6XeTnrFRY2c4yD+xSY9dYd7wBSypN8uhYDteIfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987558; c=relaxed/simple;
	bh=BDUz9+sR1MG+9QTtU4g7da81T1K9UMRtam5/8VK6MzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ead1nkTvaOzRZdPR9I9wKMNrA8TIl3FGwJtMw58gRZC1yDV/hEx82lujxkwCY2pE9ImXEmYR5uMkwlPHxAYl85Kuib0Gs4HqAXmazqEs5BQ7c32aX0YyHH4aVUxwVuGzR+6angR1AEMLie2835Fnn9UtHYZrSNUCplEJDxCHYLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mORoJ/tR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/lG0xKb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mORoJ/tR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/lG0xKb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBXa2b2686071
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=otDFpGsBNupOLGxmfEYEnGiO
	SHtffWiXTVN0YvKRNs4=; b=mORoJ/tRx5OKjExxV2I8SHVWam/voerBRirkC9gP
	+P60tMbhhhI5jpo2rM+yBWeoK3vl3s8d1VidWA7fGGkcmMlDl++JB1xYimDsCk5j
	Wy0HYCTZWoHKkyDnBt+uPUfbaW5hpb+aECVcD0Hfk4ZiPaImrIMCOZcvb8TwilzM
	2ncAObT5Vr0RArwE+hPcUmcm25vo6ocD34iqyGZN2NBysb1xSD8jr+2LOEeWtaM0
	82E5E427tsHz/yVcxsbv8LqS4BJd249z30JVdhxyNc16pxzFsVPC/Goxbh+fOoDv
	NH3Bo/p1pMJyBWDLkP20fY5xYpCYsfNnPHWL5S0NLrV/oA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u1ym1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:19:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf6c528aso729489885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987555; x=1792592355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=otDFpGsBNupOLGxmfEYEnGiOSHtffWiXTVN0YvKRNs4=;
        b=B/lG0xKbQteLt+HEthINULC79jx8ovBsqUg8CARTDbwmxJyVLzb44rSecSIdzGGu+x
         +2NtPGPliWMwfB06VbquOO8d93gcgdwkx2eG5U6I/F4iAyF6F/jKPt4BrCRShOUrx+I5
         AUniHPnrPHvUNFxiBKDd3q4wMNmDWL5GYahRQ4TF2ln9oF8CVNDZ/hv3sPxPiFe7Qhy9
         o8xBCRoT3y+i0UN7vJ/5FWe+TW54Q4OXLi1wOmnwf3x05t351YXW7xw/igDJWvmprJLu
         LjMX9FJZJFxyxpZx0kB41l43BBA3grv+ZRFB1yh1ydPGHqzRHUrsVmFFYcrfoytVwm63
         HOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987555; x=1792592355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=otDFpGsBNupOLGxmfEYEnGiOSHtffWiXTVN0YvKRNs4=;
        b=kXxE2s4pwabKVPDzpk6eAFcVwiiWCwxU/MjDx6QQb8ulVEGDG+6bpkVGQGKbNa39yX
         UhtBAaVtrpV/WRwVyyC6wTBtVEOL3+SnOee6RbEhOCQssd/jZCmuQdyaISVCb8M+mBjn
         3VYN4Q2cbDimyBZSMhNa69TygHwthn8BeHk+5lBCteEl0Zei72ajAzaru6luDpa0ZgJa
         PhijZOPYu3mnK74UgGtLpZl2nluAwMVDby6ypHxRV0ehabCLlAoRS4hd7Zy+IEpFBt3H
         CG1agwJEUC/7XYK80O5nNA+3DRzXxMR5T5iZTYMW6GPurmskayfI9A4uOZlvXHeG43Ro
         0ilg==
X-Forwarded-Encrypted: i=1; AKwUvBw4ULWIykbfRGcOEv61M4+yEeFT3cTJgp/2uPe/Ichygk6IZrpF8WBlSTcvpzhE1nq3pGQP8F1uh7lrEtQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrOdAqqRb1ZfiglURfFavBzz4Br/jvsTSVz8l0QsuDXCBFqDqe
	nriq7AFDc+nsPusrvYSnks+if+kZ/oRB/uVtx9I8h2RXBb6lngAODWNHH6CgNNWMf8U+zll9RG4
	GN1EMuJhZy6vW9WDNaSlDxYGXxLLcpE7b+AIC7Ah+RrC+sffrAnTEeACNsMwAJ6dYz8M=
X-Gm-Gg: AYBFou0dFUtTfpLfjO+Tohic2o+jHoL0zp31umeV0uv99FNabK468ZEk7XN2LHYVk4P
	eJF8KwE5lGDutjDiqMx/s2PkE0veJpw5F8yGtYWkMLliN8gNDVEkqBQmtqkRc6CNudHDYHPpGJw
	I4KfJu6F1vtnsF9pDVxGUipLL2iGvlWS9KNqxywBUqbQ98sOuexyn03WMpfqrouMfxQfnfUL5FO
	mAeyqH/WpXQsPP4XJEyL1b15mwydwTHF5ZfzpFacEfl2JyD+AiRbzs5xnHEOJ9mwo6iqgNzaaY0
	wDSRITbSQ9U19+Qqw6D42Ibq3XcWMKV2Ky6phgf/kEqM3vbonE/UaaqARCSbZd5vPHLswexGjDV
	5JwiKHDqMgSFX/kdhDszU89WTyZlWszH/rwKl0M8KjGSFmZrboAQZfrJCANNLOxgbmK9tdPAtle
	fml/UtAmCOETkK
X-Received: by 2002:a05:620a:17a3:b0:93e:6283:eba6 with SMTP id af79cd13be357-93ebd225b0dmr2683529585a.38.1791987555143;
        Wed, 14 Oct 2026 07:19:15 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93e:6283:eba6 with SMTP id af79cd13be357-93ebd225b0dmr2683522385a.38.1791987554612;
        Wed, 14 Oct 2026 07:19:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d85515sm680657e87.47.2026.10.14.07.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:19:13 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:19:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH DNM RFC 13/16] arm64: dts: qcom: sm8650: Describe clock
 controller power rails
Message-ID: <su6pmts36qj4hogxfthkrvjr2aod2r2u33onxifqanbarxk3tc@36qoces4rwor>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX27l8sEcgu1OE
 yHYjvfMM0t1CNj2FMXfkwzKLCBnAo+pmcvFxk69cV8Tw/sPl/LO8mCqWve/G2wskWbjS8sFIfKc
 5QbBTRMMpd+lJl+xuwi3LQqy2+y3xVQ=
X-Proofpoint-GUID: wDYTVBcCByfXYZXB3HweXGqazRHVXH8d
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf8f64 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=gsTOqdxa1cyUJVv2QhEA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfXzc1VoB1sl0zN
 +cqBg8J6WkRQunps12D4xf9v3JTMpDQwYYGmIX3HxPNGDjzv4uHP1oz0RKp7DTa7FcS4bZtSRnV
 xRaFdNPLl8dlydLPcHU6btQHnKMyUXRjc3bREz53euJ1RLFxIK056jvg90yBK36T8f2+477G0St
 WXcQ9H4ogPrjth5u+50lw9OHH7JIfSjXjXaWIkjojawS+1+ReCHtzW5eAa+7Ret4ehMiuZIWHOD
 qUlSNx5zkByI3o+KLkVjT32+ZWf0mpK8VdO/JVGd6ujRSUbUkDzqLONlPvfoOuu23iO3TSo/YFk
 pxIniAFGdi/9v0gydReeyLq1yb9JaOIcFiev2Pc/d6t2Voy0L2RGC/bt04zJ8sKqf6m83M3i6I3
 QT7hu+mVc0EvwehMe23u2gE9VaSESyHsaIurvm6quXHNg5zmcDg3nmADrUx7n1BOa3CLaTiYCdE
 GmTMsovERhcujSh6CIg==
X-Proofpoint-ORIG-GUID: wDYTVBcCByfXYZXB3HweXGqazRHVXH8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140056

On Wed, Oct 14, 2026 at 02:19:13PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The SM8650 clock-controller nodes omit rails needed by their clocks and
> PLLs. Without those connections, the clock-owned DVFS implementation
> cannot attach its voters to all required domains and controller probe
> can fail before any clocks are registered.
> 
> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> @@ -6049,8 +6055,8 @@ dispcc: clock-controller@af00000 {
>  				 <0>, /* dp3 */
>  				 <0>;
>  
> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> -			required-opps = <&rpmhpd_opp_low_svs>;

I think this is neccessary (at least on some platforms) to keep MMCX out
of retention. Even if we can drop it here, I don't think we can drop it
for older platforms.

> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MX>;
>  
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> 
> -- 
> 2.56.0
> 

-- 
With best wishes
Dmitry
