Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254067;
	b=fuL/FVCIHDf/6QW0wiHogBgBI3rioGVKdSfZyn5YDUCPG7AeMST4oujMREu7pU5kJ85O
	 mquKBbgamBpd9c3DnFs4R5wa6++Ir18h+4G1+df3lE9qYD/FKcAsmSrbScDXJWagRemCo
	 0ivh2DYocOK0hUoWBP0Q12y3YSEULx+l33z/o5itGreH83OiJkR+e/awOlgPZmy0JmS37
	 R/Qu/gfQa7T0NkYoFlvHDhMsAN2YGsukfIZroIaaegAs0OLErTy1ov2lM8b/XSFVum26h
	 w0vcen9M8qJ2WnKmv+86C0RjdALH8SpVSoh5lEDlXtoiM82KAWDo4oLlLbp49wU+giA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254067;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=uQVB3943pYHcY0t4AyG05/dvIpxyl2oT97ja0CIlRK8=;
	b=5qrR63da/gYF4npbxtDDp960E8Yg0TBs0Ogg0uxcFsiVV0MYiQ9ef7RxUX+xDIuVtzL/
	 1Pp9Getb1+cqgEzkEWsgPf3SS72QYldj5vQbRjjROov0N1ogeDgtsVXPoDeppu9TN0fqy
	 b2k5VTTkCMsL5vPU8Lwe75lAR5XGa5UYHdh4J1O2lKaGzVhlLaFswFc0gD4zgQ4tc552x
	 LbN0bp8Rt3+yISr2O/XhIlSkqoMjWUr0xOZef4mUNvgBPtZ5NHsaMQcHEuYqX45z93rt4
	 o4dvSICx5iNeFDHoYSKyOpprYr0HIeYftVnCTooeEgfvrA27eqzO7cgmJhLBdcx+m/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PTbkyRRN;
	arc=none smtp.remote-ip=209.85.219.100
Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528E9606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 528E9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PTbkyRRN
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-91eb449364cso14807186d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254066; x=1794858866;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uQVB3943pYHcY0t4AyG05/dvIpxyl2oT97ja0CIlRK8=;
        b=XXlia7Hm/4LO/89aGuCBn0DPkk1OUGJ+lHPqL+ybGY5MUfLkSKMHh2LpGSnP/Sv3AH
         OKGsGdIrWobaYbVv/LezQDJ1Hyvd5yutHJ+H+CRDwHrCifX0xWxh72GNdnzwGqaBI7K0
         9keNzhEpPWyTYutC9/Las40B6Ax+wvQpp1Sq1Q13VbLHS7Mt9wgDh8uZDN77lEbPY1Y6
         rQPbkmbAZ1fZ6K5uVJtkJHo4uFjBZBrOT7dWj18jnsbohekZR4LYErsh2p9dQ1Zplfvb
         vTsnXzoLyp5YhSVmVQuqRVKqXwSIpz+tMS71mSzCj1FrdUseUl0o5cXZvCgDIn1xJPcP
         slwg==
X-Forwarded-Encrypted: i=1; AL+hErGjxj00XNv0ZG5O1AEv68Ye3lcpG2NgoFiMRH5F9fKk6NyF9Tj8gQUy9j8jnVo6RfLO5h0/9JgHZHGeqMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CbtkquL3MgF1umZTAGX01LFN/Du3t9oY1kflVXUIzaP6n3Gbs
	htBs4Q2GmVO6v3C5jUTwfo67S8t2szIT7UZEmYinesbTJ7nCX1HN7h9s0TsIK4/aPnFE7Lld3q8
	7Ix52Pw/I1DbVRhUaeWh/ac7lZ+PCcYqyCBbK+Hi/UH8FLxGkyzXIYVv81RtjtF37op+OyQiC27
	xaSnSIDewxQX7PAHfz6h9vI6v6MMVtmkhKuIMyf51W0xIj7aSn+cbWvUVR38xz2px5d+uzQEVeI
	BK0xK1HAbuRe8XaxCpg/C76
X-Gm-Gg: AYBFou00RunntzjivHupGSgrOH/uIaXsC4Qe8fe5xg751WgiYe/6+YGwixbH70+m6dX
	tj17LfsiAqXedO6RO2qNs6Q2YmQLRlrWqxovVD+GZ/N7wqcltQBpW/waNoqxVFZE/zyTDbZ87wI
	U0km59ioICVEDdTHEEd43ZcD3U/TVMSQt73ZfwQmtL7pdqBFNryfHqZzqjsnLD5YzK6i/YOI4AE
	c2/Dcq0Rb4GHl9CAf3jP6cLKw0/w65HiagWhmihligXuPmqfsZs4sRMLtkF0Iord3wzO14MuO+m
	mWAMMhNPPNBqX5DJedh2ZOZtHdniSzsgUMA3fkJv1wr7JFHHNH2pOog/sMjxIsvipvFJul2cYlF
	EwXZ/ysaZj2+IEnprQbA5QqeHdbzzZHLiWSl3uLkJsNchXV/ANeXs9YCAktvihWfnRHpWtzBUy0
	h8hv5Zp7WxBXMO7QmbNUnTuynXgaa+LZw/gdvT+svE
X-Received: by 2002:a05:620a:2988:b0:93e:d364:c9fc with SMTP id af79cd13be357-9479f1d6e44mr92503385a.5.1794254066280;
        Mon, 09 Nov 2026 11:54:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9479ef8a7f1sm5400385a.7.2026.11.09.11.54.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 11:54:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ec6cd898eso25211186d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794254065; x=1794858865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQVB3943pYHcY0t4AyG05/dvIpxyl2oT97ja0CIlRK8=;
        b=PTbkyRRNtXorzLDUMXPvWYmRMckrSY9NagEPII5JArgXpXwzzmDG3cM+YEwiO5xeu8
         /GfgQtf+2tk692WRhLBFbBSjM9LKoZhUgCTqkyawYidOTopwCyuAah5IaUKQQFbHOB9g
         4mqs9Oz37nxgwXDABJ90tjCyU1a5oHKrht5u4=
X-Forwarded-Encrypted: i=1; AL+hErFG/QTcXVfWL6Xuww+ZRjOWIcQxwAaemqagWBYlVg3rKEzlAXnSLk3ZUplP3vv1tyiw6O+jaKNAK5gJeaM=@vger.kernel.org
X-Received: by 2002:a05:622a:13d3:b0:535:a5fb:67f6 with SMTP id d75a77b69052e-5552b54d50emr5422591cf.66.1794254064846;
        Mon, 09 Nov 2026 11:54:24 -0800 (PST)
X-Received: by 2002:a05:622a:13d3:b0:535:a5fb:67f6 with SMTP id d75a77b69052e-5552b54d50emr5422271cf.66.1794254064457;
        Mon, 09 Nov 2026 11:54:24 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04d8397sm3718296d6.18.2026.11.09.11.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 11:54:23 -0800 (PST)
Message-ID: <41d87d75-9fb7-4537-bfcf-c00831da5401@broadcom.com>
Date: Mon, 9 Nov 2026 11:54:19 -0800
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
Subject: Re: (subset) [PATCH v4 0/6] Fix SATA support for NSP SoCs
To: Niklas Cassel <cassel@kernel.org>, linux-kernel@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
 <179405555432.938034.8271032337892944854.b4-ty@kernel.org>
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
In-Reply-To: <179405555432.938034.8271032337892944854.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/7/26 04:45, Niklas Cassel wrote:
> On Thu, 29 Oct 2026 14:25:07 -0700, Florian Fainelli wrote:
>> This patch series fixes SATA on the Northstar Plus (BCM58xxx/8831x)
>> which was broken due to a number of things:
>>
>> - the SATA PHY assumed separate PCB windows when a shared one is used
>>    for this generation of SoCs
>> - the clock/reset (IDM) was not being configured by the driver which
>>    meant that depending upon what the boot loader did, or did not, we
>>    could have had the AHCI controller still in reset by then
>> - on some reference boards, the AHCI controller is not DMA coherent,
>>    assuming so leads to all sorts of timeouts, data corruption, etc.
>>
>> [...]
> 
> Applied to libata/linux.git (for-7.5), thanks!
> 
> [2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
>        https://git.kernel.org/libata/linux/c/262e3bbc
> [3/6] ata: ahci_brcm: Initialize the NSP interface clock and reset
>        https://git.kernel.org/libata/linux/c/14d30246

Thank you Niklas, Kishon, can you take patch #1 through your PHY tree 
and I will take patches 4-6 through the broadcom ARM SoC trees. Thanks!
-- 
Florian
