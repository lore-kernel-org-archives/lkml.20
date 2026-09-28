Received: from mail-vs1-f98.google.com (mail-vs1-f98.google.com [209.85.217.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE3F37C0E6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620015; cv=none; b=EdJVwNyRjcBM8BmEUZF9V7N6ZGQ8fWqdSwlXPTSL9sL198t4jiq2GVbSXy50uDOj1rgth84yB3BSuW1IAQQlA0gToAFiVZ2wQMI6lbGDckByYV9Q6TCspRVl8nXV6Gvf7dLrimDRhu1zVefwpoIWcIT0aCKW2k6eAkfCixJ4Z/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620015; c=relaxed/simple;
	bh=EpikG7Z0U6spB0qXKcgHsc68xeElTBeYTJAUVsrk9Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HNGkv2WINweJ1TPgijtW9LvGQjYv5mlKw0ikwDJhkiDPq8zyUoEcH2nYh2vztbVsrupVohKYkjYOhZsk4XpX5AalMoycg6tsXi8ebNAYOBxZVvn4eQUsvbeG4VPsnm372Fu+UJmesdjkXrqN0T28PJ4Ha09dkaQRhbaCRpjNEHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ATExPRya; arc=none smtp.client-ip=209.85.217.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ATExPRya"
Received: by mail-vs1-f98.google.com with SMTP id ada2fe7eead31-7b23925a307so93001137.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790620012; x=1791224812;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FuQw+B0kSq5FJU56nD6/IW5lKXSJDgEpfGuGLprZ8a4=;
        b=M0qIpm7wJS9+38UKAYG77IsHEAKNJ+uJKNgkDjzoXWW3yA9/uWYBi9zyHa5fBCZuzA
         CNVlBVyZXapYdd1ppO5NfSBKNPAOhKjkecKKkBxlvSP+eSNDRJGruH+i9EhfgHzKCt47
         P2+ycqoXkh86pkH4BSQ+lrWwCM1Xn0GhVaXvar+d2lMrvt9U2+EvkJueEQcgVoOoedlP
         1XIxEzR1XutW4aAZjdSL2eMobK1ZHY/TuXLWZhW1aT4bH+uJVTmHZCprmOB10pDu3yy1
         09D0SBOWKWQzkgXpHhIy5ePyeMCJkFPHG7CQPgEaCTR+ciTkzoZFhUfuPawHE/59FzDZ
         VMTg==
X-Forwarded-Encrypted: i=1; AKwUvBwseoDVd9DRcS4/5wMuY6IdJqb2IqrKe8G/9tjjLEpCfp3o1jbqL+C8DHxGdEK6QRVR768nJsh1WD1q+9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAfCwwOgsJVh1VjGA/S57PtKRjEmoQ/yCa7hh3EZUhYUgEtykv
	9g3HFEkNXpIavi8lCKHfy0xy4v7wWQEIJ/aqvj/ia6Zv4Wq80d7e4HN6061GL8LLxL449XYpHvb
	knMzHB+QZGxrB/NPo8+Ot9aE0rnC26+way5uGt47wV3DWFwlY3aK4iJQHMkVSq6lBlEp7Z3lFL5
	+9Tw2vcecGOc9BlEr55Irx4lVICk0vIzUPkZ9/qrEMkhfAAotWbU2WErjsA/jd/l0Fn+8Sx/YrA
	DIFQn7o1dQiLwZAq7I3ntbf
X-Gm-Gg: AYBFou25a1vs85WfJTVzNdb20NCToP/k1ycrmRxTtYwNMxvjuVPpAdL5MhPhSXrEd1I
	sEd3oOzE8JX/3rfHcyZhcqFbaYDLHp0WakvyLer/ANH5XfnRdSyhA2RorkKxjZeXPJeqE5a/BDg
	dnHmVRVKvrCEwXwss8PSq2L0GnxCajLLtfxQ3/aY6vebcSpnibN/gkwiBAxs6BQJgCtYmA2d4Rh
	4qkps1r8muQNiVK7dGHnDRFSaG0W5778xzyl14rzPI0XsnyRSYruiP/42XpAwIexedpv6WM0uu3
	xHo/J6f32D74PkWZ9huEQCQOnBqFSrGvdV9Bplj9R8jRvyNF73HfweBLNTUzfkKCmk5f+rQbjPe
	9EECfSB2Yj+nZknHe4A4G9lsEyRjYOZ7Q0RgiSoNUlpWmGXIMGGlWEWdAUQbrzvO4WTuAG3Haoz
	rJbAae2TDYV2iz2v9oTNfoB3TyeHIKDOp4fRIhJbzl
X-Received: by 2002:a05:6122:3285:b0:5c9:a60d:327d with SMTP id 71dfb90a1353d-5cc9765142emr3711541e0c.17.1790620011869;
        Mon, 28 Sep 2026 11:26:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5cde684ac11sm1590356e0c.6.2026.09.28.11.26.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 11:26:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c58ee2116so541090985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790620011; x=1791224811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuQw+B0kSq5FJU56nD6/IW5lKXSJDgEpfGuGLprZ8a4=;
        b=ATExPRyaDht0WtqZ2QsNQcnY2tq2Kgg50WdgjI18aMJUB4mRwWqitgTDr3jmOmCooQ
         Wu//AYPDsXPT/c6jsa4yMEGSG1HqcEFceVlN4EY8mBB0Z9DgMBempwGRAFO6Sh+SIfVe
         AhpcPj4oX8y2vjbXWD4as35dlpkywVZGRXcUs=
X-Forwarded-Encrypted: i=1; AKwUvByXQsitcHrIIRWAonAdZuDJVkpn/AW6krxcRY+FJvkrULF5/VINZB8o5xHF20oJXk2zkZdTR5KNg1WaHzk=@vger.kernel.org
X-Received: by 2002:a05:620a:7117:b0:93c:2c15:e51d with SMTP id af79cd13be357-93c474ff392mr2182136885a.46.1790620011084;
        Mon, 28 Sep 2026 11:26:51 -0700 (PDT)
X-Received: by 2002:a05:620a:7117:b0:93c:2c15:e51d with SMTP id af79cd13be357-93c474ff392mr2182130685a.46.1790620010447;
        Mon, 28 Sep 2026 11:26:50 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c8147c4desm205669385a.39.2026.09.28.11.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 11:26:49 -0700 (PDT)
Message-ID: <6b61fc5d-1f4c-4634-8d61-2f090f0f7c3d@broadcom.com>
Date: Mon, 28 Sep 2026 11:26:47 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] Add support for Broadcom BCM2712 IOMMU driver
 (Raspberry Pi 5)
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, dan@reactivated.net
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nick.hollinghurst@raspberrypi.com, james.quinlan@broadcom.com,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260927-bcm2712-iommu-submit-v7-0-dfa2b975cbc9@reactivated.net>
 <arojDdPH1o2ckB5x@8bytes.org>
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
In-Reply-To: <arojDdPH1o2ckB5x@8bytes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/28/26 01:19, Joerg Roedel (AMD) wrote:
> On Sun, Sep 27, 2026 at 02:08:59PM +0100, Daniel Drake via B4 Relay wrote:
>> Daniel Drake (6):
>>        iommu_pt: Fix test_pgsize_boundary() failure on narrow-OA formats
>>        dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
>>        dt-bindings: display: brcm,bcm2835-hvs: Document iommus property
>>        iommu/generic_pt: Add Broadcom BCM2712 page table format
>>        iommu: Add Broadcom BCM2712 IOMMU driver
>>        arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes
> 
> Applied patches 1-5, thanks.

And applied patch 6 to devicetree-arm64/next, thanks!
-- 
Florian
