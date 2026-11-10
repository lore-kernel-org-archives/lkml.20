Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354734;
	b=i8wJTDWC+EegGQ8u0SHcC+NBVaLtpPqmdQqKfkfjkn1HDRp9yFm0Jf5OgI/MhM4yK4FZ
	 9mbrl15sDRTKYp9Zxccq6is33lsCj8y/QgfZt3VG/NS/L7iv6HxX0JteUnD1jC2F+MzB/
	 QgHqhmCidpq+i7o1pkqsPzPdFxMhhCJ9ffCfbsfaJP/QztlBwFo1ypb0Wi0FoaQMnsXuX
	 Gxfu3RTB7/wjATOoU4qY0ywyCk1OU3LUHkZwb72dt/3Q2dByFsznfwQ3M6vH8al8aZPST
	 CIu4Z+aRb9Nz5Z+uvRQH/wQL873O8FH/B/6KNO3PPzDGmQRfEgv51Aq0Q+52sK9RuWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354734;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZW6/d6tafc93+2es2jKCUdQztkgttkGrcDy02n1rkws=;
	b=c0zVK1756uUvguop9Glvs1QVgBIqFB39VBx2rhM7xUDla/nIZhhBOzTBMUa64llX9wfu
	 gkLrAMhK1P1CEpiBqZX+lVRcYF05bGyhaJ9hc40wiG1Uz+unyT/GDHn5QDHQJHw4cROgC
	 pNcUu3SgKsNXFBogM0h7Mxby13ANsCaws1DI3AtGRgoTp+Hy4SjESrKS21zVGxQuK3s1x
	 czvtM7LePCftoTURV2+qz7xXzoZ7zoEU7vrWeHkQ1rz5YC+Td96VOzMF/Rkc6yGzvXwFF
	 nW5BbvsYukuAEq9h7+F2zMYio8B1rcbUwRHacBgH4C+NSqVJdjD3iUEq8M1kCjl9bMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9101606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9101606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67c02c106e6so2922248d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:52:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354733; x=1794959533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZW6/d6tafc93+2es2jKCUdQztkgttkGrcDy02n1rkws=;
        b=CW9w8gC7qS5kDP3EI3/B2RtBDxt103WqPderx/4h671iEY49kY/0ZkOXB8DQnjgYYd
         /HTDilb3XXfV971rohfQ5GcjcqlQaBOlhmbAN1nczabe5M7LI1GCu1BoB4TSiVJFTzAA
         1ir09BrLhzdmEk7i879sYSCpvJB+nndxprVna5inIlSWZ20cCMrBa+0vAqJ+H1HboGjL
         Sm5i1u+XwjBEerDoon5BnAviSkFWGI30h6cWEGt6/pUvYBtMOrem4EoyxzsF9odd2GaJ
         TzwUKUGua/dKa1sQ7wQX+9RnI0md+YPF76xKknPRt7zmoPVY0fhxEhw0GNJWgdKZ0+VM
         YGFQ==
X-Forwarded-Encrypted: i=1; AL+hErEIrYCGbg8yGDtO7ntkteNuGpmINMQ99iHTURI9QJJ4o8FxmOXBXD23uew91k/k64stbzu76QFaIAZqGog=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q/Fv2SUTZRN6G8a7G9S2xhp97jh1PT+8w3z83ZZ7ykOQnhMvA
	G8mu/6xub3i5DhYlg4GVveLRXTQvMac6Z5FEtqTZ+gUG50gtfoUlFD1XB4eKYDg0
X-Gm-Gg: AYBFou254UDypKtp8OBXcnkVSDeBOWja9sv29V5CVn3FjvG2OzMYZhhKvCci0C0ph+e
	08RfJ/Ziys1128iW2sP5MX8jq6RJnPIsCthqiaJEMyqhxK3v1QdF7O3nJQ4RaXohdDGFsfUGdPz
	2fSgdNaGYv0gshD9CK7pxVkwDRohA5GOSZLvHGcEQZ8oTxs9TJMxFQIGwOCSVFDKcpaOk9rL6xh
	F/4hRsYzLOuo4zkzv01G8wLBFMjRvjagNKsbpVsdl9gJ5QojegamJTODs2+HYBKK3q9Bqg+S0hj
	uLFajcKyXozIe1HymRS1X/YS6K+dRZcOTO580vCI6unxAY/+zWswsGdiCtd++srDOroDmmWtmbW
	uyBjhm5l2XBy+YisAYiMJHbLWQr3jrHQn7jQBUAC/aNAT0mJIoQ/+lsyAseVJIUJ9Ju32HyZnL8
	NYsl6mw8EEtO0W6s7jYwT4T0pj8EN0sZtOJDn+9+5v5CFWjauvkwaYj6zGA8UaUxgX3ChM7vEeJ
	NSmqa8ZvNMeEK0yA58bzzNAFB/9oQaebkKSv09NJP9G/oai65sjRfQ3zq2K2oxPuHHuLPQKX7Kz
	4B/hthKh949VUx05EJaP42tDrz1od9KTzhHC0HgFO9iuwtApLTamz69gCWpnShpzYSYHSJZ3
X-Received: by 2002:a05:690e:16a1:b0:67c:17fb:ecaf with SMTP id 956f58d0204a3-67c67ee4a9dmr690322d50.26.1794354732657;
        Tue, 10 Nov 2026 15:52:12 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:2f77:7097:372d:6d14? ([2800:a4:806:ef00:2f77:7097:372d:6d14])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589f065dsm3149000d50.16.2026.11.10.15.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 15:52:12 -0800 (PST)
Message-ID: <f127954b-2255-482b-aa3c-cedd2311f77e@andrewgigena.dev>
Date: Tue, 10 Nov 2026 23:52:03 +0000
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
Subject: Re: [PATCH v3 3/7] dt-bindings: phy: qcom,sm8150-csi2-phy: Add SM8150
 CSI2 PHY
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-3-0103e8a0bbcd@andrewgigena.dev>
 <a9ab1add-5f04-4687-83bf-ca29a068ee33@linaro.org>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <a9ab1add-5f04-4687-83bf-ca29a068ee33@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vladimir,

Thanks for the review, replies below.

> Please double check if SM8150 CSIPHY v1.1 is capable of C-PHY:

The hardware can do combo mode, but the driver only implements D-PHY and
returns -EOPNOTSUPP for C-PHY, so the binding stays D-PHY. Would you
like it documented as "not yet supported" anyway?

> D-PHY combo mode is also supported on the SM8150 CSIPHY apparently,
> it shall be reflected in a way that two endpoints could be present.

Split mode is described in the binding, but the driver rejects it, so it
cannot be used today. Is it fine to keep it out until the driver
supports it?

> In downstream camcc-sm8150.c, PLL0 is on MX, and PLL0 supplies CSIPHY
> clocks. I believe MX shall be added to the list of 'power-domains'.

You are right that PLL0 uses the MX corner in camcc, but that corner is
internal to the clock controller, not a power domain of the CSIPHY. The
PHY only consumes the top GDSC; SM8150 uses legacy GDSCs, while on X1E
MX is a real power domain attached by the PHY driver.

> Still it would be preferred to get 'vdda-0p9-supply' and
> 'vdda-1p2-supply' properties.

Renamed in the binding on v4, the driver and the DTS, matching the X1E naming.

> In general the change looks good, thank you, but likely it can be
> embedded into the scheme for X1E.

Clocks, register offset, power domains, lane table and timer all differ,
so folding it in would need if/then blocks for almost every property.
Would you still prefer that, or is a separate schema acceptable?

Best regards,
Andrew
