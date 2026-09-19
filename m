Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F1D30DEDC
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789824211; cv=none; b=sVGObBIcGIFQGpsBEUz3U/0Bot2+gx4kv2woMW39NfWZW5SqN7/uMaw+g0LcTvZ+BKP/QcmORfRWsFi3vZWrEO02cKTmZIaN3VZq7nQ7jfZINEb7Lss+4WFNF2xghMY/Jk/YxCrmnhCJzhmhpU5pPWMom4YV/cpMJ1zDPJNzjIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789824211; c=relaxed/simple;
	bh=oqu1ZjNxi0F3UXS+4RXdwI3lwSHWQEMDLX/P/O8dKSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JVZhhdV90FQOX7Jt/zc4h0W7qJsqvVwStl801nEJI6xBBNuqciYqXHS79jg8lSFt4t7+0WM0tKliNC8VNvXe1zqdt+oJidg7wD8e0vUGP4o3cJveix1FFdK36gu0BKhCHzst3ZJazq/SkvxMzhnlGX4yRafCzf02HIVZcYLZ8mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pKoIexRi; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pKoIexRi"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso834509f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789824206; x=1790429006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6FrOEEciDq9ZXU99OtyWWJL3jqDBzGG33W1ecDR5UQ=;
        b=pKoIexRieimSr2isT9jR5N5g+Jq/8mugS7/5F6o75d3c15fMRhPJsCCnInPYowSY7Q
         hiCIRQdcHEmWJdJjrv/7SdlmGVAdO5USuTFKOZl79fO0q10YxY1OBrBH3uVkplD2AY6Q
         XtsU04fk9AaGRbw+bjaZEPWfGbAhieLALL0f13jL7f9yTQcRlR73Sopigvmpyd7J571p
         P17VoP+b1vE4vG/jYay1GKVJXk/3/5MUY/DU/M9unzi22AbQ0+NW+tyxnoe9tkNftbju
         Y1NK2TS51nsDJ7TlPXcT85rGL4Ux0RQ4G5nQjzo1/NyONm3sESoeRupmEQ58vG7cgFrG
         Vk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789824206; x=1790429006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6FrOEEciDq9ZXU99OtyWWJL3jqDBzGG33W1ecDR5UQ=;
        b=n0EF+yyQ6gJwSc5gglANOYDkwLcut3xlBltLjwNMOPy3QhzotUzJGuNuyCyA2h6E3r
         tispv7f3Wwv54brWAPdxtYVYwNXZgbjWjI7t2O/S2YRecdbGMP1dczDkFuZx7zJp4In8
         d89/1NUS9C8iwmfMMM4djKh7rRTi5YSN5o2BFn8gWFFgUmToPZHAt1aQSj//p8tCBqed
         zFu9QN0knbpmPBfCXbSUL/vpeNfy1AulPavi28ibf1tGDH+rGlNXcyybcWV/m/JdORQW
         Mn5ByQnqr/ZFhQ4Nzsvm0qhFHCW8z6zNGBrTW8hIg/hKYIVugy12ZzU3kWNsRdXpWMVy
         I2Ig==
X-Forwarded-Encrypted: i=1; AKwUvBx2J7wM3T1LYTRoMX+zcTtilO+Q4UX2Q70UoCvUApKs/1bCJMGUG4y8tUD78B+pCBayAbouCly8aEWT708=@vger.kernel.org
X-Gm-Message-State: AFuF++mg6uK9ZNPF92+TL8/S+Ny/VA/1+T6CncHdKmpbnTTwt6gvORSX
	gkbNqzgXDPaunzSj/J0g8K7EBDPnxnu9H43JQHRWAWZzfkrlDABHpziWwWM+NjHdF7w=
X-Gm-Gg: AYBFou1UOvFKNJD8vHC+0HX2hDog9Ia7zFLErkvSiSefVwZuElq0EK080C1FrFrSouO
	lAwNVfccUT8dbU4PRHZQ3MkBar7qJudyu24f/IwP5JPgMwU6/tN5xCOa+/ATTKa/w9RbGwM3nWY
	/QQ6L3QBOvHpvjzhxjxCkKS3H3DusONqi4GUW8rY9cltDdfa20IAnVQv9u+gMUCZ97vg7qX0URg
	A+6Eyq+jSEhU+LPrI0ZzF0aap91+gj8k/q/enNSihoJ2HIsw5C7VqvxUHQTq05igcpKpt2TsB6y
	59y+PxiP1UFHRS1U3ZQZxFP4sybQ86HlJo467IUgyCl6Nlw1cs5vJlQu+K+7Tzluf5IoMPY3IXx
	eQrxKJX3ndSxzB+/k3kUWUMySAGegdI3OLviwmiMPbDY5xG2O8jPKG6RmrZCGskmENsMNpI+plp
	XihO9jJ95l2/XxyWt8oJWODy8zUaimsqUVYmQ6VC/bI9JNe/guOM7sQze0kgt8pUwWDECYjJ9qU
	Pce3+lB+3qorZkmy8P05pNQSdmvLDUWq3NW+g6aaPVs0NVvDqMsKRjKWP5N3bGPrp0=
X-Received: by 2002:a05:6000:41c7:b0:486:fcfd:45d4 with SMTP id ffacd0b85a97d-4871e216bcfmr8106032f8f.17.1789824205769;
        Sat, 19 Sep 2026 06:23:25 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487245a869asm6815705f8f.37.2026.09.19.06.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 06:23:25 -0700 (PDT)
Message-ID: <ebbbf57b-9c2a-4b6b-b705-31cd4bd0a617@tuxon.dev>
Date: Sat, 19 Sep 2026 16:23:22 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/17] nvmem: microchip-otpc: nvmem: add emulation mode
 and OTP access validation
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
 <20260806074024.531259-11-varshini.rajendran@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260806074024.531259-11-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/6/26 10:40, Varshini Rajendran wrote:
> Add validation of OTP memory accessibility and emulation mode status
> during probe.
> 
> When the boot packet is not configured, emulation mode allows access to
> the other packets. When both are not available an informational message
> is logged to help with debugging.
> 
> Signed-off-by: Varshini Rajendran<varshini.rajendran@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
