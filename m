Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA5B39280D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791359025; cv=none; b=XJbXxAnsHjJEVrHVrucrWji/FsPt7r3Cj8FVv5IEBml1IYkrht257xIEeWnuvzd0o2zeNZMeOJF3vlkLRrfBeH2ROCvuKp0IiiBeeAEI6YSM29ek6u0kFu2vG+QNcplP1Bd/eVeWIoUZ+wXyYMYH2O1ZUMRWskJeXQzE4dd4+5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791359025; c=relaxed/simple;
	bh=miqA6xiMgK7cuLadHlIunkZP1rECVzeUoiuWXv1Op08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlEnC90TrJ3zOdmDBsiPNZR8Cyc0Yuj2T0wVJ3QBeiTpwBv8WCYCj1tZ2ZPUi2WNMfVKgiE3jVAlKw7eIpuZosAb36J5D+cmodwEOu/LRlDPOtldYTBBE0kiVbCpTxG2GLGz0MrxwIxh/g9L06S/2zwaz3neU5y+4hsBGK+yJKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKmrYUaU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/Y0ZZ9Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKmrYUaU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/Y0ZZ9Y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974TwLM3923469
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 07:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=clJPVUXl0viASw+vzSccwoxb
	ts2uNZ+Y1lfR96jzEPs=; b=CKmrYUaUgtKQafmZ1Ex4PS9c1Q86XcXIu3H1czts
	o1V2PpiP3XImQAzXSGWBZfivErBqf6TrlkpRt5MrSNW4jFkCgV0BS9PVEmRbiXxu
	3C0cPvGmdZY+8XlE4wr7Vnsd/ZzDNvSlMflfAl5vUI/PjyZlTUJU8t4/CzWm0yR8
	zPWZw4600KfqNttxg8ndkLce88sig9Ob9Q3APe1lcahBERkV1yJIzGEeBFbEZR5g
	lGOV1Kcm3VmprCLJKyIYE4uJH/B9Lpv95FaXhm22NS5QOQYGQ+wBGlVobWjyHVaV
	P13XERN2/1VpPriD1YDC6A+oAkKnSfsjdDmg1FJw/ZezoA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c71941m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:43:40 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988bbb0ed9aso2734945241.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791359019; x=1791963819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=clJPVUXl0viASw+vzSccwoxbts2uNZ+Y1lfR96jzEPs=;
        b=H/Y0ZZ9YLQNe6UZIgcf89QMKZBoiY6XXk+Aw2GFpNFmhyAOMBc+MSGuQlq+WKcdIU7
         pdLJYd3/P1So5OVHZXCms9v9VhVRu/jfBBeTmmsyeU9L5AEIBHDNysxDQ4mo9hfzyUXF
         j66Q3ZhhDA3r93PJS5M6fJIa21MEPHcwvSXZOOP3nd5ujw1RQdjKcc0VE8LviXl7fqMe
         JGLeWcTvYt8HyEXDY2Nmi71Y+QVHXWmQKALZhZNJ3I+fQNslvScRH0sDyJWvOZbxsDyN
         pl4X+OvqWXAOr0KXtkmtNzgzML0UTLQC4EPMPvcBMEg0gE6xhpcSoGQ09ggqi0tnj7rv
         wZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791359019; x=1791963819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clJPVUXl0viASw+vzSccwoxbts2uNZ+Y1lfR96jzEPs=;
        b=QAaSBbVZcBX2ZoAwVeQrnynuYIYVy4QBRn1xWSee9DK9sdaOOglCo52tqRpYJBexge
         0mQrm1cumNV6TeucbF2OBJdmLePZAI46/1j+MQIJ+TUlxM9Go8PJX+K51U05cWdHRIZF
         vhf2/5rG2Wvkfrdyc+Tvm6ZMmvboGmh4IFh1pMID0qSq7HzNzz/CwmWR/rEQcV61AmLR
         q/x/wlk+7SguuFO5j+Eigs/BPJNlOU7EgdZewKomoW6538WvQua1BKonE5GuBJ34TJen
         sOHKWSTOvgHl97OJdCEfZZ3TE6IicvjtP6jzuRrTa6geb/RaaJCYsec3felfDBdngep2
         n93Q==
X-Forwarded-Encrypted: i=1; AKwUvByVBK9dbK4+fgYdAHRPJ6gbBBZjqI6Q06QTvXuBByHpaVSCUSSztgSXwQ3GGKsbpaWRii2nWB2iiMDIViY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQjsjHnPnRuApLxD5oMMXjefzOkRMMgxt1BTUl24ede/0w1Hws
	2bBK2VI8xXGRx7aURJKSqOs0qMe9LD4J3ij/C1DGoLFso3V6Xs+GOH1A4j4OQDhXDAS3VR6hJx6
	ys7EBBKp6F8n1b9MOO+mWZh9rk9DGPd+YDqH4wkuAj5MbU7s1dOFiiA5HtQtIMuqBn6k=
X-Gm-Gg: AYBFou3Wk3kn+596LbYW4v8xZXk4NIsiXjzfYrHCNS7zrylfRIzDH1HlDLBUMmTOfZ/
	ty5y2vKAp7dfi0/2fyfjJQMvupzg9J1qQEISIeWdDC1hfKjO84gTXZkU1HXjPF5h5NX7QOR0UFK
	Sq/Lt1Uhr4KgrcdsTJnJSH7LWSJGh/BoTZ57pzc4/UepWudOAg9N9tZCMVGKolIfQREnmxTUIIq
	MvqVFYC0pMY9cWKR1PGn0BBDnPQrNUlUKH+wCHlPDq1jN6BuAZ7PGo8FDOhG6ZGB8EfIKh8ciPi
	i4//ZhH2Fb0LH4M1XtedHfrAggpJ6oN/vwcdGrsEDNabLpc995BdtTfrLiI7TyDu3S5T2dK+xTo
	ASMiSrq2y28cMJqQSQ5GJVUOgUBLTeRlH5y2XkuuRXuH8vJsfrOpB7BSXEsDz8thm/mbuVy7ljn
	gxlU7EYvq1jX68
X-Received: by 2002:a05:6102:5109:b0:7c3:3f26:8785 with SMTP id ada2fe7eead31-7ca3891236fmr444225137.7.1791359018878;
        Wed, 07 Oct 2026 00:43:38 -0700 (PDT)
X-Received: by 2002:a05:6102:5109:b0:7c3:3f26:8785 with SMTP id ada2fe7eead31-7ca3891236fmr444204137.7.1791359018395;
        Wed, 07 Oct 2026 00:43:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d3370csm3856801fa.13.2026.10.07.00.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:43:37 -0700 (PDT)
Date: Wed, 7 Oct 2026 10:43:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: glymur: Add UFS nodes
Message-ID: <a5p5gszuadvnvqcwffg6y55khdfhacwhegaxmmiwm72sfid6ex@cdwuo6sdmkgy>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-3-84cf4f861415@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-glymur_ufs_qcb_enablement-v3-3-84cf4f861415@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzMCBTYWx0ZWRfX6zOVa8j/xQwH
 +2ZYnaRgXA3KhKJx7bUZN7L06P4h8biALXPY0Jtmt5p+cfHaNBu/VgUuWDo6V5UxtsHHXHepuMg
 YQ9wCoIjz0oslkFFwsC2gMd+2ZJdE7Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzMCBTYWx0ZWRfXw7ZOgz0EMnaP
 bZUnW/7kPcfDDTSlZeAOYY2XivhYslxLVUKB9XrhwPYpZj9xE1vg3/qRaC0hQ/nv8F09izCE3UZ
 owP1VjlbLtoXRIY7Pk4CuRLQaT/9C/Rz5N1dXKqwUpzHXFgNG3IqAlKED/vIgmT4Zafst3ALnRS
 65QtlT3Iv1Uyha8QdPovVdRF75QA/XdHmV61FfQwJ19BNLWlh6x/EXdz5Uvnlf1mwpfMOTc8bbT
 pnMa/aYU8ZqSZy6/w5ZLmRRUByEnSHwkQPBrFmGJ2+ko05bSw3hMHzjplClqFrZmOwYutDWfj6i
 YAcYUHvo8xn2RvNEE1cOujWyv3ZI6ZfZcLYhH5IcBzpOn8fcLT2DO3HHuyDE0t4nv+xIc07wvdn
 QDTuCaU83JSTgArfWjVYa/qwbv2eUnSwiRWx0wCQ/hGy7G3fTZrc7XkTggBxXpQdSqBdV59EH/k
 Fz/DFmeXobQ6+7t0SSQ==
X-Proofpoint-GUID: 9FsrCXgHCOc8zInI6eo-H6KdjsXUh6Jl
X-Proofpoint-ORIG-GUID: 9FsrCXgHCOc8zInI6eo-H6KdjsXUh6Jl
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac5f82c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=PwKYEXKgugi0Ob49dLQA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070030

On Wed, Oct 07, 2026 at 11:59:36AM +0530, Pradeep P V K wrote:
> Add UFS PHY and UFS host controller nodes for Glymur SoC.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 125 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 122 insertions(+), 3 deletions(-)
> 
> @@ -4102,6 +4102,125 @@ rng: rng@10c3000 {
>  			reg = <0x0 0x010c3000 0x0 0x1000>;
>  		};
>  
> +		ufs_mem_phy: phy@1d80000 {
> +			compatible = "qcom,glymur-qmp-ufs-phy";
> +			reg = <0x0 0x01d80000 0x0 0x2000>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> +				 /* UFS and PCIE4 share the same clkref */
> +				 <&tcsr TCSR_PCIE_4_CLKREF_EN>;
> +
> +			clock-names = "ref",
> +				      "ref_aux",
> +				      "qref";
> +
> +			resets = <&ufs_mem_hc 0>;
> +			reset-names = "ufsphy";

power-domains = <&gcc GCC_UFS_PHY_GDSC> ? Or is there
GCC_UFS_MEM_PHY_GDSC, which is simply not described in gcc?

If there are none, it should be reflected in the DT bindings, together
with the explanation in the commit message.

> +
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +

-- 
With best wishes
Dmitry
