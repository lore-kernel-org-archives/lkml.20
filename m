Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF595481AAD
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451777; cv=none; b=o6MttzYoZh2SKoMiKReJmD9gEtXsQk2l1daKzz0ObbsFOQu9WiEcGTrXZDBEv+DuO6XwXvwAnlTJOzo+VdktmJJEfQyJy0tg1atdgBrN4OYFiYOJLIx2VAJEDQt7RZNCe2Dktajclxhw6tYRs7kECvrzAPYMAGJG9gKLWzaV3D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451777; c=relaxed/simple;
	bh=1o0m0qm/3wEfMh2Dfbs0Oz1kXCVOudS0M1hkMoN9am4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxk+MgISVs4YDzvWmUNMvfv9BCDvLK6AB8STX9XiiGZzO8Q2TkDYUNH1wDZqnm6xRaRF7cNmVtzJX8NbzUuks21tiTZRqJsd0ALcGkUi/AiKa+3KABC3uBxW0eb53gx6zrylcfjgBbNF103LBJdYV1sfVcXkbdeh+hrqcU3YN/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffMQqqlr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6E/Ydsz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffMQqqlr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6E/Ydsz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KOIR3308089
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 09:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=; b=ffMQqqlrngRc9MV9
	3LljFSL01DDjGEACnX59qfF16x6zKB+5G67wXlhJ4wUv4zv8rwm2FOzyOtnbG2Bv
	YiC1BE1yWYDxH8tALMOCUoES5FGood7IUrEQkeNZeznK0x3Xto0q9/bydUAPSyUe
	ZB15fNOF58GzTRGUTkqpNMobZk0TenZxxmkAlnUtnhmsTfx6txntq00BGf6W5/WJ
	CsQ/lEOJOkZgU4BCNSkNEtjO1zEauOqElYaKLf0K9r1xsVavJJO2poM+sauiLGp5
	75/kHFny8Ap6JQT1DTgCNgSXVwqR3mvgd+m2fjvqpoA5NbGVhMYVKmTLoZJfDeXc
	QwHcCg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg9rqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:29:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so4055605a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791451773; x=1792056573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=;
        b=D6E/Ydszbc/omoYuQaM/V2cgYzHVfgHF+M9V36SJ5ZNroE71zyhdNAEmG/p5B5vXK0
         X+EJ53FNJv2YtMzzmNYa5EClEx2qJTGtZ2DCgmcMuw/CqDb9FFK24ZW0nJSTGST4wLhY
         nAiLDAR8JBI2dzdpZ3054TAGkJKJ6tPPZFsBmGH68xqDl611uYXuZgm+JjKuYH9J2Zpy
         dt4/hO356eUoBN3fzslacmmv0OGNsVpGz0qsTDR9F2ZxaQY6lbs4jQMUkQo229/S8607
         lkLibEK0N+obC9+7W8jcluzb4R8ZHHFcgW2RfKM1q9KzaFSOQKgASoziauKtLOM8z0J+
         G+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791451773; x=1792056573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=;
        b=qutFeBXKa3cucRfQST9dmR3BVZCS3PZlO5pNmPEMfFAJV/9AMxf5kU5WxNd+axvF20
         g0YKRE/2oA+jwN6GdKUXfDF/IOUHGgWBG6cI93p060EjzGfdjepovbxwxPOVN8OwHBnL
         KKviTbv5vnUvtdNm9jPvuv5ttXpRU5IMnXsamb6fc/xncWjce5DB6Nhq6NF51QB7wGpx
         Zh0JBX5byzi0q1en4ueHuHs6tMXX5l71CS9y+PWdc1yLjqSfzOT6NObNklaEHzImHaq/
         omZzS2ZOr73eqUv7iCro6S2P5ONbA50lMBliKKrOTz+qAZucyxr857VbrJOroxvrnrL+
         UmoA==
X-Forwarded-Encrypted: i=1; AKwUvBxplxcD1H/Hr9yv5Hn1R9FP1q/0BI/8RqhcVIYnHatJBrQKKzz/a3Lv9Gv0upONOZgP3Vxezut2FcIg5hI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL487e3io3L8p+P42w/6bDCl+7ewij8RyYtIqkzg1oM6xJNOiBx
	LdISdhW5pr7rty/+ghw6yeYnk0ZPdPQAUGsMuF+a+lWBr1wfBvvbexuG67vMgNfZogFhtOhl6ER
	1oZQH2DU4xvo3mzq2FAX0MUACqAx00SZq/aSsi5AzkrC02FRTwozA/H0mu/mGcF0+6So=
X-Gm-Gg: AYBFou3tLen2GBrGJ37Uec1Oe7OGchP2RJnDOzXLf5YlY6RLPXIL5+Ai33K5YZD99mJ
	HABBx0VNxrQmrTH4QhiPUoA1RC+3mwFJyOJBBVFuaEIC+Fm2YTlEYu2CpZLUL0AJQMAJPm2z57e
	Pa6gB14VFeoMzIVbmS5ANbDMjrYBQTOnNY2neWschYhAqVp3q47Cx53KZw4KRvYzn5p2bgWylPm
	vrDFZMI2qcYHveuR4qnSIx8ELUTuPUs39pjxFztfg7fIsEu0T3ffgjCDEAKi2F9u2xgfy7jt0sI
	oH0d9ZaFsohvNGbFdrasDyBCsgWo842Sgv9d86jT4H2ceYDKuyzGH2PS20BY4O4LKvESo/WW5ag
	czco7pQUgepGVd/GnX87FYsGxUDw=
X-Received: by 2002:a17:90b:4a41:b0:3ab:c80:9362 with SMTP id 98e67ed59e1d1-3ab0c809861mr582614a91.35.1791451773132;
        Thu, 08 Oct 2026 02:29:33 -0700 (PDT)
X-Received: by 2002:a17:90b:4a41:b0:3ab:c80:9362 with SMTP id 98e67ed59e1d1-3ab0c809861mr582594a91.35.1791451772573;
        Thu, 08 Oct 2026 02:29:32 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a79babsm3415638a91.6.2026.10.08.02.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 02:29:32 -0700 (PDT)
Message-ID: <dd8a9faa-9d6b-4846-b38b-711df8c2d6a8@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:59:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/21] arm64: dts: apple: t602x-j47x: Add
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
 <20261004-macaudio-v2-21-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-21-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JbNvPQMUTgNv6chdXhoMnQSarSyorPnC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX9ydU7e9/UwBS
 3Omicz4kwstziGI9STan3ugjtmHBpSXbvjiwXkw+tS3DAzbf1IDRESe87yXOEE2Ig1E68mOnOBD
 i95ozbzlj5iLq//cAxQmpZzULBfPcKQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX1TDBc1HrTsEo
 75/DQd8EtGWas9u+CmFNJrhZCLcTw/i6M1P3d52CX0yNQlKHsCiKzsGL5aw+jVit5abh5yheZZ8
 OV2yHkupYEKLMcVLG5sts0NcL8knAQrpYZBvh34h8XNmuwqjS9T7SSKEppgBW/1wLMZOZdeje9/
 MSsn2iWYiqWm943vn43H2PKzew0BrX6DeiVjVxJ+6vyQ4Fy9DtFQNNhYSBZLTHuoxBAaCTlhQto
 7ygvtiES9fwdvEUqmahxJos9RhkV6AN30QZwOC0RUmidukdwL0oyWLfMTyIP4DFlismAGmwQSxd
 G/HFMuh3B4Th+tibZYkE8Uzexhl7akDkWohcrgSvepU8Ga5Hlf3bJhAlUAhJ7JSXkiJ+URwBM86
 ec+1Qcp/KAPwc/1cWqUQcHIm3QY3SXQca9yceSX/AkfXGPWS+5oNtY5rCF4QuSUtGd7BpNh80Qb
 ofV3XRJS0dp6qZ2q0gg==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac7627d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=oNl7twi5fxIAqsTzne0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: JbNvPQMUTgNv6chdXhoMnQSarSyorPnC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080037



On 10/4/2026 11:33 AM, James Calligeros wrote:
> The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
> variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
> advertise them to the machine driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   .../arm64/boot/dts/apple/t6020-j474s.dts |  5 +++++
>   .../arm64/boot/dts/apple/t6021-j475c.dts |  5 +++++
>   .../arm64/boot/dts/apple/t6022-j475d.dts |  5 +++++
>   .../boot/dts/apple/t602x-j474-j475.dtsi  | 10 ++++++++++
>   4 files changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
> index e3c2635d84fa..7b4c4ef471be 100644
> --- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
> +++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
> @@ -46,4 +46,9 @@ &pcie0 {
>   			<0x300 &pcie0_dart_3 1 1>;
>   };
>   
> +&sound {
> +	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
> +	model = "Mac mini J473";

Should this be "Mac mini J474"? The board file is t6020-j474s.dts and 
the root node identifies this machine as the M2 Pro Mac mini / J474s.

The fallback compatible to apple,j473-macaudio looks fine, but the sound
card model string should probably describe the actual machine rather 
than the fallback model.

Thanks
Ajay Kumar Nandam

> +};
> +
>   #include "hwmon-mini.dtsi"
> diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
> index 9fe17f1f7f59..f8f776f9eb1e 100644
> --- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
> +++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
> @@ -36,4 +36,9 @@ &pcie0_dart_1 {
>   	status = "okay";
>   };
>   
> +&sound {
> +	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
> +	model = "Mac Studio J475";
> +};
> +
>   #include "hwmon-fan-dual.dtsi"
> diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
> index 32938a3bf96a..153899f1569b 100644
> --- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
> +++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
> @@ -73,3 +73,8 @@ &bluetooth0 {
>   	compatible = "pci14e4,5f72";
>   	brcm,board-type = "apple,canary";
>   };
> +
> +&sound {
> +	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
> +	model = "Mac Studio J475";
> +};
> diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> index 926bb4ab77af..7f1faefcf9bb 100644
> --- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> +++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> @@ -36,3 +36,13 @@ &hpm2 {
>   &hpm3 {
>   	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
>   };
> +
> +&speaker {
> +	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
> +	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&jack_codec {
> +	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
> +	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
> +};
> 

