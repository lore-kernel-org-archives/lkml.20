Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170CD47127D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797146; cv=none; b=rT0XyBJ+VJ1uM5PbKAuKBagB41PHcIklYIEj5CflStN/S8j0PWBFv4KLNr+2p90HfIp1nARNMReN7lVcyZcyxiZnxqOXYo2p/HzDMtrS+5zXpQJbtei5IBke8mAjXrOXAGRgKEUABjgNzYMELJszPE8yeu6kOZrFZzGMHKI3zUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797146; c=relaxed/simple;
	bh=8X3SScqloDoU9doUNCMRe6VMSKwlpIOqyN97cEzWq3A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hrwOV8kLIKum8ynvpNRfIcavdK1LWQZQobXf4sJQJuGKgdjCbQForvaKCJIEhHQash4bbNffQ/oFwyKdJKAF1+Gl2Ml6dlgWpb1mKcLMBENR0MaISpoyca0mqvaG8N/cSA6/M62Z6lK6WpGxvWVIyuyn6hfdNGYWboHS6JkUz0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yubNWoOo; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yubNWoOo"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so13500315e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791797141; x=1792401941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lk5ih1jl7s/qnH8PsiY7GfNUNgydrjBFZI1dErLjrRU=;
        b=yubNWoOo8Eh/x4T8H06CR/F+rD1eweFIIJQLahDIcgG27OqAh9EOmOg6rcyWwBT9H7
         iMqaBBNxNPozFfAWOKoPoIidldzkB5Y190nm8bmJoKaiS/eGNOGDWvJcHvaq2oVcyndc
         ewBLpGOW/y8vx28KC2FReYPRW9qrFPeUp1OB1czSm4R6ce/vFt+ZtMSX95Y2wfUfweeY
         GyPqtMpO2WGLZC1vsSRbynKu4XJrZoXVHSzIIKKgKuJqUI0XgIX1ZTeGQCgQdXROXqfz
         Y7ea9bYxTTYDrr4C9rgsctL4pmu8CUTOboVtKbyxvPCzA2BY2kTWZ5bcuyt8A0rS1Wzh
         vNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797141; x=1792401941;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lk5ih1jl7s/qnH8PsiY7GfNUNgydrjBFZI1dErLjrRU=;
        b=jPIBjsMlJaeMT3JvynI+sN6v0oFoRfu1RvZvyuE27I/+1V12jF6C3Qk9SrIo0icIo5
         f/lbujER9s0/0Tlk2ic1amAoxnNWKwakS2BNpvBoqPCBcZ5upTmRYSjnvGop6ltIuDcV
         NnAY9HIIULTeb4j2NldNaggyLa+ZTi6zvY0CELSgrYQ4qrpwYMqnezsMqtuU/DiyYLLF
         KX8g6OoAbDXRrB6XlXApPWFRVl38j0FqYW9RDdsYb7L+nTHNMYNkJc97RVmlqgaYQ3sN
         IaZ+Ya932yncp4r07mmFQS+R2Ue1NjRJN87XtsyINOmZ9p8y4tFIsK8WSAIYRhRkpap4
         OzeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfRAUODwjhV3dRJuf2KlpQoyCGLr6n4M0vJqN6imKDOmRlih60HQB8BXc2KojN7VWClXhAIX7Euq4ytkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfoFtBMWr5GQBGv//hVlQbCDP6CqAK71KqQ7Rt643K50gZyePg
	SUS3poJ6M00HZqc2Ke7npS/CA8WoxsOJF7edYr+DklpD0QP9CLqBnE5aus7+xI3ESgY=
X-Gm-Gg: AYBFou2X+UovpELISs/WGtPkGr6bMqvDMZmzmQCWjs3HHFtpzTnScjL13QpVmvmSxnn
	qnCqZuxahXW/ux5y9i3qXkq3BFnDWPVg+sxf16x7bDSZ6Ul7L6tVXgKjOZnc+ui/TbEbmlbPH/R
	1PU1QMVbuI3Nwi+U/EV9It/686jRFClOlrUOhC6RYc1cfItan/MFtutDEv/yrCd3lSDNlULBbSq
	LIMHjW4pAS3vhmo9J6DRVM+3OSuNt6mxaa89Ueu4FhkvJxh9l00VWU2WWsduCoxBolat8y8eC6H
	EBHF6VLotAnsK1qb9NJrALjdG7x4/PPA04uQ5oIePN/u8QtvY9NyZ0no9SWcsSSGLqRg0zX8WCK
	/u0eG4QA+R16zCrF/fMvjQ8OgrIBgbLX+F/rOkRDHsWoaOh4a0C5zV+AfZYw0zpQ8JHGinK4iWv
	VXUAyj+6SXWa6giutQ483ZGMVt8/a9ABZVaAUsHpOQETPqQisW10YGEXLp36OOpp9/G4fauh07Y
	fKgxQG4OH/JRjd9Mvp1pegJyahLlyCr2J9wz+Qgq5ZCUw5AIOs=
X-Received: by 2002:a05:600c:674a:b0:49f:f0bd:1e40 with SMTP id 5b1f17b1804b1-4a18e4afe9cmr153244585e9.23.1791797140983;
        Mon, 12 Oct 2026 02:25:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:417e:f4c4:5b8:8c48? ([2a01:e0a:106d:1080:417e:f4c4:5b8:8c48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm345518685e9.4.2026.10.12.02.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:25:40 -0700 (PDT)
Message-ID: <255fe08c-8d58-441d-988c-9145f0995c6f@linaro.org>
Date: Mon, 12 Oct 2026 11:25:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 filipp.dunsky@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
 <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
 <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/26 22:49, Martin Blumenstingl wrote:
> Thank you for your patch!
> 
> On Sun, Oct 11, 2026 at 8:31 PM Fil Dunsky via B4 Relay
> <devnull+filipp.dunsky.gmail.com@kernel.org> wrote:
> [...]
>> +&eth_mac {
>> +       reg = <0x34 0x6>;
>> +};
> Question to Neil: should the eth_mac node be moved from meson-gx.dtsi
> to meson-gxbb-odroidc2.dts?
> Odroid-C2 would be the only board using it and u-boot seems to derive
> MAC from SoC chip ID/serial number instead of reading it from eFuse
> (so I'm not sure about the status of MAC address in eFuse on most
> boards).

Odroid C2 has a custom efuse mapping so it can't be used on other boards.

Neil
