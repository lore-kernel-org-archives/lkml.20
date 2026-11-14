Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626998;
	b=gnK2IQTYnOUi1qlzLNNe8+pOiZIGNpyc5sgtYxyRbhC8pmG1WLlrh/NiQLfL93EmLWRk
	 BGHSV8iD2UpFrZu4g3T7TvtSiBnQ9aBG8u1EgXS508ADJrY843SUPrawdAn1myxRKmJPz
	 dvcmP9DqduCz6XeF21baPjZCd3tYdpLOhTCRWz2vJMV8UovgccbS4dYRGeLSLUgcHQCnw
	 fE96ZWxkbLMOJwkHw26FjAn2tNcaFUJM/Z+5Rr6pI/bVJegh8p5hy7HzGlPumYrLN+mXb
	 3Wt1rgeS7dkqygq6YD2orCRuUesW//mUsxpkx6iSxtSqbyM2MlvTDYe7syU+OBg/sBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626998;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=yDc8YbhTZN4Lkq1WU0z5LX1Q8KhtfkMstUTQ2p2A56Y=;
	b=W7fI6XPZD8RAO9dezEEsEPwbl5rH2KiPHdCrJ8IdMkQx62w+1h0jP7yIGskepbmZr3wL
	 YYK/Ko/MQLADHQl0Pkb9ZswL/kpuHnXWCkkJPaZ7aiPF6fczb8GrU7t4hHOFKgFiY5ACa
	 gm2DOQdTdomz1TXrU2og+3q0kMiXndnYk27H74jdizA2UjtFckGj4mYs/OQFPR5ndMl9f
	 z63VzeI7CpHKmWd1UtJCqrWJjh/li/+xpVRxD4tCNl47bkwFyV0+cWhRyWJ982VJXDvJC
	 5sIuAwLdlGl8YpKK6vJoa0jA51bUAMriBTx4uMyKFVCr3HfojCFfihvn1W0/0KkMekA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Yca2aPjf;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F62606A89D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06F62606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Yca2aPjf
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so866498a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626996; x=1795231796;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yDc8YbhTZN4Lkq1WU0z5LX1Q8KhtfkMstUTQ2p2A56Y=;
        b=mssuv+NcF+XDayqvH0DGKThFfM5ujlUKwGPy7qe7dFapRAbUqM58Q/wYiWZobVWUHw
         Fg+hy+32WuFJ+DYIoxhWcLYAj5VhtWDEDduQ7rGsuEnM0e2Jt1uegmUqbwoefxEixFEN
         SoGez5a0N/Ct4F5h1jXsFdKAaiNr38j1+AtdaMlsJCPlCzkKA84j9IC4d4Irn7I/E+Dm
         umk8o3lXD4G8zvcRahJIaHV2X1QzQSvkYUlrZu6s+aN77A7FXA3wwrzvu5hKQ/bZVLLq
         Rj4t1tX2kqq9YwCigLRtYJBBembF+UEUmwmGWOtLilTAgXPtiw8BD0tAJyTBhQdQmbQJ
         EY+w==
X-Forwarded-Encrypted: i=1; AL+hErHr+Tq9UEl8oD/5zqtIihjM5W0PnC94MoakSJm5WhpfLpC0JQOr2sLYYX0A3f9kGU76FKM9Osfx73BbbGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AaxR3Nkc6FE/fHHr/IsgxmBH0p+HtH2/gTtSvmJWu/oFxa53k
	5IyLoQr79gikX8p/v4tV8qj4Y8eHT2LpuvhqmICfRlWqhQLyVI4ysjqnVjWYSyGgqk6sAmD4qH9
	1hkv6l3b86oTvE8rhJE70riy+jdz8CIhcu35ZfK5G1Fh9nrK+Gf/v655yKaU1dygnltLSQlsRIY
	kSD51WVa18Pr9brZ5zb9HHThiIlQnj3WxDbjWy5iyw0FDugwwBaNz8w2C92uA7M0IrCJgbhW4f5
	1Cm9w5lvUy+wNgWwpV6YBKH
X-Gm-Gg: AYBFou2UesLC7kr89wyXcaWRd/ozUJoL4V4WBtE6SF76H1XK6sQ3X3wxEKXfYj6U79X
	tqVBlAdhmCTVvdAUOc3O1PToV3CRithPut50asp1KchO0Hk2CIsgFvs7F7lJlnA+BbwRJDuZFl0
	ZT0euN/6xi4GHuTgphQjc5WpQh0/tpsr1IOSqGVwYk4msWfnbtCUMqhS454C7FZa3fHN35+HJoJ
	r4HZr5LaYWIrDoCkhG1ubnflEHrpxAyLuQb5nCuKGqAaZqI7kguWqVLBCA1yv2+bHPl2D2wZIAO
	6E/YNtA4mZBXFIxwnTo2qiB7FKcGhmi00sbPBBTYb9yV0A1yKdGbFB+1qqZyGvFLrvg5ab+GwJl
	zv0wxr0rkU8GyyCQHVhr+QMM1eBnID4mfirp4zIIzMa8C3z69u6FVEyAjMNoWuW8V
X-Received: by 2002:a17:90a:e710:b0:3b0:9941:8d42 with SMTP id 98e67ed59e1d1-3b1b0a0e108mr4273887a91.33.1794626996253;
        Fri, 13 Nov 2026 19:29:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b25d9ba7sm1824676a91.1.2026.11.13.19.29.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:29:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36ecd5db581so2344167eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626994; x=1795231794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDc8YbhTZN4Lkq1WU0z5LX1Q8KhtfkMstUTQ2p2A56Y=;
        b=Yca2aPjfk/ar034vorcRiuX4Vses2RVzsd9MStmYGj1f3Lw0vl/9aAnzySZgW8699A
         S4nPidNpz6uzz28bEZpszlRt8kVxQwhi+lnzVa6dlEyPng1mDfziK8r4+1UIbfxObD/a
         Lev2Dyw94NqzvllDcicApQQpDJdJip6/4qeA0=
X-Forwarded-Encrypted: i=1; AL+hErGbhvYHd9CSw12a+e6Sszg2NZrL5qibaHWd6qmTjaZbMHFJUXsHtjxNqL0PYNw0w5EJvT59ahAiGeSa+nY=@vger.kernel.org
X-Received: by 2002:a05:7301:c02:b0:36a:50f4:ed0d with SMTP id 5a478bee46e88-37966766d98mr3676490eec.25.1794626994167;
        Fri, 13 Nov 2026 19:29:54 -0800 (PST)
X-Received: by 2002:a05:7301:c02:b0:36a:50f4:ed0d with SMTP id 5a478bee46e88-37966766d98mr3676459eec.25.1794626993492;
        Fri, 13 Nov 2026 19:29:53 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm11295736eec.16.2026.11.13.19.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:29:52 -0800 (PST)
Message-ID: <beae6d07-e25d-45ba-bcf0-39422feb3295@broadcom.com>
Date: Fri, 13 Nov 2026 19:29:49 -0800
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
Subject: Re: [PATCH v5 04/11] platform/raspberrypi: vchiq-mmal: Use vc-sm-cma
 to support zero copy
To: Jai Luthra <jai.luthra@ideasonboard.com>, Stefan Wahren
 <wahrenst@gmx.net>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com
Cc: Martin Wetterwald <martin@wetterwald.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
 <20261112-b4-vc-sm-cma-v5-4-d25e3b687e71@ideasonboard.com>
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
In-Reply-To: <20261112-b4-vc-sm-cma-v5-4-d25e3b687e71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/12/2026 3:18 AM, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> With the vc-sm-cma driver we can support zero copy of buffers between
> the kernel and VPU. Add this support to mmal-vchiq.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, 
thanks!
-- 
Florian

