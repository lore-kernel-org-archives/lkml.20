Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262EF43DA20
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515102; cv=none; b=uDlas2/csjpXksBoHZXIxmt8g4gOSr1McKoNR05aifckA+0Vvo9jXNJuCwTQeP3HgapfiH/LxEh5e+M+TxceJUz+NBILa4bXFp3nxw4cYN5ad8fP3qRLMBax0YoW2Fqw8kWoWwuQg5LJKaOQtE8l93kdPp7Oeb0jmvivRrmA2e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515102; c=relaxed/simple;
	bh=zVrsOBbUBsqRW8lZE59vCWEnEi6cLmNkhdl/0iaYt6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLGEjF8/WKp2a+IadotCTlr1C1f9k1ZYSfi1+BcnGbqxBuOShXFnmE6xAJeubYMa5BMtzKm/VW3JP1I6jqXFbSpr8Ou1Ntqw70432+zjR6ZptYTGt9q1jXOAGaYOvefrZ1hkOa9F1oKEY5AUOmLr4LiZKF0A2Kw4+hbhr0uYNkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+ylvqLL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HlT7wDXP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+ylvqLL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HlT7wDXP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mu3G2430365
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 09:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8D5YW4aMjYqkv07n5OIFJYINICm6DBJu2yq9WVbe+8=; b=I+ylvqLLLLgJPGX0
	J4MRCr1bKezTgXDYnj6VwxvaI14kiNq83vRgzc2OZShwpLAt65CC7bWQOOG4NDhS
	eZDowL7tahOXy4y6LgcF/EBMEnjEtcI+4wxlhPEYGTBZEqqQwJhmIqgOf4C7NQ6w
	13d6QSs7uQCmoydDb8q7HwMz2EHLEBg1XbPDTy0M5TkenpgtSw7PcoF9AvcoIqg6
	787fNoKGjFPZEYr1yGKEQLGxwd6Gxy/M6zpeDaxACjYUWemAJxPxU7h8rTYogyvt
	tXa5KmElgYFevjgXUEq4TNcPaI67wNgCiYMwiyUkTQNo3f0u8C++t8KAmwBa61/G
	9jC7Og==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfk921mbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:45:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ffd22d2b1so2074161cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788515098; x=1789119898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8D5YW4aMjYqkv07n5OIFJYINICm6DBJu2yq9WVbe+8=;
        b=HlT7wDXPnnb/qidYJmjTQPMDy7Gzu6XStDjlrWvgsyj+OoeKbn5E1mfNv9ggjexgUJ
         10UjBITdtyFdXi9djZ8S+doXg8Y7UwQGClbyk9+oFPW+EsSi5h/Xg4IKWBEwNHBCJIiI
         HEeH4F81UG9qTrh11LvNJLeqN9At6dnrGbH/Q49O3U7qti+UW2PWQnkDCl2M2nWhKBPf
         mXFuJCPZONEe8w7D6VHu3v0BqNcMuthmyBO34cS1Nq+YCDG06JzGJsYGTaUcBnutk9xV
         3/AHZnFAaSuLkZwa43HiDRiLsewctUnO5XagxrZh2QjVqBK1uibu+fommufsg+gD5DfS
         Q1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788515098; x=1789119898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8D5YW4aMjYqkv07n5OIFJYINICm6DBJu2yq9WVbe+8=;
        b=cU1z2svWSkg2jv/g/7nz3ETvn2g/0U/MhwRs/0TdGVZD8qjvXtV3S+YlmHtHHnYi/6
         99+rNg+I4spmZUAcuY1/n+XTkfDf6OztScoj9Z+32yUDDP3xAxBO7aLcYUgMAiLQUKwl
         DZEFP4jp0G5BHc3BYpuaP0ob1ZlvvbQQAfFFeewWaoOlBeZpjpHSuzldZ3xbh+ZAfW3Q
         HdVbQX2FuKSMQ6GnZjR6AMxORnWgDRby0ZPiEWGfVXS5FKzHMZrWO5kI+Al8Hh8zMY6u
         1IvP5cYUBOGNc0ZAY/a+CSWIdAxjskxTVwZs+3ty3FgWvtViSV7HwXc70vLObncQbwbQ
         68zA==
X-Forwarded-Encrypted: i=1; AKwUvBxKAYKN3KBz/U0eFBlqYKY4dsgruf7YnSk+MK2SAois4x6ug5POr2GFkg80xg0AUvO41rNPMDeK5ph91SI=@vger.kernel.org
X-Gm-Message-State: AFuF++lLBYQv3jvmA852VxyYxzXSIEfpWhYnuyKsmift1zMWkNOaNcko
	v7tMVQmiAx5O3LIuTC4/5xtownkFrDfbnUYI69/E38YBYnF3bOtLyOKdB2Lak7kxowJSehi5xMk
	sdaPpHwsrgu26A0pIuw54+2Djt/Jf0hUYf4oux3aJ7EkuhZ/eMxSmHUk61g/pkvImXmb6vxIxVQ
	Q=
X-Gm-Gg: AYBFou1s1Hi0jjUKUgKuGsGGSNE2Q14M26d5SVTbZ5i09s3gs+TUN+HrNg8AYaMpb5L
	2gyKFPYZcBWHZ020SWBAUVIEjPbi/xe9SVivQz+iTpFmCWJcxFllMI+CJlTMU9x44/PcQ1lXOyq
	p/PZWu8Y+rAWumCfFy8AZ5d7YHLdhNGDluZSrYJ0eY8AzzZGjNsOi0o7mXLCUYB0yfigH5tdwCz
	HGrDnWYIgBgrl7C6J5CljJMZHDiceB6KPscB6qQDHqKl5sX8qz0wQHLpFvChVDCFXQXkXKbLkwT
	SMsGiOUmCAIeQtdneH9Ceu2xIZI9iuuRSqgvERrTZtav96rKu4z7aTO/oYpY7s8JTuECJmEMPEb
	keiuJoke44sUV5hwaa8dN0Q==
X-Received: by 2002:a05:620a:4686:b0:939:47f4:935a with SMTP id af79cd13be357-939807adf30mr345133785a.5.1788515097836;
        Fri, 04 Sep 2026 02:44:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:939:47f4:935a with SMTP id af79cd13be357-939807adf30mr345131285a.5.1788515097419;
        Fri, 04 Sep 2026 02:44:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6dfad6sm83831366b.60.2026.09.04.02.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:44:56 -0700 (PDT)
Message-ID: <62c7ed77-32c7-4e4a-ab44-64bb174a88f8@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:44:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform: arm64: Add Radxa SVC GLINK driver
To: Xilin Wu <sophon@radxa.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20260831-radxa-svc-v1-0-7c028de6a387@radxa.com>
 <20260831-radxa-svc-v1-1-7c028de6a387@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831-radxa-svc-v1-1-7c028de6a387@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX/wGzNYJ3AhIh
 rjgIIrFe0WR2DwIA1GaF9Nfzx28OGZ0ePnq1RAGS+/v3SImm1uC1pBlZBvAVGQsunNWHYM+O5hL
 0+WM4O7NsR22HPNxZEnIO7keedrk2aDnaHppp5qEQtJAdcBWuNnNQZLRvXs1MGTwHgipdjuOUv5
 XY4pLgbJmP0bDdqYOp5B1hUWhxHrLC4PJfgp89MHi1FPpUzrHq70/7EqVv9jqbyjO51dPBEN9n8
 XQ875zcWw0R/NLJNeFE7I9tPSzNk82e00u6wflf+EPDKtNjG2iVjTTZxzra6nEiVn8rVoHdoRj0
 3KqrkrW93K7OBc5ArcP6nBdYLPz+iwRCDXmv0Mux3M78xgaf1s3+iobOWtegTHLxB3Mc9orAdum
 DWRL33WmVgH25qDKjEYn/ocTVFxSVqAn8ezl1BkOc8/mLKfP6MLl2OfTZXX67roZoWOQCSAGvdR
 QY3vN/GhsXvSxjlcxqQ==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=6a9a931c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ksxQWNrZAAAA:8 a=oytB4wdSUnn8FBOm40sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: cVMXy3O1RrZVDeiXphkfqoc5QR1ndE6R
X-Proofpoint-GUID: cVMXy3O1RrZVDeiXphkfqoc5QR1ndE6R
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX7d5qMxe6bORn
 +95wICRgaFQNnX++3m19voSO/qa/JQ8Tx2k2d1LvfwDlaxo8zWVXJV5ujxdxFYFtwlSSrl5+xZB
 DEd+M3MHDnEhaZgbjbs8wZLrJYuxZ40=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040088

On 8/31/26 5:09 PM, Xilin Wu wrote:
> Add an rpmsg client for the RADXA_SVC_ADSP_APPS firmware service used
> on supported Radxa boards with Qualcomm SoCs.
> 
> Expose fan control through the standard hwmon pwm1 and pwm1_enable
> attributes. SET_PROFILE only changes the fan curve, so map its quiet and
> performance curves to automatic modes instead of platform_profile.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

[...]

> +static int radxa_svc_request(struct radxa_svc_glink *svc, u32 opcode,
> +			     const void *req_payload, size_t req_len,
> +			     void *rsp_payload, size_t *rsp_len);

I don't think you need this forward-declaration

[...]


> +	reinit_completion(&svc->rsp);
> +
> +	spin_lock_irqsave(&svc->rsp_lock, flags);


GPT says:

High: A late response from a timed-out request can complete and corrupt
the next transaction.

In patch 1, radxa_svc_request() clears pending and returns after the
5-second timeout, then a later request calls reinit_completion() and
installs its new pending_seq (patch lines 526-540, 550-555). The callback
sets do_complete under rsp_lock, drops the lock, and only then calls
complete() (patch lines 612-624). 

Konrad
