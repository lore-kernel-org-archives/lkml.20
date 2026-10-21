Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581921;
	b=u8G5t2xVdFfsBKkS+ptiHBJa3Fz9BvNhpQo7mvap0YCSUtfA9eTWsCNFtcKnIN81mGwG
	 PiIde6k9fbsi8U4ToxNlnmzPsKmazGSBMNPOCwCHRao0DsjlZlK/f0F7Btu19BA3Mhwv+
	 rTsxexgIYsTMtA1Z95j2hZmmQLgXMB5fmZatABTJn4asrrzgTgwX5Kad+boB38XR4qyTr
	 tvpSv+cJlZdNUbxhIgXFmCHI47lgZVQJnX1AuGtZTOPLtimwndpSe6NNnmsTVuZzVikUX
	 dWu6WiJolu3woBu5Ly64Gb1a8aHnHwuCObSldbvmZjpaMuCR2Tf6jRBJvNllIV7Ve4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581921;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XsKx229A2cLUh6PDcfG9nagyZ9GT3vCswf9ByNtPLGE=;
	b=GbpbL6i9MnkfQt0Hh/jO9XozcHXmpw/drBzOukA5JqaQZgfNQymsQ9hjYk8VYIQFdrUa
	 tT3tV94bBha6ITTkN+mFQThK/mdsscwYk4tjsDnxuMBMirkRz5jJdfN2hq+a7OE2CrKeU
	 ECVYmPsZoWkpLndULAbWbAvXlnwwV2UPJwjKuI6qYKTcYXdEM9g9wf/OdilX4k4aGGjKv
	 I+8l+Aqx5K3MnXYA2Uuw0xRltWTqqX7loIxDJ3zsQf4OrNYxkfyHO0lG7Azf6f+rD8HKH
	 eWfSI4am+S0eZQYWVxJHZBVMmQE1Z09wIFv37zLVZrqHHCaytZuDNbsrXCem4Lg9trw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fyeI7m3X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e3q7fQLf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA34260A2621
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA34260A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fyeI7m3X;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e3q7fQLf
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5pmB3016035
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XsKx229A2cLUh6PDcfG9nagy
	Z9GT3vCswf9ByNtPLGE=; b=fyeI7m3XgCeXBBvm9Lc3tglUxyJyVwiC7LoydVcw
	BS/sYlty0A5J/hpXS9Zhq+t3ANy9qZsX1/oo/59O1+hl600qqeZqEjHvk9G3T473
	oIfN9pqorFLiqhUJlPdNaoyDxWkl4qFsVi+6QfG0rdV9nExf3fzwy9M2I2wn47lZ
	eghG5SlbcTirlgglFlRPk2JKratyZdI5rGSFyKva8cpJ8SLwpZXEPzAy5epq4v08
	YMrOJRK0Cgak84GxM1NLWCeO9EkRrjLSIqby7ssUzqzAppklyXKSokwLiW6ORLF+
	7MD+Ktq78D6VmY9UxgYiPd2+E+8iZsPzDFWQ0euMDbw57w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78sq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:25:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f568dee56so135221785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792581919; x=1793186719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XsKx229A2cLUh6PDcfG9nagyZ9GT3vCswf9ByNtPLGE=;
        b=e3q7fQLfbGrZKLlUo0fu0DZ/Wkr9w/pJPTndeSC9r/d7gPtLWfVuqvYB+YnxxIekyi
         jqJ2xGu/92YNcPuJYGq5FBNBGCYBifHSYWElPEy6pDaMNda1H4v8Im7MgDUfys/FbR9y
         qzhdAhn8CPqsfFLNDk24VV1DlIGJpHCbALJFIjV3ITJgjhCYMxD+Iw14y4SKM7IYXiKL
         RIDzLXoeaOTd6yv5kZ5zNbsgCpME/YFLT9LP+zlT96kDLjBPg4hgU9n5PiafLG9dnWoR
         /C6D0Ta9FL8qgo161Kl8zWMHATUteFm6CT0XCMHsyy4HRcTXjpZRPiKM5zwx4BCz9q1j
         PxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792581919; x=1793186719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsKx229A2cLUh6PDcfG9nagyZ9GT3vCswf9ByNtPLGE=;
        b=NkhqpOJw/mpNJ8NKn34kQRsdCjL9/Wh6uiZwFJweL5JRAeOL4M0xYuMvTQgnXZJJQg
         UQXK47iT2aUFPsYQekAbyvk5VCWNBYIVvT/PrFMlPFm2STb6riJhbsf8xDPZjdXb0HNK
         3Na0hekGsL7vxQwWuztAxvmJbYeeO/V2tw6Yh+DjRuAtHhy3sHsx5HuKtY7wwNruHhXV
         P+sjqlZsYW6ggLUOeBiFww+tA/OtV1sYxw2yGCwNYjSpGYnai9Pd+jnK7QmD94weqFYs
         7hfS4m2SwcHuyY6sZerh4nglnlDtLVNdpMZwNXiHGFhaJW0gVD9pCeJMzq7N6e4vcvBt
         Clsw==
X-Forwarded-Encrypted: i=1; AKwUvBzw1cvujUezZWZgSvKUKi1MZ0Tlx65asRBlaX6y6eAK1cSqBlODb4df3HUjWfymqp7Nd5dtannjzDVrOR4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLndtwXLTjfv8gfAzxSUnXmTGEmjrOZsSxAsUjtYZ0YDCTyqQ85
	tfmLwYk6cf/VftYh66b9q+zUdU06bh2pPLd7Cu0yRVSiVugyFoKU6rongwK6h7hHnwsfiuOtwwE
	ETsJQEJOGvNvojsfmiQWsngL9nJK2yzSGeB/guh+93cOBEIyeil5JwzA1q6WZCP7S3f0=
X-Gm-Gg: AYBFou0FaEuStNpjEsE3dJwZ3gGTZvxS8l4abDKe7vqKXFZ0b1MIMXDydPXl4z48atY
	OG0Ty378gguaA+r5qx0WfolfApQHfVJVoU5raxlGWsDQi/V2O5YmDA+Xh8ncNCBx26vCw1QCbkN
	2T9BPP1sUYzdJiw1Ecfo/FrzRzZPFAg24LBb4Mm1dONULRPcu+PRKden59h5HGkPoGa/aG8QaxT
	SrUitFn7TLI6bT2V+VUgtN9m03dKWvwos/Jn2CCksPGuwfAHxyVpJBkeCa1IDOIlusgv9zxGsG0
	ztNAsHKH5Sk5OgFK9gM8GTN6ebafmyxSPg9y0xnRuFQlpJySIx0hICxQmHZQTAX9y3bVqIyN1LA
	9pLfKIVwEk3SsZjRKrI0Z4PtBU+aiSwoszftxtn6EzFOvhAIWr7gt2ngVr2LQmWFruYcDhl1XFd
	pMWW5J9jq4WcMc
X-Received: by 2002:a05:620a:649b:b0:937:27fb:96f8 with SMTP id af79cd13be357-93f57f580cemr334950885a.41.1792581918781;
        Wed, 21 Oct 2026 04:25:18 -0700 (PDT)
X-Received: by 2002:a05:620a:649b:b0:937:27fb:96f8 with SMTP id af79cd13be357-93f57f580cemr334946285a.41.1792581918255;
        Wed, 21 Oct 2026 04:25:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac437d6d7esm5338761fa.30.2026.10.21.04.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:25:16 -0700 (PDT)
Date: Wed, 21 Oct 2026 14:25:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] arm64: dts: qcom: msm8998: wire up interconnect paths
Message-ID: <iijtxya7fr2xvo6kaaiydda5eqb6eicqpwkwrldc6fmd22ub5u@dbty5tsl6jyy>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
 <20261019-msm8998-icc-v1-8-c2da3934b6c8@oss.qualcomm.com>
 <aee928e2-909a-456a-8ab4-66d8b5aaeaf5@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aee928e2-909a-456a-8ab4-66d8b5aaeaf5@oss.qualcomm.com>
X-Proofpoint-GUID: PgOMTrhKoJrjK8lKBVPiSsj-U6xBV931
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfX51YcngHmx/c4
 qDBehp+xvgs8dvI2uGdh9Hmoc0OqlmPSPssfudt4CVhWGNi6CaUY7S00OnvsFEPGy28btGf6MVV
 rUcLXScRB662YpPFGAA8qdv6J+s4GslK07qfMTSFTB8FrWY8V9+O03zEwEW6+DEHyz9f4ONZctG
 rReUeZDX4W4cT18ugilU8sUr15WoAHzoOkZ0QrxoX83mt/8VaNF8bakSnqqA5Kir8/kdZFC5e7k
 mAfqLTQO/qKn1Kx3xYLNqEKrgaNrInuwFcKtCeu/zaVvwaxxO3m3TWuxz1kgGpBNIylxajkEjU4
 lZxzm+2NKcIR3s3uns9PWxJafEqBqYCSSjylrggb8IyzRNlBqJNj4gWucRYroUapFztqZBuSbXn
 mf2CaftWmsmCBeGOgnRPPln41TuWPjI8X3ZwPTGcg2Q1IrhRCKkXY85ONoJMJwKLScUYrre9vDU
 hZe93IfKOzIK71MGn6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfXx3bybo9s+sot
 H6qSb9bMRKjJmhlny6gEGRwpkezqCZ4hCrLS8P8bawZedtNEtj5pnizFBKc5y71XqEyahR9Mzhr
 qZDCJTM7Gknn1khr6TovXLDZw4BX22s=
X-Proofpoint-ORIG-GUID: PgOMTrhKoJrjK8lKBVPiSsj-U6xBV931
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8a11f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Q16rnCddB8cEJ5J-xv0A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210045

On Tue, Oct 20, 2026 at 09:16:15AM +0200, Konrad Dybcio wrote:
> On 10/19/26 4:12 PM, Dmitry Baryshkov wrote:
> > With the NoC providers described but no consumer referencing them, the
> > NoC bus clocks stay at their boot rates: nothing votes for DDR or
> > config bandwidth, so masters such as MDSS or UFS run on whatever the
> > bootloader left behind.
> > 
> > Add the interconnect paths for the GPU, MDSS, Venus, UFS, USB and SDHC2.
> > PCIe is deliberately left out: MSM8998 has no route from the CPU to the
> > PCIe config slave, and requesting one only makes the PCIe driver fail
> > to probe.
> 
> On upstream, sm8450 is the first one to have one wired up in DT
> (intriguing), sdm845 is the first one to have one in the icc driver
> 
> Downstream, 8450 and earlier do not have a path defined on the PCIe
> node but clearly that relies on lucky ordering
> 
> I threw the LLM at msm8998-bus.dtsi and it said:
> 
> The only edges into slv_pcie_0 come from three masters:
> - mas_bimc_snoc_1 (line 669), reachable only from slv_bimc_snoc_1,
>   which is fed by mas_oxili and mas_mnoc_bimc. Neither is reachable from
>   the apps master.
> - mas_a1noc_snoc (line 679), reachable only from slv_a1noc_snoc, which
>   is fed by PCIe, USB3, UFS, and BLSP2 masters.
> - mas_a2noc_snoc (line 692), reachable only from slv_a2noc_snoc, which
>   is fed by mas_cnoc_a2noc, IPA, SDCC2/4, TSIF, BLSP1, and
>   mas_cr_virt_a2noc. The last two come from slv_cnoc_a2noc (fed only by
>   mas_qdss_dap) and slv_cr_virt_a2noc (fed only by mas_crypto_c0). Neither
>   of those is reachable from the apps master.
> 
> But I wonder if it's some sort of an oversight. Can we try to
> regenerate the paths internally?

I've only seen a tool to generate RPMh drivers. But it looks like your
intuition was correct and there is a missing path.

-- 
With best wishes
Dmitry
