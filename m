Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A382D2472A6
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789823887; cv=none; b=h+243yQxnU6je23UjTNDQPBvwG89UcuuqHqL2fnNS6YXQuXFuqoRje+otOJ11sZtodhS+9hCVLe0+dQ+vIb65aK0+0JVxd6NJaH5f8qZ8RG6y5JEVxEivwLIvR9czx+nHdVUzD5Rf+sMo+N//KYqYFWX39CfmhRpaQkLucYpbkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789823887; c=relaxed/simple;
	bh=mB6gjqFVNYugWLU6vwXbHJZfq1pD9ilhYpAc/8L5b3s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZIYZfQyARDj6mm7pvbsSUTjHSWEyGEAw5uv0hx0KEofCkq0QCJRrNXc4V6TXsC6L6V/wqk5B+LcER/qn2tED6XIve++r+rSM1c+ntF0r1jp4F7FxMFvuzngBbsO6tAIeX3Y6rtH1YGx8iN0mlNsxUUfFyiSgI8EXCWZ8TljaTZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dsERdrM8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dsERdrM8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so22163825e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789823884; x=1790428684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ynO7gNGl3+DgbWqmrpV3fne3h6bOndWTZo/kOSRwgfY=;
        b=dsERdrM8wrzDZbd9rXNU3oCESGOofGLcz6iOubTex+qe39SL58qh49bFfR1DZ7eIX9
         Ng9lpFI7U54dH+tPW93s1HVi/OZtiSGUR6t9+xhv5tccEiQTTOFMST/x3Hgv8vr9vT/Q
         C546bYIXv7o0hRsmnRuPosOs/9pWFfkiZE0mj0PWQlkoqGxKw/c2C8dWL8CbGLG/ZLPe
         Vrf4pGCZCKWqfN4b0OGdZZzBLK0eQe8Oiux5h/I18I+Y8yePLLrKmHgwu/P0TPbIzIS5
         /IlptPZyJzwkCDs+ihKKcw7TBID7gXwwNlJCVCY924uDpjhgEp+u/FuUfzz0GQhveycm
         GXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789823884; x=1790428684;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ynO7gNGl3+DgbWqmrpV3fne3h6bOndWTZo/kOSRwgfY=;
        b=sGmkqcaACPYEiwB8tBfPOcsMkSzIBzUrqWa7+JTTIksCOmnGcAzw4XxABKj1bjsm5w
         nQ/vgIzWaVUZH3M/YrJpMr/JxL02jP53ThpI3vvhMc3nrncKQpS3ZqBsy11wu1GS/UE5
         LlSovGuUhiY5kPg8CCV8QgOxF8FZdA41knBKe7lxDyn+tGcGXMRAGLoj1pY21iQaB7dS
         fDqDzMcOyID9dSxqKe8CkT5DZ6zb2kxFJS2+YPMKAqhC+sLUkCtSizwesKiI73i+C4Je
         4PHyaqcE6g+F7ph2g2GBtX1CAKhGG05td+yna5klsTs1tWZcVYErRYGc74Dl1SA478MB
         XKtw==
X-Forwarded-Encrypted: i=1; AKwUvByGNlIJUeze5y155+zmD/njBn4tIoLHtCEVt44cutdQI3A14E9tPV4v4uV/5elzO8wY63qCXJ0DVlqc7FA=@vger.kernel.org
X-Gm-Message-State: AFuF++lkAtwQMHmQO5Q6wXYfl+ysqMzuYvQI3OVcrAR4CJPnvXnhctdO
	lKJ4vCGXthNf8WFjz/1yvCJ4K6qEF0u0N9itz4HR83v16obSzEi+GkgAm1fFLot30W8=
X-Gm-Gg: AYBFou2CC2RnFHIM62ArVAcIqA5ZsqoxPGj9mGABlkKT2hfCDlvjeBu6jLumFeSAiqF
	6k0KktILS6ZRQ//CPM/MvDf1q3pVbeIlZtiZ0uyfjadQE2G1Hst/PFLlzP+tJpQwbimzkCripu2
	DO8xSBmzWfkLePDb30KmvFVcF8WjuY0fAwG+3pSsXmIeQ9EkE+nwi0dSOibqoBmT6eZvH+ucwx3
	o1xrau3Ir+FOvo6tcvjJZR6ePFZus+ObrgtCpB+IpW81j2rWLuUXXFU8uE0Ht5dw4ANcfx7ZyWf
	CLKkkPDBFdslF0SRFyjMrorSTDITOAtEOtBaktC0n+qfYWdZ5Za16vMYWhKQ0Y87LmKtIzCzFhZ
	z25lkygdDKSeuzuzdoPSTzLUhQIKAhQw1b/b4OQXf63fzzH8Kj3NxyAXsznATsYUu/5dhQ/eq/b
	ahfqpjVwxxoBno0LmhQrsvsoR+RYnMSGSMkb34bVp5XhvYTiZVU9e3RRUftPwMBOF3M3TBG2oAb
	+lRoK2OxQ+HyavJ9Jt+ntgxR71AK3KHJXAArrmcwA/mEtFXdnUzj6sOLtYuYy6yEw==
X-Received: by 2002:a05:600c:474e:b0:49e:7cff:f8ca with SMTP id 5b1f17b1804b1-49fc5743c69mr71850835e9.29.1789823883840;
        Sat, 19 Sep 2026 06:18:03 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd2f7ef3sm70658255e9.0.2026.09.19.06.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 06:18:02 -0700 (PDT)
Message-ID: <275bb967-21f9-429d-89fb-efb8a498f388@tuxon.dev>
Date: Sat, 19 Sep 2026 16:17:59 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v6 08/17] dt-bindings: nvmem: microchip,sama7g5-otpc: add
 sama7d65 and dt node example
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, srini@kernel.org, marcelo.schmitt@analog.com,
 radu.sabau@analog.com, joshua.crofts1@gmail.com, jorge.marques@analog.com,
 Jonathan.Santos@analog.com, jishnu.prakash@oss.qualcomm.com,
 antoniu.miclaus@analog.com, duje@dujemihanovic.xyz,
 mazziesaccount@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-9-varshini.rajendran@microchip.com>
Content-Language: en-US
In-Reply-To: <20260806074024.531259-9-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/6/26 10:40, Varshini Rajendran wrote:
> Add support for sama7d65 and a dt node example that shows tag can be used
> to reference a packet stored in the OTP memory.
> 
> Signed-off-by: Varshini Rajendran<varshini.rajendran@microchip.com>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
