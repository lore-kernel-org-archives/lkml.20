Received: from mail-vk1-f225.google.com (mail-vk1-f225.google.com [209.85.221.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AF743CE4B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603236; cv=none; b=gTi53IwhG2auIXNtq9HcStqDrta25TgcHmwUDCWXp4pHhrzvN7MVtecBAa32NUYUqYvnrHmnGlunSmKtppoaDDTcWTFgDffEv2pXz0AOuHzL5dzypTiB1Vr6c/5AODxRcPFKw3V3VRTERDr8oxVJ3SYjJHX3rklLsUf792Jn6qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603236; c=relaxed/simple;
	bh=oiZ6XktFqna/JhScVbDnl8dP8MMvhZCdpQNkz5Hg1pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTAu19jqzV/FooAJyWOmTjbzvkOJ7J6xgQGLp4dSPoH1Ct8YZdg6ySFdfKUJxK2L1a3CjaZ4gUkheGoXgmCipEhs9At4vhKa3G1a2CxvqzsmxYzjVn/NuuypViQ71ie/XSvBgfYk2v0gj9FCMmUof/ePcZ3KEt4oS29cEix+riY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YO9L8A1X; arc=none smtp.client-ip=209.85.221.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YO9L8A1X"
Received: by mail-vk1-f225.google.com with SMTP id 71dfb90a1353d-5c998d93153so30089e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603234; x=1790208034;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J4imMswxUbVr42K3g5BOsJ0pmPAyLAHU01ncoNcfWeU=;
        b=oMApjbEP65FUxHD6Bux9Abvt4Pyj2pr7SweyPwZmwHIlx+oolc+QuOdHSimy2nWWXq
         lPuHKh+hqUARjhKGRRFiUowqbWzunCt3XwcemTMm7C7HgPF/moWdX9AkB32tiuUDZAE+
         oo/YWGkS01Kwu/y+VOu/gUn7YMOCVGlulwRHpfNKhprymkN0YsipA9/JSSEtUgxqkX4z
         g1f41tULlLp0tihK1r4oKNC8C1IWRe+/Lov+L5GgIyV3obQdqJhD28Dlv8CEN3GW7I4P
         fXC1jV3u9DsHAec57//rVOO0AlPk04KrCfv5zmkav1KAQdl9IFRSylpBiIFhrgX0Pt4i
         Fu8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/Wa7ZpIocFILjcW7EPTCze5/dvJbVVX3GzsDafA9Eyq267xS/xTw5ODysItiI/FKnmppPoB+yVPJa3Q4=@vger.kernel.org
X-Gm-Message-State: AFuF++lYzN4QJV+R+fDljGdEj6vc8+JfUagsQgs9G/2crEaRfDFnyZ5C
	sjil2iBZLkhZ3fM7mWAagGNKY999QabXnC3wVvc3fpUK0A2r/ccaPpNM/JCmUTabRejCOIwaZrt
	GVBfkTzM9mjJv1TORLMX1pvmpMrbLZV26vNusillvQVwJwiIoWOwnfA/LTqWAAS+AhS3AvMXFju
	6ztXmqIjWEoNnO4fCAjn1elLM8AQVpCfAO5k71GG1tU+Tyukysb7UchIoasjbJSZo4Ht6WfCB2V
	MKNi0VJ9Bo++9BCPTLYO5fY
X-Gm-Gg: AYBFou3OAMKnu+NPsvRhUp2R6AVNL0Q06qQouFWK21oaNtnd26RHqOfn37/TtoCrgzp
	fb61dtTEfvymgw3+ld5+YAm0PBZLdRmu2xVOakvuEZ7aSRgY4lLkabbFnbqqJGjzIc4n46T4K26
	PeYIeQmgu35MrF5UUeYbCPUpLfI8KLSa7xh0QIymfYAm4aFtmUTTNGjMyShBZofVt1/2PfYzAP9
	lmR4xBCI5Aw597B2UJDu5WVqE1rzjwEuX052CRpJIromDukvMDQwyS1UPxEtdy8Qp1d1hoocODp
	j91pix7A5dp9RyXjOs2M/0lJ1x2eKULomM24IoWLqMZQE32ZQssC4++bsjKw4TDHUsts/PIFcLJ
	SQNSE49qhpUg+xh2sd8biWHiloQbAe38COjg2BolC6oiEK0tScMP0kLNXRDDYowc3PaqfEzi9+G
	QQTWg0MBqXiij0dJmBeRhp93gHGD9jFgh6IAAsaZuluFA=
X-Received: by 2002:a05:6122:6d08:b0:5c9:a7cd:fba8 with SMTP id 71dfb90a1353d-5c9a7ce033dmr348319e0c.11.1789603233781;
        Wed, 16 Sep 2026 17:00:33 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c9a524cdcfsm430535e0c.4.2026.09.16.17.00.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:00:33 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a6f4ba619so267564b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789603233; x=1790208033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4imMswxUbVr42K3g5BOsJ0pmPAyLAHU01ncoNcfWeU=;
        b=YO9L8A1XCd7j0VNPZZ8DXH95mIBaVK4CP8epJfq9E93AyMl3ZGgJs8agyp/jZsibaG
         uyNeVIcDKvTSaQgnoaH0/oA2jzGWCaVkFs0cMzDq2oHuTj77VbJvnhiWuTfp18SPwKrH
         ZYh/5JH5cggj53UZ4JHNUDdFRZKUeiaXxfO5g=
X-Forwarded-Encrypted: i=1; AKwUvBzlxd31Wt30MHHxjRw55JtFn37mDdFrSSPoOnwSjDpto7keWM1E7/Q54lAumlM9YkWxSBksyHiIT8SLUsk=@vger.kernel.org
X-Received: by 2002:a05:6a00:300c:b0:864:cbc5:b8c1 with SMTP id d2e1a72fcca58-872372c3f26mr10397567b3a.2.1789603232051;
        Wed, 16 Sep 2026 17:00:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:300c:b0:864:cbc5:b8c1 with SMTP id d2e1a72fcca58-872372c3f26mr10397425b3a.2.1789603231228;
        Wed, 16 Sep 2026 17:00:31 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-871febde2e1sm1973248b3a.7.2026.09.16.17.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:00:30 -0700 (PDT)
Message-ID: <5ecf4562-3333-4b6b-9a19-bedc56750022@broadcom.com>
Date: Wed, 16 Sep 2026 17:00:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] PCI: brcmstb: Use flags u32 instead of bools
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
 <20260911233541.1650895-3-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-3-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/11/26 16:35, Jim Quinlan wrote:
> Instead of having separate 'bool' fields for each SoC configuration, use a
> small bitvector (u32).  Doing this uses less memory and provides a uniform
> method to assign flags for a specific SoC.  The expectation is that more
> flags will be added as we replace conditions like "if (chipA || chipB)"
> with "if (behavior_X)".
> 
> A helper macro "BFLAG()" is used to shorten the determination of the flag
> value.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
