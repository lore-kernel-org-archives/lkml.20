Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DBD384CEC
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018299; cv=none; b=YpipnY0DJAapCmPoqolqtZuaPDBSQgV9n8YNTFSW8u4gD8kYuDvS5OHGoaJs1symIc8egtwJzA8wnsxccS7xvb0xYcyCluuMft/CBCbQmTi3oaYXfrE81kN8/4C2aI9C77ZtJoQIHMvU6vF3uxVEZBPVqwTj8qWe1KoisA0ebSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018299; c=relaxed/simple;
	bh=oBAwIlp0EH3iPcRUaPn/NBQX1NuaLsMheNDGOxsCCCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iI2nHXG53bqQJQV8606rrRzG7KHc9drEVhp8vWBTwnbE1nN3TVr6Kxr2+QX3xYqFU/2DcisTodMyuRO90t+Xwfb7Oe3NOX3yMBZLQU+b5eOjwqW+NvBLalwRvZzsofAsjsbIEQrXGeTd+2+Baiw1nG/BgHqBBN5HpUJIzjbx+c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rCpYc22e; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rCpYc22e"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e0b486d91so89695066b.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791018295; x=1791623095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0SCNo95/BixJDrCNj1e89Xl9YT1Mqeqtzc6x6damSjo=;
        b=rCpYc22eb48zkrWQ4b/+ahl3jzImbJJaaN+pQ6NQ1DrDzZKPIlAKqtn+H53YJ89xRe
         rz5ys2myG3ejGScYy3YskMz3slGjaubWRYwps06kNNK5MIJe62wN4aKlPGpR4Jbfsrqc
         RNVw70DVQ7G7KHmyGmv6EknG0SK1v2cV8+5ey+c0IIPLtvD86Bi34MKqVsNLZKQtxL49
         6z0RZpmHzrFxZ3pEcQgQmy0ENDwJiO2KVf1rp6DeUzvFIkzyLSmpDYGTxcWEjp1grkGw
         895RFoWvwLWj2ZfgfwCJOlSReYyqJPH4EHo3lWdh1OzI67pFPh6kh7TuzT6+0r++hoc+
         zNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018295; x=1791623095;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SCNo95/BixJDrCNj1e89Xl9YT1Mqeqtzc6x6damSjo=;
        b=zHS4BjkPrenhLpv+9YDWv0m7eqGDcQUcQH6gxZfFnMzS359jt7Am/Lp2z/tlSXZJPd
         oljiJOzWEC6IHrwJ2JfhACskiuAZeTupUDw3zdBJmZSgun6CZsKZylXIPf3qj42kyjnH
         /MgA+fRTtyaw7BPfxoKrJCx17VTBscaL1G/gPtR8T7TiqKkm9WAox7P5bGO8NY1wkUTK
         qsHFlZgNiCOkHBv3Zri9tzJ+Hd+Sv0yOk801mybuhPpnFj6Htp3vWFXoPGM9M4Zdtcnf
         hhuHsqGfW0yoFSZA3UGybSjw1+PT9bX2byjYi3Ma5mYTOdEBxZQZN9Hv/p/A36A7oag0
         oAZg==
X-Forwarded-Encrypted: i=1; AKwUvBwZdsWJFeGkzxPlX6EauDlGDyxKUMiey+FIta6GQdcktKQ7dCIz5TtPuFok+3t8tnMTG9ECudOx1UMSXSE=@vger.kernel.org
X-Gm-Message-State: AFuF++nAQdGKEVxO3NOlYsatk+gwuG5Z8QM/Memx5rV8xhZGQjjh98uy
	hV38tDFE1vnJT5paCIbPbjL7O6IzeqXpsvwqD8yr8Cjveg2s6+52PCIhT9tUfaow7mw=
X-Gm-Gg: AYBFou2oslbT72KjLrqJHbZ47W/BuJNcp3BaERWmPpxAPZhrRdy2jts8ZooopKzQmzN
	8hE06mKJRfYIm7wmcS2WEPXH6VVjNT5OWuP2JokeIzs49zsqAc2EevY9maseomlnSqehnFIlx4I
	lKKuD5/Pb0DTt++1KorxH3Y+5+kPwO8ArGX3op7/dAdSNfut8VI1k2JJYrh6QiLvkEnjtH1CRXr
	my9US/wwAQyLO+wl+t+gzEHEfx8zPmYDWNFPvS9SrlDdHiZCPtMb26e3eAKrOZZd/WyK56Hv+ZW
	gkt7HB6YSR+582oUHo3zX71PJNH+OVPWgZVFuz6dtMyS86vbxlz1ZeRgasXCNu9+dpDwFZD9n4Q
	rrSe7ZJL79AA5MnVSvD501RXEiBj1fMA0P40gaMJ33Qol/FDSFYITay6rSYAwSyjY16wM+iRVMo
	MmfC07E4ubov4FIJixKEeKFRPBqzpGFH5p45ir5Y+l8wfRN+mHmGvDJxItvRWRITkEe7K0aCnKs
	3rrxXLN+LE=
X-Received: by 2002:a17:907:94cd:b0:c2e:3d17:5265 with SMTP id a640c23a62f3a-c2e4acecd07mr452317266b.21.1791018295547;
        Sat, 03 Oct 2026 02:04:55 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.86.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e71d5876fsm48745266b.0.2026.10.03.02.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 02:04:55 -0700 (PDT)
Message-ID: <86300678-cc2e-48ea-9421-b615dd263f24@linaro.org>
Date: Sat, 3 Oct 2026 10:04:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 02/11] media: dt-bindings: Add CAMSS device for
 Kaanapali
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-2-87ba4ebe0db1@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261003-kaanapali-camss-v18-2-87ba4ebe0db1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2026 10:02, Hangxiang Ma wrote:
> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
> platform.
> 
> The Kaanapali platform provides:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
