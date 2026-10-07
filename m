Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035BA3FF1D0
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397988; cv=none; b=MOnw9VTIZHPbQq2CI5utXPgfza+gUU/AHk1DwSkRlWvVcj9Rqqv6hDDzpcWtTEHvEDLZU6vb9FKG+szW89p+vM6EEcRRK5w/9GOnIE5Ac4dYT7ba1tFRNUAe9K2XqyuxrhEIZUDaR4h44JXzU8rWD87KgXlChCt1VtHtcR6YZNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397988; c=relaxed/simple;
	bh=YTepzjzsnB8Kw9QCwfC60ii8oGo8TitvlHvZ5Y0BnXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FlLr8qJm+xFubJu8FhJnlU0X1/mqh+jR5wex+791Rz4hP2FkWvk/Xkp5OlpBShW2XcrJ9YZhHFVwtGAPxZb+Pr2gr5I/pArtkfQspSL4wN6DnxeRFYDPjsnUIvJWRPZtBh24FA4i1zrShcVopt8IueBkoOcYayayQmRcqV/e/Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=giuqBmir; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YCj+oiSN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="giuqBmir";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YCj+oiSN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697IB96M3239285
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 18:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xcOII1yaaxjPXRPocOIPIwuUNH/5UAtstICER0t6wfI=; b=giuqBmir98/FhzyO
	dF+rAIA5MY4G3hqnIvHGreVP2UFZtipw8mb61SjqW8gP1lmzOCSY47CEgIT5uWKv
	zVe/xNuv+/SV5+pXhPMrDqPyDFgi5t+de6lLLO1jLy/DCAKJU+WoWDcnk9iKRcPs
	I9KonsWQh8sZEvbeOnxNbCG/VfbgJktbnI2ptL7JS2d7fIH7vvoFwbk5XqhcSgNq
	MhsAldLT6LkShz4FH85UQsut4p2NNynrySR1UCa/yw9c8RBOrtbLlBoHxkv51x0l
	CIaXfxA/FR/ThnN92VpijtJYR5mnMhqUaitsaWgteHtIKv8v3709N9YkIwPkYumU
	mpXYYA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8twa7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 18:33:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso8474555eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791397985; x=1792002785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xcOII1yaaxjPXRPocOIPIwuUNH/5UAtstICER0t6wfI=;
        b=YCj+oiSN+a9RzI+Hxbmc2obIOPzp/zvnp4ZCp+QMnykepUi8p/+4vsU/k7vGElhCyH
         HA7Ii6pjg3tanyOK5vUfONClPcoqAqFYkprHC1dAI4qVlwFJA21ybS9IXDDXyafT21PY
         s6tQXkxolxarbsX8Hn0dR94XuB+yLuGNFiHZDl8OO0tuKAKgeFeoPDZQyZc2p04cqZ/x
         jbTH8Qoz2Rq91y9ImjRXg5v4vg18GRbqDT446WZ+SBZRF1iMyKS4PQ9a3jggYk/T8GLB
         h6i3ARAswTDTre7VzPHH//glhM1Z3XWKW4B+kiCUhG5tgZtpli2bKCQddtjVvPQOICoR
         5ckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397985; x=1792002785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcOII1yaaxjPXRPocOIPIwuUNH/5UAtstICER0t6wfI=;
        b=aeRPDItKkQy0MrmYKAqwo5D6ziHxkrr6Jz7AA61xXsnh+/9Vbsxcuopcd+ITmmTxIr
         4wM+vmXBrVn2s8H1ssWzJhE8V9+Kt89KnvczSTlKnR7a4VmLNnncyTcsHyAYDa5lxTJF
         9ZwVWxkmCNwFTdsUKv4fSgBiEXKyj2Znm6+Ps1Ub3i0bZBay/WtFV7nzWjUYfYyeO1kQ
         2JDKhR0D02Ej5G0hfBpXJCK9pt65fNJ2y1AK6PGj0iCU9Q8yHV21Dt/aL8hotw6HPxOe
         H4tq41t9d9AQ2vy2LT+v/AvPcOpQTDgtHabiHv95BVZL6hP2Jk5mIlaSqXnrp+lVKtdL
         IRJQ==
X-Forwarded-Encrypted: i=1; AKwUvBym2ss29NajcJxYBtlxZjixWGZ0JAAHL6l4ChBeXCoOcUEMCkrY1GW9xPf8REgI9GY/fqrMiQQ5cLhNw34=@vger.kernel.org
X-Gm-Message-State: AFuF++lj19HrtNzgchPAG2c97nDY8Q5oS1RwQbRiSvITCbrj+ibcsmmN
	JNGGcAepJ2lo/3yyLalirPBGmA98HAOprEkmjVv7fJky9deXVhFrZnnNpABPmij/iolo354Cbg9
	lebW2rRVrad0hYZa6wsEZ7C4krQbYZSPNh3uIYwSUlouUXo13vhAqwe3c66ssTaLj0ZA=
X-Gm-Gg: AYBFou3V1MDc1mq0stqdrGV052iHO2JkO9TD+ySbkluCqPCdYrd4OxCwpQqa5TLZkEp
	I1aEwXvx8NE0DQRfrHroPCNPH1yZ9uAlnsCeUHrrfnpdv7VEOLuH09xljyyeKraPlmp16jvvzzA
	Ml+vE+T07ETPk0bCE2MPJZls5QtLmyYEI1SJHcUtYTeG+e0Th81pFAnZ7n2TiIs2AyHh2PrJRDO
	7yMC8PupIDKNKo9a2hsmQT41PANzQjMpfEITMxpMOW+fFPGeO3i4Khg5qi39DoRXMxfQHo22vTM
	EXVHaTXbnPRyVCBqOB6TjnXcEvUG6IZlDYZ1XFEmqIjZE563yGEw1dzQ+1Yr4M+8V/QLRk553EQ
	g3mVoS6mGLZ6bq7KkxvGRUSMR0Zzd
X-Received: by 2002:a05:7300:ac94:b0:343:4a95:f120 with SMTP id 5a478bee46e88-3515dddaea8mr3997325eec.25.1791397984894;
        Wed, 07 Oct 2026 11:33:04 -0700 (PDT)
X-Received: by 2002:a05:7300:ac94:b0:343:4a95:f120 with SMTP id 5a478bee46e88-3515dddaea8mr3997250eec.25.1791397983841;
        Wed, 07 Oct 2026 11:33:03 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af90521sm16456444eec.19.2026.10.07.11.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 11:33:03 -0700 (PDT)
Message-ID: <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 00:02:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
To: James Calligeros <jcalligeros99@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, ajay.nandam@oss.qualcomm.com
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3MyBTYWx0ZWRfXzLSu3f4xoZjv
 SS21FSlaUlb9Y4xTsk8ALYRVfpYbVyYmxVTuDXaBcOOPFcEj29UcgAtGfEBXMOkyeimh1B9wiY4
 9aEnTsZ6kPxTtU6oTE3A33taER+l/iw=
X-Proofpoint-ORIG-GUID: xcY-iIRouTOyahelUn0zC32rH7oQuyae
X-Proofpoint-GUID: xcY-iIRouTOyahelUn0zC32rH7oQuyae
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3MyBTYWx0ZWRfX7petmeASRaAK
 06xbOQdhKGatITvEXRSn4MjX9l/ANFovWFuHRTz2RDOL+VJz10wfX8NcUBhjv8EjrWyWtqJkQwf
 JO93+2JVPdTBDwyPv89AiSO9azpgcgqMnmqUm7tQiCjpCon4ocFVVonlxQZJWSCuWb3p8CNKrGt
 SDYVwgB8BH1KeAHefpj47DN+4aWjp8seP4E9d4mTw1jAVFl3/D2SeR752aeKaAG+yyUa9Zuve6a
 kK8zVRkT2G/ppLoeZkWrQQ9sGZ/Bbao7rCmBS4CyPd8OnCR1KM0bDRluO83Wph5ADBhlcS4S0Py
 m3Q+O/y0Bi43krv4BZWQpLF86lbp0axJac3iCiD7n7EquMNF/Lj/y/yHChnHm9OQhHi+ccDsSUL
 tQ1ouAd0xQMdmcShN7zjynfmRLbR5Lw7izc+AjFnRZGURNx30UVtDvULe5uuhNBb3zNBPNqxIUh
 j9v80Gu9CoqUAY7gHMQ==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac69061 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZXy6yrx+fn+bJIgs5eQ1WQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=KKRqKo6ZSQ7ryDd2x_cA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070073



On 10/4/2026 11:33 AM, James Calligeros wrote:
> The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
> and Cirrus CS42L42. Add these nodes and advertise them to the machine
> driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t8103-j313.dts | 82 +++++++++++++++++++++++++
>   1 file changed, 82 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
> index f8b2b1637b9d..cdda63ca8b34 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j313.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
> @@ -55,4 +55,86 @@ &typec1 {
>   	label = "USB-C Left-front";
>   };
>   
> +/* Audio codecs */
> +&i2c1 {
> +	status = "okay";
> +
> +	speaker_left: codec@31 {
> +		compatible = "ti,tas5770l";
> +		reg = <0x31>;
> +		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Left";
> +		ti,imon-slot-no = <0>;
> +		ti,vmon-slot-no = <2>;
> +	};
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +
> +	speaker_right: codec@34 {
> +		compatible = "ti,tas5770l";
> +		reg = <0x34>;
> +		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;

Both speaker codec nodes reference the same shutdown GPIO. Is that
intentional for this board?

The TAS2770 driver requests 'shutdown-gpios' per codec instance, and 
GPIO requests are exclusive by default. So I would expect only one codec 
instance to own this line, while the other appears to fall back to the 
register-only path after the GPIO request fails.

If GPIO181 is a shared physical shutdown line for both amps, how is the
power/reset ordering expected to work across probe, suspend, and resume 
when only one of the two codec driver instances controls that line?

Thanks
Ajay Kumar Nandam

> +		sound-name-prefix = "Right";
> +		ti,imon-slot-no = <4>;
> +		ti,vmon-slot-no = <6>;
> +	};
> +
> +	jack_codec: codec@48 {
> +		compatible = "cirrus,cs42l83";
> +		reg = <0x48>;
> +		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Jack";
> +		cirrus,ts-inv = <1>;
> +	};
> +};
> +
> +/ {
> +	sound: sound {
> +		compatible = "apple,j313-macaudio";
> +		model = "MacBook Air J313";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dai-link@0 {
> +			reg = <0>;
> +
> +			dai-tdm-idle-mode-0 = "zero";
> +			dai-tdm-idle-mode-1 = "zero";
> +
> +			link-name = "Speakers";
> +
> +			codec {
> +				sound-dai = <&speaker_left>, <&speaker_right>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&mca 0>, <&mca 1>;
> +			};
> +		};
> +
> +		dai-link@1 {
> +			reg = <1>;
> +
> +			link-name = "Headphone Jack";
> +
> +			codec {
> +				sound-dai = <&jack_codec>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&mca 2>;
> +			};
> +		};
> +	};
> +};
> +
>   #include "hwmon-laptop.dtsi"
> 

