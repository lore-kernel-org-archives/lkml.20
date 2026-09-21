Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677993AFD16
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027973; cv=none; b=KjQVB3bd6CfhWBcV7ArR/qFaSZjPTj3IS2O4SxtIxjdSEFDHPVNmRbxpf1oGjTfJgrDgS0UIUNqRM5dy/9ceo7h2t/bN3e2IGRNKcmNXeSfld9V1RzrM0F34S5fbrHbIuHIO0/Zqiqrc/PbQiDG5MkjuLQ2ANV0I6AX45lCTxGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027973; c=relaxed/simple;
	bh=TRdeNXfR3TBad0tHP8EChOJSQIYnhe9sNy3UDCObhoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyIyba3mUl95knHPOQ9azkJnNyOOZnduv57w9FpdG2z6fVpkbau+ihpkqUCcGKWjJ9G9sJUOvaQ1go7RUPiUMv32jlJJi1tUAlcE9tX1HRuCYpX2G72aI3kv//sltrj8zzW/jzKsU79hJ+eUbndtVJH5hsoqnqRDJqYq9+ge5hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayPDLsRo; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayPDLsRo"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f55efe7so525456766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790027968; x=1790632768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TrkUPYLMl9LKtkW3M3SxTjU77noomALRO+sF6HlftGw=;
        b=ayPDLsRopvwm7v8XOJzvBPIXF+4TUimTRxlIGy0COADfk2h3ofKrm1qY3feLdOegZI
         0v8W7JJ2pM/7eiAcsS30ofOLbW4DgLHMcWJzzKBrweER19LPPtx55Afy2hccItcxNKgB
         L0TlXqqz0X+NIIS9c/d097MvZjnjMU7LEg6enKPx0NYvERJu84AyGuPGZm5Vk6I2whRE
         t+bWJ+aKFb9elLwngJAKzaTiYTqaHA17WVyEaCWa03aJiBtX7H9Di9Umg8f20dO+JvJv
         lI4YhvsEh0qqcPNczgHwd6+IC64jd9KBVSN3SeEaxD4hg9dHDOy0H6P2ebLAWN5dBgk9
         sdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027968; x=1790632768;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TrkUPYLMl9LKtkW3M3SxTjU77noomALRO+sF6HlftGw=;
        b=A5ud8YpZdOq2+ToHcPcsL4gZ3gI2ocA04q4HF25j+fKjxDGQYXNfmm03O6pm7gnZ8h
         YLyI3hcyku9B6hfS97eQ5ePkKlQtuesR+tKKR6dQSJITDQcYIGmcEPZnHRUr2IDo+DfE
         S8mYjo7ms/Yjuz9T8O4+KpnsTGYJ40YnTctwsWRKv38yEm9DX3n/9eHD3FWYFTMuIoKl
         zDUEVlb93Lr1Bz7ZIuvL7+VJSythrOhMhKDLvrcwpohoTjaeYH/KspRmuj/z74JltpIf
         VMTwiwSE4y7ra8MGgW1sauXVPyNRB1+2STP5HotbvlQluzNc8lIAHH2P07g+RN2wm30O
         BDPw==
X-Forwarded-Encrypted: i=1; AKwUvBzKXsVhHQCtM2+Hg1Yq5YAl/E2l7RqNI8yVzYRUEBwvl0HnR7SVawq8IFPT4IH6TmxuFWw+ZiGpBhNjmuc=@vger.kernel.org
X-Gm-Message-State: AFuF++kW4CUxTVBlzU3ea0Y26nrDqYXsNcxEYFUvz4JhzOfJqkAdns4b
	B1aBqKHQd2r/D/W7LaDm16CMW/5A01ra6aw7fRNoo08OCyG55AOUSYB/
X-Gm-Gg: AYBFou0LTH2T3tAp/LtEckiGlXEXyoy54k93xbVEB2hlreh1Q/fcGtG5knp/2m4qHzf
	VL65ddbaWGBTkGe8BMU7juE4ZmTIdo6IvD+wG4CBPN3zjLm99ykNT0oONegYyj8ZfX3ljzJhtSd
	BQyeLU1m+sMs4sgC4wQpU6IHC0OOBfDIvcpyR9BtmGbj80z4riovpO5VHgmtcnxI7ZXB2GcdyYc
	1Jv1OUno2zY8Y9dHda3GizTLmoXA1PSOC7uoTIXF++UpFYednlSYrgP3NwS6I50n2azgncDM4hQ
	ZsJJ7C2d5rCgfrqqlEh4Tu6bH5+ENi1JSTVkQFdH/jXM2B1SgbtLWA6leB9RqzG+oxQym+7DFSt
	xRvNwVOf/Dup8kUBug1v6rkxNCYz2aSMq5ZRa7fzM3V4odjzME/gl/r14I1nWPClPM5HmEIRFCY
	2Gq1UM6pEfd1+xRf8c8P9KT3iXmMYy5AsL7AUKfazLz0XbUrE1/jZ16Z/EG4f0gqvcTH2Y7sZyU
	1hxWy4oCXX1643E+fQDKc6J9g==
X-Received: by 2002:a17:906:99c9:b0:c29:61b9:7b3b with SMTP id a640c23a62f3a-c2a15829440mr1024592366b.49.1790027968392;
        Mon, 21 Sep 2026 14:59:28 -0700 (PDT)
Received: from [192.168.33.7] ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a962c814fsm9185866b.34.2026.09.21.14.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 14:59:27 -0700 (PDT)
Message-ID: <7980fee5-f70a-426d-8cdc-d51e15323852@gmail.com>
Date: Mon, 21 Sep 2026 23:59:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 1/2] usb: bcma: add regulator support
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
References: <20260921214133.16519-1-rosenp@gmail.com>
 <20260921214133.16519-2-rosenp@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20260921214133.16519-2-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 21.09.2026 o 23:41, Rosen Penev pisze:
> @@ -411,6 +422,14 @@ static int bcma_hcd_probe(struct bcma_device *core)
>   		return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_desc),
>   				     "error obtaining VCC GPIO");
>   
> +	usb_dev->regulator = devm_regulator_get(dev, "vbus");
> +	if (IS_ERR(usb_dev->regulator))
> +		return dev_err_probe(dev, PTR_ERR(usb_dev->regulator), "error obtaining VBUS regulator");

Did you test this for DT without VBUS? You seem to *require* regulator. Shouldn't you make it optional?


> +	err = regulator_enable(usb_dev->regulator);
> +	if (err)
> +		return dev_err_probe(dev, err, "error enabling VCC regulator");
> +

Can't you use one of devm helpers that get and enable regulator for you?
