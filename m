Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484654;
	b=x2d09An/95hQbwo08L0lYdeeqNIfg6w/uGKfneC7yNunA7VgNvdo2B/cFhYH2XqfQqAs
	 85y7TDvhMX1PmIDZxe263XQkZgpMeUysHfZ1R15brtQUGYSwM+AbNWbqIik5lmSfFZflh
	 q/4ZJpZyKP5W4x1n1x3C9uMBXMcqtfO8TF1mCHDbYZUhentshrwBegtQ9nrmHrhdDS6f8
	 UYB6PmvMl9TX/DszVeR9phgMq5rtEixukHB4j4aSZgJOF9m+/Tx1FGKPQiPYQcAjeJ1vx
	 vuCJ5s8xJfKfOvbM0VtwZflzOdttIYRcGlpklKcdNpEOgaE4cicTLd2NgNsmySd6CPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WTVUgaKTlYixZEjxttBBJ2Zx7JpChm4sT+rOhLp29zY=;
	b=ePDYcRq77tfTt1zhXzPcSLk7z0xBLnY15QN8C/m6GgRCR9jXH1KakBtiCcmR8ydsqNzO
	 iFiHUxPGkXTEWfHs8D/bkY9sZXIyT0TM5nHXb+gbIkimsYpiAOoQufkQT16ZOYzLlYEHi
	 AqcXID/9zitQj2dhEYcrlDrFPDy8DHWMiTOS3LTreGAslpH+g/xyVvfHCNQJT33TlwH9g
	 TEN2GB75Olu6fKGfViFRlcymdwIELBe98dWqFmIXLupiKAbT3/xbFz3dTpxbl0TSTctrE
	 Fr4+iscjrhyMqkGQiyKYT8nqZ5Z7NbAPI9CV/Iz4YjFHOfjrofl0reaXxYnlRBFt2Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="E8/oxoUs";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bh7Xx15v;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DD1606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94DD1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E8/oxoUs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bh7Xx15v
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9Qe9t4092542
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WTVUgaKTlYixZEjxttBBJ2Zx7JpChm4sT+rOhLp29zY=; b=E8/oxoUsZdrmfVrj
	4nLtKrhOG9FZ6nbTzxObxl3C52NPDUwzT3RfaG3E04iWVoEdRAY/kRLV3gDeErEN
	EdnDNNWUKtIn3rSFWi/DEtx8ft4NkBLHWf1tRkpoMnu7BIFRjjcFierZlUXwmJyk
	gf4DZWh/11dEiSkQnoEHU/53bTgxxLZcnC7E3qrzyIOGsqQ9F4EeV4uO3DwVZIA3
	DzQw3+jA8gzMwJZlJzBzEU0g732KilaA7gFmjrblYljRRA84fXaYZoF2rI8oJaKI
	3XI+02fyMmqvyffJesb5ff7L74yRdY2MKg+cf9B03rXLFCMiKk2jnmsXV0ScWIFp
	oLCJ/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8jpcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:57:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so47371485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794484652; x=1795089452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WTVUgaKTlYixZEjxttBBJ2Zx7JpChm4sT+rOhLp29zY=;
        b=Bh7Xx15vagypsXdLyaNVsJtq3yx6e59n5foGSvP/6iWwcLk+bri6CcDfKJNTi1ixrg
         8LHE+NogN6fDOKyiehtWnaToFj4sgJj65I+Q0ZIkNhFpDEKtIJdwC/vqahsr/Yum2FPA
         R1K8qDN3GxzzXuG43KiuJHQDyt09kEr6ME1qUmx6Iw63Kv3I9+hb+jO27RoE6XQQvTrW
         K5kbQB+mjp+VJU4gKbKgIqHX0m5g5IgEHPTfQCt0UKTH01E03hGs0biyFQax2350gQ8o
         JTSVAHOQWuAKvE0fC8EPjQtk1PxszA5PqkS0NjFr9zQKy7JOVc3JQBFQmrA730NySihs
         F+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484652; x=1795089452;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTVUgaKTlYixZEjxttBBJ2Zx7JpChm4sT+rOhLp29zY=;
        b=Ux00EY6IhC2Jvu70cyqN+jxGWedxTFBFvzOVNTB5i3eBxkrBakerRV92NNKdSkE+zS
         13chZpT5rsg5p4RLLXtqtQ6Q42rw0p2eY6FuccQiYZFmCUibR0rTm0y3JjMHTBD27est
         /g55fyZ4md25SGjPz8vqgpqs49Xwph3cR+++o6Gs+06717OHsFWkw+jBarWMRtC6+0S4
         hgEwJDh7YL2bjKvJJmjZkSdziKjMPpifoKKbjJwQusRunwD3e+GI5WSd1uGMHNPhr682
         S9mpqM5pcwoYdVL06vcNhl5ZWL6eZkSLlbwAI9YarjxMTu3jT5pUmhfABxU1O2Ov+W1r
         LAIA==
X-Forwarded-Encrypted: i=1; AL+hErGwSIbKwTsPlNBRimr1e71GI7zw/vlZ++aZcgrsN+BXpAXvxeRjsOCCXXuomRl2GdAaA7Rt19iTb2494iM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2rTGoVU/gBjRuLMPUlByIkNQEmHmJglG0YDkkNm9WdSydb7uB
	c/aZDAomN9mzUIz5ruENjztKB0uHeLSMC7LZPyvNlZHXEKLU0OzA1Y/x1iq0kWIun7mpTbKDL6z
	UMb0m2ZjfZ54xmosfD4nXbIdDacqRLH7gOI5nnmGLEfP0RyFTGKRNi9n8LzETBChFtqt4s2YZ1i
	A=
X-Gm-Gg: AYBFou3wiPqz8Rka4dK0RCsryG9Lx4OP6XLdGyB7ejbrMHBH+UPexjOzdVDvtRlMeby
	svH2fCblY5ssHSGvSdeiXKxv6B/GzzoGZ7r5+J0YK1NukW8PVJiCzIXaOakCbAPSkt9NuP936sR
	j3YUoopGZPuAw27xDNWi9gosN+K02b0+kmQKJ7/EXBmb4o3JNEfDMjquvJ5+79tuB47Hw+hWs6r
	vNajRv+JhckAJHot0+q8t0XMI7jNpbkqXK7TP3qKMLmFRarf3vmgNMbwNzwClnWLnW8ouTTBtUc
	0wbd31PQrEfJRUpOS5JMYtqUvVlRDV0OA4BkANooBsOdxxD3zqdNCqeXOb9JaI4YSw5VCzbQw02
	JL+w1k+/pbu/XaoohKeFxj/bu7UZAb4jzVeJhjdx6nuYZbwtaNSYYAt9HiAZTTITtZAyAPec=
X-Received: by 2002:a05:620a:7201:b0:93f:740f:5a62 with SMTP id af79cd13be357-947b005d221mr898136485a.6.1794484651620;
        Thu, 12 Nov 2026 03:57:31 -0800 (PST)
X-Received: by 2002:a05:620a:7201:b0:93f:740f:5a62 with SMTP id af79cd13be357-947b005d221mr898134285a.6.1794484651068;
        Thu, 12 Nov 2026 03:57:31 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75775fcf0sm3467729a12.0.2026.11.12.03.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:57:30 -0800 (PST)
Message-ID: <b64cfe8e-7274-4a8f-8add-ee1b60522c42@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 12:57:27 +0100
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
Subject: Re: [PATCH] pinctrl: qcom: sm8650-lpass-lpi: Force runtime suspend on
 system sleep
To: gopi.kanala@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112-lpass-lpi-system-sleep-v1-1-438cb997e0e9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-lpass-lpi-system-sleep-v1-1-438cb997e0e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX04MRkBK74eOq
 FwdPyFB8QUqy/m1IFOLZM2cn3W0vXu1OEtucKRiue8y6BZyNHZ5eK5QaDMXfKIzgnCNCq5AIoxf
 hcVYTngSl0d/uYnUhk1tM41dVyzKLxU=
X-Proofpoint-GUID: wmag3_IOatSxr6gK7GHwsAj7FAEteT5w
X-Proofpoint-ORIG-GUID: wmag3_IOatSxr6gK7GHwsAj7FAEteT5w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX3rCDQCcgUd6V
 Xe1wyPYWmrMj/fX8VfT0iAX1TKY8uW/V1tZmmBgMnBESFyiLBxK3eJOvmIl9CmcFNeRW62MBCA1
 CR25bucJzrlCdhY03kbWI29omhgwA3dvuAt1CMuLzhJNgdj5/H1sTUEAr/cca2+BzyQW+s2GQTb
 poGeXC65WCw7LpyjrYRWd2I5/IMAuwI4+S/4GoLH+XAFDeiYfxH7lIkK49nOY7q1d6B6M8OyFV2
 JCZT1iMBjZ9GmYGz75xVY30Osq0QPRYNqGcvj9phnPcpMzE8UVnbxtUgrX2yOFwvQlb3pRWP8pY
 bqKZbTkQNxKreVABYIfUbGIXY3XAUNs9YlOgAXLqR2RHlVcKU5UgOGypfcmNKmNGYN9NE2o0NEz
 +ULkRlBG5pmwH7gWo4siFPbdNqWb2fGDg6heUcReLDMRDEGHLvrFVoilWPXhKJVLSnaAWEnS4G5
 4MsATqnltgUsRgMmw9w==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5a9ac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GwXthRHL4ZZd3--2RZMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120047

On 11/12/26 11:51 AM, Gopi Chandra Sekhar Reddy Kanala via B4 Relay wrote:
> From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
> 
> The LPASS LPI pin controller votes for the LPASS HW_MACRO and HW_DCODEC
> clocks through pm_clk and only implements runtime PM callbacks. Its
> consumers, such as the SoundWire controllers, keep it runtime active
> through their device links. If a consumer is active when system suspend
> starts, or is resumed during it, the runtime PM usage count the PM core
> holds from the prepare phase keeps the pin controller from runtime
> suspending, and both clock votes are held for the whole suspend. On
> Glymur CRD this keeps CX and DDR from collapsing in s2idle.
> 
> Use pm_runtime_force_suspend() and pm_runtime_force_resume() as the
> system sleep callbacks so the clocks are always released at system
> suspend. Consumers are suspended before their suppliers, so the pin
> controller goes down after them and comes back before them.
> 
> Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
> ---
> Tested on Glymur CRD with next-20261110. When s2idle is entered right
> after playback, the LPI clock votes are now released during suspend,
> after the SoundWire controllers, and restored before them on resume.
> Playback works after resume.
> ---

Should this extend to all other pinctrl-xxx-lpass-lpi drivers?

Konrad

>  drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
> index bc7889c993d0..e33d4360c094 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
> @@ -220,6 +220,7 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  
>  static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
>  	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>  };
>  
> 
> ---
> base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
> change-id: 20261112-lpass-lpi-system-sleep-70c4d2239abe
> 
> Best regards,
