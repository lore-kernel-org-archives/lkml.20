Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CDE31D366
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929821; cv=none; b=oqa3bzrphvr+QPT6Q/q31DoY3C14I770N/AFr4i2mBhUclFa/Nw6JvgpfZvhu1ULFveC+lNCDR+HZ201BKGRFXqP59KnwoQrCPnT+1rjQC4YIQ1c+p+i+nKJERzAmxzXx81W5v2l93xFRYL4A64A1GbuDBM6SDSHWQ9MQNzZXLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929821; c=relaxed/simple;
	bh=mFtxl5/Gm1OY/mivsw46cQL6dbR00tCDJXGvVeL0WIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9prTByb4VQmoI0Jaj3Mv9DaC2kV8bF6KTKJx7zLT2Bx/rwMhh4u6GfBKeLNmHo9eP2p7jJMRe4NnG20oLau57CY06bXGxXjx79Zf0fwZwbDtUDooWWY962x+XTQ/OTWn4PNvMpdg3blspQlKVn7jWizzv1xmjbARIQaD/NPG5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BU1obN82; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BU1obN82"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae7aa02cb6so2494250a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790929818; x=1791534618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZJ8EqEzCSNGuomB4HNPiazOZ9EdB5EupWIEnORPY1M0=;
        b=BU1obN82sDQj+KexCu8UfYH8EApTXDLy+WKJzmbAHfQJLOb0LMd1q1ryhIqmO2TCE8
         cQGrhRBvrOHja/J1FTvpmGLwu6ElPYty4OX8qgycw1FI7+YqTIVVODyoOR4p8CSnSXZ1
         LLX32KSU4RtarijYLah/Lv3y24TDVE/EgA5Li3kKJ/KPbl2ucD6INqobuTD2Od6rNYIi
         WTwHTXecjEnNF4M8NRwmnsWgmpLkicwcp8w8iMG56MWxT4gHCzVGfNEIEWN4vSP3bUbl
         UFT40h92CX8ApTo9hj+BGRoThmZ5Redj0uu/zhOkBImRxrnMnGyjIDgqC8OaYlPQO7jq
         +eoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929818; x=1791534618;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJ8EqEzCSNGuomB4HNPiazOZ9EdB5EupWIEnORPY1M0=;
        b=LCrjTpEluxZfNR7NU2nc5WLEGRG0sQNXJV/kFQFkx5HNp5WhZrEx6H2EEeevsj8RbB
         60NgW9QpJBwUNgFKZ79ugbRKrwI8d1v6eKG/qyJ4KFFV9OsB0wSechNopUOkhhy++vBD
         k2gMuJCrRzkdMuuyTkyPviZTbkdBTOXiQEx/c+uKx5u5eKxVxlwcOKEqKzGu+5ymjhDA
         UsQJMjfaaj30/AwRLzg+I1zLz+8SjHLkKz8pVvfJ1BpRWKK4qL7D842Mh7LBO2aLsUaC
         nWX5e3sXl3kF3KO3MuDMRu7tRKG3b7WZK+LCCzfIFpJ57zEZoJPHQkb3WxA4YlQFLJ2d
         wRjw==
X-Gm-Message-State: AFq9FYKsMTq+UmGWd862qAqQQTvIJreAYAPrBsODcWklA3uu3NN6XHLC
	Fs9RXNdXmHbw9DcE/shIK3nvTu+o/H0FLLGe2mIYwxyF6JndvXFFvfOpHNrKxKrY1D0=
X-Gm-Gg: AYBFou0V9Clh8XZQ/G9XNfGllwAycg9rrOe/AlGwrfz2/Dzc16XJIP9fB5y8E2kJf/5
	CE0gMZVqAOPT/paoahZRZc+OTwFkXAgU+OpfBNKl/qAu3AtbILs2UCaGs+fP/5mtc2l8ZBj6inQ
	jW91Ll66osKIp9OOben8UtJO8XF3cyDX9KQZo7QG5NIsxFGoWROGqYQt3Hp7seAxi0QUjo/rabW
	GLAT8At8QTIZTHr63rC03lmQcy9Xmv6kulZQy48uI88aBsU3mWY7lWgf4V+2lF6FX2tm7fd+COm
	wjmncamZ9/SHgIEgWLehy9Z6aSXyGu9EP/dA44Lz3Xb88F6aG5ZD5qfyRwOQDLL3RjpLuW8gTVo
	Im4BaHsb1RGYKpoz7Joj33BroqxVTK7yJlmfv/bpxtPR9vd7eRV9Q8lYYpf4KEbo52Vr5pB7yC5
	jAV2GWNPfQQESb5I5eKOuhzWDj+QMGUvOePxMXpQ6NSdFXj06AefHPSJ0Rl2k/gvq4X4pmw031B
	9QiNlO7Kent
X-Received: by 2002:a05:6402:27c9:b0:6aa:f0e:a15f with SMTP id 4fb4d7f45d1cf-6af9e34833cmr1207427a12.38.1790929817404;
        Fri, 02 Oct 2026 01:30:17 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.210.127])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6af9edb7ee3sm522636a12.3.2026.10.02.01.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 01:30:16 -0700 (PDT)
Message-ID: <e76bff98-b854-4f31-ba16-7a700f286450@linaro.org>
Date: Fri, 2 Oct 2026 09:30:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the phy-next tree with the v4l-dvb
 tree
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
References: <ar5wFFE64tWhmCKg@sirena.org.uk>
 <52ef6837-7183-402d-acc6-8ca15c7e27ca@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <52ef6837-7183-402d-acc6-8ca15c7e27ca@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2026 06:33, Krzysztof Kozlowski wrote:
> On 01/10/2026 16:37, Mark Brown wrote:
>> Hi all,
>>
>> Today's linux-next merge of the phy-next tree got a conflict in:
>>
>>    Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>
>> between commits:
>>
>>    42b96f94929c9 ("dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema")
>>    a93b9de71466f ("dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Glymur compatible")
>>
>> from the v4l-dvb tree and commit:
> 
> Why were these taken via v4l/media tree?
> 
>>
>>    3b0140f37d25b ("dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema")
>>
>> from the phy-next tree.
>>
> 
> 
> Best regards,
> Krzysztof

That's my error.

I merged the csiphy series to linux-media because I had a dependency to 
avoid zero conflicts with linux/phy

However I inadvertendly picked up  a93b9de71466f ("dt-bindings: phy: 
qcom,x1e80100-csi2-phy: Add Glymur compatible") when picking up the 
CAMSS changes from Glymur.

b4 shazam a..c without scrubbing the b which should have gone via Vinod.

---
bod
