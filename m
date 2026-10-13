Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF69493D50
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920161; cv=none; b=aLBglJ5nWbKxy/n4EcXhrcjLdjXWEd/JIFa/YC8o/dj7mBBKJ4o4DBaUNVvq8W1VBr5bFM4RtbMkzdY9PqI2a03bFz4gLik27N01ntiwdNGwfcB6R1DBEhLxYqBOu/9xho62Yfy6pE4sPANsDLcGAzEtatJynFEnztCIIL9/nAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920161; c=relaxed/simple;
	bh=iqhwU817Bh8wtwkSFHCvKH199xxOPA3S/QxigndqQ0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o1NeVxzXXCRPWF2o5zawOMVgt7lpaHvss+k3Ld5de0RxW7sBYAAnmywsGpzOca7ZnI9Bzsqt/BkOchPrApF5MAfdf6BQEI8SjKxVzMg23TRtDeZYuZxIvvj9yN7hCXAomfZjzsD2hRG7De6wqtMJGksS7Rtz3k9mgzXVYwL+zu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBA/c04d; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBA/c04d"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso477130566b.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791920157; x=1792524957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ygjSuqCbowZLjIljPoawIjXxQn8+JXgOLFh5Pk7xYdg=;
        b=nBA/c04d03+4FS8zRFlxSo7hE+ocg/hFKDlZJjyCjvMDyfbYcoS1OYE+Zl5jkvaLi2
         dEEhTmXUkExjqrc+5fn2Xj3j84DQZDTUqK07nTDS0nc2yFz/Jpqoe86J5PPJkkh19jIR
         1PApW+oxSnf18GRALq1oS2LhB745qTTJ8RlbiaBM89OnBEkQ0kJ539o78Yl/JDN0lL3A
         epMng4KcYsLYc4j87rrh93lz1RpBz5+SY0UlF9H66FMDT9gNDenjVjR9hDlUmisvSmi5
         FHtRseykRoSX0dgmVwkvb/jc+ImjCukLqV9q+Pfe2uD5VwTMUJqdyEWos2eB+l/3HP6V
         HU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920157; x=1792524957;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygjSuqCbowZLjIljPoawIjXxQn8+JXgOLFh5Pk7xYdg=;
        b=BHH/p8m4ofmYWvlnqSuOrXjNJYI2YORQhCX//avLjwhnJZst0FmmTAcTobJR0J7zI0
         mKyVp5UQT0OjZHIhI8nz8M5Et+eT13OVbsg+t3MAopDUUX13YLEpf2oa8DAq/ULzTdip
         69yRSr57EjodoiFaCDPm1FyO7UDNGhzQrGsPv828MbOng3UQuL0KeKiY85tZQgL9/d+K
         xrdYEj8FfXvXvUyWXHmIRQWmgb8NkVOZTgCK9ISwRr/Wo7lEk/jZBZ+LLfX9/7Vjos64
         gEiQtORDfAJErZVHMjraB1+/I25/qBJZW4dn1yylj/68+YlvlAcOnpyjPDCnwcFhJphX
         +94g==
X-Forwarded-Encrypted: i=1; AKwUvBztdd7ewLDSc2MVFC7zEYXSMOmS1iAFl5lQQXaQdRa8pCS57Ne4D6NJdBh4VtJ4z90WuucskGbukxEjwUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtNXS7URHPjmRTksnzPkulwwjDA9fxaJy9GbZbdUzxHJsdKy0O
	zRtvokjYyVGL1sNAz9T2cogeqqcSdEu1B0m20welOaPqrtOoyY09oV4W
X-Gm-Gg: AYBFou0ZVrgbuML+FZi6J0naYoh9XTUhqPPA3yBTtjFnK827mFe+ozDu8IZQ49vMP8Y
	TdifN7owXwnnWv6qfzj2xmQ9V7dIpOnjxyeuekzpL232+VRPC3vkXpP/uLNUiPBx9wHrsqhT/q+
	bQn/gSpbIctH/8z5tpc4ZlaDDJel+GikVaUeHMRkW0aXX1eOSFIAi+6XvSk6NnjOejc5/1LS3ws
	1s9n2YobRM1nuuQkOjVsWSdFkkJ0IcDjAOC3/W7LWGjhN7QGwnbn04kS+fplrUGO5i1QORAzECN
	Hqa0g4lb/hPBpdM9OfFeFuFGWrkhapVfv2U0vrAmE6qex/l7VE5D501C1rFPgWOVDPuifcG7uK+
	OQB1Cs6LbRsNLQpcmXicc9SJRq7zvL3dbpCj5rNog2SBjH/8IjUtjHtgITkxd0sqsuNHjRiBwcY
	LCCdfOkowQHMHtzxHT/tqCJgIl+iKQI4M5aYQ2Cwx7t1aMmi2t51fVMMnrabC/D6khdinDsOeTJ
	X7ztdVH2EzA/KijimQN
X-Received: by 2002:a17:907:9485:b0:c24:e1e9:69c with SMTP id a640c23a62f3a-c31a9715f94mr1282040766b.0.1791920157246;
        Tue, 13 Oct 2026 12:35:57 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203863511sm232266a12.20.2026.10.13.12.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:35:55 -0700 (PDT)
Message-ID: <f401636f-7edb-44dd-b47a-4c347d33ed2d@gmail.com>
Date: Tue, 13 Oct 2026 21:35:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] leds: aat1290: Add support for AAT1270 Current
 Regulator for Flash LEDs
To: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees+treewide@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261013181803.496627-1-clamor95@gmail.com>
 <20261013181803.496627-4-clamor95@gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20261013181803.496627-4-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Svyatoslav,

Thanks for the update.

On 10/13/26 8:18 PM, Svyatoslav Ryhel wrote:
> The AAT1270 is quite similar to the AAT1290, but it does not support the
> Advanced Simple Serial Control (AS2C) used in the AAT1290. The AAT1270
> uses an earlier version of AS2C, namely Simple Serial Control, which lacks
> address-sending capabilities.
> 
> Differentiate the chips by using a description structure with a flag to
> indicate if AS2C is supported, Maximum Movie to Flash Mode Current ratio
> and if flash timeout is fixed by the hardware.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/leds/flash/leds-aat1290.c | 91 +++++++++++++++++++++++--------
>   1 file changed, 67 insertions(+), 24 deletions(-)

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
