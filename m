Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507002;
	b=WJ0pf9sTunr/1Yzif7qpVgJD7iMS5kJ/VSl7B19TTlgu6M4qQN5H0RDl4efr4jnIZFpP
	 5bFdPxDPiiLL5TUTr56vBV1IzJ/6JPylc3Ii3yjqv6Bh5DZnx12+dIQKXUnAAqtJw1F3t
	 lchyvO3K56GxWLwtYxgUBakAEMsCGrYBDKxmdznIpr9zqSV9fgPczHNFnF8/7JHDxbRgV
	 VWeJwlCUgX0/fCzV4DLeMBpPmTETGb7bufl4Pn6qsa++W3U/kWJlJWhDnCtRYAwv48Gv+
	 BeOFMjsmIIwo+jQl0obGE/iriKFDeTygpc6XUNadDdmeT4Vj8nX/dK7PreG6PqwNeFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507002;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=67XE+pOyTXrOxg14FNOW2nVR7sSqHYk9a1ZEpCs3068=;
	b=ufPY9qlY5uFOPrxhQA25IAqLBAHQklJlmlYXaVpszsjkeXfyWtgqbDSQwo8ZMoa5LLx4
	 E9cUkHZx5SXN4cj+n8I31b7tduO5k47LY+HvAmRWVzbAO5QeCZyb10nwGdpXB5WS2EJD4
	 HTmMlLHQ7OtbjaEJ4hQuQQ+qq9eSJCX/neCX2CfpOploQuDup9e9ASwqPEtdoXdcE5qRe
	 cwJlTrSjSSjo1e+zy51aJ9D6h7jVGly6stSB8CYEYIH33yFJOP7+WPuvpbqQncmNjR+aG
	 UE5TFsKgHjcHyU5OpnWVj3LIPlN22X0EVdLBSxtRrerC+eB/3IjMy5BJuVEoJ9OSbEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=C4BkGuFN;
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB45B606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB45B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=C4BkGuFN
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2ea138a3497so845645ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794507001; x=1795111801;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=67XE+pOyTXrOxg14FNOW2nVR7sSqHYk9a1ZEpCs3068=;
        b=txHBd7BMNk8Px1sILrOkfRwas/lXj4oSYKimYHPzIUlNqmRoRJCWNdUUhLStb3emK7
         lt+UGKP3WAzAHG4KmvyonSVlzQjsgx1X2Uw9ory5ByxRUkNltRInqX4jnUyzgfSVuA3E
         MAcm8e/ehih0V3kfRoq5Q0pW9RSTfx+nKmf2tdOqxgo033r6uiaPz4mKda0s+s4xGOvz
         NT8DX735IY3bjqfS8a1629OTt+MAkz4LqL9GjjsI+LnaojhnOQp73qqeHIKTuweIIKbU
         hCYxN5XoLVzSWVzZYtrmzlCrH3tKJw1fATMOvOTSw5SCZPbT+Wl308ZRSwKy3gMQklYx
         U1zg==
X-Forwarded-Encrypted: i=1; AL+hErHtU6IAhqggJvc6NUN3KK6rPyu1Dyq3PeP5za6v5ASJqxOH7j8x1z1eMSXqIjOCIq9bdcN1qCXCexku6dU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F3d1w6/f4u4zS5/9cal25wKWL6KZ4V9pib068ZNiAFkuAJb/h
	MemufD6sBWg78eGClPNe8LuZQqde49xz2Sxa1Ha70Zma1gNAQMY7g92bi3o+J9biRqAdgMiKLMj
	qRBRMkA+IDq8NPmzopV4PzH4LcKZi/cVQnl3tgV/ftHRGwVeWGcBfE9EScDPuCRME5zl+dyNd+V
	9+2U9hEuHB+TnSRboxg5+QQBi/JvSunN5eamKwvHQQQXAqLnwKIBMUCWSKuIr7JWXvB6K4i8gMi
	TSnxQusUg+rph4x28IU7GGi
X-Gm-Gg: AYBFou01SkLjpuduayLal8AsM19G/ZxFbV/Uq5d5y8AUL99zFdiqhc3kwwmVguqz1k0
	zwTUXCM7a+v969VyuldgSpbXVZLisrturd4Qw3+K/RCsaHP+NgvOR0gwnQLozTzQrlmZ0iNJIIB
	kHc1nljA2eUSuwkQNdxM2nh0/YZxoy3PAQWtq9XnJFKlMgAyelYKuULRTdjVRRb71auMYBdZQCn
	ijuXjdVHiJE65X5ruW8dWmIqg8Mv4i85tCZ32Dj9vKAXXkzuHPPQGRH4nNFQTgW2c6CTs9MyDMi
	DgSDd/uJ+ugBcUEwhKn4RjULe1L8MO6/1n93TpfBzaAr0GnTYwXLy0BIXJRvn+9RO3PGn+qy06h
	mfIMYmCF1w9hBxix3so2Rd8WiKunaSaNEqECcNR4GDhAV2l447RwCqpf6VYdB7ofHp+YhuYPbE6
	/np2WspygOxxzXmHAIiQ4A3S+GhxgEYcO8nJ/KKm2Q
X-Received: by 2002:a17:902:f64e:b0:2df:9d04:403b with SMTP id d9443c01a7336-2ee0dadab9emr1659425ad.32.1794507000811;
        Thu, 12 Nov 2026 10:10:00 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2edb6535b06sm2522285ad.33.2026.11.12.10.10.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:10:00 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338ff2cf14so90345381cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794506999; x=1795111799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67XE+pOyTXrOxg14FNOW2nVR7sSqHYk9a1ZEpCs3068=;
        b=C4BkGuFNKm0wGtrmcXirU3E68yJDl+B/GBd7Wbm5IqskU9B/KwCc6QYRkJ1rjI3HTU
         7MrPRmedq8BGeCtywXlp94FI/t1IyA3qUErHkhuZgkOwZTQdmx4tbneU6YDfsCPpuxHU
         zyMdmjHrCZnzhsB32jw7GhrMy1PBYC8Gfqjp8=
X-Forwarded-Encrypted: i=1; AL+hErFgWQGyDiqQzRYfQRAevi/jjxjDVuu3DnnQkt8swvoG73MZ+d8UZahyV99PC1RHZZeq+FTCuWNru6RrRmk=@vger.kernel.org
X-Received: by 2002:a05:622a:548:b0:535:cc6:659 with SMTP id d75a77b69052e-55ac8179497mr3218561cf.37.1794506999476;
        Thu, 12 Nov 2026 10:09:59 -0800 (PST)
X-Received: by 2002:a05:622a:548:b0:535:cc6:659 with SMTP id d75a77b69052e-55ac8179497mr3217971cf.37.1794506999020;
        Thu, 12 Nov 2026 10:09:59 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d70489sm1470666d6.21.2026.11.12.10.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:09:58 -0800 (PST)
Message-ID: <22b7948d-096c-4f76-863c-70819a4f989a@broadcom.com>
Date: Thu, 12 Nov 2026 10:09:56 -0800
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
Subject: Re: [PATCH] irqchip/bcm2712-mip: Fix multi-MSI allocation for
 non-power-of-two counts
To: Nicolai Buchwitz <nb@tipi-net.de>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Stanimir Varbanov <svarbanov@suse.de>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20261112-bcm2712-mip-msi-align-v1-1-68090868c979@tipi-net.de>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261112-bcm2712-mip-msi-align-v1-1-68090868c979@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/12/26 03:58, Nicolai Buchwitz wrote:
> ilog2() rounds down, so a request for three vectors reserves only two
> slots and the third can overlap another allocation. The alignment is
> also applied to the bitmap index and ignores the msi_offset that is
> added to the message data.
> 
> Reserve exactly the requested number of slots and align the start of
> the message data block to the vector count rounded up to a power of
> two.
> 
> Fixes: 32c6c054661a ("irqchip: Add Broadcom BCM2712 MSI-X interrupt controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
