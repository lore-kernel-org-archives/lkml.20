Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D3A4825C1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158709; cv=none; b=Prr8qkUKv/+eI+NsZy54gATdK6BdV96KgK1E19wSt8W2YYMWbwPwBDzFHeOvoxQ54i/4nb8S274FN44FJSaS1l3hK3RZqcHQJoba3XAypoBLXhKk9DHXWVRlBM5Z7MfwnzWqEvpQWhiwTvDCBdzFcsd85RvxXXAE0ecL3iVDiec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158709; c=relaxed/simple;
	bh=U28DVFU357LkJoiafayvKcqMbcLV9ZAPhADRG51qCAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HzwEqwhK+O/Fq0assPoRHo4EhMC9zvaeOAuYw+35po/HZWHgMhLcS5wybyN84qrtl26DrOypWJXWd1wrn1+Ar7Qe+6/UI8UO25JdnTR2xZectHQPRrP9QtTkZN7blcLZSlsv9X8r49JSZFNxAIxDg/Wn2rgLWnyuUp3GaqIijEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nh+FiLXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SK7vaaMz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nh+FiLXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SK7vaaMz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2gC22429446
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZdMQErsMoZLbknktARtbpxGeoP2NWqi+elqKiSGB658=; b=Nh+FiLXs6FR41Ayi
	7Tu44a4M8Qw6KFvvGUtrajB4Qn0m75ToNai1stP56mKuVbC1iih/RquBW8aUglYD
	gJbbvvCY9GVOt96zIS7csnc1ARWlg3UDJw1GrKOO3dR0EX6R8rMvLbNTyBg/+jZc
	8eyYY4z+Rl31mxVC+qulvdMEo5c1+lpqmtD86TIRL37j2Je21Z3jCuqOo6exH1hR
	r7n3XKA/DCNyZn6VJr/6/dsiTDGrZcVj3AnzDkeNd3PgLqzINc0gwKST1SdVkJnw
	MZQMNvb2m7TMGgfVsneWA/744Xl+TFD5gKgJLRmRf75fJ797pSctNNe4UwQeXNN/
	x1VHKQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqh11c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:18:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so1097252eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790158704; x=1790763504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZdMQErsMoZLbknktARtbpxGeoP2NWqi+elqKiSGB658=;
        b=SK7vaaMzN75MYoAu9q5OkF/r9sVkvkr8rXlFHFTJumdxuoQr+anUHDf/NyXXJsp4nr
         TOIZStzqDtwyKyFE63aMSL/k768WvtCxlpOI0B4iRV/bW3xsD+I7ATBkyejp7jlf7bxn
         bS2Y65d+/O99EJx3NFR48IrkNZr4oSqOvNplSz2HCiRMPSC9a18CNjWEYRnJj/UfmpDo
         /af2gnlc6o/MrVU8OB4TBqhZ2bdpgeOkD7STTt2xsJI2F3MRmBRBzNF4wOAbF4ohcLCL
         0w3voEJojJmq/dyA3hEs7Xc3tgA+YgFye6pzjpsX840PqS5eHb2eWHkub6ycc10oQqSg
         CY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158704; x=1790763504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZdMQErsMoZLbknktARtbpxGeoP2NWqi+elqKiSGB658=;
        b=ZdR9CWFVvBCS0T+/NWaGvKkFxrMhwxEY0FhlUYRyuogmgEmB2zT8ZeDHU4BilrkHP/
         AvPUXvXPqhPUEGCG3orFuZICgnN7ZFNGFP0lT1nC/IZxYi6ZyxdLfyXmC9p+notblqcB
         DQ4p55hMzuJbylPsOQ/u+1pGgNBFkJxGm7E6hIOS0UqeAoUS0yzo6Y40yDh18krBH6El
         vp+z0ooHpMMZJqSFIXMWKs5II+RWh84dCOtnATBwpyGuHAb7LtKJk3CAkGhQL6Zd1LpJ
         o+ErjSRdcYs7tQY+zgSihgeOawXA8XCZRJZqPO1F0RmZwTGa43GWqegkabxBtT1kcS9D
         qDNg==
X-Forwarded-Encrypted: i=1; AKwUvBx4HcyyKkkAllnQBSInBkWzuN+H7UDatcdcahTjTOOZOJd8J8r1iPIkTbhhlBFIX84DGv42PNA+Smnqfp0=@vger.kernel.org
X-Gm-Message-State: AFuF++kDGuCqaAnq/cAL7HSI8W5UYfOjTCD/pT2aRwE1d0kNLbznpzVL
	dHN9wMQV1wPQu0LBc1sb2KjbYhrEZyRaGYz29XcfMBxDai10ijYvLrtWmFJ9VREZbcXUw0HLvOd
	grDg2wDuex/8U5SHjO2LOOa3G1qvCuPN1n0gE3QAE4PhOF6LcB88/mm11O6At/DTtrdY=
X-Gm-Gg: AYBFou0zlDM68zHatS3QlAObMxS4yjJrw9ZC/CRkswyPNSK82aXwifTCW3bdScvmUuY
	c8WXbMQLnt/MmIwDpoirnCmI1pC4wiRrVW5wWzuZSjIxYlsWfLu6vVmBG7EAi4NaAvRJHg3IF+J
	vpkgnr7H5snroCTAyD5FCdXew2UGqdKlX2Pdp8WAllEInJjDEtVPmPv0HHA0ukZvdZFvKJLVHYj
	FAJ/Im3IT58aAzYuHMIRmrVFXKHNdvNSfHBPkNbgpibtUDllyloQI49SovMIPfZuG7jS6fybHJi
	66GatSjHyBEK40bRs4Rk5Nn2/gQmUiqk1ew1B/8m4oacFb2ARZNPMLcGsWvpg3OS7+i3GYTxT2Y
	PVR2SL9LhCBkmNfGaorVfGkPxF9TJ
X-Received: by 2002:a05:693c:801c:b0:33b:ef1f:14b9 with SMTP id 5a478bee46e88-33e8c250524mr2546670eec.15.1790158703506;
        Wed, 23 Sep 2026 03:18:23 -0700 (PDT)
X-Received: by 2002:a05:693c:801c:b0:33b:ef1f:14b9 with SMTP id 5a478bee46e88-33e8c250524mr2546631eec.15.1790158702865;
        Wed, 23 Sep 2026 03:18:22 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7c23asm5038225eec.6.2026.09.23.03.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:18:22 -0700 (PDT)
Message-ID: <49dfb307-8d12-4008-8e1d-63d35ffb50b3@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:48:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: qcom-pm8008: Add PM8010 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones
 <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-4-de33d78fad9d@oss.qualcomm.com>
 <90d203ad-525c-44dc-83d6-1548b42c131d@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <90d203ad-525c-44dc-83d6-1548b42c131d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UI1zla1_I_SaeYYAn9vW71TkOitg-r-7
X-Proofpoint-ORIG-GUID: UI1zla1_I_SaeYYAn9vW71TkOitg-r-7
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3a770 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=jxTK5DOZuom5vZOH12gA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MCBTYWx0ZWRfX+NGRlzPh1YRI
 dBrvFec9hlRZvJMsN6t+YC6uNh58cotvXK+ztKfOdt7YPztGaGQ06zwIHt3ZbL6xHmUpeNsWaVB
 z4gTMnKgu5nnB0VzXTIQjP7P375cP4k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MCBTYWx0ZWRfX8kpBt8mZOeg/
 +F9hKSAS+LY6+ZxtdnrO7zAea4SrRh38Sd5vhkDzFbV3/cO1PTAFCA7Gjt6opG2tgo79pLT2I5a
 3OJt8pHCDekEeAbjjHQiQBnSDHIX4nU4fNyDnyU4PAntGub3UMnBFDpV8Flt7vnS77cyypwtMM8
 1FK1Yps30Alc6CAARcjryTksA+zNl+iBKMKjNFENCtu+5o45yjpupfYXwQkvabWL0qQR6/ClzD/
 z8Pc79Y4qP+ZePRlFOKrkIu3mumh74zWGr34dT7kJ626gkdJugoQZkodq2aTVeFGh7hX8OnMrjk
 oNr0NOZEilMZ/GmoKKrJIa9q92d83U023xD+Axi8DHH6W0Qbg5LgA62ZnrRHVGFxPV/oP7xcMok
 4tPNWdPx1IpsPt2sMPCuHteHdIe9ztVnr+PfSVxoi3OmYGwVB/6yxLxCDG1mfekSGlHqfRMXiew
 aVJBTFW5jlqf+ZqiU0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230040

On 9/21/2026 7:03 PM, Konrad Dybcio wrote:
> On 9/18/26 6:42 PM, Jishnu Prakash wrote:

...

>>
>> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
>> index 60204cc9a2dc..ed656f0d6df2 100644
>> --- a/drivers/mfd/qcom-pm8008.c
>> +++ b/drivers/mfd/qcom-pm8008.c
>> @@ -34,6 +34,7 @@ enum {
>>  	PM8008_GPIO1,
>>  	PM8008_GPIO2,
>>  	PM8008_NUM_PERIPHS,
>> +	PM8010_NUM_PERIPHS = 2,
>>  };
> 
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index 8408d045e754..84c2d50545af 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -35,7 +35,9 @@
>  enum {
>         PM8008_MISC,
>         PM8008_TEMP_ALARM,
> -       PM8008_GPIO1,
> +       /* The GPIOs on PM8010 are fixed-function */
> +       PM8010_NUM_PERIPHS,
> +       PM8008_GPIO1 = PM8010_NUM_PERIPHS,
>         PM8008_GPIO2,
>         PM8008_NUM_PERIPHS,
> 
> 
> or drop the GPIO support altogether, if we conclude that they are
> fixed-function on PM8008 too (I couldn't find clear info)
> 

Hi Konrad,

From what I could see in the relevant HW documents, the GPIO
functions are fixed on both PM8008 and PM8010, so it would
be best to drop it from the driver. I can a separate fix
change for this.

Do you think we also need to make binding and DT changes
for dropping this GPIO support?

Thanks,
Jishnu

> Konrad

