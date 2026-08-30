Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B3E3822BF
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788075437; cv=none; b=O8OU7Q87dmXCmJuENkRNhywQIqk5ng5Hlw+NdGVo0fIeP0BOYfXMwnX5mnRWrfLt+VSPyxP38XrMrRJxkwXmsA2uR0gdwTiWo44xEh1NubfpzxKX5e0fX145qHG89OWqGGpK74DF8ehSFq1hQetchQ8BlT/tS7Vj9Gsq04gQ3AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788075437; c=relaxed/simple;
	bh=ASrGp8zTgurRcysp4W2GZweU1AMnNyJvAleGf5hP4hA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=AZH/Cb58IYmLWCKX18hJXGAL8GD8J0tfHzaUG2kMhkfnx4xs3stDP9Ea+quwl8Bs/eC8zeVU4kR/OR89lh7qwYV/d9/0ks3HP2l9kItgC8yA6kWS8ukcbxtrbkw9P93YCgWvi9L3e7VkD9N0Q7GbOmAJ1P6XEgILpzEwVlLhrXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rkwh9Goa; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rkwh9Goa"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d712281f8bso27458425ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788075435; x=1788680235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASrGp8zTgurRcysp4W2GZweU1AMnNyJvAleGf5hP4hA=;
        b=Rkwh9GoaBrwMxLrMfUsl7S+1x6p2Bwz1AeKPE/4rr29GaMBwPpV51logrpAE6tHP5S
         Oi7bGjH3qMdEuyjed6hvp4Ge7KsLQePC1MuZ6W5ac5ZZ1acqmxfgTqXG2U2pt2p2vaH5
         +wDhwCSqzEsQxYLwtZ7NubB0srAFh15SCG+UkqN3+UINEWYAB4OUe1mH8TFapv/KlJC/
         A6XTlwUAymM7gLQDtTKjZgZV7wxBTsg6UekgBLg7mkrMV39G0nd486M0d+1LD9FaYt2K
         c+RViA3V1aeENSnqqNW7zguXV02dMmnLY81b5/DY/4l/DjMGNoxtLID8U9WGaQIwyKwk
         XoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788075435; x=1788680235;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ASrGp8zTgurRcysp4W2GZweU1AMnNyJvAleGf5hP4hA=;
        b=S+malaiJVGiZGn4FvTxD9mySpFEod2E2kQbA1NfKHsQ4SZB72vvITGZu50wA5yHmAd
         nVddfd2pXfdnz0N0010yjGll0WeOn/h67jTrZC5P/Soa54iYcY8UFxITiX2lIsCzCM8w
         YV24Jkf1J31Ubp0MhL8MfMmVq2tgHZFPrOWrM2ea6ExYOx9BWRwD+/UsP54DK5nG+LXb
         C7TbHJLYSPSiD6Ky3FrCKQwwMajcBtdzWR0EEHfs992s0eK4auzO5VQ2Ph6ATzRxsgY6
         zyiElLAfl20iy0C+XrQkM/QW1FnB2TmuzOi8W88JtThnfNnPrdskRQTtGhqFQiGacKkp
         CZ7g==
X-Forwarded-Encrypted: i=1; AHgh+Rr/iOOhPEccSBRo+CN1P5VpUyv5Qs0kctJ6RN0bC460D68GN/h9zGHcC35OjGMu1oObjcoZnO4CjJlFrys=@vger.kernel.org
X-Gm-Message-State: AFuF++m1yByUxjxmpktKorXnm60d9sqJgz6JPh7KlFCL3lXnWJ0/iI3n
	P4541NkskXAC/UIpJoZnFiJpxwpNW9D7HuOxUFZK1DqHQl894Ssw849V
X-Gm-Gg: AYBFou2q1qDBAGuBgOcIv7Yt9JfjdPQsjI2Dx8tipncO+uIPClo9f4cRm7yxi1hRoDw
	Sfi/2ZiwkKZiuoAvAjUya2jAqw1NYQ0NrRbkCa7mwRGlLIHlerjHjR0m37lveRpZJHKsX1tOqc5
	nZX7Wx3LePlgxHpBRA4G1ypMjxvARviXS5sPFfL+euLarhABZgJa4PPcH7F9kVWe+ttOYcnqy0g
	m7nU740QlqLlCwburU/11C8SqdQq93DHJiqDrWsL635VthNlhHai7tjddJ3P2k0cu8GtIVXzjTk
	QzFKM8ibbhL5TZlrm/QtUJ6+s6pZhglh/ApcK2bk12EPrtu3VpvVWJ5DD9tWtUjuNn0mRy6dfmc
	VtIOOFM/NuLMrsZoN4/COeeWPL/n3pyUM0R1fxEcXlNjrenAc5fcrCfTrp9feTqKURjRuAI8w0Z
	0XGstus98PVRuNYoC9O7RF02xXGdAJvhN39bPgiRzbQ/qaX+wPVAK6Oz0tayDPLMPPx5f2AL5Vy
	VYEYqL4yDbAjMecr0ngHUbB3S8yQHIvWcL0sD72Dag=
X-Received: by 2002:a17:903:1a2d:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2d8d4ccc92amr160990335ad.17.1788075435070;
        Sun, 30 Aug 2026 00:37:15 -0700 (PDT)
Received: from [192.168.68.67] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm22814491eec.24.2026.08.30.00.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 00:37:14 -0700 (PDT)
Message-ID: <edb89cda-3c2f-4e1f-a545-2f2fe52c8b5a@gmail.com>
Date: Sun, 30 Aug 2026 00:37:14 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+muzafferkadir.mainlining.org@kernel.org
Cc: git@luigi311.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, megi@xff.cz,
 muzafferkadir@mainlining.org, pavel@ucw.cz, phone-devel@vger.kernel.org,
 sakari.ailus@linux.intel.com, tomm.merciai@gmail.com
References: <20260829-imx258-add-reset-gpio-patch-v2-2-bfd27891e225@mainlining.org>
Subject: Re: [PATCH v2 2/2] media: i2c: imx258: Add reset-gpio support
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260829-imx258-add-reset-gpio-patch-v2-2-bfd27891e225@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: Rudraksha Gupta <guptarud@gmail.com>

