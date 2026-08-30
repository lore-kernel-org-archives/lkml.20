Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266A53A5E71
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788082402; cv=none; b=TxHE/lJ/4qeLorSaGPOkFv1DPsYD9uA/df2liTtbUgHKJ+wN/HAEY1fCJ+7mRKAFta82LZRnAX6/HtflwgA3vuNsnMxynESUF3MF9y2gjNqxpg+6CeYY/MqG29HJ/JL4olY+nhHmYgqP9UIhiSnPiaGGogYYM6OU/i5SxhLIG/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788082402; c=relaxed/simple;
	bh=/DKnhV0MmVJPWDzTPG3icFO2F50OI3OFtVu85d9jTUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HmVchgdn30sRv9RmO1cavcBTy6wu+BhYgFhmrghprWR/giLeUhxO8RAAOyCetVEnwPK/trsY3PjWbnSdkIg8gtpfKdFfhFrp+4OA8CLV0ifC96Vwej8kE3wgCU4Ed1GmlOCKGT2yd6kuxdzYKcTnj9iWlcCVBgk/jF3uBo+W10k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEJsZqkR; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEJsZqkR"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b5607bd3b5so2136651e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 02:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788082399; x=1788687199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mA3g2yHDcdRcBYbXDsH8zS7Qjtttirgrx3DJv7xsWNs=;
        b=hEJsZqkRaf97G+Lauk+gTXTBDrIqCAOrGe1skn+JGmhIzeChV2icg3HwQm+780Wo9T
         Kk4R7LZHboDevYCcVO1zoeqItVK0ZduMCiyJQB0pPFg+gGUtlG8QHJsK6yRF/oCtzvOM
         kXHvxyuMJWY31mnPbs3mcub2216ppx+X3Fkj63UbD5eMWAxRhyPJRFak2h9BTUc1pgUx
         cCWxhwt4jMElWSm/t2rMt5Cb2P47a7sTDSW/Z+TMqtSIRs0EzTl9YfKBW89bfK+XOuZO
         i25gL3AXLboIl54f/7nSu/TVeMqrKHA2eLifmIJeoZobAKBACR/KoUvDW0Rf1eKJG5DC
         eQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788082399; x=1788687199;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mA3g2yHDcdRcBYbXDsH8zS7Qjtttirgrx3DJv7xsWNs=;
        b=KhMHeYRfXI2IAczvGvWWPFoubsRfzJCfU2mTvx3opO7YbJwJ2YyTgei7pVEV+LWKip
         IapxK5ixMlSNAUFRDvv+/RlMr4PzSQs0ekM4dlKDZAUIVnjLIvKoffeXDgw/MvS+OJ8U
         /cAIkkyrk0F8i9SbrmZutWemm5aVZ9c0caJbxepN55knDLKO19jpfDegTBcJXpRZoEVB
         ztXNGwOkSxyCklec0+2CxubmDO7tkN1ZszmcIsvvx8fWO40rCeWnjbrghyPIRn5+XPRA
         ywepkS9P3QOB7EVdB6V/NkRteFQH0Tun3Z+OPolhaXfRboKMrcHXszta5Jjd1GwWPt44
         QdJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqmaulPQIp8YFJZpaQ12LBG29N6ZpaddBaD3ekQobPYn22a6/cK9hEABy0L58LkaXwqNSydDF/LCMTTG8=@vger.kernel.org
X-Gm-Message-State: AFuF++n1xnx4oBvlaxJ3blplmk+CthSGhuwlZ7kzOOU1sVCKl7og5J+r
	0XfbnM3/fxZts46aBRtWSxL/x9LfNlkHfPRrR9D8KlMeAgnYKSRzHlUnAxbW3IUV
X-Gm-Gg: AYBFou1OWa7dkp0HzzUm7G07MfUdCX6RNNnCYQVaKnf8Z4fJmY0w8jan0QEtqZdFw1D
	OTwPHmgrvwInM7iE1OetzZKTQUH/3F2xVMLpLvAjE8NFyCQJnbg6Bs+675iLlJ046I4tb1vLMqt
	1PZlJXLJpPX6XjIwY+zSrAmK3vPzTCLnCIQTK5SzR5+TrEa2blv1gIx/18EGT1ocbSd3EQTFsjh
	S+pigQ1YQOk6eC8HJeEZdG2Ue9ncydZ8AsFRbZVfS6oLzvUDJthz0rFbumueaVLbczF52uCW6kN
	gyKV6Ew3TH8VIeYZu8YgrUQKaR6rHpW+d6XgcwqjqfUvWi0NYzRkNUSK5qV2oLh5Ws8NPjgu/Dt
	jRMFUJDFyPJxfNVzEB44/sPXKPC9+mJBIKKt7TkQcRaliSoyXo8EIzGv9V66cMCn2eEpYUIPBvq
	YtSlWAhCC4I4Oj8F4c/R4BAyPQ++W5AguYVmUAKnHVMyB5/NC1KmyJd8mGdtNPe3yxtQV8Fymhm
	6zS/u4rYHRKjCnJOuS+LoHIbwJI5jRh9AcxWbmA3lul
X-Received: by 2002:a05:6512:2396:b0:5b4:5f6b:d43e with SMTP id 2adb3069b0e04-5b5e68d9e4bmr5364758e87.14.1788082398764;
        Sun, 30 Aug 2026 02:33:18 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5ad9sm1477182e87.7.2026.08.30.02.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 02:33:18 -0700 (PDT)
Message-ID: <ab8f1a0c-0666-4b7f-884a-55f9f26a1ac6@gmail.com>
Date: Sun, 30 Aug 2026 12:33:17 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] iio: accel: kionix-kx022a: Prevent memory leak and
 fix state
To: Jonathan Cameron <jic23@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Mehdi Djait <mehdi.djait.k@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1787901813.git.mazziesaccount@gmail.com>
 <9e4453fcc00df6ec988207df8916226d18aecb20.1787901813.git.mazziesaccount@gmail.com>
 <178805296127.2788519.3966625158499254314.b4-review@b4>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <178805296127.2788519.3966625158499254314.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/08/2026 04:22, Jonathan Cameron wrote:
>> The driver allocates memory for samples at buffer enable path. If regmap
>> operation fails in the kx022a_fifo_enable() at the buffer enable path, the
>> allocated memory is never freed. Furthermore, the state information and
>> previous hardware configuration(s) aren't undone, potentially leaving
>> WMI interrupts and buffers enabled, or driver state flags wrong.
>>
>> Free the memory and revert the hardware configuration and state flags on
>> error path.
>>
>> Fixes: e7123a4dfcd7 ("iio: accel: kionix-kx022a: Refactor driver and add chip_info structure")
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> 
> I'm not happy with the label naming.  It had me very confused!

Hmm. I suppose it could be more consistent :) Thanks.

Yours,
	-- Matti


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
