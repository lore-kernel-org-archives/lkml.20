Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AF237187C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911789; cv=none; b=H3rjMYHzQPqFRCeo5/lYCgGyXR+VGKrQVqkp2BzJhollhhIWoEuAys0Lna2pBh5hII3/1jCQcgoLuTILrpg1hmUiIcouhQ644YByclTsR/GDBt9UzEP3Hp3HVif1QSozMb6Thl2Y5BzZBTjtce47gm2wn0jZ/teA1hJgtxi1b24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911789; c=relaxed/simple;
	bh=q9/WUDpjYACV3HQ/MPH2I2FsGG/LC/18uhjOtfrXDQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hMNt+oWrxUSEFt5lRSF8POnZhcTjLMWTkUgGNR32Oxhnb7BKVHVVG6crUJwhYsYru+F0E/EQeSXvKGQqe+PSYFy+WmLuvruPmoVtmUYzDLZ8SOjgq1QIXNMT0noQRaaVCRNEzxAYTkpdYNiwmEHUku9tQQ1o/9Lmc7WhSryAeDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hauxVAet; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxk4j9/K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hauxVAet";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxk4j9/K"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA81Bv3750825
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qG8w98LlfgwYM7+PXIbKddA2vCkTh9ZYKK0MmdhadGM=; b=hauxVAetb3lsoUN9
	4z2erfwsTb1R6DNRs5BJax+nZqaXWFkvQ8lfPp8BTo6iBf/lWEXmRk/8P3VVh6UE
	n+EJNn5pIQGtXiuXgFKRKzG5SnUgPj9yxxjhaTbcofP395T3ieswL5bkB3PZsX3R
	fdUd97XaobG5nm/pMYCcvxjhdY1domnCsTjNfsHsX8YhNLOMfH2vrOzfpj5MSZ8d
	KabBF9UDrCtFrlCUbGOpCdITlZrHAGLewOx5S6O1C7DkQik8YGYhGmSAd6G+f970
	nR6J1ijYpI2YoOXoY7WkwsBJDhuOCMLUJxpdJFPEEIISeTE3KbjHC0BBtDoOL9OS
	ZFp4AA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb8afg090-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:09:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ec556b441so2623971cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787911786; x=1788516586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qG8w98LlfgwYM7+PXIbKddA2vCkTh9ZYKK0MmdhadGM=;
        b=kxk4j9/KFhnTZ+BOceekAQDkpXN4oHKSW2un16eBueyWGu+2uGybsNl9YjroquloXK
         ZSTcrOS9YMH7IdXrvEw/SU8Enx/URHaeug/+im7Gu9T67aBQ8/7fDBIw57rKLRlwMC2X
         Dm1/B9hHCiI7B4ivXNIZRO2qmKRrnesHrXRs/RBb6Cbd2C4AgocLzytX0CNaN3Nzxx+k
         lXl2Qy22QWXkzt/BskejxFi0P+06RGExIIZFXeT9O892dMVGWM/Q7EfEcsfaxGJwbN+8
         XHBDe9axrf5fh7OoZMSXJh6ioSsTHbrnOZo5ZosRIpC3ZMj7e+UFCOI9Bp7B3N8mBg/c
         CygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787911786; x=1788516586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qG8w98LlfgwYM7+PXIbKddA2vCkTh9ZYKK0MmdhadGM=;
        b=BJjznrFqgzqKCPob+N66i/lBtZ/al6MuI4LPG6GfSfbQgbwMOilxxvIAnxyl6EfdsP
         vJ78UcnUiwJyjGlF7cF0yRWILJHIWAF6GbkplRezh6966KyuYsiTcdzv9WXUevUoyCdf
         qQtH57B9LekWZlXBJjTswmoY+ErOlMWJPXrrbxZuz4CKUGLUUS4fEjCAiPw+8amNtdkC
         qxiadhpfNoambV2CWTcpZlW5w7j8G7cpX1iVOBTyPwjnHQrIoseV7bNyefwvUlK5cNrB
         fv5lSXZPpIgGlibexXtiJ8ctneZbWAf+lyywGJaEkZxZ63NhvWCkQNgST+xXmqj3/+yv
         k9kA==
X-Forwarded-Encrypted: i=1; AHgh+RovJFpOjBJl1YIK6uvrzAOpOsob+7ZYtM2cMdCD6OfJ5nzEfIqC5cSJyNNcb/SuKAoV3G/e7SREDbnLWNQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m76jcIXdnp+efP/xyBQ5jg0OVTc40wxvc8EVQC8d/bFeUVb9Na
	AHb558ZeLX32K1UtqCaDinwJIrZbAdNEwh3zp+CDjb5sflF3Fsrx5feUwvXKQuM+3j8efF/fJhU
	NyiQG9SBU047hhDt/iyda67xlE7OwHVFuW9TX8/bSpWrOSyrGogZ+hj4cK7j52a+Z/sg=
X-Gm-Gg: AR+sD11cKvy2bpvxGVLsP0s05ZXASgw8ePo7zn2WlKiNR4mllvTSjOWB5TPxXvj8sUv
	7QeqTYsIHD4Z1zotSLchlxMl/Q8O0Q8L4QVEnfDQ1gDqT7bqOAe1IiECEogZJsuup8Y7v8Dy3yi
	w7qUpDWU8rBrmIsnavmCrIIN0dQSYomAMd/TnmCayBMpDVZC1Kmrx3rG1X1Fccy1dheWST8W3jD
	UQkxB8mIAmATUJ+lsk3dMRzMNH1FqU52k4peh0t9yvjMo3SRVHH3jroi/XH88MvOAWnL4pW4o1n
	O1Z0K47VQAa5toCNtIqu7asxOIZJmhObUbJtx4i1QYPZ9i7xLqgoaH7MDRScaAT1antyI87sEoS
	6srha2P92aeZOzOgFv53odqk=
X-Received: by 2002:ac8:59d5:0:b0:528:3722:a372 with SMTP id d75a77b69052e-52fb9667fb6mr42774591cf.4.1787911786629;
        Fri, 28 Aug 2026 03:09:46 -0700 (PDT)
X-Received: by 2002:ac8:59d5:0:b0:528:3722:a372 with SMTP id d75a77b69052e-52fb9667fb6mr42774201cf.4.1787911786266;
        Fri, 28 Aug 2026 03:09:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c389aasm389350a12.14.2026.08.28.03.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 03:09:45 -0700 (PDT)
Message-ID: <3cc7897a-deda-471f-abce-d3e2fb6ba171@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 12:09:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: Drop redundant
 status=okay
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827215001.34184-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827215001.34184-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fsMmXEtwgWpOY5Vna4KjdXStyqxBrW3z
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfXzB1KSJu9H6WV
 Nt+Cqp+hCMZhVy4XrS3Yhr6pz24qKFL1zXugWBI6MpVwYJBT2xckZGkloyIutcxyLMAub7W6QrE
 SxL0KCu6iFilFkVQJQBDHSU2pdMLnXs=
X-Authority-Analysis: v=2.4 cv=IPoyzAvG c=1 sm=1 tr=0 ts=6a915e6b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZOeRlPTctedjAYETTS4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfX+H9c9nAqpgvM
 CzSeh1ra/l5VJo2Z/g6T+iQ36J3Pj+s6VCPijAi5NJD6iUhi9bVrC35V7PC6NPqtvRNDfHqOSSb
 v6E1upwauet4tT7saCSCqgxnnbyCL6D8E1gPw297BP7903IUjzoleTG/5ZxOnx71lO9z2ZkiyL8
 ultx3jxrj/QG/nX81IymOqq18zMuJaahVZFISXiIeEi2xe2A8PmP2hbTMwo8m4/Ef0uycaA6VJZ
 7pHmHBEy6XVJms+U+l7GBx9OxDemAfKHCi5OICsgp/iGRwnxBpU/ibtsyMpvMpOhwHLYSI8xsyN
 lDjTFnpI4uyMgAOTYaNrVnz4BzOFu/GAQuGsnTu7M1ndhW0Jk31RukCQZI87JV75huVyhXsC/HF
 EyVp+asOxRBthcoTYCzQcV8qX5GWzjH5REIZWiQrgAbFWauUsR8dpm+AcEPvonLYi9+TJoBMIbx
 R9ZpY8IZ9QBRhw5yD3w==
X-Proofpoint-ORIG-GUID: fsMmXEtwgWpOY5Vna4KjdXStyqxBrW3z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280086

On 8/27/26 11:50 PM, Krzysztof Kozlowski wrote:
> New nodes does not need to set the status as "okay", so drop one from
> fuel gauge.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
