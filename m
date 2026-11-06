Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964456;
	b=IElBjtGEpjktsc/cu639FM0e9Cq92PJTdEBya+4OmiOix/LW3iDS8u73fCk0PATkXUTj
	 9Gx6TL1KM47EQc8omiNShe8WgbryxxszAPXlOzRIP5YOA5PEczpBBWIEIkLm4y4Dtg5ul
	 4W9cDD0Y14Gre6afbSmYo1N5tzax7Y1UITq3a8gPB72OHqW3kktYA1O8pOjy68tj8ot7g
	 3j5tECbZ5y4egS+sAirDyqW5nrWomC33Y+y3RRwTVtGQ8fiseEtyTF3ncd0PgYLG8D6hT
	 boPV2Ivl5O3jRl4ClGC8PfJ0qrXUDdrByOPDh/ieLzWI4w6zlTk2ZIoItp6HKo7gJpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=GqsfXmArDx1BFEFrYigXSG4u66Q+cf083qtsOl4mkRI=;
	b=zWyAOmcAUfIbBb7BaJCG9N/Usp0YEaf+RLYmdUwpDj6C7YlcQKjLz9VZAOb//R+WJLGA
	 Z0Oje1t+ggU2D5v/jWQXKekj3dLnc61zBo3Bnr8r/aIbC5LflBozf/dpABpIBGYVrYv4n
	 RiLRlU+EE78ppa8zaRI2BH3Z/QJnrFPXwOOIFJbPnhDEQ2QHe4folhNGcD3YD8XOl5vme
	 jJog70hE7lJNqevKwG4G/oOY5HIvZ9634fetv6xtdXN71foBYs9WdV1xyBvQe23OHe23v
	 s/cq7GzOXalHwyMSo+Ymq7DUMZBrf22EOD8NuLsvrmPBR8q0vn1ff7vJUn2ISXuCpqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="zXO+/C32";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEE7606D80D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FEE7606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zXO+/C32
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1025853f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793964453; x=1794569253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqsfXmArDx1BFEFrYigXSG4u66Q+cf083qtsOl4mkRI=;
        b=zXO+/C32AlStvgI0+EYAWE2/Lakk51WyJPlKb6utiwbTK9+74CTcnXu12Wf+J/7NuB
         BdOoD4ctlP0nDHnnTAP14y2UXjeKB14fwhpho2iJ6q3ClTWXfFk6Cj7nJ3WNYSFpcTMg
         jbCSpb8ga0BL23ipmALQoFILzAVZewCiMgRMMW2zkFbS9UT+Qybk7Io3KpC7M1GZdodh
         a4QITzKhwTU1iA4HYSCnhVhpR2eMx2R+icRk2lyGDB+DtlyGJoVlMLPk2lzYyA7Btcjt
         I/jJS3hmHNXqxs01UtHPwjiHIwg+VofbkfZQOarqN7o6L2TO6HQavWc368QZ0IZdGvhP
         iBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964453; x=1794569253;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqsfXmArDx1BFEFrYigXSG4u66Q+cf083qtsOl4mkRI=;
        b=YvKSmiK9c5SueqXpTNqZKcDi4IpaKlDwGVSaBtqQsYs3NtzqlYaXYyuqSuRQOI1RQ1
         Q2lsDwJh51gciZkblfydqF8Lq4UF5XU3hSMW+Yag2Ey2DFNYyBDnPMXunaIqGaOp4LQF
         QfwlrGKtULdsrAo5iAuGMZ9xHbnp50jazmmdLzY39STSdW6D0K7hZTE+2MZPvcwnXjC1
         sana/zQg2kw8BHb/jRmg3orFkqbw4yTrJH4IG2vopO6kDxEgW+RdXj0n3VL+H1Ew3XF6
         S5luJLEjWllpQpwLCrHAWpqkwFoWqPQPtSn8Wb85yafudJmhkpwODlYofWPoXXkaggUH
         V6DQ==
X-Forwarded-Encrypted: i=1; AL+hErHZBk3+/vxWbkb6YPkybMzXzOnieKccPHLFhgxWqzfI46AYJA8j6oeOgExPtDjWcg9e7nLekz9hIPmS8Iw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PIiVOeYgtMlIqcz4UlKmBwjgMqMOklNCsw10ulrb5ywYM/xXT
	Cq1geQ3Bk8HJKxQFnmF2MpfvwImPthfm+p803Ut5HGKGgk4B6RP8gAAUaJEA0LExoBY=
X-Gm-Gg: AYBFou3jOtOaaMJ5VZBS8THLArUuUG4onA6Hvnq9hIH4ESUm/f8erzh4CES0RleExDB
	i1ScFVCwu5owDmQvV0Qu0FaKPG5j7EivO7upwnAdmNzJvkEJEr8Jtgneb+uBV/cFB9Px3MF+REy
	9OF1O9D1F2xjsMKcTqTlJXIUFBMJI3e+a7wVp7JhEOaVU9j1e6EN4nGp+J3mW49P/3Tz+HyPJ32
	kk4ZO/w1EkTT0fRky6UVI/ORZLdtWr7pahG6A8N49YF70bmvwcKAN/qzr+l98x6T9CHFIDtJFyP
	jDMa0RklcYPBS4oFHyz5CthVmW6KU1v3AZVm8iuCdiVvMLOgE8U6fe1Vno5RfYmzXESYde41YzS
	6rw7AIn/jXu6D0N3c0WCLkHJG+IKNtSUM49Du5s7xt10Al6EBVXdsY2bu+ikdcA0m4Zjtp8v4GF
	PrKSwEEIUSl/x4g6fnKgnh+HsQxif+5NZB6rXXX4vXAqyRRenOnLAZ5UaK+uZsvwDGuzsRYtLdX
	Fc6C6guy67G1aZDhY+tiaqxe39Q26EB4Diwh2WnScJ4f9BYTfoWD75BYDnGaxUnTnHGEbA72BTw
	opkaHEToFTbDJcjm5rnZBflIDC7ex8nPcdpt9pnO8/rHfBrbdCdc0ISBcFhkmag=
X-Received: by 2002:a05:6000:3c7:b0:48e:7475:fe7b with SMTP id ffacd0b85a97d-4911906d185mr9499122f8f.6.1793964453377;
        Fri, 06 Nov 2026 03:27:33 -0800 (PST)
Received: from [192.168.0.167] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d73286cdsm2941196f8f.28.2026.11.06.03.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:27:32 -0800 (PST)
Message-ID: <e210c5f1-6a93-4387-ad1f-66d4ed35e00b@linaro.org>
Date: Fri, 6 Nov 2026 11:27:31 +0000
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
Subject: Re: [PATCH v2 4/5] media: qcom: camss: Add support for SM8150
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
 <20261106-sm8150-v7.4-rc1-camss-v2-4-39ee37787b00@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v2-4-39ee37787b00@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 03:24, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add CAMSS platform data for the Qualcomm SM8150 SoC. The camera
> subsystem contains four CSIPHY, four CSID (two full and two lite), two
> VFE and two VFE-Lite instances.
> 
> The hardware reuses the existing 3-phase 1.0 CSIPHY, Gen2 CSID and
> VFE 17x implementations; the CSIPHY uses the SC8280XP lane register
> layout. Add CAMSS_8150 to the version enum and to the shared code
> paths, then add the per-block clock, regulator, power domain,
> interrupt and interconnect resources.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
