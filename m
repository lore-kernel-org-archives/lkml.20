Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269046;
	b=curjxreDtSRrNa2tLELuYOZ4VnFfK5KfSv7IXUEX87+SXT6ngFAAYKWEUQjCo9TV7W+c
	 4toHjg7TS74qOQlKNksjQYLf9m6JoRIIcUQVyOZZctbaXzq/cSRp2bXAKM7HUKWxWNp6c
	 DgLFvdp24ibbQZt655y4+J5FPzzcw+KVpuOqSB1TNDlgyQdpFMqONXPn/EiJtscZLSyIO
	 CJZC0MixuheS96lB2xPbHt3BPe2kYjapaNz76i6LRO9rCt16NRYf0+f4uPYKkSHYhrGHp
	 hCzRbHNTbZI3zoB2gf3hcic0OjwtTiF5m8j7pMWY4wM0XhsDc+zTWzpdy7tKCoYn2iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vESg3aj26lEluvBcaUBYlDgZP/BjzkrTsmOjKAVCv8k=;
	b=fuo6VurgXFheYZErgFg3W0IcYIO2px5NMZ1CDAt3ojZwTi0AbPinGS2nV8enlyqn1fwy
	 EdcQy9VD8MBTEYtAjoBmbhnCvse012u11AMwoYWP355gwyDwCevUy3wm/4zD3q9kolmqC
	 elJ0HwWwvfNQbWMhMT3JGwdY+ZzSG3BPMFDj3Tmbo7KMps8afp8xfZhgaRk7rd6jfq+UN
	 1JeZTCQYRjNesO9r9HBCvq2rC2AZbOFJAi69gTidLNo0ds/gHEf5aA51+NDkMkqYkgIYd
	 d1zK1S7CFBaNq8mVJ1hPAkuyUNjCWgyk6q5aJMgZv36DM1uDWY279w68tqur+Q7hwvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YN77BDj2;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6020E606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6020E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YN77BDj2
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so9773155e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794269045; x=1794873845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vESg3aj26lEluvBcaUBYlDgZP/BjzkrTsmOjKAVCv8k=;
        b=YN77BDj28AgJIKBjQOvbV7gOozPi0QbWFAXmF69f0sSx+uC5nwG5WFm+q2acmxICIC
         jU3ABme9xOBIXz/YlxDAATfhxn/I4Ek26jZ32MsWxTv0SwHzXG2fchiOJvHFbpt9q7/b
         iagEpoRSfb35tW+6AJ6KUtAKWTQAh0CAXMAASLbNe4+1LoGFkQVCkNcvxgx5M5Z9ch4r
         gqNuq5qri/Qe6gcGW470dXFscsCTziXLbFOr6/jI+rpwaEDBcPUuRINtNUmdkVnUTqhk
         XsXtyU6M26x36c8vWDq80w8Ran5mIWbTd9TIW9sJPUYuhW+dw8H0k1viQLJvoqVWy5yR
         7Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269045; x=1794873845;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vESg3aj26lEluvBcaUBYlDgZP/BjzkrTsmOjKAVCv8k=;
        b=BUKisDCmImTqsy4y5aRa/9fgHRFf3GlbEICm+KiQCx571AJYG4E0V+VRG6NPaJjIJb
         cUcx3Sr5nvRzd/tDNmIxlbYJdxwhst2KBj08hdULISWftObolnp7G7SNvXXycJGQYMQg
         euiZLg8m2byukrO+MQZ52hcAyKsHSaietEJE0i8LVgbX5J8dPLS5oak6GulPKsqX8ob9
         1Vt/EUMi0Qigz+kMQP2EeVgV+Kmkg+BmB+sALqCMCF02vsnjo2MoO+AXODgUgHwjUXn8
         CcGxiBV+7R12z7Z7Y6khAAwhJ9bFgtkAkoUlUltZ/A/orX/x8co/v+uIRR8fjBovvcrb
         wesg==
X-Forwarded-Encrypted: i=1; AL+hErHnErPi5E5FFauy8uZZxwgMlj06UqtrWKxTE3GOtBo+vo4V7LT0HAQwstBeif9ZD2Gvi6+g3U8y48pwADM=@vger.kernel.org
X-Gm-Message-State: APuU4Z990rVaoXpckkAKyXkln4nj1gixur7VAcsW+kST/Q2k6nwbF+Dv
	zsUSQ2U6WKOjWgKlxoOD8lk1J8jnE786oVzAAY1qnbBTe1AEYEToYZp0w/zaFr8xd88=
X-Gm-Gg: AYBFou0CzEXApi5GWXosfESXn49Kz7d1le/Sbn9hjP6BsjVJHXAaP2FhoqMXzJgdXxl
	WZzv4OOMMU0CQWGN01TuW39x0UzUllTIPKsrhStSr/7xEAY6/QDXS5oWRQfz2l+CBXNCoyjwy0P
	xf8zntxDR0NyrpVgdisAAVp27+x4uFIw7VOG8IXmF58nkN1Fczqcx3YJDaXeoYXbsORMWCM+Xhx
	XU/Oo6IxtuFTOjYw0TRKtg/7Bp7FtaT87GqSi0KLAMarKRUmsMEg7zt6yv6R5d8KZm80jW0Adj8
	ibUvIqaVKKScFaedt9mAgslWltOymxEj8Ocu1ATiKZmMYs6lcwOVhIftabHupxP40z87fgDhlbn
	DQcUc1K9WGGvwqdw2qgbyA41Kmq0bSPShtrBt0Nlufgk99UU6C3ks7yLfHcFI3sIEXNN4yLbWDv
	qmVRyockALfBBbGvsm1C9VPk4cuWAyubmetPzYmZ76jqBH4aNWVmfst6u57LE+NHHeJGKXC/dyg
	kRiRopmSa+lDRAWhRP6U7kH5boUd+UHjBQqfDGg5fg1K5JhKelPYYlm/HCXXgpQO1oqOLmA1DtI
	IClR/T+m/J+5SFRTgO2yqBmT4azzzUOhS8jKY8M=
X-Received: by 2002:a05:600c:811b:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4ba02344e46mr9602805e9.19.1794269044761;
        Mon, 09 Nov 2026 16:04:04 -0800 (PST)
Received: from [192.168.0.167] ([109.76.74.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2c5asm38245075e9.5.2026.11.09.16.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 16:04:04 -0800 (PST)
Message-ID: <fef23213-8ccd-4235-a375-c00aa540bdbb@linaro.org>
Date: Tue, 10 Nov 2026 00:04:03 +0000
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
Subject: Re: [PATCH 4/8] media: i2c: Add Samsung S5K3M3 image sensor driver
To: gauravsuman007@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-4-3d2e7b407516@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261109-sm8150-camera-v1-4-3d2e7b407516@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2026 22:38, Gaurav Suman via B4 Relay wrote:
> Tested on an LG G8x ThinQ (SM8150, CSIPHY1).

What would be common practice would be to post patches for the platforms 
themselves - i.e. the DT patches to test these changes and view the 
binding implementation on real hardware.

---
bod
