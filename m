Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332928;
	b=MykC7WqxxirNDPcQ/zk9U9fTLGn1pnw43jEAKw2+Ij1TDbH29YQCj6PeVRwv59Wvftln
	 JpFXeZALemgzwtjNeRHp2lsIfDoObiiI9Zo6lfp2x2TZKeXdBfF3/2cY66ejudB86B6jz
	 ctG45oK0u3IDrmyNXf/vnGADfbB3X6SnHXoakU97QWA55QDB/S7iwHoAhCAQu8oFNYaVk
	 nwLxdpANcGNfJU22z9WTorypTlsQJ39/BAx30VsP7xeZiEX5iC4J+4EeV+dO9AhOavV0n
	 TZ+lE/J/eya7UnHdToBbSa4XhQ9FDhNhQimAt8rwoF5UxWImvuLC6XSMKf5pwtvtI+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332928;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ko07PtYbqxmJFL5eE7O+1z90SoFtkrR9tqYTOjJdR/M=;
	b=fNG9hX2V1gqTU6v7FlXTW0FcaYkiDkgz14zbtezvDKO81lGxDwy3o2lx5/y7gSNFRsJh
	 dw7OYnp2wMU8Jkfy2jjcyEvSBiBFoptCgaRyKIOuOlvhVnV/pK4VfkAovG2ViRVsDm+21
	 wrzAgUgXdPAfrFz0x4QDBA7qLml07CpBuM3W6SG7aQ1nEcBpDlZl3KkytrbuhBg9xS7mm
	 y/8byS96WQG9Zm2YOi9Fkq1CRLdyla02MToC7obSHuyJ2PL2y4XSKz8GFYVlpdD0jl9tz
	 Hlzt56G24bdim2uSBiJkktQla/KpaTigYea3wMa91qavdE5brepq4BmwoPX+EUEoXcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="PVaKD/XZ";
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB2E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB2E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PVaKD/XZ
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b179528d56so243993a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:48:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332928; x=1794937728;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ko07PtYbqxmJFL5eE7O+1z90SoFtkrR9tqYTOjJdR/M=;
        b=wESZ12c3cOomBnLt7mVJDsfSduddnVyS4RqZy9IePCUo5oRUAFFg2K2b+z2x/IjdL5
         Pb5EFEN7K2rLSPflQrLBspVNTMsgyBk2Uh+NTFWY3A5FprGf/kWyEyqJC+FJuaA1v0Ov
         aY/MVn9zT9eor7unFaWOftE2een1/6g8dAz7bpZHTHzjAsQ5tARjLMJNOX54wB1/3Kdh
         HopPCbxJ4Lpm87+ZX45WyuSWNh9N0E+ZduQvfrJizGANXzz4ik8J+D96gadGDb8K1xy6
         Zx2qcONlb1vcT+fJ5CgbV0Z9WJc6PSNt+Ew4Cu9gua2lVWg6PIYtV0hUO9zEGmGdfpbI
         e0Bg==
X-Forwarded-Encrypted: i=1; AL+hErHQZynVEIF7Si3ZnOIi/YnO3A+iuiIQNX7S+NQwhowSSkyVfOT9QKWggmnPAxWef5KQIIcrG0bIUiAs3Hk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lBrHoY1i+l+QAX9D0tgFssMZVAXNjBYNqnEn13IbJChXO6TF0
	qiAUkcwttuWMFO9r+QLORqCjzLSFcgfNJGH50XgJm5eb8PneAisoI/Piym6Nb39aS6R+DXFxBxe
	T+7WyQSsjsVQdnJVgLBQv7u5Zny1JlRpCrXHHsWaIcYg/g0SkIjLImb7EHhvjhOoOh4CTuM/wVj
	BWPZUhtY6fjXv00/CYEzkZoFQzqOBlfkDkmSaSTKu5B56lyP2KhuapV7Ks8IMWI/awLkqIb92XC
	Aw8Eszp/nxrHp9KMMF06Z39
X-Gm-Gg: AYBFou3GvwLHUN+uovDjoxuE1QztqoSkeI/gDqRbH2NEU3hj9jepPpZeG4joXS4bTm0
	3CYFvL9VQTxv/h3dxAS6svxb2m8pjvqBExD2LOg3TgV0RcxXsxO/a22okrqg453Tp/SMO9XA8DL
	i0jNi0JGIVTd/q5E86KCbHDn0T/8mC57OgiAso1NLHL+vtIf2jN89Vd6HRrGU9nfRq7wOan8AFS
	fCyIoqWSOUp3fLobudA5j+K2lzFSH5JWJB/Qs/FzEmhAe6aKf29+Y15D9WocEC0CO8JCUT4LCCL
	kAWwY5u7h8VQXL7aJsvf+1pk9k3RxRNC+51AD2nhopRRd/ekQzAlII4xkTXrsw8l+hHn/ZTar6P
	zcUw5SB9HNkmXyaeIIlbTkS7kRs+YPlNwyKS5WFvK0s5b9Tnx5F4MXTXLvPUaF/id83F81svUwo
	ZEgO05Zz/B+iHwMmPeOnfOzE0rxEBn0eUUSUVtp29z
X-Received: by 2002:a17:90b:51cb:b0:3ac:ffb8:1809 with SMTP id 98e67ed59e1d1-3b166d03814mr3107884a91.39.1794332927577;
        Tue, 10 Nov 2026 09:48:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b17db57cdcsm299612a91.5.2026.11.10.09.48.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:48:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0ac277beaso1963532a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794332926; x=1794937726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ko07PtYbqxmJFL5eE7O+1z90SoFtkrR9tqYTOjJdR/M=;
        b=PVaKD/XZv6dd9+toxjk8tcIpq29wMV7Ym0U9Xl3kttsQw6mWkXTnJ4EBJ8H8W1l0xQ
         cmbfnw5C65SY5oOdKDGU104CkD8RMVQxia8ofiT05EDSfBH8x3EM/0DTidG/nSgUwCEZ
         x5odETCzYbkzIxUqDwnWQ1N0uMgs1L/kV4WGE=
X-Forwarded-Encrypted: i=1; AL+hErH9DBWY76L2FiTm5IDGB5rFmBbacIPmjrVSvXuexwf9YHLN0TAvtJHh5pJGrfsFPtpIod8qPp2T6O9Nxpo=@vger.kernel.org
X-Received: by 2002:a17:90b:1fc6:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3b166d03802mr3219207a91.40.1794332925876;
        Tue, 10 Nov 2026 09:48:45 -0800 (PST)
X-Received: by 2002:a17:90b:1fc6:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3b166d03802mr3219189a91.40.1794332925425;
        Tue, 10 Nov 2026 09:48:45 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e0d550dsm566282a91.8.2026.11.10.09.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:48:44 -0800 (PST)
Message-ID: <f24e21f1-3bd8-4682-8393-ec6aa6c1b232@broadcom.com>
Date: Tue, 10 Nov 2026 09:48:43 -0800
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
Subject: Re: [PATCH 2/3] pinctrl: bcm: Use pinconf_generic_dt_free_map in
 bcm2835
To: Wang Xiaolei <wangxiaolei01@kaihong.com>, linusw@kernel.org,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, daniel@dragonzap.com,
 iivanov@suse.de, andrea.porta@suse.com, phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-3-wangxiaolei01@kaihong.com>
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
In-Reply-To: <20261106070628.1428691-3-wangxiaolei01@kaihong.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/5/26 23:06, Wang Xiaolei wrote:
> Replace the hand-written dt_free_map callback with the generic
> pinconf_generic_dt_free_map() helper, which wraps
> pinctrl_utils_free_map(). This drops the duplicated free loop and
> handles both CONFIGS_PIN and CONFIGS_GROUP map types.
> 
> The error path in bcm2835_pctl_dt_node_to_map() uses the same helper.
> The driver already selects GENERIC_PINCONF, so no Kconfig change is
> needed.
> 
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>

I think this deserves a Fixes: tag because it fixes a memory leak, 
generic allocation can allocate PIN_MAP_TYPE_CONFIGS_GROUP, but the 
custom callback does not free that allocation type:

Fixes: 0de704955ee4 ("pinctrl: bcm2835: Add support for generic pinctrl 
binding")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
