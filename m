Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE8238887D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411764; cv=none; b=CTXU1B2TNuOiAXxBHwTZKsmZuLs621rGLvaLncIDoKF+h9nRY/vOMJbtHcQbS3t4BE/0hRCa1yCIjYxRLLAjWJ4eXlGoIZMXHLoInsiXcItBGa9hAT53gLHHCH/v866H7FnyP27Yj8rKw057pVb1VOoCLGBjJ3/4STgP4sEsswo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411764; c=relaxed/simple;
	bh=j8QMTNW8XDHV+BH8mGTNiSJbNMOrQ1E2SamlbJ3guog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RqijMbP8sieiBS5dK3nqQOCjA/ldv43ttSDMvG7RE/z6FJic2TFdulR6s3bgjapmsUhLzEIvteStAPT1snqEPjVeFUzkh2n7iVMAB1HtZENkzaq61NCzRMoAM3qfV0hvevaP9k4hoVOn48MQn7zIjPNTWEvaD4OTgOWTiFpWxdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hS9TovMd; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hS9TovMd"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4a0e5aefeso2084114e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411760; x=1789016560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LwFiTvSfOdYmNglr5FoVqN597kWfjGSwy7pj4LDNId8=;
        b=hS9TovMd5QZKIZNyOpwAJtQ57wR6xsF0NLxpWkjJu4Exxer+y0BAmxudl2pCbJZXB0
         s8wHmZdgs62nqz5HLUL8CikyKRTmtWfxKYvHQpbvhMT4M9eLIt+xPStnUfjqImeyY8SJ
         6BfRq71N/EKv1qxb6BGEorOvJAVGsuoE20AcBf1vmIhTfDld8Du7XIA/k2Qfr/1v6CQ7
         fcg2ew6rq46UtaOg5tCt/aKdd75BMIzPLjM6FrbuTgenT7XvaTGqCYcjuul229whmLRU
         sjs8OSK2lBQzCpQLt7bziAF2kArm6eWxxTC+Rt+UXE/DgVU0c1XWAQcTmJi4ONiTSP/P
         tUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411760; x=1789016560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LwFiTvSfOdYmNglr5FoVqN597kWfjGSwy7pj4LDNId8=;
        b=Du0m7acsWhkomIwRxPD8D5cLMQWawvfrruJXKmhTMccovlR0jVtjcOSxbzeRiCAkYN
         XRdVyrbRHuWmERnttX0NNqXC8KkScIg25Mrxs6luCo3RRG4hOtlUII/oUJo3DJ8Tkuwn
         hjlZWuQfty8n1kz/OuufeAS1ylW3Q1jPIBSSCHFeZN4c6Jl7RsbDdEcc3DzLCI9BT+7a
         QI6eDwqOs4U5jxwadAxTSf6bAmmlwbNzfrDgxf0aR5AdotfiPNYVHn0bZiJgzrtAwek9
         K7ocrgx2Lo8m4SlDK33ztdSysurJlSmTacsvNY3BzskhKGDXHHM8PrD+rRU2NZomoY9k
         5GPA==
X-Forwarded-Encrypted: i=1; AKwUvBwwdwr+PC2PSFBw8RmVCWS5muq2rLGFZ9PpJwHjt6jWfBR8pMUu3dmau8bYeyw0eUtsvQi3vXz4bTYmZXM=@vger.kernel.org
X-Gm-Message-State: AFuF++l/i8yVFIOc1dYjekcsSINsLZAPEdENl6s9WhQrBpc6zVntmkCr
	dQUXpwh25jnsi7mwcNJLWhZARr7kOMpHyW7DNcqVSARvMYx2cAFGR+7H
X-Gm-Gg: AYBFou3xgt3Y911zLRXfSicEJT8zF4e3dqxuz7Cu4s3uLZ2TQN2ThFm9yfrPlOAAmtZ
	GCxdt/jYvt7+O1lXtirsJ9DoZtq/Ff1vAuEjsnMEOBZ2+j245dAGGCzMceUv/H+IrzF+y7E02zr
	8F6Sohzm9Dt6N+5PY8SQhGxznjJTFD9c84O/E/VnhuDYYM7dgn1T3uaYRdvRk2Ayr+kcX4bk8IW
	hzajGmdFHkT1lPNthGLURFhwM/dG8jfFDUAzD1MRoAs4+F+J7qC+UqGITE15i0VoEJ3B7fAikvl
	4tguAHnpV1AVpaXxIORXB/ZXffRdTEgcGjQGzfG59kgVGBtj+M1Q1E5P7OsGDIv0F61k/XOBrcP
	qCyOO/Dm+TPxppQHLppHqPuG+2/D8dzeJnY/24+G+C6QO2GRVZQ2aL4k5uo+DKnR9vjKwpLs5hP
	7gzJzaD+/PJMOXPysXEtBHOkXRM85XFPa1IqOQHcDrId1FW07os8FPDes+321iO0V6+Bcm1iAtR
	qPUAgoAX2tEa0WFOvnAxaiA7+snwU6O9oC3g80RffyO
X-Received: by 2002:a05:6512:110d:b0:5b5:fae5:b241 with SMTP id 2adb3069b0e04-5b608559ac7mr3146149e87.14.1788411760490;
        Wed, 02 Sep 2026 22:02:40 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b1cd21sm1021897e87.29.2026.09.02.22.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 22:02:39 -0700 (PDT)
Message-ID: <c2d07f77-1fe1-4d5c-af6b-703d4d767a83@gmail.com>
Date: Thu, 3 Sep 2026 08:02:39 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Linus Walleij <linusw@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1788346553.git.mazziesaccount@gmail.com>
 <5eb294e68b8d5d2c1d3a12b14a55dd2a9c075a09.1788346553.git.mazziesaccount@gmail.com>
 <CAD++jLkvELVwVD2B-OPF=mV8-F5xi7RZWJ7cvuyg2srnrJ2HLQ@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAD++jLkvELVwVD2B-OPF=mV8-F5xi7RZWJ7cvuyg2srnrJ2HLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/09/2026 15:39, Linus Walleij wrote:
> Hi Matti,
> 
> thanks for your patch!
> 
> On Wed, Sep 2, 2026 at 1:07 PM Matti Vaittinen
> <matti.vaittinen@linux.dev> wrote:
> 
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> The ROHM BD73800 PMIC has 4 pins (named GPIO1, CLKOUT, FAULT_B and
>> EXTEN_OUT) which might have been set to operate as a GPI or GPO when OTP
>> (One Time Programmable memory) is written at device manufacturing.
>> Support the GPI/GPO use-case via GPIO framework.
>>
>> The default OTP for these pins is to not use any of them as GPI or GPO.
>> (The GPIO1 defaults as an ADC input regardless the naming). Hence the
>> driver assumes none of these pins is a GPI/GPO unless explicitly pointed
>> as GPI or GPO via device tree.
>>
>> Furthermore, pin's direction can't be changed after OTP configuration is
>> done. Also the default drive type for a GPO (CMOS / Open Drain) is set
>> by the OTP configuration. The BD73800 has a set of undocumented test
>> registers which should allow changing the drive type. Access to the test
>> register area or the test registers aren't documented and so this driver
>> does not support configuring the drive type even though it might be
>> doable.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Pretty neat with gpio-regmap isn't it? :)

Yep. I like the added flexibility now that it has got those callbacks a 
driver can register... ;)

> Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks!

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
