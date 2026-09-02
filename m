Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BC8448B88
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344949; cv=none; b=sjdOwD9sbIXJT91sJbYaxzV/mb+2OPNQpewVINNVLqnEGG915dnQykCBbLu0DfTouLq9TTrroFuKLSFeDq4ULu6tYnS1lcisyLiwaYSQgZ9fjQP38uYhiQGDZgYuDp5O4bD0GyhteHoUdQnUC9s6WJ2Z+1MlhPvay8w2pTS+mRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344949; c=relaxed/simple;
	bh=D8ZSpMUPIDCNW+TKfznVVt3G/+Z1IAgE/rX07jvs3Ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aix9KypOeOpLQ6Eml9rpFt2V10sMW8UwlSoRkTK2IN4vTttwXbEcxnnQniOlisfOdRCzp3wNke0XrCYrnPQww+j7eTrQlGmqfwN1ymDl/bANPh2DjdvimbE1YNFCiJ4988+dEq7L/UHAHtzMWcEovz/FTsjkmiLG9OMKXMdpQr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuWlE+PE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAg2QRPY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuWlE+PE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAg2QRPY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682AR4Rx1287361
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 10:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdOfQSqLmWJ7y3AMgqR+vy4CjQvTB1wFH1GkCyGK4vc=; b=TuWlE+PEE0fHl+Q+
	Z7tHB0FNlZLyis+6uv07INbF2nYVZdRoJ+svY5ACNrl0dQ7DqE00o7BlnrLI/Asu
	s38/IVguMpGDQid9B7Whs1FHbi2SlIWEkyQbHU2UWz6lj15k02oN/3xh0zZepY0/
	7I3rpZBQRUd5tn7LiQOGnkG4HPE2ea4EjhtRpjt3Wbiim26QShD+YcjVTQTtKdGm
	dKb96JQS2tZeuufTmb200IGGDYSSHbR3aYRdC2jKt5zQjkuRl+3Lw+BNQmdEU7aR
	uwsfJmrM7P+viUve9DEi+tnQYkN/Vs8gS3oi3soF7vXC4XfaH5WCAD5WqCtyRjwN
	DcDtsw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2c8079-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:29:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d0caso19103685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344942; x=1788949742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TdOfQSqLmWJ7y3AMgqR+vy4CjQvTB1wFH1GkCyGK4vc=;
        b=aAg2QRPYeQSSnJ/pnIBzxmkITRiXqqFk/TFtiyYYVZH3BZn1Zvpa6ZmtxUeTsAAV4C
         8OP2i8zxKGYxblf23Ug/ygPUW2WW/x05L58OqSTNjtRQB/j/PrREHoAB8RFlKX/TsMOZ
         HIKB0TJBJdM87qF2SCS5B5P3cw7JhsSF01ylczEKslhydvDzAqIdLYh6wp8opH1IL4Bx
         oGwMGUNu1+i3nyC30DXtaWoOmVJ09052PiIchsYTkxUYt53OGvF+YztYXHrYRZ7rJsC/
         ZruXnbbH2gYRsXWgj4D4ACN0+4ksc7pdSw9svAKcqasJW8F9nZmY+t/c+ZLs/By2VL+y
         +WTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344942; x=1788949742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdOfQSqLmWJ7y3AMgqR+vy4CjQvTB1wFH1GkCyGK4vc=;
        b=WmlbYi7ieX54hRp/DS3T+vDs7gMzI9HVw0OZPn8CS5uuulM9AzhWIuAcYfWzXcG4z/
         HY4nC1mgZesct221GoCDt+vCIZSJ8rNP0umJhHAxM6UayGgqWHLdTRrq4wmuQvzSEr5U
         ffKOwRQEybNHkqT7nxCOOMDP3PJMSExb9iH+rf1Jx9JDMGQGwTc0TA5Q9sGntx5KNZeD
         249xNybwJKzLOaB3g63DWo5EuWtrjuvqphIMQ9XW6rfqVLwnTmrzUL30+NHJ9QbFrm1K
         EHGuIpi4a04feFNYZYSk70cxk6XSWGbaEtQFsc5PVWvHi2O46ZSFhloj2QpWz99ILpgZ
         zhag==
X-Forwarded-Encrypted: i=1; AHgh+RrR3Y4u6tLxMm6dOekU1EiVZBRPl4/Tx5XD8HTI4PaH1EAXH4vmzVd6qEvVXX6Jiy/np855ezaLJR48+tM=@vger.kernel.org
X-Gm-Message-State: AFuF++lCImQeMSbHfIVVm9DX+Ar9PxiUtAXtip3V8/jxhIQc57JGq0RU
	QSeh7JqqaKzzcopKcc9CZoxJnDgRyw+bC6KNgTlQ4uBG7nE6OY8DC9XTuNOM47AFyUo7Q5CZRUs
	CF7q8sD3lFZZpnuvL4S0XQ1BFdh7+se8pWtLNOgLPWb433E2PjwIN/Ujvh7ByNdKRv7g=
X-Gm-Gg: AR+sD12WPQ0WYGqO4ylToqXTTEhNODdK//Nxv0AkqL9lJ2mPIxgGWOhGyvVy4O9qcxQ
	NQe19hQkh8OTjg8OqGIA28azkD3KrxAIOd26p650Szl0842uriCXV8gcEcguz3aepDKYOqgcby/
	cBDdu2SFgzKVVx5uQPPPzSjiGoUGFzQuydUy6nKpdXskgBI9qGVeOC26n7ofisqc324ssLwwdcB
	uqPgISNIaJXCqS+KzNFcplruXsaIzr/cnjlW8WYZ6MyEQK1g8ZDxVN2pl3X6K4IQdNBAL+47Lfi
	hkjBagTyoD56C0aB0P20c/Qs904aFRvDmXM3ORRTjDp9DuMZ/Cy15AP8TNbNF0caEa7sd+u9QXE
	PygpeqLiXA5HxLvSy1Pdl+A==
X-Received: by 2002:a05:620a:4623:b0:939:48e9:51a1 with SMTP id af79cd13be357-93960e1e27bmr241294685a.2.1788344942228;
        Wed, 02 Sep 2026 03:29:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:939:48e9:51a1 with SMTP id af79cd13be357-93960e1e27bmr241292085a.2.1788344941785;
        Wed, 02 Sep 2026 03:29:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d002dcbesm109123366b.16.2026.09.02.03.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:29:01 -0700 (PDT)
Message-ID: <3d31f750-750b-4561-96a3-d265b632da6d@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:28:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
 <20260826-eusb2-interrupt-v6-v6-5-ae2601cfa80c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-5-ae2601cfa80c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MiBTYWx0ZWRfXwuJ45sS5OCEY
 4c8/liuXoNFGma11WnsgV2qXNPsckhTUsFpJ31TO8w6kXT9NyDbF0WvCC8DrVCmHaN9Q2amV4Wu
 902cg/pUyR5SUxXRLPbqHZ8zueeSXuE=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a97fa6f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FycFWezSpWEMHrBiXq0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: e-C18WttAXu0HjXHPzdhPq1iTgbWX37o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MiBTYWx0ZWRfX6VYEwelTLxKr
 TtdFMa+mYobdocY4ENHDjq1/bQQz/cgREulU43FEAxuPuWD079hdqeOwC9EneLT4YZTnXqxsOu2
 DaTuEO/ILM/98t2oSRKqFTwZgZvJrJDI4FX848DpCNkp0hf2LQ35vJUeK9E34ZRxB8qJ36FPA9y
 hr7+JSq7J+Ew3Gx1WOyqPxpZboklw/O9p8p0UpVgJSN0wRCFuFDqRN8iX94sXw7qC+lF18t/eNW
 PjxFMx4CqVR0KbuCEyPPuWe1LTCxBHC4q4FKuwsG9aMNOQotV/7ikX9m+FDc3CyF0dnRmiIpli+
 uNV2hJXrWNcVRWcSS+lQki8Ql6WPD6ujSe3kqpUD2n8jg0kCoShaPcOLzmXSi8602W3MmPBqEst
 SSonn+cqpzlZ3nl3sNeWEZboIi80iXA90gS/0tEU20haoqT5IGjLP3RmmasgS2yO4h31Avw6CWJ
 7sRBJT8jDkC0lMHqf/A==
X-Proofpoint-ORIG-GUID: e-C18WttAXu0HjXHPzdhPq1iTgbWX37o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020092

On 8/26/26 7:02 PM, Krishna Kurapati wrote:
> eUSB2 targets handle wakeup interrupts differently depending on device
> speed when operating in host mode.
> 
> According to the eUSB2 specification, remote wakeup signaling in host
> mode is detected via different data-line assertions based on the
> connected device speed.
> 
> When a low-speed device is connected, the host repeater drives eD+ to
> logic '1' upon detecting a K-state on the USB lines during remote wakeup
> (eUSB2 specification, Section 5.5.14).
> 
> When a full-speed or high-speed device is connected, the host repeater
> drives eD- to logic '1' upon detecting a K-state on the USB line during
> remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).
> 
> Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
> eD- line states, query the phy type and configure the wakeup interrupts
> accordingly.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

[...]

> +	phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	if (IS_ERR(phy)) {
> +		if (PTR_ERR(phy) != -ENODEV) {
> +			ret = dev_err_probe(dev, PTR_ERR(phy),
> +					    "failed to get usb2 phy\n");
> +			goto clk_disable;
> +		}
> +		phy = NULL;
> +	}

Looks like we don't have a devm_of_phy_optional_get_by_index()..

> +	qcom->has_eusb2_phy = phy && (phy_get_type(phy) == PHY_TYPE_EUSB2);

phy_get_type() and generally all PHY APIs accept nullptrs just fine,
no need for the first check

Konrad
