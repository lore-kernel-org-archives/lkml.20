Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575072;
	b=j3glPHKXKwX6S77d+rBMMCUbwMlYzDtiKijJE0pUrDEXqgVctFvPeYqYfHs4S+pw4bZ9
	 kcbVpU89VOmvKMC8yR/4BiwCctJxEAAgZJPzCSAESa4CRDrl5I+xPphB+TQN9LVRgGKxN
	 d3L7qiUeDW6AdJOrwn026q3lIfdCX9MlI8fyokyElmiwZS+MWsxexlrvBGrPQjYOKW7mi
	 p1ObRfUJSUjZTvNM6QhWwrtnsqej++BnuGmHAByTxyUKfL6R6yfzQDxKhppwoRsIqlK1+
	 utam2eZyyw1YrFUacRghwQEbT5ViSxc5XxgxvvNJfZF+sBQfXwzm5u814m3mpJK+RoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Bko+HUcyhAHNudlJorQZD/sxxlgE8GJ6dUtZz3KykI8=;
	b=DaCAHTh7Ij4A3uuZ3jmtTmkbqHORSm5bLKZLJvjo99OwcX9Qok6GL5iZV4rFJeV7BDfi
	 QUqWhwFA1gtxGUpxYvsbkY58QREB8dbPPW3J971WDw9XgojH/7NuFvoAV+jAoKaFFSc48
	 SCnTE5xAZRC/aLk+PaxXDDgVIXkb5eCDd39yLyPTovc7mAiVELNqDwfjPvZia71E0tJFe
	 5Ip9phTcuFg6xRoBWhzcQ0pHu1YAqDaCi8mkSqj4pTdLdt3P3Qc5f9zIvjwP5gxtCzBJP
	 JxPahIT4p033ZLZ2GQJS7yjEe5np140lsjJ/10pgJKJjYBu7bD/4w1kIbf0EfKpCTHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=monstr.eu;
	spf=none smtp.mailfrom=monstr.eu;
	dkim=pass header.d=monstr-eu.20260707.gappssmtp.com header.i=@monstr-eu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=riqlwF1K;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF31606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AF31606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20260707.gappssmtp.com header.i=@monstr-eu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=riqlwF1K
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso155747166b.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20260707.gappssmtp.com; s=20260707; t=1794575069; x=1795179869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bko+HUcyhAHNudlJorQZD/sxxlgE8GJ6dUtZz3KykI8=;
        b=riqlwF1K2vXDVc85Cx4Vu+yVDBUrlGNjjhwTbOurWAExBVWrYUinisAsdtwKCPxpeg
         YH7bT1VclS+1KvJmbM6/JQXvvWljNGC6Qm/XZGiTNoeZhMzU5XY+A+7NlXD7QTy5y+Zk
         Hx8k238FPCaDbkCynQbyT9f3awDslu2qaUV/nojBNTzN54nAYXLqkn0i0+WC0V0f+fZy
         F/1QWWDg4lZ0rUUfdOK+NogA+/s58jdxKywh5j4PtxtGQqfBBFTnUvxWC0pBvatJ+ZdS
         mxHL8U6Tzd7istONQadvhbDv8VBqVdRFmk7bQRL9nwtZAre5tDabQN5eF4qxNEneXRuA
         Is3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575069; x=1795179869;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bko+HUcyhAHNudlJorQZD/sxxlgE8GJ6dUtZz3KykI8=;
        b=0nXdu8V3VW17L8T/mgaGHc0kiCphV7gtmmArZ40tlHDHz6A160picmUz/8J/ZN5Vno
         YI5ip4AKeA0IQZTd4raYx/xsQQG3mnGUWqrlrysphzqEA9QSVJ19XlXNqc0u+BVsJwrN
         O3MiacIHJZap9yr7oUcZMLfBu9JwkAr/4FeUzGEHPHxDlSyyxjpAebCEaSrdJdcIyAWw
         TWO7F/hkufh1MMHSe5dTirJM4NTec7YvfqLyGTOorFZpWxXD6znSK9XJniu2RKvTACEw
         ZSnuYLeg3s0LoFnC5tT6CLVOWBDAbT6gxD8RNlfJ4ObE5ZDqhi4vtcFXyIQcv9cbv6VM
         54OA==
X-Forwarded-Encrypted: i=1; AL+hErFBUuTjXd/C9OIYZHgxsus8k5Q82YrnF8HZZQh60zIw8hK/PNHBBJKsMiuKllg/uPZoe0UqWGE7plmIZUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RAfoL8ainHlPGfDtaHGDQIKloRkAM29jDxKMxM0qwHAQYUwYB
	KB0OaImrFWvgby0qUMh50AQG1SYhDmWwWSqRCyHyeqGTxeNcIWA0DRERYZFgxrJI/A==
X-Gm-Gg: AYBFou0R5Wg97XQHoCU3MgUy6CZOKODkime+3LJF3DWTRuhAU+kj2jr7C0k8Yljog3s
	ETmmx8CFAhybuyJeO+hK9tnoDrCFErqH+bmiShGNp60Do0yUj4Dq+EAeMKwYCdima+OzPtJvzBB
	I+m+u7Iqd2njL2sBCPDfiLYi1fOWo3PoY3dWpkk82IXaT7V4Rzzn1PNjmZJlfxeWFiVfLSNUl3x
	bMePj++SosH5ombHe1ynvGy4iYnJcHXU4QJXS3iBvXx6+MbFqtqlHja+Cw23oX0nEoTFjoY8HXV
	OS0dioK/g5o1YHmCcuWeuMdR0/b0C0DTzwWOp9VAMsU1XQbTHg7Cy9o+dZDXlrZIUTRN4ZCAEKQ
	CHFbbNUVL0YNxX11UftLHNaRvQMlizr7BmQCjy+PqH5kQbZ0qNYAlbdA+aXRbECsJq0Xehj2tOU
	ZHLUY/9pNSBOHkLQtFma8xk41OIcg5PFNIizKrUgj7NHcxjnwx0jR0hWOWanqFcLI9cnKkpLuPE
	+OBg6AFXNSnj4Of55/b9TqCJxUBwtec9VkG9xz/05v59WV7ztrUuTY73N5z6fost9I4sdY3ivGt
	X0CM5ScRvJ3Az4g1V/UUSbOxo3X8Lw8dOnWywMkq0P/FrKrpDGPouXEOpQgdyHnN+GoBLrcwf1S
	Ztoac9aI6dK0TQ+XHW0ZRHMviDm+2ABULMfwtZg==
X-Received: by 2002:a17:906:f5a8:b0:c50:5e90:5ea7 with SMTP id a640c23a62f3a-c5096853f0cmr210109966b.49.1794575069275;
        Fri, 13 Nov 2026 05:04:29 -0800 (PST)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm91031666b.75.2026.11.13.05.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 05:04:28 -0800 (PST)
Message-ID: <b40c2160-f5d4-43ab-88a1-14cb11bf92de@monstr.eu>
Date: Fri, 13 Nov 2026 14:04:21 +0100
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
Subject: Re: [PATCH] arm64: dts: xilinx: drop unused #phy-cells from the
 DP83867 nodes
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261110-v7-4-topic-zynqmp-dp83867-v1-1-04500475a560@pengutronix.de>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261110-v7-4-topic-zynqmp-dp83867-v1-1-04500475a560@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/26 10:03, Steffen Trumtrar wrote:
> The DP83867 ethernet PHY nodes have a #phy-cells property, but no node
> refers to them with a phys property; the MACs use phy-handle, which
> takes no arguments. #phy-cells belongs to generic PHY providers.
> 
> Drop it, so the nodes validate against the ti,dp83867 binding once it
> is applied to them.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Reviewed-by: Michal Simek <michal.simek@amd.com>
> ---
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 2 --
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 2 --
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts    | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts    | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts    | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts    | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts    | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts    | 1 -
>   10 files changed, 12 deletions(-)
Applied.
M
-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

