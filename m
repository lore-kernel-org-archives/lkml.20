Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690389;
	b=tx1sBS/mGup7L84y0XemIZ7DLPguy50m+NX9g4j7kXOkDOYLKqpqz1OKLyfvNuP2aG6K
	 1txjsmMCYPqB3hVydq9FlxqDjVhBFKryVQ6stSlAeZgzgOfJFenikF0We8c5CckEwWgqr
	 2zWHL4fxICwWhHsUbFpvV2mVyEeyTy6X+CY8ZZdDDy82qPtoe0HgvBt+oUErkPIMU7hOI
	 lRqvnJpYKQ5I9t+TT1EOMjAZc2PZf7mAqm6S9Pg/aFoH+e408Fz/yWTx+sR9i8olR7Zva
	 3BTkznYkdHpXrLtZhRWmmONUJGClFpipgF+LsCQTFkoxNkFBtnpO+4b9nCAwgbTPtPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690389;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K2CG3b4t47yXaBdjLO2bPQOOsh8D5qOew3uLqFztY7I=;
	b=QaWe+UZY6+e0ik1Kj4oUf2JP4Lov1sZkGniJZ5URpFUNCliESCmaZY3UJtqr3FFBlLZL
	 qBCRlnrW9K5rNT2nD15rOhzouAQImeJ9gIo2tuvrjmjpFLYaes8J164IE/SHY4JvlWuoc
	 pYRbNJKZ1ztaCr85H6y/fm9doeigW/mZYxRn/isA6Dyhcs1mQH0eXWfs7ivrOhFD+i6WQ
	 xdangSknuKnJsruz2bom6D0XXQHwFP8cygnciAmN0xeoDIgt/Q4s6bRMDyK1yE7/gCt+s
	 gccfvK9CC+j78IBi1IR0NfMEYCfs3wK8vCPmrSyRGQuUL1JlgkW4TRU9p5HTTkYiPyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XpHOIXNz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=feRmNSMU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6802F606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6802F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XpHOIXNz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=feRmNSMU
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A32oY6v2608899
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 07:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2CG3b4t47yXaBdjLO2bPQOOsh8D5qOew3uLqFztY7I=; b=XpHOIXNzBBnR2/X2
	0b5XmdXW1XJNxAsPUuItnr/snKzhBS2jog5fhps12ehBR+pxFTfWYobk15L4Zg37
	6s4xGT93eIDOjB8Yb8gFc45sa5sMG4Zy9jUznTtNwCyB7UxY/XboUChTY516KLlg
	g+tmhYGfBlIS0HId1HY7F2Nd9Wk+UzCWX4etmk6ZZ6vioB0D50uN976PfR4jUjDk
	FZ/iYCxgFNXBmodZ1xbNkRoq8Yvh8wkAsXJjLoE0g07PDji/hS2bNiD4oX9uR3UI
	8/VZmekeLcQWhP2t+LvkGlacFlL1ZFKfKiACLAH/gTOsiLVbtd/KTxTGU2cSA9TR
	+NRRmg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d8wcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:19:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89f84753b43so2538277b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793690387; x=1794295187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2CG3b4t47yXaBdjLO2bPQOOsh8D5qOew3uLqFztY7I=;
        b=feRmNSMUJHeyYErxl9D2PeBg0cYtRqWnkkT5hJGcH3zfKFlek8t4SLbsdu6hLJ/gr1
         C/TCVMoJF05kpAp3d/jg5KPN+7zI9r9SSHBj7YomYWEKbfdME38YnI7JtPqTKXZcrOWN
         8EnHNN1Lw9U2/8/bqUOuWwKZzKrVsyqorelXeFE7wSm4yklfVNBL637pEpE9YZowvJWA
         e3E/MZTvaa0eiCPsDdrm+vy27EztIu9flcFNlYZkNAyGCDPvlfoGr+w1O09wCsQB83nU
         KO5qka6uSIkeOO3YPUaWIeKgY1WC/UMFBhsnxsVIuqzn5wJXwPoR0IH4l9lKnGYEFo9X
         Ia7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690387; x=1794295187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2CG3b4t47yXaBdjLO2bPQOOsh8D5qOew3uLqFztY7I=;
        b=V87X5hr431RIHa0cOpuOPYcoDgCyqO1c5JKYIWwQsKz3lZ1tb73LW0QgrtWoptlI2e
         qvpBcT6pjSRyaR1ZlkBMrOJ6CbKLSJu+C/UDqjdHP2WyjXS94fRHWEBd1k1ZHZqndMSk
         dCWeiAjlxSw/Y/Soa1UElxpGC5709JqWzlxauzMPvOxGcsN4W/oEZTi6XcgW/uVrnn9Q
         Ip+IdyVtsiPe/xbA1sfSxI9Sta25XW4FpX44WKPLBHAIUdkOJ5j4PYUhsMQ5OhZl0KnU
         jV17LQsjyg5HPKjNnhwa/iQPNOS9/k400AuJULGsA2Sm+oOvvTvYdGDymrpTJ7W+XAtP
         Hc9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxmlNx/Txz3C/4TVg1JfSOo+4VQa5cnfjTt/GuIbrJfnR8gxr0+ngQFvJ5HHdjhR4qgfwKqO6nUwqonhc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZXLyzhtiONrivTymREqUbj6iA8zmWVarLfvz4SycIyTRgONd0
	/L+4ieP8+MjYdGeidD/3FM4S9dgiRsbdngdc64QChlxc5lm/O4r6fWDwSVE3Q0cmBOpROlb+IfJ
	6DCkwfBrt6Ia7fUqCSX14HGzDB3h8VTm95h7GThJCTF8fSi/mkYb2l4DvNVI1WySmLZ0=
X-Gm-Gg: AYBFou1OQdWIj/Lo4EE1IRlE0oZ8tgddTaAwAODZg83/aCw+dld6yQhc6A/0Ht6a9JL
	Pwyb1eh2ohnH092Dk0jkjMdRg+WSylLApHpFLH0Io6k5dqFd/0Cc1frU2E7VocljDXwNmkou4oy
	vP74cdplfTWvg+q9/3ryTNUAqRi8jHdxutKsxT7ab/t+pYXgjjHcGW2dOuYb0qXwgsZcXu7uurT
	80U0LCWQu5zfMACLlt3kXUNa3E+4umw2twb3MIuB12aoDSJ8J5SQwKAEuYhihj2xaGCC7VRz22b
	0fTVY8tgrKwiee4Z7yJsSUGEd1X/q4IB0yYR1stXI/aLZDvbOpVSVQAsRMBfK7PiXWvIari8Mql
	oFpS7vmp5YHM5tEjZj09x2uU0/+Qy+mwyAJcePVVvz5SJe2cxa4noj1LfnRNUKiBprDvebG0M+Z
	evdOQ=
X-Received: by 2002:a05:6a00:181d:b0:89f:63f9:b6c4 with SMTP id d2e1a72fcca58-8a9bd9d6ff3mr8752576b3a.32.1793690386827;
        Mon, 02 Nov 2026 23:19:46 -0800 (PST)
X-Received: by 2002:a05:6a00:181d:b0:89f:63f9:b6c4 with SMTP id d2e1a72fcca58-8a9bd9d6ff3mr8752561b3a.32.1793690386349;
        Mon, 02 Nov 2026 23:19:46 -0800 (PST)
Received: from [10.217.218.73] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9c09086sm2768904b3a.23.2026.11.02.23.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:19:45 -0800 (PST)
Message-ID: <8b83c220-4dfd-433d-ae8f-8b65a4865c78@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:49:40 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] i2c: qcom-geni: Add bus recovery support for FIFO
 mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
 <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-2-7f2a6e572de9@oss.qualcomm.com>
 <acac5cec-6fa2-4465-9f66-a5e533404978@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <acac5cec-6fa2-4465-9f66-a5e533404978@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae98b13 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NaWF0_NUFfviP6yxQe4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyOSBTYWx0ZWRfXy3A5CySxVCkh
 B7+lEMhjyCHKtQLDkifRWkT14uPbt0XRFdn/VLgUGemTpj7CSqmbQ9IyTm2aKQyhvZ4eFyXls8R
 9ln28GeIf2ICcXN/hRgOJM2DgD8O9n8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyOSBTYWx0ZWRfX/9O0pOII8QPM
 3N2NBBky+tf47gpug7LIuDGmDefuLyYKmwHMft/0I+L6uZTdArpZPIfQVtXD1+twmkBp1HQ3gn7
 3dvXu/K0xpdqboA8gnshKUQYyyuMT7VxVanqhG/YLzlAtw0AL4R/fCkTA9p/atTQp8wb74vJBSq
 ed0FUS4IkB66blXg2UGJa5VnWVDW3ZPCTrtoOZhWZqIKV6aR4YYrISGDiuFE+Xev0Z8juhlg+I3
 KITy3t6q0IuPuRKe/Q7nuY68d3ErzyPwQ1RiDSTYbF0KMllHTTBX8KFfYs9cy3psc9Rxpf12le3
 O3fRbkhTPNpL0MEMsv5TKoc/qPhGJmSLZ3zUkH10Hrh5+SHFPyW0JpCYkgl4pwYO9w6qJl84UIz
 9cvin5EU6xJRVFELZ+1aNplsPuGMVVTueY9Oow9XlBmXSg1Zs2D7qOhc/stwhBmtUa7v0QM45ps
 Ugg73cBBUJ42w8IXPVg==
X-Proofpoint-GUID: MnhAXMqxJfR8jOnz8jdK_AK1j1pBPUEm
X-Proofpoint-ORIG-GUID: MnhAXMqxJfR8jOnz8jdK_AK1j1pBPUEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030029



On 10/27/2026 7:37 PM, Mukesh Savaliya wrote:
> 
> 
> On 10/27/2026 10:43 AM, Aniket Randive wrote:
> [...]> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 127 +++++++++++++++++++++++++++ 
>> +++++++++-
>>   1 file changed, 126 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>> i2c-qcom-geni.c
>> index 60b6273f538c..d9e86f110ae9 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> 
> [...]> +static int geni_i2c_recover_bus(struct i2c_adapter *adap)
>> +{
>> +    struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
>> +    u32 ios;
>> +    int ret;
>> +
>> +    ret = pm_runtime_get_sync(gi2c->se.dev);
>> +    if (ret < 0) {
>> +        dev_err(gi2c->se.dev, "bus recovery failed, error turning SE 
>> resources:%d\n", ret);
>> +        pm_runtime_put_noidle(gi2c->se.dev);
>> +        return ret;
>> +    }
>> +
>> +    ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
>> +    if (ret) {
>> +        dev_err(gi2c->se.dev, "bus recovery failed, error setting 
>> clock rate: %d\n",
>> +            ret);
>> +        pm_runtime_put_autosuspend(gi2c->se.dev);
> can use goto , jump there at exit with ret updated.
> As 4 times i see pm_runtime_put_autosuspend().> +        return ret;

Agree. I will make the change in next patch.

>> +    }
>> +
>> +    if (geni_i2c_bus_is_free(gi2c)) {
>> +        pm_runtime_put_autosuspend(gi2c->se.dev);
>> +        return 0;
>> +    }
>> +
>> +    /* Bus clear cannot recover a target holding SCL low. */
>> +    ios = readl_relaxed(gi2c->se.base + SE_GENI_IOS);
>> +    if (!(ios & IO2_DATA_IN)) {
>> +        pm_runtime_put_autosuspend(gi2c->se.dev);
>> +        return -EBUSY;
>> +    }
>> +
>> +    ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
>> +    if (!ret)
>> +        ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
>> +
>> +    /*
>> +     * Recovery succeeds only once both bus lines are released. The bus
>> +     * state is the authority, while a clean opcode status with either
>> +     * line low is a failed recovery.
>> +     */
>> +    if (geni_i2c_bus_is_free(gi2c))
>> +        ret = 0;
>> +    else if (!ret)
>> +        ret = -EBUSY;
>> +
> 
> Please simplify with ternary condition ?
> 

Sure. I will do the change.

>> +    pm_runtime_put_autosuspend(gi2c->se.dev);
>> +
>> +    return ret;
>> +}
>> +[...]

