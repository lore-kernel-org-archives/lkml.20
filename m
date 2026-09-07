Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4743E31F996
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755830; cv=none; b=JlYxcuqWrpw4P3dP/M4jNHmP73PnBaVrvnR06bxLVxJXGWYqvVVsRZvQyHpNYD8MqCb5FqKPCKNQNsq68patzKC6R5Vhd+3iqnhG9UiOqW8ZlOZovGJhF7vtGDLzAwLlvz+U7vqGJ4JP3yxRwmaRJ+gDEGj0q/373qldggZRfcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755830; c=relaxed/simple;
	bh=2+n5fGs3tabIyURWa5XXiB9R/FEEX7QdcfDfhiFcxck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jo0bahuubXzWIcKRdBHsziCMbCbzmIhtzPY8Mzmh61tQ2lZ5gRBhsyITUtGDZFf7/j5qJPmdZs0ts88hatWUMhB8YnFYXMAZEJry56drmF6wX+1CncluovLcvECb1UTPwcSaXbcOt8bWVMKzdOnRtbMvqsxHzu1/uiYUBVQERz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=on1EM+zR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjFyQv11; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="on1EM+zR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VjFyQv11"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lBmN3454855
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 04:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zNvvm20dPKR7DWghQAb3b0At3rnqrH5dbI5V0wZ4eLI=; b=on1EM+zRLJFnZ1SQ
	mbWkV8yafx1AROhK5tAeSmoBIeyn/dsLnGRz2gOHcpaHjYgTXE5NkvwPtca+92az
	xp72Sd3JY8eHx4E1yQwJWWNPjcRpvjkQW1uc171nkhB/zx+nw+F7W/9AcESRTuE/
	YcRMIZg6QeTU16ipZvIR+LXiuyGFq0zlHFIiBKn5uCAP3GwVMUOaI8K32P1ob62D
	641l/Vb38iaAKP+N9yllAp1eKz+pChGBtex5k0d/aVR7JZtqwXjRFDjPzwItQ81P
	+mNmiVjmrsdfK8+GyvD9EnpIQn8XXVpzU3QmG75fnsL12GzY4SKBWmESeFCnPugG
	5rZheQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany4ykx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:37:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfca8558d2so39608305ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788755827; x=1789360627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNvvm20dPKR7DWghQAb3b0At3rnqrH5dbI5V0wZ4eLI=;
        b=VjFyQv11NFbXTddRa64r8lf/wyn9JB4lop/r6VGqoH5GDHC5TPQ+kgsc/FIVcY3Y2i
         sOEU4042APneLiMLJ8O2lHnCER+0vF4h5V0p9YdQPVDfz10XKlOYsbGErn1+kjSPLj0e
         OOSpyUB2RStP0ZC2mZgq0fb6fFMLaFyg9WNvXtIbACDFxn+FqFc31XaIo/TMHZe5tCP/
         yPB2biAD0VEilbQ4w6P1N7EcTcnIpT121LJBVrbbN5N+yFl4carSIF3/vlV8SAZcy64M
         KHpN3cUKr0V2CrqGQmENf4r3Bwh2fpK4UF6IclOe0NySijpkYp2N38u/XPyvWMmbeozQ
         +/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755827; x=1789360627;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNvvm20dPKR7DWghQAb3b0At3rnqrH5dbI5V0wZ4eLI=;
        b=I0PZaiwde7yGRNZEVVTD0kzpxshL4z8SIkQErWwqKmLZbft3rzt3sHzi5LSZp9uR9h
         rGxvgvHVaW2vNYG6527M9nUooM1TFafxoUerRfpWl581J0EtUfbYgOMGa4qJeTOba/3R
         kNvPAbqcqhlUz5Uwc5v+PieXmZQL7fV8/yr+H5M/ddaX0UX/BHA4MqjbId/ynRESF4Rs
         WgpJkeG8Pa6OxcgllunqXH/MonHRv+Ksv654bNyCbfPHJom/SIWyiwbJ0xUZtiSJAM/5
         Z/+JKMX5LAuVEmGgYHBcodJxiCeNEmTqWrNdOM5iL+iv37QRDd5bdx8MBpEkoF9eTaVw
         AMcA==
X-Forwarded-Encrypted: i=1; AKwUvBwYsLX9HBNwvTFihb/ForN1Wd4qVyPy01dUr5ksb6iF4JiE7rehgs1K3LsSr5wwuqFeW2YPkZJIj1CGId0=@vger.kernel.org
X-Gm-Message-State: AFuF++lDhVc5FIHhTgkd8zNTRXr7QuXZRbE4+jCSQdQU7a+ggWXJKbze
	qWfpVehszDsqjateg76LbWrIWevtIXVwhDKSE/4WXzqclt8BPPV2ZFX+DwDg6IvAwtRsphj6HVZ
	D0XNmmUzY/Sj7A7OP2CIHpTU/sVD3vPg9kfHtPKmPC6ggg/Xj8Y0zoROfcnjgCqCqcaM=
X-Gm-Gg: AYBFou0W7lhBEQirtB+G74za/F9B4LFCrbrfDueFA4hxPWt7DP6U5bjfkZdbE1MlSce
	7yDBK6U00/0wPvHOjrfd0fVbxXij9hBdrSXvIp9ExV55iv/02PPzv8O4MCD/cFLHBwcNV4AnRS4
	k+j9TxHNMVps8Ztv6hPkTrvX4a14nge6Tc8+VnXzVse9kXpdLA43opLobhS8WX6fHd5co0QxjN4
	2kcUhhUjJx41/332gVZIoiFmZTMk5kwYVvcNzEZsMqLpZtQ6apXkfPlaybrw16C2YFrSlPfM6IR
	5fFlag769B9qiYdlBRTpk0woDAHBKA41OB+Nb4rvKICpqgMZKOZDgJbWGygVsFmek7sSQvQ3NNq
	WXxx1/FZyHP6ajU4BOnffcaiO8igNUgbvrg==
X-Received: by 2002:a17:903:1844:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2db126b1bcfmr332012465ad.21.1788755827070;
        Sun, 06 Sep 2026 21:37:07 -0700 (PDT)
X-Received: by 2002:a17:903:1844:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2db126b1bcfmr332011875ad.21.1788755826600;
        Sun, 06 Sep 2026 21:37:06 -0700 (PDT)
Received: from [10.217.218.252] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33517b57ac8sm14256187eec.28.2026.09.06.21.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 21:37:06 -0700 (PDT)
Message-ID: <39973fa7-fa96-47e1-acf5-1ae27a5b28dc@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:07:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tty: serial: qcom_geni: don't ida_free() the console port
 line
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-v1-1-02e18c31aeba@linaro.org>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-v1-1-02e18c31aeba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9e3f74 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=mRzOu2RZjW8rS5LHIWkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GYlohIOfLEXj2zlAoHLBDCrIfZkRhRnq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA0NiBTYWx0ZWRfX54b0cy37dBZ1
 4dRlngR9uRtmrf4hTGAO5NpXhlvdx977E/py5lJyh0rhzpK+lWXVsQH7S1579bOW8K7nmAs4JpX
 KLgy3mz+GLI3CNHBbk2nL7ygKWhcboPO/OdUO1gV4GlVM/EwDQyP5R6pJMBYIq4JIkP5705WZZR
 WCdvxJLw1uu2YRbWkEjVfn4WeCgmjKt3+J0ePSIyRPVONZE+2eF/7eaqcP6QVUpKI2AQpF/b1fb
 YOAfNmIdtHqguow8+zVcNEVninhhyqWjCLBeICxv92KLShcFM6JkY9hGsJfOXRKuCJYZzQv8tFE
 OSzH7mqQNZWbE2uvnKyvpBJSNvnMOIT9MGo4fYo1j3vGBC9N3ZAcakCyXsgaMH8mYvRWgjSoSUF
 H8RRGaGZLHngubO/dzGjBLIv/D7+eVv8B17Ntb6sPMiYOqvAUcNBqS+lACwEgneT4iZZXbAt6Mu
 +FIkt+ZooXn2D2vGIwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA0NiBTYWx0ZWRfX977POzUxeo+5
 KTezt21XBUZKoXJpr/jy5qVWGd5x4SJ4xEximEwyeRm+W8QaoWhvTLWpWa1/1WUf2tmi9g7CRdk
 jHV3GSCFZtWvgvCfXpLuAqAqgLxpXsw=
X-Proofpoint-GUID: GYlohIOfLEXj2zlAoHLBDCrIfZkRhRnq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070046

Hi Neil,

This appears to be already fixed by:

commit ("serial: qcom-geni: Fix port_ida handling for console and probe 
errors")

which also fixes additional port_ida leak paths.

On 9/4/2026 12:39 PM, Neil Armstrong wrote:
> The console port (qcom_geni_console_port) is a static instance whose
> uport.line is hardcoded to 0 and is never allocated from port_ida.
> Only the non-console path in get_port_from_line() calls ida_alloc_range().
> 
> Fix the qcom_geni_serial_remove() and the matching probe() error path
> so unbinding the console device doesn't hit:
> 
>    WARNING: ida_free called for id=0 which is not allocated
>    <snip>
>    qcom_geni_serial_remove+0x58/0x80
> 
> Fixes: a53be6945f51 ("serial: qcom-geni: Remove alias dependency from qcom serial driver")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/tty/serial/qcom_geni_serial.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 3633723acef8..bdbdfd7dfaac 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1979,7 +1979,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   						port->wakeup_irq);
>   		if (ret) {
>   			device_init_wakeup(&pdev->dev, false);
> -			ida_free(&port_ida, uport->line);
> +			if (!uart_console(uport))
> +				ida_free(&port_ida, uport->line);
>   			goto error;
>   		}
>   	}
> @@ -2024,7 +2025,8 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
>   	irq_work_sync(&port->tx_kick);
>   	dev_pm_clear_wake_irq(&pdev->dev);
>   	device_init_wakeup(&pdev->dev, false);
> -	ida_free(&port_ida, uport->line);
> +	if (!uart_console(uport))
> +		ida_free(&port_ida, uport->line);
>   	uart_remove_one_port(drv, &port->uport);
>   
>   	if (port->rx_dma_addr) {
> 
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-4a199c25fd84
> 
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
> 
> 

