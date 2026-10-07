Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A74400974
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355127; cv=none; b=Awe//kyl/x935C3qb3izYsPmDxJrMWU03hLkmG+i0FGj6gCPag1tUqhvWi+fFLNRVRZFwXP/D/366OmW5RFTeyg40Rj+o29bKwsPzZb8B/VJsFgA/3zANLUS6WR5StdRKQIAq87NrxKWYaOii1JAYKEde0YeqJffBxQumzUGudA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355127; c=relaxed/simple;
	bh=c7j8dGPAmYWQCRkZw9yq1rfqouGuMmkVMm3m0n4Jm90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EBLvWZLU9cGxG9svsN//am9CfZ5A0pKoG3Y2npqGOtYD5NUsCn47yVdT8H9zmXlnNwY/QbVaK60yIutCXxOeLPrHlnFkO7ADmxSw7D2jer5b6vh6n0sNSx6qIqZ0uT2khKOVYLGdw+FNYNohvPQ6UIdcT86uwq8lTfrjxF6Q0to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+fkf6Zw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYb4yTQq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+fkf6Zw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYb4yTQq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974UBMg3264075
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 06:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ACzqyHWtdt0fC2Pj9BbXxAGnwUR8TgCimh4uH8dmHU=; b=A+fkf6ZwKdcZqsQB
	R5sqmyDRCWMhhL6Kk5TJNPUsv4X4Muz9ttlYFFzsmQYceKrnW9DoTjwS54/XrXiV
	QhZdm8GYApm29GXjrRnLMZWd/ucrRMZONkWbdiscyaKKb0cbxCpzq1DqnqcZALge
	rL+kw+9gITbWt6EtG8soeH0khhOWMwH5gPAPGLV++oQtZuK0RuBW6vpOA0gvG5wA
	154KDLYhvLuZzw1jy5kSDXDh7DP6GkZSi9MPmePE38IBbDCJRVws+Sr2gEN3DLde
	cztO4G/h3L9aXRrrhhSG9tX1NIRWS1xAyWFwHadAQ3gkEMdtqy7ERtbknCXvsXxz
	omi3QQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c608w6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:38:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc7337e2a7so38023895ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 23:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791355124; x=1791959924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ACzqyHWtdt0fC2Pj9BbXxAGnwUR8TgCimh4uH8dmHU=;
        b=RYb4yTQqGRi9dQlfERjKoJmoSh1Q1+0HUiVgeS2znstfOnLsT957ynGxyn1avqtCTh
         ygAetXSxA49KaYG+tdIF35+K4dwQBcbnoUlzvXUBYLFl6co4DE/N+/PK4JzMv8nQeTMO
         lOHzXtsQGn49bd78JCHoXkLYHHwS7ITk3LvDryaOLfiRDt8g/Xp6zcF05c89q2KwzPcX
         SHKZ9NkyPcqwrIB6BzP+/zN73rKo0Y/mR/pBA6RNYx7/4ATmCL2yMpss/59NDJLr+/+b
         8FONriFIX24oPoUoWPIbzxhkyvVS0RAEEZGpzW1RMSm3p5M8VCCeyqiyUTrhUAHAHOBE
         Fo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791355124; x=1791959924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ACzqyHWtdt0fC2Pj9BbXxAGnwUR8TgCimh4uH8dmHU=;
        b=zprjj+bs3tjZBgJeDyDhQuhJN28jji7ibZWw8SPHFeZ1SeX0SW7TzF5txODqs9tSkQ
         KBAMklRRrwJcd3eCDBNFovtiKJm7KJmCMcJRmY6pBJ8XVEh14KLkLjZAObgl3u/nVmA4
         7SG8TntZ0bg8s1jpX1Tq3bAgD80/icqERshWQd6agNOQNirIMJFkhUqk3+Md4oXQVZmz
         eOStAFnGl2GDMmBFgu1oi57ef5mXTTN6TqrCmS38F0rVgFdjOLAj4bdr8SU7zVjtmt8s
         2krKNouGrhVayjZpJt4P18rCOJ+tixcDKQgxH7bhtjtfxX9A+oepgIJScJ1uDhpg57W1
         YfvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzbM0JtAJwvmWot4ynjjd8JjxQymMjBPb5XOgxYrCBLL+rpbhOxyiTr8D9JM1mwCSOM1Y/YLs2TSZoo2M=@vger.kernel.org
X-Gm-Message-State: AFq9FYK09S8JjReCxEOLcygMIDXZfF4kINJGAmfJ27oYDpn306YD9AFw
	k1UFj2S1Rye5ZnXVh/v6x/Kp3+R0g8dwVKIDB6erW8qqJpHrLgE+1ZHHcepUor7YuHL1DTQUyo2
	lb2hlIewaL1+fkCYOg+dMuVrJ6knjOt1j3Xp4VIhHw6qb/9tkls0cEIXUl1Wjidms/Ks=
X-Gm-Gg: AYBFou1XKdIy++AVazesdJGjtbRgI5D1fQOhoROw/YRU0H4E9AXOvehn0CSgks1vylc
	68MrhMewYzdJHt2Al77fjTGcejjebFa1K9auNeEai4g9Ni9EsUqtlZSMYyNkTRQX7wyvhrmxIby
	NeeHgQaGkuOnnDlEX8txW/pyKkamnA0FwXHcIbpsX12eX9CdDTAN+XVgSjRjxOkfBgi/1aM+Qme
	TY+5oYJYKmc6KbiroMXEMQZs2nSZdRh3IrLQajSeFd8jlJn8kRVfj9Q3ciysTsPQvCyYpZzkaOn
	W4TyA3mOQPtZHEhKqFcIoeKwrx977JaZWW2EnztfRlgvGgOdFMwb+0R3IWoU9M48QzAedYfM16w
	AIHb4tkTikfOQy2ZvLi3rjnHKqo9N
X-Received: by 2002:a17:903:184b:b0:2df:a608:27d5 with SMTP id d9443c01a7336-2e6003b5d8cmr13571045ad.12.1791355123225;
        Tue, 06 Oct 2026 23:38:43 -0700 (PDT)
X-Received: by 2002:a17:903:184b:b0:2df:a608:27d5 with SMTP id d9443c01a7336-2e6003b5d8cmr13570745ad.12.1791355122781;
        Tue, 06 Oct 2026 23:38:42 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fdbcasm5501515ad.13.2026.10.06.23.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 23:38:42 -0700 (PDT)
Message-ID: <8e7ac84c-5ac0-4e62-9aff-f1151eda5def@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:08:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] phy: qcom: edp: Add Nord AUX channel and VCO
 divider configuration tables
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-9-e25c073cf1b6@oss.qualcomm.com>
 <clxbpw3awcpispcixwrvwj7hocvoag6fhhp7d4azamxghk5x5o@ar3infqpcy56>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <clxbpw3awcpispcixwrvwj7hocvoag6fhhp7d4azamxghk5x5o@ar3infqpcy56>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VmEbIPe_B4xi-zjLyjkXHLGyvgXB1wLi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNiBTYWx0ZWRfXyk2tm9CbPUKL
 /E/Pzp1jgCz+t2GsyHBHzMcYKzfJbInGqqbjIVMo1ACVbSDczsMxRuMhEnZyWKQH2PhoLwC/HhJ
 0YHV4LzZbsXJ2khYoPuWhbkRdGjh9MQ=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac5e8f4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jUuSjYW6OROygl6o7qcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: VmEbIPe_B4xi-zjLyjkXHLGyvgXB1wLi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNiBTYWx0ZWRfX3tJp2zNK1VRC
 ZCQNG1J0w2fQATvQAB+EsqH3UlZ/+eMEygqS6j1wq7iEiTqEoO8ya2BVXi9YUP/+dTYCV1kS2Iy
 DhyyBvbZall27nBbf7plFTsCoSFfusWOHZvI9+JpXl6bb8ac9bJEwZOLOQpVGj0ylFNjR2cXwJJ
 E7UW98HMlaix3zjupc+y1JQ+6hqEdx3xMZdr1xGGi5cHTb+M5ReOx0D2uClAnolvKmr0BvtNR0G
 1kjbUbMs0XPuF+lzZCfRIWZNgcGxHdNg2be6lDnRbGUMWj6KH34H2BxE7FUxmmhngnW1aaDHtqp
 zeM9XQ0spuiQGGwid95Ys7l638tuEmZbhUScEXvCkKlD2SYnB/CabEi6jQtQqMGuCp4nyEQ9qFV
 psfi6VBzH0//j61VXbqB1oLJqAk+dQUr2NrV5dzNs8eFW2hH/VB/9UifjWzX+wPbxooDLp/UmzQ
 SHNBBFHsFFQsnWMPFHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070026


On 9/14/2026 5:33 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 11, 2026 at 09:06:40PM +0530, Nabige Aala wrote:
>> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>
>> Nord requires different AUX channel and VCO divider settings compared
>> to existing SoCs.  Add edp_phy_aux_cfg_nord and edp_phy_vco_div_cfg_nord
>> with values sourced from HPG Tables 2-1-a and 2-1-b respectively.
>>
>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index 373f13b3d6d5..ee0d7f1a90fe 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -1508,6 +1508,25 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>>   	return PTR_ERR_OR_ZERO(phy_provider);
>>   }
>>   
>> +/*
>> + * nord AUX config (eDP mode).
>> + * From HPG Table 2-1-a: edp_phy_aux_bist.csv
>> + * Index:  0     1     2     3     4     5     6     7     8     9    10    11    12
> Drop useless comments.
Ack
>
>> + */
>> +static const u8 edp_phy_aux_cfg_nord[DP_AUX_CFG_SIZE] = {
>> +	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x04,
> So, it's the same as edp_phy_aux_cfg_v5, except for the last register?

Yes, it is same as edp_phy_aux_cfg_v5 except for the last register.

you want to use the "edp_phy_aux_cfg_v5" for nord also?

>
>> +};
>> +
>> +/*
>> + * nord VCO_DIV config for eDP mode.
>> + * From HPG Table 2-1-b AUX Clock Settings (eDP mode) - Nominal/Turbo column.
>> + * Indices: [0]=1620, [1]=2700, [2]=5400, [3]=8100
> :-(
>
> If it's AI, fix the AI prompt, please.

Sorry about that, that's on me. The AI-generated comments are a bit 
excessive here. I will trim them down from all over the patch series.

Thanks,

Nabige

>
>> + */
>> +static const u8 edp_phy_vco_div_cfg_nord[4] = {
>> +	0x00, 0x00, 0x02, 0x01,
>> +};
>> +
>> +
>>   static const struct of_device_id qcom_edp_phy_match_table[] = {
>>   	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
>>   	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
>>
>> -- 
>> 2.34.1
>>
