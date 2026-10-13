Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351DD390CB7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886230; cv=none; b=i04aPbc4JzMNnymy9iAGoEUQWTFL6/Tv3bA51OHGG2p3LoRfAxebGFgLT9Q7NBbethhvqp4/Au66kr1gqFAV7T+KLzMqdxsVsPflTRfJjlDpLuuchSSOR/D2jUf4LwouLivxRZZGBW6cksHMhmSxDMNCiqTslD0nYnEO4GR5YlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886230; c=relaxed/simple;
	bh=+PMY/81rPpy21yXKZXoy0/UH4FJLtbQW777OaKV8tHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JykYjt9y6WxNjdam4yQQzINW8tfM/Es1f+60XvaXmSuR3vrxi5NQN2YgOQxZf6bVU2s9gOuSUEyQBkd+EKimtj6UVrW+sUAStz0aPadfejD0v2EnkX4i8NciFS6MvCJNwAHv+ctqX9eWzNQTlYDr+87MUbCbNk1hlib/cF9fvFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2tYKyr8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=biLqTe2i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2tYKyr8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="biLqTe2i"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8NZ0P3907376
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JaWEQZWW26qUB0UpQWigzCRt6cE6lA4BoKS/zHeTD8o=; b=f2tYKyr8upCq+Mcc
	2UPh3aLmC+nVXmBww/2aIzDlz5igVDv7ahV1ouVe2dOJfzr0iDMTih/N/apdPHOw
	T/Klz6WE8c9gOERHjh1Dx0qqdquyyR4AhHvhsY/q+hOvKW9P4kgcepMbKI6uo6x/
	YpnXLiwOoaZmg/MGuVNNJUhJQ/Fv9DM/ZJzshTvEP5IMyF32V+kyWgLS8V853jJ2
	Eup1HI/4yBaH5DbmSTDRvFHlBEWc2ioRLc9qiFHmMoHuwXS0oNyN5zHDn6SpReOB
	AeLxDS4WC2aLnxGhGHLqo3qHoMh1xzOrYTLxpQ9yfd5u886XQ7q7dTtPHLfXPtS5
	m/e64Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqtybj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:10:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5350173dc7aso6142091cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886227; x=1792491027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaWEQZWW26qUB0UpQWigzCRt6cE6lA4BoKS/zHeTD8o=;
        b=biLqTe2ikpLEyLd6DJr32gw3hSB3wIzMVIwEN5CAro4XqQ6HURnH0DYsJ9u7jVp0tZ
         QJUz6aaYk4g1vjio2qBm7zwMSgjYyMP1yUQ+MXF3aNiOd1o2cZXhqYY97VXt8arnYPlV
         egmwgHXV7KHpR8effcXWHClEZjBhGdVUmr8IjdKqkA3HPzvnOwntIh9J+FJFYVwW15IA
         QKpUX/JzBc8rh0QwdpZzLl+LysH9kMPBKqgO1enYC5hLapU+0/iGE5v3oKERkGZsg0a1
         /VU5OtdMYXdrNGa44QdvSJbeCFxBU/OXOV1Z5TLqzJylds28UdC5os9xJu6yO0+Vr4sn
         DlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886227; x=1792491027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JaWEQZWW26qUB0UpQWigzCRt6cE6lA4BoKS/zHeTD8o=;
        b=v2ycyLnPqgZUvooZax7Hwv2p4UVibRVhWfRiKpikr/HzPHGBmm3YieVhK9OBS9Gp6X
         tYoPxZyuWj9QXq6vsCT9/DuSRMj6VL9UBAgHXO330kHCEtnBRz48XTQIqpOgVrgn+CjY
         +CYPbMVBJzNOxheOFtFyPYbhfG+2IxCnlmdAHujGoXqt28/oXBpOTcKK+0DNpH5qUlTi
         KiM6/B+xJDuUZek/lZVIb4nWRr5mh9pLIaTu3wH+7laBSfNO9VkSskUfBXzPMWUu3GjQ
         oalRPr88EUO7N6aKddz/D+VGTbSud43KzYltiP254e3+QZP1R8wlVajuUdS6yO9dKOC9
         Wb8Q==
X-Forwarded-Encrypted: i=1; AKwUvBygj+cI61F0cJdKK0+Nlt11x8iUgy8/1pL7o8ulXYXtP1B5N0Ogo1/cqggz6qiemVyz23zJ9ZXdD+q8ZVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6bFZBwaKR7TdZrww2qzbaHbE4dMclbGSsStwkOM5IasN8yywV
	m53MFr5S1bA5XYeCsNcMxON9ecFlAmv+6xub2OHWnvfktTWuUIBp11Aoqp9M1wYEbhECjUcFb6H
	ry5V7LRjrP0HFe/fnGQq8n1UC8pjGoPe3Bi+eCUwrlsEX1BwNSCCtNgXnrZypjuk6XUU=
X-Gm-Gg: AYBFou1OoBWGJ9GLdDI6736ARxZTEAiQr+6xBkBANRHBLIvc7PI3yj6YhBNUwkeAnNt
	5EeqNk6jziHafQzOao62slSkwtTnU6cAM8P2TeKNKwgZopk1fgAwMUOgy2bMbb0KZw3aA2t8KD9
	wtPZu0EB3FV26gO1tqnn1K+MkkPVZ50CBcBgAdbc7ReLQ7PiA0wKCiJfIoLoS+5FLO3u0jNKt2/
	+IylRulbU7suvRgQyQzHUHFvK+pA1XAoNS874Nu/9hhMBn3gbvJkoxba4AIzfBdMB0W3HIORdFr
	wTyw/an1jEMpDlqYP54tfDSjrlISKtvvJCxHEmQHDwt9PHQH/O5dJlzMeFMNaOBC7hbcvPpYZ8M
	M166CrF6rU9PrKFhZayjbwA==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr2138497785a.6.1791886227068;
        Tue, 13 Oct 2026 03:10:27 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr2138494285a.6.1791886226526;
        Tue, 13 Oct 2026 03:10:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3350fcf309sm353463166b.39.2026.10.13.03.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:10:25 -0700 (PDT)
Message-ID: <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:10:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
To: Luca Weiss <luca.weiss@fairphone.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jasper Korten <jja2000@gmail.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Luca Weiss <luca@lucaweiss.eu>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfXyaWR2Ybdp646
 gX1YAqxY8ZWSznNiqzNLoUXTy/A+DhMyQZHfrjlgXHhZrMwHQyoPhG0PXBj2zRfnhQ1xnOCjpq8
 KhsJOXN7Sf9uClzmYAsXjZhAgWqLfTng45xz+ekZ8NrlkZaZRe2bW6c9uFol3GIw1zMrV30g0wD
 Mot12wSpW3N953lv/nHWffilzW2EFiUcBvQf0KchsKJzNf4OfVqmwygE1zU5jxr5k8fXPyFTP/d
 C/m0D2cMWLwcU3b9YRKoSbIFPXepS8olUM71TBVNwq2xsXzWKzi5fRkY+OH1c/VFMUSA+rnoLGA
 UOZghzgcEPkxUyh5Q9faBEUiEtbpWryk1pcsGwlI5zfV7CTxQ88F50/mH1u0AHTZFYiIJMRU5Aq
 3K4XRU5Z01jFo9qTxShBjtHp+pQubkwigWb44mtG9b4tuKSae0oO90VbO3al4J9nH1q7BWo0gkq
 ROzjCY/f8eBaZTmjLBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfXxnxv5pgDa8FY
 +f+cS/vcW782yZVjjBBYoVP0+KCNBMjOakiGzbuJS4M9u+n4SyvPHIbr+mE7C+xF26Wtfv6H+EC
 3WV7IK2UEagsbvjGca+D/RvjRXjXi9Y=
X-Proofpoint-ORIG-GUID: Mn48ksUvS-WPk1APi_y0z0ILjpGgSzgN
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace0393 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=6H0WHjuAAAAA:8 a=RY9Homj74iP04qnvyqkA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=y4cfut4LVr_MrANMpYTh:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: Mn48ksUvS-WPk1APi_y0z0ILjpGgSzgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

On 10/12/26 8:11 PM, Luca Weiss wrote:
> From: Jasper Korten <jja2000@gmail.com>

[...]

> Signed-off-by: Jasper Korten <jja2000@gmail.com>
> Co-developed-by: Federico Amedeo Izzo <federico@izzo.pro>
> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
> Co-developed-by: Luca Weiss <luca@lucaweiss.eu>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Good to see the Lucas are in agreement ;)

[...]

> +&pm8350c_gpios {
> +	pmic_lcd_bl_en: pmic-lcd-bl-en-state {
> +		pins = "gpio7";
> +		function = "normal";
> +		bias-disable;
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +		output-low;
> +		power-source = <0>;
> +	};
> +
> +	pmic_lcd_bl_pwm: pmic-lcd-bl-pwm-state {
> +		pins = "gpio8";
> +		function = "func1";
> +		bias-disable;
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +		output-low;
> +		power-source = <0>;
> +	};

Drop the output-low, the consumers already take care of the state

[...]

> +&uart7 {
> +	/delete-property/interrupts;

Let's add a space after the '/'

> +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> +
> +	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;

And let's wrap this line

[...]

> +&usb_1 {
> +	dr_mode = "host";

Does OTG not "just work"?

I'm assuming there's no pmic-glink on this device?

Konrad
