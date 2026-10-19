Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792448622;
	b=toZ8O7fuMNoHd0aGKI7OrMH6HYY+fu0cxJhmgnRNE9Zk/2bB48BlM6UDQQwPcYfd/r7M
	 a4yzeX4/vm2ENyPLxI91MLUsy5PmBEya6Z0ku0yDtjJvvkdjlJcb+8pARhWC7645HXZyP
	 W1fOdKE3tQg0Q081DO4QuUnBoPhvI7YwE1dH1Kv7Ojpoun7ZSu6Gl+ITB/z4rUT09/v1H
	 7Gp9F/4YsI7MZMSKeAqGWw6LhBCqNyUtft0Hpt8renUZ5L7QOmcsfTqo3I4vHYs6UubaC
	 RV1tzrzfY02xOa8rNHAzKVbLjOGFOpzkzskYnAntRT54HstgOMqiAPfT5+T9jlq2V1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448622;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=USQtrcdyhKNaGhzibqLvfNZ+j6mKmvxo61o+NFYHEyQ=;
	b=13yvbT4vhCimmRg0cjfv2ivwX7V70v7leJ3ioklZHYJgif6CuF8Iwk5VbSyomzjLHE/m
	 QBkIhYgB8n8svrWYflrNVG02StgVEUlOTfcc2qluXWhA+YjUBoT2WATK1KWK6WVJ83iYh
	 RxoM7Wns7n5+5vvS/i3jgPDPjkPMhapAYkSZ5gyi72/pX+yw6Gd/g8wgLwdPf0BwpITLD
	 l9RFMrG3uH/u2c2yNQBwhzNWXewXdRnZv/raRoHzplLwvIiZJAPQqa/SjnhnFQpnOefk7
	 gO0aTPkWwCfgCtynSo3UPYNGIrM9LUYehnpFLNEwJAqWw5MTp2G49fwVUT3//dLB7AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MOyG8FNL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G3Ch11jV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD84606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCD84606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MOyG8FNL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G3Ch11jV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLZPk03963960
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=USQtrcdyhKNaGhzibqLvfNZ+
	j6mKmvxo61o+NFYHEyQ=; b=MOyG8FNLdkS0Bbku7VH4ETh2pCTkCzyCkkWzZB8l
	0FCqOw1AqQOaSFp50KSRa5tW4dSwmgVbYPN0rMsqBDSnqYC1/3yYUFzFdmwzY5Se
	BItn7HP7rNqabDAl+PZz2HXugJGtHwne6GxBine9emJQ1wKhTW/eO+9hsyuouCHS
	+yFYL9ScyQw6wGX+9ognJ1Gy0DO2+ePmY3N5X3aQzGUgbH8fqJk3td7KxYMWW3Qh
	WI7XA5ojY1EIHMpzRzWWjgV41SeJgNgswMKPtRGJQHgILDS5aiAYpdHx2l45nJns
	ik1ygQbqKV5xTeoQoKkGyGyTN64570Iuzgx9IOUmuHEzXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3xbgu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:23:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so758968285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792448620; x=1793053420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=USQtrcdyhKNaGhzibqLvfNZ+j6mKmvxo61o+NFYHEyQ=;
        b=G3Ch11jVMYTumPM2Je6+cRZCSheOmVMh6AqdOMwUdbwxlZCYxLTwoT+ZEKHuZvAXvC
         OOquaUMAhpLpZ+0JytryzB+Q4e+nNKpvVTQQDm47/6IaIbM9y+4b0GIB+QInnqFC95Iq
         l5iZ14bTock+BFMHlUy8jbBMS3AmpgopsicOS6LA99N97hP+W1BKR9K63GZTloq6wCsb
         k19vRRG7Yy4e+lrFd1Au82JbAvzYQYTwrr4qqx61XJfaXbPIpxanLeqsmt7wf/iaLcb2
         wFrKBbtq8LnPD6rCUoWH/xNpNvDPvnW0oCT2DR+jpiIM4ZgNMFRXgmG2yA//9ncbVUkg
         R+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792448620; x=1793053420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=USQtrcdyhKNaGhzibqLvfNZ+j6mKmvxo61o+NFYHEyQ=;
        b=RR2e8PZttAZWJ09ezrwaSIrF75YDkzxtqIUECdfqwjHd/wE6RJF3MZANZyC1mLDwyA
         hAzDdyKv4xQgWmpNSC5tEfI+W/0qulrnJhFG5VjxWw6k6SKrMTVcrAqbL8bTwZ9+18nP
         0cZHu2jCOnp1sHaxnGdp5WDkiMvf/yo/piB+2iV6nO7DHQg8SLfQixCJuXZUl1+iGrpT
         xsmv6gg3D70/eDQS67ANNOsY5ienZZffc9Q7pwZYwvKqXAf5RWOcsfiesSqS+j0NUcRy
         GDinD6eGmxH5toEmUyLyf0iSo4a/Tt9akv1TSIISFWJYNm8hFAIBD/DNEcuy/zj9vJql
         dZeg==
X-Forwarded-Encrypted: i=1; AKwUvBwfoirWgQqrIxfsemONURtUdiJJxNKAkEtKEATeXEYScacWvWGdOghrlUYmAgn7tRxtUJ/pfopFMpiNW7c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOklmzPDKd9EfkryQj2hiZBFyWr5SzKgzFyxiiwmDuXf681fG2
	tszw1xHwxUlMz6CIs0ORrsewO0PZlFloMBztOK2mP1oCuDnbz78g+lpBW6DDV0ApiY3WY+9kuYB
	yPmM8GJQLPOMLV3KDePLpd39rqtYZ3UdRE4RhRFQW152iWcPvbeuTPvPWPe+BsiSmX6jfw/eqVI
	k=
X-Gm-Gg: AYBFou2D1HdzMzaQWjI501+T1xDnIeJqhuQJNfpQZxk0YT3DLFwBPx4nW2E1AOUKYJF
	CedX2wao1pvImRNL+zWxcfTcaWPtTctYJ0tQXIidWDo0eP88k6qB0z59frH2PkuxQpCXhQ8ppMc
	y51KPl5qP1mz0Sr1g/UzFgCclyjr/oAALjeDhG5ecqYLL/t0AbIp7oX8k/4qQW0FsjcMNKvp77G
	AMDksxZzjKxBqTTYUCgZNp0jsDtTaor2ujAfRnW/g9HYnqC2LLBYc2hH/Ei9Ezqso3QtOd5ZT9z
	7e99MC15+isBSw0eDuY7vw2eCjqLFfsjCAoIpvdbpnhsA35OxTFG5oNPS8DttYPpoUQS5swpHD3
	7EB0YCbgnPUDLlDRPfFwUpI90n0NQ0tp78EdJrBD8C2s8V/q+XuW5lSvFs4RjkdotZvM8hP8/6z
	VlYr3RhPQcPJCR
X-Received: by 2002:a05:620a:4456:b0:93c:5951:38e9 with SMTP id af79cd13be357-93f29d5e01dmr1497003685a.52.1792448619780;
        Mon, 19 Oct 2026 15:23:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4456:b0:93c:5951:38e9 with SMTP id af79cd13be357-93f29d5e01dmr1496999585a.52.1792448619273;
        Mon, 19 Oct 2026 15:23:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a3fd03dsm2279048e87.11.2026.10.19.15.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 15:23:37 -0700 (PDT)
Date: Tue, 20 Oct 2026 01:23:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535
 interrupt pin
Message-ID: <3g6yjybhsqzedb7q3ygpf3ej3btyap6y3dqpqcnh7ghhwduwre@gzl2kqc4o4x7>
References: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9gSddsSQg6CImhV4KnG1dQ7KDigPT3ff
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4OSBTYWx0ZWRfX/wSABzBmewhr
 9QSBSTQeOfgn7TdTke7ld+kPNMrXoNjJGvT7b2uG9ZlLwm7bfaqOfuSqGVZHLU08GIh5mgAZAGP
 8hQz03AZn//51+BTabvWwbASgxC0cr4=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad6986c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=ajiliMmGaEjDzu8pHK0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 9gSddsSQg6CImhV4KnG1dQ7KDigPT3ff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4OSBTYWx0ZWRfX7U0aZvCwntM4
 E1XQoSf/9gfp0Ek2yY6wtohPBCdTYOqkEKH8ha4DKOJj4X/DnvFnQPy+FGNfuj+msPaTZPR8d3U
 MgFtdLt3cScg9MYE2Tw0m7qK01E9VsJAT+5OAnfAOpXoieYcdV9LYJ+bE5rlx9S8mQoE3a2LeLX
 4TZXCPi7+QaLcDeifmFMSIgiL05asDsoWvRlgxmWZBe5cLrs3Z0iMe0ixN122hzQWSEWM4rFM7Z
 T8XH5UzQw44ugd0sWt68EoyR9LMdXX/7Mng94E4gJQCIdg1XSwHLmfzrL32ciHeJoNWG5y6fmXu
 LShVttLpEf7MPSV+aS/sBDIUF2BVsPyV2ey87CU3H4UDO1e0I/vbrbmIs89yTmb55hepiRml/Yy
 rKEw+8uuq33W3Z84NCWSOJ31yDB4cUlzTTXmCoYLPvd9fuESNCiu2qy64pM5AidMbauen2s+1FK
 edHZctaWRmPu2BzDn5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190089

On Mon, Oct 19, 2026 at 05:30:08PM +0300, Dmitry Baryshkov wrote:
> Probing the ADV7535 HDMI bridge fails on the IFC6560:
> 
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ
> 
> The bridge's interrupt line is PM660L GPIO11, but the board never
> configures that pad. pmic_gpio_populate() reads back the state left by
> the bootloader, which is PMIC_GPIO_MODE_DIGITAL_OUTPUT, so
> pmic_gpio_get_direction() reports GPIO_LINE_DIRECTION_OUT and
> gpiochip_lock_as_irq() refuses the line. Requesting the interrupt then
> fails and the bridge does not probe.
> 
> Add a default pinctrl state switching the pad to digital input, applied
> by pinctrl_bind_pins() before the driver requests the interrupt. The
> ADV7535 INT pin is open-drain and pulled up on the board, so leave the
> internal bias disabled.
> 
> Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Dropped extra empty line (Konrad)
> - Added a note about pull-up for the IRQ line present on the PCB.
> - Link to v1: https://patch.msgid.link/20260920-ifc6560-adv-v1-1-89b1435d00c2@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
Other than Sashiko's mention of output-disable, I'd also need to correct
the PMIC that provides a GPIO, so there will be a v3.

-- 
With best wishes
Dmitry
