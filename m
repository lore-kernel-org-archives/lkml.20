Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640742;
	b=DZC0RMGJ00+yBtj0Q9t/A4bnsyCTiPVzPo97SCF/KsXQcBaYFA1Z8EUiO6s0LZ9rB9Ev
	 wVIO1ajrT1Rrle7wXwS15+0/1aWyp4L1knTu92IFs6ElilJ+YY88kB9Rbl88ev0dqenez
	 yADqy0c2LrdJwtR+3zvpl3PEhomHNV5Gcp2w9zIGpxurevvqnVrkmfrPYnrThqQZ8zMde
	 Ag1q5OO1EogKAdmkH/2Qx9UPvePtRjda9n2HQVx+I/YNv66W/5JE55M8H62zcdE5faE7L
	 Iw0kYK9unhfT5pD7l/4Yx+rZI1fGuHRcZsUdEGV/zYjo42cCxGiFyhwLID5Z9EkO/3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kq9Yzc8kYPuDZCKpCPFJzDuGUxfrJXPPIpmBSRkumE8=;
	b=K+a5Feg04SyBC6ls9D+mm0Xj8rh9dh5tlI2/58UdKuhBJkX1/3/AAY7TNVDQuHUL6Opl
	 tkuIPzPU9bysHXK86Y9YxIBUwDm7SlutWxVi7ZGzDHAWnD1ujazgzf1MPfEFujps7kwkW
	 KQtJs7gjE2lX3NVIv7hdIhmbAkvxaxWbEiUKmkIBFoCkVq9Zb0O8E/WuZi0Izdd6cAlCe
	 RbaPaA+0c2Nx8nRVCKInfzOia6YMdR9nBRNn25TXYHZPvPyuGuZPx3B9GbtchOkv2R8En
	 M7gFb2idt48to27VPhQhrmb23CQYVrQ7Dj6A1ipyZvYYbPSkavAHU69MtpJLDkO6HtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2340A606A595
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2340A606A595
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4be28b82so3487564f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793640740; x=1794245540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kq9Yzc8kYPuDZCKpCPFJzDuGUxfrJXPPIpmBSRkumE8=;
        b=xZTRVERevsFJ3xOw27hdUmvVIrOKf8/xegLOt20ndNBgY1FA2N/K+i1jMiIkTbtzJX
         /iAFOs8kecCX04xqw4maWngu2LYcnb9CkJ3mTQ7MzhlRalm90WHgD4UMa+piTWU4lZwP
         uw64O4yb21Pk6GSg3moxJn8+HWhqaLxyGTN9ZyBdHKfXBx0eT1tEqgbOENFoZ2TxW1Ag
         BMKp4QUXhSyW3h/BMOsBJvHeZcguid6DOK0A5AIcwMovmCedvO1NcLDSic4EcnumPPTX
         FmScxIniK2nVIzNm3mBoxkjP18kp3mkRniyCRvh6xE6VVMep9DVEqKxpiluCIGfRCWUJ
         kZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640740; x=1794245540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kq9Yzc8kYPuDZCKpCPFJzDuGUxfrJXPPIpmBSRkumE8=;
        b=Z1IJSprISsPSG+OLjCyhknR99BR8iXyVIVfz7ZiRzbEoqBTC/Js2kSsMlk5cX3IT/0
         JaDFNBy9WtcjxTTL5uTizegPV+Fmt8fE5QdZ6GarYhOofu/uYffwewvNWzeU8vWJllcj
         JrjXWRYQxBKPu7ZSbq1nPaJ/7T2CwEdlhuXc6fAlXiAkJXKxnl3IokhMvwAauOaT8zKQ
         K2XIIugSK3Jb3b9ixzPT88f0WOBOO+udqU0p4WNAeZ9tre9sxhS2WfBZCDbqhdi/3AEr
         I81yYkfbz06nSxaMTCURIDlESwXvdHlSwnkfrAR5op8y0bTzeadx8GPn7FyRVyjOgbHr
         txPg==
X-Forwarded-Encrypted: i=1; AKwUvBz7XX5WjK7ed52lfKWMY4qgevoiGnvLMM3ENGeuFCSnRNbyhyAfo1muLq1P4RZkPPfUgg06jYDyPIEYr+Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0W7FxaHt+TSqmIlS0GLBVgZYKKF1Yihbw4M8d1fMTzRQy5AzG
	taU+co1K3djp84AhU+1plQddzROy9UnXVJioM8X9I++mMS8ITesAx8/d
X-Gm-Gg: AYBFou1MFvuy1okqIPGdnuHqd8+78ljJaUNHtu9dMULdrjxW26IsFYN1rJRIF3fOtdI
	aSNgx3V0crrJs2AHBf3JPRRZ7GRQlYoXAmTObJpui+VM1pjdP0sLi9jy70RPkdLb6mVIjlP5Fk1
	dQvk5F3fJ4pueK407dSEOInakUHl2juuhs/HmZLPJQ7LU7y5gxzWmheKmxN168GreqnTFmCFO6q
	fzPUC/86xxgf58R40llJ9hFtbLChxfqeW2YtjYwNR2YJHxRddfduDWaNji0wqC/toRrsluzHgDX
	uxKqLjIS5nlWHPzFdqjlyOgYWnCALLYz8QVaEnOJQKOmvRmQU61gUtHCDosR0uMEJBpqMQwg9Hd
	TvZXpwtbZbl9FdllYQLz/Ad/Dj5MQF+JS13xt8eI/XbKtS1E0KX8oeF20T/DPA8qomCGIHJH3+A
	gRHJJOWmf6Q12f/T4z9Nd66FxK8l9i0okXQKppi9rEHn8gY+PYSopOd3/pC1cgLL3Ua5muD3Bs4
	nXAom6y5ZdVeJSnqHrSlNZ3ZgWmMogXFNJ0MI26ZCYA+NAqDGJQzsJdB7f7R50RbB3A/PkOdGIm
	1L3j9WIX6IYsLLMuADLBqNd2XlaUbwKRRR8BUjQEYNz8+leFzEOCzuQ5aXFr3TreipyxvfWzs2c
	XcpPq61L6RaPFb2e2aGNn
X-Received: by 2002:a05:600c:1385:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4ac182dc0a1mr263780855e9.16.1793640740359;
        Mon, 02 Nov 2026 09:32:20 -0800 (PST)
Received: from [10.0.1.67] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm2039345e9.15.2026.11.02.09.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 09:32:19 -0800 (PST)
Message-ID: <8abc611c-525e-4450-b924-87dcad57a578@gmail.com>
Date: Mon, 2 Nov 2026 18:32:18 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
To: Frank Li <Frank.li@oss.nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
 Frank Li <Frank.Li@nxp.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
 <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
 <auJWI1bqt4kX70pZ@lizhi-Precision-Tower-5810>
 <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
 <2a1eb85c-8a30-4594-bdad-8a1dec17b141@gmail.com> <auTPTxt5ioBJrr27@SMW015318>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <auTPTxt5ioBJrr27@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/30/26 18:09, Frank Li wrote:
> On Thu, Oct 29, 2026 at 07:55:41AM +0100, Emanuele Ghidoli wrote:
>>
>>
>> On 10/28/26 22:05, Frank Li wrote:
>>> Does it only impact superspeed? High speed work?
>>
>> No, it's not even enumerated, on the Dev board.
>>
>>>
>>> Thank you report this problem. Suppose below patch should fix this problem.
>>>
>>> I have not time to test it today.
>>>
>>>
>>> Frank
>>
>> Tested, it doesn't help.
>>
>> xhci-hcd.1.auto has no fwnode, so platform_dma_configure() never calls
>> of_dma_configure() and the new code in of_iommu_configure() is never
>> reached.
> 
> Finially, it is hack at uboot.
> 
> 592: static int config_smmu_fdt_device_sid(void *blob, int device_offset, int sid)
> 601:     prop = fdt_getprop(blob, device_offset, "fsl,sc_rsrc_id", &proplen);
> 618:     ret = fdtdec_parse_phandle_with_args(blob, device_offset,
> 620:                                          "power-domains", ...
> 578:     err = sc_rm_set_master_sid(-1, rsrc, sid);
> 681:     prop = fdt_getprop(blob, offset, "iommus", &proplen);
> 848:     if (is_imx8qm()) { ret = config_smmu_fdt(blob);
> 
> 
> Need combine power-domains with iommus.
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> index 176e2e332f87c..cc2b9a212780f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> @@ -189,6 +189,7 @@ usbotg3_cdns3: usb@5b120000 {
>                         phys = <&usb3_phy>;
>                         phy-names = "cdns3,usb3-phy";
>                         cdns,on-chip-buff-size = /bits/ 16 <18>;
> +                       power-domains = <&pd IMX_SC_R_USB_2>;
>                         status = "disabled";
>                 };
>         };
> 
> Frank
> 
>>
>> Emanuele

Hi Frank,

this works. xHCI comes up fine and SuperSpeed devices enumerate again, with no
Host System Error and no SMMU faults. Tested on Apalis iMX8QM and iMX8QP on
Ixora carrier board.

A comment: imx8-ss-conn.dtsi is also included by i.MX8QXP and i.MX8DXL, which
have no SMMU. I get if we should put the property in imx8qm-ss-conn.dtsi, next
to the iommus property it goes with.

Thanks,
Emanuele

