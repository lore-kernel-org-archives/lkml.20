Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFCD492E4C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372826; cv=none; b=i3y5rqzkH0ME2Sby+DBnb308+qPTEK1frUlIbZTHCEsOHZ5Gv3WVESZ1N7U8FPMplx2Hi/0dD0iqGPQEnQ6rzFowNuK8sBEV/GvRgKO2UrkMk05UsiL/yVT+wwW9xR0tLiI9PibSr9vLruDICKC8zONRWO3/m17FduL2nd5PL/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372826; c=relaxed/simple;
	bh=dJRew0RCqMZrsYX/336mtM66FOjge+oEkiH4dzIm7gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwD8HoeV1Cu+v8wIIVivzOK6ek4RmJehXm3g0f4JGjTHj+CdpBzGZUiqbQLdCpim5Wfp0uJoRVNbH1gMdggwh4drEN5a0HQzfXT//9n152SXbPB7Ctx+O/RAGPhjHM0ayjg2PPfGHbE6d0Tb1Lxaor6B61/F4PTSBFAoUC4MNtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIPME/+y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4QBIZQ+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIPME/+y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4QBIZQ+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV8sw3821198
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 11:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rnRfrie7kW8dU2T1uAcEvLq8NNMvKQJZG3o5AFfDelU=; b=bIPME/+yaFa5Wgzk
	TUcNEiMvX+kYVG1Ym02c7L5TxxWdyXt6yXweG3dSfvGbt360GtTNOoFu6Y1UJc5B
	co4tADcrkp6gJAf0d2Yo7u6nVm0uXNGYeE1rn22g9IGpq3rUD/aDAJhnQuIoDU4G
	s6dJDANvoLDtJBJtx2eSmCWQDl1onJlMlCkN7IKhzP+t6g9osbAAhB3/a0O2og4b
	2bdgXQkd09fsLdlhHkP1b+9YT7Jecqxk/s3oiE/24jzh6zNs4gvk2bNznFd0u/qj
	uiKvVDXciTyJ4BcjJMCZG6QFDUYD28MktAf/VNWvtUGrJOyGvGy/uUt2kCKW2lOr
	FrGptw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623tcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:33:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88cd731cf24so2956712b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791372794; x=1791977594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnRfrie7kW8dU2T1uAcEvLq8NNMvKQJZG3o5AFfDelU=;
        b=J4QBIZQ+2Lt4hRxL05gK0bsu9/XFTaDz0ofeY6t/0u0EeI57xUPwYT0SmZMN5OOYMx
         /8gcTZFPRqUOep8HnxeTzA+VjxyuGSdxm7Gtv3pTpomJHJACyA70YHfx/Tcgu+hCUXW+
         b1Q86qigjCUeBRDzX8XiOYLYgcFhTZ1t9vi+lL2m1p8LISopOC+adCpcrMMPkfTzjesL
         gDTg1yyTDOR9cg5RCLfQ+nKSgrELxHCoPdL+afd0Oq8FcT/6BIQPk9SGJ2LAWPizAY/k
         9doJ3C3V9mXSOBcuWvxaQuDdrH3z6pimbzqIA4JmsEqPxX/HVQQo6TTfdNKvRTbKLeSf
         0eGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372794; x=1791977594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnRfrie7kW8dU2T1uAcEvLq8NNMvKQJZG3o5AFfDelU=;
        b=ZKQ+qy+LLGyMlMhn7Mw2iDf0i/T7KbNgkn/s9HOv6cvifNquCx/HAkSuruNDlDptyK
         Vfn09purzrpawb8aiJGG2wuWudNGirAcMxVWUoymXXxU66JbTceLW7qHMbcgWegHHJHJ
         j6sDI7VruUTYu57hVWtqylWrV4OKDjBhCnayEAtpy/5AedHBZKzx0DVo1HlAyKZoeXHj
         dEW+/c+IH5ESw24xGE+H52zvdmFctE4b9u86O9i4quOhiOkqd85/m+NnhHjOKlGpWtO9
         CaO/jDyQxyJaIgB2sprfkGrxSBKWFLjzGDi+H3G0zQBbYWMw4M53raaOsMj4WJQ5wMA6
         lzAQ==
X-Forwarded-Encrypted: i=1; AKwUvByH1NeG6Y3VccVZDUjOF+aQtm4c5aKvA9OWC5mo2B502/MypE3wKL0DKWN5ur7/qE7dVHFbmfLN4QsYnRM=@vger.kernel.org
X-Gm-Message-State: AFuF++m4GnQ3I4JgjlMoUNBnF3T9FidDuuZEh/CBH+iQHciUOdlnCWny
	HTJtrEudKRcoHlSEpEdbAN7EdlsTjo61mtmSLXBJE2NSS5TQAOYcv32fvQJhNafk85kSaWlqk+7
	OpjIqibYR5Ltq3dNa3neu0Ul595y8B6WaAd4vTMkgREkuvCI97CLSpi1YLP280qgwMpU=
X-Gm-Gg: AYBFou21ckMfPaNjADoGS9Ucd6GJDZ25fCyv5tSLqgSXEqka4EQ9d3Yoo3uFO7fUaty
	ifGkVn9m4/l4GfJyqUW/9FDzIUZKF/9wnP6ROHgFZD6OYp3qXN+h0PSO74mvOHlXTs7eCHh9aGZ
	clVw07WlpIa2dcvTKgyRKXZ9TwgZHCv7kAjpid8PaFKXT3qVxYrugwWm4vIqHysLOV56+smoeV5
	ywkwsp83b+c4vmDNBlyguWl7vHoC+qEJiRFy48paz+uo3K7QGwcT/aa2NhXFolijMPy2GHAK6vF
	ADSkGv9hNrjqvUrSCw0be6IglIeBeN/1iSbbZMqRo6hHBIL0hIqn5xEGgofpgxKusJRP4SKxgxg
	k+G8m7m6RS28WmHhsfUr7otjMakr0tlmwKgvbSw==
X-Received: by 2002:a05:6a00:2188:b0:882:6d80:e5ad with SMTP id d2e1a72fcca58-891b0c83960mr1586039b3a.9.1791372793127;
        Wed, 07 Oct 2026 04:33:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:2188:b0:882:6d80:e5ad with SMTP id d2e1a72fcca58-891b0c83960mr1586011b3a.9.1791372792597;
        Wed, 07 Oct 2026 04:33:12 -0700 (PDT)
Received: from [10.218.41.37] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188914299sm1203497b3a.15.2026.10.07.04.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 04:33:12 -0700 (PDT)
Message-ID: <f9c7bd4a-2e97-43e1-a9bf-295b841ef0a3@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 17:03:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] phy: qcom-qmp-ufs: Add Glymur support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-5-84cf4f861415@oss.qualcomm.com>
 <zovl7lrhlleflaewk32o4wofr4bzm2bmkdnakev47peijrnkfe@p3ixrxltdpcm>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <zovl7lrhlleflaewk32o4wofr4bzm2bmkdnakev47peijrnkfe@p3ixrxltdpcm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GG6kVyhyOUdGBKUYK6wVWY7JUeqYGyyu
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac62dfa cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FIX8ga0CBHvb0ZQaSzQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfXzVEwUaLSXRWp
 luVdydhIQLOpfNbvvkZeLuaGq1E16y4WUyyzSAfIP/EkX7+11w9TjtWFO6XRXcQdfbch5Dsin67
 4K+Dkx8eJPomrs0Jz8EHwOKwDZkgFGI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfXxazML6ypSoQG
 pC5U9VK893cdsAg6e4+3V7fseChkdMDNd8iIDc4yvJHP+cwUNjX+feyQ5cv9zp+yJPeKy6EHE5w
 WThwY0RwQvwzg6Ve4JQhF15yHdxg+pqlDX8nUfS0Dj/bxWMCV3BdAORijEVCAqBn26F4hEiJs05
 jIu/hNI4MMf4T7RGJB+vdFqwY+miN+BisrBF4tI6ca1vPOQk0HPgeAfQIkXEfg5hroPgy6NBSyI
 Ho/Byqq9Ymo21U490Q+qAcWR5xJe6BjdGSCNMmcGgbuAVLOGTNzQe9A3zcmDMC7kgDDEJFme0Ml
 Ir2uiQcZTYeQUIfhhVdvRQdSYMF5CkVtfMbxBMNO/45gYrhfNCV0g+CUexrEIpKprYizgwTSR+s
 I2xZtJ2Xs+RXldr5J3B83wqubXBVml6HXf5DbERVFq2WxazXZ/ksus8vruFdrAesoSc0k5hpkZ1
 gMU7geGEyTM0U3OB3Gw==
X-Proofpoint-ORIG-GUID: GG6kVyhyOUdGBKUYK6wVWY7JUeqYGyyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070045



On 10/7/2026 1:18 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 07, 2026 at 11:59:38AM +0530, Pradeep P V K wrote:
>> Add the init sequence tables and config for the UFS QMP phy found in
>> the Glymur SoC.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 99 +++++++++++++++++++++++++++++++++
>>  1 file changed, 99 insertions(+)
>>
>> +	.offsets		= &qmp_ufs_offsets_v6,
> 
> So, is it a PHY using v6 offsets, but v7 registers inside?
> 
The QSERDES RX0 register offsets on Glymur SoC are aligned with the v7 register layout offsets.
Therefore, the v7 QSERDES RX0 register offsets are used for Glymur (similar to SM8750).

>> +	.max_supported_gear	= UFS_HS_G5,
>> +
>> +	.vreg_list		= glymur_ufsphy_vreg_l,
>> +	.num_vregs		= ARRAY_SIZE(glymur_ufsphy_vreg_l),
>> +	.regs			= ufsphy_v6_regs_layout,
> 
> v7
> 
>> +};
>> +
>>  static const struct qmp_phy_cfg milos_ufsphy_cfg = {
>>  	.lanes			= 2,
>>  
> 

