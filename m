Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954893;
	b=RZyKUmXfOk2YycyPXfRnE/Sd8GdyPu7QUTBnPuV0zNikfqVJZS6KKufWfncA/Hrz0NZU
	 pELsu/u0Q53+DM5kadLYwURsXdpPBZTv6Qxhj9LOd8N2NPXcsNGL46JWMsShshxQBi6he
	 WjDzdWB1BWh3DmPcX4V64RjwYAXKaamGAydBYhVEeVpNAdkBZxLsJ6YRM4nA8bpTO2/T1
	 mandCAqiMZjvw1zoEc4AuubfYBndyS/buYo3zvtKqCm6M98CHURUbytBEwfzQ4b3SbD0J
	 CEzFTysW5GtPO7bm6wgrBma1VJuxVf8UIKG0NkEU/pBHVzw2r0WvgbxR9RdyzRc3E0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k2FbAyux9MGdLB8gSy+e7iMBMpdgqsliTMaQr2Ms7z4=;
	b=QOfNJsr2ErMh2n3UWCMbxPhTFIGf/WkZOqFJhOXqkPfC+HdxOhpum1FzF/Pnn3jZ7YAt
	 Eff2V4PmkfoMPGwHu7TJg68FK7a2DC+nmcGtQ8pZyk2I2AFjCnY+L4sHowdBQJDIgUjCQ
	 3R/iMqTpr8gR+o3EvP3Abkhr555eAHA+SKqmljh2PKkpK5CX+IcHFB5YCH7tXTfwReRic
	 7GvllNSOE74GFcMhGBKZhvtEmW9jLvkV47AtmjXTKcn3lrHhByOOFAXyso3HeUtixPzON
	 j4P8R2v9LgKTILe8YR6DabNHpWjKMlpQJBmRVD3kjTL0VzPOZY9QTIXD/EIZcYPzk8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZZK8WYj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KKUR54J3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6911A606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6911A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZZK8WYj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KKUR54J3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RORj2933654
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k2FbAyux9MGdLB8gSy+e7iMBMpdgqsliTMaQr2Ms7z4=; b=eZZK8WYjuuP2/fLZ
	rGYutrJAe8m1ZiwNMwRjzAiU0mbshZjNaUGXok+JEBFwbFkWjBOUNco7RSycCygI
	TLq2Lmjfu12mj7W/vCOqvmHrsZp0O62aRhNt50aXT2YNyn4L3Afj83pgWsbwH9u4
	epd+KcZtbyD2ge9AF8EiagjR4CUIms8yKR1X5oZvVTuS1A6/SgDZacM7B7B1I2DT
	iWHjvatYEOg8fgKmJb1tBeb1xJ1QU+jlTFdAyGFLxYLjogmj8OCTcD/DA4VzEaEp
	XiVZHd7LqZ2agUaT4kk/FTmYMOCTE7+I+ra7Xb+Uwd2G2bD2fy3n3gZMCVsJUImG
	MIRmRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1y2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:48:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb1091fffso7192685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793954891; x=1794559691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2FbAyux9MGdLB8gSy+e7iMBMpdgqsliTMaQr2Ms7z4=;
        b=KKUR54J3FKaZCxRNQp+3Gogi+fMo+EXtq4jWF7XAnSXRIqt/GESvjwCU3Ld/ewGv4z
         ipOOlV+LuGPFzbIkQJ3FMwiUdtssSemTZ4StMYhhZ59Nsa1ta74GB2KvA3jePh/W3qUc
         UhoTd+w226LIcSQQe463ntnwIAtE3CqNlAim2ZFwXibHRJT2y7uFUZ/AH7RG9F6OSPHo
         DUSQIRSNZfNHYCdiek9IynkiBpodX9c1dsqa9WHP/1hDuedkjYTzqukGMbKMhl5/wNjg
         U/dcClyIYHLOr4dVqoa6JUxLnSqIVQoCqtUJArx5lhHdFQDfXR9nE+PuwX5aWiCIM55G
         gLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793954891; x=1794559691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k2FbAyux9MGdLB8gSy+e7iMBMpdgqsliTMaQr2Ms7z4=;
        b=DyZ0BkzW5c9UFmkZEwjKIPBxS1NyoRhub3twgDrtJ4nTfj87ecpQqUixVIU8wkKbPb
         tJRxO+IURebPBpNdJboAI77yMKJS6xV05G3omshXO/Igeb9uKLXAtRZnFlhPZkoj8Lcw
         Qe9DDCiOLZAKAQPpV2HP87r6fwyWDiJTaek4c5NdXG/ZvcmLG4v5RyFgubub09tzbZs/
         gThG8mjgS+2Jww1ME+ALqrm2nOfa3nCnbD8xV9FXh0qUWwquICN2rTs1sJPKOBJEAIIN
         T/EcZoD1e/47fYwVNGyFd4j+Fx4LMcx+HZe5oIoop5WZgv3Q322x/TwMZrLgDKwSyI4K
         v52A==
X-Forwarded-Encrypted: i=1; AKwUvBwCrvvpGePKpjKgw7zEckjrfhXA+7a+raICC7bpryk4TaR6aSzz+ULsKfcEQgvthdRa9KhPhbE1VSGKzS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FRdl5vW50nhb/Tuh13e9rDz3O8aULypqayg53spEk4YjCj2YG
	y+fSwdU/1Fv45o+T8CXlQCxE0l1bi0GFpTPEZbvJDmCtP0N1IQYI3FaLz6YiljqIu8nN2yHIQxX
	VGnM8YsTvbOMUXviUSD/wWFYOB9lmdJIoInR2xjuVRF1u4Hol/qkdaDYw7tzCH5eEAiw=
X-Gm-Gg: AYBFou1bFTdZIKXUwpt6MN5eoSjYMoNIeyFjrlESz3PXav+Gavt175gsoP6JYdmy1/8
	uWH6bx7+G+xjKiwa0+ckXgiIT3bLmqMBDAVEuHFxGgxwIqwbBylLzsxq98LXq5WAtEv0Ni+3XNZ
	kl1y704TajZgwmFmj2/30vpssONkql8e1tTtlhg28xJRG3kS6itE4mzg6OxNwWXGQUVlE04k3VL
	UlI4UcqETle+N/DMQ1u9Kz6iTSmQ4nm9ukPtNZSA6sz1HL37LJgQO32DV2D+gidulzCENo6Xj2k
	0CGuTzAX8OGYNQ7qdDVgXokrTElurm03smOSzyjoSarVB/cxaE6w/sT5xdLjdbOZD2RAcHrnDvO
	MxPNdT0hFZli2IfnKPcjDRd2GbzMy6nMgAoPYm/aGkXX5A3aNmRh1KmIbyIPajpnUeDAu
X-Received: by 2002:a05:620a:3c17:b0:945:e612:cf59 with SMTP id af79cd13be357-945f35e5863mr220661885a.5.1793954890626;
        Fri, 06 Nov 2026 00:48:10 -0800 (PST)
X-Received: by 2002:a05:620a:3c17:b0:945:e612:cf59 with SMTP id af79cd13be357-945f35e5863mr220659785a.5.1793954890185;
        Fri, 06 Nov 2026 00:48:10 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3566e050sm61977266b.32.2026.11.06.00.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 00:48:09 -0800 (PST)
Message-ID: <e53010ae-6347-45df-9574-a121aa4711d6@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 09:48:07 +0100
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
Subject: Re: [PATCH] pinctrl: qcom: check the return value of
 qcom_scm_io_readl()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Ajay Kishore <akisho@codeaurora.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261105-pinctrl-qcom-scm-fail-v1-1-a23f96c6b313@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-pinctrl-qcom-scm-fail-v1-1-a23f96c6b313@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tgZEc4cRyJSilM0YUYAIUzqsVSki6F8_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNCBTYWx0ZWRfXwEDBga8dURKI
 SBJfEjIKWQJrGqbD2A1lkH6+tA80yH5ZAoB6RbYPmIjdVLvR4E05lCO/iJkT/vMsC1MFnlqwtYP
 cMXOVYQiPqkOCjrRoEgWvvEkfkbrGRB+GR3QcGX6TyF0T2C+PZqEzdS5PXHYavySPRZFAu2oVRX
 n+yNrzU08Igk/WEgGVjVMXwQetXG8ySQ/WxuHuNGFH4ZMgu36xHPlv9BNHfFsW2FSjgfCPX0fUv
 iZOovXYeJxK1f/5pIBKvTg54YK0NOpSwD8J5OkY2yrAHmjbI069Vlfqjhg0JIwYGPFGKk9/amWO
 KvLzw8lhD0KSxEhyTjdcVvTOkptypv+VyqhGKQXLvVbKn0rzKVq09ZCdkzkFWY8WpJ4eKux7alN
 rhlPK2eZfuSKYTcakcsNPxz+LGtL49LS1sto3PZjHRi9koyMlP5J+mDAJi/yKrIntbjgB39Un9M
 mA5wMkF8JoFLygIlSyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNCBTYWx0ZWRfX9gaQyVovCjXD
 DGxDs7/4S9MSRHIQAaaiKEfZHXL1OgtFctnT8cii2BYE4+QiJM336xtPMOtNysIRI02tineeQ/o
 DlODcA31vFraM8BTOZSVgM789HvM1Vc=
X-Proofpoint-ORIG-GUID: tgZEc4cRyJSilM0YUYAIUzqsVSki6F8_
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed944b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PcXE8KnCS75fSRLkHuYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060034

On 11/5/26 5:18 PM, Bartosz Golaszewski wrote:
> qcom_scm_io_readl() performs an SCM call and may fail in which case, the
> stack variable val remains uninitialized and its contents are written to
> HW registers. Check the return value and bail-out on failure.
> 
> Cc: stable@vger.kernel.org
> Closes: https://sashiko.dev/#/bug/linux-a5545ffd-48cc-4856-94cc-4b2dd7968f50
> Fixes: 13bec8d49bdf ("pinctrl: qcom: use scm_call to route GPIO irq to Apps")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 32aa7b919e24a0e614078ddc70a248c746e4813b..0053d1d927dc134ee81377fe480befa2da87c7f5 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1117,7 +1117,12 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  		u32 addr = pctrl->phys_base[0] + reg;
>  		int ret;
>  
> -		qcom_scm_io_readl(addr, &val);
> +		ret = qcom_scm_io_readl(addr, &val);
> +		if (ret) {
> +			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +			return ret;
> +		}

Linus already pulled Lee's fix 

https://lore.kernel.org/linux-arm-msm/20261103213002.1673560-11-lee@kernel.org/

Konrad
