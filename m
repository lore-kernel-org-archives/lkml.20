Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E24146AF2D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806561; cv=none; b=t3mpaJTOX1HjWH4oWLCoLv+nV6wXdViY4Fwy/jhcHEl9maBIwc0HLcWFbgomAGssmyrdEma7UJrfP4YJyYdBO/JLp+I3nUYprsDf54gZOr9QAlwwysmMYaoCMB+/vlP1ZaoedZOsek0+NJIEkh25129JLeaU3XfeuUB3HapQDjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806561; c=relaxed/simple;
	bh=+wKxsvgeADigiqUaqwzk6mlyDg1aQ0DfKdaYG7Ith9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QuonkBYzq3BUC81Wa4iWnszugkKZ4NOp6Dr9JvLPt5jnh+0vey8OFm9ud1zxCaFeIKT3PSZavyk0zqLj4X2pWov5O8AZvwAsdOJe84DBn08YH8ghjCqL+AbvtlZ3YVxHsidGXUjMz9Sfz7KjNYOXiIrOCcG71V+oRRxk3zI0p44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nxv7eiDq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcWdW7/X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nxv7eiDq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcWdW7/X"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC03WG2786787
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L+t/zZ008TD9OKrDMLJfk0QW
	3V+cIzRcKiLejTRb2f0=; b=Nxv7eiDqbMZMOD2SF5LE44VdxaTrKVnRLw2fadSb
	OeVuCZt8YBheye/XzHYxLPLlDwYQ8ZiMa9rXipF18H3v8SFG4NsYJwpfaQCm41Pf
	s+/he4Az+hB/1zfbwIHh5Yjv05w/vBUdjy9vnq/UOAHIgnbFGOJI71h8L86+HdiU
	RlfNNoTXHEW5vVmke5KCKoskwOXENMe+tAatKY3TlR3YqxAJb680qvRhAGAPY90Q
	fWNYRxwAaKxYXHK4ONNUIyRKUZlbNhcmVCkcu5YE+L01IfuvMW4NZvdbkkWKksIu
	UggHzC2LID4czxxjRULUvcq1PQoJ6cm9m09EoUENVQ0XZg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffgjdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:02:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5d6105ab658so503106e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791806556; x=1792411356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L+t/zZ008TD9OKrDMLJfk0QW3V+cIzRcKiLejTRb2f0=;
        b=VcWdW7/Xt/ZV98nU+Zqg3a6ELw/E4ahigh05jrXXh+oLNEsr5vcYpj8asJSaKY6plq
         ckQsL2laOERJAEXUKMo9sukMAUI4QizX8ooewoxdwhZJ8nqcVTGjvaxTIEDLMiSk6HfU
         bltQchvXaRUH2hhSiNrVkDjD30tuqiMKcyNdD63bKitjaqCSYgIC58EB1ErkOGewCkqs
         Mci9vi2QomyK+4bbhabX2q4GLPmfhNYGbUhI2KPa1PmJNhd5ysPFNiW0i0xtZRt49SZL
         ztmf9Ggem52IxALHM4982GMXCXdVIu+WCBHR3G+5FTRhSSwbF95QBpon6gdLyMpw168J
         74bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806556; x=1792411356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+t/zZ008TD9OKrDMLJfk0QW3V+cIzRcKiLejTRb2f0=;
        b=2kv704qQnHwP5uW+EZqtZqhuhO+QJQajXlUahI4Oqq6KkYo40Q+vPuSmCoIJfz4IqK
         V89xP6CBTZ5t2gGrVZJyXf2UEKODHWWFVPiEL9/sV8mkuKnPnCH7P/+rvQZebt3res8U
         acJLnObJuRUKIOyu2/BzBsWZ6Bgk2IaXq29gJ8GHy6Y8EIWb1N4f0Htm7Nfq5WRFUKTb
         kK8zce/2VqVo9bVmUYMpPupmmz6p0HeD1MIycp/1BCZhmdicJGRuRaCnkqZ+JDSiN6iO
         1oxlpGLVbbsU04Vsr6bku+HFqoKCwtRTeyFpMPZH8l/dEHKT2mv3CHpuadiHkdvTxrse
         j+6w==
X-Forwarded-Encrypted: i=1; AKwUvBwXT7BUM0PCQ1+ENeh/NFdGD1SIodbmUJYVCDH1UdnqTN5K0qdIF7pUSRNg3wf7zVhS/lCPi6UAA957cQs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4BJvY/SyJSBqKCVRwC4I8KMpEcK0by2IOf/sSBq5I/WeO50a1
	pxPdrHhLmnMjJIry/DrL4VvhzVSBRzS60C/53M3zszu796gDeQBTP2rwXEaTbO55A8jjnQIcMck
	ffxD+eGYAfPiL/0MGkPqITheuj2gNe9NbVqNDTWN7F7hB3AEvYeZ2MdNivUGHpWMVNpw=
X-Gm-Gg: AYBFou1zwasAFs2pVlInrGY6e9CiiQ28834hm3j1Gz3zPpDbk9nEb9AR7+EPMToLZq6
	u59+yH4Mym2Zk9qlaSMw9hfH4wJcB5UQ9S73nXIbFf3fgGsXqv2eOicEGyF7XD2OuBmusXu+sEc
	KNkXUdygSJSu59d+sbWADIM5K9nIaPciL05Cj2Os0/wYOhW3wBF6RbzeW5ksTF/YWUPTfFh4bwa
	kkcZVCnhgm6oeIYH8UAxBxMI9dY+CErQbD+5w3sYp3u6f22HzukyD/tB55Z+LetDGH1L8JRMkUF
	X5Mh7iEiHXXpiNPiPmNTy9xPEcEBvlYLxkRa3FuEj5WKnwvpbO2BqhXRUSXNldLsecyMetb1i+c
	sYG17eGab8ksKLWRixjdpYsyLq6JfB6Lkb7z2vKN3BsiEiDrqYu6V7e1wOvHWHov2tD/I/cNrDz
	hSOcqwQOjpVrWs
X-Received: by 2002:a05:6122:3906:b0:5c9:c60a:e9b6 with SMTP id 71dfb90a1353d-5e91f568fe2mr2394622e0c.22.1791806556281;
        Mon, 12 Oct 2026 05:02:36 -0700 (PDT)
X-Received: by 2002:a05:6122:3906:b0:5c9:c60a:e9b6 with SMTP id 71dfb90a1353d-5e91f568fe2mr2394580e0c.22.1791806555793;
        Mon, 12 Oct 2026 05:02:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36693sm2843699e87.3.2026.10.12.05.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:02:34 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:02:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: talos: Add Talos Lyra EVK board
Message-ID: <k4aaqs75ks4hlnyzh2jo6tj4ada3ayuwgztxtyj2d7otu6gnqw@jnbo7xqc5o3c>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-3-dcc9316ebb59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-3-dcc9316ebb59@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfX/ca6gW2hi3tQ
 YWty/zNS/nGsNpdO+FbVTmNWf1OT6QgOGnQ8REcAWfrTC3VSLTFKPfp6nZ/Edu1QZZC+iq4N4Ee
 I2WhHgAVf9xt2pePXLpHj6DawpmLEwRB6nq/3ZDRfWnaOJezrJkYMNzCwF8nQkdBqL22uTOVMBs
 NIdGW7TqxjIwdWnRiN+FM+MEIjWcCIV9vj7aqz9trwBgdjJcESIyKAA8OnddiFydXgIaeNtxh2K
 oteXhC52ZOi62X/RE1a4B0TB7m4/ajstXeOBhxbw7OiCOzp9oCb0UKqFnVLZOI9TnSWuSMg+9RB
 ljHMJwABAK+n7o0wQ9MjNtQJz6xdVJYIIWrqN/lPQV9eJoA2WPZgYNI3OkUW1hvuvFGJE6LhkEj
 KNmlXVueOuEzJN9PUycnhTwp8r8+Bp6LEuIV8nJg2NgrjMtqDcBcPqb7HpvAUjfYp6wSjVADt2F
 lNBD/P+E/nRv5e/PYMg==
X-Proofpoint-GUID: mHI0JAFEHS5yVh3L9Gsv6UQqz_4JSSR8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfX/dRjrpuXevBC
 ouopYsFoffG/sbI+pgfHtWoH6D1j8EQ01Nko/wDK0ja5UCpa0ko2LWCRr3B39fYa5tEHe3B7uxa
 E2CeVtc9MSca8Is2GY3rOWMXdrwN2yw=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6acccc5c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Of6yoZ__H_Ug1Y5B8SEA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: mHI0JAFEHS5yVh3L9Gsv6UQqz_4JSSR8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120047

On Mon, Oct 12, 2026 at 11:46:28AM +0530, Ruchira Revdekar wrote:
> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> 
> Add the device tree for the Talos Lyra EVK platform which combines
> the Talos Lyra EVK SoM and Lyra carrier board.
> 
> This device tree adds board-specific peripheral configuration on top
> of the SoM, including:
> 
> - Native DisplayPort output
> - GPIO expanders on i2c5
> - SPI-attached TPM (ST33)
> - USB host and peripheral controllers
> - Power and reset keys
> 
> Co-developed-by: Akash Kumar <akakum@qti.qualcomm.com>
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Co-developed-by: Vishnu Saini <vishsain@qti.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishsain@qti.qualcomm.com>
> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
> Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 137 ++++++++++++++++++++++++++++
>  2 files changed, 138 insertions(+)
> 
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;

Also, forgot to ask in the first review. Are all the USB supplies routed
on the SoM or on the carrier board?

> +
> +	status = "okay";
> +};
> +

[...]

> +
> +&usb_2_hsphy {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy_2 {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
