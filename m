Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510730;
	b=PFiLJBdOOBQrfaRweaZzMsPyNjVJuE+bcEFYRE+FEE4x4mQRLTt+yLP1jSi5RFy0Ij5Y
	 kgoDjkqH8/lv/bgGzZGJ9jZx5fqihx4B1irTQAFX5hxm2PIs7+WdJVAMbzYUqq0hSkgJK
	 XfKLGvEsYzFXSMDaDhRkC35iy+cclmiwCI4BqZsGin6PV1eCpu8NLVQcb4Y/m7h402qao
	 aBvHwgq/Q05CP5c9qjmAfTqYHrcTczVHv3UopRFRz+yH9wwX0VuFETKE2J9GBRU07F9Sw
	 fE02j7LZ9ZrMVIfBY1/ycuevFyw1mvMPnQ+xee5tdCEb4jSX072A9KJNADXAYidsemQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510730;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=djXZskGgNuwcvXxJ7QSBd5G1fQCIwJ3UJCCUrLYgW60=;
	b=mCxl1LjbKRoiy7KPQvPeyWSMtnwK2g3j04UM/F0Y2lGiVoXeeLyFxUxIAfbvl8kYVSZG
	 YIaABRlBGTNDcjz8AXn+P6I/fhTxtUgBQe9FU5RPxyWIvPV0AXzh7rxqKGuHEy0yNi/HS
	 1J1r6fiAnazVx/bVvY3+ogQOo7nU2QvyWtsXQWbgJQQwXrQjNI6w9SUP8/pHFtp/ZHS/L
	 4MEuOuOoiTFSMy4UIrw0wXmBTlCuxQB4O79293RcdD6QQFUNHG8q0rMwPEisVaIb9NIvR
	 Cvf9Hbu1XknZsQ2pSu+wXZ6DG/swWNSw3amddk8EE2rZsAnPaDwO45RpIWgsAabys7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hB406WtZ;
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD265606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD265606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hB406WtZ
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2ea138a3497so8999695ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510729; x=1793115529;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=djXZskGgNuwcvXxJ7QSBd5G1fQCIwJ3UJCCUrLYgW60=;
        b=TsxdDdTXqTxG41x+Fp/X//6jRz967TqVLEk3+chZTodeK4Nj2Sj/cR5S+E8fNLWij/
         Nu9CNHRyi5e+eA39b/DjrVIt5/tTH5UI4NcFvxAmqeKb64HZuhgM+qaY8/baYyazzCqc
         +X7E/yr53YqAfcQXWHzY+K3JX2GBuxwx/dj0jdjBWKsuSVhZyNSY3OHJdjreQZPRftjW
         adfQTgePmoCXi32nsCgZtOfwvx6yYCFFND5qmEtyn5/LEgWQpQo9Q9pTVoCDSAfsJ3fk
         hJ3JpTOdvaadmS9mFH4WlzwRi5asCxZLrRGt9+O7fk4H7XAGqn4SP51aniJh4zoQrHY2
         syOg==
X-Forwarded-Encrypted: i=1; AKwUvBxekQd9Ey7kC84kYFw8rmhPEibaNsXF7jJtnToRPSycS+drSRLePliHJwEIYgU6GEOV+1oqQdTz15lONsw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdxCtC2p/DAd0IEiyINDiHjjyML0wjJINeUGdRr1RYNGtHH5VE
	N6ivlHdFotDwCM9sxlmZm3oT4/m082kErTGJdYLNTcnscJEDWIDrbkQ8zjJcVCHFsLemXNXDc8i
	gBaoFWYU96c3ye21026daJpMW0qp2DFxYt/VFHiQK8DW4dY3hjLpU9tUxdhnICfWQ67H9cvfGhV
	JjChOMmzpjGEgL+yhmTHzBjn9/Dy9La+LMGJUk7ie+ppVHHKWwRrmzMqj571uXLWyjAU6QWkZM7
	RvL25UDMlmcNJIMau6Gg23Z
X-Gm-Gg: AYBFou2CtlNRXxSbAz+Wz3Moe6+WhoVP+SyDuCnr6GGfvzM+ygMDAaSCKK25FH88NYX
	bsJMnkiLAGZxFzDgiMuxXSGUnaEgl6vpX2KuB4LA6/muM/c9igf8t/I/e1v+KZaAoFdyMMavJ8Y
	1hGmGua2WvGTKtVOMQirJREsuBZRnrQB+/Hs8mcRZdjPPBHEdpnKshXnxSDl2IjXCUy8JgHsHhm
	sL4Vu38ncNDsApP0I49qc55NvuV9ENHuf+HQBMjs7+z+7kQRu/FRMQyiYELAFndTT1wyjIw39wA
	ddS8lbgEA61kTBJPJZ81GxXRuru1Uy1ltBPyKUAaQXdJSUPbzwlWs7Kv4brgTdlnXX9uEFXYbN3
	oXBP/84yiXs8io2ugegdoaJVH7UsXO3zSl6rYNmOSb5EhWpUVagLp8i4dXRRPanqV3D0T1nAdXi
	dOPOWccxeqE2z9ndQKQYOT6XRCfCQgBIcLuRq2bkFLYGY=
X-Received: by 2002:a17:903:2342:b0:2e9:2a1a:8b69 with SMTP id d9443c01a7336-2e9a6d37436mr92510555ad.55.1792510728905;
        Tue, 20 Oct 2026 08:38:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ea3b48689csm12075ad.46.2026.10.20.08.38.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:38:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338ff2cf14so65317381cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792510727; x=1793115527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djXZskGgNuwcvXxJ7QSBd5G1fQCIwJ3UJCCUrLYgW60=;
        b=hB406WtZjY2t+GkizQ0ZRcE6vtxvs74q4nOMlULDaCo/8GxfqGGJIr4WRBt4tNG5HH
         L+ozJsZR/PMugdu/nqmc1eWWsRctvTyFq5CZCeHR/2ECiETp8fbJrF8xNBYA9smi6oLO
         Vxp6puHSVTtmQFvJsNQN5XQs5ORVbBhI87oOg=
X-Forwarded-Encrypted: i=1; AKwUvBx3W6VgHGpVFs2pTkVx4/uB5IRjyJV/F9bFQcRR3pSTTLzwT06IirvEN/T6u/GWutfzeI1bXxe1EJRqehU=@vger.kernel.org
X-Received: by 2002:ac8:5e06:0:b0:536:4cce:67df with SMTP id d75a77b69052e-5364cce6af7mr160757571cf.54.1792510727479;
        Tue, 20 Oct 2026 08:38:47 -0700 (PDT)
X-Received: by 2002:ac8:5e06:0:b0:536:4cce:67df with SMTP id d75a77b69052e-5364cce6af7mr160756821cf.54.1792510726868;
        Tue, 20 Oct 2026 08:38:46 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5367b3d1ccbsm36400461cf.0.2026.10.20.08.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:38:46 -0700 (PDT)
Message-ID: <f918c40f-f073-4ba1-ac4b-7765c42a5cb2@broadcom.com>
Date: Tue, 20 Oct 2026 08:38:41 -0700
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
Subject: Re: [PATCH 1/3] dt-bindings: clock: bcm2835: add the BCM2711 GISB
 clock
To: Nicolai Buchwitz <nb@tipi-net.de>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <20261020-devel-bcm2711-gisb-clk-v1-1-a1728724d0f8@tipi-net.de>
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
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-1-a1728724d0f8@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/20/26 07:58, Nicolai Buchwitz wrote:
> BCM2711 has a clock generator for the GISB bus that the firmware sets
> up at 200 MHz. The GENET MDIO controller runs its MDC off it, so add an
> id for it.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
