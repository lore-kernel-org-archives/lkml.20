Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709D239D6C9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068509; cv=none; b=oGTHg5HcGQGOuOqXAFUXjj5l9y0cxmOJc1EGIIfBl+B7UY6kKU+EPwWFtsRnli82RaqoJvfvUwVfo222exdLHnTHzy+4AtnaD0ru/VPlEYBtC5VCvxST9LMGZKJHIH3tN8sZ7PpUZT6hYUhGaMJuElnG11RNpgU7D0/VEwVPrH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068509; c=relaxed/simple;
	bh=8aE5deZqZPFwMCXvNfgGk0kvRqPcCOhyMdfVtngPmno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hvrnvgKqPSjVOYLdDmTEE+IXsIfh7O/+hlbmV4gTqfSIMLYWhqBtpioeMgU1jA2zuiUom2z3DXT1PTvCjFlH27gb4wCqfKaBNKKtX7IqkUo7FQKO06S/N19CRJJHVhw5Ih3eX/QwLFTbWyFPyMvuBsMinG3OWmNVwI7OQb0LYlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jkWEtPfd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCmaEslT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jkWEtPfd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCmaEslT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7VS4S3186116
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	boZ2wUx2qS+wC7WZW0j2K1vODt8kLDmSC2O7SQmUuIg=; b=jkWEtPfd+a9OyVHJ
	4UDX5+PU5SxeXgJ/2Ny027y/HSSbKye5ovB2dHpO12sr/FT2XekHd0JvrZQ0hDE4
	68qmRoGYZSOyosM9/C0r1Cp52AQHYI8VR6toLE4i/1Zb2ewTlvg+WVU8ltsyPV1U
	+C6K7IIYC2o36DFf0vyiyrqUDtM0X+0iZrKKwF2CuSN2JGm40CmZPt8WBBDl03Dv
	AJOvJADQWwdWMKq2mmaXXw2n7OWTJbU2HZYUslqgjjurXpR1BClHfPZ+H1dhFRXt
	VaioNrbfrZC1GlEXXLCR+x2g+WGD6qvfcPBFQn2FeGBYA2vS3jI+y49OTRsx/KTa
	Wfn9eQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybhtn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:15:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9349ba88188so82274085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790068506; x=1790673306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=boZ2wUx2qS+wC7WZW0j2K1vODt8kLDmSC2O7SQmUuIg=;
        b=KCmaEslT7XCzW5RsJNbhhZ3gc/QQf1YzqQiJsyJHgYx3AuFuPw+b2IE0j9cbyxQYi4
         iTrLQnzQaO1URjc5X1JwF/J3lfZ8EjxMoOH0po6ggYIPrfmR4pPRboYd/ZbDAlR3JBt8
         L3rbXG+6aV7cNAbP4osuHdwhzu3t+AxNA/lXi+gOlHzzXh12twl1KQOF97oyvE0BxEvy
         FqyG/bF8vw+kRaQ7bBK9S6Zdy6QPaMMLN5kzxSSvFx/xQk3a/bKKEPppSue5JaIfni+a
         ISrffgSrlQZgjF6NlDhjYmxoNMad/z+P5XZILS4AZafcRCyzqpYs+Lijej+baHttP8Px
         zJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068506; x=1790673306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=boZ2wUx2qS+wC7WZW0j2K1vODt8kLDmSC2O7SQmUuIg=;
        b=V4XZD5WJI6Nwc3/U7UEelul0Zi0jVy25VeqJ4kg2fyY84ekIn9jBK6PI0WjlrwqDUD
         C5dNJJXMY3jFxSgKkMzScvaigcBZW7bm3Yv0gNmZebaTcJMaxRv5K2wOaSCNtx5mCEMf
         SqzRFBV7qcKyQztodecS0kkcc59wybubGfvntJri5qM77IXaFpLp9kEZjv7CopsjG7oB
         byU8RyhpvAKzgDME42yb9sh2WOMscP7/wvasGFYphrt1v4IW07VYr4p8T/A0xQKGq8N2
         kduPN+h5H09yV+/Bnq6vOT0j8dNXQbQLbHVonoyrWY6oQrPJySRbjC4eNQvOYNyPgqbK
         8rjA==
X-Forwarded-Encrypted: i=1; AKwUvBwlj4gOmKSYx/qwYNusYBlP3QxibzkdJC9rlqnBi0E2NEBQLc4DsOWB5IoPHYE98aFP5cgOsLj/KJqmSxk=@vger.kernel.org
X-Gm-Message-State: AFuF++mcFzFF/9heIAAU+7OEDjK16Nhj5EnLC0HVmZ3TjdKDqyCxgClV
	J5deQMOzxeKSbaoh89GxGX6FxYg5n2BpkhRqWmZ6AtvQatZemkxRZrsfrzQjwyBopA2UaQRiUEe
	9CGkVzDSWMdVc0hqY+eoXT8hxZ+KV33C8sRmWFwsljNUaDoIhYl8MaEW8DluBK0fhysU=
X-Gm-Gg: AYBFou29zg0dz5uJEMKJoynDaRURAm0a78eFP2Yk6Hbc30Edp6IhyTahrREyIOCUymx
	Y4mLNVNpkG0LDXUu1LVmGox9CDo8w+4umGI15PYa1A/IEBnjHL5y8gryQiMdwwipp68wE5Et2qh
	fLT8r+gdzGguh/t5Mbsn/gjSWrxrJnsltcNQf7ll/6PjddAGDMHzvaUsDZ3kvm6uw+YVUH+qel2
	noPgqYFSjVnQmBKxwTUst8ds8QZf2M4RYb4u8mPVm80+lhQL/RsM8Sgl/ZwLpAwkQTd6kXFS3+U
	eGhR2mRMGACGJKEu1Wi1YvVeut/oqRdSUschCY3rHmxLQhpryV3EXxHIybQ8baxp0ty4l/mBOIU
	vkMZqpHnudjT0XPMWEV9thg==
X-Received: by 2002:a05:620a:45a2:b0:939:b8da:1242 with SMTP id af79cd13be357-93c15ba3243mr481848685a.0.1790068505733;
        Tue, 22 Sep 2026 02:15:05 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:939:b8da:1242 with SMTP id af79cd13be357-93c15ba3243mr481845085a.0.1790068505388;
        Tue, 22 Sep 2026 02:15:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5b0c6csm51663066b.31.2026.09.22.02.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:15:04 -0700 (PDT)
Message-ID: <eefde985-c807-4905-a33f-616a1898ad72@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:15:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 5/6] media: qcom: camss: Add support for PHY API
 devices
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab2471a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=SmOWCKbkXSXCNfC1NdcA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Kr0kqA4YSqe2qJexodqDBeCX1UVFnHII
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzMyBTYWx0ZWRfX8CnUTUi0a+VD
 ZwcFiz0JJsN4lXfqFVMtL8vz9SqJQm+uer6RZ3Lb01DfhgZvtpEd+dWdp7E/7KF0r4gOg4AZsmT
 U54PiE0YCQUGHVQJplEbpkRwfB3ChdLgsov5cdIEk7WkDy3yaJ7YT9qimLZ0q/UlvTjUGcA8zxT
 KooOMLhL3DT4G8UVjamEW532SGglaMaFOoh5vurLv/CvblwBwp00g6cbH36Cer3BYsZ+P6zZJ3T
 EOUPqsGpZPNEO2dcmhdL99EINJ84f7oEWx1xsUQx5yNhx3o1eWGP0weu/mAdJCtlZZ3tOE55Nr5
 9al5GYTv34f80v3Wbj7kSJutnhpt9T1+Vgh0z7mGMwe9MmcMyGZ//1j5IfhTbRhmo/5DNZ43iVI
 Ijle6npd1NrYw5PguXsIJPH/xXyBirAtnsqZDi3qmfLq1Np7veG8usYL1E3/BKCUhSpI632h27O
 Tk9mP8CAof1qiSyhUFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzMyBTYWx0ZWRfX/W7Rzssmaafu
 Z8k03q/tkgymgqcEoCfFiz9dYdxTz7Cq6Lm32KaCv1vtxrt5RpxjLnVAqKlYJEJwSvc9iRZLueq
 sTCk13k0N63VIq5H6gfmOUnWa83Ap7s=
X-Proofpoint-GUID: Kr0kqA4YSqe2qJexodqDBeCX1UVFnHII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220133

On 9/18/26 3:56 PM, Bryan O'Donoghue wrote:
> Add the ability to use a PHY pointer which interacts with the standard PHY
> API.
> 
> In the first instance the code will try to use the new PHY interface. If no
> PHYs are present in the DT then the legacy method will be attempted.
> 
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

This and the following patch conflict upon applying after:

aedd77ea8168 ("media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped() to simplify code")

Konrad
