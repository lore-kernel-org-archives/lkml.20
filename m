Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522283;
	b=Qj+XyZED7Osy4P/PDZHOmmXqvp0N8FdrR7Hh5nYsHcuBkZEGRx6LbwFgapZUNMTG0ZgD
	 uWS5v2aCgTQaFBrZb6oH8wJ5qy2F6Z9yVxyyZ3EIcKdfTHcCJj/yxWyztk7LC3RvFY9sq
	 WxSOe9IcFJjeO0RFToBlpVzLKGH7Vt7CpCvPSJpvUTJyVX7IIybTnpkQjigHzuOTsIKCq
	 fMbo7c3oGpWGmb7cyUXFzi1R+V9+P8EayGaLGfE2rBGluzNAzCkln4QMK9LoMGZQOeW3+
	 rGSD4Cur+jIMcGgS7UHyWT3BVd0xeCdu7p3PqkEmq7hEzv6iI5gHw7/YDg4ivUM03IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522283;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=utoyl4Gvk+4k3dUQXqMIzJHQem3Qyf7xqEv4qj4AspE=;
	b=vct0sBEH9rB53GPMo/wB3RlPo/7gmif8CiqE9QC/J44nOPH4d6SIOl3FqKpwsHb6/oRd
	 sCRhsQblY1ZNkE1LI/toCRkAHRBJ9L4TBfYiPEd9dtcxwS4BknyXpGmvnVdSbFzPpdmTP
	 pKzODrvmORX7WTpfvqAYQueI2EzxbWUQKQ30AJkmCV4Ah4wMPykMnLon7RWLFw+Ijc10I
	 jLD+iw3VDYMNm2gFtMUJsvjVa+f0RoUPjB9wtFigQislr6eD24lAYs9a8d2ZBGY7DTaEO
	 KqfGdzQ/VSOZWJUjATYjeZB0ldkgs4zUdLnT0jRvYZetGLzoO4C9CyOjJL5vko2pv6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="cu9JQO/v";
	arc=none smtp.remote-ip=209.85.161.99
Received: from mail-oo1-f99.google.com (mail-oo1-f99.google.com [209.85.161.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D294606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D294606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cu9JQO/v
Received: by mail-oo1-f99.google.com with SMTP id 006d021491bc7-70b875f6f1fso386194eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:24:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794522281; x=1795127081;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=utoyl4Gvk+4k3dUQXqMIzJHQem3Qyf7xqEv4qj4AspE=;
        b=F/W21UIoheP+xQnyD9Z/z7nmV7qlpf+DwC5VOWulwnSZFWj+nZLUrgWNkIWkVn8OyD
         pJ0ja8z3aS4yTQVsW7AHD/dW9I2W+C1j7Ihl+B/ZLQVTqoG4HHk+PbnrPg3XvY7sHzHe
         gcNXiqQswOho0DJDIyE9CC0u+1PP54iLDLJ3SHeEv0Ecly16+HBWQOp92H8NIzfzwjh2
         cn664sWooo5ZXTsMAzR5AXlqRn5BadWtl23w0ziNlgxQgNxdW3ue5GTNK73pZmZIdDXE
         P4y5GaV6Qg4YB+QIJatk0+sejQyr5+qzuUuGZU9d9byHBwKPDJiyaswI83TNLPx/FIAp
         f+gA==
X-Forwarded-Encrypted: i=1; AL+hErFp4prLcQMeDSDwc4HvCUdDIQLBzUOLctaGCQjJpGZ79d9Wt/Qtk/M6g7DxhdeYfF2dQn6SoZyU6xcn5S0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u26MweYOEmAeXSThDpkTekMf7ZuHge8BDv55aly75SFNbFYr/
	PoSkzWxxggcTTV4sa6YE+lupUv4lMpbEgsMBwtXyZCbx9a8xZea56oJIoYKt8nIaZeQCoApErYK
	fhhHrJwk4Vz7Nf6jegqpfv8lvO/M0mQyEROCQN8EyWYCIgioCIRt62tg2Jb2EGEsed7ZKALu1gt
	uu0BHIbIb8vYkpkCwkLyrgGvFfmNh//Rtgd1hYTScep/Cti5Y3eKikoI4B5CJIH/oJsUaP6sSE1
	if87NvrPgsd9CR4vDxzONS/
X-Gm-Gg: AYBFou0hCpXN9REz3HA9Bzh9el8Ou/J/t7YFUSN+38rC7FrlQD+NWTfpeOn/7q/73L7
	FQ4PRGv+N/OnEXlKgrWa7iAM5i1K3VbyFtsGvC/HsPBvvEHb6jA5DUm215tofbqBuoeh5PRrDNT
	GG9jyEy3fKp1wnND2YY/gRYwEn1qNMXDnyAWtdvxTeSMrcTUtMnuH3CHaiJMUVNE9AczwA1dZKP
	/ia3yC+3L2QommWNeKtQ8qKFrDZ21TRwj8QVBPUChIQWHpNdFJ6x3O3JY38me7D3lzjc7aG3QcN
	tdAaYbnawwBb0eCqZRp4DLHiOJOMvrnkXB6vWAzuiFlKTGKyT3QfCsikcmARk2rLg7rHVTN6vYs
	0i+7ECfROR9hbDxR1KZ4kUMvdJofYWy6bZxyj0YZ1xTidaxLB+5OgrWxYRB1JOfuIVJTpn4yP+L
	m3kAI67ct3Y8UvO6xfIdoNBFw/AQzARtsAiAJR8WF5
X-Received: by 2002:a05:6820:1381:b0:719:150a:4368 with SMTP id 006d021491bc7-71ab507b436mr373040eaf.35.1794522281206;
        Thu, 12 Nov 2026 14:24:41 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-71ab41ff692sm20525eaf.31.2026.11.12.14.24.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:24:41 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ea9e91221so6587976d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794522279; x=1795127079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utoyl4Gvk+4k3dUQXqMIzJHQem3Qyf7xqEv4qj4AspE=;
        b=cu9JQO/va45WT/Ajb6B0ZniN5LDMRPofz3N3YScsm2QHJ9cPFZT9DLjnFXENonLpG5
         aub0R1koHu3kwlf2WIFkZQuPz3r9gbReOhoovZ+hctbHw4wS7xuTkHujpUSMFL/Dm5GY
         U0gU+gW7ILgoKcDe/q2zYtgvClqyDMsfX3L+g=
X-Forwarded-Encrypted: i=1; AL+hErE8E8EzRgCUNtXXcgC2OMuq+3UYGYTCE8oukQIfYIXKA9BXidH1BzieNY06Wb3e3yFrccepllDW1KAEbxk=@vger.kernel.org
X-Received: by 2002:a05:6214:4485:b0:91f:11fe:ec6c with SMTP id 6a1803df08f44-91f2419c4bemr11356196d6.21.1794522279219;
        Thu, 12 Nov 2026 14:24:39 -0800 (PST)
X-Received: by 2002:a05:6214:4485:b0:91f:11fe:ec6c with SMTP id 6a1803df08f44-91f2419c4bemr11355846d6.21.1794522278614;
        Thu, 12 Nov 2026 14:24:38 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23b2e913sm6525716d6.0.2026.11.12.14.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:24:37 -0800 (PST)
Message-ID: <1bf6f3dc-ce61-4aa3-bb71-5e3a4330d474@broadcom.com>
Date: Thu, 12 Nov 2026 14:24:35 -0800
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
Subject: Re: [PATCH net v2 1/6] net: bcm4908_enet: fix the TX ring wrap
To: Kordian Chmielewski <kudzo51@gmail.com>, netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, bcm-kernel-feedback-list@broadcom.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
References: <20261112195051.597102-1-kudzo51@gmail.com>
 <20261112195051.597102-2-kudzo51@gmail.com>
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
In-Reply-To: <20261112195051.597102-2-kudzo51@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/12/26 11:50, Kordian Chmielewski wrote:
> start_xmit() wraps write_idx at length - 1 and sets WRAP on the
> descriptor at length - 2, while poll_tx() wraps read_idx at length,
> and the free descriptor count is taken from length. With read_idx at 0
> and write_idx at length - 2 the count comes out as 2, the frame is
> queued and write_idx wraps to 0 == read_idx: a full ring looks empty.
> The following frames overwrite slots whose skbs were never unmapped
> or freed, their bytes stay in BQL, and the queue stops for good with
> nothing left to wake it.
> 
> On a TP-Link Archer AX6000 this stopped everything the CPU sent to the
> switch under sustained TX load (about 1.3 Gbit/s through the switch's
> CPU port): tx_packets froze, nothing was logged, and BQL showed about
> 185 KB in flight against a limit of about 10 KB.
> 
> The same mismatch also lets poll_tx() step onto slot length - 1, which
> start_xmit() never fills: once per lap it completes that slot,
> unmapping address 0 with length 0 and counting a packet that was never
> sent. That one is from reading the code.
> 
> Use every descriptor, with WRAP on the last one, wrap both indexes at
> length and keep one descriptor free, so that read_idx == write_idx can
> only mean an empty ring. Stop and wake the queue with the
> netdev_queues.h helpers: start_xmit() stops it when the ring is full,
> also when it finds the ring full on entry, and poll_tx() wakes it once
> there is room again.
> 
> Fixes: 4feffeadbcb2 ("net: broadcom: bcm4908enet: add BCM4908 controller driver")
> Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
