Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386285;
	b=PTe3Vqm+cpwOkuN/NstGeMXYY608uEXfFEI08bYWAnpazkQuLywi7tLdnr519aBmBTeS
	 yAG8bItkvuPb+ne+yMuUr0GrQZjyi7wREjCouKU9tJP5tM22GsBmonfiBxKfSIISSNaGL
	 b92DRkss9xNuXaZsce0E3qKAm1k0Jc9KczCjCzdhvxCS3YxiZPCZvpL9uejS1o7aE0TFN
	 2iFh16StI1unY+h7XxWLY23+lw/NS7Entqglk0i53T3vbbDE/8/jWwUF5oNV8e9os0GhV
	 q/ksdXw7IfmQFN3S3KpgI5RTBWAsSGcCD4NoeJysbkGdITkeKXGRh0dOqIucL1+9GHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gw5+l/0X8hCUV3pAatH+kYAoIZTakO9BDt3Xr52dR7I=;
	b=jE2baXnunq8BpaoLkTbjFmWBsYvR1cVi5vA+5mBe6K9/DCzy44/a7+oGvhrfxLrhs5cz
	 J7IWf93NHG5xF/KYRwBT9gleIa5VofBYuv22hun0Bo8ccAdhMLVAu/VV5HXrYe/FrOhbm
	 /H+5xtfGU6/qzVBdsy1wdqvyFvBSX9LIYe0Ux7GISVjV0KW3OmC+q3acouOm8i29UoHVZ
	 VKqsQUqKZhZQuIr9QElPITHCtASxcQVjm92ldDyTCcZQnXvdwENyHGljvtlqK6afJ3ek9
	 2x67d5qWa0oOIABfBdLOHDxlOm7OAJiUCFh/tgslW/IiRM9qATSvSdQpM8kmbiJ4xHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="moXvA8H/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hreAjHaY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1167A606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1167A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=moXvA8H/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hreAjHaY
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KIgq1386358
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gw5+l/0X8hCUV3pAatH+kYAoIZTakO9BDt3Xr52dR7I=; b=moXvA8H/k0DpUIk4
	lY9w/LdPlAq7sEgrI3Bg+iQMIbcqWwsIi7En6h0dWGcJ2wgIUmRWR9DqciOLeb9f
	3E4rtwvhCyBMp4XGLLSAtNQQgZj9MBsMVgXZURvzkD9A4dAfy47xPfP05yMHXc6n
	pNBuZngbFXr9ZgcXlLw6Fr6CPZZKS/2SFXNh+zo6L5foTdkrnTHPN6/DDLFB0yaX
	JGzH7c/jq6gDnFcZUzEg3FESgXR0wJlIt7o/5u19B+TNP4qpuxYtchW/DBiRfuqq
	Hk93+AafEtpisLIAsq9N2Mv1TzsxfCv0NK53xgo4ZCm7m4WfLQh7QJjRslA+kTZe
	UASsEw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm9nc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:38:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5870384eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386283; x=1794991083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gw5+l/0X8hCUV3pAatH+kYAoIZTakO9BDt3Xr52dR7I=;
        b=hreAjHaY4pmPcE5AD6mScQ9iVhTUFHo7SXGwZTLyU1HJ6dZiyppUHo1vxnVheoiTFe
         qCILmTYu1sZYYbEQFPOm58Jt6y46BJ4N+hGrMEbEl2lFzizn8rhzIThi563lUzUqVWMH
         KkXrqBqMC+OcIlTWee/XeP560zYDs9qRjY5qhdbsStZcu/MXBoPL1+INqNbPB1ABJ3mk
         jlShdpbZZzqEN2f0+LrtUf8uhDWg8HbTpBPjldmGeJMic64npgSm2zLXpkIHBquXalmi
         XKxcexmnnQeX1/OWP05ZkOguWj2cBbEe6wr9/s/dSgEdB1+GahOJkM0/Vu3KN2+zYbSW
         sB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386283; x=1794991083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gw5+l/0X8hCUV3pAatH+kYAoIZTakO9BDt3Xr52dR7I=;
        b=Dg9uowzOkYGq5XT3+hvKD2EkL7RytsBDL/CsamwqPZbMuqARoedDWk501347w7tlB8
         MIckMBa+ES3r0vMkpFtJlC5A73R8lvWgYfDIoSg8MJn3xfTK325RfOwFNSIEXjiT0jmC
         d5gSNU11cVEXZDD4wZhpsSuDWo5sq/2bxHGD4gANskztBfeuC5q7Kgb+aLeXKAMu6CBQ
         XFmkPA6YxkVuNTVk7TI/DLkvjQN55YzoDpZfcZUV0k2O0IXcg6kDuQRiQvN9o74jNyqa
         1yTlqhEAt+iHW/IAjNVC20ZGqlZb3tjCEdFJpfz2sjh8OZDFGg7L5pBWU+cOmc9M49aZ
         0P8w==
X-Forwarded-Encrypted: i=1; AL+hErEybtfU0cG2hUkiJQJanxYV+yyHo9FUacKstsiw/Gfpsrk9apGQzaDtL8sykeLck92uFv9+MocdMsCJ/2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T31ZDXSkxH4ogw08+gJHzYSW5vDkE5vkctwj/mwVXozKeymEG
	7jSYKKVN+LiVDYZq3FTeNT3FJCOfKQCWBq/EJuKJUMKkmFgioasIb3ffckCGxwmeJ4yQkLUWxI5
	qH1ISP/tAw73OZ6DoEnPvynZVdmanRae6AHX1Q4JDnJiP0isTSFKiYkFl3mPm1sjD7r0=
X-Gm-Gg: AYBFou1VtXo2HcQibLtQ2Q7SKYL9k9tMLT+rxEC+szaLAHFB7jneonxhKjfaAWyK/8I
	tdmpkg2ZeUIDw+zA4pxCADplMQo5O/fnlghXawFfkopQcxIb6vWYvMZR+RMFXp3m6IGRfm5u8Ql
	oUc2kYwT3CVwSkfRXQW1ppUayqONdYb2t3IdRwZGPzJdI91K+Pa1ktSHojGUKPn0hlYqjOvMIVh
	tUoFkhbwQL1+VPykaTbv4JowLmK24Xe9Os8sIRFDVa1TFZERxkdHQnQotynUbfLL11fDzINbDR9
	IfAG5hRHkHdHLMbsGRfa/rrK9xhHvNv/b6WbqBd8K0inzbIU2cdc7MWJcw8FZJGxhAMloEAXJZd
	sy0rNLXKRV9OxwA1OR/IV8KvZBbqx5fgHvk9O7wBbOIBMcUSSRrjvcibK0AbTDYoLZk+lDT+DjO
	AgUg==
X-Received: by 2002:a05:7300:f54b:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37685c7a866mr2252065eec.25.1794386282847;
        Wed, 11 Nov 2026 00:38:02 -0800 (PST)
X-Received: by 2002:a05:7300:f54b:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37685c7a866mr2252038eec.25.1794386282338;
        Wed, 11 Nov 2026 00:38:02 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm14512824eec.7.2026.11.11.00.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:38:01 -0800 (PST)
Message-ID: <f915ffa9-e094-4ee8-84f6-ecac642fea1a@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:07:51 +0530
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
Subject: Re: [PATCH v4 16/25] accel/qda: Add DSP process creation and release
 to the legacy shim
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, rob.clark@oss.qualcomm.com, jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-16-88f2f24a5f0b@qti.qualcomm.com>
 <f030a190-0cd9-4f6d-9a71-ab08dd760a02@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <f030a190-0cd9-4f6d-9a71-ab08dd760a02@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: duqJ6VjlaA_dVk7U2-97RukoEDupPY1z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfXwwn1vw9GWOtT
 vbWx8OV3RZK50NdvW+otf3l0vhzjdujYUCppB2VZpnZj6dXQ0a44UrStO9Dr/DeelTA/FFHSkXG
 W1yXzzTW/ipW3DsgiQcsTuRulRjTqVQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX5q2LXjireZRo
 wvaszlm8W/WX9GwoK2zxqHHUqomMxFFs3r+wE2hjmKbZlj1PNG/557AsdhS8pT7I/5RP7Is48Gu
 cCV6tR5A5gKTqTEcwmBkGSAoTPqA95FtgnyF4zBp0V8Sv8U+WGddopemNKlm1iW6PHXK2xLwngo
 Ojgd+MYUyJwE3DTuQtXVS283jbPSVP76EFkSOBwx8tTz4zc3/mN5KVe7scnqAYfaRL7bJveATzP
 AT8ZyPy21hfkEnTslb69FBLrfwUX32c/A2KCHF8p2N8/23RuMaV39gw9oUCl/WEMO//qnneyLcD
 MrFo6fhM3hLHnlXzEVBMx5VpxYTu8TjCeZ3ZlkUGNlnoE5bi2FkhKNtREP7XYrmhU/3bhytS1Ok
 D/sD6aft7x4kw83vwxo1z/yDSdaaXhdQ0uDjAzjW3xGfh8ADMG4UXU/hzUzFsB+X5jUCPM/NlWf
 aCiCEjCAlFmLBlPkHig==
X-Proofpoint-GUID: duqJ6VjlaA_dVk7U2-97RukoEDupPY1z
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af4296c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=_9VnGE74eSGUFLHFbeEA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110034

On 02-11-2026 14:17, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>>  	snode->sdev = sdev;
>> +	snode->secure = secure;
>>  	snode->miscdev.minor = MISC_DYNAMIC_MINOR;
>>  	snode->miscdev.name = snode->name;
>>  	snode->miscdev.fops = &qda_shim_fops;
>> @@ -293,8 +346,6 @@ static int qda_shim_probe(struct auxiliary_device *auxdev,
>>  			  const struct auxiliary_device_id *id)
>>  {
>>  	struct qda_dev *qdev = dev_get_platdata(&auxdev->dev);
>> -	bool secure_channel = !of_property_read_bool(qdev->dev->of_node,
>> -						     "qcom,non-secure-domain");
> 
> You just added these lines two patches earlier.
> 
> You are adding COMPLETELY new driver, so adding completely new code and
> then removing it is confusing. It means you added something which was
> not needed.
I'll restructure this properly.

> 
> 
> Best regards,
> Krzysztof

