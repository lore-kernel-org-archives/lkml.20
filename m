Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C98C3FF1CB
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020376; cv=none; b=KB9nOvYoIWZTiCbLXw7kzeDX2qovnoFtolUsoQdGjn10R2hL3Bk/7UAiTMHeeXJa1aQsoXiyEfaV967ztoNz9Un571/YtGt9znTo6TYQTmAThVpjJ2YiMPCcpW+7wUeFi8zk1y/ntO5NGO5y6Q4RQ9dRKCLHZgm+KidjeM0VhbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020376; c=relaxed/simple;
	bh=9UlldyNWYOhvwGQWlGOcYCfrx71AurAvRd95Y/8YG5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YuY7YkNfiYCbsWG3bBOY9TbG7FRFl/1XgDrAnXY9SKK4u/atvis9LZ/KutE2XmSE8f6H7awXFm9L4FEr+UUJJJolj5VZJqXulQDkYm2yu4brlr04fytrcAFi/YVu9Jdb0yxxxdSHurDDMipt9AFogyCtcPTrR4Rc83SMEZro39Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACHs0bwl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YjM3G9aK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACHs0bwl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YjM3G9aK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TE1veq1834431
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JRa4eiF0jOBt+z+yd1SxFPDbNFX363osG4c75Cuyzho=; b=ACHs0bwlUchPj/G7
	NbQtDzX3srWCZ4FuxB3/Sg58RAj37S3qp54Jb98BzhGR7rZmOC3XTc9+H0Iv5Hqx
	IKBGzth63axI+tElBM2OsfDfFXXgYFQjU+4uwApuiqCKt+Ohk8sEr4CmFg0lrl1J
	YeVTzRLD1l2sVqslbGoKMhZVHfUZr/OGEcGa57IpblLIk1of8C2fdHZBuDXp5D6T
	U2tE4yvvnw99I+1iat40LIohoZCLbvZ3fxmvWnQbL9n0kFAPaTzwdAA0Slt5MoR/
	FEPg+jXBBu8CyRol/TCR1Ma41IY9eM5sGdeIPeLbUlGLcC7itD1LHJ+138JVrTrd
	uC7WAg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe29c8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:19:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so2647159a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788020367; x=1788625167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRa4eiF0jOBt+z+yd1SxFPDbNFX363osG4c75Cuyzho=;
        b=YjM3G9aKidFx80o/tBIKaV8Ep45eeaLVUppmkJMCRWdBVP9O1x0iyDGmvuciZn9Hlm
         c1F3zzC80Yuy7A8Rg9MNqJrasJOwkWLIXdhQoXHSHk7glaOkggXO6ksZSXMUhzu3doEf
         21UkxQjWA8zli4VorJGKZHFz5eUuOrZlE7PwHVKgOdj7Uch9WN6woxiOATQI6RMx9qoa
         KHeyRM1SslzQ6pzZWxcynw/4DaX3+dztUDw+8h5BOx6v+rRiaeHuJWRSMhzRhAx8ychD
         sjiaCazLXzGf3m7O+zy3CbBkPkIR3sp3THTCJ8GfiI8jQHHKgQi4CbA6Yv8IT1k0F133
         gfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020367; x=1788625167;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JRa4eiF0jOBt+z+yd1SxFPDbNFX363osG4c75Cuyzho=;
        b=Miz0PW8NqscrFqrnS0QBEjIJAZtolHHA8eUmQOl+mskgDOoinlvKaI5WEMvyoNoBnV
         +0tVoyqzae8hHr+Ild1Efv5x+eabiQkXt+P2N8RmU6CAdkgPpVJRv199xRk3BY3f76Bu
         Q2SB7ruE1K6CK3xxc5hkvghU5/JiHM2VI+JuT0TwN5yJ45LpavuUXupYpzkrEkcroE9a
         p70hSZ12s8Gmo3hDmjr2/L1fMZF2l6rvDu3dcyQq93WIi0xZYaglR+tc6Y+/wEgGUZKS
         l46/7ZqiThgLTj+FtuvLj6EFii14TJUgN816quvR249QQ5m2EzWJBBtWYi0bg747e1vl
         62gQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0lbuIBDX8TbacwIhRn9ki+qCuQyU/gJ196h7a4meMvWuydD4e4ffjS/uZ5yy+7oqCwLgKex55mmus8n0=@vger.kernel.org
X-Gm-Message-State: AFuF++miGseeHM5+dmo5f3+LBJ2+5lrFeJP332J9L9l0g3jTCMdOqqbS
	nwWXOjNNbRfQ0LzkYF2ssO+c+vGLsTYuSb+eNQ6umQyie8lj+s80lhCTVl4nEmQgEelZAEhOJ7H
	tUAot9gKJrsaGNRITbKbzyXXAxGcMZm+WI8PLLcrt917l9o/gTvSgUWrOiQvyLXj17Dw=
X-Gm-Gg: AR+sD12aFrmYyKcg7+uaTrCSApZPvK7gpvfkd6Yp4hvow844GQDTFfJIGLU+JK6jmsM
	jtbNyHnnTGbXlE7PhWXaCJDbc1Z0Qh0AUlUY303T7j+Q+IxXvAY5l6UPt83XG8tRSQ25ZIa+cWZ
	+gvbIvBBVS/d+PdOfI5YhBfz/zXTFT2DShfHF9QRbCAGpyJ0w/TvQBW0/dwWrG4EmJcFPSo2+ta
	Ng/0WjQ1WduuS4WTlZVtAtDF3hzDXV/aaBFJLhhn3ucKaoQJ5hGth1BTiPhsbFdR+9GHG6/HJwW
	+0OiPq+1GvXbj8fkJuSgc8Kxi0fGaz5n35hKP/DVn4XU2eX2TuWOUjAKK2F19lLHDk/O9Ttg7Tq
	2Cfb4ROoq6zIKAgyvhIX00tUkBxghAxA38kR2svRW9/26W6Pp/V4r2sl8UZoUmcdbLh0=
X-Received: by 2002:a05:6a20:72a4:b0:3d3:ae40:51e4 with SMTP id adf61e73a8af0-3d3ae4056c9mr10116771637.24.1788020367527;
        Sat, 29 Aug 2026 09:19:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a4:b0:3d3:ae40:51e4 with SMTP id adf61e73a8af0-3d3ae4056c9mr10116726637.24.1788020367068;
        Sat, 29 Aug 2026 09:19:27 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.241.61])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f85fsm1839168a12.9.2026.08.29.09.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 09:19:26 -0700 (PDT)
Message-ID: <d801ecb2-587f-480a-878e-8426239b7690@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 21:49:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Thanh Quan <thanh.quan.xn@renesas.com>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260828184212.395082-1-marek.vasut+renesas@mailbox.org>
 <20260828184212.395082-2-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260828184212.395082-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a930690 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=PZ14JaS8AzYbITig/tPzRA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=yC-0_ovQAAAA:8 a=b3CbU_ItAAAA:8 a=9smufsHQ1aYfdmuKAZkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-GUID: 13-7aJm9BX76TG_3xDzQfGNSTKaG8KGz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE0MSBTYWx0ZWRfX6giq867BgUz2
 /NLrr+is0YLNB89N6wwzmyCAnLktsH2pnfVkgBflO+f812ACLQf14EcPJkG3XY5m+4dhPDBdLAG
 H524lMxU+iT78RGDsrkZxbYm7YQNZ8/B3k+07NEdx/iV7GcqhzpkKYbLL20LlYCegxYcgruZsPn
 HjuQHLDdtLWOSoy7QB5HtzSpIdkyJbRZ/ACuTP3e8HzWq+ZzUa/5jgDvEBvpFpUh750ekVWRzsk
 66ZOaIGGrumnLKwgYdpZuSLVqhxjy0gUsFaSxvjsp0Yp099qbsAKEVK2q0EwcQ+uUV4iPdRobBm
 SYCfmDxOmjacRMsdXWkNrYJWm3MgaOhFa1ep0DKaKBsUouyfaDtX9xjIvCq8SI3uFfOq1vpsOSf
 X0GafDn7+HLuW/sL16mYSj0Uu2Bgp6wxuSqylqMVCqD7Sppx4dOsrdgkp2Q7zQh7FCVKvgrpLEW
 6PKgVMKKESmsfPocklg==
X-Proofpoint-ORIG-GUID: 13-7aJm9BX76TG_3xDzQfGNSTKaG8KGz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE0MSBTYWx0ZWRfX/BbBlK4mUI5Z
 M/fYUV+2MlcUQjqSNcWini93DXjo/GcPrEh3Lpwf52A8hol2N1EPthsgYzq9ntekn3sj8MBB/hf
 sIf1SNq1n8wdXvQbXBFSON320V2+GOs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290141



On 8/29/2026 12:11 AM, Marek Vasut wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
> 
> The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
> controller with glue logic wrapper around them. Extend the generic
> DWC3 platform driver with Renesas R-Car Gen5 glue logic specifics.
> 
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

[...]

> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index ca69ac0eb07ce..e8586c40d5006 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -71,6 +71,55 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
>   	return 0;
>   }
>   
> +static int dwc3_renesas_rcar_gen5_init(struct dwc3_generic *dwc3g)
> +{
> +	struct device *dev = dwc3g->dev;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	enum usb_device_speed speed = usb_get_maximum_speed(dev);
> +	bool usb2only = false;
> +	void __iomem *glue;
> +
> +	/* Wireless USB is not supported */
> +	if (speed == USB_SPEED_WIRELESS)
> +		return dev_err_probe(dev, -EINVAL, "Wireless USB not supported\n");
> +
> +	/* No USB 3 PHY in DT means this is surely USB 2 controller */
> +	if (device_property_match_string(dev, "phy-names", "usb3-phy") < 0)
> +		usb2only = true;
> +

Why not just set the maximum-speed property to "high-speed" instead of 
checking for "usb3-phy". That would be more clean.

> +	if (speed >= USB_SPEED_LOW && speed <= USB_SPEED_HIGH)
> +		usb2only = true;

And this check can be removed as well if we use "maximum-speed" property 
in DT.

> +
> +	glue = devm_platform_ioremap_resource_byname(pdev, "glue");
> +	if (IS_ERR(glue))
> +		return PTR_ERR(glue);
> +
> +	/*
> +	 * The datasheet describes initialization procedure without full
> +	 * information about the registers. Therefore, the source code is
> +	 * based on the bare metal code shared by the board team.
> +	 */
> +	writew(0x211, glue + 0x26);
> +
> +	/* USB2 does need additional register programming. */
> +	if (!usb2only)
> +		return 0;
> +
> +	writew(0x11, glue + 0x81c);
> +	writew(0x0, glue + 0x81a);
> +	writew(0x1, glue + 0x802);
> +
> +	usleep_range(10000, 20000);
> +
> +	writew(0x0, glue + 0x802);
> +	writew(0x1, glue + 0x2a);
> +	writew(0x1, glue + 0x81a);
> +
> +	usleep_range(10000, 20000);
> +

Use #defines for register offsets and register values like in 
dwc3_eic7700_init.

Regards,
Krishna,

