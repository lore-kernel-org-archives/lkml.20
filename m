Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627013;
	b=NXt1za2Xoz4AMBasTlw4SDF/3kh0UpE8ZxFklTfx0dAE72TFWCACh6QLn3AIWVNUIadn
	 RC2SAPdZYYRT+A/HVM9YY8Qm0/S0WzzLWQ8JsimadQsb9h/9uKOOZvsvwWqXzWdzi2sKd
	 l0oGAgB31Dn0x5I5gLrCJ7LdGLlPcfkv0/IgXEG4fRFv1nTkSsGDnFIv4PPuZigd6B3+J
	 23qlvMt5hZxAshg/9UMxvA/3Cj4yTahENt6HvCLfjfLOC14cGLARKVg+Rqr0+MnX0dgc0
	 7gyzCf23gtilvz9w5t+kU9Ud01Q+gEv6FuWDHtf6qxZdx8Y8BI3dE0uUFi8Oy0pqAeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627013;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=5jsTRYk7KQN7825qF1InYK8P4ki41DeOjAFowmky3OA=;
	b=hBwx2ItFg1WGPDC7z/bmCr09u1MgnyKjRWBEUeJIVD7DQrPZ0brSNQG9CokWA/InsfHe
	 UOxQvGa+3A9SswQvTBMo7fs4WrAnMB29G1a7N9vmIWMimg/BaqGdj/pO4WN80afKNPOo5
	 AV/FwtUve3K6s1Ir0Ykj+OxztcO9Tj9diAjV8C/HxCWPJVj+etx9M5ueYkNaOGj80BLmi
	 czT+t6pDg2jvHbKgJXOz2fPP2DPiU+p8BzJIZRxmjimMRUBmz8mWv2GoQkb8TVU898LCK
	 DBBtUS5YR/W+ZGae9NCJTTU4EX67PbPWNP/BQ60dKXrH68jen3NMq9NUIPEZ7byMxdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="GSi9Wg/e";
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA97606A897
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA97606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GSi9Wg/e
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so647387a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:30:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627004; x=1795231804;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5jsTRYk7KQN7825qF1InYK8P4ki41DeOjAFowmky3OA=;
        b=OIIaaSVTM1hKG2e9pDoAIsGX4ZtNXrmj4pvl5AbXgjniw6jTKP9VWGF3oTsQlOkQlI
         VmWrJU+CI9Imjs+FbR9MPvMxwiAOKVuaz1ex/7BHUJ+p4AOaeVILtManoTPvXPNeeqon
         I0f6ufJkjKDyLCOFtjdZt7KXQqVlTxvYABJoD+FweJnslR3G7z2Vaq3Y2guTkRczdTj2
         z8pCxWi07diGKyC7Q2eKIukJfylew71rGvZMiQAUzEAFxyZ8mSRZxxO2sPuzEbJlb8en
         z8/ypWYRwmgwKCexNmkfgFybf7L3bmtotaT0Cu49RxbjM7ZAGp8ykV/N2h6dHpBmkQ5g
         y1Qw==
X-Forwarded-Encrypted: i=1; AL+hErGDfT0lztOQZdjpFaV04M6rf8oOkFQvIPcQNZL77X9SgRDQn2g0KNJevAmvGOQShbEyAEHo0I4cAY4/NaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LQyevMFlm7UlU4EYcYfGEb9CFoHiVo0Cgkj06up4iVrwl+Tv2
	c+vHdA4IhpPpRdWU5YX1PiujdxQ2lmmrh8i0728fg1qg9BPXIGh8RcPY70toSUTai6qpl2Jqypg
	Rzge9YSbuMOIKJLyg3WrpvKqQQvTQiiTJssbn5tJLsu3AsjXiY++UoRq6zcGdis/8P1Doh4v2HZ
	i7716YoxHSEe3SXsISf5aKyswjQC+MYvJjS6TvDqdSiOqAfBsWhkjwb3ROaJf9e5AjTmZ6je79G
	+MKAovdbWKstSQkUjhKsWZY
X-Gm-Gg: AYBFou2flknlUwAXnBPmxoS/oY2flH+cyKo3pXRKynPzTFkkaam28u82UuYZiyoVTFe
	kAy9PyrsZx6HH7gQdM4egk7t6fksCxnJBpNC2CfaWCUfTDR45O4LaeAV4WhvoQHOQVrkLL39cUO
	OUbxa+iG/B8VhACFigmL3O/eWjaNSxGFn7m/mKo2slUrTTAYT9gYwmgtKV4xDLmaSpsf9Tpk5Bq
	I5i72wqTz462WBPrkaHB5Y5GQfLjmJEATFudmgjMV1LVFBZZMYa9hSgsftPa0gv6t9x/CRoXl18
	2jLJpf5xmiaFhNRVurJ2YRdYqZd9KYVaDpRDcLMNMG67dTHvm/lRLGubq8KImGkfiaQPUMusO00
	6S6RBTZGoL15+L46qdFniWPUbK5iGgfkMXBh289K9nlw/IXv2T+gKLvXB/LeqxQVIu1IWKQt1h+
	Ss+obDeW/FaBRUzEBivIGGNN1VmrbkX9OaKUsxEJGF8ws=
X-Received: by 2002:a17:90b:2d88:b0:3b0:99f8:eba8 with SMTP id 98e67ed59e1d1-3b1b0b9e201mr4315220a91.66.1794627003786;
        Fri, 13 Nov 2026 19:30:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae97e783sm6587064a91.6.2026.11.13.19.30.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:30:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36de26cb4b3so2006230eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627002; x=1795231802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5jsTRYk7KQN7825qF1InYK8P4ki41DeOjAFowmky3OA=;
        b=GSi9Wg/eaDTK7GTCf0xSDp4AGKt0+cDoP5VCEpOe1UrbVnJ9BvJhgjlDUCBbVS9rre
         McQtSQ7Dol5I591z9goDc7TyztA158qkEKFGuILHVzaibwG1ecgyW1iq1ePdV205sRTg
         wR8t6XHWvj2hpz5CpuHThRKfU6z1D/xdc/vG4=
X-Forwarded-Encrypted: i=1; AL+hErGT9bCB/2hZJ6VyA1Tza33NX5Xsoe+3m6h+BLoocZX+bekADKmp6RmlewOi3ZiFg2o/YcH/VTHkpnblSM8=@vger.kernel.org
X-Received: by 2002:a05:693c:26c6:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-379684b548bmr3674711eec.30.1794627001870;
        Fri, 13 Nov 2026 19:30:01 -0800 (PST)
X-Received: by 2002:a05:693c:26c6:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-379684b548bmr3674674eec.30.1794627001180;
        Fri, 13 Nov 2026 19:30:01 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm11295736eec.16.2026.11.13.19.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:30:00 -0800 (PST)
Message-ID: <68e0e1d1-37e4-44c5-9830-dcfcbacde762@broadcom.com>
Date: Fri, 13 Nov 2026 19:29:58 -0800
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
Subject: Re: [PATCH v5 05/11] platform/raspberrypi: vchiq-mmal: Support
 sending data to MMAL ports
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
 <20261112-b4-vc-sm-cma-v5-5-d25e3b687e71@ideasonboard.com>
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
In-Reply-To: <20261112-b4-vc-sm-cma-v5-5-d25e3b687e71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/12/2026 3:18 AM, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Add the ability to send data to ports. This only supports
> zero copy mode as the required bulk transfer setup calls
> are not done.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, 
thanks!
-- 
Florian

