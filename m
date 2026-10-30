Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793387699;
	b=gQwEVDp1cPgj61lT0l5y7Pon3HKMVnPaJrCBs+uP5E2KHgtxsoWrkitqjkV1qcBzsmXa
	 5jJrnQAA20CM4yVBjLPujxa4J0iak6WoUhGJFYUB2XsuLrByy2+iO5FPVBaWd+W0AE5y+
	 2n9pCdf7PcwlioYXnG+TCWsH/00Ag5GCyy3FVLfwrvnLuNT/E2wyo6nXhgLddETuWC974
	 Mx1GLdMXuRuFE9DG/zs1ndTOV1Wp/PAWdE3I6feE2Rg1iEmV9xqPFQrZ0+43rEuVdcrLK
	 uR43xNgQBvppXOxQsyOS7oPCFvBnSpmba3GH7474r729m4qcgJE2ByuugaK6sMziJnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387699;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=DFrEXZTm+iWrPConGaRa1dN06L+AXpLuI1/eZZLz7wQ=;
	b=4VFba7onR7wdiiLY9B9XUewHlcHThLEaZYX/F7O+3BM9gKW+Os1qagN6Q11E7TWHxen3
	 NUdWykit/DAyVMIdBEv8+vVidkGKIBYW8xjX1vhll/BkTTVzSbnmTPHj4Z3VWNWqojl4w
	 U4jFTkwOdX+bPamoUJy2O+tPlsbiO8x1N0EeJ2UGvdpOFHA9RZrMotALG+aN5NwLS1Jpz
	 zv7LI7rVcpWtrFrbiVxFr0BzdRdqbKO+CdA6pC5EodKi8pdtmJPLdXv2utbJ+DykrhDDQ
	 EdzOas5AOGQcuLwXwhdP7xUL86wNlRaBnd9isnABHUYktRyGPLlGzCazAAH3H9EyVeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=W8Y04zdH;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A880606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A880606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=W8Y04zdH
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ae486f8a27so720564a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793387698; x=1793992498;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DFrEXZTm+iWrPConGaRa1dN06L+AXpLuI1/eZZLz7wQ=;
        b=eIYkkxYI041N6i42FH/SvGYPgFljOU8X+RJYskxGAvDeij9XfxzkpYhbEXEnLenn6Y
         UHv8prC5VdntZJ9owx+HBxZ+k9UMLSRGAoHE4Q0aOY6k3Ol3Eo3m4dGDvfrFhMvL8pSA
         YVGs2ot2n5ioWQYFE+2sgqgcI7W523gEYJ4ckga+K1RBAk0DfKfYJs4H0SMVgWF4Tpos
         E32h9YCYhgr6KdhLQlvjMxvfxygLHKVpbVwNaZYpjHF4j4/v5tlBO/QbTTKZsjqsT1HZ
         P2S58G/EzPR1devTgzmHrnwK3kFcfFe1W47rDzuKE/YAqriPVpWKCFGIyfDbfuxqw+yy
         +JWg==
X-Forwarded-Encrypted: i=1; AKwUvBz8QdMvMoUc+jG57agzKaVlu7IAfSTRCpQWvLGV4l06tsrVhvi7/ub9PyEUB90LkzplJFTSXR2xVbFHe6c=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0GAXsqawfS9u+rIMiuvsciqdOj9VNQne50NgpdNmkOtEch9B1
	odmsu67he+bHhYVza78o616MajybjahYNR2eWkkVPXJH3UCpQeMEFqzCpRJFA+GcF4hdp+uu+eF
	WHkzW+yGqf2EiqUUwvGlePkU2rPZehf5VN5Jvu9pqk2/4cQbjNbylqHRg/UqR/WK1VE1iLh05q6
	PanY+jf1xFuCK9oW7pw7evpA0FQlPVA2/SGD8iNZi0PYD4xg0Fewserw41ZZztFwGnAwCai56O3
	KMmIPAJ+FwhyIXcvlg5A9CL
X-Gm-Gg: AYBFou36I8IbQprnK66Bbs4ZgVG9Nx4erm7kxIJuZauzFz6sQ01ftWZ8ZnWJB0DLaEq
	pLM0gKIChdD957VTiSyuj2YloS3aW3gGj8zaXPAkD8vNNNzQRj2PtVcRTM7JXM44FQ3JB9rfN6U
	FiZfZyuj+Wc2SxwtNOg7oRk+W3PZ1FiAg290X44gPpPx2FYreFTYwV0ExxDsVh4V7wb1f9M++5r
	Dd9NOcBJw3k4VFkxFFqh25w+mOOkmjlpe4iLMXjP5cezF2HdSt87nWQG5KBO8MjhMNeYewgViM8
	1q9GZ0l6wenP83Iy1czT7gNh56FC7BwAKZUp0cNBFSenAhf7TK4LnqdLaygwpOMRiPI7oNh7a4z
	rs2LJilzvmNNp0Pza4RM8SaXZsaQKIRYNJoh36OAhuHXc+CkdVY+fGzgqQHs7dYUtDG/p4/pa48
	WgqSvQv+NPWCzo6q0kKqEItElxPEjl0Ie4DUu/19Aa
X-Received: by 2002:a17:90b:3b51:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3ae897c8800mr2879276a91.63.1793387698373;
        Fri, 30 Oct 2026 12:14:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae841ee0ddsm2443985a91.0.2026.10.30.12.14.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 12:14:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b4bf686ceso29718356d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793387697; x=1793992497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFrEXZTm+iWrPConGaRa1dN06L+AXpLuI1/eZZLz7wQ=;
        b=W8Y04zdHskaRMHZrfohwCTfv7ZHxr0eSgluWykfx+H+z/eNEnyDSQmNVMmPLzecV3H
         p9LpSWlcSNKeIE2pcODbqVAEglC1bdvDQRZM2Q4flxD2Q/PzZzgmzClben0zaJA+qXt9
         ywm6sOG8dmE3Jjej+muW1XV4JNG+3KT+Zs4y8=
X-Forwarded-Encrypted: i=1; AKwUvBzCAdVBgdCBd9eDa3MK4OuCfWiZfFAgNt51V/B8JhaUwHC9g6YjhXLCUusBJF1RG8fho77QmnPgrmSChzs=@vger.kernel.org
X-Received: by 2002:ad4:5c61:0:b0:91b:5d39:e13b with SMTP id 6a1803df08f44-91ca4bda1d7mr54317356d6.48.1793387696556;
        Fri, 30 Oct 2026 12:14:56 -0700 (PDT)
X-Received: by 2002:ad4:5c61:0:b0:91b:5d39:e13b with SMTP id 6a1803df08f44-91ca4bda1d7mr54316986d6.48.1793387696200;
        Fri, 30 Oct 2026 12:14:56 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f3db1asm23125436d6.16.2026.10.30.12.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 12:14:55 -0700 (PDT)
Message-ID: <e25714a5-98b3-4a0e-ad9a-a644b5485749@broadcom.com>
Date: Fri, 30 Oct 2026 12:14:52 -0700
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
Subject: Re: [PATCH 2/9] dt-bindings: phy: bcm-ns-usb3-phy: Describe the NSP
 variant
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
 <20261021172819.668120-3-florian.fainelli@broadcom.com>
 <20261030182151.GA1206797-robh@kernel.org>
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
In-Reply-To: <20261030182151.GA1206797-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/30/26 11:21, Rob Herring wrote:
> On Wed, Oct 21, 2026 at 10:28:11AM -0700, Florian Fainelli wrote:
>> Northstar Plus uses the Northstar Bx PHY register sequence but also
>> requires coordinated USB2 and USB3 core resets and a USB2 IDM interface
>> clock enable.
>>
>> Add an NSP compatible with a required USB2 DMP phandle. Describe the
>> shared PHY relationship with EHCI, OHCI and xHCI so initialization
>> finishes before any host starts operating.
>>
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
>>   .../bindings/phy/bcm-ns-usb3-phy.yaml         | 23 +++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
>> index 7fd419db45d0..00d69b86cbff 100644
>> --- a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
>> @@ -14,6 +14,9 @@ description: |
>>     Known B1: BCM4707 rev 6
>>     Known C0: BCM47094 rev 0
>>   
>> +  Northstar Plus uses the Bx programming sequence, with coordinated USB2 and
>> +  USB3 resets. Its PHY is shared by the EHCI, OHCI and xHCI controllers.
>> +
>>   maintainers:
>>     - Rafał Miłecki <rafal@milecki.pl>
>>   
>> @@ -22,6 +25,7 @@ properties:
>>       enum:
>>         - brcm,ns-ax-usb3-phy
>>         - brcm,ns-bx-usb3-phy
>> +      - brcm,nsp-usb3-phy
>>   
>>     reg:
>>       description: address of MDIO bus device
>> @@ -32,6 +36,13 @@ properties:
>>       description:
>>         Phandle to the DMP (Device Management Plugin) syscon
>>   
>> +  usb2-dmp-syscon:
> 
> brcm,usb2-dmp

That would be inconsistent with the usb3-dmp-syscon property that is 
pre-existing, hence the name chosen here.
-- 
Florian
