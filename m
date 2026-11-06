Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964390;
	b=lq6Mr0fPfFVQ9ytOexPdU9agbyeLbEOo7hqdo8wnHOxIxSNa/53DomwLG7T2b+5d6T9R
	 wfkAuyWmZuBbM2YqAZVxcnXrJaTDPpTDKGA0hn8y0lAEj2vRXDcMn43Cx1k6cw4cnBThh
	 VsQzOdlBX+MvG/GBcIaGwFO4laQDigUHRYkeMA5uvSaer56oGLTHQJfvCyN00et8//FGS
	 PD3j8UJX5rN9f3pn19RUul4saYmLOtkw/+KDsxeMf5Nv8ddyflSjeOVeGBDv8cJPRAyde
	 3yeVAOGkTE2lrZgyPFyKptgbMwPTLR3OMKqJnMQwuuCzm48TXcQ7b5tnAXzLw5ob8DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JIN8oEdosMaUM7J7IKPgHIHkvQbHyBxozoGEFLEDHOg=;
	b=G0BpyKCSTsUy8ZERKEqGIK4B5GVIaioWTYWeG9XmN1layhqM0HxuMY+Llu+reF08mF6Z
	 ta8D3E2e3yZk6bDmbIXV2oiqkkwrpA4cZZJzJ5ScrGRX9Skq8QK1p/94xZ8aB3tOvxKHR
	 TswHCz0lURlvGefVj2Z4C3LBtJsOpOwwkRFQd8N6NMBy6M2kkLRHXO7stvRJCyudnT4RW
	 Iki+bS8aM6obSn54rss3hmaiN0hUYnrzWRBLNdhPX2SVvnM0On7kiYQy0ZktdSTaQ/Z55
	 oX+gSI+OIm8RqwzwbPTE3+8A/TsYuPV+t98eVGWKua6hMIjgHWBEtOBZy/tbGQrLCBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=opUqJAWA;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E494606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E494606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=opUqJAWA
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491846221ffso440873f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793964388; x=1794569188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIN8oEdosMaUM7J7IKPgHIHkvQbHyBxozoGEFLEDHOg=;
        b=opUqJAWAOya7CeKLUFeRUpto0xhDsHDE0HohVtyIZnuUT+wiPe4cORcwLddq3v5huy
         i9pGZ4OqYg6HndDaZqJmJeiHMZxsorpAMu860/wKTG7jmUDZwZFMb21qzEfUqDhPRHdB
         wjgK5PPTSFqeFOVI/OkI0pg1Hf6EEUS+XwWDB7brg/tpwo4MRp2+2iu8CpUB2WynFEex
         NSNn5adlK+HYH8TtofdR2pDp8iRQ9QCMWtk3fFoKfJkzsbo2JN86EjBX51QXAZfEJqKS
         B36XSyIS3N15WdMNs5DmDNZNNYh5w6CaTX7o76QRuGcUTqhk9zNOqmfNd81CkTGX/w+4
         HhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964388; x=1794569188;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIN8oEdosMaUM7J7IKPgHIHkvQbHyBxozoGEFLEDHOg=;
        b=jGnt6Sks5HLVa0y+Qrl81+GQtVEiF4LUihYsV8hZKoXBxXs4jep3yNBgEq6Xy6Txsb
         DtQaCwTC6CvmlVf2XrE/yc3voFt9tdUDCSQ9Ts2dunZPk8hPYJJtGTF1xAmSUkxvTGM6
         kChu43WfXdkqoq5i4x6HEd+hzgtmBScnrJj8KcLOtJIop8XEX2AN5/qZ+OhiTTlZjU9P
         Dkr3a/WNJFIPtQeDPHDf8sEZveLZKCimgzTMo3Ulv1nrwL6UzacMcMN2kqqj7fDRoZnS
         UZ+52MfecIW25ZO2y7YYdn5IA+2hF7cC/I+Lr/TfQ3LR4sUyYR/WDVaqpWCATEfx8tJB
         vHNQ==
X-Forwarded-Encrypted: i=1; AL+hErHCNF10MTzhWccE0nPggKy1d4bBrje1VV3WM/4DxLYR+TyMVMBfm74Q57K07xlSK1bGsedTWkdI9WaZtyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nnu2juSkQmSfr58fIeX5xg0n5QQzjg1LX/1shawSmpCw29e0k
	n2MfxRPa+vs86h3kEf7RcG6/bWsQNDucM/nka0cTG9QZ4+HQZuaMz5n7wRamCVZL71Y=
X-Gm-Gg: AYBFou0g+Qm4vJn8k2HpO0ZNoyN+Pge9o23DseFHozrOXWpNeNjuEUlz/+ZT6P/+uvO
	yGllihaVDgzV4zMQREOVRIGkEkYXVsrNb+mR4wkAast6Zt3pL2lI0qm0yRhP+lR/S5eykqRnSdG
	E1qlnuUE6IvE/IOcLobB72pZiYER8ysJod6Ar5OHHnu3fdtX6TPcBLOzOWGUvHBsj3PQvFvIP1o
	PhBPrDAkLi/wQXEciXIN1cz4pfaHlSZDkUw2ZKVgSV2YHGwd4/BQ3anwIVvrIcVEsTvnYBwV6bF
	/NiiiQikoDGGH9sF/MY/igu11sVbpN8S1dzXPVnYDdGUUiOqW/+tcveLH6vHRjTfQ0jIO7OPzkY
	QdrEmTfC01cNOzQ/C49RIqjzKTyrExYe3bz6cxU+qTiv66MLuDqDAtNbCB8IeuTnfjH2zmwyQKs
	/InR6roO+mgfTJQuMt2s1r4O+7VUcOi3Bl00VNkkE9Pm03kXlsLkjPjq3T9TEIMXpQruN9G1UWa
	Vw4gu1ZM8fme5AB7VPKpbAcoJNzLHBGRKS3vRBxoe9fadu5T+LEHuSyG/FqIt8j7hc7Xfs9Z6sV
	X9PKZ21bOpRYa2hN4HYiKN+p08AfozxxLnn4qEltVw==
X-Received: by 2002:a05:6000:4685:b0:48e:5e1f:9a36 with SMTP id ffacd0b85a97d-492778d1fb7mr3239346f8f.42.1793964387965;
        Fri, 06 Nov 2026 03:26:27 -0800 (PST)
Received: from [192.168.0.167] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492ff85585esm2390286f8f.5.2026.11.06.03.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:26:27 -0800 (PST)
Message-ID: <ac2e970b-1f3a-4aef-9a84-034d7e460c0f@linaro.org>
Date: Fri, 6 Nov 2026 11:26:26 +0000
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
Subject: Re: [PATCH v2 3/5] media: qcom: camss: Match VFE lite clocks by name
 prefix
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261106-sm8150-v7.4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v2-3-39ee37787b00@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v2-3-39ee37787b00@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 03:24, Andrew Gigena via B4 Relay wrote:
>   		!strcmp(clock->name, vfe_lite_name) ||
>   		!strcmp(clock->name, "vfe_lite") ||
> +		(vfe->res->is_lite && !strncmp(clock->name, "vfe_lite", 8)) ||

Shouldn't this be the case for existing clocks ? i.e. only check lite 
clocks on lite VFEs ?

---
bod
