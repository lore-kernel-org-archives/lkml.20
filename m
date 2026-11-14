Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626742;
	b=Do205FyDGqyg+e71zsGuj6LA4XDbdqUyM9aG6AEptjukpoOVRyk0DlmhNok/wXhTVYeE
	 3aJ8ssQzOn7fSRv95SdYuOF8wrQG9oqL90rzQFNno/hasrjc0lNtNlwVsa8dVk+o4Vw8R
	 1LIHheIGlwevFoWciyTpN1ibS5nyZIXcJwd1HJcg/zTQn6OpJw4Vjry2d9PaVGYIWIf4O
	 beyVzriluj0ApvNDkAWGn0Ikvf7Ls3Cx4bmavt3SgD4XkwCRMl9JX+YLWzReTOwG9YzeM
	 NW8IP6FdvwvE3BZcVC4onacJvSmusuIXdUmup0QezaqKL5ePK5VMSo6BH4s6TP0HWoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626742;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=gHv/pDEHGZwL/04gMWr3kX9bFGLJf7m3Va9lbS0UiIA=;
	b=KcKyuk2PeGGx1AhF+dwtLP7wDnzLLxZ13wyrUlHnQvh3pZF/MAbI4y3RfGBaN+x5MWLa
	 dyVbkvXJOENs/reNCATGpkHbcLISf8s7tnLkVkwg9uT8IeuGk09wnrSANUYEgHeHkL/b7
	 VOI1beqoIghxXRBYJIsx2mgfNbMbz4T25ypKsAqDIq7ThTusxnK7bciYHDJqUYnPt2TEn
	 gj6a067BkNBhAwpe1uxygdTEQHTfgMPsX6xR3AULedPDJ5r+MUv91rxLUEOgYKk1kc0St
	 7lhjKdJ5t8QZhGObmpGqGNAgi8BwA4GZPYxRn48tQ47/b9vKB1uvFMh6NHhMqMD6nfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="iDn/Xvp9";
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8322606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8322606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=iDn/Xvp9
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso575584a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:25:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626741; x=1795231541;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gHv/pDEHGZwL/04gMWr3kX9bFGLJf7m3Va9lbS0UiIA=;
        b=Ss8E5yCyR5CQ9n0zTT6byEazuOnqp1oqc4rX/ijr8AHta7a8myCBVQZtLDTYuHmPY/
         Tzi9Fg9Btyp3Mt25Ks4Cwjq86QX7hfS04ll7qH8i0EklOnIxrB2EMIl0LKkSEMAC9nol
         BZNbPdaeI0eGFbD6HLqrjuaQsUtyxQ7L0vk/1OW8BSX8rG6oTj88hB9JbZO9cAguzvaR
         Nf81phRMex5cscdWLmMtjz/bigu1t6gxstqPM2T9RsoB2JkjsSNDXRDgi69h1SRFaufc
         mbYeRGTM9z0J94kymS5O5tcdwOftHiKw7HP4M/QTXrNJSQNSjH1TNRokNxQ8UNoNeMSz
         A1dg==
X-Forwarded-Encrypted: i=1; AL+hErGXigMfVvWTnkDQWpQ9+xnarrKV4ZyzjLpaCUKl6CFsRcM9FcwK7sKOmzKM7nSGcEKrzpKg93RcH15Eogs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yaS6lipxKyHfuDqT3E2cxfiosg/6P6po7+nSKcYDAomams/zH
	6jTsx12MVTkaXKRAIKPynMQHTwxAl+bY7hKPIdK3tqjdpKo4bzrP9bRvtB6qWR3PNcgrKoxgO7X
	Y0v3ZxhTIs4TazlIkz5A8Z503RyQtBgHs5xm0f7FEvMDxLVxcolGzvDo7hzMebq2PIIsS+e/CFF
	PCTg/z2aL6f4O6TakgKgHxQP0xQC3ry4D+nNMBLWtEyJQwk4y9PJcSB0QYBXd30+22nwT+Tck3W
	BaXkFTK4H8RgZcwKWrZdEFi
X-Gm-Gg: AYBFou29FHkX16xpi7+DFIDyfKy+Hr3cpz0kt02K2gLNEcyBB/lYTG2W2jVltMAIWRE
	2R0alqWnkkzkFufgOMspO2UQmJn2Ie85e9u3cpyQDZojYWTTGa2g6f45XV+NiNMp5EwDQZMD5lP
	fzk/jA2wMGa/ze986XCsxrwrrX67rwd+kWwBuQsUtTukXHGagkKpdAPWb9+DY6BWYCS+lwac8B/
	WXDiljmQ1D8bETT7okCsA+ZOzGX6M9xaFBZlFwhJztJINMoaXC5P7CFGIsa9c/PcmDBAGwWd4tF
	WqQXSS5WDW8DFepy9KY70Tl+Cn8TxWAJY3oS2eFD6/56mENlOOA5pSNpr8XwUQS1dA4xCj1vvsU
	FYgvueTbE4ZAukIez77dymwz6VSqfmNMcEfX1AMnTC4Z9kzCzhyDKYNlvaoNggyiDg9hpWVY94M
	/9HcT3d2xJaHj5x7UEfYwNhjMfGm+Z5kfJqz2M8DCe
X-Received: by 2002:a17:90b:58e3:b0:3b0:d365:f8e8 with SMTP id 98e67ed59e1d1-3b1b0a1ff3fmr4132532a91.17.1794626740874;
        Fri, 13 Nov 2026 19:25:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197ca0af1sm8856838a91.3.2026.11.13.19.25.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:25:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so2070086eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626739; x=1795231539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHv/pDEHGZwL/04gMWr3kX9bFGLJf7m3Va9lbS0UiIA=;
        b=iDn/Xvp9V1bf5Cej3qpc4E0R8KzTOFTjT48KscSwUFx5ERa3Rdqdz8PK6A3fcqJfGM
         iHGofsw4HmxAt88ttUEivbqXXZRSVytKfnvMPye+1YyU75+avHfBpm1Fg1c1bN7TFa36
         5sYkPAJADBcYoOARYHBEtHhhRwUIwjAAm4kxg=
X-Forwarded-Encrypted: i=1; AL+hErFslMzdhOeK5rxkGNdbx2mGw0vcok24z1Pri8+sqOF7Z8OkY2TD3JMaDxDIXHGWueh3p1S6IfVrqjFTLUg=@vger.kernel.org
X-Received: by 2002:a05:7022:3a87:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-1b5030980f2mr4605143c88.13.1794626738989;
        Fri, 13 Nov 2026 19:25:38 -0800 (PST)
X-Received: by 2002:a05:7022:3a87:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-1b5030980f2mr4605093c88.13.1794626738111;
        Fri, 13 Nov 2026 19:25:38 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm12632658eec.14.2026.11.13.19.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:25:37 -0800 (PST)
Message-ID: <96e08e3b-f034-4d69-8b6b-4a094cb39b25@broadcom.com>
Date: Fri, 13 Nov 2026 19:25:35 -0800
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
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
To: Martin Wetterwald <martin@wetterwald.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
 Gaston Gonzalez <gascoar@gmail.com>, Stefan Wahren <wahrenst@gmx.net>,
 Phil Elwell <phil@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu>
 <2026102218-vowel-plutonium-629e@gregkh>
 <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
 <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com>
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
In-Reply-To: <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/13/2026 10:09 AM, 'Martin Wetterwald' via 
BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> On Wed, Nov 4, 2026 at 3:20 PM Martin Wetterwald <martin@wetterwald.eu> wrote:
>>
>> On Thu, Oct 22, 2026 at 3:31 PM Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>>>
>>> On Thu, Oct 22, 2026 at 10:29:24AM +0200, Martin Wetterwald wrote:
>>>> Hi Greg,
>>>> this is a regression introduced by aa125180c673 (via your tree) in
>>>> 6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
>>>> 7.4-rc1 has not been sent yet, could you take it there? Otherwise,
>>>> staging-linus would be great. Thanks!
>>>
>>> This is not a staging driver anymore, please route it through the proper
>>> tree after -rc1 is out.
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> Hi Florian,
>> Now that -rc1 is out, could you take the patch?
>>
>> I've checked 7.4-rc1 and I confirm the issue is still present.
>>
>> Thanks!
>> Martin
> 
> Hi Greg, Florian,
> 
> The file I changed (drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c)
> is currently listed with Florian as maintainer by get_maintainer.pl.
> But Florian tells me he doesn't maintain VCHIQ.
> 
> How to proceed now? This file doesn't seem to have any maintainer as far as I
> understand.
> Any pointer to someone able to take this patch would be appreciated.

Sorry for the lag Martin, I will be taking those patches from now on.
-- 
Florian

