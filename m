Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACDD44AB8E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456503; cv=none; b=tLFMfIUKgE78pvx1KPfP9qlk5+zZrOtgbczKculQHlP40gm8ykVzdSbjAQo7O/5EyyZ+c/FlvE4fJ3Larfps8kitdVMCcKE2umHQPgW8uB8CxBLOm5ApuUL395kVvn3dtdY8FJD233+cLtEkB8v7jDNCH+VFmh/f+qzqDe0MAR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456503; c=relaxed/simple;
	bh=MRWYbGRMA3UVleoP7G/ToJ1bM42+0FfIhPOGUDo5LYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bl+ZEZPbzTK0jPjaC2KLq3whO3ogz67jWxUty1/LFeM9rs2dbKZ/cdEtsTY6zYZ+ddQagXm5TOvS/oth94zmfNPIjvAWMRZlhDXzdwj2nqU58+JDa/ZUg7ZXu4c0su/bc362CJQGSVRs2Z3Xwb1oKduqbZB0fKixKQjV/NuPrCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/Jksd7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8hTp/hq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/Jksd7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8hTp/hq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbNTA2609137
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 10:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iIe2IgU/kimMed/aKEcmuC6/
	F5VtbmEysuL1bs6SM04=; b=m/Jksd7wA71JMLA+vMNBSXnajwlkJCBcyVWZ0RJw
	dzo4SpPpNspfL+kaYbYJNL/tWaKLuR0G8Cq2KLXFZWMZ1NmcttKdJwZA6zNiF4DI
	tHMXj1vQODfvlXQFfWtpoXOfFaWxI2R4hlLZqcu5ndZwYw1OnX1ApZToMRZdz7R7
	KwlqKdbQiN948R16fQjcGNmnyFFE18/aU0O9OjLwszDy2T6zbrln4arwvEukoGFR
	NObKYwdFZm4V9HLcmcWtYOZdmdeml0f+O8PwpJrRZGw3xjfuyk24VxEwPcjmnWus
	Rmvy5oqPaZ+c0LTBPwC5WbjXNs66fKgPCdbE5JQ7iQVVTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2tmxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:48:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e46c120dfso567321085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791456497; x=1792061297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iIe2IgU/kimMed/aKEcmuC6/F5VtbmEysuL1bs6SM04=;
        b=O8hTp/hqP1Q3q/DujBrx5xB88faKfbRiCjLiry9Koj0cINFv8x+FS+ItX6BfRo1S7w
         ZfjKpfUg3lj3caRB/kW+s7+vvsgVc+YxS47wetM1hH+Q0hJiZip63Lqn5Pf2HWvV0Nbs
         CujAbAKemqUUMrW9teCyHSr3gVdOOu8mffUbizKh0RCQ/XqP8dVkJqxmo/NcR/2b+I/F
         bDMIyIKKT9Kg0RRmznRkOHyAUodvKUVjkKPx73ArhGYaAeGZwqkpqNi4fjebxbE8srSs
         Ki2Sa/2/Oqpk2Qo27RwTTDB4MFsNza4z2B+RCDLzAXJstzOnkD3sLX17OdMPpNLICzcV
         pbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456497; x=1792061297;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIe2IgU/kimMed/aKEcmuC6/F5VtbmEysuL1bs6SM04=;
        b=QlXO2GKlby1Q5tREHPgtjXtZDkY4DV7v2wtjtjkiOVN3D3kEhvbQU3s1d5a1lzejlk
         2vWzMXXANaqQ9lBlyuuVPh2go1l7xGgCcCqPLUSZL5XgoLgPG3RiGw5BLbGnQ/L4lj0F
         6fo8yvrHufiHN5i9X9TmwT4UdB3ReqzrIC444qecHSi2XSjm9E2whtLmE2DuiemDiLBL
         xLicmuxNX7J9S32IpJ4W3Fuk2ddCAA5eVASMRyq/f+AefwChxCnY8oOFRBXfLWqS2Rc+
         47eojKW3gj3u9gQtE+jW5I64VC9X8yJv8VSlMZTHWC1rAEx8LgwWRiH47ukvXzli4+lj
         w6vQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsAwNpxTknz/mcuN1NPJfGR+4HnEil3xEdhD9xAIkrHWWvrNhCT1TWU0oORecVBpjj6wUNBa7a+MAeMOU=@vger.kernel.org
X-Gm-Message-State: AFuF++mkhhuWvAw8JC8SHTex2BmpWEfxpBmm/sa1DhVUkvxa5xNlzey8
	YB6fgkHxuhGeJMxiB+92efkNFO1oH56mpqCmzsejRyRnWP4pZRCOiiB2d1EnVno9AUYtZzacQQz
	wvfUlrrrum5uBgCflAWFKCtvnd4BR85yHO8wm8a5b89XQxUiAmklQ+6+RoyX1VTtWpKg=
X-Gm-Gg: AYBFou18Aqla71q3D1IivWbqal2jKxOtAHiXD5qIPYIa/A12otkg/fXN+ckPK3wc9oC
	4gB9Z1KWkEpohFFgOtJrr2NV95onT1r8LcAT3Stvo43vgvP3k01fuaYyZtRPIrDG9FqrfwX2xXE
	OCq3Dxb049BfbcSLa2AX7lUFr7BOY3VYyzmKz4Ct1PA5NTiVlXF9FVaU9Nmd9ZTTZeKCCW1RDEN
	s4oM1hECB2HyMA1Wa7k7mCIYkcC+fHSEieNnw3Vei5iS8wmh6Yu0dBW4nGuQ121JjSQ8jrLHbtM
	u23OQ3f0L7X3/ihDyoREDR/8um6VE9u5ofKMDvlCk1g3AOjcq5XiB8HDNKiV+ZxcEIyWXDN+k4G
	69+Zbs2aDUUkON59vpli5ZKj3Fk+by1hoN96nTanddop678oXTTJpUw8dK/GrxPeDuJL7WUDcvO
	qW9HtxuPu/YF6W
X-Received: by 2002:a05:620a:4110:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-93e9b2ea33fmr846194285a.12.1791456496875;
        Thu, 08 Oct 2026 03:48:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4110:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-93e9b2ea33fmr846192185a.12.1791456496373;
        Thu, 08 Oct 2026 03:48:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd30a2414sm1086537e87.78.2026.10.08.03.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:48:14 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:48:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
Message-ID: <ldt3pvb45iwedogcmcilcfcwkgntkqragakh2qxsfpk7jz4bw4@zc5yi2i3cuhe>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
 <20261008-08-dts-v6-2-f9c4ec8664d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-08-dts-v6-2-f9c4ec8664d8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac774f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qsMvIBxTQZfwbozelBgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: vPFzJLG8_e1eP6s33qSZQGzfLwlKEdF4
X-Proofpoint-ORIG-GUID: vPFzJLG8_e1eP6s33qSZQGzfLwlKEdF4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MiBTYWx0ZWRfX3jQtGG47NtxG
 sXi6nWDqKWrWMtvbKQy35OZQfPcAYdFafke03kPRkZEXWC45MDtYSsJ0Wso0BgOvxAGjvN0wYdH
 IcIUKVyCv8jWIav5LigEvbA8qqDxmQ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MiBTYWx0ZWRfXzKMs27x8XwrF
 ZS8JYegLCwwNpw4uVAH7mCjdA2Tekj33Dx2lRmlBu3cmRif7o9Gp3/8ls2bmWdQQnbi4AH+NCdf
 CofL1TbY1oE0f9cuy7AMr7C+1yZvMSeFnpaXzFXeyb5sxZKsInSLmVVqya2pXGRMMVYrmT0XT1x
 9H50NJvg0GpQdkfXSoYrojKcEC5PkEsWAQl6shEHzENQugoXAPSvO4UIoWa8JVM/ASjtd+IdcWq
 BvocbMlSfl7EIk9AuME8EQIK6bRQcEhmdAW2EvzEyv6idXMShUcc+XUp8KMop6//fforiekwY1r
 WwGImVA/wcNmhN/VVSoziybaqQ6lqadzEAjUxmLNcKQ0eQTiVEuD4hJ1E/x9mb8GzzkTmEM8pvY
 ekZ1y+HyvpkJruRctvf/5sNprHVWs7zX6NqmS/vHxn5yCCr6neDs9cKujjTpHC+pcdRrmdN3kiv
 nYIDt2PFvZBBsr4Ngpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080042

On Thu, Oct 08, 2026 at 02:44:22PM +0530, Varadarajan Narayanan wrote:
> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
> share the GPIOs. The board has to be reworked to change from EMMC
> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
> and include it in variant specific DTS file.
> 
> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Please don't mix refactoring and the actual changes in a single patch.
Please split this into two patches.

> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
>  arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  14 +-
>  3 files changed, 218 insertions(+), 71 deletions(-)
> 

-- 
With best wishes
Dmitry
