Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE80442118
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771404; cv=none; b=opHC34fQrDwWfT2fQkO4saHYmx5XN3OcaEaIQg2oqsxyBOJiFn6GmX6B85orFWy+6VBpu4CQduoavFbYt/5iptvAxsBhyS7HcGnmpT7npeXQHzyTuqGHNQSGu8QAl8a2fLlrHB+Nrc3zOxCK6KbzyCiw5fwqYdTnYWvp4Ij24pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771404; c=relaxed/simple;
	bh=rovNXMTMW7lbCsTGUUmmAeYn+T8gnCE/wNxC/sOlh+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYXnA4VSkAzG0g3TUblIMUfs6U1vnEuHDajmvfK972wBlHM8yQtPirqTdY+UNZzu0aeiEVqqijir3xDcLO4BW6qD7Bww0CvSxXwVYEUWRa3hVpeXXmQX0uuGq/RWMsCKv1WSkiyVT7qG8ac1bMjrV8Z+twzBERTbzINF0oSD8ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1sdOoVT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTrvjUBQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1sdOoVT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTrvjUBQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777X7q2724146
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W0TksTDHWCX56lBMxITiII7yWE3sq3r/nFftqOK9U68=; b=D1sdOoVT6IXp56Cn
	8sse56jyOix6Xe9pseziaIZVlNFZJk8fOVZ8brYZaRr0gSOycfHpqTxmExApL675
	cce7hESKqb3kk+A3yjp2q8tf6xN30w4OOgyDXVQoNP34DPfj9XGAesTGzmoN/wKm
	J8N59qMDPzXQA9LiF4In1jGp765cSQyl1fq9S/rzH/W3qzlLz3oeFpGaoGFeeF7m
	VODRw45nwaDl9h8TquFuSBHH51NmQb95IaIbEkWe4ewu3zYVM7Zv952Rtyhkw7Sz
	X4rLGUEU2ax/5QcY0N/886V0lc5FKorZagpjtB6oTrdWcBKditpFnXvwBrwdtr1k
	VsWgmg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxksu27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:56:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90c4d46037eso5812686d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788771402; x=1789376202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0TksTDHWCX56lBMxITiII7yWE3sq3r/nFftqOK9U68=;
        b=OTrvjUBQuvp1EU3X8E72WHXE+RwTpfKFtZTuf8NVEbz7D3UEDNeFovCXp24FdT7zxa
         XKposNaHjPfmmI0SCtGWsmnN2jBLBtpb+AQoTpX9qwDvfDCjnWIQaQkske6pCfmT6PVW
         62yFaGYVOKX8BgR2GDI/+EUeDVRzOF710zu/He2sJ7ynYAejHgYR2+itwJRPl8AOR5xj
         7oOAouZD0h6/9eJkSMtnpe0BgQduEzK7emspvVt4IA83cFdjON/VFFWOBfmEb3EgQ0vW
         NyT0S+6Lwq7BHKQRI4RJpGU7z1DIk/a6Ie+J0Cnu9RG5IdUVNOeo5hOgrxbtmBkVY8Tb
         aHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771402; x=1789376202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0TksTDHWCX56lBMxITiII7yWE3sq3r/nFftqOK9U68=;
        b=SQyj4KgbYuf5m/GvR5utuH2U+K2gih8THAmEwBqyspsZFQYsS2LOlyNOqSE029OCjl
         REPchMGkS7CyZYzBHKnVKjhm/zYDQURDq4Y6nhwCOP6AoqZ6e5COKKBtZ05EX3D3o+Ux
         wtOpeup+JPqYpkaw4VsQlbC6HWEmecoJLL6H5Tb16RH+1daxrtmNWhZp75/t+hZlR7yR
         /FWvnkrzU/VMbcaH+6sWChN956czaEgqUMbhDz31aNYArUpX4BFE3R/zVylvJ+HS3MET
         FuV2ycQH3F5lbUCH8BDI/EAlRA1J6NmnmknfSxreakv5bIKN0XwT1tloPNa5ui6XBt1X
         ZZww==
X-Forwarded-Encrypted: i=1; AKwUvByp3h+0c5iII5fqVInMEOHmNrn88mCPr8VKrzRAjgXdOPL79BWBfSP1OIunJOSHn025po7fw3sWj3kGkNY=@vger.kernel.org
X-Gm-Message-State: AFuF++m2UEp/P0uT1drYrsWKLba3r72+IRkuxrGYKaSehrBK3jVMqZxJ
	U1YI0efzqRoWHkP4lYPGbVwdKCGm0uzSReTZIDWqjN33UN4/TucTUYWkDHYXPXCWM/BEnk9h9az
	cfCGqXmz6ogVBCzgGc9o/7QWnjj2Q5he0FzG++ZPuKDqoMTbZzTjxylKOr37QU1VTRBk=
X-Gm-Gg: AYBFou04icwZ+7CYuG948aCUNHCxXM8BmZ0p5HPC0FPQbETotCV2h+Af84yUxSK3daE
	+KoIO9zdiGO3iiZp0oE4IlmFLa7ukVP1+koqh1cBtFdaug22VGdDkV0xI9R6zIfMnt06uzO1jYA
	YHXIwXsAfztdz89efqZKXhthsDvdHc2MzMDtr/E+UTysYrtDW8YzqZAsaF7YUJYkTdge2P7qhwS
	eS7UwVyOly1IcyEc8lHWfdSXS+gxu4YnO7pDcByjqf2h23/KHml00vzLLahn4hqvS9KudMWxVj1
	IykRll1Hs97PLmmt59gJ0ZpEB+60gXp7qnz57z5JpYCsZA0g/q9qTg3zq+VzXPrjIKiJ8us8/qY
	+x7t/XWsYFLJ2a08f2Nfi4A==
X-Received: by 2002:a05:620a:1a06:b0:934:95d9:85fe with SMTP id af79cd13be357-9399180ba67mr1024939085a.3.1788771401690;
        Mon, 07 Sep 2026 01:56:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:934:95d9:85fe with SMTP id af79cd13be357-9399180ba67mr1024937185a.3.1788771401200;
        Mon, 07 Sep 2026 01:56:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8b7dsm431916666b.21.2026.09.07.01.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:56:40 -0700 (PDT)
Message-ID: <60638819-77e0-4d7e-84d0-00afa430b398@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:56:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: ideacentre-mini: Drop the unused
 USB MP port
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-7-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-7-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NyBTYWx0ZWRfX0l6M6qEKFy5J
 D0MbwC8CABJzq7YjgkhSfzS+Jr7QEWKuv5zwfD1aGps/csi6YF4GXnKmiJ2UbXgOpBUn9iLV1eA
 WzweqqtDNaY22iVxKF7Y+ChtQTu3PLNrzHJFl4srelem+vp2ryAbkFsP8ESNirpfT03xt2hJ7qH
 +X2ANA54yhpOqBVPAa+ho880SLE3oDWvr6l4M8cPxlfTg0lebl+Z8iLrqdb3cZJggj5eOqYQdV0
 vnk8e3+u5Mxodjof6yx8AlCCU2TcBmUblZ8b3OzSqJ1Oeum/IQ0mQ6w4Q2tjulCx4GtwUo7bWXW
 XsbVsJQWEgC4/DOVQahcRM+S67eTL7piq69/9LNPlY1UarMuXx44Zn//D/eF9hxjCkialR6GlA4
 4p6q2pFYa47uQUOoN0nlgzbZf0B0DTzbn3YPgXlg6vJ6e/BdtVQbObaNCfRZ4+B7pZtw4LcR2EK
 wjL31LTKvRW1XwN9B3w==
X-Proofpoint-GUID: DRiXu2-aLhjtMfk7LJeABLeS8h0zgPFx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NyBTYWx0ZWRfX90IVYnwEcwmy
 tXaiLqsVJVfPK5hAa+JJac9ytm3PnpvDkvuqgVl4FNF/t2CEasNqxIX2vpuCeygmjg6nWXUL3sr
 0Ed6eAFAkLbLNSHh9az1C4rlhQeJ1fo=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e7c4a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gxl3bz0cAAAA:8 a=tblq76QRJd0Dn6ki9TUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: DRiXu2-aLhjtMfk7LJeABLeS8h0zgPFx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070097

On 9/5/26 11:29 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> usb_mp port 1 (hsphy1, qmpphy1, PTN3222 @ 0x4f, TLMM 184) is not
> populated. lsusb only shows two xHCI controllers: USB-C on usb_1_ss0
> and the rear ports behind a Genesys hub on usb_mp port 0.
> 
> Remove that repeater, its reset pin, and the second MP PHYs. Pin
> usb_mp to usb2-0 / usb3-0 so the controller does not claim empty
> PHYs.
> 
> Tested-on: IdeaCentre Mini 01Q8X10, Purwa (X1-26-100)
> 
> Assisted-by: Grok 4.5 (xAI)
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

So does the repeater exist on board, or not? Can you try to poke
it via i2cget?

[...]

> -&usb_mp_hsphy1 {
> -	vdd-supply = <&vreg_l2e>;
> -	vdda12-supply = <&vreg_l3e>;
> -
> -	phys = <&eusb6_repeater>;
> -
> -	status = "okay";
> -};

The PHYs can stay here, so Linux will safely park them

Konrad

> -
>  &usb_mp_qmpphy0 {
>  	vdda-phy-supply = <&vreg_l3c>;
>  	vdda-pll-supply = <&vreg_l3e>;
>  
>  	status = "okay";
>  };
> -
> -&usb_mp_qmpphy1 {
> -	vdda-phy-supply = <&vreg_l3c>;
> -	vdda-pll-supply = <&vreg_l3e>;
> -
> -	status = "okay";
> -};
> 
