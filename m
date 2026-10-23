Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792744776;
	b=oMsVfZn+uH9kdrVkgAlNsfK5/+Sscn51lfzMr6QQd9FefJOPCrz6uLikHudF9CfrN8+w
	 FXtYlTD21L7EpOnjoJvQA5uhATEwFRKbB+YxRRX7FBa0jOPm60DEqKXRWefhL6Q6fJ1x8
	 RoFKpx8rCaIklnQfG90iVxeFV7+tobgUxm3NAjwpX/zh9v2YiH1X8tfkox2kvQg2oZsyk
	 wHudVfoPq36xxn+7ZGADq2jxPv6cIsXPNmcQs90dTzAKSRqblmL1l3qwqllO031xDyFom
	 UI6g/6jJzUXTdchHFZ7MgVtNHhA3NsfhHL1O0OyDEldbXyH6fARGusF3msJnJKgQNSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792744776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=W3Z5Tvzpi5a5MXCtoI1CIoCbbR9cOaWJLkbc+o3VSIQ=;
	b=rVmkothvnfC1f1pENsxicCBtUhYb/C3EDqTomggTIucAwWS6wOA0Ue6OLaeOdPONhaSS
	 AqnaryAOq7B6vlKtMRvQhTaM5dEilN6dkAX5aY2VREkCNb+ZxnzzhFRNj/HY1LUY59vl6
	 YUhurPR5tBKJKg2EGOAPEw0JYOzQeSwsYPb6wKcR0nZS2afWrB7vWHpXblQDrsZTZEWzy
	 gPuTFMf9Fhy1VplX5jIZSknioIuk9pgKgLH+RIFycH07pmrimJmFZ5w200vWrfaHS+LHM
	 GGsMbHdrq8HF7bx5R9f3YgDn2+MvY/2X8zx+PDZP9ptWO1nf1JtHOie2N7Hwr1SnNTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uiTnOqel;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F079606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F079606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uiTnOqel
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e011d370dso478608f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792744774; x=1793349574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3Z5Tvzpi5a5MXCtoI1CIoCbbR9cOaWJLkbc+o3VSIQ=;
        b=uiTnOqelZyyN/1NxGsPC4/cPRJsNyrqy7xbq6uLpqQjD9pUH9HG5R5zcwiTae9gzDF
         tURoob7t+4kP0O3Hu5yYrG9hu62Zbhbyxk+IP1RS2L9bmCT81dEvvEOa8BC7XK0RmD5U
         aRSnvONDBaVOeKUd/j+wP9JvZ41MhnidNKITJkBHhcY58VCKheid3X72aZazOXMMOllP
         iR7+qBKekdzMoJFxnDwYPusdFX1+COsP11bQnYR4gRyeWPWsoFt7xdqP2nDu66KpAJhw
         y3y6yNxjcsaNsOkh1q+spNBOVqkikEnyCr28l7u7ITFDd6qDfJYOBnMgwaMLXgORm4GA
         CAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792744774; x=1793349574;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3Z5Tvzpi5a5MXCtoI1CIoCbbR9cOaWJLkbc+o3VSIQ=;
        b=1lcRM8KEal5ALn5F1OHSu7aQP2cVa/qGCZrzfQKnlyu74XQ3wpYHpmXlH2tTo9Zu55
         8E0evAX/oku2XHXQFp8tnbYQFmW66oRIqITko7iFIgUBHvTXPICNt1Z9kdTh8Qvodmkh
         3ZCptW4uqne58xSGVq2WBLeFBFKL4BB4sdRAZIlFUvnWusoVdSkHx255R/dHDb+YfIDO
         jdPVm4A0LxfTCgbMrezez6cB9NPZjd++Rt/kdYrSHTAZF+EDA/LkCTwcDfq+5aLXYTtG
         fInu0iEz7M90EA7caxCvYS9i2I+7IrYTmFdt31W+XnoXPblfimGU/DCCrC3I/+DZd+cf
         Whtg==
X-Forwarded-Encrypted: i=1; AKwUvBwKYqpBrddonJwzT65O1b901Lr/W2XyM8tn5RN4gLA9YmuX5wNHMIiNeeYm2Za3i0AKqJc636bAJNqjgr0=@vger.kernel.org
X-Gm-Message-State: AFq9FYImqzi7iY1Yvyyd3Fbj5WmT3BHocb7vjkTkJlmU+3CuWGtGSo1b
	EwZuND/6c+4LzkI2iiYP6nwBwP08UC72sq3MQiFRi9W0nTi3pAMbELI1V1AoV1B8M8/7sfSxm4u
	pi7+P
X-Gm-Gg: AYBFou3hTORood8X2Va9HwcUCY8XpYXnVo1GUq1g+jz/O+Gj9Ek5A2YTeXVWmTkiKVX
	T2bfFz6UsxAdFMTaMMvvUUIGc9YrVlBTKY8r+kw4f5/SP+HlHe6luZ+3Jpr3n300hoFY9L9UjPo
	BhyYXvzQGqSPQwP6E3xgaUpLwkhz5lQluXiufMp/029fE0DkA7BL1jR6C5ziDESk14kU+V8Yai1
	PgOBMhjxgSoPW3HgGr+MitBqHysBDJsqMCumOAgO/ubTkPvwDXvUrtpqjHfvBXX+8GlkRl+Jr0m
	2sWnYMf71okPP4IiQRQFTU5+Xae2BoErOaVz0Qs1uirDrGYgNVEs1sFkgl0N4fNgT6ag9vz30+U
	BsQF2tCP574txyQrtgqFwyRQxTr1f5rtbC7T1j2e6XsFurHJ8B2pcPGJ7vBf7stDjEXn9Co0XOJ
	zY/GtCBbFcK2D0jRux5SO7UbhUCZIJgmUJLpe/jvMohT62MUAgOjG9utJpvBjF/ekR3GmXNIOHw
	XPThXdzm1qDngdDIs1jJ7JAo+XXMiQakIJGvvP2zsKQsVRQbuLBX6TOZe2OqBLGFc9p
X-Received: by 2002:a05:6000:2504:b0:489:bc38:9438 with SMTP id ffacd0b85a97d-48e385b1f93mr2404036f8f.29.1792744774282;
        Fri, 23 Oct 2026 01:39:34 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.107.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380489a4sm3429223f8f.36.2026.10.23.01.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:39:32 -0700 (PDT)
Message-ID: <82ae48a7-cd42-4080-8360-4622f52e2e4e@linaro.org>
Date: Fri, 23 Oct 2026 09:39:29 +0100
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
Subject: Re: [PATCH] MAINTAINERS: Amend Bryan O'Donoghue greybus email
To: Johan Hovold <johan@kernel.org>
Cc: bod@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20261023022913.3763777-1-bod@kernel.org>
 <atsOnVI10aWoH2Ap@hovoldconsulting.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <atsOnVI10aWoH2Ap@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 08:37, Johan Hovold wrote:
> On Fri, Oct 23, 2026 at 03:29:13AM +0100, Bryan O'Donoghue wrote:
>> From: Bryan O'Donoghue <bod@kernel.org>
>>
>> Remove old email address and convert to current kernel.org address.
>>
>> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
>> ---
> 
> You sent this one twice, doesn't look like there were any changes beyond
> the email headers, but let's go with the last one.
> 
> Best to add a [PATCH RESEND] or [PATCH v2] prefix with a short comment
> or changelog explaining why so it's clear which patch should be picked
> up.
> 
> Anyway:
> 
> Acked-by: Johan Hovold <johan@kernel.org>

Obviously messed up --suppress-cc=all - I always test before I send

meh

---
bod
