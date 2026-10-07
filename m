Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5094DD3AA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397433; cv=none; b=G2zE/QbbS5ae62d7Sy/tVbt2VfQks8DXGk7E5sgghf8z9jJ1/wFjqXFrB49wc3O9AoXybEn+LZDQtgKloSYWohNnK1eWfgrYm1k8zEmW86tXlDyBpwzwhK1mP9QxxK59jti6Tp7GgWvpct5pSzvXlPcxpt2KmRzsIxW09hXERWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397433; c=relaxed/simple;
	bh=7p1E68LhKBh6yTqP7m6fWj1obK2raK41V5zAFLXEVsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SIflbXbPJvwRBAg0sMWI65tU//yELYv+BP8uq3e0v1lNx6n+VOhP1TPSNllmaOGWFZHSeVO3aMJE0IVeTA4xG6zdWBXmpse3ZeEJpq57kjzthNRHKHNrcyK71HQUUx+PUtSnOSIwrhrMfpCypw7khDxg3bMUp53q9PkFCHAv5eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGEjaKTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X2LG2uLG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGEjaKTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X2LG2uLG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697IArgr1621560
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 18:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=; b=FGEjaKTKiTMns4jc
	ySHa7nijzGtMIzNX1sSiTKtCsnriO7FROVZ3uqr95gbCSh1QEPWJTvdAjroTzvh7
	vYcPaHGJ6Ni6uDM+Kqv0tkvF65ayaBCtGgwTBk9gPPqQX5HrxgEOAVQtIbMNMQMj
	Oo91QuNpT9Dnx1I0182YQ5mOj09u9Wpx0oK/t9LZzDnhtmCbBYnMGadTb8IYul7F
	3Svyd2viG0xYmLfiWAq2CXnj9ztrwoWhjfIZQs/5z909hqEd8GRhoJ5FtXQHXuTv
	PhFEUlCW70YfasD5eZZt+1tvYLBw8YdQm5heGuDGBChfTtry9UsR+gRyN4xv+I4o
	b0OzSQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5suhrf8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 18:23:51 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8246ed0039aso5496813a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791397431; x=1792002231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=;
        b=X2LG2uLGJEq6wAeCZyI5/qEsfM95FZMEBuumFBqCOES/qOHLzTIyAn8IUhAxnKvLYd
         C5tB89gQxqkRcQ4j6JrEHBq/46Hvx40vv8FshM0UL16GXGCaeQs+qbknBtJu8uV2rYr5
         VTjNIMnef1jmnMYpSLzJi+A3HHnoBRMccu2dYFwdme+ZT7Tro2h2lDKRox8Yor/i1qnG
         pWSZVRz13CzzTu9hOnGdz1ZAkQ01uWcKddvD0JJeRBMn1+giF203b+2tTthdvGJ2bSIW
         dm81Nc15+uIxSv9v+fBey/HB0hSpAm9tXZkxOq+EnLI/kyWbCk6WR1hDYPBfg1dQqkQh
         YxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397431; x=1792002231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=;
        b=vRYj/un6LlFQrg+wKCvNZhUHVPQoijvq6qTwMRXcphQDjUzIeGIsdEMoXU/xNb8dU8
         qsZH7n49ioeh6W/z4VFrdy+20oBt2yz4uygMJckfoZQoI3lrcvO388y5zZ0ODdwPOxFr
         u21eM8vgrpq7M88mpHu1aUpZY0B2wv/1FICZstJoSIpLDEyIgfc54xZlGXSqatwbzMt6
         ohcE+3nF7ppzdbJqeHH9/Tyq38D1Ls2Efm1K3/cDC/bOCnoMbcEa37vQ3jTboXZaabf7
         rxKAHop47e6JroEto+tkyAn+q+LPd0q0tj+QWcVg9izEiy25KUJJcPMhqzZXZc9+6zMn
         vD/w==
X-Forwarded-Encrypted: i=1; AKwUvByUpxtkmNcl48Li1zPZnIUMiJl8wzdOP2M7B6bZ6/gvPwylb6ABm9WemW4tFj4ZKZq9a0V0oLmSBeIYJqo=@vger.kernel.org
X-Gm-Message-State: AFuF++mowOkw4LPB2Ld2TGXV58uPRCfWYw980nRnYmPxSRrSKg6G7Axj
	Dyt2OXT3p412jLDbqKhLZ7ZesY7i1bSkxQOvZrYIvydnWxnuI9Ndgjc8d9wA8XMV5YxDT5sFepD
	qYTpNmlzZylN6RWo1IlLjb6cUo5Hmj9H7q0nWQ6KIO9dCxpNC+diRi696Rm/ks4spjyYcqnPQkT
	A=
X-Gm-Gg: AYBFou07COYzeLUwydEZ7ONk7ik+T+E6/aCMo7rDBlNiG4qaL7t337N5tFLi79IEHE8
	OfHaFbJJLEOwYoWziTEAWUjsaEdGclJ3TxWEj07ogG3ChxjfvgfAP+A1yp4zxX20DNYOIJcCUs9
	mYd6JRuLRwys20dwi5pTZcEr5kaWoUqUz5J79fMcz5yuQWBOTt4hY9HlO7APkO5pVayU0hZ+1JE
	7XYfqvKHVt1e7SFZaFlclHIOc42dmpTIymVjcPO+SU3QqYYf9+fxU0+UM/yw8BiZHsOxZv/JgRs
	K+afIXkuDnF362ij0RG4sCncOddNyLLvJGKyV0W5GuyL5UfQVt+s5lheKHcZcBUvEa5T/69QcoO
	jAaH5RI2uouhjPB+O3gib+Tcp+QlZ
X-Received: by 2002:a05:6820:4dce:b0:6cd:3ffc:e339 with SMTP id 006d021491bc7-6e7a825135bmr2885010eaf.87.1791397430608;
        Wed, 07 Oct 2026 11:23:50 -0700 (PDT)
X-Received: by 2002:a05:693c:894f:20b0:351:69e8:d419 with SMTP id 5a478bee46e88-35169e8d438mr1958297eec.22.1791397050030;
        Wed, 07 Oct 2026 11:17:30 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351735e316fsm980093eec.11.2026.10.07.11.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 11:17:29 -0700 (PDT)
Message-ID: <126c4b96-f50a-4ea3-8df3-a7118870a5a0@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 23:47:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] arm64: dts: apple: t8103-j274: Add
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
 <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AQknhMyihwyD7uWfY7k95n-HCsaQkgKC
X-Proofpoint-ORIG-GUID: AQknhMyihwyD7uWfY7k95n-HCsaQkgKC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3MyBTYWx0ZWRfXxxUk8M4ov4Tw
 0uMfb3PHFaicJfnGnI+njTnOySVusrZiLJ6SYLRr7oa2nmeO058x8X4bamYCnFMvElUeOGnszgm
 cFzzuxLRdOO/jiLRlXh9+z51H/70VSs=
X-Authority-Analysis: v=2.4 cv=e9qT2qp/ c=1 sm=1 tr=0 ts=6ac68e37 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZXy6yrx+fn+bJIgs5eQ1WQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=UKJZ3Gop6vG71Bmy1WEA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3MyBTYWx0ZWRfX7JON6AzTg4/P
 4zkCSXYB2pjsCLL1z4L9AXgyFhUV6mi0bXEwibAnpzJ3o6D8AtqqbBWXm3Bqan+NPbJN2ntGJOz
 ggfJgibRs9wTcLqjYDpakkmsJLcJqised7mOV3SkOpX24e5bxCK3jK6amReNYs62GUmu8KohufP
 W2pgSUfptPSb5n/gau/W5rOlqu5oSgWmnm5dCNth2xWSJZmMGbTsHdhs2DQVUVtnwsnTDmdJ7nX
 kzFvUWB+cSrWVepf+mBVkDJOxGCSQa/a8Zo2CGjFBw/SkJMCyEdOLk7Jcxd15Ya4IbvPmGXggNW
 +ZVm/4MoTstgXVD23slfh1uMjcTlfwdedw3ZA5J0xh61D3fAL/QsZJ4FbCBv7XHNM+FSo3k/LOf
 2yrQm1Vs3/YcGn/LjaO9IgdMnDGMoGr3OhQNg/zN6eAQnXI94MQxb135XjuXX/bEKZpa4VwXU8X
 TAVXBokOoNW/RYNjKdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070073



On 10/4/2026 11:33 AM, James Calligeros wrote:
> The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
> and Cirrus CS42L42. Add these nodes and advertise them to the machine
> driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t8103-j274.dts | 67 +++++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
> index 1212852251e0..6121e3a89a0f 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j274.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
> @@ -75,4 +75,71 @@ &i2c2 {
>   	status = "okay";
>   };
>   
> +/* Audio codecs */
> +&i2c1 {
> +	status = "okay";
> +
> +	speaker: codec@31 {
> +		compatible = "ti,tas5770l";
> +		reg = <0x31>;

The binding documents "ti,tas5770l" in 
'Documentation/devicetree/bindings/sound/ti,tas2770.yaml', but I only 
see 'ti,tas2770' in the OF match table in 'sound/soc/codecs/tas2770.c'.

Is the expectation that this node should bind through the TAS2770 
driver? If so, should this either use a generic fallback compatible, for 
example:

compatible = "ti,tas5770l", "ti,tas2770";

or add `ti,tas5770l` to the driver's OF match table?


> +		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		ti,imon-slot-no = <0>;
