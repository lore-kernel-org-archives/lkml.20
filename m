Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688636;
	b=KRIkH7C1Z2kPRK1k7nlOlg96i1vCcJjLo4PUK1ESCVtOTbQifCMj7rNq1yd+pVC9Io3d
	 fMhr2OiI+vI5bwc1HDknu6kwus0gB16Cn9f1aG3WvQayDdC9XkTz1BG4kzygt3vyd8Idn
	 HssPwqns84+jgmLHKabPQnhLM1mD5QrxQTAuMZ5sPW2EsPqK/vOo4mURbeX9Iid62eiEs
	 SKS5yPpzQzvjR43qw7yDtRUg8sBlqlVerRV4HoiKH04DJhVPehbRc+A+tj5d4EbHrHmJX
	 b2nkjDNuRQn5QaSqF0A04tyVBFia4xmvm+g9Bc1iC8BzkSokJxAzjrGEOPmzQZv6Alg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688636;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=KhrZm0zHiTnRcguhPzPRKqxL4jUA63f4qsM2/mVl/S4=;
	b=D5/sNZhbNvojEjytVMla3f+Z7rKU6awWCBw0LergDgqW9rymV2fqVADHZg69W/0Loc1+
	 NuFw0xL0sSaisJzl0kb8SCM9C+V/g0WvPJ588DZkUZgvO75Xn7Wvrj0Nyy0YTJ3PYSGQB
	 qGzKqGta9e59Frf7WIuAos+EsGbWOThViAWRYOV3yo0sDysBQ49oqaPRsYq+vkphwvVtF
	 e4aE2AsP+vlppttDTrD0RGdK2wqJkkILsv3qcgmeuVMYCGlbMeRGr8CedfsvZZFYDNv8G
	 Icb4NRUfgmzu9b9V54AHkt5zf0bfXsaATay70WTcqqqFjgRpQgQFyIA2rZcc1L/aDUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HrM8gcJy;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4B1606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB4B1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HrM8gcJy
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso31008a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688635; x=1793293435;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KhrZm0zHiTnRcguhPzPRKqxL4jUA63f4qsM2/mVl/S4=;
        b=cIhwgN7ZnvutlzG/WT+K80plFtLsam2Ewivz8pZyBBDlWkVjbCvzv/ITfmh80NjkoT
         /GHD8uZIj5G3svVPW31OGSYclyRfIfcsI1IeAUmgZkcBr0uyq7Adw0GCZvPFogtI6nR6
         dDT6m6dDlpGP8IkiS0hd9rlZzCIdoEnN9C+8r3OkKx9p6LkBUVEhHsizCm6BLEh4skk7
         SA5HXI2o5HQ46Pp2R71QYipr7NVqI4lvri4X2DTDiyKHSXr/ezKFmeMNP6knkV/so3CW
         4x+y0ow3pcHyADc77SIR4XsZ8mss+Bn0Fe9qlXPGD8zBrxn/BQ9sPCpvGogXSvzxt2dO
         1gag==
X-Forwarded-Encrypted: i=1; AKwUvByU/EwGzxszCedQzeYtQgbtpofirhWb1eD0nDDOedA0x+sebrcrTzxJoMTNz1qZ29DU9s73hjQtjGo4e8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFYTIQCj9uZVW2iew9mfAcwmiXzrjacmmUdmpdvEvYwJWcK5FD
	Rg08uVGAZoSufV8dQ74um7TAP6O6bZLsgze3BWKrVdLwOLykB91Fz6TV0QxifKRIcqSlPyWmroG
	VNnVZFmEb0Pb2PrbzpZWuzT8REkhbmex137seGIj/gjqbvg/q2WPmTp/VUNVzY6LFeCs35KcZDi
	4W2JFeLlFGrG6yq+/MvOgiezZA1fAZCGBgGtUJsSBYUIaudaWqrRt/dwrJ5DlwPrBe2rtYGIY8c
	+jEvT2qxGyzHlyU1CjvUt1p
X-Gm-Gg: AYBFou3bT7l469mnq5Nvbv3qu3mACYtsARHaSmnwIjP2n9Y3mSdVLPxkkcRZoAMSAEt
	ywmDk3ihEfOwPhWUuRfQWXouz/tGXuM0FlZQtLgmdZRHC1C1/S7PnkZDbeECp10JAAdMgfHQSpb
	03YotKSwk27dsmHOlBOGmbc6aaGxbBxotvrFW1x5UDVLOL0YPxovM4mW6lVOb4JNsvMHIxZKpJt
	1g477iJK9j3S7D1Rh/Y5YosKoxM8o3/uLCD7SsacW/F5+Hs+xPJvl+Itl3V0p8e3c7lOTfYiHSG
	CeeN34VgvwY5NI7mtJmlvR1TIKdtXCnfRNZoJJHKP735d55d1vuYTdueS9oFRO+QnYOtLRFrl89
	WsGeL+q1bI8wHMqpC1CweYMaSLpwI3cb0+DVK4vVb5E5eOXz7NIP7RzxAO4Cx82x38xqP1XeMcN
	B3AYdNUMODewP//th+MOr6mH5RdAeBZsiB97tSl+Bsxus=
X-Received: by 2002:a17:90b:582f:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3ad86b0bc8amr5084654a91.4.1792688634937;
        Thu, 22 Oct 2026 10:03:54 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adc8c1741fsm8148a91.2.2026.10.22.10.03.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:03:54 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b4bf686ceso2594516d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792688633; x=1793293433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KhrZm0zHiTnRcguhPzPRKqxL4jUA63f4qsM2/mVl/S4=;
        b=HrM8gcJyT7vAHXqDlemgwwECPHHqP+7XJI81eltLuirjuMXOloxcnbkepr6O5eRMcI
         J9e4op2XZ/7lX0I5UsVs0OmNC5opt8zbSLLzP6CC9J/izDLKBdqjrDdCyqf4TwZgsx8A
         lXhwLcufI112y37+vME2+4hjNFmyBp3hTb8ag=
X-Forwarded-Encrypted: i=1; AKwUvBzzMGr2jxv9IVSAd6Mffzsw1Qi35ACaTqLewWbrNpS/QtBrH63bMmjQ2XH0HLPSXqVHCcyrFUUgndZGp80=@vger.kernel.org
X-Received: by 2002:a05:6214:19e1:b0:91b:efa3:a608 with SMTP id 6a1803df08f44-91c12f0db8fmr97404306d6.44.1792688632778;
        Thu, 22 Oct 2026 10:03:52 -0700 (PDT)
X-Received: by 2002:a05:6214:19e1:b0:91b:efa3:a608 with SMTP id 6a1803df08f44-91c12f0db8fmr97403596d6.44.1792688632108;
        Thu, 22 Oct 2026 10:03:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c3705e80dsm1945456d6.23.2026.10.22.10.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:03:51 -0700 (PDT)
Message-ID: <2580c2fb-0ffe-4867-83c7-368643854dff@broadcom.com>
Date: Thu, 22 Oct 2026 10:03:48 -0700
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
Subject: Re: [PATCH net 1/2] net: ethernet: bgmac: preserve forced 2.5 Gbps
 link speed
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Russell King
 <linux@armlinux.org.uk>, Jon Mason <jon.mason@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>
References: <20261021191035.751684-1-florian.fainelli@broadcom.com>
 <20261021191035.751684-2-florian.fainelli@broadcom.com>
 <20261022082908.5bc9f6d6@kernel.org>
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
In-Reply-To: <20261022082908.5bc9f6d6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/22/26 08:29, Jakub Kicinski wrote:
> On Wed, 21 Oct 2026 12:10:34 -0700 Florian Fainelli wrote:
>> Subject: [PATCH net 1/2] net: ethernet: bgmac: preserve forced 2.5 Gbps link speed
> 
> Does not apply & not correctly threaded

I believe it's another case of some emails not making it to netdev, I 
will resubmit with patch #2 applying to net/main.
-- 
Florian
