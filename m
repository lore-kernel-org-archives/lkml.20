Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739570;
	b=jCxjYJW5mAfaNrFb40YHwk7sMz0Icwx9h+jPGCblk7TZs533E0rp9x2jViNZmW9XrUkx
	 zOJACWGXwLifjuozqSy9pibM4PBIF27G4Cv7Llkque+joDVwk37aXbxWPuwgPBwfBS8Ia
	 qnFRxykvbx+xaGN1lSPmqlqf8fHb/WmyuH8WVjliPYBcAD/qeYK0pIRltHAKzCVsghl5/
	 GQaooECAmredaxLTj0SdYD5D5S79zIFMtf+TzNeP4ZHc2CcUfBpd9nt8Vo5oaw1iZ9F0i
	 m8nvDqB7ce3hUlN9bwLAO9q2apYVpdO0tdgbZB/hM40e1XN+3LpWXXb9OmEhQmnMZmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PW1CLbvqlr5fSy5oyi5HAW2alm1vh7L9g9nCvQTuD8M=;
	b=BlRPg4SaT2nWKtrnwjTP8czfsjkaxM5Rkh2Q0wQceUDmGNz0T7auVlZTco2iENuTQOir
	 CxnUlJid1DFko0Cjn6Ttt3/yW8xxPdYVSk1Q/3sM4lw+Ess6AOPitUwdJMcpQlg4r4kB1
	 KGcvvdrb+qHMGv5vTscV0MZkwospQTJDocoLYUDC2Mo/QuikxBuGDK8vQN50PFPcatz8x
	 DdZiGCeBJ76V43hmIqv1dmu795N6qCK0hD8m5efrzRf+2QHYWBkDoUaeoJqo0lKcxrlad
	 AYKGExtFajtPK/puFsWHt+UmSnWNwuhxrBYlBDwSsSyuKgDQqR7rQc7Mr8V9H0SfiVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P2iEYOho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FW8TVYri;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7032B606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7032B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P2iEYOho;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FW8TVYri
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7w9Bf2205567
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PW1CLbvqlr5fSy5oyi5HAW2alm1vh7L9g9nCvQTuD8M=; b=P2iEYOhoA2tNINKg
	8aTX61BSPTfyw+BiPDwHp0nP625gvjraAsP5qviHMpoWdIHYKZXV639cIqyZuZO5
	ZK3dllqGC1MGzubpk2iysopC1rAISiYobRF+GgU2PbzFVW6NCC9U4K0IshcFvazo
	ms1LYgSQzTsmImLt/SJBlRnYlKPwAhtz5RGoHkdzoj9aTcyLZ0hHHNrOqLqSMcT2
	5eph79ffTwrKqXGSAs4TIcmShiY5F6qK8zEFVu/NYBmgAK1zPR9kJvhgq8pTvvAl
	uNYzPUaY55h37+edRzbQxvc/bQB5EA1vge7RK0FQs+/fRYkyode2X1LwywKGXZsq
	xnoyow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk22sw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:46:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94967c6d4f4so80496885a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794739568; x=1795344368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PW1CLbvqlr5fSy5oyi5HAW2alm1vh7L9g9nCvQTuD8M=;
        b=FW8TVYriYjlFLpPaUDlgP0MCrqUqvtfkf8Z+LuAlbvYhZWowOeWETHdjFgwCMnfUyd
         WBkQkKAwh+zBxhYD+PaFS18hkWEaAHeRU/Z1TFV16g64uDRczXhmW1GXTYnYzCGCx5N4
         L4hDNdSgZBbaJ8CDVSEsm6kJBSXPZdmZTvpLB3lOR/Le7JS05AnkqcMXt48SHzChUUJt
         rQ5zEJs9JBa7t3r7akU3N/QEit758kr7kD/SoV1bXMngNI42nI2e7Wz3LbLXbrewfBcT
         PD1MdoaCF+FQKw1PfhhbSo6cc6ygGSYhtpmYSnKdsz2qU1Bwl8w1wA5z9LUVkFNi0yw5
         XI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739568; x=1795344368;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PW1CLbvqlr5fSy5oyi5HAW2alm1vh7L9g9nCvQTuD8M=;
        b=2AavwuwUr3xIqqmx4RpuE1VBEgLTwf8CpopaF8nWagDergR9E/U4JwEdb8SPFUV06s
         NKX9Ut3gZm3hlkW/2SsxGPyQzaDbE65rfltBuT7cEFcELEIBcmUMhq4EGBLr5YobQyqS
         PwzEKUqP5IBY1Ek/KrFZkDLRFnvGTKUqfxAajUjT/9WFl2lfewLjj5MRr3r3LYyvhES4
         WgvK2HSrMnpkJbTziQc6bfBrCRrIfPYukwSrKczKN7Au3GYWhHOe6c3jFD9ck9J5+5La
         M/Xxb55Z2cT8Yp0/bf9GxOCLQeyHLf+lxBE3pmFtxDSbEvSnLgqdm04gWidiH+mHRX/O
         L0DA==
X-Forwarded-Encrypted: i=1; AL+hErFGt5KydZbjvIHx5e0z96UrA+xYe1yYe33um22Wor7VK1SEY0k1tA+W5bBpVAF0FoMvU2jYwJIIZYL36Nc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WdbI7cx4VOhUeMRusbvpXh14K1bcMovaq+FIb0P1KuxfRTRMH
	bsiX1GMIkWmoS2P/FRnCW7atHI1+JTR83q+i4FVQCFM69uFgRAFUAZYcS0sjKr02N8WvZ9YhB+M
	KuAQIlOZ4e78iHtLdmSwLak9pnRa8vbsLqckn4ITpmER4yUIkA9Lg8nXb8S6lO4TQiF8=
X-Gm-Gg: AYBFou0GLFsIikd2/1Cdp0xzytz2dUauLT56N+kVPwIr1vGhGAY9X1nt5HerV3Frjnf
	hcwi/PZfHpTQZtYTQnMZj2h56DMxZcwExiIbi7ax7vGztDfbPY+txJN77/6Z8fRkPvtpEUlaX4p
	z86g9bTolYSyqzKfRtL1MokCnIjYTh+HFssw1tpfeo7n5ZJoP0hnrlkdJ6QPX5NK073EYzF70Ni
	gfg0UGw16stnlpmL6cHgJLsatJeVW7+s/RFTfblMydwVmuyjSQ5LlNwahADkYq8TIccEE0Zgrql
	Fr2SJRKp3uEtHOp0ngjq38RkVjfpUynj3UHY7Y9PJ5HzN4GA/ofya4iQf1IV7N/G0yx8dJTbCwh
	nNgz3ZRCuy2ujYidX6CkjnD6dMMeMBQHRbaSSDlJIYUldkC1wcBsaTp0tDv9+/BUuNywNmpzfXV
	o5TfE/XUY12nQEZpj12Q==
X-Received: by 2002:a05:620a:1a09:b0:948:e2fb:c00a with SMTP id af79cd13be357-9494bb892fbmr1229212485a.28.1794739567461;
        Sun, 15 Nov 2026 02:46:07 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:948:e2fb:c00a with SMTP id af79cd13be357-9494bb892fbmr1229210985a.28.1794739566963;
        Sun, 15 Nov 2026 02:46:06 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1b5asm3069071a12.4.2026.11.15.02.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:46:05 -0800 (PST)
Message-ID: <f172af7b-f5a1-4375-a62f-6e389b1a2508@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:46:02 +0000
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
Subject: Re: [PATCH] ASoC: qcom: audioreach: apply volume changes to a running
 graph
To: marcht@proton.me, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111-q6apm-vol-live-v1-1-be85eef649c1@proton.me>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111-q6apm-vol-live-v1-1-be85eef649c1@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: J6qS7_7iUTGmN1hRyjLkMq43-0-5qnp7
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6af98d70 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=fBJCkzpva8F84h5TpLsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0MiBTYWx0ZWRfX0TjfHw3au86l
 AU0XUDe5+XbNFqHxQ8wgAMfBqfX1X/34XfPd6k/t2yjvRpwgPlEg8hbcSIksn2Ko9iPob5Bb8Yp
 9XbPF6D7dmlLMAB6XOO/wsUK6Fd90tQQlnQ6dZAT3sGv2Kbw37WVlf2C8MS/5Se/dmgnPaVyj+J
 PbkHFI6ZI8Sx3tVQuKw3TmMO8FmprnxxL7b0R4XKxGv9rQTgLsq6LhLkLP7LLgk6WwNBF4y+rlA
 PF63F2NwmKgmjogItA+AWKtTSHxE/DIdtsA5Jwj62hbJQTlS5tdvvmmgMtJzu4mfuxSortlvEx7
 QsBhV17flJiCynTYsBmj4DYZBkWkpSUisZ8Ipf8Hv7R3jwmSaVJdAHJdIwALVsIEWGMay8BCiTC
 C1+5MRD/DpvH+SadGN8s3OXX1sNVGUXbv78PljLzhTHwaX+G+CFPZ/W3PA+hS7un+WSsONrXfo6
 t+Hh2T8OuoZrkM/0g/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0MiBTYWx0ZWRfX9kbjGtsviUll
 T1Xh5Kr/rJNfAf3INE27CElJHjnZ4YHXE7/eFa1lYZ1N2KcYLaJIzqYu98pCtLu7SqIE5X/o85i
 Oeu09fn8kLpX/SeOl4L/l18Ny5Of6n4=
X-Proofpoint-GUID: J6qS7_7iUTGmN1hRyjLkMq43-0-5qnp7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150042

On 11/11/26 1:49 PM, Marc Herrero via B4 Relay wrote:
> From: Marc Herrero <marcht@proton.me>
> 
> audioreach_put_vol_ctrl_audio_mixer() only stores the new gain in the
> module. The gain reaches the DSP from audioreach_pga_event() on
> SND_SOC_DAPM_POST_PMU, that is when a stream starts, so changing the
> "<stream> Playback Volume" control while playing has no effect until the
> next stream.
> 
> On QCS6490 (Radxa Dragon Q6A) shairport-sync uses this control as its
> hardware volume: the volume set when an AirPlay session starts is
> applied, but every later change from the phone is ignored.
> 
> Send the gain to the DSP right away when the widget is powered, and
> report no change when the value is the same.
> 
> Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marc Herrero <marcht@proton.me>
> ---
> Found on the Radxa Dragon Q6A together with the two fixes in
> "[PATCH 0/2] ASoC: qcom: audioreach: fix S24_LE playback and route mixer
> disconnects", sent earlier today. This one is independent of them.
> 
> Tested on 7.2.9: with the patch, moving the AirPlay volume while
> playing changes the output immediately; without it nothing changes
> until the next stream. Builds on asoc/for-next.
> ---
>  sound/soc/qcom/qdsp6/topology.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
> index 612d8f03e6e9..5b3378fd29fc 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -1323,8 +1323,19 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
>  {
>  	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_to_widget(kcontrol);
>  	struct audioreach_module *mod = dw->dobj.private;
> +	long gain = ucontrol->value.integer.value[0];
>  
> -	mod->gain = ucontrol->value.integer.value[0];

We should make sure that the graph is started before applying this, if
not you would get dsp errors.

--srini
> +	if (mod->gain == gain)
> +		return 0;
> +
> +	mod->gain = gain;
> +
> +	/* The PGA event only applies the gain when the widget powers up */
> +	if (dw->power) {
> +		struct snd_soc_component *c = snd_soc_dapm_to_component(dw->dapm);
> +
> +		audioreach_gain_set_vol_ctrl(dev_get_drvdata(c->dev), mod, gain);
> +	}
>  
>  	return 1;
>  }
> 
> ---
> base-commit: cde5523c75f1320a55ac1d55a717ccbb566557f0
> change-id: 20261111-q6apm-vol-live-d6bb1dbec7c9
> 
> Best regards,

