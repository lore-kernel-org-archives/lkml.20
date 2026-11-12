Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502339;
	b=o/XoO6mXywnYklJ1E46ULZa5dzptOc9m858JJcQYGNJzX2IspMwT+om/slanB5V+Zx0c
	 wc6XJM+hAvIvqSu9O8KmUn5ho5MbLkZ2zNYhEz0zqaYcWA0i5S8eIxBLylMx+4+Wo3qTP
	 5pabbyyhagQeo0yx+jwRYP5PgaLzlZsCG2kdDf2DduvhVAqYwaEfiQV/HUoqiyT6truM/
	 mbEDa4ok5KcnjUQc0WU7o6LKfpw4AwOqW1pDeWdCK+wAqpojqUhk2kW+hQwkufctPbOcm
	 kOGXs7ydUFb3eQBz0J6t52L/zNypfNiXDBIxy198AJmebX3AaZr6Vh13mGfkpS2DQOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NBYDPPuMaIjH6YVROllriFwJaZQpLdw6qtYdKTDplEY=;
	b=H1yu6Vo7LwTstxU23sNZEbfkTpVLhz3+h+efv960MO1j3g77XdfVJ4wzteasgjsY7DfT
	 YIU33B9nx/wwdAXu6mHb4u1+x8D5H8sh/gHRo1LGyE9U8LavO8QWqJXQNReh8/8xbIqdn
	 6cDs2O7/I/wwYd8gTEyfKiDRFk9vtFYL5GTn43F3JNchUsotRcBxAHtNn3aPDA+xRgWM2
	 k5xnvzeB5EFAJWNRzMZ7ls1Ji9B4kQuMndmZedWXpWV9gmXQSOGVO71PQGPw+vC7kzhdG
	 BzR+OB9qoIShgwLQfgryQegp4W1EgjMXlJZvVPzQAyuQLj43rvCFQljvOmZIeFhft4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZOoSFz3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AI5S2Xic;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB17606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AB17606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZOoSFz3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AI5S2Xic
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZpGu011679
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NBYDPPuMaIjH6YVROllriFwJaZQpLdw6qtYdKTDplEY=; b=YZOoSFz3iXFIfjv6
	YMzHKw1ZGWXkO4GIQ5jM0WQtfaEXpZiPi6ovvwAedgcsFCAWuhGGHli34laGTSGy
	1CInkkgEPmLWKOWgsXTlX3tvYHxxDbWitvoNQUKeI4WDVKRY5znTzxLSoB51gd9K
	9IscIbi10dvaGjK+JRGZ8oWy3r6VEX8dun1kAGh31RxHmw5d/l2N2rxSti0RwlS6
	cqH+G/UaJMSnVf1bAdlu0i717cNahkY2+qTYlgXvXGhDvprTTEFHyP3yjVk6UjPa
	7C5FyCBJlfww1lv/JG5OpWxDRG57x1Bxi4QM1vTsZQuLahWo1XnXbUiby/NXEReE
	i/B+uA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1b8cdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:52:17 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3ae17c536so4648941c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794502337; x=1795107137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBYDPPuMaIjH6YVROllriFwJaZQpLdw6qtYdKTDplEY=;
        b=AI5S2XicJlTEGIUwqvYhlk67qqus1NCsiwZVDsWkHWO6Z+jeww/Z3OfCdS9HWb11fV
         ecHIK7OdpcMLBAT6X6HlfD1lnUPv/6flYRHykdeXXGQTMZVYmuBTa4FU0tb3fp8AmYPg
         tH55b01mwiLBTTiJksN87K6oIrkzqTHr6w3Y9JVLHfBQQIonLX1CDIqqNCH24bdYX2pD
         pWFn/mtjtih3JxGHIgJd8mT89gGy4ZtXGpyT6hUYwhu08K9z37c5f0xu17F4Bj7aRfNu
         6DlxsYNMPwtvwtmsmFqjVKRKSHpaRpzTY1pQ+Sy/OkTP6T+Oxwy3v0oTEYLNKFc1xLM2
         W6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502337; x=1795107137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBYDPPuMaIjH6YVROllriFwJaZQpLdw6qtYdKTDplEY=;
        b=vCh6Qt5n9/u7f1LJc5G6IUVEUgY3+qsE42t050dhGXOIbQe/rYPLbZ+mJApA3ZPWOq
         F7iyxwoeqU0hu0tNrxWHgbzBv978Z5uyw3yNs7fNeeaXyhTZ03pKgw+Ih07E+2iU3ImJ
         PBlkCfC+bIl0F86gQGzkryMydnTIyoz5dtOSnd0KGe/bbJS3BCvQJpbDRejLMmIkdEg0
         kqKwxP6UaY2YQ2ydJkN9OfyPhFW6MCRXxV5ncR1vBfbsyYKsr6dD9k7xqSDg+kcIIoIJ
         PsB8KYBGWVpDFEEOKhv0hN7WXjwxP2mvEeNGmlam2qV/YqvfWlP5aCMHV0s4I5wGc0vm
         KrDg==
X-Forwarded-Encrypted: i=1; AL+hErEYKhYH3O5nmX/lthmVVKmVxeegre1y9O00AX5cAswrbiEwWopF9tWigvMf36r9IeYhfy14TNQzDGw7AA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+d7olxxs04dyi3rZYqIvrYa7GDvHWTx/yWAtKnrVUkrvH6olkx
	C0BPaX2A01yuQrD7sT8pvueCodNKqQv88xPd/yU2zbE+CkqDckt7+xnklkxHk0muCZnPntuRD0O
	FJWlo7PNCWd9dsqKe3hnq5AB6IfdOvCHesG5P6s8w25Xq337zVqCYVq8tcKgltBJNUw8=
X-Gm-Gg: AYBFou2B8W3LnO4drTcrQqbJHWrDrPcpGItvAk4cyc+X4gNaCAHrt3HXNSM6cLKewPZ
	Dz/usrLY0VjYHxIag+5l0WL6rc0zun4z5Swm550DP65LksdIvkW6aK9sv6ICjydFhciELYuGGEp
	hBu4G30RVPOd3YnfdERDoOq4ULe/Ch4SiKUIzctfOMRkfEMr5LuyrKDtjXS43HTxTFrN99Ox7iy
	2CJBqFXwZr+/pvbdwFleLsCMsCxPf7lD6owaXVCZNIy8gUSV5icFyJFe9r+s2Sy8ber6GMiTRoF
	8ruDpXJ27D4fc+BlbpRWYDKQVfDYvInOcnCANSNOAAsvRHqAVtrepL7tEykA5Vd+sZMf2fLPW+d
	ygKGugnfXty2+RjOCoV1uReqZGjwSj7RyzEH2/rltHgd4ef3X9oV1l8aiiunAabVp/R8rDUwwIz
	uEY873mGn4e7N+/DBAiBNMmZGtSyVC
X-Received: by 2002:a05:7022:283:20b0:1a4:4194:fc04 with SMTP id a92af1059eb24-1b503121772mr100804c88.28.1794502336686;
        Thu, 12 Nov 2026 08:52:16 -0800 (PST)
X-Received: by 2002:a05:7022:283:20b0:1a4:4194:fc04 with SMTP id a92af1059eb24-1b503121772mr100700c88.28.1794502333270;
        Thu, 12 Nov 2026 08:52:13 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm315435c88.0.2026.11.12.08.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:52:12 -0800 (PST)
Message-ID: <a9f1d17f-afa7-4715-b57a-882b1fe4a41e@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 08:52:11 -0800
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
Subject: Re: [PATCH 2/2] wifi: ath12k: add GENERIC_MSI_IRQ dependency
To: Arnd Bergmann <arnd@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261112092642.1144415-1-arnd@kernel.org>
 <20261112092642.1144415-2-arnd@kernel.org>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20261112092642.1144415-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af5eec1 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=m_PdI6EMpLEBZp9qn34A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: hnf5YxP4IUQ1rXncJ3kiM1b_ygK7NLHd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NyBTYWx0ZWRfX73LVZCg809M8
 sDgSDUilXQhp7FVn+VU+BA0PE731RmnDKJTV9vVbmbCiJ7SPtwe3CC0gwUbtfRCw7cH6PxtBGep
 wPJfq8+wCK7z8VODauXXIR4yE0E7d2fHy8JCuKSrgtEQ5e7YYxbHP+PvjYVHuJzD1GCM7aOezQe
 oVV2MbASpKAzU9X3IJanHOfjlIMG9adTnvAj5z2l83tXeczu5wER7+asq32mhFuvnZCNKwNWHL5
 WR3d7sb0MMzdAPCm2I+BpZ8nZWopTPDGyeazVkIuZEITmRmXI/UruWVhwcxFozNuBtBEDoCtGtL
 d6ubEJzELx9CICEKjuusxzY6YpqUp3kdtQXiNWOEwv0//IsTEa43ds5o1RwCOQBxZfuKcCO9dx/
 S1lPAHfCfW5FPPhyu+y26vMmj4zwoW2FDd1uVEi7MC44XtZL6aB7mF+RhfJQjqRB2R3ovdk9ti0
 OVZHBFBWFTLHWCpVfTg==
X-Proofpoint-ORIG-GUID: hnf5YxP4IUQ1rXncJ3kiM1b_ygK7NLHd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NyBTYWx0ZWRfX2PtthOSezQsK
 t/qG+3R1Iz9URpE62dPyafaAkfm3izqfjxMbcsqz7SNupYuO1tFdeCx2cOFNNoIm0W4r1rb7Pbt
 8Ng+IQ6TUnkQfnUrD5EkYjle8WCszoY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120067

On 11/12/2026 1:26 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The platform_device_msi_init_and_alloc_irqs() interface can be disabled
> based on the configuration, though it is usually enabled. Without it,
> the driver now fails to build:
> 
> drivers/net/wireless/ath/ath12k/pcic.c: In function 'ath12k_pcic_config_irq':
> drivers/net/wireless/ath/ath12k/pcic.c:387:15: error: implicit declaration of function 'platform_device_msi_init_and_alloc_irqs' [-Wimplicit-function-declaration]
>   387 |         ret = platform_device_msi_init_and_alloc_irqs(&pdev->dev,
>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath12k/pcic.c:424:9: error: implicit declaration of function 'platform_device_msi_free_irqs_all' [-Wimplicit-function-declaration]
>   424 |         platform_device_msi_free_irqs_all(&pdev->dev);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Add a Kconfig dependency for it.
> 
> Fixes: b9bc9ef941bd ("wifi: ath12k: Add platform MSI support for CE")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Note that this patch applied cleanly on top of another Kconfig
> fix that I sent a while ago that is also still required,
> see
> https://lore.kernel.org/all/20260313094852.3716715-1-arnd@kernel.org/
> ---
>  drivers/net/wireless/ath/ath12k/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
> index 4e8a301f2081..ed93ff36fbe2 100644
> --- a/drivers/net/wireless/ath/ath12k/Kconfig
> +++ b/drivers/net/wireless/ath/ath12k/Kconfig
> @@ -18,6 +18,7 @@ config ATH12K_AHB
>  	bool "Qualcomm ath12k AHB support"
>  	depends on ATH12K && REMOTEPROC
>  	depends on QCOM_RPROC_COMMON=y || ATH12K=m
> +	depends on GENERIC_MSI_IRQ
>  	select QCOM_MDT_LOADER
>  	select QCOM_PAS
>  	help

Perhaps because I picked up the original of the 1st patch 'b4 ty' didn't thank
for this patch, but it has been picked up in my ath-next branch

/jeff
