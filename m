Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793141651;
	b=2WrJ1zFecRva8YcWbMTJLB76vKqtnLcGSQMiByB5Rme40B4FB/Xgv1WOU2A1eGQ94Kwq
	 1jqB8ZzmZlOu7W8lA9Xajm9fuQuoRhCZa8Jbn1Y0aSwc8fBJ+KU27+fF3abwppN8KOVLM
	 ulNuir2vS7XbtLCn4V7N+K3h6hfT6LdBQaTIeeGbUHg7L88AmBWA60xXHqOWBkTU6r8++
	 ISGY0HpRdIkQvlHwB3scGZJgJAz1vuzpXGnvhEF3cWcD5I+uJFp8xC+E88A1Mw/YH2ZFK
	 kZ5RfnX6/gMH2mxrrr5OIN9rRbqlh3CbwTA3q8iriCacwCYGmEbA3ROmi2BQYh1mbKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793141651;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=MJ12W+V1c2kGuzSt6dZzDqWFazbeGqN8f71r7KadZSc=;
	b=fpMnAaP9y5g8xO851yq4LfZZPHI5t7X8a0swafEFGQaMd7kuyl3PX5KdbJ8akK1PwUR4
	 EtOUK3nt7oXUkdFkDuPUpteFYZ0UCAnduu19v8TCfpfojl8SaFIDxJE+qHI7q0WPNGypN
	 QQVtj5JOt2Mqxvt/JAmPftq/eKIox4awVoH31xmEw10w/7wMN5763I0ltKho6GqEaM3rb
	 ut2IASlRY8c3H+A/rjQDoFkAT+bT/JRdPcTPbVZlaIPHijs2lZqe0Ikb021zVozeoxCtJ
	 2WEr0xMQ1I0QOCRiCj8VdUn4jHr7h3lF3KNn1DNKcw+BruTdhuvuI8olpcmuomZi58g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cV3mgffL;
	arc=none smtp.remote-ip=209.85.161.98
Received: from mail-oo1-f98.google.com (mail-oo1-f98.google.com [209.85.161.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D452C606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D452C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cV3mgffL
Received: by mail-oo1-f98.google.com with SMTP id 006d021491bc7-6fbf1ba31fbso220894eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141645; x=1793746445;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MJ12W+V1c2kGuzSt6dZzDqWFazbeGqN8f71r7KadZSc=;
        b=v5rYz69laDOvIon1ht5nG7KN5xFidAQT7GQvABe6thF0MyE/cmBuTeuW897pgrqS2f
         Smru/GeTJgXbQzrjl9isCL3EYIgiPsKRAHZAPER/PjHjvklFNS17aapMo/oGDohuGbbv
         hONouqRo36CijsqltqPsGOMvW+Iy8bf59aSD1DSLlpWFG85zwd1Z0Pqh7tEU8aZotvPw
         OsKhPt6EehFFl4hxZLRXxJ2qx7oh8t8vOgVSSMso1ewQb8R5W3m8lba++kHDLzwTRG8v
         s/u1934QPG67hwnn2nlCrtFi1NWvvIyYrvyyptMdwQ1Zeu2wpP/V7t5OXEDMNFxw3gma
         6Cig==
X-Forwarded-Encrypted: i=1; AKwUvBy62Dy6VtRn+KKwBNttbybmbKjBxal17iU4zYGddJ/SBppAH7xSm/FAUOAJX4MDf2N43O4KL9ZrYDcYMb4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8mRyC48PsYJEgpJ2Ny7rT/pQdG4f2G/F04nePQQsReNPYXEtl
	GKH52bWlo8WZ/eIzop3a1+7/Ecvi+rgrzT5TMo76cOUZPg7tSUCccnMIC/olcmWPowfAdLHj4wD
	AEh8lITfCSvj7WzXbJjrh3nRdCroYqYouR4bbuB1HpOIq5kWyACTI+QbDbiYz1EwQir8pbo1VM6
	WZ8vAKLvSt2RhZsxoqqBpB9cvTVGaInYAn3hneJp6b7RTa4WL80bsbAT7B+qB6K9qcm9Yrt6dP/
	0F9gC0XGR+FrnkeudmV5kDc144=
X-Gm-Gg: AYBFou3/2ZG85g6RvnagPCPdMHNuzw24VCp9XMx5SJUnSIEALQWP21bjPmM1sR1MFLo
	k/bD9mGt8Tli3d182mS3CQ/iv9mGwKX3HEkq7lkD9a9eRsbDXQULp/5f3mZYz9DOZIOSwp67NFy
	xpIJQV5hNA9rSv7V+Hukl4VaoG+oe9c1Ojl8dJrWVGe51lcggKIEHZPelIuhhjvtllu+JNdgo0v
	RoSGp6dHatGlJwHDCXUKB498YY/S+SoMqpWuhfqK6hZoL+9TDmmXcDlVYN5zNXNId5V8A8dbPv3
	0eWIuhEc+1LN7SIDUGrMDdnVt2m76ysFun/Ph5CKU6BilECTiSRgqXge0U5oICKhEDBOfFVF6s0
	0qpFlBkhL1R5JZlS3WiIQ67V74cgU+1v0lNJuo5UDCE/FJZJQl6si3AzpaBkutL6pBkB4rUWUdX
	RoIyOjLHh6ggh1cJ4v3QwbPaGHpo0JMk619Z9eFpT7
X-Received: by 2002:a05:6820:3416:10b0:6e5:5dc5:14e8 with SMTP id 006d021491bc7-713f05d02c5mr239552eaf.86.1793141644712;
        Tue, 27 Oct 2026 15:54:04 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-70b9dee6fa8sm144314eaf.15.2026.10.27.15.54.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 15:54:04 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso591013c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793141643; x=1793746443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJ12W+V1c2kGuzSt6dZzDqWFazbeGqN8f71r7KadZSc=;
        b=cV3mgffLHEfp+PLsQbVofDdVNTy0btEAyY0wiLC6XMB0qv6ro2V6HHjwnGbnOdPAgB
         qAzz42PpK1zHbHiZwwQjWTwVLF18exi52JoLtAJFOrZT8ZcSOoEjLn070rW2kJ4D9a1i
         Qmax2dNTiCR0jBi8YoWFMc8lcRwIa5LY4LY4g=
X-Forwarded-Encrypted: i=1; AKwUvBy4oK4LuNKvPMna/BopwS4gTyuax3jAEqZYn32FLAEhuTcc1iRyRDc3K7y2RNehFAoxjcdt4JqViEQnN+0=@vger.kernel.org
X-Received: by 2002:a05:7022:3803:b0:14c:c947:6afb with SMTP id a92af1059eb24-1a6cd3a17edmr765467c88.15.1793141642912;
        Tue, 27 Oct 2026 15:54:02 -0700 (PDT)
X-Received: by 2002:a05:7022:3803:b0:14c:c947:6afb with SMTP id a92af1059eb24-1a6cd3a17edmr765428c88.15.1793141642227;
        Tue, 27 Oct 2026 15:54:02 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6da729ec9sm1114181c88.20.2026.10.27.15.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 15:54:01 -0700 (PDT)
Message-ID: <3b1077cc-4694-4cdc-87b8-f3c0c7481fc3@broadcom.com>
Date: Tue, 27 Oct 2026 15:53:59 -0700
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
Subject: Re: [PATCH net v3 0/2] net: bcmgenet: fixes for a failed resume and
 the ring rebuild
To: Jakub Kicinski <kuba@kernel.org>, Justin Chen <justin.chen@broadcom.com>
Cc: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261022-nb-genet-fini-dma-net-v3-0-6e9fc89c0156@tipi-net.de>
 <20261026163656.5c1e7a38@kernel.org>
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
In-Reply-To: <20261026163656.5c1e7a38@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/26/26 16:36, Jakub Kicinski wrote:
> On Thu, 22 Oct 2026 10:54:05 +0200 Nicolai Buchwitz wrote:
>> Florian, Justin: if you have a board where the WoL irq is actually
>> wired, I'd appreciate a run on it too.
> 
> Florian, Justin: could you LMK if you'd like use to wait or apply as is
> and test later?

Give me another day to be able to test this, thanks!
-- 
Florian
