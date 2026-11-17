Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936924;
	b=vPwtJ7S1fZtLbd9bdU4yGLKSGgWoF/e4LYp0xm7Y69iV7upIsWWwkVHmH8+Iu5BVHYo7
	 bZkIyWMKj5iMtgXKwnyqBMDyMg4Et0GAmV+T+E4AAeYguQR7IYZDnVFhm9THJRdLxl7iV
	 OZi0s+vIx1pK5I1KDBMznsyWh5Xvai6a4Va4jN1IbMpxf++K1cpFSnxM+1x4lD4sVekw6
	 JQRCBUSeP21vXcU/YYU/yM59fhfHSYVn3UWweuiJZXDHXU5I/AY04jyENIFZc3cos92Vd
	 /3kn4+4lFxVphicyU0KAj3kc30pq1dFp+3DPWrFjeTQSPcXwfgzqtrl1EnS/oKvJDzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kaDKA5hattAHds8mPaKS6kzZBkSpzp9jS+jIHno12Zk=;
	b=F5jova7RlH/YsP34t5W2krcooIO5jdHOpYkpRjGEXaFk/MhfxdYpenzJshSFppbmk751
	 knEVnAeiW2sOfa+iu8vNV5D9CpfvxRMdwolhO5jZHtkI3M9VgX7yhnnuo2hyrppQyIQUH
	 y1lXaJOwLKp1Vj18y2BNWLQhmMM9gcHjeHE2pnO1vNMDI1+kvry7gck4+W3czZkq6e/Sc
	 synnXr0KPROdr64KsYk4yRTyacjyLZzZB9sEmK28ecE0TXmd0195xl+CZ5xNGWt42Kj27
	 nIKup7YFB8D0RKymbxgnXEsv87d9HWwxB/UsJAEVgSG/ooNIHdn5vGn/f4xk9RxVWsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYwZY+rj;
	arc=none smtp.remote-ip=74.125.231.131
Received: from mail-oo2-f3.google.com (mail-oo2-f3.google.com [74.125.231.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCBC606A890
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFCBC606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYwZY+rj
Received: by mail-oo2-f3.google.com with SMTP id 46e09a7af769-8459f7bc7c0so500a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936922; x=1795541722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaDKA5hattAHds8mPaKS6kzZBkSpzp9jS+jIHno12Zk=;
        b=NYwZY+rjroQjkCW+S+pwjlaO1RVFDDHzNFUYWfiPpc2ZZOOV+GLWgZS5C4tNtKgcTj
         R7+XKsaXt5IZE3jX+ON0+nMrNozdjYFfqWixuKZONperUFZzoSwB4v3eI02n8a9iyl6d
         clwKBwSDL1EJf9jFrwZM+AUBNcW1GKM98Uleij51X8ZRZRvx9PRTOovTfIWHtMxZHIsI
         ssNA0bcVyUQE9Nr+usc3Gharui1AwC64uf2TGdAVLHQOte88iJkOL+pIQ09CM5oiZJ1D
         e2nBTUhrdkHfhieASi/MxHGdZp6qU2uW8WbDKDwUjJ0mfwYZ/HAdXDMc4D8bUZsBU/6C
         qYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936922; x=1795541722;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kaDKA5hattAHds8mPaKS6kzZBkSpzp9jS+jIHno12Zk=;
        b=jwveUj2KzfNNOJ22mQCAtaTzYAtAQfOrXZF+j298zqL75eVIF1UGPIFXXkjUMp2MoO
         SeILu/Ghw07ZG8OJYyGld8M9CwzOG6PxiardVdiplpyUSSTDlALBlA+gptJRCqn1dDpx
         Jg3xbEVPHocnKeISiFL+QqosTQEQnpA46sUjptraYskEh4yLnA5Q7A3p2dFyg32KEhmt
         lt5vTIMGGHHuuUBAmbLYXxqZjteaiheV6VJvfd2VUJjyFUJF8f6NLW8WUOW6Ga4JhR9J
         JSusoNTDKxh7xa6Mq4VHci/6JghBoYUiuDBeUmlJp1gXC/pJ3i5rZ7vkKsA1Q30EhFDi
         82Vw==
X-Forwarded-Encrypted: i=1; AL+hErFi+ejOh5l3XYtj00ftTHyX1PYGTjr2MM/uo3nX3zBa9J7YZzsL+/9+/d+Sr6BZZciwumVmg+gLTWepoN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yRIgt8SCSkZpbNJF5E9BovKKTxmjYqBjJTH4cfYKgFLK+GW9/
	3s8ZE9McYplbIviAjfuEIZ2H0QIEVAAz97eOl0J5X5L8N2yZbIKXsM5F
X-Gm-Gg: AYBFou1UCLeGdQgQ1W+DxTu6GF2bNgmn6zffE29+I37K8qSbiTHcarx7VOXRG3XLPAf
	kZ2Gb3xoLZftBZ/AAvx5jCA9SRgvUl4qFSRF5P6U7Tq3uPRHyTksfYf79HJqnyUDg0haHyPwS7b
	DSsc9mPffJ9I0pcJgi0wxbir+6EiCJBe3R8O7iGaQCXVKMiS5oGsW7oaZSfT0hz36Y/qBcZgVHA
	KvqfrstBPS/02vOgZHW9nSMItR/RNh1b43+uvxNy5Wnv9Y0CHk21dW24fHEtZuARF5HD7ed919L
	FUgYnf/+Y7DRhzdZKBQ4EdVukjVovqUH7IP2zcov6JeTUn1KMx3uGck/Ehavrr01ywYNQGGmXEu
	KS7fEOn74Ac7yghEXoYCbKPxOlWKZfDxbClx9VXyWaJRSPEr9nvbEJoiAvgD2DeKGnL9SHGlf1q
	zJ8AnRCJbf4PviZpbof5VDIhUDNtys5nPuyAbyic/DT4DR/q1Cw53thTgBKJ3CrGcgeS2grm93c
	/X/l6Km78QMwrPM/QxZ9pcTYN5/z6snSH/dkjGfOUHcrp6oLq2xYEYpJYbkqKY6w9VHHP4QJU1j
	P5YvchkbkR6pObjVYIpBLB75w2SmuSUVrEgJENpwQin2wQ==
X-Received: by 2002:a05:6808:1925:b0:55c:888:30ff with SMTP id 5614622812f47-5774240c0a2mr429178b6e.45.1794936922568;
        Tue, 17 Nov 2026 09:35:22 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::d500? ([2600:8804:5716:d800::d500])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b70bfeddffsm190834fac.4.2026.11.17.09.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:35:21 -0800 (PST)
Message-ID: <4c64aa52-2b75-427e-8f26-c2ef7fc5b822@gmail.com>
Date: Tue, 17 Nov 2026 11:35:20 -0600
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
Subject: Re: [PATCH v5 0/2] iio: adc: add mt6397 PMIC AUXADC support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
 <89c8cadb-0ccb-4aac-9b95-89f355beb24a@collabora.com>
 <60eeaaf9-57db-4ca7-b4f5-bdec111dcdbb@collabora.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <60eeaaf9-57db-4ca7-b4f5-bdec111dcdbb@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Angelo,

On 11/17/26 5:02 AM, AngeloGioacchino Del Regno wrote:
> I reiterate - I couldn't pick the series because, of course, that one 
> depends
> on the binding being merged, otherwise the header won't be there and 
> the build
> fails.
>
> So I can't pick the DTS until the next cycle (granted that this series 
> lands).
>
> Cheers,
> Angelo 

Thanks for the reviews, and for picking the binding and keypad patches.

The AUXADC series has already landed. Jonathan applied it to iio togreg 
on 11-02 (the binding with the header is 8f809aa84698), and it's in 
next-20261116, so it will be in 7.5-rc1 along with your tree.

The board only uses the header once, for MT6397_AUXADC_BAT_TEMP (1). If 
it helps, I can send a v3 of the board patch that uses the plain channel 
number and drops the include - it builds on your v7.4-next/dts64, with 
only the binding warnings you mentioned until the trees meet. I would 
then switch it to the macro after 7.5-rc1.

Just let me know if that sounds reasonable :)

Best Regards,
Ryan Brue
