Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9F05437D6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954742; cv=none; b=aLrGzBjoNNmCAgnehq3pirUasN3W0+KwO+qv1nD73qY6+vgpRnjgKGgnwK8dBIq4JptC0ARfRuZThsQGMxpUxGUVnAH/m73SilccJa2xYhlBhqK2DuXgvoiJDgQr0JIwpKQyhjwLDeCt8umaFOfMHnK2Z44PaT5BANiHncrty2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954742; c=relaxed/simple;
	bh=wynWGA4fk1dSOZfkILyjQAZw/pninY0nN4ZGWNEnsL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kShrSuH8uqeGvUMgO1xRU8rTkXHBrP0urp1RtKV5UahYLBgQ2qZf+GhblQyyEhulcDRxD2j3JFEOV1iR3jepFd3sNk6sAxa+zu8tZdZ36WyOTOAn9jAHfkqlmjF2HV5pTA9jJ6m5BS0Ai6gbUNTEsZQDa8UIBQwq/4vek8acERc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GoB8j0+o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AfmgockH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GoB8j0+o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AfmgockH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUCd21307942
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWVC0il5ooJ5HqrOgC2T3F4oate1AqgFeCGJdC2H1M4=; b=GoB8j0+oNcLw46Wu
	W3PMSyrJBelM5vMugl7TFZcsdxIPc0fF9IkODtHREuycZBztaXUBw+XcqSiHXhbl
	30Ps9ie4Gk8EbMFgvDr2MXZGxe6Z2LOYGWW/w7qNjx0uAmDGETHSK6sbdvklYy97
	letFusq5wnhD2/hDhpl2+iSKNzJbYwHRy9E8MMVoe+D1TYG7coxggnbgZ6xX0PC/
	ccAcx4CJ2w4EETXuNvpAZCaF9t2LYdnLZ/wKkzSQzHnsRk6Rb1AGHEoR8cRIZ9aQ
	6kLlcVHiA/LVvd9W9lxm+Uvbb0Yc4uC5dvCc5tQvWaprGpFxaXXbKupbaI5TXeUX
	lFmPtA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjstub27y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:52:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d7ef17031so8598071cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954739; x=1789559539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWVC0il5ooJ5HqrOgC2T3F4oate1AqgFeCGJdC2H1M4=;
        b=AfmgockHihcuuIqRMvsUFRHUBVW97Zlh8Ke49wS5xLTSj5nSakbZbPl6PX5S/jL8O3
         zCwn9DsAjVUhja22GfLQ8AU+5mkzMeFtA0CdezTC9uJLG8FY/QBoRu5qZiwt/kXHDXnF
         yP/1sZ0a9ZlY4vqbKaP2lgGxKSwWSuFRQljdSM+jHPVQnVkXobSUGa3fptK2oCzt/RXx
         dNh2r3YJUUzMU6y+OInD6Army6lOF63At6YoIXXfCDNqbs6RUtfASyVtxDNwTYYnUHwB
         7ebNC7yTKSmcslBGqJR8PHe/MY/MqcUf94mvxTjTe7ffJiaPkwqQOlkQ556TxOW+CTCY
         rMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954739; x=1789559539;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWVC0il5ooJ5HqrOgC2T3F4oate1AqgFeCGJdC2H1M4=;
        b=pjBMZDM3ScoZMM8HezO3RoLD24LqXXvpQAQm1J5m/QHP7/DDV2LAdjOB07p326oq4v
         N816Smhupb9I2/Mrqfx2X/mEhbGad5SvmdcYoZ7R39BxZQzhBEHzUKoqyaKojFh+0Sq4
         wDlI1s2WJ5l2I4cSM+fTRUPEpzBmZ6iMbpeTsxZm4VDiBpZVa56kTqkWSLh9AthDZVy/
         g1fip0U8nZAlVtVP9puH+w7CPSlj6S4lbuDiHycfLvpxQsCOTxqc6flqO5o9qXNXMfgX
         J9tzetjNcLCIjUES6dyKtcVMqGHLd6VcplSGJqfM+ScKXmjydQrc5CLguNVcQVTESEtN
         dK6w==
X-Forwarded-Encrypted: i=1; AKwUvBw0TQexrX5P6ZHuUX2h3ZMPWIu7LAPQEcjVEyNAy+VMOG2hlCxwZhjcge2ibm051Min40X95HfVHPL2F7U=@vger.kernel.org
X-Gm-Message-State: AFuF++lrMsSbciNls8Elu0xeCsp5DaHum2cVtrDelSuZO7plqslr/odT
	oubev4Qf/ndsIOkQjHSVbD6KKFRph0CzYUapHXNvtyGaGYRZ1UdnOeO75hIWrXbjLnPIFwEzQE7
	WnjFTl2auzJ/3STJ/RJv0gUCtnXpNmqdwBNzqOl2QnFa5ajrRXCvxXgXfOgXVWKT0sx8=
X-Gm-Gg: AYBFou3Uo0pgV9oVp0LDgSHQ0caAttF1rTt6OhX18UIFKF/k7k30Bf36GVm4rWqzsEG
	9NVGvLh7UFV46xSnMFwU4f/YwZLb6hhe1lIHAa1umrwIWRqL0W0+9wEwXh9nGmFtVmR8IiIl2/T
	gGoVz5mN9KESc7LrihuPF0q8BWlE2LNJb/UgyuZkCVeq6fw6O0PIhPi7I/AVHbNk42qu4lkVKSN
	lehe+fxV+H0Pz66OP5hNM0xD29z4q0YUzsTHO1w3ejSX6GvbhvKO7u15OJpnfSHC2aCtRnsM7qA
	HPmVXR2sZkQnJRPlx28QHj4xsgyo5LO6/7D0wplZY/SZKdUHRhQmyD++dNOg7OKLzfi4gEpIcgc
	Iio6IZ2TlzovbCFswCXSfeQ==
X-Received: by 2002:ad4:5fce:0:b0:90e:8d21:714 with SMTP id 6a1803df08f44-910476de413mr284196176d6.2.1788954734410;
        Wed, 09 Sep 2026 04:52:14 -0700 (PDT)
X-Received: by 2002:ad4:5fce:0:b0:90e:8d21:714 with SMTP id 6a1803df08f44-910476de413mr284195746d6.2.1788954733843;
        Wed, 09 Sep 2026 04:52:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d55b306sm756078766b.36.2026.09.09.04.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:52:12 -0700 (PDT)
Message-ID: <2b163290-d57c-4e84-99b1-d94fb5f45f79@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:52:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] power: reset: qcom-pon: Drop reason shift for PMK8350
To: Alexander Koskovich <akoskovich@pm.me>,
        Sebastian Reichel
 <sre@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907-pon-pbs-v1-1-cff2f5810769@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-pon-pbs-v1-1-cff2f5810769@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ItAutr/g c=1 sm=1 tr=0 ts=6aa14874 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=XjHw8PULWccToXi1muEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMiBTYWx0ZWRfX82kWUvAGsTIt
 u1EyEM1af3M6NGtI9IHEVwPYqjhq25FNg8ojhfv4/JD6WxbF3WJ2phDtv8pwAIr77Qj+azyTwY7
 NEVu2o02AwBjPgWNz9ezN/ndUrbfNy8=
X-Proofpoint-ORIG-GUID: 7E901daHyiE8wy3UHi9JsSUVF_MIFhLl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMiBTYWx0ZWRfX/w60TcwIvbcp
 SZGKPoPm9RxZiaPtSU/xAHy7sDsIg/7HKUacv69iTToH1SnaKHR6UAzRWv77xa1OnKq9dmbaLUr
 tyjKtdMeNP03DevqvT2+79NsHm2RT+v2ndf/DyK+XHZ9M8XYXOA4s+ARc5N63yixA2BiJrHOUi4
 B7N9w33YocNN0ThJlJqFfUQOauD6/NNdgIQHsE5VprcqfNUG71avZ5+K/hsglWWKWRRcw3PtK6n
 gRCWEEXW+Yg4Wkhin7efUKZ83EqbBSUPj/YKfFt/vR7iLystIgjakBvF5U9uRnluaCEsZhCqKem
 92OvDKKt1SYLsuNyNzqjHwdF2jrTVPKtpioVajOs8J2IR50bM0nPayXojt3n/KMbYKJ2FdV03Tw
 WwgQDBWvBmZDj2wVFeIEpMLFTiLmtxw+VutVgbEjtVf07ZVoKBdxtcGnVjd8M+94rsFanO/unY4
 NlV5xzUFkPXLn6aNt+A==
X-Proofpoint-GUID: 7E901daHyiE8wy3UHi9JsSUVF_MIFhLl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090132

On 9/7/26 6:44 PM, Alexander Koskovich wrote:
> On the PMK8350 the SOFT_RB_SPARE register does not exist, the reset
> reason is instead kept in SDAM and written through the reboot-reason
> nvmem cell.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
> Would like some feedback on this as I'm seeing conflicting results,
> SOFT_RB_SPARE does not exist on HLOS but it looks like the downstream
> qpnp-power-on driver writes to XVDD_RB_SPARE2 for GEN3, which is on PBS.
> 
> Though, targets like waipio don't seem to have access to write to PBS
> from HLOS? Get SPMI errors when I try. Didn't have an issue doing so on
> milos though.
> 
> Besides, the bindings doesn't allow reboot modes on PMK8350 so maybe
> setting no reason shift is correct regardless so it gets skipped?
> ---

Maybe +Kamal or +Fenglin would know more

Konrad

>  drivers/power/reset/qcom-pon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
> index 7e108982a582..9cd55f5536b4 100644
> --- a/drivers/power/reset/qcom-pon.c
> +++ b/drivers/power/reset/qcom-pon.c
> @@ -90,7 +90,7 @@ static const struct of_device_id qcom_pon_id_table[] = {
>  	{ .compatible = "qcom,pm8941-pon", .data = (void *)NO_REASON_SHIFT },
>  	{ .compatible = "qcom,pms405-pon", .data = (void *)GEN1_REASON_SHIFT },
>  	{ .compatible = "qcom,pm8998-pon", .data = (void *)GEN2_REASON_SHIFT },
> -	{ .compatible = "qcom,pmk8350-pon", .data = (void *)GEN2_REASON_SHIFT },
> +	{ .compatible = "qcom,pmk8350-pon", .data = (void *)NO_REASON_SHIFT },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, qcom_pon_id_table);
> 
> ---
> base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
> change-id: 20260907-pon-pbs-76b7ecaafe33
> 
> Best regards,
