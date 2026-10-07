Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C7247988B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366854; cv=none; b=gKOSeHSJZhCEknczX3Kw2+QZKk1UIoDACUy2HE5i0NXaVzzk+6otzm03oHNpgKV9fya/Lo9RPDeaSwwPiZkplspfLAdADjwUdZGWeWzDJ+vsiFbV2LHFqyb7bFjOoo6CAJvJD05GnpGOp+vES4f5a9jvm3FGkFVVlaLQBfAqonM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366854; c=relaxed/simple;
	bh=zMI+4zCyrb7LQgeE4kh9a0cBbmnln2wXw7smUdJGXdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBg7fiSJ5GklDW3BF/eYCxuTYWF/lAIuNvxNo3y/fk/eRDB/3oa/odYUobG+CT3i5pE8/3Ohw6cM7T9flNvVOyH2FiF/PYGOB0KEGod4wnSMkxMnF2yBn5afZz+HKZ8kiA/vyIiN2bsihbOeLc3JY7yS2o3vRenkVSk9Ol55GK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPy+Cw5Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FX7y++Lc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPy+Cw5Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FX7y++Lc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977ju1s2312998
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LEY1HiXG+k0FBzAZcmArh1yUEuv93JP9npYHqIESvQw=; b=TPy+Cw5QB2vpNE2i
	5NgyeChwcjy5BH5Kvs3fL1GlKecMT25SK1OkvkoG4gJZmI67XYjtxOSXKkwG8suz
	vtqOuHAisUxjRc0EgL9XgVdyxKJirjBe6+KJjDUs31+Ujt8QPdqIiM6aKSKe9J99
	JNyMTeQoBU0WnyXr1HzrPt3KcIt6iQFEefR6243Q2srU43UuPROUpuVzZAeJtUzv
	d2lmM4Z3MRzZo8ZiOScasAY1IRWOyQRC6tZw8bbBGcMRwT751Q6ELACfjoJakz4Y
	oe4eoVyZD+iRrk4Fxwqdg9lhtWJw/q3ED4a4tbr4cj2Hv0MYd3T9KCz7E+8r/ozI
	vhduDQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53asku6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:54:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7e6720b31so2306267a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791366841; x=1791971641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEY1HiXG+k0FBzAZcmArh1yUEuv93JP9npYHqIESvQw=;
        b=FX7y++Lck37L97KppKD2VgKsAGsC6LC2mXh/tSK6hk/ozJ0t9BIFk0hCmfiYu3PuFx
         voJ+lXJHtGeZKUOtuleUSlLwIJ70BJ0aSjmXyN7O+bTRm6PvInleDf6Lx1uvqnTUcA+p
         tvtSvCH068QVQD9dbxnUTvYQyoTaLVMNBMJt9oHDq8M3p4Cb0z8OUmoVmQoNz9gnexTi
         8jZhNq3LxreWW9q0IIuYgitaaSvnUe9/w94fCgBwTqk5F2jGTDBfQX6Hev+WH1Icxy0D
         XKmoHStuL8yMz/VSxM+1ftBR9feMNENEbaXsw4FIftHbvJdnzh8L03lwX+Myvs0SxetR
         /8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366841; x=1791971641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEY1HiXG+k0FBzAZcmArh1yUEuv93JP9npYHqIESvQw=;
        b=Z/JG+YN7r8lx/7SRy18/wPfwIVYMsAY3yctFOo4VFH5JSbZo8OTPTsJ+WivkY0guqx
         sACuXniqCoJt/5nKrs3XW4JrGsiwfuCkF/7CDHwPE4RgOnIvntvEsrkZ2UYta/ZYN7uj
         IQN/maG6WJgt2HXWDE6Mi6XBq1ewyUTVcjnSexKK7I5fW/N3mJ3sfmK5ZCmnU0o3Jlig
         KgSrOIlTX2ohkCKxuB6ZUACmqfgZ57CW6wI0c2cPXyisrxKWQarV8xpB9OSLJ5L2Zn9S
         ETttXIBemlpbNFlqXmUlrLNwNKPhRV7l9U0EiWyaZkRnVsIvfHZ9Zuuz762ljRfIEeLJ
         R2Yg==
X-Forwarded-Encrypted: i=1; AKwUvBxCn5bZ6Hu286bKVFFRdJgpv++r6y95wEs+LvfLdTeN1+6q9y15jNEqoTxDy3jEB+3heNxO/csd/K3Fm6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAlL4b8m0B1BNd9uW2kCGEH+Z6mnpJYmrmQ15GGgyrYHP9hDXH
	mSrMToPCWp0Rexx1MCLlDRjoBNot9Al6hhzbV4ru8P2SNU79SOcFLxyoRZMtbYy8JL9N8Ch8WZL
	UUaalVp4WmOuPWkxUVH41nzUgHvIUI89wUGz3oycwg3RAvq2lAbVsVwdinB4Mqp/wIew=
X-Gm-Gg: AYBFou14qNlzFo5Ea3Bxh9Od5A3RdGUJwldBXHbc4kqgh+9fovHG8euQU4zUXMruAci
	1zCaioKv+DdlxwpIOlgsZNH7XY1KXWJJoeUjJeMaJPT5efA1CDctt2ESMiSrmKPH5fRnmkBAl4x
	EOD1AyUHaYJ68lriVWtjVMOnY7Qmw48z6y6UfGBSxyREMpkZ1BXVODQCwiQ3QiFnoemIv7vu2Hr
	C43Aa9ky+T7iSHMBK5aoYJY+bUCqO4sQda9fLXMoWBlTXRnc8ZPVkqgfD3nTB+KVdYpWq4c2/K+
	WpvxxlhHcQJ0e/r+JlDrd0MZ0z0ZkTk7tSCn0MaPzdxW/QhSkToJXzZxmub4mQvkvXjqkIWUYOK
	UcQqS1Kg/cO2QCbFxsgTfXgbPlno=
X-Received: by 2002:a17:90b:4a41:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a89f43624amr1437340a91.0.1791366841155;
        Wed, 07 Oct 2026 02:54:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4a41:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a89f43624amr1437320a91.0.1791366840551;
        Wed, 07 Oct 2026 02:54:00 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a60e5166sm1300131a91.4.2026.10.07.02.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:54:00 -0700 (PDT)
Message-ID: <8f75db55-66b2-4b94-b0bd-ccc52f08d197@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 15:23:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
To: joakim.zhang@cixtech.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ajay.nandam@oss.qualcomm.com
References: <20260928053613.2158446-1-joakim.zhang@cixtech.com>
 <20260928053613.2158446-5-joakim.zhang@cixtech.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260928053613.2158446-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z4mK7ytPk_8zn1Q4t59vV4dYUCSlJy0n
X-Proofpoint-GUID: z4mK7ytPk_8zn1Q4t59vV4dYUCSlJy0n
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac616ba cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=TAThrSAKAAAA:8 a=Krqe4lgBS7SFU2rUEjIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX4M31YiG67ynX
 xtWo3BC9zKvlqGggPetzd5U+XlfrFSxpxg4sE6nnfvRpYdcpYCoU/X1qhiMiNt8wUZaUWrF6Z3D
 BLUghenCxocbi4iESbmE5L8k9Id0i9Q6cliher8dvDOgbs4ifrArcYQyjd8t+pMJhBVsrl8JPSg
 uwv9tyGxnc6djxIXU2KKoomdKoNvKhkQWOWb6LA6AWoJfOJ0v3ii4qRyV45ePkXFCOOMYoPn6PE
 bLfmSfVadNzvhFkOYf4rZiI3qMTa7R9UKml5HzV+QyXVkVNIG5QgEFw06NgiP9exJg+1uD18L4K
 mqzx3r7rxKI0notF7dlpeyUsnyahhyYcmy0pu1sjqzA8ZKzeoCYgqlN2rH4NVjfpiOBOIA+FaSs
 aGvCHPj7mDMe7JVUiPdahYXpsp1RpGM1cKaTq0xlAE+RpOMVdMRUIPOVtULmxRKk+6HXKWeLxkq
 FYJ19LCV7xUlofPGYbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX3Cx4fFV9yqxu
 bD5dxg36SnJFvwzXbikWE0dEtE1REgpJCjpVzkuIMAumeFk06LZWb71KIebAIt8XR0NZhsTI1pK
 iruueDr4gQ7iQRLkGx9H47CzHw/zDjg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070039



On 9/28/2026 11:06 AM, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add support for the Cadence I2S-MC multi-channel controller found in
> the CIX SKY1 audio subsystem.
> 
> The controller moves up to 16 channels through a configurable set of
> its 8 data pins, each pin carrying two slots. Wired-out pins may sit
> at any pin index and are described by cix,pin-out-num, cix,pin-rx-mask
> and cix,pin-tx-mask. The driver exposes a transmit DAI and a receive
> DAI which can act as clock provider or consumer independently, and
> streams with fewer channels than the wired pins narrow the enabled
> pin mask at runtime.
> 
> The driver registers the dmaengine PCM helper, selects the audio
> reference clock parent for the 8 kHz or 11.025 kHz sample rate family
> and keeps the minimum functional-clock to bit-clock ratio required
> for safe clock domain crossing, with an extra margin cycle when the
> bit clock is sourced externally. Runtime and system suspend/resume
> restore the registers through the regcache.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---

> +static void cdns_i2s_mc_rxtx_config(struct cdns_i2s_mc_priv *i2s_mc_priv, bool on,
> +				    u8 pin_mask, u32 strobe, u32 sync_rst)
> +{
> +	u32 irq_mask = 0, clk_mask = 0, i2s_mask = 0;
> +
> +	irq_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_MASK, pin_mask);
> +
> +	clk_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_STROBE, pin_mask) | strobe;
> +
> +	i2s_mask |= FIELD_PREP(I2S_CTRL_I2S_EN, pin_mask);
> +

This patch has the same build issue as the SC driver patch: 
cdns-i2s-mc.c uses FIELD_PREP() but does not include <linux/bitfield.h>.

ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to register dmaengine component\n");
> +
> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable runtime PM\n");
> +
> +	ret = cdns_i2s_mc_clks_enable(i2s_mc_priv);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
> +
> +	cdns_i2s_mc_rst(i2s_mc_priv);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +	i2s_mc_priv->irq = irq;
> +
> +	ret = devm_request_irq(&pdev->dev, irq, cdns_i2s_mc_isr, 0,
> +			       dev_name(&pdev->dev), i2s_mc_priv);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}

After cdns_i2s_mc_clks_enable() succeeds, the platform_get_irq() failure 
path returns directly without disabling the clocks or dropping the 
runtime PM usage count. The devm_request_irq() failure path also calls 
pm_runtime_put_noidle(), but that will not run the runtime suspend 
callback, so the clocks enabled  manually above remain prepared/enabled.

Thanks
Ajay Kumar Nandam

> +
> +	/*
> +	 * Let pm_runtime_put_sync() disable the clocks, and take regcache effect.
> +	 * If CONFIG_PM is not enabled, the clock will stay powered.
