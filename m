Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A980415B6B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341246; cv=none; b=U5OsWMlVAklJ81KtjySjAQITS5Gp9Rjg3+i4TxSZyJLMKtUJZ0LyRq4VaS6OhS+kKpYSL46GbmxUgUnxNWf9cPJ/2Xr0zeqY0W7NRSZoI+DhNBQMiLpMB+r66B0TJpXde109eTMU6ruPVxXFs5KgHItTCu5pfOJmY1eUYMQk2DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341246; c=relaxed/simple;
	bh=4RrWg3YRAeHPQUzHKjgVo28GNnYT956K15imGLTP8yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLH9VTaBU/0JxAi/vmaSMu1U50IbnCoFeS8kKZPTRua/gGDCeM314KxpMIKY1az9Vsj10kcbwS/8c8XJf+rVbekflm+jGyx/jImcko7P3qEKzDUuB2HrFl7guxmEhiHLu05KwWMiUM8nH2Qy2QdmWOgutlUGOqsdG5Q8iKOdEj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVF1nDol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRlhJpLX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVF1nDol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZRlhJpLX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NEt8463929
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 09:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gNLzMLJZKI7OImu+XuzOnLBC17S6dnkYMkkwnpIHzgw=; b=CVF1nDol+hpZwsFS
	MOgvCBfb1EwOK0kpu/Z3JNm/mxhLAgh54XhaeCGkXwlxAj2rRKgmNudMadzRAUB6
	6VIahtjrGJKoReOrZVYXLEGFRr340+g4JsWIFwWZl2yCIersIw0MU7Bnw//mavuL
	OoTVWoM5YAztEdwdxd0tLDEnFQIeZ/iIuIuyGb3gMKKvSXd43IpYyfj5PZ2a24Vt
	PyLbKWBXkxzhRWd6YLdV0QtDLb/OhlYfmF0+BJplbFO+QH6WDUNfJ51h3pEwYY5U
	UyToNEgTyeLhWpkb0DJIjqLj5adDzsiqMKWdNWSDFmnc9pGRy0KLjsp4mSavnPiK
	41ffjQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge35k3738-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:27:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so1470310a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788341240; x=1788946040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNLzMLJZKI7OImu+XuzOnLBC17S6dnkYMkkwnpIHzgw=;
        b=ZRlhJpLXs7m2BLsfe5ikECyZQNjqrMn8jUttE8rx9qJyObr/lq6glYak2a81N2C1Dv
         gkivVdC9B4eOubxt2jmTu1OYQP+UytQAMwLoiWP5yzITcKA3xt372P2x1h1jkCkDvzM3
         0GxlzVN5AfdKqE6hEE8V09MJV0Q7UuiD/jOt9mxC+Pmmi5ERmhq3el/ITPHg8t/M9tRG
         y3OOlsOuPDcWq4au6zvYci4yzAVAxWLJLNxDXdknE9fZsWYkBXkrdh71vyPe0OPD9OPN
         H00AlQt0BRjfkxx/Rfs++Jos8AU4n0Q10lPhl80vnjwndQjV/UflW5g3CyATvX8rntfD
         0HFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341240; x=1788946040;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNLzMLJZKI7OImu+XuzOnLBC17S6dnkYMkkwnpIHzgw=;
        b=Aqnarzkq8sKraiemVfkUwYBkCgmTTk0BrtTEI7iMCwdqUFNkTW6WZDr3Ewq1pm19IR
         00r1UR9YSiGVTz3RdtZ7X5LRuOPnG8I959hLdquhKMbGaJrddokcA/zVyIqEYovtR1su
         ZlwZMwJLPn2xbaOTUwXzIyzwdJitpRJa5kMmggV/AudiK7af4/uwtbTRHrT6ZAaK2X8F
         dTmrqflfl32vznK58htilEYSanIEHICI/7BpaGxe7oFP8ymC4BUvcO4z1KvnOiO1N+jN
         wExX611QfxtxumikuMM5dScnnwLOAjqntzCvpbf+aANuapfSXycEXiZjhHC3zX9nRkX4
         RbnA==
X-Forwarded-Encrypted: i=1; AKwUvBwassD19xRWlsR9ES80x47omALeQB0NQUV0+qP4/znE3pHneCIsbqbZx4ViLDK4yFJ9/BL7jfHdadl/14o=@vger.kernel.org
X-Gm-Message-State: AFuF++l7YKz2XiMRyyYAweOiVCxCOZ3H4TqMAIeIy6vLdKbk5Jr313Wq
	ssu/jySOPLIAN4clA6Sq8uqKmXCzTPfpFncT0yfYq7BPngc/cck45lMKTMkH2mq5lpyryidNGEs
	yd0hpmd+CSFpHOoPRImH7QRpSr30tBsUjyT8EPLkAqXs8AuVNL1wNf2Qmusw7KvAIh9o=
X-Gm-Gg: AYBFou3/06aACWn2n57Zrh0JAFc6YXq0Inl66KVAPCtPl4CFibHaUULZd/ZJCKzM7Lt
	byZ5K9iBUdQanAqn1UMe9xOpNW/Yeq1+3eBbc2rhJ7sLBh7FiG0jw/5L3QHC0j/8ai8WKG6Rq8C
	L3mYMWYfy/m8B4iugaDmyhTjLxfZU+vM/TQBd4r3r76JOu+d9sbhDlScybYSglAvHz2+Hlp2aMM
	TcO1p/Pmcw4Tf/taxxRvhglUaW8CXL+8lMePMszO8cUchB9Uu2jh6TSDgQr8uOLpPn6KvM2yziX
	tB+7gzCH6I6JYeGMhsVx3HJtCuxEn/9X4bMl59jF42jgStyd0cYqLu7rWVnxrymXsrmDjPOaNNf
	+Z7wIq9AeGeJx8sz7OCnTl5Th+LmMmnQ=
X-Received: by 2002:a17:90a:f94f:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39aee21a4demr5659443a91.19.1788341239433;
        Wed, 02 Sep 2026 02:27:19 -0700 (PDT)
X-Received: by 2002:a17:90a:f94f:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39aee21a4demr5659371a91.19.1788341239018;
        Wed, 02 Sep 2026 02:27:19 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430e9eb4dasm8445304c88.2.2026.09.02.02.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 02:27:18 -0700 (PDT)
Message-ID: <54de34e2-cbe1-4464-b186-3ba242ffe3fd@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 14:57:13 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tee: qcomtee: Register qcom.tz.tpm service for
 discovery
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com>
 <20260831-tpm_qcom_driver-v1-1-6f16fa6924fa@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260831-tpm_qcom_driver-v1-1-6f16fa6924fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA4MiBTYWx0ZWRfX0j+h/SOG0NDd
 ywpapdxQqgXh24rwHGFDfgopbS2ZhFZ02dYx2Aunm71QirZaLNl3AYo3BgOR0pVrKkcTAODv9XF
 zqO7NC5QbTyP8IOmmsRXazpRWtqxaAOnR+NikT3uNiOrhcAWWk/NBpL6qcf434y3pmv4KskjJjn
 ljt5tOsW7wGxHI7KQW/ComfG2OEILos1nb4GSQkIJiuAK4xSWBjBuqbqvrc4XrmBjGNqflSxf+o
 dKTk2rrv6PFxgijJq2O4iRaC1Ikv9dUABXyNZ/qG//6b6WjC2MfGJGvqLuWS7imaZCYjSXN08WC
 L7ShxptCOiIcixayP0sII5HIzv/dxC+JaKjv2H26TPhyV8umpvZ8qlk/EfLOPlG5as5KQ+Qgg5F
 YbWdKhynDqO3JUH+Ddd5Q8UhPXIm7nWrBn2nDrH7m6vhUkioIipxoLiDl4Xx9zfXtDpyKX0sJRJ
 o4Eub2ZQ4TmURx1f6dw==
X-Proofpoint-GUID: YOdZ0AxrA8Gypvddah_IieaSmnmhVF1M
X-Proofpoint-ORIG-GUID: YOdZ0AxrA8Gypvddah_IieaSmnmhVF1M
X-Authority-Analysis: v=2.4 cv=VLrtWdPX c=1 sm=1 tr=0 ts=6a97ebf8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3Mugy72lF2TQ84n-Z4MA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA4MiBTYWx0ZWRfX/EzoRTm9aq3p
 j1OvFlrE9pRNkp9MhjGetPWEkmOEtbHY/xbC7nlLaJtUVX+HgHrFGJOocAVhc8d9EdqgX2VE3fv
 K2ZByKmhqQ9gE8BVGFUNwdO47MstvB4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020082

> diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
> index ecaf8db67d45..888611b801c8 100644
> --- a/drivers/tee/qcomtee/qcomtee_msg.h
> +++ b/drivers/tee/qcomtee/qcomtee_msg.h
> @@ -106,6 +106,8 @@ union qcomtee_msg_arg {
>  #define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
>  
>  #define QCOMTEE_UEFI_SEC_UID            413
> +#define QCOMTEE_TPM_UID			489
There's discussion ongoing in QTEE side on keeping idl with uid 81 and
not a new idl(uid 489).

I'll update if needed in my next patch.

-- 
Regards
Kuldeep

