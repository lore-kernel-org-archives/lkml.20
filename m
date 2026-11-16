Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870066;
	b=sxuj39LMNpS+LZefDtxmVmsd+lraTaveA7NMN3MT/3wdu2cCW5/561B5gK6Q6eurKHRs
	 pp41S8aTym4WKdXYgDbOPxOdyq5xc3DAew4zTAIDPqSkgZdCu+QPG+xZVwF8iJ1Nd87fb
	 cgNTiKnyo4y2p8PT+xgUbKSp7y48b2WHn/93S55yYLGUwS/VH1q048zJs/MhU354Qc2b2
	 E2FHvNtqmwZCHjpVLGv4++6fHw4H09+C8zy4g0tQle4q/KkJxz1duGU/X3Pso9doSJi5f
	 ohzVRS8y6o4dM2bzCVj28D0Ij55X6B5gPHp0K8Z9aKCp1hlPiX1UjpK+Ew4JtSOPrGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870066;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=CBtuzXAEjW6vvHYbW+dbLkTxqvqdc8L81bE7KOwQSac=;
	b=GIuIDrztQSS51ZO/pd4cI6KCm8etFrtg5HuAB8exmwtx+nzwSOoS5svPEE2jn6xMzX3w
	 U0DGHwBE7O6pfV6kA4QV6kbdsQno2vjST5aquQ7ARs4fyA7rrRR4zGvwrMMCiCrIAR1NU
	 IRIWphFuWbItqVRx30gsgLDdnivaoPrWgJQV8oP38tPOA/iagnRZePIiEq/ufQYuM9k+H
	 YewTGE/0GNfsSkPlqgvdxiuVWMz1veyT06zdpEkASg3C1kXXioq1/EjtzY59fLEtTJg8W
	 4facTAiMmLtztTMRlK5+9LtaFCkb38lcvQhUno/4ZssomL1gpFvsuOq4LgxssICYZFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Dy1clWO1;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59532606A332
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59532606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Dy1clWO1
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so297240a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:01:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870065; x=1795474865;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CBtuzXAEjW6vvHYbW+dbLkTxqvqdc8L81bE7KOwQSac=;
        b=C2I9Q8b98R4mdNemYkd2seDPswTA7wPXBxk5PX9kmtZMnkJM9c7bgR402Lw1OvLB1k
         vLzXDt0I3G5Lt2JY5kVWRl8IsibhLg5IdfwufWeYQdyzVwV+xvebxxx6c+xvxwXil/XI
         q5Gpzj1GTZiUc74wGjZID5JhPT7xB/ykKUrpIkfmUlEV9uWD/nbJGKEMZfkLIllfAxqn
         w9hVrpQZalA1aZIfJgH7KG1WvIzV+fPjnB5aadJwyhuvPfgkZIM+esHZSoeVMOH0TvC+
         tUjOSwfx0KIObSLQIrNOuUIfp6Gwmu3/U6podWE1S2xzo1v94tqftVn/ZR85fyKykiwb
         1AUQ==
X-Forwarded-Encrypted: i=1; AL+hErHbOaguVhTzpUrUEhOiHm8kaO38oq2wDoR4YSgbGGOIrhBGSFvtB7nYszdjpMpWzjYQpTc6S9oW7jE83mg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8O2TIVgE6AqpCD/QtDUqnc3RggQci2UMXe5SneLxe0z8yoAjHi
	ayPGC0Oh2H4BUITvtmDUItZoMF8xILmvXE6boNV+lI0c22mzBQSA963ic8KIaHA4K6B6Jrg67C+
	iV0zLCd0aFpSCL2jGMXKfMWakEhhVaTyc6pnGh598SQ8NS96h2ykDqYIqmdo2dRfA9SdLHBQXkT
	NitutNJ6QutUAlShSsC4FcIemcvfgQyfCvVogwOoMnG4qoS9XDlZRKsRSPTrZKd/KzfWwuxWV/m
	Q7EdKfHHBRFVkRnuHz/eE41
X-Gm-Gg: AZFdTZfP6LXZfx+3MWxlEe3D3Lq7doyP2glAy1FgxhUbn6Ayw9rI+dwXoDD9KnFZwqU
	1uTon0wjYK+yTjrZaFMVmzRxaOjU0YuhIxQ1T2c36Uyb+4/IlROrLVo9u74rIh0SWJya2gV/Pjo
	1WC6fGjZ0Dknkl9L+VgRD/94Xg1QENGwUMEAoMT00l3eU4+ljUCF5awEyrN3CdSk7hNFIXeMfMh
	zP8Qp6JMmfn9YJ1Ai1VyE7bSh6t2Xe8rYp5COfsFZZ4I2IL/EYFM6kLgqvLR+IiYPRM4xdYoFEF
	Bb5rkH9pm3IZeNa+maIpOtINcK51RdD4SGDn+fr4xNG1WGH0sKW6BUC2xH1IWR9xYLHpOSOI36u
	hNf10OZoQNKpV5ErpRAS6sS840+Xnc+J1biYQl+iqrlr1h6sYM6PL1x95F6t5/Yt5/5gxeQYL9S
	D5jblKF5MIjBBu1zU7MGMWtC8QQkTPFVhFtJJSN/zZ
X-Received: by 2002:a17:90b:1b12:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b1b09e5cb0mr11927241a91.17.1794870065447;
        Mon, 16 Nov 2026 15:01:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abe7d05bsm569548a91.6.2026.11.16.15.01.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:01:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so5157595a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870064; x=1795474864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBtuzXAEjW6vvHYbW+dbLkTxqvqdc8L81bE7KOwQSac=;
        b=Dy1clWO1sxcbRYFnLWOKdRJBV9Zyoe7pq3jVa1eyeQ1eBK36Cu2dCXmmkK8K61rXhr
         jx3CpiYXHOsn3fqGlg2Ar4J28OoR513niRgX89pTADnLG3+lRqV8meBrhDfu4DpGFgvT
         yHMu05FEqd5c0LqDEfFBYxO3TBT1e+b1Blfbk=
X-Forwarded-Encrypted: i=1; AL+hErEm6a03tpIjsySClKOm3vxb6ufO75kHhsPp+UpZMeuPTPf9OX9G/42ZE/QK2jfgxyQUqnVNczwcL2bXV7g=@vger.kernel.org
X-Received: by 2002:a17:90b:4a48:b0:3b0:c7ab:4644 with SMTP id 98e67ed59e1d1-3b1b09e6653mr11853346a91.14.1794870063481;
        Mon, 16 Nov 2026 15:01:03 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b0:c7ab:4644 with SMTP id 98e67ed59e1d1-3b1b09e6653mr11853156a91.14.1794870060381;
        Mon, 16 Nov 2026 15:01:00 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ab9f3c5dsm1096089a91.0.2026.11.16.15.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:00:58 -0800 (PST)
Message-ID: <d2942f59-d421-4aec-80cf-4c6ac52bac0a@broadcom.com>
Date: Mon, 16 Nov 2026 15:00:55 -0800
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
Subject: Re: [PATCH 3/3] ARM: dts: bcm2711: give the GENET MDIO controller its
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
 <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
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
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/20/26 07:58, Nicolai Buchwitz wrote:
> The MDC of the GENET MDIO controller comes from the GISB clock.
> Describe it, so mdio-bcm-unimac can get the real 200 MHz from
> clk_get_rate() instead of assuming the 250 MHz of the STB chips, and
> can put bounds on when an MDIO write completes for PTP.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
