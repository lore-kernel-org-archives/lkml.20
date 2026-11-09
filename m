Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214265;
	b=Fj5okA+XhGkwhv8Y6Ii9Rww+eKvXQwm3ihDOQeTZPOOh67auMP+89S0C8hNsUK0+jOXh
	 AUdLl+0et6EuD6d0mUowIMxoGXpR2u+ragU6M+f8jAhhOCzRy0EzULNjGUA+H30XOWA+2
	 yNzQCauxd6BU1+NmqIZQDdFyG3AiqZV+fywbuYjTQhhvLgT9yvUuF96M9qNf+oc1y7CXQ
	 LYeIcOlOW50EnJ87QooU26OFbDLdHe+07CBQaYeLvrLgBn6ynKx+niNw6D6kpt+dPV/Dy
	 Xs1SolzJ21eTV6kC0sJQMl1qmY/fnrZy2wiyRosk7pJYBee/YRyAl+qpKeOMSdZwMIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/3oARxDEXLg7TaIeiQ6V/+h8xlKkrQx7Ze0qvtDuS0o=;
	b=x37Q/dXktSg0htf6aeX1i8AWlT53qSKIjLAzC/yuOFEvOFCTUOsTWj1OdO87KVuADfPU
	 Ol2+nj93BuIOZ/jjPMTpQTp1iS9L6yUUk2vWt+pjoFix1S7AvTS1vyf0F1nhzWM6f2/gF
	 3UbCUNY7KLYp4JUK7Ku9Sa7odHT/+9s6YXKHR3iVx1IDnGu++nTzi/JS4xiLhuvF5myKn
	 ByL11cqmhomzTt8x8Sf/lDOsXLs4bHrpJ31bd4EOWCaf67m+Lmlum4sRCoQ5vWK1oZTrE
	 T1s/f5uTGMNZH875kgWKlC2H5wbVocW2zZ5I2nJGNdfr2DZV+qqCK7H1lSjbejBH9ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjrSw68y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UP7EsUHX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAAD606D80C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EAAD606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjrSw68y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UP7EsUHX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A97ox4J3324879
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/3oARxDEXLg7TaIeiQ6V/+h8xlKkrQx7Ze0qvtDuS0o=; b=cjrSw68yVIWyLr/e
	xwi4uJeVc9sKtHO2Xr1mYmIH7z5SlQE7UxfRuNJs9f9tvHYNZ1YItIbo/mB/V3+Y
	r1Ztf36xojPxSquwT5XIpkJzpVL+7W5IguF1hckFJtVxPYWG82pSA2Nq/q4on1cK
	5wwkarHShHogSjHBittWPna3/BMZt49ns3QHBpYNixfjFm5u6u1FXt6XezwDRXsg
	ptskg9C5EwJSFo9bCpTTYXt1Jmjbvnhgf9YECn96QMFuX7JFmJ8GKdZY1NQYPW3u
	bz+lu+ZJaalA8mHfH3r6h0BknwNXeRZRIsuLr9o1CO+Ue4O9wDXOvc1IGo2W4XA3
	U9iXkg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua5886jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:51:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so809625eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214264; x=1794819064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3oARxDEXLg7TaIeiQ6V/+h8xlKkrQx7Ze0qvtDuS0o=;
        b=UP7EsUHXjxAcRBKAOoYsVd+lU1C8nKSBhoGcKyHouS6aedfgJyQ9vEAFNRDag64F+p
         WjdfHa8yd/sH2luNCUiMI6sNI1nlyHURl4nAUlXVcZYz6FsDybgoj+ur9CcmoWqOkKSm
         ykPNUSs1oedb3gttjjxNIaXpLb6QJRFzjIBccr1gXE2w63q7r3/M90mf1vbna8Sqv1ih
         GYIMJoWcoY7n9tPHc17nauv8brGEJTM/K/DkZLqr2DNyWU6++20IjoN1APRM4aGLTm4b
         R4SRy50Rx6Cq0KkA8O1IC4wOtSzhWG2qRWJmSS91L6IjcWFn7iUeaAdPQHqFo5wxypPB
         ao0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214264; x=1794819064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3oARxDEXLg7TaIeiQ6V/+h8xlKkrQx7Ze0qvtDuS0o=;
        b=0eMGv9Q6yKv20kOZIUUbcXHAIVJPaKCZm7bSm2wtzkaXgBqF8lUo2xT+rL2HcFPqDI
         qHLurjNdaexNrpKQIMz+DNDp/c53FtyQm2jFoDmljJ2vYZ277FiFMnOWKNZZffvKfVJq
         levG8m95YjKp/QEic93sTMk1TwY4Tpt6w2LqZUgS/uioYRWsIY4/Wu3XdHKLqmwv4hNI
         RFHxjV2nFfdq5g5unttmKEHIWao/IfhqklL9naHL1SI3gkoFMvdG90LxCTOetR6vDUfY
         d/qw8fpbz1DbHx7Pj3BCtxE0QYf2QHgzFHl7+nJwAAn1qc9/0U7VZ2v8pCYO2ZuUJCie
         PUaA==
X-Forwarded-Encrypted: i=1; AL+hErEJJtgCbB5eAZu68wG9HfKRXrCPZMlnMbOXWndnR1q5O/rWEuIpmSf2DonYm/73JGTcc2dHdKhDGgqyVrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9u67aBD8qy4p+9DrzERZlcgjuTuhuS6c6MgK3qxs40OhYupRD5
	twZoM3wYrbs/ST0ZUn+0BkBFzKpaJ2Yh+Nu9oy4iwIVRO19XcR59dY7/XpPLiU4PembD3m5fYCd
	sv7AJwUR+UCjFmGghf1Rwy7YKrNolGW9bHiutBgZFPMxSh5Q2Gw7PT2EMYTFABeDJm9M=
X-Gm-Gg: AYBFou3GLQihKqVbqhps25fG1S9BbKYk0Adr8f5PBT2N+VoiitrNS7ng/jhy2hWMh3P
	qDNWxC8QQHGjSwT/yi9oyYzEYZloSsEE5jureXR4INihNb9w3cVRIV9ObODwYVLbbJRpEDDi1Gb
	CpGvwHC1Rf73i6gb6f3SkqurDA7PShROCxwOmrEcnCjKV8399HrzPp0myj0YzhTmJS13gFCFAF9
	DAW1RAl6rSQZcLKp2DQZP2/mUXMqoubHzh4xbLNRQjWde/+4IDLpVkzffFotLXzXJQ4K289a3Tx
	sqDxmkUVaXcrrCOl4c6MPHPHjfJ+6doaudwndNOB8+c2E9WtotRP/qb/GQjgww9pA4zNZFMahWZ
	7I+VkAMQ5U1JyQhxpaX8zF7/r/jxfOLSdP5LK0DoKjbvzPTI63rIb4EwDgSXFEc5PES6QtZ9jkI
	0f
X-Received: by 2002:a05:693c:87c7:20b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37256614e85mr6020746eec.11.1794214263817;
        Mon, 09 Nov 2026 00:51:03 -0800 (PST)
X-Received: by 2002:a05:693c:87c7:20b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37256614e85mr6020716eec.11.1794214263258;
        Mon, 09 Nov 2026 00:51:03 -0800 (PST)
Received: from [192.168.0.195] ([124.123.199.27])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372656187f8sm10575336eec.5.2026.11.09.00.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:51:02 -0800 (PST)
Message-ID: <a7228569-c78c-4262-a9ba-d355101a48d0@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:20:50 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
 <20261027-inescapable-rough-viper-6cd56d@quoll>
 <fc2c4943-0482-4c72-b713-5a66c9995c5e@oss.qualcomm.com>
 <362884cb-71c1-4d12-b315-9923118c8564@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <362884cb-71c1-4d12-b315-9923118c8564@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX29Y5gE0l6Lqa
 hbLLCVtaGIe+o3maRfgh8ul1YxWas7O+KeWSARKh2vPUMLJpky6MNz/0ibSBOYQl/fjWMouKVw0
 csFTw5a1R6k1+5uxlZQCeFUDI1KCyHORx2VOiEv6cXBYbejQxSFfXhDOF4XpPSjvy++B2NIubvc
 uvzPRNnB38NQAiPGYZh+dTegO9OA8A6EAak+Ld20NYxgey+hc3BrFaS2WL79JLS2o9ejIiKw3bh
 E9Usy/3bJECP08MMTfArHUWwkeGgfBIhYegXfd+CniVVtIPH5A+KRXjE8qqJ2AVQqVkO4yhr+k3
 NCwakI6aPPkwEIRs1TcCXXF2C8maQe+XyCBG3RSEWfuIH+wSkVI5oEIrgbqZfbvr7dwYKwE0i8S
 OsP++2rfW2HHPjU3juoncgCNr6b9YUkb/lCl93pI7EhbqVpifoeKwV6nt8T3rzX2fSLQIDLssoc
 HyVbC67A++dXb5sjWng==
X-Proofpoint-ORIG-GUID: 7VYsXuD17IndMZ1OBiaKJaL7E9XUKBTW
X-Proofpoint-GUID: 7VYsXuD17IndMZ1OBiaKJaL7E9XUKBTW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfXxLuosQ2C1X4t
 DPfPNXLpJZyT1Huj33NlrLC+acHk/aaKQBAZd2wqdMT1PaCtY+w3tzgMPMp+BbY9+4ZxVyZLv64
 W3dLZ8X1tq8nN+q92NF7BG9RJC/sniw=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af18978 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=kgg5nJQTCQF2KXP9n8GJFg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=IYge48onPvb9mXducVgA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090035



On 11/2/2026 8:38 PM, Konrad Dybcio wrote:
>>>> +  assigned-clocks:
>>>> +    maxItems: 1
>>>> +    description: Parent clock phandle used to set the input frequency.
>>>> +
>>>> +  assigned-clock-rates:
>>>> +    maxItems: 1
>>>> +    description: |
>>>> +      Rate for the parent clock in Hz.
>>>> +      Supported rates: 19200000, 9600000, 6400000, 4800000.
>>> Neither assigned-clocks nor assigned-clock-rates should be needed.
>>> Parent clock is outside of scope of this binding.
>>>
>> Sure I will remove, but the parent clock input is a requirement of the
>> Hardware and the output of this module entirely depends on the above
>> ranges of frequencies mentioned and that is the reason to keep the rates
>> specifically. I will capture it in the description and hope that should
>> be fine.
> So this is essentially xo, xo/2, xo/3, xo/4. The gcc_pdm_xo4_div_clk_src
> you added is defined as a 4-wide divider - do we need to limit that
> divider's range, or would div=0b1111=xo/15 also work?


Konrad, the divider is valid till 15(i.e 1.2MHz input frequency is
valid). I will update the frequency range in the next patchset in the
description if you think that is the way we should go about.

-- 
Thanks,
Taniya Das

