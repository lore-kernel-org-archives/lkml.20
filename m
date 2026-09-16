Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84EC3314C4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570162; cv=none; b=l78A9H5gPwh8HOFpLo+bDzFNbNYTZdADgORlHKZ5QJbWA0nkPe2cxRLXdYj3/WiwQ/2891gwnuTE5piy/D5OEKJm87pgN3xk4ki+kHCD+t+sAwSwiNjBfLFfDc/YHYyPvTjiqqT5JArb9GNdcEfoCziM9arDxzp3bMkzGt+acC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570162; c=relaxed/simple;
	bh=ND+1deEgYvcG+3y/HizuVxmy9BVpV6lq4ejnNITcrPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hr69/cSPUG8f0muvPwP/w0JY8nQUAkqUh6l7ibq1xoEehdPBnrtuGB/Uo5Kwm6IoaG7UMIa3S0p10dAuYMPNznIE8ZQnXwikhEdrS1Hv+K8Ppkyts1YJnSo8R0ETCgKFhJH1vpwCfkOnYw7HRFof4N6NzwibINW8uiSEoKZThSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2CHnqjg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXand/Q/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2CHnqjg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bXand/Q/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEZLg63213345
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eVgsS+87a5iYDHDygC1JoIvqJU8Cv/bwBlYzt+34NeM=; b=V2CHnqjgat6GNaGW
	PUiSEBlK9OoycpqiH+iMn2DtXGeysLP8DOfPagpjh3clUXFrf2P3DQenl7zPA7n+
	/hK2pcewtQH2lpSn4Jf9TPttzNfyTvr3dFaLY0jC1bh87cDIXHaWFk8IcqugaQ6j
	QGKfpKex3zeYRKsgZH+jjQ7ZfXuNKX4oNh0V4uy/RHIFYJggz55ei6QGumBuuaNs
	e7XUHauS2GaFjIRfE824O63zI4dqe7wj6AP6wnw3UkJiNm+Ovl/uxC9G9SKVvG+W
	3X1WGWuD01rHOMxdjKs+RxU/bJ5FSeeEvQSokZvPvDBX78rBeQxkVGwLITp71YqF
	hNJOEA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcktx17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:49:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso7457422a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789570159; x=1790174959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVgsS+87a5iYDHDygC1JoIvqJU8Cv/bwBlYzt+34NeM=;
        b=bXand/Q/lN5QFT/rcD5qMfpZnm2Vt3egsHYAtMuY5PQcOITeQuXBqc3sMQ7e3HJhVx
         PhywfBeC3/hZS9PNdnbB0v9sKXtANr77FdF8EoliJTut9V8sptejPZCDXpdL604nSH/e
         hIWVri+fXHlq4ZttBVe28u/qsJlPpVBas9QpWyEl2ur5G37iltviqA+SC6xZCBF8fIba
         3SzVO2Rhmmatf2x96GuyeNYLagRNkPEBZoYVWLeO9rAdTG2M5MMlJAqJWpiaHbnGZXYN
         oeHDC2TuQXMHc48eHWPYb5DjFEfFwYOIe4XNVjwW0y8C2J7mO4/yrJhT5RicKf/bV9mi
         gAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570159; x=1790174959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVgsS+87a5iYDHDygC1JoIvqJU8Cv/bwBlYzt+34NeM=;
        b=paD1okST11XZX1QYbgpqGkKK+oIazZ89SRqvrk0kgQ1hn0JE+M2sb46Nf2r0dD1STt
         qs55yaw8wRTkoRJ4VZIhUibLKXtgYJhaTt1XqDbAexBGsK/tFRlqsntzzjaFRUM26bPv
         i74hT4vy+BnPdZxleyfbT0B54l//zzJkYe2vUCDidUHQ0yqP6pjkRg0b0e4BoRTJ5rvg
         6c2l78RBth2EDclhIlSr4XCv5Mqm+8Frv5ownr6VlBvQ5Su7ocuPtGosen/yiegDCi3P
         O347G9Y50+LcGX+a0s9/D1hGcNzST4Ek+6nhg2C4UbwPguISSL0+ScP2D70J9J0dUjzL
         +0Ug==
X-Forwarded-Encrypted: i=1; AKwUvBx7EExbl+ObrBjQ12f5Xyb6cWM8ME+DMPfoYFwd+4jjgKvKgbjN98WaXpgG+PG1V02OzVIymGxey8O1Vq0=@vger.kernel.org
X-Gm-Message-State: AFuF++njZR8VC1Sxf3Gxk4rxk0UNHrXnSW0VXPk3vq/+46GZyWMuApR5
	8dfekUsAzWncs84Noy7XRU9Yl/ZcyBaKo+g+5+sQuROkuZaZyvuuKPuewsAUtisAW3mGtu1YYGL
	GPzxvwIOBrkMRwAbHcHXxgIoMHrwcnJDMPuqAlm35OtntEQjzVY5Ai5LyVJbY1xDxH4w=
X-Gm-Gg: AYBFou1QFyAdjSiLZlJwZTXBUf/jmq/0ZMKYZBonJYwFAwJ+Azkq8x1nNM0iaCsuW3e
	pEqZiyHXaTr8h7pgJHl/UaVoQeXAwuZkXQ9ahDBO2xJ2uoT5k49WtDPLfuN9S5A9lelu378vRol
	3hLZfrJtJ7RhgLc07jCBT5Ctj3lbIE8X5t1qfW/qSpIAoOTjMNWH4g2kP0ED0RWrnSSoIy0mcdE
	5iCb6JCHBgZjNtGIDD+V041ur8br8wHDn+G+yYzNypE64QpLag6RrwGttJ7eG/AMUh0XMPSGEx/
	AaaoG1Q3AUNlWVjaRfP4ZLTfyfZP2AcLt+sh4OFxr7ffEGV2412vsUkH65X9nuQvcgAlT//VySt
	7EzvPXi/PLZRs2/rtOePIVP8kz8xPYHbYXFAgTwy9
X-Received: by 2002:a17:90b:2885:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39e1e502f25mr6913678a91.21.1789570158607;
        Wed, 16 Sep 2026 07:49:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2885:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39e1e502f25mr6913598a91.21.1789570158156;
        Wed, 16 Sep 2026 07:49:18 -0700 (PDT)
Received: from [10.216.41.130] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbfdd49sm5493700a91.11.2026.09.16.07.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:49:17 -0700 (PDT)
Message-ID: <6f5d5266-75b4-4f65-a19e-8fc27ca9d3ef@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 20:19:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: glymur-qcb: Enable UFS
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-4-b9fc5e2ee99a@oss.qualcomm.com>
 <c3bc5b6c-f929-4576-9d7a-d5fb9cc80aef@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <c3bc5b6c-f929-4576-9d7a-d5fb9cc80aef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwMSBTYWx0ZWRfXxq17jQqZ7xNq
 cgA/JNK3LVat4gDfPdcZdrzkTpn7bfU7mMkPNkIm6DnGP+IAmu2mZeVaAo6R9CCj81Cu+S2hhiY
 YomM8CVeJwgGS4sVBWAbAyfyxhkHOLs=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaaac6f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Z03_-bexLPcab5i0-bQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: AyYfWV-MsdQShFaXut9oCvsL0zfwRMB4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwMSBTYWx0ZWRfX6wwAXTbDLqOf
 kkp/iH8cSSQVprYX7cbpISYgNQ2KRz1WaW+Ilmn7OJnWkdrbS+y/1ppnBd9ooh2ohHCLwfDIY3/
 8aUQe8EMHHLpPIFu8Tus0iNPqTeJPSbkUWPPAcnLuD9hAVorIixpp9GSgfpVuRJzw9gMlwoBX4B
 SSzoEd3qYVULixKI2Tm6vdBgj/fQPy5mxb7Xm7k/OQQcXSeNson1ZICCRTQ9kX8jvDDnsIl1/PL
 iQQkKos/pIdxb53hp0E4893ETWp1C1dl563uiZA2SfVdtQVWuZ9ledo8YvJOKDFlZJs28kjnDUD
 pxAXQ1HX8mqrdUCTdah1Nxoact+jGfNj+5OnXmAtj6ixUb4ubxAmNU51ZIIj3bw+/g05OrQMjpw
 fKjWopTaacspiPfT77a2Xlf1Ipjyrq5GeIQHJt7VhABeLOuUyLp+okLOwKl1twJcYaSbds1TBTV
 STJDYjkAz6liC9BwK4g==
X-Proofpoint-GUID: AyYfWV-MsdQShFaXut9oCvsL0zfwRMB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160201



On 9/14/2026 2:44 PM, Konrad Dybcio wrote:
> On 9/11/26 6:47 PM, Pradeep P V K wrote:
>> Enable UFS for glymur-qcb board.
>>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/glymur-qcb.dts | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
>> index 17d8ff3aed23..b6e384024dff 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
>> +++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
>> @@ -697,3 +697,21 @@ bluetooth {
>>   		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
>>   	};
>>   };
>> +
>> +&ufs_mem_phy {
>> +	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
>> +	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&ufs_mem_hc {
> 
> Please keep the label references sorted alphabetically
sure, i will sort it in my next patchset.>
> Konrad
> 
>> +	reset-gpios = <&tlmm 250 GPIO_ACTIVE_LOW>;
>> +
>> +	vcc-supply = <&vreg_l17b_e0_2p4>;
>> +	vcc-max-microamp = <1200000>;
>> +	vccq-supply = <&vreg_l12b_e0_1p14>;
>> +	vccq-max-microamp = <1200000>;
>> +
>> +	status = "okay";
>> +};
>>

