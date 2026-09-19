Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444032BE02C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789827710; cv=none; b=eaN5LRnHMeCsug34nKa0v+2Y7wMB9nENlg8nFzftZk1rOGa/JSjv0AobqVDtfhltQAV8pKW+eF2+dp+7mG9H2/3r/jtijfX9V7UYc12mdJYhhivF2AvsDkiGWo7Py5PK308EEfaF5SVudMXy/9g2RMEcSyzHRhCgY0DAl9c8F/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789827710; c=relaxed/simple;
	bh=I684RhGEQ7GNTrfaUnWsiWap+/NtauQEM0FxfaZeSKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjAjMRFaSG0IddqvOaVYJMKEAXaxW+GUkHiR+ZFNaksiNtYLCnpZ40jcQ72jUn7GJM77arADwWdVACHWUjXzrO3LcLpO6XkhTvyBg7Z215BwMEcM+I4qSWv8UWyDLZo9F+c29+lKBrydhPpWZiUiMPHp4op06eeuhKu+TEG1kFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=E+a9Wp2G; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="E+a9Wp2G"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso21523175e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827706; x=1790432506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2R+4kjVw0MIjcDwbj4ulbwDY6d2MGtIJTjtocSZokg=;
        b=E+a9Wp2Gn+WuJKH2RXUaNpJ8OlFyFn5hEJRSW7Hu0XtxOoAx6pn9hD0nxJeToIJyIg
         u84FLHZ7j47tyNTh9TcOtman28oVBNi8DE4ARUd949pcKEeWNTit6lhYjbLze/tQaSXg
         q9gQ2NqL4w4YpP8kVFGcMXfQBW1wIaX+i78obvXnqaudk18jScbRvjpXtMloOvo3Z1kN
         Cu8vIVgbaW0ycuZNzODYCcGpMlcdZlaE46Q5GkQd5G/3CZXi/N7PVg2hhKAW7n7O+9UL
         s/DYYdqMQ41OpnSzSURDrEeBqyE9FDeEgfHjdxU2vXjQdEhUiB3GnZuGF3jUtkO+SSnL
         fYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827706; x=1790432506;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2R+4kjVw0MIjcDwbj4ulbwDY6d2MGtIJTjtocSZokg=;
        b=hiLYEcHTxj+RsB2GhxwqmtyeNISCfZo9yiRU6s46ADszFq+7PZeUeKtIW5pWQaeSdn
         moQQ9zIU5NEiBXu97C82uo5qd9Y7U1Qu+f7jEIWXpHcKvhRV2C1Da8hPpIupskjuo7Vb
         TgYaL6vtxBcDRG2jMYZhi3ms87MREe/q4BhelAmQbK7Jbqe19X9Qdoeowk6miDWNwBND
         c6Ep/HlwQchWM34hQ2whE8a5NLQw20N31l41euQRaWQ1wMO3aXuruwEC6p/KaKMdEqgJ
         jkXAvD5TudhXQAFs40s8IQYhCrMVTIQpDxb1tiFR0NPWcSuzNZkMgTlLs4ScZEIkGC1i
         TdpA==
X-Forwarded-Encrypted: i=1; AKwUvBw9o/Og+ZuHrXCDt63QO01v2pqnGy61YElHGRmOOZVAeKVPXoYYTtJtRMiq9YP9plG/jba0GSjd8jfRlPM=@vger.kernel.org
X-Gm-Message-State: AFuF++lmZ4XNntocxWs7HNh8irSQr+GqlNMuMUD9UBJxdtneCjfIkpnF
	Ir5+NmgNxx8+yv8U9+ay2gLbLq564NS6F173izA+wFOr+MFsX7k0vDGfafd2QtSZ/i8=
X-Gm-Gg: AYBFou2IZJ5Ep2HblJxCya1jTc3AbmmjAnVqQ1QvfbNeoDIrLeFiXvx8VUxMEiuzRBq
	0rhvrs64cdXvC2DdYgZNDXUXbIUWvc25TpQXqkPCZKSPAnpSQNXE9+kvr9NhzJzLw05yDnvkZrr
	dWhlMPsCJ9cNM3QTx8hOJnmaw8ySGnOAVehpZ4BSWcXnq/6Kwa0WgaV8lWN9dLs5Y7O1U1secDO
	c3+YDKgUCyQajeiw+BV5bB1z8mHKnids4Kx13gIrT16QIJZN1ldNeW0978utKCZ01OFFMivnsMR
	wzlPjM3/izb8PuDJbLybWy+jJ8lXT9Uh41rylhwz5HhiXv+2RuazPpmvtgj/pMSjfshWhRn+IWq
	PfDtYV6PeXji77tySywrUgknWNVMNIphRCzLu1Ez/f8W7OiedibbDEeHgsI7bYjUtfs7MBVS3AP
	In5WN2NMMiUleuZBcHXhLAnbJi5dXU8XvZH2MOK3i3D7ss1W6hjRdI55AX5ZqzJrsEJ7hwVBG3P
	LMczV6VdCQplr2GqcQqGmvZw1aTb0aO/JcuBzQq3kBTYb0pa6b+CJg=
X-Received: by 2002:a05:600c:474c:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49fc569587bmr82361065e9.14.1789827706512;
        Sat, 19 Sep 2026 07:21:46 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc521f5d9sm38646635e9.2.2026.09.19.07.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:21:44 -0700 (PDT)
Message-ID: <06eac2e8-183a-4108-9eb5-8e141902e4bb@tuxon.dev>
Date: Sat, 19 Sep 2026 17:21:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH resend] soc: atmel: Convert to of_machine_device_match()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <c3b4f8aceb5f0bc95fa10e6fa469574cfdaa8ee6.1788429505.git.geert+renesas@glider.be>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <c3b4f8aceb5f0bc95fa10e6fa469574cfdaa8ee6.1788429505.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/3/26 12:59, Geert Uytterhoeven wrote:
> Use the of_machine_device_match() helper instead of open-coding the same
> operation.
> 
> Signed-off-by: Geert Uytterhoeven<geert+renesas@glider.be>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
