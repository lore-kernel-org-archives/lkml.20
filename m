Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC94414435
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720651; cv=none; b=C0DgK0oTHHT3tWZDLpNUECjhcObRoX20I+gEzhOayaGhKe4qAUQ3IKyPBJYGgMaQnFYBdAzPT6L5nSBFCF5ZFS+WmrpqzX7qv/Nqoak+rPOn2Fpg5hWBeDrksTN9mjkjjsPEY2eJkt3qZmXOtZX69MwZoBC7+v2zzxNcddevccQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720651; c=relaxed/simple;
	bh=Uxr4WVyD/DNS/detS6ug+v7NOvEjI5JJaJV4V+VWxsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpllaAOKsYYxu2B/uOQ86v6S2n9Wtagrwri9Z/wsaSfb5uvGfvuFkmYq7upsi1tLpe66OV8pEffAE1TZNSQXJLlhP4iQr6lp6LMVJmhRSBTCWCDaKzot/Q5DZIHXkdG/H0sosyGNWkpDzEWoHHx741au9T9ItcoKABpNfSqI3M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sUyKAVm5; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sUyKAVm5"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f70553dso61151166b.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789720648; x=1790325448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EsGHbbePiTbUM57NiqY/i+2M/82wdnf8yfJzQr85VmA=;
        b=sUyKAVm5UpfIhhx75ErJhS6MhdSrfjRXsde0yBrmtZLPEhSOoZwsTSeg2sPetwzmSS
         zFDuCjaOq2pfNyh0hC1OWHKqPxYyh5Jf53eCycmrOTuDBreFIljsoVmr98FFBpKBftkE
         dVPzK2Jg0MCAGFcU+cL7kYUvP5E3Re9QxSNA9+P/F4yo5GK53Up9tnhah2OpIna1ZYRX
         JthbQcFArVC/Pmnc+4ANRjvUekvp65CzP1/3xVZfjXTG85PrTvTmuv6Me7DfQYG3g1S+
         uXZKj+0eHTvrTYK0NSI0RAkp7P4GsNJNjunmdrh78Gw51scMd6otBM+8jYoCBR08b1yL
         qXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720648; x=1790325448;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsGHbbePiTbUM57NiqY/i+2M/82wdnf8yfJzQr85VmA=;
        b=Z13prse4rF0SFKWLzQTg1+hdfI0gBReztMz2eh53uB/BM8RqooHEQnC/ZWtk7XvmUL
         Wdvny2rJgw7+PYrlDhClWp4FQYeKz2ObXIP+Y/AAgYowFJoq4vu6wIYOmB4nLBqy8o1u
         OSeasjwoV2WgXfby37uduOCjKdl40wTQKZWw46ONzX1BmfYr1T9E+O4bK57VPaKcO9IT
         7Lf1iUKcOU6Z0WuqhFWXQw+YOT+2F6v+UE0y+ZPKY2xBmTvb+EAlMZ2QQ1VS19SfAcgl
         vL4V3ni3IOWMlRiKspbrqKEOqXYSQya335o4RWqsYtV//+fpiH+9nuBY97eNvxz+ns6G
         /yiA==
X-Forwarded-Encrypted: i=1; AKwUvBxC7xII/QFD6YT+TOnC3H0jYjPFOt4glNYvFfEPSSXc7lp2j2vDjWNkSX4VPdyZaNbJS2UkOu6xnZz+Hzo=@vger.kernel.org
X-Gm-Message-State: AFuF++kUBHSoeL6vA9LjrOoRyFGLwIuC7w1rg/+K6Kp8LuVaaRNZW/FJ
	YsP6yyHwiiVcGPPyj3Zsse/aqLFmqlvOKJPpSvWjCJvZPhG3nTwChvkPPq2l17eZrN4=
X-Gm-Gg: AYBFou18WBeItBIkQQYMOw7crxU6dmlMlb3iN5c8IRimkCzE1nnu5o7fQTtTTLzQZ08
	VFOhPhkIftU5E9F8i4QaFXpMKUmGoJbTFqatVbgt5LaKMkVPLyu/rg8V6ll1ViAtVH2BpJwccOg
	INWHkRwLaz3dEDuXyi22ROkfzxIrDEDuesy5R7o85Vh9sv1IyrlAhYhtrdT24JTAPscAVhSiaDM
	YBvblbtoIX0snDfEcAGazjTLuEdlArwt435fhHsMMhbr2EiVjgeO82K5VhJU16Hj8gZGr+xtTxR
	uSs3tEQQ3ESdhrPotna9Gi01xHpVdy88e4lcm09c6pe11pDlpjHxVG3ERqlDTMKK5taatFiq3bj
	eqLBLgQPrauRRIxPN+ZJgn3DGKpVZXYp3CoJD6kj8YhmOy16NsjekitXiafmGYBh3O958CuJZiY
	rR+JzV9+alVjelBxq7FH6PSylokrI9P8MwgmHbKLhBtR1Xa8UsRZZUX9sSfYAnoXz1THeqX0oCf
	LlTkc3/KA==
X-Received: by 2002:a17:907:1c1b:b0:c25:62db:772b with SMTP id a640c23a62f3a-c2a15846850mr191330566b.7.1789720648074;
        Fri, 18 Sep 2026 01:37:28 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.4.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6a06sm32784166b.53.2026.09.18.01.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:37:27 -0700 (PDT)
Message-ID: <70284db7-a7d9-48a6-acdd-7a9850cdc7e4@linaro.org>
Date: Fri, 18 Sep 2026 09:37:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 0/5] Add phy_get_by_of_node and devm helper
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
 <cqoquu7hzclx54km763745dupaxahv7y4xbzq7vxg23isptgqz@j6los24mhnnn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <cqoquu7hzclx54km763745dupaxahv7y4xbzq7vxg23isptgqz@j6los24mhnnn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/09/2026 02:36, Manivannan Sadhasivam wrote:
> Looks like you completely missed all my comments given in v17 :/
> 
> - Mani

oops so I did, my apologies Mani, I will take those in now.

---
bod
