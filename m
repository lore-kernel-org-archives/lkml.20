Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889EE5540BB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957407; cv=none; b=e4iqqFOPRav92XRMk1t/18loYy+TZSYEEig/DBJYprS0GNL7No243rPK0xxu8mjgmXf+OI1SyhuHgDKHblEDq2/CaZ5eNfuweTulaCb3ZP9PICOFR2j1PlmwKOlrZ8JbFKY1kXpAP9pmPwVlVt7jUpG1U7vljPqP2+B4Wq+WciI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957407; c=relaxed/simple;
	bh=CBbe2vkoiOw7V3EAxWKEV9fjs7z6XjSKGy4+UZu5Qxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DW5paXpfheEeDa/dAID0SMIleVMtngTxJPfmGez/MDOtgWvrUanGeiE4od0WsxcssVIN8PbV17ONvO0Ijg1D5aAwYpN01Ju+jHfvL0E11WM9DjzRMBMaL51cGgxnN7F4lLhxAyb7DU0AImlElNufE98THkxGZDlVmY+7P5uB5MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Esr0TM60; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kO29GeBU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Esr0TM60";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kO29GeBU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CAUvN1233139
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K4gwwlnQiATgJHV0AanCiCbhFa2no0RKiwLEYoKNKPQ=; b=Esr0TM60/fQLo0jJ
	un0tMClv2opoanRsJhR6Ygx9PwQ13WAslA3ghkMSGOb/RLokols5Xb0TQm/oKn/8
	na8T7GobwXSjGO2W1C8Ms8Ui8Xc7ikvkiYo0M6hzuow5bl0i0fRHrrGkNGvkipes
	cVBb3lk8GoRZeI1Byvsho6y+9HxeLSI2+HW13gFOT74qfomfRRKaz43vGOUh8Emg
	gYWJAaWXnEpw8fkWaE8rg87KJYFd0wnXsmWgxNLyZZ7S0HPC6RUM/aCzip/T5QH4
	NCSKotQ35g3booZ9BxwBLKEobi8labIiCRzvgKswwLjOoIFhyo7r2uuqBxDm+u8a
	8z77UQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk77vg2nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:36:45 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-77969cb40dcso75716137.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957404; x=1789562204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K4gwwlnQiATgJHV0AanCiCbhFa2no0RKiwLEYoKNKPQ=;
        b=kO29GeBU4w/6R4P8v8cTRZRgyHTJkmx3CVcjBdu1j6KNTZP21kPQLRDK7y1dHKxLzO
         uVxqeoFq67iD0qtA7YrnpJguyx0g6sGJ1B5rE7O3nTzYWi+d/iHKsbx9bnj7hH74Xxjc
         cbzOcgxFRgIiFYf4+bXm+WOOiLVw5i/FqkuIjJeNtwmahtJNHn2/S7o6B1GAcVcNsHC/
         qDqcEAEdoCP5DoTtBem4ENyoNQ1n2XAZK0rWCO2+4J/MUOQNI0+ZaDh9ZoW0VxFRF71I
         P49ZNTaVdDHRljnSP17dDT4COckXnIxDo3qBEGfVO1bUeplwGLAThtLCm50coFNR8f+O
         yCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957404; x=1789562204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K4gwwlnQiATgJHV0AanCiCbhFa2no0RKiwLEYoKNKPQ=;
        b=bThImoWqzyvrINrZGddCoqv6U9nE+YJuKcAh+oDcRAZygjnxOvWLfTKZUF8NDqejJt
         nFgPZXeH8fHlf+tDJqHgBFP7blDL9v84sVL948qimm3tif1Kh7gv97vpnvGYaWKEpnSy
         gnodqm/G88D2tPvKTepZMUW7a2zsWWhMVdUdoOyVSuRrDfTflHzzbMhzzNI20aD/tvvQ
         jmdamGXoJn8NMTPkUzgqmsMMaArfhC40RFhsQuItvo7otjRRNfKALegCXCwOmXrZPC9y
         m2d4Of/+mOots4D93siEwzhbkOUIoLLNRGjyFdtx0YSmMl/61Zdtt0MWwEmj9b/gbRCx
         xzag==
X-Forwarded-Encrypted: i=1; AKwUvBwa66AzXWBBZEHTgzglndcE2jsWyCO0PJ5Mi93YmbpvHEZLIhWtnhBm6kx8zQHYlMOA70vSzTUikyYlUjE=@vger.kernel.org
X-Gm-Message-State: AFuF++k7VWJIy7zxPrTP2S4pWsk/B81WTmLllx7B+rHMjK6GwR+BGKF0
	SihESgFiR1+YtRX/7E9sVl4Q2A1gSxsw2WgVjI2Rml0lV3ZHgy7B1e8iOAGjIznqlFgr1SxLbHo
	IkRwE7xSqmrYW/pPf1vmA7+ZkSvE1abr/tGrEPWqyQbmbzq86NQYODVnkMGD9h+bAqhaNj5iuGP
	U=
X-Gm-Gg: AYBFou0JoROhISunbmjSBUutPRoT274hSb07suCP0tOuBCJZKvw/0raasqRhyK1bHy6
	aBHUxmPM1HbwNUBi0o1NzhZ5C4bTE13cQ4vmNbgzi94NqENchZAvQXUvSOMKg9OKJtW9Urfbeiq
	Q5aiaQnmIU4gDKpKnI9sNyXqN8m3cLA0R52QfeEYARu2Ddr66vXQJWKYWFYnwjbEROFfVR7FSMW
	3NCy+mLgKDINRb/0DSKnXMCVMB1R3MGfvtzsl/eEPPZHr7QeIxpDrVje/jSTPr46BgQsSQHjcKA
	gDF1u7wxmlpz9k6OjFQ06Z8IGtp1cSiFNHqkk7b0vx18gXJWZZZ3mbFDUvUa/A2KRRED50IoMvy
	p9yfpJYEi2esn0wS5Eb4LDA==
X-Received: by 2002:a05:6102:91b:b0:786:c254:b7f6 with SMTP id ada2fe7eead31-78a6082a131mr3897224137.0.1788957404525;
        Wed, 09 Sep 2026 05:36:44 -0700 (PDT)
X-Received: by 2002:a05:6102:91b:b0:786:c254:b7f6 with SMTP id ada2fe7eead31-78a6082a131mr3897208137.0.1788957404067;
        Wed, 09 Sep 2026 05:36:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705cd8d5sm40923701fa.37.2026.09.09.05.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:36:43 -0700 (PDT)
Message-ID: <562fd574-a798-4b57-98fd-dc8e7c09f7f0@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:36:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] PCI: qcom: Implement shutdown() callback
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com>
 <20260909-shutdown-v6-3-62b7bd123236@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909-shutdown-v6-3-62b7bd123236@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6aa152dd cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=p_f2mebja45H0yVC8-4A:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BaOVCJ8nVWojm1Q_HM4woyP5efxqnfx_
X-Proofpoint-GUID: BaOVCJ8nVWojm1Q_HM4woyP5efxqnfx_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MCBTYWx0ZWRfX2OHL0g5kx0+r
 LgcHcS4CZSa9/jWiqN5CnQxPOSpwBz9nC79pQnuwP0m7kyx+G6CnBXhmPMdDgWzI+Y0AzsflW8O
 lhA2+dERL0qtPWGfkWSMQaEvWmxJjxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MCBTYWx0ZWRfX/sCY4eNzRftS
 jNGBn/oe8xxp93FZCEkwtkimMV2SO7gHgc5QUjN1kGOJn9GBPxPNMfU2dEVRXFdIGbDLnP4LRTp
 bdT0pRIEJxFDpNXqln7q3Akgwtq5w7WdoJR5oemClsBl/XqVQLAwZtcRxEm3cpV2dAsZ3yCGn4u
 pMuWKFQTR/NHJaEtXh9QIzhBJtBZiNYuni3wtZn7GbLUWE152ecHoGNqyNESdFP+uA1BF5PGFc7
 yqP+KSo7RNjfanVjM+4+tVNyTeQaGZx/pirKaZxmsnP5eYhVv7VqgxyWr2ImpSRrR2KEnfi5UhL
 w150Rs2OfGr1NVU6wWt0cG82S2nHkEZQlupZq85YHZRrF+0pGXwzPtcmkt+k0hU6ORTaFFSFSsd
 ffsTKfnU6dXbD9PuyzNy/OLAV4UbpD5gRX5rjmCfOzsXwtyni+tVBrhoAlDd5tDWAP+SfaBZwdj
 lASDe793psm6Zjb9HaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090140

On 9/9/26 2:24 PM, Krishna Chaitanya Chundru wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> PCIe host controllers should bring the link down cleanly before system
> shutdown/reboot proceeds to remove power/clocks from the controller.
> Without this, the link may still be up and endpoints still have
> transactions in flight when power/clocks are cut, which can trip SMMU
> translation faults or NoC protocol errors.
> 
> Reuse dw_pcie_suspend_noirq() in the shutdown path to force the link
> into L2, putting it into D3cold.
> 
> device_shutdown() runs with interrupts enabled, unlike suspend_noirq().
> Mask the chained MSI IRQ(s) and the Global IRQ before tearing down the
> link and clocks/PHY, since a late/spurious interrupt could otherwise
> reach a handler that touches now-unclocked PARF/DBI registers.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

> +static void qcom_pcie_shutdown(struct platform_device *pdev)
> +{
> +	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(&pdev->dev);
> +	struct qcom_pcie *pcie;
> +	struct dw_pcie *pci;
> +
> +	if (pcie_cfg && pcie_cfg->firmware_managed) {
> +		/*
> +		 * Firmware owns the link teardown and clock/PHY shutdown in
> +		 * this mode; Linux only owns the chained MSI IRQ(s), which
> +		 * still need to be masked off before shutdown proceeds.
> +		 */
> +		pci = platform_get_drvdata(pdev);
> +	} else {
> +		pcie = platform_get_drvdata(pdev);

This is no less than an intriguing choice.. please store the same
element in both cases so we don't have to do this

> +		pci = pcie->pci;
> +
> +		if (pcie->global_irq)
> +			disable_irq(pcie->global_irq);

This changed the ordering of disabling things versus the previous
revision, although I don't think it should matter given this
IRQ currently only services the linkdown event


Konrad
