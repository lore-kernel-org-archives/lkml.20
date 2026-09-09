Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E275855930D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958822; cv=none; b=skqDQJzdZxOC967ziv3QdEDNda3/1Ykkhm8XkttKqPsvNwBpivKlV5O6lbFGrrSVTVe0cTSdn264HlXygvljLGUoLUzRaHL4RPkMe3LyCDjNCDr347bu31HUYaw+qYcNYNEaXQ/YbZf1KwvaXtoKYIZmfrbaoNijenkhFiRWUvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958822; c=relaxed/simple;
	bh=gJY3Tp1Tc5qnXPWVux6crch4A8fYuRuz8YbTnJeADhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MAUThx1oZmY5/fF5g6oFeTw7NvY3h4adwNPH/0OAsx+nRbfDRhILn7QAI+IipeHKA7ddCdkAlefWbxDbinEyfnQfAbT1zoFsftPFi//RLoD50UOs0FQnhbFuSQf3xdJmzqjv72PCKrJJLV78SNPtcLcOfyWsxi0zcKxcmzfHXxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HaBlJ2zw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V78Bp0HO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HaBlJ2zw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V78Bp0HO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUCaq1843087
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 13:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vU8DphDo6k5bSz0d7Lxnwr8LMEAl8VYBZuXrpUxN83A=; b=HaBlJ2zwEDFVYmKW
	A/kid77zZU9Rp930kIOBNutwZL125050efqZFA1QM+6ZXO+dWtrbwTMbFLaO1Kjt
	S2Y9EjDF080lGo9Uhi+dbWBrAja08/nAt4a0inwOITpwOWaeC7Ck+evtEeuzlyeA
	1d13/2cM3JSHG9Wjuf6vJwWqLuEpFkYrJ5stQ9KIeMEeOIvI4rdi28gVj4TnhQer
	/LgrywlVnPFppxuuD8MvrqagTa/LzZh0U73ulRM3J1jVUgXQEfrJaJeoZykPkrMk
	n4Tkx8WjURABflPbZ/eSA8RJ1C4ThSBLzQCtFAzNEHnwsr2xpmIeM5A4iua5rA5C
	ozKZVA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxqjaapn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:00:19 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73966c839bfso173592137.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788958819; x=1789563619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vU8DphDo6k5bSz0d7Lxnwr8LMEAl8VYBZuXrpUxN83A=;
        b=V78Bp0HOx/2Ye2rZZUFJPSCupr4xKbH+gZ0CbvVEjVGsoRUe6xqFreQteU248kMVe6
         nwok01pVch/VFZPYhJ/q3wlaunec0p+0ry3BqPgxiN/5PckjWUEw5kY0ayrBr+7QKM3m
         7FlOICWdMjL06ZhukIoH5MZhf4PYUhwFFrhLm39nNmGL282torHYyGhfw1bzby6DwBZ1
         vSHNw02cRjv5NHj2fQIsu34rf/KSzzL77UYMZseSMIreHX1As0FRX3Ml2IxBPAg1quPT
         wX2nVDztwZevxFw0RWT/6EBexh0I7gnhGmglSLuJsJOqlSn0oSDRcLUGk/79s1o9qwOG
         lZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958819; x=1789563619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vU8DphDo6k5bSz0d7Lxnwr8LMEAl8VYBZuXrpUxN83A=;
        b=pkbXQYaJ9OVzk2MtV/MhZGLv+0cbEMrn4jsvBnAKwtkZ9mUsTWWrcg0O+etovgLoI0
         owl/MF7vj0kuh8k9xJqwPIRF3KcbzDxx5WhHY9sb8WBw614AvPCSeg7AvTChLtk/PfSc
         GCwqOjRmVDUH100hzj4cvUaPEDVAfH6n7tEY3k+js2Z++Hr/WGht8EdFTlll/2PpdEEl
         K9aCLDr6XFvNA0Z6Z9A6JzBmqwGJtK8Ht9IpvTGA9RXufdvQ4DI3zScSvCUDGvb/S7iq
         l8R80RH3714ktwT8mlX/vbiuq9S8jEXIpxQf+XlD10Jx8eus9YzBR1Eo/F+n65KMSrvr
         5vYw==
X-Forwarded-Encrypted: i=1; AKwUvBwYSOah1ILTH5odBtok9Y7JDALEeZcX20Md7neYh+334YAS0viCPH4gUUzQpkiJq5WWoki/+NVnl56Telw=@vger.kernel.org
X-Gm-Message-State: AFuF++mhqc0OTImX9OvhvK2HrMxhpsKslQ/FDu+46hyrVZeVHXNFuZ1Q
	oTDZE5F9JlngJh4EhddMlE5sTeSrwLr37tgspj8/BXnkyvUeOpWl5sn5p2sYPRWqO2q9hX94aLr
	JSw/jqHb4qqSDk0Y0djCt1i4IPl2B5oJIxJKHIJ3yIKWxQIlSIuqoCKD/BldJm2Ov+qw=
X-Gm-Gg: AYBFou0JXoJriiw6ZLFDXvJ5Ta5BV/Z/DbJ/48Nc5aF4RmUsfnqVuJspSqCeakb4aFE
	KW3Hf/bWEwLORqHe8bVXHO7TfEcQYn4048aPi9AD1YHnGG0QhreigPXIQZMVMkq7lP3a2UbHrm5
	xGZIhrK6gGQxrSM7yEHPQ+69TQevq8qzMs8qiTD73u9GrlhpEn6B9J4K495nSt5lke8uJIVIpFm
	mg5UgNLRJPm84fpmOqsn3OAWjt9BfIVEjOf0u/HXFH2mRIH6b4UmrxR7D5xlc41JFjc/PVW6qeN
	9yPofNzz3Ow/t6da0ZQ8aL26pL+iecMDtCqiTcd5W2q1ydOrptqDT3PKBSi6ASXUlGqSp+8x30K
	Wc65yUzTMzimBjRT1Inbkow==
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2591552137.1.1788958818670;
        Wed, 09 Sep 2026 06:00:18 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2591535137.1.1788958818116;
        Wed, 09 Sep 2026 06:00:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b667b6c30fsm3387051e87.9.2026.09.09.06.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:00:17 -0700 (PDT)
Message-ID: <978dee45-827e-4fbf-a574-8c61c7e0e097@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:00:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] usb: dwc3: qcom: Modify interrupt handling for
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
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
 <20260905-eusb2-interrupt-v7-v7-5-820cf5377a70@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-eusb2-interrupt-v7-v7-5-820cf5377a70@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9BCTTaSTsTGhJpRvfw_6WVVPcROq2DgR
X-Proofpoint-GUID: 9BCTTaSTsTGhJpRvfw_6WVVPcROq2DgR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NSBTYWx0ZWRfX32ldCkUsAt4M
 TxjVpbtW17GTttxgl7dRF/mvUwJhrjiLLNr1kFbGi8mdHyb8eAC2Ubl3LFTof8p+bQU83RwpzD4
 +mp6YbOxgK4RPFSnLVbpEUrF3iUzgg79XOmd3sxQDrGSsh/D1NlStdKam/QR4FFfM8mo4NZQcti
 aM6og/jV92noRZtjQG8/abm7OsMJCLO8VCoNvc6MID4G7QYsUQzI5+ZNILrxWnfpIRdfFxsqxF5
 pQcUI93ipb2Q0t7NznBHv30NZ33BN2j8mBdhkr7/cVY0jKJ2q8kZVlEqa41ZrS/MCrp1AU8i5pn
 BaSwBmKyZddDdSY5reTc8pG6lDEiESMjdpWqVRpq+64LzMFZAAH4PpuYVtdI2hQLKTcxDmQgDB8
 sMjh8EyL021i4N5h4qnWuLfAyCoTcBID/BIo5YroOZgfAdMj8klNUDf7YGIEeGOceOuTAKjGYrf
 O8w01tMmO+82GCUlS7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NSBTYWx0ZWRfX1kdYi19G8qtn
 VqURrX6IUUnSp1ZF3OzIR2/7axRJH8weszwxHdaiEMdTl0yCxfqye65NYtnOv2hoidSDP+GOtN9
 Mvz6xGbok3vm+7t6VNCaJ0pPTqj5A54=
X-Authority-Analysis: v=2.4 cv=f/p4wuyM c=1 sm=1 tr=0 ts=6aa15863 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FycFWezSpWEMHrBiXq0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090145

On 9/5/26 5:29 PM, Krishna Kurapati wrote:
> eUSB2 targets handle wakeup interrupts differently depending on device
> speed when operating in host mode.
> 
> According to the eUSB2 specification, remote wakeup signaling in host
> mode is detected via different data-line assertions based on the
> connected device speed.

[...]


> @@ -628,6 +649,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	int			ret;
>  	bool			ignore_pipe_clk;
>  	bool			wakeup_source;
> +	struct phy		*phy;
>  
>  	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
>  	if (!qcom)
> @@ -698,6 +720,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto clk_disable;
>  
> +	phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	if (IS_ERR(phy)) {
> +		if (PTR_ERR(phy) != -ENODEV) {

GPT reports:

When CONFIG_GENERIC_PHY is disabled, the stub in include/linux/phy/phy.h:489-493
returns ERR_PTR(-ENOSYS). The patch only treats -ENODEV as “no PHY”:

But it's not like one can really use this driver without a PHY..
We can add a follow-up to depend on that for the qcom driver

otherwise

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
