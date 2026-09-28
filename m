Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E5533DEC8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612265; cv=pass; b=jgJzC8RttjDP2/nrjEwmYU3ZQbLT6HkJCgx2PjnWGk+p6wWYhn4XU6NHv4B31PKi3fKGNDFr0D0O5lsWYH2VbDSOq62tRyp4w7DCikpZS1XScV/gk2Cw0/kJ0bcdoZc5SjtnSV6302GZ/X9Yww2mOjaA00TAbdrHuSgCDkPpkSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612265; c=relaxed/simple;
	bh=rzg4EdYDzl86KXke+y/jDjzliVS85GGQGbd/09qMqYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0Cbe4sB74EBL9l2CXtICt9PE3NrofOjXpRKOf9R74/7reD3JxF7RvRcOIu09q9kugn4ZIF97cAu9k6ZErqpok7fVMpHW4P3WpcVKfSseAOb7TFYCkxkKRkbkavLWSfi+8yzXLaItIlqVPQgVCaPLKYXLc0j1R3siy58TRgy7kA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bi20cZ6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZ+5fATl; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bi20cZ6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZ+5fATl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdvlq1908612
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZPG9/h412pdnG6FSVrrR7JhkCyfchpuJdtkMOSDic+A=; b=Bi20cZ6fwwUWrbpt
	a+Jf3Joqsq1wPQmmfSoOfR1hMJyArBHC42oglSaXxYtYKBB1i5IiKWNCevloVb9o
	BKqMy5BThScgvlptiEqjd8x5WJLlLtpwfBw5GfLpiCnmeXl5WGVHzcAdxxcX9dyw
	QuV9rhVUh1vCCZHDHSNgXeL0NEKvglbUmwuhrm8FVfsNNAZXIpmgzUl3llyIXe9y
	XXmwN9Vpkj3H4XAMwdNZMZSlAQFrk5e2nIAhNI5UhcYaPFL8EMntToXkAnrQ3ZPI
	NGsc5iVv29WINfCjpU76pOETnKY/cfkMCipVDt0NcjRLJ/RO4oeDh9UcQmaHOA8q
	N/ottA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxjd1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:17:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so2451605a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612262; cv=none;
        d=google.com; s=arc-20260327;
        b=FG4J0x19ztnJ1z8nJJmMsgGFtOizjHKPn0eEUu9ccryCHdqsXogYIgFsZvguRY7Ar3
         2HkTFW5NIhoifb2+qS74FMPwtqXWqZJIO7e5mlRUPS8j7Dv5Tu4c0xJC+EJezDSwdsMU
         1qawX0fmumpf4aPPQCaDIIxwN1O/8itmKWKwNEvRzldULzjLg8RRib0dy7eF9WIntCMy
         c1dODIq6IspPQZiL00TrYOs+t1dQDz809hXc8CInh7IxQuK09SpVnYBeptWHa6lE5Ytm
         oK9I8+0X53xQA7SGbAEH4NknK0SUub6rzsOXj3hCMI6OF1z9J45mu6HoBBlv1I4DIyFD
         X9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZPG9/h412pdnG6FSVrrR7JhkCyfchpuJdtkMOSDic+A=;
        fh=w3FgNb9jY/WrmCvPusqViSz1vmgA2S1WKuBqcZdD/NA=;
        b=QOFgF9jJN07pCup4IdUlH7Wj9Y+ZH5F4QOwPfLKnh+BoPmkx3htClFL5+z8p4V8T2C
         ETA5fff1vCTO8lfAPw6IuF3qE8/au9MM7+iIoZPF/TinME9tB9au+KCDM9HOTHt0sStS
         MvZ3i/CF2XIvq+HOfR7ZL1Qh37zhBjv2s/3gQ1//alDge/vr8hSH+hsRu9+OqseMOBtf
         aNx5nGVHP0/B3N9qm9zRJ75E6jCBiI3K45joMu51U2V9z+Nqxjo69EYelTPmPPFGRx0t
         3W131dfCfNMjCUeHzMFWL2COK3Ml838H+qlSfI6SSO6tTUEuyKQup8NCbf4OmvP6jTwc
         biDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790612262; x=1791217062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZPG9/h412pdnG6FSVrrR7JhkCyfchpuJdtkMOSDic+A=;
        b=WZ+5fATlhsrQIOCZnr2TqDhqQpYzaTMoD+omPWSjG95ho0OD73z8E8g6K0LEhLKn92
         yxqzlhKInvg+80eaN2bBJK5trnTc3yEbn3lQG6zeJikNamvkam6r6EaNjlIaqtMadUWe
         cVj2++Sb4UQppqYFGsind3ldwtxZzwLea6wos28VJVf2WgpWfhzm2hr+T87WFQ/HxqtQ
         YZtv9MPb6kI6/Kp3LMmYGU5h75D1O1YaKzbmw1Guswv5ZPcfmVerOh4URrDA4KW8gnzZ
         VYxstUL4zfUqWkz2urh7LIm0ND4pUBIFgC7DTJER1DnmKwV1T0uTTGz5dFNII1VHObK1
         Rrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612262; x=1791217062;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZPG9/h412pdnG6FSVrrR7JhkCyfchpuJdtkMOSDic+A=;
        b=rFfjLKpsVmox6XDKProPwBTH+qw6tiiapgqTv0MX3HuQ6MHv8+SyVBuV7i17YcRuK3
         B4LIBskTsn0UzZox4t348T0z9Yw9+CpL7aF+pmO4o2PYhLrZLMbtcG4JdsSIeBnq8I2P
         GoDRxfMxixJyjltryCNnBwyJv9dOO/vsfyiuzn9lc7ldVvzgZTpRN/5FCjcNaDgk9ckA
         OvVFdnom7qCGIqpwv97rVKdNyW0TBA0LMaWhzN/e43U7NZ4Eu/raFbTH95ClKjrWFuF8
         Ylm2nA9LVl5cLqb7rAw2d3osK1KUQYDT3+G70/+MQb718TDwz7S3JUYRsj4RetQWmGMW
         nnvw==
X-Forwarded-Encrypted: i=1; AKwUvBzqJchm36j3YJiFF2A6VCUW6eKxDY4cOphZ/zeC00KRewwfnrarCwzY1+wEHTblVpTTCee2yEius8dnlU8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ1Gv42s4y4GYYmO4IHl8tdT/uxEUYvdomZH0+FV8CIeHvMBmt
	RZ9g/UcVowTrz2DzUdb06wTuDAUKNYt3CFp3wO6897uVeS5GNIqZtbUMYe10HBn9RImcb9RFSGR
	agUnJK6k5qLlcKAENvXbf/2qD3LA1mnDHNn4GWGcTPYW1QiRKrM9wlMzs37emqTg/y2eplJDbx0
	0w9vk41p04omjLdz8SwBRoSVHqhOAtndSftAd/3iV1rjpF7u3lZzxy
X-Gm-Gg: AYBFou2Bg6ARUYzG76Ih7JxlVxoybSzIBnvYGuq/oVNkNumknmb2G4jJUBefoP5s9Q+
	Q5CiEd5evRsgXcH2xd9nv2iqdlzw4vuLjNiCfD40Ls6HDVwWWU15r0Eb/fZwM7k8M9BdeniF8AV
	XlF03fIgU2hF9rUMh9gN1Qa0buM80kbZfJmnqhBQCvddgmDHFb/JQA1AZHLg==
X-Received: by 2002:a17:90b:3c45:b0:3a4:77fe:d478 with SMTP id 98e67ed59e1d1-3a477fed600mr2010794a91.25.1790612262290;
        Mon, 28 Sep 2026 09:17:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3c45:b0:3a4:77fe:d478 with SMTP id
 98e67ed59e1d1-3a477fed600mr2010764a91.25.1790612261755; Mon, 28 Sep 2026
 09:17:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921191326.2146363-1-sanderson@brivo.com>
In-Reply-To: <20260921191326.2146363-1-sanderson@brivo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:17:27 +0200
X-Gm-Features: AclHuK_h-ClRM0tgPWKnM-eRAvfXYVsbs7ZT5xtGlCXk84AjgUs2ZbGoR93rbsU
Message-ID: <CAPx+jO8g-y+uc4YXUeZ3yOH6s44WFpytNu3-f6iLSjtHAVPd+A@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: Convert host->lock to raw spinlock
To: Sean Anderson <sanderson@brivo.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Fzz4MIURneY58odLlg073_9khV8LCnWZ
X-Proofpoint-ORIG-GUID: Fzz4MIURneY58odLlg073_9khV8LCnWZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX6wgn+SpgQm7c
 mw0RsMcUe+vvYJZ7oWutjzYg2O8RwQ9SlkLiNZIpqUvyLTBypKBwOidxanw9T2g6lxCFF85/bfz
 Tsoedj0oLV+ajURq7bkKjEexuZs/HHo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX6vlwp6M7Eurj
 qejN22Q1T53ZDId7T/PnPVW/Cg72Z5KatJSehQRoPI4Zo05kBJ5aY1rNJtCbYW7QE6pR4NbonUj
 eh4CwQ73j70dwn02so3OPLiZuxmXfCADP/Levm/1KW2ofofG3PToXVOu2XAEMzZQ3/HCNEQvTB/
 9MhUoL9ghOy3A8kwrTl0B138pjtAUWEVB8Avk+fgJ10J+ZAcqrxprmcYJidziEPtfj0QyJUVDGx
 BsY25Ofd30lQD5PywybPS3AmAi4JVhWH4h6+HxcwryisoWeEjrUq0O4Ef1o3eZu41kgp+xkoClm
 6PAsytu/J8Gzdmafxw7kmb8uALS7mKTlRZEzjgMNJlGH+GkVKWJJ30XEZLzG3JlD0t4IFZ/u03E
 +XJYxoe2Q2T/bT7AFnGojTkCSer7m5Q+Ks61IB+XE24JM1yMrPHnPI9oIuM2fu2k7jPa+mXG3Tc
 65WrR6BZ1/QLFt8gchg==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba9327 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=GX7wjADfAAAA:8 a=PBpPEWVgUkDHuXiRGYoA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280064

On Mon, Sep 21, 2026 at 9:14=E2=80=AFPM Sean Anderson <sanderson@brivo.com>=
 wrote:
>
> The primary handler for IRQF_ONESHOT interrupts is always run without
> threading, even on PREEMPT_RT. Therefore, we must use a raw spinlock,
> which will never sleep (even on PREEMPT_RT).

Sorry, but I don't quite understand the above. Are you saying that
IRQF_ONESHOT only works with raw spinlocks?

Kind regards
Uffe

>
> Fixes: 066ecde6d826 ("mmc: meson-gx: add SDIO interrupt support")
> Signed-off-by: Sean Anderson <sanderson@brivo.com>
> ---
>
>  drivers/mmc/host/meson-gx-mmc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-=
mmc.c
> index 694bb443d5f3f..d5365c0404cb9 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -176,7 +176,7 @@ struct meson_host {
>
>         bool needs_pre_post_req;
>
> -       spinlock_t lock;
> +       raw_spinlock_t lock;
>  };
>
>  #define CMD_CFG_LENGTH_MASK GENMASK(8, 0)
> @@ -953,10 +953,10 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev=
_id)
>         cmd =3D host->cmd;
>
>         if (status & IRQ_SDIO) {
> -               spin_lock(&host->lock);
> +               raw_spin_lock(&host->lock);
>                 __meson_mmc_enable_sdio_irq(host->mmc, 0);
>                 sdio_signal_irq(host->mmc);
> -               spin_unlock(&host->lock);
> +               raw_spin_unlock(&host->lock);
>                 status &=3D ~IRQ_SDIO;
>                 if (!status)
>                         return IRQ_HANDLED;
> @@ -1112,9 +1112,9 @@ static void meson_mmc_enable_sdio_irq(struct mmc_ho=
st *mmc, int enable)
>         struct meson_host *host =3D mmc_priv(mmc);
>         unsigned long flags;
>
> -       spin_lock_irqsave(&host->lock, flags);
> +       raw_spin_lock_irqsave(&host->lock, flags);
>         __meson_mmc_enable_sdio_irq(mmc, enable);
> -       spin_unlock_irqrestore(&host->lock, flags);
> +       raw_spin_unlock_irqrestore(&host->lock, flags);
>  }
>
>  static void meson_mmc_ack_sdio_irq(struct mmc_host *mmc)
> @@ -1225,7 +1225,7 @@ static int meson_mmc_probe(struct platform_device *=
pdev)
>         if (ret)
>                 goto err_init_clk;
>
> -       spin_lock_init(&host->lock);
> +       raw_spin_lock_init(&host->lock);
>
>         if (host->dram_access_quirk) {
>                 /* Limit segments to 1 due to low available sram memory *=
/
> ---
> base-commit: 587858367581b9c55c3690f4e63382ad622719d4
> branch: meson_mmc_raw
>
> --
> 2.53.0
>
