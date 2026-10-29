Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272828;
	b=FnrvfkO7Z21iY8N3nt4uuNsc8P6RjVRdkt861DFpL+ggZna58SWYIDvQszBrQ3DfsDtA
	 invBHMzSEDVNuzNvtaNVqnhesQqPdi0njrXfVyT1RUhVFp41uG7KgDRST+LM+Z/vA/HMk
	 Dto0BIaqLrtCiw8WjcuIJhAFOXviax/UdkS8YKsCAcXhoSEselzEIHX+gE6OPfjrAQO7k
	 uFBpPkYY4cF8G5t4RAAE4JVfq6P6tLzkqziFq39un+YGGBu0iiNAfKw5hAYg28lWil2Vt
	 MPozsfWRhCxGbS14DCt+P8jtNqpTkIEQW3+APagSjLfd1lAq+dixRwUxLhjNi1nTFaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HWr1SxRoSXUpgXKKNJoVMyu+qAI3Q0fzstEAk/1G7Uk=;
	b=sCRST4j+e/bnyOJPQdgGh4uZti0e/Xg+DjQrzqLzHToBEi8jdY2pXdF2FmJyuAQsf+jk
	 nS2cTVMsJg4lZIuiFUdinYGm0tOu/7F6VVswtzfqSaMYAzARzd7GeM8uk+YI8I/Dgww+D
	 urxvAuHZmbKLFlz0Tsle8gPbqQBER7vhDX+3WOHnVOp3ZHP0bkPjBVZXYbM1QAuxPyNNf
	 b10vLxKh8N2HV/Sb1i0jrdh79lOdo7+7JvbjM5poPstMcLgMFBey15hVGBBQ4ARkWYz4c
	 B+7LsVMyGH4DgReSRTY9R+voN5YzcmgljaTgfkMRVbABreSTfwTkCABxUxFNfYCe5sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pf0+jnlU;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE281606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE281606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pf0+jnlU
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so356088f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793272826; x=1793877626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HWr1SxRoSXUpgXKKNJoVMyu+qAI3Q0fzstEAk/1G7Uk=;
        b=Pf0+jnlUONlj2VAi35lQK+uRzr7kbgX9ldnEV/NSIsg+SKnM5FqDBuIuB6exfW+74k
         vgsUqhpIQNrGDXg8WrHq6j48D750X8T2xOSL/XjZTr4/vK4BHI9DRrf8qHZSNOzPEQg0
         UNqDM0fIHvJxfMzKPG9ol9ZyUr4FvqNkLA+nURZmEju0xBMkz2bKcMRIdzc10y3Owg8q
         20MZ55dtmpbIsO6kqIHqc9jcQ1zP4mqKfI1cI+fzQ/L0yiMD31GPXO/ZXuAoDvt3f9kO
         d0aPAJchToVRAO2hN61RNxAbJg6GO8sMn/wHHpQtstkNaG1RiAvNcRBUeBzMdH1dOweD
         T/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272826; x=1793877626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWr1SxRoSXUpgXKKNJoVMyu+qAI3Q0fzstEAk/1G7Uk=;
        b=JyLDiwCS34nynMOE5rTiZaqeAHelYLQD3OS/hAdiK3i7strssvvahRyIyymVf1tPGw
         BpLrxdnJAw23l1nLTPeHXlfYFJKCX5hur8ufLlvWuam67wLvl33JfJlR71QtItMP1IA/
         PLQHnXmbFNguNjK89hF2p6KjVvn5SWMM0qEENa0zsx4CibV4OD50i8vdKhtU2WPNaT+L
         TgjqCDR93nLmTQAstJHkLNUkgc3lgd9zRPcGI/nQNQ7hylUY4uRyDQPSyV6Dkt3G16Y3
         rSxlMsye/qbcWWQnlBsRG4OSQectkw6ZM43oH/iyYPVmk4R5s1ap10r9pZRveXpbdyCR
         Eajg==
X-Forwarded-Encrypted: i=1; AKwUvBxm12/XOyMYh2/2Ksmwe1jztMhbU7VzZVtW6b4C672uFqzAR88QTbiYAVk5Xd0AfKlp7vy9Zzm9hIOuAcQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOTY6ICvOnueRlqTHRvcIYsWbm29/stprX36WF4RyKoV/nLBJv
	AVWtkPTXo7DA8GChnXOwyh/K3Nta9cER16Kc384+Tp5jAQdfvENsnD4d
X-Gm-Gg: AYBFou1TThrMncdi3zPJgzArgv7sVgkFF3sgjnplaGcu5cvMzPehzAiz9iX0LiJM+vF
	Cg6363e4yauyfiG1NryGCWvz3fX3R1HqyVCj/I+SMUFLXlEiP3Lp3ZHeYOIyYXCPxX9ropLDn9P
	gxbsPMd18sUhSNW7TZp/SZjM7oSlCe+v5S0t/ZxPpHD4skl18AiDT/dvWdm6OOaucMvzlf9THBU
	REPfonz4ul09jtboRigEiS4I8KJ8l4zfArt9Xe0D8ZoQ8Y7NGbDQvO50rDBeMpKJP1jyo1Q/5uS
	oJMoS39+NYKiObTC8bO9+jbDxK4QphXTHbo2lmOHFzaHn0oxArEd+pK+WtSKLEJDFCj1lt3uAR6
	jzwufRa5InotY+WlyoGc1QD2KjcTHbmxNXbI8JZZz6OmdGD6eFx5RkR2XsexFsSkJwpMufJDA/a
	B2W5jmY639xYWFqxO/x8pfusoqZCYoIOVmdUlYjPlW5P0f6jFaICu3oHMzplWB8u581cuO9FVZO
	01vlFOBgxboyC+0BbBIhF3PrhcbZG8q2b2tJz8loiV3JFSpf6knEkGurKcu6c768PHIRUPGVN62
	QXlV/z6YIr0Tg0K5qt3I7UJyqy38yhHfvG5z0d4haHZM45s=
X-Received: by 2002:a05:600c:3144:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4aa8823df43mr54740705e9.16.1793272826044;
        Thu, 29 Oct 2026 04:20:26 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm15790305e9.12.2026.10.29.04.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 04:20:25 -0700 (PDT)
Message-ID: <533bca43-8de5-4295-b226-5ea3742871de@gmail.com>
Date: Thu, 29 Oct 2026 12:20:24 +0100
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
Subject: Re: [PATCH v7 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
To: Chang Yu <marcus.yu.56@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joshua Crofts
 <joshua.crofts1@gmail.com>, Shi Hao <i.shihao.999@gmail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20261029074851.216029-1-marcus.yu.56@gmail.com>
 <20261029074851.216029-3-marcus.yu.56@gmail.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261029074851.216029-3-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 8:48 AM, Chang Yu wrote:
> Add a driver for the AMS AS7343 14-channel multi-spectral sensor.
> 
> The AS7343 is a 14-channel spectral sensor featuring 11 visible
> channels, 1 near-infrared channel, 1 clear channel (VIS), and 1
> flicker detection channel.
> 
> The driver exposes 12 spectral channels (11 visible light and 1
> near-infrared) via sysfs. Runtime PM is implemented to stop
> measurements and enter SLEEP state when the device is suspended
> or torn down.
> 
> Future patches will add configurable gain and integration time,
> interrupt support, buffered reads, VIS channel, and flicker
> detection.
> 
> Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
> Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>


[snip]

> +		/* Check for digital saturation. */
> +		if (status & AS7343_ASTATUS_ASAT_STATUS) {
> +			/*
> +			 * Per the datasheet, ASTATUS is self-clearing: writing
> +			 * the value back clears the entire register.
> +			 */
> +			ret = regmap_write(map, AS7343_ASTATUS_REG, status);


isn't that the STATUS (0x93) text? the datasheet says ASTATUS is read
only and ASAT_STATUS clears on access, so the write shouldn't be needed.
it also covers analog saturation, not only digital

> +			return ret ? ret : -EIO;

-EIO reads like a bus error. as73211 returns -EOVERFLOW for this,
wouldn't that fit better?

		if (status & AS7343_ASTATUS_ASAT_STATUS)
			return -EOVERFLOW;

-- 
cheers,
jose a. p-a
