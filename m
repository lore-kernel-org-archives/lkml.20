Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC1F3D47C2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841304; cv=none; b=UytA0Qolpod5r2IiIWpuU+a0laiqXSIQ59dSKCxPFwkYyp7Z5IxPj5Y2bWmx2/6TZMRXYKV8VKAT1s1rwT6j+4Cb0EoYQoOW0UCyi8YoC4kQqY2G+JuST2pFx8WMzuVjHZT3l3jleuEEnofokFEakbIbzExOyuRqWrx5o4d/D7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841304; c=relaxed/simple;
	bh=WoNz3WCxDdKybjSCg5gY111bGEDmUMC63EojmiMxyn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMsexeH5K8pRCcOKayd1zxfHPwLDEQjmju7pz8B/0UydDTJAl1bOLMfSnP8/rAe+Vyi80CI9XzZZBNvTG/P9X2PAkLx6Lm6Nhgaawa29UYX/3WOZa23N8sVny4NLlbkFSyyXWjFWxDDmPmZ4U8HIPIgfZTdiNigq8CUNnHRkFxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QxeOyTzV; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QxeOyTzV"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so950819a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841302; x=1792446102;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7fRjyjPaygPyac6Q2934hJ/KUw5dbvEUBwLV/bpzblk=;
        b=qT9gyaCPXavJeJn/0DvVWxth3nX899gxVAeQit7TJXXCZcm0pIJlvorExRa2fI0kNy
         fz8ochJqasW25a8ZUX/jc/MQeoEf5dQ5nMW3NK5VyRkewvEWHja6vJgyPzkUtbZtFW1u
         u1gwIOol68t5izc5Mwv9GqPMZz+tyyyrODTAh3t+xAs+nNXsYZ+z8DQutdcpsg+AYhgO
         uo8zEdPMZtBno67Z3DhCeH0KgcMpmbS9TCZ649v5w8WtImAfXMGANbFMjtCO6mrPdmax
         OjZpzKNDnrzg1xx7fdnk65Kfg9qQxvccFjPXovL+6XS5jkYDvx+lRSwWz/TuC4LLk3Fg
         o5Zw==
X-Forwarded-Encrypted: i=1; AKwUvBwfhp1eAS+vh951IqnmMgoql0tCHRBTWLvAY87BtfESFTupqtCr//hXPN3zYsFfgCgjt/bhmkG8g4N13yk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDoaVXkQhq+9mUCj1PInxe3//bLBchTr6BiioSa+stdBMqzs62
	y0KSUJkEU5XAs9kJ1pvl+xiL9NFGTIOO3Op/e1h2cRJ2CEOr71ZDUpoLeXb9g8mxCtlstDute3j
	103yPfY44TnPJzjP1iwxlLhBor8y+AU+elo8PwfnGO/uEf+AxHUZUmp9I4Z5d1x5hYRLecUMdK4
	66GTAXRu0tgHDrPcleXBVRwHKRnBImSomc5gBkLsuEmnfhF5ZhaqeetCNhG9T/Bv8+LHH/falcT
	0jqx/GenyRZlw86ybuQzFwA
X-Gm-Gg: AYBFou0NrV/pJqSVrErI1GHt+yS6Qe4yh/mtulTPW/pEqU3luCzK3GIV2NVb2gfkl2L
	1XUv/0oSQDQtpTVyoDSx/I1/umgtmPgGcnWBUg1cKO8Dktk7hOjx6UK1WVBppdlgB0djPvuyy6A
	KrEZJS0Y+6mQ4uINhfuT3JQsjdichXoFbfQWyfoi+en09iIrWYjR6++fmx2d6ZiVhGoD+JAUBDc
	Cg8k8gPNMhlpUbwXOuAvA2kUVUjw6mF/Fv2B7V//Uu2n0JL8KNyvWKXuULi0i3/RtoUi5m88Od3
	5tNizEhz5cEGwy5LfoN/UE6cQWq/uDbIDT53nnPKxjl9UxE9YU4mWbad62nwTnouROl7LlGI3e5
	JsDis6WxuTctGNyyUyKbWHy7L/YMs4z32BabGN/I62TwWcVdWO9N+yBbDInKwAsux/JF0TmYmTN
	EpWYJSNjvN8rzZjqOIq/pBBCc6ZgC0UbNu3vnZ2nbHjoA=
X-Received: by 2002:a17:90b:2885:b0:3a8:495b:d64b with SMTP id 98e67ed59e1d1-3ab3a32cbb8mr7918301a91.4.1791841302300;
        Mon, 12 Oct 2026 14:41:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ab369147b5sm6007236a91.0.2026.10.12.14.41.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Oct 2026 14:41:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510d0baf63so6550139eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791841301; x=1792446101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7fRjyjPaygPyac6Q2934hJ/KUw5dbvEUBwLV/bpzblk=;
        b=QxeOyTzVDZJ/1+vQKNsMOWgr3H/A2RrBunnSsoR4vdFbgG/F5b231KgB2bEfuSYmZ6
         4CJ94CjB+R32Nl2qwZ0kGbj7YqxAvf2BBOz32ht3+PN2vlPkGJP7IEODpvDXCBMJdkLZ
         6g8ScM47S4NZVRmh8VRWHlgvCHBJ1/ZGmnjsE=
X-Forwarded-Encrypted: i=1; AKwUvBwQ0ahNVQEX5cL9fnFD3M0F0iTYUOmk0lLlmOB/u6/XuRMJ8ypa9YT9fZVJ8o1apoYpzK/xAjANXsPOa/s=@vger.kernel.org
X-Received: by 2002:a05:7301:618f:10b0:359:8492:20ff with SMTP id 5a478bee46e88-35984922299mr8367833eec.12.1791841300618;
        Mon, 12 Oct 2026 14:41:40 -0700 (PDT)
X-Received: by 2002:a05:7301:618f:10b0:359:8492:20ff with SMTP id 5a478bee46e88-35984922299mr8367798eec.12.1791841300003;
        Mon, 12 Oct 2026 14:41:40 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm41603546eec.18.2026.10.12.14.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 14:41:39 -0700 (PDT)
Message-ID: <1e813008-1874-4164-a803-b1af26332d35@broadcom.com>
Date: Mon, 12 Oct 2026 14:41:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: Avoid D3 on PLX PEX 8532/8533/8548 downstream ports
To: Bjorn Helgaas <helgaas@kernel.org>, Imre Kaloz <kaloz@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Michael Chan <michael.chan@broadcom.com>,
 Vikas Gupta <vikas.gupta@broadcom.com>
References: <20261012213447.GA1392402@bhelgaas>
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
In-Reply-To: <20261012213447.GA1392402@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/12/26 14:34, Bjorn Helgaas wrote:
> [+cc several Broadcom folks, help with possible switch erratum]
> 
> On Sun, Sep 27, 2026 at 12:56:09PM +0200, Imre Kaloz wrote:
>> Runtime PM suspends an idle downstream port of a PLX/Broadcom PEX
>> 8532/8533/8548 switch to D3hot, but that takes the whole switch down
>> with it: any device behind another port of the same switch then
>> faults with a fatal bus error on its next access, e.g. mptsas probe
>> on a Sun Ultra 45.
>>
>> This surfaced on sparc64 once commit a5fb3ff63287 ("PCI: Allow PCI
>> bridges to go to D3Hot on all non-x86") let bridges enter D3hot. Keep
>> these downstream ports out of D3 by setting PCI_DEV_FLAGS_NO_D3.
> 
> I don't really have any objection to this, but I am concerned that
> this quirk only applies to a few specific devices, but
> https://admin.pci-ids.ucw.cz/read/PC/10b5 shows a TON of
> similar-looking switches that I assume have the same behavior, so
> this may be just the tip of the iceberg.
> 
>> Fixes: a5fb3ff63287 ("PCI: Allow PCI bridges to go to D3Hot on all non-x86")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Imre Kaloz <kaloz@kernel.org>

Our internal portal does not have any document for the 8532/8533/8548 so 
unfortunately I cannot help here with identifying an errata document.
-- 
Florian
