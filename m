Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F8B493628
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141245; cv=pass; b=JFxxz11YaMoCFdeLjDvDFh/vx7T4FJryu0sHy44Tt1pFBvRhTIHbRdqwJqctLUc8MCKgheGOm0GHWBHbB7OFOJB+7DsqDgtcMsgXkN5sxofkvTHUXHLPntEZW+VX7RFWJ25Olfz1yV/nTMWEp3nadbDbJjMCzG0yhm7kmnZdfyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141245; c=relaxed/simple;
	bh=vgyKC5wP5vZQX2PheX+c9+cU97I65EruQX6t6jcv46o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGo/g1DaeWTPuFxXalZkOfY+aaUSdj0wviapNh8/ZX04fZdypQdK9777CfhYJOWR/dF9mspny6Wswdcb9/mnhdNN9mLBZ3TVDhS73kJ9tHW2w0TdcXJ9LEOVMYY0iI1OCGVOG2I7tLF7gEfg5oDRb25p9GaNC7lHVgWfb9YE7ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IB1oiVth; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCwwzNt5; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IB1oiVth";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCwwzNt5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm76T1371447
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cg1WYUrNGGFtVONVnKPa1Xj6heNwOWL+7lG2ZgsnoxQ=; b=IB1oiVthkc017Lr3
	F10TgPdkwyu9HwHfYLXWwlIM0RrPBOwAGhU9jYJ2fn0O8qlgQCeyqKzqtpFU8ok2
	ntwaN0rOSpLIbOywNILDKxqbzfeOl8hc+pQo96+i+8TobMIi7P60u/wM41oY1JIz
	7E1ewMOQB05eyPCLEVf72fMmiYq6PWk3FpI4Ri2OHqMiSbWK49ADqiwRL98PyWiR
	15rHeugTn3bw0tpq+muCMl4usWNgbCA83IqqvOPbZ5K0Q8PXOpyXM/wBGC9m6qJ2
	Vv18YGc5T3lKmmmsJW+wuVnc0efVRqiDA8nErV41ZVhqVBbHEvyMzXY9IPzgKvfM
	mS++rQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8jjax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:40:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso1462762a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141243; cv=none;
        d=google.com; s=arc-20260327;
        b=FOzRgOFG9hmVn2KLgEncb3KzyGEAHVj++Slnl6UEYhzYUDkG7PsrZ4qnPodC9xSooi
         /o/leZMRwjAvadp05iNIn5A8ih4N9eIYv5lXShndu1KPkHCOPLNPDTJjxoqIH4RlJVVd
         0HdjvT7QeFbEFwQ0IGMCX4JkaFyx5sxY0pHtzi54aAZbkyfjsZLGlvSWoOZqSwP9KDvq
         W1MGKpMeXMU7POTh79/SVKnWCiPfSsdCM/ABiWaO1MnYOVr639ZrrzMGsRPnM9L70Vgv
         hawIVBtevMzS92bd3dT5PHgCUr1cvw+M+U+87wVgNn1wur03YRFpkLyE864Ehh7+wv2F
         9iJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cg1WYUrNGGFtVONVnKPa1Xj6heNwOWL+7lG2ZgsnoxQ=;
        fh=6L5wR2ewqbmATDsxt3+7LO46UsoGqNixoUvlW/DtqNA=;
        b=R+9aWtKfuOYp7B21RL/x3cEcV92Jl2TA4krbEReK/J9jHugBmly85M2v+sinVkm1hf
         XwVsIs0XWmbgJQUl/epvwlEx2gP7vwL69QYmBPmUDEQazULkoqRI5mbQLiKywAK00Dnn
         Bx/dD9ZaGoNVNhTH9S8fCwXmsuLpMQ+vZsikBLsTWQnRqLEY0grOtyQHZ9oMF85ZeRde
         izTyzKJ2HPCeXdFimxx/tfJA3MKiWume7P69E5E8chQqgBhFjNzfYXjxkQXrAB2nJLCv
         LiPQFzsOX5P8bGv7zuWTCVJkXXtN7FqllksW3eZY06m5XI2KGKOL2TdLzVMRlkTycDmB
         /i/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141243; x=1789746043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cg1WYUrNGGFtVONVnKPa1Xj6heNwOWL+7lG2ZgsnoxQ=;
        b=VCwwzNt5EeEoXmqa8wPq+PvmOAmQ9DAK0Eq5Ywi2q2+c5hYvdhHbzMbTxV7iboXJN5
         8a6cG8pKMAlSiPb0T4dCD0kSYHECAoxXGnoYr60suJnv38Lbqs2T56axE6yInd4Pp7c/
         gls+sCIoHkmys7gZ82pbdmeVnRaVVTnVtVj2g0ZuvgnzjbZ7t8NJlRji1n4ok8BjOqaL
         0e8Qy2Vtlvy29nP5P2OcVG4RdHOeytqOTNYkkfMSCYvUc0qY/B4l43i3TmRvB3wTY2FW
         pxxUqPeKbi+011fpLVs94xk6bw+OALOFiUYdTT2r0yVc2L0UrEbBD82+yLG1KEoh827j
         vmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141243; x=1789746043;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cg1WYUrNGGFtVONVnKPa1Xj6heNwOWL+7lG2ZgsnoxQ=;
        b=O5nGwVQyVB+qGSeuo1SzqgUvJ5eCl1QjuLO1ynS/UcmsmL5aDiY9+P3i/L6sMx1+8C
         bfIa8KIGFLaJgkKhtRk0zR9u/o3i1N+jh1tOK5FIr5mT/LI/tI2MbptdVhP8yHzK/Fei
         ct6kgCmgeLPv3IpiZLXVa0dqSrV08v6g3MfAIaUtktyHqBAAgSE0Y4nX4BWcZmKEynyE
         VMFFzDvxi8h5FnOqPZka492jHhNrhPBeAR8VlBJWmyYQMnWpNDjgqiMDdQ30wuoCQkl2
         76yEOtGXvYJniL0XkUwisIyO+PbKXqBxCEPVHdx9YqD7W/L4Kh9SB5X0Q5XKUW8Ml2Wh
         t4XQ==
X-Forwarded-Encrypted: i=1; AKwUvBxu9kdOdGttv2hVMzOuUbYSN/UXORiFxkOjbCRBGf9peN5IV2Y0eTSnmrlO+72R9fOWHEA7gSf1BTpXuNE=@vger.kernel.org
X-Gm-Message-State: AFuF++nhUoo5FmcwHA0K6jNlhSNmnbVrCEr8+CMs+ia/5Xn81tUH1kIz
	Vi8tPjcF1AFlJWd8AtIlaYk+JFYczTYd6ny/GoNG8rbFnxVzJSyk711ME6ro5H0A5iEMbUDswNr
	quD+a7qaDJ6LheL6Jj6GZVc9G7sk/n3PuviMgmRPIidrfP0eppfr3wtzPnoD1DzXnQyrxTcBykw
	wu7/eHK4evcDaG1jOW/24/Ezu9xRf5NpXqAx+eeSBTdg==
X-Gm-Gg: AYBFou3BBNQrh33s7OvxBzNjnGUa9/poxn5EZ+cQ9zX2hZpUt4kvAGzZrmKjqqORd32
	tUW5A+LxLrXoJ5fcMminLqCyUFWakGI4KDYiV4bDaMHCziv4u7V/2SBkdVOURI+XQzi2f08hy8P
	xL30ZWvDBn+KZm0L8wiLfhKUNAhgG83dMTaALnS+rSYx0v2Sy4APF+k0em4w==
X-Received: by 2002:a05:6a21:6f88:b0:3cc:3d08:da39 with SMTP id adf61e73a8af0-3daed20b6e1mr9948475637.0.1789141242501;
        Fri, 11 Sep 2026 08:40:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f88:b0:3cc:3d08:da39 with SMTP id
 adf61e73a8af0-3daed20b6e1mr9948399637.0.1789141242111; Fri, 11 Sep 2026
 08:40:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902140926.3576781-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260902140926.3576781-1-runyu.xiao@seu.edu.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:40:30 +0200
X-Gm-Features: AcwNN1UTv7W64Xm4jZLjYkdUFI8rRmcEfot7t-_MQS7eHd04yw0TvNJhM_aZyck
Message-ID: <CAPx+jO9y6t7vqWqpVZpt37N_71b3rL1m-=RF2RDgtB4vkvS4Dg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sh_mmcif: initialize IRQ-thread mutex before
 requesting interrupt
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Jianhao Xu <jianhao.xu@seu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 6ZI31bBTWgVACtPz6-MPhQiK_ePPIrzN
X-Proofpoint-ORIG-GUID: 6ZI31bBTWgVACtPz6-MPhQiK_ePPIrzN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX0e3qFU8kusAu
 sCbiEwSOEwj8uAMLVg+6rgUAG2u0eMgS8lIw1XQQzjv5aMcCCheshUvihtAwe2UYaU2P9Z0XWzT
 5zPF+FUvhDKMxoB6qjQkTR+BKl3xo/a3uXZDVT/a+q73eAxntBpzOJJb/gwmwpAL+2qXjag+siB
 28NeMg3UNu3eXohcQtkYlB/WPtFyR0sDAW6WB23vplFlqoD2M5/y9ILi7AHXscHJfG+txqj+T0g
 A2v9ytv+4mQbhUQoR+bTUuB3UmdUAJtxRouYlwYsG3dSVQRL2B8B6HnP6LbayqrbSgE4OLjtiIW
 82A3eKGQKvR6ywRloLqtud1Glp3cH+RV8CGe7ov2N4xNxxBIc4irDVUg53FyLtDROM16fIIO5fM
 BMHuIjT5eTXpuNssd5iRBrAzPuGVoOslA28UzfCKbkzlV0hnlyJ9TDCMxIWosav8U2eGlrS66GY
 j8uW9D/fbfI7CINv8lw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX1fdQ5n6Np6Az
 Y/wXDaoje1vkg4lLIKxsWSokWC8bmhAEZsHix5qViNGabn39gzIlKSKsPtd1+ARRibhcVyZqXBb
 49Uus6WCUIxhsBeh1kycUw3N6Z9Jvec=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa420fb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=E6_GXre4Z2_RQDsjcpAA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110218

On Wed, Sep 2, 2026 at 4:09=E2=80=AFPM Runyu Xiao <runyu.xiao@seu.edu.cn> w=
rote:
>
> The threaded IRQ handler can run before devm_request_threaded_irq()
> returns, but thread_lock was initialized afterwards. Initialize it before
> requesting either interrupt.
>
> Fixes: 8047310ee984 ("mmc: sh_mmcif: fix a race, causing an Oops on SMP")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:GPT-5
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sh_mmcif.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
> index 7706d01b1..8bd9cdeda 100644
> --- a/drivers/mmc/host/sh_mmcif.c
> +++ b/drivers/mmc/host/sh_mmcif.c
> @@ -1461,6 +1461,7 @@ static int sh_mmcif_probe(struct platform_device *p=
dev)
>         host->pd =3D pdev;
>
>         spin_lock_init(&host->lock);
> +       mutex_init(&host->thread_lock);
>
>         mmc->ops =3D &sh_mmcif_ops;
>         sh_mmcif_init_ocr(host);
> @@ -1515,8 +1516,6 @@ static int sh_mmcif_probe(struct platform_device *p=
dev)
>                         goto err_clk;
>         }
>
> -       mutex_init(&host->thread_lock);
> -
>         ret =3D mmc_add_host(mmc);
>         if (ret < 0)
>                 goto err_clk;
> --
> 2.34.1
>
