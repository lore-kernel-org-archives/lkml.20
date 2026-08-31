Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97654AA412
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189617; cv=none; b=l9DyV/L9TwFAxrvYQGrBcL1GPSfmV4pB9njzUnMXcQuPdS7ntxChz0ZTsEU/1BJXZffRCW/pkgq9WZkrrLi3mMqbvo9TpuZBPEk+mkowYb92EjFmsCYBCpRKAdlSK5evXo0mBVXGYU6pRzlXMZO26KVHdLhuNiDFXaWNMsjs/Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189617; c=relaxed/simple;
	bh=aKL2AnuUWy6NivLQVu0g6qzxjQP5ZgZ8oxvyWfYnvWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MS4VLMmdw4v9LXzeZAXt03Erp9SUEQp7OJuXqMLj9vc1phiLnACj0IDuv3po7JVOFh8vDuFLHcp92DxHgDkFK1GIaxujmZJuTifwm7WnKVIOD7xxVnDJflAVXUgkYefPvUP+xyrahHZP1g5xws8pvTA6q6EVBGc19dF963RjSWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQ3Htxlg; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQ3Htxlg"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52cd38ddcdfso31878741cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788189615; x=1788794415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jvlu4I6x6DgkdrqSjLTVRzmVnrzpHDN9Z4Ca053R9hk=;
        b=YQ3Htxlgaky7fGGTvOz1obW/5spAqrvlRFUklvLgDMMdgrEfxtJ2F7Tsm6Hv578SM8
         9dYs5qGxa5nGWtY+wDn2qGDTknVw4Wg75ys8SQNPgstbW7XYLlC6ogBEioW8FIEWv4+C
         7NyRaDIivk07rFc0YxFHghcDqBZnz0TQE8YPFcHZwMlG6BEM/LIx4y7efGT+1aEBrdhW
         d+XZYSMpovWJ2L4nJShryBuYK3IcS/EbXeFXURWfFrS7AUzz4BVSJGeVblw2GjBs4HFG
         Tz7zwhSZIw0yWnNmVN8QnrjDPnYkfJdWMLN6WZdfxlgLv/WmC2w7G551892o6Rc5HShS
         v/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189615; x=1788794415;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvlu4I6x6DgkdrqSjLTVRzmVnrzpHDN9Z4Ca053R9hk=;
        b=PDUoHis/5ufqRg5sfZkoM3euH2A55l0hqZHPNZx4nNItmTn3ZBOy1ZJAiWEPaS+f0Z
         43y03ROz6paeN7FpM7s7ZnhS9hEPYZVdDkH/EZWt3ykEDTYOSvE3xIRO9Nwc/Lytm0tA
         0HdZ0cOWy9K0Zf+auY5eH+kXhJXggQqIpp+Fs/jXnw5QogpqKZ+0DnBqA+Jx/h9gdbr+
         x9FIhBAFlVD8PcRf8w3NGhSqGFYD7i0oEbRDWQZSYGjg4fS+wlfvHDYVnu9Szx1zHGQr
         UjlsE49QQf19CvnwA34wmO5nBmj45oQGhcwHJB6O5aE+9fBH9glf2EfUElKHj1AFV4tw
         NjvQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzgmGyWi6Edo4XPzPoJKG6zHLFvAmbYp9ME5bbHen27xbEnvT2xWS82/TKCpWOeo2STD5Yvxd5Kefv/Fs=@vger.kernel.org
X-Gm-Message-State: AFuF++lZi0mLe5avWRh5NbeyiEYtgoXmqw9109S4FMt6SWLTARq06QU/
	msUE8s3xh9OtDWD4qvpa7iTShRREc5vlA/y3MOr6SqyJvDbJW61jwCkZ
X-Gm-Gg: AR+sD12U0E4KZ74AgyH7HZb+x9rJwWji70P/wUuJQslpsuxlKIUqtBaNF3riaaKlVqf
	IEeAixtlPxA9syJNM1rT+stV5B1IxJd54Clkqav5Q4moaSoc0ZJcSzLkqy+48P5lvf16BvXOE9q
	7TzcQzTKTqMLaHAHjJiCs5+LGMpZbMFS04rB2zEzT5BFBLunertEfFoGpXumDozT07XRYRlfSNI
	At5gYpwIhAx6yPOJkiNWWAN5trIUht59SNTDVsF6fcnCyFipk2qGyG6WkyonGiDDYWtOgI315+/
	sjCNa39ZN9yg/Aoday87eN4ZB+GLSzf1zo/MtwYar0gCY8lk4xCV6Nx1ogNDHJcMYaq+JN6eC+3
	4nXikVp+umDlCS+x2XxmXfn6/Z99gsWh3PPxWarbhOx/gLy3yMu6hE+yOk1O7184JrdzfccI9UV
	1c29+aZgARu2zF3tA8RMOWLamTDQeBD6flgqvxnvX4lYG7sVrwbQEdahitBTbjHgnVKgGhte8aH
	AFlvEcdvcRDgjskg7hvdfn8QszAmIpR85hh33jJfPYnMLvsdcucMT87gZSPQ8AcmlA5fKBnpfTb
X-Received: by 2002:a05:622a:4818:b0:52f:9f8d:915 with SMTP id d75a77b69052e-53021c760d5mr22862211cf.26.1788189609876;
        Mon, 31 Aug 2026 08:20:09 -0700 (PDT)
Received: from [172.24.138.145] (ipservice-092-208-247-184.092.208.pools.vodafone-ip.de. [92.208.247.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe850864sm73241871cf.26.2026.08.31.08.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 08:20:09 -0700 (PDT)
Message-ID: <b2f430a4-a43c-409f-9bdf-ffb0f70b1538@gmail.com>
Date: Mon, 31 Aug 2026 17:20:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/20] iio: adc: Add AD7768 and AD7768-4 core support
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Janani Sunil <janani.sunil@analog.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>,
 linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20260828-ad7768-driver-v5-0-e33ca6f841a2@analog.com>
 <20260828-ad7768-driver-v5-5-e33ca6f841a2@analog.com>
 <apVDm1O_NtD07-rw@ashevche-desk.local>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <apVDm1O_NtD07-rw@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/31/26 11:04, Andy Shevchenko wrote:
> On Fri, Aug 28, 2026 at 05:30:28PM +0200, Janani Sunil wrote:
>> Add core support for the AD7768 and AD7768-4 simultaneous sampling ADCs.
>> Configure supplies, clock and reset, use a custom regmap bus for the SPI
>> protocol, and parse the enabled channels and input buffer settings from
>> devicetree.
>>
>> Connect the converter to an IIO backend for buffered capture with CRC,
>> provide a fixed safe wideband sampling configuration and add runtime
>> power management.
> ...
>
> +	ret = regmap_update_bits(st->regmap, AD7768_REG_CH_MODE(0),
> +				 AD7768_CH_MODE_FILTER_TYPE_MSK |
> +				 AD7768_CH_MODE_DEC_RATE_MSK,
> +				 mode_config);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(st->regmap, AD7768_REG_CH_MODE_SEL, 0);
> +	if (ret)
> +		return ret;
> +
> +	dclk_div = 8 * st->datalines / st->chip_info->num_channels;
> Does 8 represent BITS_PER_BYTE? Can BITS_TO_BYTES() be used?

8 is not BITS_PER_BYTE.
With fast mode (fMOD = MCLK / 4) and ×64 decimation, this gives: MCLK / DCLK = (4 × 64 / 32) × data lines / channels
Therefore, the factor is 8. I will add a comment explaining this.

Best Regards,
Jan

