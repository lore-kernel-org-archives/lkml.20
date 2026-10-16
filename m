Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4176A4B1CEB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158784; cv=none; b=JXL2B29Iv+MIc4V7WD/EH9/UVGav69pU+W1Vtz+u5QLDmUi8f+GJV/ptyYFzr+ZrCjYJNnVYIOY7zQYe4tmD1Xv9z16VKdgxBd9v2foEIp4RTf0OtQ+9qi3DZq2jSaJanvuXHVIb8QeQxlDqe7wMxjak1+9UxAPpvNhGkOQC7KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158784; c=relaxed/simple;
	bh=U0EjRnJ7O91eyrTP0SL3rD7Ce0W12U3x1008UEL9d0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPLvJA3mC/LgWwWYo/2PW6PHPswQGX9DmfJsqbInlrrivLPlC0cfIUO5PgipgnWeIN/s0RP6XpVrLaPuAa74iwuxWtOOMM9nrcpbRr4w2hgMpYGK7gSNfD/1LrIDgU0xiXkwZWBm84LMyYipd416em1ik/EQz2/w4AXnEt3pKOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nZF3QtJ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUNVXnXj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nZF3QtJ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUNVXnXj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GDENqj2803135
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t69VHD7sGoDlppOxgJRzOZSxfsDyrUH5v3Tk7eTBBuo=; b=nZF3QtJ5AIFa8E6U
	1/BWz9fTbA3CJOUJ5D8F4A4IvfeAXV7HpZ2uKV/EKvjdbjwvEj4jqwIYUVb7DowA
	Fi9/GBO0GUxkHrFGRnb9lBWr4wN59/LEjQAeUZ1wXzSA/DxDlly6DrhB65skyq36
	wC6QpoRbXfqcuSi+PUXuIDGI7L5OZxHoRJQdfWfmZ2aUDo2x6xu/OWwo9q49G1nr
	0VUrCGpxVdB6sv6vrGyEyNLABc1lNfLNKKwQ00c7ehdqkXLg73/prOk2geuOu516
	pbaY6xPmxUc7I8jZZJSYh0OFSGfAKmlZy2pufIpbANGdKwg+WCepepNTUlBlwYXQ
	bs/pJg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbmmq04v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:53:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso11411076eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792158781; x=1792763581; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t69VHD7sGoDlppOxgJRzOZSxfsDyrUH5v3Tk7eTBBuo=;
        b=IUNVXnXjZuvmQ0WOPICBLk3yhb6HF37diyRlPBPLueSh+iAjcmBGZVqX3KbncU54N0
         bQXQ9la8Wydh85YmWjtx1AnGvL24OIMQG/KsElixI/W1FzNQjGQ81PYUwyMd9VJcAV/b
         MXJYSLC1CQHhBmUUw4FT65WEud+E4YMBI8XT2FqukVfj0hO6LOn3s7yepKLzVjD77Z74
         QuvvpmTxcFsZncoYSjW5wfLRniJQy+8peVjlFkAWH+cmDyXLgF3i+xvcGVy0PF9Ouh8i
         75GeYB1rHcIKRsxnLwKYPSyn1X+fXtqLJ54+XoYXrZ8hX7X66Xx4jMPomFomPKAt4FIr
         9SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158781; x=1792763581;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t69VHD7sGoDlppOxgJRzOZSxfsDyrUH5v3Tk7eTBBuo=;
        b=kxxeZd2JdDrZNApssUeTJeN99nLsaLhxK5CyyY0DqDQiJkYaZ9Sd8l9hfnr/LIGO6m
         reLo3pnM7J/nDj04KJKCTH7YkJOvvESAQqNa5H2bAQWM9gJpkIyoDNR5xqvx+Iizk75k
         4PMgWsF3QJ3IMkpqyaVsH2/rJDE6aib7ELg8Phz/sLs5qLahNLNX37hF5QEeFFr3xls4
         yuhF65MdLA1RoFhYiQVlsS6iHOVKHU3tpgSkYE+Rd+brt+9mLIFp8HoAVLfUEfRRLFhV
         CiWebi9k+pKtuHBqVsj2ldmaFjG+Mx4RjHuxJ6VaVSTXaMGapYBo9PSVFlbAfw1/4nEw
         lPFA==
X-Forwarded-Encrypted: i=1; AKwUvBw+BdcfcmXCaSGqnSMCBfFvPrj/KMh0W6frNMP0NpqXjAR1GnZry6D50P38rEmRDORJj1r7DAIxjNz4KnE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOI//dIZ4fzH0jAakrnC91NOw0/3LHbKAZ1K5i9Lx3D0mQZHLj
	hlYCvy2dyMKEkv/W7DX+yEeOfua+gx5gkzf51aWXQdF2nlsinNuwO/HCN4fhcgxser77hTFQhF1
	FRqsbClPggnmZ/miH81vAzFokApryvOQY+iY1NpE4NNr8EJxd5hiWJTtpCxKTy2QpHAw=
X-Gm-Gg: AYBFou3Mnphkw66MNbgknqs7+23GnrMbl274bXzgV3ngZ4UeMjhNL8MEQ4VyqUZLMQc
	xrqO8bbDo+CqwWpsqAPujEIbGhgXQLVC3IiW5ufiGZh7GSB5lBs6WCknoM5nla2U/34hMYIE839
	hqglYhCjiHx8G/pEji1barrALswooHYeyeHOUXCoLrXc+q7h7b/qYjHR7vabD/fqII528yV3cEA
	ZLrACWaI7opNfO5xAN+tXokakez+jI6NJbQ0gesNovV5nS19FAynLRrZMOqfCo/YlgfWXwWxhfY
	J3psvuligmYJVGgedgdsmX0DrDSbHmdcNLo8uNp+57C0zSBzqP9wlnv51157uducfOJk1aUOkfq
	oZ6tT4LDtsLLojPnBSABsjbwLfQ1vW9Jjjo8iIAVe0w==
X-Received: by 2002:a05:7301:540b:b0:355:fdc0:a811 with SMTP id 5a478bee46e88-355fdd012f1mr27879691eec.37.1792158780652;
        Fri, 16 Oct 2026 06:53:00 -0700 (PDT)
X-Received: by 2002:a05:7301:540b:b0:355:fdc0:a811 with SMTP id 5a478bee46e88-355fdd012f1mr27879632eec.37.1792158779825;
        Fri, 16 Oct 2026 06:52:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b63e1sm8146987eec.8.2026.10.16.06.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:52:59 -0700 (PDT)
Date: Fri, 16 Oct 2026 21:52:52 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/7] ASoC: codec: pcm1681: Add optional SCK clock and
 runtime PM support
Message-ID: <atIsNLNBT11XWtRV@QCOM-aGQu4IUr3Y>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-2-0c1897f21ccf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-2-0c1897f21ccf@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NSBTYWx0ZWRfX6CR8pCn/s1DM
 Tjz8ZMCc3F/AO9BpOKZEHCSk5UvDJ0yNuMWKVqtdlHF+lbrx80cHS7Aq8CBupo2X2e7GpPZO0pY
 2io+JEtEG8wVGKXgFXIJ0ex48WJe8aA=
X-Authority-Analysis: v=2.4 cv=P9uvFSAu c=1 sm=1 tr=0 ts=6ad22c3d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hIk10_Rze-2l0Qr3NckA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NSBTYWx0ZWRfX3yCLgT2ONE86
 15vMG/6mxgqKka3Xk0UIMg/T523qwYUs2vQzTme4iEKYEmDkz2keiHTcDuS1uPYEa0JKVzq9jvZ
 YQxq6Hnr3s0Nrh+l3rMvAiim/5+NZA+v8vAFTIVbfhv09Jm2UcRfMowAV4BpPIBOZfLhot/8Ble
 OmnPRrvbHveuzyBeoY63UDWAt0dryeRTNwt5wN5ZkL0SGAdT/XSTJb/IXp/0qUN8rAUI/LR7FNv
 dgws3bpFdw6g25i+fSMWNWkwPt27/kFTni9NN//P0V2ft1SrxOVtjtVcrcJm4cpIJstphYQ2Urc
 s7AjFfDYlrcD2zeQuAUay2ZlGYyOSej6+fXJ/fc4quz0YpPatVBY5/YobpV+afCrVl/HtxUD8c4
 ExZcaTMETiC4uPEuHnzTCi5SD/eAl2Vc8I7LoKFO/ao4bjNTm1nA4S6Vo0x2URlwNebRQSpdIZc
 HsLcdoVujv3VPPANLVQ==
X-Proofpoint-GUID: rLFPFBH9zyQP9SPtAiEwIH4jgdrieEa9
X-Proofpoint-ORIG-GUID: rLFPFBH9zyQP9SPtAiEwIH4jgdrieEa9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160055

On Fri, Oct 09, 2026 at 06:42:48PM +0530, Mohammad Rafi Shaik wrote:
> The PCM1681 requires its SCK system clock to be running before register
> access. On platforms where SCK is provided by a gateable clock, register
> access may fail when the clock is disabled.
>  
> Add support for an optional "sck" clock and enable it before accessing the
> device. After enabling SCK, wait for the required 65536 system clock cycles
> to allow the device to complete its internal reset sequence.
>  
> Use runtime PM to manage SCK instead of keeping it enabled for the lifetime
> of the device. Disable the clock during runtime suspend and restore it on
> runtime resume. Use autosuspend to avoid unnecessary clock toggling between
> closely spaced accesses.
>  
> Since the device register state may be lost when SCK is disabled, enable
> the regmap cache. Switch regmap to cache-only mode and mark the cache
> dirty on runtime suspend, then synchronize the cached register state after
> SCK is restored on runtime resume. Mark the zero-detect status register
> volatile since it is updated by hardware.
>  
> Drop idle_bias_on so that the component can reach SND_SOC_BIAS_OFF and
> runtime suspend can gate SCK.
> 
> Assisted-by: LLM
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

[...]

> @@ -304,34 +335,128 @@ MODULE_DEVICE_TABLE(i2c, pcm1681_i2c_id);
>  
>  static int pcm1681_i2c_probe(struct i2c_client *client)
>  {
> +	struct device *dev = &client->dev;
>  	int ret;
>  	struct pcm1681_private *priv;
>  
> -	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
>  
> +	priv->sck = devm_clk_get_optional(dev, "sck");
> +	if (IS_ERR(priv->sck))
> +		return dev_err_probe(dev, PTR_ERR(priv->sck),
> +				     "Failed to get sck\n");

Holding sck from i2c probe for the lifetime of the device breaks audio
after an ADSP restart on Nord.

There sck is LPASS_CLK_ID_MCLK_1 from q6prmcc, a clock controller that
lives under the ADSP GPR service. Stopping the ADSP removes q6prm and
unregisters its clocks; starting it again registers new ones. pcm1681
is not unbound in between: fw_devlink can't link it to q6prmcc, since
that node has no device until the DSP is up, so the supplier link goes
to the remoteproc device, which stays bound across the restart.

pcm1681 is left with a handle to the orphaned clk, and the first runtime
resume after the restart fails:

  pcm1681 0-004c: Failed to enable sck: -6

Reproduce with:

  echo stop > /sys/class/remoteproc/remoteproc1/state
  echo start > /sys/class/remoteproc/remoteproc1/state
  speaker-test -D plughw:0,0 -t sine -l 1

Even with a fresh handle the DAC stays silent, because the
assigned-clock-rates (12.288 MHz) are applied by the i2c core only once,
before probe, and the re-registered provider comes back at its default
19.2 MHz.

The sound card, on the other hand, is torn down and re-created on an
ADSP restart. So what works for me is to move the clock handling into
the component .probe/.remove callbacks: clk_get_optional(), then
of_clk_set_defaults() to re-apply the assigned rate, enable, settle,
regcache_sync() and enable runtime PM in .probe; and the reverse plus
clk_put() in .remove. The i2c probe then only creates the regmap, in
cache-only mode until sck is running, and registers the component.

Shawn
