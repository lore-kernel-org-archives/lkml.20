Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1AB395ADD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509080; cv=none; b=X78bgw8edcWlmI7OAJSeO7ROxkCLDSeCFfUdii0B/YJ3fIPjPRxe1FEy9Jc9PjoB9rgGi4rThf5TG1cgyOy8fzCC9sF+K+HVIvlLOWqQUOoQeoBv1hq3XxGXuTvM2JHj2/rYevhJtn2KCFbPtKg7vuTmei8qsbYQiflYaGDYfPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509080; c=relaxed/simple;
	bh=Isg76J8xIN6ceva9gEqN+Pm24lXNgllN3sdT5qg8GFE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=U/fKODVkWIagv+yVjin6v9QfdTraFvKzzQaeSHQdGP4eOPTrA3UTarLD5QXdzmBkStXD3Gt8Xpky1E56H844Mkv7BA2ohbVT9Qbgb4Zzfc42bNGMF8GXXHffpXNMzpMtQzMTpZHepP1NQMoiY1tjAfRpSvU3ybddC4GFyrBtWO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SPQr4bW2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SPQr4bW2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso7892515e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788509077; x=1789113877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rruwEAEh9lhIYAVfPHIlPTge7FNWYPLlI4FxCfMGXMA=;
        b=SPQr4bW2Oj6yw/4MZ4UlNVcBFNPVf+hK53D+wmP/RDJaHzuuGYqiLlD2XFm2YKZX3p
         V9qdcy2NyqSzNdfT8jV7x3npNBCw/ck3NN+bflPzsQDJxc8z+b0Op3sSgQcEUsgzVdS1
         AniWBaw+p9t7+eIhAJAkpki51Ew6mgdcbuvEkW2bk9FfES0tpyKfXCx7uy5BnxSxxAGj
         JLc0RoUVFG4lYJ+7boJQSFjQpizK6FSyPB6pwcR3sS12EiNHw1QibFQKAQuZkno/tvTz
         ldMnGpFCP/ahnLkmcOVKV4Y8Tbq5i6FRY6QTAV5drUncpqTlDUvGckyi7VHHxzjGu0XO
         zzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509077; x=1789113877;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rruwEAEh9lhIYAVfPHIlPTge7FNWYPLlI4FxCfMGXMA=;
        b=rI+NfJh0RZ6MBHPReiWh87Zd2H0uajXGDSJzSnX1C3xJ+UYbu/42HG5LBE/B6Dw34S
         ctZJv3crOZExD9+W6lf5uGnHittn6E8Iu44ubcOvHxe6QJdOU25GJL3RE2H/aMWU/gOC
         K9FD5yEcdOhaWWicZQ9fl+U5/+BtHceegAgDOU/BeYpfKSSLMbH1MOFOadT4Ihjp8iOR
         tz/rHkZGa8Rb3qftD5H87+/e8k9+lDloEsBF6Nea3hcBKupOdtmHQVRQSG0kK1YofWw4
         l1d43Ia+rIubYY2S03+ml97ikOc2r60yJUdKd0yTmL5MkKDgzM/jaYpy7IWbDrButUI5
         gfxg==
X-Forwarded-Encrypted: i=1; AKwUvBxe/+LSfNCx9kgEpmvD8Wd8kqxY8x4NbvrnBla/CEh+6d7dvX2Ov+PZsPb9IfEVbh29YF4FcBSWCnTWDtI=@vger.kernel.org
X-Gm-Message-State: AFuF++n+WY8u0hPn0u+WAWu+3sApkwZZhJKHfi6vRZbGnHcB9gcsNpZz
	qpXyGV1R8Yhev839j9jODVXjx7490k0XluhIjE2Qz4AiTmcr+36HTOAY6l6flM4UwBU=
X-Gm-Gg: AYBFou1EtoH6MXz2TIzhJYDeoA0T2DggAwJTP2QmGoL8GKcYfuZEtW8wUjaKHVXTflS
	9r7/GBy4ekrJDJ9gTCj8UVZ4yDXbV8tIj5bnU2xkzadEitKvMr0QMe4lnMPDxlZoTfW88kzqnMU
	WXMopM/lLoM0BCYaUt+C6gGyHQZMBKhDnWlWBClpPmoF+rN2l7egR+O8Gy5wZRiY8mA79mDcqaN
	zgOOoa8Gh8NTr4hiRQDiMXKUHsEgY+bAilMvi4iDmysbAfpZBupU1S8ZlicPTLiMeppwDZLXV8Q
	Wgc6lXBWNSFPDdQt6mDqdQXui5IymV95FbhUI9J1jm2GfY4t/FRmher04oDtqMqYuPX/JRQvDLP
	SJ4bLqfIs1OmO/EQkA1nAnag7hWIDcAb8cvj2Eid038tJkWh1QQw/D93hGpO3jLF8xwf6ocDS14
	NWQkUO9zDNDEGBY1hQSaQR8fO4RrpFr2+tu7/greWm1NLVpGaizAq6lOYVBQh01aHfjPzFPT33T
	PA4P+EZgbb58ckaPrtdIB9O6SNeHhYPDBroUwrI3Ao=
X-Received: by 2002:a05:600c:3b17:b0:49c:fc6e:8cb1 with SMTP id 5b1f17b1804b1-49cfc6e8db3mr13159185e9.21.1788509076654;
        Fri, 04 Sep 2026 01:04:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e8f4:b358:2087:5bd3? ([2a01:e0a:106d:1080:e8f4:b358:2087:5bd3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf772692dsm59072445e9.10.2026.09.04.01.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:04:36 -0700 (PDT)
Message-ID: <d5b4c085-f5e2-418b-9b51-7cf47c064644@linaro.org>
Date: Fri, 4 Sep 2026 10:04:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] tty: serial: qcom_geni: don't ida_free() the console port
 line
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-v1-1-02e18c31aeba@linaro.org>
 <bbd0216d-8b50-424b-be1b-06453118a61b@oss.qualcomm.com>
 <53b0b91c-6ca6-48a5-b93c-ca2ae9680ad0@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <53b0b91c-6ca6-48a5-b93c-ca2ae9680ad0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 10:03, Konrad Dybcio wrote:
> On 9/4/26 10:02 AM, Konrad Dybcio wrote:
>> On 9/4/26 9:09 AM, Neil Armstrong wrote:
>>> The console port (qcom_geni_console_port) is a static instance whose
>>> uport.line is hardcoded to 0 and is never allocated from port_ida.
>>> Only the non-console path in get_port_from_line() calls ida_alloc_range().
>>>
>>> Fix the qcom_geni_serial_remove() and the matching probe() error path
>>> so unbinding the console device doesn't hit:
>>>
>>>    WARNING: ida_free called for id=0 which is not allocated
>>>    <snip>
>>>    qcom_geni_serial_remove+0x58/0x80
>>>
>>> Fixes: a53be6945f51 ("serial: qcom-geni: Remove alias dependency from qcom serial driver")
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>
>>
>>>   drivers/tty/serial/qcom_geni_serial.c | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>>> index 3633723acef8..bdbdfd7dfaac 100644
>>> --- a/drivers/tty/serial/qcom_geni_serial.c
>>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>>> @@ -1979,7 +1979,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>>   						port->wakeup_irq);
>>>   		if (ret) {
>>>   			device_init_wakeup(&pdev->dev, false);
>>> -			ida_free(&port_ida, uport->line);
>>> +			if (!uart_console(uport))
>>> +				ida_free(&port_ida, uport->line);
>>
>> GPT points out this will always return false before uart_add_one_port()
>> is called
> 
> You can use if (data->console) instead

Yep will do

Thanks

> 
> Konrad

