Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964269;
	b=4//qX/CoPRe0u3iDA7AhsCYgG/jZYwrRsxJMD5nSIUUkPnEiHGnWWwhQ90N5C1fYN20Z
	 y+EXSgAjpAB6AqTpW+ra+BJTy5oD94qz4hPXkfYm+NpsnXPTpZBVNvquALCnJixydqxcx
	 alvYMG0WI8ohNWZDZQVJFSovfYfN66o/C5AoKpWPAkdXhDceC83jCZqcc6LCuzk3ozSGy
	 9nam+kVhU7VUGlVOX0SPSih+/nMzd2rc2C0FV/ZHdw+nGyqGJy17/svjihUfCyvLijq5d
	 KrNrdKTJku+eTuL32soTfn4Gs48qZ78R4qQQvlHIhqSmsbQaBLLu12v8lOl6bsJMEDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WwjQyPIcMFf7inP5N0uSPmx3oh6JUfGi06PvuPXoUmM=;
	b=ye6GoA0urkJ6eRf/oPezMCyvSuNzhxxjP/gnvBJIGtAM3uKSdQVTXhwgxZjxvFtN39Nk
	 /ekvZ35+Owq3GooP+6Las2QJNuKye2XU6beCnZnAFtsR9FAAGcY3rtWlY7pbSFuAdbic1
	 aOJbEz+/jMAcTGlILSoj2ntreIDCUC/GSOsiFELtWVdwvqsH1+ShG/P93gVk+iS8AJe/a
	 HGWtGagHkVMnbKQNJVAyeHp7aSxKnJ+j9CmJjKc+n6+yIsui2QGW2LjoAugJFgudA/Plf
	 +KshfzQS6scAArLKJhRRF8qOx5LzcvSpvopw3nSPfeObh1TorYZyyTafFm+RxNxXAvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W7IAD3j7;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AEB606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3AEB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W7IAD3j7
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so4674035e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793964267; x=1794569067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwjQyPIcMFf7inP5N0uSPmx3oh6JUfGi06PvuPXoUmM=;
        b=W7IAD3j7PaGIDf/91PYdduPoopl0Q9ouvdY8e0OR047v2ydGBma50bpSXkBEDgiY+F
         5mQuqBExoEcIOhhqpi8MF/uGL1PVDtpHhPzeeI6iRe+aouiY5xYpVbqhyraynWZ9wdnK
         4AX1q5fpb5JivZx6yqIXU7uJ7FG7Lzj6bdQwou6uHde8yxu7rxwOqf60SWh4R1tfjQFL
         BTT4WF3Ab6pTw/xFW0rPqX5NGng2RDBa+uLSyavxZ7J5UFgnob1Dge//nFNmZCb6uBYW
         yvu0krcLOcah4SZExnmyIBhpDNDH1mmz7cVcy+54rbY0P43O8Y4PZ5xT+SZiPyxzhTBN
         GA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964267; x=1794569067;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwjQyPIcMFf7inP5N0uSPmx3oh6JUfGi06PvuPXoUmM=;
        b=Giv+3Mc9GcW8XzIsHHiG1+XxvJ+sj2Oq/82AlWhpoeM/46IyvIOVae9OlDI7iJPmx2
         kLFmBNJqXLqCHm2i6p9GMHWmqP5gZdE6ka3lWXVDNp3byOC46TC5DohEat50j47xxGcg
         q+QeTf/t7edNHA/rFr/Nu8v3itqK1AfBvBK3hPTqIQkKU5awV1hJs0gnQ1MzFORokReC
         n+i5GzxwIMqr+g0UNrx6cKdtq1JdJ+0/vexD4gn8ycep0+XMXEB5EaCEyirbnRfv7S9s
         5UfQkLJxzwvTXYzTpMyiVJ12PqYzvUks82O6B0kckpmJIkHszbPIS/n6gJBZ61hy793G
         /vJw==
X-Forwarded-Encrypted: i=1; AKwUvBykPYDaIXhhUG+ai+Ehx76c7P1IsOYzq03P+0+kUxqUn4W7mRDkrW48KFGsVz+xGgg+qsK6vRwoFOvD9co=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hSeqLuRS9PUiOWz7iT3qK4iJ3kiLk61CsDHetzp5f5Osc+rzR
	/3JFjuy0bFxF/gcK9L8GpAOGXU1U48LX5N5uyV57Y4jksc908H8TYYrEm6OIdHaxB0I=
X-Gm-Gg: AYBFou3KDUa345ILtbpHdr5outzcxBfNyhr/iZfFG/00Exh/RgWqWpHXIj7+vo8YrKW
	msYweXvOgEb+tBAFKoC3NWQV4x+GuKNbpKUB8i6f9K5kBYhJUTJM46svEIYyicqjMVVDg2Wy4gG
	unrfTTAnwX1NCPcMp0QOi4a7igVzC+1qBrjdCCEnRD5NSLi9hyg1gLMo0Ywv/5DMWqkxaXeOoxW
	CUj5/s+NdF7rcSQUeMwdexh4obf6gjAM6xSjO812IqLwA4lCw0ZGslmttMM3+gGB8gx9KIfsPap
	QNJlplSfu4vyXmrzqWG2morQjNtMwnz0kGZmlheboj7NlXXJUFcO+HTyfMppw/mXDWLzm1MTQrW
	0AF9V6ng9EAo8/uf/dLkIRu0QZ44iEirNtHzSJyYctgsOlv8cKqTuETWcGr3GOk2OUcoCZK7MxV
	yVJf+NpXVOLYCzVrtUiyoXSx6XjHSCJXhru6rhztIY3MSbIeQYjjlFJxdCcoqxgPlfMUnDwQ7nH
	+ONuOEleJJ1U9/YmjX11VRzuNH5zZxwp7HcctEfjM/9wnp6HGUfxFKQAPBswCOCgmFQO28XPpft
	F3l9ExvBXAFXpmJTPj+1mgKq6/yd1avlrZwD0BMkTw==
X-Received: by 2002:a05:600c:4443:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4b6e091e588mr38640345e9.30.1793964266527;
        Fri, 06 Nov 2026 03:24:26 -0800 (PST)
Received: from [192.168.0.167] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b741cdd8d7sm27597265e9.1.2026.11.06.03.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:24:25 -0800 (PST)
Message-ID: <1fd0e1a9-ef5a-4fb8-8c55-556b62b73ace@linaro.org>
Date: Fri, 6 Nov 2026 11:24:24 +0000
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
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Andrew Gigena <mail@andrewgigena.dev>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
 <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org>
 <5ba03b8e-1d51-4e66-a802-37e63814f5d5@linaro.org>
 <CANn8UmccjAh7PiLpbGHrhDR4yn=w6uiDYU01aoZvBs-tGkgNsQ@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CANn8UmccjAh7PiLpbGHrhDR4yn=w6uiDYU01aoZvBs-tGkgNsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 03:06, Andrew Gigena wrote:
> Hi Vladimir, Bryan,
> 
> Thank you both for the review and for taking the time to explain the
> direction.
> 
> Vladimir: I understand your point about the stand-alone CSI2 PHY model,
> and I agree that is where CAMSS should go. I hope this series does not
> give the impression of entrenching the legacy description; that is not
> my intention. My concern is that I don't think I can do the PHY-API
> conversion properly within this series: as far as I can see,
> qcom-mipi-csi2 currently only carries the x1e80100/glymur
> configuration and no upstream DTS uses the PHY-API path yet to take as
> a reference point.
> Converting SM8150 would also affect the other CAMSS SoCs that
> still use the legacy description, so it looks like a separate and
> larger piece of work.
> 
> If I'm missing something, or if there is an existing branch or series I
> should base that work on, I would be grateful for a pointer. I would
> also be glad to help with the conversion as a follow-up if that is the
> preferred path.
> 
> Bryan: as the CAMSS maintainer, could you let me know what you would
> like me to do for this series? I am happy to keep the legacy CSIPHY
> description for now and follow up with the PHY-API conversion, or to
> fold it into this series if you think that is the right thing. I will
> follow your guidance.
> 
> This is my first submission, so I appreciate the patience.
> 
> In the meantime, I will send v2 with the review fixes so the series
> does not stall.
> 
> Thanks,

A) No top posting pretty please with sugar on top.

B) Since we are reusing an existing PHY init sequence there is no need
    to port all of that stuff into drivers/phy right now

There are several complexities involved in porting existing bindings a 
new topology whilst supporting the old.

TBH adding a single new enum to a switch is a much better immediate outcome.

Happy to take a SoC enablement now and work-up the switch of older 
binginds to new over time.

---
bod
