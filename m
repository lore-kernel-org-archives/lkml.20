Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878713AB294
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256438; cv=none; b=fYf0xy4AarPdy06L7nIH1ngrN4YqVR28pH1s6VCzs7onNyoY1RSxDIudGU2sQIt6vnmXL8QTozm0rKBjG75pwNfAR+18lV0kwp2gywCGU15SHWx7XoJwwrNnvwYOf299sOaWPzp3omjf3CRNv1AapPF/qTuUDQ8vkJjrM8o6bO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256438; c=relaxed/simple;
	bh=kgRDL9cVWy0iLA/oSuxde/FSuoSAnPFNKSuKeLhwR5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TL8trpijn9Cl9ZuYpveUjiFUD9/3M09EhqoT72XV/TORZeqO9Rk67oswdlc29avjI+WCXh2LGbkSdERJg9xYtpliMfItIHREbkgDJOdBkKerUm1s+2zgOyDTGiLlvpjW4PjRXbI8VfNc95Eai4Y9O04G54Kys63cdIMlGiNashU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CdTYzgca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VzUfYS8J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CdTYzgca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VzUfYS8J"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681798UB1211500
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 09:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2bN8xEh3cDev+OdzW0UXVkB7nRlGhfeJFSfHXmMuuw=; b=CdTYzgca9HCsxvTv
	9YLigp10IGplNb6Af/RQOTVyE8ykDq6/K/p5MUOnpPNIF5S9NxiUKx8C1juVXyyD
	+DRPx5EAqXf+ookn9tLSKhMJvFBWq9kz2ajC3I6zzPbEcQswYgU1/wkqYriPSHgR
	JQqJeVFugFA6BdQgIn+rQ3E/bjbTGQvGc+6FNgZHy55iI9Ud4HXsx44No8IvK54H
	1IPZ9aGRLZZEGjp4TAGU7NzEcllqI0/c+v1c69QM/zANG7HljJsf1sL2UatNzYlf
	gQLWyv9R2CUJ2p4tVpTC5KF8bJKge1SnlGoosH6NAfufWnwS1pjjtlgmazPRb6hS
	oT6UuA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8sw21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:53:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-399311947f6so26915a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256436; x=1788861236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A2bN8xEh3cDev+OdzW0UXVkB7nRlGhfeJFSfHXmMuuw=;
        b=VzUfYS8JW7a/5KQqTOvWin5mudrcAKPj/AhvToIHZHcB3k96i6cU1n53vx80t25znc
         30gNoHMnoCD2c1RluSOJHKmCwi1ByJRczGTbeaEDGQ1337Mzn8f3QYbni+sE5q3uUXrU
         T1jQ/gNV8gLry4O9EY71fwZFO4V6EICyqzgr6mw/at+jRd+FHtPdJLwwp4v0KwADpBos
         A1n7+ujIRmlj3mDKnR4kPHReBQQZrFgey98KPN5chxyiK6qrSKsoTRWkezLQsesMoqxz
         1xrHP69I4uNNrJvATE4mIs2DmwJmTui63gERg0NeS0Z/rc07yuc/RIStWDQt76JsZ2TV
         w7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256436; x=1788861236;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A2bN8xEh3cDev+OdzW0UXVkB7nRlGhfeJFSfHXmMuuw=;
        b=rd+PWTRBV2Goz72396pw34RI3zn9ra06MxLuWqPtux9GGfsWaMKMZB8m8v7kIJywWE
         3XMiJ2xSNrtcoogUZznm/B8Xk/D8BAnX/YhBoWdMGDeGEIkF3qBberzUzULT7/bAs+ZN
         YwmPFA+auZabGVcZRmaRTAj4DjowNrEdwgx63GE54R2OJHwstfeTiY4Hl1EmuLG37z16
         V0nFN0AdBDK3HB/6twBb0doCPHCnlPOzC7IF28yccgSBA1v8mhtsdEABJrTbQSXBnRXp
         OnDZaQUGl1axRGYVOsPrViZ+lFOrBnTEejGiPZvFG77s45D741xf8tuWpeDB6RksmzaY
         Xr+w==
X-Forwarded-Encrypted: i=1; AKwUvBx53G+tBxLMxDq6/vPeKLxyAbv1gu+JlXuFrRKvZnJKRW+cfBNgpTQ8uWVapb+WHFXbnLk5317Y2jdCmYA=@vger.kernel.org
X-Gm-Message-State: AFuF++nsuXcYy0XSxw8G6RSacpRXkRj8xuKZDkvLKmujxdIPVRoK5RjC
	YBc/ITT7yvBjeFRFVAjmvyAqpIhmOgKuluwhqpQApUMaOIZ/pGODlun1K/mbgshlkMtYCJ9trSd
	/H7R8lOypJwiQ97d71EUyE51ni5HkjeLsW1ZmswFX2ydLdf3iNJT7B0S4ieaplN9SkZ0=
X-Gm-Gg: AYBFou3QBxZxweZNq14FR9QzrFcClkyHJV4/slRG8eFwcNXXVj7R2CD70fzG16EI5xt
	SKZ3RxXVdgC7bkUs+eWBXoW1/mQCvN0KCDxZclELrT0xgcXlgN/3n7v6NaOCG6v2zXG+yOxtWCM
	iFRBS39FmfNjTc3AF08UPJG92j7qClxPyd9uNsdPtKyX2B093FOMbKpWa/syVyTNgwTft+regNL
	1og9Djws48KqVz4dldL/bcMFR9+xFnkJ8RX0UcBD5Ed8I3I15tAkpxRjmcwGH9D290MsSfLPK+J
	0ONFpVNyRglCKw9+TsOhqNvpJD0KFSLfVlvGvmOU8sKPjhUnP31eYyAgC6kWadRou1SDSEx7rh6
	CgXM9k9a3kkBXsVjiT4Y7akns0oF9JeI=
X-Received: by 2002:a17:90b:33ca:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-396d0a36c74mr46467398a91.0.1788256435752;
        Tue, 01 Sep 2026 02:53:55 -0700 (PDT)
X-Received: by 2002:a17:90b:33ca:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-396d0a36c74mr46467337a91.0.1788256435196;
        Tue, 01 Sep 2026 02:53:55 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm53854905c88.0.2026.09.01.02.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 02:53:54 -0700 (PDT)
Message-ID: <5f01f216-588e-4270-b949-2f4b11442f0f@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:23:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] serial: qcom-geni: Avoid double-free of PM domain list
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: konrad.dybcio@oss.qualcomm.com, naresh.maramaina@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260901-probe_cleanup_uart-v1-1-0bc2b00c970e@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <20260901-probe_cleanup_uart-v1-1-0bc2b00c970e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96a0b4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=avww7BCoVOackQtynkMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfXxg0QVQVTClbL
 qu6G00wyVzVIdq7SrtKBjhe2f3MTxZPggcHJkMPBNct1Lp/ae0yvWgAclcV+JxAQT7Umb96aCv4
 kAlAiWSN77/RSU23j+PANZ1in0xdS3MmUeLU/yuINsG5ovsz0t3230PV0zdbcljElS2GopPdNVi
 oX58JF59kTzMEcRxm/pZtkDSFQ5VDIf+zt+0zdA5DoBUCXYMrpW7KOEAIuTwyVwxsGxnJanMqFE
 Hbfcckqbo7EzHiQHFczFfHAUzC6qI/nTE1hpsZ6dR8wRZ57Mll14bis7+PiHZXwFr5uBNd89FCy
 BxOzHIb8CSbm2TQIM2b52kuEjs8S6dGZ2r/3+q3Luvt4k6o8qD37BWI8SK5445ssMbLEKk52dGE
 yqvBikYvSAu/sVpHeX2q9espUY7EF7rNlJg99E6K7gieBsXLD4/ITRcxkQPeoXmQsqkmYW1KnRH
 Mgi/51o64XKOPaMV/Wg==
X-Proofpoint-ORIG-GUID: ZejBwn8hcageN7vS1S4rRE6LVtbbCiy4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX6WCa3dhXtTEL
 bfHwOb5tJ2l+3lZRjxGpzeVOuscwDRNdlpGArM18iji2GHbTJSzX1G3Ga6GWwqenp9XliB1u9nA
 5c1+dNxCHvrz+RpBAXzb3nvoOPMhzDg=
X-Proofpoint-GUID: ZejBwn8hcageN7vS1S4rRE6LVtbbCiy4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010087

Hi

On 01-09-2026 15:20, Aniket Randive wrote:
> The SA8255P UART variants attach PM domains through
> devm_pm_domain_attach_list(), which registers a devres cleanup action
> to detach and free the PM domain list automatically on probe failure
> or device removal.
>
> Remove the manual dev_pm_domain_detach_list() calls from the probe
> error path and remove callback. These calls can operate on memory
> that has already been freed by the devres-managed cleanup, resulting
> in a potential double-free. Also remove the unused pm_domain.h header.
>
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
>   drivers/tty/serial/qcom_geni_serial.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 3633723acef8..fe961b206645 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -20,7 +20,6 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/panic_notifier.h>
> -#include <linux/pm_domain.h>
>   #include <linux/pm_opp.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> @@ -2008,7 +2007,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   				 DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
>   		port->rx_dma_addr = 0;
>   	}
> -	dev_pm_domain_detach_list(port->se.pd_list);
>   	return ret;
>   }
>   
> @@ -2032,8 +2030,6 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
>   				 DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
>   		port->rx_dma_addr = 0;
>   	}
> -
> -	dev_pm_domain_detach_list(port->se.pd_list);
>   }
>   

Reviewed-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

Thanks,

Praveen Talari

>   static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
>
> ---
> base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
> change-id: 20260901-probe_cleanup_uart-60bb7d0df5ae
>
> Best regards,
> --
> Aniket Randive <aniket.randive@oss.qualcomm.com>
>
