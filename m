Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744454;
	b=aDY/Mqi26KM6FvoSg13M7iMXKECMXl+iDHQeYLdOEy1IjblUOlhHGBFUyx88GB6d1mXg
	 QGmeUY7LbOrF5lonnqN+/Nlhx+zWZ0IvT9ffagB0Bftnx6MnHWmxQp3OB/q8KnBJxKzS1
	 1J+vAfCJlRFXHOadqpd0AMkom7ubpYZseIM/0uHW9HQ0bXeEiMHIqVz9w3Ops8XRkirsm
	 kjunstfUSRkj7K0Enp2MJMGNt+TBvM0MOrua1xvKYzwHg9z9KjeUrP1OvR0uRfcTCBFSW
	 anayQQgT2oTJ1qO16tp2EH8Qd3mbCmpxS7VRbMJJT4BmpuEHJqkVQ22luy4sz9b1x7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=r6K5yPNLQHHB0Nog8TnybL0n8K+O6sS9uh6jOz0Z75E=;
	b=sA9sGtQ4s5x+g5mNMI95xVO1zVhbEgFIhPaR1A2VK5BDhi8iL/ElLLAyOUh61wY1yQhG
	 3qzWqxDj1+hGrB5iCRm/Yqvf9Ufs+v/LNDwLIGm+sl+PaCgU/RRKTAfS+MWuDvbrXLmuk
	 wQI3Nr14dtX1z/aTYlfG8l5SHkJdHnEN0l2pckfjFcRJ/ftTIVoi7xMN473IlnDNTzc3q
	 MKRZWi/KyKsclsd6jqqgPmfbGHEftaAMATLJ9UJ0PaLcxhkpAQE4UVSqSYELo7eccl97y
	 s4OYrRtNRTyy8lC9FMU7K5TgIkbPrX+WId6s5b8o0tgEepWM4efcOy77SxS7fYFHmzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ivnCHnZa;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73306606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73306606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ivnCHnZa
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso18147455e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744453; x=1795349253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r6K5yPNLQHHB0Nog8TnybL0n8K+O6sS9uh6jOz0Z75E=;
        b=ivnCHnZaftDoBq4Gu8kkVFXEzJgGlSRM+LgtFJVDlwfFAb/n3HudZkR736adgQgnJo
         ytYa2blxe4Py/DJASfqDUlFkMCck4XodHVmszliN+mxK1P1sXE5p+NVwnf90ghioz0ct
         5X45X8tkFPDaTUmpOO3RLQ1RZTBvOCS93yaN2xwsw5751TvRzY4y2XhuaPT1zW9IvuIJ
         cLviT9GDTLT5Yr6iPOmFHAScweTYW3K4zm3ouhq1mL9m9vmuznAgU499um/26kIZJLdo
         OvYCeppsIzJ7QBnAVNOfhlt8PxTcbnxf5+SWgLmRGkm26V3e7O2aqmyGCum+rO8SW1A+
         k7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744453; x=1795349253;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6K5yPNLQHHB0Nog8TnybL0n8K+O6sS9uh6jOz0Z75E=;
        b=aOaCHbvT9zE5ADugZalS1ndbDVKrofeeeJ3b+LTx/5mQuR7l70qe0BeUBsojOsqDcD
         WW1kNsGruHKIeUOeyoNH+EaDCObCONKmdt6YGVM0bx+kR9UjILF1tPkHd5hOJoufb1o/
         JjUSFUcxgO7JyyxeRCgenv4djpCyd0Ou7vDS1AF9B0vKSn+APIRc+/1JC6BIeNr99tGp
         X64zDQ0LyOr0WKCL3pPxmlPuwxlN894Cp39BD5SBmwyI92OjFurMFRTGTGJFGuY8kYfC
         C9MVmKPijn+wDe+5VMuktrzVwaPQREsBVmg7s37V6OdtYkqbIXWdXLPZkeEXDO5jpvpe
         Vd5A==
X-Forwarded-Encrypted: i=1; AL+hErG9Qn94Xs1SGafcXjUUvDTz6YBjsQ1M2Bn5zKV0DeS+dhUedbg35jh5pVIOWT2UyLoZ2X8WlA/qN9I1VY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z88ndZaJJUNQmGG8c+5zqhGKUl25Q2LOjw9AzGgfAGgYt0B8DoK
	m70AYU7xuphIdFWZVcTJEuV1jO8nP8dCpctMqVRzRhpMaMqjjfKruUP4W0fpdaqC0xw=
X-Gm-Gg: AYBFou10c3aPd+8lAkEQTGwE/2nJKuPWR4aTvZ9rlBm9xabam5OazgkvTNRsDTAyFqC
	MUq2dB8y8xcpPS3uefq+4xjbOwhBIq9XxKH+ddIUGefHfWPqG/ePkvgop/FcDJow0UsHhGWqeAb
	Elqm6nNWui56QsNzTqFeKmgJ5B67SwzKl92wCnw+qMWGNCfDK+X+Hd3LQmNq1pZTz1k17rpqKoQ
	maVEij5qIn6voke5kK5JcdfdoAd+aCMvfy+J0qHZ6AhsaLKcy7EjltKRjuzv544r4VLikv5nUNI
	U+UnPSeJ/N1kN4appHAkr2YYkcP5uh+gSP6RchdToZMSqvjU6ntPf/H48+iSb2QwjNb3tUyTQ4f
	3bymqvG2mTsdU2KpiSp6dJg+xQYm4GQWUX6MggqJylSuAhDj7nHTBAFVPc0hHMuuaMgLq8c2BbN
	xMoyxNlsOY82EVk/5F5zOsTf4aCMPt+gLxuiT1R/fHXJs22kwCjR71RZMD6j8+8EXVP61j+6RPK
	C/x3oZA/gesAIIyLjt5RJW7L6PepofwJZafRC3vy41H6TJcJhUqYYg7FlXjaM361/y5th1a/d51
	UTS9w4YB58ihMnyO6091b9kL+UrthMXefItRzEWty6Mh9Z2UsbLcd+JL09RbWNip
X-Received: by 2002:a05:600c:3d92:b0:4bb:6c01:de81 with SMTP id 5b1f17b1804b1-4bb6c01e02fmr25950745e9.19.1794744452736;
        Sun, 15 Nov 2026 04:07:32 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm189440575e9.4.2026.11.15.04.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:07:32 -0800 (PST)
Message-ID: <d4fcf0ac-571e-4d3e-ada6-a732d68dc18c@linaro.org>
Date: Sun, 15 Nov 2026 12:07:31 +0000
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
Subject: Re: [PATCH v7 17/23] arm64: dts: qcom: sm8750-qrd: Enable S5KJN1
 camera sensor
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-17-8ff2a11835f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-17-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 11:29, Wenmeng Liu wrote:
> Enable CAMSS, CCI1 and CSIPHY3 on the SM8750 QRD board. The S5KJN1
> camera sensor is connected to CCI1 I2C bus 0, uses MCLK3 at 24 MHz and
> connects to CSIPHY3 over a 4-lane D-PHY link.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
