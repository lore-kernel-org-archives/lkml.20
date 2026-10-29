Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254284;
	b=UYIBSiYvN0CUZz1yWw/ckISFeoxcSa9A2gyEj7KjjPkXTfPXULU0hcTnsPMR3AGXb+76
	 4djiRuf4XN0xCxzssszCj/x281mOuYCaZ/NqKhFmJnK5xwjh3r3dEb7bxXf3DSpfjUPpA
	 s8Wb6O2h7+v0x5wFcB3eZ8Hj5yVIclsNsv/ivIjSKaE80RJNvDgyHXS3xmby7jXcwtCyD
	 kS1Ue9kucvyDHvvwzAmHpJ3n3eM7TjUpYSQY1/WWHZAmoIta0Cjf8Nhcqt5s1VNi+UTv6
	 8o9FIQjl17B0QtfAmfN8O0dnZRUfl5V+mu3ldEbU725Ulh3suw8ZERfPKp5FOd8VJbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254284;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+x+sbwYe22bkeBVNltT0oD7sdL3tpcHA5d0YP5FAtW0=;
	b=slVPvbzZIScVvd+MwJFa3ZZjRHS43dTow7FA9+wHJRpUhmbVJhIbv+gHU6Hr19kHcNYg
	 fNDXcKGHjywnPzYGJepcORWNzXf5bBdQqt2gXE3Nm8vIvbWKIPDJ5OHqSrD/iBgrA0AtT
	 tnkS5QEevW6bHsNJ04Kl1Amm4UM25Jzyjgm4mRQodO+tRmO7qu1F/w/SFlmT9GwI6xqfo
	 D0CMTZoznvdvefmoera4QM0YSLfFSVldCd58x0GnCOqVy5rjc6/E5hWKFdI2FPRzh6ZNG
	 rJrtpRvPVWWe19I8PvYGBfAWTjGR+RQmeom+v3dHWafe7pF1H3jtT2Lk8fNjXTQ07HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RD8zn57b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eeTWLANy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376DA606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 376DA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RD8zn57b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eeTWLANy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Guv82793103
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+x+sbwYe22bkeBVNltT0oD7sdL3tpcHA5d0YP5FAtW0=; b=RD8zn57b70Z6Mb+5
	dy7ND5ZWFKmsnY+JWFJbd+PT79oPzxN26Z+sjpvmdKDhTjUS4/1OZRGhG8ni1g8n
	so1541mpoo2V8MAlZmJqvErSmEKNMLhCmAl7odE8Kfeoc+dvrgRua29ILhc6XHxb
	w3eqfI6YYfNGTzPrwbD9wTrYcPCazYFfQXkm7aWhiHZyMerEPmoxGfT+0GbOONXm
	Lj6ZQB+E3GF3qmLkBiKQKIMcXUWn1+r7jHmDUX5xh/mvPL/QfTLGUixqYLiFK18G
	HNORvoGlceGQCyWoSksqLtJ2WpBoOY+90f2yQo1D/I1ET7raZqopkFReu+KqzX7O
	wKjF8w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3n9jrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:11:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8dd9b9743so18244505ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793254283; x=1793859083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+x+sbwYe22bkeBVNltT0oD7sdL3tpcHA5d0YP5FAtW0=;
        b=eeTWLANylV2o0efZGkxNvtka9dCBkouPK53NZ734xdVplB5mQO4l8k0SbxlDPW5lOL
         jVFNMAQeXLyNPJ1OouRzzo7fCUlBMcrbTMaelVUWZcpAQBGSNEqsSNONVQxrJsXrPWqh
         Q5BQZVPY3Bsxf3ARdw25li6jY0BgTvzDuEjFVNk+DUTw62KNoLkcTWOHT7unmi7Uubul
         gT4ruVDcry4nOIceGiIQPs+Un0eegs9NTnmUi7T/oOZVMxfSwLhDdddt1S36GqvMy8I1
         PtMFD7o/ObSxuayx5EZ1C8MhsRpBfrnPDjhqoKdQIikq0L+evqBCiEmZjWehho3YVs1w
         RQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254283; x=1793859083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+x+sbwYe22bkeBVNltT0oD7sdL3tpcHA5d0YP5FAtW0=;
        b=im4Y/rYIus+BeSOxSHeGmdqzTDHnf6nPoSM7wRM2ISxiK8dUOilJ7z4YgkoNFCf2Q9
         IpjT7btlIIfXjvyIv8hZgcW0TDmj2BBofkIhmJsSUG/+i/W6jxYWmGLg3FH1y3ZpScU7
         huw5ob+KQwwJ8QDYFFgP6mefZGqlYS+6qepADMqpl+7ooj5pRBlBLZpDyJRkRmJCKj8i
         f5Al+FKcnnoc0cHfKQVP8vDw0TTnpwQgzg/yxQQz3UmiLbpZ8XibJKfn1Lp2OnEoNsI0
         pl/NE6CqWeXNRHGSwWQ4cMYwUsuzYC44y/HAxYl1tCVIZfBsSM4a9m5MfYm28CscD4Xk
         4vdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwq2rnREadnTxZa0/DuWGcHdB4C+R48iqNgHJAaqf7F0v5ab9SGlGlY0nC16aZgPZecMaRMaW52MEayXLw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVtSWlShGFuE8C0SzDEE5NRx0ViiRsxoNWWThAnaBDN8x333hV
	BZvsd7+G/UzptVnWXzFYHuUhfX/TuorK1xje7JlE0m57GjkjuoKzx8iaNnuFJB/J1slkJPYhcJB
	HbHRaxzcSWgh+Ux/NahYtvP2Mei2fNSB2OZNElc5chmyhpMSPxNd8v8vRK0mkmWzKCkI=
X-Gm-Gg: AYBFou0ccK1DcFUKfyuH8r2IbDqpoYPENrMM+v6/BwRKSf+qk3IksFVeXbeQ9qZV5nA
	rUaq2HOxMO3bX8hbDdAQx5pbJETFvSiud3cWO0CnvUv9jVn3mJLXZ1PipTH9WIv0QJamfpYaM6u
	NegrLBdvgbeIlt6GSSgokOS93kQGA/i0qY5N7VK6mBI79DwdecsZ5cV0gq4nzSXxBjr7L/uFBAl
	kNcNhnUErDrzyfOs2Kx7qES+OSpFh4+Em8ieOFoxAMyYuZtTJUoerhjyZgj/usCk6q3YjrQZLNR
	ZMo4xab0RoY+VlShmenyrKDn86Guj+NKZlLdgICTAuaPAa1+LS5+xcmdeuJMjSjq65xAA2ERsfp
	HjtuaMfzQbOfEOF/kfvK/Yllv2TMITY9CdzoHFD3e7mhH6Q6+7DpAW8JsCj2rSiQiMxQLtIrRVO
	WBuw==
X-Received: by 2002:a17:903:2ad0:b0:2e9:5eee:e087 with SMTP id d9443c01a7336-2eb00468db9mr41459445ad.43.1793254282669;
        Wed, 28 Oct 2026 23:11:22 -0700 (PDT)
X-Received: by 2002:a17:903:2ad0:b0:2e9:5eee:e087 with SMTP id d9443c01a7336-2eb00468db9mr41459235ad.43.1793254282182;
        Wed, 28 Oct 2026 23:11:22 -0700 (PDT)
Received: from [10.217.219.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ca09casm28523965ad.67.2026.10.28.23.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 23:11:21 -0700 (PDT)
Message-ID: <a8104e92-990c-4e1a-aa4a-c97b9a801935@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:41:17 +0530
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
Subject: Re: [PATCH v1 1/2] phy: qcom: qmp-combo: Add PM suspend/resume
 callbacks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
 <20261022104321.306679-2-prashanth.k@oss.qualcomm.com>
 <de3e5baf-dab5-417b-a9ed-225cbc56ce1a@oss.qualcomm.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <de3e5baf-dab5-417b-a9ed-225cbc56ce1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9TyI8T0VAzKTaGytcNJfNlIPWsDGQf6k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMyBTYWx0ZWRfX1fS6rCcd70JS
 2MSgSyJh/dkn8CEOnpNM+qIHSRtQlskNM0nXG7uzOcvNIaQF3vXvtNDTMB/FUdMbHcB2H6aZWlF
 8CvsZJBivLmpmznXtRq0H7mqyJThvoEtfYbSg0rilQmrzvNDK7UFSZ60GG5234KBREdK6Uxz5Z/
 6RI3mE3CegUEsSMV/HTz8cONowQ97IRKeyncuIAbJzyPJ56BzLfkrCGZik1fgUB2y+81BR3nWXs
 AYs+Pkksyh1zhvYtp5Hu9bvPoGwaHhc2btjcS+o8tet07V8oyQ7zNbq134lriBJ3lCKN4KC2Xqy
 ttebCs+c/+W1KqCiguNM+btMxiIVQQgBwlyt79oHhmLpdy+VyriC8HuKb1YfdNiSAIm1LsBtpn4
 xJ5FRGuRkr0ovSdkJsN8f720EJUk7jq3vnf4ir0G6z+w0qfqk2Of4FYflDzRGIgy0W3rlpYQb5m
 v5SfL5LMsSDedEAZGYA==
X-Proofpoint-GUID: 9TyI8T0VAzKTaGytcNJfNlIPWsDGQf6k
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae2e38b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KJAbbvmr6X-roC8CkJgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMyBTYWx0ZWRfXzqRNj09bq7aN
 d8MSNR3xkAv1Vh3DieJxAKrvvVKuaMsyLWLzy5cz8H+PA+vR8i64r0oihDaoqvbpMmZWFAiCPEI
 q5FnxWPmAAgqCdA1STdP+ylQcd70+cM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290023



On 10/23/2026 3:53 PM, Konrad Dybcio wrote:
> On 10/22/26 12:43 PM, Prashanth K wrote:
>> Currently when we perform system suspend, the phy clocks aren't
>> turned off leading to power leakage. Prevent this by adding PM
>> suspend/resume callbacks for the qmp-combo-phy which toggles
>> clocks on/off correspondingly.
>>
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
> 
> Well this still leaves pm_runtime_forbid() in the probe function..
> 

Not sure about the history behind this, I assume its for controlling RT
behavior from user-space.
>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> index c39ced168d03..f624195c9b84 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> @@ -4463,9 +4463,26 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
>>  	return 0;
>>  }
>>  
>> +static int __maybe_unused qmp_combo_pm_suspend(struct device *dev)
>> +{
>> +	if (pm_runtime_suspended(dev))
>> +		return 0;
>> +
>> +	return qmp_combo_runtime_suspend(dev);
>> +}
>> +
>> +static int __maybe_unused qmp_combo_pm_resume(struct device *dev)
>> +{
>> +	if (pm_runtime_suspended(dev))
>> +		return 0;
>> +
>> +	return qmp_combo_runtime_resume(dev);
>> +}
>> +
>>  static const struct dev_pm_ops qmp_combo_pm_ops = {
>>  	SET_RUNTIME_PM_OPS(qmp_combo_runtime_suspend,
>>  			   qmp_combo_runtime_resume, NULL)
>> +	SET_SYSTEM_SLEEP_PM_OPS(qmp_combo_pm_suspend, qmp_combo_pm_resume)
> 
> You can instead do
> 
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> 
> and as a related fix, we should probably throw a mutex guard into the
> runtime pm functions
> 
> Konrad

Yes we can do that as well. Will update in next patchset.

Thanks!
Prashanth K
