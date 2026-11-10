Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314800;
	b=hrNjFMg0FUOEYO7tyOUkD59jSyreC0V0WhOkS/7Dw8tcZqkFWRgw+S1oeqDmanA4zWAC
	 2RIKyQ7xskdjnV8NiasRPI//5Huvh3nRjlICsr04hZx/o8DYxHxweDJs7aVOYGFxAYJOx
	 VUSTNQblX+5RfYGQV2GOP0B8niE0N/WxbW5VxT16XMPM6jNWcHr1Qp58R7WQPUjaNOvrm
	 2MgjK+bqAR7a8G79vD6DcrRQzqYE34kddAbJ7U7DQ+UDCD5CPNayoe2gYW60D5JaUKEQh
	 0eiHIdnbr/9GgCx8R9Y9hLmJuglfXcrlTryf8rfe6yHICLChWVq0y0UjnpnOh7mh0uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=3tf9Nhm3wEIZKlX+voEioL0VaJtWq62Gp0ZaFsQlRI4=;
	b=RBRWnMFN2SG19qkGnSEgZMkWycrP4BuEWn9qH++ovjjZjpDB5b0wNY44FUiBLBmQ1yy+
	 EErDqNusWj5d8pyw1YXcAaLrguREUJv28dUoYCiuiaa4fmv7lpadpq7/UcIENeczQvphA
	 Ow47q0iSpGx0dr+HnxTg+47UbqNkFbjm1ixndILVKwkmid0KNxM4GWQoUCpbbQp5P1GcN
	 /ZrtKEbN1FI8g3azuBtS0YkDNII7AArfCzCuvNEMB+CGgHZWzzXm9u7OdVJCy5aPLtlMy
	 qDAPFX7ga7c6SwR8MDQ3Y8wH8ErCcwTDajTqBXRgsveMgN9C7kAhvPgiakixDGXTimg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=G61AiFNR;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42554606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42554606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=G61AiFNR
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DC7DC3F1C0
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794314790;
	bh=3tf9Nhm3wEIZKlX+voEioL0VaJtWq62Gp0ZaFsQlRI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=G61AiFNR7+hX2bDEAbsFPkrpgXB46tJFAHNMp4OSEEeQ4Aso5eFzv9/Br1GY/93yI
	 q93Ia4ktphLOYDxF7qKGBS5NzwW4pPAGur9JoHPldgRK0J/cSgqcYpM9gIBHhZ69Ef
	 sdMLVQlpzpJmY4ntC1MwAZhndjkW1nycjohaYLHJ+9msvZ/qTCo/Z7Mp4YfHhyTW2c
	 4DyWIte/iLpENEbMzAe4EnnxBCU+9GhEEPAWcZ5exXZo0KFgpbdCZo2BV5TWKYNjh0
	 eq/k4AX38H/xDmb0n7/oagTUB3x/bq2H1TEum/zdBzEfKMoAACAdT/lFpNcyqFqS7P
	 V1f6sJoAZDz8zTVb8k2yGziqaAaYSLrqLXawVxRW/Q8PvaGTXBnE0TMFupRcJez6xK
	 BWA38liQhxO2m7EUiE4LCsuuoaygMth9vuBQ9Xw2sChbtYY3Ja8jmW0Dpgby76PXqB
	 TVnraGuqKxOAFmCfwBF++ftc+YPtcBjUZQ4fILSFAHR2WxRrp6bTPCfbo+J7pmI1rO
	 ZJ0QTP6J1K4Tknq64zgYP85i1XTMitQ2zP+lnShOLbnWLzeJsy6GHWjj6L6XJnHdtm
	 ToinWv80iqrACYXiCOCJTjaHKp3CWEUk64mlLH3NLsYfVG9mnyiLgE8N3KoJYnOQzg
	 7Of9yZvB6CE/oyj9lzzyapGU=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a318cd95e8so17697695e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:46:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314790; x=1794919590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tf9Nhm3wEIZKlX+voEioL0VaJtWq62Gp0ZaFsQlRI4=;
        b=hlrHcB4DNweODs/rFcwAKJWzeyPhmd2xSgxr4gnY5u6++kCRWztWhgKHsbJobHTylM
         rG2d1GytoKjK55YEnHcV8HC4mCSaTkdJpJFuPY0S2W28CRbhz4P4nUrYcQe4VMDq66SE
         3kyYtVfrX0nOQhA1ufi79XpJpwkVVUgiOa4JT66S81iuqRmRgfNGQUUJns8yI5LQpFU4
         qdnNgQ6g7gaCvM0FjFwodhqTqU2bPnhItT8rkDgXQ91XkNnZ3srX84Qmf0T4X02qtTT3
         zddVWu+PQ1YFPCpravsa56Hew9yPWWjI5B3gXOs86+t4gDv7YKaP8dOfm9JSu1nukt1j
         lKJA==
X-Forwarded-Encrypted: i=1; AL+hErFo4YH+kBV6BjzXQm/FcMUHr93+8MwLtdmNj+ou6bvsvjM26T06ct2JE19p9BjCZjpolv19jIxnoLN7o8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8z4ax+68Vj9HRE5CDHXNUAIsesqyLNpZirT645/X8gqO/c9tiU
	nnVpYR6U4R6mTAe/cHLx6nQORyHSIPHek90zXhc5LxN+H+f3R+pwBnERna9DBTUhogAhVJNN4Ly
	5Z1YyokGyKMS4oeHg98pHiUvTMFxgClF2Up4ufaBQnDoPzgR8SgS3TNjhBtlSjs3c23H2nE7q6f
	Wp8pOtLg==
X-Gm-Gg: AYBFou3ThpB+AAjeAuFyQkVeWi4/BBjkZxyNRuiRqCeg8B6xHW3pA3ZA5bKBKI2IOQG
	NisVfApXJISCPdbOFSt4CQ5MWGTBhQBKjPWsai+ZJ1gtKe9fWidyjW8fkEAOHYK2XAtOLRUxp61
	ZYz8xxuE8e7vStjq2vKM7fv+YsUFL4u7MJ1wKPQLz9O1fN06DxWfmDsdn5zChi/b8bDg8DIe1pC
	nr+u8/XV6fIgLhbvrJ1Su3kzys/cqpaZOAPdcUqZSOMoGV4ivrj0rZpTZcMXHK3IJ9qqlazgT+z
	IldHfD5jdwBH0LJaxcfFuKt7KO7XHQQAh9z6gjRgQDj/qPVzb0T8+xL2DWupq3iTnFKKqYoVkAR
	Gx4c5kIHM7DOdqqKSYDLN06VeKMaB8n7o7Irktx4hDrAc1+jrZf6z96rcV7U874trei+YHE1kIT
	Dalg==
X-Received: by 2002:a05:600c:870e:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ba0234267amr41310435e9.8.1794314790544;
        Tue, 10 Nov 2026 04:46:30 -0800 (PST)
X-Received: by 2002:a05:600c:870e:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ba0234267amr41310155e9.8.1794314790230;
        Tue, 10 Nov 2026 04:46:30 -0800 (PST)
Received: from ?IPV6:2001:67c:1560:8007::aac:cab2? ([2001:67c:1560:8007::aac:cab2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm71022925e9.9.2026.11.10.04.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:46:29 -0800 (PST)
Message-ID: <fcd2fc41-5af8-4256-8296-a5435fdf41db@canonical.com>
Date: Tue, 10 Nov 2026 13:46:28 +0100
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
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 CoM260 IFX TQ support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>,
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
 <20261105-k3-tq-dts-based-on-com260-v1-2-aa0b7714aed0@linux.spacemit.com>
Content-Language: en-US
From: Sarah Emery <sarah.emery@canonical.com>
In-Reply-To: <20261105-k3-tq-dts-based-on-com260-v1-2-aa0b7714aed0@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Troy,

On 05/11/2026 09:29, Troy Mitchell wrote:
> +	model = "SpacemiT K3 CoM260 IFX TQ";
> +	compatible = "spacemit,k3-com260-ifx-tq", "spacemit,k3-com260", "spacemit,k3";
> +

On the CSB1-N10SPK3 server from Firefly, using 10 K3 nodes, reading the 
TLV EEPROM of a node gives: "TLV 0x21 (Product Name): k3_com260_tq".

The latest EDK2 from SpacemiT derives the compatible from the TLV EEPROM 
name, so EDK2 will report "spacemit, k3-com260-tq" as compatible. This 
is by reading the EEPROM that was factory-flashed, so it is not 
something easily fixed by a firmware update.

My understanding is that the nodes from CSB1-N10SPK3, the "K3 CoM260 TQ" 
and the "K3 CoM260 IFX TQ" are all the same: a "K3 CoM260" module on a 
"TQ" or "IFX TQ" carrier board.

Is there two different carrier boards name "TQ" and "IFX TQ"? Or is it 
just the same thing, called differently in this patch and in the EEPROM?

I've seen EDK2 referencing both configurations ("TQ" and "IFX TQ").

I'm not sure how devices out there are referencing themselves. But if it 
is in fact one device and the EEPROM calls it "k3-com260-tq", this patch 
will not work for device-tree matching.

What do you think? Can you clarify the situation?

Many thanks,

Sarah

