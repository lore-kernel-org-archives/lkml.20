Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3B75616D3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957616; cv=none; b=q8zF8M4Z7I3tY4hynbKGReQ9ZYbGkCnHUmkWCMf95NmYLPHlx15CGE9F6qEaCirpUBdrlN7JTqdUJZ9ji/DxLMW/r51uJQ2Ch5ieGAx+rqKHgcZ7emg6zwgx7w5zaRQPX3294HC+G3W4Ke4gN4vZh4b3ZMnVRVf0Z/fZEcecFrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957616; c=relaxed/simple;
	bh=YpCHSUgFsjAgRcrIEVDbWdnvlC2gcwyfmx27eH4VmGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dg8PZ+01vELpfK3pfRtRUi9z51NZ9fAw/7m04gKpajOT2T/jPdn+kve+vVPFp5eUhSZBxmnY84bv03pqOQvTuozE4VWvNkVIjVjmno6Dl9IdSTZrsC49vpAVhknujFmgey8A+Idkquhgm/eXlmMDuTqn5zzOkO/7MkUDL+gjcpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NPBmY25q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYNfkQ3G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NPBmY25q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYNfkQ3G"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU5fN2019247
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sJowskWp33T+oKp/4P5mw9Ucu72byhvA7Sw0lNZrfKs=; b=NPBmY25q0huKVN2r
	6l7jzCcfVf6Qy5Tp/yHN86dwA3gbyKxId1U+D7aYeNdhmbocxhiKPwuhggxzlJhM
	o0JoYJ3TKfkhmrSPMUTFEX5vdhsz89Fkg7SiNo9K+Rb4ChUjpDjo+h1iHZj2OiKv
	mauofkOy5O1WHrzdVNvkMqRokg6stJHZiIU6C51k3e/m9XUWsFuZI8zf0MDPdWX2
	ZgWaz8byARBf2wzhc81GaxVgdYPcVTJcSnPN/fvTa/FiznKE4nS7vg7XxCcYYDwN
	EgpGqz3l2PpGikGzbB5tAiC2E+FOzyvI2mf5DlBuM6AdiyYG7YAjZLUEcT7Eqt57
	vFDNeQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x8c2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:40:08 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1a3f01d2aso7468591eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957607; x=1789562407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJowskWp33T+oKp/4P5mw9Ucu72byhvA7Sw0lNZrfKs=;
        b=KYNfkQ3GoLgqNpi03SzLZ2+vxaUl/+g6F8hmPZbRoEEuf0/pOMHcazexHn988VJMDi
         yjbvasLKGWDYxTi3Li1OCPLaaAoJKR3hWUrbXeIKYFj2pejEdZuni9e/SSOfpbP45tK3
         yyo06i75fiUzn3F5CMr1EmCQtgk5euTNK/RtsLh3GgJCoU8ZtH0g83lNh4tFv+Ukh578
         x/aVm0Vl0YDyOyjLHTM4VCNC9FXfvB96RhN1WzSavPTXL4onqabAnB3s3WvgIy8UeznA
         gpV+fseEHt5+32HLKqRPc/A2Eri8b0uZVv/fxwOlI5RB09scnE7U3mU6aHAFrEDPqCRe
         M2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957607; x=1789562407;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJowskWp33T+oKp/4P5mw9Ucu72byhvA7Sw0lNZrfKs=;
        b=F6Zw25llm15xoxTeJuUP6XY49EildRGWvjJsuVxdAyG3HbgwtTu2UDAKFsSHmnowJj
         R/W+nlzA8LvOMSUPugJZ2BuYZkeB5sJ4chLybSyZdFVbeGfkzLuqESSLcjMBUqNTXhXC
         75U+KfXzlWKYnu29t9W8FloLiwgryu4WQhA/i144erY3CqFPwfAYlQZOgvUigMSxN2BH
         +mVUqT7tiL8sMEMDMCNztkf2pTTZVa4Q0MaPvjpjk+EPTPbt7c4nPsankE94g/+a09W/
         PjQxwdqp9MKW2WNWV2inkHUkgPk/gKMPk4Z1TWrbW9bML8uQJZRmDrUbj0mspOzf9vmq
         UEjA==
X-Forwarded-Encrypted: i=1; AKwUvBy2PH2CYiqH4oeKcyde0s/desIKdeqSnA2SVXoQD1U6OlnYEetEdv7k+i44WOtyu+/c/rQ0p9NEXW/+xg8=@vger.kernel.org
X-Gm-Message-State: AFuF++lwWsA9wLmdizlasCCoHcsNIR23GXDYLFUkGMeZxQvDQwfkkxdK
	JRB7Z7O0ywMmcHCr9r44pxaWvlLkFaTMtc9TzlVrzFl6w0vX9ZBinmc8Qk7NO5/kvml3NUBbOeQ
	xEUwaosFrmdp2Gzgn6Wo/SAREWhGL0yBJni1F8iQwWjfUVkvWRel6um1yMRhvj+Qsle0=
X-Gm-Gg: AYBFou22YcczQkgbiUM7/LjbxeTad6zJGWhC0v9Owk/EhqkkDWmH/1kExe4m0Dw52Mm
	G+uMzjjVzqXuX17blP6TOibv823P/+SpxYbvb5e8rBzb21cu/Ryz7ULKFzpIOUN9szAjLfzS24H
	5VlynOOcnL2ChruJWcDKd+Vx9J6CSZdl/3ApSCp+/aqy8/1EXXsAUUCBKkVVJFclEdl/IhX8GDM
	HpM3t0dhPco0JUXP3Wt0J3k8mPFoUfKUN4rZ/cNyJqPLJIqUIrg3XfT6V90kd9bJzWRhuPqMrbU
	b1VtDfiYbssK4YKYMOQJqysyTzd7d2h/uuNqMjdx6h5aTAhItnMmTFO/bTbE5VqykY+cMQxIfe5
	Ddus2Y9l9wtrXIoftuW6zRqb+2wNFGOan
X-Received: by 2002:a05:6820:160b:b0:6bd:c2a1:3c48 with SMTP id 006d021491bc7-6bdc2a13d0cmr3379223eaf.8.1788957607266;
        Wed, 09 Sep 2026 05:40:07 -0700 (PDT)
X-Received: by 2002:a05:6820:160b:b0:6bd:c2a1:3c48 with SMTP id 006d021491bc7-6bdc2a13d0cmr3379177eaf.8.1788957606735;
        Wed, 09 Sep 2026 05:40:06 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-475543fcaa9sm13915069fac.7.2026.09.09.05.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:40:06 -0700 (PDT)
Message-ID: <468f4ca4-e52e-48b3-bd60-20cadf7f311e@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 18:10:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] PCI: qcom: Implement shutdown() callback
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com>
 <20260909-shutdown-v6-3-62b7bd123236@oss.qualcomm.com>
 <562fd574-a798-4b57-98fd-dc8e7c09f7f0@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <562fd574-a798-4b57-98fd-dc8e7c09f7f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MCBTYWx0ZWRfX3qYKIQLhrFyv
 AK46Y7ycygqrJ/136plu7hSTCVmgbKfrUBlYlCeTz/3XPJmijKzjagRtbKI3KdaxHRHXaniz2jt
 XzVSdAgmsGN5W00rVSxwlrbpeIIzdRQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MCBTYWx0ZWRfX2l7dm1RdESMK
 NctzD+8xhJzYVXEyhEYLeFEPnrwstH7CdW/LEpjwm8HBzRF/xodSVaBHUfuxikoaa3MHLXXVu04
 ZFH2nUGtvxzJ6gL4uLex0OxLfP3An6YQal6sqEXgG41GCsbv9KZmEGJzRujsG1eYmoENElwupoA
 s2RVfyu+LZpQ01D0RAAK61UTATFhVmbU7l6aJP3cO3IK/z0ZnHsPiFzips4li0jdoI2N39d8EO1
 Cy58yU5C56hMG15hLnAqtxin5LWh+PRXupJajf+ioueJ8J+dfk5cTQIqehcY9dfdMgPT20nZWVi
 ZaNY5Tg4+AZGSpImMuRQEg/vdzwyo98eZ7ExXUTs1PX7z+IAzsicoZhA2BgJixGmSTgM4YGsYmd
 ZSWUxr3VMgK5Gyz5mwTc5yoZ7AlXfTnE/NjaUKYdgE3u9XTviBzZVl5UEDyTHs/h2cvPhG/yiRg
 SZ6D13UpjD2NaKgngtw==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa153a9 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=b7byPlHVSWyC_7YdcAYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Rvfl3GzXHN7KrTom0DmvHVkHX094F2FP
X-Proofpoint-GUID: Rvfl3GzXHN7KrTom0DmvHVkHX094F2FP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090140



On 9/9/2026 6:06 PM, Konrad Dybcio wrote:
> On 9/9/26 2:24 PM, Krishna Chaitanya Chundru wrote:
>> From: Manivannan Sadhasivam <mani@kernel.org>
>>
>> PCIe host controllers should bring the link down cleanly before system
>> shutdown/reboot proceeds to remove power/clocks from the controller.
>> Without this, the link may still be up and endpoints still have
>> transactions in flight when power/clocks are cut, which can trip SMMU
>> translation faults or NoC protocol errors.
>>
>> Reuse dw_pcie_suspend_noirq() in the shutdown path to force the link
>> into L2, putting it into D3cold.
>>
>> device_shutdown() runs with interrupts enabled, unlike suspend_noirq().
>> Mask the chained MSI IRQ(s) and the Global IRQ before tearing down the
>> link and clocks/PHY, since a late/spurious interrupt could otherwise
>> reach a handler that touches now-unclocked PARF/DBI registers.
>>
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
> [...]
>
>> +static void qcom_pcie_shutdown(struct platform_device *pdev)
>> +{
>> +	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(&pdev->dev);
>> +	struct qcom_pcie *pcie;
>> +	struct dw_pcie *pci;
>> +
>> +	if (pcie_cfg && pcie_cfg->firmware_managed) {
>> +		/*
>> +		 * Firmware owns the link teardown and clock/PHY shutdown in
>> +		 * this mode; Linux only owns the chained MSI IRQ(s), which
>> +		 * still need to be masked off before shutdown proceeds.
>> +		 */
>> +		pci = platform_get_drvdata(pdev);
>> +	} else {
>> +		pcie = platform_get_drvdata(pdev);
> This is no less than an intriguing choice.. please store the same
> element in both cases so we don't have to do this
for firmware_managed solutions struct qcom_pcie *pcie is not being
used/allocated at all. it will waste of memory if we allocate memory for just
this use case. - Krishna Chaitanya.
>> +		pci = pcie->pci;
>> +
>> +		if (pcie->global_irq)
>> +			disable_irq(pcie->global_irq);
> This changed the ordering of disabling things versus the previous
> revision, although I don't think it should matter given this
> IRQ currently only services the linkdown event
>
>
> Konrad

