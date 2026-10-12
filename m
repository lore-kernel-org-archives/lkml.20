Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AA3431A51
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841544; cv=none; b=OS+FFkuo+/MkhY1vFpDDC/z5DwQZO54LDfHBBQgitiTDqzHEIzCeNCSi1mgkTcsgAHPalumGtDs4GFlkzJBODqqm0Q/3CqOrbJMe787bZOxUaCoNUrKs0fZBaNsxkehPKWMqwvnT7YqgP1JneiaTcCY+C6TCnM2YxbgjFC+l7N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841544; c=relaxed/simple;
	bh=EUV4jR3Xmrm+zvbQKNKQvNj7dgrJGr3KYjlMK8xOQSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srEn9R9b+MFHF2xgpHcmzdWVbTNFviv0s3t9yiPBEXBTwb2gCYTElcKBlIU1ytacrB4l1gSManCG41hiqkk2Bm2xfpa0EoJgbwbVu3+ziVPabK6htPVEyFWG0jSgzzuvkZe2D7jrvj2SK6fwM0q1TOYFISpWkGtJ1kVFgbMmqY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Xy/efOQg; arc=none smtp.client-ip=74.125.82.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Xy/efOQg"
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-3550c917fd3so3306338eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841542; x=1792446342;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cTnyIzo3AeEH1eCQ1+EfSK06BlNNlyFOOZ6a77pSqG8=;
        b=lkFKxh3AZMeL0Tf6tsGZ9VaqmIFJ8/915CW2KOsXToq4sh8560Z16idohm292ojt12
         Yr1SMdp7iS+ozBKdJVBrYnh1V7+8hCw8dhlBfM8aI4cdkqUA0mVz1MIl6KbpKilYnGi9
         vzpgl8MnusD4/xu9y4NDn93jOoww5aF3Ky/bYpOXEsYKeKIhO6TpM321TbM3qT/khcWU
         oY5SKh35DYGw1ra8ndclwcfkK+8JaSDAt0ZMREXzhQwCLMuR36djBNilwuVYFtrMtU04
         uiXgCWSF58A+xmA+KmXvKYbXFzH7RKcvY5jy0iQM5XflrQ88T8TVbKcObi0D/xp9EnrN
         Gwvw==
X-Forwarded-Encrypted: i=1; AKwUvBwlNmEMj103AKohjEjN6EnrKhqpOmVV+6bIfiiJ58FqhAYpvDTTEAd8d6QrCPQwFM8tKJFs78PKEVPm2c0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+RcC8Br+zKMLJe/aD7k+dvhm6tcxgJu0N0QwAMxMnU9R3EYwx
	ZqWsHwQQgEKKskF/cmF/B18PtiqP2+FhLG4ASlgCIhQEWDT9e2dmdvjEyGNptUqVN6/XLB0j1qQ
	iLgogPTWC3qgGSqDpNdKo7wh7gTZfShiE4kJ2RSMgfQ3Vqz2k9hQCR5GFULFBaD4UzdpQR5UBgJ
	v8/sJd35I9Ni4IoOsHAzPUGNJEX8fYfQ7ETrXjdml7cKF7HmONlW1cuSkm89bymEnF73FS9nYuS
	2rwmF8uLzQnQQU+XBCBnMvN
X-Gm-Gg: AYBFou3oJPnf97rR7bnzY2a8b2ofKjfC8zaaPdEslRa/SE5wIjf0k5Xrdo7246uU5iE
	6Wny+kdWrVRPUUmS+YJLCA01dkDDPx+/V91cM4traeNE2C3PInp6Vx6IID3lCBpQoyR6Bz5uDh0
	qmCd7Gyy/RgOxCuculC5PKDb0uuANs+BqZy5t1kKQsex+o6Aw2PJflYerrFWBDNhG7gIiw/IoJW
	LA/Rn5x1Qb30a76XjOI7TN0sOdiAZp3QfgTDXXTBfCiM0weWisnuJZi/RSZS9i/IvOvHoPsSIy+
	HvO5AF4eLDyNscNSu32wJ4ugm1rGu2jk1DIrl3rfry0kxzkrZopMtAjZj9iBrzmVoRolTcS2/hi
	CQVojHsyS+9lulYYxn9u3JHLxQMtncbHxD1dAMFerKqT0LTUaKxJ0vxECGez25ySCXwq+5sDjdF
	NfjWjEfuHYkmHlS80Nf+YA1q8HAw+u1dQG9uLC1DoqYAo=
X-Received: by 2002:a05:7300:ec8e:b0:351:1bdb:e3b7 with SMTP id 5a478bee46e88-3537e0792c4mr14600976eec.15.1791841542258;
        Mon, 12 Oct 2026 14:45:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3537cb71926sm172292eec.21.2026.10.12.14.45.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Oct 2026 14:45:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so6558667eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791841540; x=1792446340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTnyIzo3AeEH1eCQ1+EfSK06BlNNlyFOOZ6a77pSqG8=;
        b=Xy/efOQg6zSpJhgpgs//X8PVz1fyhubQqm+pDUisvRN3VanR7bXOl/czGSyar00wVK
         Rm2QQv/Z43PwJZux6lErFRqYgbK6MGunXfxz7MjiyO1d9/BD+OsjXdasfJFMDTy2w/Ds
         PZYmWTYGRayUufg+cFofIbGhEhtRBDq4fXHXs=
X-Forwarded-Encrypted: i=1; AKwUvByvqBBNyRtDDobLlmR41Q42o97Jr3KxUfts0HY2OKqtNcEbG/l4oKfSAbAXEtCpzD8Cp7LmibmrEbdjYh0=@vger.kernel.org
X-Received: by 2002:a05:7300:ec8e:b0:351:1bdb:e3b7 with SMTP id 5a478bee46e88-3537e0792c4mr14600869eec.15.1791841540072;
        Mon, 12 Oct 2026 14:45:40 -0700 (PDT)
X-Received: by 2002:a05:7300:ec8e:b0:351:1bdb:e3b7 with SMTP id 5a478bee46e88-3537e0792c4mr14600828eec.15.1791841539253;
        Mon, 12 Oct 2026 14:45:39 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e02asm39290375eec.27.2026.10.12.14.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 14:45:38 -0700 (PDT)
Message-ID: <8f019666-30cd-4c64-a40f-43982b297d2b@broadcom.com>
Date: Mon, 12 Oct 2026 14:45:36 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 5/8] net: bcmgenet: derive the receive buffer
 length from the MTU
To: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Justin Chen <justin.chen@broadcom.com>,
 Pierre-Marin Leclercq <pierremarinleclercq88@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>
References: <20261012-nb-genet-mtu-nn-v2-v4-0-2e2e3bfaf8cc@tipi-net.de>
 <20261012-nb-genet-mtu-nn-v2-v4-5-2e2e3bfaf8cc@tipi-net.de>
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
In-Reply-To: <20261012-nb-genet-mtu-nn-v2-v4-5-2e2e3bfaf8cc@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/12/26 02:00, Nicolai Buchwitz wrote:
> The receive buffer length is a fixed 2048 bytes. The packet ready
> thresholds keep whatever value the reset left. Neither follows the MTU.
> 
> Compute the receive threshold from the MTU and program it into RBUF. The
> buffer length follows from it, with the status block on top. The MTU is
> still fixed at ETH_DATA_LEN, so the threshold comes out at the reset
> default and the buffer only grows by the status block the hardware already
> wrote. Derive UMAC_MAX_FRAME_LEN and the flow period from the MTU too, with
> a floor at ETH_DATA_LEN so a lower MTU does not stop the MAC accepting a
> standard frame.
> 
> Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
