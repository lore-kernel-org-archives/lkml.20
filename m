Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870213;
	b=JkeCjKeZaYGDXf2u03M+Dcp4VMZmInMXjfFhnC3FupdRifu258NbthBcXYWSR5A6JXX1
	 erctMgmxZaBh4S9nTRcoo/xe03G9yYN9hgwpnUsI2nCPLgGkl0qWopzltOhFWYEBgJf35
	 g5mz9WC9BjDdzVfxy+JcUrAiV9K2nzKLq7VgXw97xcqMpMdKv8oQdAor7ta2lWN4dVIm4
	 R5Fcle0G5JAO7ziSiT3uSBM5rMIBIZwXBhULNRpELkhODEBAmSf58lIaoMJD2xs6kyPg9
	 Hc9Mn/ZWhoTaGIRTq4wFIdmWBEhFFbO2IfPQBwGhes0frGrSfBZluZLO57Mjw5H+wuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870213;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=SikvGO+o0scab1X/xGcw4seKCWg4eNvBhS3ZiTaMnic=;
	b=hYrQD9JGGWg3oGwOi1cndySxwNxJWbVJ73ONQxShWtmk4uaJuf6iPawJj5k1MvHvp6PW
	 QXJ/6+9R/1Cw2ZuNs6sW1O3avQreCY8U4LagneW8rr1cTK1AN5HV4B7slEhwSm0+iL0Nq
	 +ZmbBDAjaSLW1CagL4nmyHL6U8JsSXEf8vNaBFlA9jGMLLj4hdJo3T1uRPgABuhUqM5Xl
	 7ceohk59+HZbzpcRmjPF8leM/Vn2slevJOZnvDBEgb5nV2yuuuw/gTnb3xGgMcjlabAFQ
	 jbSimjtYfwpINqN+DC5vVcAvE13gs0Z28gt+tDIAei2296ShBNK9XsYbbwMtunTUCXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=abNaovj3;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383B4606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 383B4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=abNaovj3
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso2033601a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870212; x=1795475012;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SikvGO+o0scab1X/xGcw4seKCWg4eNvBhS3ZiTaMnic=;
        b=kLDSY6JiN+yQ7iiPxcbEf9jHbYa1C1xlS1GjZhcqboWhcCa30wNkM3cZovkadaWDGP
         DDhRSQuk0xoOwKrGHbVutqjyXtiRHg8Yx4nNH5l2wBNHozTN890gwzD/9sFzH0m9e3aK
         QZkn0lSnzkaf4F8Dj8MyKQCQIl05Db4N/Ux6WACECJvGyQGZ7PV70BU4kVBqdicvyr/Q
         Jc6mPH0VVM/rXEbyF+mbuvLWhNys9g8NHz5A87mFKvJqGAUogyuAnozDnio3rdw0Rmv/
         tc7PV8BgxSSVyGCn1rkq9d1HGATRTmiPXpDyRidIZOhUob0nsgmifmowaF4yr2rhBD0H
         aTFQ==
X-Forwarded-Encrypted: i=1; AL+hErFdQvNcBh0pkMSQlsrZTtxd5eZKaKPSPW4wlgcYXYTFl9HyVDKhysI53VsNVR8tBFqD0uzhwsI5Z/REyig=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xrCajLowtMZA2qUot5BfJUigH5pTEVQcEgBCmMXRrWtai8ehe
	4P5bP1SqiOzTGksl8eF+AGtQ0k38gCE2qXq+fRIeiEz/qPbkxu+sHPDZJWV/KfGErUHMVHuQTN6
	pzyyFste8MbEl8NxilkLSl7xSIB8nWzYR9SLonOuRMU9FhZgoqsNj2NcJaT011p8H6xwkPjHQxX
	DeD/6JUbMe2PfdZ7DAYRYEUrxH1CNk+Yg0S9Ae1+1EY+4k4SkKS8jPaFz85azJZa8ICB8/apFjm
	Xs60xLlkeMdDVFucRsggOXt
X-Gm-Gg: AZFdTZejbZGHL5d9Ww0/sAaN7pMYQXIklnqd8uedMEEY9JOp8SuH46wUX2fLxoQMKnu
	xV0YNljZitZ6yfcD8z1cWe5lSvtWZEtislCNuB765Ozery0ZfllNKpZX2D3HVrFrnvzuXhXzzaa
	e2lra3sPtRUAmgH+Nt8hCGW/sSnPJ9PcjA/DvukyHGzVhMLNwsH+T/C94ElPexnrlcpTHP4PW57
	Y1ctvddrCXlF6ykynPcGuI/jYz53GPU75u07REHteZ2eN7T29Tvdh9XkycE7J0v35P9UN2zdTYZ
	c8pGog1pzo7VLaZWl8vCf9RTVljJH/2ARWYQXECm+Yxqg2Y9RtxOoD8eCaDvCcSRCBvhhMK6kx0
	nl9km2REOUOLiJq8hsJkfpKAUrJTR6BbBDDAvJIFiX4Dgn8Dbz7U3F3CEgYVrYyCm1tR8cHFPKg
	PYMhyqJ+WjLkek9dJn2ZS64GdOv2Yb7spP9i6XdJ9I
X-Received: by 2002:a17:90b:2e47:b0:3b0:9317:5849 with SMTP id 98e67ed59e1d1-3b1b07e9b25mr9352903a91.1.1794870212250;
        Mon, 16 Nov 2026 15:03:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b2188ff4sm3905406a91.0.2026.11.16.15.03.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:03:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso3643150eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870210; x=1795475010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SikvGO+o0scab1X/xGcw4seKCWg4eNvBhS3ZiTaMnic=;
        b=abNaovj3aQVexgCzWzdZgB0PrcM5cJCNSlpm4ZoFBiZw4hbdl0TTOVqkiuJLJws8Fa
         W28sn8IcZ7Sd4JRJHdHTLHyNp/LCvIUIHdGQmAN29Aj8Yx+YdeDUpwS2aqQkLga2oY/g
         dwwbeDkhE6xxAe7Q1nhmq8rCVU3OpOPvf1bRM=
X-Forwarded-Encrypted: i=1; AL+hErHErrOkdfzcPfiEco5Ds/awmXyh9PlPhEY4iUj1ERA770ogVV5CWEJORXFT3oMO43y84stD6kLZVaT/9Qo=@vger.kernel.org
X-Received: by 2002:a05:693c:2801:b0:369:d8e1:7bb6 with SMTP id 5a478bee46e88-37967ed6d47mr10641734eec.25.1794870210437;
        Mon, 16 Nov 2026 15:03:30 -0800 (PST)
X-Received: by 2002:a05:693c:2801:b0:369:d8e1:7bb6 with SMTP id 5a478bee46e88-37967ed6d47mr10641717eec.25.1794870209797;
        Mon, 16 Nov 2026 15:03:29 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm73366441eec.20.2026.11.16.15.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:03:28 -0800 (PST)
Message-ID: <dec9b468-3d8f-433b-aa72-e207ce393cc0@broadcom.com>
Date: Mon, 16 Nov 2026 15:03:26 -0800
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
Subject: Re: [PATCH 0/2] platform/raspberrypi: vc-sm-cma: Fix sparse and
 smatch warnings
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Dom Cobley <popcornmix@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Juerg Haefliger <juerg.haefliger@canonical.com>,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
References: <20261116-vc-sm-cma-fix-v1-0-2b0f11aa96b9@ideasonboard.com>
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
In-Reply-To: <20261116-vc-sm-cma-fix-v1-0-2b0f11aa96b9@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/16/26 05:32, Jai Luthra wrote:
> Hi Florian,
> 
> I've fixed the issues reported by sparse and smatch on my series that
> added shared memory support for VC4 based peripherals in Raspberry Pi 4.
> 
> My apologies for not running those checks on my machine before sending.
> 
> As those patches are now applied in your tree, I have added Fixes tags
> using the SHAs for the applied commits.
> 
> Thanks,
>      Jai

Thanks for the quick follow-up, I fixed up both commits into the commit 
they have in the Fixes tag since this was only in my drivers/next branch.
-- 
Florian
