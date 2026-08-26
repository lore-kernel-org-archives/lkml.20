Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E5A445AC1
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787757472; cv=none; b=Ex/0+d4ftqdpx88HiP2NY+gskcpO+ALtcY4gTSRiq3iNHdri9br0WTJOI6yRJpw/jybTOYmE4GW0+Y6GuP8TcR/xTigw0ap4fbPuWZROWWSYGXd78rU5R+J0D7GpQPMvAZef5eEf1FpIGyygr+XN4zAbmO1zuP31Y9NnjxlyVk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787757472; c=relaxed/simple;
	bh=Sk8am2Vtc6m9rrLeY1Sbj7klCd/qXHFyxywLnXgPxcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rNBfb3YwWlLK5jSCFdJmCoKQc4f1CdxMsufiK6x4aHeQHyolM05lF2/6JIY7BrIK+ODrS8AgkAmZ606s7EnZbcFJSyHoR4qiW8YLyIY0bRBaz1pfKvgJ/vzjBydDf2VogITUNif3T6rabCUtTq53wM6qUg2QDJSOyO+U28fSxKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5knkjHu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GDWZeYia; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5knkjHu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GDWZeYia"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDusjd611991
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACC2N5csm/N7GWXhyzoNg/HYZa0MB3L4DHfq+Va9l/I=; b=p5knkjHuqaYpQxzB
	H7zvlxnKLQOs1cDx7G1/WbGXm7to0pWBWSR8OKDmeDK/7HsJo6q49HF3qCXkl2pE
	mjswcW8ddsNNA9po4CQBYyO8rO+rRWohR56Q+LFAFVZjRdwiWhUXmDLxtk/NH2SU
	I9Hs+ihAtA+F8wsEqoiEBuDfckytb0cP7TETqi/Aorr8CvVi2R1sLbwcf9TwJIQO
	Pu+iBTFoc/fR0G9oqKuS5sJSoJv1KrGIcf60TvK2XFasrc6EKxYsg1rtJ7TCkR+2
	Rzcaf8CJitCIJN6vpV0F/PM/IGcIu3rdEd+c4+XY8/bOhCJQVWufzo4zWgZ+zEXz
	tY/3uw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smxaew3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:17:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3954def0191so2190499a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787757469; x=1788362269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACC2N5csm/N7GWXhyzoNg/HYZa0MB3L4DHfq+Va9l/I=;
        b=GDWZeYia01D/p710EyST6Vp8sOdnT3qVXpPL5QQqM30EijHTc5ZjhhlSxxwgP5Q/KS
         fiC6865VqtjSCXMIL4tF/zu9Nkf117mbIEc5+eyZ+Slw1M06eSD8ItI+B9t8HRvqm2Jk
         G+fKZJf/Jai96BcgdIhzdkZNpoQKUXAy1L3ATCIXw6G8Ly/Av5FLVT3uDROviJVgAZhZ
         9oZtBUQ1rFc37V5O32yQBFhhh31n9DdU1NV2sfgujFKNnhsZaYBmHgHyjBCNCMSbx5pr
         2pz3sdViL4hDxrIgOxNgQDmuu+L0n3iyIX9Xz7xl6D2H6knj5frBDVA+WIdGrzKD0QIq
         uq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787757469; x=1788362269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACC2N5csm/N7GWXhyzoNg/HYZa0MB3L4DHfq+Va9l/I=;
        b=PGLjdWY30fc1a1Lr9NaWgnvefHIadNtYrv/G+c667keXAZVQQmZVGMGKF3f28eg/WJ
         2R407uZXbIb2S6lHt2yPuM4S+QxKxsMeQ812akSAcdLdq4IFeXVV5du/1I1a/+Q4PAXY
         YQ15aFOLONdD+29kGpGHnf8x84JYqRiKCnlyKDB0GmAPcOndHuHqUtcnIIDF0IxoyjBA
         kxcWfTG3+fbLXw80XW8LRMsirNfRsq9+LRojZIL4kqTay3BSZ6ZbbYvpCqnPTyo4jVSe
         pY1MjD2E5jtgoUT5bSuYMHP0JT3oOfzzHnICxMu9Z+wxFDvhoCXZLQ/jvprXMzdximj/
         vp7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq8w4T+BlupfefJvAEyuvgTh+zcNcCjin+lbBKNi1sxW+MM+y/jlmSPg8OYNFc5W2u9Cc4j6qIX7fbK9vw=@vger.kernel.org
X-Gm-Message-State: AFuF++mzhhq3orbF4g1h2ZE0FO3Ig9TZsP0rFlUjVbPOaoo6E3Kw4E8B
	KUbu8ORZZqKy88YTfHpdoSR4WAc/s/4XRT9co+AjOWuWKkp6vKhOD7c2ok33A4XQ/pghM5AyWX3
	l7WoHsd5PGTiciwznFtoGt6M6Q++J09Hzq/hMlUdhBD7FfjGWlsFsBYZX93ARBVAw2Zs=
X-Gm-Gg: AR+sD12mWUlI4/MEhWYzaIXxLOQMLc5ruqz9MsOTDfTnZM6vxvijYzotK2iXS+v5Zih
	XdgRS7gAdELr+aU04o2J8DhgfR1fCgf2xW397ZT+ZX0+sb7OD/vOyV9BYpEGJH00j3PDslqHMqI
	yZ3G8eYh4vcfCz6aVYIrHJ7RSb+NZnErFpDgeqT59lCXvftQ5CEA2lBTuk8DSY9VtO7jy5YZY2O
	pSXdeIXfFwJTML7d522DglnvamnY1QXyBvCcApBNBsskh1dk5hkCq6oY0DZhmcAVM63IHPpTlbI
	X82gh8HJ9kw4ROZKGBDYWGZ1OnfhTqUTEimrlY+jUn+qJM5OGdm6WbYZ7fxofKOjx7P9SiTPaiS
	1DhHVkOOPZ2B/ep7YXmgzyY3Egc/Z5evG
X-Received: by 2002:a17:90b:4c09:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3966d3dcdb1mr15426105a91.9.1787757467959;
        Wed, 26 Aug 2026 08:17:47 -0700 (PDT)
X-Received: by 2002:a17:90b:4c09:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3966d3dcdb1mr15425980a91.9.1787757467399;
        Wed, 26 Aug 2026 08:17:47 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.111.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39646138f87sm8381159a91.3.2026.08.26.08.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 08:17:47 -0700 (PDT)
Message-ID: <75e6979b-84ed-49ee-83f8-bdceef2cb464@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 20:47:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-2-61171ab1cdce@oss.qualcomm.com>
 <d81d61fd-79d1-4bea-b93c-0afe44f9aab4@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <d81d61fd-79d1-4bea-b93c-0afe44f9aab4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8f039d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=MMW3c9rFXQuugNOjlkEUow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=rko7XVifj6BEHbDbj-IA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: L79mOJDiQOJg43r7DUrpZO-7ye9RI0fM
X-Proofpoint-ORIG-GUID: L79mOJDiQOJg43r7DUrpZO-7ye9RI0fM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyNyBTYWx0ZWRfXzkcFpWpf2XEX
 qj4oZBZbUJBZ5ZkBh41WACJS6DMxbcFcfOxQxKlg0f+BWhaLOEZH0yGBC7mr4A85jyazHNO30TF
 ALJBeju+/EivB9fBu4IXQDji6k7epdV1yheeMAuxfaamwV7QSPQim7h0TkwJagMVXNPAnkGiNpW
 3csphCVNM9KNtxEUmqZG46nuuJJlhxRO7EAoT1giw4WxV8q4LrUYPI5OogmhlCyoETFlPDbBw5O
 oBgD8RoBwPSOy+CL6rLGfnWAU3PmZx5UDX6EIYXePmwR1mTIiL2YVIHJJIxrzKG3zt+pkj0JzjU
 r611vWWueqosNxpPuPXieEszHitEfx6l/ih9nVLpUH5f6j/PyCTNKTDunreEHWARTp/21RwgqDY
 q+EimO2A+xW7ZVXMeUv2Oum72Mvkt+aI7/e5wHH7Ub9mwrwO9E6FYg1SY4ZFWOBAVf0zGE/mvRw
 hWrOy//uIq7LWFljmNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyNyBTYWx0ZWRfX/gSgWlUDBG2j
 ntW5EvoqZILNXPCfWgaMBj4SgANT8uv74J+TaQ5Kh+jgM+NDkzYJkgTJmgzkFyKx7hkCMFnEl7L
 3qRrYtotihiX1s+Q0OdjEzivBJTtrQ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260127

HI Konrad,

On 24-08-2026 20:26, Konrad Dybcio wrote:
> On 8/4/26 9:57 PM, Praveen Talari wrote:
>> Currently, on the SA8255P platform, protocol drivers attached via
>> geni_se_domain_attach() treat each OPP on the perf domain as directly
>> corresponding to a protocol value such as a baudrate or requested
>> frequency, and simply request that OPP via
> [...]
>
>> @@ -1175,6 +1181,29 @@ int geni_se_domain_attach(struct geni_se *se)
>>   	else if (ret < 0)
>>   		return ret;
>>   
>> +	perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
>> +
>> +	num_opps = dev_pm_opp_get_opp_count(perf_dev);
>> +	if (num_opps <= 0)
>> +		return num_opps < 0 ? num_opps : -ENODEV;
> if (num_opps < 0)
> 	return num_opps;
> if (num_opps == 0)
> 	return -ENODEV;
>
>> +
>> +	se->clk_perf_tbl = devm_kcalloc(se->dev, num_opps,
>> +					sizeof(*se->clk_perf_tbl),
>> +					GFP_KERNEL);
>> +	if (!se->clk_perf_tbl)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0, level = 0; i < num_opps; i++, level++) {
> One iterator is sufficient here

level is not acting as a loop iterator here. It represents the OPP 
performance level

returned by dev_pm_opp_find_level_ceil(), which may advance to a value 
greater

than level + 1 depending on the available OPP table entries. The array 
index, however,

must advance sequentially for each populated entry. Therefore, separate 
variables are needed.


Thanks,

Praveen Talari

>
> Konrad
