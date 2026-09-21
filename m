Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94F3493D4F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992225; cv=none; b=nBgT4h0m7XaM5Qsx6GTMFNkN1OKrDdx2Z1hnzzVeAs6rflN1Ik8ghbSWoaJoouP8UNNkL4ULm5JBT2jV7n6wOt+YxECCVDsHeH/TRKNpgHxBQkb9nYj/Z2fgoyCbHYwJ5MKOlsTJKHbaXu215m1Cwe/zNjVhXrueFzdRxgUjkSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992225; c=relaxed/simple;
	bh=dkCg0VF/nmtJQ9q41G4WkvDXretB+OVH59ybsKpgbv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMwEi1IrqW4JW1L8ZaCrDeLVEf6Q1EeD9mGn2McjdWzLdYDx2ux64h5HB38WcYdyCnjWp1LAfqre4bCgRrHIYQr6currs4O7pvpXzZ/k/Sahl0640FqnjvpFdjrXNfSpDcBw3dnnIeumBjl1LA2Ips5szrwjgJmp7yggP0NoQQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAeFgV08; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FauWyBGP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAeFgV08";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FauWyBGP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeISs838046
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vr7HzjusZyhP4/dXgy2m4qWv
	YG4scQg6gixx6oakxiM=; b=NAeFgV08TE7KU6No2mBroDHTkTdOAvfq4qQHZ5Mu
	A0kq9ITkZ6jeF8X3oOcNFdGvUnT1MqLX1MKMjpWeV7/MYM2xkwldpCDJN9pqs6lM
	GG5mvctAQQCZF9ENDq58pXN4dB8ASIyWIPBSOgoErlB+Hme4/fY82bF9jL6JwULx
	qyr2DgMsRBeDEVOnb8R1xZp6QULEYfAHeG7BmKh7Xqp262dlPO1GrGTnK+VkYLr2
	3J51OU8nbbO6TpWs0Dn7nipKa/Bp9+V68y5IMk+cQD2DI4y/OkRKaIYTqg0q/X4Y
	waCWUNSrHiytYE/lXZqk6LUrBnuzr6X4WMio2o6sJSDNGg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5hptu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:03:41 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-983310b2d52so234731241.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992221; x=1790597021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vr7HzjusZyhP4/dXgy2m4qWvYG4scQg6gixx6oakxiM=;
        b=FauWyBGPg5iliAH3qWGUDc3DPH7vnt50WZk2EH9NJI9qgvvgmFFljOXI7lfo9ODBpc
         pqb/3nP7wappL8EWWVL1r0Uwl/2eDTwnY4Lzmi6KY0CC7hL8Sg7lfagEzKwfjTwdQolJ
         pEGdKYw6BCWYLdI8e6Iqk4MirYyKAZhntPypyI94FY8K/Gm3BQSpFOfwWrrjXggYjTEj
         VUPjA8TodqgT6As7mnu7psJsJvD8LbIWBmX2Rvm3ZDNcAssSFhBLNMcInU3dCOq/yb3y
         rj/RVU02sVLYH9r+nH3fgwcAnrv8PbrGO4gNHwwwJrsPcy7vzc7tq2cSxtoJvJlwXNRV
         1a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992221; x=1790597021;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vr7HzjusZyhP4/dXgy2m4qWvYG4scQg6gixx6oakxiM=;
        b=ZSt1NwySbsVxjt+qpUqJZrdtSmOatb5tTyhx4ueH/+W9G6r9OKZKHA1LV9esdbf+ZS
         Y8r5ihK/bx2NVS5V5PJr2bjEWcNVyO0GmO254FvzVR1TYI9D/wuL73kpR8C1Bykivk8k
         gvdWwxVE/KBmj4TpTCUX2/87rkhS5e3lMvTfRYzx14BUWNzzCTdNJfkdaQ4vktn0NIL6
         vu0z7vs9ypRT6U8LbGe+PNlMfxONopTsbXgcMFmNWscAKGH0obIMD2CZ7MhxKQuISPyh
         EVB47pZ0aV7BEwhOnR+o/G+9LWaseMs9LiVQQ90PrtMIq0QnNElYZ1gd59cJwzyWhbTC
         wtjw==
X-Forwarded-Encrypted: i=1; AKwUvBwB+/3Ez7K/vUcaiwqYIT5oZP2/DoGuUVESz3mQfHb6AC8ZMx6CcWL4TkeGVKMxPCPQNxMemdPXsvqP5LM=@vger.kernel.org
X-Gm-Message-State: AFuF++m78ID6LOk9PQon7CNrhciqaByBOrcMcuQG+DnprFz5kzuXrdTH
	/rF6jbI3xmETCMGP9WbA+UbfoM1e9lzrSp+wyUgV9IBB0nAYVWZff/HV7RQukTjeL3QVc2mwJIM
	OD4yvqhHM6LrISLjGjVlLd2m4z5u6qa/zki4f5oIF5tkCkq5sqf3Q8PmVy/pami/oWSA=
X-Gm-Gg: AYBFou3slqR1R6qJnPul3OUfHUOnfFlkytS7wLTN2OlptEf0N768CQAYwoLZesBIFkA
	L7pIcaUbIzFLoYn+dqsTUPu53fFNxAr2SE4194EPUgz332GYfq8UE3VYqdD00I0r1+YemJOB0ur
	Q5W1CD7cwHHgD+O5LrUIxMu8ugxaWw2K4t0zZEK7E74v5D6BxrT8p7WOCp0aEUSf4O5VLTBLC/M
	d+YS9N1WrkLaX8mB23iLAIQU61MK8TwUxMXNWmmHlpsg7zMGesIVzHW/InGdG/uFfgZUgFNKRf6
	dleTrvIiOaTMA0UZqSQNdLGEu1S6v/f6FQmHHzNPViF+z13+k1ngvA2m1tUd3S5Jkuv0J5VMxKl
	hpHlaybVK/b1TpXA=
X-Received: by 2002:a05:6102:c94:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7a818172947mr1115764137.20.1789992220888;
        Mon, 21 Sep 2026 05:03:40 -0700 (PDT)
X-Received: by 2002:a05:6102:c94:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7a818172947mr1115706137.20.1789992220398;
        Mon, 21 Sep 2026 05:03:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm147882235e9.0.2026.09.21.05.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:03:38 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:03:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 03/11] clk: qcom: ipq5210: add 24MHz rate for USB UTMI
 clock
Message-ID: <is5xheeyacsg4evn7mrtwl5wzti34oswus6xorhweaknahm5dk@l3cdldjupkjz>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-3-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-3-d242e3d49648@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab11d1d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JaUoqYncsU2g2DIqJJIA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 94LlSEtua8CMYON7OaJGbdsPO2YLBl6a
X-Proofpoint-ORIG-GUID: 94LlSEtua8CMYON7OaJGbdsPO2YLBl6a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX53dngdGS5ObE
 GkkxLcq6DgowDjyOs6H/QQhW9+3Ia+OpBFpRlYybA6LO97UNdkVPW+016/e7PNvXesAPTTcmRqT
 J5LLauJ7QEP09lajXfifMJoheLQyq10=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfXzu/zY9e7ao9J
 Z9BHFZMFUS1WVIJO/i8Zxi2966T8+FFBS7uWsPn478Um6rQEacExx67NBho1bJM0sD7rz1G0Xf+
 0CFMneS1DJkAI89Bf5I3Ys4GQIWgO+dJ6F7VBiHXQII7rq5Eqltaek9/6stPo+0TKiVAcQFlgLe
 0yQPIWEYCRmKBJQOeD/HqUifmeyVXPGY2xPY8dvpHWKx0nbFwDxZwcYa/RgE1cSG46dTJz2Wdp8
 8YaYRCENe0FeXUGUlAhkSLJxoQUgFzWId5M8DZoGoa9omMuUHxd8jXfjnT+aTQrjNb7XYigQo5Q
 yN157cxUCsbVJpAIyR8RrqTdURMza70OMshrHgMiAJ34NCV7jbfaE2vpSlp8oiuWc+1nwL20WPD
 XHNbA6QKKs0vM8VPPYIrAL8i6647WfTgu9RPUo2w1OD+hMJ6Zt7lMRR59Q090aGNNBTPrLS3CE9
 /Md//4bkuXLbK0oYgfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210174

On 26-09-21 11:49:36, Kathiravan Thirumoorthy wrote:
> The USB UTMI reference clock must operate at 24 MHz, as recommended
> by the hardware team, for reliable USB operation.
> 
> Validation showed that USB 3.2 hub enumeration with USB 2.0 devices
> fails when the UTMI reference clock is not configured to the required
> 24 MHz rate. Configuring the UTMI reference clock to 24 MHz to resolve
> the enumeration failure and ensure successful device detection.
> 
> Cc: stable@vger.kernel.org
> Fixes: 844be6e24afd ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5210 SoC")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
