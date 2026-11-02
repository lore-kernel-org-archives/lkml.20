Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625675;
	b=WJQUoBecdVcTsjqihNEx9yYkm2+v2PUjry6UyqJmyBrTnNfXVQ8xXpcVWIHH5wTWJ86y
	 3FUyXNg6ovJXR8sq7Xy7xKtSMXv4uqiq23Ya9wI8hVuKYf6AVzMG+urycrOOSe8V+NDML
	 6HHkOpM3GccbYFoT+8SSzYnqbwfhL24+UhuuvfQbT5XZeCwJ1hcMnBzRi9KEgkdFLeyVu
	 mGWkVpsM2uaFUwLuQ+lUIiCcI7eKjMVrkCl03SSm6IJaeqmfukvGR0wOGd6nsyIWbmGoc
	 eH/92dvxh+Hru7vQGeSb2aG7z/St/wedXcv87M0NUL+po6X3li6VIPddhMBtWRquSPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625675;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ntm9sON3wZbXgSR0FsNnRT0Ebj0apKXl+cIgJKKSV2Q=;
	b=YmPS2j5gjLPbcW415SFKQPE8qE58RljBF37u5WjNc6S3RrlvJph4nWv26extqYjbmRk8
	 O+My6jkjptT0FuAgqhDLss9FfQY5elN8W61E5Okx+10uVtrl15IdmQK6umofpPml0FZVX
	 82lwrvNdWQxjebtC7nkPClwhQgyENxXjwpZjajYP3mGJP5mLhuGYe8V9IsTY95XUhyyCE
	 0IUs0gV+LFO/nlGofWINYF5pcqrUhuMAZYjHCaD+XSRhrz6F0Tdi3IVn97j68UJCT1c/8
	 qru2IblDVwKNVmnwueEV4nH4nLD0nmX8bXS/lyb9GZNnGpGnLOTgCSVhKWGGU4ZSjeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0XwmSAP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bug1BLEg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7065E606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7065E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0XwmSAP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bug1BLEg
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAOD8756986
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ntm9sON3wZbXgSR0FsNnRT0Ebj0apKXl+cIgJKKSV2Q=; b=J0XwmSAPxt7213lS
	zEjTdYY5EPeftuAPPqXcK3rvVsgyQ2iTrxyRfuVR7SGdMEtFnbtzF+1ecPPncPG4
	US3m9DcXbJuXpvAh7qdR/iA610ZE+6I4dxIQPsLyKx74XjQc5qtjOytUE+gqanYM
	6mUdh3rHInYIeC1IC1MpSyJAySaTtJa2MxMTdLye1M5AeHyYMzb0eVIaXiFe51r0
	cc3GLNZQ5mknVtpSpKg3SfH3jKmA8nKtaLhM+tFxCQ5jqrSC1SeJQAqp20W10HN1
	uncmecfYxKC/O+6ZQFroEsORpUy+ZDOiBUv2h7/jLg17E4y1HF1uT3JnoBDgOpfu
	bkkvgg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1srvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:21:14 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c97957d83bso160298e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625674; x=1794230474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntm9sON3wZbXgSR0FsNnRT0Ebj0apKXl+cIgJKKSV2Q=;
        b=bug1BLEg7UIaNz7p6DbeNhk9pqG5H1h85WBCE4Exf3O7LujG9n7dZKNI/up2tHXjlh
         C0QQisdCiPnq8bCn0gqyzF1vblxtGpgUp1fksgHt0T5DXqqBqQMxQuCSDPYpXy2shjnz
         Zii/HXGDqMudtWsFVvxiN+KSVhZVYdFHNDeDExB4sjJo5pHVGUI6N9AAO/qkgRgHALMS
         hcs2pilhQ24W/bHBdTfUb2TNAGtHU3ThfRbzeYdYnfvaz4/DHJph/zJ5FW6pfNzqiDXW
         OnshkDMjL7Oikp5BauZeisRxxUIEyQxIBCfubOdZlofJk5NjVF8WZG+t/z0uBQlpQYe4
         vTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625674; x=1794230474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntm9sON3wZbXgSR0FsNnRT0Ebj0apKXl+cIgJKKSV2Q=;
        b=EpEP0M1wtKGCTEwzplEoeytVdpKXfqtU5db+1RzbnOf2M7OEmpsULOCI0f+cFIzSa0
         WKyYEYRWrW+VqFs0a8ZyP6k7ewtwSMyl4WMJTqP+92PxbZBZjKCOEIgF3MvFvnEIBJ5N
         d8C6x/NIqzMAiFNiYlLEVptr2IqA+B9N9ySmDT5I8JCLyTykp8MXIBJmDiOFhzwMu3E8
         DN2w1TaMuk3VoM9+D6YrYzjLWnpVhpkHJfDtQ8FM9I8q5bPkVk6LF8K5ta9lkQqKzEYA
         SzaouExP+9EcvV+rQSbiJ6cUK933AO5tCqSarY8ZLsAIqVaDyVIxFkYHV5gVIF1Gg8Ka
         LUFg==
X-Forwarded-Encrypted: i=1; AKwUvByehudEXR/wsRLZOnRhMWreZG6FGFl8skjs2ivyymSH/YHNW6ru9EhWkn8Y1Klnp+NTm5UrJrFyGB5bcdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ty96kShZ/eWECNhnRMOZDxSPCZmyRYYqmOAYu94lD5G2KacAC
	aYkBzUDQrqLn2yLrnxq984FCz6eA49uaYptXk5tVMzX0B3SXYuJCigaspXwCNKN84kX3G8BAL2Y
	fLhHIZXYpRQsxQoFWrt2cKkKeDOAPw2x72vR2Q3di/SjDhR1jTxwYu4XieZxru39PIXs=
X-Gm-Gg: AYBFou1g+N2gIs9SHsaKS9eIatWIqom7hdNd6zVhC7PTzxzzkxBDhrcKrjAlVeLMCHb
	ahlVTtAf53TRNFXVU1T7rIj1z4r9qL2ei1KEUpPYtOpqVMFEh/LZsy4OFFZVp96u2tkbgXZDl2+
	xMLg/sxbdrZasM/XbZty3FHTO1I3HrR3CjrDP6FlPb7vVqQTkq2dLNlmgTh4ShduyOaZVtBDzkJ
	VQmCdkrdML5uCtr7NaOeFP3zbaE/doeBhk9gq3ZIbSHy4sLAsxRvHgwlGXFB87lTfLheSMbAd+G
	xplDQdqZa3/lIHXj5DMseNM013v64ud/A2cJZYWNnJ5V3OdcYIErVk6ECMzhJLy2CwXEOueacb2
	vwzs8s+hV/87BJ8d8cV5v95TeWAM1NzLUe7jwvZZhHEQxpVwg9jp0FSw6+9SrdrKY6gAi20o=
X-Received: by 2002:a05:6102:a145:b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7d07255e419mr2961285137.2.1793625673575;
        Mon, 02 Nov 2026 05:21:13 -0800 (PST)
X-Received: by 2002:a05:6102:a145:b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7d07255e419mr2961256137.2.1793625673072;
        Mon, 02 Nov 2026 05:21:13 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcbb0sm3395230a12.19.2026.11.02.05.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:21:11 -0800 (PST)
Message-ID: <20c50258-a5cc-433c-836e-92ed8ec1ce7d@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:21:08 +0100
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
Subject: Re: [PATCH RFC v2 4/5] arm64: dts: qcom: nord-ride-embedded: Add
 sound support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021073633.2163128-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qpnmPrsYNNq0FEFEx6BLuD-La0EUjHVc
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae88e4a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Us665vxpbSFhsO2t51IA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXwIc44/w+qJi4
 rOpRWMRH1siJzLglXMZl1aTx13ZA8jPoCkS/YadSWVfKZbJ0mSzE++tqvZK+Eo+Oh+vjM6r0o02
 gk4nxEy7kTEo9suu3stQ8IccqIQbAKkhqCsdokzKeTzIuxgvWe7ZtRCX0RMjwq86Sea7fR173zh
 YySrvnrs9GIeJhckETwWzlCDm7sKUwyKBJcVjSQl2eW8TvZdPxdumiTt9F5lSdYhDw1z6vNn4Pu
 YxI/zNQpX9BmxYqA4EaHsyjh+0ORxBnzo+NB/gqWPipu/j2fPeCnCbLD4TeyEa50KPULhc9lx3z
 OvbsZgaJ9dS6iQcXtI51Sa7fKv+4hPSwlRcR3/dcyibb7OytvsoudyP8Jj1eq3MS1drrPUmiaZG
 x2l6ItA0hq8s4rBhHIKXP/UVezA0E+4xvfG9gNn9hSTgY+cEspKtoLz9FTv1zuEN6z7DQu09It7
 izLYIfsANI+c1dF9n6g==
X-Proofpoint-GUID: qpnmPrsYNNq0FEFEx6BLuD-La0EUjHVc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXxJDP9XXx46XN
 ziaYk9fbB6qbghuXF6dzQR/0e+x/eDAtuaQ9rG8+nDVrMEUGF/V+zD1hLdysLfu25Qf55azaQCm
 1n2T2c7auuSKX86wZ8jNV7RYATf9l0Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053

On 10/21/26 9:36 AM, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Enable audio on the nord-ride-embedded board. Add a soundcard node using
> the qcom,nord-sndcard compatible.
> 
> Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
> clock supplied via MCLK0. The DAC control lines come off a TCA6408 I/O
> expander on the same bus.
> 
> Describe DAC_ENABLE as the enable of two regulator-fixed supplies
> (3.3V and 5V load switches) feeding the PCM1681, and the three MAX9892
> click-and-pop suppressors as one simple-audio-amplifier on
> CLICK_POP_MUTE_N, routed after VOUT1..6, so DAPM controls the mute.

[...]

> +	expander0: gpio@20 {
> +		compatible = "ti,tca6408";
> +		reg = <0x20>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupts-extended = <&pmau0102_l_gpios 6 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&pmau0102_l_gpios 5 GPIO_ACTIVE_LOW>;
> +		vcc-supply =<&vreg_per_3p3>;

nit, missing space after assignment

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
