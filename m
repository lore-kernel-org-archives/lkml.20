Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CC055C1DC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790094425; cv=none; b=ZNqw/NVf1kfSA1+rgR6YfNEwwBfwQLgFG4AFHLTYenLEiUcwUBXm98oTj6GceHrfti/wGCH07mhblF3WWYDkH+ga4a0tyj8qJC6na6CoNGrELeibDgECo1xBxQidPWRbVbxTVmBgi0ITR+Hb7a5/0A/kDru5jFUNfHjeebwyI48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790094425; c=relaxed/simple;
	bh=+YS3xjaFJ8Yy7HIQTr0exMnXX/9PBzcaK25pk5yjCVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJWB8Gnb4bKjDfqrH/0PSBcejT2hhsIhiCfbRuyTkCmfNp6Wr4XPFGISgWJQImdLbuRehiMpeeakA7mWyVJHGs9ReUcUX3M+oe+3ZjALaq5el5Eu9lPL0L6E8Tf9F2xlJhp3IXjrDFgcm5/xdhQoLnW/1qx7seYUmo7bmRKfG78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=VmeUg8CR; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VmeUg8CR"
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso1040502b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790094423; x=1790699223;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RyZU2f9BZca55GCH4HHqyY0IiMIeoiIekV3Pzf+OcG4=;
        b=lJmUT+gxaOcL71f1UY+8ZLRlV3xg0ZXyxg8hp2kywv1A3utYeGcAE42OAxIqaZ8iaP
         3OqNMMHuUi7Bjh9J9pb4Qt4zH4QtXDCHQj3mhuDlkF/4o598gDqHdAZJeLiaFDi9eStY
         1jnqQOS2kSLznV54SDReUc74C2NKZF5Duv+iAS/Nhoi+twDKavK5pSOc8n+j6DqGLr8Q
         5ykgcgj30VcbUUu5TGYySiXH7kqvQDngXIwzGR06P0QP1rIG1U7D65EjLSXT100Hiynx
         wkWJ5QC6CphHoVHdehfhFPvwubK89Zk/7ZC4yxeCgi7mNHuYTs5J87gqHPKYHKvkA/+N
         99fQ==
X-Forwarded-Encrypted: i=1; AKwUvBx70twHzU+7UZz05vnDn9vnfaJIieGcB7OMlG0X+jN4A7eeFlyPxrgklSF5LKsEMRh5aCrW7/mdMVlfgj4=@vger.kernel.org
X-Gm-Message-State: AFuF++kP7mjEohtY5sfVw9gRhPvxU0SGGcGZRRaKgc5pVYXe18CY2M5w
	tGKThzsDU3AKUJ8X+T7h3q7tE3aJGs1BlyRFRpDeeoe3fAOjvMztVCabvLFY4IDMg2IKu8fHC8J
	p9s0UijikalqzZQsiYyTF5hd0B2nvg5zC4oDaa23mdcfQQtt5ECOdWuy/CD4gAh7zLcomlS2Gjx
	jbHGuTHXIZ+9v54zaMSfE6Q/NaqHkseohDdG0I0ReGr8iAXzNOJfCKBrPRvTgCCv1Ofjqu+6UTO
	mmZLAirMbCFQKqKwtI9HYz1
X-Gm-Gg: AYBFou0pMTjVNN4d9IwtM9VMwNBL9uOCBub8qthIpwe1ykPrbSbtoLwsqonUBi+6RE9
	sUmTYhksi33D38MqOGjiW6rxaPFpfUzirOcH4mmmMLQAR7SAOz4wrC5OI77STknd56lfp5Rr8jb
	Q/OeH6zNDhDAdkXG3FprsVV1rW+A5a9U1vh3PwD/q7xngpivQOkkcTw/rEwNPSPnm2tbdRyaoWr
	IIbSqQik6q58cf1m0LLgZ1CeWtFxT8PD898zZnrYpymwqVe4h0lBwjLuAME+Kj1cSTl/r6ERxrR
	x04RPpSpIwQbAVUCaX0p2n9MxCdY4jFbXXlB0w0Y+oexv75JB5CXYoZaJCK0w8euBqscTcCmfPv
	1hlfBa1MMSxqZSPC4LZjzImH2j+mmdk4I1USH7NjFobby0X9uKycZxhmzR2CTZIh8Ph+dN3HapO
	camqoLqMFtK1KEnpSigBXjGfKHifm4B9Rwtq6YCOH7FyU=
X-Received: by 2002:a05:6a00:ae04:b0:869:31b1:4ce3 with SMTP id d2e1a72fcca58-87c822aa873mr1276747b3a.9.1790094422840;
        Tue, 22 Sep 2026 09:27:02 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-87d2086041dsm17404b3a.5.2026.09.22.09.27.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:27:02 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-837aaa9a3f6so993467b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790094421; x=1790699221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyZU2f9BZca55GCH4HHqyY0IiMIeoiIekV3Pzf+OcG4=;
        b=VmeUg8CRx2Gp+CDdKKv/8Ga43BUw1XC4sUSp92rwv/O/tv9ljUloA/dV3q1eKB8xSx
         4B3kvZ4/hWPlyALW387HcmJ8J7fE5NeGcWiBQoAM7+IeXOmHsdGKvCLDdap/yNGFf2+D
         5xuM3Hs5hvViYXMSoERIPh3v9bYnYSFR7aF1U=
X-Forwarded-Encrypted: i=1; AKwUvBz+ux2F3GXbUoze9lI6t1j7NLXOMKYtUgEbk86PW+CDuRcti3TcCTTb6tIjZRXENxHN+YcSbKpFbUEkcl0=@vger.kernel.org
X-Received: by 2002:a05:690c:e688:b0:8a1:2ec5:43fa with SMTP id 00721157ae682-8a45990563bmr195837b3.7.1790094421303;
        Tue, 22 Sep 2026 09:27:01 -0700 (PDT)
X-Received: by 2002:a05:690c:e688:b0:8a1:2ec5:43fa with SMTP id 00721157ae682-8a45990563bmr195527b3.7.1790094420703;
        Tue, 22 Sep 2026 09:27:00 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a3adfea3a5sm4663167b3.25.2026.09.22.09.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:26:59 -0700 (PDT)
Message-ID: <b954ca7c-f586-4e58-b667-4888c66ca810@broadcom.com>
Date: Tue, 22 Sep 2026 09:26:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 04/12] net: systemport: Fix missing phy-handle parsing
 for non-fixed PHYs
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: netdev@vger.kernel.org, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Zak Kemble <zakkemble@gmail.com>,
 Simon Horman <horms@kernel.org>, Ryo Takakura <ryotkkr98@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20260921231305.394773-1-florian.fainelli@broadcom.com>
 <20260921231305.394773-5-florian.fainelli@broadcom.com>
 <b7f98fc21fb2187f431703519b5f1446@tipi-net.de>
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
In-Reply-To: <b7f98fc21fb2187f431703519b5f1446@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/22/26 01:50, Nicolai Buchwitz wrote:
> Hi Florian
> 
> On 22.9.2026 01:12, Florian Fainelli wrote:
>> In bcm_sysport_probe(), priv->phy_dn is only initialized if the device
>> tree node has a fixed-link configuration (of_phy_is_fixed_link). When
>> connecting to a discrete MDIO-attached PHY referenced via 'phy-handle',
>> priv->phy_dn remains NULL. This causes of_phy_connect() during
>> bcm_sysport_open() to fail with -ENODEV since of_phy_find_device(NULL)
>> returns NULL.
>>
>> Fix this by parsing 'phy-handle' via of_parse_phandle() and falling back
>> to of_phy_is_fixed_link(). Ensure proper of_node_get() and of_node_put()
>> refcounting lifecycle on both error unwinding and module remove paths.
>>
>> Fixes: 186534a3f832 ("net: systemport: use the new fixed PHY helpers")
>> Assisted-by: LLM
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
> 
>> [...]
> 
> Not sure this qualifies as a fix, the driver never parsed phy-handle. 
> Maybe net-next material?

Good point, we've only ever used fixed-link so this is clearly not a bug 
fix.
-- 
Florian
