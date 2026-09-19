Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B112F39B8
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789824357; cv=none; b=RuX39qPBf50C36pf6M7xTM/8CsdO27tFQunYCsQYopfUtKAGy5N82yDRD/sMWMQNwkDaS9ReDNP6AE6Jax/nMHg18bP9WclW/FLEqwgcjcwh6FwTG6mzAQ1VR6j+0n2kgJ0kd3VeSTK2ACG5hGwfpHATaNOlVTq6dyN22tsf8Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789824357; c=relaxed/simple;
	bh=r3HXOtYX15ksa5Y7XiuBMlOv1mTGOuU0Z7hWlnHyZ2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Rdrw829x7KJaKaVT7/HpcxsGzzmM3pwOMZVWIu0HRJqEYqCEQNOAFlVkTHApP9D/wjOgD19A655tYmpmFXAmGTyH2i3PumesM/iLQCkURLKQUR8cv9JAlHOct5gB6zByBV7oIZ2oe6GzNo0/7bBRBzXTPUiLZrM51LbMS7LTx04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TDicbROm; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TDicbROm"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so547555f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789824354; x=1790429154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uq+PPxMiRAqhAbb6KLB+BVIaIHgARkrWQhfVObJDBT4=;
        b=TDicbROmUzQHu+30xP54hVbFlXmn9GBK6JTDBru65lyHZRnrRS+U+IvBzSEcyaBpm0
         zBaDf/C0aXwXrXmMQeMoXHS5PB+nvO2kbgVYv7UbKehHwMRVS7+IP/T3tn1e5lTgow45
         ZNBftE1N95vU6bXrH5k7U4IGoP6tY+JGD/XBeIfsAxvGLBhaNUYLrPB0N9SEGKtOmJJY
         1YMb29ryTY+Xrx1ZujdDAG2KFeAeZveZSGPC5h1mdYSyvGFWsimwC3JYKMh1c59uWD1k
         51SNghMuz/JjRvJUO1WDZfZZ9++lMEug7cSvDowcaUeqQYoOGFMTP9JMniiyKUXcY5XQ
         6IlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789824354; x=1790429154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uq+PPxMiRAqhAbb6KLB+BVIaIHgARkrWQhfVObJDBT4=;
        b=Tar6Z82M/yB2vr4V1Q6gKXZJJdGvPGngu/ChXuvxjyQPuyX7BZiNqWRDzooisX3SU6
         Stx6yukxBexJdJfEw3TEjtdFz49Q9SG8cI27y0tfV8WaPuedanlzcJnCFSEywmB2qLZq
         X0qMlwZCzALiO+KqslZQu1X9MaoF9Q3zYsq2Bqbc5QpOzFg9jK1IQEDBQBKmSRjrmqxi
         Z4zKR2dgfUunKD0BVn4qIKs3U9umCFHMHMd41mC04AhmVP0jFHpM8Ed7d7V5lY883gc7
         9CfxwonQbnPfcQ3W8fiwikt+MoyvL7Bo6CCnAe9vV7xVsBqmXt+UIjmLCKHnarBf0DBA
         I8pQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC+KLg9Svv0PKu2aW4xPY4RL0GJYhEZQuWm66oBGA5BKj82iyk3ni8f6A+hiZrGuCExFFLK16K5shHvJo=@vger.kernel.org
X-Gm-Message-State: AFuF++nFEGEkBwAo2x46Zbnw0EVBC+J/xNcdF1GH30n+96uiY7JRLzQd
	iimud5+U8sgCx1ImThp9WLRZAREghML8lMTE7hoyIFjtt8NKkyh56fHSgSzhNdWhZ7o=
X-Gm-Gg: AYBFou0/VVEgxhEDiqTizmlTOFqqrq3oPV6uk3uMwIlEp67BpdIT+mDvRFC5xrd7xZG
	0UKLLKAF5d/oBy9cwXVADnow3OxzgC34cL8jwgcRJPN+t/ZjJ1+UKXveN8l2r7jB/9UOV3P3d+c
	gdkIpQhMl2DXJQZbm/FBYZME2Zs+Os3hlENkINwkQUpjRG7gOs/7saMmoYPB3HSwVWWwsWFFkYR
	QYGvbxeXjR5fMC2vp1Rk6m4OCt95N8PI7Rj7Th+CZdTxlvQncZxRgC/uA85/uKfZOGKsg+G3+as
	XU0hQjSWurwLrsOTnO0vLeD4vYzJ5+lG86tT10u6KD26mKgBtL/PYf5Nv63OppiJSJLoSD80lRX
	bnoN21Uogy+60WgCH2HJxjFc+VR8HlTjGqU1bHnFD0MBykL2J7oBXSp0OsUVxsXpYz50Jel4Mnl
	cWFOhh1R/HhOce+MT56OXNKk4KB5vO4hQZ0svb0VzSPDYVOhCO/X4h1cEc37fEGFCdLa3rfghAo
	QHMxRbmRqW4Gz+bJToPUkiIz4pbPnm1AReGrO1IUFZOsYQne2u1f3UA
X-Received: by 2002:a05:6000:41cb:b0:486:fed6:d7e with SMTP id ffacd0b85a97d-4871db11bbfmr9104336f8f.22.1789824354231;
        Sat, 19 Sep 2026 06:25:54 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460898sm6712256f8f.9.2026.09.19.06.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 06:25:53 -0700 (PDT)
Message-ID: <e854d8f8-a010-430d-bd29-03726fa6faad@tuxon.dev>
Date: Sat, 19 Sep 2026 16:25:47 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/17] ARM: dts: microchip: sama7d65: Add ADC node
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
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-13-varshini.rajendran@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260806074024.531259-13-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/6/26 10:40, Varshini Rajendran wrote:
> Add node for the ADC controller in sama7d65 SoC. Add the vddout25 fixed
> regulator node which provides the 2.5V reference voltage for the ADC.
> 
> Signed-off-by: Varshini Rajendran<varshini.rajendran@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
