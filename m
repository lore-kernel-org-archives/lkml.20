Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE94F51B172
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166735; cv=none; b=kk3yxitUo/MwCPIWsNHCjCfGE1+twGp0KTFSnlyFx9Gr0BMr+dM8bHO1yERBKT1+jEXrVBnTNippR3NZaHMolD/q6YwINoO7BNRzArS8Z9lymp6JsNk3kRavI3wnk1ZK9bBZx8GfEmPV6S76mP2bFBr+tkiG0uruQNn/+5zD6iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166735; c=relaxed/simple;
	bh=U1wE6PU+rh41Cle3iFBekqUZh/m5lY7C82C6RiMSsZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OrsK2E09C92CRN4xb0Aqr7BKZutl6+lIjpUzn/YonccrUUsBtC60cUONoHXRwOv1mhf/VvlTgXxSTLIzi6QaJRSLGUAjrRXp2bDZx4PCGXOXhz4bnfbMvh5kFJuuwz32IFMhVIe3cgpMvD6nhpQgk/bGaYuP4sSQo8fqOvxtZr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcEO1tfb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sc/P9d/4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcEO1tfb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sc/P9d/4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbTrL2466529
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdMS8+R4wHQtzwHsJlNh8jeKE2W5D1KWqQU43Szma4I=; b=mcEO1tfb4QCYZ2VO
	LmUNxsFxNIJJPSLGbez6p2cOiktCBAu0cpl/qGE6ixQj0RaQO9dHPJjlEKT6zFTM
	4A5p/Ga6PoRTkNlcRf8VzJArzqTBdMxcT+5g3ORHu8vIaLUD132W5216d9kY0SQ2
	hrJPQdYkzlCOn7eZwtyRchj8aNxzU0LYSVRu16HDD6UfXByv1xmXepMGmHyLI0Ml
	bEwUvc+j1HoHQHMCakRlpZSS4LGCBoUUcwaKEBL7rAWgYo93j52B/U+Cd24SwZT2
	OVFRPrhh6zgNqjngRSw8hNdJ+Y2GH0GnLXLzJ2z+1b5UhExFVhr8vHnU2w5sh0pl
	6lIo8g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c40gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:32:11 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c66ec39d8cso86000e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790166731; x=1790771531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdMS8+R4wHQtzwHsJlNh8jeKE2W5D1KWqQU43Szma4I=;
        b=Sc/P9d/4R0zK5q0cVnCOo7BnedMkpf1FVR6lKNMNNwJNVfQx8n+ggYXr3jPQQRazMe
         rTqaRP3HAmdpyrXciTQYudw1NeWb6Dh9k1Lh9gaNdHLVHa0ZzOWcNVi7klB6qCop4Bas
         KKIACd6gnGYNGh9S57gLFHM6q5CZLSsSuSsfife6YnHDXCW5Wwaa52RDWHZTFH43VtA2
         f0V2dgr7vfjOWmWIjxBDBnBpCgULiBng1Gc+3JhdcUcLs1wQZ2iPfQX8hK4msj5afs/I
         e1X0cBI50fUU239Mzp332PFfkI7gnTsGLQtqo+uThcxK9IaUZIUmifmbIjrjf9WpJA4j
         gqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166731; x=1790771531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdMS8+R4wHQtzwHsJlNh8jeKE2W5D1KWqQU43Szma4I=;
        b=miwqOJw9ZoZaimp8wjE170DrRjrfd8dbR78fw6vmO4IOozk7mPheOBqQZ21Xlmmqm8
         2XiTEohHZiDQnkDBarmikrG78AVGCJFxO+FCFzdx1D+SAYO1A1AZv4po/JQAgynG8Ruf
         cyRQ7BCEsKDUwtWCiElY0tBQwITkHJi5v3W3BSC/jbCTTN/Khh0mJTd+fCLb+yGT74bi
         GHIOA9y4DIXhxBsUBEycn8Jand9sH8nqPrjgx1cQQupn4Jj+ubJ7GGWSjdA7+pB6/PLW
         3Iqu4Dv6EFZ/JuR9f1ScdM2AJ6McxjrjNtjh81Pv29CfLZktOWPM3xIJrUXf6rSauDz+
         rIlA==
X-Forwarded-Encrypted: i=1; AKwUvBwsgJf7DHNK8K0KeF+VRtgSZAxk+KpoC/uqCQa0yAnpuFvQ1y5hEpnMJ0vIskUqMEdL9pU1dU2qcav3+u4=@vger.kernel.org
X-Gm-Message-State: AFuF++l0dj9PufRJ7XH5d/caof1q1GlcmL3h7eXtpGbDLZVD0g+GZArc
	8zznlQtSHWqNS2wQ7OWK/LLe6NNtlmgRt6tPfS761wds+O0uwjm5EddepCv6gGLKVNkMAbgiRzC
	LmJPRLHmHch+cG9B5rqa4pMBKLzsqmGzuRKOaiTREkGsPzeO1riGIPLGaZkh18J+VBko=
X-Gm-Gg: AYBFou2QUpsILPn9LnKzRF26Oxxo/IoT1GYGInRr/PtiiDIRuc7wQyza2OpSCr0SBq/
	60nUUpAVn7fIlQ4Layd0zAXQyr2I6wjsI6k3b8J38/95hesHd8LHvRVyIJGfBESE1U+WP8JMTpS
	QeyR5vRk6qv7P/L0vWbGwmIxCKP0DF8Ljfxf3KxE3htcOuk/bpIrn+oVz+9Oo/+Xi2crcktohV+
	z0T6naO4CkNtGL8XidLQk/iXNlL2vbokcsyrbkpm2l9toupPaiL+cM/tlq96nsHorCvf4TQmNmb
	y5Nm1DCmIzCyCn8rJRNSA0urF2+nwFPFUPTDN4wXDSQW8voihUbS7/FQOW7EAoGHZrG8fldrvrD
	VtbnanT3Kz8zbz3tJ3i+7cA==
X-Received: by 2002:a05:6123:4214:20b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5ca737615b2mr333066e0c.1.1790166730797;
        Wed, 23 Sep 2026 05:32:10 -0700 (PDT)
X-Received: by 2002:a05:6123:4214:20b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5ca737615b2mr333039e0c.1.1790166730415;
        Wed, 23 Sep 2026 05:32:10 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab3896a53sm1485858a12.18.2026.09.23.05.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:32:09 -0700 (PDT)
Message-ID: <ca7cf05f-0aac-4603-a362-0bd4c3193b13@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:32:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: qcom: monaco: Fix pcie1_phy compatible to list
 qcs8300 first
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
 <20260921-monaco_ep-v1-5-63c5282fb0db@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-monaco_ep-v1-5-63c5282fb0db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s9wXZCH8XMayZAAUniE1oNAebOX1w7G0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfX/VvlsoO9LmKj
 q7Icj1x60WfEW8sFYA9y8vASWjtMlmkkvKOpT5CkRtUk8Z7VbX6PDa4iseaamFJAQwzITTsY7qK
 f+iD/GMCfXzF8XioS96JhBuR7e0Osxc=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3c6cb cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jsnCtpYymfaPz7_p4TUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: s9wXZCH8XMayZAAUniE1oNAebOX1w7G0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfXwJsjgSQa62eS
 heC4bLGY/A6pb9GukIiOrew2I0l0BMQ4IUDRtzauioOAWCd5teIyFPJ2S6jeoeoIvOCbsaODWn/
 wwvcBWhopUzx3lJgFjecblS1KH1xJ6F2rDwzF8EDVklTLSW62pk+XgMc8nA3E3l9FiM9b8ry8uG
 8t2pgQ26UYrZ86l8XLV1JBG8rtmUJJvPPn6/3pb9lCi3IGBKH9TtHvuC/PjXcttbBkg9kPCEyMN
 6VjyjuI7gelZmwZLk26XPfpaK1cDR340Tmkadj9LIqPZOb3tesiVJk0R0qNSog8U3PNvfkqaJds
 BaMcqgR1EDNtBtm7H+J98rM9K/6qHni6b3Jo/5Mu73h6tdOopcnVT4j2u3Up4Ypbsq5v/Tk9ijP
 h+etUWOyc6H3xLqquxN4kRT2C1q0V+kDcoNw7Zu0m2f7hPov+vsnZEn5f4jyqOuEPiiVE3jCf6q
 bTJHJYeEgmJYQQ0legA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230049

On 9/21/26 12:58 PM, Krishna Chaitanya Chundru wrote:
> The existing pcie1_phy node only listed qcom,sa8775p-qmp-gen4x4-pcie-phy
> compatible, since no QCS8300-specific compatible was documented for this
> PHY at the time.
> 
> Now that qcom,qcs8300-qmp-gen4x4-pcie-phy is documented, list it first
> with qcom,sa8775p-qmp-gen4x4-pcie-phy as its fallback, matching the
> order used by the pcie0_ep and pcie1_ep nodes.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
