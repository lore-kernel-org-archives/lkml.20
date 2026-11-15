Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794736966;
	b=d1yAaSCtwVo39H47cbggoXSOKbMaVcz3dKgSwuD4TsxZC7wwsfT2EjRToB7Ick/Mqmio
	 eIv5bCEV+llvVt4jhZ6v1nlQFDGrEIRaHtOdxW5F2NouStjJ3oKOQfo6RhZFZ5r/3eUCF
	 K4X4f/3XCE0ahhMXKXuUQYZpJ6LbKMJe4E5bjXdVPj70elwvfIfMb2ERlyCtYc2W2HmIP
	 fZSKjNGk+Xkz1yGzexl+fHjFRcgXkDYq7iSACZqji5gzzOMI/JfFiqIPZkmmLFtDrkYrr
	 HZy1CiHPvZcqzt+b3WBsL8uwQLHYIxSrsK+sHWi6YH5DUhlxpqfXUWT6PXO11Uix1GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736966;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5o4pY2wXroSbGGGCyclcMAo2fhTRQLykBlTxy4hcPec=;
	b=c3Xcf3gNC6q9RhitFj1ZLsO0xUJ1E3m/K5JVFs3o4hYOHU5CnCzouTWPJkU3IOIDMr3Q
	 e2mTY+rvnQarQSgeIDl9gk60DMyfWAIrPePugFlAHFa/kGltqtfP3Ao6JNovM1+UQZxTn
	 M2JRfTfPrOfhRR1cZRSM7M6CuvDFN3GuNEo5IVKjJGuDUha+11HSbNzvV+9lqGJkeQDtl
	 z7VvXYdUpKGMwfRZIaRj4cXvNiDH3dxTQ/xQtqzehOyqw/Hw0xussjx9ilAHVKNaV+E7d
	 9fH4bar3UWDTiY9FQ/BQQ70wBl7fKqIHNsScVs5/9gPafPY2+sK8wAl/+wcRZUuH/Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Bol/AyWC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JdOul042;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12D9606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B12D9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bol/AyWC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JdOul042
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7w2Zc2139622
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5o4pY2wXroSbGGGCyclcMAo2fhTRQLykBlTxy4hcPec=; b=Bol/AyWCN6ZEcdfs
	TxAVv1dMooit387uEFZrlTAWoYmIC7f4+2zetFuBDwAX0Auiv0YX6W0tpNzpkQmz
	/UEOH3GbokV0tBawBrRfq9T8I+w82cbS2HqCAeahx761WqhEP6n1mCcj7NGVOCl7
	+AvbFV1vKPHAhT4ypjYXdLIRdlmwpl1PTW1P8aS9pvs/+/h0eGQk/bmTUUW0zbi7
	phkonx69CBS+g0k8Ce10pxYfWBh2QD2szta8TuKq5HD+o+ypQ+aV7LhLPafPg96u
	nVUafaGQC30hF4hdMCLLJ9QJkE0/JJs20Zkd8lFI6yz4HNiNmLdkq9fVuyyFBlVV
	GtIcLg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjtu0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:02:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so742725985a.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794736964; x=1795341764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5o4pY2wXroSbGGGCyclcMAo2fhTRQLykBlTxy4hcPec=;
        b=JdOul042eRxfGjWV1XZaVl4Ymnhwc3l7L8X2wrEUYTijlqJmnWZKEgoldSbx9yPade
         NAaMHGMqJILpAFDb8dNVFoqx3nLRor/VHiSB//3jRAwiDs4WysKiHO5zCT4KYVfhPT9I
         WUrgZWv+EAXK6xyC5tYP9PiiN05h3oIOaSAEFg8q4FHPLMV2ozr4G0hz8GNiDhPefpxQ
         vssPxmQ+zDUhflpvp3MFYkRo2CfThUBZUdoNZAmz3/ca4Nh91hwFkvlmIteSAGYz+O8d
         OJfoPqLrQv92McFuZ5oBKUiCZJVFjJrbDa+H7zZM0rsSI9CDxRvuLSOqNVbHkDpDjT//
         blqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794736964; x=1795341764;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5o4pY2wXroSbGGGCyclcMAo2fhTRQLykBlTxy4hcPec=;
        b=yG0/v71dw1VOiG7LDvEjW5m/+IwCvlhPcMZoN1UKErJgeuoNXLBR2TlV4lXVZZorEr
         UOhHMNFqC3coycP2nsrxN/Q1J84VL7sGqqAXK6K0QWNGyQlqww4Xmp6tOaHsLpYXLuTP
         +WAPzh0F1CkNxMa/1RdhXCKtEmJyqg6MSwUvGLlO2BezHf+boXRVm1HVD78Po2kiPPO4
         Dwql5aTpAbLWU+0deInKuXEH1rNKvcCLU4Zparip9FSmVM2t6eaqfaOaOV8Hur5FgQ7I
         2Cx7rNZPPRfeYvhM6DV50Qmji4J/GidBj+nBDuzAunjr51IJg5qXDWldxOTPyu8lY9Pn
         Ha/g==
X-Forwarded-Encrypted: i=1; AL+hErEw3jX6EX/G2LzuKYtnwJDvMoQkukFr2+jgvx3hniNpXfyyzVAKxW93pjPIb5Yudq+6xxgRyPJK6qIoe/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LwZACW+r8rlk002+BuoJtIHaUBHtS8rIHqBnI/77DTlhZ9EAP
	mIzgWZc4tHUM42OgiO1UTtPfgqe8KyNMnxqvzUyJVGVePV20Q/4oR8V9AWlKPTvO7SrfU8ioeQr
	Tt6uQ2xe+syyGRkl52AWQY3eaZmhtqN7YmSh9hhnl3ZjIwvreGTIQRuQ0mHyf5ymcEo9ZZsQCxU
	Y=
X-Gm-Gg: AYBFou3RG6tUhoFLenqMnX7Y++kHHVWspUXzI87cDVEds3mXrB+vnU1Ppm9jd1QMrRZ
	opDKTyWXcpDSwD3hl4CiGTrGoeJtNZvYNQBOU+PsJCIBd26VCai7huYugL1Vh/7JoYBO4ABPoJ7
	dzpx9BQBPcCwis7Jeq79kScib2loEXyxDw0czkQhmxIBxf1LsqgQuAcTETnZOPnjQTIp3zz5key
	VLTqU0/C3vU/7b50Mie44oJfZWKSmcoMVQXAA5bmqvB93z5n6hZo/F3skJ/vQOtU2DNbVeRzkHV
	66/5tbaPe9zOYUTtf6fdhPyqfAvlKC5IUIujdurU/P5Aox6+9o7DseDKP8HHPurRQ5dkDmQJN0v
	FHu/lGijQabdLod4Wswh+vp35aDNWNmqV+YUc14q+9M9gJMXpGePASpG+jjI/wVjHZ8HrnY/e4Q
	LANdETHHNNDZ920JjAaA==
X-Received: by 2002:a05:620a:4043:b0:93f:5519:5e87 with SMTP id af79cd13be357-9494b9c444dmr1229405485a.4.1794736963520;
        Sun, 15 Nov 2026 02:02:43 -0800 (PST)
X-Received: by 2002:a05:620a:4043:b0:93f:5519:5e87 with SMTP id af79cd13be357-9494b9c444dmr1229401885a.4.1794736963104;
        Sun, 15 Nov 2026 02:02:43 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c5095b6091dsm295722066b.57.2026.11.15.02.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:02:41 -0800 (PST)
Message-ID: <f8e1ad25-f2ea-47eb-bb9e-79ee8dbbe598@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:02:39 +0000
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
Subject: Re: [PATCH v4 3/3] soundwire: qcom: check clk_prepare_enable() return
 values
To: Daniel Carter <yass27106@gmail.com>, krzk@kernel.org, andersson@kernel.org,
        broonie@kernel.org, srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
        perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
 <d5888e6336644236bcb3dad4e28fdb5f@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d5888e6336644236bcb3dad4e28fdb5f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAzOSBTYWx0ZWRfXwazsdqZ99PkS
 c5Yffp9H611JU4dz/vTQAixzngB6aP623779+3is3vFFe+DanUPfn1vfEJBM1yRwqodZTwcZi2e
 xFxnkYM/MOqG/IXXqt5xatBVpsh8ebueKz+gb7fYTJ4bRx9FyXgGpGAve4+hDSo7ij1b17SWZLI
 x2lt3c+fFvwKZ4YgHtgwckoSR52Ge4B4UhjEyqbU9PabGcvPyENvSNprGuSrHVf7XU8EaH2VFIe
 QznmXzhzM4rAP5DMd7k0v36N/c7fpdcsbUkMCluxjYVTxiRCJjK6UxticobMZcrWC+EwSv/28rb
 NvQXFQoIsJ+OesDd7dyCgNIxZtYV8vLLRiCMBLa0bQ3Xj51a4FtzJojzXIciNpNaEjqvXRsBkYA
 ckcBxiXO3lSpb+6p359H/iXVJe5RgWFCzAJe95q9+AtIUn7v9rrwofqYUt+zjkGGJkPTct81LQz
 ft6eyEuxEht56uPr+8g==
X-Proofpoint-ORIG-GUID: ozqyb1P99rnISyH4FYGV2uRJUOvqR_wW
X-Proofpoint-GUID: ozqyb1P99rnISyH4FYGV2uRJUOvqR_wW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAzOSBTYWx0ZWRfX0NfhssLh1e1u
 S1RTbyJClrdmIRQr2hCK5uT1YPU19ksgRFUF4Efner/GJE5F20xUm+CzC065c4Sg2DW/cHjzaEc
 wkXqUJT2AQjKIWfCB4oJ7UV/xJl+aVM=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af98344 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JloCQWs77Wql-FaIygoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150039

On 11/14/26 8:30 AM, Daniel Carter wrote:
> clk_prepare_enable() can fail; unchecked, the driver proceeds to
> touch registers with the interface clock off, which aborts on arm64.
> Check the return value in the interrupt handler (returning IRQ_NONE,
> as the interrupt status is not read or cleared on that path), in
> probe, and in the runtime resume path (returning the error without
> unmasking the level-high wake IRQ, which would storm while the slave
> keeps driving the line).
> 
> Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controller")
> Fixes: 74e79da9fd46 ("soundwire: qcom: add runtime pm support")

Missing Cc Stable.
> Signed-off-by: Daniel Carter <yass27106@gmail.com>

Other than that, lgtm

Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini
> ---
>  drivers/soundwire/qcom.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 6e0c5fb10ef..62a44f64dd8 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -778,7 +778,9 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>  	u32 i;
>  	int devnum;
>  	int ret = IRQ_HANDLED;
> -	clk_prepare_enable(ctrl->hclk);
> +
> +	if (clk_prepare_enable(ctrl->hclk))
> +		return IRQ_NONE;
>  
>  	ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
>  		       &intr_sts);
> @@ -1675,7 +1677,11 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  		goto err_init;
>  	}
>  
> -	clk_prepare_enable(ctrl->hclk);
> +	ret = clk_prepare_enable(ctrl->hclk);
> +	if (ret) {
> +		dev_err(dev, "unable to enable iface clock\n");
> +		goto err_init;
> +	}
>  
>  	ctrl->dev = dev;
>  	dev_set_drvdata(&pdev->dev, ctrl);
> @@ -1800,7 +1806,9 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
>  			disable_irq_nosync(ctrl->wake_irq);
>  	}
>  
> -	clk_prepare_enable(ctrl->hclk);
> +	ret = clk_prepare_enable(ctrl->hclk);
> +	if (ret)
> +		return ret;
>  
>  	if (ctrl->clock_stop_not_supported) {
>  		reinit_completion(&ctrl->enumeration);

