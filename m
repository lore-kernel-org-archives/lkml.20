Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97B0400995
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 23:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791241615; cv=none; b=mR21vaXn96PCif8yYLMdrxwPIUTU5zAPhOu3SgRGPUZ0wztLGwXpYXtp8Zv1OjFspw/v+qsPe+fJ57SXFttyXMrkwdEX7s0fy1wH/NdMtbILRSWYAG0xkrPkZ/6vKoQf1/GfN+CsjVKsJX6Vn2YNgHZMEKMkk62LntPGKClgxio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791241615; c=relaxed/simple;
	bh=zjVINveBY8pmnPeHWE+uidJHk1mTe/HjnY+lmeTSXfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kYTdM018q8SPEDq6yF3zjA3SV+yk5FcRnd97pmOfw8aaervjWBAKdXTQpLP3dR4MDrrkL3D5NwlKutAa2HV3fIyEGhOBAtZYi2h7AemY6Ad9Ci4SFJvh30vZ+bWTu94EnMd5Ve8zCItSiu21NxaCw943G+SPsk256ava5pJKy0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Y13fYdVO; arc=none smtp.client-ip=209.85.222.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Y13fYdVO"
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-93d92abf38dso4718085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 16:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791241613; x=1791846413;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A6uU3qv1AMni6iM7UHJ9bdCXoEsUxdUjEW5tleUkaDE=;
        b=XHmZbzspX6WfucU8V9sgW+d5EunDf/XuwzeAp2JUCbeXDlAgYBh1GM4NlVI724evRt
         zEzPE0RAOZAyQ1G5zW4DoFnOxDEAt/oHVih8SMD27pCh+yP/tnOV/+xVAPB/vFL7elyW
         saTBh9PLvBoWMNcZ4PNlEcAILLqG28yOV1wK2pFDKb4BG2uQxTf1uJo7KyQYFuPegeCc
         cFkSLyi1/b1hmmLXX76YMi3k8i6ca0999rmt9wZblgeWdpYZ7LLgl3sB8PR8ZPa9Zlad
         fyR2dzusbzqu4CxFYFPNnYVnCqFWmttgKiOc2v/2Ytbi5RJF6kvb4TDn0OQ2+EPDKmNh
         bvlw==
X-Forwarded-Encrypted: i=1; AKwUvBw/uxxY8iCH3lJq2VFlunv5v0sN6utrGUzLKetkwuPACJBYlTy1dWK61h0oH68cXa+QBbv1GQelG4sErfM=@vger.kernel.org
X-Gm-Message-State: AFuF++lY4cYLWTYZH3iUA1V+uL0GzMpLhBnLQGpDbMdEQXdV57hGKXjk
	Rypb5IFRSyznsYEakUf6OPM/wEW40GuBSH98+TOgvif58qdK7a9CtjS72g+2tV994coYGW+D/aC
	98+8gwB9TbnpXL18xUMq5dsPwgnFL+zKOI/OoFtQ5Sl3REWfthyJbMdwA1mjEvO3ZGxg5Dbm2Un
	15eONaRYYvGQNhhZEPVvcUF882T7tyodFuZPTPNbgDGqtgnCbtwQHJUqD1RRM7bNMPeg8WfO1HW
	rwtpjja9vZaCNbT8oCnIU7m
X-Gm-Gg: AYBFou1fWnre4n4bfLSynHZcanxcqwCHY3Idq8n52koK3DplmJt3fNNyw6/v3bWgQuB
	b53K+oFuoOpKbfNsed8h3xQxlBTc8Ba50xcdeDlW4hD3A52JxNZJO7VvWLq4SKLBLWCRoD+yyxx
	N4s1I6Ow2rV/A2Xddgkw6qBrnPw3gbHG9H8+HMJgXZUUUyAIAUmw80NrF4Rc2X9ACYfTyXOZGwg
	VIFWMFw4f/LmdL8TOMmAKOBWTJZePOi0doF1ky7KGhAVntUHMyYgwW1j3tpVMihR3a28y+272J0
	u/bkeRiohnvHGt5FT2olHoION9H2Ec6bc9Kb4xkdt4J8z4jQMcs1r2Q7ruRYNX20qUk0YJB0R77
	TuxZeqUYr3BybKc4vw+ktVyqRMtQNnXAYdTCWhJMLoG6aU1YZ4uug5SuTspUemrCoKrmByRZx3V
	eTTVmgo3S/gOPKqfujrHlGUz+zieszMRh1WDd9HDKw
X-Received: by 2002:a05:620a:370d:b0:93b:d79b:9a57 with SMTP id af79cd13be357-93cf188f719mr2299053085a.56.1791241612649;
        Mon, 05 Oct 2026 16:06:52 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93e58d2ab9csm263692385a.4.2026.10.05.16.06.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 16:06:52 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc359d9easo357196785a.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 16:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791241611; x=1791846411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6uU3qv1AMni6iM7UHJ9bdCXoEsUxdUjEW5tleUkaDE=;
        b=Y13fYdVO0xach91ob/oGvfpxeWH2Nx0OjAfWXL/D6Ufo8t+IdctPfoZ5MJOFfG0S5P
         H0W/ldC2oy03NlZj4iVfpNvoY0fzNxWSK/gsTegYdB0qf6HEH4FofL44EvgeEehfu4QO
         J9UsjvuU061ADAlxQYW1x67JvVSVBEujEhakI=
X-Forwarded-Encrypted: i=1; AKwUvBzyyxGdDjZgRG33gUEBbc96M25goRBUNaZxTLqZua5x9B0actDHloyaa7amuNuj2xYn7R0kFfje9Bu23Sg=@vger.kernel.org
X-Received: by 2002:a05:620a:4113:b0:93c:17db:d91f with SMTP id af79cd13be357-93cf17330b4mr2212120285a.39.1791241611081;
        Mon, 05 Oct 2026 16:06:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4113:b0:93c:17db:d91f with SMTP id af79cd13be357-93cf17330b4mr2212114985a.39.1791241610580;
        Mon, 05 Oct 2026 16:06:50 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca03469csm986972685a.4.2026.10.05.16.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 16:06:50 -0700 (PDT)
Message-ID: <bf95bde4-1dde-4285-8f73-c9f6f04b5942@broadcom.com>
Date: Mon, 5 Oct 2026 16:06:47 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 3/7] net: bcmgenet: rename ENET_MAX_MTU_SIZE
 to ENET_MAX_FRAME_LEN
To: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Justin Chen <justin.chen@broadcom.com>,
 Pierre-Marin Leclercq <pierremarinleclercq88@gmail.com>
References: <20261006-nb-genet-mtu-nn-v2-v2-0-c4be21151912@tipi-net.de>
 <20261006-nb-genet-mtu-nn-v2-v2-3-c4be21151912@tipi-net.de>
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
In-Reply-To: <20261006-nb-genet-mtu-nn-v2-v2-3-c4be21151912@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/5/26 15:24, Nicolai Buchwitz wrote:
> ENET_MAX_MTU_SIZE holds a frame length, not an MTU. Both users program it
> into hardware that expects a frame length. The name is wrong once the MTU
> is no longer fixed at ETH_DATA_LEN.
> 
> No functional change.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
