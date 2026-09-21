Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C61F3EC833
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022968; cv=none; b=GQphN4TcgpsAr2A4SaLwCM8fBMLYfbdYPGxIAzATFAi7oX/ZMew4l0wJYz3lJGOzDcBawc39G/ed7xCLYEDAD5LheRP+AWTc7gBThw+I9FmbgX0glMvT0iBi3IyEyrHJZewXcFMJHQ/XhJ4IuZMooua84MDGsc9xKWaUZNUuzg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022968; c=relaxed/simple;
	bh=8X0NcnAyyYZrxMbslV2a8BYmyIWH8krztSLCg+aMn6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFbyjy4XyOjX5/+CZPgSWtw7ga3NNDYswoIBJs2ml0O0iTofCYWHdlxb0RVZfwoj8u88ReVDWQuI1eQc+ePoLM2PzgjR1W9P+Oqryvu8kC5ijHru17IQSGDPydpGLcIc5uuX1mp+FrYou+DGOcw9qsNciphj5f4lRsxMkf47+Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VefK8UL6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVIyNnyG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VefK8UL6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVIyNnyG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LG77LC351698
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5AIKP1mP34Wx9dw84lO7Zn0zSS/9x6lk1WSUH1MKxg=; b=VefK8UL62syGlWw0
	C4PlvfAlL6cxbSmQ9Cjig+H6SMW6jZDpQrSNe8cl9xZJMri2zT8KEcHjenoxv3g7
	A/segX7gVa9yKyiJ6HkHE4Bxf/7m7oGiZsHJ2uWaBkAWxvlYKbwzmJ+me1u1+X+x
	Nm6KzRnJVDJ7i68qlZ7jpPWXnpd3vd8rHTCIQEdQ/KFVMBy8q6hRRr51gNSenr1P
	h8fbALFHlQTT8tS0oOd1qM411ZdXGstdEHzSfMobUNZa+mQ/cdZ8M9L008vEwKC/
	JKAM6Ad4myRowaZEO32frdAHpZjMRCeY+d6mjSn5xaJJsvXb9Vp+23eAm6N6I5n/
	YSZKFQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu7tsh3m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:36:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so4118070a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790022965; x=1790627765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5AIKP1mP34Wx9dw84lO7Zn0zSS/9x6lk1WSUH1MKxg=;
        b=EVIyNnyG5EFumc9o5uEqZehUuk6FQoL6l9a34mG3A32INEX1qY/IuAxLCT7e+SlsTU
         oFXZiMpmK8CDWrWwveo53NU5UCOSAolgvJKvQhHc3DwqpNkCyq3kfdXmFr6e86FDL6KL
         nInKtIe1CrR7GixAOG4SH0R/XJhc4tGAKgiRziLBxKnRyJ9xMgGC0RbVQ+CuE5chVcqb
         pPP/ag/RCgt8UJJrJ8mcKcZ3I83KY25bNpfRaXDDTvekK39axl8xYBnj8Se6+KiDBwDf
         FY6LEp9kGU/VuPgsCEjo9hNgYHLqTZM0xUcfO8lTGI98X9QBozKw5tVZtE7bd6K3AmIV
         rAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022965; x=1790627765;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5AIKP1mP34Wx9dw84lO7Zn0zSS/9x6lk1WSUH1MKxg=;
        b=d2KtEO1syuUP489WuCuxzaOh5ToGGfpNAlgzCDdgbYgUg7CnR4cidv4T9/ydajTGHJ
         tWIYJ3HWyVUYb1tnM6JsMO5u7ksNEA4e/97ztVgkngvG/wj1VZnx07tHP+1jiHCoOSAy
         TITmKxq+xmzDE8cBdxfbzYhSp6otZAJbUsJ0whwxeu9H/lch37KALQgUbYmvAoAD4bgJ
         OFLQTNoYQ1O0/t+OwQFjtE4FLbEtfl0FBqbo4NPfNOIdaIEHrFAn564RTlqyUhthdEiP
         LOzAIsoyOhrzBmpvyh7U65+Uxe66dD/HUp9BSIlwMfzSYqTzGNF0/FoYi87w6jQf7m70
         NbhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYWwlJvA3jK81Fp93uItAaFEiY3noUiyFmN8Vhd55IPjiyoF0rTvuwSfFj3fjCOFMUOIEswMVwhfeiWrA=@vger.kernel.org
X-Gm-Message-State: AFuF++mN48FonkSxgQGHJ04LbuDh7vU5mWFK0xbe3DwmCPHq1Cq8AWXa
	JD5nO6wLx77Zcwo2nKZJnhbGQK29J1edL3nbzFy3x/Nl9ZvPiU6PfA3c9ue9tt4QNoR5tsTcpNN
	6dR7LP085/+WsDo7vc2uhDrfjbKwVl0FDSmdniWCFJmDtB379TUTAJM36GjTRb1c4vYg=
X-Gm-Gg: AYBFou0M/giKwpBNqG6snHyLYLBhDewWb40QKQ2KWLsA/En45iJOqjkvsCKUl61JM/c
	+pGiafFO7VCOAQPQ0dWhWJXs+JYhcKscBM26ZefiGduj1xsUqLoCmLq1A1cn5uhmm6TsYCJ8M+P
	S7Ac985/XXPx3wl2UmjsaGfp1KVlEq2nuFNELPJHj0o+vj+uiCh+PTk5CSL2HAKa3JbN7ST2Rmh
	TtG94QNma+PJVg3c9CRp/Q4KnKlPI4y5KYN2WRfLTozMFfWIQeLjhbvcWovMpXYq0O0fww7Nl9g
	zu6WrZ9Qc4n5BYQ4/8csVrdlCgMOigoraTc9NjJ/l+EoIGwjvCes/3QC8dpCtgtrrIUMikJmJsr
	Y5/MQXMgL2re7oHfBmNX6AoEjjvfZmL25Ig==
X-Received: by 2002:a17:90b:17c2:b0:39e:6c69:f471 with SMTP id 98e67ed59e1d1-39e6c69f552mr11786905a91.48.1790022964940;
        Mon, 21 Sep 2026 13:36:04 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:39e:6c69:f471 with SMTP id 98e67ed59e1d1-39e6c69f552mr11786876a91.48.1790022964357;
        Mon, 21 Sep 2026 13:36:04 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.229.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0696b0d1fsm470437a91.1.2026.09.21.13.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 13:36:03 -0700 (PDT)
Message-ID: <9fc5a569-003b-4d5e-a943-04ebfdd1e9bd@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 02:05:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-3-mukesh.savaliya@oss.qualcomm.com>
 <h4c5oybkuxf2wmja2osm73ntpolx2ap3csskipbuyoks6xtdsi@5ihhj6ztn7mq>
 <9e3da313-ab1f-435d-8e3c-1a0c946a7790@quicinc.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <9e3da313-ab1f-435d-8e3c-1a0c946a7790@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: k8IR87UnZsa6QsUny2vPxTiKMo_odo52
X-Authority-Analysis: v=2.4 cv=aqgnmiZV c=1 sm=1 tr=0 ts=6ab19535 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=LKvw4eQ66EqDTtCUdPbf+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mqtUebdMckNC0E4VJ4YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMwMSBTYWx0ZWRfX9HqL8UdFd/RT
 lFw2zucGlMsHIPT98fs6cA8R1CWLbeaDEWbgSC/FDbACLKdqEIkgRAQR+TF3TYCeQLu2aSiwSzG
 40lK3+KhoqhrhD/suv/Vzcr20dx0yXY=
X-Proofpoint-GUID: k8IR87UnZsa6QsUny2vPxTiKMo_odo52
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMwMSBTYWx0ZWRfX0cIkZUGbrTq7
 tGDclAY+HyL+g7ZNP9Fnd2HiSgUMOoHAUP2Z7Bjk5D/z6YXNwR59h9vFq573cVGtbr3jXngNZII
 lco0pikYIyiLwP573ANdWfRCrRIsMRJOoVoM0A8IRweaTnqyoryKSGOFuYxkzMzzZh+TbK34UQd
 lriy1xrD2bHV4CA1EGjxnhuTODgienz3JDAliR3iAyqkouGG5aNaToItLbaP/9jt2UL9IKrrUnh
 8vM3lOYnONaRLdspk07f0i1EQlamg2n72AG0AkxVVRMXgFwLwceHW90nCI96fy6ejxKd+0Tlsap
 WW0E14mXBFwgzMM5wnFOztYu7zSRiUqQZaxGOjNo3X2LswIEBQbpIkthMoR9C/cT7uhaaJjhoyw
 rEHZKrr1uiB2zG8T3CVJyHRydtbQxqQxtycsZJ32utgqLn3kPK5WGZGUY3N+zYAM2Lj42LiBwdz
 q40oA80zIwE97YQ9JXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210301

Hi Bjorn, Please find my responses inline below. I have migrated from my 
@quicinc.com email address to @oss.qualcomm.com and could not locate the 
original email thread.

The replies below are from a draft I had saved earlier. I am sending 
them now from my OSS account after resolving the slave setup and 
validation issues that had delayed the response. I shall upload V7 
cleanly with OSS ID.

On 3/5/2026 9:12 PM, Mukesh Kumar Savaliya wrote:
> Thanks Bjorn !
> I am sorry for the late reply, i was completely off from this work. I 
> have restarted this series work and will continue now onwards.
> 
> On 7/2/2025 2:26 AM, Bjorn Andersson wrote:
>> On Tue, Jul 01, 2025 at 12:48:51PM +0530, Mukesh Kumar Savaliya wrote:
>>> Add support for the Qualcomm I3C controller driver, which implements
>>> I3C master functionality as defined in the MIPI Alliance Specification
>>> for I3C, Version 1.0.
>>>
>>> This driver supports master role in SDR mode.
>>>
>>> Unlike some other I3C master controllers, this implementation
>>> does not support In-Band Interrupts (IBI) and Hot-join requests.
>>
>> I believe the capitalization of the last feature is "Hot-Join"
>>
>> It's not entirely clear from this sentence if it's the controller or the
>> driver that doesn't support these features. Please update to make it
>> clear.
>>
> Sure, let me clarify it and update the commit log.
> It's the driver which doesn't support Hot-Join for now, we plan to add 
> it in future.
> 
> I would rectify citing controller driver doesn't support these features.
>> [..]
>>> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
>>> index 3e97960160bc..0e3ad9d96424 100644
>>> --- a/drivers/i3c/master/Makefile
>>> +++ b/drivers/i3c/master/Makefile
>>> @@ -1,5 +1,6 @@
>>>   # SPDX-License-Identifier: GPL-2.0-only
>>>   obj-$(CONFIG_CDNS_I3C_MASTER)        += i3c-master-cdns.o
>>> +obj-$(CONFIG_I3C_QCOM_GENI)        += i3c-qcom-geni.o
>>>   obj-$(CONFIG_DW_I3C_MASTER)        += dw-i3c-master.o
>>>   obj-$(CONFIG_AST2600_I3C_MASTER)    += ast2600-i3c-master.o
>>>   obj-$(CONFIG_SVC_I3C_MASTER)        += svc-i3c-master.o
>>> diff --git a/drivers/i3c/master/i3c-qcom-geni.c b/drivers/i3c/master/ 
>>> i3c-qcom-geni.c
>> [..]
>>> +
>>> +struct geni_i3c_i2c_dev_data {
>>> +    u32 ibi_keeping;  /* Plan to save IBI information, keep as dummy 
>>> for now */
>>
>> Commit message says that QUP doesn't support IBI, so what is this?
>>
> No, i meant to say I3C driver doesn't support IBI along with Hot-Join. I 
> have enhanced the commit log to make it clear.
> 
>> Also, why "keep as dummy"?
>>
> Removed it as we are not using it.
> 
>>> +};
>>> +
>> [..]
>>> +static void qcom_geni_i3c_conf(struct geni_i3c_dev *gi3c, enum 
>>> i3c_bus_phase bus_phase)
>>> +{
>>> +    const struct geni_i3c_clk_settings *clk_idx = gi3c->clk_cfg;
>>> +    unsigned long freq;
>>> +    u32 val, dfs_idx;
>>> +    int ret;
>>> +
>>> +    if (bus_phase == OPEN_DRAIN_MODE)
>>> +        clk_idx = gi3c->clk_od_cfg;
>>> +
>>> +    ret = geni_se_clk_freq_match(&gi3c->se, clk_idx->clk_src_freq,
>>> +                     &dfs_idx, &freq, false);
>>> +    if (ret)
>>> +        dfs_idx = 0;
>>> +
>>> +    writel_relaxed(dfs_idx, gi3c->se.base + SE_GENI_CLK_SEL);
>>> +
>>> +    val = FIELD_PREP(CLK_DIV_VALUE_MASK, clk_idx->clk_div);
>>> +    val |= SER_CLK_EN;
>>> +    writel_relaxed(val, gi3c->se.base + GENI_SER_M_CLK_CFG);
>>> +
>>> +    val = FIELD_PREP(I2C_SCL_HIGH_COUNTER_MASK, clk_idx- 
>>> >i2c_t_high_cnt);
>>> +    val |= FIELD_PREP(I2C_SCL_LOW_COUNTER_MASK, clk_idx- 
>>> >i2c_t_low_cnt);
>>> +    val |= FIELD_PREP(I2C_SCL_CYCLE_COUNTER_MASK, clk_idx- 
>>> >i2c_t_cycle_cnt);
>>> +    writel_relaxed(val, gi3c->se.base + SE_I2C_SCL_COUNTERS);
>>> +
>>> +    writel_relaxed(clk_idx->i3c_t_cycle_cnt, gi3c->se.base + 
>>> SE_I3C_SCL_CYCLE);
>>> +    writel_relaxed(clk_idx->i3c_t_high_cnt, gi3c->se.base + 
>>> SE_I3C_SCL_HIGH);
>>> +
>>> +    writel_relaxed(M_IBI_IRQ_IGNORE, gi3c->se.base + 
>>> SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE);
>>> +
>>> +    val = M_IBI_IRQ_PARAM_STOP_STALL | M_IBI_IRQ_PARAM_7E;
>>> +    writel_relaxed(val, gi3c->se.base + SE_GENI_HW_IRQ_CMD_PARAM_0);
>>> +
>>> +    writel_relaxed(M_IBI_IRQ_EN, gi3c->se.base + SE_GENI_HW_IRQ_EN);
>>
>> Don't you want a non-relaxed write here, to clarify that the ordering of
>> this write and the previous are significant?
>>
> Do you mean for IBI_IRQ_EN or the whole function ? If yes, then i can 
> change to ensure no re-ordering. But i don't see reordering for complete 
> function is required.
>>
>> As above, the commit message says the controller doesn't do IBI, so why
>> are we enabling IBI interrupts? (Just guessing based on the IRQ names)
>>
> Yes, commit message says rightly.
> We are enabling just to ensure I3C controller works with IBI controller 
> enabled. And that's mandatory per HW programming sequence as we don't 
> disable IBI controller even we don't use IBI features like IBI interrupt.
>>> +}
>>> +
>> [..]
>>> +static int geni_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
>>> +{
>>> +    struct geni_i3c_i2c_dev_data *data;
>>> +
>>> +    data = kzalloc(sizeof(*data), GFP_KERNEL);
>>> +    if (!data)
>>> +        return -ENOMEM;
>>> +
>>> +    i2c_dev_set_master_data(dev, data);
>>
>> As far as I can tell, the master_data is private to the controller
>> driver, and the only thing I can find you do with it to free it again on
>> detach.
>>
>> Am I missing something or can these 4 optional functions be removed?
>>
> Yes, right now these functions can be removed as it doesn't do anything.
> I had kept it there to add something really required in future.
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void geni_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
>>> +{
>>> +    struct geni_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
>>> +
>>> +    i2c_dev_set_master_data(dev, NULL);
>>> +    kfree(data);
>>> +}
>>> +
>>> +static int geni_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
>>> +{
>>> +    struct geni_i3c_i2c_dev_data *data;
>>> +
>>> +    data = kzalloc(sizeof(*data), GFP_KERNEL);
>>> +    if (!data)
>>> +        return -ENOMEM;
>>> +
>>> +    i3c_dev_set_master_data(dev, data);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void geni_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
>>> +{
>>> +    struct geni_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
>>> +
>>> +    i3c_dev_set_master_data(dev, NULL);
>>> +    kfree(data);
>>> +}
>>> +
>>
>> Regards,
>> Bjorn
>>
> 

