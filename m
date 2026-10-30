Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793358034;
	b=zUVzZVO5dwrm1+aglcwzo9eRIrIyMP/8k7m/UZQlep2kjr4yGeqMWpfrrHYAGDMnea/T
	 hnfxBrSoJgeoiAiacDX6YTf2J1oqQvIgvW8nPUpPG8coXJPtG2X9MVttDhuWyqYKxRF8B
	 8Eg30mpgcKSWAxxSa+qPttURztUtJ7URuIzDXVOGgFBGoEdc/o+u0BWtbiUyNex/hKSxJ
	 MbnQUHkQpY9FRLd/0VOdKmJGqqsSrvTGMsTWNV2DGO9c4Ts1vks8bBPFsKsUjcZXIDoX9
	 lukYu+39nve5fzPUoV+NWPUBplOiW+9XBoy/OR/mrEh8H+TvXHzze+3aTz3g61lKwQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IgLsF++4YrDHxiLkxSaC+mUba5OUh/3qh0E4AJY47EQ=;
	b=FLVbKqoLkn9Q9XVw82QtWin2fHvjfRcBuKT2jyS7V0RbaHl2nBiKch4FCgVCN4h/mNXz
	 ioJM59hUWo3nj0MFK1flaFemxj1fMK3f3WBTccmZiQpGK1cv+tC8WnV5ckGe4/GcOr6qf
	 Ai7TfD2izG8FZaK5GqiooCDUyChAiviUy7wSiaP41ugounAnrECuqm6asF1FHDz4j4TaE
	 S9pbcIMXBv0OiLXeNK0MqDXflSu/mlIUOhjnugbixxyq0yogUdk1a90ozCIdmEHhVwDND
	 sF1dmVotOqLaa/KOUoJysSXkOF2JdbW+gI3RMQGYd+ykdSYmvlP/WRfvgPxWTSjkFNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HmIUtBvE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KfA0Hr3W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89657606C6E3
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89657606C6E3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HmIUtBvE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KfA0Hr3W
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FCw53738296
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IgLsF++4YrDHxiLkxSaC+mUba5OUh/3qh0E4AJY47EQ=; b=HmIUtBvER/Y2SW+i
	q5qyGmDoHSPZdndt97PH0rykbu1/4QX7YiVLErRJi6rCe7850+rpnwajQdu5VUxp
	pIAPcjEXNDjPn+uQ1AtxgikcP/JNvGpX0H0YUVLl4OKVGBD86MAxL7/TcGsHBfjF
	VVCq697DkSz3vVq5I8JzA+m7+1xqRzrV2tEhmavl7NPBoWKP5n3xz0tuRm/66EsW
	CvFuCc81VYGmkzj51FYXmakxs7M5Qp/mtS32JBEoDxcFPhzbqqcvRxTakgGf/DU/
	nJWhukWUiGKGSNCZ7dqHeO6JbFzq1igI/QrfoxM1gpX35sZBWPP9eq/mcO/KKPJn
	emqnOQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme752h91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so514300b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:00:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793358032; cv=none;
        d=google.com; s=arc-20260327;
        b=So/dzsViKgYaQ4pRtQ27jUzVnPRcFuuv2dwyuZ3NBxchNU6uaEcnnbI6SjYLNwgtyt
         q9JK5e5/S3hr62zN09f8+Gsfs64AbnIDN3NT4oY0Hs+dmPGSnFGr9auTJHwMD70tlg24
         RgqZQC6h9KRPQYlv01lghuvrVTi/wVPhkn5SzLHn5PfjdQaweMbUK3lj9UpBkkvas9N/
         tAXocHmlYmjY5lty7MKH+A316Yzsmg7otTp+lZBU6pBoQ1VMZwR9rAnffpruYNUjJo6g
         v5d2kcRg8PjOj19Buak8BXq0HkUCSrvFGFB21i44/B7TLgLDAVOFUSYmRiKzwv9JwysR
         cxZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IgLsF++4YrDHxiLkxSaC+mUba5OUh/3qh0E4AJY47EQ=;
        fh=7qRJ7bzw/Lwnc5In111WMEgVkC5MByZobSWRgyYHkUE=;
        b=Ps/QhS72gam8sv3pwsWVVu4GGfllxL+MIWGeXOt8E0RQovAibHeqKTvhiGdAnHl3dg
         0UnlXSpe8IiFbfv12pTDrz0wVPHhdhBVPwVUhcTB9HHv4hWo1HKaj5dddchMORirbI/o
         uvEr2142D0e3oiRwbxdzBPem5kdnaYL8DyCjl5y6UMSiQ4PjyXh6u39Gyikw84NQdZwb
         XeIVHPL9/VfKVwwvUOWtf7ewNidTD209y/XrgztHFWVWTN2ZA3rfV4KJF0m5TqKUfSPQ
         nZwYvqsr/7EolU6lZSMCNhSBVFFCG4nsYNYlGnqxb7i+kTxmaeuKTCOdE6JDGGiQGCKJ
         tEeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793358032; x=1793962832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IgLsF++4YrDHxiLkxSaC+mUba5OUh/3qh0E4AJY47EQ=;
        b=KfA0Hr3WhBknyfzqyxL31TMubUcP6kNcMUtnYVcPrSigRfCr6xSo4oWLlS1lkphdLY
         ZA+wp7A3TcEIYv2qMdwlFkkc2aVCgu8gxadlLyWzQ50bMFj5Njcj/vWxxeOEsHOLXfqj
         xJHuqWww51o+e1wm0HCrj8trLZ3GRw93MKV51A0wDfpBt5l+kMIMSx2ABzrws7LtoLmD
         8iXP1bRHgIu0BLVucwlWlLs4VJkWmqOwK9ASZUPvX41IW8RmXSuOPEa2dJuayaHvjdsb
         BFGPJ2m8YS9GM2vhO7DFWGSNLoYRB8/7Ua0rUApqMTecgOhmdKotqapxVP6W+MXoPKF6
         9j0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358032; x=1793962832;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgLsF++4YrDHxiLkxSaC+mUba5OUh/3qh0E4AJY47EQ=;
        b=Im2WPxUszJy+wEpK3W//7wIUXooXnFUZjPfODgcputIW7/GoAjRGgBMgy4KcReOZvL
         TFdvrZ+566m4UXzE/rBMFhBzDyxIztTzj/hZQkw2yw0IYjmXGYUbzrzEbaDPIKJhGw5d
         LpOenXY/e3XPR2J4AbZLNkdK+eM9D6/SX4HVcl4yg5VzqZZ1QVKWt+TX7mlI0eIYQRA0
         YR+HNudBq6m7r7OLdy0vk9wIqPBzKpCEW1un/8g0UCI2ZWXZB6SHfz4sEAQ40Pn+mt/f
         aH+V/wp8lSukS/WdnhTu1JlfpOp+F1GCAVElZVGdpE+HEbB6Z4OPVyRYcS83BVezOcbE
         +3fA==
X-Forwarded-Encrypted: i=1; AKwUvBwfUMJIhpDZ9uAQRinV4XmcknPjac4YS7HCrOOGXvtg97DnPmGC855GCL4HrEGZM+Pk1P6Xtui4O7pQlpw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCh2+vMdUa9RGtugsH9WV2JGMJty5XnjiGQBBw49XGAzLvkcXn
	zzWhK1KpbT1UZS0ROMMGdeauKf48JhYPOrXmnp1D4Qk4x9MtIMIn0ASWUeR3flm7SiUR99seR5a
	GV/IsFJGDc2r8aydkb8TpfgFq4aKRNdFmGDdOFvZlzaDkzAw/onDSxsa/rg24PSCvmwJIWgtIRG
	2xkk7AEsDXM95vphZR5tH/sJUdI8Jb1hVYcorjZ7HpOw==
X-Gm-Gg: AYBFou3pVllrNa0rE+2q/vDgGCZQYwQ7/cu6lv08bf3NT4qZvQrCqOE8UAJjNmy+QHB
	pBLTiRJt0Jcgc4200wyPu5kBv4wWipisPANlyvV9mUwpsy6SJGGS1fi8+Y/GCWCESl4jr3MbnH4
	LFCygDPjlcGJR9f8x7SkBF+ZvCSMUwhP4TDZUwADNiUD3uXgYAsU+Z7OD1sg==
X-Received: by 2002:a05:6a00:4b52:b0:89e:7bfa:f880 with SMTP id d2e1a72fcca58-8a9be4912efmr1664160b3a.11.1793358028929;
        Fri, 30 Oct 2026 04:00:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b52:b0:89e:7bfa:f880 with SMTP id
 d2e1a72fcca58-8a9be4912efmr1663980b3a.11.1793358026227; Fri, 30 Oct 2026
 04:00:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020220140.31752-1-anferneemelokc5@gmail.com>
In-Reply-To: <20261020220140.31752-1-anferneemelokc5@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:00:14 +0100
X-Gm-Features: AclHuK9cDn85gWrusMMP-W9L41_UYwMzVXdFFjFJTDQP7QMovH4WYgXI-UJFkXY
Message-ID: <CAPx+jO8ZmctKiQntoYrrYW61zwFXkT0_jR8Uqgup8iB1m0C8mQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: sunxi: fix clock and runtime PM leaks on probe failure
To: Anfernee Cao <anferneemelokc5@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Ml3Ayeow0W8NsZFxbI5Q-eyIqV505C4n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfXwXVoh2lXDJMx
 nytJyjkd1htTV9/vhi88NuHUKuings5ZBcdbQ3FYKJoCE/WXmSSgRaT+BAMtRDlytNI8G7o6k4y
 tUWcQi0paDM5ZiZmuGqqiCrpSiMslUKedgkfOHrQQdl+d/VSV2UPq/C2Ki1UVyLXmFrFXPk9JEi
 F//t3aqvNkJxYNwnhOBIpHtKb2Z37FI4YuJ7lMMCFX2gl1PNg2LPEp4rCi1xurQSLvgpne51iYv
 vLSO5FLGhNdo9bb9/1Qd+9/9/dcmtcQm0waCr02lIJsTW6NrrMchqAA2ZAQ5jjMAluYktq7bOTI
 8S4RVOPIZMcKLKgXK/gkDpFY+BruYve4u7SerH3nlY7qEgtWDHpeUHbWPExNdeV55NtY5xe8zii
 oUw+XU6yk9EN4N9AjdK4v/IjH/a8sUNRKeP7nAhaZkNDgCM9P1Yi2cbt9cNhZcM6JfVpot3DQBh
 2mjcL6wdXF1817/jVCg==
X-Proofpoint-ORIG-GUID: Ml3Ayeow0W8NsZFxbI5Q-eyIqV505C4n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX93+zvWLF2LRH
 xhGhihxhSU7J2BaqrqOsSyKqkB0RkfT1IIGJNKcE94P8X9Bb1w9pj4JAFBF1jVe0v/5WmhpL5OS
 pSgcppHhLAZ5uPQO13hrJygu2t/kE3w=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae478d0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=BnDUjJD_-KrmPbzgTPgA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300043

On Tue, Oct 20, 2026 at 4:01=E2=80=AFPM Anfernee Cao <anferneemelokc5@gmail=
.com> wrote:
>
> sunxi_mmc_resource_request() enables the bus, card, output and sample
> clocks before returning. Several failure paths later in
> sunxi_mmc_probe() leave them running:
>
>  - If devm_request_threaded_irq() fails, the clocks enabled by
>    sunxi_mmc_enable() are never disabled.
>  - If dma_alloc_coherent(), mmc_of_parse() or sunxi_mmc_init_host()
>    fails, probe only frees the DMA buffer and the mmc_host.
>  - If mmc_add_host() fails, runtime PM has already been enabled, but
>    pm_runtime_disable() is never called.
>
> Besides leaking the clocks, this leaves the clock enable counts
> unbalanced, so a reprobe (for example after -EPROBE_DEFER) calls
> clk_prepare_enable() on the same clocks again.
>
> Disable the IRQ and the clocks in the probe error path, and disable
> runtime PM on the mmc_add_host() failure path. Also handle a failure of
> devm_request_threaded_irq() in sunxi_mmc_resource_request().
>
> Tested with QEMU's orangepi-pc machine: with forced sunxi_mmc_init_host()
> and mmc_add_host() failures the MMC clocks stay disabled in clk_summary,
> and a normal probe with an emulated SD card still works.
>
> This issue was found by manual code inspection.
>
> Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found on Al=
lwinner sunxi SoCs")
> Fixes: 9a8e1e8cc2c0 ("mmc: sunxi: Add runtime_pm support")
> Cc: stable@vger.kernel.org # v4.18+
> Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sunxi-mmc.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index fe4c0f6d73f3..437fdadb5950 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -1354,8 +1354,13 @@ static int sunxi_mmc_resource_request(struct sunxi=
_mmc_host *host,
>                 goto error_disable_mmc;
>         }
>
> -       return devm_request_threaded_irq(&pdev->dev, host->irq, sunxi_mmc=
_irq,
> -                       sunxi_mmc_handle_manual_stop, 0, "sunxi-mmc", hos=
t);
> +       ret =3D devm_request_threaded_irq(&pdev->dev, host->irq, sunxi_mm=
c_irq,
> +                                       sunxi_mmc_handle_manual_stop, 0,
> +                                       "sunxi-mmc", host);
> +       if (ret)
> +               goto error_disable_mmc;
> +
> +       return 0;
>
>  error_disable_mmc:
>         sunxi_mmc_disable(host);
> @@ -1385,9 +1390,11 @@ static int sunxi_mmc_probe(struct platform_device =
*pdev)
>
>         host->sg_cpu =3D dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
>                                           &host->sg_dma, GFP_KERNEL);
> -       if (!host->sg_cpu)
> -               return dev_err_probe(&pdev->dev, -ENOMEM,
> -                                    "Failed to allocate DMA descriptor m=
em\n");
> +       if (!host->sg_cpu) {
> +               ret =3D dev_err_probe(&pdev->dev, -ENOMEM,
> +                                   "Failed to allocate DMA descriptor me=
m\n");
> +               goto error_disable_mmc;
> +       }
>
>         if (host->cfg->ccu_has_timings_switch) {
>                 /*
> @@ -1467,7 +1474,7 @@ static int sunxi_mmc_probe(struct platform_device *=
pdev)
>
>         ret =3D mmc_add_host(mmc);
>         if (ret)
> -               goto error_free_dma;
> +               goto error_disable_rpm;
>
>         dev_info(&pdev->dev, "initialized, max. request size: %u KB%s\n",
>                  mmc->max_req_size >> 10,
> @@ -1475,8 +1482,13 @@ static int sunxi_mmc_probe(struct platform_device =
*pdev)
>
>         return 0;
>
> +error_disable_rpm:
> +       pm_runtime_disable(&pdev->dev);
>  error_free_dma:
>         dma_free_coherent(&pdev->dev, PAGE_SIZE, host->sg_cpu, host->sg_d=
ma);
> +error_disable_mmc:
> +       disable_irq(host->irq);
> +       sunxi_mmc_disable(host);
>         return ret;
>  }
>
> --
> 2.54.0.windows.1
>
>
