Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1562F616A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791353570; cv=none; b=YIUhUrBe2xsWXd6W5Lkj8VPlmJ+STq9ZEQm8AVxP6qSWRTEClHDHVeKXipKbnAfA+yPiCRqarB4/5pI6adZd1WHLCGNfQCOGhMgRl0CfrxoFKtoIUJ+m791dgVPltBRe8N23nLFdJ7bOnVK8e19PNgv85kYbmOPL/7NRIARCP20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791353570; c=relaxed/simple;
	bh=HDfxlLW6jyBpQpQPXFWOlUGmrqt4DNQzoTXk0MiiH90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AoPn/MSpEfa1LQiCaaqT9h9RMoeMyiM+VW0/Jl1ZVSbyOaefuZ3Zb+HsJ68Z/BMouy4vz/P9g/kOkF2R2lQL9kG6cNQ0BjekWCoazJ6dOAsM4QXt5bxyCuHrmv0hl6pFm7ge//cAtzBD/TcSbQq5s1nREHgrsJSKO6ErpItDvdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgmJTDGT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOEbvnLT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgmJTDGT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOEbvnLT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974TwVI3923459
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 06:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEeWG7KO8nVXNOa5twFybh1jJy97lZB8PRaYGWiQRVk=; b=JgmJTDGTaC2kRj93
	0Fbp8P9UhNeqSgVkFr6Us1tYGfuHS2rtwiXBc96Jrj4EPeQyxhdndYJvViOTvkmd
	1ZsUb4rGIgfvFQEL6FpLZNXqtCSwHl3nry30P+wAWdDqeuw0aytv4MVn++obdiCV
	Brf3OPFbTfVHF0R8aebxh5+IbnUr8k7qChCJvyoJk+5SQzgKgTPTXFMBMIuEMByh
	RsLi8acLT+iruEA+xutpqIpge0nEe7JApFUQRpt2/TQZEom8KV88Qv+28AxEOPkk
	OzbDNDQyaNFvxILKGxJmAqC9L0DguVL4LED9lzzURaoIpJO0d7LEEBRJHrRZBqpB
	u2RqkA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c718tjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:12:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df5a65671eso22237745ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 23:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791353568; x=1791958368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEeWG7KO8nVXNOa5twFybh1jJy97lZB8PRaYGWiQRVk=;
        b=iOEbvnLTwVD4LYkhw9lk0JoSbhLyCV1XxiP2NRnT6ZBdcNTPPHQmwHmwaDkeF4ob8o
         3Mc7YOjMATvH6D0DdHj2LULzqrCXgbT4MupFR2wwE9ZtIJapIlJZAUf8RABdLLImaM62
         j48Rfsws//tdpHVE9thzR3wf1AMzm4Lvc29qVaOrJjDqe2xyg06mC8UJqHkuDUZfvydS
         inmPONcXpizbVqmy/Fz5rG/rmWfhCE7HU5/OmhB5L1p06Il24ALIqDc20MfpMPC+mwFj
         2FYyMizjlp/2ZE6pjh4l1/L8XRaV+3GQevdPIuAS5D7EynZ4TYCEZh9vrncu4hr6RAqp
         yWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791353568; x=1791958368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEeWG7KO8nVXNOa5twFybh1jJy97lZB8PRaYGWiQRVk=;
        b=Oz8zvYqkZYBwVQ5YoGdLh7GYTRsU2bR9gq5bi2pYbpvY13sQW6PsDfwlBFBtv43EWw
         bIIayjAsABsOapz+ybmCqmWArELJ+JfAg01xzhyhFeVtaLnc62XFcWg5BpcvIo5zFB/7
         1hTBI0MJ/CFpsLel9wz5SClvmoY+/iS+6p/1gNaO9WRnKemrTLSwnFCgwFwy+JKm32ri
         wN1b62hHt0UpK92n1dRAVCsbx67BZsWU42F/AgoESXWE4r5g2gwhfwOXlD2YoSIyZJw/
         +9TTkyfz4UV1U2Wywwc8wSl39rREavIFdPfBnk1Fg4Ezgt7bzIoUKgReCtFFCE6ny614
         dFgA==
X-Forwarded-Encrypted: i=1; AKwUvByQORXRlhqZp3rceDWW7Nx5ow/yRIAOaIp3YkHawOikP1oHXFO6Snrf1Xd+4UuWHeRi62Nu9nYeCOatPDM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK54Xhhscqzc0amvKLnkjoR3+n06jmrgu1J7VOD81qtgycO22Hh
	NtQK6nnGkzpwgXaM0z4A653R+ABRDfgR1z6AwNkB6RyOcT/oxi6m5+845FalOZYSLCKKapERkW5
	5pYVtm8YprbTBJCudCfGbYVO4zq7OWUOhl6iJkLK1Z76v8IvGP7J1YADv/uhBpMGJrbA=
X-Gm-Gg: AYBFou2pUW2MqrKT316LeDABp9wFPficJDrboHiEYddv7pR3Y3AVMgCQKGcePY7Wck3
	Yu1fO0lhE4Rikyx6Q1sDXNN651SEV+i5IWv7wAf90w2eVJQxxS14pRZTTXdx7d5yhzh4kivhzZY
	bPhrUQSXM9sBHLGWEXxTrg5wdOzFgGCAYmkby5KPhD/0kO5WPOOH3RDMOmPc7wEFofuMftGDoJO
	LPil69ZfMjJ++M1+wJ/fgNtisT9FGj6UhcC0fKmOzeF19PoNphfWUxZw+Bb3r5wo1L9+cCr5UwD
	E4pOAqXtc3miNqi7Jt9YXe6N/oh3Zyr+pbaihORXs8XC+TK9CvCg1Y3AIN+0KwmRVw3S86D3HF4
	shk7lFwsIkw/iAAWeAY+I8oca1PgQ
X-Received: by 2002:a17:902:d54f:b0:2e6:1715:e4a6 with SMTP id d9443c01a7336-2e61715e821mr2275695ad.38.1791353567817;
        Tue, 06 Oct 2026 23:12:47 -0700 (PDT)
X-Received: by 2002:a17:902:d54f:b0:2e6:1715:e4a6 with SMTP id d9443c01a7336-2e61715e821mr2275455ad.38.1791353567290;
        Tue, 06 Oct 2026 23:12:47 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm5326635ad.25.2026.10.06.23.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 23:12:46 -0700 (PDT)
Message-ID: <acfba985-ac89-4769-9d9e-d2ce9ecd6383@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 11:42:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] phy: qcom: edp: Add Nord-specific register offsets
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
 <20260911-nord-drv-dt-v1-7-e25c073cf1b6@oss.qualcomm.com>
 <t5thwekhz7wyhmyq3nobm37kag6n7ef2z2xpuwrqikv4aqniwc@ha2pjr32ecrp>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <t5thwekhz7wyhmyq3nobm37kag6n7ef2z2xpuwrqikv4aqniwc@ha2pjr32ecrp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNCBTYWx0ZWRfXzfcELEQMtKha
 IVAcoV7bODgRuqp2K+NNNCSdqP60azxluFvLNvzfePRwluqugNbLVgx80Y0VA9cjC2fdlxgbASa
 QeshiC/wVo1LR3O/vSAmtnqMxw13xEU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNCBTYWx0ZWRfX+ZorYL3wPrTf
 ggKo+xRJajgUdIs9QbkKX+9ciUTFst8yaNy4+cef+MhIw2UXBH4mVciKy2iWJ9cr0lZROMIk+D2
 T6yuQwNXkpcBjPn/at+NjATAHIbSsMChG0WyVp4mROa/qy1OljKwb9WdoNEckI6Mb+gyvpYcQUL
 /eyT1FeEe8Zgfjz3cl2v0zzi9hhRkcF9Xei8F2inFWToPJzMuX48JdrtIaGHYAf8DAiw0z2mLuq
 e23MVrkmuHSgO2DMqNcrBSTJgXMuTj57sQZjg7pdf7lcE/qNyNZqFx48cxOUA58AH+CQCBaXNUr
 FoeeQTsn1hr2MkX287Ii+EFqnL3wQSjeMS/W8bzQ7FZ8UMW6xdkqGC4SpnO93zem9Dbnntt7SDk
 Zs70qJVTKX9QMEurNMt31FTjmPs/tUxubs/zjIm1ZiQOEf2XEKkzvINadUuVKgky3q98UQzkjdq
 o2JR4jxwFO3nui5WLfw==
X-Proofpoint-GUID: PhG36svVv9dx2uO3-UOCzWo69EeU9gJY
X-Proofpoint-ORIG-GUID: PhG36svVv9dx2uO3-UOCzWo69EeU9gJY
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac5e2e0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ws4HDfdl8TRdMr_wlFsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070024


On 9/14/2026 5:28 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 11, 2026 at 09:06:38PM +0530, Nabige Aala wrote:
>> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>
>> Nord relocates several DP PHY and QSERDES v8 COM registers relative
>> to existing SoCs.  Add Nord-specific defines for the relocated and
>> new-only registers in phy-qcom-qmp-qserdes-dp-com-v8.h and
>> phy-qcom-edp.c so Nord sequences can reference them by name.
> If the registers are reallocated it usually means that there are other
> registers being inserted (or deleted). Are those the only registers
> being changed?
Yes, only few register offset is changed that is taken care in this change.
>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c                   | 10 ++++++++++
>>   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h |  3 +++
>>   2 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index a3c893f72908..bf8a17336c7e 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -41,9 +41,19 @@
>>   
>>   #define DP_PHY_VCO_DIV                          0x0074
>>   #define DP_PHY_TX0_TX1_LANE_CTL                 0x007c
>> +/* Nord uses a different register layout; non-Nord value is 0x00a0 */
>>   #define DP_PHY_TX2_TX3_LANE_CTL                 0x00a0
>> +#define DP_PHY_TX2_TX3_LANE_CTL_NORD            0x00c0
>>   
>> +/* Nord uses a different register layout; non-Nord value is 0x00e0 */
>>   #define DP_PHY_STATUS                           0x00e0
>> +#define DP_PHY_STATUS_NORD                      0x0110
>> +#define DP_PHY_LDO_CFG                          0x00f0
> Why does it not have a _NORD suffix?

Ack, I will add  _NORD suffix in the next revision.

Thanks

>
>> +
>> +/* Nord-specific TX lane registers */
>> +#define DP_PHY_TX_LN0_DRV_LVL_NORD             0x00e4
>> +#define DP_PHY_TX_LN1_DRV_LVL_NORD             0x00e8
>> +#define TXn_TX_BAND_NORD                        0x0024
>>   
>>   /* LANE_TXn registers */
>>   #define TXn_CLKBUF_ENABLE                       0x0000
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
>> index 93edabb830af..008b17222a8d 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
>> @@ -48,5 +48,8 @@
>>   #define DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1		0x2f4
>>   #define DP_QSERDES_V8_COM_CMN_STATUS			0x314
>>   #define DP_QSERDES_V8_COM_C_READY_STATUS		0x33c
>> +#define DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL_NORD		0x17c
>> +#define DP_QSERDES_V8_COM_CMN_STATUS_NORD		0x1d0
>> +#define DP_QSERDES_V8_COM_C_READY_STATUS_NORD		0x1f8
>>   
>>   #endif
>>
>> -- 
>> 2.34.1
>>
