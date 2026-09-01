Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D853264F7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788222294; cv=none; b=cPSQh9zgoIE6uodwWboOhasuI/xRf7rB6uHz5LvFoa21xSLhTWLXj3bQ/WEHAiIZ8FZoe2so7VCIU54pQnMYyx2KjvwgFpL6aE1/zzROkDJVtbciNHnIRaimdLhCtG+cDp5Uzta3rzFVGO8ngKEQk0QR/B0lbNv9I3w1xEKwvxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788222294; c=relaxed/simple;
	bh=530T4/rw3ieoscDtHqSy3ulDMef5Xa8Z4ignHnHROx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kfa8y9aZXsd9wogzvD62K+AuawmDyM0tF1lnHZqW3MKwD8dE0nqF/RFw5fjQfGT0HQraUxLJVkMk77Bzl82nNnot1R6Ke8k0lYozvrK7WUAliXi6Locg6zKIL3g2/2kxJ4C92RQkrlwpc36G06bCuOXKaso4kAb0ngs9d71Ok2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ayOPpFal; arc=none smtp.client-ip=209.85.210.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ayOPpFal"
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-84e04df8c46so383653b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788222292; x=1788827092;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CZgq3ZO2/IRbFeKpzhpHQ+vUPHDN8CZFNbGpniI+he4=;
        b=sykpDa3uMWLCzLOIoKYjBUOylI2psy0Bf6OfSIAG41oI+4GvockdJmw3B1mia6Hskg
         fmg5dshQPYDQI7yKmyrlsML/6pHVTTgks/FtYQ+Ftv87HvCd+qpkP81ChPNIJmAn67VJ
         31NY1gmSI+eGJdJDonMIiqUMITjaspEE/iD1HujkikuJ33lcoAwcy/TVz6Qj066grBL7
         R8RCFOH/e3X8KuRUwXYFEVOgLeBhOBops9Z6AYp1Mb8FuWddr3NhaUcfp70Kz+cHq05x
         3QvwBbT7GILRI1dNiNaoz9l7OLyqine7ZcOg0FBVGRCbKwptEHezWW98avkeEhnv7bkl
         vBdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqk9yXdst4/1wgcffZaPee8ocDia8hc6/vG1XSZ4r4mCMRaowDQR+Sh4VlLUpIuUHan3KP3nA2uOn+31nI=@vger.kernel.org
X-Gm-Message-State: AFuF++kUEJB3zK1cZeCaalnz1u5KvWiV5kyWacsYHxht5YyTrqtrxbbZ
	RKBiLllhE6Fo5XiBujRElaYqlCDdC52o7UJCXPaO1wJRenr58HJI997z7uV/YgA1pI6NSAqQ+bf
	IeKbprbBKQ88hytTAd3spimhsQcQSBbaPRviECSontBdXvZvCth53m6rz37arGHiEvYm4PXm6hB
	UnLP8hglbdvqkNiwmgmyUDKoCH+T5XNB6NbVv8IFj3PTYyOVQd+OtZxuGn5BIV7Oh0FOC8lEPrI
	DyfLrna7SwUZM6WpWYBNehD
X-Gm-Gg: AR+sD12lkz2yIAU+5SqYdSGepVglqUtR6NvhGFl2jrzoaabNS3Pt9yTlKPLjg+ZetDG
	1+Vrn5/mW/05ZTanBQqkkhJo/8xHDub94qeutaONtfkLMNfOCb9ay7CoLZfbudLhWt0nUrWE8XF
	5uHHd4EQqS+iSoWySICk0Lh/aAYxNd/U9tKS2749QEOC4DcGKofKogdNM5eCsCa4NUFCvyYxMqh
	Fx2xUB/f4YoP0FjFOjIoTx/BojnHEhLl9X2r7j3OuQbp9MsgWaCNIayxuoYgeUzXu5kR1ALZJpA
	g7imUn9gLIRQFtQRc5Qqxn388yVVbzqvCduYjTHh46L6mh6cr4K4giBiQXHSxaDnRLHuEJmC0DA
	x83qryyKremVdxpD4gTj6IU9IdTGfXJxZz+o3I9eK7EVP2Ti2a0UkN6YnZ8QNdKiPLUUxjTHyeg
	7ekhyqeqWDwFbr1R1pF4Lo/3lfpPyDNL62Tppd6IxK
X-Received: by 2002:a05:6a21:339c:b0:3c3:64cb:9b99 with SMTP id adf61e73a8af0-3d265a3df5amr41339881637.6.1788222292318;
        Mon, 31 Aug 2026 17:24:52 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc1f36eab60sm2482620a12.11.2026.08.31.17.24.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2026 17:24:52 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d54187d8b0so5758735ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788222290; x=1788827090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZgq3ZO2/IRbFeKpzhpHQ+vUPHDN8CZFNbGpniI+he4=;
        b=ayOPpFalQEmi5s/ihTkd4vxZaDypPQDOZ6pocijqvojCsus+MdArySOO25qLwdYMY8
         9HzdZMyBwW9lhft3+hze+JIENK/FcPmVRwtSx0s4zI1DJgDYxwFg/860C2OFUldfCQmn
         juhJ9xs74Gy23UPobbq7lPU/wMFE41xbYoZFo=
X-Forwarded-Encrypted: i=1; AKwUvBxT+L4hAbsndyv+2nqUUtvchTp7DR5FR6uQlUQkrYnz/Q4Q6FSZ074tXVVkKBY5QXcoiBZZYP/Ff4eKxU8=@vger.kernel.org
X-Received: by 2002:a17:902:f54e:b0:2ca:61bc:317c with SMTP id d9443c01a7336-2d74def63d7mr467480495ad.13.1788222290458;
        Mon, 31 Aug 2026 17:24:50 -0700 (PDT)
X-Received: by 2002:a17:902:f54e:b0:2ca:61bc:317c with SMTP id d9443c01a7336-2d74def63d7mr467477355ad.13.1788222288254;
        Mon, 31 Aug 2026 17:24:48 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm39927452eec.16.2026.08.31.17.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 17:24:47 -0700 (PDT)
Message-ID: <739079cd-dc83-4b53-a3a9-a7e610379d19@broadcom.com>
Date: Mon, 31 Aug 2026 17:24:46 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 0/2] net: dsa: b53: fix 8021q uppers on standalone
 ports
To: Semih Baskan <strst.gs@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 vladimir.oltean@nxp.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260831085217.391-1-strst.gs@gmail.com>
 <CAOiHx=md28_BmsDOsNDp0XbUpfih=P+-+aDYb6tiWPJTCu1drg@mail.gmail.com>
 <CAAsRjRktqEx+-CLDO_q6rLUBe1dtRQPH1NkX4xy7ichx79yGPQ@mail.gmail.com>
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
In-Reply-To: <CAAsRjRktqEx+-CLDO_q6rLUBe1dtRQPH1NkX4xy7ichx79yGPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 8/31/2026 3:17 AM, Semih Baskan wrote:
> Hi Jonas,
> 
> On Mon, Aug 31, 2026 at 12:34 PM Jonas Gorski <jonas.gorski@gmail.com> wrote:
>> I really think we should just fix up the in-tree device trees and then
>> complain loudly about the broken configuration on probe in case there
>> are out of tree device trees with the broken configuration.
> 
> I agree, fixing this up in the device tree is the more robust way.
> In the meantime OpenWrt can carry these patches as a band aid for
> the affected boards.

But you control exact how the DTS gets distributed in OpenWrt, why not 
just fix all of the DTSes there and have the users confirm that using 
port 8 as the IMP works?

Don't get me wrong, I am very appreciative that you spent a decent 
amount of time trying to come up with some sort of solution.

Thanks
-- 
Florian

