Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794628822;
	b=SWSdfAxmiv0w3XzXryUZ1fUaQiUSdy4v2CrW46pdfITE544PPVaoxoq2mrzCoiAZwPVI
	 DVic7g4iEmkvZwgrjmH9AuBflUeMACKLJIvuuHsodu7bbz6xskdgyYh5cn+AmfzgodZZl
	 44o/6Hxih0qymTuBslh6RDSc3B7ss0CB6QgYkfIN2RQ0JD6m7wSKoWOJQUcC3ZxEiVi4j
	 cxiyJDnxKN35letnDABmYMIrF93McU89Zd0lNfI5922KWgmm+Nah2d6T8arXEzZSguRbh
	 Rk9zgKRy3tJioF7kfp98KNXoAt5X7B69B+qaMnkLt4AIZsn7y6+4X3tgeP8JeyGZ5jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628822;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=dJrTH631TyOstG97Yl7r7XDNqbCGb4beLO4O8KmPNE0=;
	b=zmFlxqIBYD3MCArjCus8t9akiyzgtZlij3zYJ5XuAtC0o5sCfFwoYkuN5UaRhqMQwCWC
	 nvsoPWuZFjdKDkl6gwAWMK21g5aGt7hKeZcaBa8sG2KBS8jdFvUjFqHgmZZDlnEss5vGU
	 ROMpfS7nKe2ROPMy91ts3YemyYvp+WKQh7iWhBrhtDWAwP7U+DyqthvmxA8zLTGLM8k9X
	 RslC00PiGWrd3OhfThG5bzI6InjztlLyP7QElUiXmsxIq+IgswUE4C+b76w9OpI8BlBfc
	 w1kLBCj9rTW8+4WMAZASho8TTcXODjqmC9AooDMmVJOOeZddm0D45lDvxMf7Vkn8vbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BNbCw627;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F78606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F78606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BNbCw627
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1390537a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628821; x=1795233621;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dJrTH631TyOstG97Yl7r7XDNqbCGb4beLO4O8KmPNE0=;
        b=RBaS8leEKRkAtbP5vvfDezt5xTcZkyiQUagNfTQ4L9r9T9SInqSFg0YyRN1SfEoinP
         rg+zYUgxiMAuUW9gGz+ZpgUztgLA8/8q6xCxBrmXSdbmAhmhXJeLvn6M4Ly7VEaWQwVt
         l2+vic5/qE4FvcnpLgQbNO7a8OSokTEsDd0T94RIpAbpXB0S1QmNXDCIJqAh35N278uI
         J0InTA1eOc0ioSu9ZgvFt+no/8G6CnEanFVRe+lLroV49d6gctoDFPkqhOO/Kd0raoGf
         fgLdW18RVvRLclQWMpb/S6X1spzME+cu/Z+1MJkUvqzgCXiz+D91JujZNPL2ZBlrNuQR
         uq1Q==
X-Forwarded-Encrypted: i=1; AL+hErHXio2Jz7wF8D88AEX8oViI6l+F+eDx5+dfC3aMHui0LmqRPU5Zhyek5+sNdzoZ1zhMkUFvPanyJEZnfKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z86l+nicWZ81G5TOY6YT4ZwD7y3nv6K4aUdgq0m9j+itVUm6m+u
	Wo4/cc5LX3v8XFVOawncA5Rubx7d1vBLdoOdzPkbHZxYvYM0OdUhbiVVRgPQQbcZjrS6KweAoWR
	ILO5ZPTQHNRs9VYLNup14lssuZxn7JQl7SWoIZ4tlOOBQGFo4FCEJhp719MnE8qoFjIBRe279Hb
	vjXxOpj8H42x6Qi0iij9dBfCczvzMxBWtjjYyhMcVaVlUiDU899EGTSPYxGUueGnhRIK3b7sHIl
	Nep/oZeVg1rSeBEht2TVKJ7
X-Gm-Gg: AYBFou3C0H6Zf0c32MutGR5/3qYzbZoINNyz56ho3PTE+Waq00tfwadnC4adZbG9S90
	UwaVXWzPmfsyqseZCk+xSddjbWQVSvv5bt/EfQ0AIzlvCfZwE6L6eCBoK6aGbkvCIRmppOznBBH
	Q3pi9clrSzXYA/IZE9km0VTrI04/+acAHvnbwdtA0c/GgR72sDp8RF3zuZ/SFzlw1fgBAWrHf8N
	+21dvU8I5D+DhgkCe43dnrYv8A7vD2xfrkfyeGByJllWhdU8pt3OeyJf96SHJGxfryVhLDuzn6n
	BKv+bmupSu8vcUdiVUBJgJsj2tTVOU0Ab8IDj6ESzar7XVu5SO7MxzVBPSlWfOyMFFGWhNAzKuw
	kzhhviDsJuDSlbGx+Hha3a+KIM3bjRxlZcwtpjcJKKsOkWciVKw7nft5B15l65WyLsL01OHqEtQ
	eq1/hZv9KzhC0mTbFG2Zxotf0aVjJahc3A2nkdfRQu
X-Received: by 2002:a17:90b:4ad0:b0:3b0:ada3:b505 with SMTP id 98e67ed59e1d1-3b1b09f3fa7mr4778714a91.19.1794628821115;
        Fri, 13 Nov 2026 20:00:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197c1a3e7sm8949555a91.2.2026.11.13.20.00.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 20:00:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so1052817c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794628818; x=1795233618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJrTH631TyOstG97Yl7r7XDNqbCGb4beLO4O8KmPNE0=;
        b=BNbCw627KCX7akfNEYu15tPGdx9Kfu23wt/rhSEY8IVb3iH+5p+W90Z/UxBkivzXE+
         nKyFRmDzqAhD+qM+Y+WUzI+BGZGvKxkZ2aThyJl+dfaJi0QPxUciyzx4HSjPz2lUK0BO
         J7ZwINYpJ6nQFbnj9WQEzpunIZ3WBIljMRfqg=
X-Forwarded-Encrypted: i=1; AL+hErEE5DxctlTFgk3LkagHOX8owny7jj77KNlKyqTeE+A+hFCV01vLrt0EQen3qg5dvOYntGSqJ4FMaaxnjV0=@vger.kernel.org
X-Received: by 2002:a05:7022:6b8e:b0:1b3:a05f:8929 with SMTP id a92af1059eb24-1b50317ab17mr6582014c88.39.1794628818431;
        Fri, 13 Nov 2026 20:00:18 -0800 (PST)
X-Received: by 2002:a05:7022:6b8e:b0:1b3:a05f:8929 with SMTP id a92af1059eb24-1b50317ab17mr6581961c88.39.1794628817562;
        Fri, 13 Nov 2026 20:00:17 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm11737395eec.17.2026.11.13.20.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 20:00:16 -0800 (PST)
Message-ID: <8518ea1b-41a3-41ee-84af-7f41d8298799@broadcom.com>
Date: Fri, 13 Nov 2026 20:00:15 -0800
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
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: AC56U: add nvram node
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260911191823.80631-1-rosenp@gmail.com>
Content-Language: en-US
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
In-Reply-To: <20260911191823.80631-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 9/11/2026 12:18 PM, Rosen Penev wrote:
> Add it and set MAC for gmac2, to avoid having to handle in userspaace.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied
-- 
Florian

