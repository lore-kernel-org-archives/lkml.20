Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD7E47F780
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395686; cv=none; b=rgz031mZDvdCqNLFfe/C2TMqinsEwMh44FaAtjrXjRDmaVfNFqkI6Ar1brIN/Wp9hT96kPD9jFFoBXeFgN2ERqeMl/gNnfmzU7Cv4zBKT1jOTkrP59JJ/ppP2iBcUxQExNqmHO8sGFEPqK1lrIpicy2J7VZ5zqiXsOfoG2trFPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395686; c=relaxed/simple;
	bh=qpr20bFoWIAVz6Uu6SDBY1Onol/yGpj70dm5w/7HmbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXi3Gki57Tyy/TWwN4po66K8f6VShyROxR03akVb/gPssxbh24K2jYfvdbJA7t0lMqS5ogGxKgSeVVzbosUQ0GjhdXksgSLTyZEUUwopZ6iOvU/DBMlqUGHh1g3EJQC/ANUqHBdG+e5ZyURKSuojBSUcMYxNCVvS2GN2bOGpJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAA0sVec; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZQtb65n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAA0sVec";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZQtb65n"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0OJC1514357
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hsC/n5G/ysH1TDMPqrs15Xr5
	Fe1eAaS5X/4GfDOh5vA=; b=ZAA0sVecotuQbIutF2EPWz8avV8PBXwK/D22V4EB
	T7JIXLLQ1Pw29b6EVFSY0wTE0TlLHg8qvV6Ovch1DnuNa6WKDmsBAgDOqC5PTuHw
	CixdNiZOG/sxPSsQUkr2Jpm8dKWiAr/QMr+AD9bvsFRLx/2dX/P8Syg4vKCUUFV0
	L1N+4XVPHfeVUI6LLy/0yu5JJQapY83jolFHwcayTw30aMwBkLJUNgcQzrjDmiuy
	EtLVZFaInA13UVi4sYGXkQg5Tur2Nc3gNJ1GHg1TMmmKRltzL3ZNdMRdbhd0y4qk
	MjDsMNpT3yqlYInbKgzhkCs/Kot+rkHfPMWXQuX82Ttt7Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0axex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:21:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-792f917d31aso2773075137.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789395681; x=1790000481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsC/n5G/ysH1TDMPqrs15Xr5Fe1eAaS5X/4GfDOh5vA=;
        b=dZQtb65nHQWP/U+6nd8BGH73mm5a8w6wz52rIwnINgZABoGFTDTakG+dMqia/1/Dvg
         9RS5uXK5f0C324qddWAmOuCAEiGUTZvamsJReUOEgV9KWNx8GyPixE++IPNCq17wsaSm
         SXIBJZMGXuAUkpgDIQV7TLwWtBAmrK9Iwv1cpciZXhUX9kbixtZf6JQ4cIIqiEtTHHan
         wjRONlkdE6Fnd3odKhr1/ZqBG/alF9p/1EQOXWWJ65iZ7Y84RUjijBfHQkCAAXtSiiGz
         c9J0VTg9bY9xZ+OJ+2DvswPTRocLXSH+vN4LhIa37qX/Oz06LUQZeQRaReogwlSzrTbz
         zyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395681; x=1790000481;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsC/n5G/ysH1TDMPqrs15Xr5Fe1eAaS5X/4GfDOh5vA=;
        b=c9LeWtwWc3H6huYLguJfmAtimtLz8EM35F+u2kas2iDiAcjE37iHnuFLNWZEpQ46ph
         QGV8GhaAqVtazGOL6vlyX6guWBjoi6NRjZtU+VP8yBuBG9z0+GPixSQaGsPVZeNGl+/t
         N/ymvB2mWEhZJXf2d35cOAng4M3PMdJdhZOPYrmkatm3PMpNERrUVHjnO0g5qs/I8hz1
         j5AHTGG/sn8JhdhSAwzzikQh1i0D/Vh6b/J9wKFMSzt5XORSw1/oKb1uqTkox7BlGsTH
         M8b8R173Y4gV2A99aN8AQ98lCGNkg/ae4WWpgS17c5QwwaFv5VC+c56NEIjBH2jtF98w
         fyug==
X-Forwarded-Encrypted: i=1; AKwUvByHfcD7LD7DucC2IQ4QyA38drbq2PTo5U+Je/vd3U5bEtEVj5WqnBY3S9HHtIU7DBpdBmYVX6CnUMe7F8I=@vger.kernel.org
X-Gm-Message-State: AFuF++kPPInNYuGdHQiKbUgKCSZ0F9O9lhW2EyuACHuGJZ5KxAijuWfA
	uh8NcBmxYfyoBqdhYtpBv8lDh64M9V1eljZhTugqX7AEHjO0fcqzqlkzoX5yogzeJLsi0AexW1p
	vIskaFnMcRJhBVyCgxTjR3t7XmiN6GOVoxQ6PUjH7X3lB6tuBsS3VAkHjk4qBZjPmXps=
X-Gm-Gg: AYBFou1mPxDo+E7wTCrhZDNqw09GEabvz3mpTOtu8gRtFb7j+eYLXOJt1QMn4AYJKXO
	tibMF0oCaJCxbadxdeF5pleoMXwlbML8mSHtuQa+f0JR+BXnt1244PmFi+Q5FVSFA6naWFveQ94
	LjRNlERpGNZ0uydFvPvwMwRATnobRxIStwmsSZ+flnH/K1i8bAYg0zmDE1AxK94MIbxQ1Gn07tG
	tGRTBZMGHXGl2wJDIyKnD/7hV1sWIhUDsttn/+ba57q7TNlwJfk10CKlWWtk1Yvv6d9mPO3t2gW
	DxgT6wyKGFVTlQgYziQeagb7yQk53Isj0mSWSPyO4lhtYyxl/Dhvt86gAUir6Neph5Cn/2V/M2o
	tIDAJ7CHaWhlc7vQ=
X-Received: by 2002:a05:6102:548a:b0:79b:dfbd:d0f7 with SMTP id ada2fe7eead31-79bdfbded2bmr1730994137.0.1789395679738;
        Mon, 14 Sep 2026 07:21:19 -0700 (PDT)
X-Received: by 2002:a05:6102:548a:b0:79b:dfbd:d0f7 with SMTP id ada2fe7eead31-79bdfbded2bmr1730677137.0.1789395677612;
        Mon, 14 Sep 2026 07:21:17 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm477423505e9.3.2026.09.14.07.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:21:16 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:21:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH RFC 15/20] soc: qcom: ubwc: Add UBWC config for MSM8952
Message-ID: <z7rjt5237gdtytb35chtyjposyvqpgqfsxhov2all4g2527aix@dabjw24dluwa>
References: <20260912-msm8952-initial-support-v1-0-0e742578b524@mainlining.org>
 <20260912-msm8952-initial-support-v1-15-0e742578b524@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912-msm8952-initial-support-v1-15-0e742578b524@mainlining.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwNSBTYWx0ZWRfX7DG/fxogwApU
 dikc7atTqCRwoLYKTUPp5UDqGwCbVpQT0NcK1qzcX9ZfFsQ/HLXCGFaQlPHPrz+a1ZNLox/OY+z
 /iEhk9NMbxKbzDIoA6O7eiTksAT2Y8o=
X-Proofpoint-GUID: Y7se1_xMZ4eqYNM43UomnKISiq5Zf2pC
X-Proofpoint-ORIG-GUID: Y7se1_xMZ4eqYNM43UomnKISiq5Zf2pC
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa802e2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=OvtQcJRYg_U4C0nSOkMA:9 a=CjuIK1q_8ugA:10
 a=TpgoBOgV9RAA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwNSBTYWx0ZWRfXzA/E5+B7TpKT
 Y7MudMD7D6A6cKjT25iDqVRHIJs/oMTobVS7czxlkM0W2rDtX9q/l5atn8oXewswJRM7bmJInKz
 17FAWkyJtcyFFBadjnR20YPLipuxmErrrhvHlbw6ecr2Jg1zXkr+6LJhQdCgq+4IsuZMhksWhyr
 GyhnzHO8h3LLpjs1vNj1q+YTsCx8kuAJxWuWDSO0B6D9Yq0NT/wOzRd1+uZuYsZ7W5I7UOqZzYV
 9JSpojBrDwsRTEMadmGpJcl0ws+Tr8MArAmLEOOflQ60y2YmWqgAVGfRXrQciptVSOf+AOos+D1
 M6UBw9JLExrNCCgNuHi3EX29aP8nq8LZS3CZUQc770OO0LVOJtOpctHjysFCw5LOaO7PsxxorlI
 2x3PPmq/YX3KUV3vWDlGP2MIuts9bOcJwqspMwrs0MSlYNSNFeuPWX/Ddeq2noLgTZpINTKhAbV
 f9ExjW/BIz9GME4GnOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140205

On 26-09-12 11:39:24, Muzaffer Kadir wrote:
> MSM8952 uses Adreno 405 and predates ubwc just like MSM8939.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
