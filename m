Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354981;
	b=PcQ8Zm+xz9PsJVVu6uDd5DDmmPsNafONRW9aITLEpneFb+CeUcYaKqtcFJw4kUc+4QVh
	 Eg8wIwtvTjPICueNIeLl1qfVxjFljkkWym0lPSg9ThiWl351chrCQx1vxKLA5iu4Hm7VW
	 eOFNRNQG3nEGmknnD8X4zcf0CA81CphgbLl92aZfuGowGXOVTIARkY21rgCQRX8XZ9iWH
	 6I27VNiyrlpkg6uLlHP0KCSDXDzSeeh9xucG3PYwhD+5EQIo0dIhwbpL3tmEc7IP1c3MH
	 SQVDmpwu+FEWzvaGHOX9f79jTSO3acUoEUVXl2q6gMBFo/yq2NzAPz7mVbAAYZXH0wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354981;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=TbgkfmRSlQR0RSZaLLsWqAT5L9ZTG2kkyMrzBfuV6Vk=;
	b=m9N06RqJf4GA633Jm3DynmLMqBDcQc+e6NKu9s8sTRLJRHg7PGtEfys2b2Vb+hq4Sr2y
	 4leSnDGDOcT8lcIr0tHHevpJDO8LitrotlUbt4V22p0JqWMyut2CHs/lsaVNe8din5wd4
	 b7hnfMMAcvEsO4qRTzDMVfUrDKXxbaXEf1wVjd0mt2LqMRxSFEInU98zBgrTSbEk+kEoO
	 pW/H2XoIosuFOkIm0pinKTvV1bFAqyUlVt8W9kSB0KhWmaVCSDsHAv4W1nihe/6P0OVuu
	 K/5I+QHMs/oAsQyuBCFmCbrejkrjRqFyG7Mfm4ZFWQUFLnFUgalRvpEEvUabOHRbnNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A5A606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A5A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-677d35fd1d2so3166777d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:56:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354980; x=1794959780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbgkfmRSlQR0RSZaLLsWqAT5L9ZTG2kkyMrzBfuV6Vk=;
        b=XpztBXZGD8Y1CqDNAFiNizeIwsQ9mlFD2t9KMwOSa57DvKFvD52yhqgIMXeaFvR8vh
         YQKDZg0jy591Uooq3AXrC+A1WXzggsuts4jht2sA5B3KGsWZ7UO/X5mjzwK9qDi4Q232
         dam0tgP3t6SVSlKmjT30cwynv+Kk+WaKQyiPh1JBSQ2JkkBL10kgHuLXeg/a2SHZu9sh
         cgIgBW1LDT6svjAFlSvEwV7hTUrfbaZ+xfA2WCIe1TrJN8luFgEGmDZNNh9m2Gf+nE5s
         0h9hN4ffL6ZGWiWb/rnsfFUR5fPVlFqHloiG+yY39nnL+ay2OaLwLoTm30bL5e88Tr22
         nihw==
X-Forwarded-Encrypted: i=1; AL+hErGo73Ew6uVhO/YsNrpkvWY2zrhQOCDeViMpQ5+5R9fNiy0gha10bsjbfhnQYJ53YkCdJUAdQlXJWwO3pYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tSjPA/Ag9u3Y/TTZ3IPz9K2U9QsQP42Bp6gMIoRT2C9E8BJuH
	gv7FjR33oAuzzHA0KEE2E2OPFq/JHHVVQuCm/ohiNTXMd6xRfoyYW/23
X-Gm-Gg: AYBFou07d6xtJQqnKXuZG6CPaT6zB//DHtrDLjXyOPMfgPXILK3HCl9+DZt7iT9KP0N
	SJyhqBbZIh3tKDwlg81c8LPrVNMrGl6Z0uAQ3B/o1F9rM+bcQtiuV9UxNZyOz7tNE3VXVRE2YTc
	MOmFS3xEiM0EIG1lyBd4mE9T7SpCuCW7wt3C1L+FI5QsXVlVG8nRfISTDD42fqUaZKGT9J5UJMD
	rLM2ilFLQo2to04lju0G3VDRgrm3S5sMI3PIS1PlI43/lyEpgXX4prXEVMmcMY9Z7XaO+++FYSH
	91gFgpqgZtD316yzmh80rrGquzb2NMiW6yHx2/eiYQZBtBc0YOAxUIr6Y6SBfUNq0ol68Pzq69m
	b5rMvO3wpG+0ZtTxYjsxmJ0Mqy8cP8Tpj+zaa3cWzZew3v0VycE8Mu0HF8F9xfuabAI6nb+EKcT
	+uH3O69K6OvdlAX7EekOQ3SbXk4o7s1VuOwQ1+7GSotq5bhPY5mf8jzWe48+HSBaWH4UjWNHTLN
	9sXV11GBvC84Q6RCeygmk4nSZ8PEHdKuZj6qKgt4vRKLTg9+jWfaKUJgXN/G7bL+GO7SSucpHJb
	Q25RsPxfMKw5zkSNN/WD6D7cjYM0ceMUC64S5Qd/M9mA84u+Cb1Vt9vMndvU1pzkmh+QccXl
X-Received: by 2002:a53:ec04:0:b0:679:4176:47e4 with SMTP id 956f58d0204a3-67c6811a961mr389098d50.99.1794354980450;
        Tue, 10 Nov 2026 15:56:20 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:2f77:7097:372d:6d14? ([2800:a4:806:ef00:2f77:7097:372d:6d14])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c58a294ffsm3158931d50.23.2026.11.10.15.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 15:56:19 -0800 (PST)
Message-ID: <fb65a7d2-5656-4659-bd96-17fc5bea2b84@andrewgigena.dev>
Date: Tue, 10 Nov 2026 23:56:13 +0000
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
Subject: Re: [PATCH v3 6/7] phy: qcom-mipi-csi2: Add SM8150 CSI2 DPHY support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <C4VI5PNThYmwD0VGOO9DvvHRRydBUz2k5DOLjkianYgYaz4G3-El6cDpnQh2siR4mMwjeiL4_Yp2xEAYeJDJ2Q==@protonmail.internalid>
 <20261106-sm8150-v7.4-rc1-camss-v3-6-0103e8a0bbcd@andrewgigena.dev>
 <88407f72-0c6e-4e46-b97b-7031c237dac7@kernel.org>
 <83c6281f-1887-4481-8c63-957b4bc856b9@linaro.org>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <83c6281f-1887-4481-8c63-957b4bc856b9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bryan,

> What you could do to unblock your series and not have a dependency on
> another series is cherry-pick the necessary patch.
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20261102213936.1251316-1-anusha.nandi@oss.qualcomm.com/

I took Anusha's approach and dropped the dev_pm_domain_detach() hack.
Single power-domain SoCs now use dev_pm_domain_attach(dev, 0) and the
loops check for a NULL pd_list. I folded it into the PHY patch with
Co-developed-by and Signed-off-by for Anusha, so the series has no
dependency on another series.

On your other points:

> Is there really no AHB clock to be listed here ? Seems again suspect.

There is no separate AHB clock. The "core" clock is cam_cc_csiphyN_clk,
whose parent is cam_cc_cphy_rx_clk_src at 400 MHz, and the second clock
is the CSI PHY timer.

> These are not the correct names

Renamed to vdda-0p9 and vdda-1p2 in the binding, the driver and the DTS.

> But why ?

The SM8150 timer RCG only has 19.2 MHz and 300 MHz. link_freq / 4 rounds
down to 19.2 MHz and the settle count comes out zero, so the rate is
pinned to 300 MHz through timer_rate_hz.

Best regards,
Andrew
