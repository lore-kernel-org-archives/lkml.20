Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484001;
	b=v3vcyqVZ9Cvtr/rO5CHzDZDpyXOftLFu20p506XFqka9IctIhDOwQ28wo2UMsFmBAwDO
	 1u2RGkdvhapmmLxKK/z1XgNdgb5vQvpzu0cytWZKy733diSaB+VUT2A0h7ycWQjU4bGhE
	 52O/fgKXkadNKcbSO46ggMfhgtu+jp5pdl7VVihJ29gFgJJ/qRlLkIR5UPqMJnzD+Dnd5
	 vmuRziTDHIn5OUljeKHTmNTKs7NtnJi3xIVuoHX5YLNmt8GqdkyzbPGlfTSuAlPHFgA2E
	 ZUQ97ovpsoEUNvXsUT6bLdX67S8UoOGWuzghyEfetKFvLQ4IqGKGgemxE10aVFvuDPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sifT94IuJdm+evFSGgUtUBWt/nlaaaYHDsDEfF5nTj0=;
	b=oF15MUzFtxKeOXLbyJV4wxgmwzxg/lspvoS0vUQBCkgBAxVSGeRDpm7XLCH0I1uboRSF
	 5bXXbv7QojnV/K+QQ+DPqEKKzX6kRN8nQXVvqdrDngn2z2UFxCgcoudAKUTe2wgZLIZVd
	 1lSxjZZe6flwDSxi71/z0SlXKxCb3qAmtrfg3MNCTduE1qRODqrOpBFL8hoIkPpKDVSZ5
	 PcGqAVTnqGNrl1i2BBNzA98DCq8LBb3ftI5xqsEcD9e0ItYTwKo4CB80PagXrihwVxwwo
	 JUroO0W1lqmfcz0EtXNZBujIfRWN0juexlNaNhbOSLA+6fITL1JH2lDEbNLFshnlOdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="hep+mB5/";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B25606A332
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71B25606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hep+mB5/
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so22479665e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792483999; x=1793088799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sifT94IuJdm+evFSGgUtUBWt/nlaaaYHDsDEfF5nTj0=;
        b=hep+mB5/rzIkpFTWECjY//gRKF5/dPu43U4EeiM7sptRr+nzRHVuGra7s+DAmavJvO
         43XfOCWTBTAMVRmX1gunxl0uMCN2VFq0EMqyimdkr1AQacZhgKLWoNsHBx4o9ex/Bih1
         hw7PbRz0e76GmeIFMyk70RWN4+tGEgHvEzdbxbnPisPwbDho/Hja22ces/QWrrDlPvaK
         pkWTvquTI3EFsYebuaGPBXtka9PtOIMqjJlMuSGwwezSgfrbnp3Y9J9H1sVbj/biwJw/
         y3ZcRM25GpoLwmAkPgH/E0Qh9u8n10GY0hWvQGrXzY5ND7XABJh8+ARDnlL7Gkn4vs71
         /ONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483999; x=1793088799;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sifT94IuJdm+evFSGgUtUBWt/nlaaaYHDsDEfF5nTj0=;
        b=y0rbh42Fri6DnRkt3X5vaPQqzFYts3jlIqn8doI4viqCKyghxBbYJhyIN4wJGwwU6E
         GIBLMxki7DxuuSg/Vs5EVab8o+C8+Sgj4kj4fj94OboyszIH1j4ThpfGe+QxBlchOZ4g
         kMzp8JGE/UzOCRH7vByjnpTFH6eiFzJBmvcrVPuTrFXyrUjKHylu8tscoHjrnUkAUEvs
         cPjr/DPjhZF7VqXVyiyUhX92u/03EXq8SCOkZ80bBenRy/n5aVcQ+oVl3WT7lNoy+6b0
         i++nSNHpMgIzs7bQe2xokXtJpElIxRsKxmVSddpPTAHDQ3KVCLaOb9pkTFn4xzM9cQd5
         scZA==
X-Forwarded-Encrypted: i=1; AKwUvBzIXBkD+gF6dfG22oeGvOp8mq2CWy9ofKaG7cqseZhwNJHnTIXUg/iu6mCbES3G6TXldrMojVs5uRxd/w0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIpg91qrvC9cHipDnQwyoOr4HRBfvGv51ru9IS+v/iGZszb5zc
	oXGIilzr1COlZYmhyOypxn90R8XcTNtksL5BZ3LbRpsgCwpbqC9QKm3r
X-Gm-Gg: AYBFou09ERcbima/yAYdOlDjznasvXe/x/dIHRJANhkZxVJEAQ7OrxQ1moJ323rup2a
	+35vvkphslp25ZpeggtrogjCF+BNf1XpQq9bSeWcax0ltJeMApWE2fMzqbBFBu5JnC78Ec6RhDB
	+bU5qANFdb4Beog7GpRvj1nV/aI4PCatZ2HiQSIaiVb/duTegH4ATxHrvZBSBRxbvD9iPxk4GNM
	ZmNgOsZmoKyhxs8P0MMm6HEN959/lb/ZbuAYvSUvwGLfI9tl0XGoM4D/WfLb5oZmqRLmOntEiph
	QUG7FyUwnpvFQ3rDRxdvpxC0CRwRHWcO88szBcUNdq+ZJglxQqb6lfHDJ8nc25prqL2g726eu3w
	OC/E3xoClKJ8GjI3jBg/A57nbJWgzX+6a4BK02MjnsWdHO0tCrttJUrpETRfKcUAhXaEI2hjJOD
	34tJYhtnvqRSQHtkkGCiL/ZEFg859ysGTEkJgOpoj4sueLaGJABA1f64/AP6UUmmeO7Dw2K4CO/
	JPywXAAppJKBXsQJQcH/5YYIe6ZIaffOJvG9wcTMaIHV2NyWZppz5+wUPDq6I2w0a98e/zI
X-Received: by 2002:a05:600c:1f83:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a1d761b900mr213796785e9.30.1792483998516;
        Tue, 20 Oct 2026 01:13:18 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f117:a001:5c30:2c3c:9609:3456? ([2001:9e8:f117:a001:5c30:2c3c:9609:3456])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cc809csm55072355e9.8.2026.10.20.01.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:13:18 -0700 (PDT)
Message-ID: <2f64d2b7-f23d-4c99-ae1d-7404079dcde5@gmail.com>
Date: Tue, 20 Oct 2026 10:13:17 +0200
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
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: pse-pd: realtek,pse: add
 gen1 I2C transport
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sander Vanheule <sander@svanheule.net>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018161248.376205-1-sander@svanheule.net>
 <20261018161248.376205-2-sander@svanheule.net>
 <20261020-noisy-amorphous-jackal-1df08a@quoll>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20261020-noisy-amorphous-jackal-1df08a@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 20.10.26 09:27, Krzysztof Kozlowski wrote:
> On Sun, Oct 18, 2026 at 06:12:47PM +0200, Sander Vanheule wrote:
>> Like the gen2 protocol, the gen1 protocol can also be used over both a
>> raw I2C transport and an SMBUs transport. Add a compatible for the
>> former and the compatible for the Ubiquiti Unifi Switch Lite 16 PoE
>> device that uses it.
>>
>> Signed-off-by: Sander Vanheule <sander@svanheule.net>
>> ---
>>  .../bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml          | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml
>> index 3bb32349c28c..526f8525bb4d 100644
>> --- a/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml
>> +++ b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml
>> @@ -54,6 +54,12 @@ properties:
>>                - zyxel,gs1920-24hp-v2-pse
>>            - const: realtek,pse-mcu-gen1-smbus
>>  
>> +      # I2C, raw framing
>> +      - items:
>> +          - enum:
>> +              - ubnt,usw-lite-16-poe-pse
>> +          - const: realtek,pse-mcu-gen1-i2c
>> +
>>        # UART
>>        - items:
>>            - enum:
>> @@ -100,6 +106,7 @@ allOf:
>>            contains:
>>              enum:
>>                - realtek,pse-mcu-gen1-smbus
>> +              - realtek,pse-mcu-gen1-i2c
> That's the same device as smbus, no? Same device, same compatible.

Physically it's the same device/MCU but the baked-in firmware and configuration
differs. Same for the UART vs. SMBus.

> You can have property deciding about protocol, if this cannot be deduced
> from the clients.

This was the approach in the early versions of the driver when I sent it
to the list. Rob favored the current way [1] and I think Conor was ok
with it later on.

[1] https://lore.kernel.org/netdev/20260615212959.GA1679454-robh@kernel.org/

> Best regards,
> Krzysztof

Best,
Jonas
