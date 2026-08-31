Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E443DAAD2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165160; cv=none; b=frl0QymzlFwvd57VgIyURK/hB0yVzIX7CIAzvIwy9KqBMMRHhSW7ysG6lRlTNSl4kFrL8MFCLMQfcX0gVUgByqZwrD3mF6uMrzQaCKwvyi4jnDEUceyvbpUeuU9+n0seflkDcj5rlLppwhr1gxhTua2rTk0okx7gm/b6S5Cxrqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165160; c=relaxed/simple;
	bh=FdPvf3CpJV8G7ERNRTcYmsiCOMxWZLLUICoNXusMRos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W++b1VGcqPiH7cD0qdYUMeAv2OMtAqler5O3115xnBklrzureA1OPdLCopoW/n07hRXxEJ2ctbuTel0Z4mLoh7IFUWto/Xckp5mPlDXkI14MDbA+NyACOofcSIxvqb13Ja7eFu4wnYv9Y0GayI5xCR71OdkHgt1QZz2e3pCIA0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DIy6zNC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YihcxCnJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DIy6zNC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YihcxCnJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7x9iN3664460
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4dne+NCeg5fJw+Wr39CNTdUR
	2y524dRLbe5rTW0CoI8=; b=DIy6zNC1zB4+GBlzjDbD/8D3IeC6MStSQfkLT1Vj
	9ALGyDD/LS4PirLsusTZpAMSb/a3sT78AakyO+wRsJsiSY1uzVQ7SZIkUeyC00Tp
	0SxuurCqWlTGJ1hj+3KK/Sc11k5IpG30NoIZ+YTxNmoPNQKaxz4vYcqCngwk5J0l
	AB30CnsOV4STdgoX96vPeRcNMX6Whpga5Jigax/fm/1DLZAWY1HwXU3C+Bm6Ylxd
	pwXuj1eZVeuBFqp6sppk+oPL66m80IivMmvyxy/EJYwaGUTyhyS5REfZVTESjVE6
	6RUPJGEJFoZxyH2SKV/shdgqtjhYLyn50XeVO2h+ODLMAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x08ccq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:32:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so817088385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165157; x=1788769957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4dne+NCeg5fJw+Wr39CNTdUR2y524dRLbe5rTW0CoI8=;
        b=YihcxCnJYQeZIIRFmeZLCEYQhEDoPVoMOJgeOOULfSyfiz1I3FFG6cFNqX4uDJcJ4s
         KuG2GBtnhYsWsshjhH69C75VBdJDd19GJ3VhFXb7/jQ/J15zA47NhcLvDXrkbucwaqKT
         bdah6YY3fHbDNCCbJZzeGnOlQ3TymD2UBwrh9YN7OO+LipSf503dyyEWwIrnj4yvmDBQ
         BPj3zFUROA8GE/cg1CzoNdS/SNfVMsKLpZTyKt2HRhzGXImH0SWkdb3ljRxHPKcCHnBi
         QrQnWRICqtQb8J+Ov2eej2tq5bG+Rm7FA8GWkwjug/p5VgIdYLuKecvyQfQzPO+tqBl6
         rlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165157; x=1788769957;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dne+NCeg5fJw+Wr39CNTdUR2y524dRLbe5rTW0CoI8=;
        b=UPvUSeP9skNHjg+hbSmKsI+nM0DAB68sH0yvX5ts1IvlHYWV0iFWqwZw4A2aOq5WmX
         lXNMunRtC3hHApi7Slg7Auq4JmggXrrG4gLPwIB0mxgIwRQp0UndxutRTtDy7EV7fzKZ
         fztWWsUzEirNt+SlV1YZNF/AodN0XnlGMmnC0DdJ2VKs9uNF+d14L+IRAxLpvOhVgJ/L
         K1llM0LOHQN2UX8YrEErLpxhEv/1/mna8LUm8lPpt0lZFiG4eyRjLLkO1/Rft9NCSZ1r
         4SjYQ8acCSVokBFTLvK3E4xz6CHjQF1hhPr2qOy3NSV4AXHePsxAoP0Z/A/UI5VyfNeP
         rTWA==
X-Forwarded-Encrypted: i=1; AHgh+RrenIe0bWv8RE1VFUvB99DcCNUxjoQbWaj1XYdCIrcfhFZkOVa7q5AWellyIv4Bm51My7E+MoKIOiyg9YA=@vger.kernel.org
X-Gm-Message-State: AFuF++mnx3bsBdMwJb4CcHjflox1dKcpynK5hhfDCCDvMhD8uICn1XXQ
	j/IDDv1A23y34wakF0WKeYuD2a9QTNtdyZb0vlrFY6R/vOsRKIoQF53X6oCs0PQVuhtL2/W6c5q
	aPoAsKRZ4fk2nsSEjiK6OjP4q/4Hg8zifWaLfNVwWGLndOyNu30an87JM/kv8TkDxL6E=
X-Gm-Gg: AR+sD104pysnYfKiezm+PSHDo3QVRWeGRgebHZGH2pd6VmyEun9pS4IMLxUOnxB08ML
	ryfzOMfDICNpicTcS/t5w6sEMlL2qWaF1gfkT+Pco2woM4WApYK1vmAv/o2bhpi1XYAcZHOGAvy
	eSgZ2nkeyru2Brrktaozg3Ef2dppASqzGtLi0kK3oZChQx8H+WiUtSxWt8IKiFmAYyTFH55ZGIE
	r3nqQAe6zCoWFvfxZO2RYs3jAqJ1pzrn/9QKx5vjo7pNGVB2KJwmFs/2TlwchKOE0qJXRS281Et
	FlukDSai5hoPvrfwbzBMQvQTcPFvXifNOUQsRllH4ocEc1dCe9vmQyfpFc+/UUlLChWLfkg/Dce
	/adMqLWYczjkv
X-Received: by 2002:ae9:f007:0:b0:939:869:a8bb with SMTP id af79cd13be357-939137d1e5cmr2249786085a.14.1788165157270;
        Mon, 31 Aug 2026 01:32:37 -0700 (PDT)
X-Received: by 2002:ae9:f007:0:b0:939:869:a8bb with SMTP id af79cd13be357-939137d1e5cmr2249783185a.14.1788165156700;
        Mon, 31 Aug 2026 01:32:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cda123ac8sm13931255e9.5.2026.08.31.01.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:32:35 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:32:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: hamoa-pmics: Mark pmk8550_vadc
 thermal sensor provider
Message-ID: <jwjfvxf4xz4a7rg6lnkrxpnm4c42kkvlyep2rivzgcelrd3too@wat5gp5s6zpw>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
 <20260830-hamoa-sys-therm-v1-1-27108c40fba5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-hamoa-sys-therm-v1-1-27108c40fba5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX4+q3KYbcMOU1
 R4iwVnlZSwbXtQOtVxR7ualD/2aSMCYLeuI38/ZRCN7AoCueS3S/cv7MCVlLq473l9EDBN9Cwky
 Ff8QbvDfUkETr2O5+bu7wiZ0eyxZhdI=
X-Proofpoint-ORIG-GUID: rARu_FPOGQK2QOdvlzcf65K-A3NcyunF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX4nclzXhkJnNy
 lB/If7RLze+88eiL0q/uYlJQYWlKVH9SzhAf1gajqSG6AD3ZD03MD4xQ52bbkE2Fi/HU5ChAl/N
 ktDqKx1C8SgUMj74mRj3UacL7rPejuhdw3BMUy4Al+fOBdjqIN2UlXyAVviw4C2BXusyu6obcYS
 zT9vyoE61b0yKfeeWmlmlWvafcBowgjDbGWhDsbuBrg00r0EoQS457dOGIGgBforo0PLbe7e/BH
 e66MoHhb9PIt4NOwgiavYHbvmdpCh7biyaiXmuIWpAUV4esZngYOp6bqUrl+UuBtDmIwXZGg5df
 w4WGeMhspI0Re39swzuJvjZRk8Ft/+xYUhDcLM7ulvuK2OJTkuGaysVaa0kO8cY/VAynkWZHnEW
 EtAZh8Jfn+IJtMH6y8g7bF9eEYcN62lA+v3E6e3wcHNN/GN7BVi2S0dwHhoD4vIZL7ArPMv7ezj
 sPZZ4y+PnZMqMX/yvxw==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a953c26 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=AuE88ix3_JtRZqt3Q44A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: rARu_FPOGQK2QOdvlzcf65K-A3NcyunF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310072

On 26-08-30 21:02:02, Bjorn Andersson wrote:
> The PMK8550 VADC is typically providing thermal measurements based on
> on-board thermistors, define #thermal-sensor-cells to allow referencing
> it as such.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
