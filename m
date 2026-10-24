Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792849622;
	b=vC8hdDskMs2Aw6RsEnfORKY9ZCdEzC7IgS6sGt9KxLEeIOFg5WxxTgTK4Ayy1bj3JyDu
	 VtBaqHwSK/6uTNmPR+KZOMUf85g5pKmvzzMvn38DMWneuH93+GpzTV9+pP4z6OL10OBgH
	 DF2+1t9zwTgGpkIU+GEXOmvSzAfFJ43loqpNdE9Ue5gzjSljO92k0corR4+F9NrG5mSDJ
	 /VBmKTaXfaUXI4pytZGAPgTz+xeUsT9I9nQ7JbHQc8iEYN8lHTenRP30e59f8NhXjMe5o
	 5t9Vuv1W6fFiZEvjVddf7x9SA6K0YctOlrT70D7d5GIMBgxUPHyuQTjvZszSFINJ2xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792849622;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k0TxI8Zzb6uqnXqb0Bxon6qQ1xa0r3OWWTSMNDNyv30=;
	b=SoVd8MdyfRKMEm9M3oxzENK/Bd2r/IlSXby2WIjqEEN2wHMoKVlEXbw1I0CM4yqXjAAV
	 4fh9fuKDVT+klBHx5qTBuSriqFJRSw+1ViIBPAba7Gmo7vktQIk/iekFanHXLMH2xAs1L
	 YCfPjf4OkElO7a2ZQImTi9pUEj1I56u8yL/ZezRDNQOyX3qJ7HyvinNPH0GTJMO01lajS
	 SNckgV6AFSUJ37VOkDrAebF0/03Rb4sVJ5+Ekw61SdklmdD2duPWfDJ+LxESkQl+BIoCm
	 npqHitKGnNa4Vbkq1NeaSs0M0wXk8QbcCVxOLZfCKxwMKhWszLhvNrPAzGa4WXudUyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hFwGCggC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dshRdUg9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BEE606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8BEE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hFwGCggC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dshRdUg9
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8o3W41143197
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k0TxI8Zzb6uqnXqb0Bxon6qQ1xa0r3OWWTSMNDNyv30=; b=hFwGCggCQdRUqccf
	/LM9UXGaDhNd55R7LkLWZ+MRIr5yqgfj50rHrjLDC7e0FVR80npIwPaivekyyJbC
	u6g8IVpLZFlB49Jhbw/PSi87zMiy1ggwgovjgZyTlrd6QZGWc+7bkXHGa+1RiUEu
	oGQa5NDah+aSVvfkPqHrs5kqfn9DFmfYM1+bLKVJ7WOgeVmwdOnI2x53ZqoFJIPa
	D+6iDZCSifJV+CYzvN1YhqS8V3NqO0WDVX3pUb3pqistbiwZEI23xtf3wRS79dfl
	TZHpnU0TE3PJ4s/B4v1ZpTSK69cTpk9OLzyPX9j3P2ciIOtTm2TYeIGDPnHMTrxI
	O3uzAQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgj1p9d33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:47:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2812533eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792849619; x=1793454419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k0TxI8Zzb6uqnXqb0Bxon6qQ1xa0r3OWWTSMNDNyv30=;
        b=dshRdUg9SG+r9RgidnZox0L8TgepAeGxc0g6q5C2x5Ct2b8dyFG7a3TyMn9GTHIxU1
         YTUD3qryf3UhsYB0lCA5MN3t6/J/TzFYpcIc9uAwC6OFhFgmuTf0fjYWmb1rmzmB0STg
         CdS4CaRYO3bxLlSANtYRibqOG4Tli6b3AwL3aiTCvtq3IXNBYoSFz0IGRb4HsUqSD3K+
         KtoONuKshbY2HI9Jtuo2p3qPxE0Qv/oRjHWmaa7eUF0wY/zWVZFbFA+Fqa6Zf///gMlL
         PwtCohgu53qCRt1kZKBY/7iEuVgDxt4Cn11Lmt6Gtxhp6Hv6y+r8qk60REerGStXlJ6N
         PNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792849619; x=1793454419;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k0TxI8Zzb6uqnXqb0Bxon6qQ1xa0r3OWWTSMNDNyv30=;
        b=ZWVhHo6XE2AyiNiC/RKZXIVQCPljHRUilfjSTxXj5jyzCu2VpSlfRSow3YVIxU7t6o
         +d2AqwFtWAVZzktDbPxk3urGafMXVeBpCSqcnzrHXzR10KbIDgGxBlxS6+iu12GL6Wk/
         7Cjo14C+FStgMNwKUCm8kcmOBphr29CsOrPaK8+clMLFYveE0AQW1Y4q6OygIi1I8mKO
         iPAUpX1fAMhCzpXCsYVvAE0yOf5Ga5gN55CdQx7OOfykL1SPw8jR4oikFM+F1uvCDFpy
         iDQgAbAUoQ3+OoATQxvrb+c3CUJ6R4ywxjJNTNAw4xJiLjHt6ZzbrUebHZOQ/ruqKyXJ
         fz8w==
X-Forwarded-Encrypted: i=1; AKwUvBzjCidL8e3kwthKlUChK+NgZyBxyGwaWR8r5djuvYxAnKpXTVE5yJeZouedl5SXsBiMNLoj6H0So1ieOVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJd+oWjeZsmt5RYqS9NM6n2PNGH2QCQrmXL4CS9mow//CAbYkl5
	r/cuICYajUPCeIBmGeWfPEDjNH9mxFyPnHUQsn4T3j+stY4oTzrJa5cv6mnCEX8C49IOsHpCCyx
	IUAf7zbEH34rUu73cpNfQbD2lHLohkK9lqDGmru17vk/9i9fSS1Parf4HpprGiPHS8zw=
X-Gm-Gg: AYBFou15s28s/VqVvkkZXj/9y8CJIu+X/TbBcj+gkdIXeF+/P7yZSr8how9KEF/mC6C
	+3wvUWomC7PQld1nrMD2cGRAemRnT8/coks1m7EDu4/9xIXq4hjjYr3W2O0hbR2U6AVlOm/uQSS
	gOHdiXE7hSiGr017WyUEzReIOLnyX0p9Le2BxIcnrqk9YUpLuNDjcYF5gBJNAb/fWkeLivvATCV
	IitcKWqtXrWVlGVwbQjehtipjZKHp1W04oB7I5uHiMV1uwlYFr7YgCKC0bTtVSePauPpz54MQpC
	RCz5oUApCreVJsnqtp61nXpF2kJaJZuSPCGXLAlIK1Oc9Y5iSgx5Qea0kyJoDVPKy22I7jpITwe
	nLf3sJ1rLorsau+etV12kB14iIKKV
X-Received: by 2002:a05:7300:5bab:b0:360:b8b4:840a with SMTP id 5a478bee46e88-369e866092cmr4619415eec.39.1792849619319;
        Sat, 24 Oct 2026 06:46:59 -0700 (PDT)
X-Received: by 2002:a05:7300:5bab:b0:360:b8b4:840a with SMTP id 5a478bee46e88-369e866092cmr4619372eec.39.1792849618749;
        Sat, 24 Oct 2026 06:46:58 -0700 (PDT)
Received: from [192.168.29.10] ([49.37.153.119])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8c576ebsm7261505eec.3.2026.10.24.06.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 06:46:58 -0700 (PDT)
Message-ID: <48e7d80c-ddd3-4a53-82d8-588c3c439709@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 19:16:47 +0530
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
Subject: Re: [PATCH 3/5] firmware: qcom: Add an TEE bus based ICE back-end
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261021-ice-migrate-tee-svc-v1-3-b035be7aab0a@oss.qualcomm.com>
 <0b389532-a917-49fc-a827-3b90d3ffd95b@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <0b389532-a917-49fc-a827-3b90d3ffd95b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA1NCBTYWx0ZWRfX2x0YOtU01qUw
 jVnUc1v2yGaJPEJav+DKnHf+y9LfFppYqx95hCbi3KLZpIJHX7emk9OyNCeg+2bQ1nQbXCNv/9t
 K2eS+EluaFmtP61GYwkyX6oR52YHfRw=
X-Proofpoint-GUID: MvN8i2Mh_RQ9EFtmJznwlh8R2vLpZchp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA1NCBTYWx0ZWRfXzLpvCtmOzv5W
 hcWTdEa8TqrdvB+jVjg4HUDNq4lk8f9h6pjC5aUxDkKektPkhn7go7GyfaoLGG+uIQmlutxKKy1
 csy89l/hWM7TNxQN5RedX+swqcm6HR8jqNHNJVRP+vARFnKQTjMiUzNc99c2WCloSj8hN2VT2pB
 6iv/XaR/klpSS86FAiuCIOCeaibpYslrfSCm9lO/dymHcjKfcJNvTF4uDMhMCwo0dLXpgUUYEgA
 XUtUGvK7GEucOKFli05cypefX3OczufAJdWAlIGT5o/itbHrcThMgt1PFRotowisJKzAZvLiSaV
 VjkMdlDW6cwnWOiHcfCrNwUiDlyUjpQyGnzSUdxcrUjO9vr6zfztuDJtCO0+1+ust+eHWl2nAMJ
 SebQPq2x5yWvHzN93N2OO/1UAJ7kxFuQgckPs3cXMKQZD+wUHo6+2KFCXwg7Q246Vhv5+SCs0T6
 jvuZM6Tn2c4Pg46CVXA==
X-Proofpoint-ORIG-GUID: MvN8i2Mh_RQ9EFtmJznwlh8R2vLpZchp
X-Authority-Analysis: v=2.4 cv=D5vSufRj c=1 sm=1 tr=0 ts=6adcb6d4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=hZ1hWxSZf3UX9FuxeSnJ0A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=Zjkt8Mza7GcpNY6LC2EA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240054

Hi Konrad,

On 22-10-2026 01:21 pm, Konrad Dybcio wrote:
> On 10/21/26 5:43 PM, Harshal Dev wrote:
>> Add support for a TEE client driver which forwards calls from the Inline
>> Crypto Engine (ICE) service (invoked by the ICE driver) to the OPTEE ICE
>> Psuedo-TA.
>>
>> The ICE PTA supports both ICE Legacy and Standard modes. In Standard mode
>> Hardware Key Manager v1 is supported.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
> [...]
> 
>> +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
>> +	if (ret < 0 || inv_arg.ret != 0) {
>> +		dev_err(dev,
>> +			"ICE generate_key failed, ret=%d, err=0x%x\n",
>> +			ret, inv_arg.ret);
>> +		ret = ret ?: -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	buf = tee_shm_get_va(key_shm, 0);
> 
> This can return an ERR_PTR()
> 
>

Ack. 
>> +	out_size = param[0].u.memref.size;
> 
> This returned size is not validated, there are a couple occurences
> of that
> 
> 
>

Ack, will fix in qcom_ice_tee_wrapped_key_call() as well. 
>> +
>> +	memcpy(lt_key, buf, lt_key_size);
>> +	memzero_explicit(buf, out_size);
>> +out:
>> +	tee_shm_free(key_shm);
> 
> LLM is concerned about freeing the key without zeroing the memory
> first
>

When the TEE invoke call fails, the TEE must not touch the out_buf.
We trust the TEE to behave correctly, since it is a 'Trusted' EE after all. :)

When we fail after a successful call from the TEE, we must clear the buffer.
I will check for returned size and ERR_PTR() and clear the out_buf in that
case.

Ack. 
>> +static int qcom_ice_tee_probe(struct tee_client_device *ice_dev)
>> +{
>> +	struct device *dev = &ice_dev->dev;
>> +	struct qcom_ice_tee_private *data;
>> +	struct tee_ioctl_open_session_arg sess_arg = {
>> +		.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL,
>> +	};
>> +	int ret, err = -ENODEV;
>> +
>> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
>> +	if (IS_ERR(data->ctx))
>> +		return -ENODEV;
>> +
>> +	export_uuid(sess_arg.uuid, &ice_dev->id.uuid);
>> +	ret = tee_client_open_session(data->ctx, &sess_arg, NULL);
>> +	if (ret < 0 || sess_arg.ret != 0) {
>> +		dev_err(dev,
>> +			"tee_client_open_session failed, ret=%d, err=0x%x\n",
>> +			ret, sess_arg.ret);
>> +		err = ret ?: -EINVAL;
>> +		goto out_ctx;
> 
> Should we care about the specific retval that comes from the TEE?
>

Traditionally TEE client drivers do not map the TEE error codes to kernel ones
since a 1-1 mapping is not always possible. Also, since the ICE client driver whose
calls land into this API via the intermediate ICE service would not know whether
it is calling into QTEE or OPTEE, any error-code mapping we create here would
possibly conflict with the ones returned from QTEE.

So returning a generic error code while printing the specific TEE error in the log
helps keep things simple and easy to debug.

I'm open to any alternative suggestions.

 
>> +	}
>> +
>> +	data->session_id = sess_arg.session;
>> +	dev_set_drvdata(dev, data);
>> +
>> +	qcom_ice_ops_tee.dev = dev;
>> +	qcom_ice_svc_ops_register(&qcom_ice_ops_tee);
> 
> This can fail (but it currently returns void)
>

Practically it can never fail because if the platform boots with OPTEE, QCOM_SCM never
calls this. Alternatively if QTEE boots this TEE client driver never makes this call.
This is why the QCOM_PAS driver also returns a void from a similar function:
https://elixir.bootlin.com/linux/v7.3-rc5/source/drivers/firmware/qcom/qcom_pas.c#L279

Hypothetically it could fail. If it fails:
1. QCOM_SCM should ignore the failure and continue to probe because it provides a
lot of other functionalities apart from the ICE SCM calls.
2. This TEE client driver should fail probe because it only provides ICE functionality. 

I can cover this hypothetical scenario by making the function return a failure which
QCOM_SCM ignores but this driver interprets as fatal. But it could open another Pandora's
box of compiler/static analysis tool warnings.

Let me know.
Regards,
Harshal 
> Konrad

