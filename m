Received: from mail-qt1-f227.google.com (mail-qt1-f227.google.com [209.85.160.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3408599A38
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661222; cv=none; b=WQnA/uwaWkQUgd3fHe4AuZTNzaMu+xUTMu/xblD9Bf3Aa0KOTJ8hr1S7XzxqamjjqB0zX5EPmRTepJnycPce9Xlou8kFhG/VY3E6wOiffIrDxKb/yu/9Ja7+0uPqd3PiiyYIRMTkbtd8OUZyX8Qsh5TAPcxcPOemf6HvUn3vymU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661222; c=relaxed/simple;
	bh=zu99EUyKu04qHSXSnN2pGp746UHvgDIIaYO80aLOXlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EU2pNNlvD/G8CNIl7Zuiw3IpGwhJKllTLFvtMOSZCKqGduh4RWLhl/jCQioLxzWMna5UFUz1flaQY7gAxZYeklKl2yn9573iUJmvlgrldAghjqQgUh0R0v534UZ63/+8hNqDjX36MwkgZDjaMUL/4hC2WXSxH6lA/CWYpnHFF9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FkHwAoiJ; arc=none smtp.client-ip=209.85.160.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FkHwAoiJ"
Received: by mail-qt1-f227.google.com with SMTP id d75a77b69052e-5312314b3c3so78871cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789661219; x=1790266019;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5vgy7pM/Q+yzgmJx8Y4gFH5AEXLaNEKRG3IPtSFZXZg=;
        b=uDJDWi4R/Xc9sNJpNyDHiwNnslhGmBXTizv7BGYpm/yNdBFx/kU6Ivv3fjy6nhQ+Yn
         nSOvOE+mk123XprwXlfsYvo8stqhn1s2cHdom/tBGSnwPh/7pYyXlVfazqdneem+VeK3
         V+Hj9KAb65Oc+KSuaa3Qo4Ac4EAqPLVCiqBtayAAH98PjnrJS++8bV/c+shkPv5Fyh5e
         2+VTq334OVYfWd0lTeJ0N4hZQ38kKsomPfExBJsLyJop/r3tEdx0EXLsovVAiXKp6rGo
         0k8MshFu/AVuKC3h8U9/WchquOt/BhSH7BhIBedvWQp+AhnWdEe9zqAqnhxSRtCAE9IK
         A0gQ==
X-Forwarded-Encrypted: i=1; AKwUvBxda/HOIT9Dk0RZfwlwJJbOtLq66Isues9bafi3TlSSu9bVurE5Wrf7XiS7YhqWUBfJ/FuPDsuauhggHVI=@vger.kernel.org
X-Gm-Message-State: AFuF++kErf9CHOvQG0We5xJBDotiFR2d2n2POIQfKk6Yh9KlPPdDKnpZ
	yw47+FT0lBICzCM4+ZYQhPXI1goeqZgkkf/yaiMWVFKwvG6Ehnnp9UTi3Qc0Gq9hHMeyXXlsR4M
	HhR8O4d/zoehCBWSXzovhgVk9K5sW0Lh8D8D5kk9anMjy35QShMT6wauBOiKFTNt+kq/ygfOKgI
	XozY0KLyUCWAJv8SX97zhFWNJfvDDrWl92M+9PnHRDOi9Y4CdTitkgSwuv8Do4lBahGB3z5MFOn
	C5GzOpKC+ht0Z3AYIrNkqWE
X-Gm-Gg: AYBFou0kcCKvevpWg5bobDLSlOvXWhoT+NcO/pXW9aLaVEmCWIslxdr1E2Br+UuUcTN
	J5438jhoDERSJjv52u/XfAZBczn4qQfKaHhyUtO6z6b6kYH5FyWRVzoD+dcVefkee81jqJPsH7J
	+fiG1PGMY1Dr38a/6zVceyZvfp+AmakP/Fs3yBmcgCtO5n2cQ1bdyT+HKJs413pKSynXfJS1GZJ
	9Bd6gD+IssjZrW0BhOq1jwqBOrAc/1bYK0KhNGLvBmiXj7Zow/PeeUqYu+w0B+XM0G6D5xvgMOu
	HrrwO54X9IsVBwKlobE9IMbuGz5Fj5SlBhaZ0wWtyjsoMiSHi50+eCH0QxuLDFDD3xy/aizfRuq
	FMjBBIIBkfzvuC4MYvFbDUDgY8Exj2j3kj5DEMjfUVNIknrPUVrXP3WvyJi3+DG9/l9JELj6iWJ
	GeYbNd1YELbM3gBs2Xva3SkXpIioKrNDQ5nxOUrNZhIZQ=
X-Received: by 2002:a05:6214:4809:b0:912:43f5:2b30 with SMTP id 6a1803df08f44-91243f52edfmr69987136d6.8.1789661218992;
        Thu, 17 Sep 2026 09:06:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91252c8232fsm16766d6.15.2026.09.17.09.06.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 09:06:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d9057fab9eso16309625ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789661217; x=1790266017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vgy7pM/Q+yzgmJx8Y4gFH5AEXLaNEKRG3IPtSFZXZg=;
        b=FkHwAoiJ9CLPePd/Llx683SDkGTuDQtqaJ6TMv493sevpdoHO90d0wB0t099vvgyTC
         NCvZp0MWU4coKOGDn15YxqBcTul3iU6x96hMJSvplanct+iBPrrEdCsJtibgBjrxH/bW
         RiL+w0F34HfRtmOLbk5oDVFRvdwliT1A+eZe8=
X-Forwarded-Encrypted: i=1; AKwUvBz/8o1c5IDdxGUSgpjAqesUDDQw1avBljNCo7vo9rSHXWbgNqbrGl8H+DWK4xxvVGZKhp1r3527n1Ldcsc=@vger.kernel.org
X-Received: by 2002:a17:902:d2c8:b0:2dd:278c:5eb with SMTP id d9443c01a7336-2dd8e3f5a13mr153455075ad.14.1789661216887;
        Thu, 17 Sep 2026 09:06:56 -0700 (PDT)
X-Received: by 2002:a17:902:d2c8:b0:2dd:278c:5eb with SMTP id d9443c01a7336-2dd8e3f5a13mr153454615ad.14.1789661216485;
        Thu, 17 Sep 2026 09:06:56 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8ed77sm28778555ad.4.2026.09.17.09.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 09:06:55 -0700 (PDT)
Message-ID: <d0611a8b-e7a5-4ffb-aa7a-86b14196b6d7@broadcom.com>
Date: Thu, 17 Sep 2026 09:06:53 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] PCI: brcmstb: Declare and assign quirk
 32BIT_PCI_OPS
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
 <20260911233541.1650895-8-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-8-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/11/26 16:35, Jim Quinlan wrote:
> Declare a new quirk that indicates SoCs where the config-space accesses are
> restricted to 32bit R/W.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
