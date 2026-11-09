Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794189774;
	b=TqngePq6x9iwQ+zh/pYuBwibqGm8qSzqQ2qrlaCfI//UDg0DOQzSPBAWhbxKMzjKflNh
	 mPmi/GHnRWJWGdHOmvJfMiKlRPXbTO7qHUZqLknOZpdvYBWci9y9gRwWTNljpvaHdIwY7
	 iwdr/m1pEnS3xI6gwpcfQREVnAIdXX0F/BZ3xF6QGt2y3gSMa2y1BKdp0jWvouSzmB2K4
	 w4ZI8bs/quIyw8Ki4wBj9wPxt6N0t/rtEYIciPUnQz7KjouqsuFm+GiQZsjjOtawRGjll
	 DuI9GrNPiwXPnNJvzPBbnKXYcCBDGf8Q+OY3ZS03iLE+f/SdK7y0XS67HjAbVkvW2sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eKJNiJGcbpr8z6s4EliWO1wvSZdyW+jyuqQmPlvgA6Y=;
	b=Z1o5gYTMGu5v3Vduy2ESHw2JSCsYFAXIjTuDOfMpXwLYRjrUmuSSP/dffuIntbflYrmx
	 s++X7JT1VEv3npI2Kk5AezIXYw7Mavs8IMTveFCfWl2YmtwnTTWBWd+8ENXG9bBM4zmnw
	 oG5Hpufmd+fw7y7uoi1Wj9hgM18Qb4W7bs5Xb1rau81rbL5kymFIzMHYoyQEczNlPjBuP
	 ArgJK5lipnGyIaB3z8D6aEqXiKRjgSnUfN2mMTrFwtEpb6X1xLe6ks8h7PQxnGmdQ6aOi
	 7s/O+Vo++e8Bkp24RQNHxMi4NHOFhtnYDFYedgKtPooYZ+8QlLIkaW/FQH9sowUh4bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PUYUEDMQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VvY1dXsS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACEA606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ACEA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PUYUEDMQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VvY1dXsS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90GpA12871584
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 02:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eKJNiJGcbpr8z6s4EliWO1wvSZdyW+jyuqQmPlvgA6Y=; b=PUYUEDMQqJeTQQse
	vhjkZkDVCHXfmDIDjn+etojLsomIMcUgP5qIr2wdExDl+coNYT0gle9FvsQuIj68
	a/g7b4qBHF9gmVHmFo5jpL5pmd8Gy72X8/sgs6GM84SDc7/Eh6hB3sgfKg3D6xXJ
	eHYed1pCPuQzUgICJiO9f4HKTodcWPH2Stg6daOYahYLJYKnPG69hWP/Fxs1cbTh
	sKa3+XpFHVIDVNCIsYOaHXQ2KopdH7kQLYpcjmrT2SgfkzRppyhLFEn/smbH0xXe
	7yujuGOZvszBjJ9nCZ0mX983a9iRoheTjSVMNUiPRvVEh8M1su8g5Vp6Jy/UgVgI
	PqNVtw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnvpqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:02:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea71803effso4391505ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794189772; x=1794794572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eKJNiJGcbpr8z6s4EliWO1wvSZdyW+jyuqQmPlvgA6Y=;
        b=VvY1dXsSNsNVq4oHjoM1baWEV4UJEr7A0uz+WrzVflQZULCjmVssCSAQp12/ax9qN3
         9Ep8ykB8DHPiRNNRQNY1XiHaZOo2kSGXDd1M1/AtxlohHhB0e2eTpSvtgCox9l5oJ9Ph
         neYYczqyVYaGguyC8IafAi+hcU/35vHScJ5su6Y/vrvkeDcJEPvUONUPJounqnSB6lEM
         /Bx9lopkPDSsv6PuSQPYijrlyVX6lr2sOr9XEOhLvsuPnmU84FqYstwhmlkQC2oaKQkX
         3XONQd8PFRqGwcdQ8bhRtF1Izh5KpH4LVQYKAHOppjb17OpDgFjJhSzB3yJACOO1rpnn
         utzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794189772; x=1794794572;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKJNiJGcbpr8z6s4EliWO1wvSZdyW+jyuqQmPlvgA6Y=;
        b=tefwdiLKWJlvJGAcHvvrywDUq0LpweR1cGfbl9SkWr8fg7By4QzQ7Ej4guAuEZMvn8
         k/hOijfVF0PsCsdS0d9Bx+SI4xQR61D+TGBFrK19eAIu6xqYoZdzI9f1IxBNngtTE6Iy
         33bLeJMaAsGPCpJCHChPe72WeSl3cKNtzJpf59RzGN4b3Ndfq1RXdoJN2gCf7YWh4KJF
         sQzYytI7eZSnJLY8RX3FzQMBgTn36TE34kXzFWkYRI4ofjl+Y/WSw4OmKcaZn+hXF3MP
         5Ika4WHKgdYPz2fkFG+5R3rgJe6/8ynfTWk8M7xrKMVy8aegG01HZSvWsyyviWhac6LQ
         KhkQ==
X-Forwarded-Encrypted: i=1; AL+hErHgHGN/t1BfwsRbvcsQG++6jtjkesxzVVJzM6SZy3S85r9b+Jxu/USyPk+C8HNgtVlw9HGpjZ4z1GOMz3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QeBWqDOQAIdc5BCvNezmYpRGQmMrVH6QwSvLP+upiKLNeEI9z
	FZ5rBuywbBzvERBAyXk1GM0AjHmm6coUAbrT8JlF9ScUgDuOyqbqpgGUBK66Wb1WMKDf3W45lAW
	y6m31huRDb2i1xHcve/1XZD0+dZdLnzbytAsg9NKv1dli9Y+/YlCqrbMjeyyQRa7IEaY=
X-Gm-Gg: AYBFou2Rltf0KbEaMCWafCSV6QjUdCwdCsDeWqH4npZgCvcv+kDjYHYlMlDGSfaYq6H
	h+2nnleEbCodEeBm5kq/KdcSS/1epj2S4Ia/tcKDvGYaG1RwEyMXhVR90xo9iKpqUunoj7UYnaT
	aNEnK4iCftX03056gXzGUcTGzViTVXgxWq+N76ZaQGIQWq9QzOJ7oAh8ErbW5k9qst+f+1feT3h
	2bRQL9vAfJy6vT1RjJlebnc1EV7sTTh8kN5Tq5nXphzRihcvKZHt7xWkJda9fUrufM0xTy/akbj
	DsNP44D+YGz5QSdilMpK9X4Jjd5dd2VX0zspTdQIr6o93pYJRAi6Fe5ej0C+pa7JUkXwNqotFpK
	//g/AZRZ/tusd5NIC+CVaDf22AU9qiXbK4Qb7QcEPa37hmQif9S48p+Hjst2vRoUMvA0hjgbfCt
	w6fFY=
X-Received: by 2002:a17:903:1b50:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2ed8373e282mr24624585ad.12.1794189771860;
        Sun, 08 Nov 2026 18:02:51 -0800 (PST)
X-Received: by 2002:a17:903:1b50:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2ed8373e282mr24624375ad.12.1794189771332;
        Sun, 08 Nov 2026 18:02:51 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed815e60b3sm6599565ad.26.2026.11.08.18.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 18:02:50 -0800 (PST)
Message-ID: <6f76f35b-0ef7-468a-934f-1c6426ca9760@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:02:46 +0800
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
Subject: Re: [PATCH] wifi: ath11k: Fix potential SRNG configuration leak on
 init failure
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-db9e3c75b3-wifi-ath11k-1@mail.sdu.edu.cn>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-db9e3c75b3-wifi-ath11k-1@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xsA6hh8h3x-HOXg9T4FWzvkyQ6ff_Pr0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNyBTYWx0ZWRfX9jN+5U877ABr
 CswtLS6EzhscOZN4JM+UmYuiEvguD8p1WE9kxJVQanHALaswmmKhR62XQ2FPx4ECUX1KjsNoIm0
 RZM0vLuP7MdvJBfZMW6P7FnI3/z8XPQQ4p/ylKc0YrnC8aNPnM8zfJsfY/zlxUbVxl4azfkBuXO
 Rt07zrm1e7UurttArSSx98gvGXQ1ailocRYcUXYPL6vA7jS6nSqvBF+WiYYUcGzJnxMWtHOOvwe
 kDqvnNcVWuThAdCLmY84LV2NonvsQFtw9D3CtRFD0GGdhYcTSXI69CHHIFwvqIgOI/Gh/AUr4aB
 m02cmofTL+A+d+Tthy9D1TK78/H0xcGTakTLst9jk9bfD7ACynHDJ3YIq8LVpznZ+BDr82HeG4x
 CqyEFtBMnXlL8QUnxIbVO8nxEm05nRYODq8lEQwSdX+I0tifUGuMbisYIUfPvuFpQ2hyo1aH33v
 jyYLbdBOJCbmF7s/+wQ==
X-Proofpoint-ORIG-GUID: xsA6hh8h3x-HOXg9T4FWzvkyQ6ff_Pr0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNyBTYWx0ZWRfX0VDuFEuu9Yoc
 g2ZeiLMqKgaTOTg/eLipLOx1FDadEJXaq6kSCjx5J5gjOqyGE8Y0hvZJ5txVIRkqIR87wC6mKPS
 KrhnVuRaxXiWHvBxwD73OwXmHSme0UY=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af129cc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Rv8SPUj7cjXdj5bJQ3UA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090007



On 11/4/2026 10:33 AM, Guangshuo Li wrote:
> If either DMA pointer-buffer allocation fails after the SRNG
> configuration is copied, HAL initialization returns without freeing
> the copy. Its callers skip HAL deinitialization on this error.
> 
> Free the configuration on both allocation failure paths and clear
> its pointer before returning.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: f7eb4b04ce6f ("ath11k: hal: create hw_srng_config dynamically")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
> Validation: x86-64 Clang W=1 changed-object builds passed with
> allmodconfig and allyesconfig. No hardware/kernel runtime test or full
> linked-kernel build.
> OpenAI Codex assisted with source review, patch implementation and
> commit-message drafting. The submitter has reviewed the changes.
> 
>  drivers/net/wireless/ath/ath11k/hal.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index 98bd9e3f0aae..8a4e5042d89a 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -1351,7 +1351,7 @@ int ath11k_hal_srng_init(struct ath11k_base *ab)
>  
>  	ret = ath11k_hal_alloc_cont_rdp(ab);
>  	if (ret)
> -		goto err_hal;
> +		goto err_free_config;
>  
>  	ret = ath11k_hal_alloc_cont_wrp(ab);
>  	if (ret)
> @@ -1363,7 +1363,9 @@ int ath11k_hal_srng_init(struct ath11k_base *ab)
>  
>  err_free_cont_rdp:
>  	ath11k_hal_free_cont_rdp(ab);
> -
> +err_free_config:
> +	kfree(hal->srng_config);
> +	hal->srng_config = NULL;
>  err_hal:
>  	return ret;
>  }
> 
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
